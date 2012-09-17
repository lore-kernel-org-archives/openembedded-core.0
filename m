Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooperjr27@gmail.com>) id 1TDdUM-00079v-Cz
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 17:43:58 +0200
Received: by obblz20 with SMTP id lz20so9311522obb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 08:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=bo76sV6M7ONugd0PThPGQLF4U2G8nVkikI048o/P0/I=;
	b=PQ31LZZ3Wlfs98EmnlBqhnKFWCEINQCB/qJo5rBln7kiEXQh7paImlFUq/U1HcTOsi
	enyB5lhU2IItMNHdjjiXTiM5Mycm1Mv2Yc6ntvBZPqtQX1fQ33fIP7xL1qWmAc5CvBY+
	SiRdKL2ml5ZMSgndMh3F+fbrwb+j2srlgXAK6y1mtCgj2FKD0kLLwXx+CGVpzvV1Hmok
	pd8qKq1orxPkrLx9tvq739eLhGi8KoYDNmS6h1yHnc9qUo9BVLEEFwfgT6cA5qLyGBe0
	dHL7yd2Pudq9HPmfiH3vb5tvre3i/IAGvbk7SwaJ+bxAc9TZc2Hgmv8mrPt6Ja5PDHdp
	QyYg==
Received: by 10.182.144.68 with SMTP id sk4mr12279349obb.0.1347895879047;
	Mon, 17 Sep 2012 08:31:19 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id q3sm8877368oef.0.2012.09.17.08.31.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 08:31:18 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 10:53:01 -0500
Message-Id: <1347897181-28003-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [denzil][PATCH] u-boot: Use fw_env.config if avaliable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 15:43:58 -0000

From: Franklin S. Cooper Jr <fcooper27jr@gmail.com>

* Add support for board specific fw_env.config file if avaliable.
* This patch is based on commit 5b6a8e987f9039aca63d97bc42421b78acab8a3d
  from oe-core master.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc        |   16 +++++++++++-----
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    2 +-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index e627e97..3086814 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -48,6 +48,11 @@ do_install () {
     install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
     ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
 
+    if [ -e ${WORKDIR}/fw_env.config ] ; then
+        install -d ${D}${sysconfdir}
+        install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
+    fi
+
     if [ "x${SPL_BINARY}" != "x" ]
     then
         install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
@@ -55,15 +60,16 @@ do_install () {
     fi
 }
 
-FILES_${PN} = "/boot"
+FILES_${PN} = "/boot ${sysconfdir}"
 
 do_deploy () {
     install -d ${DEPLOYDIR}
-	install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+    install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 
-	cd ${DEPLOYDIR}
-	rm -f ${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
+    cd ${DEPLOYDIR}
+    rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
+    ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
+    ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
 
     if [ "x${SPL_BINARY}" != "x" ]
     then
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
index 5d79e1a..fa328d1 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
@@ -17,7 +17,7 @@ FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
 SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
 
 PV = "v2011.03+git${SRCPV}"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
index 43f2c06..93b7923 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
@@ -17,7 +17,7 @@ FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
 SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
 
 PV = "v2011.06+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
-- 
1.7.0.4



