Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 85FEE612E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 11:05:57 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id 78so1328357lfq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 04:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GVoyTT+Nwqrq00W+iAqXqaRJ9DRMtjUfubt58fQriSg=;
	b=oi6KQWe1OQinX4dBUKZYT+9NITbwdRepmMH2Cz9+skksSPtKn9Apo5GotRIxQagfJ+
	z2siSZwTScYkEBKecNeWrjdMNiOatXZYpCfwXgZuLivxKrY8VdKfgUFJRd624rNAzKpD
	fl6U5sPAKG+VEXMvggxxPpC1zXvgEQmQAeH62y69/zFd6MOsXq4q83jhUFdVJZrnctuV
	tQguELsWXDevhC8qKJXLeBXO2GAE+1gAw5bCDyCgMUBza6XutVA7Eb4j9Qc0B0Gw69lY
	D5Az9e3AUeG5vAZ4DmSXq5ZajXp9aupp0PVw3zfigUQbkRv+b70ufva1kzEaEtfzy6Ky
	jdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GVoyTT+Nwqrq00W+iAqXqaRJ9DRMtjUfubt58fQriSg=;
	b=ZlsSawzL/h49inaifZgGBhb3yhjnbiAJMu4I+74HLufq4wsN2iOvoWGRoTC6AcGEMm
	LT35PxJBpYmKFJ9cTV5zzLj64CUuR06Ewx19R/ioW2gZODECAXGDobPKpqdBgU3EZ8ji
	PpzcaPkzq+mDuqJa27URdJPkq6Be+Oj5WgyoBwV23RUu71wf4H3cpVpErJIQq9Ebhivq
	jUTVlynYyHkFfXM7NJ9gWBL28z8CsIYDKYDvbTllCO+nMvApFtEQgoewo5yApTbYb0dV
	EBqd6aNA2yDfaNIdU3Z9zVyHY65YW+RxgVHrYgc+kr1H5R95a9pEi/8DopoQCXqGbEqA
	tucQ==
X-Gm-Message-State: AOPr4FU+LUKwTdxnuIZ24YQfKLQh7BlVQizaKf5KvADtU0lpRZ9JC4NKig4zL8vP3XywVA==
X-Received: by 10.25.84.9 with SMTP id i9mr4495734lfb.56.1463655956561;
	Thu, 19 May 2016 04:05:56 -0700 (PDT)
Received: from localhost.localdomain (m77-218-254-80.cust.tele2.se.
	[77.218.254.80]) by smtp.gmail.com with ESMTPSA id
	a131sm2292714lfe.1.2016.05.19.04.05.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 May 2016 04:05:55 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 13:05:50 +0200
Message-Id: <1463655950-8029-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] kernel: moves KERNEL_SRC_PATH to bitbake.conf
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
X-List-Received-Date: Thu, 19 May 2016 11:05:57 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

"/usr/src/kernel" is being hard-coded in multiple recipes so far, move its
definition to bitbake.conf.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/kernel.bbclass                              | 4 ----
 meta/conf/bitbake.conf                                   | 4 ++++
 meta/recipes-core/images/build-appliance-image_14.0.0.bb | 2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb               | 3 ---
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6e3e81e..963f327 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -121,10 +121,6 @@ EXTRA_OEMAKE = ""
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
-# Define where the kernel headers are installed on the target as well as where
-# they are staged.
-KERNEL_SRC_PATH = "/usr/src/kernel"
-
 copy_initramfs() {
 	echo "Copying initramfs into ./usr ..."
 	# In case the directory is not created yet from the first pass compile:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 382dadc..8a84e53 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -407,6 +407,10 @@ OLDEST_KERNEL = "3.2.0"
 OLDEST_KERNEL_aarch64 = "3.14"
 OLDEST_KERNEL_nios2 = "3.19"
 
+# Define where the kernel headers are installed on the target as well as where
+# they are staged.
+KERNEL_SRC_PATH = "/usr/src/kernel"
+
 STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
 STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
 
diff --git a/meta/recipes-core/images/build-appliance-image_14.0.0.bb b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
index 569fb3a..2a1a56b 100644
--- a/meta/recipes-core/images/build-appliance-image_14.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
@@ -54,7 +54,7 @@ fakeroot do_populate_poky_src () {
 	cp ${WORKDIR}/README_VirtualBox_Guest_Additions.txt ${IMAGE_ROOTFS}/home/builder/
 
 	# Create a symlink, needed for out-of-tree kernel modules build
-	ln -snr ${IMAGE_ROOTFS}/usr/src/kernel ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
+	ln -snr ${IMAGE_ROOTFS}${KERNEL_SRC_PATH} ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
 
 	echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 196c8c7..0fdd0ad 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -28,9 +28,6 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_populate_sysroot[noexec] = "1"
 
-# Define where the kernel headers are installed on the target as well as where
-# they are staged.
-KERNEL_SRC_PATH = "/usr/src/kernel"
 S = "${STAGING_KERNEL_DIR}"
 B = "${STAGING_KERNEL_BUILDDIR}"
 
-- 
1.9.1


