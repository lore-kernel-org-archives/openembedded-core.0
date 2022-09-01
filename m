Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620FDECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 08:57:32 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.9926.1662022649523880635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 01:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c+eXcR2F;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id bn9so17157517ljb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 01:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EZUSfL+B3uThRpKYtXkzr74kLEdsEuatjiaec4vGnXE=;
        b=c+eXcR2FvsX5JGgP7HdUrV7C4dMkX1jfcxtcFBkaGmR9CvGRvdAeQJtzA/uDa8XUmC
         uLGMo90ro5NGDV9J1w9aors72R7kSx9zi31Cq48BNm0O2/7YPcIaZah0JYU5njWj03vL
         8QjdV1jJcHZ2qEI7wBC6F5TD1gIeXB3iN1BxDbivrMiUCzVApm2EzqCfUfqv9tmHPCKo
         XX41sor+/1AKKne/pZ2Ns1iR2b1ghRvF7C1pqqBVjTEe4NIFTU69D4WuM2Lps1yyWYtX
         2ICOfrCQ418DlmidYpTn1nevbGNC91vZ0IS6G5i/jHU5S5Phn/OT46xzZ/Xoyn9Ske2g
         5AfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EZUSfL+B3uThRpKYtXkzr74kLEdsEuatjiaec4vGnXE=;
        b=fzI2+3gfFz3UaoRvzvQRi1Rk9kbouMftnRN8X0iyXTsUmKV/BBVvp08+iJAYIGZqJv
         oQgmFpYgHqHmFQu89VRHOr4tNkYzr4bqKXF6Nc+D8cfBIvvT2wET4lBFO1Aj0SflzWd1
         i8TTD7/UANR4qPn7NwfpIVnCW0psSuyVRIPLwOwsSWLI9Y4f58LhQW+0wORweH49bxo0
         iNaZnDcF4byXzpjT3+GN7asNAulW/yD+KBiR8qRBh6wTr0N9w665hAqq1ZQ3+j9xMdYX
         qLPGTYu9NgG/F22rxzgzUrrcIkbzWaQeU1yM1Z65DgdYKjA1rFsIrB85Bll+lFEBYtbg
         1udg==
X-Gm-Message-State: ACgBeo30Q0ITuBJ0Hh74OyYxneNLkneC/jk7WoeBD0oXYLAmApGXfwdf
	Mtl7x0TYjW/yXyjA39vS6/DX3TFmpFA=
X-Google-Smtp-Source: 
 AA6agR618MOtPkp6IYnmH6aQeL3MiJo6nCNq55oLkeRWEQAFyCdxNFblWP6mLW/NkqecsAEeETZp6Q==
X-Received: by 2002:a05:651c:551:b0:261:dc64:8027 with SMTP id
 q17-20020a05651c055100b00261dc648027mr10109405ljp.272.1662022647413;
        Thu, 01 Sep 2022 01:57:27 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:74e:23c9:cfb:ccf0:d533:6859])
        by smtp.gmail.com with ESMTPSA id
 f24-20020a2eb5b8000000b0025e5cd1620fsm1607701ljn.57.2022.09.01.01.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 01:57:26 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [kirkstone] [PATCH 1/2] meta: introduce
 UBOOT_MKIMAGE_KERNEL_TYPE
Date: Thu,  1 Sep 2022 10:57:12 +0200
Message-Id: <20220901085713.10361-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901085713.10361-1-liu.ming50@gmail.com>
References: <20220901085713.10361-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 08:57:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170158

From: Ming Liu <liu.ming50@gmail.com>

Sometimes an end user might want to choose another kernel type argument
for uboot-mkimage other than "kernel", for instance: "kernel_noload".

Let's introduce a variable UBOOT_MKIMAGE_KERNEL_TYPE to support that,
and it could be used by BSP layers as well.

(From OE-Core rev: e288686e97de1265eeeaf452141e1473867efb1b)

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4eb7bbcc2f08b25387a15b7e4a89ef199783c973)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass     | 2 +-
 meta/classes/kernel-uboot.bbclass        | 3 +++
 meta/classes/kernel-uimage.bbclass       | 2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py | 4 +++-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 56d71ba8fa..7b16633f6f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -148,7 +148,7 @@ fitimage_emit_section_kernel() {
                 kernel-$2 {
                         description = "Linux kernel";
                         data = /incbin/("$3");
-                        type = "kernel";
+                        type = "${UBOOT_MKIMAGE_KERNEL_TYPE}";
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
                         compression = "$4";
diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 2facade818..1bc98e042d 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -2,6 +2,9 @@
 FIT_KERNEL_COMP_ALG ?= "gzip"
 FIT_KERNEL_COMP_ALG_EXTENSION ?= ".gz"
 
+# Kernel image type passed to mkimage (i.e. kernel kernel_noload...)
+UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
+
 uboot_prep_kimage() {
 	if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
 		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index cedb4fa070..2e661ea916 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -30,6 +30,6 @@ do_uboot_mkimage() {
 			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
-	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
+	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T ${UBOOT_MKIMAGE_KERNEL_TYPE} -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
 	rm -f linux.bin
 }
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index e6bfd1257e..d732a9020d 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -738,6 +738,7 @@ UBOOT_LOADADDRESS = "0x80000000"
 UBOOT_DTB_LOADADDRESS = "0x82000000"
 UBOOT_ARCH = "arm"
 UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+UBOOT_MKIMAGE_KERNEL_TYPE = "kernel"
 UBOOT_EXTLINUX = "0"
 FIT_GENERATE_KEYS = "1"
 KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
@@ -763,6 +764,7 @@ FIT_HASH_ALG = "sha256"
 
         kernel_load = str(get_bb_var('UBOOT_LOADADDRESS'))
         kernel_entry = str(get_bb_var('UBOOT_ENTRYPOINT'))
+        kernel_type = str(get_bb_var('UBOOT_MKIMAGE_KERNEL_TYPE'))
         kernel_compression = str(get_bb_var('FIT_KERNEL_COMP_ALG'))
         uboot_arch = str(get_bb_var('UBOOT_ARCH'))
         fit_hash_alg = str(get_bb_var('FIT_HASH_ALG'))
@@ -775,7 +777,7 @@ FIT_HASH_ALG = "sha256"
             'kernel-1 {',
             'description = "Linux kernel";',
             'data = /incbin/("linux.bin");',
-            'type = "kernel";',
+            'type = "' + kernel_type + '";',
             'arch = "' + uboot_arch + '";',
             'os = "linux";',
             'compression = "' + kernel_compression + '";',
-- 
2.25.1


