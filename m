Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7000CC433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 08:33:51 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.22841.1633422829880687202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 01:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1C6B9C0007;
	Tue,  5 Oct 2021 08:33:47 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] devpyshell: rename to pydevshell
Date: Tue,  5 Oct 2021 10:33:34 +0200
Message-Id: <20211005083334.888895-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 08:33:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156637

For consistency with "pydevshell" which is also used.
This addresses [YOCTO #14531]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/classes/devshell.bbclass    | 10 +++++-----
 meta/conf/documentation.conf     |  2 +-
 scripts/oepydevshell-internal.py |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 76dd0b42ee..62dc958d9a 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -34,7 +34,7 @@ python () {
        d.delVarFlag("do_devshell", "fakeroot")
 } 
 
-def devpyshell(d):
+def pydevshell(d):
 
     import code
     import select
@@ -140,17 +140,17 @@ def devpyshell(d):
                 os.kill(child, signal.SIGTERM)
                 break
 
-python do_devpyshell() {
+python do_pydevshell() {
     import signal
 
     try:
-        devpyshell(d)
+        pydevshell(d)
     except SystemExit:
         # Stop the SIGTERM above causing an error exit code
         return
     finally:
         return
 }
-addtask devpyshell after do_patch
+addtask pydevshell after do_patch
 
-do_devpyshell[nostamp] = "1"
+do_pydevshell[nostamp] = "1"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index c5a38b0764..80ad8e10d5 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -17,7 +17,7 @@ do_compile_ptest_base[doc] = "Compiles the runtime test suite included in the so
 do_configure[doc] = "Configures the source by enabling and disabling any build-time and configuration options for the software being built"
 do_configure_ptest_base[doc] = "Configures the runtime test suite included in the software being built"
 do_deploy[doc] = "Writes deployable output files to the deploy directory"
-do_devpyshell[doc] = "Starts an interactive Python shell for development/debugging"
+do_pydevshell[doc] = "Starts an interactive Python shell for development/debugging"
 do_devshell[doc] = "Starts a shell with the environment set up for development/debugging"
 do_diffconfig[doc] = "Compares the old and new config files after running do_menuconfig for the kernel"
 do_fetch[doc] = "Fetches the source code"
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index 96c078ef3d..e3c35bbe2c 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -43,7 +43,7 @@ nonblockingfd(pty)
 nonblockingfd(sys.stdin)
 
 
-histfile = os.path.expanduser("~/.oedevpyshell-history")
+histfile = os.path.expanduser("~/.oepydevshell-history")
 readline.parse_and_bind("tab: complete")
 try:
     readline.read_history_file(histfile)
-- 
2.25.1


