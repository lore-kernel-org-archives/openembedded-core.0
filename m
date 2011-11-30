Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVoMg-0005vH-Fh
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 18:54:38 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2011 09:47:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,597,1315206000"; d="scan'208";a="42580070"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Nov 2011 09:47:56 -0800
From: Darren Hart <darren@dvhart.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	Josef Ahmad <josef.ahmad@intel.com>, Joshua Lock <josh@linux.intel.com,
	Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:47:53 -0800
Message-Id: <adc1fd7a25a8bbcb5b51899adc5685ead8b27c09.1322674459.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322674459.git.darren@dvhart.com>
References: <cover.1322674459.git.darren@dvhart.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/5] grub-efi-native: New recipe to build GRUB EFI images
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
X-List-Received-Date: Wed, 30 Nov 2011 17:54:38 -0000

From: Darren Hart <dvhart@linux.intel.com>

Add a recipe to build the GRUB efi images. This recipe is written as
a native recipe as the resulting GRUB utils are required to assemble
the final image. Rather than build a native and a target recipe (and
increase build times), this recipe builds the utils for the host and
passes an appropriate --target argument to the GRUB configure script
to build the modules for the target arch. The only output of this
recipe is an EFI image in the deploy directory.

Care is taken to ensure changing targets will force a rebuild of this
native recipe by including the target arch in the PN.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb |   74 +++++++++++++++++++++++++
 1 files changed, 74 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-efi-native_1.99.bb

diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
new file mode 100644
index 0000000..3c52ec9
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
@@ -0,0 +1,74 @@
+SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
+
+DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
+intended to unify bootloading across x86 operating systems. In \
+addition to loading the Linux kernel, it implements the Multiboot \
+standard, which allows for flexible loading of multiple boot images. \
+This recipe builds an EFI binary for the target. It does not install \
+or package anything, it only deploys a target-arch GRUB EFI image."
+
+HOMEPAGE = "http://www.gnu.org/software/grub/"
+SECTION = "bootloaders"
+PRIORITY = "optional"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+# FIXME: We should be able to optionally drop freetype as a dependency
+DEPENDS = "help2man-native"
+RDEPENDS_${PN} = "diffutils freetype"
+PR = "r1"
+
+# Native packages do not normally rebuild when the target changes.
+# Ensure this is built once per HOST-TARGET pair.
+PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
+
+SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
+SRC_URI[sha256sum] = "b91f420f2c51f6155e088e34ff99bea09cc1fb89585cf7c0179644e57abd28ff"
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
+
+S = "${WORKDIR}/grub-${PV}"
+
+# Determine the target arch for the grub modules before the native class
+# clobbers TARGET_ARCH.
+ORIG_TARGET_ARCH := ${TARGET_ARCH}
+python __anonymous () {
+    import re
+    target = d.getVar('ORIG_TARGET_ARCH', True)
+    if target == "x86_64":
+        grubtarget = 'x86_64'
+        grubimage = "bootx64.efi"
+    elif re.match('i.86', target):
+        grubtarget = 'i386'
+        grubimage = "bootia32.efi"
+    else:
+        raise bb.parse.SkipPackage("grub-efi is incompatible with target %s" % target)
+    d.setVar("GRUB_TARGET", grubtarget)
+    d.setVar("GRUB_IMAGE", grubimage)
+}
+
+inherit autotools
+inherit gettext
+inherit native
+inherit deploy
+
+EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
+                --target=${GRUB_TARGET} --enable-efiemu=no --program-prefix=''"
+
+do_mkimage() {
+	./grub-mkimage -p / -d ./grub-core/ \
+		       -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
+	               boot linux fat serial part_msdos normal
+}
+addtask mkimage after do_compile before do_install
+
+do_deploy() {
+	install -m 644 ${S}/${GRUB_IMAGE} ${DEPLOYDIR}
+}
+addtask deploy after do_install before do_build
+
+do_install[noexec] = "1"
+do_populate_sysroot[noexec] = "1"
-- 
1.7.6.4



