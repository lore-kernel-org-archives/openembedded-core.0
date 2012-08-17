Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1T2Put-0003DQ-Kw
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 19:00:59 +0200
Received: by pbcwy7 with SMTP id wy7so4180511pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 09:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=ZoKJ3jbk71Z2cnNqgmIP0z3H9d3r5VOmJ1+ABoeh3Zk=;
	b=SjJ5tyfy/pwCBN0Ot8SMUXdkVKqw/5HhSC06P3g8naD/rs5UDT29JfGG6mSJFjSNus
	ZP4bcYZvxmuPtHWQqE6ZqGwEUincCEwKG10451rkIfTDq8ljHiOxdJ9slJmIXhkzGCge
	+HqHGbPctE0Pulbt0GQa8ERZXLPXpYl+Mm6waXRNxnic8rZMyNKP6uPRVxwfedYv+84W
	+OsmmHHVOLE8fatB5rWKKbP9HmPRPkTOhvNg+AeG9j82FBXPDa4SWGitZYIX8iWpnsJj
	Es7Dy5faRB2dnDo5+HTOpR46ZV5gpahCpwsZtMZdu8a1dc9HMMoplUvHu/cnQ+u/KiSQ
	vojg==
Received: by 10.66.85.4 with SMTP id d4mr1499439paz.11.1345222140010;
	Fri, 17 Aug 2012 09:49:00 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id vh7sm5248664pbc.22.2012.08.17.09.48.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 09:48:59 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 09:48:52 -0700
Message-Id: <1345222136-24839-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/5] u-boot-mkimage: Correct EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 17 Aug 2012 17:00:59 -0000

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
index 34bae8e..9161f6c 100644
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
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
 
 do_compile () {
   oe_runmake tools
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
index 3ca0c2c..2a83323 100644
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
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
 
 do_compile () {
   oe_runmake tools
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
index aa107fe..4d05202 100644
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
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
 
 do_compile () {
   oe_runmake tools
-- 
1.7.9.5



