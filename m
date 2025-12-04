Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844D3D1CDD8
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:42 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35236.1764822634609884971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZTPVNM96;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8a3eac7ca30so27790085a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822633; x=1765427433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rpvy5rM6DV5rqDSH9ggWHNmF0M1ipeyKh//j6Z1lOnk=;
        b=ZTPVNM96w5G4aFSOiFVsES74kIpkCewcUNOirpRAAjROPRutPdfMr1DfNEoqcSq/RF
         arfHvrRkSa3A4s2VRscGcd4wDDIUL5vxqrC+ZlYRh44tC2ZNwdS0SMMX3cr32BRUER9N
         lKL/TfEXcNID5OiW+WBEXo59zqNMMRMR7vxvbmA1XIABMSXRn45YmEy1KDYc+aau/pqJ
         6LkF2d9d+cKKhCmNNof725U+avotKZ4c7ocn6PqYRZH0H5Avufk3I2JWIejA5VnYjB7b
         df7QSJTwfTrx2pcSIECeXVG/X2ajMznQu1q6aCQia4zAQmVdq0YIwVikf7UyfbjAh14+
         Ioaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822633; x=1765427433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rpvy5rM6DV5rqDSH9ggWHNmF0M1ipeyKh//j6Z1lOnk=;
        b=gmsHZzXuHBveB8LYs3Fud23KugnM4DjsuGxx43j1oxSkdalRL24+JgEJ+xFHXdwL9R
         tSZ35u5WCfitXCfR75nD3Z8a0FBlrFp/h0bxYZSum6/Cg2S47VgIJNQ+t1bmRs63Kds6
         BNLku+VZqDm//1vejp1eVcENaAANi1hEtrrMEIjfwD2ZeUgtVCH9NQnTrndI+gzl9cgG
         ExdIwlhbabfW061sRTyy1dJMCagyF5e8w+w2uFIJPKz+AyeQd6r5IFAJ5VM1Xk4A/W16
         EGLeRrn7gFyUUK6sz4mEjNpceRpoYdm4oFS3lwq1nYE7VVgMY9nvHMVlui9fOJ4uVhM+
         IzfQ==
X-Gm-Message-State: AOJu0YxKbKU/M253oLVCy8td8IagxpLth3ht4kKszZO36A8lB4scenAI
	DGIzFBC5R73rvND359OTvXQdHsa0+MMLzq4zNhJMJpFhPehooyujZ8IT
X-Gm-Gg: ASbGncs41OPX9U0RUVgWupPOJJua9Z5iVPuSb6jX2jAHGb2uwSGwl/zUJNGcTv1DiYQ
	/lRPdRv+UWIfV15LhyBgedOqrMtsgj1cosTydRt1V0V0i2J4pnzoGA6VJfalkSE4EJopOJZSNz7
	b6WjKtKDopyzyt80VQYm2CIPZ34n0rjOFjuGwo/v+1kKd6UDw3RDcQ+XMMUsFB3U4/xn+qjxD3P
	/m0gf4B5kdGYJ4irNbG+NwYuu4xg9BxP5ul7e55Aw+N6SOvjv6C89TiWOykLjkBWAQqgKS2+MPJ
	iXoG0w5mXoxv/S0Ppp7GETYaMfgp+xrhS0nFqqSes2gGKkYFEhvbGo/T+Y58NgpZkDRIQu02kwe
	DijZbViVimN+VQjR0+HKsKVT7yPsFQxvISqXrnEDVnjB4/P5C6dgddufdhC3aEOQo1wymDjncb5
	txNQzse6NvzglbjcqcKl7du5lO0AiDrXl4AOdbzJdESYO5f8ni11emnOmUziRoHfj8y49/2I0ZW
	RBcV33C/aPUwTA=
X-Google-Smtp-Source: AGHT+IEU5KSF8f83mD+ATA/C5b8B+JNbHI1fxqozJgIgLG4uqdOOEP5qiYqwyCrFYmOrP9WYxlJExA==
X-Received: by 2002:ac8:7e82:0:b0:4e8:abbc:a7d7 with SMTP id d75a77b69052e-4f023af8094mr22238701cf.84.1764822633436;
        Wed, 03 Dec 2025 20:30:33 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:32 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/16] linux-yocto/6.17: update to v6.17.7
