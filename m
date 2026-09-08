Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3152CC79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 01:17:52 +0000 (UTC)
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9821.1788830262675590719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 18:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s7tB1zFP;
 spf=pass (domain: gmail.com, ip: 74.125.230.140, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfe528e9so2482726d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 18:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788830261; x=1789435061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTEqJU1vi4cYELm71olv7nfJb1RuSIOBu1q5JzCduUc=;
        b=s7tB1zFPfXK8UyBJKtn8okv70WIeAgvQ/72Qn+MVyha7u1h/XS53LK1o0AiER0rqH4
         SAfpeHI83aw03zqPfKeoUsb9JO58qMj1Blt8RN2CmvrHzZtIY4/GHRxB2NWtjMWnQD6M
         1d5y8zl+Bnrhw00ubV+nLxc+1peVgbPdnJp1QVvoGFI9qtPScMrp+iHlfSN3i/1Ox992
         aDBLqQQ9OxOBGF2V1WC9r3HMZBFsvWZ1S1kdESYz+AeYmjXuZ2pdwZqD4z19FAPcgEbD
         ZSupwsHm2jjYL5rjeqENBEHxlVLY60ZRc+kSvBwb4mzkiIMyy6BvhfZkQrPcfVOpuGCY
         Ze6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830261; x=1789435061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DTEqJU1vi4cYELm71olv7nfJb1RuSIOBu1q5JzCduUc=;
        b=if/5jG8r9X1Iv9Xvb+aiWKynReO5UWxP3TomcpvluKFwo9jKntPSWCCPby75y65qDT
         4Vxtxewevkhn6BNJAgMqQhT1EmiEY3HoeeKO2PNTzWJ5GCDXr2+v1aH1xxJfZt9VwxBa
         3rMpjmA3Z0aBa9WcZlHgBWnTDfQOCC+hktDtIrUe/fmUdVMZgsR+jOhX82XtYmQLX0A6
         ngeTztD1wJjuKyQQ2q6C5FPziddVR7fueXVZlcwmOOSsVfJf6raHAhWXEU2c/MRUDR+X
         VJAk/rLE8Ysp92YZzCA7st2obXawrOWgy7BbYbpGvONE/OaWW4TvWlVV1YTkEtN5RazH
         0Ptw==
X-Gm-Message-State: AFuF++kOWexwJKMcOhgxMRK3GgLDA5xbnZy8j3QWNMInClaqURe6GaQs
	R5cERmpKtp9LGmwcgWCHXYW+acvSg8eJ6Rr9NmpSAo0uOvG1XRpr0/EneviMbG00
X-Gm-Gg: AYBFou0EkGJ1XyOCxT74F4qAaFTpUXFGrOEnupCOtcL12x9gYOgpW5tMHZcVoA/Rwvt
	9GWx7rx7GwFsKibITs74QF3tJ+sTYRScGWnCVPssm2m8CNOt4s3WAod1FBajBCrbMS3jxrlOveT
	b2Xse8KmDfwV5dgpzEmpRhT/gAMPCXoVTokfKY/5JW9DvjWpKxD6gc9WU4H9AE2QDQsPXlHMWK+
	SRS/F7sE7MHjjv/5qjW8Z0hM+rViHlSjZTt2Gm5j4Zaqw9Fhz/gSc+Uw6VyPzI5ZfLyyb7Dyd1m
	nDS1jQqPESWYzciqV7o9rHPF0aFGZ4Vt7ek2NqnZRWLsDFIXE9CLyL8EfsLybvnN/l0sQVvzNUJ
	GdFdtsKXzKnOa+bVPdkNZya4Ex/kWYrCZ/u/0RNuHpt2B80t2FcWh4Yxs1Y4Qy6THIl1iQkw3D/
	R+R85hApLXM9E+Q8hwfGGsYhCMTDWFzGXzvnMWyr/AWAyGTZL6JvWMieGSkWWMj1fcG/a3vKevC
	AQEEYdoZtCrln3r7FXTrtxkwIeMQf7hBXRu9m3Z9f9C8ViXMxIBdkPWtDD0IeLbD8jKh3fuEt5M
	pqRTlJLixEP96/4ZNgWRBBXREOHause2I28eLpvL9gdvjmfWdzvu3+u9wuztrSm4ljPg5465fLy
	b19lB
X-Received: by 2002:a05:6214:130f:b0:8ef:74ad:e62b with SMTP id 6a1803df08f44-91061f8ef49mr51304166d6.7.1788830261027;
        Mon, 07 Sep 2026 18:17:41 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104049d30asm105271876d6.0.2026.09.07.18.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:17:40 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 05/05] yocto-bsps: update to v7.2.4
