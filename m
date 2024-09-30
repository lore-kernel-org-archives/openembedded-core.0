Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A12CF64A1
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:57:56 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.45284.1727661469830842881
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZxCI+Yvs;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7d50e865b7aso2996019a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661469; x=1728266269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRlLDEcAG//c4L5Wc4QQsJ5nYByPLlv/HWTQVB3jdFo=;
        b=ZxCI+YvsUArnkLbS4htfJPHOxAo9GDzyTDLeYRF+cL1EMA7pIv52qOdhTssytL94Uz
         rVYIiZ/U0aexLuCa96fLXqQ8wIhIlwsVW5efBY3i4A5iQOu6lmOHlBNqqP0W9R/XjoOU
         GLfJoAAPIihSJvDwxNDqb3h1I1bqPKmzXoLXcdkFqhvknZvNdfZJ/w2weG05t6iBWNCk
         ZZ3q6C3tk0LSJ21iEIRzwoj2Iu+f+3QW1sQEJaZiM3CFqxSjhdflCSJXnj0oQ0cxopV9
         AjaCuNGpa1Xr1RvXjwfpcpNTdISd9tgeJGIjARH01BxBTeorfloyBFnFkYgjS/S4xIiU
         6o+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661469; x=1728266269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRlLDEcAG//c4L5Wc4QQsJ5nYByPLlv/HWTQVB3jdFo=;
        b=X410t2VwBg+dwbVk5p+qVomlXCrMnYWm+6qews/8+hupZ9OGidJZimz3xNJV7zfJSu
         uYlHfBuvpVOJ1fUKftQDJvOXVOFYzPHPBwpk4P6qaYlgSEc+/SF/mVlomzzV6gQo9VSQ
         fILJYYRXurT+T/I63JB7hIkxW1AmY8r5S2oRqlDap+Z8oyGdjfsCN0OXsqxROoZ68tWS
         CI1eOZlcVYtVNDsMbC7KTyMQyPHXkJeAj/SgeLOG5llL9Rh7GWiTP/jc/CnaSwg3BEET
         jueAyjuoaUnY8LNdp7YRaMsOKatiac46HOa6hKTFqEllUtoLWD0kvB6EQJPL2SfgS6gH
         jmsw==
X-Gm-Message-State: AOJu0YwMBLG0W58lsgu8vmylAG/uZZE7W0AoBP/W2HUL7rZKP6drJL18
	k0svyFnuxyh28ABNd3VYIuImh0DzKoObaHgUv1Yxi8wokdc17OfYNc0iOLlYwZCsEw9r2YSv8sW
	D9hE=
X-Google-Smtp-Source: AGHT+IFPIyLUpDMr9YV+mYQdpsOc3S/lc2vfq8sRW+Peb5ZzQt3umhjZNaVYzh7l7zsFpJ1r/pxcbQ==
X-Received: by 2002:a17:90b:190b:b0:2da:5347:b0fa with SMTP id 98e67ed59e1d1-2e0b8b177b4mr12395642a91.18.1727661468743;
        Sun, 29 Sep 2024 18:57:48 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/27] linux-yocto/6.6: update to v6.6.47
