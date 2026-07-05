Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48EEC44503
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140013.1783291365155652447
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xBf3Iedc;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2681518f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291363; x=1783896163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qD7yUIraP9yiXWn1h25hN2sTqdyLSUwad1qUY2ZhqQc=;
        b=xBf3Iedc2m8rhIaA1tkU9U4W/jh9U4tmcNWNRhi6SGJP0rtVXmBOXLL0Heevcff6Ka
         sJGj7vBkU31LPFDLNhpkYcK/EULZ2obaRh6Gl+kllnLmnsIn7ZBL3DziTRwYMb0h+VgC
         FTLvXD72dGESahI7oPMJnI1yCdA+cC5ptWG+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291363; x=1783896163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qD7yUIraP9yiXWn1h25hN2sTqdyLSUwad1qUY2ZhqQc=;
        b=gfV50P1jIDCFTvHWRTaAg4YbFN8YCudo+5FJrcQRqBtKxsBEEnJ0xrIdWAyT2YG38q
         MqZJFcxJeeQc0a4mO8Wi3oEkTU0nSxmMh+PcmVmnll3M7Lq1AHZj04KZANLpburyJSM/
         +YK0f1vcE4Xfxc/v2HONJMLkr2NiW4NTn6nN6VJrPU7xRcciOupuIV4200lyZWVf2fKE
         J+G5nEeb26Frqo68BmCkQtSQGSvQIJWdBlMPY1C5m8xJ9SGvpUO5qRUuMT53X2yZQU8h
         XPRqNcydeuLST7UYjC0rG2158ee+zWex5saYe0yOxId30gQsv/d0xEzbjBHzV2sGfm51
         L6rA==
X-Gm-Message-State: AOJu0YyP9S9Pq2yuPvxDflFjmcyxSrJXX0AdLYiypyR0U6xjoA91sEBB
	uJ65H68pYMPPV56wWsH4I8DtyTPFxuapwFgkyZq8laoecHqjhi5Ynw91May4DW0W/9pGFS99N3l
	8lw8mRoo=
X-Gm-Gg: AfdE7cm1d9ee5UeksfSk/owjoiAT+dzpbdxHzkTu6gU9JQvKWaYCoY9jZQnsDe9xdKm
	G+AIAswp2slFXyYnpq35dJ/1VxZzDgDyDH1u7pmVZPBthvsWm0Jgm+mYHew1oFFZVv+tp+sCtt+
	VGuRDCQBgQg6udrdfAg/4yC0GPrjRFX+YELU1GgL3HauQ7kSOmTj+KWZcc8rTzYlSSewxiiSy/A
	UGrqvFIrcuPOcIbiSSq6lyybICqQZRCaSXG1YN3yqMFjeTqa65fG4ntl/bpB01gGFpWup8zbyPZ
	wIyxpKhAhTQ+UoVQeZvmKBsg8fn/v7glJeqJrpzz2XNCjohbOZEielu8bpfX0RHLqS5I1c9o7t/
	c5gU+FhFShiukp84nyuCAWKjnlbVtTWF68n9ZevAfZEgq2mjjeT5srf2k7w7itiY2Uy1uf4q2P/
	IFxjmwyuyGYJa9u8pgKkIpws54SerAixgLMf3v
X-Received: by 2002:adf:e5cd:0:b0:475:f0c2:75a1 with SMTP id ffacd0b85a97d-47aac9bed0amr6684532f8f.50.1783291363249;
        Sun, 05 Jul 2026 15:42:43 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/55] linux-yocto/6.18: update to v6.18.25
