Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 77CE673B10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 10:56:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2015 03:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,487,1432623600"; d="scan'208";a="765568296"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2015 03:56:35 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2015 13:56:43 +0300
Message-Id: <b898b9addec522a9834a53dfd6a699b65665669a.1437043973.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1437043973.git.cristian.iorga@intel.com>
References: <cover.1437043973.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1437043973.git.cristian.iorga@intel.com>
References: <cover.1437043973.git.cristian.iorga@intel.com>
Subject: [PATCH v3 1/3] qemu: upgrade to 2.4.0-rc0
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
X-List-Received-Date: Thu, 16 Jul 2015 10:56:38 -0000

- Get rid of direct use of gnutls APIs in quorum
blockdrv in favour of using the crypto APIs.
- Convert VNC websockets to use crypto APIs.
- qurum and vnc-ws packageconfig options no
longer exist, removed.
- All previous CVE are now included.
- larger_default_ram_size.patch patch removed,
no longer necessary.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  3 --
 .../qemu/qemu/larger_default_ram_size.patch        | 22 ---------------
 meta/recipes-devtools/qemu/qemu_2.3.0.bb           | 32 ----------------------
 meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb       | 22 +++++++++++++++
 4 files changed, 22 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/larger_default_ram_size.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu_2.3.0.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d794af9..eba7d3d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -15,7 +15,6 @@ QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
 SRC_URI = "\
     file://powerpc_rom.bin \
-    file://larger_default_ram_size.patch \
     file://disable-grabs.patch \
     file://exclude-some-arm-EABI-obsolete-syscalls.patch \
     file://wacom.patch \
@@ -89,9 +88,7 @@ PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap a
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
 PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen,xen-libxenstore xen-libxenctrl xen-libxenguest"
-PACKAGECONFIG[quorum] = "--enable-quorum, --disable-quorum, gnutls,"
 PACKAGECONFIG[vnc-tls] = "--enable-vnc --enable-vnc-tls,--disable-vnc-tls, gnutls,"
-PACKAGECONFIG[vnc-ws] = "--enable-vnc --enable-vnc-ws,--disable-vnc-ws, gnutls,"
 PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
 PACKAGECONFIG[vnc-jpeg] = "--enable-vnc --enable-vnc-jpeg,--disable-vnc-jpeg,jpeg,"
 PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng,"
diff --git a/meta/recipes-devtools/qemu/qemu/larger_default_ram_size.patch b/meta/recipes-devtools/qemu/qemu/larger_default_ram_size.patch
deleted file mode 100644
index 711c360..0000000
--- a/meta/recipes-devtools/qemu/qemu/larger_default_ram_size.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-This patch is taken from debian. 128M is too less sometimes if distro
-with lot of packages is booted so this patch raises the default to 384M
-
-It has not been applied to upstream qemu
-
-Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: qemu-0.14.0/vl.c
-===================================================================
---- qemu-0.14.0.orig/vl.c
-+++ qemu-0.14.0/vl.c
-@@ -168,7 +168,7 @@ int main(int argc, char **argv)
- //#define DEBUG_NET
- //#define DEBUG_SLIRP
- 
--#define DEFAULT_RAM_SIZE 128
-+#define DEFAULT_RAM_SIZE 384
- 
- #define MAX_VIRTIO_CONSOLES 1
- 
diff --git a/meta/recipes-devtools/qemu/qemu_2.3.0.bb b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
deleted file mode 100644
index cae0ad1..0000000
--- a/meta/recipes-devtools/qemu/qemu_2.3.0.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-require qemu.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
-
-SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
-            file://qemu-enlarge-env-entry-size.patch \
-            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
-            file://qemu-CVE-2015-3456.patch \
-            file://01-xen-properly-gate-host-writes-of-modified-PCI-CFG-contents-CVE-2015-4103.patch \
-            file://02-xen-dont-allow-guest-to-control-MSI-mask-register-CVE-2015-4104.patch \
-            file://03-xen-MSI-X-limit-error-messages-CVE-2015-4105.patch \
-            file://04-xen-MSI-dont-open-code-pass-through-of-enable-bit-mod-CVE-2015-4106.patch \
-            file://05-xen-pt-consolidate-PM-capability-emu_mask-CVE-2015-4106.patch \
-            file://06-xen-pt-correctly-handle-PM-status-bit-CVE-2015-4106.patch \
-            file://07-xen-pt-split-out-calculation-of-throughable-mask-CVE-2015-4106.patch \
-            file://08-xen-pt-mark-all-PCIe-capability-bits-read-only-CVE-2015-4106.patch \
-            file://09-xen-pt-mark-reserved-bits-in-PCI-config-space-fields-CVE-2015-4106.patch \
-            file://10-xen-pt-add-a-few-PCI-config-space-field-descriptions-CVE-2015-4106.patch \
-            file://11-xen-pt-unknown-PCI-config-space-fields-should-be-readonly-CVE-2015-4106.patch \
-            file://qemu-fix-CVE-2015-3209.patch \
-           "
-SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "2fab3ea4460de9b57192e5b8b311f221"
-SRC_URI[sha256sum] = "b6bab7f763d5be73e7cb5ee7d4c8365b7a8df2972c52fa5ded18893bd8281588"
-
-COMPATIBLE_HOST_class-target_mips64 = "null"
-
-do_install_append() {
-    # Prevent QA warnings about installed ${localstatedir}/run
-    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
-}
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb
new file mode 100644
index 0000000..c4505ba
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb
@@ -0,0 +1,22 @@
+require qemu.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
+                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
+
+SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
+            file://qemu-enlarge-env-entry-size.patch \
+            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
+           "
+SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BPN}-${REALPV}.tar.bz2"
+SRC_URI[md5sum] = "0c890db3811f2ad9cc7bb2a5afe08e4c"
+SRC_URI[sha256sum] = "8dda3e0f9baffbe29b524c03fd46d611afed1dfb5da1becec033beaf76a1bc6d"
+S="${WORKDIR}/${BPN}-${REALPV}"
+REALPV = "2.4.0-rc0"
+PV = "2.3.0+${REALPV}"
+
+COMPATIBLE_HOST_class-target_mips64 = "null"
+
+do_install_append() {
+    # Prevent QA warnings about installed ${localstatedir}/run
+    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
+}
-- 
2.1.4


