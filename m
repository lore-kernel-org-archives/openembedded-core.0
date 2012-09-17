Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooperjr27@gmail.com>) id 1TDffe-00071m-Ev
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 20:03:46 +0200
Received: by obblz20 with SMTP id lz20so9523678obb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 10:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=j7RZh8GTbgi3Qt6LwtPlwXRJzzNfH9T4wn0i1CSNQZ0=;
	b=tTNklnQJ2O0WE2xQ2dJJyjymwq1Qk8/m65MyOI6be7HG3tlbICOSxL5Sfahxbu6LXj
	ZONYMeZuP3H2+f9OQ3Z2oNHNuMJUj1asFutA2z92HJfeCK+pnd7hDY+mNiTXQMycZBKJ
	xcyIBwM25frzDqTdYE/RrmnjYafVE+hU4rgyj1nLZ5/ZN/S2kBSLMz8PNdT92xYwGkFl
	UV8f5Joq+U9/KM+2SvNXEyoLM785VPambgpXSRQI1QsKoZGICFmxkmLv7Dk+zBR2ibvJ
	EJ9BsbDmHcJjhl5opwj1p8g/r2nS+bQiXU5hyb/UNm+380eQfUYLQmNwB4UB9oC0R3oc
	uRXg==
Received: by 10.60.1.106 with SMTP id 10mr12851530oel.84.1347904267090;
	Mon, 17 Sep 2012 10:51:07 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 5sm9200685oeq.4.2012.09.17.10.51.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 10:51:06 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 13:12:55 -0500
Message-Id: <1347905575-599-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [denzil][PATCH v2] u-boot: Use fw_env.config if avaliable
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
X-List-Received-Date: Mon, 17 Sep 2012 18:03:46 -0000

* Add support for board specific fw_env.config file if avaliable

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---

Version 2 Changes:
Updated signed off and author to point to correct email address

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



