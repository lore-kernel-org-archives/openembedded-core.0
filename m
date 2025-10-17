Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC9CCCD1AA
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:53 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.3131.1760733591336927494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Axe8qsa0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-789fb76b466so2174188b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733590; x=1761338390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDDWqSIeqAGYMG3kwhMw01R+hkBPKmHoPxmzsfHmacs=;
        b=Axe8qsa0SQX7VBVU+e+89k1K4djfgVujeR54XOamCV6uZAjpBl/BiDEk3TE6DKGv86
         l8r3dkF0RV0PlQ9RKcAS7gqNvwYiMsl3FSIHeMQ0wIISUmHe34UzEuYl+xBnMdKC5KS5
         tm9UfiIDkLfFAqHxsxJwiqZZzOs7N7fuL4lRZTJ7SpDlT0fRwCYaqJ19JnUqNq1T5H/z
         UPFLfD5I0pS09JODlpzuzOorCi3N3LLimpphuWnXRKf2ZT0ru0Iwv+0JH6TBiRtE4qK8
         utIkOnys6zc4GzhKrQR4+8mH7NnlN4kobP84EOT1pIpCDYUzy4AB5p4xtkJNCjkRSAt2
         pSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733590; x=1761338390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDDWqSIeqAGYMG3kwhMw01R+hkBPKmHoPxmzsfHmacs=;
        b=mcqou0qg3aTwS5EP0hUK5jI7flJjpo/Mcp/OrsGkehvVoMhQxzAONw6kVaVTpqBKvp
         QW2/FCemdIEKbJjCFhSi1yuhCm2oWTsa2d/O3c4TFfQtFwUqhBwgP6fX9AuqgHEYBDh7
         gmJANPknWeYLVRA47+HvrNB5uE8yjA5Q25/MoAiHYseMNVtgfVqfepm3w5FjnmmJ9ILg
         0KfTDFatX0DTgKyq4eaPtCFQirT+qgFsACnWJOJ3cUTU3b0zC2EZAI16Tmvs+3zIbWPW
         089kY8phttO2s+lnkFcrPRiIdagVMrtXiAlB/LnXCHgxlK1zgLMxeHA23XWhKN/t/nRP
         ApPg==
X-Gm-Message-State: AOJu0YySA3YIoDropDSHnSHe1Kxl1XakG4mlijuZDXh/Xc/2WZohZZY/
	X6QnVvRcOa/6aRjQOSSS1A3vd4Ax1LbG6bWfFljOJzDd5VrcuNgjCWJGPqah8OzfFRpEKqZHLLa
	tha20X9o=
X-Gm-Gg: ASbGncspCG8hQQ5fOAHIMjtfxd3/YVXS800HTCGcMJi1/gxRDzT/MF74L0ABZN2hmVs
	bCZQ5y3f8jKG22Klo+QqYj1xZV11figk4sIanf6TN+OyujDsWOWnfcxwW9e0Qo5+5OMu8XftRsj
	vz9DY1H7BeoHupFhvlGvvrO1M4e1Cw9Vs0RQJqmnHY6WqC6+oRAAaP/20TXhQZUD50XOfKHxW2h
	SlOD3JhmmSmrjFl3RQi/tQB61bDO3FoL6HnwDXVDv+sPw5pJgvi2RYdn1mQCJTi3kYwdD6hdG/x
	RgCAsNSz8lwQv8LJjlgYJcqAccurfUV82RwlSjRO90MyMAy8z92goSTSQNGugxtk4SKvhqqVjic
	hIAN0ShW2OIxM4wCd6AWTXIAAO6/4F1OS+VjiULPbMjMtq8pbo6AiApjcgDZszpvh/w==
X-Google-Smtp-Source: AGHT+IFurHTJuusmbdh3E8Vsh/1CdDIdGX/cTSJM5ysuqNQ0lMZiRCS6sbJRqcjdttY1zMtjmthLgg==
X-Received: by 2002:a05:6a20:430e:b0:32d:a70e:120a with SMTP id adf61e73a8af0-334a8621362mr7312443637.45.1760733590087;
        Fri, 17 Oct 2025 13:39:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/26] linux-yocto/6.6: update to v6.6.102
