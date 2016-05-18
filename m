Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33D0D6FF5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 22:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5C501180BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id yj03shvb5nrD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:22 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 643141813A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:22 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D883B1910
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id D7741190B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id D5F5B102B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4IMSLh3026720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 00:28:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4IMSLDA026719
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2016 00:28:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 00:28:17 +0200
Message-Id: <f8168d0b7002fdc4ef92e925cb2cc610b3bceb62.1463610428.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
In-Reply-To: <cover.1463610428.git.pkj@axis.com>
References: <cover.1463610428.git.pkj@axis.com>
Subject: [PATCH 6/7] rootfs.py: Reduce spam from _log_check_warn()
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

For each warning found in the log, _log_check_warn() would output a
line stating that it had found a warning, then the actual warning and
finally an empty line. This is quite excessive when there are many
warnings in the log.

With this change the output is instead a line stating how many
warnings were found, followed by the warnings. This makes the output
much more compact and actually much more readable.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/rootfs.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 741399a..479e4cc 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -50,6 +50,7 @@ class Rootfs(object):
         excludes = [re.compile(x) for x in excludes]
         r = re.compile('^(warn|Warn|WARNING:)')
         log_path = self.d.expand("${T}/log.do_rootfs")
+        messages = []
         with open(log_path, 'r') as log:
             for line in log:
                 for ee in excludes:
@@ -61,8 +62,14 @@ class Rootfs(object):
 
                 m = r.search(line)
                 if m:
-                    bb.warn('[log_check] %s: found a warning message in the logfile (keyword \'%s\'):\n[log_check] %s'
-				    % (self.d.getVar('PN', True), m.group(), line))
+                    messages.append('[log_check] %s' % line)
+        if messages:
+            if len(messages) == 1:
+                msg = 'a warning message'
+            else:
+                msg = '%d warning messages' % len(messages)
+            bb.warn('[log_check] %s: found %s in the logfile:\n%s'
+                    % (self.d.getVar('PN', True), msg, ''.join(messages)))
 
     def _log_check_error(self):
         # Ignore any lines containing log_check to avoid recursion, and ignore
-- 
2.1.0


