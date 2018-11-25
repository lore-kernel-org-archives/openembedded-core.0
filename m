Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2E86D460
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 01:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1D1F21833F;
	Sun, 25 Nov 2018 02:12:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id lMhM1TSD-ZKt; Sun, 25 Nov 2018 02:12:31 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C428D182BF;
	Sun, 25 Nov 2018 02:12:30 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB27F1E056;
	Sun, 25 Nov 2018 02:12:30 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FBCD1E054;
	Sun, 25 Nov 2018 02:12:30 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sun, 25 Nov 2018 02:12:30 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 91A7619D0;
	Sun, 25 Nov 2018 02:12:30 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id wAP1CUd4016374;
	Sun, 25 Nov 2018 02:12:30 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id wAP1CUNn016373;
	Sun, 25 Nov 2018 02:12:30 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org,
	Hongxu Jia <hongxu.jia@windriver.com>
Date: Sun, 25 Nov 2018 02:11:55 +0100
Message-Id: <20181125011155.16251-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] Revert "terminal.bbclass: use var-SHELL as the shebang of wrapper script"
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
X-List-Received-Date: Sun, 25 Nov 2018 01:12:33 -0000

The $SHELL environment variable is used for the user's preferred
interactive shell. This shall not be used when executing shell scripts
that expect POSIX shell syntax as there is no guarantee that it is a
POSIX compatible shell.

This reverts commit 27e2ede65f1193e49f9483b08a55495d88740a65.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

In my case, $SHELL is set to /bin/zsh, with the result that devshell
fails to start. If there is some problem with devshell related to
/bin/sh being linked to dash rather than bash (which the original
commit indicates), then that should be adressed instead.

Hongxu: Do you have any additional information related to why you made
the change in the first place?

 meta/classes/terminal.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 73e765d57a..a27e10c6ec 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -25,8 +25,7 @@ def emit_terminal_func(command, envdata, d):
     bb.utils.mkdirhier(os.path.dirname(runfile))
 
     with open(runfile, 'w') as script:
-        script.write('#!/usr/bin/env %s\n' % d.getVar('SHELL'))
-        script.write('set -e\n')
+        script.write('#!/bin/sh -e\n')
         bb.data.emit_func(cmd_func, script, envdata)
         script.write(cmd_func)
         script.write("\n")
-- 
2.12.0


