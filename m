Return-Path: <net147@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id D5C3F6EE33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 12:04:25 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id um1so16595973pbc.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 04:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TfRSqG3+ayVDRiY7VwrZwv3Yf/9qXajF0m/da5rhRec=;
	b=LgaQEQGfH6YK0NTNimkEasDR7rixNd1oM+ZNxUfvL4M745HsdUMI6VofbFsYSaAoAZ
	Arjys/eGsRGzdRgQHFQ2hNyE7wZ64Qm65fVKoptzYOOpjZeeUCq+5kO0EWyu05q1rubA
	3k24glUlQabNsQzcX3gFoshlOwuRax4c33jpIMl5fnrxhsjEwaE/JX0Mdb66ITjjP2cZ
	UCgMil+itpgfC/02xWWIPDzk8DZfWMZknizpTWpgmXe04sIfKexkAyPupslUt4ENK0Dd
	S69Anquu1eJh3YaY1To8HiT/FpmlupelZbHAvP55p3OHVB8ksJLNZC7ZZf88+H6c3Tof
	D2hw==
X-Received: by 10.68.244.229 with SMTP id xj5mr32628445pbc.108.1392725066903; 
	Tue, 18 Feb 2014 04:04:26 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	yh4sm27547166pbb.19.2014.02.18.04.04.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 04:04:26 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2014 23:08:42 +1100
Message-Id: <1392725322-15042-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.5.4
Subject: [PATCH] image_types.bbclass: fix cpio IMAGE_CMD to preserve working directory
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
X-List-Received-Date: Tue, 18 Feb 2014 12:04:26 -0000

The working directory is changed in a subshell when executing cpio to
preserve the working directory for any subsequent commands. This is to
keep the working directory consistent when generating multiple image
types.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 944e6db..747a59b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -74,7 +74,7 @@ CPIO_TOUCH_INIT () {
 }
 IMAGE_CMD_cpio () {
 	${CPIO_TOUCH_INIT}
-	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
+	(cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio))
 }
 
 ELF_KERNEL ?= "${STAGING_DIR_HOST}/usr/src/kernel/${KERNEL_IMAGETYPE}"
-- 
1.8.5.4


