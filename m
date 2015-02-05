Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9485872E7A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:44 +0000 (UTC)
Received: by pdjz10 with SMTP id z10so8548335pdj.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=bS/0Itz0fdZBR6bDe7a+NOCmk1XlfmDf3xl49V3O4mw=;
	b=V3NQ/rXWCeFLjmeztSqf9Kkta5t5agtHJZkUEBA/BHSBC12bbpgRGgb9qkPjfcb9/e
	jtekBw28r29Y0FD3gCSHO1WItjqw9MOnVWbtoFyr5kVj03Kyuzrsob7VdxEny8iCdbuv
	BmDvIZaBofA5XyNPrV6MU/bRXQxTk/fpZHAljHuwGjHdYU9h2pbmLYQGZ0U2tGffEJZH
	WlmQck3jAAi9QBqPh+1uLRdEytCT1csvmwfZsAtfXbiZGnpJlx9NBK1TDc2cwzeeX2bE
	YpgML3NlBsREuWbjBDY3iK4g+7vWvxW4CS6ezC+fOGRHrBly3YbTlTWeuyyeVDnLHcTS
	f+vw==
X-Received: by 10.68.200.36 with SMTP id jp4mr6470891pbc.153.1423152346200;
	Thu, 05 Feb 2015 08:05:46 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:54 -0800
Message-Id: <1c0deffef3be07446d28cee7cde18cd7eb418153.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 46/61] image_types.bbclass: manage 'cpio_append' directory
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:45 -0000

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

For cpio images, do_rootfs() can operate on a dirty '${WORKDIR}/cpio_append'
directory which contains e.g. files from previous builds.  This can cause
unwanted files in the image or can break the build.

E.g. when there is a cpio_append/init -> /sbin/init symlink symlink, the
'ln -sf' can fail due to SELinux restrictions:

| $ ls -la cpio_append/init
| lrwxrwxrwx. 1 ensc ensc 10 22. Jan 16:26 cpio_append/init -> /sbin/init
|
| $ strace ln -sf /sbin/init cpio_append/init
| ...
| stat("cpio_append/init", 0x7fffbb9ca310) = -1 EACCES (Permission denied)
| exit_group(1)                           = ?

Patch cleans up 'cpio_append' before executing the 'do_rootfs' task by
adding it to 'cleandirs'.  An alternative implementation (which avoids
creation of this empty dir for non-cpio images) might remove it within
IMAGE_CMD_cpio, but this might break builds where people rely on the
existence of this directory (e.g. to add local files).

(From OE-Core rev: 4db3cc2360289c062fa0df4678f2f2ef990f0c1a)

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 650c2f8..c7da4c3 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -66,10 +66,10 @@ IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_
 IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
 IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAGE_ROOTFS} ."
 
+do_rootfs[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
 	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 	if [ ! -L ${IMAGE_ROOTFS}/init -a ! -e ${IMAGE_ROOTFS}/init ]; then
-		mkdir -p ${WORKDIR}/cpio_append
 		if [ -L ${IMAGE_ROOTFS}/sbin/init -o -e ${IMAGE_ROOTFS}/sbin/init ]; then
 			ln -sf /sbin/init ${WORKDIR}/cpio_append/init
 		else
-- 
1.9.1


