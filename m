Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 193A26FF5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 22:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 9C5822E135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id tdI7VhgBRcsz
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:22 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id C3B742E1F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id AE3421906
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id A316C1901
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id A1BC5101C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4IMSLvh026704
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4IMSLWl026703
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2016 00:28:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 00:28:13 +0200
Message-Id: <84f0b52a6d5eb8fd346f8da01dc1f9b3f42ab0c3.1463610428.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
Subject: [PATCH 2/7] rootfs.py: Remove _log_check_error() from the RpmRootfs class
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
X-List-Received-Date: Wed, 18 May 2016 22:28:25 -0000

The fact that this function was overridden in the RpmRootfs class
seems to have led to a number of misstakes when changes have been made
to the base function in the Rootfs class. E.g., this change will
properly solve ticket 7789, which was supposedly solved in 38871dc0,
but that change had no effect in practice as the log_check_regex that
was modified for RpmRootfs class was not used by the RpmRootfs version
of _log_check_error()...

The only thing _log_check_error() in RpmRootfs did that the base
function in Rootfs did not do was to skip lines in the log that begin
with a + sign. This has now been moved to the base function instead.

[YOCTO #7789]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/rootfs.py | 29 +++--------------------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index f6fb06c..0a2753e 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -62,6 +62,9 @@ class Rootfs(object):
             for line in log:
                 if 'log_check' in line:
                     continue
+                # sh -x may emit code which isn't actually executed
+                if line.startswith('+'):
+                    continue
 
                 if hasattr(self, 'log_check_expected_errors_regexes'):
                     m = None
@@ -473,32 +476,6 @@ class RpmRootfs(Rootfs):
         # already saved in /etc/rpm-postinsts
         pass
 
-    def _log_check_error(self):
-        r = re.compile('(unpacking of archive failed|Cannot find package|exit 1|ERR|Fail)')
-        log_path = self.d.expand("${T}/log.do_rootfs")
-        with open(log_path, 'r') as log:
-            found_error = 0
-            message = "\n"
-            for line in log.read().split('\n'):
-                if 'log_check' in line:
-                    continue
-                # sh -x may emit code which isn't actually executed
-                if line.startswith('+'):
-		    continue
-
-                m = r.search(line)
-                if m:
-                    found_error = 1
-                    bb.warn('log_check: There were error messages in the logfile')
-                    bb.warn('log_check: Matched keyword: [%s]\n\n' % m.group())
-
-                if found_error >= 1 and found_error <= 5:
-                    message += line + '\n'
-                    found_error += 1
-
-                if found_error == 6:
-                    bb.fatal(message)
-
     def _log_check(self):
         self._log_check_warn()
         self._log_check_error()
-- 
2.1.0


