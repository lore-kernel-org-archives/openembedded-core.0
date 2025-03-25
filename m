Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D124C3600D
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 18:33:20 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.3319.1742927590154720860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 11:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P+Pxnuaa;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4768f90bf36so57765761cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 11:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742927589; x=1743532389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TFzsx6LqZSozRfOx2bMhvr4OqI1NnqUapPOdhXH2qM=;
        b=P+PxnuaaU71eBJvlS7s3hpfGQTKLN5QMB55aGZuULoRdBfHYMOO7AC+FBDo/nq4BPX
         /JVGDM3U0enB+DaEsw/farz6QsMC40fykJ8DgraZNIYp5EdmRLPMKLm3T0zuivxXGqIZ
         rZr2NrIran9Jdi6nSHQZ2JTUMazC67y3EfDE3ivrBrPyj008+PFoVHweWkEL88BdrDHI
         oKlNilVPU0ZJjEi0IzBnjIPxBl14gPak5cKkyQG9iqB8jiIoLZezAyL2krROvtJO98yd
         C3auoZTvacZgvqy4BNIx/4LFTFNE4e52c8UK4y7mJNs9L82r5o2I+7vgQkmgnJ1ou0LG
         ZKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742927589; x=1743532389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TFzsx6LqZSozRfOx2bMhvr4OqI1NnqUapPOdhXH2qM=;
        b=dyki/6K4zMjU+96mSYQABaV6h6B3l795IlN7DAakT6oLOn1lIEGypMh4+bKDBtBMm4
         fiec008JhQu8M9P8iitJ7MVZXY7CywcYbCU1f14RPiqDnujxnsmcC6NqDXZQ1W4/lNi7
         BcDl2cbmz1lHnjUUZe0jUAJy8MnN0WyG1aF7NXUEdg5XjOCN8wk/bgaB1ejZkHA10SfN
         Q8i/N4EBTQo85I5lR6Sx4e/kiUc8HWzcJnmybhulPLNmxfpE1hfrO7xpiRCN0LHd2k0j
         y3riA3oGrNm1g4csyrqibi4bYhzujA2AqIHrYasipNqtx3eEsqxO52LMpAU/Dxd0hFQs
         EdCw==
X-Gm-Message-State: AOJu0YxxYdFbLpGhro6b+nQWhS0vUsOCMhu1rYjxd0CYuY8mqknd8fJa
	TVSl0ZVMaaAJYV0PTO3dQQfGB4Yxu0IxKt4weR0aeeTcSrtBD2+LtE2g6WpM3U0=
X-Gm-Gg: ASbGnctPQGtpVus3ipDOlHS1CSFbrnJg0z0sSASVPHYrgIYrlIePfCheAbahN19UKc6
	t1cf6L3jbBukZkFP+1xisFnMgzPCW87jbw2eE2F95ufhxBkoBMFL+FnYJPgEHm5eonOwoq3iJ83
	UNIJflNE8pRiUmrDKJgIkA2pJHW6KvZWNgiIEPKq+HSKqU6XqqxiU9Ua8gWhqHfkydDJczb/lcT
	jzPEjUANW6s/mvAMnWFUEXJxiVa0Ji4QlDqeY6sFBx5uKz7GmfRHMl3+ZG0ZDrctX0QlQTCmGdb
	1MsllBE/Uo3lTnzAQShrjlWiZy71qPozabjmlCnQM8kwaRO5wAHV5+v+RXsuglN6klOC0pTNGCp
	VzET8/C5HELkQWe6eQ15D0fJr4uA02xqlHLPEQ8czHKQNkg==
X-Google-Smtp-Source: AGHT+IHIWb1YJvks3QINzvTejuNBFUk6RU6DNjhNhBCzdaa5TD826XJyDKIxHOrNDrVq84Ma+qf27A==
X-Received: by 2002:a05:622a:418f:b0:476:b2be:5894 with SMTP id d75a77b69052e-4771dd77e18mr358510251cf.13.1742927588848;
        Tue, 25 Mar 2025 11:33:08 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4771d18d541sm62398541cf.36.2025.03.25.11.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 11:33:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/6] linux-yocto/6.6: update to v6.6.84
