Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505FEC43334
	for <webhook@archiver.kernel.org>; Sat,  9 Jul 2022 08:12:35 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.4315.1657354354333586616
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 01:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dFLgOAwd;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id u13so1207339lfn.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f1yksihTp6WZB8YZ9S9gyyjFouHxkzyxris6HGyD/sw=;
        b=dFLgOAwdKlYZakEMpEeFknQglYYrd7OBrHN9wkhXHBvokni53DR6osukqVXZE26MDO
         QA/LHqNV0FxdsGCfQ5BCSR7p2MF1AvOI745YxvFVkkYleEg7++vUrZ7JhtGAILfNUFcE
         tl/RoA7fX2Ki93yON+43XSSSFRWlQtzZUbhC5AawLm/JnCPRdgsEKAAq5rZdmB4P3+BL
         JWiW5JQY5qJ/QDNkYQk/rrA0pkplflwA2VvVu//RlyBRHlrZd9ydZCK6S1aMsGSUiWmM
         lK4LKWIb3pg9p1zqj2CXWgQsf3LxkuYOCiHn5msY9tpuEvgEYQ3pFL0ZLPX9j+1tXhkf
         lgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f1yksihTp6WZB8YZ9S9gyyjFouHxkzyxris6HGyD/sw=;
        b=pOCn1QdwE+riatjc83A2HEOL2VoxpKm8f9rpXg6ZjzkGft/QCMNofLgX1EX3ZCuFjC
         l1JXU/DfKPztwwdkL1HxJoiQhb8teJdCgZ7/D31RxXZ/VxLZDJIw8XKknnYRo8GRulZ4
         qnO40Crf6qu7pkltD1MI70+zMPoj6Z/7E48MKJ058QzXMKS0AF3eeyPVJjFYoC/n/i/9
         cK7dCchk39SblRrZ4hnKTIQq9Vzud+UWAD77gkOpiKerEdGr7ydVnKp5T2q/bB9xfY1J
         JKUNwtueuzYIgUJG8pRbu6pQqVZ3SH11RS8Tm39WiteKMF7zUN1OJVgWj1cmTL5RxUj0
         xXQQ==
X-Gm-Message-State: AJIora9IpxiphIKVvOemjn9Zre8XxpwEFVq8MR1QpGWQ4UaUZg4izzoh
	6XgS7lt0u0/nl+0re+Ebmr+vdE+Kmpo=
X-Google-Smtp-Source: 
 AGRyM1uJbgdtIbqNTXjf1REhrxnCw6GQT6GJD7noARiMSEwsDUWQhwWIJzI6WZoyzN6qqkpsbeMN4w==
X-Received: by 2002:a05:6512:478:b0:47f:86f2:811f with SMTP id
 x24-20020a056512047800b0047f86f2811fmr4847708lfd.305.1657354352001;
        Sat, 09 Jul 2022 01:12:32 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 a14-20020a056512200e00b00489c2f5f2fasm251739lfb.289.2022.07.09.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 01:12:31 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2 1/1] meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE
Date: Sat,  9 Jul 2022 10:12:21 +0200
Message-Id: <20220709081221.5601-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220709081221.5601-1-liu.ming50@gmail.com>
References: <20220709081221.5601-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Jul 2022 08:12:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167837

From: Ming Liu <liu.ming50@gmail.com>

Sometimes an end user might want to choose another kernel type argument
for uboot-mkimage other than "kernel", for instance: "kernel_noload".

Let's introduce a variable UBOOT_MKIMAGE_KERNEL_TYPE to support that,
and it could be used by BSP layers as well.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass     | 2 +-
 meta/classes/kernel-uboot.bbclass        | 3 +++
 meta/classes/kernel-uimage.bbclass       | 2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py | 3 ++-
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 7e09b075ff..2112ae4cfa 100644
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
index e6bfd1257e..7e6479c9ca 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -763,6 +763,7 @@ FIT_HASH_ALG = "sha256"
 
         kernel_load = str(get_bb_var('UBOOT_LOADADDRESS'))
         kernel_entry = str(get_bb_var('UBOOT_ENTRYPOINT'))
+        kernel_type = str(get_bb_var('UBOOT_MKIMAGE_KERNEL_TYPE'))
         kernel_compression = str(get_bb_var('FIT_KERNEL_COMP_ALG'))
         uboot_arch = str(get_bb_var('UBOOT_ARCH'))
         fit_hash_alg = str(get_bb_var('FIT_HASH_ALG'))
@@ -775,7 +776,7 @@ FIT_HASH_ALG = "sha256"
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


