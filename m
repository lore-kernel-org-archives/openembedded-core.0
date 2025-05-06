Return-Path: <alon.barlev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948FFC3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 17:11:06 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.81826.1746551465788227428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 10:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gjvfblCW;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alon.barlev@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso154381a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 10:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746551464; x=1747156264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDyVDDk9pWPtVWFspfU1jgA4ap7xmaf+DWPrGGfkd+M=;
        b=gjvfblCWjHlgGrOfehhgc0gGSWcYu0zFCdybscHhqQrw0XKnr4jzKlHwBFT+Ung4X2
         wAyVlGY1syImYi5ehA9bb39Cv0XFqOeAnNdzyv8ZSw+9fsiz+b67R06RQukHuEr2rcBU
         A4HVsDCjMt93Wdnt118xf8eEUXA8gxFtA/jtq3AW38gymbEbLyPqN1g4AMl5OMIMGcGY
         t6g6yLlCtwBiva22ZEoQperxBqwwO10UejZYIbAPTK2RgZKwQvtP3K34vCie7XNVH/te
         sN6XghBBT138H4EZZEXxw69pRjWhNj13KlQEdOD3ugNkt6YoA/uJDJQWOVb5mESvLD/7
         FoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551464; x=1747156264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDyVDDk9pWPtVWFspfU1jgA4ap7xmaf+DWPrGGfkd+M=;
        b=tURUYKemUw4jkX0re6rb6yYs/JB5MdtpEmTUuMun4K0BKKeCQeSqdvUljIvELI5PH6
         PtfRv+sTdJIAhPvdo8oxvtl3nQUE9CJmj//etmfSEqXbJAr7tgG2tsEkwoj6qxjJDObK
         d3R0yF+CK2FAIy6qsveZq0VtNsOGKqrbbzSAMUbt2qyKprTXeiUv4+GatMqNcP671LbW
         LsApGFGZodu2VMLyr0iEleX+t7wB8oG6JgEERO1nhLsaM9/VIcTwwlH4vuRIXmN1L9pK
         IIrr/LBKCYLFWDnWuTQv/a20wxM/Sj5lFZWDu3nNNVlLClfUysVplFM57mZa3wiufxAN
         rlaQ==
X-Gm-Message-State: AOJu0Ywn5KzB4t3eYCG1TRIKo+5A5GjGGAOvffSADmLR/wabxKlvSlbk
	Xm8bS5Ew/+FwTZKg63SQDXZJJntsl+qh/bmrwwQKBzd/xGqHOT5W+bBgUh2fzpM=
X-Gm-Gg: ASbGncvAinvhW/EIIfM9+Gg4eICQkg5BR6VY7YVpswIntW2IheMCtPdxLzQnuoVTD4o
	JikDCH0xYxWjgrL2JWLpo8gNELf9aFmgx5rVq4JCzl7oRIBe4bpDbnK4OFSx1mzVsleZXG5Dj7O
	Kzqj4hfqeWn4XkPVvKpClSZxlGN+ju8dAytgXF2FJx38R4wCvjezGKLFhnq1GLmtvCULYOiZELR
	rvn6Im+GVtpY1etSrP+98eiPWja7vEqKVTstU9SKL0LYHzK+RPCGVZU/Z4kr9Oc6Ts7Iqka4Gr8
	GzlbIkUIOmwkl3SwI2iAoGyUxnITnNsbOZB+iJ43AumdWoJFs0658MLzAGbwcG36h88=
X-Google-Smtp-Source: AGHT+IENceueQBvt6y+EGM1QrLsMmzF4n0aB7ci5bzLpETnn+2NCS8LqnmBcKL0vkUP+qKgpP+Fivw==
X-Received: by 2002:a05:6402:430b:b0:5e7:8e5e:4467 with SMTP id 4fb4d7f45d1cf-5fbe7a66ba0mr483142a12.3.1746551463535;
        Tue, 06 May 2025 10:11:03 -0700 (PDT)
Received: from localhost.localdomain ([213.137.70.232])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b914d9sm7795519a12.62.2025.05.06.10.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 10:11:02 -0700 (PDT)
From: Alon Bar-Lev <alon.barlev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alon Bar-Lev <alon.barlev@gmail.com>
Subject: [PATCH] module.bbclass: add KBUILD_EXTRA_SYMBOLS to install
Date: Tue,  6 May 2025 20:10:27 +0300
Message-ID: <20250506171027.199666-1-alon.barlev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 17:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216081

Symbols are used during install as well, adding KBUILD_EXTRA_SYMBOLS enables
successful installation.

    | DEBUG: Executing shell function do_install
    | NOTE: make -j 22 KERNEL_SRC=xxx/kernel-source -C xxx/drivers
    KDIR=xxx/kernel-source DEPMOD=echo
    MODLIB=xxx/image/lib/modules/6.6.75-yocto-standard-00189-g530c419bc9db
    INSTALL_FW_PATH=xxx/image/lib/firmware CC=aarch64-poky-linux-gcc
    -fuse-ld=bfd -fcanon-prefix-map  LD=aarch64-poky-linux-ld.bfd
    OBJCOPY=aarch64-poky-linux-objcopy  STRIP=aarch64-poky-linux-strip
    O=xxx/kernel-build-artifacts modules_install
    | make: Entering directory 'xxx/drivers'
    | make -C xxx/kernel-source M=xxx/drivers modules
    | make[1]: Entering directory 'xxx/kernel-source'
    | make[2]: Entering directory 'xxx/kernel-build-artifacts'
    |   MODPOST xxx/drivers/Module.symvers
    | ERROR: modpost: "xxx" [xxx/xxx.ko] undefined!

Signed-off-by: Alon Bar-Lev <alon.barlev@gmail.com>
---
 meta/classes-recipe/module.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index f2f0b25a2d..4948e995c5 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -65,6 +65,7 @@ module_do_install() {
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" \
 	           STRIP="${KERNEL_STRIP}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
+		   KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
 	           ${MODULES_INSTALL_TARGET}
 
 	if [ ! -e "${B}/${MODULES_MODULE_SYMVERS_LOCATION}/Module.symvers" ] ; then
-- 
2.43.0


