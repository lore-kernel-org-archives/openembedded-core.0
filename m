Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E82C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 15:44:42 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.9080.1657813479800416617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 08:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ariGpF4l;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id y11so3467754lfs.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 08:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l3LqD6kgiQ3H3gplPkQZmUg8lp14zZt7T6/DQd6rOWI=;
        b=ariGpF4lG2Y0rg6ju9HfTIXqYKF3eHT7l6+3uKrclui2H1esSE10KldGfRqETzo+8Z
         iQM9YDcVTF++mV0hcphkEkBtZQI/Zyf1XEbaoZQkYBYNoOrfQeRFl2Vkas/UPjElvnVp
         PtYqDnl8iPP51XOEkRBoKTXNZCk/9oFRG4sOGAtvC4fDX7DHqrRpamm9vl0DtVotlcZb
         H61+qiyV/mtcKJp0+QFQtgOPRpUdhDi3N6ETJm8uog0JTJWSYLpOaIw37KmPczyqRAqm
         yBJdwDyMHpgqbkwYICnBORskF5B+7TQIqOY7B/tpC2zR5asg20bZR5/Ocui2RNZSKHcL
         NZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l3LqD6kgiQ3H3gplPkQZmUg8lp14zZt7T6/DQd6rOWI=;
        b=GCzK24La+S56lEqG7OXsS1ox/av1XAO9l1byhWnk9cwQ59mM0iYrREbN+5gYzeUH7w
         odQiMvaFsOVTa/CEl8r93whXw9gtJGIjFgHd4gNshz2INBIgYwQc+I9/moIjfn6tVLu3
         5p+ZNrpUloA9hQg//XizuKBWC4O9chJ9cgqIGXemGDYx0TZd0zXBilfkWm2pIHltyGoL
         Zd/v+y+fBrAwdtHyCe5wsl8AQhYNkI/sr18AaULThraXe7a3GWxoF7PN1LBfeIS4bzl3
         9qoJpYVpn3UilEKZE8H++av2GLkZkyte5Ym3FuQxZEeyKDy7h5H+7b6cp5qvAlqjqV8p
         J/OQ==
X-Gm-Message-State: AJIora8scyi7uXNXKnFFhmYnCgqgY4yi/m4wa6q8q5sY14ckkOLezjYC
	ixdZwPkiOIg4cbmwHuBjfQbb1paMaRc=
X-Google-Smtp-Source: 
 AGRyM1tLxUSo0fEuHxqewMGIc0h7EoYh8fBvrqgw3+uqjwvcU9GTC9gvUu/rui5t9WQ8Ty7/vylFhA==
X-Received: by 2002:a05:6512:23a3:b0:489:dd50:9b18 with SMTP id
 c35-20020a05651223a300b00489dd509b18mr5287719lfv.341.1657813477717;
        Thu, 14 Jul 2022 08:44:37 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:236:2d61:212f:bf66:41d7:6031])
        by smtp.gmail.com with ESMTPSA id
 c9-20020a056512074900b00489c92779f8sm412124lfs.184.2022.07.14.08.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 08:44:37 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3 1/1] meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE
Date: Thu, 14 Jul 2022 17:45:08 +0200
Message-Id: <20220714154508.2070770-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714154508.2070770-1-liu.ming50@gmail.com>
References: <20220714154508.2070770-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 15:44:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168036

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
 meta/lib/oeqa/selftest/cases/fitimage.py | 4 +++-
 4 files changed, 8 insertions(+), 3 deletions(-)

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


