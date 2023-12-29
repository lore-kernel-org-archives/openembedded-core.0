Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE11C47079
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:38 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.151005.1703864731679273052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WOoHt/YV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d3f3ee00a2so27526845ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864731; x=1704469531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWtq0zb7dlQp96Z62gepvcJ6GEuIngJ5EYq2mT+iMLQ=;
        b=WOoHt/YVwi6gYjRTQQRhUJyZID2oq8rKJfP6WmmEJzqrJtCeUbYwP1rU0oYJ8uJeQH
         vUzL58k/Fq9r+cYWxU2xsGPSPXkC20zXb5+Py2SyBk15qCirZD96jKOLEgZc69hj8tAw
         yo+HZEXjiWSvw3pR+Rgm4KIRMG46V5aLc6gaabHDdWME9utBMDVuxYZLVCVwZLPhkkKc
         iZ4w9BhaRqIUjijzrOG1d+FFsHeLAyEOfnpsfnhAwBep95CSarxLeL4O92USxAm1A7kd
         5Zu9DFcudzmayU0XKt8ZQ1ojhW7X/sOy6rHGtLFbIcgXinAWcIFe07Iph0d/NwI/96eO
         IvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864731; x=1704469531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWtq0zb7dlQp96Z62gepvcJ6GEuIngJ5EYq2mT+iMLQ=;
        b=UKytF+sD5w4pNSMxJ/HB1HvTuE85BGZxt8G5cw7w2t8chjFHR28wvm4UkCJKkuE8+R
         MrQXQJ/O1P+y/yHNoqnbu41ECO9AH38JJlB+ReRHfMP9M5jB1uTVi1CuIv1FWznUNsTv
         KYgjx4Ch4FfvLq6CbOrT/8N32kLGRIWnOk7HsSSVrptTQOEEXvcSsXC6rYFfgxR8kooS
         0/iGHQjUbuLPWc8E1oZPlJYSkfLLNGBnVqlxzGooC7Qdwni11Udkpp7EVYT6g/Qyv6Tk
         uIvfIpxTT+a0+7sZm2jRE4gxKYsFl2IRpUEqZ1GOxinafEi6zg93dMo2ldo/togwrJfg
         jbHQ==
X-Gm-Message-State: AOJu0Ywf233FS7f/TlJ3CPhA+PHoj5tEQzo88q6s2Hzx0jHgSI5JUgKQ
	y0nALKe8VJtTz0tWqrgIbJtgedqOEtOKR6kJWdG7+h/3VjmrDA==
X-Google-Smtp-Source: AGHT+IF50cy6hdtbCxVpycQLsRglsUhgni0YNZYMpwSd3tl65fzZfTG+Np/n7+ySovHyqfduEgSnkA==
X-Received: by 2002:a17:903:1c8:b0:1d4:47d4:82c6 with SMTP id e8-20020a17090301c800b001d447d482c6mr6038447plh.99.1703864730836;
        Fri, 29 Dec 2023 07:45:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 14/41] linux-yocto/6.5: fix AB-INT: QEMU kernel panic: No irq handler for vector
Date: Fri, 29 Dec 2023 05:44:28 -1000
Message-Id: <eaa14acddf8259bef87143956766e7d3cf01d6ff.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193031

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.5:

