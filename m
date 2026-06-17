Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70D4CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:50 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10406.1781682348322613310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0mxasoCr;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-462342ac290so725087f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682346; x=1782287146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXNoz3ttkVFrd5uevpgaR90BG5E7/qr0yfetyjcN1kU=;
        b=0mxasoCr3D1pBuCpW1HyPZ1ETutgJPrxnTnlrum+UJlipLRorCAK2CjsUkdnRr3y8z
         H7BlFOsEQiZt+ALmuzOI1TGcQEcwSi2N/+dQmo4hhTkS9mbS1kJW9uLhGPHiI2SJ5A5p
         NcGbyWRpKHwbUj04sgkcZUAdemIluh19BnLqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682346; x=1782287146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iXNoz3ttkVFrd5uevpgaR90BG5E7/qr0yfetyjcN1kU=;
        b=IVBTKL65Pe/y1nF+SusqKCRsKxL7bSRb4HCDbMVNBkdPj9fK1yTnAHl0nD16Xt3713
         JA7UIkeE2nide/KBEUSEv2SxPCmGlNCOZ1aN9qtZTgVReFVk7jZiLnMSHosSN+GjQStP
         XLLg5rvbPkx+RaqYInreSefVYiAqIYa82Ru56hwFUJLzxvEiYudxx6JpiZehU/BrsdWA
         iAOJT3VO7DabkEhAG6Bnt7mDVVDr/b5T43Zosh2K32LUq8McAfMg0SKOOhwgmI3gzEhn
         eiGn22MlMztI0OYC+GtBVZzhKF5DZJjAnBtUNInCvDxpgfz6kx4+u1hlqw2MNxhcghqp
         ptmg==
X-Gm-Message-State: AOJu0YxvMRBfWPQ0frpH5B79L1dsaD8N3LCsczvCe0SnEv9PxofLGXqG
	PLCY1mvvO+i6LoYfh9SyZHzPm13QEBaXRhqbU9S3rZONMg3U71DmSkK9IX9vNobh+jDLIK5Yo+W
	1PRps
X-Gm-Gg: AfdE7cms7LuHzXUSXG56BJh6kLoxdA5qloQo7ivMb92RUQqxlqLKdUnqhGvJZq8KcTW
	F032GfRaR2N6F3K7ggfQ4mHx6xvszKrPpQuQrA7PQeyA5wGKfj5gbjPkiOQZvd019QTCshd+3Er
	Lj6UIgytUHLRfmLY6bABxSqKI1bM5cqgqdNl86LVULJmEgFx9R02qUAKl3MCHnj/6oq2DSz8owf
	Xg+J6wx5GKz5kMpPu7UfE8BZ6ILaKhFCi2ag8EB8UxPOlOXm557aMDw0f4XDdaSYZ91LhATvxhs
	j4wOLJ5+OOVkts/NnO62kGqteMfMyXDiSk0N2RuKx0/W0zkh+abHq8WqaRGfrYfXzUIrVquKxqF
	aTofzKYc154WcXLQTiXYzIDxkToWJZ0zgnAzg+gsDMrWfaysl/IOCRyWaKEub5IVNSH/ahIC/f0
	bZHBkaCUQUmYcNXoFaZ3gItVfB+5+ZG5xDab0mTGDthWu/us6+O1Legj5ziMFtpoxsbigKMzn0l
	2Mt90UfgUU6RsqwrQ==
X-Received: by 2002:a5d:6e10:0:b0:45e:ec18:f20a with SMTP id ffacd0b85a97d-462412c6e6bmr2850317f8f.32.1781682346276;
        Wed, 17 Jun 2026 00:45:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 29/30] linux-yocto/6.6: update to v6.6.142
