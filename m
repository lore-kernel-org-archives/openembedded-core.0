Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806FDC44501
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:29 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14870.1783866568012949365
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=bQ8SbxLC;
 spf=pass (domain: underview.tech, ip: 209.85.128.170, mailfrom: vince@underview.tech)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-804e46366d7so31953687b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866567; x=1784471367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xY0Pn7U6NOSf7/OLBPumK49syT+tCcj+nuXZL9nMcxI=;
        b=bQ8SbxLCKSUQBzLDEd2e+U6cA0HG3ebVrB7oRF9glyBCJuEGCjnsRwYLKvfp90NQGO
         B0OA5ndLz88Z+g5BbDElIKq31OpkKl3dfj9jNev7BxRBeL4nX49nGfDR12L1gNb4iMy6
         j6dbxIyHMCFlzfQ+nqd3ak3lB47mCl9IkoN6q/ZLT9jPmLJ4NSzyuVRgwaNSZ5MDVypV
         nD7ahykzVLDf2/xRzxNYFQKGSY06JEIn151NhTPmd4iLuaiyiNX5MXwk5oSkmLTS1eDn
         GomwXuiU5wsUTqe3CfAeBHQ7qxzUtBNCFLmAX+ObJ4aiW0iwIIjiPzDUXbwvIaDMj31D
         SWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866567; x=1784471367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xY0Pn7U6NOSf7/OLBPumK49syT+tCcj+nuXZL9nMcxI=;
        b=hJapH/RKvSh8DeWEY6cNK9lXNRGZyyLJkwwN+gCaFIW7AfvLd3VURzkskOmScOa4Ec
         pdVaMy0g3r5BdcmEch/c8RTWBP/cla5UO5yVQ5oP7xI68XHOTEDicBrTMO2Pmb4rOWRy
         SuinhogibOYusNzne0qpygU2XTGj5lof0QQka8FicbQxdIw9vp2AD5NzhwTukp2fMf4x
         XXbCqPOjRghkZL5785o9AG3feXzfpL1ODkjIoHMfneahcbcEp2iDj7zNJJCSl5AW2Iwd
         ahmg1geQDvxqOBdgfz1bTqUPONyDSsFY8ceGx6uGipZ7TzlbkhSjDb03bLl9/SSunOI/
         YBvg==
X-Gm-Message-State: AOJu0Yy0A1R/dIqnEvpmzI7oTCnacnsewp54rgmT0VqkV1FXnZFKhDKK
	bEgMp3jwB5G6EF3bcgPklZWiv1b1q0n/js183Hm2FEexkK7cUfrp9GDowQo5X1+BpCsRZeW/PPG
	kDyUtUBQ=
X-Gm-Gg: AfdE7ck2pVEPsWrB2xNITiCjAJd7nnJaYLL4ze4YXrtakbL2sNODoGFVlZVrlfhIvTv
	Khg25BDtiIIe5OUndSO6VYRszX2D9e+c67xokoq726ahjtcnmESB/uqGU/ViszpQBbZ3mVIvnvE
	6MugCt+MGNgwAyO9d2/WIgCwdZSptxkZm9hHENsW7N/uzDJnKw/FDdBMTDIooV0/zhVyQVd1aQA
	YHsaWCovl78ywL81XJG3pmPe209j0bZ0VdRgkYgcta83MlcglwTnObTYLyhgQmqdxTPJIT+aPCo
	tHUaiS4nEoh0EPrMNF+M5JPTffU5/IoCZl44Ks6j7YY/r+xBZpEoqbN3r5NGnz50rPLtcywvukQ
	lH3SVdYyjNpJSPPbUzZPmCJgUWp+BeiKK6fILFqd5LZjqcq99KSLwRmZY0xgzMCsqvHemK8+5Ey
	e5pAwcHcR5SlUH3Q==
X-Received: by 2002:a05:690c:4b8c:b0:81e:8f17:a943 with SMTP id 00721157ae682-81e90034ff2mr41418607b3.29.1783866566986;
        Sun, 12 Jul 2026 07:29:26 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:26 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 04/24] machine: rename kernel prefix
Date: Sun, 12 Jul 2026 10:28:56 -0400
Message-ID: <20260712142916.2573370-4-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240770

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/conf/machine/include/loongarch/qemuloongarch.inc | 2 +-
 meta/conf/machine/include/riscv/qemuriscv.inc         | 2 +-
 meta/conf/machine/qemuppc64.conf                      | 2 +-
 meta/conf/machine/qemux86-64.conf                     | 2 +-
 meta/conf/machine/qemux86.conf                        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/loongarch/qemuloongarch.inc b/meta/conf/machine/include/loongarch/qemuloongarch.inc
index e1bcfabc43..9cd26fb6d0 100644
--- a/meta/conf/machine/include/loongarch/qemuloongarch.inc
+++ b/meta/conf/machine/include/loongarch/qemuloongarch.inc
@@ -15,7 +15,7 @@ IMAGE_FSTYPES += "ext4 wic.qcow2"
 
 WKS_FILE ?= "qemuloongarch.wks"
 
-MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
+MACHINE_EXTRA_RRECOMMENDS += "${KERNEL_PACKAGE_NAME}-modules"
 
 #EXTRA_IMAGEDEPENDS += "opensbi"
 
diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index bac376ce5a..37d5787ee2 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -15,7 +15,7 @@ IMAGE_FSTYPES += "ext4.zst wic.qcow2"
 
 WKS_FILE ?= "qemuriscv.wks"
 
-MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
+MACHINE_EXTRA_RRECOMMENDS += "${KERNEL_PACKAGE_NAME}-modules"
 
 EXTRA_IMAGEDEPENDS += "opensbi"
 RISCV_SBI_PLAT ?= "generic"
diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
index 2fbd26a6f9..1cfdeea025 100644
--- a/meta/conf/machine/qemuppc64.conf
+++ b/meta/conf/machine/qemuppc64.conf
@@ -20,4 +20,4 @@ QB_KERNEL_CMDLINE_APPEND = "console=hvc0 nohugevmalloc"
 #QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_OPT_APPEND = "-usb -device usb-tablet"
 
-MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
+MACHINE_EXTRA_RRECOMMENDS += "${KERNEL_PACKAGE_NAME}-modules"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 8aac7634b7..f0c9a6141b 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -31,7 +31,7 @@ MACHINE_FEATURES += "x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
-MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+MACHINE_EXTRA_RRECOMMENDS = "${KERNEL_PACKAGE_NAME}-module-snd-ens1370 ${KERNEL_PACKAGE_NAME}-module-snd-rawmidi"
 
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 51f080bd2a..22e2ae836e 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -27,7 +27,7 @@ MACHINE_FEATURES += "x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
-MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+MACHINE_EXTRA_RRECOMMENDS = "${KERNEL_PACKAGE_NAME}-module-snd-ens1370 ${KERNEL_PACKAGE_NAME}-module-snd-rawmidi"
 
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-- 
2.43.0


