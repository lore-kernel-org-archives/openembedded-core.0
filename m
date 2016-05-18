Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34BD673243
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 22:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 71F161812E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id cV9N0LdSg5k2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:22 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 6433E18141
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:22 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id CAEE4190F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id C9D901901
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id C8B031019
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4IMSLsY026716
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4IMSLpv026715
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2016 00:28:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 00:28:16 +0200
Message-Id: <7829900d96258fe09bfec6545ec383820c04f482.1463610428.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
Subject: [PATCH 5/7] rootfs.py: Exclude lines in _log_check_warn() as well
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
X-List-Received-Date: Wed, 18 May 2016 22:28:24 -0000

This will make _log_check_warn() exclude the same lines as
_log_check_error() does.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/rootfs.py | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 63ca22f..741399a 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -41,11 +41,22 @@ class Rootfs(object):
         pass
 
     def _log_check_warn(self):
+        # Ignore any lines containing log_check to avoid recursion, and ignore
+        # lines beginning with a + since sh -x may emit code which isn't
+        # actually executed, but may contain error messages
+        excludes = [ 'log_check', r'^\+' ]
+        if hasattr(self, 'log_check_expected_regexes'):
+            excludes.extend(self.log_check_expected_regexes)
+        excludes = [re.compile(x) for x in excludes]
         r = re.compile('^(warn|Warn|WARNING:)')
         log_path = self.d.expand("${T}/log.do_rootfs")
         with open(log_path, 'r') as log:
             for line in log:
-                if 'log_check' in line:
+                for ee in excludes:
+                    m = ee.search(line)
+                    if m:
+                        break
+                if m:
                     continue
 
                 m = r.search(line)
@@ -58,8 +69,8 @@ class Rootfs(object):
         # lines beginning with a + since sh -x may emit code which isn't
         # actually executed, but may contain error messages
         excludes = [ 'log_check', r'^\+' ]
-        if hasattr(self, 'log_check_expected_errors_regexes'):
-            excludes.extend(self.log_check_expected_errors_regexes)
+        if hasattr(self, 'log_check_expected_regexes'):
+            excludes.extend(self.log_check_expected_regexes)
         excludes = [re.compile(x) for x in excludes]
         r = re.compile(self.log_check_regex)
         log_path = self.d.expand("${T}/log.do_rootfs")
@@ -597,7 +608,7 @@ class DpkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir):
         super(DpkgRootfs, self).__init__(d)
         self.log_check_regex = '^E:'
-        self.log_check_expected_errors_regexes = \
+        self.log_check_expected_regexes = \
         [
             "^E: Unmet dependencies."
         ]
-- 
2.1.0


