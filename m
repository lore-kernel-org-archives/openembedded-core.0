Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49765C54755
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:58:31 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.105651.1747238305269936059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dTEE24b4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22fac0694aaso53881365ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747238304; x=1747843104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTx5+ZFRXM8VJHkPO2D5I9OE2V59M6tAfeNRwQ7bg/4=;
        b=dTEE24b4ujwssus/DIvBGR7IDwr9gMv4SIT/jIMyhI69QOelNvCYOWnHMjPob3tQDR
         qHg/tFRy9DoXEPCtxI1delwlb13pUSyepCRptYsYHLf/Uqf9oz+cuBJEVT47Y+3n2eUB
         QrHuR/ooG2UrfCqh/hTmp7oRNrzlMFvee3FoJpcHmuKQfQ9nz4+xaIE166ZBSc4oVwvT
         raP6p4NnNnm3UVbyqdliy0jdF2PnMiWH2Wmgm4zrgYM8hTvWfGuOFzaXD3Dld4P2IelC
         eUXXiHhFBySP9I5SbY+gJ6ctO7xqwFZYMB43xZ7d+VkX42U3MBjli8gDmbk9EDRQoNNP
         lkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238304; x=1747843104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTx5+ZFRXM8VJHkPO2D5I9OE2V59M6tAfeNRwQ7bg/4=;
        b=xGMfK8m+P6OnTphMzXavdGGnU9EPAk83RkphyFQcxaxHOnL/aVS4hPZfzgmO0vLnkw
         JDlx45Qliqxo3WszceQLJ9GZ60gFE4G/HFDx+s0VHYzxIwmHR/LqN0H3AJ4P5T0NAC8w
         qPY+MfEDPquioSymVGa03FDyMoonbSNaTf0IqN9ehPSOEYfUmL/6+owCuiXkKsL2dPiu
         /siJjK35mD7HivF3/9FeaIul8utH6nFKUDMqNWfoaioMmFW7jb6TyHiVJ2h8r0H0zr1b
         A8sNeb0YyFTz6hPo24lHYp7B3JGEBTMduViEj1mTzN83ob1mo7+PJJ0MtsmUVVLAxIyW
         Q3fg==
X-Gm-Message-State: AOJu0YyGe9ZhqJy35ee9b8efCZAs9gerRz98rvqPkP3UYw4zzOITHwT5
	KXS7RG1rrSPo8eVMRKXJDSUUAzP3WE+8QOq+VcLpOhLjFhmr40TsNg8c1k4Y5JtLK3Kw+fxBFDz
	i
X-Gm-Gg: ASbGncszSNgH2ipng3p5MtfJC2xC8okSMJBIx//x2V2XsHCItyPQ57K41Q4Q/8j2OjM
	fwPqL2od4BhyLIexQVQ/YSz0IDgAm8VLube52wZMRco1BfMRuDxbJTbPbF4IfntTgM2fNjzlZu4
	opBm6q+OsPD5YyCOpWEHl4GpoUcwqTLy5FV91RU4Qfi4uU7H0rByrxU954oqzCN7KLQa/nvugU8
	JczjMJax/m2j9Ew0RoSicDQ1nY2P/qiaTZ/QsCxIP9xBBufge2MciO5DnkXhx8uPfoEH4eJNmRm
	7Qj8D1o1PQxcx1pfB8ppnaR22fFeW2g3frcf3UGk
X-Google-Smtp-Source: AGHT+IHPQVX3T+JhmyJPHWBdBZZj8bR0pmI8CFFrjDDMS0KrbHZ5n6Ms+bJRuMK3hjbB7qO4jM95Eg==
X-Received: by 2002:a17:903:1b44:b0:220:e924:99dd with SMTP id d9443c01a7336-231981962demr57334375ad.34.1747238304523;
        Wed, 14 May 2025 08:58:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:671:bf16:d45b:ad8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm101347385ad.125.2025.05.14.08.58.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:58:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/12] module.bbclass: add KBUILD_EXTRA_SYMBOLS to install
Date: Wed, 14 May 2025 08:57:58 -0700
Message-ID: <c6ded848334807962967d2c6c7589fcc9feceb0d.1747238138.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747238138.git.steve@sakoman.com>
References: <cover.1747238138.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216513

From: Alon Bar-Lev <alon.barlev@gmail.com>

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0ef80eeda967a9e04ff91c3583aabbc35c9868e8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


