Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE2FC43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 11:10:43 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web12.4891.1657105841138769275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 04:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mqgA75y2;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id c15so18073914ljr.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eDEpsoPWF6cN6PyomUdbq4Y8aLWrLe+xviTTwEk3wmI=;
        b=mqgA75y2n4AEr1MA6Rk0z9DLVGDv9JQTbOFpfzhpNY0ugPxAjTckNvuvh2iPazorAP
         ZnCJZrOPAEPA9YhHTQFw0ID4SfqookWFc71rD6jXSpnliqchHAMlPyEIPOQ6cpl1f24P
         hfjPREOgrDU31A2TwWiKBFJPUpEtaNXAfXIM6i7wUaMOpPPlsLZhxOUSTjFMKCanUCtS
         Iy0Ee6ni5jQLXPyiUWv04KTffq6HqvuG3uPXTIAEtULYEgMDSdQ3qyWNlFksPogIrGqb
         kD6SWjr10uYxG5hejZfsUdL+Dkhm738S8yXOdKBgLdXa2DYPhbOluEFPVJRZhOWk+zAF
         lE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eDEpsoPWF6cN6PyomUdbq4Y8aLWrLe+xviTTwEk3wmI=;
        b=Du2RyE0CkRr2yUPcOoCs9Uj7ga5Y7XY0uom2e5IBy6wOVqTdcgDfNz3x9UAznsLpas
         H3v7BClpAqKZjjelI9llBBerLIhgv5XkIBmQQqTBoGBoIjASVkCJ5CZd8RCRYFJKN7m7
         xo/oDCl3TEe26lm42ZLQ2MXEJ+NFEEJC7KudbA9ZY/6BmcOVy/CQpdf9N7t70r5h8LW+
         JnrFkuet6fSMhx0g10p7P2vfWcZgwMDntZQHJXqo7mW7xlSf13X2x3ll9SL/qlnuj90U
         CWVHesxKJCtMp3c4p3QokbeDUKIpzLDn1jtHaa9EA047q4BuiIRjMN0gIMgBZJL81aPf
         CK3Q==
X-Gm-Message-State: AJIora+0tfUP6/qkQBerVOVrUpJd9y7fqOsACjL7oQRRy3htj86jSDp8
	jwvA3Ys3GWt8oeOGUTqb+lwDiEaXo/c=
X-Google-Smtp-Source: 
 AGRyM1vavScEysDpI17JEc7yuygbxV/1VgAwpUiNXl8qYLaEnOqlsjVCin1Iq0KYqESTkQ92oW5gYg==
X-Received: by 2002:a2e:730b:0:b0:25c:63cf:1ffd with SMTP id
 o11-20020a2e730b000000b0025c63cf1ffdmr14844551ljc.208.1657105838823;
        Wed, 06 Jul 2022 04:10:38 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 v27-20020ac258fb000000b00478f739f1fdsm595127lfo.103.2022.07.06.04.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 04:10:38 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE
Date: Wed,  6 Jul 2022 13:10:28 +0200
Message-Id: <20220706111028.149100-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 11:10:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167719

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
index cedb4fa070..e116bf0265 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -30,6 +30,6 @@ do_uboot_mkimage() {
 			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
-	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
+	uboot-mkimage -A ${UBOOT_ARCH} -O ${UBOOT_MKIMAGE_KERNEL_TYPE} -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
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


