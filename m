Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.2587.1615661571271819382
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kBYX8kST;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id j22so5189557otp.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ktVrtxJLdHGSb7Ygn4Tu5znwjcD1ZlCrVTtIDmcDgNo=;
        b=kBYX8kSTCe2DGUewF9wkNVRtD1WxcBwukAliD/nLMELaosEg1bUP7Y2E08JcQpHDyJ
         t6Vcw7VtodDwgy9x75/AIRbYXm+5LJfp9ORgyNbcWuBOiyyNl/4ah7jtJdZizrFt6ldr
         uWc+379zpMKB74KdpTVi23VGNM72rFbPNAckz6dk/WhFfzWKUwu8JsrBYLopDcLoKs8r
         fyQVAaLOxN04fypmDfjqhPju90Uc2xDAElSbJpR2daUT1Zz5fjBYt4G2sxRFHOCRkUEi
         9aSu2aPwFmhCn+58PJT4hZ6CEnaf1nIh7GJYqskIrcql/BCvPTOMhqMosdlKx3+VJet7
         Qrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ktVrtxJLdHGSb7Ygn4Tu5znwjcD1ZlCrVTtIDmcDgNo=;
        b=DE6YdnCspDGRTnuLoFcg/K4qAEHJN9WFsH3kCx2ckPt10bjhbS6LDvM96JPZhX0z8o
         GB46s+MZbvtX3irD0JZulLpjIML9B/VZHyP0cDz3p9P6/MSw3jl3hV4fWcvv5I09+dnD
         6ci94Yjprr9Mdx0aZfVwUhGg5CMZG4Q0YijjVtM3xWLk630ngiJ1LLnGZXkVzovMTlvw
         +dqDxRUYjv8k0BA+JHNLgeZbS17FLPqjiE85kVFzLYmizXBBqf7GHPAF6Zj/hwHPGH/V
         SMFePawr4kBkfeHbfTpqO8O2UlkysKvjlO/0uGm3EFJfikRSWMqR3xcBU8XWlGJEqH0q
         h5Qw==
X-Gm-Message-State: AOAM530YZopJER/CffQgWvcmkDXGHt4Rlf3vmyfsSCRwH5wcVyECBs5L
	b74NJ4xXvYAjkYOFXB/sDid4u4fL/pWIBTNG
X-Google-Smtp-Source: ABdhPJyugEmhhyxCS101Wl9EWRvgUZ9ln0ZQr32GddHSk7FL94e5CrC/mPzVtxTWS3dLkPB4RtVq7g==
X-Received: by 2002:a9d:4f05:: with SMTP id d5mr8042617otl.88.1615661570089;
        Sat, 13 Mar 2021 10:52:50 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.52.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:49 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 36/38] build-appliance-image: Drop kernel module handling
Date: Sat, 13 Mar 2021 08:49:25 -1000
Message-Id: <b5bcbe1835ad95a65c2c01212a35f9388ac0dffc.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

kernel-devsrc is a dependency of the image so we no longer need the symlink
creation code or the module-base inherit/dependency as it is included in
that recipe. The KERNEL_VERSION usage was broken anyway as the module
usage would have needed a:

do_image[depends] += "build-appliance-image:do_configure"

which wasn't present so it was indeterminate if KERNEL_VERSION was set
correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a46b43bb67b2f87ec370480e50a2e2d111555b75)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index f5cc20fa6d..086e20023f 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -22,7 +22,7 @@ APPEND += "rootfstype=ext4 quiet"
 DEPENDS = "zip-native python3-pip-native"
 IMAGE_FSTYPES = "wic.vmdk"
 
-inherit core-image module-base setuptools3
+inherit core-image setuptools3
 
 SRCREV ?= "fadf7d3343305337c38a5243797723c68e88276a"
 SRC_URI = "git://git.yoctoproject.org/poky;branch=dunfell \
@@ -61,12 +61,6 @@ fakeroot do_populate_poky_src () {
 	# Place the README_VirtualBox_Toaster file in builders home folder.
 	cp ${WORKDIR}/README_VirtualBox_Toaster.txt ${IMAGE_ROOTFS}/home/builder/
 
-	# Create a symlink, needed for out-of-tree kernel modules build
-	if [ ! -e ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build ]; then
-		rm -f  ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
-		lnr ${IMAGE_ROOTFS}${KERNEL_SRC_PATH} ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
-	fi
-
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	echo "export LC_ALL=en_US.utf8" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 
-- 
2.25.1

