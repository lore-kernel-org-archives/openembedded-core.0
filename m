Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE059E8FDA9
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 19:37:10 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.136.1696361823521827396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 12:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SgU0lX67;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-27777174297so889692a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 12:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696361822; x=1696966622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXvuNO6ApavKdo7qzyZe5KCFYDt4r7tYzOMu7h3JSYw=;
        b=SgU0lX67b0vn7mYhnJVZ54bSReNSnUjBDEMH600kTWQIRRU6TTzDKz1o1yM1iSuqNX
         Vdspngh/6b4VOtwth3Db7hMc/uCb7a6md7WMmo5J+kuwRcF6NfCDsdp0mpC9qjDCpJS9
         IncIoCiQD6zKJa8vr6yjGTo568WBB7NLsifmd8b+XHn8W5I7LUz+d5fhHBjic8KHU8Cn
         erVM9KM5p4WRheLgnfXvTeHemhHmB4WyDUaCWTaQWAEgWAfNv74BTUFH7agtAxiBGRTX
         9s/kkZV/kJCc5uBtx0j1RvzVCWwJjp5bMLQI1dKxr79u3IngZtTEqaNxbqgQosJM+bmI
         4E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361822; x=1696966622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXvuNO6ApavKdo7qzyZe5KCFYDt4r7tYzOMu7h3JSYw=;
        b=jUyrdZZ3arUovdRsRQDU0tpKB+RO/Bxp5YaL3mAPa8pA0STbejfjWBkBX5eYE3gDBi
         nCpSNcoFn/tEVSlpZHq6Ci5RVwizwGFsZshwzlssZeakoO6I9uDkYZZ/ts/DBnn5NnJr
         4qYxBDAsKPBS8V27SGankSi4097NJ7iWkQdXdrcC9V6ba760DTlVSnxxMenZrq4vqQJQ
         DEUncWO8MjRWyOb7hukjrFuSfJyn5GGDoZb2Spfsx2Gxg+Jp2asdAhT7c5PItmEpyznA
         vg6OOlAypyml58iFpbnYj5SNpreiWeMnMmiQ5jDV0xzeodbiD4ZJEgKzQ0F7PkcOWNbg
         D/VQ==
X-Gm-Message-State: AOJu0YwHKdU0tt6aecsn+/DwEa869cRLk2TRfa1uk1WBfD7jqev7+shR
	PpQj/kgddgw1Dipkwu+0Z7CM/eypMHOEEY8JpZw=
X-Google-Smtp-Source: AGHT+IHmdL3lgjHnD5yT+1zDhfBt5LX/mxbwdhWZJ0Ln5VFoTnLtPaqv3r4rns5oHwpdZC9ovY3LGA==
X-Received: by 2002:a17:90a:4304:b0:263:5d25:150c with SMTP id q4-20020a17090a430400b002635d25150cmr283553pjg.29.1696361822521;
        Tue, 03 Oct 2023 12:37:02 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b0025dc5749b4csm9333642pje.21.2023.10.03.12.37.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:37:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/10] linux-yocto/5.10: update to v5.10.189
