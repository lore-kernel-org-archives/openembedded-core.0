Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 549BE746D3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 15:04:57 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r16-v6so11361148wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mWEwVq0l6IbaGayHy2TOhRbFSxR1A1dPt4eLQKfrpF0=;
	b=A4L+HkatYePPutUQ17gS3yic4Q6amrC5IuwYiRoAQt792gPz+NKwWo1aSTBrYndHtI
	5p7PaVF2PNZtAmsWNmpRl1lXm69vdWR1U/mCY/XtSp//lFpXO8xpsnVoCq/+gvW1Ws77
	byOG47613LOy4r1o7cSqPlla7tYvXI5EWXTO+CjDU2vPrCpUuDF2KELcY079FMfFC7lV
	x3SBk3NbP1TFZIR9q4ji+Z3pITczO/Z9wAV+u7wl82NRN09VeyHZWbfGatdVxUNQBb3k
	VWJfY00mmcTy5bMuhfQR8p+8vUxDMzNqPqkksewYZzqLfT1J+j6EZi+Ggi1S1Zws4IrG
	+zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mWEwVq0l6IbaGayHy2TOhRbFSxR1A1dPt4eLQKfrpF0=;
	b=fUrbzL3bf7aodrm668w2+HG6uGl88SAaoHUfAODh5k1qDVCFPbikoxux9zMFz6t/5Z
	47/bmIMT/3NrH19S/ii2HmdC3VBL/xhMqM0CJ6reU4cRNJCt+BTF8y0Bi85YnF8l83tP
	lzLpTYsXkdbC11lC92HvgpG5IsZzUcpCq6jZNhQ1bDkpKojrTrSeN/V9Jug3H+hChQLc
	Bt4IK1zx9y2V7o9rc8yL1rvlSg5LPh8IAGrESvDNSIVnS3GAWikpuI6evQB5yY0HwbiI
	8MWtbdj3fx+WDy8UKhjE1JjOP4Fq+7LytlUMulH73r9QQZfhU9EfDZCzaIL9Xw6Sd4zp
	7tMQ==
X-Gm-Message-State: APt69E0HQui4VDcA8CGflT4YKnJGc9KGdcaj5MV5nKox1U11VdC8HS3E
	T/5Ev3QlW0lSDFM+KsoNfxxL8w==
X-Google-Smtp-Source: AAOMgpfpIZG8f5aqc6SCIZxlD3BqD+gWSDcsmgDqYhuAvAK0AAiWJzfW5sMNnwLXOadWg72IQ9aNUw==
X-Received: by 2002:a5d:6250:: with SMTP id
	m16-v6mr15928854wrv.179.1531148697887; 
	Mon, 09 Jul 2018 08:04:57 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n8-v6sm16388378wrt.56.2018.07.09.08.04.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Jul 2018 08:04:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2018 15:04:59 +0000
Message-Id: <20180709150500.20233-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180709150500.20233-1-Martin.Jansa@gmail.com>
References: <20180709150416.GA1825@jama>
	<20180709150500.20233-1-Martin.Jansa@gmail.com>
Subject: [PATCHv4 3/4] kernel.bbclass: use the consistent naming schema for initramfs
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
X-List-Received-Date: Mon, 09 Jul 2018 15:04:57 -0000

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
index 7ce64fd19f..0045cec819 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -229,8 +229,6 @@ copy_initramfs() {
 	echo "Finished copy of initramfs into ./usr"
 }
 
-INITRAMFS_BASE_NAME ?= "initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
-INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
 do_bundle_initramfs () {
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
 		echo "Creating a kernel image with a bundled initramfs..."
@@ -673,6 +671,10 @@ MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
 MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
+INITRAMFS_BASE_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
+INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
+
 kernel_do_deploy() {
 	deployDir="${DEPLOYDIR}"
 	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
@@ -697,17 +699,14 @@ kernel_do_deploy() {
 		ln -sf ${base_name}.bin $deployDir/${type}
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
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs $deployDir/${initramfs_base_name}.bin
 			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
-		fi
-	done
+		done
+	fi
 }
 do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
-- 
2.17.1


