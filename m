Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1T3yEZ-0008E5-0o
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 01:51:43 +0200
Received: by obc16 with SMTP id 16so482088obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 16:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=oMC2bUy+vm2wo0Kpv0GqgzEjbfnmZffEkJC/9i1kOOs=;
	b=ztNC9jqTzzgJBj3UGHIlU0y7kC5vFRPV8dGsDXnOL7SjxX1p6qRDdb5EpfkbofYaky
	MqqTnOAUi/GVTzMXYc0jfn3/sV7WtI8etQkNNWWcXzdX1w+Knd+tASs2AvuVd1LYmUBg
	+uySwbhXDubMey/5etLQsCZGrGzZnaBbHjzKStiREK0sWT1dJa/i9HtJD2c9UIT6iBko
	DRXTJrgHyfWlSRhuX+zZVvJy8a8ujPwZ3eMm7G1ohUDl5moaZxfaaftpVjgKKnQFUa6B
	e+Zyv56MGgCa8dz3qS2Eyt3SOCa8wizKK+xbMEkgaV947H1L4nSq4aRltT6wmj++t5wt
	C08A==
Received: by 10.182.188.41 with SMTP id fx9mr13953349obc.92.1345592378150;
	Tue, 21 Aug 2012 16:39:38 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id k3sm2490932obw.4.2012.08.21.16.39.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 16:39:37 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2012 16:39:35 -0700
Message-Id: <1345592379-8704-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 1/5] u-boot-mkimage: Correct EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 21 Aug 2012 23:51:43 -0000

- HOSTLD has never been used in U-Boot, drop.
- HOSTSTRIP has been valid for a long time for tools
- Same for HOSTCFLAGS / HOSTLDFLAGS

Signed-off-by: Tom Rini <trini@ti.com>
---
 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb  |    4 ++--
 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb  |    4 ++--
 .../u-boot/u-boot-mkimage_2012.04.01.bb            |    4 +++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
index 34bae8e..fdbe7c9 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
                     file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
 SECTION = "bootloader"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
            file://0001-Drop-config.h-include-in-tools-imximage.h.patch \
@@ -17,7 +17,7 @@ S = "${WORKDIR}/u-boot-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTSTRIP=true'
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
 
 do_compile () {
   oe_runmake tools
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
index 3ca0c2c..c4921d6 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
                     file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
 SECTION = "bootloader"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
 
@@ -15,7 +15,7 @@ S = "${WORKDIR}/u-boot-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
 
 do_compile () {
   oe_runmake tools
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
index aa107fe..c41a2f1 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
@@ -3,6 +3,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 SECTION = "bootloader"
 
+PR = "r1"
+
 # This is needs to be validated among supported BSP's before we can
 # make it default
 DEFAULT_PREFERENCE = "-1"
@@ -18,7 +20,7 @@ SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
 
 do_compile () {
   oe_runmake tools
-- 
1.7.9.5