Date: Wed, 17 Jun 2026 09:45:04 +0200
Message-ID: <fb1526e867a458c45d12cbdf284f09e7da947bae.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239012

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    924b4a879cbb Linux 6.6.142
    cefa4265b111 security/keys: fix missed RCU read section on lookup
    105c6a594b3f LoongArch: kprobes: Fix handling of fatal unrecoverable recursions
    1f9c82855641 net: gro: don't merge zcopy skbs
    f504118252af pds_core: ensure null-termination for firmware version strings
    d3f3d6fa0cad pds_core: add an error code check in pdsc_dl_info_get
    01f7f893d5e1 net: mana: validate rx_req_idx to prevent out-of-bounds array access
    3dee2fe0c818 ASoC: cs35l56: Fix flushing of IRQ work in cs35l56_sdw_remove()
    d798b25c24f4 gpio: cdev: check if uAPI v2 config attributes are correctly zeroed
    0f1fd5e83f0b gpiolib: cdev: use !mem_is_zero() instead of memchr_inv(s, 0, n)
    cd87492b79d1 string: add mem_is_zero() helper to check if memory area is all zeros
    c9ea01768903 bpf, skmsg: fix verdict sk_data_ready racing with ktls rx
    40fc66218ad1 net: ag71xx: check error for platform_get_irq
    2a1905730e0c Bluetooth: btmtk: fix urb->setup_packet leak in error paths
    f04578422154 Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c
    73377cf3056a Bluetooth: btmtk: rename btmediatek_data
    aa58d8366269 Bluetooth: btusb: mediatek: refactor the function btusb_mtk_reset
    b748250d778e Bluetooth: btmtk: add the function to get the fw name
    e91687643c44 tracing: Avoid NULL return from hist_field_name() on truncation
    8ba1c4ddbb1c ALSA: seq: Serialize UMP output teardown with event_input
    e5604a480487 ALSA: seq: ump: Use guard() for locking
    b6d3d3816c67 ptrace: Convert ptrace_attach() to use lock guards
    60ef1675b652 pds_core: fix debugfs_lookup dentry leak and error handling
    3231aff8ab26 pds_core: fix error handling in pdsc_devcmd_wait
    1900ca8acb92 bridge: mcast: Fix a possible use-after-free when removing a bridge port
    6e79715b7b8a net: bridge: Flush multicast groups when snooping is disabled
    00904a73272b RDMA/rtrs: Fix use-after-free in path file creation cleanup
    a7685f4d90c1 platform/x86: intel-vbtn: Check ACPI_HANDLE() against NULL
    527a7990e663 platform/x86: intel-hid: Check ACPI_HANDLE() against NULL
    6ea1690b24e9 platform/x86: hp_accel: Check ACPI_COMPANION() against NULL
    32ba2ce2b15f platform/x86: adv_swbutton: Check ACPI_HANDLE() against NULL
    566f42fb67a7 net: mana: Fix TOCTOU double-fetch of hwc_msg_id from DMA buffer
    314a94c47d28 net: dsa: mt7530: preserve VLAN tags on trapped link-local frames
    1bddf306212a net: dsa: mt7530: rename mt753x_bpdu_port_fw enum to mt753x_to_cpu_fw
    d2be607d042d net: dsa: mt7530: fix FDB entries not aging out with short timeout
    69a0885079c9 wifi: ath11k: fix peer resolution on rx path when peer_id=0
    070e40acc59e drm/msm/snapshot: fix dumping of the unaligned regions
    dd844b31f4ea spi: mtk-snfi: Fix resource leak in mtk_snand_read_page_cache()
    5c54c482934b net/mlx5: Do not restore destination-less TC rules
    d65b279a1898 tls: Preserve sk_err across recvmsg() when data has been copied
    1822997aa8c2 x86/xen: Fix xen_e820_swap_entry_with_ram()
    06cc5ad2c112 net: phy: DP83TC811: add reading of abilities
    d04494596b5e net: phy: c45: add genphy_c45_pma_read_ext_abilities() function
    acdc12b71c9a net: tls: prevent chain-after-chain in plain text SG
    131ef12057d9 net: tls: fix off-by-one in sg_chain entry count for wrapped sk_msg ring
    d38ba387244e net/smc: reject CHID-0 ACCEPT that matches an empty ism_dev slot
    a09d07ac45e2 powerpc/time: Remove redundant preempt_disable|enable() calls from arch_irq_work_raise()
    7256e54583ae drm/msm: Fix iommu_map_sgtable() return value check and avoid WARN
    567b5e976e2e drm/msm/dsi: don't dump registers past the mapped region
    b40e10c72df5 ethtool: fix ethnl_bitmap32_not_zero() bit interval semantics
    720c76b930c5 net/smc: avoid NULL deref of conn->lnk in smc_msg_event tracepoint
    9baafc2fea09 accel/qaic: Add overflow check to remap_pfn_range during mmap
    f775be13d342 HID: quirks: really enable the intended work around for appledisplay
    a5db6a7c062f wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()
    3d675896ea03 wifi: ath11k: fix error path leaks in some WMI WOW calls
    b77be98447c4 net: ethernet: cs89x0: remove stale CONFIG_MACH_MX31ADS reference
    78cf08b3be47 net: ethernet: cortina: Carry over frag counter
    68c9c3ac9ce5 net: ethernet: cortina: Drop half-assembled SKB
    3b249988d774 net: ethernet: cortina: Make RX SKB per-port
    00efe58bbdcc netfs: Fix overrun check in netfs_extract_user_iter()
    0df68fd72b2a zonefs: handle integer overflow in zonefs_fname_to_fno
    eef4f71b46a9 irq_work: Fix use-after-free in irq_work_single() on PREEMPT_RT
    6760af11a26e irqchip/ath79-cpu: Remove unused function
    6af5fd2ffda1 phy: marvell: mvebu-a3700-utmi: fix incorrect USB2_PHY_CTRL register access
    b0cc58e8f749 net: lan966x: avoid unregistering netdev on register failure
    9e1c9b957344 ice: fix locking in ice_dcb_rebuild()
    07d77d774f71 tcp: Fix imbalanced icsk_accept_queue count.
    08d355936fcf test_kprobes: clear kprobes between test runs
    8a5f01446021 kprobes: skip non-symbol addresses in kprobe_add_ksym_blacklist()
    99948d73a8c7 netfilter: x_tables: unregister the templates first
    26b2290baaf6 btrfs: tracepoints: fix sleep while in atomic context in btrfs_sync_file()
    542b49d2cf12 ALSA: hda: cs35l56: Put ACPI device after setting companion
    508b1193d63b ARM: integrator: Fix early initialization
    fb3ff02dd444 pinctrl: qcom: Fix wakeirq map by removing disconnected irqs for sm8150
    7d694570281a kunit: config: KUNIT_DEBUGFS should depend on DEBUG_FS
    0df3f3031517 kunit: config: Enable KUNIT_DEBUGFS by default
    8b0f4e3b7ad6 firmware: arm_ffa: Skip free_pages on RX buffer alloc failure
    adfff93d08a2 firmware: arm_ffa: Check for NULL FF-A ID table while driver registration
    58ab91af4124 HID: uclogic: Fix regression of input name assignment
    a2d1c819348b hwmon: (pmbus/adm1266) reject short block-read responses in the GPIO accessors
    20d626463e3f hwmon: (pmbus/adm1266) register the nvmem device after pmbus_do_probe()
    cba4f1122dfb hwmon: (pmbus/adm1266) register the gpio_chip after pmbus_do_probe()
    6b5573b63e30 hwmon: (pmbus/adm1266) don't clobber GPIO bits before PDIO read in get_multiple
    4d1da9a6be5a hwmon: (pmbus/adm1266) cap PDIO scan in get_multiple at ADM1266_PDIO_NR
    60c4b9fe1a3d hwmon: (pmbus/adm1266) bounce blackbox records through a protocol-sized buffer
    d94ceb16e55b hwmon: (pmbus/adm1266) include PEC byte in pmbus_block_xfer read buffer
    f85c81e93dbd hwmon: (pmbus/adm1266) reject implausible blackbox record_count
    025cfc7a09c5 hwmon: (pmbus/adm1266) seed timestamp from the real-time clock
    32edd2a28e11 batman-adv: tt: fix negative tt_buff_len
    22d59c72f4a4 batman-adv: tt: fix negative last_changeset_len
    c2c88736022c batman-adv: tp_meter: fix race condition in send error reporting
    0b1bedf114ea batman-adv: tp_meter: fix tp_vars reference leak in receiver shutdown
    53f931e0146a batman-adv: tp_meter: avoid use of uninit sender vars
    48663158222b batman-adv: bla: fix report_work leak on backbone_gw purge
    b54e459cf869 batman-adv: frag: disallow unicast fragment in fragment
    c1bac194733a batman-adv: fix tp_meter counter underflow during shutdown
    f653b040dad1 batman-adv: fix fragment reassembly length accounting
    866ac1d57040 batman-adv: dat: handle forward allocation error
    6de089b545db batman-adv: clear current gateway during teardown
    70bcb678561f batman-adv: mcast: fix use-after-free in orig_node RCU release
    90c398e822ca drm/amd/display: Validate payload length and link_index in dc_process_dmub_aux_transfer_async
    fb30a3890d62 drm/amd/display: Validate GPIO pin LUT table size before iterating
    266b21b57fbb drm/amd/display: Fix integer overflow in bios_get_image()
    e4d3d33ab7bd drm/bridge: megachips: remove bridge when irq request fails
    25473edcdaef drm/bridge: it66121: acquire reset GPIO in probe
    21ab64c77a30 drm/virtio: use uninterruptible resv lock for plane updates
    371f53925a67 device property: set fwnode->secondary to NULL in fwnode_init()
    fb3539b367f5 LoongArch: Remove unused code to avoid build warning
    14553be882d9 RDMA/siw: Reject MPA FPDU length underflow before signed receive math
    f2dc841d7dc9 spi: ti-qspi: fix use-after-free after DMA setup failure
    450c319dd04d spi: sprd: fix error pointer deref after DMA setup failure
    309c6058622d scsi: isci: Fix use-after-free in device removal path
    9d5ae6b8d9ec phy: tegra: xusb: Fix per-pad high-speed termination calibration
    45760b72e84c spi: qup: fix error pointer deref after DMA setup failure
    3c83a6912c24 drm/bridge: chipone-icn6211: use devm_drm_bridge_add in i2c probe
    dab9f93251b2 KVM: arm64: vgic-its: Reject restored DTE with out-of-range num_eventid_bits
    e0790046f6be arm64: probes: Handle probes on hinted conditional branch instructions
    f383cff9fb38 tracing: Do not call map->ops->elt_free() if elt_alloc() fails
    bdc349a87f1f cifs: Fix busy dentry used after unmounting
    1ced0f5a851f wifi: cfg80211: advance loop vars in cfg80211_merge_profile()
    a3a4366731a5 ice: fix setting promisc mode while adding VID filter
    add70e2682c0 ixgbevf: fix use-after-free in VEPA multicast source pruning
    3c5411fa4944 ipv4: raw: reject IP_HDRINCL packets with ihl < 5
    f50c3ff97c83 wifi: ath11k: clear shared SRNG pointer state on restart
    ce29d3bf79a2 vsock/virtio: reset connection on receiving queue overflow
    cc27e989a5df vsock/vmci: fix UAF when peer resets connection during handshake
    273a1481c556 ring-buffer: Fix reporting of missed events in iterator
    3904b993cc17 qed: fix double free in qed_cxt_tables_alloc()
    c161ad9157f5 netfilter: nft_inner: Fix IPv6 inner_thoff desync
    c281e018af98 netfilter: ipset: stop hash:* range iteration at end
    1e5e20031c5e netfilter: nf_queue: hold bridge skb->dev while queued
    41ec2e242f17 netfilter: ip6t_hbh: reject oversized option lists
    16bd798cb6d8 net: ifb: report ethtool stats over num_tx_queues
    289499907399 net: bcmgenet: keep RBUF EEE/PM disabled
    8420aa490041 phonet/pep: disable BH around forwarded sk_receive_skb()
    be43e6b40431 Bluetooth: serialize accept_q access
    a143ce77a529 Bluetooth: MGMT: validate Add Extended Advertising Data length
    9d20d48be2c4 Bluetooth: hci_uart: fix UAFs and race conditions in close and init paths
    fe69f634b076 Bluetooth: bnep: Fix UAF read of dev->name
    3af41ee7ebec Bluetooth: ISO: drop ISO_END frames received without prior ISO_START
    5d86d2f1b4d9 Bluetooth: fix UAF in l2cap_sock_cleanup_listen() vs l2cap_conn_del()
    6f63a60580eb net: wwan: iosm: fix potential memory leaks in ipc_imem_init()
    686b4283f82c drivers/base/memory: fix memory block reference leak in poison accounting
    29cd94e678fc efi: Allocate runtime workqueue before ACPI init
    7b6f8c8eb93f ALSA: asihpi: Fix potential OOB array access at reading cache
    41a766c64729 ALSA: pcm: Don't setup bogus iov_iter for silencing
    dade81458966 ALSA: ua101: Reject too-short USB descriptors
    0dbf64c50244 hwmon: (pmbus/adm1266) widen blackbox-info buffer to I2C_SMBUS_BLOCK_MAX
    adcfb16ae402 smb/server: promote S_DEL_ON_CLS to S_DEL_PENDING when close
    7df1df6f40c0 smb: client: protect tc_count increment in smb2_find_smb_sess_tcon_unlocked()
    9d378e17c864 ksmbd: fix SID memory leak in set_posix_acl_entries_dacl() on overflow
    e43cb36d4d78 ksmbd: fix null pointer dereference in compare_guid_key()
    082351f9d400 mm/damon/sysfs-schemes: call missing mem_cgroup_iter_break()
    31527d80234c sysfs: don't remove existing directory on update failure
    ad7520628c74 Revert "af_unix: Reject SIOCATMARK on non-stream sockets"
    f624070c322d Revert "s390/cio: Update purge function to unregister the unused subchannels"
    7963b6141b4c Revert "ice: Remove jumbo_remove step from TX path"
    6331b0f7b71e Revert "ice: fix double-free of tx_buf skb"
    2035acfb1722 smb: client: reject userspace cifs.spnego descriptions
    3106f326f67c af_unix: Give up GC if MSG_PEEK intervened.
    3a436932eb39 ksmbd: close durable scavenger races against m_fp_list lookups
    712cdf917e77 ksmbd: validate owner of durable handle on reconnect
    7f0cb478703c ksmbd: add durable scavenger timer
    50a23fa28e76 ksmbd: avoid reclaiming expired durable opens by the client
    2682bf9a804b Revert "x86/vdso: Fix output operand size of RDPID"
    ba5b43db126a wifi: mac80211: check tdls flag in ieee80211_tdls_oper
    a052c2d8399a s390/debug: Reject zero-length input before trimming a newline
    492349e5e4a3 driver core: platform: use generic driver_override infrastructure
    64a3ee535bd7 driver core: generalize driver_override in struct device
    fabfed1afe27 spi: spidev: fix lock inversion between spi_lock and buf_lock
    6a3af482188f mptcp: pm: ADD_ADDR rtx: free sk if last
    9426265e157d mptcp: pm: ADD_ADDR rtx: always decrease sk refcount
    19a3ec9ef176 mptcp: pm: ADD_ADDR rtx: allow ID 0
    b386aa38b81d mptcp: sync the msk->sndbuf at accept() time

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 5fcf0f81d7c..c7f8b73fa94 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7bb6512fc5dc7b1191867beadc83b3ce216a2037"
-SRCREV_meta ?= "020f8355dc905686f3c125ec87ce4d21a5966750"
+SRCREV_machine ?= "422bdbd919836dc6565f5bbeb5b662b9c52dc038"
+SRCREV_meta ?= "113d5637ef24d6ca9e43d64dec47efa3f7548c89"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.141"
+LINUX_VERSION ?= "6.6.142"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 0bd1ae9ad2d..151d63c8a20 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.141"
+LINUX_VERSION ?= "6.6.142"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "90e2be4f80d73789176eab3679ef12ec164d594f"
-SRCREV_meta ?= "020f8355dc905686f3c125ec87ce4d21a5966750"
+SRCREV_machine ?= "597d6818e83dc368f871fccf981a2a54a93196d0"
+SRCREV_meta ?= "113d5637ef24d6ca9e43d64dec47efa3f7548c89"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index f684fac7242..4288688afed 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b3697b53304c9f2c0e7e46a22549ed9d64a110ca"
-SRCREV_machine:qemuarm64 ?= "302113f65bb9cbd9afdb476222cc1fa596e36855"
-SRCREV_machine:qemuloongarch64 ?= "2c57d38b7d1560691a786d2daf5be0e25d200dfb"
-SRCREV_machine:qemumips ?= "a6b8c8416a2074c8e14eeeeb36a0e5bd0f2add92"
-SRCREV_machine:qemuppc ?= "413e2245480aec98a737ab657322180581a496f5"
-SRCREV_machine:qemuriscv64 ?= "2c57d38b7d1560691a786d2daf5be0e25d200dfb"
-SRCREV_machine:qemuriscv32 ?= "2c57d38b7d1560691a786d2daf5be0e25d200dfb"
-SRCREV_machine:qemux86 ?= "2c57d38b7d1560691a786d2daf5be0e25d200dfb"
-SRCREV_machine:qemux86-64 ?= "2c57d38b7d1560691a786d2daf5be0e25d200dfb"
-SRCREV_machine:qemumips64 ?= "257558ce69f7bdbc571cb1b2d9eb35890747fd02"
-SRCREV_machine ?= "2c57d38b7d1560691a786d2daf5be0e25d200dfb"
-SRCREV_meta ?= "020f8355dc905686f3c125ec87ce4d21a5966750"
+SRCREV_machine:qemuarm ?= "860f859f5e469702d108e6ce9d3affaca072cfa3"
+SRCREV_machine:qemuarm64 ?= "60caa07a883ec933fad7aadaa2eb67a16c207906"
+SRCREV_machine:qemuloongarch64 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
+SRCREV_machine:qemumips ?= "6895489ba64aa274deea1687100068d4afddaec4"
+SRCREV_machine:qemuppc ?= "5a29f898aaae6bd0e12bdaeed596f40ab6fec468"
+SRCREV_machine:qemuriscv64 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
+SRCREV_machine:qemuriscv32 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
+SRCREV_machine:qemux86 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
+SRCREV_machine:qemux86-64 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
+SRCREV_machine:qemumips64 ?= "44180b7d240f83de490ab570bc092afe5d123207"
+SRCREV_machine ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
+SRCREV_meta ?= "113d5637ef24d6ca9e43d64dec47efa3f7548c89"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0a40c6fbd105802fbbcaadca249e0948fbf8095a"
+SRCREV_machine:class-devupstream ?= "924b4a879cbb75aef37c160b955b92f6894b11a4"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.141"
+LINUX_VERSION ?= "6.6.142"
 
 PV = "${LINUX_VERSION}+git"
 

