Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVI-0001SZ-PD
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="640479325"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2011 22:26:21 -0700
Message-Id: <8923f3688a9c7fd02e3ff26355abb07474c4b821.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Mon, 2 May 2011 19:09:15 +0000
Date: Mon, 09 May 2011 22:26:20 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 15/30] syslinux: improve packaging
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
X-List-Received-Date: Tue, 10 May 2011 05:29:06 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Usually only parts of syslinux are used by products and thus syslinux
can be greatly reduced in size. This changes does it as:

 - syslinux: syslinux binary
 - syslinux-extlinux: extlinux binary
 - syslinux-mbr: mbr.bin
 - syslinux-chain: chain.c32
 - syslinux-pxelinux: pxelinux.0
 - syslinux-isolinux: isolinux.bin

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/syslinux/syslinux_4.03.bb |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_4.03.bb b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
index 05bcb21..dc0785e 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/syslinux-${PV}.tar.bz2 \
            file://cross-build.patch"
@@ -46,4 +46,14 @@ do_install() {
 	install -m 644 ${S}/core/ldlinux.bss ${D}${libdir}/syslinux/
 }
 
+PACKAGES =+ "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux"
+
+FILES_${PN} = "${bindir}/syslinux"
+FILES_${PN}-extlinux = "${sbindir}/extlinux"
+FILES_${PN}-mbr = "${libdir}/${PN}/mbr.bin"
+FILES_${PN}-chain = "${libdir}/${PN}/chain.c32"
+FILES_${PN}-isolinux = "${libdir}/${PN}/isolinux.bin"
+FILES_${PN}-pxelinux = "${libdir}/${PN}/pxelinux.0"
+FILES_${PN}-dev += "${datadir}/${PN}/com32"
+
 BBCLASSEXTEND = "native"
-- 
1.7.1.1



