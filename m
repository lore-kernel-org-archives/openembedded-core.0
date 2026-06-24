Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578AFCDE004
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 14:17:18 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8224.1782310634479241455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 07:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AIyBtUgb;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6a0ddedcd00so498064eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782310634; x=1782915434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htmmbviTFKFO6CGnAjLliWc0qZi9TjaXMmIgPhE5RD0=;
        b=AIyBtUgbbIDbv3rkr63fMDZ2hrcFIsl1BqPkc0C7xAZttwI/EIOqU587fLItTwx1Ll
         mr3u11EatXQBDQuVBpbiBCF7EtQLzfcQbf3YkSfV5h76tEyO7Gc+pH7uDdS+DD2Xls3C
         sE/pqok5x3HeDMy/W+UTZBSL43KWrntU7tXrGOX03Xar86rZUXdH7Zg8OrGepbJWZD1Z
         JgC6G+pJL2jVFIWoDukd200WI8QHhKYYvnRndOXFbbEKQUSR9jjUoVKO4+jeEwFNqpxh
         aGzylmv0OreIaybYFv25BL/AyjM9nr4clSrGK1pN8JHFBr8m4TP21wj17K487xT1P52R
         Qqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310634; x=1782915434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htmmbviTFKFO6CGnAjLliWc0qZi9TjaXMmIgPhE5RD0=;
        b=oyBLT4zc97ideBvRwBSwzJVTUBqGwI+fJbnf0lVN+x7b4QdKxF20dAx0rvwRmiNVkD
         ssRk4hxDcNSGC0BqJC/k8eow//NxEOwo6LfI5Wx12urHmNZAYMSw8PAWc7u2UIXZ+0Jv
         LGnX6UdCFtm+oTC/6qK5fTrWUoLOBZSFFIyvfOggDxitVUP2lGVN9gCTluQIk8kAMVew
         ZXf1Ss1EBtJgYzuF2oIIQ14I79YOby+VrwA9UpDCnhQtIhErLdhcJNjSM042HfuQ+MCg
         PbmEF8I/6n2Ydr9fXR8FQIcZRTbIH9kgnSkurOV7jP6ia+4XMjGyk0i2d7EWHDE8Gjot
         cqIQ==
X-Gm-Message-State: AOJu0YwOPkn6U2oDy7BWoC2og6gdP+qiBNwUSU+2Jrfq9PEfODmG33Jj
	iB/WwfcY+YtRNb8uvd7mzxVLpAcHLnbkJc6tZj2JjZbjFEd0tlcWMOwWj2jfXQ==
X-Gm-Gg: AfdE7cldcoNTf+MuF19o4XAyOANnUPvJRynpx1UVsnBNm+OpXJUXfaXXKinCU4j+EPB
	zOEDSVoi3tTt5iQg5KHe29SRDwk1nMNO4yBExsSiHy1mPFZAiajinK7Xww0/ZU84SFVndF/RRDd
	0x10C4rZNSXC+DZ+9cNU/KWR9TWrJxah5dl+016GwjCaC3wqu22hFeLyB3iCnaM/QEXdChjMJrb
	TKd24pO4Qe94UQCX0nzG87PjgZewjYVpz1vGgtzGh7/oA1sspjbKlAW+wrmm8tCSNG5Q1bJs+Iy
	gItMNX+bZLPutXffru42STJkmimEgBRD9O3kVW4ZriUW/Ve5ot7Lo+3+LedbbxaEqSHWekpPFxf
	nEVsB62vUd3mge6DqJ53BREarzCS6FPwYwyGjCzLGn3fAF7/O9eJw4nfiKPFoGA2ctCT86i2KS1
	21t3mn0M+S+w==
X-Received: by 2002:a05:6820:169f:b0:6a0:df5e:7f64 with SMTP id 006d021491bc7-6a123027f3dmr2324136eaf.49.1782310633608;
        Wed, 24 Jun 2026 07:17:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::87cd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0e9f2a4e9sm8946149eaf.2.2026.06.24.07.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:17:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 5/8] Add SPDX deploy tasks to various recipes
Date: Wed, 24 Jun 2026 08:15:22 -0600
Message-ID: <20260624141706.2164567-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624141706.2164567-1-JPEWhacker@gmail.com>
References: <20260618165032.347436-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 14:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239514

Adds SPDX deploy tasks to many recipes to record their output when
consumed in an SBoM

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/barebox.bbclass             | 1 +
 meta/classes-recipe/devicetree.bbclass          | 1 +
 meta/classes-recipe/kernel-fit-image.bbclass    | 1 +
 meta/classes-recipe/kernel.bbclass              | 1 +
 meta/recipes-bsp/grub/grub-efi_2.14.bb          | 1 +
 meta/recipes-bsp/opensbi/opensbi_1.8.1.bb       | 1 +
 meta/recipes-bsp/u-boot/u-boot.inc              | 1 +
 meta/recipes-core/systemd/systemd-boot_259.5.bb | 2 +-
 8 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index 2411fb5caa..60437c1ad1 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -158,5 +158,6 @@ barebox_do_deploy () {
         fi
 }
 addtask deploy after do_compile
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index ce9d008aac..35c2499bdb 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -164,6 +164,7 @@ devicetree_do_deploy() {
     done
 }
 addtask deploy before do_build after do_install
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_compile do_install do_deploy
 
diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index ae8f3c6688..5115482eff 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -241,3 +241,4 @@ do_deploy() {
     fi
 }
 addtask deploy after do_compile before do_build
+SPDX_DEPLOY_TASKS += "do_deploy"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 50cef17f69..8d0cb91688 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -842,6 +842,7 @@ kernel_do_deploy() {
 do_deploy[prefuncs] += "read_subpackage_metadata"
 
 addtask deploy after do_install do_populate_sysroot do_packagedata
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_deploy
 
diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
index 6354b43989..e535d99710 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
@@ -97,6 +97,7 @@ do_deploy() {
 }
 
 addtask deploy after do_install before do_build
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 FILES:${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
                ${datadir}/grub \
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
index 0a9652c283..93646a97df 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
@@ -45,6 +45,7 @@ do_deploy () {
 }
 
 addtask deploy before do_build after do_install
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index a75948dfc3..acc2bf9819 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -471,3 +471,4 @@ uboot_deploy_spl () {
 }
 
 addtask deploy before do_build after do_compile
+SPDX_DEPLOY_TASKS += "do_deploy"
diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes-core/systemd/systemd-boot_259.5.bb
index c6c443f929..c887835806 100644
--- a/meta/recipes-core/systemd/systemd-boot_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_259.5.bb
@@ -72,4 +72,4 @@ do_deploy () {
 }
 
 addtask deploy before do_build after do_compile
-
+SPDX_DEPLOY_TASKS += "do_deploy"
-- 
2.54.0


