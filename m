Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooperjr27@gmail.com>) id 1T91cI-0004Sk-0z
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 00:29:06 +0200
Received: by ggmq1 with SMTP id q1so1647193ggm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 15:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Xb9ZA4pwcmRin3UDZvoZWWd0WB/TMwJMzh97IFlnJEs=;
	b=NgmZXIx7NvwbBJy2VO2NAiwnpmzhi2zSepHc6DC2Q3nTti/PT2QHapMpMk0a6FaKcM
	wGdFbIBGjXOJ+9Gwfo25keh1aUw8rqTDL+c+mX8BKe06p+E9arr1dXxF9mIsP2TBDyqp
	V5O/r+2mbVOZbLhc7JvOKvKq1FmzPEXgIppXVVKYMu0rXDIz6iStTkSrw0a5yYqwMURF
	n7qpAGThawVFadC+z+dB1TcprNHonk+93zyIAQIctjQ8wBNUkVxbrbLQqiU5a9yE72+d
	sPbrqS8MAjkwqs7qe1DZ/CJB840auvXaaVAfvpxnSjOL4p9ZbeN5wGTnpz2ZCJywrJCa
	2eYw==
Received: by 10.236.175.70 with SMTP id y46mr19999219yhl.116.1346797003336;
	Tue, 04 Sep 2012 15:16:43 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id x8sm32315248yhd.18.2012.09.04.15.16.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 15:16:42 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 17:33:43 -0500
Message-Id: <1346798023-24197-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: fcooper@ti.com, "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [PATCH v2] u-boot: Use fw_env.config if available.
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
X-List-Received-Date: Tue, 04 Sep 2012 22:29:06 -0000

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



