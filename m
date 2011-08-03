Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qojja-0004Tp-HC
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912930"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:10:54 -0700
Message-Id: <5bd79fe065669c1f6c0993af6a1416019a52d554.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 10/33] kernel, cml1.bbclass: Move menuconfig to cml1
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:19 -0000

From: Noor, Ahsan <noor_ahsan@mentor.com>

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
1.7.3.4



