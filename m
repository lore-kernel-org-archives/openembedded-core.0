Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AF3CD4857
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 20:25:25 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59983.1778531122244703647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 13:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N+6V3li7;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8eea23d01f7so644076085a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778531121; x=1779135921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLu/rUTP28iNdcdWooxCLnyFgcpATwIcAGkfbbUH3nw=;
        b=N+6V3li7S6WMg2TaD9fa0JNhEmaNhWHEKvuwqVyOTG9e7C0xQMARbDqDjOj3f3O88l
         LvO8b4vdmWKaZ2hGzEwpVCyi39GT8Zd/dgRxV7L8uXuKr2LPjGWhRrs4VKDWqngtszCT
         lyq434CmQYcVHmmeGkyaSAMZH3WqPNRxU0T6+gsIp0KDUcnliigxq7A0HJaevlG8fisL
         M2o6ZkVYlzy7QakSzqPwOHIXbptz3BBJNWrNJ9dLOaCpS3KFymnIz2GfRUJO9ZhcjoxJ
         1Xz8KENt644sXmx7iEEN+LsjULXDIwDmzdy8rGSGxYGVke9YWoijmEMyOqJkjkOeQHvy
         D3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531121; x=1779135921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uLu/rUTP28iNdcdWooxCLnyFgcpATwIcAGkfbbUH3nw=;
        b=E16JnX4a+3swMMJL+ypRggtbTP89l112GTtNMLgMc7uZNvB8ct8mwpAMAVqeA+CLXl
         VOlQCNcqFsJfK8HduBdM3tiqQ4I2IHMYuPFm+VX8zfqiBYoeI2poo32ss0BIFUwIJ/eQ
         eZPZU/75SrlA4fxUDijkPzhgt6Jn4Mun5JbnjmYHv8jv+Igw1fhEgonFC6ItROcropjP
         gGYS8ngUO2oWnsucaXbnbUXi7Dw++3mcDFw5Z6fIBwVleqjeyn4GD+JHyMEqLOV6nXS4
         StNMd7MSgg4fzKSa8gBpcYJ5JAgDwhxqay+uvnHDN4UGPAgpNCUaRpsd30b2hDkOVeT1
         IqJw==
X-Gm-Message-State: AOJu0YywrHgDDQm48VOZASVCSWDx61QYahy30Rbys1mjtHb+gVWvq5ll
	/BEKynRIf/nB1dwUyASsHmRN+/6klDYhNVT+70QjMFsTGUA3/RCoC/uv
X-Gm-Gg: Acq92OFy9uyIwLMwxaqHvHpb0Szu1hwiA7mCqyCssi47EDnQB2+VKYKZxH7muW2R9le
	b0ewfDDt2LNThzAsQKwVrS6BXbEkkWVOGLwt6lMhDj/3pJgb214//hgK4o7Xp8hQqamPoZo5uAO
	WMneq/LzKmNz89dozxA43CpDld9PXWkFKbEGfgFUfbVWafM3MkUlIQpriAHEFSsSWT+TbLNjm0f
	ebqIqxLo1aqNeJdWdev78253Obh5COnciZ+BZNQhLYUIxXO/hjQTp8QfMR/K9vVbrEui7nO3tkM
	vXbD4hNE1wMHobSDl7ukNohi/H2FBsiOeVBrbEtG84/p4bx9pcSdn/g01MEhEWxi1ENvOgqqurx
	hd3wUssaJ2orAf1XMr0YVM5G5TpTXuRSq+qO4qbyBPtlawl+8h4jVlbQLU1GZTVf4QDfAOIu5pX
	nAQynlms1LYS2MufstHdMB1p3htUPlg0ayBgmYP0escFBEKBXT8OqX0Zwdg4KPVucWzYNyWfa/n
	OXJKC5F+v4WXKmP1ghZMCS9Tvi7axZHCtfw1CZXCk0iao+sA3mJx5PtwKsYcBGpuEJfdw==
X-Received: by 2002:a05:622a:508:b0:50b:6cc1:38c6 with SMTP id d75a77b69052e-514d2266eb6mr2769421cf.55.1778531120795;
        Mon, 11 May 2026 13:25:20 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e83aa2bsm98213401cf.28.2026.05.11.13.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:25:19 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 01/09] linux-yocto/6.18: update to v6.18.25
Date: Mon, 11 May 2026 16:25:08 -0400
Message-ID: <20260511202517.1648910-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
References: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 20:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236826

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
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index c6b46d229d..bc601df34d 100644
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
index ef40c4864f..638fdd18bf 100644
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
index e84c58af58..48f8451483 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
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
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.24"
+LINUX_VERSION ?= "6.18.25"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


