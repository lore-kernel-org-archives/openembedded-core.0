Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC06C7EE2C
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:26 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.36209.1683386719535532882
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Q0aF6Ozx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-643b7b8f8ceso362510b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386718; x=1685978718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7Twov/j3YxwJ+i8H96JdzYONkxY/iWpPlqui5R8i/A=;
        b=Q0aF6OzxkfQEPKWgqBoF4uvKdyIr/sd8jA06nHNh8c0r8+oU2b1+b2ugv/gnPcgxGc
         EaVEyX24rsxgmFyVOMbTxBwkEJxUke8edg3TQ49bRX0rrNu/m1qPq1XtOLjcF5WS44zj
         PvMbPiFTf5bSuIqswyrMQ7AIewdlRVS7rL4ILbKz+TQpy1mFduPcJaXi9tY7t6DGs2rv
         ssRbTNM30yC5meFxzT93wDS8KZqO93AAFKvnOsPYEBqh2WWbyC7aaN3BhVD6BofSJ1aU
         moq2Y3I5Fo3m/h9m9ti7AzcPS2214XIAgP49X243f+JmkbIpqCTOxi2OGEmuTYpSRimn
         Owag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386718; x=1685978718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7Twov/j3YxwJ+i8H96JdzYONkxY/iWpPlqui5R8i/A=;
        b=lz3P5eidync7hug7jJGPs6hJOJNVC9WqLhDSA85r7xCMbhGLZzl091Yf4SHO5rsPbE
         adQmwLTO5jWgJXg3nEQQJXpSiUT9zOxqbFtlshseTSmM6ssSgJW+/3dylsfK+LOhVnSI
         GORXfJI9pLG1Q8SNzyOrs5nKdwxtTWWsqlUcx5tUTJHYfYFlMg/ReobXFJAq9uZE3Q2v
         1udmISaXnN1xUS11LKFkX6yE3wIvK2Z26s54qjQlIlWLAZGbcvdRUVNUoQkNPeiaDpkM
         T+5ia9EJW8TJ7jcu5wJpOQ4f6ixjp3izOIprklWu1xYFP4W3AltcuhbXxuSjta8n4qUt
         69Kg==
X-Gm-Message-State: AC+VfDxbZ3N/1Qpb6U3WX2Wvo6DeKFllWBOZDyENpUE0kBqP4YCeEAeW
	v3EEBQkLRJWYU8VuoshGLs9Ecm6xoL4y0k8y06w=
X-Google-Smtp-Source: ACHHUZ5cZo9Ufma9n6yveSnqy5WWwmURsfopop4vce9fLgrATtfEwLF75IKWdoXBnf/L0ffLHaWPAA==
X-Received: by 2002:a05:6a21:2d0a:b0:f0:2501:349b with SMTP id tw10-20020a056a212d0a00b000f02501349bmr5248212pzb.25.1683386718422;
        Sat, 06 May 2023 08:25:18 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.25.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:25:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/15] kernel-devicetree: allow specification of dtb directory
Date: Sat,  6 May 2023 05:24:43 -1000
Message-Id: <e0409bbd3df158b773b779bd1d7f7ea36af95558.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180996

From: Randolph Sapp <rs@ti.com>

Fedora/Redhat and Arch are somewhat standardized on their dtb directory
structure. Let's add some flags to configure yocto to mimic that
behavior.

Add the following variables to the kernel class:
	- KERNEL_DTBDEST (controls the destination directory for dtbs)
	- KERNEL_DTBVENDORED (controls if vendor subdirectories are to
	  be respected)

Currently KERNEL_DTBDEST is expected to be a subdir of KERNEL_IMAGEDEST
and KERNEL_DTBVENDORED is expected to be "true"/"false". This only
applies to the package directory structure. The deploydir structure is
purposely left untouched for compatibility with existing recipes.

By default this is configured to behave the same as the current recipe
and produce a flat dtb directory at KERNEL_IMAGEDEST.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-devicetree.bbclass | 22 +++++++++++++++++-----
 meta/classes/kernel.bbclass            |  2 ++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index b4338da1b1..11b57adc92 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -6,7 +6,12 @@ python () {
             d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-zimage-bundle")
 }
 
-FILES:${KERNEL_PACKAGE_NAME}-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
+FILES:${KERNEL_PACKAGE_NAME}-devicetree = " \
+    /${KERNEL_DTBDEST}/*.dtb \
+    /${KERNEL_DTBDEST}/*.dtbo \
+    /${KERNEL_DTBDEST}/*/*.dtb \
+    /${KERNEL_DTBDEST}/*/*.dtbo \
+"
 FILES:${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
 
 # Generate kernel+devicetree bundle
@@ -67,12 +72,16 @@ do_compile:append() {
 }
 
 do_install:append() {
+	install -d ${D}/${KERNEL_DTBDEST}
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
-		dtb_ext=${dtb##*.}
-		dtb_base_name=`basename $dtb .$dtb_ext`
 		dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
-		install -m 0644 $dtb_path ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
+		if [ ${KERNEL_DTBVENDORED} == "false" ]; then
+			dtb_ext=${dtb##*.}
+			dtb_base_name=`basename $dtb .$dtb_ext`
+			dtb=$dtb_base_name.$dtb_ext
+		fi
+		install -Dm 0644 $dtb_path ${D}/${KERNEL_DTBDEST}/$dtb
 	done
 }
 
@@ -82,7 +91,10 @@ do_deploy:append() {
 		dtb_ext=${dtb##*.}
 		dtb_base_name=`basename $dtb .$dtb_ext`
 		install -d $deployDir
-		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
+		if [ ${KERNEL_DTBVENDORED} == "false" ]; then
+			dtb=$dtb_base_name.$dtb_ext
+		fi
+		install -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
 		if [ "${KERNEL_IMAGETYPE_SYMLINK}" = "1" ] ; then
 			ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dtb_base_name.$dtb_ext
 		fi
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b315737fd2..3e3ac2d47d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -210,6 +210,8 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 # The directory where built kernel lies in the kernel tree
 KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
 KERNEL_IMAGEDEST ?= "boot"
+KERNEL_DTBDEST ?= "${KERNEL_IMAGEDEST}"
+KERNEL_DTBVENDORED ?= "false"
 
 #
 # configuration
-- 
2.34.1


