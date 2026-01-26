Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1747AD13C3F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:24:08 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22593.1769441040984587733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 07:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=COq/kmUe;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-89473dca8aaso61466346d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769441040; x=1770045840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43MOS2gyCYSH7YLMdhqR5qCJctEnOjl6y5SO1yOiZlM=;
        b=COq/kmUe7HtvUjAta8SJzctZAUH5wCNJIZ7HQuy7s4wNbO33AdUx10G5mlm1TsLB1J
         8DA93cU8AIrOI9E+4+XB+ZyWIGPThkIHQn1RkUVJWAgW8YdIKG5LwczmBm6J0jYjSNE/
         BeRVjCczdNZYQxRnocFVBw9pb+H3YCmvwl0rxgv028a1nrPrAARFUfgcTgW7XzWxIw6I
         UVZFahLac4h5wJndV51wjXrf1xjfTRezA6ULkjljWWeQ/9E7H4kxh1w9TeVjMkXJK1XF
         hSk/rwU0ul4wwtaD4RL3gUAdxWedHhVBFL12uHNdL2U9hCHFVfmjijPgOyS4oJgPVMFj
         kO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441040; x=1770045840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=43MOS2gyCYSH7YLMdhqR5qCJctEnOjl6y5SO1yOiZlM=;
        b=K2KsnMgtUkYLFS+4ychuCnZfE7zBDo/GfZeSKhOgvI5qbB6KkZgQb28Su9CpAVu0eT
         CHIh6y6KCAdvzGqVgrg5pjqCP+7nD66XKhwUZxmBjfmv7ENhs4fPAxA/KjWs+2EhG0FD
         VzB4CjdcKIfABL5YCQ1rxUYNoRO1B6nNweM62Ab77efazEQqxatLbMny69K9B2vO4bw+
         r058pKsssL0e/Xa1F3vRv1TEPYjBAEQUAEaKE7AygvPj7Kpj702a1hNnJ4+YLy2P/YXd
         Yp/HCCkwBRjgMk11+JpzAEOJ82w2Q3LxhQRxljcla3h906VDdG5+2dSjN+pNJ0zfg2/0
         XL6A==
X-Gm-Message-State: AOJu0Yx/sWLrBvo51z7iBIeT4GA3bSzJO/TKah2wK5iqHon4SKxfBT4h
	EtJEnQteAEXuvpmVaaxaT9G2xpf4dg93lxjGW4Hcl8bA2L331eM7kN/V
X-Gm-Gg: AZuq6aKcRC+fJ2ELY3QsF4tjYUBCj7Pv8cZxk/tF4K88Jbzpf6nseho8hTORnrdvRJf
	AdYfjAyoPALTUaZ/FL6jR2iNrapRxPLShxGkTtEueEkEyArn7NUVogczi00gwETrFcX6z3Ih2ok
	7cmJPEmSI36KKkDPhVGBVU9aJGfzZ8L1nTufYxoXE7m1VEmTV1vCalqgCIBz6bPaMZcbGe3JGX8
	O7RnJY6Xo6ClWB56kmF3n6+InU03FdXw2wD980gTmsy5OdFi6RuYjOVAqB70IjItk11JZYNJjey
	21lLd/ODCQ2i1gMoAu/AOjALEnl/2SrPPjSRsAsRB9L6p6kz9pvVjyyfB7cCefTHL3YZA+hUSHD
	+qOYmrzkkeQluFUS/9xOhLqSNZ1P65LyDfFELbNf3GaVq+SYx83HA/1+yJWRfQo8WGZ87+3J5HM
	C+PB//npk7s/jx3I4M2VCEMI7X8zBYDDjQl/yU+z+x53F6tK++e6Z5IipSOuNX2AXWLXz+imW5v
	Aracc29kmuKL6k=
X-Received: by 2002:ad4:5dc6:0:b0:894:6b9e:253e with SMTP id 6a1803df08f44-894b0782d3amr63036096d6.52.1769441039525;
        Mon, 26 Jan 2026 07:23:59 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e3870c48sm1044157185a.51.2026.01.26.07.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:23:59 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 03/07] linux-yocto/6.12: update to v6.12.66
