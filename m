Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9893074E95
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 15:04:58 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id s12-v6so21555660wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mTeoLX5SWe+KTyh1jRQ6gXQiBnKm+o9EBSZEc6X2kNU=;
	b=NfD7Kh7Yly0J8NkihfE+/hBm3NR0CqB4zODUKFj7kMN0lOUEguFApfVNzaduryeQqv
	U5HGar15TA1phqf2pX9dngo++V2KyA1szzTfdh//6t/Ip1nasu1xEafyn1Ag0HBLpdMl
	KpIwYt7ZdfVEL6mo09JdvZ3ukLcq0vk5BnkwPzKdF+3jKcPNKvfjuf2mkpGqdFV1S8QO
	ZfhzGD+Yde3cSDYDvPlJ9UdZ4IP4KzolMMRnixiaD1j1LuT6KvW4dYPQcm8ig5Ud/vBL
	/M9+c4ciiPpO+H2xKKnwGyNmRNt9mmTGt368w5gbQubrC9bQGzrtIVGLsAgFF/jcskML
	IH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mTeoLX5SWe+KTyh1jRQ6gXQiBnKm+o9EBSZEc6X2kNU=;
	b=OnAAt4PNehqEws273wqOfZpFAmTnWRTEN3i8Ty/caJbaKS1AcbTXa1Nzykxr2pnYfO
	1ioliM5Lz8LwLfOkYipPCVBJ138QbP6jMvre2A8aQ9ecpb5HBMp0SWnK2hcaI/iRx1uH
	RQOZ8y8D2R+GK1kcqeppZTyGsn5oXgMKhW43oZWpbeRbP+u5SWRfReDJxALNyWThNv8T
	l0xoRSV+v9hSilAudITaFMXPbrtYMS8tiUjd0QA2KfYmeNmpvoGoJeaa0rtrfzO5glWm
	/lGw1kmjoFYSvXv763a3LlhpmTK8K58+dM9ErlmCdGZ9CcqHNOfiCJHVjTkBFBNcE1UU
	MJWw==
X-Gm-Message-State: APt69E1GhqXSgas2RyM5hNSPcFYYH5kS7PNAUQ1z79rMZ/wbf/0qgqX8
	135oG76wPh5KvSo8cAG9FTzGEQ==
X-Google-Smtp-Source: AAOMgpcEi/0w/6Ctt6kgvzwCAuCX1zEgccxGinUZOarFnCeImo+pOOrw2WDTtocTcnsniVE1YaCzMw==
X-Received: by 2002:a1c:b6d6:: with SMTP id
	g205-v6mr13846645wmf.17.1531148699208; 
	Mon, 09 Jul 2018 08:04:59 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	72-v6sm13504780wmh.0.2018.07.09.08.04.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Jul 2018 08:04:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2018 15:05:00 +0000
Message-Id: <20180709150500.20233-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180709150500.20233-1-Martin.Jansa@gmail.com>
References: <20180709150416.GA1825@jama>
	<20180709150500.20233-1-Martin.Jansa@gmail.com>
Subject: [PATCHv4 4/4] kernel.bbclass: move variables for kernel artifacts names to separate bbclass
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
X-List-Received-Date: Mon, 09 Jul 2018 15:04:58 -0000

* this makes it easier to access these variables from some other bbclass
  e.g. sdcard_image-rpi.bbclass in meta-raspberry where we need to know
  how some files in deploy are named, but we cannot inherit kernel.bbclass
  as it's used in image recipe not kernel recipe
* alternatively we can move these to bitbake.conf like similar image variables are:
  meta/conf/bitbake.conf:IMAGE_BASENAME = "${PN}"
  meta/conf/bitbake.conf:IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
  meta/conf/bitbake.conf:IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-artifact-names.bbclass | 19 +++++++++++++++++++
 meta/classes/kernel.bbclass                | 18 +-----------------
 2 files changed, 20 insertions(+), 17 deletions(-)
 create mode 100644 meta/classes/kernel-artifact-names.bbclass

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
new file mode 100644
index 0000000000..d696888322
--- /dev/null
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -0,0 +1,19 @@
+KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+# Don't include the DATETIME variable in the sstate package signatures
+KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
+KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
+
+KERNEL_DTB_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+KERNEL_DTB_BASE_NAME[vardepsexclude] = "DATETIME"
+KERNEL_DTB_SYMLINK_NAME ?= "${MACHINE}"
+
+MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
+
+MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
+MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
+MODULE_TARBALL_DEPLOY ?= "1"
+
+INITRAMFS_BASE_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
+INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 0045cec819..42efa382ad 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -657,23 +657,7 @@ do_sizecheck[dirs] = "${B}"
 
 addtask sizecheck before do_install after do_strip
 
-KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-# Don't include the DATETIME variable in the sstate package signatures
-KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
-KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
-KERNEL_DTB_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-KERNEL_DTB_BASE_NAME[vardepsexclude] = "DATETIME"
-KERNEL_DTB_SYMLINK_NAME ?= "${MACHINE}"
-MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
-MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
-# Don't include the DATETIME variable in the sstate package signatures
-MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
-MODULE_TARBALL_DEPLOY ?= "1"
-
-INITRAMFS_BASE_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
-INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
+inherit kernel-artifact-names
 
 kernel_do_deploy() {
 	deployDir="${DEPLOYDIR}"
-- 
2.17.1