Date: Tue,  3 Oct 2023 09:36:43 -1000
Message-Id: <f674e44ff69a1e51c4b6929d195ce0a110577c12.1696361593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696361593.git.steve@sakoman.com>
References: <cover.1696361593.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 19:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188653

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    de5f63612d16 Linux 5.10.189
    2ae9a73819a7 x86: fix backwards merge of GDS/SRSO bit
    f9167a2d6b94 xen/netback: Fix buffer overrun triggered by unusual packet
    8457fb5740b1 x86/srso: Tie SBPB bit setting to microcode patch detection
    4873939c0e1c x86/srso: Fix return thunks in generated code
    384d41bea948 x86/srso: Add IBPB on VMEXIT
    4acaea47e3bc x86/srso: Add IBPB
    e47af0c255ae x86/srso: Add SRSO_NO support
    df76a59feba5 x86/srso: Add IBPB_BRTYPE support
    3f9b7101bea1 x86/srso: Add a Speculative RAS Overflow mitigation
    34f23ba8a399 x86/cpu, kvm: Add support for CPUID_80000021_EAX
    073a28a9b506 x86/bugs: Increase the x86 bugs vector size to two u32s
    9b7fe7c6fbc0 tools headers cpufeatures: Sync with the kernel sources
    437fa179f213 x86/cpufeatures: Assign dedicated feature word for CPUID_0x8000001F[EAX]
    baf6d6c39e23 x86/cpu: Add VM page flush MSR availablility as a CPUID feature
    675046878431 Documentation/x86: Fix backwards on/off logic about YMM support
    79972c2b95ec x86/mm: Initialize text poking earlier
    1ff14defdfc9 mm: Move mm_cachep initialization to mm_init()
    6ee042fd240f x86/mm: Use mm_alloc() in poking_init()
    f076d0817878 x86/mm: fix poking_init() for Xen PV guests
    583016037a09 x86/xen: Fix secondary processors' FPU initialization
    eb13cce48874 KVM: Add GDS_NO support to KVM
    7db4ddcb8d8e x86/speculation: Add Kconfig option for GDS
    363c98f9cfa8 x86/speculation: Add force option to GDS mitigation
    288a2f6bc1ce x86/speculation: Add Gather Data Sampling mitigation
    4ae1cbb730bd x86/fpu: Move FPU initialization into arch_cpu_finalize_init()
    2462bc3ef061 x86/fpu: Mark init functions __init
    7a2f42bce9ab x86/fpu: Remove cpuinfo argument from init functions
    18fcd72da1ed init, x86: Move mem_encrypt_init() into arch_cpu_finalize_init()
    09658b81d158 init: Invoke arch_cpu_finalize_init() earlier
    bf2fa3a9d0e6 init: Remove check_bugs() leftovers
    b05031c2bca7 um/cpu: Switch to arch_cpu_finalize_init()
    2edb3b39ca79 sparc/cpu: Switch to arch_cpu_finalize_init()
    3c45134b38b4 sh/cpu: Switch to arch_cpu_finalize_init()
    75bb54c951e9 mips/cpu: Switch to arch_cpu_finalize_init()
    1cd3fc18eb16 m68k/cpu: Switch to arch_cpu_finalize_init()
    12d93c6c98d5 ia64/cpu: Switch to arch_cpu_finalize_init()
    c0fff20d4efa ARM: cpu: Switch to arch_cpu_finalize_init()
    e5eb18e164d0 x86/cpu: Switch to arch_cpu_finalize_init()
    6e606e681873 init: Provide arch_cpu_finalize_init()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 5b59ebac16..772ffac071 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "40d51460c17be51e4ebcdcc54a8ee8c86707c56c"
-SRCREV_meta ?= "9b0d4e338b1bbdd683347cf9365bacfec2169035"
+SRCREV_machine ?= "63fd205e5d1e048a576d5ba03cdbdf5782a2f6b4"
+SRCREV_meta ?= "603507f09e4a22a650e37fb9dcfbcb69ceb36841"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.188"
+LINUX_VERSION ?= "5.10.189"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 3a58a1a659..aebec33555 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.188"
+LINUX_VERSION ?= "5.10.189"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "41daa5d20567419e303d0b684fd3c3c859446d24"
-SRCREV_machine ?= "085bed8577aa6435339ff83339e38dfd9e7994a6"
-SRCREV_meta ?= "9b0d4e338b1bbdd683347cf9365bacfec2169035"
+SRCREV_machine:qemuarm ?= "8f8fe5c5719959ad536be166937fc22606b7a7f3"
+SRCREV_machine ?= "452190ae123212f7d3c233fc48419c60874f4223"
+SRCREV_meta ?= "603507f09e4a22a650e37fb9dcfbcb69ceb36841"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 4b316b9b5f..81dce1a513 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "66536572b0fe35ac0e5158d69d12641281ab93ef"
-SRCREV_machine:qemuarm64 ?= "00d0178dae976305eaecc7fc119da63930bcf07f"
-SRCREV_machine:qemumips ?= "8cc44bb4c536028438decbb5abf2d8b731898ec0"
-SRCREV_machine:qemuppc ?= "1f2a193c7f82e2f2c7eefc2fa35dce5b96cc3ba9"
-SRCREV_machine:qemuriscv64 ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
-SRCREV_machine:qemuriscv32 ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
-SRCREV_machine:qemux86 ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
-SRCREV_machine:qemux86-64 ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
-SRCREV_machine:qemumips64 ?= "2fe172b06a5b6d8840c0c0226a1501b627b9e703"
-SRCREV_machine ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
-SRCREV_meta ?= "9b0d4e338b1bbdd683347cf9365bacfec2169035"
+SRCREV_machine:qemuarm ?= "0f9599a793f23d2e1cd2da30aba53c4876b3621d"
+SRCREV_machine:qemuarm64 ?= "358a41898b853ccfc3309fcf30a95621b3d15ec6"
+SRCREV_machine:qemumips ?= "8ad0f4fa028c844dbc6f32321664488e50bd5e64"
+SRCREV_machine:qemuppc ?= "4f0a30a5edc13b65482bb788d1a2eb7a5405190a"
+SRCREV_machine:qemuriscv64 ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
+SRCREV_machine:qemuriscv32 ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
+SRCREV_machine:qemux86 ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
+SRCREV_machine:qemux86-64 ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
+SRCREV_machine:qemumips64 ?= "a01ff251fdd19b1ab7ee109c7ee2213e6b01a28b"
+SRCREV_machine ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
+SRCREV_meta ?= "603507f09e4a22a650e37fb9dcfbcb69ceb36841"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.188"
+LINUX_VERSION ?= "5.10.189"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