Date: Fri, 17 Oct 2025 13:38:59 -0700
Message-ID: <9c0af64f5b688d89349a80cb27bbbc451abfab38.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225050

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    bb9c90ab9c5a Linux 6.6.102
    aada327a9f80 usb: gadget : fix use-after-free in composite_dev_cleanup()
    e1ee74b9eeb2 mm/hmm: move pmd_to_hmm_pfn_flags() to the respective #ifdeffery
    d98b34c40dc7 MIPS: mm: tlb-r4k: Uniquify TLB entries on init
    ab85071a0354 x86/fpu: Delay instruction pointer fixup until after warning
    575b71627529 ALSA: scarlett2: Add retry on -EPROTO from scarlett2_usb_tx()
    48a8a2dfc3f5 ALSA: intel_hdmi: Fix off-by-one error in __hdmi_lpe_audio_probe()
    1fb873971e23 x86/sev: Evict cache lines during SNP memory validation
    fdf6959b700b net: usbnet: Fix the wrong netif_carrier_on() call
    3c6236588dc8 net: usbnet: Avoid potential RCU stall on LINK_CHANGE event
    2b98a1539736 Bluetooth: btusb: Add USB ID 3625:010b for TP-LINK Archer TX10UB Nano
    ae591cf2348a sched,freezer: Remove unnecessary warning in __thaw_task
    036bdae8c985 freezer,sched: Clean saved_state when restoring it during thaw
    2e62985121b7 freezer,sched: Do not restore saved_state of a thawed task
    e241ca2f0ec3 freezer,sched: Use saved_state to reduce some spurious wakeups
    8afa818c7733 sched/core: Remove ifdeffery for saved_state
    2c9a096e202c i2c: stm32f7: unmap DMA mapped buffer
    bab0986dc045 i2c: stm32f7: simplify status messages in case of errors
    d786b6592030 i2c: stm32f7: perform most of irq job in threaded handler
    9bfaaa964014 i2c: stm32f7: use dev_err_probe upon calls of devm_request_irq
    de7c7caea59b i2c: stm32f7: Use devm_clk_get_enabled()
    66bf243531ee USB: serial: option: add Foxconn T99W709
    2f4d88f5e5ee smb: server: Fix extension string in ksmbd_extract_shortname()
    fa1c47af4ff6 ksmbd: limit repeated connections from clients with the same IP
    62d136d30621 ksmbd: fix corrupted mtime and ctime in smb2_open
    b69fd87076da ksmbd: fix Preauh_HashValue race condition
    d79c8bebaa62 ksmbd: fix null pointer dereference error in generate_encryptionkey
    44bd006d5c93 vsock: Do not allow binding to VMADDR_PORT_ANY
    88caf46db823 net/packet: fix a race in packet_set_ring() and packet_notifier()
    29d417b1a0d5 selftests/perf_events: Add a mmap() correctness test
    6757a31a8e29 perf/core: Prevent VMA split of buffer mappings
    f41e9eba77bf perf/core: Exit early on perf_mmap() fail
    f07ab7a4b572 perf/core: Don't leak AUX buffer refcount on allocation failure
    b1df39462171 sunrpc: fix handling of server side tls alerts
    d2622f38652c smb: client: return an error if rdma_connect does not return within 5 seconds
    bd7f84df5436 pptp: fix pptp_xmit() error path
    4e5cf39e4064 smb: client: let recv_done() cleanup before notifying the callers.
    83d2a4185f5a smb: client: make sure we call ib_dma_unmap_single() only if we called ib_dma_map_single already
    f069f7c14204 smb: client: make use of common smbdirect_socket
    947569b95987 smb: smbdirect: add smbdirect_socket.h
    61f0a6849005 smb: client: Correct typos in multiple comments across various files
    91d7e6cbb3f8 smb: client: Use min() macro
    c29dbc44fbf7 smb: server: let recv_done() avoid touching data_transfer after cleanup/move
    66110b35bebc smb: server: let recv_done() consistently call put_recvmsg/smb_direct_disconnect_rdma_connection
    e67aff50476f smb: server: make sure we call ib_dma_unmap_single() only if we called ib_dma_map_single already
    28db0cb8a0da smb: server: remove separate empty_recvmsg_queue
    2e4463f44e9b ALSA: hda/ca0132: Fix missing error handling in ca0132_alt_select_out()
    cd2a7f950038 irqchip: Build IMX_MU_MSI only on ARM
    39491e859fd4 net/sched: mqprio: fix stack out-of-bounds write in tc entry parsing
    c377ba2be943 benet: fix BUG when creating VFs
    a55b3d153318 sunrpc: fix client side handling of tls alerts
    a7176675c39a net/sched: taprio: enforce minimum value for picos_per_byte
    0d45954034f8 net: drop UFO packets in udp_rcv_segment()
    ef05007b403d ipv6: reject malicious packets in ipv6_gso_segment()
    194cd28c889a net/mlx5: Correctly set gso_segs when LRO is used
    97ed92a23f0b netlink: specs: ethtool: fix module EEPROM input/output arguments
    5005d2437737 pptp: ensure minimal skb length in pptp_xmit()
    5fde6e016004 net: ipa: add IPA v5.1 and v5.5 to ipa_version_string()
    b80353a72958 phy: mscc: Fix parsing of unicast frames
    b0cf318f5cc6 netpoll: prevent hanging NAPI when netcons gets enabled
    227154eb7567 md/md-cluster: handle REMOVE message earlier
    75ed1f6ed8ee NFS: Fixup allocation flags for nfsiod's __GFP_NORETRY
    1116e66111f8 NFSv4.2: another fix for listxattr
    12ad3def2e5e NFS: Fix filehandle bounds checking in nfs_fh_to_dentry()
    30a739931ed8 NFS: Fix wakeup of __nfs_lookup_revalidate() in unblock_revalidate()
    147216030e46 sched: Add test_and_clear_wake_up_bit() and atomic_dec_and_wake_up()
    3bdb29df2f0d pNFS/flexfiles: don't attempt pnfs on fatal DS errors
    6e7b24c71e53 PCI: pnv_php: Fix surprise plug detection and recovery
    a426e8a6ae16 powerpc/eeh: Make EEH driver device hotplug safe
    3f49abdf88b6 powerpc/eeh: Export eeh_unfreeze_pe()
    17dabd7efb28 PCI: pnv_php: Work around switches with broken presence detection
    32173edf3fe2 PCI: pnv_php: Clean up allocated IRQs on unplug
    9184a2bb522c sched/psi: Fix psi_seq initialization
    9ea1cc8b0e95 kconfig: qconf: fix ConfigList::updateListAllforAll()
    05b450da93c6 scsi: sd: Make sd shutdown issue START STOP UNIT appropriately
    450b2a5cf6e4 scsi: ufs: core: Use link recovery when h8 exit fails during runtime resume
    4933567ef9e6 scsi: Revert "scsi: iscsi: Fix HW conn removal use after free"
    087a8a7ca354 scsi: mpt3sas: Fix a fw_event memory leak
    349436bf11b8 vfio/pci: Separate SR-IOV VF dev_set
    7dbfae90c5a3 vfio/pds: Fix missing detach_ioas op
    9546b26d391f vfio: Prevent open_count decrement to negative
    a6c5e25861e3 vfio: Fix unbalanced vfio_df_close call in no-iommu mode
    f289690f50a0 f2fs: fix to trigger foreground gc during f2fs_map_blocks() in lfs mode
    704613681c1c f2fs: fix to calculate dirty data during has_not_enough_free_secs()
    e33c22f2eeba f2fs: fix to update upper_p in __get_secs_required() correctly
    1023836d1b94 f2fs: vm_unmap_ram() may be called from an invalid context
    345fc8d1838f f2fs: fix to avoid out-of-boundary access in devs.path
    880ef748e78a f2fs: fix to avoid panic in f2fs_evict_inode
    3d37cadaac1a f2fs: fix to avoid UAF in f2fs_sync_inode_meta()
    a96f2bf49fbd f2fs: doc: fix wrong quota mount option description
    dabfa3952c8e f2fs: fix KMSAN uninit-value in extent_info usage
    c1c818b636d4 rtc: rv3028: fix incorrect maximum clock rate handling
    f5790cc2ee6f rtc: pcf8563: fix incorrect maximum clock rate handling
    e337c72b17c6 rtc: pcf85063: fix incorrect maximum clock rate handling
    8456b3e28acf rtc: nct3018y: fix incorrect maximum clock rate handling
    17827903802b rtc: hym8563: fix incorrect maximum clock rate handling
    bb94a96374db rtc: ds1307: fix incorrect maximum clock rate handling
    15da236904ec ucount: fix atomic_long_inc_below() argument type
    f9bd692540d8 module: Restore the moduleparam prefix length check
    7500ba6533ab apparmor: fix loop detection used in conflicting attachment resolution
    fad01f7e0d3e apparmor: ensure WB_HISTORY_SIZE value is a power of 2
    4795bcafe9a8 bpf: Check netfilter ctx accesses are aligned
    f56f6054791e bpf: Check flow_dissector ctx accesses are aligned
    d3bf3088f7e9 vhost-scsi: Fix log flooding with target does not exist errors
    ebc6e1d0e97a mtd: rawnand: atmel: set pmecc data setup time
    a01bc4245e43 mtd: rawnand: rockchip: Add missing check after DMA map
    7d0b53a6d199 mtd: rawnand: atmel: Fix dma_mapping_error() address
    505f4111dd98 jfs: fix metapage reference count leak in dbAllocCtl
    4b5d36cc3014 fbdev: imxfb: Check fb_add_videomode to prevent null-ptr-deref
    0aa273dbcf53 crypto: qat - fix seq_file position update in adf_ring_next()
    1c178ccb6caf crypto: qat - fix DMA direction for compression on GEN2 devices
    9ff4de5bd11a perf tools: Remove libtraceevent in .gitignore
    106891c7bdbc sh: Do not use hyphen in exported variable name
    f658f3676538 ASoC: fsl_xcvr: get channel status data when PHY is not exists
    3187ffe08ff0 dmaengine: nbpfaxi: Add missing check after DMA map
    06ddbb28b72b dmaengine: mv_xor: Fix missing check after DMA map and missing unmap
    25d15b0d2b42 fs/orangefs: Allow 2 more characters in do_c_string()
    b93d06499b6f PCI: endpoint: pci-epf-vntb: Fix the incorrect usage of __iomem attribute
    bdbaa1041816 soundwire: stream: restore params when prepare ports fail
    ac961f6c6dc5 crypto: img-hash - Fix dma_unmap_sg() nents value
    06bc14f9d047 crypto: keembay - Fix dma_unmap_sg() nents value
    5d481d4bea06 hwrng: mtk - handle devm_pm_runtime_enable errors
    9c590ae73c3e watchdog: ziirave_wdt: check record length in ziirave_firm_verify()
    a23fa17e6bec scsi: isci: Fix dma_unmap_sg() nents value
    401fcb7e557d scsi: mvsas: Fix dma_unmap_sg() nents value
    cf9c5b15c4ab scsi: elx: efct: Fix dma_unmap_sg() nents value
    214f94ee5d77 scsi: ibmvscsi_tgt: Fix dma_unmap_sg() nents value
    5b63d6dec556 clk: sunxi-ng: v3s: Fix de clock definition
    c07e017a56d6 perf tests bp_account: Fix leaked file descriptor
    9b2a3e718902 pinmux: fix race causing mux_owner NULL with active mux_usecount
    33c778ea0bd0 proc: use the same treatment to check proc_lseek as ones for proc_read_iter et.al
    adf2da0bf119 kernel: trace: preemptirq_delay_test: use offstack cpu mask
    5449e60e1cbb RDMA/hns: Fix -Wframe-larger-than issue
    db1114685317 crypto: ccp - Fix crash when rebind ccp device for ccp.ko
    a762bbe11269 crypto: inside-secure - Fix `dma_unmap_sg()` nents value
    b86fd2e61a2c perf sched: Fix memory leaks in 'perf sched latency'
    282d4b34694f perf sched: Fix memory leaks for evsel->priv in timehist
    16ce5ce11145 perf sched: Free thread->priv using priv_destructor
    e5de9ea7796e perf dso: Add missed dso__put to dso__load_kcore
    9fe9f9459951 perf tools: Fix use-after-free in help_unknown_cmd()
    a99cae46ab16 Fix dma_unmap_sg() nents value
    8724a228be43 clk: clk-axi-clkgen: fix fpfd_max frequency for zynq
    45338af03ff3 fanotify: sanitize handle_type values when reporting fid
    e8b4c9e60a7a pinctrl: sunxi: Fix memory leak on krealloc failure
    85a7746a05ea PCI: endpoint: pci-epf-vntb: Return -ENOENT if pci_epc_get_next_free_bar() fails
    3f5186fd43be crypto: arm/aes-neonbs - work around gcc-15 warning
    f693be157c59 power: supply: max14577: Handle NULL pdata when CONFIG_OF is not set
    8e9bdb563916 power: supply: cpcap-charger: Fix null check for power_supply_get_by_name
    51990eecf22f clk: xilinx: vcu: unregister pll_post only if registered correctly
    a2b437a88370 media: v4l2-ctrls: Fix H264 SEPARATE_COLOUR_PLANE check
    1d92608a2925 clk: davinci: Add NULL check in davinci_lpsc_clk_register()
    530d4db6fb89 mtd: fix possible integer overflow in erase_xfer()
    aff3e6eacef2 crypto: marvell/cesa - Fix engine load inaccuracy
    be1e15938a16 crypto: qat - use unmanaged allocation for dc_data
    25c161a8bed1 crypto: sun8i-ce - fix nents passed to dma_unmap_sg()
    0c93cd98d0c8 PCI: rockchip-host: Fix "Unexpected Completion" log message
    e1c3d14c8252 bpf/preload: Don't select USERMODE_DRIVER
    3bb72c2e9622 ipv6: annotate data-races around rt->fib6_nsiblings
    9cb6de8ee144 ipv6: fix possible infinite loop in fib6_info_uses_dev()
    e1b7932af47f ipv6: prevent infinite loop in rt6_nlmsg_size()
    f237664113fe vrf: Drop existing dst reference in vrf_ip6_input_dst
    dddfc5a996af selftests: rtnetlink.sh: remove esp4_offload after test
    314f568b84b0 net/mlx5e: Remove skb secpath if xfrm state is not found
    4d81205d27c3 net/mlx5e: Clear Read-Only port buffer size in PBMC before update
    58004aa21e79 netfilter: xt_nfacct: don't assume acct name is null-terminated
    9705b8b92d6a can: kvaser_usb: Assign netdev.dev_port based on device channel index
    56a17d28c3dd can: kvaser_pciefd: Store device channel index
    2ac7efc5deef can: peak_usb: fix USB FD devices potential malfunction
    c9be5abdaf2e tools/rv: Do not skip idle in trace
    ee2502485702 bpf: Disable migration in nf_hook_run_bpf().
    9d5aecb57e93 Bluetooth: hci_event: Mask data status from LE ext adv reports
    cdb509f59aaf kcsan: test: Initialize dummy variable
    bf88b7c114d4 wifi: mac80211: Write cnt before copying in ieee80211_copy_rnr_beacon()
    50e98be435df wifi: brcmfmac: fix P2P discovery failure in P2P peer due to missing P2P IE
    21e317484d3b wifi: ath12k: fix endianness handling while accessing wmi service bit
    dde152043f6d Reapply "wifi: mac80211: Update skb's control block key in ieee80211_tx_dequeue()"
    9c8e9da118a8 wifi: mac80211: Check 802.11 encaps offloading in ieee80211_tx_h_select_key()
    f74d4525ebad wifi: mac80211: Don't call fq_flow_idx() for management frames
    bc6f35967d9a wifi: mac80211: Do not schedule stopped TXQs
    2874717012d1 wifi: plfxlc: Fix error handling in usb driver probe
    378ae9ccaea3 wifi: mac80211: reject TDLS operations when station is not associated
    df51cc1e965a iommu/amd: Fix geometry.aperture_end for V2 tables
    03df73480547 mwl8k: Add missing check after DMA map
    5cb4349d0c35 wifi: rtl8xxxu: Fix RX skb size for aggregation disabled
    20a1e6536424 tcp: call tcp_measure_rcv_mss() for ooo packets
    9a20c9da5ff1 xen/gntdev: remove struct gntdev_copy_batch from stack
    c9eeae9639ea net_sched: act_ctinfo: use atomic64_t for three counters
    103c4e27ec9f net/sched: Restrict conditions for adding duplicating netems to qdisc tree
    0967ee88ec1e um: rtc: Avoid shadowing err in uml_rtc_start()
    98f1a97d8627 arch: powerpc: defconfig: Drop obsolete CONFIG_NET_CLS_TCINDEX
    9ac58afb0cca netfilter: nf_tables: adjust lockdep assertions handling
    b488bee5e92f netfilter: nf_tables: Drop dead code from fill_*_info routines
    f56a863397f5 fbcon: Fix outdated registered_fb reference in comment
    b1c6b13f48a8 sched/psi: Optimize psi_group_change() cpu_clock() usage
    dabe5fc2ee7a drm/amd/pm/powerplay/hwmgr/smu_helper: fix order of mask and value
    6e2f7903241c m68k: Don't unregister boot console needlessly
    7f0377ca6993 drm/msm/dpu: Fill in min_prefill_lines for SC8180X
    6d029d85aa2b kselftest/arm64: Fix check for setting new VLs in sve-ptrace
    f73c0bc2d1d3 net: dst: annotate data-races around dst->output
    e0b8b6687b7d net: dst: annotate data-races around dst->input
    62d7cf455c88 net/mlx5: Check device memory pointer before usage
    c45a33903e24 tcp: fix tcp_ofo_queue() to avoid including too much DUP SACK range
    5bf201c55fdf wifi: ath11k: clear initialized flag for deinit-ed srng lists
    ca980f1911a7 iwlwifi: Add missing check for alloc_ordered_workqueue
    d5491ff785f4 wifi: iwlwifi: Fix memory leak in iwl_mvm_init()
    14ca6952691f wifi: rtl818x: Kill URBs before clearing tx status queue
    892b29eab44b wifi: rtw89: avoid NULL dereference when RX problematic packet on unsupported 6 GHz band
    655e3f51de5a caif: reduce stack size, again
    0abd1f48cd25 bpftool: Fix memory leak in dump_xx_nlmsg on realloc failure
    0f18414f1d6b drm/vmwgfx: Fix Host-Backed userspace on Guest-Backed kernel
    cc7af1b89c55 net: ipv6: ip6mr: Fix in/out netdev to pass to the FORWARD chain
    3ca8e73c58bb selftests/bpf: fix signedness bug in redir_partial()
    0e853c1464bc bpf, ktls: Fix data corruption when using bpf_msg_pop_data() in ktls
    c69d06498ea2 bpf, sockmap: Fix psock incorrectly pointing to sk
    c4a298ae0d36 drm/rockchip: cleanup fb when drm_gem_fb_afbc_init failed
    8b0285fbbd81 selftests/tracing: Fix false failure of subsystem event test
    faa45887a63c staging: nvec: Fix incorrect null termination of battery manufacturer
    cc03984d7035 interconnect: qcom: sc8180x: specify num_nodes
    37dfd6d6c9e4 interconnect: qcom: sc8280xp: specify num_links for qnm_a1noc_cfg
    2fffa72282ed soc: qcom: pmic_glink: fix OF node leak
    272cd1f24741 samples: mei: Fix building on musl libc
    f7e5ae0ddd12 cpufreq: Init policy->rwsem before it may be possibly used
    39a0d418b321 cpufreq: Initialize cpufreq-based frequency-invariance later
    1bc35f9a50e1 cpufreq: intel_pstate: Always use HWP_DESIRED_PERF in passive mode
    81f506193700 PM / devfreq: Check governor before using governor->name
    759b918c8f2e arm64: dts: imx8mn-beacon: Fix HS400 USDHC clock speed
    1661ee5c2a41 arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
    d7b49f4f0da7 ARM: dts: imx6ul-kontron-bl-common: Fix RTS polarity for RS485 interface
    4f886798e1a4 soc/tegra: cbb: Clear ERR_FORCE register with ERR_STATUS
    632c151355ba arm: dts: ti: omap: Fixup pinheader typo
    40ff7460a9a6 usb: early: xhci-dbc: Fix early_ioremap leak
    c6ec27091cf5 powercap: dtpm_cpu: Fix NULL pointer dereference in get_pd_power_uw()
    91a177aafc53 Revert "vmci: Prevent the dispatching of uninitialized payloads"
    7ed42b79118d pps: fix poll support
    6696a46f4ebd vmci: Prevent the dispatching of uninitialized payloads
    b31cf6f7716a staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()
    6031a54f4eac spi: stm32: Check for cfg availability in stm32_spi_probe
    490877203b40 usb: misc: apple-mfi-fastcharge: Make power supply names unique
    f24e5b445ab9 usb: host: xhci-plat: fix incorrect type for of_match variable in xhci_plat_probe()
    448800900925 ARM: dts: vfxxx: Correctly use two tuples for timer address
    964db8725937 arm64: dts: qcom: msm8976: Make blsp_dma controlled-remotely
    e1b4ca59f633 arm64: dts: qcom: sc7180: Expand IMEM region
    2f4bad6b27c3 arm64: dts: qcom: sdm845: Expand IMEM region
    603df70062fb soc: qcom: QMI encoding/decoding for big endian
    41917d9ce43a selftests: Fix errno checking in syscall_user_dispatch test
    aa771d2928fe ASoC: mediatek: use reserved memory or enable buffer pre-allocation
    4c39fc79ae25 ASoC: ops: dynamically allocate struct snd_ctl_elem_value
    ee1c30d7c6fc ASoC: soc-dai: tidyup return value of snd_soc_xlate_tdm_slot_mask()
    1a91ba12abef gfs2: No more self recovery
    a936be9b5f51 Revert "fs/ntfs3: Replace inode_trylock with inode_lock"
    084933961ecd hfsplus: remove mutex_lock check in hfsplus_free_extents
    0926e13a47fc hfs: make splice write available again
    1de5895fe68d hfsplus: make splice write available again
    d89f71aece34 ublk: use vmalloc for ublk_device's __queues
    b35a50d639ca fs/ntfs3: cancle set bad inode after removing name fails
    8d1bfdd30d17 fs_context: fix parameter name in infofc() macro
    15da73210929 audit,module: restore audit logging in load failure case
    5974c913d6d9 ASoC: amd: yc: add DMI quirk for ASUS M6501RM
    61e5aeff2424 ASoC: Intel: fix SND_SOC_SOF dependencies
    7e98b00615c6 ASoC: amd: yc: Add DMI entries to support HP 15-fb1xxx
    18196a40af52 ethernet: intel: fix building with large NR_CPUS
    5f577d47bba6 ASoC: amd: yc: Add DMI quirk for HP Laptop 17 cp-2033dx

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 990edea966..bb92f98616 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a5fb5e62dfdf67e8f12e9be81b74dea8230da1ca"
-SRCREV_meta ?= "cdadebd03ef4e7a129f8525938385dba54e32e80"
+SRCREV_machine ?= "5a1f8bcc75b8f9d5a7fca6cb99a103f8333d7dc5"
+SRCREV_meta ?= "f3c786ad20e66517d28812760a884ac3d5dda3db"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.101"
+LINUX_VERSION ?= "6.6.102"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 33e7a094a5..b8fcd47971 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.101"
+LINUX_VERSION ?= "6.6.102"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fe405475e21ba69486139227f55cbc3a507b073b"
-SRCREV_meta ?= "cdadebd03ef4e7a129f8525938385dba54e32e80"
+SRCREV_machine ?= "25e12cc47d631ed5ba46a6a07acf85d7e1175fad"
+SRCREV_meta ?= "f3c786ad20e66517d28812760a884ac3d5dda3db"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 826c1e02c8..3a99ce4f1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "eec0d117c1da156e2c42a990ef9902e8bf526a3b"
-SRCREV_machine:qemuarm64 ?= "7e67ed627f8cfb12bf0beb31d22038cc174f1413"
-SRCREV_machine:qemuloongarch64 ?= "af73b639584c1149d99786ca0f235dcbb046ede1"
-SRCREV_machine:qemumips ?= "990e670951b176b14bda639e0806364d3c2c560d"
-SRCREV_machine:qemuppc ?= "22682716b343688c6e2454b6edca79e723cbd553"
-SRCREV_machine:qemuriscv64 ?= "af73b639584c1149d99786ca0f235dcbb046ede1"
-SRCREV_machine:qemuriscv32 ?= "af73b639584c1149d99786ca0f235dcbb046ede1"
-SRCREV_machine:qemux86 ?= "af73b639584c1149d99786ca0f235dcbb046ede1"
-SRCREV_machine:qemux86-64 ?= "af73b639584c1149d99786ca0f235dcbb046ede1"
-SRCREV_machine:qemumips64 ?= "bcb7f967a647fbb74836a33d2ef5af6460e30074"
-SRCREV_machine ?= "af73b639584c1149d99786ca0f235dcbb046ede1"
-SRCREV_meta ?= "cdadebd03ef4e7a129f8525938385dba54e32e80"
+SRCREV_machine:qemuarm ?= "465d211d5e4e5333b10eddfb597a03b340a1a8df"
+SRCREV_machine:qemuarm64 ?= "57f28ca26dd5f2d2902dd674ed9c9bfafd84139b"
+SRCREV_machine:qemuloongarch64 ?= "b5db76e52474d0ee7dbbb897cf02a2665f1a14fd"
+SRCREV_machine:qemumips ?= "286ff567d5dcee9cd0b86850b93d1315035b5ece"
+SRCREV_machine:qemuppc ?= "c4ee428a256735d175e14da9ebdfede7fa6b57b5"
+SRCREV_machine:qemuriscv64 ?= "b5db76e52474d0ee7dbbb897cf02a2665f1a14fd"
+SRCREV_machine:qemuriscv32 ?= "b5db76e52474d0ee7dbbb897cf02a2665f1a14fd"
+SRCREV_machine:qemux86 ?= "b5db76e52474d0ee7dbbb897cf02a2665f1a14fd"
+SRCREV_machine:qemux86-64 ?= "b5db76e52474d0ee7dbbb897cf02a2665f1a14fd"
+SRCREV_machine:qemumips64 ?= "dd35c2cddf4a3171b9a0d73410b6ac56780855b3"
+SRCREV_machine ?= "b5db76e52474d0ee7dbbb897cf02a2665f1a14fd"
+SRCREV_meta ?= "f3c786ad20e66517d28812760a884ac3d5dda3db"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3a8ababb8b6a0ced2be230b60b6e3ddbd8d67014"
+SRCREV_machine:class-devupstream ?= "bb9c90ab9c5a1a933a0dfd302a3fde73642b2b06"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.101"
+LINUX_VERSION ?= "6.6.102"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


