Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB9A6D1C1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 22:34:37 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so3057955eaj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 15:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=im+QRYnAV8zH3KiDlko3wwksQYadacSvnI0zpVKWdVA=;
	b=S29KhvojPmXgMXhMGfj4Qd1r64I/KKPOK67sGgaVfFPI2Oo0SYaBCKkQfw1wV+seNx
	TK9PWqL3fQlo0z3TblCJWruFeu0oAwFoz623pz6hH6ZK89LiDA77jTdxRfZvQ4jUQLU+
	O8vtZvM1BNVRgWigM+0cL+3Q4mWGjz48APjFeWaV/TB+MXPwKFwD029LnlM9br+BqmSl
	DQdhNPl86yoBmCfjw7+uXAza67VJjewSFDdsov8BMXEfps0Yr29OkHb7GGcaWqqs5ReN
	mq152hGyp4w14By1bQh3R78Em2Jxfp2+TspG18AEo8LCUzY4NV0VRdlEfqncB9cKHuPc
	myNw==
X-Received: by 10.14.201.9 with SMTP id a9mr18939867eeo.28.1382308479083;
	Sun, 20 Oct 2013 15:34:39 -0700 (PDT)
Received: from mizar.localdomain
	(host218-209-dynamic.16-79-r.retail.telecomitalia.it.
	[79.16.209.218])
	by mx.google.com with ESMTPSA id j7sm35752601eeo.15.2013.10.20.15.34.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Oct 2013 15:34:38 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 00:34:21 +0200
Message-Id: <5739f47649bfb50369107ca603b747b4201c70b0.1382307169.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1382307169.git.andrea.adami@gmail.com>
References: <cover.1382307169.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1382307169.git.andrea.adami@gmail.com>
References: <cover.1382307169.git.andrea.adami@gmail.com>
Subject: [PATCH 3/5] image_types.bbclass: fix EXTRA_IMAGECMD_sum.jffs2
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
X-List-Received-Date: Sun, 20 Oct 2013 22:34:37 -0000

When overriding EXTRA_IMAGE_CMD_jffs2 = "--pad=foo ..."
we are passing a malformed option to sumtool:

sumtool: option '--pad' doesn't allow an argument

Fix this by declaring a separate variable for the purpose.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index b8779e0..21391e8 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -141,8 +141,8 @@ XZ_INTEGRITY_CHECK ?= "crc32"
 XZ_THREADS ?= "-T 0"
 
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
-IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
-	-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
+IMAGE_CMD_sum.jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD_jffs2} \
+	&& sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
 
@@ -212,6 +212,7 @@ inherit siteinfo
 JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
 JFFS2_ERASEBLOCK ?= "0x40000"
 EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
+EXTRA_IMAGECMD_sum.jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
 
 # Change these if you want default mkfs behavior (i.e. create minimal inode number)
 EXTRA_IMAGECMD_ext2 ?= "-i 8192"
-- 
1.8.1.5


