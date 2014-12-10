Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4FF72544
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:34:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAYFGk005444
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:34:15 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:34:15 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 05:34:04 -0500
Message-ID: <770919cf36256c60ea96fe9f270de655997dc678.1418207154.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418207154.git.bruce.ashfield@windriver.com>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] kerneldev: create kernel-devsrc packaging
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
X-List-Received-Date: Wed, 10 Dec 2014 10:34:16 -0000
Content-Type: text/plain

kernel-devsrc is responsible for creating and a packaging an environment
appropriate for kernel development (on or off target).

To create this support, we only need to copy/install the results of the
virtual/kernel providers build in the staging dir ... with some minor
manipulations to the source tree (.git removal and a clean up). This
produces a source tree that is capable of rebuilding the kernel on the
target.

Installing the kernel-devsrc package on a target (along with a
toolchain) is all that remains to be done.

 $ cd /usr/src/kernel
 $ make oldconfig
 $ make -j2 bzImage

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 50 ++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/kernel-devsrc.bb

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
new file mode 100644
index 000000000000..facc235e2d0e
--- /dev/null
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -0,0 +1,50 @@
+SUMMARY = "Linux kernel Development Source"
+DESCRIPTION = "Development source linux kernel. When built, this recipe packages the \
+source of the preferred virtual/kernel provider and makes it available for full kernel \
+development or external module builds"
+
+SECTION = "kernel"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+inherit linux-kernel-base
+
+# We need the kernel to be staged (unpacked, patched and configured) before
+# we can grab the source and make the kernel-devsrc package
+do_install[depends] += "virtual/kernel:do_populate_sysroot"
+
+# There's nothing to do here, except install the source where we can package it
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_populate_sysroot[noexec] = "1"
+
+# Define where the kernel headers are installed on the target as well as where
+# they are staged.
+KERNEL_SRC_PATH = "/usr/src/kernel"
+S = "${STAGING_DIR_TARGET}/${KERNEL_SRC_PATH}"
+
+KERNEL_VERSION = "${@get_kernelversion_headers('${S}')}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_install() {
+        kerneldir=${D}${KERNEL_SRC_PATH}
+        install -d $kerneldir
+
+        #
+        # Copy the staging dir source (and module build support) into the devsrc structure.
+        # We can keep this copy simple and take everything, since a we'll clean up any build
+        # artifacts afterwards, and the extra i/o is not significant
+        #
+        cd ${S}
+        find . -type d -name '.git*' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
+        oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts
+}
+
+PACKAGES = "kernel-devsrc"
+FILES_${PN} = "${KERNEL_SRC_PATH}"
+RDEPENDS_${PN} = "bc"
-- 
2.1.0


