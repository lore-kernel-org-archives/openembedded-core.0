Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A8ACD4F21
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 20:25:35 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59988.1778531130863038166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 13:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pEwqmFib;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50fbd79350dso44385651cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778531130; x=1779135930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d06hhSd9mdyFw7nwNzwrqyde1LFkQNimBFSa+bIoPro=;
        b=pEwqmFibbPRAiCWJEaW85UZujixzN9tnJl07EenzfDbWM6prvirg4AsiaU1RXnqJ4g
         CtiyaI2k4bMXjBmRnb4nB683b8RzqKvnJF5Th0h7Gp3UoY9MQaLvvEHewCuIG62aeInU
         Dt3Xp8A9Y5uIs+AY0ditwEdaatt7I96xwRxjKDnOTdUkqvrIY5AxAUpes6gd48KfrkN/
         kioyQsJTznA2FczzuDqztM5cyAk0eZ/wqpXBIt4KIvs7rV5rqWEkZKfvP4seRzFlh/9a
         k/u/YD23VCISWh5NQejwZqkEk53Qlivtv5Cit655rEPOn92N3N6VS+ywgAN/yY92hqm/
         od1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531130; x=1779135930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d06hhSd9mdyFw7nwNzwrqyde1LFkQNimBFSa+bIoPro=;
        b=lBgepyz0TvJtLtLnIrJXn7hNrDkK8tVLHrteimx+UQQO+G1GRjdYUVWFQVu4e/B5ds
         y1soIANphVB9NfKZ4Zaqyl6eDOdx5873LvkKohz0uolzYmwYOr97nU0tU0s+gX5hsuz+
         3U0HmVW0Bf+QRPZ/5T6lGZjmsT4IgO18uYY+4pt+AERUIyRsz7/GXNlnM2FYYMp/dH1Y
         nSjKfGMwiB6dkYMgieYv780wCG3XoQJKcowDOL/KSTa75fYInQt/dvT1/MVwb3luLQfm
         Y6WVRB1qTR0Hkh/a8QtcgXIuBN/QHr5veRVrFiV6C9wULMEe9OaQaFj9dr/+Z7YMpzn5
         XYIA==
X-Gm-Message-State: AOJu0YyCD6IETW7Xdv3MZH6BUICI5oiSEuRIItra0f7w7f7zLvGuPRZi
	psM4Io77WVZDkb9VS/Wza+6psXPNP0xJNbDdJfrx9tYZFdDczxg8+HYa
X-Gm-Gg: Acq92OHMawYLkmpMcvzBJjQlZJY6FX490LjngzsFeR/bcisOqX5Ih/q//mWWgSFzfm4
	OSit1ORxSmqiMeRADxerZ/VxERNbHLM+jtTPqTGRjWT8hNpSFNr8NiMKQNUTH6Qmd8K6SsAJGEr
	oJ0xmtDymYLrZE/K+isgfi/yCTtiZvGTQYd/rTskWCQfbGP0RHkX+CXsnoZ47k5D5hLlTfZ0pqr
	GklZ4ctGa4HR35xOI20Au7F7cft9riqk3RkYYNFXn0GHa+GnNE9GLkCfZNTXFwWuX1cOPf4pjaX
	ZpfL1PWS4UNoF5PONwXQ7io6B4lm/bagzWZ1AKt1HEu3MO7b4+7o2CgIjqAPH06EvAlQzZ0rkFy
	V6EF5w8sKkGqo9Wgp66/HojWGG+i6wolXt/P0BWBQCOxk1CCwKlfC/tEtkyxZPNACDN26O4yeOg
	i2pbjd/4zcvG+HqR3LwGWC6JmhWkgLt6tU9w0A17TrA5xK8Pvs38wCO+nhfJWFMDtC+/V7MM3RK
	PrOx1d5XgKOLIT3+CtIkmM36LNTN18FrvkjejhAdntzVTz5syZNJozdkjc=
X-Received: by 2002:a05:622a:11d4:b0:50f:b1be:76f9 with SMTP id d75a77b69052e-514a0a89eeamr164951801cf.24.1778531129661;
        Mon, 11 May 2026 13:25:29 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e83aa2bsm98213401cf.28.2026.05.11.13.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:25:29 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 07/09] yocto-bsps: update to v6.18.25
Date: Mon, 11 May 2026 16:25:14 -0400
Message-ID: <20260511202517.1648910-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
References: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 20:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236832

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
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index 1a80c65..79cdb16 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "b37320d600b3206435a10fa3c3d9fe9a574256b2"
+SRCREV_machine:genericarm64 ?= "6ad892116f3c1cc17c0b9df907607b1b5fe02bb8"
-- 
2.43.0


