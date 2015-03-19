Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 778FF739C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 05:17:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2J5Hwns014860
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:17:58 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 18 Mar 2015 22:17:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Mar 2015 13:17:52 +0800
Message-ID: <ed95f01435903ddfc4046433c52ef7049e4f169a.1426742194.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1426742194.git.Qi.Chen@windriver.com>
References: <cover.1426742194.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 2/5] rootfs.py: add log checking ability for deb and ipk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Mar 2015 05:17:57 -0000
Content-Type: text/plain

Extract the common codes of log checking and add the ability of log
checking for deb and ipk package backend.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/rootfs.py | 61 +++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 3a77e86..f887a98 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -40,6 +40,43 @@ class Rootfs(object):
     def _log_check(self):
         pass
 
+    def _log_check_warn(self):
+        r = re.compile('^(warn|Warn|NOTE: warn|NOTE: Warn|WARNING:)')
+        log_path = self.d.expand("${T}/log.do_rootfs")
+        with open(log_path, 'r') as log:
+            for line in log.read().split('\n'):
+                if 'log_check' in line or 'NOTE:' in line:
+                    continue
+
+                m = r.search(line)
+                if m:
+                    bb.warn('log_check: There is a warn message in the logfile')
+                    bb.warn('log_check: Matched keyword: [%s]' % m.group())
+                    bb.warn('log_check: %s\n' % line)
+
+    def _log_check_error(self):
+        r = re.compile(self.log_check_regex)
+        log_path = self.d.expand("${T}/log.do_rootfs")
+        with open(log_path, 'r') as log:
+            found_error = 0
+            message = "\n"
+            for line in log.read().split('\n'):
+                if 'log_check' in line:
+                    continue
+
+                m = r.search(line)
+                if m:
+                    found_error = 1
+                    bb.warn('log_check: There were error messages in the logfile')
+                    bb.warn('log_check: Matched keyword: [%s]\n\n' % m.group())
+
+                if found_error >= 1 and found_error <= 5:
+                    message += line + '\n'
+                    found_error += 1
+
+                if found_error == 6:
+                    bb.fatal(message)
+
     def _insert_feed_uris(self):
         if bb.utils.contains("IMAGE_FEATURES", "package-management",
                          True, False, self.d):
@@ -256,7 +293,7 @@ class Rootfs(object):
 class RpmRootfs(Rootfs):
     def __init__(self, d, manifest_dir):
         super(RpmRootfs, self).__init__(d)
-
+        self.log_check_regex = '(unpacking of archive failed|Cannot find package|exit 1|ERR|Fail)'
         self.manifest = RpmManifest(d, manifest_dir)
 
         self.pm = RpmPM(d,
@@ -353,20 +390,6 @@ class RpmRootfs(Rootfs):
         # already saved in /etc/rpm-postinsts
         pass
 
-    def _log_check_warn(self):
-        r = re.compile('^(warn|Warn|NOTE: warn|NOTE: Warn|WARNING:)')
-        log_path = self.d.expand("${T}/log.do_rootfs")
-        with open(log_path, 'r') as log:
-            for line in log.read().split('\n'):
-                if 'log_check' in line or 'NOTE:' in line:
-                    continue
-
-                m = r.search(line)
-                if m:
-                    bb.warn('log_check: There is a warn message in the logfile')
-                    bb.warn('log_check: Matched keyword: [%s]' % m.group())
-                    bb.warn('log_check: %s\n' % line)
-
     def _log_check_error(self):
         r = re.compile('(unpacking of archive failed|Cannot find package|exit 1|ERR|Fail)')
         log_path = self.d.expand("${T}/log.do_rootfs")
@@ -414,6 +437,7 @@ class RpmRootfs(Rootfs):
 class DpkgRootfs(Rootfs):
     def __init__(self, d, manifest_dir):
         super(DpkgRootfs, self).__init__(d)
+        self.log_check_regex = '^E:'
 
         bb.utils.remove(self.image_rootfs, True)
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
@@ -485,7 +509,8 @@ class DpkgRootfs(Rootfs):
         self.pm.mark_packages("unpacked", registered_pkgs.split())
 
     def _log_check(self):
-        pass
+        self._log_check_warn()
+        self._log_check_error()
 
     def _cleanup(self):
         pass
@@ -494,6 +519,7 @@ class DpkgRootfs(Rootfs):
 class OpkgRootfs(Rootfs):
     def __init__(self, d, manifest_dir):
         super(OpkgRootfs, self).__init__(d)
+        self.log_check_regex = '(exit 1|Collected errors)'
 
         self.manifest = OpkgManifest(d, manifest_dir)
         self.opkg_conf = self.d.getVar("IPKGCONF_TARGET", True)
@@ -755,7 +781,8 @@ class OpkgRootfs(Rootfs):
         self.pm.mark_packages("unpacked", registered_pkgs.split())
 
     def _log_check(self):
-        pass
+        self._log_check_warn()
+        self._log_check_error()
 
     def _cleanup(self):
         pass
-- 
1.9.1


