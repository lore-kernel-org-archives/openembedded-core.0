Return-Path: <net147@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 06E006F0C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 04:36:55 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id z10so2754057pdj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 20:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zlc9AT2/QqAVcXth/lYsi2CSo7Kqn/290ALr2KyzbuA=;
	b=takEkT0QCw6I8RO0GdLRgwjWFxSxuU2cdbSBiksk39LJxJLokJ4NaOw2RGlMS95fda
	qXrmP8HSAVwCClQCOX8jnB0M1Eh2cuj2l0490vOssGN6stnfYlXZjvgEN072+PC0NSSs
	9DOT89jkd33ocNsNxWiYEv1QyGJMG340NR7Uj4q9WNUgNU8rSVmZyrIevbLT2IPYDZyF
	SLNQTwEy3ML7OxCcFZ4rC2LQiB2DsjQq3Bl0VdNPSliBaXYh0hsvP/Ahsko9OX60SXed
	pyfswkfqhY/OnAYFqcvOVg5bu82IuFS3ONzdYb4XNM1GX2Wq9wJk5rMZZgqceXwjZW8T
	re9Q==
X-Received: by 10.69.2.2 with SMTP id bk2mr6573804pbd.75.1392957416323;
	Thu, 20 Feb 2014 20:36:56 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ac5sm16702923pbc.37.2014.02.20.20.36.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Feb 2014 20:36:55 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2014 15:41:12 +1100
Message-Id: <1392957672-831-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.5.4
Subject: [meta-oe][PATCH v3] image_types.bbclass: fix cpio IMAGE_CMD to preserve working directory
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
X-List-Received-Date: Fri, 21 Feb 2014 04:36:56 -0000

The working directory is changed in a subshell when executing cpio to
preserve the working directory for any subsequent commands. This is to
keep the working directory consistent when generating multiple image
types.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 9577b1f..602c1f0 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -70,7 +70,7 @@ IMAGE_CMD_cpio () {
 	if [ ! -L ${IMAGE_ROOTFS}/init ]; then
 		touch ${IMAGE_ROOTFS}/init
 	fi
-	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
+	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 }
 
 ELF_KERNEL ?= "${STAGING_DIR_HOST}/usr/src/kernel/${KERNEL_IMAGETYPE}"
-- 
1.8.5.4


