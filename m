Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2C74174F7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 19:38:41 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id d24-v6so11414076lfa.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 12:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=w9lBgBF9Bz4/kWOBUWUc2rG3FkjNWwfVCGrGzMBhSxg=;
	b=V0O6j9lPiVHnQ4omLyx1jP9OIIRkJqhvI5RO0eCWMLL8cm2wdKtS1soh3ypxMdATxl
	MlSw7xJ1kK2Pqyd6BHhq49kIMAhZLG6DtZru0F7dKckDqLPtTg+ro1WnRmDiyfzHsSVc
	yO2tdX5dIr1YWFX2ubpvZVwlUcnf7/JzJ4rnMwtQqQn99LGCPsTL5QtwWH6Bz3m9eAH+
	cKDOgiyJgMomoz6Pz5ZO3jEo+3MaquIW4wNN4/kWLW6P0Ga/vPPD8PH/MKDui7iYAHFh
	rsN4MmrrOen1fyT89QIwEqhq8W0HR1eR3UGOjvHX5gi0S0ybozUny3AeNBEi/IxBUVNk
	uZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w9lBgBF9Bz4/kWOBUWUc2rG3FkjNWwfVCGrGzMBhSxg=;
	b=EpIm+e9Mukxb+BqJZ62pKodxfHx9U3x80eiHZGvVcLOY2fkfZhWZc4ceKxzbtItZUO
	TpUe0gTuFMu3XNgF9ZmQgA7pSnsvWrFALGzZ8o/0zkJ1DlN3f3vSEpTSx27tsfB7Phji
	kn+J9evZgTh5NErQf5Bl+Pz1r1tLQdQk6YG5pO2jlYJ5Ns4Kdk0Xij/3tftLvonDCxSf
	hhbey/YN+Chgq3ISfU0WxDoEjsQiZ6OKAUWA2BYjDxdAONOvROFjCq3XYCMLjCEoJjcW
	xBIO4+gB+5LDMDQ+rxyHfoWjv8XS6Xc+4tYvv2mK4KsaDHy6IAFWwg4XBMCxUJputl47
	0SIw==
X-Gm-Message-State: ALKqPwfv38opxOmfOnOk1EedjCQhbQ3P8DPtF147x7Kk61HDReMhOAv4
	Tug1A3KP+AfmiSrhwfk+14pfiQ==
X-Google-Smtp-Source: ADUXVKLaO1VQ6SuoDnS8Ja3tEmPbemhC82Qg94prY1M7QVBK/cAccR0tBwp+FJLaC3EO/PrNygfOqA==
X-Received: by 2002:a2e:8246:: with SMTP id j6-v6mr6047465ljh.72.1527795522270;
	Thu, 31 May 2018 12:38:42 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan (d83-183-77-184.cust.tele2.se.
	[83.183.77.184]) by smtp.gmail.com with ESMTPSA id
	c63-v6sm8053807lfc.37.2018.05.31.12.38.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 May 2018 12:38:41 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 21:38:26 +0200
Message-Id: <1527795506-16240-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V2] kernel-devicetree.bbclass: replace KERNEL_IMAGETYPE_FOR_MAKE with KERNEL_IMAGETYPES
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
X-List-Received-Date: Thu, 31 May 2018 19:38:42 -0000

From: Ming Liu <liu.ming50@gmail.com>

It should be KERNEL_IMAGETYPES rather than KERNEL_IMAGETYPE_FOR_MAKE to
be handled in do_install and do_deploy tasks, since we are having some
special logic in kernel-uimage.bbclass and kernel-fitimage.bbclass to
replace the real kernel image types during do_compile, like:
in kernel-uimage.bbclass: uImage -> vmlinux
in kernel-fitimage.bbclass: fitImage -> Image/bzImage/zImage...

but the final images to be installed/deployed should still be uImage or
fitImage.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-devicetree.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 4f80cc6..b593320 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -63,7 +63,7 @@ do_install_append() {
 		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
 		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
 		install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT}
-		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+		for type in ${KERNEL_IMAGETYPES}; do
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
@@ -82,7 +82,7 @@ do_deploy_append() {
 		DTB=`normalize_dtb "${DTB}"`
 		DTB_EXT=${DTB##*.}
 		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
-		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+		for type in ${KERNEL_IMAGETYPES}; do
 			base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
 			DTB_NAME=`echo ${base_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-- 
2.7.4


