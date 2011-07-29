Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Qmmng-0003Cz-Bb
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 15:08:24 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Qmm7w-0001HQ-Up from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 05:25:17 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 29 Jul 2011 14:25:15 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2011 17:24:50 +0500
Message-Id: <1311942290-27217-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 29 Jul 2011 12:25:16.0073 (UTC)
	FILETIME=[9265C190:01CC4DEA]
X-Mailman-Approved-At: Sat, 30 Jul 2011 10:58:52 +0200
Cc: "Noor, Ahsan" <noor_ahsan@mentor.com>
Subject: [PATCH] kernel,cml1.bbclass: Move menuconfig to cml1
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
X-List-Received-Date: Fri, 29 Jul 2011 13:08:24 -0000

* The menuconfig target exists in places other than the kernel that use kernel style config.

Signed-off-by: Noor, Ahsan <noor_ahsan@mentor.com>
---
 meta/classes/cml1.bbclass   |   12 ++++++++++++
 meta/classes/kernel.bbclass |   15 ---------------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 79218b4..a747af5 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -6,3 +6,15 @@ cml1_do_configure() {
 
 EXPORT_FUNCTIONS do_configure
 addtask configure after do_unpack do_patch before do_compile
+
+do_menuconfig() {
+	export TERMWINDOWTITLE="${PN} Configuration"
+	export SHELLCMDS="make menuconfig"
+	${TERMCMDRUN}
+	if [ $? -ne 0 ]; then
+		oefatal "'${TERMCMD}' not found. Check TERMCMD variable."
+	fi
+}
+do_menuconfig[nostamp] = "1"
+addtask menuconfig after do_configure
+
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 9c492a3..25d2629 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -197,21 +197,6 @@ kernel_do_configure() {
 
 do_configure[depends] += "${INITRAMFS_TASK}"
 
-do_menuconfig() {
-        export DISPLAY='${DISPLAY}'
-        export DBUS_SESSION_BUS_ADDRESS='${DBUS_SESSION_BUS_ADDRESS}'
-        export XAUTHORITY='${XAUTHORITY}'
-	export TERMWINDOWTITLE="${PN} Kernel Configuration"
-	export SHELLCMDS="make menuconfig"
-	${TERMCMDRUN}
-	if [ $? -ne 0 ]; then
-		echo "Fatal: '${TERMCMD}' not found. Check TERMCMD variable."
-		exit 1
-	fi
-}
-do_menuconfig[nostamp] = "1"
-addtask menuconfig after do_configure
-
 pkg_postinst_kernel () {
 	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
 }
-- 
1.7.0.4