Date: Mon, 26 Jan 2026 10:23:49 -0500
Message-ID: <20260126152353.2328046-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
References: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 15:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230013

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    f6044d1fd846 Linux 6.12.66
    9e3f8fa53348 bpf: test_run: Fix ctx leak in bpf_prog_test_run_xdp error path
    f8b406198778 ALSA: hda: intel-dsp-config: Prefer legacy driver as fallback
    47e676ce4d68 tpm2-sessions: Fix out of range indexing in name_size
    42440155fe27 spi: cadence-quadspi: Prevent lost complete() call during indirect read
    3762535fbbc0 scsi: sg: Fix occasional bogus elapsed time that exceeds timeout
    0810c8e94d6b ASoC: fsl_sai: Add missing registers to cache default
    1d2a10913089 ALSA: hda/realtek: enable woofer speakers on Medion NM14LNL
    8072299bf13f ASoC: amd: yc: Add quirk for Honor MagicBook X16 2025
    44ed8fae346f ALSA: usb-audio: Update for native DSD support quirks
    ba6f0d1832ee can: j1939: make j1939_session_activate() fail if device is no longer registered
    47206d70d1fb drm/amdkfd: Fix improper NULL termination of queue restore SMI event string
    1c06d85c3d51 spi: mt65xx: Use IRQF_ONESHOT with threaded IRQ
    f609041424d5 drm/amd/display: Fix DP no audio issue
    9f6cf07687be ata: libata-core: Disable LPM on ST2000DM008-2FR102
    14fa3d1927f1 netfilter: nf_tables: avoid chain re-validation if possible
    feb28b6827ec powercap: fix sscanf() error return value handling
    3835d59f6999 powercap: fix race condition in register_control_type()
    7b60aed82db1 net: sfp: extend Potron XGSPON quirk to cover additional EEPROM variant
    fb9ef40cccdb bpf: Fix reference count leak in bpf_prog_test_run_xdp()
    6447e697cfa8 bpf, test_run: Subtract size of xdp_frame from allowed metadata size
    6611a73b2991 bpf: Support specifying linear xdp packet data size for BPF_PROG_TEST_RUN
    0eb6e9d3b724 bpf: Make variables in bpf_prog_test_run_xdp less confusing
    202c5b915e22 bpf: Fix an issue in bpf_prog_test_run_xdp when page size greater than 4K
    5c647749bce3 btrfs: fix beyond-EOF write handling
    afbb57899612 btrfs: use variable for end offset in extent_writepage_io()
    a915072e5ac3 btrfs: truncate ordered extent when skipping writeback past i_size
    7216d78ca34f btrfs: remove btrfs_fs_info::sectors_per_page
    ced5459df05a btrfs: add extra error messages for delalloc range related errors
    fb4fa3f9012b btrfs: subpage: dump the involved bitmap when ASSERT() failed
    9ed14c3b787b btrfs: fix error handling of submit_uncompressed_range()
    fcc04c92cbb5 ALSA: ac97: fix a double free in snd_ac97_controller_register()
    71138011dc01 ALSA: ac97bus: Use guard() for mutex locks
    7388ba6e5ccd erofs: fix file-backed mounts no longer working on EROFS partitions
    d47b03775d55 erofs: don't bother with s_stack_depth increasing for now
    dd6ccec088ad arp: do not assume dev_hard_header() does not change skb->head
    de77d2cd178a net: enetc: fix build warning when PAGE_SIZE is greater than 128K
    471dfb97599e net: usb: pegasus: fix memory leak in update_eth_regs_async()
    43497313d0da net/sched: sch_qfq: Fix NULL deref when deactivating inactive aggregate in qfq_reset
    3d67e8c22685 HID: quirks: work around VID/PID conflict for appledisplay
    4969d6fa61af net: netdevsim: fix inconsistent carrier state after link/unlink
    d916df47a031 idpf: cap maximum Rx buffer size
    a4212d6732e3 idpf: fix memory leak in idpf_vport_rel()
    be3d31276199 idpf: keep the netdev when a reset fails
    3264881431e3 net: fix memory leak in skb_segment_list for GRO packets
    92ff65c660eb riscv: pgtable: Cleanup useless VA_USER_XXX definitions
    1eeaaeceafcf btrfs: only enforce free space tree if v1 cache is required for bs < ps cases
    6762937a8b45 vsock: Make accept()ed sockets use custom setsockopt()
    f1029391e604 bnxt_en: Fix potential data corruption with HW GRO/LRO
    57f1dd8fa966 net: wwan: iosm: Fix memory leak in ipc_mux_deinit()
    9e0f54294fae net/mlx5e: Don't print error message due to invalid module
    b71d08b96864 netdev: preserve NETIF_F_ALL_FOR_ALL across TSO updates
    005671c60fcf net: sock: fix hardened usercopy panic in sock_recv_errqueue
    50f65526b33d inet: ping: Fix icmp out counting
    03fb1708b7d1 net: mscc: ocelot: Fix crash when adding interface under a lag
    269c9283ff7f bridge: fix C-VLAN preservation in 802.1ad vlan_tunnel egress
    3950054c9512 net: marvell: prestera: fix NULL dereference on devlink_alloc() failure
    26a82dce2bee netfilter: nf_conncount: update last_gc only when GC has been performed
    e1a436981ac9 netfilter: nf_tables: fix memory leak in nf_tables_newrule()
    cdafa52ad39b gpio: pca953x: handle short interrupt pulses on PCAL devices
    d4f333a0155d gpio: pca953x: Add support for level-triggered interrupts
    dd42e23b6d9e netfilter: nft_synproxy: avoid possible data-race on update operation
    16b4508e8717 netfilter: nft_set_pipapo: fix range overlap detection
    b397bb9c34ac arm64: dts: mba8mx: Fix Ethernet PHY IRQ support
    97fdde3189b6 arm64: dts: imx8qm-ss-dma: correct the dma channels of lpuart
    35b38dd6a792 arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on DH electronics i.MX8M Plus DHCOM
    88d60cff3000 ARM: dts: imx6q-ba16: fix RTC interrupt level
    3e458210ee2c arm64: dts: add off-on-delay-us for usdhc2 regulator
    06b1dfa40090 crypto: qat - fix duplicate restarting msg during AER error
    8f6afb166402 arm64: dts: ti: k3-am62-lp-sk-nand: Rename pinctrls to fix schema warnings
    75e2bc2985f4 drm/amd/display: Apply e4479aecf658 to dml
    163df8d79a0d drm/amd/display: Respect user's CONFIG_FRAME_WARN more for dml files
    582ba48e4a4c btrfs: fix NULL dereference on root when tracing inode eviction
    ec3695dd0acd btrfs: tracepoints: use btrfs_root_id() to get the id of a root
    53df7a4c3a56 btrfs: qgroup: update all parent qgroups when doing quick inherit
    b9b19fecad7d btrfs: fix qgroup_snapshot_quick_inherit() squota bug
    dedec6e6b421 scsi: Revert "scsi: libsas: Fix exp-attached device scan after probe failure scanned in again after probe failed"
    496ca70a15f4 scsi: ufs: core: Fix EH failure after W-LUN resume error
    f373695d62e0 scsi: ipr: Enable/disable IRQD_NO_BALANCING during reset
    261233f765d2 smb/client: fix NT_STATUS_NO_DATA_DETECTED value
    596d1b968660 smb/client: fix NT_STATUS_DEVICE_DOOR_OPEN value
    b1dd68601676 smb/client: fix NT_STATUS_UNABLE_TO_FREE_VM value
    e83af97d5c39 drm/amd/display: shrink struct members
    a8559efcd576 NFS: Fix up the automount fs_context to use the correct cred
    71029266093b ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning (again)
    e1df03e293a0 NFSv4: ensure the open stateid seqid doesn't go backwards
    6a1099604b0c dm-snapshot: fix 'scheduling while atomic' on real-time kernels
    f002df3a3305 alpha: don't reference obsolete termio struct for TC* constants
    1b645cd729ef ARM: 9461/1: Disable HIGHPTE on PREEMPT_RT kernels
    7010683101b5 csky: fix csky_cmpxchg_fixup not working
    32dc49f49ea0 drm/xe: Ensure GT is in C0 during resumes
    e724d0261b7c drm/xe: make xe_gt_idle_disable_c6() handle the forcewake internally
    f09cd209359a tls: Use __sk_dst_get() and dst_dev_rcu() in get_netdev_for_sock().
    6f468f6ff233 libceph: make calc_target() set t->paused, not just clear it
    e94075e950a6 libceph: reset sparse-read state in osd_fault()
    d2c4a5f69966 libceph: return the handler error from mon_handle_auth_done()
    c4c2152a858c libceph: make free_choose_arg_map() resilient to partial allocation
    6c6cec3db3b4 libceph: replace overzealous BUG_ON in osdmap_apply_incremental()
    2802ef3380fa libceph: prevent potential out-of-bounds reads in handle_auth_done()
    f94f95b81736 wifi: mac80211: restore non-chanctx injection behaviour
    024f71a57d56 wifi: avoid kernel-infoleak from struct iw_point
    fcb7500bfa24 pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping
    321e17ff3142 gpio: rockchip: mark the GPIO controller as sleeping
    7500ab83bad2 drm/radeon: Remove __counted_by from ClockInfoArray.clockInfo[]
    bc96db7051cc drm/pl111: Fix error handling in pl111_amba_probe
    90b4b130a20d drm/amdgpu: Fix query for VPE block_type and ip_count
    49a66829dd36 counter: interrupt-cnt: Drop IRQF_NO_THREAD flag
    c61440f1e741 counter: 104-quad-8: Fix incorrect return value in IRQ handler
    196e8fd7424b lib/crypto: aes: Fix missing MMU protection for AES S-box
    97130283b83f mei: me: add nova lake point S DID
    0c2413c69129 btrfs: always detect conflicting inodes when logging inode refs
    8b402146e3a8 arm64: Fix cleared E0POE bit after cpu_suspend()/resume()
    2f05f7737e16 net: 3com: 3c59x: fix possible null dereference in vortex_probe1()
    1320d94a4df1 atm: Fix dma_free_coherent() size
    3f5d7f3865c6 NFSD: Remove NFSERR_EAGAIN
    8c1cf63ed465 NFSD: net ref data still needs to be freed even if net hasn't startup
    d95499900fe5 nfsd: check that server is running in unlock_filesystem
    03c68f94fad1 nfsd: use correct loop termination in nfsd4_revoke_states()
    ba4811c8b433 nfsd: provide locking for v4_end_grace
    6b7ad17f4dd5 NFSD: Fix permission check for read access to executable-only files

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 254a4b9c9f..c463840c80 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9f8581c660c7b402312572cbf9cbe03833ed20aa"
-SRCREV_meta ?= "12efb3470e9a439d7806984d360a3712350076d0"
+SRCREV_machine ?= "e9cbfbc05015c935e7bc4991c443602122f4b819"
+SRCREV_meta ?= "46ae7e7d4ce1ee55091957bff63e0f54a761a93d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.65"
+LINUX_VERSION ?= "6.12.66"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 6aa9dd7d56..f5610a2d41 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.65"
+LINUX_VERSION ?= "6.12.66"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
-SRCREV_meta ?= "12efb3470e9a439d7806984d360a3712350076d0"
+SRCREV_machine ?= "59d7360e98794225985c1da95ec614563320c61b"
+SRCREV_meta ?= "46ae7e7d4ce1ee55091957bff63e0f54a761a93d"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 62f7e8a9bd..fbb4f31107 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b9671eac4ed537384b52ae04e7e1c728b631fb13"
-SRCREV_machine:qemuarm64 ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
-SRCREV_machine:qemuloongarch64 ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
-SRCREV_machine:qemumips ?= "bb006b07c2a942338e7f52070f8026791f30c5f0"
-SRCREV_machine:qemuppc ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
-SRCREV_machine:qemuriscv64 ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
-SRCREV_machine:qemuriscv32 ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
-SRCREV_machine:qemux86 ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
-SRCREV_machine:qemux86-64 ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
-SRCREV_machine:qemumips64 ?= "d9af48f273a9d87a61a46c93d7642d9e72947514"
-SRCREV_machine ?= "5b6cf700d8a16b91937d61bd3bf0248bb1771644"
-SRCREV_meta ?= "12efb3470e9a439d7806984d360a3712350076d0"
+SRCREV_machine:qemuarm ?= "6a83054dc7e21d30a030ef52b5ff4c2531c56bf2"
+SRCREV_machine:qemuarm64 ?= "59d7360e98794225985c1da95ec614563320c61b"
+SRCREV_machine:qemuloongarch64 ?= "59d7360e98794225985c1da95ec614563320c61b"
+SRCREV_machine:qemumips ?= "033446da85710e7854f8bbca5b4058d3d158d218"
+SRCREV_machine:qemuppc ?= "59d7360e98794225985c1da95ec614563320c61b"
+SRCREV_machine:qemuriscv64 ?= "59d7360e98794225985c1da95ec614563320c61b"
+SRCREV_machine:qemuriscv32 ?= "59d7360e98794225985c1da95ec614563320c61b"
+SRCREV_machine:qemux86 ?= "59d7360e98794225985c1da95ec614563320c61b"
+SRCREV_machine:qemux86-64 ?= "59d7360e98794225985c1da95ec614563320c61b"
+SRCREV_machine:qemumips64 ?= "57df96df5815eeedc9ab958e7464cf43c7494053"
+SRCREV_machine ?= "59d7360e98794225985c1da95ec614563320c61b"
+SRCREV_meta ?= "46ae7e7d4ce1ee55091957bff63e0f54a761a93d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "39cb076c7dc7e44e3cab5c82ffda16a550ed8436"
+SRCREV_machine:class-devupstream ?= "f6044d1fd846ed1ae457975738267214b538a222"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.65"
+LINUX_VERSION ?= "6.12.66"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


