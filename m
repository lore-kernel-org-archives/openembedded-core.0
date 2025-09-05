Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FADCAC582
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:42:24 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.131.1757090539117967386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Lz/xyR+d;
 spf=pass (domain: underview.tech, ip: 209.85.219.49, mailfrom: vince@underview.tech)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-7240eb21ccaso25616506d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1757090538; x=1757695338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjfMfBdxyLebbwDgPMPC5T4UWLf7dF4GlEqze820sYU=;
        b=Lz/xyR+dLP/vermeT0aLvGftg+TQAQQIoQfNjv4dn9WlHOJ4zZ2HpEkBsmbXLkiRwt
         HayobWOgbYKB7/S2I9L1ZgEoTSAkyPuCtfajs3LmzCQPguXzbxRDVh86sy+aEJLEBGW0
         FwJ8QEnVUYufUBQZvUeEqiv01StmeoEchghzzVQvcM6i8eRrwyE1QjM7bOXIwini043x
         +PkLWvs70pyLHJD6+jBMEt4Zgo4062PC3NepvBh0uidCpOu8Rg/8O5Tb6UIkFIficOs4
         26M+mMlr6E8Ape/QZeNKs3LTXbv/kqsBkyOfkD+KzZayLDhSFdvnlkr0IgqcQjVGgcMW
         0X6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090538; x=1757695338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjfMfBdxyLebbwDgPMPC5T4UWLf7dF4GlEqze820sYU=;
        b=YaXWCTz+ZEARcEnZOp1i4eWqIgmRVnLgtCTHEEmY7v4GMT/bG5AOsXKZoLId39SwT+
         SN9OASryd7str9r0OCIkM3cMFaHEQ096dFL0H1ACBTsk1yeR9I/T6BCtPxkEEUM/I5yi
         6x2Adfg6Ltq4XfuzFY0/xdKTESvykwgun513KID/Tv25kVWE+kdPGjpZTmqBhXVv2MwY
         rzkWZEl/SJrninQofUIXexx8u0qN4LwtEdZG3tYL9ZaSjhblJSZkSKnlfkvcKI7cboY/
         n4QXSu79OW3QvmTFf1rS01i5GxYFO1h77WDuczq1w/k50d0DKovtq4N24IsjQjdxqdcU
         yIIA==
X-Gm-Message-State: AOJu0Ywn6iq9lwkU0/bzbwR3OjvTWkIOr+7c1N2r2olKdv5KCUEMZqAX
	3L2oRovFmhzpVW9Nz0hXFACwaG7rBp9vhjdUP/057+7ejdsMJ4mdV1+vQtcHV+0wW8f1DsQb/7M
	DDnIW
X-Gm-Gg: ASbGncsx0QajVwoyxo2HVMW1qMdOCpYjTrXbsOc+pefIRhgGuoV9GiD1aY50Y2XD81I
	oSiC58fea/ZCgYyp2vKVKF8rNfplHaGF5Y9zuZQlhPaTU9J57UpBw1/jNyGhneBUztc6KZ0c8ql
	wBPkoIR0++mX5YdMCWhHHaHUJ6NCmCn5xZzNzApQt3pQXFAenpzEfJsum7hy/A6Ts45Sit6RfIV
	mMCUiGZUie3zRWd+E2eKFw4fKQfX+du7KhPCUk06+TYmBcVfuUAcxbzGrQEwPH3VmtXRnJLdlyX
	35zGeZ8fwUsKL07Bf/JEn+3kwodZwZ+hyxWgjwSeLSPcA2re4GEQ3l0+9asf3jBKlDa4o1zcU/m
	yzELdeYDDt2NErAnDNmTmdw==
X-Google-Smtp-Source: AGHT+IG7l9+hOhfxMETSCNEzNXfV8YQXmjPi1hS5zW5qgUyt2do5kHp/0nAwILTTjTu9L0P4QKa+cw==
X-Received: by 2002:a05:6214:f0f:b0:70d:cc9d:7ed4 with SMTP id 6a1803df08f44-72bbf402e04mr61620206d6.11.1757090537664;
        Fri, 05 Sep 2025 09:42:17 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::d1ea])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-727b2c047dcsm39595046d6.59.2025.09.05.09.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:42:17 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v3 6/8] grub-efi: support custom embedded grub configs
Date: Fri,  5 Sep 2025 12:41:34 -0400
Message-ID: <20250905164136.2896809-6-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250905164136.2896809-1-vince@underview.tech>
References: <20250905164136.2896809-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223022

Commit:

Adds support for including custom
embedded grub configs. The default one
provided in OE-core is limited to everything
being in the /EFI/BOOT directory.

Adds an embedded grub config that sets
root and prefix based upon the /boot/grub
directory.

Adds probe to the list of default builtin
grub modules. Probe is required by the
bootimg_pcbios wic plugin generated
grub config.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-bsp/grub/files/cfg-boot-grub | 3 +++
 meta/recipes-bsp/grub/grub-efi_2.12.bb    | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/cfg-boot-grub

diff --git a/meta/recipes-bsp/grub/files/cfg-boot-grub b/meta/recipes-bsp/grub/files/cfg-boot-grub
new file mode 100644
index 0000000000..ab370479af
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/cfg-boot-grub
@@ -0,0 +1,3 @@
+search.file /boot/grub/grub.cfg root
+set prefix=($root)
+configfile ($root)/boot/grub/grub.cfg
diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/grub/grub-efi_2.12.bb
index 6354b43989..91748c8d04 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
@@ -9,6 +9,7 @@ RDEPENDS:${PN} = "grub-common virtual-grub-bootconf"
 
 SRC_URI += " \
            file://cfg \
+           file://cfg-boot-grub \
           "
 
 S = "${UNPACKDIR}/grub-${PV}"
@@ -48,6 +49,7 @@ EXTRA_OECONF += "--enable-efiemu=no"
 
 # Define GRUB_MKIMAGE_OPTS variable for additional grub-mkimage options (e.g., disabling shim lock)
 GRUB_MKIMAGE_OPTS ?= ""
+EMBEDDED_GRUB_CONFIG ?= "${UNPACKDIR}/cfg"
 
 do_mkimage() {
 	cd ${B}
@@ -63,7 +65,7 @@ do_mkimage() {
 
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
-	grub-mkimage -v -c ${UNPACKDIR}/cfg -p ${EFIDIR} -d ./grub-core/ \
+	grub-mkimage -v -c ${EMBEDDED_GRUB_CONFIG} -p ${EFIDIR} -d ./grub-core/ \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} \
 	               ${GRUB_MKIMAGE_OPTS} ${GRUB_MKIMAGE_MODULES}
 }
@@ -87,7 +89,7 @@ do_install() {
 
 # To include all available modules, add 'all' to GRUB_BUILDIN
 GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
-                 efi_gop iso9660 configfile search loadenv test"
+                 efi_gop iso9660 configfile search probe loadenv test"
 
 # 'xen_boot' is a module valid only for aarch64
 GRUB_BUILDIN:append:aarch64 = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' xen_boot', '', d)}"
-- 
2.43.0


