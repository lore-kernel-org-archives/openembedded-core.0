Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UQ2zR-0003aC-Tz
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 23:55:47 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3ALcDNf024813
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 16:38:14 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3ALcC7x008584
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 03:08:13 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 11 Apr 2013 03:08:12 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3ALc8rx005264;
	Thu, 11 Apr 2013 03:08:11 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Apr 2013 16:38:06 -0500
Message-ID: <1365629886-6391-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] u-boot: Add UBOOT_LOCALVERSION to control version string
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
X-List-Received-Date: Wed, 10 Apr 2013 21:56:08 -0000
Content-Type: text/plain

* Add a variable called UBOOT_LOCALVERSION which when set will
  place a version string in the .scmversion file of the u-boot
  sources.  This string will be picked up by the u-boot Makefile
  and will be appended to the u-boot version.  This is done to
  make it easier to identify what revision of the u-boot sources
  are being run.  For example you can use a setting like the
  following to add the short commit id to the u-boot version
  string:

UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index ae53b90..366093e 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -16,6 +16,10 @@ python () {
 		raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")
 }
 
+# Allow setting an additional version string that will be picked up by the
+# u-boot build system and appended to the u-boot version.
+UBOOT_LOCALVERSION ?= ""
+
 # Some versions of u-boot use .bin and others use .img.  By default use .bin
 # but enable individual recipes to change this value.
 UBOOT_SUFFIX ?= "bin"
@@ -40,6 +44,9 @@ do_compile () {
 	unset LDFLAGS
 	unset CFLAGS
 	unset CPPFLAGS
+
+	echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
+	echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	oe_runmake ${UBOOT_MACHINE}
 	oe_runmake ${UBOOT_MAKE_TARGET}
 }
-- 
1.7.0.4



