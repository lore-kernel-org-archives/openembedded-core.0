Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB7C7718C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 22:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B173D2E135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id n+Ai02V79VfK
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:23 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 63B6D2E205
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:22 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id E5C6D1901
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id E40B818FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id E27DC102B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4IMSLvj026724
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4IMSLCO026723
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2016 00:28:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 00:28:18 +0200
Message-Id: <ae293309b36b70b6d3fadeedf5e63b6d7ee4bfbe.1463610428.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
Subject: [PATCH 7/7] rootfs.py: Unify _log_check_warn() and _log_check_error()
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
X-List-Received-Date: Wed, 18 May 2016 22:28:28 -0000

Use a common _log_check_common() function (based on the old
_log_check_warn() function) to implement the logic for both
_log_check_warn() and _log_check_error().

The main benefit of this is that now all error messages will be
reported again, not just the first one found. Additionally the output
will now look the same for both error and warning messages.

This removes the context for the error messages. However, since there
was no indication in the output that some of the lines were context,
they were more confusing than helping.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/rootfs.py | 52 ++++++++++++++-------------------------------------
 1 file changed, 14 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 479e4cc..f5c465f 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -40,7 +40,7 @@ class Rootfs(object):
     def _log_check(self):
         pass
 
-    def _log_check_warn(self):
+    def _log_check_common(self, type, match):
         # Ignore any lines containing log_check to avoid recursion, and ignore
         # lines beginning with a + since sh -x may emit code which isn't
         # actually executed, but may contain error messages
@@ -48,7 +48,7 @@ class Rootfs(object):
         if hasattr(self, 'log_check_expected_regexes'):
             excludes.extend(self.log_check_expected_regexes)
         excludes = [re.compile(x) for x in excludes]
-        r = re.compile('^(warn|Warn|WARNING:)')
+        r = re.compile(match)
         log_path = self.d.expand("${T}/log.do_rootfs")
         messages = []
         with open(log_path, 'r') as log:
@@ -65,45 +65,21 @@ class Rootfs(object):
                     messages.append('[log_check] %s' % line)
         if messages:
             if len(messages) == 1:
-                msg = 'a warning message'
+                msg = '1 %s message' % type
             else:
-                msg = '%d warning messages' % len(messages)
-            bb.warn('[log_check] %s: found %s in the logfile:\n%s'
-                    % (self.d.getVar('PN', True), msg, ''.join(messages)))
-
-    def _log_check_error(self):
-        # Ignore any lines containing log_check to avoid recursion, and ignore
-        # lines beginning with a + since sh -x may emit code which isn't
-        # actually executed, but may contain error messages
-        excludes = [ 'log_check', r'^\+' ]
-        if hasattr(self, 'log_check_expected_regexes'):
-            excludes.extend(self.log_check_expected_regexes)
-        excludes = [re.compile(x) for x in excludes]
-        r = re.compile(self.log_check_regex)
-        log_path = self.d.expand("${T}/log.do_rootfs")
-        with open(log_path, 'r') as log:
-            found_error = 0
-            message = "\n"
-            for line in log:
-                for ee in excludes:
-                    m = ee.search(line)
-                    if m:
-                        break
-                if m:
-                    continue
-
-                m = r.search(line)
-                if m:
-                    found_error = 1
-                    bb.warn('[log_check] %s: found an error message in the logfile (keyword \'%s\'):\n[log_check] %s'
-				    % (self.d.getVar('PN', True), m.group(), line))
+                msg = '%d %s messages' % (len(messages), type)
+            msg = '[log_check] %s: found %s in the logfile:\n%s' % \
+                (self.d.getVar('PN', True), msg, ''.join(messages))
+            if type == 'error':
+                bb.fatal(msg)
+            else:
+                bb.warn(msg)
 
-                if found_error >= 1 and found_error <= 5:
-                    message += line + '\n'
-                    found_error += 1
+    def _log_check_warn(self):
+        self._log_check_common('warning', '^(warn|Warn|WARNING:)')
 
-                if found_error == 6:
-                    bb.fatal(message)
+    def _log_check_error(self):
+        self._log_check_common('error', self.log_check_regex)
 
     def _insert_feed_uris(self):
         if bb.utils.contains("IMAGE_FEATURES", "package-management",
-- 
2.1.0


