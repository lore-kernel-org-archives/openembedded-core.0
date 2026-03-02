Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8EED58E5B
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 04:56:01 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153574.1772427357460449832
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 20:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kJVug//x;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c9f6b78ca4so547647185a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 20:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772427356; x=1773032156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFKMG/VysnlEMg0WiOCit/osSuaC1zqHfW1lXJNsRbE=;
        b=kJVug//xUJ2fP7qeHMpdjKW20uhtiPI6CM2ZXOfWu6DaArXJ5o7SZ2OW7E7vTf1DJX
         nLlL9nxbsYD2ENfnCxiCmmWUoyJ7TEfSPOEeE80vwYr4fF/HpNmCmlZDnD6lKNOeR681
         wvfxBSg3cG8PS5HTlR//42M9YF7P+WvsfCdBz5kcj9WzlDOZg6l8pG2IqCgwdTqEEfta
         J4bqyl8zgM35BH1BDl40X7ih5MCpqMCUOEInXn5tmXqvRnOFBgAcFZwAACe4+/HTiUnm
         IzS2QANdhNeuBGYwmzti516nfNvqVVX6VRtTEV/e548JnaMWamUllFbTUl0zhWOVkmr4
         Gv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772427356; x=1773032156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DFKMG/VysnlEMg0WiOCit/osSuaC1zqHfW1lXJNsRbE=;
        b=cSVuOrHbj4BDKMHn7+oVJU4kG9kHSTXB5jTLWNwDdPFy8Wqc+pOtYFsDni42UixyCL
         U8w1IX3Reg/SoNRbrxiaCmRA8wuLZYqx5e9705nYmTipPjRNhMCNWnJeb1K8c7C6JOH5
         JqX/nVPD65w5Jard1O0roga9V4mrs1vwvexLDjNQUmxVEqWCzK/HgtxMRYV9SSfyYRc6
         /523ppz3L+aubph1l1K/gmeTgFBrHi0luNpYxo4niguE9G+gLAn51l+c1ydtPnDoLiuB
         01qA1oPss1ykPq449PmY6jD5KNqyax89WKvQPqcyFTN3i9vdKsJQMuPwpuOuI2y7HAwx
         /oMA==
X-Gm-Message-State: AOJu0YwG5hfvLp+mlwsGoZQ2e1QPML8Lbg9Rylq0qSqniyDiQN/hM2SD
	89wyFeqz8e5w5KXc0JZMOaV3aOvTwly/Dp8qsEW9smpYwHaVMJJYZBUkbEsv31FzoGM=
X-Gm-Gg: ATEYQzw5XDCcxm8LBYeIFNfZ/DY0stWwycNRPMn+JmKQheBKbx9NlVY41Yyk9wfj4f/
	7Nsg1cMBZEt+Ue+gSh8ox9t437mikzdMqedzSrTKUB6Rl+hhqyU0yEehxJAq7S3qXQX4/CsN2KY
	j3f9TzlDOEZCBhASNXqwse92Rpd401axvb8CAd3ZM29fMTfGZmwirRjY+C/ckplJTHknvdVgu5+
	gvQLWopqtgJoEz/BZ2GP824DMXhhDiG1b8P3ztwaD+Srr2rTq6iTno1GyThhGzuK0qhdJctR4aH
	6wRefzzKCuyJKbzGx939SWLsO2CQ7yk3kT2p2NZh3quXJuO+EOjamW8LN7G1GpAtnaqRGSrtWK/
	i8W2P4bsEKG23MLAE/ATDDS73cPNegl8ZI2Qk7D3ewarXZZ9sAahVD25raTU6XbfZxW9bp2Mpip
	d8CNUk3hagiq2df82IASDGG5i5JuWBaaObwZ+BUszMSKgPdzNgEiz4JAYbtr/KwlvXA6OIAUMmP
	nTzZ9jPhSnsLVw0XPQ02jE0mHsPKBfaNquVtDM9dxmGIVxqX19zxIKMpl4=
X-Received: by 2002:a05:620a:4451:b0:8c7:acd:eec9 with SMTP id af79cd13be357-8cbc8dee809mr1371561785a.28.1772427356431;
        Sun, 01 Mar 2026 20:55:56 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a017add76sm2488406d6.36.2026.03.01.20.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 20:55:55 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 10/10] yocto-bsp: update to v6.18.13