1/2 [
    Author: Thomas Gleixner
    Email: tglx@linutronix.de
    Subject: x86/alternatives: Sync core before enabling interrupts
    Date: Thu, 7 Dec 2023 20:49:24 +0100

    text_poke_early() does:

       local_irq_save(flags);
       memcpy(addr, opcode, len);
       local_irq_restore(flags);
       sync_core();

    That's not really correct because the synchronization should happen before
    interrupts are reenabled to ensure that a pending interrupt observes the
    complete update of the opcodes.

    It's not entirely clear whether the interrupt entry provides enough
    serialization already, but moving the sync_core() invocation into interrupt
    disabled region does no harm and is obviously correct.

    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Thomas Gleixner
    Email: tglx@linutronix.de
    Subject: x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    Date: Thu, 7 Dec 2023 20:49:26 +0100

    apply_alternatives() treats alternatives with the ALT_FLAG_NOT flag set
    special as it optimizes the existing NOPs in place.

    Unfortunately this happens with interrupts enabled and does not provide any
    form of core synchronization.

    So an interrupt hitting in the middle of the update and using the affected
    code path will observe a half updated NOP and crash and burn. The following
    3 NOP sequence was observed to expose this crash halfways reliably under
    QEMU 32bit:

       0x90 0x90 0x90

    which is replaced by the optimized 3 byte NOP:

       0x8d 0x76 0x00

    So an interrupt can observe:

       1) 0x90 0x90 0x90		nop nop nop
       2) 0x8d 0x90 0x90		undefined
       3) 0x8d 0x76 0x90		lea    -0x70(%esi),%esi
       4) 0x8d 0x76 0x00		lea     0x0(%esi),%esi

    Where only #1 and #4 are true NOPs. The same problem exists for 64bit obviously.

    Disable interrupts around this NOP optimization and invoke sync_core()
    before reenabling them.

    Fixes: 270a69c4485d ("x86/alternative: Support relocations in alternatives")
    Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Cc: stable@vger.kernel.org
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c8d29ab6b02c5b783429db3b67583deb1637142)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.5.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.5.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index fccf0252d0..0120b9ba63 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1d89cd73350cad73ecf330ad3785e6d8bdec092d"
+SRCREV_machine ?= "3ad8578bcc3186cde9b35de8c56afc0cba68bc55"
 SRCREV_meta ?= "3b1f87ec237ec3ad9acffb3d75c55efe958085dc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index b63d5ad893..cc24e3d346 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "95753fe2a7d507646224fe973e2a4fc48cb7694d"
+SRCREV_machine ?= "fc3138c70652b48a0bf3620fd7aa861fa1f14e27"
 SRCREV_meta ?= "3b1f87ec237ec3ad9acffb3d75c55efe958085dc"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 984940d24c..e7abc9784a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.5/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.5/standard/base"
 KBRANCH:qemumips64 ?= "v6.5/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "3fdf15eaa1db1b6fd1de804d03c6b4a10c2c3f4b"
-SRCREV_machine:qemuarm64 ?= "70210986a1c554098fb6f75f6cd10ab85171506a"
-SRCREV_machine:qemuloongarch64 ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
-SRCREV_machine:qemumips ?= "338cee0966e9ea856a696df0a9f5432f74b06270"
-SRCREV_machine:qemuppc ?= "2fbe7b92bda7afe7aca6e58b0ac124f2a26737ee"
-SRCREV_machine:qemuriscv64 ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
-SRCREV_machine:qemuriscv32 ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
-SRCREV_machine:qemux86 ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
-SRCREV_machine:qemux86-64 ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
-SRCREV_machine:qemumips64 ?= "ff5efc72e961cf345f935ac14cdcaa9843ec5b23"
-SRCREV_machine ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
+SRCREV_machine:qemuarm ?= "07ca2c1cc013343f9a47b5ac4f37ed60f66fd73b"
+SRCREV_machine:qemuarm64 ?= "7af45f35fdcc82bbff07fa3d031620d5f5728b6b"
+SRCREV_machine:qemuloongarch64 ?= "e53dc7514de7d2fbe0f80547a50c0542928e2d11"
+SRCREV_machine:qemumips ?= "e0b08aab2ccc4257f0b34e7dcb1e054ea188a43d"
+SRCREV_machine:qemuppc ?= "9e609ca17604c708fdc6e7e5c9355bb2c5b73bcd"
+SRCREV_machine:qemuriscv64 ?= "e53dc7514de7d2fbe0f80547a50c0542928e2d11"
+SRCREV_machine:qemuriscv32 ?= "e53dc7514de7d2fbe0f80547a50c0542928e2d11"
+SRCREV_machine:qemux86 ?= "e53dc7514de7d2fbe0f80547a50c0542928e2d11"
+SRCREV_machine:qemux86-64 ?= "e53dc7514de7d2fbe0f80547a50c0542928e2d11"
+SRCREV_machine:qemumips64 ?= "58ffd9a4a907262daaedd9aca1e95e65d9716de3"
+SRCREV_machine ?= "e53dc7514de7d2fbe0f80547a50c0542928e2d11"
 SRCREV_meta ?= "3b1f87ec237ec3ad9acffb3d75c55efe958085dc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.34.1