Date: Sun, 29 Sep 2024 18:57:06 -0700
Message-Id: <c363c4254ad2a8be5b2e8aa45df28ebd70594157.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205073

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    4c1a2d4cd9a5 Linux 6.6.47
    88042e41534b Revert "ata: libata-scsi: Honor the D_SENSE bit for CK_COND=1 and no error"
    fb6f56244af3 media: Revert "media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()"
    60d90e158261 KVM: arm64: Don't pass a TLBI level hint when zapping table entries
    2c770086e079 KVM: arm64: Don't defer TLB invalidation when zapping table entries
    f3c60ab676bb cgroup: Move rcu_head up near the top of cgroup_root
    6419341b6b2b mm/debug_vm_pgtable: drop RANDOM_ORVALUE trick
    e2bf9ba1d3d7 Revert "Input: bcm5974 - check endpoint type before starting traffic"
    6fb93eeb25e5 Revert "jfs: fix shift-out-of-bounds in dbJoin"
    49df34d2b7da binfmt_flat: Fix corruption when not offsetting data start
    f95d175a9e5f ALSA: usb: Fix UBSAN warning in parse_audio_unit()
    5472b587cf71 fs/ntfs3: Do copy_to_user out of run_lock
    f650148b4394 jfs: Fix shift-out-of-bounds in dbDiscardAG
    6ea10dbb1e6c jfs: fix null ptr deref in dtInsertEntry
    3db4395332e7 fou: remove warn in gue_gro_receive on unsupported protocol
    263df78166d3 f2fs: fix to cover read extent cache access with lock
    ae00e6536a2d f2fs: fix to do sanity check on F2FS_INLINE_DATA flag in inode during GC
    bd104cbb9d3f bpf, net: Use DEV_STAT_INC()
    3f6bbe6e07e5 ext4: sanity check for NULL pointer after ext4_force_shutdown
    3a2c70baf62b ext4: convert ext4_da_do_write_end() to take a folio
    8a3ac7fb3696 wifi: cfg80211: restrict NL80211_ATTR_TXQ_QUANTUM values
    5b485efcb6a6 mm/page_table_check: support userfault wr-protect entries
    737fb7853acd ext4: do not create EA inode under buffer lock
    f2a77188a396 ext4: fold quota accounting into ext4_xattr_inode_lookup_create()
    4ea65e2095e9 Bluetooth: RFCOMM: Fix not validating setsockopt user input
    0f1061332030 nfc: llcp: fix nfc_llcp_setsockopt() unsafe copies
    ae7f73e64e9b net: add copy_safe_from_sockptr() helper
    bae45e9b78e8 mISDN: fix MISDN_TIME_STAMP handling
    107449cfb217 fs: Annotate struct file_handle with __counted_by() and use struct_size()
    63f13eb5d627 bpf: Avoid kfree_rcu() under lock in bpf_lpm_trie.
    ef33f0296893 bpf: Replace bpf_lpm_trie_key 0-length array with flexible array
    5fbbd952e7c3 pppoe: Fix memory leak in pppoe_sendmsg()
    84c176fbecd1 net: sctp: fix skb leak in sctp_inq_free()
    6cee13d8d4e0 net:rds: Fix possible deadlock in rds_message_put
    a2f2e5a4c907 quota: Detect loops in quota tree
    0252e359afa5 Input: bcm5974 - check endpoint type before starting traffic
    2cea502f58d6 net: tls, add test to capture error on large splice
    2fdcf3c4ad74 erofs: avoid debugging output for (de)compressed data
    ca9b877a2e2c reiserfs: fix uninit-value in comp_keys
    984ed0567f5d Squashfs: fix variable overflow triggered by sysbot
    2dbaa75748ac squashfs: squashfs_read_data need to check if the length is 0
    0b24b7941086 jfs: fix shift-out-of-bounds in dbJoin
    3999d26986be net: don't dump stack on queue timeout
    e4a4435787dd jfs: fix log->bdev_handle null ptr deref in lbmStartIO
    9641706cbbc2 jfs: Convert to bdev_open_by_dev()
    4365d0d660ac fs: Convert to bdev_open_by_dev()
    e58695f6c556 wifi: mac80211: fix change_address deadlock during unregister
    be31c9be8764 wifi: mac80211: take wiphy lock for MAC addr change
    77100f2e8412 tcp_metrics: optimize tcp_metrics_flush_all()
    dd9542ae7c7c cgroup: Make operations on the cgroup root_list RCU safe
    bcd514804394 genirq/cpuhotplug: Retry with cpu_online_mask when migration fails
    20dbad7525c6 genirq/cpuhotplug: Skip suspended interrupts when restoring affinity
    a47b54846ac7 nvme/pci: Add APST quirk for Lenovo N60z laptop
    26273f5f4cf6 mm: gup: stop abusing try_grab_folio
    9eae19001439 nfsd: make svc_stat per-network namespace instead of global
    9ae63aab0df8 nfsd: remove nfsd_stats, make th_cnt a global counter
    b670a59817ec nfsd: make all of the nfsd stats per-network namespace
    6f8d6ed3426a nfsd: expose /proc/net/sunrpc/nfsd in net namespaces
    5b3a1ecf0790 nfsd: rename NFSD_NET_* to NFSD_STATS_*
    2e8076df20f3 sunrpc: use the struct net as the svc proc private
    791be93cf182 sunrpc: remove ->pg_stats from svc_program
    465bb0f1f48b sunrpc: pass in the sv_stats struct through svc_create_pooled
    032ed4c630cd nfsd: stop setting ->pg_stats for unused stats
    1257fe22e14e sunrpc: don't change ->sv_stats if it doesn't exist
    9b31d561f475 NFSD: Fix frame size warning in svc_export_parse()
    5bc2b8f225e9 NFSD: Rewrite synopsis of nfsd_percpu_counters_init()
    9d91b004df9a LoongArch: Define __ARCH_WANT_NEW_STAT in unistd.h
    7c3e55d8b463 ASoC: topology: Fix route memory corruption
    bd865c769002 ASoC: topology: Clean up route loading
    d2a2a4714d80 exec: Fix ToCToU between perm check and set-uid/gid usage
    2879d995e569 pnmtologo: sync with 6.6
    99fd042016c7 Linux 6.6.46
    7ba27f14161f btrfs: fix double inode unlock for direct IO sync writes
    1c3b01b519e5 Revert "selftests: mptcp: simult flows: mark 'unbalanced' tests as flaky"
    9d97114f2fd0 selftests: mptcp: join: test both signal & subflow
    e80cf3fc4ee1 selftests: mptcp: join: ability to invert ADD_ADDR check
    64815ba15880 mptcp: pm: do not ignore 'subflow' if 'signal' flag is also set
    9a4a4c0b8eeb mptcp: pm: don't try to create sf if alloc failed
    432535f52e7c mptcp: pm: reduce indentation blocks
    c2389c074973 xfs: fix log recovery buffer allocation for the legacy h_size fixup
    37e79836d6a4 nouveau: set placement to original placement on uvmm validate.
    2ae4d5821852 mm/hugetlb: fix potential race in __update_and_free_hugetlb_folio()
    d43ff9428954 tools headers arm64: Sync arm64's cputype.h with the kernel sources
    e7f3e5fb20c5 ipv6: fix source address selection with route leak
    717c91c6ed73 netfilter: nf_tables: prefer nft_chain_validate
    0a108bde616a btrfs: fix corruption after buffer fault in during direct IO append write
    a5c399fe433a mm: huge_memory: use !CONFIG_64BIT to relax huge page alignment on 32 bit machines
    6ea9aa8d97e6 mm: huge_memory: don't force huge page alignment on 32 bit
    94220b35aeba Revert "drm/amd/display: Add NULL check for 'afb' before dereferencing in amdgpu_dm_plane_handle_cursor_update"
    163f7dd80237 block: use the right type for stub rq_integrity_vec()
    d4c67071f481 mptcp: pm: deny endp with signal + subflow + port
    8165c84431b3 selftests: mptcp: fix error path
    fff9b9208c1d mptcp: pm: fix backup support in signal endpoints
    07bb418cb0b4 mptcp: fully established after ADD_ADDR echo on MPJ
    ea12dbf570ef drm/radeon: Remove __counted_by from StateArray.states[]
    81d34df84362 drm/mgag200: Bind I2C lifetime to DRM device
    6946b7b00531 drm/mgag200: Set DDC timeout in milliseconds
    b3aa563f2135 drm/lima: Mark simple_ondemand governor as softdep
    28c060cd370d drm/dp_mst: Skip CSN if topology probing is not done yet
    6f8765a70670 drm/bridge: analogix_dp: properly handle zero sized AUX transactions
    78f1990b6bf8 sched/core: Fix unbalance set_rq_online/offline() in sched_cpu_deactivate()
    4c15b20c26a4 sched/core: Introduce sched_set_rq_on/offline() helper
    65727331b601 sched/smt: Fix unbalance sched_smt_present dec/inc
    41d856565d64 sched/smt: Introduce sched_smt_present_inc/dec() helper
    8a90d3fc7c24 x86/mtrr: Check if fixed MTRRs exist before saving them
    8728e3fc7208 x86/paravirt: Fix incorrect virt spinlock setting on bare metal
    866992f0d452 btrfs: avoid using fixed char array size for tree names
    772f83194278 selftests: mm: add s390 to ARCH check
    2ef3d120d19f eventfs: Use SRCU for freeing eventfs_inodes
    b59603a114fa eventfs: Don't return NULL in eventfs_create_dir()
    c7cd840b8e2b smb3: fix setting SecurityFlags when encryption is required
    924f788c906d padata: Fix possible divide-by-0 panic in padata_mt_helper()
    a172c7b22bc2 tracing: Fix overflow in get_free_elt()
    f31fe63838e9 power: supply: axp288_charger: Round constant_charge_voltage writes down
    e1ab8ca8034f power: supply: axp288_charger: Fix constant_charge_voltage writes
    da5e1ee0eb12 power: supply: qcom_battmgr: return EAGAIN when firmware service is not up
    e32f7c84438f LoongArch: Enable general EFI poweroff method
    0688cacd0e93 genirq/irqdesc: Honor caller provided affinity in alloc_desc()
    2ce998fabc63 irqchip/xilinx: Fix shift out of bounds
    d0137ce03fe5 kcov: properly check for softirq context
    6f48f45c7bde ASoC: amd: yc: Add quirk entry for OMEN by HP Gaming Laptop 16-n0xxx
    642a0b7453da parisc: fix a possible DMA corruption
    8d26093f8124 parisc: fix unaligned accesses in BPF
    37a060b64ae8 memcg: protect concurrent access to mem_cgroup_idr
    e3ad50387628 serial: core: check uartclk for zero to avoid divide by zero
    65d76c0aa2b7 timekeeping: Fix bogus clock_was_set() invocation in do_adjtimex()
    ae5848cb5b28 ntp: Safeguard against time_constant overflow
    726f4c241e17 tracefs: Use generic inode RCU for synchronizing freeing
    a49f7de9b8e9 tracefs: Fix inode allocation
    4d035c743c3e driver core: Fix uevent_show() vs driver detach race
    9d6193fd9108 clocksource: Fix brown-bag boolean thinko in cs_watchdog_read()
    03c3855528ab clocksource: Scale the watchdog read retries automatically
    b5cf99eb7a7c ntp: Clamp maxerror and esterror to operating range
    2ac6deb9998b vhost-vdpa: switch to use vmf_insert_pfn() in the fault handler
    b9d604933d5f tick/broadcast: Move per CPU pointer access into the atomic section
    8bf58028d58c scsi: ufs: core: Fix hba->last_dme_cmd_tstamp timestamp updating logic
    74eda70a56be scsi: ufs: core: Do not set link to OFF state while waking up from hibernation
    80d0624d0a8f scsi: mpi3mr: Avoid IOMMU page faults on REPORT ZONES
    d67546814d14 usb: gadget: u_audio: Check return codes from usb_ep_enable and config_ep_by_speed.
    54b7f68025a0 usb: gadget: u_serial: Set start_delayed during suspend
    a4f0d0a0139c usb: gadget: midi2: Fix the response for FB info with block 0xff
    1a9df57d5745 usb: gadget: core: Check for unset descriptor
    0761ba080a0d USB: serial: debug: do not echo input by default
    128e82e41cf7 usb: vhci-hcd: Do not drop references before new references are gained
    22628010c596 ALSA: hda/hdmi: Yet more pin fix for HP EliteDesk 800 G4
    a70ed69f9b35 ALSA: hda/realtek: Add Framework Laptop 13 (Intel Core Ultra) to quirks
    09c0f5f9db33 ALSA: hda: Add HP MP9 G4 Retail System AMS to force connect list
    535df7f896a5 ALSA: line6: Fix racy access to midibuf
    d64fc94f7bb2 drm/client: fix null pointer dereference in drm_client_modeset_probe
    d73de3c64476 drm/i915/gem: Adjust vma offset for framebuffer mmap offset
    0da0b06165d8 drm/amdgpu: Forward soft recovery errors to userspace
    718d83f66fb0 drm/amd/display: Skip Recompute DSC Params if no Stream on Link
    4b09513ce93b drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
    81ac1e888460 module: make waiting for a concurrent module loader interruptible
    bdb3679cf318 module: warn about excessively long module waits
    c0f767dea583 cifs: cifs_inval_name_dfs_link_error: correct the check for fullpath
    885283269275 ASoC: meson: axg-fifo: fix irq scheduling issue with PREEMPT_RT
    a59ee7038912 ALSA: usb-audio: Re-add ScratchAmp quirk entries
    a2c0f5df8b6b spi: spi-fsl-lpspi: Fix scldiv calculation
    c25b8a3f016a i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume
    233419a329d1 i2c: qcom-geni: Add missing clk_disable_unprepare in geni_i2c_runtime_resume
    a4155dec0199 kprobes: Fix to check symbol prefixes correctly
    25ad6909c86e bpf: kprobe: remove unused declaring of bpf_kprobe_override
    ae68eee1af4f i2c: smbus: Send alert notifications to all devices if source not found
    b66c92b7d17e ASoC: SOF: Remove libraries from topology lookups
    b15602915957 spi: spidev: Add missing spi_device_id for bh2228fv
    641de16bb3b0 ASoC: sti: add missing probe entry for player and reader
    8485d324aa03 ASoC: codecs: wsa884x: Correct Soundwire ports mask
    192af3ce5747 ASoC: codecs: wsa884x: parse port-mapping information
    e79e2d8f7a25 ASoC: codecs: wsa883x: Correct Soundwire ports mask
    986141e384dc ASoC: codecs: wsa883x: parse port-mapping information
    f4bbf2f2f5f1 ASoC: codecs: wsa881x: Correct Soundwire ports mask
    733677fc391e ASoC: codecs: wcd938x-sdw: Correct Soundwire ports mask
    1534b11275b7 i2c: smbus: Improve handling of stuck alerts
    745eec68a307 arm64: errata: Expand speculative SSBS workaround (again)
    8defe5195138 arm64: cputype: Add Cortex-A725 definitions
    44094ae235cd arm64: cputype: Add Cortex-X1C definitions
    b9bf53354e98 arm64: errata: Expand speculative SSBS workaround
    771746afa0b8 arm64: errata: Unify speculative SSBS errata logic
    88ef8dd94f8b arm64: cputype: Add Cortex-X925 definitions
    ef6e6d1062c8 arm64: cputype: Add Cortex-A720 definitions
    fc4675620ac8 arm64: cputype: Add Cortex-X3 definitions
    93696d8f96a9 arm64: errata: Add workaround for Arm errata 3194386 and 3312417
    527e7e72c9ac arm64: cputype: Add Neoverse-V3 definitions
    e5b9593843b7 arm64: cputype: Add Cortex-X4 definitions
    1ae80faeccfe arm64: barrier: Restore spec_bar() macro
    4167bf778008 arm64: Add Neoverse-V2 part
    6772c4868a8e net: drop bad gso csum_start and offset in virtio_net_hdr
    12f98cc6fb07 sched/cputime: Fix mul_u64_u64_div_u64() precision for cputime
    b56dee6c9b08 irqchip/loongarch-cpu: Fix return value of lpic_gsi_to_irq()
    57ab379d781c irqchip/meson-gpio: Convert meson_gpio_irq_controller::lock to 'raw_spinlock_t'
    b547433efa79 scsi: mpt3sas: Avoid IOMMU page faults on REPORT ZONES
    2d451ec01e66 profiling: remove profile=sleep support
    c26524044485 SUNRPC: Fix a race to wake a sync task
    1e8b7fb427af s390/sclp: Prevent release of buffer in I/O
    6dacca9fbe52 jbd2: avoid memleak in jbd2_journal_write_metadata_buffer
    e7abdad660ed ext4: fix uninitialized variable in ext4_inlinedir_to_tree
    850304152d36 media: xc2028: avoid use-after-free in load_firmware_cb()
    7f855b668137 media: uvcvideo: Fix the bandwdith quirk on USB 3.x
    5b835d12cfb9 media: uvcvideo: Ignore empty TS packets
    4cc2a94d96ca drm/amd/display: Add null checker before passing variables
    a59941605a2e drm/amd/display: Add NULL check for 'afb' before dereferencing in amdgpu_dm_plane_handle_cursor_update
    a29c1e51ef3a media: amphion: Remove lock in s_ctrl callback
    2e538944996d drm/amd/pm: Fix the null pointer dereference for vega10_hwmgr
    1adb5ebe205e drm/amdgpu: Add lock around VF RLCG interface
    641dac64178c drm/admgpu: fix dereferencing null pointer context
    3a01bf2ca9f8 drm/amdgpu/pm: Fix the null pointer dereference in apply_state_adjust_rules
    b89616333979 drm/amdgpu: Fix the null pointer dereference to ras_manager
    09544cd95c68 drm/amdgpu/pm: Fix the null pointer dereference for smu7
    837ab17ceef9 drm/amdgpu/pm: Fix the param type of set_power_profile_mode
    bc93cfde69b7 drm/amdgpu: fix potential resource leak warning
    479ccc213217 drm/amd/display: Add delay to improve LTTPR UHBR interop
    4d9adcb94d55 Bluetooth: btnxpuart: Shutdown timer and prevent rearming when driver unloading
    d9e846072fcd btrfs: fix bitmap leak when loading free space cache on duplicate entry
    ba4dedb71356 btrfs: do not clear page dirty inside extent_write_locked_range()
    a006e6c4a8a0 net: stmmac: qcom-ethqos: enable SGMII loopback during DMA reset on sa8775p-ride-r3
    759822a3300c can: mcp251xfd: tef: update workaround for erratum DS80000789E 6 of mcp2518fd
    1333fd55d12e can: mcp251xfd: tef: prepare to workaround broken TEF FIFO tail index erratum
    81f086d913be wifi: nl80211: don't give key data to userspace
    5cc9745e2ea1 udf: prevent integer overflow in udf_bitmap_free_blocks()
    9be0805597b3 PCI: Add Edimax Vendor ID to pci_ids.h
    412f97f36062 af_unix: Don't retry after unix_state_lock_nested() in unix_stream_connect().
    5ce414edb383 selftests/bpf: Fix send_signal test with nested CONFIG_PARAVIRT
    650e24748e1e net/mlx5e: SHAMPO, Fix invalid WQ linked list unlink
    9b034650f369 wifi: ath12k: fix memory leak in ath12k_dp_rx_peer_frag_setup()
    c6ea738e3feb wifi: nl80211: disallow setting special AP channel widths
    c2775ae4d922 xen: privcmd: Switch from mutex to spinlock for irqfds
    9747b722125c ACPI: SBS: manage alarm sysfs attribute through psy core
    e1f6d71b42bf ACPI: battery: create alarm sysfs attribute atomically
    9e1923b395ba clocksource/drivers/sh_cmt: Address race condition for clock events
    4991cb2d434c rcu: Fix rcu_barrier() VS post CPUHP_TEARDOWN_CPU invocation
    c63b44fb33dd block: change rq_integrity_vec to respect the iterator
    775a9ba16c9f md/raid5: avoid BUG_ON() while continue reshape after reassembling
    3fd53466dbff md: do not delete safemode_timer in mddev_suspend
    7adbf9b5c826 rcutorture: Fix rcu_torture_fwd_cb_cr() data race
    95cf80c93432 hwmon: corsair-psu: add USB id of HX1200i Series 2023 psu
    1b955f786a4b gpio: prevent potential speculation leaks in gpio_device_get_desc()
    c0780672805e net: fec: Stop PPS on driver remove
    73780807c67c net: bcmgenet: Properly overlay PHY and MAC Wake-on-LAN capabilities
    207e88155410 l2tp: fix lockdep splat
    a7d2808d6757 net: dsa: bcm_sf2: Fix a possible memory leak in bcm_sf2_mdio_register()
    f7dc578abe4f net/smc: add the max value of fallback reason count
    1a7a06e90e53 Bluetooth: hci_sync: avoid dup filtering when passive scanning with adv monitor
    b4af69d51dfd Bluetooth: l2cap: always unlock channel in l2cap_conless_channel()
    3e94132335cd ice: Fix reset handler
    3b1fae78bebe net: linkwatch: use system_unbound_wq
    e3145ca904fa net: bridge: mcast: wait for previous gc cycles when removing port
    f2c353227de1 net: usb: qmi_wwan: fix memory leak for not ip packets
    1407be30fc17 sctp: Fix null-ptr-deref in reuseport_add_sock().
    6a78a2903875 wifi: ath12k: fix soft lockup on suspend
    7091b094dd68 wifi: ath12k: add CE and ext IRQ flag to indicate irq_handler
    5c18b150e4cb wifi: ath12k: rename the sc naming convention to ab
    0397a48c4bd6 smb: client: handle lack of FSCTL_GET_REPARSE_POINT support
    fbb384e3f000 x86/mm: Fix pti_clone_entry_text() for i386
    ca07aab70dd3 x86/mm: Fix pti_clone_pgtable() alignment assumption
    c7b46f69d132 jump_label: Fix the fix, brown paper bags galore
    79b316264f57 platform/x86/intel/ifs: Initialize union ifs_status to zero
    3d0d7713dd3f platform/x86/intel/ifs: Gen2 Scan test support
    b399e6a23359 platform/x86/intel/ifs: Store IFS generation number
    69508cc9a9a8 irqchip/mbigen: Fix mbigen node address layout
    43ea1c5e6eb3 lib/build_OID_registry: take -stable reproducibility changes
    35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e503 bpftool: Query only cgroup-related attach types
    f71bb11887ba cpu/amd: inhibit SMP check for qemux86
    c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    7c76aad68f6d kselftest: Add a ksft_perror() helper
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 475c48dae4fcc316ecbb12d32a7a57377af1da85)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index c3b4fc1e9b..a4c88e110a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9a1d7ebfd75c70dcec660e18124a37de469e68b4"
-SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
+SRCREV_machine ?= "79a2910d1ba0b443f6aae76c61772386104db498"
+SRCREV_meta ?= "694e046ff4449d031f51c2e85f5dff035f5fa9e9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.45"
+LINUX_VERSION ?= "6.6.47"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 1c8cfd7d74..eaf112bc37 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.45"
+LINUX_VERSION ?= "6.6.47"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
-SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
+SRCREV_machine ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
+SRCREV_meta ?= "694e046ff4449d031f51c2e85f5dff035f5fa9e9"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 83b7066b90..2169b9e691 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0b3ad2691600c3f3899e3a5afd7a42d8b4c3f650"
-SRCREV_machine:qemuarm64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
-SRCREV_machine:qemuloongarch64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
-SRCREV_machine:qemumips ?= "e6c52087c139d2418c1dfec5ea7fcb046de37981"
-SRCREV_machine:qemuppc ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
-SRCREV_machine:qemuriscv64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
-SRCREV_machine:qemuriscv32 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
-SRCREV_machine:qemux86 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
-SRCREV_machine:qemux86-64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
-SRCREV_machine:qemumips64 ?= "97d2336ea9ce4eac6b30a75b26f33b83827d38aa"
-SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
-SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
+SRCREV_machine:qemuarm ?= "a4093f33d7dd2dd59f18a5c76d6e5120e3ca93b6"
+SRCREV_machine:qemuarm64 ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
+SRCREV_machine:qemuloongarch64 ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
+SRCREV_machine:qemumips ?= "1c6aa9d8841224583571fd1deb8d3139f6516c36"
+SRCREV_machine:qemuppc ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
+SRCREV_machine:qemuriscv64 ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
+SRCREV_machine:qemuriscv32 ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
+SRCREV_machine:qemux86 ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
+SRCREV_machine:qemux86-64 ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
+SRCREV_machine:qemumips64 ?= "2f8fc2e37239be95fe47410e50aae4c3dc0e1409"
+SRCREV_machine ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
+SRCREV_meta ?= "694e046ff4449d031f51c2e85f5dff035f5fa9e9"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "878fbff41def4649a2884e9d33bb423f5a7726b0"
+SRCREV_machine:class-devupstream ?= "4c1a2d4cd9a5b6c55739a80c5b9efbca322adad7"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.45"
+LINUX_VERSION ?= "6.6.47"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


