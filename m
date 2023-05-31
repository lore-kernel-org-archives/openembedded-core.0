Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EDBC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 02:34:39 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.4587.1685500478896916684
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 19:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=tp2X6IwH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6af6b5cf489so3963960a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685500478; x=1688092478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1axPoM6nAl1y/yEh8fdTCyrnJD3/JcJROOAU/pqGbJA=;
        b=tp2X6IwHYNjHo5sr0oFWo9l1NsWOk3RPk9aamdx2e1P5t+sqH1xpA1+coLGCg7s6O8
         3/TpjYssVoJRMTUQnZxdlilPzEEZS4PonkyyQW2/7XR8EpnomIh3KSQe6Z0cq6v3gL7/
         DfTEZqphT8BNWdgyUaIxpm5ryutcjSN2aeiTDN4gXLhKnbDXRGox4OlWTo2YgN16mTmw
         uYEhxadv3tPPQJqpZNWp6BASykZHWGZ3vru0NM7qor/UFu9dXNJrc8Xrj4hVfmHScZkm
         IlO2Wak+ZEl22gmLE3tOSdijnK5vXZsKF2PRXkL/OTFM7QZKrPJzNH+sS+/lVcxRjOrY
         E+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500478; x=1688092478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1axPoM6nAl1y/yEh8fdTCyrnJD3/JcJROOAU/pqGbJA=;
        b=KyJMk56dRtecXMKWUG78kdEgk/R8w6XKXIGGkPuLWRQl40ETIHqo2GwfUynFbTit53
         Na7wpNXYdKuRSDYmcBod22GfPQBrZUbaq+5WJrvNFvLxbNHxNyBLwfetCWyql19pFM90
         zR38r+LDKhW/0fzGIHMSrSZc6a8G/NYkKHR95Nz4IWPvELx7Kc8hSwqkd0LBPqhHp/z9
         9U90ECyqBa++ySkP1dLM8qxk1VTr4yXq1CkeXLhpw+96UrNQER/8RBTXIsMTw8Bm/R1J
         vmXETq4nogtHAj3fU5nxYPJPCN/0spebCceSbdhAtOyCpnViNyqWjuU3S8KEYK8uNDJ9
         euMA==
X-Gm-Message-State: AC+VfDwwK9oymWSLhENIwse5Y3izsOfWiJTTlFXZbDPBzR6O7oi/LNCQ
	rWA9V9oz0L+2uqkSXQOB1H4OZBtwipo/gXlJaAM=
X-Google-Smtp-Source: ACHHUZ4EgwGF0tus0pA3Tt9w7/5LhIQI3rVI+cgxHNSxzQwxyQqZhdfnOirF2hMF1+Td6Z5pnS+LpQ==
X-Received: by 2002:a05:6358:9910:b0:117:ff48:9582 with SMTP id w16-20020a056358991000b00117ff489582mr357732rwa.21.1685500477569;
        Tue, 30 May 2023 19:34:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k91-20020a17090a3ee400b0023a9564763bsm92877pjc.29.2023.05.30.19.34.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/13] linux-yocto/5.10: update to v5.10.176
