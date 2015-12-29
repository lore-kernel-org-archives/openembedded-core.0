Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id DA32F60851
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 23:05:56 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id y184so218710774lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 15:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=J0HuPK+5jKj+3eGykFquXx5guUVkKxhny5RXPG9Acc4=;
	b=y6U6CFpfYrePwqWloqU72kD4q7St/eGlOeLU4igfFZXg2+xitCYW6/SyT6qTHr5K7u
	YnR6C+AVbvyeSOHchtrPlBec37Mhvj6aBp8H/WZdyKL34KaRSnrgu177bjqmIyN48DKX
	cBV+CHu6sxXj9vh7uDrUn5Sw8TrUNCKflROeVWX8iT4HkRAdzZRd8p7QbxOwpzYUBA1j
	aoTakmhv1oXBCQ5u+JhGZRlJPd9jlNLZnx10Lb9IL8143dwuJ6WuX0Dtt5/pxrixWsCM
	OSwhKJ1eE9wKUS3WzZ+tM2tKdhwV6t6kdTaEIsESB0GeziwBnUVq/wIDqOA4QBFO80e3
	z6pA==
X-Received: by 10.25.79.143 with SMTP id d137mr17661147lfb.110.1451430356664; 
	Tue, 29 Dec 2015 15:05:56 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	zm10sm11550870lbb.49.2015.12.29.15.05.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Dec 2015 15:05:56 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Dec 2015 00:05:28 +0100
Message-Id: <1451430328-29838-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1451430328-29838-1-git-send-email-liu.ming50@gmail.com>
References: <1451430328-29838-1-git-send-email-liu.ming50@gmail.com>
Cc: bruce.ashfield@windriver.com, yue.tao@windriver.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 2/2] kernel-initramfs: new recipe, creates initramfs bundled kernel packaging
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
X-List-Received-Date: Tue, 29 Dec 2015 23:05:59 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

So far, there is not a workable way to package the initramfs bundled kernel
image, the only place is tmp/deploy from where we could get it, but if a
user want to add it into a certain image, there is no guarantee that he
will achieve it because a explicit dependency is missing between package
and bundle_initramfs, and this was designed to avoid introducing circular
dependencies when using kernel modules in the initramfs image.bb that is
caused by kernel.bbclass trying to build the initramfs before the kernel
packaging.

To fix this problem, the idea is to split the initramfs bundled kernel
packaging to a new recipe, make the do_install depend on kernel's deploy
task, then with the following config:

IMAGE_INSTALL_append = "kernel-initramfs"

The initramfs bundled kernel could be added to the image without
introducing any circular dependencies.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-kernel/linux/kernel-initramfs.bb | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb

diff --git a/meta/recipes-kernel/linux/kernel-initramfs.bb b/meta/recipes-kernel/linux/kernel-initramfs.bb
new file mode 100644
index 0000000..481b142
--- /dev/null
+++ b/meta/recipes-kernel/linux/kernel-initramfs.bb
@@ -0,0 +1,50 @@
+SUMMARY = "Initramfs bundled kernel image"
+DESCRIPTION = "When built, it packages a initramfs bundled kernel image of the \
+preferred virtual/kernel provider."
+
+SECTION = "kernel"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+inherit linux-kernel-base
+
+# Whilst not a module, this ensures we don't get multilib extended (which would make no sense)
+inherit module-base
+
+S = "${STAGING_KERNEL_DIR}"
+B = "${WORKDIR}/build"
+
+KERNEL_VERSION = "${@get_kernelversion_headers('${S}')}"
+
+PACKAGES = "kernel-initramfs"
+FILES_${PN} = "/boot/${KERNEL_IMAGETYPE}*"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# Skip processing of this recipe if INITRAMFS_IMAGE or INITRAMFS_IMAGE_BUNDLE
+# is not set correctly, to avoid generate a single empty package which makes
+# no sense.
+python __anonymous () {
+    if not d.getVar('INITRAMFS_IMAGE', True) or d.getVar('INITRAMFS_IMAGE_BUNDLE', True) != '1':
+        raise bb.parse.SkipPackage("Set INITRAMFS_IMAGE and INITRAMFS_IMAGE_BUNDLE to enable it")
+}
+
+# Need the output of deploy.
+do_install[depends] += "virtual/kernel:do_deploy"
+
+# We only need the packaging tasks - disable the rest
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_populate_sysroot[noexec] = "1"
+
+do_install() {
+	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
+		echo "Copying initramfs bundled kernel image from ${DEPLOY_DIR_IMAGE}..."
+		install -d ${D}/boot
+		install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin ${D}/boot
+	fi
+}
-- 
1.9.1


