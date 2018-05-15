Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 525387509C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 06:11:20 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n10-v6so19080846wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 23:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4yBbp2Vq58AqAfgc+q8jeYbm0lSpy4yx430w9CEYJc0=;
	b=vI4bLRvtXvRzjxriGyuiT2qfBOar+37rdUqborkPnbxf0G8B0qpH6/30KAuZeUywEA
	x2CKgtFbz4lp45UA+aEt1nwSc8eLgUC9gdrfXOHeLu/R6+HvUONce2BWPxlqsgNipp0c
	Ea17XM2R/8YaLMnKFOL7L5+kF9CeWAIiJ5EK9bkcJYYZcMkmD0o7DyWVA/aK2crkufli
	A9eenJCVZV8bJqosogZAGyodIKWNW23YgshWyQnXf7zbUsfguXxPmVhTF5hDKbcd1p4v
	jYlbKTOJf/STw6+aj+BNi2Xg7bvyKEaY8CJRxkSx8nwkOGuaVt1ZmQbTJbDjnUyO5hzq
	2t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4yBbp2Vq58AqAfgc+q8jeYbm0lSpy4yx430w9CEYJc0=;
	b=MUgmhcbaKst2x5N9MKdPNvYiSXhIPuPfcjQbAOZY85h/i3Hwc5GC0ctR4oaH0SswPG
	7/rfFtOhcouh3unmgBw6PzO5o+pO8IRLqd/l8XROWgxmMkWu4XU8iEFT29tnx/qbb8Jc
	N97BmhA2K8glVswWEjhwyt7Odp8hOV3K3bs1lih6asS5xO80nEx7u8eWNm8lszHlXL/9
	0Lwal5KmCf1cE2P/0R8WxYqz5t81BLD0inzzHK5aBEdY7q6tSE53YHJ8k+WWjAOKKsmI
	0zqNzBR0yEZcN+mx8aYO1uHLqtAqaAbyxQ72CCxCR/q1LiC0/Sv0gt8WzfoeK+9kRZmV
	RVMA==
X-Gm-Message-State: ALKqPwd6UDlw1H9pwSh5tiTNA7MtWuTQJFHAc2lol53qJY1CgZpz51zM
	095lTOFi3mBXl9hEhH8fk2gJjw==
X-Google-Smtp-Source: AB8JxZpIjnYzFlySBZQAj3U5Q3lFYjePSNkgyIsrSHV0gcgQdRd8iUeIO/1jhKbtfR+/YOAtYRBlqA==
X-Received: by 2002:a1c:17c9:: with SMTP id
	192-v6mr6579737wmx.95.1526364681505; 
	Mon, 14 May 2018 23:11:21 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([176.32.49.4]) by smtp.gmail.com with ESMTPSA id
	131-v6sm18086723wms.34.2018.05.14.23.11.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 May 2018 23:11:21 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 08:11:09 +0200
Message-Id: <1526364671-29451-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526364671-29451-1-git-send-email-liu.ming50@gmail.com>
References: <1526364671-29451-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 2/4] kernel.bbclass: make bundle_initramfs to be more flexible
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
X-List-Received-Date: Tue, 15 May 2018 06:11:21 -0000

From: Ming Liu <liu.ming50@gmail.com>

Introduce three new variables:
- INITRAMFS_IMAGE_BUNDLE_PREPROCESS_COMMANDS: the command list to be
  executed before re-compiling kernel with initramfs.
- INITRAMFS_IMAGE_BUNDLE_POSTPROCESS_COMMANDS: the command list to be
  executed after re-compiling kernel with initramfs.
- KERNEL_IMAGETYPE_BACKUP_UIMAGE: the backup uimage that need to be
stored before re-compiling kernel with initramfs.

The main purpose for introducing the above variables is to make
bundle_initramfs to be able to be extended by other bbclasses, there is
no functional changes.

For instance, while KEEPUIMAGE is set to 'no', currently there is no
way to bundle initramfs to kernel for uImage. With this change, we can
achieve that by setting INITRAMFS_IMAGE_BUNDLE_POSTPROCESS_COMMANDS and
KERNEL_IMAGETYPE_BACKUP_UIMAGE in kernel-uimage.bbclass.

