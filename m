Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA5774EE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 08:56:35 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id y20-v6so8576757lfy.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 01:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gNm5HHCLJi09Ny2zDmdJQpZZUGQFWm7FeehVvDCATHE=;
	b=lADT0NGzcToCWETNMG1sV4R5/VVUS5tKsFsIQH7JrLYyOP8l5XgDO7i2Afx1lIp47h
	b3n/0MrERU++67QpOtt6234Og4jfISfdacYMafy/Yz+IHfB+bJD/B7Ge3fbQ5Y56uh0j
	oDgBdS5mJ5MuFYQw5ajEKRc6tYlRvFvrRe2DgO1UdiD88TdNSAqDlTQEcwYNCVrVW1Lw
	e7pjcPE6Fyk1mFdw6iV7mJ8Z819nXfK3vreMpoJSog+hVPmHQHgCQv2nLpEH81m/yhCb
	TXLD73LRQ8v0y9WEXdSFSM7tg5ifuFWap9Amds7E+lLR3x4f3R7YXq/Cj3DwymLflQhr
	1x6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gNm5HHCLJi09Ny2zDmdJQpZZUGQFWm7FeehVvDCATHE=;
	b=jJ2E3fFYa8F7cwX2y8l78m8WtzFBlbFIrvIyYPUBwgph/2tPeVWoujro0RwUTUl4N9
	3vJDZIEjc+GYNO70Yx0iRylgDL86/T7p5OvHtA0UQD09IuSbwvLlpRjtDsMTpystxsvH
	h2aejJE4T144cXEmWt7imeyQhctsAIDOZ6Sfb9lW/L30oPLz1IN5Ci578SN0z2FLuMdr
	LCeI803SBbWruc6lxFxZyEjKAZ49UwMH52PglIZjMccUwoMhainRbFFEkGTq4F/an0oP
	SnYoCyRw/XJIBUCJeRXwtbfw1BW5DnyVqX+eF6g8ZV55nFb1CSOxI/qLitk9TRZS3fZe
	l9dA==
X-Gm-Message-State: ALKqPweC1YikHZOgEno32+q776+GpraYTyKoGi8wb/Zrin6N0ggRYtwr
	jurqGuc7L8XhxHmefHDwWsbFwUIk
X-Google-Smtp-Source: ADUXVKJKImI0ByGXXib8EevMAwrHE1AZaf7vvF6SHiNJ17hiW9PpWTtl9TSyIOOSJH5MGPUuiZZyNw==
X-Received: by 2002:a19:aa0f:: with SMTP id
	t15-v6mr1129571lfe.58.1527756995772; 
	Thu, 31 May 2018 01:56:35 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	(m77-218-254-245.cust.tele2.se. [77.218.254.245])
	by smtp.gmail.com with ESMTPSA id
	n63-v6sm3189512lfb.46.2018.05.31.01.56.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 May 2018 01:56:35 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 10:55:58 +0200
Message-Id: <1527756958-16824-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] kernel-devicetree.bbclass: replace KERNEL_IMAGETYPE_FOR_MAKE with KERNEL_IMAGETYPE
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
X-List-Received-Date: Thu, 31 May 2018 08:56:36 -0000

From: Ming Liu <liu.ming50@gmail.com>

It should be KERNEL_IMAGETYPE rather than KERNEL_IMAGETYPE_FOR_MAKE to
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
index 4f80cc6..04e6321 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -63,7 +63,7 @@ do_install_append() {
 		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
 		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
 		install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT}
-		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+		for type in ${KERNEL_IMAGETYPE}; do
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
@@ -82,7 +82,7 @@ do_deploy_append() {
 		DTB=`normalize_dtb "${DTB}"`
 		DTB_EXT=${DTB##*.}
 		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
-		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+		for type in ${KERNEL_IMAGETYPE}; do
 			base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
 			DTB_NAME=`echo ${base_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-- 
2.7.4


