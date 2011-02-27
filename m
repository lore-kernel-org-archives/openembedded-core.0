Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcxy-0007Da-HZ
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:02 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:41 -0800 (PST)
Received: by 10.227.143.206 with SMTP id w14mr3826512wbu.66.1298798981257;
	Sun, 27 Feb 2011 01:29:41 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id u9sm2269869wbg.6.2011.02.27.01.29.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:40 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:15 +0100
Message-Id: <16064ac5184f49454947703a7ba6153f2bb51da4.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 10/50] Ensure Bash is used when spawning terminals
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Feb 2011 09:31:02 -0000

From: Joshua Lock <josh@linux.intel.com>

We rely on Bashisms when spawning a terminal so ensure that bash is used
when using devshell and menuconfig.

Fixes [BUGID #119]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/devshell.bbclass |    4 ++--
 meta/classes/kernel.bbclass   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 4fb3e63..5f262f4 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -9,7 +9,8 @@ devshell_do_devshell() {
 	export XAUTHORITY='${XAUTHORITY}'
 	export TERMWINDOWTITLE="Bitbake Developer Shell"
 	export EXTRA_OEMAKE='${EXTRA_OEMAKE}'
-	${TERMCMD}
+	export SHELLCMDS="bash"
+	${TERMCMDRUN}
 	if [ $? -ne 0 ]; then
 	    echo "Fatal: '${TERMCMD}' not found. Check TERMCMD variable."
 	    exit 1
@@ -17,6 +18,5 @@ devshell_do_devshell() {
 }
 addtask devshell after do_patch
 
-
 EXPORT_FUNCTIONS do_devshell
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a1b1354..5d9b86a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -202,7 +202,7 @@ do_menuconfig() {
         export DBUS_SESSION_BUS_ADDRESS='${DBUS_SESSION_BUS_ADDRESS}'
         export XAUTHORITY='${XAUTHORITY}'
 	export TERMWINDOWTITLE="${PN} Kernel Configuration"
-	export SHELLCMDS="make menuconfig"
+	export SHELLCMDS="bash make menuconfig"
 	${TERMCMDRUN}
 	if [ $? -ne 0 ]; then
 		echo "Fatal: '${TERMCMD}' not found. Check TERMCMD variable."
-- 
1.6.6.1



