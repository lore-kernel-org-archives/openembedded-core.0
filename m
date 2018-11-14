Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC67A6BCE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 01:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9D5801852A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:19:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id kOXjYiXXEvro
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:19:11 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 57F5918542
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:19:07 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BD221A0A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:01:08 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EB1C1A0A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:01:08 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:01:08 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 81C792D47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:01:08 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id wAE118ax031385
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 02:01:08 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id wAE118Ep031384
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2018 02:01:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2018 02:01:06 +0100
Message-Id: <20181114010107.31340-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] bitbake-dumpsig: Make --task work again
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
X-List-Received-Date: Wed, 14 Nov 2018 01:19:26 -0000

This corresponds to commit fdcea991 that fixed the --task option for
bitbake-diffsigs.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 bitbake/bin/bitbake-dumpsig | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/bitbake/bin/bitbake-dumpsig b/bitbake/bin/bitbake-dumpsig
index 95ebd93546..40e08e0439 100755
--- a/bitbake/bin/bitbake-dumpsig
+++ b/bitbake/bin/bitbake-dumpsig
@@ -3,7 +3,8 @@
 # bitbake-dumpsig
 # BitBake task signature dump utility
 #
-# Copyright (C) 2013 Intel Corporation
+# Copyright (C) 2013, 2017 Intel Corporation
+# Copyright (C) 2017-2018 Axis Communications AB
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -33,17 +34,38 @@ import bb.msg
 
 logger = bb.msg.logger_create('bitbake-dumpsig')
 
+def find_siginfo(tinfoil, pn, taskname, sigs=None):
+    result = None
+    tinfoil.set_event_mask(['bb.event.FindSigInfoResult',
+                            'logging.LogRecord',
+                            'bb.command.CommandCompleted',
+                            'bb.command.CommandFailed'])
+    ret = tinfoil.run_command('findSigInfo', pn, taskname, sigs)
+    if ret:
+        while True:
+            event = tinfoil.wait_event(1)
+            if event:
+                if isinstance(event, bb.command.CommandCompleted):
+                    break
+                elif isinstance(event, bb.command.CommandFailed):
+                    logger.error(str(event))
+                    sys.exit(2)
+                elif isinstance(event, bb.event.FindSigInfoResult):
+                    result = event.result
+                elif isinstance(event, logging.LogRecord):
+                    logger.handle(event)
+    else:
+        logger.error('No result returned from findSigInfo command')
+        sys.exit(2)
+    return result
+
 def find_siginfo_task(bbhandler, pn, taskname):
     """ Find the most recent signature file for the specified PN/task """
 
-    if not hasattr(bb.siggen, 'find_siginfo'):
-        logger.error('Metadata does not support finding signature data files')
-        sys.exit(1)
-
     if not taskname.startswith('do_'):
         taskname = 'do_%s' % taskname
 
-    filedates = bb.siggen.find_siginfo(pn, taskname, None, bbhandler.config_data)
+    filedates = find_siginfo(bbhandler, pn, taskname)
     latestfiles = sorted(filedates.keys(), key=lambda f: filedates[f])[-1:]
     if not latestfiles:
         logger.error('No sigdata files found matching %s %s' % (pn, taskname))
-- 
2.12.0


