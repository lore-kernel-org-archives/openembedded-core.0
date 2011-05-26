Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPhuB-0008Ho-Dj
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 23:15:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2011 14:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,276,1304319600"; 
   d="scan'208";a="9581635"
Received: from doubt.jf.intel.com (HELO localhost) ([10.24.80.114])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2011 14:12:34 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 14:12:49 -0700
Message-Id: <e5f5d48165bcb5dc3ccf160a29e16ca700f85395.1306444161.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1306444161.git.dvhart@linux.intel.com>
References: <cover.1306444161.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Thu, 26 May 2011 21:15:44 -0000

oe-core does not define any machines, so it does not make sense to
add machine specific information in the oe-core u-boot recipe and
infrastructure. Also note that COMPATIBLE_MACHINES is not easily extended due to
its regex syntax: "(machine_a|machine_b)", making it difficult to extend the
u-boot recipe in bbappend files without resorting to machine specific overrides.

Remove COMPATIBLE_MACHINES and the default UBOOT_MACHINE from the recipe and
insert some anonymous python into u-boot.inc to raise SkipPackage if
UBOOT_MACHINE is not set (this ensures 'world' still works for machines that
can't build u-boot).

UBOOT_MACHINE must now be specified in each machine config that requires u-boot.
This is an improvement over requiring machine specific overrides in every BSP
layer's u-boot_git.bbappend file. For example, a beagleboard machine config
currently contains:

UBOOT_ENTRYPOINT = "0x80008000"
UBOOT_LOADADDRESS = "0x80008000"

With this change, it must now contain:

UBOOT_MACHINE = "omap3_beagle_config"
UBOOT_ENTRYPOINT = "0x80008000"
UBOOT_LOADADDRESS = "0x80008000"

So long as the SRC_URI in the base recipe can build a working u-boot for a given
machine, there is no need to create a u-boot_git.bbappend file. If additional
patches are deemed necessary, a BSP layer creates a u-boot_git.bbappend file and
extends the SRC_URI to include general or machine specific backports.

Note: I used bb.note() instead of bb.debug() to ensure the message at least
      makes it to the console. From what I could gather, bb.debug() doesn't
      go anywhere during recipe parsing.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Jason Kridner <jkridner@beagleboard.org>
Cc: Chris Larson <clarson@kergoth.com>
---
 meta/recipes-bsp/uboot/u-boot.inc    |   10 +++++++++-
 meta/recipes-bsp/uboot/u-boot_git.bb |   11 ++++++-----
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/uboot/u-boot.inc b/meta/recipes-bsp/uboot/u-boot.inc
index 058e3ba..3ffec21 100644
--- a/meta/recipes-bsp/uboot/u-boot.inc
+++ b/meta/recipes-bsp/uboot/u-boot.inc
@@ -11,7 +11,15 @@ PARALLEL_MAKE=""
 # GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS
 EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS='-O2'"
 
-UBOOT_MACHINE ?= "${MACHINE}_config"
+python () {
+	if not d.getVar("UBOOT_MACHINE", True):
+		PN = d.getVar("PN", True)
+		FILE = os.path.basename(d.getVar("FILE", True))
+		bb.note("To build %s, see %s for instructions on setting up \
+			 your machine config" % (PN, FILE))
+		raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")
+}
+
 UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
 UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
 UBOOT_MAKE_TARGET ?= "all"
diff --git a/meta/recipes-bsp/uboot/u-boot_git.bb b/meta/recipes-bsp/uboot/u-boot_git.bb
index 4c8f5df..0fbb9ba 100644
--- a/meta/recipes-bsp/uboot/u-boot_git.bb
+++ b/meta/recipes-bsp/uboot/u-boot_git.bb
@@ -1,5 +1,11 @@
 require u-boot.inc
 
+# To build u-boot for your machine, provide the following lines in your machine
+# config, replacing the assignments as appropriate for your machine.
+# UBOOT_MACHINE = "omap3_beagle_config"
+# UBOOT_ENTRYPOINT = "0x80008000"
+# UBOOT_LOADADDRESS = "0x80008000"
+
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
                     file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
@@ -12,11 +18,6 @@ PR="r3"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
-UBOOT_MACHINE_beagleboard = "omap3_beagle_config"
-UBOOT_MACHINE_overo = "omap3_overo_config"
-
 S = "${WORKDIR}/git"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-COMPATIBLE_MACHINE = "(beagleboard|overo)"
-- 
1.7.1



