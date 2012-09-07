Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooperjr27@gmail.com>) id 1TA86r-0005J4-TS
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 01:37:14 +0200
Received: by obblz20 with SMTP id lz20so236577obb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 16:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Xb9ZA4pwcmRin3UDZvoZWWd0WB/TMwJMzh97IFlnJEs=;
	b=RRz/VtsFaD9QZSQJwii+Jo6ods2SnuCrIKePY+dEkekKd3lXzKB9jZScciJs2Guv1m
	0DZ2VtHXKzSIbz3c8130UwCrP1D/MTZ+gNXoUW545q4DkuhALduuEFpHQZXLY4SApNMZ
	GQq44X+ypUNaAJshPUKu8NtRWflbZwAM9Yq+7reZAnPorGdmTQbKrNmXa3NENKCVO8m1
	ctpdRhtSg6ZXAcp1b4FgPwFDBPiANPTWAF1CKIOJiwr5+fjL4vjda7tSXksFzES/WzLQ
	kMIAQNsqRMZiMMLjEj/7Ly//rZJYi6n2+f/5meMJxS7tPUMelfBYp5Di+k7IJlGVlnah
	dwwg==
Received: by 10.182.146.77 with SMTP id ta13mr7558224obb.97.1347060287230;
	Fri, 07 Sep 2012 16:24:47 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id q3sm4780769oef.0.2012.09.07.16.24.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Sep 2012 16:24:46 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2012 18:42:56 -0500
Message-Id: <1347061376-22634-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta][PATCH v3] u-boot: Use fw_env.config if available.
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
X-List-Received-Date: Fri, 07 Sep 2012 23:37:14 -0000

* Add support for board specific fw_env.config file if available.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc           |   16 +++++++++++-----
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    2 +-
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index a8642f0..ae53b90 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -49,6 +49,11 @@ do_install () {
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
@@ -56,16 +61,17 @@ do_install () {
     fi
 }
 
-FILES_${PN} = "/boot"
+FILES_${PN} = "/boot ${sysconfdir}"
 FILESPATH =. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"
 
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
index 8465395..a9cbeca 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
 SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
 
 PV = "v2011.03+git${SRCPV}"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
index 9654795..a115ed2 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
 SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
 
 PV = "v2011.06+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
index c4ec50d..6c099b1 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
 
 PV = "v2012.04.01+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
-- 
1.7.0.4



