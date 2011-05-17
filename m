Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QMTI3-0008M1-4A
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 01:03:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 May 2011 16:00:03 -0700
X-ExtLoop1: 1
Received: from doubt.jf.intel.com (HELO [10.7.199.57]) ([10.7.199.57])
	by orsmga002.jf.intel.com with ESMTP; 17 May 2011 16:00:03 -0700
Message-ID: <4DD2FE07.4030708@linux.intel.com>
Date: Tue, 17 May 2011 16:00:23 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC PATCH] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Tue, 17 May 2011 23:03:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

oe-core does not define any machines, so it does not make sense to
add machine specific information in the oe-core u-boot recipe and
infrastructure.

Since every machine wishing to use the u-boot recipe would need to add itself to
COMPATIBLE_MACHINES, typically via a bbappend recipe, the mechanism loses any
utility it may have had and unecessarily complicates using the u-boot recipe. By
removing it, we simplify the task of adding support for new machines.

With these two variables removed from the base recipe, UBOOT_MACHINE must now be
specified in each machine config that requires u-boot. This is already the case
for UBOOT_ENTRYPOINT and UBOOT_LOADADDRESS, so the change is minimal. For
example, a beagleboard machine config currently contains:

UBOOT_ENTRYPOINT = "0x80008000"
UBOOT_LOADADDRESS = "0x80008000"

With this change, it must now contain:

UBOOT_MACHINE = "omap3_beagle_config"
UBOOT_ENTRYPOINT = "0x80008000"
UBOOT_LOADADDRESS = "0x80008000"

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-bsp/uboot/u-boot_git.bb |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/uboot/u-boot_git.bb b/meta/recipes-bsp/uboot/u-boot_git.bb
index c5583ff..1fa0da2 100644
--- a/meta/recipes-bsp/uboot/u-boot_git.bb
+++ b/meta/recipes-bsp/uboot/u-boot_git.bb
@@ -1,5 +1,9 @@
 require u-boot.inc
 
+# To build u-boot for your machine, provide the following lines in your machine
+# config, replacing "omap3_beagle" with the appropriate value for your machine.
+# UBOOT_MACHINE = "omap3_beagle_config"
+
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
                     file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
@@ -12,11 +16,6 @@ PR="r3"
 
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
-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