Date: Sun,  1 Mar 2026 23:55:36 -0500
Message-ID: <20260302045537.2153587-11-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
References: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 04:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232170

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    25e0b1c206e3d Linux 6.18.13
    df337ba02ca53 f2fs: fix incomplete block usage in compact SSA summaries
    855c54f1803e3 f2fs: fix to do sanity check on node footer in {read,write}_end_io
    cd2fec912a0f0 f2fs: fix to do sanity check on node footer in __write_node_folio()
    715a7a72e4736 USB: serial: option: add Telit FN920C04 RNDIS compositions
    f611dafe0ffd3 iommu/arm-smmu-qcom: do not register driver in probe()
    0415ae51a40e3 f2fs: optimize f2fs_overwrite_io() for f2fs_iomap_begin
    fee27b69dde1a f2fs: fix to avoid mapping wrong physical block for swapfile
    97e4f479939e5 f2fs: support non-4KB block size without packed_ssa feature
    995030be4ce63 f2fs: fix to avoid UAF in f2fs_write_end_io()
    d4a594dd952df f2fs: fix out-of-bounds access in sysfs attribute read/write
    bd66b4c487d50 f2fs: fix IS_CHECKPOINTED flag inconsistency issue caused by concurrent atomic commit and checkpoint writes
    70cf1e96bde07 f2fs: fix to check sysfs filename w/ gc_pin_file_thresh correctly
    fb9f7e52273db f2fs: fix to add gc count stat in f2fs_gc_range
    1c008ad0f0d1c fbdev: smscufx: properly copy ioctl memory to kernelspace
    3e4cbd1d46c24 fbdev: rivafb: fix divide error in nv3_arb()
    98d91080517d4 cpuset: Fix missing adaptation for cpuset_is_populated
    eaa9fcf57934c LoongArch: Rework KASAN initialization for PTW-enabled systems
    9b671f6f432be mm/hugetlb: fix excessive IPI broadcasts when unsharing PMD tables using mmu_gather
    0c74d37343b93 arm64: dts: mediatek: mt8183: Add missing endpoint IDs to display graph
    6d66464d1a059 gpiolib: acpi: Fix gpio count with string references
    fa4938e0d0d64 io_uring/fdinfo: be a bit nicer when looping a lot of SQEs/CQEs
    cab928242853a ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
    00c57e2369386 drm/amd/display: remove assert around dpp_base replacement
    8e6f503961709 drm/amd/display: extend delta clamping logic to CM3 LUT helper
    f2584f791a103 tracing/dma: Cap dma_map_sg tracepoint arrays to prevent buffer overflow
    7bc40c6f36575 ASoC: cs42l43: Correct handling of 3-pole jack load detection
    a8ed5b974a244 platform/x86: panasonic-laptop: Fix sysfs group leak in error path
    2ca80dd4bb0e2 ASoC: sof_sdw: Add a quirk for Lenovo laptop using sidecar amps with cs42l43
    bb6ff25035da5 platform/x86/amd/pmc: Add quirk for MECHREVO Wujie 15X Pro
    a9584e9e46448 ALSA: hda/realtek: Enable headset mic for Acer Nitro 5
    78783e8d588cf ASoC: amd: yc: Add quirk for HP 200 G2a 16
    c3b2e922924bf ASoC: Intel: sof_es8336: Add DMI quirk for Huawei BOD-WXX9
    97528b1622b8f platform/x86: classmate-laptop: Add missing NULL pointer checks
    efdb9c8ca3cfb drm/tegra: hdmi: sor: Fix error: variable ‘j’ set but not used
    4b71ad7676564 romfs: check sb_set_blocksize() return value
    d2e01e0c5e947 ALSA: hda/realtek - fixed speaker no sound
    20bc7062c352f ASoC: cs35l45: Corrects ASP_TX5 DAPM widget channel
    1bdbcf326474c ALSA: hda/realtek: Add quirk for Inspur S14-G1
    b0b2cb84b64a9 gpio: sprd: Change sprd_gpio lock to raw_spin_lock
    652667ac1369e ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list
    464a50c6b23aa rust: driver: fix broken intra-doc links to example driver types
    7d82e965fe0e3 rust: dma: fix broken intra-doc links
    68dd6c5ebe799 rust: device: fix broken intra-doc links
    31f33b856d232 scsi: qla2xxx: Fix bsg_done() causing double free
    2784b1b43af37 Linux 6.18.12
    53a76425e0764 Revert "driver core: enforce device_lock for driver_match_device()"
    ee4fb138af107 Linux 6.18.11
    32f08c3ddd6dd gpio: omap: do not register driver in probe()
    116f7bd8160c6 wifi: rtl8xxxu: fix slab-out-of-bounds in rtl8xxxu_sta_add
    24a253c3aa6d9 PCI: endpoint: Avoid creating sub-groups asynchronously
    60b75407c172e drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
    ed82e7949f5ca xfs: fix UAF in xchk_btree_check_block_owner
    d741534302f71 erofs: fix UAF issue for file-backed mounts w/ directio option
    1d6bd6183e723 bus: fsl-mc: fix use-after-free in driver_override_show()
    d14e991279831 scsi: qla2xxx: Query FW again before proceeding with login
    f04840512438a scsi: qla2xxx: Free sp in error path to fix system crash
    c068ebbaf5282 scsi: qla2xxx: Delay module unload while fabric scan in progress
    ae49d33bfc08b scsi: qla2xxx: Allow recovery for tape devices
    1a9585e4c58d1 scsi: qla2xxx: Validate sp before freeing associated memory
    1339455044155 wifi: rtw88: Fix alignment fault in rtw_core_enable_beacon()
    46c1d56ad321f hfs: ensure sb->s_fs_info is always cleaned up
    4aa45f841413c nilfs2: Fix potential block overflow that cause system hang
    52505d7f713bf crypto: virtio - Remove duplicated virtqueue_kick in virtio_crypto_skcipher_crypt_req
    e69a7b0a71b65 crypto: virtio - Add spinlock protection with virtqueue notification
    2ed27b5a11743 crypto: omap - Allocate OMAP_CRYPTO_FORCE_COPY scatterlists correctly
    62c89e1992c86 crypto: octeontx - Fix length check to avoid truncation in ucode_load_store
    d75207465eed2 crypto: iaa - Fix out-of-bounds index in find_empty_iaa_compression_mode
    65a0016016e8b ALSA: hda/conexant: Add quirk for HP ZBook Studio G4
    be7a9bcee0ca6 Bluetooth: btusb: Add USB ID 7392:e611 for Edimax EW-7611UXB
    8d76b2488eb3c driver core: enforce device_lock for driver_match_device()
    16c8be3d55441 smb: client: let send_done handle a completion without IB_SEND_SIGNALED
    6bf260ace7301 smb: client: let smbd_post_send_negotiate_req() use smbd_post_send()
    69ce4ae2ab65c smb: client: fix last send credit problem causing disconnects
    cca0526ef2344 smb: client: make use of smbdirect_socket.send_io.bcredits
    9eff83600edf6 smb: client: use smbdirect_send_batch processing
    d059e5fc49755 smb: client: introduce and use smbd_{alloc, free}_send_io()
    1f3e8e2c67cbc smb: client: split out smbd_ib_post_send()
    8786127068d51 smb: client: port and use the wait_for_credits logic used by server
    1fe0f989beb8b smb: client: remove pointless sc->send_io.pending handling in smbd_post_send_iter()
    2b08ca3ab6cc5 smb: client: remove pointless sc->recv_io.credits.count rollback
    b9ec75aba3c8f smb: client: let smbd_post_send() make use of request->wr
    5b69ba9978dd0 smb: client: let recv_done() queue a refill when the peer is low on credits
    f664e6e8a8110 smb: client: make use of smbdirect_socket.recv_io.credits.available
    24082642654f3 smb: server: let send_done handle a completion without IB_SEND_SIGNALED
    85bf0a73831cc smb: server: fix last send credit problem causing disconnects
    5ef18a2e66f2f smb: server: make use of smbdirect_socket.send_io.bcredits
    cea7afb097b00 smb: server: let recv_done() queue a refill when the peer is low on credits
    66c082e3d4651 smb: server: make use of smbdirect_socket.recv_io.credits.available
    88cf40f7b5fb4 smb: smbdirect: introduce smbdirect_socket.send_io.bcredits.*
    e811e60e1cc79 smb: smbdirect: introduce smbdirect_socket.recv_io.credits.available
    cd25e0d809531 smb: server: fix leak of active_num_conn in ksmbd_tcp_new_connection()
    e4a8a96a93d08 ksmbd: add chann_lock to protect ksmbd_chann_list xarray
    71b5e7c528315 ksmbd: fix infinite loop caused by next_smb2_rcv_hdr_off reset in error paths
    c4b9edd559873 smb: client: split cached_fid bitfields to avoid shared-byte RMW races
    1658b66fed206 io_uring: allow io-wq workers to exit when unused
    f02693a40e407 io_uring/io-wq: add exit-on-idle state

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index 3776bb4..f167bf5 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "9e6d72474d6f996cd4ec8efac6b5ade5c9b6c2c7"
+SRCREV_machine:genericarm64 ?= "f5e9d8713f1bf70f0bacb30b1b304b09cfef8b4f"
-- 
2.43.0