Date: Mon,  6 Jul 2026 00:40:55 +0200
Message-ID: <84cc0f0d988c782516c151281808b93626e006a8.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240159

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    a256b1e6892e7 Linux 6.18.25
    ce383ba615339 rxrpc: Fix missing validation of ticket length in non-XDR key preparsing
    2937f17bbeefb crypto: ccp: Don't attempt to copy ID to userspace if PSP command failed
    051e51aa55fd4 crypto: ccp: Don't attempt to copy PDH cert to userspace if PSP command failed
    111dcc6d0f016 crypto: ccp: Don't attempt to copy CSR to userspace if PSP command failed
    28324a3b62d9c net/packet: fix TOCTOU race on mmap'd vnet_hdr in tpacket_snd()
    6473ed16df1fe ALSA: caiaq: take a reference on the USB device in create_card()
    f8397fc0ff9a4 ALSA: hda/realtek: Add quirk for Legion S7 15IMH
    1d30e8d4a07c1 ALSA: usb-audio: apply quirk for MOONDROP JU Jiu
    c76cf339b8797 f2fs: fix use-after-free of sbi in f2fs_compress_write_end_io()
    028103656b842 writeback: Fix use after free in inode_switch_wbs_work_fn()
    feefd5d5b5ee2 ksmbd: reset rcount per connection in ksmbd_conn_wait_idle_sess_id()
    5e7b8f3c539d6 ksmbd: use check_add_overflow() to prevent u16 DACL size overflow
    790304c02bf9b ksmbd: fix out-of-bounds write in smb2_get_ea() EA alignment
    3e5360b422dd7 ksmbd: validate num_aces and harden ACE walk in smb_inherit_dacl()
    299db777ea0cf ksmbd: validate response sizes in ipc_validate_msg()
    078fae8f50ade smb: client: fix OOB read in smb2_ioctl_query_info QUERY_INFO path
    38a69f08ee82c smb: client: require a full NFS mode SID before reading mode bits
    3943e4565aae7 smb: server: fix max_connections off-by-one in tcp accept path
    283027aa93380 smb: server: fix active_num_conn leak on transport allocation failure
    90089584b2e25 ksmbd: require minimum ACE size in smb_check_perm_dacl()
    3fa185e320197 fuse: fuse_dev_ioctl_clone() should wait for device file to be initialized
    9ef130452eaf1 fuse: quiet down complaints in fuse_conn_limit_write
    1381635aeb7f8 fuse: Check for large folio with SPLICE_F_MOVE
    0c7fca880a40a fuse: abort on fatal signal during sync init
    7de93abfaae1b fuse: reject oversized dirents in page cache
    59970b2586fef f2fs: fix to avoid uninit-value access in f2fs_sanity_check_node_footer
    047c0aef6af37 f2fs: fix to avoid memory leak in f2fs_rename()
    963d2e24d9d92 f2fs: fix UAF caused by decrementing sbi->nr_pages[] in f2fs_write_end_io()
    748c5d08f1a92 f2fs: fix to do sanity check on dcc->discard_cmd_cnt conditionally
    0112e6279420d fs/ntfs3: validate rec->used in journal-replay file record check
    f218fb82877b1 scripts/dtc: Remove unused dts_version in dtc-lexer.l
    c846ed5ac80fa lib/crypto: tests: Drop the default to CRYPTO_SELFTESTS
    ca47b87f24571 kunit: configs: Enable all crypto library tests in all_tests.config
    95c05443aa34e lib/crypto: tests: Introduce CRYPTO_LIB_ENABLE_ALL_FOR_KUNIT
    b0ca42c018837 lib/crypto: tests: Add a .kunitconfig file
    05f723be4d641 kunit: configs: Enable all CRC tests in all_tests.config
    04c61029a3b76 lib/crc: tests: Add a .kunitconfig file
    6897bdfa505f9 lib/crc: tests: Add CRC_ENABLE_ALL_FOR_KUNIT
    e70c01412893c lib/crc: tests: Make crc_kunit test only the enabled CRC variants
    28f77fca44497 sched/debug: Fix avg_vruntime() usage
    c6c87a23de4bd arm64: errata: Work around early CME DVMSync acknowledgement
    ee5ce483d4280 arm64: cputype: Add C1-Pro definitions
    456d6040bb3b2 arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()
    e785d2751b1db arm64: tlb: Introduce __tlbi_sync_s1ish_{kernel,batch}() for TLB maintenance
    243cec136a748 arm64: tlb: Optimize ARM64_WORKAROUND_REPEAT_TLBI
    609624576b6fd arm64: tlb: Allow XZR argument to TLBI ops
    00ce8d6789dae ksmbd: validate owner of durable handle on reconnect
    3d6682726c2d3 ksmbd: fix use-after-free in __ksmbd_close_fd() via durable scavenger
    377bbec04e167 scripts: generate_rust_analyzer.py: define scripts
    07cbb1bd42437 crypto: krb5enc - fix async decrypt skipping hash verification
    41d151254caa7 crypto: krb5enc - fix sleepable flag handling in encrypt dispatch
    b7cddf6c01751 drm/amdgpu: replace PASID IDR with XArray
    e97593f32bd57 net: ethernet: mtk_eth_soc: initialize PPE per-tag-layer MTU registers
    c5cedee5d9738 ipv6: add NULL checks for idev in SRv6 paths
    ecc0eb147806f crypto: authencesn - Fix src offset when decrypting in-place

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 268090b61118eb9358f57e753a42380b9ea91253)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index c6b46d229d8..bc601df34d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "61009d487b66b56d967a7d05e9ef15a05be8ca66"
-SRCREV_meta ?= "f94e250f9bd55d855b1a41e3cd72beebb3849ae3"
+SRCREV_machine ?= "b47fc8aaa6f14b240bd96eb35e73d3d8ba638d21"
+SRCREV_meta ?= "177495c151446a679945c20611499537d72ebcd9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.24"
+LINUX_VERSION ?= "6.18.25"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index ef40c4864f5..638fdd18bf8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.24"
+LINUX_VERSION ?= "6.18.25"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b1ba5428513b52c2bd6acfd3ad0a910f699bc395"
-SRCREV_meta ?= "f94e250f9bd55d855b1a41e3cd72beebb3849ae3"
+SRCREV_machine ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
+SRCREV_meta ?= "177495c151446a679945c20611499537d72ebcd9"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 5a1c22b93d7..05eccdc05ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "36c7eede87754f5077c67b79f86a8110969c3386"
-SRCREV_machine:qemuarm64 ?= "b1ba5428513b52c2bd6acfd3ad0a910f699bc395"
-SRCREV_machine:qemuloongarch64 ?= "b1ba5428513b52c2bd6acfd3ad0a910f699bc395"
+SRCREV_machine:qemuarm ?= "6788c0f14b51b8c84f0153d58b00d5115f2ee8e5"
+SRCREV_machine:qemuarm64 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
+SRCREV_machine:qemuloongarch64 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "b1ba5428513b52c2bd6acfd3ad0a910f699bc395"
-SRCREV_machine:qemuriscv64 ?= "b1ba5428513b52c2bd6acfd3ad0a910f699bc395"
-SRCREV_machine:qemuriscv32 ?= "b1ba5428513b52c2bd6acfd3ad0a910f699bc395"
-SRCREV_machine:qemux86 ?= "b1ba5428513b52c2bd6acfd3ad0a910f699bc395"
-SRCREV_machine:qemux86-64 ?= "b1ba5428513b52c2bd6acfd3ad0a910f699bc395"
+SRCREV_machine:qemuppc ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
+SRCREV_machine:qemuriscv64 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
+SRCREV_machine:qemuriscv32 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
+SRCREV_machine:qemux86 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
+SRCREV_machine:qemux86-64 ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "b1ba5428513b52c2bd6acfd3ad0a910f699bc395"
-SRCREV_meta ?= "f94e250f9bd55d855b1a41e3cd72beebb3849ae3"
+SRCREV_machine ?= "61a746df3dd151cccb3078ee6e1092d227b2514a"
+SRCREV_meta ?= "177495c151446a679945c20611499537d72ebcd9"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c0d886e4af574740bcffafda40ae692918ca87f9"
+SRCREV_machine:class-devupstream ?= "a256b1e6892e7fe840f0f9746316fa938e9a421f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.24"
+LINUX_VERSION ?= "6.18.25"
 
 PV = "${LINUX_VERSION}+git"
 