Date: Tue, 30 May 2023 16:34:12 -1000
Message-Id: <9f27f11e19fc1929d42820e88e8df3380495f659.1685500244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685500244.git.steve@sakoman.com>
References: <cover.1685500244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181974

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ca9787bdecfa Linux 5.10.176
    e57f797e3ffa HID: uhid: Over-ride the default maximum data buffer value with our own
    9bc878756b01 HID: core: Provide new max_buffer_size attribute to over-ride the default
    daa97e770e78 xfs: remove xfs_setattr_time() declaration
    183ca919544c fs: use consistent setgid checks in is_sxid()
    0e9dbde96cac attr: use consistent sgid stripping checks
    240b96ffece8 attr: add setattr_should_drop_sgid()
    baea3ae425fb fs: move should_remove_suid()
    24378d6f7486 attr: add in_group_or_capable()
    94ac142c19f1 fs: move S_ISGID stripping into the vfs_*() helpers
    347750e1b69c fs: add mode_strip_sgid() helper
    f60b68c46444 xfs: use setattr_copy to set vfs inode attributes
    8cf9400f8948 xfs: set prealloc flag in xfs_alloc_file_space()
    308dfe49eb75 xfs: fallocate() should call file_modified()
    35f049abbae3 xfs: remove XFS_PREALLOC_SYNC
    c84fb2962680 xfs: don't leak btree cursor when insrec fails after a split
    be60f08c03de xfs: purge dquots after inode walk fails during quotacheck
    d6f223cfef32 xfs: don't assert fail on perag references on teardown
    d0292124bb57 PCI/DPC: Await readiness of secondary bus after reset
    337aa99f76ea PCI: Unify delay handling for reset and resume
    b5e0b3d74285 s390/ipl: add missing intersection check to ipl_report handling
    84e2e393bf9f io_uring: avoid null-ptr-deref in io_arm_poll_handler
    5e784a7d07af drm/i915/active: Fix misuse of non-idle barriers as fence trackers
    8f27d4321700 drm/i915: Don't use stolen memory for ring buffers with LLC
    b4a798374f2d x86/mm: Fix use of uninitialized buffer in sme_enable()
    764217184f9e x86/mce: Make sure logged MCEs are processed after sysfs update
    15e926dfd820 cpuidle: psci: Iterate backwards over list in psci_pd_remove()
    38742635eda9 fbdev: stifb: Provide valid pixelclock and add fb_check_var() checks
    03fc29e75e44 mmc: sdhci_am654: lower power-on failed message severity
    b2747b690cb9 mm/userfaultfd: propagate uffd-wp bit when PTE-mapping the huge zeropage
    83c3b2f4e7c6 ftrace: Fix invalid address access in lookup_rec() when index is 0
    f9a98b8dde09 mptcp: avoid setting TCP_CLOSE state twice
    684c7372bbd6 drm/shmem-helper: Remove another errant put in error path
    fbc5ffcce72b ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book2 Pro
    9addf5e1050a ALSA: hda: intel-dsp-config: add MTL PCI id
    c54974ccaff7 KVM: nVMX: add missing consistency checks for CR0 and CR4
    7b18dea697e4 cifs: Fix smb2_set_path_size()
    ec663c410ce0 tracing: Make tracepoint lockdep check actually test something
    8ae86ef7a058 tracing: Check field value in hist_field_name()
    de3170bd41de tracing: Make splice_read available again
    efae80ca13fa interconnect: fix mem leak when freeing nodes
    b37d3ccbd549 firmware: xilinx: don't make a sleepable memory allocation from an atomic context
    0c16c20b8787 serial: 8250_em: Fix UART port type
    f5a5150c7066 tty: serial: fsl_lpuart: skip waiting for transmission complete when UARTCTRL_SBK is asserted
    020166bc6669 ext4: fix possible double unlock when moving a directory
    7257070be70e drm/amd/display: fix shift-out-of-bounds in CalculateVMAndRowBytes
    ab7da8d93a6f sh: intc: Avoid spurious sizeof-pointer-div warning
    6936525142a0 drm/amdkfd: Fix an illegal memory access
    a98160d8f3e6 ext4: fix task hung in ext4_xattr_delete_inode
    0bf15bc393a1 ext4: fail ext4_iget if special inode unallocated
    8e7f26b9565a jffs2: correct logic when creating a hole in jffs2_write_begin
    980d4e70c708 mmc: atmel-mci: fix race between stop command and start of next command
    04eaeaa2f79f media: m5mols: fix off-by-one loop termination error
    a4c048d502eb hwmon: (adm1266) Set `can_sleep` flag for GPIO chip
    a4c3e1132422 hwmon: tmp512: drop of_match_ptr for ID table
    c5bd9719b53b hwmon: (ucd90320) Add minimum delay between bus accesses
    663c3afee81e hwmon: (ina3221) return prober error code
    0a73c8b3cc99 hwmon: (xgene) Fix use after free bug in xgene_hwmon_remove due to race condition
    4a8c3ad12c9d hwmon: (adt7475) Fix masking of hysteresis registers
    aff84fadba53 hwmon: (adt7475) Display smoothing attributes in correct order
    d4dbd26f985c ethernet: sun: add check for the mdesc_grab()
    eb80cb66a2c5 qed/qed_mng_tlv: correctly zero out ->min instead of ->hour
    1c06d1223728 selftests: net: devlink_port_split.py: skip test if no suitable device available
    bd2e78462ae1 net/iucv: Fix size of interrupt data
    2cc46ed406bb net: usb: smsc75xx: Move packet length check to prevent kernel panic in skb_pull
    013fae04b8ff ipv4: Fix incorrect table ID in IOCTL path
    1f0586dcc076 net: dsa: mv88e6xxx: fix max_mtu of 1492 on 6165, 6191, 6220, 6250, 6290
    cccba1ff0798 ice: xsk: disable txq irq before flushing hw
    2f28cb5c2a51 block: sunvdc: add check for mdesc_grab() returning NULL
    a6317235da8a nvmet: avoid potential UAF in nvmet_req_complete()
    9ebc344ce547 nvme: fix handling single range discard request
    4cf15887a41b block: null_blk: Fix handling of fake timeout request
    d14d2574a54c null_blk: Move driver into its own directory
    d5e61a859a8a drm/bridge: Fix returned array size name for atomic_get_input_bus_fmts kdoc
    e294f0aa47e4 net: usb: smsc75xx: Limit packet length to skb->len
    9708efad9ba5 net/smc: fix deadlock triggered by cancel_delayed_work_syn()
    43aa468df246 nfc: st-nci: Fix use after free bug in ndlc_remove due to race condition
    194248138f8d net: phy: smsc: bail out in lan87xx_read_status if genphy_read_status fails
    be59b87ee4ae net: tunnels: annotate lockless accesses to dev->needed_headroom
    281e86e3fab6 qed/qed_dev: guard against a possible division by zero
    31817c530768 net/smc: fix NULL sndbuf_desc in smc_cdc_tx_handler()
    3cbecb1c9085 i40e: Fix kernel crash during reboot when adapter is in recovery mode
    91eb59240150 ipvlan: Make skb->skb_iif track skb->dev for l3s mode
    2703da78849c nfc: pn533: initialize struct pn533_out_arg properly
    77ad58bca011 tcp: tcp_make_synack() can be called from process context
    68c665bb1850 scsi: core: Fix a procfs host directory removal regression
    be5aa2534188 scsi: core: Fix a comment in function scsi_host_dev_release()
    0fac20b1806b netfilter: nft_redir: correct value of inet type `.maxattrs`
    c144dff64ea9 netfilter: nft_redir: correct length for loading protocol registers
    3a0f8ea35ddc netfilter: nft_masq: correct length for loading protocol registers
    eff050d83eee netfilter: nft_nat: correct length for loading protocol registers
    0c6c5abeb471 ALSA: hda: Match only Intel devices with CONTROLLER_IN_GPU()
    6f0c2f70d992 scsi: mpt3sas: Fix NULL pointer access in mpt3sas_transport_port_add()
    79fe786dab5c docs: Correct missing "d_" prefix for dentry_operations member d_weak_revalidate
    ea1e21d38a8d clk: HI655X: select REGMAP instead of depending on it
    081893e254f1 drm/meson: fix 1px pink line on GXM when scaling video overlay
    ed9ed2f58ceb cifs: Move the in_send statistic to __smb_send_rqst()
    a3c502218cd3 drm/panfrost: Don't sync rpm suspension after mmu flushing
    0da0b816972a xfrm: Allow transport-mode states with AF_UNSPEC selector

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index f25745194a..474c3c6b01 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6462fa707bd003b62bee6042c20e8ab1f391df96"
-SRCREV_meta ?= "8ea689ac1980b5c09cd049a3403f72e75a8739da"
+SRCREV_machine ?= "03d34a4008d35075c61a6202f95cb87bd348879d"
+SRCREV_meta ?= "18265875e3652c8edf8c3d86f8ae3e0130b93968"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.175"
+LINUX_VERSION ?= "5.10.176"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 798fb84565..16533170d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.175"
+LINUX_VERSION ?= "5.10.176"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "d90caed79c490df9aab86920b33698bc29899d45"
-SRCREV_machine ?= "878a6b6459feacfa733cf27a14b9f70b9922ba65"
-SRCREV_meta ?= "8ea689ac1980b5c09cd049a3403f72e75a8739da"
+SRCREV_machine:qemuarm ?= "44b10c10eb958db18819f16cfbd7dbdd75be3abd"
+SRCREV_machine ?= "3166b27713fe990c8bd11ab0a510d7e1a386cf86"
+SRCREV_meta ?= "18265875e3652c8edf8c3d86f8ae3e0130b93968"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 92666e4865..a9a79ed916 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1784e127b2ebee50ade30dc697d9f2c9ccda64d6"
-SRCREV_machine:qemuarm64 ?= "3189034276f25e203dae9df3df5fd33849a63ddb"
-SRCREV_machine:qemumips ?= "ed305aee0a2d924dd532eea364036736a43b008e"
-SRCREV_machine:qemuppc ?= "43e2751f24c4c35341b877429f5c62f57cc23616"
-SRCREV_machine:qemuriscv64 ?= "96f3a7ef51f544080250e995b21e66004fdbb2bb"
-SRCREV_machine:qemuriscv32 ?= "96f3a7ef51f544080250e995b21e66004fdbb2bb"
-SRCREV_machine:qemux86 ?= "96f3a7ef51f544080250e995b21e66004fdbb2bb"
-SRCREV_machine:qemux86-64 ?= "96f3a7ef51f544080250e995b21e66004fdbb2bb"
-SRCREV_machine:qemumips64 ?= "82870b2da104e88b79174aece820f233e0c4bd72"
-SRCREV_machine ?= "96f3a7ef51f544080250e995b21e66004fdbb2bb"
-SRCREV_meta ?= "8ea689ac1980b5c09cd049a3403f72e75a8739da"
+SRCREV_machine:qemuarm ?= "f04da39302cc51ad80638a0690cee42375d208b5"
+SRCREV_machine:qemuarm64 ?= "71939600c1846b45f44348db7261be30f0aefad7"
+SRCREV_machine:qemumips ?= "1ce574832f8aa9097eb383b406f459b334ffbbb4"
+SRCREV_machine:qemuppc ?= "eba8a3dca0ffff3d5ab722cd007451a4e4a3844c"
+SRCREV_machine:qemuriscv64 ?= "f027472a5dcddfaff51c9deb6aa6e517b3f88e7f"
+SRCREV_machine:qemuriscv32 ?= "f027472a5dcddfaff51c9deb6aa6e517b3f88e7f"
+SRCREV_machine:qemux86 ?= "f027472a5dcddfaff51c9deb6aa6e517b3f88e7f"
+SRCREV_machine:qemux86-64 ?= "f027472a5dcddfaff51c9deb6aa6e517b3f88e7f"
+SRCREV_machine:qemumips64 ?= "8bd572b90c004bea71f9c9ddc15ec343d54ddacc"
+SRCREV_machine ?= "f027472a5dcddfaff51c9deb6aa6e517b3f88e7f"
+SRCREV_meta ?= "18265875e3652c8edf8c3d86f8ae3e0130b93968"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.175"
+LINUX_VERSION ?= "5.10.176"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


