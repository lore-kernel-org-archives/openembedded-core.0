Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EBEB60809
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 11:36:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8QBa74e011855
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 04:36:08 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 26 Sep 2014 04:36:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Sep 2014 19:36:01 +0800
Message-ID: <93b66c32c63428d0ddfdfb1a5787f2bf737525b5.1411730802.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411730802.git.hongxu.jia@windriver.com>
References: <cover.1411730802.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] rootfs.py: catch inner warn message
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
X-List-Received-Date: Fri, 26 Sep 2014 11:36:10 -0000
Content-Type: text/plain

Package managements (smart/apt-get/opkg-cl) generate some warn messages
to stdout, and we need to catch them and output by bb.warn.

Here is an example, while invoking smart to attempt install doc packages,
if install failed, it generates warn message to stdout.
...
|warning: Can't install util-linux-doc-2.24.2-r1@i586: Can't
install util-linux-doc-2.24.2-r1@i586: no package provides info
...

The fix catches it and outputs:
...
|WARNING: log_check: There is a warn message in the logfile
|WARNING: log_check: Matched keyword: [warn]
|WARNING: log_check: warning: Can't install util-linux-doc-2.24.2-r1@
i586: Can't install util-linux-doc-2.24.2-r1@i586: no package provides
info
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/rootfs.py | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 3d8ae81..c4735f2 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -347,7 +347,21 @@ class RpmRootfs(Rootfs):
         # already saved in /etc/rpm-postinsts
         pass
 
-    def _log_check(self):
+    def _log_check_warn(self):
+        r = re.compile('(warn|Warn)')
+        log_path = self.d.expand("${T}/log.do_rootfs")
+        with open(log_path, 'r') as log:
+            for line in log.read().split('\n'):
+                if 'log_check' in line:
+                    continue
+
+                m = r.search(line)
+                if m:
+                    bb.warn('log_check: There is a warn message in the logfile')
+                    bb.warn('log_check: Matched keyword: [%s]' % m.group())
+                    bb.warn('log_check: %s\n' % line)
+
+    def _log_check_error(self):
         r = re.compile('(unpacking of archive failed|Cannot find package|exit 1|ERR|Fail)')
         log_path = self.d.expand("${T}/log.do_rootfs")
         with open(log_path, 'r') as log:
@@ -370,6 +384,10 @@ class RpmRootfs(Rootfs):
                 if found_error == 6:
                     bb.fatal(message)
 
+    def _log_check(self):
+        self._log_check_warn()
+        self._log_check_error()
+
     def _handle_intercept_failure(self, registered_pkgs):
         rpm_postinsts_dir = self.image_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/')
         bb.utils.mkdirhier(rpm_postinsts_dir)
-- 
1.9.1