Date: Wed,  3 Dec 2025 23:30:14 -0500
Message-Id: <b209b1c9629a598740e858120ce997537f892a26.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227253

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.17 to the latest korg -stable release that comprises
the following commits:

    7660ce69123ea Linux 6.17.7
    dcc76777c6490 btrfs: tree-checker: fix bounds check in check_inode_extref()
    bd0a905c22327 arch: Add the macro COMPILE_OFFSETS to all the asm-offsets.c
    a0ba52a5a1bb3 sched_ext: Make qmap dump operation non-destructive
    feec2bf6e1e93 btrfs: use smp_mb__after_atomic() when forcing COW in create_pending_snapshot()
    1bc53d252a74c btrfs: tree-checker: add inode extref checks
    3bc6f92c663f7 btrfs: abort transaction if we fail to update inode in log replay dir fixup
    2f4097e63e5b3 btrfs: use level argument in log tree walk callback replay_one_buffer()
    e3eec45b91f68 btrfs: always drop log root tree reference in btrfs_replay_log()
    8e36ab6903b58 btrfs: scrub: replace max_t()/min_t() with clamp() in scrub_throttle_dev_io()
    9c50fde908c42 btrfs: zoned: refine extent allocator hint selection
    a545d81fe8fd0 btrfs: zoned: return error from btrfs_zone_finish_endio()
    e587f12fff779 btrfs: abort transaction in the process_one_buffer() log tree walk callback
    b64764e38bcdb btrfs: abort transaction on specific error places when walking log tree
    c198b19552fd3 cpuset: Use new excpus for nocpu error check when enabling root partition
    47f3af1a9bd70 EDAC/mc_sysfs: Increase legacy channel support to 16
    6561a5b4e3d16 x86/bugs: Fix reporting of LFENCE retpoline
    28621b2b0a8c8 x86/bugs: Add attack vector controls for VMSCAPE
    09a75f371298a sched_ext: Keep bypass on between enable failure and scx_disable_workfn()
    b7d86707660cf seccomp: passthrough uprobe systemcall without filtering
    a2c98fc5184dd EDAC: Fix wrong executable file modes for C source files
    02b3654ea8bdc perf: Skip user unwind if the task is a kernel thread
    10f41e2a8f501 perf: Have get_perf_callchain() return NULL if crosstask and user are set
    5050083e1a2f3 perf: Use current->flags & PF_KTHREAD|PF_USER_WORKER instead of current->mm == NULL
    b5e8d61c3b94d perf/x86/intel: Add ICL_FIXED_0_ADAPTIVE bit into INTEL_FIXED_BITS_MASK
    cc81ee432884d EDAC/ie31200: Add two more Intel Alder Lake-S SoCs for EDAC support
    38a020eb9ee49 audit: record fanotify event regardless of presence of rules
    f1971d5ba2efe genirq/manage: Add buslock back in to enable_irq()
    b990b4c6ea6bd genirq/manage: Add buslock back in to __disable_irq_nosync()
    3c97437239dfa genirq/chip: Add buslock back in to irq_set_handler()
    53aa2e9ef30c9 x86/bugs: Qualify RETBLEED_INTEL_MSG
    50021894336f7 x86/bugs: Report correct retbleed mitigation status
    66178a7bdd6d3 timekeeping: Fix aux clocks sysfs initialization loop bound
    60407ac17238a sched_ext: Sync error_irq_work before freeing scx_sched
    733d0e11840ef sched_ext: Put event_stats_cpu in struct scx_sched_pcpu
    2efd07e29054c sched_ext: Move internal type and accessor definitions to ext_internal.h

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.17.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.17.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.17.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
index 883fbbea0ae..90241488236 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e91a8eb1303c8fcf52e24099fb6246c538b8441a"
-SRCREV_meta ?= "17d3a09a9c0fbee9066660a8af341235f919343f"
+SRCREV_machine ?= "ec65f0ddf93e8dd3499482d166725c8548f6af65"
+SRCREV_meta ?= "d54d08a25356729340a413253c738b8a0d6c4da5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.17.6"
+LINUX_VERSION ?= "6.17.7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
index 7a8888d8e52..c5c15540520 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.17.inc
 
-LINUX_VERSION ?= "6.17.6"
+LINUX_VERSION ?= "6.17.7"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3951620137e1a21f5038c157fb5c32ab188eecf8"
-SRCREV_meta ?= "17d3a09a9c0fbee9066660a8af341235f919343f"
+SRCREV_machine ?= "e92d9fd0cb4a691ad487797d96fa2706e5c75626"
+SRCREV_meta ?= "d54d08a25356729340a413253c738b8a0d6c4da5"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index ed517bce7f8..db63abb3ccb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.17/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.17/standard/base"
 KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "11f0c9e4250581afe8f245db37694466c020bf93"
-SRCREV_machine:qemuarm64 ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
-SRCREV_machine:qemuloongarch64 ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
+SRCREV_machine:qemuarm ?= "bac520a62b7b2f90204df17e1119f724782e04b9"
+SRCREV_machine:qemuarm64 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
+SRCREV_machine:qemuloongarch64 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
-SRCREV_machine:qemuriscv64 ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
-SRCREV_machine:qemuriscv32 ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
-SRCREV_machine:qemux86 ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
-SRCREV_machine:qemux86-64 ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
+SRCREV_machine:qemuppc ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
+SRCREV_machine:qemuriscv64 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
+SRCREV_machine:qemuriscv32 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
+SRCREV_machine:qemux86 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
+SRCREV_machine:qemux86-64 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
-SRCREV_meta ?= "17d3a09a9c0fbee9066660a8af341235f919343f"
+SRCREV_machine ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
+SRCREV_meta ?= "d54d08a25356729340a413253c738b8a0d6c4da5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "371f1e070fa95c71356104a406855a361aad5668"
+SRCREV_machine:class-devupstream ?= "7660ce69123ea73b22930fcf20d995ad310049ef"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.17/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.17.6"
+LINUX_VERSION ?= "6.17.7"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


