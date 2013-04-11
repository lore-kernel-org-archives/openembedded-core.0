Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UQHQi-0003V2-Ct
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 15:20:49 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3BD3LlQ018564
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 08:03:22 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3BD3KmK012294
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 18:33:21 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 11 Apr 2013 18:33:20 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3BD3FCV002968;
	Thu, 11 Apr 2013 18:33:19 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2013 08:03:13 -0500
Message-ID: <1365685393-611-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1365685393-611-1-git-send-email-Chase.Maupin@ti.com>
References: <1365685393-611-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCHv2] u-boot: Add UBOOT_LOCALVERSION to control version string
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
X-List-Received-Date: Thu, 11 Apr 2013 13:21:02 -0000
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
* Updated in version 2
    * Check if the .scmversion file already exists and don't
      overwrite it if it does.
    * Based on feedback from
      Bruce Ashfield <bruce.ashfield@gmail.com]
---
 meta/recipes-bsp/u-boot/u-boot.inc |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index ae53b90..6bbe457 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -16,6 +16,11 @@ python () {
 		raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")
 }
 
+# Allow setting an additional version string that will be picked up by the
+# u-boot build system and appended to the u-boot version.  If the .scmversion
+# file already exists it will not be overwritten.
+UBOOT_LOCALVERSION ?= ""
+
 # Some versions of u-boot use .bin and others use .img.  By default use .bin
 # but enable individual recipes to change this value.
 UBOOT_SUFFIX ?= "bin"
@@ -40,6 +45,13 @@ do_compile () {
 	unset LDFLAGS
 	unset CFLAGS
 	unset CPPFLAGS
+
+	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
+	then
+		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
+		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
+	fi
+
 	oe_runmake ${UBOOT_MACHINE}
 	oe_runmake ${UBOOT_MAKE_TARGET}
 }
-- 
1.7.0.4



