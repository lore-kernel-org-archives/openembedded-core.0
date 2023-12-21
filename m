Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52392C47070
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:25:20 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.52376.1703168719566234358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 06:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PZLAX1Y9;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-77f50307a1fso51819185a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 06:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703168718; x=1703773518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGwO3UDsK3/lFFNsaPRV+60fshzDvOU9hmAfoj2NK4M=;
        b=PZLAX1Y9BPTES1UtKCKwbJu/s7Dk6KxZUSrUQKreCzFZCJG9Xg8MxJj3PvI3RW7bT1
         gkOwimtCDrv142avROry6vypaz2WycEEAvXDnoR4pv4GYEAhgJZpHEiHwpC0WFZeZoik
         66QL456Dh+7KTNAYj8pM3Mgxy8eKPVbicpXJB5E8lL5NleeYE9qA5hmylKrEcY4MGWW6
         K1jvM6aYKM3YcYP9ChrjFYLq9HnKcWP95bPv4fsbJWCXn+7w9WtJJnObA9rHyquBZuJO
         2X6WWJ1thsLrMe1GcYx9Pe27j2pzUoWP7/jbqMK8mTZMb5vWLAiAqk1bvmnX5eM5rzAc
         ecPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703168718; x=1703773518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGwO3UDsK3/lFFNsaPRV+60fshzDvOU9hmAfoj2NK4M=;
        b=a7mQCvZJgGUOFckXyIqPI76Zlm5yWGTTXlHt3Cr5itnQnwap6MWVnqQKqHeQFal21E
         MRy9alOpYSkjQsnsaydj4najtYPy59Te1XNRwh2ql6zlT3f+olQuOhwACUxnkv8dREZ+
         X9HSgMCRCqqtKsN9uDQJX4zxq98071+qS62tnd631L72iGH5vZMRQ6erxk9r68jGxib2
         yayMfnAK3qEdhFkVfrw5q2bpyK5J5weBGsFFiYnTseZJ85lodxqAz7SSq1eTVCd/kvJW
         M+EdOVpzjcu/ockpNMs+kTOo/rr6EgfI+0IQllMfJJJqDjWyY49sBHLzbX7ll3Et4fIq
         Sveg==
X-Gm-Message-State: AOJu0YwgnPF08mjfYtJdKYwc2hGsAIizK0Nuna0f/Wa7ZG0+D9F0ug3+
	MuZjz9tqnfj4/1BH61QPvbUCrR5Dqes4IvRm
X-Google-Smtp-Source: AGHT+IGZpDVO9Lt6CIL6dRM6tExpaGIN0f8xloYTmI5yW58CSbX3Swhoh3iU3fLcO9afz1kXicGk3Q==
X-Received: by 2002:a05:620a:199b:b0:77f:4083:bc22 with SMTP id bm27-20020a05620a199b00b0077f4083bc22mr32037102qkb.145.1703168718554;
        Thu, 21 Dec 2023 06:25:18 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g4-20020a37e204000000b0077eff6eece8sm679490qki.62.2023.12.21.06.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 06:25:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/6.5: fix AB-INT: QEMU kernel panic: No irq handler for vector
Date: Thu, 21 Dec 2023 09:25:08 -0500
Message-Id: <f39e9ce36150f9e074255fbdecdc54659263e654.1703168370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1703168370.git.bruce.ashfield@gmail.com>
References: <cover.1703168370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 14:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192835

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
2.39.2


