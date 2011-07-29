Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QmtLh-0001zs-Dy
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 22:07:57 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QmtHY-0004NY-Sn from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 13:03:41 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 29 Jul 2011 22:03:37 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A50669CBBB@eu2-mail.mgc.mentorg.com>
In-Reply-To: <1311942290-27217-1-git-send-email-noor_ahsan@mentor.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [PATCH] kernel,cml1.bbclass: Move menuconfig to cml1
Thread-Index: AcxN6pJ/T5Al0RSSRPSh+WXZSNm2+AAP7sMA
References: <1311942290-27217-1-git-send-email-noor_ahsan@mentor.com>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-core@lists.openembedded.org>
X-Mailman-Approved-At: Sat, 30 Jul 2011 10:58:52 +0200
Cc: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
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
X-List-Received-Date: Fri, 29 Jul 2011 20:07:57 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

* The menuconfig target exists in places other than the kernel that use
kernel style config.

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
=20
 EXPORT_FUNCTIONS do_configure
 addtask configure after do_unpack do_patch before do_compile
+
+do_menuconfig() {
+	export TERMWINDOWTITLE=3D"${PN} Configuration"
+	export SHELLCMDS=3D"make menuconfig"
+	${TERMCMDRUN}
+	if [ $? -ne 0 ]; then
+		oefatal "'${TERMCMD}' not found. Check TERMCMD
variable."
+	fi
+}
+do_menuconfig[nostamp] =3D "1"
+addtask menuconfig after do_configure
+
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 9c492a3..25d2629 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -197,21 +197,6 @@ kernel_do_configure() {
=20
 do_configure[depends] +=3D "${INITRAMFS_TASK}"
=20
-do_menuconfig() {
-        export DISPLAY=3D'${DISPLAY}'
-        export DBUS_SESSION_BUS_ADDRESS=3D'${DBUS_SESSION_BUS_ADDRESS}'
-        export XAUTHORITY=3D'${XAUTHORITY}'
-	export TERMWINDOWTITLE=3D"${PN} Kernel Configuration"
-	export SHELLCMDS=3D"make menuconfig"
-	${TERMCMDRUN}
-	if [ $? -ne 0 ]; then
-		echo "Fatal: '${TERMCMD}' not found. Check TERMCMD
variable."
-		exit 1
-	fi
-}
-do_menuconfig[nostamp] =3D "1"
-addtask menuconfig after do_configure
-
 pkg_postinst_kernel () {
 	cd /${KERNEL_IMAGEDEST}; update-alternatives --install
/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}
${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
 }
--=20
1.7.0.4



