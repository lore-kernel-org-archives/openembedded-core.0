Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0786B5EE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010176"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:30 +0000
Message-Id: <95e1c976679c83b5556a4858e5faeccbb87102ee.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 34/38] pciutils: tidy up recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Dec 2013 22:30:33 -0000

* Move package-specific defitions to the end
* Define pciutils-ids package as ${PN}-ids
* Add SUMMARY and tweak DESCRIPTION for pciutils-ids package

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.2.1.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb b/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb
index 6d45d72..852a93e 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb
@@ -1,14 +1,12 @@
-SUMMARY = "PCI Utilities"
+SUMMARY = "PCI utilities"
 DESCRIPTION = 'The PCI Utilities package contains a library for portable access \
 to PCI bus configuration space and several utilities based on this library.'
-DESCRIPTION_pciutils-ids = 'The list of PCI IDs for pciutils'
 HOMEPAGE = "http://atrey.karlin.mff.cuni.cz/~mj/pciutils.shtml"
 SECTION = "console/utils"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "zlib kmod"
-RDEPENDS_${PN} = "${PN}-ids"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
            file://configure.patch \
@@ -53,9 +51,12 @@ do_install () {
 	ln -s ../sbin/lspci ${D}${bindir}/lspci
 }
 
-PACKAGES =+ "pciutils-ids libpci libpci-dev libpci-dbg"
-FILES_pciutils-ids = "${datadir}/pci.ids*"
+PACKAGES =+ "${PN}-ids libpci libpci-dev libpci-dbg"
+FILES_${PN}-ids = "${datadir}/pci.ids*"
 FILES_libpci = "${libdir}/libpci.so.*"
 FILES_libpci-dbg = "${libdir}/.debug"
 FILES_libpci-dev = "${libdir}/libpci.a ${libdir}/libpci.la ${libdir}/libpci.so \
                     ${includedir}/pci ${libdir}/pkgconfig"
+SUMMARY_${PN}-ids = "PCI utilities - device ID database"
+DESCRIPTION_${PN}-ids = "Package providing the PCI device ID database for pciutils."
+RDEPENDS_${PN} += "${PN}-ids"
-- 
1.8.1.2