Date: Tue, 25 Mar 2025 14:33:00 -0400
Message-Id: <20250325183300.3977822-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250325183300.3977822-1-bruce.ashfield@gmail.com>
References: <20250325183300.3977822-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 18:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213611

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    4b6a8fa777d2 Linux 6.6.84
    a561c6a034c9 netfilter: nf_tables: allow clone callbacks to sleep
    f6de68e154ef netfilter: nf_tables: bail out if stateful expression provides no .clone
    7fa2e2960fff netfilter: nf_tables: use timestamp to check for set element timeout
    50b22a98c184 rust: lockdep: Remove support for dynamically allocated LockClassKeys
    812080b01dac nvme-tcp: Fix a C2HTermReq error message
    62485737050d HID: apple: disable Fn key handling on the Omoton KB066
    a09e085ba84b nvme-fc: rely on state transitions to handle connectivity loss
    efc30877bd4b Bluetooth: L2CAP: Fix corrupted list in hci_chan_del
    fb0800cbea02 smb: client: Fix match_session bug preventing session reuse
    7dc9abfa00ab smb3: add support for IAKerb
    643607a53f07 stmmac: loongson: Pass correct arg to PCI function
    6653927733e1 i2c: sis630: Fix an error handling path in sis630_probe()
    9e3bef10e480 i2c: ali15x3: Fix an error handling path in ali15x3_probe()
    beb68cfcb3ff i2c: ali1535: Fix an error handling path in ali1535_probe()
    10cbae84fed8 cifs: Throw -EOPNOTSUPP error on unsupported reparse point type from parse_reparse_point()
    474c08712d5f cifs: Validate content of WSL reparse point buffers
    6c13fcb7cf59 cifs: Fix integer overflow while processing closetimeo mount option
    d5fff81c4375 cifs: Fix integer overflow while processing actimeo mount option
    9e438d0410a4 cifs: Fix integer overflow while processing acdirmax mount option
    0252c33cc943 cifs: Fix integer overflow while processing acregmax mount option
    d3f9fdc298b8 scripts: generate_rust_analyzer: add missing macros deps
    a70259447d80 ASoC: codecs: wm0010: Fix error handling path in wm0010_spi_probe()
    69a900480941 ASoC: rt722-sdca: add missing readable registers
    2592a628743e rust: init: add missing newline to pr_info! calls
    f69b8f42893e ASoC: cs42l43: Fix maximum ADC Volume
    b05b5627f0f1 drm/gma500: Add NULL check for pci_gfx_root in mid_get_vbt_data()
    5da54be46960 rust: error: add missing newline to pr_warn! calls
    544055329560 ASoC: ops: Consistently treat platform_max as control value
    86d97d49f198 mm: split critical region in remap_file_pages() and invoke LSMs in between
    b2fe954a4ddc lib/buildid: Handle memfd_secret() files in build_id_parse()
    aa4d9b54f11c rust: init: fix `Zeroable` implementation for `Option<NonNull<T>>` and `Option<KBox<T>>`
    b78467d3ba1c rust: Disallow BTF generation with Rust + LTO
    d026392e3f87 smb: client: fix regression with guest option
    2bff992a5505 qlcnic: fix memory leak issues in qlcnic_sriov_common.c
    7b2c29b7ea29 arm64: mm: Populate vmemmap at the page level if not section aligned
    818330f756f3 dm-flakey: Fix memory corruption in optional corrupt_bio_byte feature
    cfae6a5dad50 ASoC: amd: yc: Support mic on another Lenovo ThinkPad E16 Gen 2 model
    4f6c0f75293a clk: samsung: update PLL locktime for PLL142XX used on FSD platform
    09aeab680331 ksmbd: prevent connection release during oplock break notification
    fb776765bfc2 ksmbd: fix use-after-free in ksmbd_free_work_struct
    378b361e2e30 drm/amd/display: Fix slab-use-after-free on hdcp_work
    a8f77e1658d7 drm/amd/display: Assign normalized_pix_clk when color depth = 14
    8e91a6167889 drm/amd/display: Restore correct backlight brightness after a GPU reset
    8082ca0dd244 drm/amd/display: Disable unneeded hpd interrupts during dm_init
    b5c283501581 drm/dp_mst: Fix locking when skipping CSN before topology probing
    b3ddebaece2c drm/atomic: Filter out redundant DPMS calls
    6736975ee30d drm/i915/cdclk: Do cdclk post plane programming later
    e686349cc19e x86/microcode/AMD: Fix out-of-bounds on systems with CPU-less NUMA nodes
    ab0f6e770d39 USB: serial: option: match on interface class for Telit FN990B
    61e540094fae USB: serial: option: fix Telit Cinterion FE990A name
    e1bfbf0f18ab USB: serial: option: add Telit Cinterion FE990B compositions
    528ac204851e USB: serial: ftdi_sio: add support for Altera USB Blaster 3
    392e9b29769a Input: i8042 - swap old quirk combination with new quirk for more devices
    e7c95c01064b Input: i8042 - swap old quirk combination with new quirk for several devices
    e690d0c52cde Input: i8042 - add required quirks for missing old boardnames
    105a21163750 Input: i8042 - swap old quirk combination with new quirk for NHxxRZQ
    d639d5531ad7 Input: xpad - rename QH controller to Legion Go S
    0c4484cdcbb8 Input: xpad - add support for TECNO Pocket Go
    dc9839dcc232 Input: xpad - add support for ZOTAC Gaming Zone
    8cf88f390e74 Input: xpad - add multiple supported devices
    5184e44bef75 Input: xpad - add 8BitDo SN30 Pro, Hyperkin X91 and Gamesir G7 SE controllers
    0b5b6512f674 Input: iqs7222 - preserve system status register
    cbd68fca8878 Input: ads7846 - fix gpiod allocation
    78aefac7efdf io_uring: fix error pbuf checking
    1fdb9c9eb2ad io_uring: use unpin_user_pages() where appropriate
    46b1b3d81a7e io_uring/kbuf: use vm_insert_pages() for mmap'ed pbuf ring
    af8f27ef1a00 io_uring/kbuf: vmap pinned buffer ring
    6168ec87bf12 io_uring: unify io_pin_pages()
    719e745ee31c io_uring: use vmap() for ring mapping
    b89f95b94cf7 io_uring: fix corner case forgetting to vunmap
    a0b21f2aca04 io_uring: don't attempt to mmap larger than what the user asks for
    2905c4fe7e52 io_uring: get rid of remap_pfn_range() for mapping rings/sqes
    b6690a4172a3 mm: add nommu variant of vm_insert_pages()
    0446d868190b block: fix 'kmem_cache of name 'bio-108' already exists'
    474cebf2978d net: Handle napi_schedule() calls from non-interrupt
    deb9982c4d55 drm/nouveau: Do not override forced connector status
    47f427220796 mptcp: safety check before fallback
    bb41ef31906e x86/irq: Define trace events conditionally
    cdf7658ea205 perf/x86/intel: Use better start period for frequency mode
    791eaeaa0935 drm/vkms: Round fixp2int conversion in lerp_u16
    fcfb7ea1f4c6 fuse: don't truncate cached, mutated symlink
    08ee4f873bd0 ASoC: tas2764: Set the SDOUT polarity correctly
    6c703ceaf6a6 ASoC: tas2764: Fix power control mask
    8f677fb436ef ASoC: tas2770: Fix volume scale
    f33c09085519 nvme: only allow entering LIVE from CONNECTING state
    6df3939d9301 sctp: Fix undefined behavior in left shift operation
    d3ca799203e5 cifs: Treat unhandled directory name surrogate reparse points as mount directory nodes
    492be1cd9e55 apple-nvme: Release power domains when probe fails
    bf78e63235c4 nvmet-rdma: recheck queue state is LIVE in state lock in recv done
    e9764289d765 nvme-tcp: add basic support for the C2HTermReq PDU
    aca3cdc3a673 nvme-pci: quirk Acer FA100 for non-uniqueue identifiers
    570f4d6e94ad io-wq: backoff when retrying worker creation
    f3288ffd33ea net: wwan: mhi_wwan_mbim: Silence sequence number glitch errors
    f623c04f7a63 ASoC: SOF: amd: Handle IPC replies before FW_BOOT_COMPLETE
    a4859a07c383 ASoC: SOF: Intel: hda: add softdep pre to snd-hda-codec-hdmi module
    7e97147479ff ASoC: arizona/madera: use fsleep() in up/down DAPM event delays.
    544f38b43fe8 ASoC: rsnd: adjust convert rate limitation
    7fe470e618aa ASoC: rsnd: don't indicate warning on rsnd_kctrl_accept_runtime()
    fa51c913402f ASoC: rsnd: indicate unsupported clock rate
    aa2e8245052a ALSA: hda/realtek: Limit mic boost on Positivo ARN50
    9f303c35f9e8 ASoC: simple-card-utils.c: add missing dlc->of_node
    dfbaf8a6ae62 selftests/bpf: Fix invalid flag of recv()
    c96cce853542 Bluetooth: L2CAP: Fix slab-use-after-free Read in l2cap_send_cmd
    45a5d06e7e69 Xen/swiotlb: mark xen_swiotlb_fixup() __init
    f225a79bd23b thermal/cpufreq_cooling: Remove structure member documentation
    051a7980f77e s390/cio: Fix CHPID "configure" attribute caching
    194dc8c7ac0e platform/x86: thinkpad_acpi: Support for V9 DYTC platform profiles
    7f417bd96a1b platform/x86: thinkpad_acpi: Fix invalid fan speed on ThinkPad X120e
    265c03699e9b sched: Clarify wake_up_q()'s write to task->wake_q.next
    5b1c48532f71 objtool: Ignore dangling jump table entries
    be2051f81bf3 HID: apple: fix up the F6 key on the Omoton KB066 keyboard
    68eddb06f0ed HID: hid-apple: Apple Magic Keyboard a3203 USB-C support
    945166034600 HID: topre: Fix n-key rollover on Realforce R3S TKL boards
    490eb24d6602 usb: phy: generic: Use proper helper for property detection
    7a7ada33879a HID: ignore non-functional sensor in HP 5MP Camera
    2a11cee9a9e2 HID: intel-ish-hid: Send clock sync message immediately after reset
    cc4c96f1fdc3 HID: intel-ish-hid: fix the length of MNG_SYNC_FW_CLOCK in doorbell
    5d01a4ec46a4 vboxsf: fix building with GCC 15
    52df961953e8 alpha/elf: Fix misc/setarch test of util-linux by removing 32bit support
    dd33c1a3859f smb: client: fix noisy when tree connecting to DFS interlink targets
    1b9cd0404e32 ACPI: resource: IRQ override for Eluktronics MECH-17
    ea371d1cdefb scsi: qla1280: Fix kernel oops when debug level > 2
    caa383226495 scsi: ufs: core: Fix error return with query response
    e9d4044f4b12 scsi: core: Use GFP_NOIO to avoid circular locking dependency
    c79ac6a812a9 platform/x86/intel: pmc: fix ltr decode in pmc_core_ltr_show()
    6c8b1efdc487 sched/debug: Provide slice length for fair tasks
    2d1eef248107 iscsi_ibft: Fix UBSAN shift-out-of-bounds warning in ibft_attr_show_nic()
    a470f80ef3a9 powercap: call put_device() on an error path in powercap_register_control_type()
    a625ad9b5b1b hrtimers: Mark is_migration_base() with __always_inline
    fa5bfdd93fa9 nvme-fc: do not ignore connectivity loss during connecting
    aef373bb9ab5 nvme-fc: go straight to connecting state when initializing
    885b7279819e net/mlx5e: Prevent bridge link show failure for non-eswitch-allowed devices
    bd7e3a428007 net/mlx5: Bridge, fix the crash caused by LAG state check
    4e79d865f019 net/mlx5: Lag, Check shared fdb before creating MultiPort E-Switch
    4b1a0ee6164c net: openvswitch: remove misbehaving actions length check
    ecc19a9380e1 gre: Fix IPv6 link-local address generation.
    181b68fa55ac netfilter: nft_exthdr: fix offset with ipv4_find_option()
    78533c4a29ac net_sched: Prevent creation of classes with TC_H_ROOT
    1bd2a8bb1ccb ipvs: prevent integer overflow in do_ip_vs_get_ctl()
    fda50302a137 netfilter: nf_conncount: Fully initialize struct nf_conncount_tuple in insert_tree()
    6e4edd9e2deb bonding: fix incorrect MAC address setting to receive NS messages
    1f7d051814e7 net: switchdev: Convert blocking notification chain to a raw one
    ee086c8e775f eth: bnxt: do not update checksum in bnxt_xdp_build_skb()
    637105ef0d46 net/mlx5: handle errors in mlx5_chains_create_table()
    466ae740f88c Drivers: hv: vmbus: Don't release fb_mmio resource in vmbus_free_mmio()
    ad27b4a51495 drm/hyperv: Fix address space leak when Hyper-V DRM device is removed
    9d1966bdaf76 netpoll: hold rcu read lock in __netpoll_send_skb()
    6c5bb3f7acb7 net: mctp i2c: Copy headers if cloned
    78f83ea6b81a net: dsa: mv88e6xxx: Verify after ATU Load ops
    20b667285306 net/mlx5: Fill out devlink dev info only for PFs
    5e8ce74fb041 Revert "Bluetooth: hci_core: Fix sleeping function called from invalid context"
    7e8cd2bc09b0 Bluetooth: hci_event: Fix enabling passive scanning
    75d262ad3c36 wifi: cfg80211: cancel wiphy_work before freeing wiphy
    0f0a152957d6 sched: address a potential NULL pointer dereference in the GRED scheduler.
    0a9f0cfd2ae8 netfilter: nf_conncount: garbage collection is not skipped when jiffies wrap around
    5d30d256661f ice: fix memory leak in aRFS after reset
    29bde9751cb7 netfilter: nft_ct: Use __refcount_inc() for per-CPU nft_ct_pcpu_template.
    21e65f1fef64 pinctrl: bcm281xx: Fix incorrect regmap max_registers value
    c198157ae158 fbdev: hyperv_fb: iounmap() the correct memory when removing a device
    372df1f2057c tcp: fix forever orphan socket caused by tcp_abort
    abadaa355730 tcp: fix races in tcp_abort()
    f9543375d9b1 bpf: Use raw_spinlock_t in ringbuf
    472173544e74 hrtimer: Use and report correct timerslack values for realtime tasks
    c7ee791e5385 zram: fix NULL pointer in comp_algorithm_show()
    6e0447fa7d87 sched/isolation: Prevent boot crash when the boot CPU is nohz_full
    de47f33dde89 clockevents/drivers/i8253: Fix stop sequence for timer 0
    ceb5fadbf450 Revert "v6.6 -stable -rt merge fixup"
    1c2962a164ff v6.6 -stable -rt merge fixup
    18abb2787b53 x86/syscall: Mark exit[_group] syscall handlers __noreturn
    2879d995e569 pnmtologo: sync with 6.6
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
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index d61e7c7013..05bd9b8386 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "63e3ee8cad3470dc6f6e14fa066ad8fbe8f7a533"
-SRCREV_meta ?= "76774218a6ce7d0ac41ab689d68297fd3aa3838e"
+SRCREV_machine ?= "60a86cf65a4bf973b04926050eb05d0e8132690d"
+SRCREV_meta ?= "917317e6b8a757306a04d6d76dd1f5a1a5591ecd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.83"
+LINUX_VERSION ?= "6.6.84"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 01f6b2993c..3296a4300a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.83"
+LINUX_VERSION ?= "6.6.84"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "02eba65981c1950772b1b82809784b640f6d4523"
-SRCREV_meta ?= "76774218a6ce7d0ac41ab689d68297fd3aa3838e"
+SRCREV_machine ?= "36c0e5585c944c19d71f496c306d8229565629a5"
+SRCREV_meta ?= "917317e6b8a757306a04d6d76dd1f5a1a5591ecd"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index f3d1478852..98d820d195 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "81c095c03a24e0ba76cbf9fdfa1cf1debec3539d"
-SRCREV_machine:qemuarm64 ?= "c829269a448a8ca80344d036dacb8b3d9dbfab9f"
-SRCREV_machine:qemuloongarch64 ?= "1c2962a164ffb032281c3d2e62a08d343249f208"
-SRCREV_machine:qemumips ?= "39483f9b5f923214c29a14fe6e51daf827964f2a"
-SRCREV_machine:qemuppc ?= "9c8c49665dde1059734ee56708e63b2d6e4f3ed0"
-SRCREV_machine:qemuriscv64 ?= "1c2962a164ffb032281c3d2e62a08d343249f208"
-SRCREV_machine:qemuriscv32 ?= "1c2962a164ffb032281c3d2e62a08d343249f208"
-SRCREV_machine:qemux86 ?= "1c2962a164ffb032281c3d2e62a08d343249f208"
-SRCREV_machine:qemux86-64 ?= "1c2962a164ffb032281c3d2e62a08d343249f208"
-SRCREV_machine:qemumips64 ?= "5d02316b6c6c886a25bc5592b397dbd4e51654e5"
-SRCREV_machine ?= "1c2962a164ffb032281c3d2e62a08d343249f208"
-SRCREV_meta ?= "76774218a6ce7d0ac41ab689d68297fd3aa3838e"
+SRCREV_machine:qemuarm ?= "1411061244e285c0f16dcc35ec34b7a13d7b5708"
+SRCREV_machine:qemuarm64 ?= "cc8c55d771998fb779d3c5990c250a78e223f397"
+SRCREV_machine:qemuloongarch64 ?= "8dd317512c57f68aa212eaf0dcf078fb39afc1bd"
+SRCREV_machine:qemumips ?= "25bda2f47225cf6d74293ba1a0b9583c33b9865d"
+SRCREV_machine:qemuppc ?= "7fd13b08104048b99d66947f682cb5a95360ba65"
+SRCREV_machine:qemuriscv64 ?= "8dd317512c57f68aa212eaf0dcf078fb39afc1bd"
+SRCREV_machine:qemuriscv32 ?= "8dd317512c57f68aa212eaf0dcf078fb39afc1bd"
+SRCREV_machine:qemux86 ?= "8dd317512c57f68aa212eaf0dcf078fb39afc1bd"
+SRCREV_machine:qemux86-64 ?= "8dd317512c57f68aa212eaf0dcf078fb39afc1bd"
+SRCREV_machine:qemumips64 ?= "23fd476a33f79745b2a4c86a2cffcf653564c649"
+SRCREV_machine ?= "8dd317512c57f68aa212eaf0dcf078fb39afc1bd"
+SRCREV_meta ?= "917317e6b8a757306a04d6d76dd1f5a1a5591ecd"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "594a1dd5138a6bbaa1697e5648cce23d2520eba9"
+SRCREV_machine:class-devupstream ?= "4b6a8fa777d29785c7ddb51dcbb2b5411deefaca"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.83"
+LINUX_VERSION ?= "6.6.84"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


