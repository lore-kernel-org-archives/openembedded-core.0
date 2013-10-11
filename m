Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 760CE6D083
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:33 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506457"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:24 -0700
Message-Id: <4db65494d5e3a88cd1eb500f970b7d893a3685d7.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 18/18] kmod: Update to Rev 15 via git
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:34 -0000

Also nail down a previously floating dependancy on zlib, which is required for ptest

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/kmod/kmod-native_git.bb |  3 +--
 meta/recipes-kernel/kmod/kmod.inc           | 12 ++++++------
 meta/recipes-kernel/kmod/kmod_git.bb        |  6 +++---
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
index d008cbf..fccc39b 100644
--- a/meta/recipes-kernel/kmod/kmod-native_git.bb
+++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
@@ -4,8 +4,7 @@
 require kmod.inc
 inherit native
 
-SRC_URI += "file://fix-undefined-O_CLOEXEC.patch \
-            file://0001-Fix-build-with-older-gcc-4.6.patch \
+SRC_URI += "file://0001-Fix-build-with-older-gcc-4.6.patch \
             file://Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch \
            "
 
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 880a53a..8a18547 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -8,13 +8,17 @@ LICENSE = "GPL-2.0+ & LGPL-2.1+"
 LICENSE_libkmod = "LGPL-2.1+"
 SECTION = "base"
 
-DEPENDS += "pkgconfig-native"
+DEPENDS += "pkgconfig-native zlib"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools gtk-doc ptest
 
+SRCREV = "18811d22e9923893555b88a482aa967db0e7892a"
+# Lookout for PV bump too when SRCREV is changed
+PV = "15+git${SRCPV}"
+
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
            file://run-ptest \
@@ -23,14 +27,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://fix-seperatebuilddir.patch \
           "
 
-SRCREV = "3b38c7fcb58be4ddc34f90454c5f5dc3693d2d85"
-# Lookout for PV bump too when SRCREV is changed
-PV = "14"
-
 S = "${WORKDIR}/git"
 
 EXTRA_AUTORECONF += "--install --symlink"
-EXTRA_OECONF +="--enable-debug --enable-logging --enable-tools --disable-manpages"
+EXTRA_OECONF +="--enable-debug --enable-logging --enable-tools --disable-manpages --with-zlib"
 
 do_configure_prepend () {
         gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/docs/gtk-doc.make
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index ebecbcc..f90b9aa 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -3,8 +3,6 @@
 
 require kmod.inc
 
-PV_append = "+git${SRCPV}"
-
 PROVIDES += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 RCONFLICTS_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
@@ -34,6 +32,7 @@ do_install_append () {
 
         # install depmod.d file for search/ dir
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
+
 }
 
 do_compile_prepend() {
@@ -64,7 +63,8 @@ ALTERNATIVE_TARGET[lsmod] = "${base_bindir}/lsmod.${BPN}"
 
 ALTERNATIVE_LINK_NAME[depmod] = "${base_sbindir}/depmod"
 
-PACKAGES =+ "libkmod"
+PACKAGES =+ "libkmod ${PN}-bash-completion"
 
 FILES_libkmod = "${base_libdir}/libkmod*${SOLIBS} ${libdir}/libkmod*${SOLIBS}"
 FILES_${PN} += "${base_libdir}/depmod.d ${base_libdir}/modprobe.d"
+FILES_${PN}-bash-completion = "${datadir}/bash-completion"
-- 
1.8.3.1


