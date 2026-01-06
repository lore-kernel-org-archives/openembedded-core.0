Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176E5CE9D59
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:24:11 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92281.1767713043141424956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 07:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=epqWgZsq;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88a34450f19so10373746d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 07:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767713042; x=1768317842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZZE1vOn+ljmcgkXjwPmA69YMHCZXisOuExpm8n8KzM=;
        b=epqWgZsq0MfEwN0VV1kOGnV3H/pE7/2rP22QtuafMRQ+hdAk/irUcbV/dwL3gWRyyb
         Shj4Or/EHAhadlpFpauXRVCZx6Eey4/Hs+0sVcFlTE78Jj5gZSbU92XG/Pygw/+zpGWr
         8/JmBEJQs7HPticXuCMj6Ge22qtd89TLkOrhTrPxRLlymtdeQQLcMkclcw1fa7u4gkay
         MePrcQk427Q0vxFgP6ddpCDtWym1PQNTWLHKQeK5hyE2l/3i/8KAPiZ4H+8ICZ/G+91S
         Q1DCX1DGK/G6fqe4k0OjOIclMakkf3xEUu9e0tsevuUY1uYJUjUMO3RSz0ne7AlfKBWm
         z4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713042; x=1768317842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ZZE1vOn+ljmcgkXjwPmA69YMHCZXisOuExpm8n8KzM=;
        b=sT2jeijX6E+tVBO/5wb2r3jlUIA9WKE1J10sSd0we9WAGG4CivuXI/iLCQpZVUhxot
         gbHm2elVtRJ7awcwJd9CCTr7OMLNAUCIFQiVG0O5ruhSUTP43ntrEVjvrPVICSXJnmq/
         Td2sf39idMhRAZgDjVIsuao78QsZ9AYgqxD5K+BdJr8kO3mghZcWIV/OS58m1o2GsClS
         FUVcA+btt8Im03jGae7v4KnY+GbPaJIBMk/cFeraEQd2aNOiP1ruB8qA4D4oJEH4rHy4
         FDFmEwLO7fuyRdyBdkbUxpbgq/Y2j+9mhjK16pZmmvuxRPKqVX8hSRxajSdiLiX22Rx7
         Zd2A==
X-Gm-Message-State: AOJu0YxMBywowa6TqM7DxlHzfJ8eEPM4KeZ+XBokvG8eLKfsOM9AGJwD
	z62HQuGJp0BBF01hTciv6xkZg8CpcUlR8QMg3lMaDuqg9pG18lOkaPoAByDQfbwEnSM=
X-Gm-Gg: AY/fxX79liWbH+WejHWhFQdOGpYahK+cXqc+qSLldQBW8AOgKk+rjQSwz54oCOAxEBv
	eWgfJvhXDUyoBnWMl0hnmB/HHYKdn7mGQDWg3tpSYFgicXsgrYg7fXAAvIxzM2o9hw15Gqmwvuo
	F97MEcDOZmhsAun8IDzfBGVhXZWXQbJ6zYgX5QFG/aZ9YRTmr9kA/cdAIyV410qXzxCjxVvRGCD
	ZXUfzGdLkTIHHk0Ae4xrZuj5yCwVmp8eiaqJyZ9C65g0+xDY/3dW7kxhBMI/au5gibPiQRy8DR0
	d92zOW5wNQ7lfaO1kgFPuonLIziqTgxg9cIkSuvIoy5zjslDsgjZ1LQG8fDnq1vwAg0FS2qllJl
	nJf8l4TRrWkjH69NWWiRJTsRO6j/HxhLF1s6xYykxKmxGF9djUm7fr/6RsfDMc4hiQ0x6S9RPI9
	hvUaUluZcglur41ILeWRBgG2uN//BLyb7sJTr490bbbLTGACWg1xlVyRVLrdPHEyrBbRQ9Ps07P
	Gjx8c/rYaZ5XV8=
X-Google-Smtp-Source: AGHT+IEeqLvW7fioZmUMXOacxJMl14jLRR4Ul1oVp+KkwPbbHwemv+WopvNToocPVzEhq7i9x+gh3g==
X-Received: by 2002:a05:6214:448b:b0:890:587f:1105 with SMTP id 6a1803df08f44-89075ef0ec6mr44865156d6.33.1767713041537;
        Tue, 06 Jan 2026 07:24:01 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077267b9esm15587326d6.48.2026.01.06.07.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:24:00 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	haokexin@gmail.com
