Return-Path: <jsbronder@cold-front.org>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id C257778690
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:41:35 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id B447920D2B;
	Tue, 20 Feb 2018 11:41:35 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Tue, 20 Feb 2018 11:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=pbZTAVuQLG3KGPcA/z+BwhaQEJ+gNX9/o5bJu2
	IMJzg=; b=mESk+q4KYOwU24Elf4GA9P85LAfR+J0iecJCjiReMTS98mwVt9hspM
	vS0o0FMDcp6ofjb2eY/KyYDJFZYhjUWzjfpxM5RCLOmYCJ6AJjFi0L3o7rMr9q1A
	cC6xMKFMGoYfH/AumtaXN22NQ0k3Ksc1DedLyzjhs9NfkjWduqeFg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pbZTAVuQLG3KGPcA/
	z+BwhaQEJ+gNX9/o5bJu2IMJzg=; b=Ij9v+qna9D4B74cN9ndai1QEaxTpu9KcM
	RQWXI7VdyadQVRO2X2k3irKQ4jQvHi2hPJR+XcaUsrqQZDnlmTl9TqVq2NBiA28y
	2zPNrhUca/IKqrMx3K8FQHD0MIE6vIjWT1dfckiqupyRp2sNNhUreR5h5qK9AVBb
	bOBHjwTswdgD8OtQYsi7LxX4PEU4aQ1zhm/i44NM7GK/LxSn35LcxJ8J51pqAK/V
	GzO4NqMFoOxyauk9aDH2Tlw9T4wNw4a0y7mhm3zZfJrVoYQZnW99j2ULjPDLIpih
	FIJGE55FbpYq0ftSb1NqdOZaWRBJX/XVYccMCcNR7dUYMY+29LejA==
X-ME-Sender: <xms:v0-MWom37d9-00ZFJhrQrQJ7KIbSFw-7Pii6B-qVAkD6cToaTt2emw>
Received: from localhost (c-24-60-203-86.hsd1.ma.comcast.net [24.60.203.86])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5A83E246D0;
	Tue, 20 Feb 2018 11:41:35 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 11:41:26 -0500
Message-Id: <20180220164126.13123-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] kernel: module: module-base: depend on elfutils-native
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
X-List-Received-Date: Tue, 20 Feb 2018 16:41:36 -0000

libelf is required for CONFIG_STACK_VALIDATION which is required by
CONFIG_UNWINDER_ORC (the default in 4.14+).

We also need to update the module classes to pass HOSTCC and HOSTCPP
just like the kernel class already does.  Otherwise the test for libelf
in the kernel Makefile fails.
---
 meta/classes/kernel.bbclass      | 2 +-
 meta/classes/module-base.bbclass | 1 +
 meta/classes/module.bbclass      | 4 +++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5cdff581ef..d3a7e1e1cb 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -4,7 +4,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
-DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
+DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native elfutils-native"
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
 do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index f851b85163..3b56e04534 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -23,5 +23,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 do_make_scripts() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
 	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+	           HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" \
 	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
 }
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 78d1b21dbd..89dee2dae8 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,10 +1,12 @@
 inherit module-base kernel-module-split pkgconfig
 
+DEPENDS += "elfutils-native"
+
 addtask make_scripts after do_prepare_recipe_sysroot before do_configure
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
 
-EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
+EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR} HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 
 MODULES_INSTALL_TARGET ?= "modules_install"
 MODULES_MODULE_SYMVERS_LOCATION ?= ""
-- 
2.13.6