Date: Mon,  7 Sep 2026 21:17:30 -0400
Message-ID: <20260908011731.2895743-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
References: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 01:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245317

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/7.2 to the latest korg -stable release that comprises
the following commits:

    5015d0d945b3d Linux 7.2.4
    702da34510f8c platform/chrome: sensorhub: Fix dropped timestamp events and log spam
    7a315e6e2c36a ACPI: scan: Do not combine resources that overlap completely
    33c7d01fb1721 selftests/mm: fix on-fault-limit false failure under sudo-rs
    fafa987783835 udf: Fix i_lenExtents truncation on 32-bit kernels
    b63a6589984cc timer: Keep debugobjects state consistent in migrate_timer_list()
    bc59dac50cb45 timekeeping: Check the return value of tk_get_aux_ts64 in __do_adjtimex()
    3fb244bc24aee taskstats: fix cpumask parsing cutting off the last character
    b791401bf389a smack: fix cred UAF in smack_file_send_sigiotask()
    b655c2040ce83 signal: avoid shared siginfo namespace rewrites
    1abe5e32a6c8d sticon/parisc: Detect default STI graphics card for console output
    a09bc4eaa67e1 sysctl: move the "cad_pid" entry from pid_table[] to kern_reboot_table[]
    aee2296d09f6a tpm: tpm_i2c_nuvoton: disable IRQ on wait timeout
    23cb8d5fb33dc zloop: truncate finished zones to zone capacity
    f40115b2575ae xarray: honor XA_FLAGS_ACCOUNT in xas_split_alloc()
    6df05f630c84a w1: ds28e17: reject an oversize length on an I2C block read
    da5e9f08714c1 vsock/virtio: flush works in dependency order
    7074ec3769820 wifi: mt76: mt7996: validate default EEPROM firmware size
    b754d3a6d44c5 wifi: mt76: mt7996: fix TX DMA mapping leak for AddBA req frames
    6be59da2063d5 wifi: mt76: mt7996: bound the device EEPROM address before the EFUSE copy
    9e20da749ad22 wifi: mt76: mt7925: cancel mlo_pm_work on stop
    5f48b0d752a76 wifi: mt76: mt7915: bound the device EEPROM address before the EFUSE copy
    44be85af3e177 wifi: mt76: mt7615: avoid waiting for mac work under the mt76 mutex
    c1f214dd13512 wifi: rtw89: pci: add .shutdown callback to stop rfkill polling on reboot
    b1596e212ab17 wifi: rtw88: pci: fix resource leak on failed NAPI setup
    51d8b35574721 wifi: rtw88: Fix potential memory leak in rtw_txq_push_skb()
    7159e1e12468a wifi: rtlwifi: rtl8192du: Fix possible memory leak in rtl92du_init_sw_vars()
    42785f7e8d315 wifi: rtlwifi: rtl8192du: check QoS TID before indexing tids
    46e3a14d901b5 wifi: rtl818x: initialize eeprom_93cx6 struct to zero
    d29a165588b6a wifi: mwifiex: Detach sync cmd buffer on interrupted wait
    59ebe7b0ff646 mm/kmemleak: report RCU-tasks quiescent states during the scan
    3ee49d4dbd08a mm/kmemleak: stop the task stack scan early when interrupted
    b64d49ca15e3b crypto: atmel-ecc - avoid stale fallback key after set_secret failure
    50c52da156293 crypto: atmel-ecc - clean up and improve ECDH comments
    fcd86180ef78b crypto: iaa - unmap dst before software fallback on decompress
    a47a416ff68d7 fuse: copy request headers via a stack buffer for io-uring
    303b6eeedf29b fuse: decouple fuse_ring creation from ent registration
    972ab8b9c08f3 wifi: rtl8xxxu: fix use-after-free from rx_urb_wq on stop
    ad2a9fdca4a71 wifi: iwlwifi: dvm: fix memory leak in iwl_op_mode_dvm_start()
    ba04715ee672c wifi: brcmfmac: Fix memory leak in brcmf_sdio_read_control()
    4437b09f82f65 i3c: renesas: Perform Dynamic Address Assignment on resume
    ba3c86a902808 i3c: renesas: Restore STDBR and EXTBR registers on resume
    9206527c91b9f i3c: renesas: Reset the controller on resume
    de6aa7bd623fa i3c: renesas: Reconfigure the DATBAS register on re-attach
    3d62955cb4b76 i3c: renesas: Follow the reset deassert order used in probe
    7ea5b0ca2f39c i3c: renesas: Clean DATBAS register on detach
    ec631aff93261 i3c: renesas: Check that the transfer is valid before accessing it
    aac3c5aababc7 i3c: master: svc: bound IBI payload to the requested max_payload_len
    4837be0f9ac2e i3c: master: Fix info leak and UAF in device unregister path
    de8c32b0a246b i3c: master: adi: initialize the lock before enabling interrupts
    251db58324ea4 i3c: Fix unlocked dereference of dev->desc in i3c_device_get_supported_xfer_mode()
    f39a3e9cc5946 dm-pcache: fix use-after-free and invalid seg operations in kset_replay()
    8a2a2f78c6bae dm-pcache: fix implicit u8 truncation of gc_percent in message handler
    692037ae1a7cf dm-pcache: only hand out initialized cache segments
    5311dfc5cd70e dm-pcache: detect a cycle in the last-kset chain during replay
    1ab55354368d0 dm-pcache: clamp the tail kset read to the segment data region
    8bf7a06ca3c16 dm-pcache: bound the persisted tail-position offset
    e889c0ee81165 dm-pcache: validate on-media seg_num against the cache device size
    5ac38f4b4862f dm-pcache: validate kset key_num and intra-segment bounds
    3e19172089ec8 dm-pcache: validate geometry fields from on-disk cache_info
    8c52308f3805b dm-switch: use WRITE_ONCE() in switch_region_table_write()
    0c8f7870ed3eb dm-stats: fix a crash if allocation of per-cpu data fails
    1f2f7d885bf8c arch_numa: avoid false positive fortify warning in setup_node_to_cpumask_map()
    ceab9302388b2 rust: num: reject Bounded::shr overshifts at build time
    641dacada3312 ALSA: hda/realtek: Fix Lenovo Yoga Slim 7 14AKP10 quirk ordering
    2bfc88e833983 ALSA: hda/realtek: Enable micmute LED on HP EliteBook 6 G1a p/n: AD3Q9ET#UUG
    013daf7193702 ALSA: hda/realtek: Enable headset mic on F+ FLAPTOP r
    17fc26d7bbe8a ALSA: hda/realtek: Add quirk for TongFang XxAF5xxx
    f48c5f3b03afd ALSA: virmidi: Check card index validity at probe
    6d6fdb24fe2ea ALSA: serial-u16550: Check card index validity at probe
    e1ce8ad1009b1 ALSA: portman2x4: Check card index validity at probe
    7cf280fbef5db ALSA: pcxhr: initialize mutexes before requesting threaded IRQ
    cf3af453a48c8 ALSA: mts64: Check card index validity at probe
    8adda66edf795 ALSA: mpu401: Check card index validity at probe
    f78dc2ff60be0 ALSA: hda/ext: preserve PPLCCTL bits when clearing reset
    29ab2df278ab4 ALSA: FCP: do not copy out an uninitialised init response
    b06ebc7fe25a6 ALSA: bcd2000: clear the URB pointers on disconnect
    efbc2e9e43a1b ALSA: aloop: Check card index validity at probe
    34816e2cfeaba ALSA: 6fire: bound the MIDI event length from the device
    c8be3a076a59e mfd: sm501: Fix potential memory leaks during remove
    8391ee06d0884 mfd: qnap-mcu: keep the reply buffer alive past a command timeout
    3266537d0333a mfd: cgbc: Fix teardown ordering in cgbc_remove()
    8f93320702434 hwrng: stm32 - Fix runtime PM cleanup on registration failure
    c73fb911e02b9 seg6: reset IP6CB after IPv6 decapsulation
    0370da114a9bc net: skbuff: don't touch shared zerocopy state in skb_tx_error()
    497f3abfaa97a net: fix spurious TX timeout after dev_activate()
    9144f2c53a044 net: cap advertised IP tunnel headroom
    b74d313567dfc net/smc: unregister the connection before draining the rx tasklet
    2cb7a8d64b7e8 net/smc: stop killed, freed and out_of_sync sharing a byte
    adef84cc85d44 net/smc: fix use-after-free of the LLC qentry in smc_llc_srv_add_link()
    0926f59ca0f94 net/smc: fix use-after-free in smc_rx_pipe_buf_release()
    d9a879ac25958 net/smc: fix socket refcount leak in smc_switch_conns()
    f517cf0203380 net/smc: do not dereference an unset send buffer on the SMC-D teardown path
    0d6f80be8ac58 net/smc: carry oversized SMC-Rv2 LLC messages in the queue entry
    5e5d9e6df677d net/smc: bound the peer rkey counts in SMC-Rv2 LLC messages
    7498cadd989dd net/mlx5e: do not HW-GRO coalesce small frames
    4cf9400f29e24 net: ntb_netdev: Count packets dropped on RX refill failure
    759193a45dc67 net: ntb_netdev: Avoid double-accounting netif_rx() drops
    1a522d4480c97 net: ntb_netdev: Fix TX busy and drop handling
    75a604e9f1cfd NTB: ntb_transport: Reject oversized TX buffers
    89177732fe165 NTB: ntb_transport: Fail TX enqueue when the QP link is down
    a08423b7fe917 NTB: ntb_transport: Recycle TX entries before client callbacks
    d6c0af2931293 net: thunderbolt: Mark the connection down when bringing it up fails
    1c361f6cf39be net: thunderbolt: Release the Rx HopID that was handed out on mismatch
    66b50c31419e7 net: ravb: serialize PTP clock teardown
    0aaa53936419c net: ravb: avoid dereferencing an invalid PTP clock
    fb4d77553841a net: phylink: correctly validate returned PCS in phylink_inband_caps
    9f316e64923a4 net: openvswitch: fix nf_connlabels leak in ovs_ct_init
    7f072b84afd05 net: openvswitch: fix flow mask use-after-free on flow deletion
    cc561f8af2558 net: mctp: hold a reference to the route device in mctp_route_lookup()
    50c4038f1670b net: l2tp: do not propagate multicast notification errors
    30cef9c1229a3 net: ipa: fix stalled modem TX queue after runtime resume
    cc29f15244e04 net: ibm: emac: mal: fix NAPI locking
    48d1c9665db6e net: bnxt: ring the doorbell when SW USO exits early
    1610a8c2b93e8 net: dsa: realtek: use gpiod_set_value_cansleep for reset GPIO
    0ada54ea63e48 net: tun: bound receive headroom
    4f67a23f3f8d6 net: usb: qmi_wwan: add Telit Cinterion FE990D50 composition
    d6f25e5bd777b slip: fix use-after-free in sl_sync()
    68d7cc5512238 xdp: fix zero-copy frame layout
    a7f0130a09172 net/iucv: filter frames in afiucv_hs_rcv() by ingress device
    a496c51dd3257 ipmi:msghandler: Cancel work cleanly on an error
    8ada17dd4c4ff ipmi: si: Fix NULL pointer dereference after failed registration
    b115b7d06f26b ipmi: Remove all sysfs files on registration failure
    a84c6e3d188f2 ipmi: ipmb: validate write message length
    d715d19cfcfe9 interconnect: Fix use after free in icc_get() and of_icc_get_by_index()
    2b8ad4981eced io_uring/query: cap user size passed to copy_struct_to_user
    ef2bd2da1b774 io_uring/waitid: avoid siginfo copy during ring teardown
    7bc98e2de8c58 io_uring/waitid: honor task_work cancellation
    6dca6c4269b08 platform/x86: hp-bioscfg: warn on element type mismatch instead of failing
    400cbc3ccc88a platform/x86: hp-bioscfg: pass validated element count to package parsers
    4ef68ed53f098 platform/x86: hp-bioscfg: fix ORD_LIST_ELEMENTS never being parsed
    ddf98cf335297 platform/x86: hp-bioscfg: fix off-by-one write in hp_get_string_from_buffer()
    550d80f69fe5a platform/x86: hp-bioscfg: fix new_password_store() overwriting current_password
    b699e5c1f63a9 platform/x86: hp-bioscfg: fix heap OOB read on empty password write
    67b60703d7d8a platform/x86: hp-bioscfg: fix heap OOB read in sk_store() and kek_store()
    c32ac3443e5a1 platform/x86: hp-bioscfg: bound ordered-list parsing by the package count
    ea069840cb750 platform/x86: hp-bioscfg: advance elem past consumed array elements
    ab3526ce387e2 platform/x86: hp-bioscfg: accept reduced ACPI packages from older HP BIOS
    dd38ae725409e platform/x86/amd/pmc: Fix msg_port restoration in amd_stb_debugfs_open_v2()
    30e5f4d0cd0be platform/x86/amd/pmc: Fix LPS0 and debugfs leaks when STB init fails
    775d4cde1f973 platform/x86/amd/pmc: Propagate SMU errors and validate S2D address
    f1189a7665b0a platform/x86/amd/pmc: Restore msg_port on amd_stb_s2d_init() error paths
    4d9bf63ed74f8 platform/chrome: sensorhub: Bound the EC-reported sensor number
    91d7611113078 platform/x86: think-lmi: Fix current password length check
    abbcc0354108c platform/x86: think-lmi: Free system certificate signatures
    57d8750fd5ed7 platform/x86: think-lmi: Fix certificate thumbprint sysfs output
    a93df956ee4d9 platform/x86: panasonic-laptop: Fix sentinel write past pcc->sinf[]
    546a229829c6b platform/x86: lenovo/ymc: Only match lower byte in WMI lid switch query response
    5c4c6514497dc platform/x86: ishtp_eclite: Fix ACPI device reference leak in probe error path
    582b82e573a05 platform/x86: int1092: Fix potential memory leak in sar_probe()
    9ed7240d6366a platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8DD6)
    282cdcb7b03d9 platform/x86: ISST: Return error during profile addition
    68148d064cbe5 platform/x86: ISST: Validate parameter for frequency and priority
    ecfe22c2b72ef platform/x86: ISST: Validate parameter for core power state
    a352b135256b8 platform/x86: ISST: Validate max level for set feature
    82d4afadb02fb platform/x86: ISST: Validate logical CPU id and clos id
    fe6e73ef684d2 platform/x86: ISST: Use PP level enable mask
    1b324191da703 platform/x86: ISST: Just allow 2 bits for SST feature enable
    ef7975af15126 platform/x86: ISST: Add a NULL check for sst_inst[]
    c2b8a62491199 mmc: via-sdmmc: stop card-detect handling on probe failure
    eaca730c6f5e3 mmc: via-sdmmc: cancel card-detect work on remove
    207b4dc6eb100 platform/x86: ISST: Validate socket ID in clos_assoc ioctl
    d19385624bdfb platform/x86: ISST: Validate level in perf mask ioctls
    eb73b9d51490b platform/x86: dell-wmi-sysman: Don't hex dump attribute security buffer
    e27e90bde68b2 iommufd: Fix UAF in selftest IOPF reporting
    07b4fe1367f07 iommufd: Release current IOAS on xa_store() failure
    50a66a63d1c84 iommufd: Avoid locking internal accesses during unmap
    efd9a33f20225 iommupt: Return zero for invalid iova_to_phys() ranges
    87bc611c6c98a iommu/vt-d: Force requesting ACS when tboot is enabled
    f0a2c50254cfc iommu/vt-d: Fix no_iommu to disable platform opt-in
    eaf44262af248 iommu: Fix dev_iommu memory leak when device_add fails in iommu_mock_device_add
    78fd5a2d65f35 iommu/arm-smmu-v3: Manage teardown with devm
    f9b7375db3b36 iommu/arm-smmu-v3: Add HAFT support for SVA
    445204550f894 iommu/tegra241-cmdqv: Reject a vSID wider than the SID_MATCH field
    37a96a30617a4 iommu/sva: Set handle->dev before the SVA handle is visible
    7f7074a886c4a iommu/msm: Unwind probe state on registration failure
    d1470e16c1977 iommu/amd: Put PCI device after handling PPR faults
    4a5b7ee11cda8 PCI/proc: Warn on writes to kernel-exclusive config space regions
    6351e94076329 PCI/proc: Use file_ns_capable() when checking config space read access
    84536685a7f44 PCI/proc: Avoid spurious runtime PM wakeup on config space accesses
    a69a029f981d3 PCI/MSI: Enable memory decoding before restoring MSI-X messages
    21fd595ad137a PCI/ASPM: Avoid L0s for Realtek RTS525A
    329e42c0ff090 PCI/AER: Fix mapping of errors to agent & layer
    271ce2317009d PCI/AER: Emit TLP Log only for unmasked errors
    3dc196d3bbeae PCI/sysfs: Avoid spurious runtime PM wakeup on config space accesses
    f8ed6f530141b PCI/sysfs: Fix read byte order in pci_read_legacy_io()
    6453246da7df8 PCI: Add ACS quirk for Pericom PI7C9X2G608 switches [12d8:2608]
    e54e8d2a0f9c8 PCI: plda: Fix IRQ domain leaks in the error paths of plda_init_interrupts()
    e3589ca5f2e64 PCI: plda: Fix use-after-free of event IRQs during teardown
    d9ad2f0fe7871 PCI: starfive: Fix resource leaks on error paths in host_init()
    99e4d0286af36 PCI: meson: Fix GPIO state while requesting PERST#
    caf71f66d5528 PCI: Fix 32-bit config write in Intel PCH Root Port MPC ACS quirk
    1f0269720d452 PCI: hv: Set irq_retrigger callback for the Hyper-V PCI MSI irqchip
    15ec03452c18e s390/dasd: Propagate partial completion length across ERP recovery
    449f3bada7a9f s390/dasd: Guard sysfs discipline callbacks against unallocated private data
    b0d94dd6e82df s390/dasd: Do not complete a failed ESE read as successful
    91770b08a1209 s390/percpu: Fix MVIY_PERCPU() with older binutils
    71d46de9153e0 s390/cpum_cf: Handle CPU hotplug via prepare/dead callbacks
    36e6ce0f402f9 power: supply: max17040: synchronize work cancellation on suspend
    ad8081ede9369 power: supply: max17040: drop incorrect I2C functionality check
    c7aa4c3708cc0 power: supply: max17040: propagate register read errors
    35242c93d35f3 power: supply: ucs1002: fix use-after-free on remove
    b955da82db417 power: supply: twl4030_charger: cancel workers via devm
    7323e562f6961 power: supply: rt9455: quiesce delayed work before teardown
    6cc6c28c9ab6e power: supply: qcom_battmgr: terminate the strings from firmware
    49fbcd3da2958 power: supply: qcom_battmgr: fix use-after-free
    b64789e216997 power: supply: pf1550: enable charging when battery profile exists
    b4eb6a056b441 power: supply: lp8788-charger: fix use-after-free on remove
    6ab3128292df6 power: supply: lp8727: fix use-after-free in lp8727_release_irq()
    304a29ac55ba3 power: supply: cros_usbpd: Limit port counts to EC_USB_PD_MAX_PORTS
    3d1e01443b221 power: supply: cros_usbpd-charger: bound the EC-reported port count
    6d532582ff3c4 power: supply: charger-manager: register regulators before exposing sysfs
    58f1025eca927 power: supply: bq25890: Fix power_supply reference leak
    c8addb842ae8d power: supply: bq256xx: drain usb_work before freeing the charger
    47ccbad210f48 power: supply: bq24257: fix use-after-free on remove
    8320cbd81bc21 sctp: fix stream->outcnt underflow on duplicate RECONF responses
    db8dc28b73b44 sctp: distinguish sequence zero from wildcard in reconf lookup
    0ee697defc059 sctp: fix NULL deref on untransmitted RECONF completion
    3537961df2163 sctp: drop a chunk if its transport was removed
    a713e1b3a265f sctp: stop processing a packet once its association is deleted
    832a685efeb5d nvme-tcp: reject a read that transferred too few bytes
    3a0b05145053a nvme-tcp: fix host memory disclosure on R2T for a read command
    641ad3a30ba56 nvme-tcp: do not accept C2HData based on blk_rq_payload_bytes() alone
    f691394c1cc64 nvme-pci: disable controller on admin queue IRQ setup failure
    f5827817b4fc7 nvme: zero the discard fallback page
    0b46ec7f28a0f nvme: nvme-fc: Fix nvme_fc_create_hw_io_queues() queue deletion in error path
    21bcb609e0ab1 lockd: fix swapped arguments in nlmsvc_match_ip()
    51af080ca4e55 lockd: fix NULL dereference on lockowner allocation failure
    da6e60e5b38f5 lockd: fix NLMv4 GRANTED_MSG handling
    e999a88133654 lockd: pin next file across nlm_inspect_file lock-drop
    5dc0b2a9af95a ipmi: Fix use-after-free of cmd_rcvr in _ipmi_destroy_user()
    6d512e1624b15 i2c: mxs: fix DMA channel leak on probe error
    daa6960b0df4b hwmon: (max6621) fix temperature clamp range
    1daf80928fb5f hwmon: (max6621) fix negative temperature offset and crit readings
    5fc3f547dd966 dma-contiguous: fix truncation of numa_cma / cma_pernuma sizes >= 2G
    95a109f5af67f ASoC: codecs: aw88261: only check PLL and clock state at power-up
    7992a923348e8 ASoC: amd: yc: Add DMI entry for MSI Thin A15 B7UC
    e20902d383a64 arm64: proton-pack: Restore the nospectre_bhb command-line option
    2d3137a332aab arm64: compat: Fix decrementing LDM/STM alignment emulation
    97ab7c2ccffc9 ALSA: ump: Fix corrupted data bytes at MIDI 1.0 SysEx to UMP conversion
    5d85eef222cfd openvswitch: only skb_tx_error() a packet we are about to drop
    6a6d36fadb853 openvswitch: Fix CT limit teardown use-after-free
    b53435c079c78 openrisc: fix arbitrary kernel memory access via or1k_atomic syscall
    b53e2b271eeb6 ocfs2: fix readdir position truncation on 32-bit kernels
    7f5e326655980 ocfs2: fix cached cluster count after suballocator reclaim
    67ba148212131 ocfs2: cluster: fix o2hb_dependent_users leak on pin failure
    148e5019e1f95 ocfs2: cluster: avoid lock order inversion in o2hb_region_pin() from drop_item
    470212a5eefab ocfs2: cluster: don't sleep while holding o2hb_live_lock in o2hb_region_pin()
    b8a5c0c32df2c ocfs2: validate directory-index entry counts when reading metadata
    04ead708e13dd ocfs2: validate rl_used against rl_count in refcount block validator
    a8facb1670b4a ocfs2: validate lengths in dlm_mig_lockres_handler
    2487bea209832 ocfs2: bound namelen in dlm_migrate_request_handler
    09e93a60e18e8 ocfs2: always run deallocs on copy-on-write completion
    1774c5b3713ad orangefs: skip leading spaces before parsing client debug masks
    519f4146b8b8c orangefs: fix double-free of trailer_buf on readdir copy failure
    376796add2d70 PM: sleep: Unblock runtime PM when device prepare fails
    a14a97048e484 ring-buffer: Stop remote reader update when page swap fails
    d787d509bdf6c ring-buffer: Make cpu_buffer::free_page a buffer_data_read_page
    bf242baf58de0 ring-buffer: Hold cpu_buffer::lock when resizing a subbuf
    81063bbb16c4f ring-buffer: Free cpu_buffer::free_page with subbuf_order
    53106e9262a31 ring-buffer: Fix subbuf resize race with ring_buffer_alloc_read_page()
    dac639482116a regulator: qcom-refgen: correct the regulator type to CURRENT
    16583ed17a262 regulator: max8998_pmic_dt_parse_pdata: of_node_put on reg_np after ownership transferred to rdata
    8648e29e5c01b regulator: as3722_get_regulator_dt_data: fix premature of_node_put leaving dangling of_node pointer
    edae84e546174 RDMA/uverbs: Guard legacy bundles without method_elm
    9e71d0f4944ba RDMA/uverbs: Add UVERBS_ATTR_UHW to UVERBS_METHOD_REG_MR
    0be1955040a2e RDMA/ucma: Lock the handler in ucma_write_cm_event()
    43a7d8ae9f645 RDMA/ucma: Lock the handler in ucma_set_ib_path()
    08b8630b55782 RDMA/ionic: Embed counter driver data in rdma_counter allocation
    94d393f8dd94c RDMA/ionic: Cap eq_count to the eth driver's interrupt vector budget
    320e5258a53af RDMA/cxgb4: Cancel reg_work before freeing device on remove
    f5c8619ccbd70 qede: Fix NULL pointer dereference in TPA fragment processing
    0ce59c4148ecd ptp: vmclock: prevent read-only mappings from becoming writable
    440bcb0948a12 remoteproc: scp: Fix device reference leak on failed lookup
    098bfc94904ea riscv: unaligned: stop using kthread for check_vector_unaligned_access()
    6e7b8041068ce riscv: acpi: Handle LPI architectural context loss flags
    82088f88c96b9 RISC-V: KVM: Fix PMU event info array size overflow
    4efc2b3f2c19e riscv: dts: spacemit: k1-orangepi-rv2: fix maximum CPU core voltage
    c853c85247564 riscv: dts: spacemit: k1-orangepi-r2s: fix maximum CPU core voltage
    20a1c2869f12b riscv: dts: spacemit: k1-musepi-pro: fix maximum CPU core voltage
    1f6b98158afe0 riscv: dts: spacemit: k1-milkv-jupiter: fix maximum CPU core voltage
    e86e01247ec20 riscv: dts: spacemit: k1-bananapi-f3: fix maximum CPU core voltage
    2efa7a531c1c2 arm64: dts: rockchip: Fix rk3588s-roc-pc audio description
    72c93c1f4f2ce arm64: dts: rockchip: Fix rk3399-roc-pc-plus analog audio
    11918726dadfe arm64: dts: rockchip: fix emmc reset polarity on px30-cobra
    53992f89da991 arm64: dts: rockchip: fix eMMC reset polarity on PX30 Ringneck
    8f7c9ed1af20c arm64: dts: rockchip: fix eMMC reset polarity on PP-1516
    91ee0d0c4b292 arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on
    866b788b1e748 arm64: dts: qcom: sm6115-pro1x: Correct touchscreen GPIO flags
    7ee10b72558ea arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap
    0131497574eb3 Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinephone Pro"
    ba49fe53689de rpmsg: glink: smem: order FIFO read after availability check
    d86f65aed0140 scsi: fnic: Use GFP_ATOMIC for VLAN alloc under spinlock
    6fd1cce5018fd scsi: core: Fill in DMA padding bytes in scsi_alloc_sgtables()
    c736ea0fe7b4d sched_ext: Keep kick_sync waiting on the rq's own CPU
    f974f54c30784 sched_ext: Fix scx_bpf_dsq_reenq___compat kfunc extern prototype
    c480961a1e790 sched_ext: Don't BUG_ON a destroyed DSQ in process_deferred_reenq_users
    1df5802fa7838 sched_ext: Fix inverted ops.core_sched_before() invocation
    d644a145d76c8 sched_ext: Fix exit_task leak on fork failure during enable
    d863b1710d348 sched_ext: Fix scx_bpf_dsq_move_to_local___v2 compat detection
    28cc9c9ade885 sched_ext: Count rq lock releases in rq->scx.lock_drop_seq
    cdafb68155bee sched_ext: Fix rq->core_pick corruption under core scheduling
    6d1890d3c6137 sched_ext: Fix this_rq() assumptions in dispatch kfuncs
    6f1d3bfe54430 sched_ext: Replace SCX_RQ_BAL_KEEP with a dispatch verdict return
    23eda24f325a6 sched/core: Make core-sched flips wait for in-flight selections
    88ed5a66467ca sched/core: Handle pick_task() releasing the rq lock
    323c411fb6312 media: staging/ipu7: fix async notifier UAF on probe error path
    95f54d10be87f staging: media: tegra-video: vi: fix probe failure on skipped last port
    fc9937019cf7e staging: media: tegra-video: fix of_node_put() on VIP parse errors
    c5e073f2fbfd3 wifi: mt76: mt7925: cancel pending mlo_pm_work
    8eb73016fb396 wifi: ath6kl: clamp assoc request/response lengths before subtracting IE offsets
    1bd7947f1463c udf: reject VAT indexes equal to the entry count
    577097455d084 svcrdma: Validate Read chunk positions before reconstruction
    ac1dd6002f758 svcrdma: Use svc_xprt_put to free listener on create failure
    45dbdb2637b7f svcrdma: Reject Write/Reply chunks with segcount 0
    465f511f59a0f svcrdma: Reject Read lists that exceed the page budget
    5120fe54e0e2f svcrdma: Reject oversized Read segments at decode time
    8ec60eb51fae3 svcrdma: Reject inline replies that overflow the pull-up buffer
    1f6a14c142fee svcrdma: Reject connection when transport allocation fails
    45a444a17240f svcrdma: Fix unmatched rn_unregister on failed accept
    6d33a7e6bf6c6 svcrdma: Fix pcl_for_each_segment for empty chunks
    4493c96bbd006 svcrdma: Fix offset arithmetic in read_chunk_range
    673e358ab7c11 svcrdma: Clear sc_cm_id when ADDR_CHANGE replacement fails
    cfca6eb3345ba svcrdma: Reorder rpcrdma_rn_unregister before rdma_destroy_id
    7fbb6d2ab0391 SUNRPC: wait for in-flight client TLS handshake callback
    7a946b2e7207f SUNRPC: Reject short RFC 4121 MIC tokens in gss_krb5_verify_mic_v2
    880effc943ed8 SUNRPC: Reject krb5 v2 wrap tokens with oversized ec field
    9d94f046b23de SUNRPC: reject duplicate CREDS_VALUE options
    3f019571928b2 sunrpc: init gssp_lock before publishing proc entry
    d395c30d570ca SUNRPC: harden gss_unwrap_resp_priv length checks
    a7894e10572d5 SUNRPC: harden gss_krb5_unwrap_v2 against short tokens
    0bdb26b2534a1 SUNRPC: Guard svcauth_gss_release() dispatch on rq_auth_stat
    cdf7a233cb947 sunrpc: fix use-after-free in __rpc_clnt_handle_event and __rpc_clnt_remove_pipedir
    f85a83774d7f4 SUNRPC: fix gssx_dec_option_array error path bugs
    e0c5693d3f9a5 sunrpc: defer rq_argp and rq_resp free until after RCU grace period
    6debde9e3e6ae SUNRPC: close backchannel before destroying callback service
    b541a15046976 SUNRPC: Check svc pool percpu counter allocation
    3d60fdf951143 SUNRPC: always drain cache_cleaner before destroying a cache_detail
    48d04a32eb441 SUNRPC: Restore NUMA_NO_NODE for svc thread allocations in global mode
    8f766d2d0b4da sunrpc: route to a populated pool in svc_pool_for_cpu()
    2eed1e6a976a4 SUNRPC: svcauth_gss: enforce krb5 token minimum length
    0fa8a8acae57e SUNRPC: Zero rpc_gss_wire_cred at svcauth_gss_decode_credbody() entry
    85e9602650e9d SUNRPC: xdr_buf_trim: clamp buf->len to avoid underflow
    84646f5b945a3 phy: fsl-imx8mq-usb: fix typec switch leak on probe error path
    0d8e2404925a0 params: fix charp corruption on allocation failure
    e60466011ac3a nouveau/gem: reserve the bo in the info ioctl around the vma lookup
    6e3d09fcd97eb module/kallsyms: fix nextval for data symbol lookup
    bf19d166337c6 mptcp: fix uninitialized local_id in syncookie MP_JOIN reconstruction
    49d38c1b43904 mpls: reload header after pskb_may_pull()
    e4496dda2c6d0 module: validate string table section types
    df7d4d011d5ac md: do overflow check for sb->bblog_shift in super_1_load()
    00449d752bee9 md/raid10: fix still_degraded being inverted in raid10_sync_request()
    bc584959c3a53 mailbox: qcom-ipcc: fix duplicate channel allocation across holes
    69a734359639f libnvdimm/labels: Prevent integer overflow in __nd_label_validate()
    0c3204aacbe8c landlock: Require LANDLOCK_ACCESS_FS_MAKE_REG for whiteout creation
    f6b1b15848fd9 ipv6: use RCU iterator to dump route exceptions
    eab3a917cdcb1 ipv6: rpl: fix NULL dereference of idev in ipv6_rpl_srh_rcv()
    565038b0092f6 ip6_gre: fix hardware header length for NBMA tunnels
    8fc56ca49fc0e ip6_tunnel: use skb_cow_head() in ip6_tnl_xmit()
    f1281d4b99089 ip: orphan prefetched skbs before multicast forwarding
    fd01f1a3ed4a1 ipip: fix skb leak in collect_md mode when metadata_dst allocation fails
    595cac7f1b32d jbd2: check need_resched() when skipping busy checkpoint buffers
    c2c0fb364685b jbd2: bound shrinker scans by examined checkpoint buffers
    42a6f03cf352e kho: fix size calculation in kho_preserved_memory_reserve()
    3119d58e4ef87 kasan: fix cache shrink race with CPU hotplug
    7dcf816c15921 Bluetooth: hci_sync: Clear HCI_CMD_PENDING when dropping the last request
    cf76864493388 Bluetooth: hci_intel: fix usage_count leak when autosuspend_delay is negative
    db1ff5dc173c9 Bluetooth: hci_h5: fix usage_count leak when autosuspend_delay is negative
    9907e72f0f664 Bluetooth: hci_event: clear HCI_LE_ADV only on a created connection
    26f66d5b8a566 Bluetooth: hci_core: use skb_get() instead of skb_clone() for req_skb
    43b64cb6ed3b2 Bluetooth: hci_conn: re-enable advertising only for peripheral role
    fbf7961964a6e Bluetooth: RFCOMM: serialize security confirmation handling
    03288b7447c9e Bluetooth: ISO: fix use-after-free of listener socket in iso_conn_ready
    1b2e9b2cf9441 Bluetooth: hci_uart: Fix false success return in hci_uart_setup()
    981f7c23025bf Bluetooth: hci_bcm: fix usage_count leak when autosuspend_delay is negative
    a79432a904df0 Bluetooth: hci_bcm4377: Ignore reserved PHY in ext adv reports on BCM4378
    ba147f2f56a9b cxl/ras: Fix cxl_rch_get_aer_severity() wrong severity register
    7256c9bd929bb cxl/pmem: Format the nvdimm serial number as unsigned decimal
    491d8c9ac98d5 cxl/mce: Make the MCE notifier per-region
    d8957545fe96f cxl/features: bound fwctl command payload to the input buffer
    8fddd484992af cpufreq: schedutil: Fix rate limit overflow
    36c55d118d5ec cpufreq: apple-soc: Fix OPP table cleanup
    92f37721a33a6 coresight: etm3x: Fix cntr_val_show() to match cntr_val_store() behavior
    cb409b38b0232 dm array: reject an array block whose value size is not the caller's
    9808ddffb4bc6 dm array: validate array block headers on read
    f79b53ca3a68a dm raid1: reserve space for NUL-terminator in build_constructor_string()
    6876ca330e741 dm-era: fix shadowed superblock leak on take-snap failure
    15fc1ec72e1f8 dm-io: report non-retryable errors separatedly
    8dc48b68d7c3e dm-io: clone the source bio instead of copying its biovec
    dff481e12b3f1 bpf: Harden bloom filter sizing and indexing on 32-bit kernels
    a1159c8926120 buffer: avoid tail commit walk for uptodate folios
    9a23747909fca bpf: Disable preemption in __bpf_get_stack
    6a19b18d45888 bpf, x86: Fix per-CPU address resolution into an extended register
    e04b6f48dd444 bnxt_en: Write doorbell when linearizing skb fails
    a142c024f07d6 bnx2x: fix double free in bnx2x_init_firmware() error path
    bb56e97bd6761 Bluetooth: eir: Fix OOB read in eir_get_service_data()
    9fe52fd63e5b5 Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCAN quirk to 0bda:a728
    186a0975283f6 Bluetooth: btusb: Add ASUS USB-BT600 for Realtek 8761CU
    6b2da140580b6 Bluetooth: btusb: Add ASUS USB-BT540 for Realtek 8761CU
    c7c8e0454f31f block: set QUEUE_FLAG_DYING unconditionally in blk_mark_disk_dead()
    d44a97a3b1c00 block: validate user space vectors during extraction
    0dc53c2dd5933 backlight: aw99706: Honor the core blank state in update_status()
    32a5f01bbbaf8 backlight: aw99706: Fix DT property names to match binding
    ff2fb3c1e60cb auxdisplay: charlcd: cancel backlight work on registration failure
    4a4268a0b0a59 ata: libata-scsi: fix DSM TRIM for sector sizes larger than 2048 bytes
    1ff69db8f352d ARM: 9477/1: Disable broken eBPF JIT on the Risc PC
    22a0982db25cc alpha: marvel: Fix lock ordering in init_io7_irqs()
    4722bedf7a939 alpha: marvel: Fix irq_set_status_flags to use correct IRQ number
    a7800cf56bb3b alpha/PCI: Fix I/O port accessor argument order in pci_legacy_write()
    9a33db250f350 ACPI: TAD: Add locking around AML evaluations
    495daa1903695 ACPI: scan: Avoid registering platform devices with resource overlaps
    15d2b7f38f95d ACPI: pfr_update: fix stack buffer overflow in query_capability()
    3c0c3e96fccf1 ACPI: CPPC: Skip desired_perf read in cppc_get_perf()
    712d9e196f822 ACPI: CPPC: Reject desired_perf reads on _CPC revision 4+
    b48b613073c3d ACPI: APEI: GHES: fix ARM section length accounting after header
    c9655ce86b75b ACPI: APEI: Fix ERST timeout unit conversion
    0e25382b05de4 acpi/apei/ghes: Use raw_spinlock_t for CXL CPER work locks
    7d6fa298c2349 accel/rocket: Fix error path handling in rocket_job_run()
    81731f1eda5e6 accel/rocket: initialize job domain before cleanup paths
    dfff90a6eb225 accel/rocket: fix NULL dereference and integer overflow in rocket_job_push()
    0f001491e5a2e hugetlb: only adjust reservation during unmapping if mapcount is 0
    fbffbfdae5595 hsi: omap_ssi_core: fix missing DMA mask setup for SSI controller device
    ac8d8b599d466 fsnotify: Fix stale object mask after concurrent mark updates
    397423af18b62 fpga: stratix10-soc: Fix SVC mailbox handling during reconfiguration
    c4f196bfeedd7 forcedeth: fix off-by-one when saving/restoring non-PCI config space
    c87d9c412bf9b fonts: fixup font.h kernel-doc warnings
    9e768ae51426a fbdev: uvesafb: unregister connector callback on init failure
    1981e54ac137f fbdev: ssd1307fb: defer I2C transfers from damage callbacks
    fab0234a97d23 fbdev: pvr2fb: correct user pointer annotation and sentinel initializer
    09db79078f25c fbdev: omapfb: panel-dsi-cm: initialize lock before registering display
    e65d6326a7639 fat: restore original value when fat_ent_write failed
    b8f73b163b646 fanotify: fix use-after-free of file range info
    5efb3350230fe ext2: Fix lost inode updates for IS_SYNC inodes
    7f4a89d4f0d6a erofs: skip sufficiently large global buffers when resizing
    ab4647459098a entry: Fix seccomp bypass after ptrace with TSYNC
    0dbc2e94b81df efivarfs: Rate limit statfs() handler
    75101e106c42d ecryptfs: show filename encryption options
    654b7e79443f5 ecryptfs: release message context on send failure
    d2869768eab56 ecryptfs: reject too-small tag 70 packets
    a419c9ebfc9a4 ecryptfs: reject oversized encrypted_key_size in parse_tag_3_packet
    747fd45be396a ecryptfs: pass packet set buffer size to parser
    4c02acbe0a269 ecryptfs: hold msg ctx list lock when cleaning daemon queue
    7da5861dcc7b0 ecryptfs: fix tag 11 packet exact-fit size check
    279b1663be4fa eCryptfs: bound the packet-length peek to the user buffer
    6e844d4b82434 ntfs: verify run length exceeding volume boundary
    cd7b3dc7557fa ntfs: validate non-resident attribute offsets
    8f8420b68a6f0 ntfs: reject invalid MFT LCNs from boot sector
    b0cc6dbc655e0 ntfs: reject invalid empty mapping pairs
    dc15a9f5307d5 ntfs: bound the free-cluster bitmap scan to the volume
    1135ebc225996 fs/ntfs3: bound page_lcns[] index by the log record
    4a1b39b2e10eb fs/ntfs3: fix info-leak on partial LZNT decompress in ni_read_frame()
    0908da07c23be fs/ntfs3: validate dirty page table on log replay
    76e0f85f65073 eventfs: Initialize ei->children and ei->list in init_ei()
    2785f06aba4f4 HID: intel-thc-hid: intel-quickspi: fix autosuspend cleanup during teardown
    774609feaaf43 HID: intel-thc-hid: intel-quicki2c: fix autosuspend cleanup during teardown
    54e0bafc0653b HID: intel-thc-hid: intel-quickspi: bound GET_REPORT response to the caller buffer
    ee8ad1bb1e961 HID: intel-thc-hid: intel-quickspi: validate report size before copy
    7c18fb36708a9 HID: mcp2221: validate report size in mcp2221_raw_event()
    968546b676d99 HID: mcp2221: clear rxbuf after I2C/SMBus transfer completes
    2eda1513f5739 HID: mcp2221: stop device IO before hid_hw_stop
    c457bb516b61e HID: universal-pidff: stop the device when force-feedback init fails
    3155dc327344d HID: sony: fix UAF of ghl_poke_timer / ghl_urb at driver unbind
    d96f8958d4469 HID: sensor: custom: Fix field sysfs group cleanup on failure
    fbb5a60f5c31b HID: roccat: free buffered reports when destroying device
    699a3c8b56e16 HID: picolcd: clamp eeprom debugfs read to bytes actually received
    0329354abba35 HID: corsair-void: Check size of status and firmware events before reading them
    df9168b2678b8 HID: apple: preserve keyboard backlight across T2 resume
    5b16a1967a01a smb: client: restore the data_offset bound in is_valid_oplock_break()
    411e484fe71a7 smb: client: reject a tree connect response whose byte count is too small
    7e32da6047d9a smb: client: harden DFS cache against invalid target hints
    711cf71300d79 smb: client: fix use-before-check of ReparseDataLength in reparse_buf_ptr()
    033bc80019f07 smb: client: fix OOB read/write from unvalidated DataOffset in coalesce_t2()
    ab284008d7d00 smb: client: fix copy-paste error in WSL EA length accounting for $LXDEV
    62a3025983c8c smb: client: fix ALIGN() overflow in symlink_data() error context loop
    74e3ef4630f00 ksmbd: only rebind the reopened file's own oplock on durable reconnect
    5baab40404a93 smb: client: clear ce->tgthint in free_tgts()
    5e6533a683f6a smb: client: fix UAF and buffer leak in cifs_check_trans2() for malformed secondary T2
    69bfe810ecd1e smb: client: clear setuid/setgid bit on write with cifsacl/modefromsid/posix extensions
    81fc3868a7f72 cifs: use cifs_invalidate_cache() in cifs_do_truncate() for O_TRUNC
    b057ca17b6563 cifs: fix loff_t underflow in cifs_remap_file_range() when len == 0
    4bea15d9c7683 cifs: clear tcon after cifsFileInfo_put() in cifs_file_set_size()
    12bafe32f09c0 cifs: call pagecache_isize_extended() in cifs_setsize() when extending
    7d4312f0ca204 cifs: add cifs_resize_file_locked() to guard fscache_resize_cookie() under i_rwsem
    583cf579b32d9 audit: avoid dropping live tree ref on fsnotify rule autoremove
    aeb5770732cd2 btrfs: do not overwrite NODATASUM flag when removing NODATACOW flag
    05a1a816eef8b btrfs: fix extent map leak in NOCOW direct I/O write
    4d43107e807bc btrfs: drop recovered reloc root refs on recovery failure
    ac7a5a5385762 ceph: fix leaked inode reference on writeback abort at umount
    3d122b2feb1dd ceph: do not repeat ceph_trim_dentries() if no progress possible
    f341270ac5f50 ceph: cap delegated inode count in ceph_parse_deleg_inos()
    b12b3320c81fd ceph: bound xattr value length in __build_xattrs()
    332c444f4dc6f ceph: bound num_export_targets array for mds info v2/v3
    5f892c767b30e ceph: bound MDSCapAuth path and fs_name decode in handle_session()
    e7c2fd3893a7f ceph: bound copied dentry name length in NFS export get_name
    96c3f5fbb0d53 ceph: reject export_targets ranks >= CEPH_MAX_MDS in mdsmap decode
    3d0311481b891 ceph: force a cap message when a deferred revoke can't be acked immediately
    21d5be092d947 ceph: fix UAF in check_new_map() on session freed during unlock
    2dba24dcd5050 ceph: fix UAF in __kick_flushing_caps() on cf entry freed during unlock
    79900d978158b libceph: reject buckets with mismatched CRUSH ids
    201db408872ca libceph: validate OSD extent maps before cursor advance
    9fb4c08ac2cb0 nfsd: use test_and_clear_bit for somebody_reclaimed to prevent lost update
    81cf7f1413862 NFSD: Prevent client use-after-free during NFSv4.0 revoked-state cleanup
    2a9d637c2a8fd NFSD: Prevent client use-after-free during delegation revoke
    bf1f948691523 NFSD: Prevent client use-after-free during admin state revocation
    0c1a755b7212e NFSD: Prevent post-shutdown use-after-free in unlock_filesystem
    8cf4ff0a7c083 NFSD: Prevent lock owner use-after-free during client teardown
    ff8a3cff02b92 nfsd: revoke copy-notify stateids before dropping their reference
    5b3a7d7c23c07 nfsd: release OPEN-decoded posix ACLs via op_release
    aa34577f39e39 nfsd: reject reclaim LOCK after RECLAIM_COMPLETE
    1195483965a5f nfsd: reject out-of-range useconds in NFSv2 SETATTR/CREATE
    e2543852152bc nfsd: reject out-of-range nseconds in NFSv3 SETATTR and create ops
    08af9593e2b47 nfsd: close shrinker/GC/fsnotify vs per-net shutdown race in filecache
    ab43ff94f5dfc nfsd: move nfsd_debugfs_init() after nfsd4_init_slabs() in init_nfsd()
    431c70ca5163c nfsd: initialize DRC hash table before registering shrinker
    4cdef96892f4f nfsd: initialize copy-notify stateid before publishing it
    559570f91a7d4 nfsd: hold rcu across localio cmpxchg retry
    ff99ed007f065 nfsd: gate nfs3 setacl by argp->mask
    37eea38e78985 nfsd: gate nfs2 setacl by argp->mask
    62e5949f0dd5e nfsd: fix XDR padding calculation in ff_encode_getdeviceinfo
    c81cef6a805de nfsd: fix XDR length calculation in nfsd4_ff_encode_layoutget
    58b35b13e5379 nfsd: fix version mismatch loops in nfsd_acl_init_request()
    a385cf5e016b7 nfsd: fix UAF in async copy cancel and shutdown
    14b978e8d05ce nfsd: fix stale s2s_cp_stateids IDR entry for async COPY
    2da9a73acd3bc nfsd: fix reply size estimate for GET_DIR_DELEGATION
    a3c75f9bb6f5e nfsd: fix refcount leak in nfsd_file_lru_add on insertion failure
    033e783709ce9 nfsd: fix possible fh_compose of wrong dentry in nfsd4_create_file()
    fa6590dfd16ab nfsd: fix partial-write detection in nfsd_direct_write
    3c896db123892 nfsd: fix null dereference in nfsd4_setattr for deleg timestamp attrs
    6ed8d6de7ec90 nfsd: fix nfsd_file leak on inter-server COPY setup failure
    daaf4d951f0f2 nfsd: fix netlink dumpit error handling for rpc_status_get
    a278d361e0e8f nfsd: fix layout fence worker double-reference race
    66d89bc7ecf1d nfsd: fix FL_SLEEP being set unconditionally for all LOCK types
    cadc9036d5a82 nfsd: fix fcache_disposal UAF by inlining dispose state into nfsd_net
    11db8df188b34 nfsd: fix dentry ref leak on V4ROOT export filehandle lookup
    c7270f62e7a05 nfsd: fix cpntf publish race in nfs4_init_cp_state
    9843649196221 nfsd: fix clock domain mismatch in clients_still_reclaiming()
    97bda8b4284d9 nfsd: fix BUG_ON in nfsd4_alloc_layout_stateid on racing delegation revoke
    a95a1cffacd02 nfsd: ensure nfsd_file_do_acquire() does not use a non-opened file
    f7cb90ddc0217 nfsd: drop the stateid, not the stateowner, on seqid_op replay retry
    b449b134e7762 nfsd: don't free session slots that are still in use
    19413ccc45070 nfsd: defer vfree of compound ops to fix rpc_status UAF
    fe574c8069db9 nfsd: defer setting NFSD4_CALLBACK_RUNNING in deleg_reaper
    281cd65d92643 nfsd: dedup nfs4_client_to_reclaim inserts
    df5922fe09a81 nfsd: convert nfsd_net boolean flags to unsigned long flags word
    c1a4f7b1848f9 nfsd: clear opcnt on compound arg release to prevent OOB read
    cb2d0c4d1b3d3 nfsd: clear CALLBACK_RUNNING on failed delegation recall queue
    80cebb0e8a8d1 nfsd: check nfsd4_acl_to_attr() return value in nfsd4_create()
    d801906165cb5 nfsd: check client ownership when cancelling a copy-notify stateid
    ea14d71d6ecb9 nfsd: cap decoded POSIX ACL count to bound sort cost
    bf4d338dc8625 nfsd: block non-SAVEFH ops after FOREIGN PUTFH to prevent NULL deref
    9b5f6475006cd nfsd: add missing read barrier to rpc_status_get dumpit seqcount retry
    b4c121e186281 nfsd: add filehandle match check to nfsd4_delegreturn()
    c4a409b86a928 nfsd: add fh_want_write() for early-verified SETATTR in nfsd_proc_setattr()
    dcb69ad0dafb4 nfsd: widen nfsd_genl_rqstp address fields to sockaddr_storage
    45ec115cbfecb nfsd: validate symlink target length in NFSv4 CREATE
    22d0e4752ca88 nfsd: validate sockaddr length per family in listener_set
    5eb489831a9fd nfsd: validate nseconds in TIME_DELEG decode paths
    719a10e3f5f86 nfsd: size fh_verify server sockaddr slot by xpt_locallen
    a6d89032e5c66 nfsd: set SC_STATUS_FREED in nfsd4_drop_revoked_stid for delegations
    a1cbafe756cd5 nfsd: sample writeback error cursor before async COPY loop
    b63e4997c7765 nfsd: return NFS4ERR_NOTSUPP for unsupported netloc4 types
    b08c30f08d57f nfsd: restore rq_status_counter to even on all nfsd_dispatch() exit paths
    bf0cd31a9abcb nfsd: Reset write verifier when async COPY writeback fails
    2bc4343308d85 nfsd: release path refs on follow_down() error
    13bdd486c3aad nfsd: RCU-protect cl_cb_session to fix use-after-free on session teardown
    3c461a1820088 lockd, nfsd: RCU-protect nlmsvc_ops dispatch
    078ccf7321f0a pNFS: Fix EBUSY check in pnfs_layout_need_return
    32ac1b0b7f1cf NFSv4.1: fix layout segment leak on the pnfs_layout_process() forget path
    766170b4fd2da nfsd: guard nfsd_serv deref in nfsd_file_net_dispose
    a275de3bac563 NFSD: remove flawed WARN_ON_ONCE from nfsd_mode_check
    7377fa964b8aa NFSD: restart ssc_expire_umount walk after dropping nfsd_ssc_lock
    df2bd155dc40f NFSD: fix up error returned by write_threads()
    4876f345e42a2 NFSD: Fix off-by-one in DRC bucket pruning limit
    6c14602c01a2b NFSD: Encode only the status in NFS-ACL v2 GETACL error replies
    4408625447903 NFSD: check truncate permission under inode lock
    0fd2b9687dae3 NFS: fix delegation_hash_table leak when nfs4_server_common_setup() fails
    9f59b05423ed3 NFS/localio: fix ref leak on nfs_uuid_add_file failure
    9b8af4d3f623b zsmalloc: account for handle size in class lookup
    e23fac4ab2a57 zram: validate deflate params
    dea8f13c3dfad zram: set default primary compressor in zram_destroy_comps()
    07a82a66f8c18 zram: fix out-of-bounds access in writeback_store()
    5e458fa714a55 zram: fix out-of-bounds access in read_block_state()
    83e1aa9f5f906 ubifs: fix out-of-bounds read in signature length check
    c1a62f9dcf531 phy: rockchip-samsung-dcphy: fix out-of-range max_register
    7a99e9c701190 PCI/sysfs: Fix out-of-bounds read in pci_write_legacy_io()
    acd1b49043366 of: fix out-of-bounds read in of_alias_scan() stem parser
    28362e8ce5137 nilfs2: fix slab-out-of-bounds in nilfs_direct_propagate after truncation
    b95315ffc66b3 media: vicodec: fix out-of-bounds write in FWHT encoder
    a85ce3b175615 media: cec: stm32: prevent out-of-bounds write on RX overflow
    1b0dc3cbb8630 lib/ucs2_string.c: fix out-of-bounds read in ucs2_strnlen()
    78b95c571d021 KVM: arm64: GICv2: Don't WARN on out-of-range GICV_DIR INTID
    769f5a233efcf i3c: renesas: Fix out-of-bounds access for newdevs mask
    bc3d72c44bff1 HID: sensor-hub: Fix out-of-bounds write in sensor_hub_get_feature
    4dc1051939e49 fpga: altera-cvp: Avoid out-of-bounds read in trailing byte write
    8e3d9dbb25d3d cxl/ras: Fix cxl_rch_get_aer_info() out-of-bounds AER register read
    eac233e63f9db usb: gadget: f_fs: Prevent deadlock during ep0 read loop
    38f822ddce935 usb: gadget: uvc: fix dangling pointers in uvc_function_bind() and uvc_function_unbind()
    d511e015d0676 usb: gadget: uvc: Fix null pointer dereference in uvcg_video_init()
    d90b0f90e30cd usb: gadget: f_tcm: fix deadlock in usbg_make_tpg()
    9ea5dfb2bfef4 usb: gadget: midi2: remove default configfs groups on teardown
    0245adc0ad358 usb: gadget: snps_udc_plat: clean up PHY on probe deferral
    79a92896e2bb9 usb: gadget: u_audio: Fix use-after-free on sound card disconnect
    584ec5152f87f usb: typec: ucsi: use UCSI_TIMEOUT_MS for sync command completion
    0a25484fe22f6 usb: typec: thunderbolt: Disable work before freeing tbt on remove
    db0894b59bb91 usb: typec: tcpci: pass correct rx_type to tcpm_pd_receive()
    5c7678e38a09e usb: typec: hd3ss3220: fix VBUS regulator error message
    b729106ec9741 USB: phy: fsl-usb: fix missing static keywords
    557ef547d49ff usb: gadget: at91_udc: drain polled-VBUS timer/work before udc is freed
    93e08b13a7a30 usb: dwc3: gadget: Fix use-after-free in dwc3_gadget_free_endpoints due to race condition
    cdc1085ad40ce usb: dwc2: gadget: Exit partial power down state when changing USB pull-up
    fdc3fa9a38e1d staging: greybus: hid: fix SET_REPORT return value
    7429dce56a73b serial: imx: serialize imx_uart_ports[] lifetime
    ce792b94e0388 Revert "media: v4l2-dev: fix error handling in __video_register_device()"
    211c68d817a3d rapidio: mport_cdev: fix use-after-free in dma_req_free()
    71c8c1b06e6d1 powerpc/powermac: fix OF node refcount
    2aa0fb9c96f89 misc: nsm: bound the device-reported response length
    9cb6b223ef02c device property: fix infinite loop in fwnode_for_each_child_node()
    e7f6a6b5741d1 debugfs: Fix lockdown check for mmap_prepare
    7e9451bf0bdba cdx: Fix double free when sysfs file creation fails
    83d1ae0406d8e tracing: Fix use-after-free with same-name named triggers
    7a49d19ff9baa tracing: Fix use-after-free in trace_pipe read on sub-buffer order change
    df02489aa3aa1 tracing: Fix retry exhaustion in simple ring buffer reader swap
    57e8f60d3cddf tracing: Fix logged instance name on creation failure
    c40e0b4fa3659 tracing: Fix crash passing ERR_PTR to kthread_stop()
    b799f67119aff tracing/user_events: Clear copied tracing state before fork duplication
    52848a7ef68fa hwtracing: hisi_ptt: Propagate DMA reset timeout in trace_start()
    6ac9f37830966 x86/xen: fix init of balloon stats again
    1482578430378 x86/tdx: Fix zero-extension for 32-bit port I/O
    bb45f705c4440 x86/tdx: Fix off-by-one in port I/O handling
    786508f8339ca x86/insn-eval: Move assign_register() out of KVM as insn_assign_reg()
    9eb3bfc11d6dc x86/locking: Use sfence for wmb() if SSE is available
    d20f260388b35 tools/compiler: match glibc 2.42 definition of __attribute_const__
    e883a6bd96a43 mm: vmscan: fix node reclaim ignoring swappiness parameter
    2dcdb27f6e420 mm: page_alloc: fix non-movable reclaim storm in defrag_mode
    d3f688e98da0b mm: page_alloc: move capture_control to the page allocator
    bf483ca703f1e mm: page_alloc: __GFP_FS lockdep annotation for direct compaction
    89e8a4f0455a1 mm: mempolicy: fix automatic numa balancing for shmem
    5dba2ce548db7 mm: memcontrol: update state_local when flushing NMI stats
    aab391074de96 mm: memcg: stop reclaim when a limit update is superseded
    a8058dfd0a51a mm: memcg-v1: fix memsw and TCP failcnt accounting
    8823354b644c8 mm: memcg-v1: fix wrong linux-mm list address in deprecation warnings
    3dcc2fdc40170 mm: compaction: support non-movable compaction for pageblock requests
    684e175ffce0e mm/zswap: fix global shrinker when memory cgroup is disabled
    cf3ba0911a1cf mm/vmscan: report RCU-tasks quiescent states in shrink_lruvec()
    cdfa3e2a1e915 mm/vmalloc: make vm_struct.nr_pages an unsigned long
    e734cdda6b85f mm/slub: prevent pfmemalloc objects from entering the barn
    f77cbe1f17a21 mm/slub: fix missing debugfs entries for caches created before sysfs init
    240885926f3f5 mm/rmap: use huge_ptep_get() in try_to_migrate_one()
    4b9cd315061ad mm/rmap: use huge_ptep_get() in try_to_unmap_one()
    c05cdc2ab365b mm/pagewalk: fix stale walk->action escaping walk_pmd_range()
    13e9a00e6bafa mm/page_vma_mapped: use huge_ptep_get() for hugetlb
    46761406e1438 mm/page_owner: use memcg_data snapshot to avoid TOCTOU in print_page_owner_memcg()
    84339578c2d69 mm/mm_init: deferred_grow_zone(): fix out-of-range first_deferred_pfn
    8ffedc6573a66 mm/migrate_device: clear stale mapping after freeing swapcache
    cafccd266590b mm/migrate: use huge_ptep_get() in remove_migration_pte()
    66734981b4d3c mm/migrate: report RCU-tasks quiescent states in migrate_pages_batch()
    15d3a2a71c8bf mm/mglru: fix and remove redundant unevictable folio handling
    3d927093b2add mm/mempolicy: skip non-present PMDs when queueing folios
    5c0d7b658cda6 mm/madvise: skip device-private PMDs in cold and pageout walks
    1838c704bcb4f mm/kmemleak: avoid soft lockup when scanning task stacks
    c97a016dd4b5f mm/hugetlb_vmemmap: fix __hugetlb_vmemmap_optimize_folios()
    29968bc7aefb3 mm/hugetlb: initialize gigantic bootmem hugepage struct pages earlier
    2ddf429e25cf8 mm/hugetlb: fix boot panic with CONFIG_DEBUG_VM and HVO bootmem pages
    6cd209dbb55f6 mm/huge_memory: use folio's memcg inside __folio_split()
    5e3026bf73649 mm/huge_memory: skip device-private PMDs in madvise_free_huge_pmd
    ad41ca3534e60 mm/gup: fix always draining LRU caches in collect_longterm_unpinnable_folios()
    183fe65b0979d mm, swap: ratelimit bad swap entry reports
    a6df73156f2d8 mm, swap: don't free a hibernation slot that is in the swap cache
    5f8132f2c9a03 include/linux/list.h: mark list_add and __list_add as __always_inline
    36bdd0b45ec3f apparmor: fix out-of-bounds write when null terminating a label vec
    580f777d6d9fd apparmor: fix cred UAF caused by begin_current_label_crit_section()
    2f7541afbc57f KEYS: trusted: Fix TPM teardown ordering
    553142f4c44ce kbuild: rust: keep Rust objects out of Clang LTO with inline helpers
    fb760bdf799eb kbuild: rust: preserve unreachable traps with inline helpers
    793e49f4ff125 rust: cfi: disable function merging if CFI is enabled
    9d9b98b396099 rust: num: restrict bool conversion to unsigned Bounded
    66fff437a15fa objtool/rust: add one more `noreturn` Rust function
    744794d8920e9 rust: kernel: list: fix incorrect pop_back example comment
    a7ef535bfdc1a rust: kbuild: disambiguate `zerocopy_derive` for `rusttest`
    cdbbcd7c64c9d rust: devres: ensure revocation is complete before device finishes unbinding
    c7e3d57c705ab rust: devres: fix race between concurrent revokers
    a6756230ab95b rust: dma: return zero for Coherent reads past EOF
    f728043371428 rust: rust_is_available: warn for `bindgen` < 0.72.1 && libclang >= 22
    0523fab5f6cfb rust: bug: prevent dead_code warning from warn_on!'s flags constant
    f391fef4122a9 rust: bug: fix warn_on macro build error on UML
    f49982cc4b9b6 rust: bug: skip arch-specific asm in `testlib` builds
    d6d980e5208db rust: kbuild: disambiguate `zerocopy` for `rusttest`
    ffef68ecc191c objtool/rust: add one more `noreturn` Rust function for Rust 1.99.0
    00ef529a5402f timers/itimer: Zero-init old itimerval before copy to userspace
    c0eab781e1823 rust: fmt: fix {:p} printing stack addresses
    2fd19075a07f3 powerpc/pseries/iommu: switch to Default DMA window during kdump
    e89318aa86299 pidfd: hold exec_update_lock around namespace ioctl
    b1aa8ab78a8e8 ovl: fix double end_creating() on the casefold-mismatch path
    a35cc21355734 fs: fix user path of nested backing files
    f0efafcdf6eec clocksource/drivers/timer-sun4i: Advertise a real minimum delta
    cdcd861123248 clocksource/drivers/nxp-pit: Fix IRQ leak on cpuhp_setup_state error path
    71f5f2f374df6 alpha: don't leak hardware-fabricated FP exception bits to user space
    22429a4d2451e rust: time: fix as_micros_ceil() rounding near i64::MAX
    65651f1001aa3 iomap: don't free integrity payload that doesn't exist
    0cc4969fc915b alpha: fix ieee_swcr_to_fpcr setting FPCR_DNOD unconditionally
    f8ef75a263d43 drm/amd/display: Prune per-tile Timing from Apple Studio Display Primary Tile
    8eefff582dccd drm/amd/display: hide Apple Studio Display secondary tile
    0c7c517827a45 ring-buffer: Fix subbuf resize race with ring buffer readers
    074c715e0b498 btrfs: write-protect folios during data writeback
    e2c8375e0c72d ASoC: tegra: Sort MBDRC register defaults
    9b1a9434f4871 ASoC: tegra: Sort ADMAIF register defaults
    2b005289afbb3 ASoC: tegra: Fix the MIXER enable default value
    777a6a9cf7290 ASoC: tegra: Fix the I2S enable default value
    8f98fbb7fd4a8 ASoC: tegra210_mixer: sort the register default table
    0ade1c624b233 ASoC: tegra210_i2s: sort the Tegra264 register default table
    3e1b654f5479f ASoC: tegra210_i2s: sort the register default table
    f733276ae737e drm/amd/display: Skip Update HDCP Config In Transition State
    58e7295cfecad Linux 7.2.3
    47a7f98fbb500 usb: usbfs: fix use-after-free of usb_device in usbdev_release()
    e5e8fc11a7ac5 wifi: mt76: mt7925: ensure tx headroom in usb_sdio_tx_prepare_skb
    f24dcc61bd0ec USB: c67x00: fix use-after-free in c67x00_add_iso_urb()
    3720311fa519f USB: serial: spcp8x5: drop broken carrier detect support
    d762aef4eba35 USB: serial: option: fix slab OOB read in interrupt URB callback
    d1f643b1c0258 ALSA: usb-audio: Complete cleanup after system-resume errors
    1074c2306901b ALSA: usb-audio: fix OOB write in snd_usbmidi_novation_output()
    8bf1cdb6d05c1 ALSA: usb-audio: Fix sample rates for PreSonus AudioBox USB
    b471594da637d usb: core: Strengthen error handling in hub_hub_status()
    7c48aa0c1e791 usb: core: Add lock to usb_wakeup_notification()
    29b4f7bc29913 KVM: s390: vsie: zero stale crypto bits
    8cbd1539e00dd crypto: qce - Remove unsafe/deprecated algorithms
    6ef9a4afb52cb crypto: mxs-dcp - fix source scatterlist length access
    516a830e2f47f crypto: iaa - fall back to software for multi-entry scatterlists
    4839f4c21f9c5 crypto: qce - fix CCM AAD buffer underallocation
    a1bf793657947 crypto: krb5 - use kfree_sensitive() for derived key buffers
    0dd2f638877ac crypto: atmel-tdes - use scatterlist length before DMA mapping
    8ab58786b4c63 crypto: sun8i-ss - Remove crypto_rng interface
    1017f987c5f08 crypto: sun8i-ce - Remove crypto_rng interface
    3c7101cfc52e3 crypto: qcom-rng - Allow zero as a random number
    669d940351eda crypto: qcom-rng - Remove crypto_rng interface
    b1d62624a13c6 crypto: qcom-rng - Enable clock in hwrng case
    1f9f877b1ef1f crypto: virtio - bound the akcipher result length
    8b9a857fcf32a kunit: irq: Continue increasing hrtimer interval for longer
    9b74e56336877 mm/swap: reject swapon() on filesystem-level encrypted files
    68de7f3a38aca netfilter: nf_tables: don't queue packet path object notifications
    fbfa5944d2216 netfilter: nft_set_pipapo_avx2: add missing vzeroupper
    4bbc76ee1b21d vxlan: keep the last remote linked during FDB flush
    2b46baa591d0a batman-adv: reject unrepresentable multicast TVLV offsets
    f4be3b391265e ipv6: seg6: clear IPv4 control block on IPIP decapsulation
    550d00aa58193 net/packet: defer vmalloc TX_RING free until skbs finish
    a29f3b884ba50 vlan: fix skb_under_panic and races when toggling HW VLAN offload
    57f94d3f4dee8 net: bridge: mcast: fix use-after-free of a master VLAN's multicast context
    3921c573d1ca4 xfrm: bound nat keepalive state collection
    be19d20e53a23 xfrm: fix xfrm_state_construct() auth-trunc leak
    46640c814f25f xfrm: ah6: validate routing header segments_left
    a9fa05b7a1246 xfrm: avoid lock inversion in nat keepalive work
    943d95233b8b4 xfrm: drop ESP-in-TCP packets with no ingress device
    31cf234936190 tcp: clamp route advmss to TCP_MIN_MSS
    54b41ad14da9a xfrm: espintcp: fix UAF during close
    713ed6ce111e8 net: advertise TCP MSS from the configured MTU, not the learned PMTU
    2857dcbd03cf3 net/tcp-ao: fix use-after-free of current_key on reconnect to another peer
    d17e88b6b60ff tcp: fix AO info use-after-free in tcp_ao_connect_init()
    a742178889f92 net/tcp: fix TCP-AO key deletion in VRFs
    1e995498d2978 gtp: serialize PDP context updates
    7e1208c135618 tls: device: fix out-of-bounds write in tls_append_frag()
    60e5acbffcd45 KVM: SEV: Wire up kvm_x86_ops.gmem_xxx() if and only if CONFIG_KVM_AMD_SEV=y
    6d989a0e2df29 KVM: SEV: Mark vCPU RUNNABLE after AP_CREATE, even if VMSA is unusable
    68a34115a4233 KVM: SEV: Extract loading of guest-provided VMSA to a separate helper
    7813da74c6d32 KVM: SEV: Track the GPA of the guest-controlled VMSA used for SNP guests
    c79c113b299b7 KVM: SEV: Drop FOLL_WRITE for encrypted region registration
    97f6402f5950c KVM: SEV: Allocate full pages for {DE,EN}CRYPT ops on SNP-enabled hosts
    eaa96a8458f54 usb: gadget: f_tcm: keep port count until LUN teardown completes
    c6e90336ed7d7 usb: usbtest: disable dynamic ID support
    e981474d7bf14 fuse: fix invalidate lock leak on open O_TRUNC DAX failure
    e8457ebfd77a4 fuse: fix invalidate lock leak on setattr writeback failure
    715cb86e33cda fuse: wait for FR_FINISHED on abort_on_kill to prevent use-after-free
    a1bb359c443d0 fuse: publish io-uring queues with release semantics
    dd9c835709f4b fuse: fix missing barrier when checking io-uring readiness
    26fbe4bc3ef3a fuse: fix race between interrupt and resend
    57881714412d7 xhci: dbgtty: Fix unregister on tty_alloc_driver() failure
    0e469b94fbba8 xhci: dbgtty: Fix unregister on tty_register_driver() failure
    0b31744f70c5e usb: xhci: bail out of setup if the controller is inaccessible
    ed3c2adb57b52 usb: xhci: Handle USB3 port events when there is one roothub
    87dbc3fa08fc6 usb: xhci: Handle bogus TRB pointers in Missed Service Error events
    aa323ccbc0a51 accessibility: speakup: unregister tty ldisc on later init failures
    5b2d5447730d5 fpga: dfl: fme: add error handling
    5b4be35d02289 selftests/bpf: Fix test_maps sockmap failure
    6e4cf28155870 nvme-tcp: fix usage of page_frag_cache
    d219e7a8eed38 RDMA/rxe: Fix OOB in free_rd_atomic_resources()
    60dfd47929cd1 RDMA/rxe: Fix responder UAF on IB_QP_MAX_DEST_RD_ATOMIC modify_qp

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend
index c11f724..3f7df45 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v7.2/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "c599c3c2210539ed09d42bebadfbbff5b226da10"
+SRCREV_machine:genericarm64 ?= "c19d1399d1f4d84a372f1f776ac34905f9dd5bdb"
-- 
2.43.0


