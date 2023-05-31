Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C220C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 02:34:49 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.4593.1685500487611884845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 19:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ZhH/f6ZE;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.171, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3f7fdbdf68eso56724031cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685500486; x=1688092486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTTIMJ1n+jNZrWZ1BPFfODAVFQ6wk6FPen+QRZrfsB0=;
        b=ZhH/f6ZErhFlZYsJxqTwpcLajNadgesW2e49di8TMD2fk/lJawNhmi2Nb9N6YQAXY1
         lyUwfdch/HYoNIS35qodrd9m7Yd5pdu/X66W4YF4fYSlnmG4PWIfDGk/8hauOVQxr306
         idYUebNo4GxX0PgQ7nmgoFn9dPXJt63G1xUeOPw2KNYkCat0tWzx0IxS9xK1CfaEh2/y
         PaJ+UJeeF2wjsQLXMvdm43qsTDOUXfTXXiBAw5/xiDEhE44OJ2vJyyBXRbJXoj1VUBqA
         4CjPZ4sWFiTnYQjWFbbaVGbJwPTexNlIqbQ5/gfffBCK/en7cLE0iDxeVIriTzJU15rP
         Ee1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500486; x=1688092486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTTIMJ1n+jNZrWZ1BPFfODAVFQ6wk6FPen+QRZrfsB0=;
        b=Kwhz56rUrAsEebRAoTYQiYreAMPqKJtoOU1MM/hdfTorAV4DOEV6F3jztvSBRBypUp
         yrryAwYeShhfm9pJU3jh+3PxOkFZCvPypUpgfFrpQZEXknLyg3oHy7NJ4OfgNXg3mest
         tPr2GtkDUZrRWb/9NHeglslJxV748fGDZ4wnlwwoktEYUgItYtHaqkpwJlN7wDXCqt6z
         3TYexEIhCV50WAFaKJOXqXZJz4VzrmzOoaBUg+SpOAGRuxKVSCc8uCkBmx+6nsxInoFv
         WjaacegZsxSpOX6dN8xdklRJ9mvpPyzPP16aIRHsImAcRYMNjlpGnmagGU134rkiegp7
         BKyw==
X-Gm-Message-State: AC+VfDzQyYIxXYMt4mEMyMBU7oLynPceozX9dZRS5AnvJpp7KUJkzYDM
	2+pYXgaCs31+W2nL4PMiL+HCzQzHK9WheQqOab0=
X-Google-Smtp-Source: ACHHUZ6jEBJ8wQIz7xxVVYyJeyuhUuJGsUAJDca+kyJekI/qJtWtQb5Bq8VJhhsgmRJFT5ijSANl+w==
X-Received: by 2002:ac8:58cb:0:b0:3f3:8f4a:c7d6 with SMTP id u11-20020ac858cb000000b003f38f4ac7d6mr4518672qta.15.1685500486175;
        Tue, 30 May 2023 19:34:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k91-20020a17090a3ee400b0023a9564763bsm92877pjc.29.2023.05.30.19.34.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/13] kernel-devicetree: allow specification of dtb directory
Date: Tue, 30 May 2023 16:34:17 -1000
Message-Id: <77d6118e20751f68ad7104edec8f14dbb5ba6ec1.1685500244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685500244.git.steve@sakoman.com>
References: <cover.1685500244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181979

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
index d45fa25c32..87dd46e6fa 100644
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


