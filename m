Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9ECC8757A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 20:39:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2015 13:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,603,1432623600"; d="scan'208";a="741410595"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 03 Aug 2015 13:39:31 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Mon,  3 Aug 2015 13:35:27 -0700
Message-Id: <1438634128-4347-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
Cc: richard.purdie@intel.com
Subject: [PATCH 1/2] kernel-headers: linux kernel headers
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
X-List-Received-Date: Mon, 03 Aug 2015 20:39:48 -0000

Header files and scripts for building modules for Linux kernel.

A set of files is needed to allow building new Linux kernel modules
against an already installed Linux kernel. The files include various
header files, script files, Makefiles, source code files for several
utility programs and Linux kerenl .config file.

The files may be needed by programs such as:
    dkms, nvidia-304xx-dkms, virtualbox, acpi_call, audit,
    bbswitch, ipsec-tools, nvidia-304xx, nvidia-340xx, openssh,
    r8168, rt3562sta, sysprof, tp_smapi, vhba-module, kmod, ...

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-kernel/linux/kernel-headers.bb | 66 +++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/kernel-headers.bb

diff --git a/meta/recipes-kernel/linux/kernel-headers.bb b/meta/recipes-kernel/linux/kernel-headers.bb
new file mode 100644
index 0000000..4be5153
--- /dev/null
+++ b/meta/recipes-kernel/linux/kernel-headers.bb
@@ -0,0 +1,66 @@
+SUMMARY = "Linux kernel headers"
+DESCRIPTION = "Files needed to allow building Linux kernel modules against the installed Linux kernel."
+
+SECTION = "kernel"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+inherit module-base linux-kernel-base
+
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+
+# Install the files once the kernel is done with them.
+do_install[depends] += "virtual/kernel:do_compile"
+do_install[depends] += "virtual/kernel:do_populate_sysroot"
+
+# Only install is needed
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_populate_sysroot[noexec] = "1"
+
+S = "${STAGING_KERNEL_DIR}"
+
+do_install() {
+        kerneldir=${D}/lib/modules/${KERNEL_VERSION}/build
+        install -d $kerneldir
+
+        cp -a  ${STAGING_KERNEL_BUILDDIR}/.config $kerneldir
+        cp -aR ${STAGING_KERNEL_BUILDDIR}/include $kerneldir
+        cp -aR ${STAGING_KERNEL_BUILDDIR}/arch $kerneldir
+
+        cd ${S}
+
+        rsync -avm \
+        --include="*/" \
+        --include="Makefile*" \
+        --include="Kconfig*" \
+        --include="Kbuild*" \
+        --include="Module.symvers" \
+        --include=".config" \
+        --include="*.h" \
+        --exclude="*" \
+        . $kerneldir
+
+        rsync -avm \
+        --exclude="*.o"  \
+        --exclude=".debug" \
+        ./scripts $kerneldir
+
+        # As of Linux kernel version 3.0.1, the clean target removes
+        # arch/powerpc/lib/crtsavres.o which is present in
+        # KBUILD_LDFLAGS_MODULE, making it required to build external modules.
+        if [ ${ARCH} = "powerpc" ]; then
+                mkdir -p $kerneldir/arch/powerpc/lib/
+                cp ${B}/arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
+        fi
+}
+
+PACKAGES = "${PN}"
+FILES_${PN} = "/lib/modules/${KERNEL_VERSION}/build/"
+RDEPENDS_${PN} = "python bash gawk perl"
+
-- 
1.9.1


