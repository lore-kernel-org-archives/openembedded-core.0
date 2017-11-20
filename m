Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id EAEDE7869B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 20:11:24 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b189so21039275wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 12:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QU53PHL1Kuy90lozs84z25MvC1hteRNX+NfLKidoj5c=;
	b=clSO7hzM34zp3FXXNBihYM4uv6ga3Mw8YWagHPbDBzMpb2wdPXMNfvzFcmHw8S2KQ8
	+XjPL9BAhwAkgeOgREY3uLUYdgarQ0tb+VLzD2+K+heOynnS8PZRMBNjauXbpVc6R9qC
	Ib/LVlapbFKT4LW+91e/aiv7uAGzIgHZv0QvVNBB01XNpmHkJLala9wIq0JUu1DXLZ2D
	YzuMlebClDy8AHusK+SYBSyJ5qI864dZkgJhnCUIjmK77IFS6SoS23UY6a+WSyrnV8cd
	/449xhZhk6jgZaMSO+XYC0uE3jY2oeURkuBkyWNybvH/rq9PYh1mar0KMQguN40F0d7J
	wqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QU53PHL1Kuy90lozs84z25MvC1hteRNX+NfLKidoj5c=;
	b=HCX6MNf2BBofPfFsBGhaUgZ6L2kf+VUPhpILN2gmPqTuv6jNf5YUbBKeb/b91ZZ8Vp
	xyWMksGJ5TNoyEo6Qh4u97jO9vXH5m8V36Je+YDG8yPkbyWjsMYqf7R3wdArCtKCWtDg
	Fkql3DBxH07IBoJkRf6UniBo7jAORYR5m1O3W1wJuCUsqBrp22k9Lndk+3aWbrOCleap
	cpwzMQ7h8+c6xdxGGxRPfsxAh4x5nMCDLIrbpuF6mffLVOgJGVnwiUl1Djy+A0xzjl/m
	GQ4zcuti0OUqACz3B72Lwk8MkhtJL4cRjk+zpdn14Kpw2frYYDXyarWUucVrUuIEOYbz
	LHlA==
X-Gm-Message-State: AJaThX51Qx8s0YRGEMDJO3IEl38MZFN6fkHCrp8WFCeDyr1aSAUvnDIJ
	7T4KyRHxuu/wvtBdJfEyTxz69A==
X-Google-Smtp-Source: AGs4zMZk64DnYq95nOmiYVBrn/hs6Vd+NI5RGryDv0KK+VfkdCe3wpvVF2bhcOoJ7FlUKAX1SQ8JDQ==
X-Received: by 10.28.127.197 with SMTP id a188mr11504668wmd.138.1511208686003; 
	Mon, 20 Nov 2017 12:11:26 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b206sm5105522wme.11.2017.11.20.12.11.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Nov 2017 12:11:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 20:11:03 +0000
Message-Id: <a7940d54e6c96d5965d65b6407a8c002a3ff9339.1511207344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511207344.git.Martin.Jansa@gmail.com>
References: <cover.1511207344.git.Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 4/5] kernel.bbclass: use the consistent naming schema for initramfs
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
X-List-Received-Date: Mon, 20 Nov 2017 20:11:25 -0000

* use INITRAMFS_BASE_NAME and INITRAMFS_SYMLINK_NAME variables, like
  other kernel artifacts are using
* use "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}" instead of
  "${PV}-${PR}-${MACHINE}-${DATETIME}" to be consistent with other files
* allow to modify default symlink name with INITRAMFS_SYMLINK_NAME
  instead of currently used:
  initramfs_symlink_name=${type}-initramfs-${MACHINE}

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8752af7..9ec7dd2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -199,8 +199,6 @@ copy_initramfs() {
 	echo "Finished copy of initramfs into ./usr"
 }
 
-INITRAMFS_BASE_NAME ?= "initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
-INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
 do_bundle_initramfs () {
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
 		echo "Creating a kernel image with a bundled initramfs..."
@@ -628,6 +626,10 @@ MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
 MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
+INITRAMFS_BASE_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
+INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
+
 kernel_do_deploy() {
 	for type in ${KERNEL_IMAGETYPES} ; do
 		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
@@ -646,17 +648,14 @@ kernel_do_deploy() {
 		ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
 	done
 
-	cd ${B}
-	# Update deploy directory
-	for type in ${KERNEL_IMAGETYPES} ; do
-		if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
-			echo "Copying deploy ${type} kernel-initramfs image and setting up links..."
+	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
+		for type in ${KERNEL_IMAGETYPES} ; do
 			initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
-			initramfs_symlink_name=${type}-initramfs-${MACHINE}
+			initramfs_symlink_name=${type}-${INITRAMFS_SYMLINK_NAME}
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
 			ln -sf ${initramfs_base_name}.bin ${DEPLOYDIR}/${initramfs_symlink_name}.bin
-		fi
-	done
+		done
+	fi
 }
 do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
-- 
2.7.4


