Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1514FC54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:25 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.8331.1662560478505957919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YHW25gPR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id t3so9638668ply.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=IkrBG6XVVeuFhpkpS9fXYi14y2ECmRyqavZqgqfu6s8=;
        b=YHW25gPRDF6t0iWXEKB3NIjw1UAjAIqbPSq0I1xzuaCmoRrqJGu/OGC27nqP4kp6A2
         3hgJrQ3O7BcAgYHsvfk62sS0pxw5gRIGh+WmnNBSxAgfBHMoZQWxsjowPufDI8CqyVgY
         fp3HHASe+kbmFA/Yz0c1DrFiLGhSnUrth9kh9upf8KSa0FFGLb/qIbYjOd6iiAHaf8Bx
         aLuL1osHsGwgbA1X8xhOUSTsyAQH+VeP4RNWguqlB4g4GnNu2+l8sF0ZmGb/3yjDGngo
         +ceDTp8y4wRXU7h1/KKe2CjLZbKJw/cTDMLypQ7ly3F/Dr0izQc0OLTEYcG71g0Rhoc1
         rtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IkrBG6XVVeuFhpkpS9fXYi14y2ECmRyqavZqgqfu6s8=;
        b=rEmCWt5B+DNcTx6p/hRgSsVM+VyfkDPaI9pISMts/FvDjeVHPnQU5M+uL/zsbvWcR8
         ks9gUmJUcwemWP6m7c1XWvbOB5Qkh5Caawubr1aUOqyVf96ATNhR0sjA4lqM3CD1Prrc
         d+gZG4FXK110DDNtkYqgc5jVpZeMkUdRjOntzmsXcgK2n+enhrk4nSjcH2o1NQ1NtkUY
         fiNE+OxioMtCLvi8r0cMbT1gqCbLsCxW8YqvcVCT1xEmbnYnQd/kdBJNeJz9Pdt21amh
         7MCIK/HHcibi4ySGCkSAlxYqq4ZtgmtliwOZDq8Eoz9V5UjLBEGudpFK677k+ClzBr1J
         Ja4A==
X-Gm-Message-State: ACgBeo2umNeWF7A4JZW4nDeZCTMgRzWg38YhcYkFPkh9bPyuuWlLCkaP
	s7oHo2PooSo+jJuJTUxFlWOEtco/PN554rpm
X-Google-Smtp-Source: 
 AA6agR6HJTBW4J8W9m04I6/B1dZ7g9m5h1Iqk8cJexgLN3xlNquZld/xoikCTiiG3Uka4KxKiDIf7Q==
X-Received: by 2002:a17:90b:2745:b0:1fb:1666:80f6 with SMTP id
 qi5-20020a17090b274500b001fb166680f6mr30700735pjb.103.1662560477468;
        Wed, 07 Sep 2022 07:21:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/24] meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE
Date: Wed,  7 Sep 2022 04:20:19 -1000
Message-Id: 
 <a4dfcb15ee2c1349718425eef333f3bc84c2de41.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170413

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


