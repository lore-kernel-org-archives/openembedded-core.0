Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BADF36BCE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 01:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6196E18348
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:19:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id JRVEeywBQ45v
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:19:11 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6E38618545
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:19:07 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A77E21A0A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:01:08 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B2471A0A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:01:08 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:01:08 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 8E32C2FA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:01:08 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id wAE118PL031389
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:01:08 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id wAE118ps031388
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2018 02:01:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2018 02:01:07 +0100
Message-Id: <20181114010107.31340-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20181114010107.31340-1-pkj@axis.com>
References: <20181114010107.31340-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] bitbake-dumpsig: Change to use argparse
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
X-List-Received-Date: Wed, 14 Nov 2018 01:19:25 -0000

This corresponds to commit 7f130e0b for bitbake-diffsigs.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 bitbake/bin/bitbake-dumpsig | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/bitbake/bin/bitbake-dumpsig b/bitbake/bin/bitbake-dumpsig
index 40e08e0439..50e5717ace 100755
--- a/bitbake/bin/bitbake-dumpsig
+++ b/bitbake/bin/bitbake-dumpsig
@@ -22,7 +22,7 @@
 import os
 import sys
 import warnings
-import optparse
+import argparse
 import logging
 import pickle
 
@@ -73,21 +73,22 @@ def find_siginfo_task(bbhandler, pn, taskname):
 
     return latestfiles[0]
 
-parser = optparse.OptionParser(
-    description = "Dumps siginfo/sigdata files written out by BitBake",
-    usage = """
-  %prog -t recipename taskname
-  %prog sigdatafile""")
+parser = argparse.ArgumentParser(
+    description="Dump siginfo/sigdata files written out by BitBake")
 
-parser.add_option("-D", "--debug",
-        help = "enable debug",
-        action = "store_true", dest="debug", default = False)
+parser.add_argument('-d', '--debug',
+                    help='Enable debug output',
+                    action='store_true')
 
-parser.add_option("-t", "--task",
-        help = "find the signature data file for the specified task",
-        action="store", dest="taskargs", nargs=2, metavar='recipename taskname')
+parser.add_argument("-t", "--task",
+        help="find the signature data file for the last run of the specified task",
+        action="store", dest="taskargs", nargs=2, metavar=('recipename', 'taskname'))
 
-options, args = parser.parse_args(sys.argv)
+parser.add_argument("sigdatafile",
+        help="Signature file to dump. Not used when using -t/--task.",
+        action="store", nargs='?')
+
+options = parser.parse_args()
 
 if options.debug:
     logger.setLevel(logging.DEBUG)
@@ -97,11 +98,11 @@ if options.taskargs:
     tinfoil.prepare(config_only = True)
     file = find_siginfo_task(tinfoil, options.taskargs[0], options.taskargs[1])
     logger.debug("Signature file: %s" % file)
-elif len(args) == 1:
-    parser.print_help()
-    sys.exit(0)
+elif options.sigdatafile:
+    file = options.sigdatafile
 else:
-    file = args[1]
+    parser.print_help()
+    sys.exit(1)
 
 try:
     output = bb.siggen.dump_sigfile(file)
-- 
2.12.0


