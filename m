Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 84A186EFC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 21:58:19 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id bj1so17334684pad.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pYzcXb2+hEXkVQW+ViE8IP+uOdH+M20az42wokykOew=;
	b=UrrzpQZQLh8yB7MyG+nlcz0v6Dq250C9EH9eT9CIlwqujRRPufRWq8sKEiHeIp46BS
	J5FOQb8Y7Tw7IoUKBpZWGcFt/dNs66WOBzV4Y9OIISUtUT7v/6uCjnUmKu5nUPLVMrXk
	qejKub6C+3x1BozMEtbI3+XuKTViVXw3sdCisCyz1ussl5yyjZDk2QGE4VsI4A3p+Bmr
	HkHE2g4vcOFYh4g4zPKPV15MRs5WM6AaGKjxHBB3R5uIL10SNDguhpqtjlI/3g9endWU
	orQBgwVBx0UZPOxUWFFe2eWMnK8KNslg49LAfraFkJ1GZFztHSlvnzlTEZYitmBFuhZY
	6z+g==
X-Received: by 10.68.130.169 with SMTP id of9mr35641886pbb.79.1392760700406;
	Tue, 18 Feb 2014 13:58:20 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	zc6sm150857046pab.18.2014.02.18.13.58.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 13:58:19 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 09:02:27 +1100
Message-Id: <1392760947-27648-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.5.4
Subject: [meta-oe][PATCH v2] image_types.bbclass: fix cpio IMAGE_CMD to preserve working directory
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
X-List-Received-Date: Tue, 18 Feb 2014 21:58:19 -0000

The working directory is changed in a subshell when executing cpio to
preserve the working directory for any subsequent commands. This is to
keep the working directory consistent when generating multiple image
types.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 944e6db..1f2a681 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -74,7 +74,7 @@ CPIO_TOUCH_INIT () {
 }
 IMAGE_CMD_cpio () {
 	${CPIO_TOUCH_INIT}
-	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
+	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 }
 
 ELF_KERNEL ?= "${STAGING_DIR_HOST}/usr/src/kernel/${KERNEL_IMAGETYPE}"
-- 
1.8.5.4