Signen-nff-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel.bbclass | 74 +++++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 30 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6595a04..6a2f033 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -184,8 +184,14 @@ KERNEL_EXTRA_ARGS ?= ""
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 KERNEL_ALT_IMAGETYPE ??= ""
 
+INITRAMFS_BASE_NAME ?= "initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
+INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
+
+INITRAMFS_IMAGE_BUNDLE_PREPROCESS_COMMANDS ?= "copy_initramfs; backup_kernel_images;"
+INITRAMFS_IMAGE_BUNDLE_POSTPROCESS_COMMANDS ?= "restore_kernel_images;"
+
 copy_initramfs() {
-	echo "Copying initramfs into ./usr ..."
+	echo "Creating a kernel image with a bundled initramfs by copying initramfs into ./usr ..."
 	# In case the directory is not created yet from the first pass compile:
 	mkdir -p ${B}/usr
 	# Find and use the first initramfs image archive type we find
@@ -225,42 +231,50 @@ copy_initramfs() {
 	echo "Finished copy of initramfs into ./usr"
 }
 
+backup_kernel_images() {
+	# Backing up kernel image relies on its type(regular file or symbolic link)
+	tmp_path=""
+	for type in ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_IMAGETYPE_BACKUP_UIMAGE}; do
+		if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
+			linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
+			realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
+			mv -f $realpath $realpath.bak
+			tmp_path=$tmp_path" "$type"#"$linkpath"#"$realpath
+		elif [ -f ${KERNEL_OUTPUT_DIR}/$type ]; then
+			mv -f ${KERNEL_OUTPUT_DIR}/$type ${KERNEL_OUTPUT_DIR}/$type.bak
+			tmp_path=$tmp_path" "$type"##"
+		fi
+	done
+}
+
+restore_kernel_images() {
+	# Restoring kernel image
+	for tp in $tmp_path ; do
+		type=`echo $tp|cut -d "#" -f 1`
+		linkpath=`echo $tp|cut -d "#" -f 2`
+		realpath=`echo $tp|cut -d "#" -f 3`
+		if [ -n "$realpath" ]; then
+			mv -f $realpath $realpath.initramfs
+			mv -f $realpath.bak $realpath
+			ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs
+		else
+			mv -f ${KERNEL_OUTPUT_DIR}/$type ${KERNEL_OUTPUT_DIR}/$type.initramfs
+			mv -f ${KERNEL_OUTPUT_DIR}/$type.bak ${KERNEL_OUTPUT_DIR}/$type
+		fi
+	done
+}
+
 INITRAMFS_BASE_NAME ?= "initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
 INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
 do_bundle_initramfs () {
+	${INITRAMFS_IMAGE_BUNDLE_PREPROCESS_COMMANDS}
+
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
-		echo "Creating a kernel image with a bundled initramfs..."
-		copy_initramfs
-		# Backing up kernel image relies on its type(regular file or symbolic link)
-		tmp_path=""
-		for type in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
-				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
-				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
-				mv -f $realpath $realpath.bak
-				tmp_path=$tmp_path" "$type"#"$linkpath"#"$realpath
-			elif [ -f ${KERNEL_OUTPUT_DIR}/$type ]; then
-				mv -f ${KERNEL_OUTPUT_DIR}/$type ${KERNEL_OUTPUT_DIR}/$type.bak
-				tmp_path=$tmp_path" "$type"##"
-			fi
-		done
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 		kernel_do_compile
-		# Restoring kernel image
-		for tp in $tmp_path ; do
-			type=`echo $tp|cut -d "#" -f 1`
-			linkpath=`echo $tp|cut -d "#" -f 2`
-			realpath=`echo $tp|cut -d "#" -f 3`
-			if [ -n "$realpath" ]; then
-				mv -f $realpath $realpath.initramfs
-				mv -f $realpath.bak $realpath
-				ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs
-			else
-				mv -f ${KERNEL_OUTPUT_DIR}/$type ${KERNEL_OUTPUT_DIR}/$type.initramfs
-				mv -f ${KERNEL_OUTPUT_DIR}/$type.bak ${KERNEL_OUTPUT_DIR}/$type
-			fi
-		done
 	fi
+
+	${INITRAMFS_IMAGE_BUNDLE_POSTPROCESS_COMMANDS}
 }
 do_bundle_initramfs[dirs] = "${B}"
 
-- 
2.7.4


