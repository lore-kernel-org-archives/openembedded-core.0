Return-Path: <net147@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 397AE6F0C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 04:39:17 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id ma3so264010pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 20:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zlc9AT2/QqAVcXth/lYsi2CSo7Kqn/290ALr2KyzbuA=;
	b=DLBcpu8VPdf0eQOTiAbH4WbFxek1+SZqIHKBY8ugG/CHKaG5ggnc1Z5J/0GVI56qjl
	jhrbV9R8/I/fwnbozwRjs2J60He+vOYTz24yyyxmHN//N+BgtGoJFiT4w6+mVtfXt8xs
	bVgXBxUnEcZKtomVvWPHk/WX/We4MoTvIa08l9K+OAEgrPB83RsUAKorTHrASJpyNT0G
	PndT9uNX80NhsOdIS7hApHfMoZkrCF3g3bqzTE4opGWbciFs01r0e8j+x3Tn6JTJqclr
	CKtcvcjisDMD5roEqCxETjQOv5rGVORYqPVx9cq4KQoObqxpyuamRXQE5R9qB4c9Ob0i
	lJOA==
X-Received: by 10.69.0.10 with SMTP id au10mr6750888pbd.48.1392957558473;
	Thu, 20 Feb 2014 20:39:18 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	qf7sm40196652pac.14.2014.02.20.20.39.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Feb 2014 20:39:17 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2014 15:43:38 +1100
Message-Id: <1392957818-1025-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.5.4
Subject: [PATCH v3] image_types.bbclass: fix cpio IMAGE_CMD to preserve working directory
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
X-List-Received-Date: Fri, 21 Feb 2014 04:39:18 -0000

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


