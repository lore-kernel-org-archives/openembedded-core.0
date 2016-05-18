Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7BD771CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 22:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 5B3A62E1F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id xSkRb8nkFOPh
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:23 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 63DC82E206
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:22 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id CA6011905
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id BDDE118FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id BC00D102B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4IMSLso026712
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4IMSLVc026711
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2016 00:28:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 00:28:15 +0200
Message-Id: <875a57111a5370b20e71102192496189b34776c9.1463610428.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
Subject: [PATCH 4/7] rootfs.py: Use one way to exclude lines in _log_check_error()
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

Before there were three different ways to exclude a line from being
searched for error messages in _log_check_error(). Now there is only
one: an array of regular expressions. This should make it easy to add
more excludes if nedded.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/rootfs.py | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a92aa22..63ca22f 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -54,26 +54,25 @@ class Rootfs(object):
 				    % (self.d.getVar('PN', True), m.group(), line))
 
     def _log_check_error(self):
+        # Ignore any lines containing log_check to avoid recursion, and ignore
+        # lines beginning with a + since sh -x may emit code which isn't
+        # actually executed, but may contain error messages
+        excludes = [ 'log_check', r'^\+' ]
+        if hasattr(self, 'log_check_expected_errors_regexes'):
+            excludes.extend(self.log_check_expected_errors_regexes)
+        excludes = [re.compile(x) for x in excludes]
         r = re.compile(self.log_check_regex)
         log_path = self.d.expand("${T}/log.do_rootfs")
         with open(log_path, 'r') as log:
             found_error = 0
             message = "\n"
             for line in log:
-                if 'log_check' in line:
-                    continue
-                # sh -x may emit code which isn't actually executed
-                if line.startswith('+'):
-                    continue
-
-                if hasattr(self, 'log_check_expected_errors_regexes'):
-                    m = None
-                    for ee in self.log_check_expected_errors_regexes:
-                        m = re.search(ee, line)
-                        if m:
-                            break
+                for ee in excludes:
+                    m = ee.search(line)
                     if m:
-                        continue
+                        break
+                if m:
+                    continue
 
                 m = r.search(line)
                 if m:
-- 
2.1.0


