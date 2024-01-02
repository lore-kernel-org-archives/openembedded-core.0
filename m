Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68303C47077
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 04:31:24 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.22782.1704169875377975124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 20:31:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MJoXH02A;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-781048954d9so779083085a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 20:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704169874; x=1704774674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/gIjBFCA6lZy5dqnsXa+ny4PzQXMtnK/hxMy4nqdHQ=;
        b=MJoXH02A96YsJFR6PmlmRJy2UJYfbyMFf1isu+qy+PpUDscZzD6sj/zZUz4xb7j/Gb
         QoZOj8cs13/vu93Uk8ZlSH5ZqgjVBjPI7KBRAwjGIq9bvMXuOX4q1+03X9AYh+yT1yN5
         tJAemKk10F+NxN6mzb9j1/wQ8mTwTfLdICaTpjlDEYBXUQWQIW1lpe2faWzuXHdhNTOq
         DGyj/ZJ5n/PImocRl2D5ab3cEFDuQwU9yX3+jce5AsX0wyhh8aQx751nB2ecOtLhYB63
         cBtoQlaM90MPmeQ4XE2OdxV+Vgg4hd92tWCNzQyyToudAzz88naImMaH29dHInFDkAnR
         hozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704169874; x=1704774674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/gIjBFCA6lZy5dqnsXa+ny4PzQXMtnK/hxMy4nqdHQ=;
        b=pptu3N51OGP5RxVZmOpozQ2H8Nez9XNTBXGobQ6bXDqisQM/BvTM0Nyq1fiai4t6l6
         R+/Gtz7LPeEv0gGfACb4knsaspzfk0lmzit+SL/TI40kq0OsXGnRIReNcSVqRf7agV5I
         OGwOImRBVhvzohmkfvZIwRoGbNZdyPwGE0/a7GPgh3Wqzc05Z28VYwx4GGQCIh9/SpsR
         PAHlrcq5ITeZGDLIhZBdQPE8isbI3EKEYfKtccxCTIQtoIHMYyxgfyOFqbHNmNP+kgbc
         U3rYKWCFrOLXDei2zmHC8orxzNrKWKJFS122TyUp0jUu1Z6sJH4NdBlXf4Hi8AbZz0IC
         g1sg==
X-Gm-Message-State: AOJu0YyHOouNrRDlVRXF32VbT5iAJuXAC8V2DS1LpAvnWAJCLUpq9DOK
	vfwfW9il4Eq7cpFywmz9gzyYGpugVG1dK+TvKfw=
X-Google-Smtp-Source: AGHT+IF7fTyebgcnOJZPSoH0kG3x8x6DdTGLZy4pIldu8+HmgdtHOo5uVdh3jkpI3IpLpm+d12KRmg==
X-Received: by 2002:a05:620a:22a4:b0:781:578b:3b7b with SMTP id p4-20020a05620a22a400b00781578b3b7bmr13395074qkh.23.1704169874332;
        Mon, 01 Jan 2024 20:31:14 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t1-20020a05620a004100b00781df3924f3sm39045qkt.129.2024.01.01.20.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:31:13 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/6.6: fix AB-INT: QEMU kernel panic: No irq handler for vector
Date: Mon,  1 Jan 2024 23:31:05 -0500
Message-Id: <f3642126dfbcc65b04fe28affdeb0cc8f6fe3703.1704169585.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704169585.git.bruce.ashfield@gmail.com>
References: <cover.1704169585.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 04:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193199

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

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
 .../linux/linux-yocto-rt_6.6.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 0c0ce6afea..9a9d1ab33a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bce0cb6bbe24682d839c3e212270e3744e32aabe"
+SRCREV_machine ?= "3364e561d527a5dcca1803dcf5a7e2a7aa3a398e"
 SRCREV_meta ?= "8ab17895c185426442d80a60829619270f9ac51d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index edb8001069..547b5ee922 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
+SRCREV_machine ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
 SRCREV_meta ?= "8ab17895c185426442d80a60829619270f9ac51d"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 4fa6c505f5..57a394d171 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8a23d09163eedc42ed63f2741ae2fa7d8aa926aa"
-SRCREV_machine:qemuarm64 ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
-SRCREV_machine:qemuloongarch64 ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
-SRCREV_machine:qemumips ?= "a0a00df5c1cd3cdd346f410f71998a120e284f78"
-SRCREV_machine:qemuppc ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
-SRCREV_machine:qemuriscv64 ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
-SRCREV_machine:qemuriscv32 ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
-SRCREV_machine:qemux86 ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
-SRCREV_machine:qemux86-64 ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
-SRCREV_machine:qemumips64 ?= "971214747a173452ae3ab4c6dcf1d91451b6e9be"
-SRCREV_machine ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
+SRCREV_machine:qemuarm ?= "ff8331e10427c145659bf6a5f87b9109011159cf"
+SRCREV_machine:qemuarm64 ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
+SRCREV_machine:qemuloongarch64 ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
+SRCREV_machine:qemumips ?= "afa3730deded0bc56f1470b59f65d86f20dfb256"
+SRCREV_machine:qemuppc ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
+SRCREV_machine:qemuriscv64 ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
+SRCREV_machine:qemuriscv32 ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
+SRCREV_machine:qemux86 ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
+SRCREV_machine:qemux86-64 ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
+SRCREV_machine:qemumips64 ?= "a93ff794461d9ba7ec5b02d482b60d9ca582e97f"
+SRCREV_machine ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
 SRCREV_meta ?= "8ab17895c185426442d80a60829619270f9ac51d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.39.2