Subject: [meta][PATCH 05/07] linux-yocto/6.18: update to v6.18.3
Date: Tue,  6 Jan 2026 10:23:50 -0500
Message-Id: <20260106152352.932717-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260106152352.932717-1-bruce.ashfield@gmail.com>
References: <20260106152352.932717-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228899

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    a607c8f74434 Linux 6.18.3
    b79938863f43 fuse: missing copy_finish in fuse-over-io-uring argument copies
    e0d6de83a4cc fuse: fix readahead reclaim deadlock
    a6d1f1ace16d fuse: fix io-uring list corruption for terminated non-committed requests
    f6c08d3aa441 iommu/mediatek: fix use-after-free on probe deferral
    bf58ef1c4cd3 block: freeze queue when updating zone resources
    ce909de4416e ARM: dts: microchip: sama7g5: fix uart fifo size to 32
    699d66165f6c ARM: dts: microchip: sama7d65: fix uart fifo size to 32
    c2423add6242 ARM: dts: microchip: sama5d2: fix spi flexcom fifo size to 32
    4fc2f8fbfdd4 hwmon: (w83l786ng) Convert macros to functions to avoid TOCTOU
    c8cf0c2bdccc hwmon: (w83791d) Convert macros to functions to avoid TOCTOU
    ffd46e7f2b87 hwmon: (max6697) fix regmap leak on probe failure
    ef901d211dcc hwmon: (max16065) Use local variable to avoid TOCTOU
    5b804b8f1e0d io_uring/rsrc: fix lost entries after cloned range
    c95e4c4caf9a interconnect: qcom: sdx75: Drop QPIC interconnect and BCM nodes
    5fa6c144d3fb i2c: amd-mp2: fix reference leak in MP2 PCI device
    fb5b47ad5387 lib/crypto: riscv: Depend on RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
    19d61f032c7e platform/x86: intel: chtwc_int33fe: don't dereference swnode args
    17be376bb250 pwm: rzg2l-gpt: Allow checking period_tick cache value only if sibling channel is enabled
    f80e4e91b010 rpmsg: glink: fix rpmsg device leak
    88b71cd0aa39 rtla/timerlat_bpf: Stop tracing on user latency
    81bf2780ba43 soc: amlogic: canvas: fix device leak on lookup
    25073a05068e soc: apple: mailbox: fix device leak on lookup
    b28fd17adfb2 soc: qcom: ocmem: fix device leak on lookup
    951515391b8f soc: qcom: pbs: fix device leak on lookup
    b2d6246ef36f soc: samsung: exynos-pmu: fix device leak on regmap lookup
    3ce2b4aec8cd tracing: Fix fixed array of synthetic event
    479af0d9c6ba vfio: Fix ksize arg while copying user struct in vfio_df_ioctl_bind_iommufd()
    8716a841d1da virtio: vdpa: Fix reference count leak in octep_sriov_enable()
    3846f8f781cc zloop: make the write pointer of full zones invalid
    35eb1ec73f57 zloop: fail zone append operations that are targeting full zones
    1d18fb5c71f6 amba: tegra-ahb: Fix device leak on SMMU enable
    70cf3d6fe71a crypto: arm64/ghash - Fix incorrect output from ghash-neon
    b674e3522b67 crypto: caam - Add check for kcalloc() in test_len()
    51a5ab36084f crypto: af_alg - zero initialize memory allocated via sock_kmalloc
    c549b9e0b877 dt-bindings: PCI: qcom,pcie-sm8550: Add missing required power-domains and resets
    1bff3e35ed44 dt-bindings: PCI: qcom,pcie-sm8450: Add missing required power-domains and resets
    d06674a1ca79 dt-bindings: PCI: qcom,pcie-sm8350: Add missing required power-domains and resets
    4eee447b5bd4 dt-bindings: PCI: qcom,pcie-sm8250: Add missing required power-domains and resets
    f3510ba5e265 dt-bindings: PCI: qcom,pcie-sm8150: Add missing required power-domains and resets
    c3823d1243d3 dt-bindings: PCI: qcom,pcie-sc8280xp: Add missing required power-domains and resets
    37f52c4554f3 dt-bindings: PCI: qcom,pcie-sc7280: Add missing required power-domains and resets
    149b97dc3295 drm/displayid: pass iter to drm_find_displayid_extension()
    f9e805fa1fe8 drm/amd/display: Fix scratch registers offsets for DCN351
    7d5df9dd6343 drm/amd/display: Fix scratch registers offsets for DCN35
    ede98c3943cd drm/amd/display: Use GFP_ATOMIC in dc_create_plane_state()
    9837f8d57a54 Revert "drm/amd/display: Fix pbn to kbps Conversion"
    acb3a68f2170 gpio: loongson: Switch 2K2000/3000 GPIO to BYTE_CTRL_MODE
    5f8dc9f0327e gpiolib: acpi: Add quirk for Dell Precision 7780
    efdcbc1b1035 gpio: regmap: Fix memleak in error path in gpio_regmap_register()
    0f5940176ad6 s390/ipl: Clear SBP flag when bootprog is set
    5fcdaa29e599 cgroup: rstat: use LOCK CMPXCHG in css_rstat_updated
    a35788ddf8df btrfs: don't log conflicting inode if it's a dir moved in the current transaction
    0d5c9e901ad4 powerpc/kexec: Enable SMT before waking offline CPUs
    1c8bb965e9b0 SUNRPC: svcauth_gss: avoid NULL deref on zero length gss_token in gss_read_proxy_verf
    2a77c8dd49bc svcrdma: use rc_pageoff for memcpy byte offset
    4846a4c6acb9 svcrdma: return 0 on success from svc_rdma_copy_inline_range
    433bb1344ef6 nfsd: Mark variable __maybe_unused to avoid W=1 build break
    da1ccfc4c452 svcrdma: bound check rq_pages index in inline path
    7d17693eb79d ASoC: SOF: ipc4-topology: Convert FLOAT to S32 during blob selection
    42ed4c781019 NFSD: Clear TIME_DELEG in the suppattr_exclcreat bitmap
    506059202510 ALSA: hda/realtek: Add Asus quirk for TAS amplifiers
    134436e66019 ASoC: SOF: ipc4-topology: Prefer 32-bit DMIC blobs for 8-bit formats as well
    214b39648006 NFSD: NFSv4 file creation neglects setting ACL
    b8db16f97d08 NFSD: Clear SECLABEL in the suppattr_exclcreat bitmap
    b225325be7b2 net/handshake: restore destructor on submit failure
    7a93edb23bcf fsnotify: do not generate ACCESS/MODIFY events on child for special files
    7b9ea7aa24bd net: phy: marvell-88q2xxx: Fix clamped value in mv88q2xxx_hwmon_write
    779fa2a063d4 r8169: fix RTL8117 Wake-on-Lan in DASH mode
    681fd588733c lib/crypto: riscv: Add poly1305-core.S to .gitignore
    5bb88024409e arm64/gcs: Flush the GCS locking state on exec
    7992a8c94689 PM: runtime: Do not clear needs_force_resume with enabled runtime PM
    6df47e5bb9b6 tracing: Do not register unsupported perf events
    cec87632c34a xfs: validate that zoned RT devices are zone aligned
    d29ed9ff972a xfs: fix a UAF problem in xattr repair
    92f6a7b6cfda xfs: fix the zoned RT growfs check for zone alignment
    0f3b87c66d89 xfs: fix stupid compiler warning
    55c28a875425 xfs: fix a memory leak in xfs_buf_item_init()
    0c01fa83c09b KVM: selftests: Add missing "break" in rseq_test's param parsing
    caf68b6da389 KVM: x86: Apply runtime updates to current CPUID during KVM_SET_CPUID{,2}
    aedf23821663 KVM: nSVM: Clear exit_code_hi in VMCB when synthesizing nested VM-Exits
    acffd1cee688 KVM: nSVM: Set exit_code_hi to -1 when synthesizing SVM_EXIT_ERR (failed VMRUN)
    6617e02cf8df KVM: nVMX: Immediately refresh APICv controls as needed on nested VM-Exit
    3fe48378e53f KVM: TDX: Explicitly set user-return MSRs that *may* be clobbered by the TDX-Module
    da28922a8c60 KVM: SVM: Mark VMCB_PERM_MAP as dirty on nested VMRUN
    2c3719a04b04 KVM: Fix last_boosted_vcpu index assignment bug
    691ff7e13f0d KVM: nSVM: Propagate SVM_EXIT_CR0_SEL_WRITE correctly for LMSW emulation
    2853896ef465 KVM: selftests: Forcefully override ARCH from x86_64 to x86
    201b4a7ebbe0 KVM: SVM: Mark VMCB_NPT as dirty on nested VMRUN
    c1f8d4d41ed3 KVM: nSVM: Avoid incorrect injection of SVM_EXIT_CR0_SEL_WRITE
    e23f46f1a971 KVM: x86: Fix VM hard lockup after prolonged inactivity with periodic HV timer
    a16ccbffb144 KVM: x86: Explicitly set new periodic hrtimer expiration in apic_timer_fn()
    16fa73b11a94 KVM: x86: WARN if hrtimer callback for periodic APIC timer fires with period=0
    b3b320a900a5 powerpc: Add reloc_offset() to font bitmap pointer used for bootx_printf()
    2acb8517429a libceph: make decode_pool() more resilient against corrupted osdmaps
    37a691ed7942 lib/crypto: riscv/chacha: Avoid s0/fp register
    3383f16f7870 dm-pcache: advance slot index before writing slot
    c8f810e20f4b parisc: Do not reprogram affinitiy on ASP chip
    a19fb3611e4c scs: fix a wrong parameter in __scs_magic
    f8b136296722 media: iris: Add sanity check for stop streaming
    24a2062257bb platform/chrome: cros_ec_ishtp: Fix UAF after unbinding driver
    f73b74dafa3c KVM: x86: Don't clear async #PF queue when CR0.PG is disabled (e.g. on #SMI)
    7acc0390e0dd ocfs2: fix kernel BUG in ocfs2_find_victim_chain
    30f4d4e5224a media: vidtv: initialize local pointers upon transfer of memory ownership
    65d4e5af2a2e mm/slub: reset KASAN tag in defer_free() before accessing freed memory
    cb51bef465d8 KVM: Disallow toggling KVM_MEM_GUEST_MEMFD on an existing memslot
    dd6e519ba91e pinctrl: renesas: rzg2l: Fix ISEL restore on resume
    a1223a72c419 tools/testing/nvdimm: Use per-DIMM device handle
    4560db9678a2 f2fs: fix return value of f2fs_recover_fsync_data()
    51659b91898f f2fs: fix to not account invalid blocks in get_left_section_blocks()
    2efb6b9c5bd2 f2fs: fix to detect recoverable inode during dryrun of find_fsync_dnodes()
    57e36f84f2b5 f2fs: fix uninitialized one_time_gc in victim_sel_policy
    b355d300f51b f2fs: fix age extent cache insertion skip on counter overflow
    e6d828eae00e f2fs: use global inline_xattr_slab instead of per-sb slab cache
    0dde30753c1e f2fs: invalidate dentry cache on failed whiteout creation
    bac23833220a f2fs: fix to avoid updating zero-sized extent in extent cache
    40409e089b41 f2fs: fix to propagate error from f2fs_enable_checkpoint()
    86a85a7b622e f2fs: fix to avoid potential deadlock
    0df713a9c082 f2fs: fix to avoid updating compression context during writeback
    0b36fae23621 f2fs: ensure node page reads complete before f2fs_put_super() finishes
    3fb2db6f50ea scsi: ufs: core: Add ufshcd_update_evt_hist() for UFS suspend error
    a0d4e9e24474 scsi: mpi3mr: Read missing IOCFacts flag for reply queue full overflow
    8edbb9e371af scsi: target: Reset t_task_cdb pointer in error case
    8c5ce5fafe9c NFSD: use correct reservation type in nfsd4_scsi_fence_client
    751c19635c2b scsi: aic94xx: fix use-after-free in device removal path
    1c728951bc76 scsi: Revert "scsi: qla2xxx: Perform lockless command completion in abort path"
    8f92817b6f10 cpufreq: nforce2: fix reference count leak in nforce2
    87f11fea5acb cpuidle: governors: teo: Drop misguided target residency check
    17157612e40d serial: sh-sci: Check that the DMA cookie is valid
    190dc4b74800 serial: xilinx_uartps: fix rs485 delay_rts_after_send
    320578703ebe serial: core: Fix serial device initialization
    c255a5164c58 serial: core: Restore sysfs fwnode information
    864deb6cf1c0 mei: gsc: add dependency on Xe driver
    670c2d09ac57 mei: Fix error handling in mei_register
    4157f7bba629 intel_th: Fix error handling in intel_th_output_open
    1f53652922cd dt-bindings: slimbus: fix warning from example
    f83e3e9f8918 char: applicom: fix NULL pointer dereference in ac_ioctl
    687ccc341f63 xhci: dbgtty: fix device unregister: fixup
    fd00f88ef36b usb: renesas_usbhs: Fix a resource leak in usbhs_pipe_malloc()
    1f069425f4f0 usb: dwc3: keep susphy enabled during exit to avoid controller faults
    5a45d75da3b7 usb: dwc3: of-simple: fix clock resource leak in dwc3_of_simple_probe
    9f4bc5c30402 usb: gadget: lpc32xx_udc: fix clock imbalance in error path
    7501ecfe3e52 usb: phy: isp1301: fix non-OF device reference imbalance
    2e7c47e2eb3c usb: phy: fsl-usb: Fix use-after-free in delayed work during device removal
    cefaad839a38 USB: lpc32xx_udc: Fix error handling in probe
    d377fe40ff5a usb: typec: altmodes/displayport: Drop the device reference in dp_altmode_probe()
    8422cdf91db1 usb: typec: ucsi: huawei-gaokin: add DRM dependency
    a9cd9a4846ef usb: ohci-nxp: fix device leak on probe failure
    987c0ddfe8bb phy: broadcom: bcm63xx-usbh: fix section mismatches
    b07bfaf62d07 media: pvrusb2: Fix incorrect variable used in trace message
    ac92151ff249 media: dvb-usb: dtv5100: fix out-of-bounds in dtv5100_i2c_msg()
    207d2d90ad87 usb: usb-storage: Maintain minimal modifications to the bcdDevice range.
    50f47c02be41 mptcp: avoid deadlock on fallback while reinjecting
    77ea2657b470 mptcp: schedule rtx timer only after pushing data
    ea0129061d61 selftests: mptcp: pm: ensure unknown flags are ignored
    ec4358c72491 mptcp: pm: ignore unknown endpoint flags
    344789964c6c mm/slab: introduce kvfree_rcu_barrier_on_cache() for cache destruction
    2766fae7c4c6 dma-mapping: Fix DMA_BIT_MASK() macro being broken
    d519d23a6b1c crash: let architecture decide crash memory export to iomem_resource
    20eda7c74b69 tpm2-sessions: Fix tpm2_read_public range checks
    04a3aa6e8c5f tpm2-sessions: Fix out of range indexing in name_size
    cebbf5d16bb2 mm/huge_memory: add pmd folio to ds_queue in do_huge_zero_wp_pmd()
    d710b4a2c713 media: v4l2-mem2mem: Fix outdated documentation
    2c636fb02af2 mm/ksm: fix exec/fork inheritance support for prctl
    3997b3147c7b block: Remove queue freezing from several sysfs store callbacks
    f0dba761b282 jbd2: use a weaker annotation in journal handling
    4a9e50d881f5 jbd2: use a per-journal lock_class_key for jbd2_trans_commit_key
    b59fa6011480 ext4: align max orphan file size with e2fsprogs limit
    e70d561d9d83 ext4: fix incorrect group number assertion in mb_check_buddy
    8cde2072825b ext4: clear i_state_flags when alloc inode
    ce5f54c065a4 ext4: xattr: fix null pointer deref in ext4_raw_inode()
    ecb7e5603b57 ext4: check if mount_opts is NUL-terminated in ext4_ioctl_set_tune_sb()
    5bbacbbf1ca4 ext4: fix string copying in parse_apply_sb_mount_options()
    8626a78ce7dd printk: Avoid irq_work for printk_deferred() on suspend
    be8ba672cc5a printk: Allow printk_trigger_flush() to flush all types
    b107196729ff fs: PM: Fix reverse check in filesystems_freeze_callback()
    858344bc9210 tpm: Cap the number of PCR banks
    2b78da4cc75d ktest.pl: Fix uninitialized var in config-bisect.pl
    b3b036bac7c9 fs/ntfs3: fix mount failure for sparse runs in run_unpack()
    419b1ea754c9 kallsyms: Fix wrong "big" kernel symbol type read from procfs
    17900c56e263 crypto: scatterwalk - Fix memcpy_sglist() to always succeed
    3312f03e9948 floppy: fix for PAGE_SIZE != 4KB
    cbaae7bb64d4 jbd2: fix the inconsistency between checksum and data in memory for journal sb
    8dd553771afe block: rate-limit capacity change info log
    3715bb43ccd3 gfs2: fix freeze error handling
    98d65b62ddf8 btrfs: don't rewrite ret from inode_permission
    498e286941b9 wifi: mt76: Fix DTS power-limits on little endian systems
    aceaa18f791a s390/dasd: Fix gendisk parent after copy pair swap
    3b95fdb75d74 lib/crypto: x86/blake2s: Fix 32-bit arg treated as 64-bit
    0eeaa2ba3b43 perf: arm_cspmu: fix error handling in arm_cspmu_impl_unregister()
    bacecf370e0c efi: Add missing static initializer for efi_mm::cpus_allowed_lock
    265fad7d9c42 phy: exynos5-usbdrd: fix clock prepare imbalance
    344057b2605d dt-bindings: clock: mmcc-sdm660: Add missing MDSS reset
    9285d0483063 mmc: sdhci-msm: Avoid early clock doubling during HS400 transition
    4bb9164e8f21 x86/mce: Do not clear bank's poll bit in mce_poll_banks on AMD SMCA systems
    2ad1e2faebbd sched_ext: Fix missing post-enqueue handling in move_local_task_to_local_dsq()
    5ddd444484be sched_ext: Fix bypass depth leak on scx_enable() failure
    ff67270a177f sched_ext: Fix the memleak for sch->helper objects
    514d605ab6ce sched_ext: Factor out local_dsq_post_enq() from dispatch_enqueue()
    3192204aa77f printk: Avoid scheduling irq_work on suspend
    7fbfb85b05bc io_uring: fix filename leak in __io_openat_prep()
    dcb0d8bf1771 io_uring: fix min_wait wakeups for SQPOLL
    13a8f7b88c2d io_uring/poll: correctly handle io_poll_add() return value on update
    3dfe2e1531c8 clk: keystone: syscon-clk: fix regmap leak on probe failure
    9e7c63c69f57 KEYS: trusted: Fix a memory leak in tpm2_load_cmd
    c30ed32690b2 rust: io: add typedef for phys_addr_t
    52df55b21ede rust: io: move ResourceSize to top-level io module
    0bf59179bdef rust: io: define ResourceSize as resource_size_t
    93b3274587e8 samples: rust: fix endianness issue in rust_driver_pci
    48298e1ba378 rust: dma: add helpers for architectures without CONFIG_HAS_DMA
    bee1f36801db rust_binder: avoid mem::take on delivered_deaths
    505e8c7f6ca1 rust/drm/gem: Fix missing header in `Object` rustdoc
    bb82aaee1690 cifs: Fix memory and information leak in smb3_reconfigure()
    f8b19571b1db vhost/vsock: improve RCU read sections around vhost_vsock_get()
    74dd8b66f9d2 block: rnbd-clt: Fix signedness bug in init_dev()
    13456b4f1033 ublk: clean up user copy references on ublk server exit
    2c46497eb148 drm/msm/a6xx: move preempt_prepare_postamble after error check
    19648135e904 drm/msm: adreno: fix deferencing ifpc_reglist when not declared
    e64d5d45ffa8 scsi: scsi_debug: Fix atomic write enable module param description
    7f39b9d0e86e MIPS: ftrace: Fix memory corruption when kernel is located beyond 32 bits
    6455d25857f2 platform/x86/intel/hid: Add Dell Pro Rugged 10/12 tablet to VGBS DMI quirks
    c3cd1d514eb0 hwmon: (emc2305) fix double put in emc2305_probe_childs_from_dt
    6c95c2e00996 nvme-fabrics: add ENOKEY to no retry criteria for authentication failures
    76bced5efbf4 hwmon: (emc2305) fix device node refcount leak in error path
    4f7d90c7184a nvme-fc: don't hold rport lock when putting ctrl
    3b96dc29e385 platform/x86: wmi-gamezone: Add Legion Go 2 Quirks
    ef7653481a05 i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware
    7b8581442457 clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk0_clk_src
    9a9a9b88a8d8 libperf cpumap: Fix perf_cpu_map__max for an empty/NULL map
    ad9f0f01373c serial: sprd: Return -EPROBE_DEFER when uart clock is not ready
    e63d2173887c usb: xhci: Don't unchain link TRBs on quirky HCs
    e375aa7f5a1e usb: usb-storage: No additional quirks need to be added to the EL-R12 optical drive.
    6dc09b9b211b usb: xhci: limit run_graceperiod for only usb 3.0 devices
    41374236a556 iio: adc: ti_am335x_adc: Limit step_avg to valid range for gcc complains
    132fe187e0d9 usb: typec: ucsi: Handle incorrect num_connectors capability
    1681cf6da695 usbip: Fix locking bug in RT-enabled kernels
    967ac825b4f6 exfat: zero out post-EOF page cache on file extension
    ff3e06e80c9e exfat: fix remount failure in different process environments
    f04d53f6e3ff reset: fix BIT macro reference
    b49c766856fb functionfs: fix the open/removal races
    c6a2dd4f2e4e via_wdt: fix critical boot hang due to unnamed resource allocation
    ea0c31c52143 fuse: Invalidate the page cache after FOPEN_DIRECT_IO write
    b88dd8517ec8 fuse: Always flush the page cache before FOPEN_DIRECT_IO write
    05f9aa19fdc1 scsi: qla2xxx: Use reinit_completion on mbx_intr_comp
    6407b63db802 scsi: qla2xxx: Fix initiator mode with qlini_mode=exclusive
    45185214175c scsi: qla2xxx: Fix lost interrupts with qlini_mode=disabled
    095704d7f334 powerpc/addnote: Fix overflow on 32-bit builds
    d45fcd38c692 clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10, pcie_x11 & pcie_x4
    5f9a7a00a2be scsi: lpfc: Fix reusing an ndlp that is marked NLP_DROPPED during FLOGI
    4ca4c0b6c34f scsi: smartpqi: Add support for Hurray Data new controller PCI device
    15108657bce0 ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx
    dbbf6d471306 um: init cpu_tasks[] earlier
    64b989a051b0 firmware: imx: scu-irq: Init workqueue before request mbox channel
    9f2ff08737c4 scsi: ufs: host: mediatek: Fix shutdown/suspend race condition
    eb8d9fb6280d ipmi: Fix __scan_channels() failing to rescan channels
    235ae3fc9e9c ipmi: Fix the race between __scan_channels() and deliver_response()
    8a9c52cbaf96 ASoC: ops: fix snd_soc_get_volsw for sx controls
    aa0449550e1e ASoC: SDCA: support Q7.8 volume format
    523c21a04c17 nfsd: fix memory leak in nfsd_create_serv error paths
    74fd0ae1a7de ASoC: ak4458: remove the reset operation in probe and remove
    eaa95228b8a5 ALSA: usb-mixer: us16x08: validate meter packet indices
    499057a7cc6b ALSA: pcmcia: Fix resource leak in snd_pdacf_probe error path
    042e9e86d8e1 ALSA: vxpocket: Fix resource leak in vxpocket_probe error path
    2068cf6f8276 ASoC: fsl_sai: Constrain sample rates from audio PLLs only in master mode
    425672fdb7b6 x86/mm/tlb/trace: Export the TLB_REMOTE_WRONG_CPU enum in <trace/events/tlb.h>
    82b6dfc0aa60 x86/fpu: Fix FPU state core dump truncation on CPUs with no extended xfeatures
    f01e9f891c37 x86/msi: Make irq_retrigger() functional for posted MSI
    34c0e95524d6 x86/bug: Fix old GCC compile fails
    6220d38a08f8 net/hsr: fix NULL pointer dereference in prp_get_untagged_frame()
    e1be561f6b14 dt-bindings: mmc: sdhci-of-aspeed: Switch ref to sdhci-common.yaml
    2ebf2e631d53 mmc: sdhci-of-arasan: Increase CD stable timeout to 2 seconds
    87e74671ddbc mmc: sdhci-esdhc-imx: add alternate ARCH_S32 dependency to Kconfig
    be0b613198e6 spi: fsl-cpm: Check length parity before switching to 16 bit mode
    7e086c97dd2b ACPI: CPPC: Fix missing PCC check for guaranteed_perf
    4cb75cd4eeb4 ACPI: PCC: Fix race condition by removing static qualifier
    76033cf8c2e4 platform/x86: intel_pmc_ipc: fix ACPI buffer memory leak
    4a4193d9c6dd soc/tegra: fuse: Do not register SoC device on ACPI boot
    bb958a1320b5 can: gs_usb: gs_can_open(): fix error handling
    da852f46c76e xfs: don't leak a locked dquot when xfs_dquot_attach_buf fails
    8722085fd23b Input: i8042 - add TUXEDO InfinityBook Max Gen10 AMD to i8042 quirk table
    a9c115e017b2 Input: alps - fix use-after-free bugs caused by dev3_register_work
    cffc4e29b1e2 Input: lkkbd - disable pending work before freeing device
    40e3042de43f Input: ti_am335x_tsc - fix off-by-one error in wire_order validation
    9d9eab0eb2bf Input: xpad - add support for CRKD Guitars
    cae029e0575d Input: apple_z2 - fix reading incorrect reports after exiting sleep
    14b1a6009e48 HID: input: map HID_GD_Z to ABS_DISTANCE for stylus/pen
    6dc8cf6e7998 ksmbd: fix buffer validation by including null terminator size in EA length
    8cabcb4dd3dc ksmbd: Fix refcount leak when invalid session is found on session lookup
    571204e4758a ksmbd: skip lock-range check on equal size to avoid size==0 underflow
    3041d93301ca hwmon: (ltc4282): Fix reset_history file permissions
    0821f3ad2d6e arm64: dts: mediatek: Apply mt8395-radxa DT overlay at build time
    66dce411c7e9 amd/iommu: Preserve domain ids inside the kdump kernel
    1e5b2d2138f6 drm/xe/oa: Always set OAG_OAGLBCTXCTRL_COUNTER_RESUME
    338849090ee6 drm/xe/oa: Limit num_syncs to prevent oversized allocations
    1d200017f55f drm/xe: Limit num_syncs to prevent oversized allocations
    cfc473f29eb5 block: rnbd-clt: Fix leaked ID in init_dev()
    0460e09a6142 ublk: fix deadlock when reading partition table
    474cf21e0c0e ublk: refactor auto buffer register in ublk_dispatch_req()
    5907d423400e ublk: add `union ublk_io_buf` with improved naming
    0f6f3cf11bfe ublk: add parameter `struct io_uring_cmd *` to ublk_prep_auto_buf_reg()
    a4315e409ab0 io_uring: fix nr_segs calculation in io_import_kbuf
    0ab22a1796e0 spi: cadence-quadspi: Fix clock disable on probe failure path
    dac58c012c47 drm/amdgpu: fix a job->pasid access race in gpu recovery
    f51cc7aeb3d0 arm64: kdump: Fix elfcorehdr overlap caused by reserved memory processing reorder
    0901f5fe2a01 x86/xen: Fix sparse warning in enlighten_pv.c
    09fe52c728e0 drm/panel: sony-td4353-jdi: Enable prepare_prev_first
    548e158dbf57 MIPS: Fix a reference leak bug in ip22_check_gio()
    63cc97bd85e3 drm/xe: Restore engine registers before restarting schedulers after GT reset
    4c8a881044e1 drm/xe: Increase TDF timeout
    f72c9ecd4b25 drm/me/gsc: mei interrupt top half should be in irq disabled context
    754b10c067f0 drm/xe: fix drm_gpusvm_init() arguments
    3a3612dc7055 drm/xe: Apply Wa_14020316580 in xe_gt_idle_enable_pg()
    f6ec2d5c21b1 drm/xe: Fix freq kobject leak on sysfs_create_files failure
    ea62d22f5772 hwmon: (tmp401) fix overflow caused by default conversion rate value
    5aa213920166 hwmon: (ibmpex) fix use-after-free in high/low store
    e52b375b7dae hwmon: (dell-smm) Limit fan multiplier to avoid overflow
    5e4481ef397e spi: mpfs: Fix an error handling path in mpfs_spi_probe()
    c062e2785bbe spi: microchip: rename driver file and internal identifiers
    f55201fb3bec block: fix race between wbt_enable_default and IO submission
    ef8178f81002 block: use {alloc|free}_sched data methods
    93869ded0ccc block: introduce alloc_sched_data and free_sched_data elevator methods
    aa81ed74af25 block: move elevator tags into struct elevator_resources
    22f98de8fa78 block: unify elevator tags and type xarrays into struct elv_change_ctx
    322d0132d8b5 selftests: ublk: fix overflow in ublk_queue_auto_zc_fallback()
    9c0dc1d40b69 drm/tests: Handle EDEADLK in set_up_atomic_state()
    5ffc53a58a75 drm/tests: Handle EDEADLK in drm_test_check_valid_clones()
    c35d4fba2e0b drm/tests: hdmi: Handle drm_kunit_helper_enable_crtc_connector() returning EDEADLK
    91a51d01be5c net: hns3: add VLAN id validation before using
    f02f283ebfaf net: hns3: using the num_tqps to check whether tqp_index is out of range when vf get ring info from mbx
    62f28d79a618 net: hns3: using the num_tqps in the vf driver to apply for resources
    918aafade36d net: enetc: do not transmit redirected XDP frames when the link is down
    3c330f1dee3c net/handshake: duplicate handshake cancellations leak socket
    4af9c2cd9a84 net/mlx5e: Don't include PSP in the hard MTU calculations
    52f7785dad93 net/mlx5e: Trigger neighbor resolution for unresolved destinations
    2d2e05d3c2af net/mlx5e: Use ip6_dst_lookup instead of ipv6_dst_lookup_flow for MAC init
    a935b5993b9e net/mlx5: Serialize firmware reset with devlink
    d173741ab4cb net/mlx5: fw_tracer, Handle escaped percent properly
    8c35c2448086 net/mlx5: fw_tracer, Validate format string parameters
    2d2d97d8a644 net/mlx5: Drain firmware reset in shutdown callback
    5af49c5c3bdb net/mlx5: fw reset, clear reset requested on drain_fw_reset
    4066b5b54629 ethtool: Avoid overflowing userspace buffer on stats query
    730a125ec467 can: j1939: make j1939_sk_bind() fail if device is no longer registered
    b166b8e0a381 iommufd/selftest: Check for overflow in IOMMU_TEST_OP_ADD_RESERVED
    9bec0d706487 iommufd/selftest: Make it clearer to gcc that the access is not out of bounds
    365417a77d38 selftests: netfilter: packetdrill: avoid failure on HZ=100 kernel
    95b2dac3aaee netfilter: nf_tables: remove redundant chain validation on register store
    79ea9102e66b netfilter: nf_nat: remove bogus direction check
    c59137e1314d nfc: pn533: Fix error code in pn533_acr122_poweron_rdr()
    43d9a530c8c0 net/sched: ets: Remove drr class from the active list if it changes to strict
    21fdcc00656a caif: fix integer underflow in cffrml_receive()
    82abf247e013 selftests: netfilter: prefer xfail in case race wasn't triggered
    689a627d1478 ipvs: fix ipv4 null-ptr-deref in route error path
    4bd2b89f4028 netfilter: nf_conncount: fix leaked ct in error paths
    c70df25214ac inet: frags: flush pending skbs in fqdir_pre_exit()
    58e7108971fa inet: frags: add inet_frag_queue_flush()
    1b5c3b8826d4 inet: frags: avoid theoretical race in ip_frag_reinit()
    9ed53331e418 selftests: net: tfo: Fix build warning
    aa3f345dbac2 selftests: net: Fix build warnings
    008fd87cd708 selftest: af_unix: Support compilers without flex-array-member-not-at-end support
    1d18e7155f64 broadcom: b44: prevent uninitialized value usage
    698f389552ab net: ti: icssg-prueth: add PTP_1588_CLOCK_OPTIONAL dependency
    c999153bfb2d net: openvswitch: fix middle attribute validation in push_nsh() action
    f17e0c120848 bnxt_en: Fix XDP_TX path
    4049a6ace209 mlxsw: spectrum_mr: Fix use-after-free when updating multicast route stats
    675c5aeadf64 mlxsw: spectrum_router: Fix neighbour use-after-free
    fcb9e2e5cf04 mlxsw: spectrum_router: Fix possible neighbour reference count leak
    d2495f529d60 net/mlx5: Fix double unregister of HCA_PORTS component
    7aa2085ca72b ipvlan: Ignore PACKET_LOOPBACK in handle_mode_l2()
    90206ede6318 net: phy: RTL8211FVD: Restore disabling of PHY-mode EEE
    e3859271c72c net: phy: realtek: create rtl8211f_config_phy_eee() helper
    c6a23498f795 net: phy: realtek: eliminate priv->phycr1 variable
    ce370d988122 net: phy: realtek: allow CLKOUT to be disabled on RTL8211F(D)(I)-VD-CG
    d064d95c74d3 net: phy: realtek: eliminate has_phycr2 variable
    7ec73f0e1600 net: phy: realtek: eliminate priv->phycr2 variable
    e12c912f92cc net/mlx5e: Avoid unregistering PSP twice
    f4a16bb7f8b5 net/mlx5: make enable_mpesw idempotent
    45466141da3c net/sched: ets: Always remove class from active list before deleting in ets_qdisc_change
    51f5fbc1681b netrom: Fix memory leak in nr_sendmsg()
    ef4943d8c55c net: fec: ERR007885 Workaround for XDP TX path
    6938e2fb4b4b gfs2: Fix use of bio_chain
    e84d2d5f3680 Bluetooth: btusb: Add new VID/PID 0x0489/0xE12F for RTL8852BE-VT
    81b702a5486c Bluetooth: btusb: Add new VID/PID 13d3/3533 for RTL8821CE
    a35109f796db Bluetooth: btusb: add new custom firmwares
    a8c7343e2a04 Bluetooth: btusb: MT7920: Add VID/PID 0489/e135
    c5f173e20fdd Bluetooth: btusb: MT7922: Add VID/PID 0489/e170
    112a000505b8 Bluetooth: btusb: Add new VID/PID 2b89/6275 for RTL8761BUV
    ee63729760f5 ksmbd: vfs: fix race on m_flags in vfs_cache
    063cbbc6f595 ksmbd: fix use-after-free in ksmbd_tree_connect_put under concurrency
    d8c5009bf41d smb/server: fix return value of smb2_ioctl()
    32c3960b4212 gfs2: Fix "gfs2: Switch to wait_event in gfs2_quotad"
    a2046f5916c2 gfs2: fix remote evict for read-only filesystems
    66e2f3c1aefe hfsplus: fix volume corruption issue for generic/101
    306d8449af7c btrfs: scrub: always update btrfs_scrub_progress::last_physical
    f5323b43019d wifi: brcmfmac: Add DMI nvram filename quirk for Acer A1 840 tablet
    9c6f9b2a80ed wifi: mt76: mt792x: fix wifi init fail by setting MCU_RUNNING after CLC load
    0283fac52b42 wifi: cfg80211: use cfg80211_leave() in iftype change
    c3ab9657866f wifi: cfg80211: stop radar detection in cfg80211_leave()
    40257a2ef1bc wifi: rtl8xxxu: Fix HT40 channel config for RTL8192CU, RTL8723AU
    d5fb4e2c9bb0 fs/ntfs3: check for shutdown in fsync
    282214ddf847 hfsplus: fix volume corruption issue for generic/073
    91f114bffa36 hfsplus: Verify inode mode when loading from disk
    5882e7c8cdbb hfsplus: fix missing hfs_bnode_get() in __hfs_bnode_create
    772e0a8809f1 hfsplus: fix volume corruption issue for generic/070
    b3c151fe8f54 ntfs: set dummy blocksize to read boot_block when mounting
    f44e3d622d74 kbuild: Use objtree for module signing key path
    5859a556db4b fs/ntfs3: Support timestamps prior to epoch
    1c553c454f54 crypto: ccp - Add support for PCI device 0x115A
    c9266cafb277 livepatch: Match old_sympos 0 and 1 in klp_find_func()
    ab665eb99971 scripts: kdoc_parser.py: warn about Python version only once
    3ef4a51315a9 x86/microcode: Mark early_parse_cmdline() as __init
    63859f6da00d cpuidle: menu: Use residency threshold in polling state override decisions
    e486de4c945d cpufreq: s5pv210: fix refcount leak
    f916f071e41c ACPI: fan: Workaround for 64-bit firmware bug
    3d9ecabe2953 cpufreq: dt-platdev: Add JH7110S SOC to the allowlist
    29014a19d417 ACPI: property: Use ACPI functions in acpi_graph_get_next_endpoint() only
    f91dad0a3b38 ACPICA: Avoid walking the Namespace if start_node is NULL
    bb4c2f559e57 x86/ptrace: Always inline trivial accessors
    aab3236ff1da sched/fair: Revert max_newidle_lb_cost bump
    3ed049fbfb4d sched/deadline: only set free_cpus for online runqueues
    43c2e5c2acaa perf/x86/amd: Check event before enable to avoid GPF
    ec73412f61d3 scripts/faddr2line: Fix "Argument list too long" error
    bfa4924cbc52 iomap: account for unaligned end offsets when truncating read range
    142194fb21af iomap: adjust read range correctly for non-block-aligned positions
    4642686699a4 shmem: fix recovery on rename failures
    6fd59082b626 btrfs: fix changeset leak on mmap write after failure to reserve metadata
    6564f76a9efe btrfs: fix memory leak of fs_devices in degraded seed device path
    d0e177e176e7 bpf: Fix verifier assumptions of bpf_d_path's output buffer
    b7a2957ace3d bpf: Fix truncated dmabuf iterator reads
    75fffc9fef36 bpf, arm64: Do not audit capability check in do_jit()
    f79a80c7fc06 btrfs: fix a potential path leak in print_data_reloc_error()
    815abd170966 btrfs: do not skip logging new dentries when logging a new name
    78d82960b939 Linux 6.18.2
    1823e08f76c6 ALSA: wavefront: Fix integer overflow in sample size validation
    590bd2a7acba ALSA: wavefront: Clear substream pointers on close
    343fa9800cf9 ALSA: hda: cs35l41: Fix NULL pointer dereference in cs35l41_hda_read_acpi()
    3646c928bb77 ALSA: hda/tas2781: fix speaker id retrieval for multiple probes
    acacb5b7109a ALSA: hda/realtek: Add match for ASUS Xbox Ally projects
    1e1b3207a53e ALSA: dice: fix buffer overflow in detect_stream_formats()
    d6d0caff738f usb: dwc3: dwc3_power_off_all_roothub_ports: Use ioremap_np when required
    a880ef71a1c8 usb: typec: ucsi: fix use-after-free caused by uec->work
    6507f1810d3c usb: phy: Initialize struct usb_phy list_head
    a902fc01813a usb: typec: ucsi: fix probe failure in gaokun_ucsi_probe()
    93193a1a0077 usb: gadget: tegra-xudc: Always reinitialize data toggle when clear halt
    1f2f0ff3cacb efi/cper: align ARM CPER type with UEFI 2.9A/2.10 specs
    742082e59fcc efi/cper: Adjust infopfx size to accept an extra space
    a980fec3d5eb efi/cper: Add a new helper function to print bitmasks
    67d5a5e20259 perf/x86/intel: Fix NULL event dereference crash in handle_pmi_common()
    f2091f479f5b ocfs2: fix memory leak in ocfs2_merge_rec_left()
    d0fab03390ae cpu: Make atomic hotplug callbacks run with interrupts disabled on UP
    efd65e2e2fd9 irqchip/mchp-eic: Fix error code in mchp_eic_domain_alloc()
    da07fa873059 perf/core: Fix missing read event generation on task exit
    35287d31e083 scsi: ufs: core: Fix an error handler crash
    9e434426cc23 scsi: imm: Fix use-after-free bug caused by unfinished delayed work
    ea98ced74f50 dm log-writes: Add missing set_freezable() for freezable kthread
    992710902de4 dm-raid: fix possible NULL dereference with undefined raid type
    f80cf70de912 ASoC: amd: acp: update tdm channels for specific DAI
    ef0cd7b69492 block: Use RCU in blk_mq_[un]quiesce_tagset() instead of set->tag_list_lock
    97ee36e58a8c drm/i915/fbdev: Hold runtime PM ref during fbdev BO creation
    cabc9d26c06f drm/{i915, xe}/fbdev: deduplicate struct drm_mode_fb_cmd2 init
    6f36ae55d245 drm/{i915, xe}/fbdev: pass struct drm_device to intel_fbdev_fb_alloc()
    bc600ef08326 drm/i915/fbdev: make intel_framebuffer_create() error return handling explicit
    c287d34592cc drm/xe/fbdev: use the same 64-byte stride alignment as i915
    fb074e5c4f3e ARM: 9464/1: fix input-only operand modification in load_unaligned_zeropad()
    8f9e51cf2a2a ALSA: firewire-motu: add bounds check in put_user loop for DSP events
    d48f75972d39 regulator: spacemit: Align input supply name with the DT binding
    4a7915a26d19 rtc: max31335: Fix ignored return value in set_alarm
    f67ae28e9ac3 rtc: gamecube: Check the return value of ioremap()
    0c1239fb5c42 drm/amdkfd: Use huge page size to check split svm range alignment
    4058530b4294 ALSA: uapi: Fix typo in asound.h comment
    d8fae0475d95 dma/pool: eliminate alloc_pages warning in atomic_pool_expand
    bfef208916d7 i2c: spacemit: fix detect issue
    581a9f4c1cd8 docs: hwmon: fix link to g762 devicetree binding
    f81f7e1344c4 gpio: tb10x: fix OF_GPIO dependency
    829adc469a18 nfs/localio: remove 61 byte hole from needless ____cacheline_aligned
    1959d1265e24 nfs/localio: remove alignment size checking in nfs_is_local_dio_possible
    5dfdc0ba0544 cifs: Fix handling of a beyond-EOF DIO/unbuffered read over SMB2
    c61af12157ef cifs: Fix handling of a beyond-EOF DIO/unbuffered read over SMB1
    ec8ccaa4d33e drm/nouveau: fix circular dep oops from vendored i2c encoder
    731e1beb10c4 drm/nouveau: refactor deprecated strcpy
    cdda0d06f865 ALSA: firewire-motu: fix buffer overflow in hwdep read for DSP events
    8fee481ee6c0 regulator: fixed: Rely on the core freeing the enable GPIO
    bc6761c02255 drm/plane: Fix IS_ERR() vs NULL check in drm_plane_create_hotspot_properties()
    0e777da54152 io_uring/kbuf: use READ_ONCE() for userspace-mapped memory
    6a960b58df61 nvme-auth: use kvfree() for memory allocated with kvcalloc()
    7193407bc445 block: fix memory leak in __blkdev_issue_zero_pages
    2864db01b3e5 block: fix comment for op_is_zone_mgmt() to include RESET_ALL
    0accacccba19 drm/panel: novatek-nt35560: avoid on-stack device structure
    7b9187711394 blk-mq: Abort suspend when wakeup events are pending
    6acd144fa8b1 f2fs: revert summary entry count from 2048 to 512 in 16kb block support
    9a3192f81819 ASoC: ak5558: Disable regulator when error happens
    a15353ac167f ASoC: ak4458: Disable regulator when error happens
    a52d027b4d6b ASoC: amd: acp: Audio is not resuming after s0ix
    488ef9dd5c09 ASoC: bcm: bcm63xx-pcm-whistler: Check return value of of_dma_configure()
    2606e7e090fe platform/x86: asus-wmi: use brightness_set_blocking() for kbd led
    c3430e94a0a2 fs/nls: Fix inconsistency between utf8_to_utf32() and utf32_to_utf8()
    6d335d8a26bf NFS: Fix inheritance of the block sizes when automounting
    df9b003a2eca NFS: Automounted filesystems should inherit ro,noexec,nodev,sync flags
    c30cb13edcbf Revert "nfs: ignore SB_RDONLY when mounting nfs"
    10d58baf7d0e Revert "nfs: clear SB_RDONLY before getting superblock"
    699e32e42faf Revert "nfs: ignore SB_RDONLY when remounting nfs"
    c646ebff3fa5 drm/panthor: Prevent potential UAF in group creation
    38694f9aae00 NFSv4/pNFS: Clear NFS_INO_LAYOUTCOMMIT in pnfs_mark_layout_stateid_invalid
    a7d914e1f9b4 NFS: Initialise verifiers for visible dentries in _nfs4_open_and_get_state
    97b93a595be0 NFS: Initialise verifiers for visible dentries in nfs_atomic_open()
    32b7ba23b4df NFS: Initialise verifiers for visible dentries in readdir and lookup
    4836f912acc7 fs/nls: Fix utf16 to utf8 conversion
    f0f456c327f5 NFS: Avoid changing nlink when file removes and attribute updates race
    530f1ba28793 kbuild: install-extmod-build: Properly fix CC expansion when ccache is used
    2e1c79299036 rtc: amlogic-a4: fix double free caused by devm
    b18d3c3ce852 f2fs: maintain one time GC mode is enabled during whole zoned GC cycle
    52eb1c76c0dc platform/x86:intel/pmc: Update Arrow Lake telemetry GUID
    41a59772b500 sched/core: Fix psi_dequeue() for Proxy Execution
    8061d3b7bb91 sched/fair: Fix unfairness caused by stalled tg_load_avg_contrib when the last task migrates out
    fe9a3154bb5b 9p: fix cache/debug options printing in v9fs_show_options
    15a6572117f0 fbdev: ssd1307fb: fix potential page leak in ssd1307fb_probe()
    850f134a4c81 perf stat: Allow no events to open if this is a "--null" run
    b9ceff1ca3ef pinctrl: single: Fix incorrect type for error return variable
    654841dd211b perf hist: In init, ensure mem_info is put on error paths
    badf751a785d perf kvm: Fix debug assertion
    501a16c1ddb2 perf tools: Fix split kallsyms DSO counting
    30f874b8a92f perf tools: Mark split kallsyms DSOs as loaded
    88fc3dd6e631 exfat: fix divide-by-zero in exfat_allocate_bitmap
    d009ff8959d2 exfat: fix refcount leak in exfat_find
    bd4da8f59dbb perf jitdump: Add sym/str-tables to build-ID generation
    3ed6c458530a net/sched: sch_cake: Fix incorrect qlen reduction in cake_drop
    1ce413fd4d04 net: dsa: xrs700x: reject unsupported HSR configurations
    4a7f375f625d net: hsr: create an API to get hsr port type
    b07e2f191d88 net: dsa: b53: fix BCM5325/65 ARL entry VIDs
    0d0116335eba net: dsa: b53: fix BCM5325/65 ARL entry multicast port masks
    8e881dfd5255 net: dsa: b53: add support for bcm63xx ARL entry format
    e5a6a2475901 net: dsa: b53: fix CPU port unicast ARL entries for BCM5325/65
    e23860a4bf1e net: dsa: b53: use same ARL search result offset for BCM5325/65
    c15c2c2b72ac net: dsa: b53: add support for 5389/5397/5398 ARL entry format
    4e8f43e63878 net: dsa: b53: move ARL entry functions into ops struct
    e0c63c85e007 net: dsa: b53: split reading search entry into their own functions
    f3affeb3c7d0 net: dsa: b53: provide accessors for accessing ARL_SRCH_CTL
    5e86ebfb4306 net: dsa: b53: move writing ARL entries into their own functions
    ed2f26bf281b net: dsa: b53: move reading ARL entries into their own function
    397fdaf790ce net: dsa: b53: b53_arl_read{,25}(): use the entry for comparision
    6f2311c6cb9f net: dsa: b53: fix extracting VID from entry for BCM5325/65
    c25b00402080 net: dsa: b53: fix VLAN_ID_IDX write size for BCM5325/65
    210226ce6ca6 um: Disable KASAN_INLINE when STATIC_LINK is selected
    0a1254e59754 smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in recv_done() and smbd_conn_upcall()
    7c4f55905cfb smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in recv_done() and smb_direct_cm_handler()
    7d077222555e smb: smbdirect: introduce SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
    c9ae2463c529 smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
    36c6c788173e clk: keystone: fix compile testing
    61e684ef4c2b md/raid5: fix IO hang when array is broken with IO inflight
    de4a27113099 remoteproc: qcom_q6v5_wcss: fix parsing of qcom,halt-regs
    14980281ebff rqspinlock: Use trylock fallback when per-CPU rqnode is busy
    43b6c312b8ff rqspinlock: Enclose lock/unlock within lock entry acquisitions
    03ee076352cf mtd: lpddr_cmds: fix signed shifts in lpddr_cmds
    760bc6ceda8e net: netpoll: initialize work queue before error checks
    4cc8dd1aafac selftests: bonding: add delay before each xvlan_over_bond connectivity check
    f61d6d4e1508 net: phy: aquantia: check for NVMEM deferral
    cadb28f8b3fd landlock: Fix handling of disconnected directories
    addbb8ddb443 vfio/pci: Use RCU for error/request triggers to avoid circular locking
    3e2fc1e57a53 arm64/pageattr: Propagate return value from __change_memory_common
    81841da1f30f spi: ch341: fix out-of-bounds memory access in ch341_transfer_one
    44309fda9c60 mtd: rawnand: renesas: Handle devm_pm_runtime_enable() errors
    3a11d8ae00c9 net: stmmac: fix rx limit check in stmmac_rx_zc()
    4ac26aafdc8c net: vxlan: prevent NULL deref in vxlan_xmit_one
    6d080f810ffd iavf: Implement settime64 with -EOPNOTSUPP
    77ea3d8ac3d3 netfilter: nft_connlimit: update the count if add was skipped
    f6904ed15ed1 netfilter: nf_conncount: rework API to use sk_buff directly
    87a453f31c63 netfilter: flowtable: check for maximum number of encapsulations in bridge vlan
    3c0493f81dfa Reinstate "resource: avoid unnecessary lookups in find_next_iomem_res()"
    f2888bfb9003 arm64: dts: mediatek: mt8195: Fix address range for JPEG decoder core 1
    64099b5c0aeb regulator: core: Protect regulator_supply_alias_list with regulator_list_mutex
    ed3cc640b4f1 ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip during system suspend
    b4eb208dee57 ARM: dts: samsung: exynos4210-trats: turn off SDIO WLAN chip during system suspend
    ad3e7ec8e21e ARM: dts: samsung: exynos4210-i9100: turn off SDIO WLAN chip during system suspend
    104a6ed7a4c0 ARM: dts: samsung: universal_c210: turn off SDIO WLAN chip during system suspend
    1f11f4e8b7f7 soc: samsung: exynos-pmu: Fix structure initialization
    749c2b72a2ba spi: airoha-snfi: en7523: workaround flash damaging if UART_TXD was short to GND
    a2f79598c6c1 ASoC: Intel: catpt: Fix error path in hw_params()
    9223cdb994d9 virtio: clean up features qword/dword terms
    ce46f6a8d624 vdpa/pds: use %pe for ERR_PTR() in event handler registration
    09853ba0977f vhost: Fix kthread worker cgroup failure handling
    ba8a48b7be20 vdpa/mlx5: Fix incorrect error code reporting in query_virtqueues
    d94497989a9c virtio: fix map ops comment
    99ae54bbb475 virtio: fix virtqueue_set_affinity() docs
    5fdd8443c0a4 virtio: standardize Returns documentation style
    ed4dade6223d virtio: fix grammar in virtio_map_ops docs
    6c5dfc6f33de virtio: fix grammar in virtio_queue_info docs
    e3e6c543e695 virtio: fix whitespace in virtio_config_ops
    201ca193b492 virtio: fix typo in virtio_device_ready() comment
    a8d39a172781 virtio: fix kernel-doc for mapping/free_coherent functions
    3c30975c9aba virtio_vdpa: fix misleading return in void function
    1b70f280c39e of: Skip devicetree kunit tests when RISCV+ACPI doesn't populate root node
    2a3f91ef20ec selftests/net: packetdrill: pass send_omit_free to MSG_ZEROCOPY tests
    a537ffa7f44b ext4: improve integrity checking in __mb_check_buddy by enhancing order-0 validation
    f0022551745d bpf: Fix exclusive map memory leak
    c1b149b698e2 selftests/landlock: Fix makefile header list
    4e2a8fb1ce6c ublk: prevent invalid access with DEBUG
    7639d3983166 ACPI: processor_core: fix map_x2apic_id for amd-pstate on am4
    17fc4443ee12 hwmon: sy7636a: Fix regulator_enable resource leak on error path
    627a55ec0039 drm/amdkfd: assign AID to uuid in topology for SPX mode
    843bdaf0bfdd drm/amd/display: Fix logical vs bitwise bug in get_embedded_panel_info_v2_1()
    2f4f72e580b5 misc: rp1: Fix an error handling path in rp1_probe()
    e901d77f8994 fs: lift the FMODE_NOCMTIME check into file_update_time_flags
    eda80f733fbd fs: refactor file timestamp update logic
    2f62a4e39588 greybus: gb-beagleplay: Fix timeout handling in bootloader functions
    c9083b2fce6b firmware_loader: make RUST_FW_LOADER_ABSTRACTIONS select FW_LOADER
    ee0fa63171ba ASoC: fsl_xcvr: clear the channel status control memory
    49e7347f4644 gfs2: Prevent recursive memory reclaim
    79bc3bdf36bc ASoC: nau8325: add missing build config
    1123b37d8947 ASoC: codecs: nau8325: Silence uninitialized variables warnings
    4876a36bc639 ASoC: nau8325: use simple i2c probe function
    110337fa5f06 clocksource/drivers/nxp-stm: Prevent driver unbind
    755927ae1769 clocksource/drivers/nxp-stm: Fix section mismatches
    7da0b7f66a20 clocksource/drivers/nxp-pit: Prevent driver unbind
    364752785f7d clocksource/drivers/arm_arch_timer_mmio: Prevent driver unbind
    9876d55a0445 clocksource/drivers/stm: Fix double deregistration on probe failure
    cbc8d54c7313 clocksource/drivers/ralink: Fix resource leaks in init error path
    0a3d0e948663 drm/panthor: Avoid adding of kernel BOs to extobj list
    46cd9849e520 arm64: dts: amlogic: meson-g12b: Fix L2 cache reference for S922X CPUs
    73573f7e5284 RDMA/irdma: Fix SRQ shadow area address initialization
    63f755a2ef55 RDMA/irdma: Remove doorbell elision logic
    951870eee2dc RDMA/irdma: Do not set IBK_LOCAL_DMA_LKEY for GEN3+
    aac0552d66c2 RDMA/irdma: Do not directly rely on IB_PD_UNSAFE_GLOBAL_RKEY
    4b71f69c4914 RDMA/irdma: Add missing mutex destroy
    b0258b9ecbc0 RDMA/irdma: Fix SIGBUS in AEQ destroy
    e0331f477c19 RDMA/irdma: Add a missing kfree of struct irdma_pci_f for GEN2
    4b8abcc87373 RDMA/irdma: Fix data race in irdma_free_pble
    118894098d4e RDMA/irdma: Fix data race in irdma_sc_ccq_arm
    cefb67ea27f9 iommu/arm-smmu-qcom: Enable use of all SMR groups when running bare-metal
    57c6cea2073c backlight: lp855x: Fix lp855x.h kernel-doc warnings
    08c9dc6b0f2c backlight: led-bl: Add devlink to supplier LEDs
    ad26a7ef0488 wifi: ieee80211: correct FILS status codes
    c67775cf0da2 iomap: allocate s_dio_done_wq for async reads as well
    74c0c1af04ee iomap: always run error completions in user context
    f8a794ea740d um: Don't rename vmap to kernel_vmap
    60ac9e5820b9 drm/nouveau: restrict the flush page to a 32-bit address
    644ddd0d96d1 PCI: dwc: Fix wrong PORT_LOGIC_LTSSM_STATE_MASK definition
    f5190da518be btrfs: fix leaf leak in an error path in btrfs_del_items()
    d65f49f772cf btrfs: make sure extent and csum paths are always released in scrub_raid56_parity_stripe()
    742b90eaf394 btrfs: fix racy bitfield write in btrfs_clear_space_info_full()
    364685c4c2d9 btrfs: fix double free of qgroup record after failure to add delayed ref head
    3b796d3f16c1 selftests/bpf: Allow selftests to build with older xxd
    489a8f559faf bpftool: Allow bpftool to build with openssl < 3
    3d12cc5d13f6 iommu/arm-smmu-v3: Fix error check in arm_smmu_alloc_cd_tables
    56296da5e6bf staging: fbtft: core: fix potential memory leak in fbtft_probe_common()
    1bdf06f25a49 firmware: stratix10-svc: fix make htmldocs warning for stratix10_svc
    4d42aba0ee49 mt76: mt7615: Fix memory leak in mt7615_mcu_wtbl_sta_add()
    f4c57afff3b0 wifi: mt76: mt7996: Add missing locking in mt7996_mac_sta_rc_work()
    abdedd46dc58 wifi: mt76: mt7996: skip ieee80211_iter_keys() on scanning link remove
    c319967690d4 wifi: mt76: mt7996: skip deflink accounting for offchannel links
    70656b45467c wifi: mt76: Move mt76_abort_scan out of mt76_reset_device()
    46f0648e261c wifi: mt76: mt7996: grab mt76 mutex in mt7996_mac_sta_event()
    b4b789d24319 wifi: mt76: mt7996: fix EMI rings for RRO
    1a4b481a21ae wifi: mt76: mt7996: fix using wrong phy to start in mt7996_mac_restart()
    7d6cd8f51ad8 wifi: mt76: mt7996: fix MLO set key and group key issues
    9a43ed9ab800 wifi: mt76: mt7996: fix MLD group index assignment
    e5c42efeb162 wifi: mt76: mt7996: set link_valid field when initializing wcid
    d64e6f27260e wifi: mt76: mt7996: fix teardown command for an MLD peer
    ee94375d06b5 wifi: mt76: mt7996: fix several fields in mt7996_mcu_bss_basic_tlv()
    95bb36f8d6b3 wifi: mt76: mt7996: fix implicit beamforming support for mt7992
    74bb080717a3 wifi: mt76: mt7996: fix max nss value when getting rx chainmask
    2cde732373a7 Revert "wifi: mt76: mt792x: improve monitor interface handling"
    d2d11298dfc3 wifi: mt76: mt7996: Remove useless check in mt7996_msdu_page_get_from_cache()
    d582d0e988d6 wifi: mt76: wed: use proper wed reference in mt76 wed driver callabacks
    cbeca0b7ea20 wifi: mt76: mt7996: Remove unnecessary link_id checks in mt7996_tx
    b8f34c1c5c4f wifi: mt76: mt7996: fix null pointer deref in mt7996_conf_tx()
    791520a8e54e ASoC: tas2781: correct the wrong period
    23ca40088490 ASoC: tas2781: Correct the wrong chip ID for reset variable check
    fd9c3a1c963f crypto: ahash - Zero positive err value in ahash_update_finish
    aa9dc3d80dd5 crypto: ahash - Fix crypto_ahash_import with partial block data
    ce649d74650a RDMA/bnxt_re: Pass correct flag for dma mr creation
    32fdf021f6c9 RDMA/bnxt_re: Fix the inline size for GenP7 devices
    620472e6b303 erofs: limit the level of fs stacking for file-backed mounts
    46198ad00429 erofs: correct FSDAX detection
    1fa7e6e78bd6 RISC-V: KVM: Fix guest page fault within HLV* instructions
    469b0b8ce088 PM / devfreq: hisi: Fix potential UAF in OPP handling
    2873d804b4f3 crypto: ccree - Correctly handle return of sg_nents_for_len
    9b3f71cf02e0 crypto: starfive - Correctly handle return of sg_nents_for_len
    a6c22c91b628 bpf: properly verify tail call behavior
    982ef82af998 selftests/bpf: Update test_tag to use sha256
    a8cf555fd773 selftests/bpf: Improve reliability of test_perf_branches_no_hw()
    833e49fa2dd4 selftests/bpf: skip test_perf_branches_hw() on unsupported platforms
    93787117dcf1 regulator: pca9450: Fix error code in probe()
    442f55d47d58 usb: raw-gadget: cap raw_io transfer length to KMALLOC_MAX_SIZE
    dda165e3be9d usb: dwc2: fix hang during suspend if set as peripheral
    cc0d2b85447c usb: dwc2: fix hang during shutdown if set as peripheral
    3681b60224e8 usb: chaoskey: fix locking for O_NONBLOCK
    32952c4f4d1b ima: Handle error code returned by ima_filter_rule_match()
    97ee9b4f32c8 rtla: Fix -a overriding -t argument
    93409bddc50b rtla/tests: Fix osnoise test calling timerlat
    89f6fb920e2c rtla/tests: Extend action tests to 5s
    22b5096abc98 RAS: Report all ARM processor CPER information to userspace
    5ebf0fe7eaef wifi: rtl818x: rtl8187: Fix potential buffer underflow in rtl8187_rx_cb()
    ee5b0b28c993 clk: spacemit: Set clk_hw_onecell_data::num before using flex array
    04c79e05e13c cpuset: Treat cpusets in attaching as populated
    872b3ffc5107 net: phy: adin1100: Fix software power-down ready condition
    59bea0e26b8c selftests/bpf: Use ASSERT_STRNEQ to factor in long slab cache names
    340a73d8b664 ASoC: SDCA: Fix missing dash in HIDE DisCo property
    fd6835c98ea6 phy: rockchip: samsung-hdptx: Prevent Inter-Pair Skew from exceeding the limits
    348c9b3d47a6 phy: rockchip: samsung-hdptx: Reduce ROPLL loop bandwidth
    26efe0db47e5 phy: rockchip: samsung-hdptx: Fix reported clock rate in high bpc mode
    a614c316a8c2 phy: freescale: Initialize priv->lock
    b36ba24f7d6d phy: rockchip: naneng-combphy: Fix PCIe L1ss support RK3562
    c6dda44381ed phy: rockchip: naneng-combphy: Fix PCIe L1ss support RK3528
    97525d3a7f8b phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
    ae5f4c7397d0 leds: rgb: leds-qcom-lpg: Don't enable TRILED when configuring PWM
    0d8e2c04a2ec of/fdt: Fix incorrect use of dt_root_addr_cells in early_init_dt_check_kho()
    38c8c945c2c2 of/fdt: Fix the len check in early_init_dt_check_for_usable_mem_range()
    f326efdcab7f of/fdt: Fix the len check in early_init_dt_check_for_elfcorehdr()
    7045d5970e16 of/fdt: Consolidate duplicate code into helper functions
    d0482ca91d76 mfd: mt6358-irq: Fix missing irq_domain_remove() in error path
    f620f2a12012 mfd: mt6397-irq: Fix missing irq_domain_remove() in error path
    f75dc8cb4117 tools/rtla: Fix --on-threshold always triggering
    efdb8e298907 tools/rtla: Fix unassigned nr_cpus
    a6fb8785b179 wifi: mac80211: fix CMAC functions not handling errors
    055e892aac14 iommu/vt-d: Fix unused invalidation hint in qi_desc_iotlb
    3cf1f2364849 iommu/vt-d: Set INTEL_IOMMU_FLOPPY_WA depend on BLK_DEV_FD
    6fccca4dbebc net: phy: realtek: create rtl8211f_config_rgmii_delay()
    5fa1c8226b45 scsi: qla2xxx: Fix improper freeing of purex item
    638779b17521 scsi: ufs: rockchip: Reset controller on PRE_CHANGE of hce enable notify
    f4b45dc5eeb3 pwm: bcm2835: Make sure the channel is enabled after pwm_request()
    1ade1edef373 perf arm_spe: Fix memset subclass in operation
    3e5b25da0b41 ipv6: clear RA flags when adding a static route
    77d179867bcc spi: sophgo: Fix incorrect use of bus width value macros
    d8995c4d86ac drm/msm/a6xx: Improve MX rail fallback in RPMH vote init
    e24720c82338 drm/msm/a6xx: Fix the gemnoc workaround
    45ca97e4ec9b drm/msm/a6xx: Flush LRZ cache before PT switch
    295ba29e49f6 drm/mediatek: Fix CCORR mtk_ctm_s31_32_to_s1_n function issue
    4a3a5c2e93c7 fs/ntfs3: Prevent memory leaks in add sub record
    169361f0e0bc fs/ntfs3: out1 also needs to put mi
    11e221124be0 net: stmmac: Fix VLAN 0 deletion in vlan_del_hw_rx_fltr()
    6b405443b6ab powerpc/64s/ptdump: Fix kernel_hash_pagetable dump for ISA v3.00 HPTE format
    1fcbf18558c5 powerpc/64s/hash: Restrict stress_hpt_struct memblock region to within RMA limit
    2579c356ccd3 bpf: Fix invalid prog->stats access when update_effective_progs fails
    26815698b6fb net: stmmac: dwmac-sophgo: Add phy interface filter
    d2b57ba17164 net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
    c9d1c4152e6d wifi: rtl818x: Fix potential memory leaks in rtl8180_init_rx_ring()
    9ea941e8bba6 PCI: stm32: Fix EP page_size alignment
    0e82816b6896 PCI: stm32: Fix LTSSM EP race with start link
    7b1e3cb2070e drm/msm/a2xx: stop over-complaining about the legacy firmware
    966fcbb8c803 drm/msm: fix missing NULL check after kcalloc in crashstate_get_bos()
    0bc9149da210 drm/msm: Fix NULL pointer dereference in crashstate_get_vm_logs()
    d36f07b8e590 block/blk-throttle: Fix throttle slice time for SSDs
    e5e0f94996f0 arm64: dts: imx95-tqma9596sa: reduce maximum FlexSPI frequency to 66MHz
    8f1db86ea95c arm64: dts: imx95-tqma9596sa: fix TPM5 pinctrl node name
    f677cd77319b NFSD/blocklayout: Fix minlength check in proc_layoutget
    bc2b1bbc0329 tracefs: fix a leak in eventfs_create_events_dir()
    30db8309b703 fuse_ctl_add_conn(): fix nlink breakage in case of early failure
    e1cc8886b628 iio: core: Clean up device correctly on iio_device_alloc() failure
    97d817c11450 iio: core: add missing mutex_destroy in iio_dev_release()
    4d9bebb2e9b6 watchdog: starfive: Fix resource leak in probe error path
    e2b25922e566 watchdog: wdat_wdt: Fix ACPI table leak in probe function
    ab3e7a78d83a mshv: Fix create memory region overlap check
    380805973808 mshv: Fix deposit memory in MSHV_ROOT_HVCALL
    942268e2726a bpf: Check skb->transport_header is set in bpf_skb_check_mtu
    59bad3c98cad selftests/bpf: Fix failure paths in send_signal test
    7547576c6209 bpf: Handle return value of ftrace_set_filter_ip in register_fentry
    4a9b0581757a bpf: Prevent nesting overflow in bpf_try_get_buffers
    6394fc65d7bc kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings
    07cfb9c3f6d0 PCI: Prevent resource tree corruption when BAR resize fails
    020ecb16e578 soc/tegra: fuse: speedo-tegra210: Update speedo IDs
    9c58e23af951 ps3disk: use memcpy_{from,to}_bvec index
    7102ea1e816a drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
    41ba9d25d965 arm64: dts: qcom: qrb2210-rb1: Fix UART3 wakeup IRQ storm
    036bae52e5c1 pwm: Use %u to printf unsigned int pwm_chip::npwm and pwm_chip::id
    a2fb63bc252a pwm: Simplify printf to emit chip->npwm in $debugfs/pwm
    13dcd6308cb8 s390/fpu: Fix false-positive kmsan report in fpu_vstl()
    94a9c0c42cce crypto: iaa - Fix incorrect return value in save_iaa_wq()
    42a2a70a12e4 arm64: dts: rockchip: Add eeprom vcc-supply for Radxa ROCK 3C
    63d98a936f0f arm64: dts: rockchip: Add eeprom vcc-supply for Radxa ROCK 5A
    3eeb44415063 arm64: dts: rockchip: Move the EEPROM to correct I2C bus on Radxa ROCK 5A
    ee6dda36b499 soc: renesas: rz-sysc: Populate readable_reg/writeable_reg in regmap config
    58f2087a7ccd soc: renesas: r9a09g056-sys: Populate max_register
    59a8b59c5a49 PCI: keystone: Exit ks_pcie_probe() for invalid mode
    4a03d69cece1 bpf: Free special fields when update [lru_,]percpu_hash maps
    2f13baf62bbd accel/amdxdna: Fix deadlock between context destroy and job timeout
    677b91705b35 accel/amdxdna: Clear mailbox interrupt register during channel creation
    8e2121a40c39 arm64/mm: Allow __create_pgd_mapping() to propagate pgtable_alloc() errors
    659dd9c8cd59 leds: netxbig: Fix GPIO descriptor leak in error paths
    54a7e8311274 scsi: sim710: Fix resource leak by adding missing ioport_unmap() calls
    5c1fb3fd05da scsi: qla2xxx: Clear cmds after chip reset
    b47b1e1889c8 ACPI: property: Fix fwnode refcount leak in acpi_fwnode_graph_parse_endpoint()
    d7ea2b4d0b70 ocfs2: use correct endian in ocfs2_dinode_has_extents
    e5c52c320577 ocfs2: relax BUG() to ocfs2_error() in __ocfs2_move_extent()
    e0a7eab9165a lib/vsprintf: Check pointer before dereferencing in time_and_date()
    8cacdb0f0bca clk: renesas: r9a06g032: Fix memory leak in error path
    0dcbf7d6e901 clk: renesas: r9a09g077: Propagate rate changes to parent clocks
    4dd34a24b68e drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook
    b1d4bb43691c drm/tidss: Remove max_pclk_khz and min_pclk_khz from tidss display features
    b2abcb89865b perf tools: Fix missing feature check for inherit + SAMPLE_READ
    e485e76864b6 coresight: etm4x: Properly control filter in CPU idle with FEAT_TRF
    2daa7706a000 coresight: etm4x: Add context synchronization before enabling trace
    352faa1d6387 coresight: etm4x: Correct polling IDLE bit
    9698a89977fb coresight: etm3x: Always set tracer's device mode on target CPU
    e45178e98848 coresight: etm4x: Always set tracer's device mode on target CPU
    4305e94270fa coresight: Change device mode to atomic type
    192e8ce302f1 fs/ntfs3: Initialize allocated memory before use
    4717e7860649 io_uring/zcrx: call netdev_queue_get_dma_dev() under instance lock
    de11c3e5908b net: export netdev_get_by_index_lock()
    c9e805f6a35d nbd: defer config unlock in nbd_genl_connect
    51b823d7723f wifi: cw1200: Fix potential memory leak in cw1200_bh_rx_helper()
    48a7d427eb65 macintosh/mac_hid: fix race condition in mac_hid_toggle_emumouse
    74e9f302f31f powerpc/32: Fix unpaired stwcx. on interrupt exit
    f834bd9fb83e powerpc/kdump: Fix size calculation for hot-removed memory ranges
    990016bd5d02 cpufreq/amd-pstate: Call cppc_set_auto_sel() only for online CPUs
    9d37fe37dfa0 md: init bioset in mddev_init
    a66e5f556bd7 md: delete md_redundancy_group when array is becoming inactive
    cd2898f0fd8e scsi: ufs: core: fix incorrect buffer duplication in ufshcd_read_string_desc()
    ee8b0b284ccf drm/panthor: Fix potential memleak of vma structure
    ab5e8ebeee1c ntfs3: init run lock for extend inode
    d0c9effd82f2 coresight: tmc: add the handle of the event to the path
    131097fe8b7d ARM: dts: stm32: stm32mp157c-phycore: Fix STMPE811 touchscreen node properties
    8ccdf3a6cde1 RDMA/rtrs: server: Fix error handling in get_or_create_srv
    83f23bf28e1b dt-bindings: PCI: amlogic: Fix the register name of the DBI region
    986d67f2d72a iio: imu: bmi270: fix dev_err_probe error msg
    e463548fd80e staging: most: remove broken i2c driver
    1a5c5a2f88e8 scsi: smartpqi: Fix device resources accessed after device removal
    f7c6c26a9977 scsi: stex: Fix reboot_notifier leak in probe error path
    742012f6bf29 nbd: defer config put in recv_work
    f0fae1debeb9 md: avoid repeated calls to del_gendisk
    f98b191f7812 md: fix rcu protection in md_wakeup_thread
    59392f424f84 md: delete mddev kobj before deleting gendisk kobj
    10be1301ae69 regulator: core: disable supply if enabling main regulator fails
    16d8e53a8f78 perf/x86/intel: Correct large PEBS flag check
    6b089028bff1 perf/x86: Fix NULL event access and potential PEBS record loss
    e2a1f510e599 io_uring: use WRITE_ONCE for user shared memory
    b9422f46d9c5 arm64: dts: rockchip: Fix USB Type-C host mode for Radxa ROCK 5B+/5T
    40a1e0142096 hfs: fix potential use after free in hfs_correct_next_unused_CNID()
    ba2726d43d3b accel/amdxdna: Fix dma_fence leak when job is canceled
    c94c069c0b12 ext4: correct the checking of quota files before moving extents
    c7ca777c5879 wifi: ath12k: Fix timeout error during beacon stats retrieval
    9922a95abfc1 mfd: da9055: Fix missing regmap_del_irq_chip() in error path
    87cc6fe79c3e wifi: rtw89: usb: fix leak in rtw89_usb_write_port()
    bcf44fe565bf wifi: rtw89: usb: use common error path for skbs in rtw89_usb_rx_handler()
    9253f39bcf9a locktorture: Fix memory leak in param_set_cpumask()
    a89d6e83f0e8 efi/libstub: Fix page table access in 5-level to 4-level paging transition
    ac3cd83b02c7 x86/boot: Fix page table access in 5-level to 4-level paging transition
    cda077a19f5c coresight: ETR: Fix ETR buffer use-after-free issue
    414c982faffa arm64: tegra: Add pinctrl definitions for pcie-ep nodes
    040ce00735c1 entry,unwind/deferred: Fix unwind_reset_info() placement
    a1b7235ba438 ARM: dts: omap3: n900: Correct obsolete TWL4030 power compatible
    ecd2c6686f49 ARM: dts: omap3: beagle-xm: Correct obsolete TWL4030 power compatible
    97f035128363 ARM: dts: am335x-netcom-plus-2xx: add missing GPIO labels
    29e886ee371b ARM: dts: am33xx: Add missing serial console speed
    b454e6282cbf libbpf: Fix parsing of multi-split BTF
    01bbf25c7672 spi: tegra210-quad: Fix timeout handling
    83143f9df885 cleanup: fix scoped_class()
    0ec4aaf5f3f5 iommu/amd: Fix potential out-of-bounds read in iommu_mmio_show
    e31c902d7854 ns: initialize ns_list_node for initial namespaces
    ad804f43873a ns: add NS_COMMON_INIT()
    6a6f1e983edc firmware: ti_sci: Set IO Isolation only if the firmware is capable
    0612704b6f6d drm/panthor: Fix UAF on kernel BO VA nodes
    05bfa79dec11 drm/panthor: Fix race with suspend during unplug
    6c1da9ae2c12 drm/panthor: Fix UAF race between device unplug and FW event processing
    1ec19ea88284 drm/panthor: Fix group_free_queue() for partially initialized queues
    1292bd488a81 drm/panthor: Handle errors returned by drm_sched_entity_init()
    1254303ef82c fs/9p: Don't open remote file with APPEND mode when writeback cache is used
    8d11a6c811a5 scsi: target: Fix LUN/device R/W and total command stats
    e4a462b4e996 scsi: target: Do not write NUL characters into ASCII configfs output
    fb8f2b55a101 power: supply: apm_power: only unset own apm_get_power_status
    69675b2d6041 power: supply: qcom_battmgr: support disabling charge control
    2614ebcf2bca power: supply: qcom_battmgr: clamp charge control thresholds
    eade8ea73b91 power: supply: wm831x: Check wm831x_set_bits() return value
    a77929363637 power: supply: rt9467: Prevent using uninitialized local variable in rt9467_set_value_from_ranges()
    52d3f2076122 power: supply: rt9467: Return error on failure in rt9467_set_value_from_ranges()
    1cea1ca5e8d4 power: supply: max17040: Check iio_read_channel_processed() return code
    97ec116a7e57 power: supply: cw2015: Check devm_delayed_work_autocancel() return code
    8c473255e5ee power: supply: rt5033_charger: Fix device node reference leaks
    d4b3a4c2aa7b timers/migration: Fix imbalanced NUMA trees
    cc25b81fe0ea timers/migration: Remove locking on group connection
    e21665bac15c timers/migration: Convert "while" loops to use "for"
    d7eaed82c21e clk: qcom: tcsrcc-glymur: Update register offsets for clock refs
    d733e1e6ed71 perf record: skip synthesize event when open evsel failed
    8d88ab9f2088 perf lock contention: Load kernel map before lookup
    76103ac4b4b9 drm/imagination: Fix reference to devm_platform_get_and_ioremap_resource()
    d41ba8c6f667 cgroup: add cgroup namespace to tree after owner is set
    e620258d7d5e arm64: dts: renesas: sparrow-hawk: Fix full-size DP connector node name and labels
    18fe7b456f99 interconnect: debugfs: Fix incorrect error handling for NULL path
    14700e6b28f3 accel/amdxdna: Fix incorrect command state for timed out job
    30f32fa4d233 arm64: dts: qcom: msm8996: add interconnect paths to USB2 controller
    3fcb47f405e9 interconnect: qcom: msm8996: add missing link to SLAVE_USB_HS
    e442e820e953 wifi: ath12k: unassign arvif on scan vdev create failure
    41b623129175 wifi: ath12k: enforce vdev limit in ath12k_mac_vdev_create()
    4f93750fa588 wifi: ath12k: fix error handling in creating hardware group
    36faecac7a2c wifi: ath12k: fix reusing m3 memory
    d0bb3db7b295 wifi: ath12k: fix potential memory leak in ath12k_wow_arp_ns_offload()
    cbd5021199db random: use offstack cpumask when necessary
    8ddff9989f06 i3c: master: svc: Prevent incomplete IBI transaction
    c704ccb558ee i3c: fix refcount inconsistency in i3c_master_register
    670b96964730 arm64: dts: ti: k3-j784s4: Fix I2C pinmux pull configuration
    ae7a542dbab5 pidfs: add missing BUILD_BUG_ON() assert on struct pidfd_info
    eab1b59664ee pidfs: add missing PIDFD_INFO_SIZE_VER1
    d71333ffdd37 accel/ivpu: Fix race condition when unbinding BOs
    48efc0303ac9 drm: nova: select NOVA_CORE
    3dc8f5c1956b pinctrl: stm32: fix hwspinlock resource leak in probe function
    921eed200c8f soc: qcom: smem: fix hwspinlock resource leak in probe error paths
    4e45bd3f95fa clk: qcom: gcc-qcs615: Update the SDCC clock to use shared_floor_ops
    aa857ba3ef52 tools/nolibc/dirent: avoid errno in readdir_r
    35eb1ae22c79 tools/nolibc/stdio: let perror work when NOLIBC_IGNORE_ERRNO is set
    22da82674af6 accel/ivpu: Remove skip of dma unmap for imported buffers
    d53bfb48f6d0 x86/dumpstack: Prevent KASAN false positive warnings in __show_regs()
    390a08dd68e6 drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
    5b56a1234223 task_work: Fix NMI race condition
    75446d62696c perf/x86/intel/cstate: Remove PC3 support from LunarLake
    4669a8db976c bpf: Fix stackmap overflow check in __bpf_get_stackid()
    8fc78e468f9e bpf: Refactor stack map trace depth calculation into helper function
    8f4e27e87096 mtd: rawnand: lpc32xx_slc: fix GPIO descriptor leak on probe error and remove
    34de3867bdfd mtd: nand: relax ECC parameter validation check
    af76d442a543 Revert "mtd: rawnand: marvell: fix layouts"
    1564c04afa92 wifi: iwlwifi: mld: add null check for kzalloc() in iwl_mld_send_proto_offload()
    3e3cb7625176 drm/amdgpu/userq: fix SDMA and compute validation
    77ac34b838e2 drm/amdgpu: add userq object va track helpers
    ee3ff9742a44 ARM: dts: renesas: r9a06g032-rzn1d400-db: Drop invalid #cells properties
    479a71edb7b3 ARM: dts: renesas: gose: Remove superfluous port property
    bc4c14a3863c RDMA/rxe: Fix null deref on srq->rq.queue after resize failure
    a10b6eb5c5e5 arm64: dts: qcom: qcm2290: Fix camss register prop ordering
    7a26bcbe469c sctp: Defer SCTP_DBG_OBJCNT_DEC() to sctp_destroy_sock().
    2cf1278e942b phy: mscc: Fix PTP for VSC8574 and VSC8572
    cc12e90519c2 perf hwmon_pmu: Fix uninitialized variable warning
    bd55d0019067 arm64: dts: qcom: sm8250-samsung-common: correct reserved pins
    21c7d04fa88d arm64: dts: qcom: sdm845-starqltechn: Fix i2c-gpio node name
    20d56cf50da2 arm64: dts: qcom: sc8280xp: Fix shifted GPI DMA channels
    a2d1270ee7ef arm64: dts: qcom: x1-dell-thena: remove dp data-lanes
    e4badd5c24f7 arm64: dts: qcom: x1-dell-thena: Add missing pinctrl for eDP HPD
    f8d49ad15f58 arm64: dts: qcom: qcm6490-shift-otter: Add missing reserved-memory
    d30ffee3c9f8 arm64: dts: qcom: sm8750-mtp: move PCIe GPIOs to pcieport0 node
    436017ec6bee arm64: dts: qcom: sm8650: set ufs as dma coherent
    d9360ce07ea1 arm64: dts: qcom: qcm6490-fairphone-fp5: Add supplies to simple-fb node
    63f8119b2ca1 arm64: dts: qcom: sdm845-oneplus: Correct gpio used for slider
    f4e3cbc96b86 arm64: dts: qcom: sdm845-starqltechn: fix max77705 interrupts
    ff24f6314f1c arm64: dts: qcom: sdm845-starqltechn: remove (address|size)-cells
    6044e4081959 tools/nolibc: x86: fix section mismatch caused by asm "mem*" functions
    b5cc20b665cf arm64: dts: qcom: lemans: Add missing quirk for HS only USB controller
    7ecbc8f8b2da arm64: dts: qcom: x1e80100: Add missing quirk for HS only USB controller
    ca3630751d7f arm64: dts: qcom: x1e80100: Fix compile warnings for USB HS controller
    a705920161fb firmware: imx: scu-irq: fix OF node leak in
    01caee81ca7b arm64: dts: ti: k3-am62p: Fix memory ranges for GPU
    b8b3bdfb1076 PCI: endpoint: pci-epf-test: Fix sleeping function being called from atomic context
    2f902d08e1f3 leds: upboard: Fix module alias
    c91eee346089 ice: remove duplicate call to ice_deinit_hw() on error paths
    ac4d0d4c469c ice: move ice_deinit_dev() to the end of deinit paths
    3cef143aba04 ice: extract ice_init_dev() from ice_init()
    8cea2a81db58 ice: move ice_init_pf() out of ice_init_dev()
    6a7d04909a95 ice: move udp_tunnel_nic and misc IRQ setup into ice_init_pf()
    46d0b034b15d ice: ice_init_pf: destroy mutexes and xarrays on memory alloc failure
    0380ea173bf9 ice: move ice_init_interrupt_scheme() prior ice_init_pf()
    fa6626905668 ice: move service task start out of ice_init_pf()
    62e122809aed accel/amdxdna: Fix uninitialized return value
    d0a5b5d56438 wifi: ath12k: restore register window after global reset
    04d808a6efb5 tools/power turbostat: Regression fix Uncore MHz printed in hex
    0f984f5f8126 s390/ap: Don't leak debug feature files if AP instructions are not available
    27c62aeef710 scsi: ufs: core: Move the ufshcd_enable_intr() declaration
    1acc6fc225a9 s390/smp: Fix fallback CPU detection
    6b1a0da75932 wifi: ath11k: fix peer HE MCS assignment
    18d4706956b7 wifi: ath11k: fix VHT MCS assignment
    5c75e55e43e8 crypto: hisilicon/qm - restore original qos values
    b7090a5c1531 crypto: asymmetric_keys - prevent overflow in asymmetric_key_generate_id
    599b5f3f4224 soc: qcom: gsbi: fix double disable caused by devm
    37b8870d96d4 clk: qcom: camcc-sm7150: Fix PLL config of PLL2
    680df1f60e02 clk: qcom: camcc-sm6350: Fix PLL config of PLL2
    b2427d5693c3 clk: qcom: gcc-ipq5424: Correct the icc_first_node_id
    25dddde65642 clk: qcom: gcc-glymur: Update the halt check flags for pipe clocks
    6d9ed274d8da clk: qcom: gcc-sm8750: Add a new frequency for sdcc2 clock
    27fa51ddddb3 clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
    69671a253ffe clk: qcom: camcc-sm8550: Specify Titan GDSC power domain as a parent to other
    9ff72116e6c8 tty: serial: imx: Only configure the wake register when device is set as wakeup source
    78bf5afa25d6 uio: uio_fsl_elbc_gpcm:: Add null pointer check to uio_fsl_elbc_gpcm_probe
    712102126091 PCI: rcar-gen2: Drop ARM dependency from PCI_RCAR_GEN2
    4b9404cc439d arm64: dts: exynos: gs101: fix sysreg_apm reg property
    1321c33a8fc5 arm64: dts: exynos: gs101: fix clock module unit reg sizes
    9d231ef85d9a perf annotate: Check return value of evsel__get_arch() properly
    7ba92dd7206b arm64: dts: imx95-15x15-evk: add fan-supply property for pwm-fan
    a482d0033916 arm64: dts: imx8mp-venice-gw702x: remove off-board sdhc1
    7e13775ed0b7 arm64: dts: imx8mp-venice-gw702x: remove off-board uart
    152044f4b08d arm64: dts: imx8mm-venice-gw72xx: remove unused sdhc1 pinctrl
    a45df9009fa8 arm64: dts: freescale: imx8mp-venice-gw7905-2x: remove duplicate usdhc1 props
    fbea4c63b538 bpf: Do not let BPF test infra emit invalid GSO types to stack
    204f13654142 block/mq-deadline: Switch back to a single dispatch list
    95b122036d7a block/mq-deadline: Introduce dd_start_request()
    a43afb170963 PCI: sg2042: Fix a reference count issue in sg2042_pcie_remove()
    12b413f5460c crypto: aead - Fix reqsize handling
    67c42f3ec0bd perf parse-events: Make X modifier more respectful of groups
    b346cdd95f7a firmware: qcom: tzmem: fix qcom_tzmem_policy kernel-doc
    d98d38c7f8ca iio: imu: st_lsm6dsx: Fix measurement unit for odr struct member
    fdbf4423bb81 arm64: dts: qcom: ipq5424: correct the TF-A reserved memory to 512K
    b40a4eb4a054 ntfs3: Fix uninit buffer allocated by __getname()
    81ffe9a265df ntfs3: fix uninit memory after failed mi_read in mi_format_new
    841b3868a64f crypto: authenc - Correctly pass EINPROGRESS back up to the caller
    58c47ba6f329 irqchip: Pass platform device to platform drivers
    d2e28c3ed2e2 irqchip: Drop leftover brackets
    defdeae61607 irqchip/qcom-irq-combiner: Fix section mismatch
    d4caa2df1f08 irqchip/starfive-jh8100: Fix section mismatch
    3f1ac747652f irqchip/renesas-rzg2l: Fix section mismatch
    60597d44de5f irqchip/imx-mu-msi: Fix section mismatch
    99e8c4978410 irqchip/irq-brcmstb-l2: Fix section mismatch
    6769909e3ed8 irqchip/irq-bcm7120-l2: Fix section mismatch
    2f36222dbc04 irqchip/irq-bcm7038-l1: Fix section mismatch
    e74c71452437 irqchip/bcm2712-mip: Fix section mismatch
    2f525dea50f2 irqchip/bcm2712-mip: Fix OF node reference imbalance
    01f109716638 sched/fair: Forfeit vruntime on yield
    ca2a33cee1ef wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
    d911fa97dab3 wifi: ath12k: fix VHT MCS assignment
    ab0554f51e5f wifi: ath12k: Fix MSDU buffer types handling in RX error path
    99fc0689a588 wifi: ath11k: restore register window after global reset
    b1497ea24639 wifi: ath10k: move recovery check logic into a new work
    72f8a15524f3 gpu: nova-core: gsp: do not unwrap() SGEntry
    5248b34df18c gpu: nova-core: gsp: remove useless conversion
    27858e788377 perf parse-events: Fix legacy cache events if event is duplicated in a PMU
    fe14b92fb97c accel/ivpu: Fix race condition when mapping dmabuf
    157d7d16f817 objtool: Fix weak symbol detection
    bee781b8c03e objtool: Fix standalone --hacks=jump_label
    80b75beb1619 remoteproc: imx_rproc: Fix runtime PM cleanup and improve remove path
    4e02cff54ba0 HID: logitech-hidpp: Do not assume FAP in hidpp_send_message_sync()
    ac35eed93429 drm: atmel-hlcdc: fix atmel_xlcdc_plane_setup_scaler()
    b1c7a8145137 clk: renesas: cpg-mssr: Read back reset registers to assure values latched
    f57b5f2ad106 clk: renesas: cpg-mssr: Add missing 1ms delay into reset toggle callback
    1d49bdea86e3 pinctrl: renesas: rzg2l: Fix PMC restore
    d07b4af12015 ima: Attach CREDS_CHECK IMA hook to bprm_creds_from_file LSM hook
    e558173196b0 pinctrl: qcom: glymur: Fix the gpio and egpio pin functions
    0c1e8e2c6e06 pinctrl: qcom: glymur: Drop unnecessary platform data from match table
    b5b479a13b90 perf bpf_counter: Fix opening of "any"(-1) CPU events
    caceff35c24a USB: Fix descriptor count when handling invalid MBIM extended descriptor
    e506f976c914 tools/nolibc: handle NULL wstatus argument to waitpid()
    19e359b18ae3 bpf: Fix handling maps with no BTF and non-constant offsets for the bpf_wq
    d8edc163ccf5 bpf: Fix sleepable context for async callbacks
    20798610f0e2 bpf: Cleanup unused func args in rqspinlock implementation
    1f0ca9d3e7c3 drm/vgem-fence: Fix potential deadlock on release
    ec6ca941783a accel/ivpu: Fix DCT active percent format
    c9ef5ccd8bd9 accel/ivpu: Fix page fault in ivpu_bo_unbind_all_bos_from_context()
    94c56e7f63c2 accel/ivpu: Rework bind/unbind of imported buffers
    f94792340ecc drm/panel: visionox-rm69299: Don't clear all mode flags
    28540b8f226b drm/panel: visionox-rm69299: Fix clock frequency for SHIFT6mq
    270f4eb14e0f accel/ivpu: Ensure rpm_runtime_put in case of engine reset/resume fail
    3bb9d125972c accel/amdxdna: Call dma_buf_vmap_unlocked() for imported object
    359653edd537 accel/amdxdna: Fix an integer overflow in aie2_query_ctx_status_array()
    79197c6007f2 gpu: host1x: Fix race in syncpt alloc/free
    cf008f5bd3d5 smack: fix bug: setting task label silently ignores input garbage
    60e8d4998941 smack: fix bug: unprivileged task can create labels
    70c5be42f691 smack: fix bug: invalid label of unix socket file
    f1dbb370eca5 smack: always "instantiate" inode in smack_inode_init_security()
    3c4f1ca5bd91 smack: deduplicate xattr setting in smack_inode_init_security()
    06025d5e707f smack: deduplicate "does access rule request transmutation"
    cf036137162c smack: fix bug: SMACK64TRANSMUTE set on non-directory

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 4a97e69bd1..52ecbb4731 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2113af81503bf1956e1fd35ebeb47b30fb4800ad"
-SRCREV_meta ?= "8ac9b1baf5d3cc1cb53a87a449b52f253dc32cab"
+SRCREV_machine ?= "3587d6639806e9f37471f7fd1842856f67aadb73"
+SRCREV_meta ?= "83fff3acfc84814b4da0cdb2a63d608d376c3cdd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.1"
+LINUX_VERSION ?= "6.18.3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 654ed412a5..4038fc2ebc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.1"
+LINUX_VERSION ?= "6.18.3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
-SRCREV_meta ?= "8ac9b1baf5d3cc1cb53a87a449b52f253dc32cab"
+SRCREV_machine ?= "841ef97434365625fc8fc51fc50606de61f9f838"
+SRCREV_meta ?= "83fff3acfc84814b4da0cdb2a63d608d376c3cdd"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index b341b4b658..89631e3332 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "1d85405aa5f80c9a3fb644ffab29f6d952da2146"
-SRCREV_machine:qemuarm64 ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
-SRCREV_machine:qemuloongarch64 ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
+SRCREV_machine:qemuarm ?= "6d340e3238d68fe8e942f44f322178a9cdfa9798"
+SRCREV_machine:qemuarm64 ?= "841ef97434365625fc8fc51fc50606de61f9f838"
+SRCREV_machine:qemuloongarch64 ?= "841ef97434365625fc8fc51fc50606de61f9f838"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
-SRCREV_machine:qemuriscv64 ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
-SRCREV_machine:qemuriscv32 ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
-SRCREV_machine:qemux86 ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
-SRCREV_machine:qemux86-64 ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
+SRCREV_machine:qemuppc ?= "841ef97434365625fc8fc51fc50606de61f9f838"
+SRCREV_machine:qemuriscv64 ?= "841ef97434365625fc8fc51fc50606de61f9f838"
+SRCREV_machine:qemuriscv32 ?= "841ef97434365625fc8fc51fc50606de61f9f838"
+SRCREV_machine:qemux86 ?= "841ef97434365625fc8fc51fc50606de61f9f838"
+SRCREV_machine:qemux86-64 ?= "841ef97434365625fc8fc51fc50606de61f9f838"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
-SRCREV_meta ?= "8ac9b1baf5d3cc1cb53a87a449b52f253dc32cab"
+SRCREV_machine ?= "841ef97434365625fc8fc51fc50606de61f9f838"
+SRCREV_meta ?= "83fff3acfc84814b4da0cdb2a63d608d376c3cdd"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "25442251cbda7590d87d8203a8dc1ddf2c93de61"
+SRCREV_machine:class-devupstream ?= "78d82960b939df64cf7d26ca5ed34eb87f44c9e5"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.1"
+LINUX_VERSION ?= "6.18.3"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


