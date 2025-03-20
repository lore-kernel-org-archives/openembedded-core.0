Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DD2C36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:40:28 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.7688.1742478021305501618
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i0M+FN8q;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8f254b875so6942876d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742478020; x=1743082820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykdl7bPwHBDMLM9d8xDuWmHglkU/PTWoZj11uGTS8Oo=;
        b=i0M+FN8qeIoti5TsI+q/SVWpCBavd7AFH/Roph9B5i06RWYK8mI4VUNGvJM+dhxd9h
         vqnL454wqk66i683PEWDlTCk4qvrOCfsxW0M61IbIM50zhTkNVINr9L3bM3gjuQ9rRMs
         8I+xenH5yeBn3l30Mmrdx9fbEZSCcqx+JgIdgGDGKqGLrw/RVVQiSnXiyCNvfUT515rJ
         mmTpHRKgf+C04VWb+6igroQJCCt1YRxazQ/Mrl4w2aqJ3o7i9d5jAFAvNKlrrbCBD4xl
         GZyvZkp/3k+Boa8PU7+EO3O/muKhSvzKghzOgYafXcff40ESXkk6LiihJZ2HIjsSQ7UG
         Y2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478020; x=1743082820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykdl7bPwHBDMLM9d8xDuWmHglkU/PTWoZj11uGTS8Oo=;
        b=vnkthIYcGMJ6kQLGf+v22Hcl0lQ3WcQS5OnvNAdrUQfi7XCG5NC+R4IEvAdTiBDUDg
         zulEIj1z9TnBl11nWRuG6ynTTlzOMzHouDnKRESv67KqGGPB3l1qLMmG6iuxEJug9z5v
         H+LviRygwDZky+o8yY57dKbEGjsh/LmlXzivdPv8haHvFDAlzC42a/EjZdEkxoeiACPI
         VHtDoEbmqM2MiI1eHu2OCX2cAK/F+1DdQFu6XnYStXioIIAYuIGvumCYABDTIyzItoMX
         i3w01E8Pk6L1guXrxXljQK56tAHa6cCJvnDYkKMNLrXhYKgzdrLfiQeoYoWHRpvOmYXi
         4mcQ==
X-Gm-Message-State: AOJu0Yyy1jpz9hk8gzHgSX7tswF9jxeLKjnCCTEOc8OZ1rtmEmECVCls
	cPjRLqhk2Hmuu74/WwZnWg49cHrKbA+TqPBiS2VTLMOk+KbdDiXIJZfUoNWX1So=
X-Gm-Gg: ASbGnctJyxCRPkFXinr+PUWrlcupXOdoSLHsY6i+F5YDImQGn+EzqT4rXdW42AS62aJ
	qmP1ACTWNd90OxzOukmMEUBTCmLC6vBiuOE9eCxHjFhwWz+Q68TTZXqEVwQRQGsJJ9qI+I4eH01
	0OfZ86YvGgd4XhDKTFuc/oHJDVpnxWa6elHCVS7f2jR7hIa7GwHR6vw9UTJvL0dTZH0drE95enM
	0vsCXkfm5ivRQUMiae7KA1VB54aMNAfy5KS3lyaf6VbHQYeEoObzDwlf5GIoHZ5FfiyVLKzHnFx
	PloxXUe99EbLNrMcsC/Qn3VzUXRiYOwv8wZqDXHFeEs+6EGNXh3fn/KOr1SpsNoj7sPLtcMwqY3
	bj5Oq45/WX+lZnNQ1gCR7edWAqhrlNjDnb0FsHzIaYrxQgw==
X-Google-Smtp-Source: AGHT+IGngC4cnbPUw869C9R4oayvJ/l0BB6uKYh2BkbWzrLox0fVmqn3nMMMI9V7b62ZkHReI+vUXA==
X-Received: by 2002:ad4:594b:0:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6eb29275764mr80371396d6.2.1742478019973;
        Thu, 20 Mar 2025 06:40:19 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade231256sm93954166d6.32.2025.03.20.06.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:40:18 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/6.12: update to v6.12.19
Date: Thu, 20 Mar 2025 09:40:10 -0400
Message-Id: <af5c9a5f4dedd3dfa53a7aa68f9cb1c8ef1afcd5.1742477836.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1742477836.git.bruce.ashfield@gmail.com>
References: <cover.1742477836.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213395

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    e9cc806c0152 Linux 6.12.19
    52b0eb50f84f wifi: iwlwifi: pcie: Fix TSO preparation
    8031772e5a9d x86/mm: Don't disable PCID when INVLPG has been fixed by microcode
    e551a183d635 selftests/bpf: Clean up open-coded gettid syscall invocations
    86b7ebddab03 uprobes: Fix race in uprobe_free_utask
    af43986832ab KVM: e500: always restore irqs
    232995790911 Revert "KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()"
    bdc0467e1177 Revert "KVM: PPC: e500: Mark "struct page" pfn accessed before dropping mmu_lock"
    681b5823ed79 Revert "KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults"
    652fbadfe64a Revert "KVM: e500: always restore irqs"
    d9743b4f5c81 docs: rust: remove spurious item in `expect` list
    a499ebab0f23 nvme-tcp: Fix a C2HTermReq error message
    53991620da5e ALSA: hda: realtek: fix incorrect IS_REACHABLE() usage
    26fa53553b69 kbuild: hdrcheck: fix cross build with clang
    5bc6e5b10fe7 fs/netfs/read_collect: fix crash due to uninitialized `prev` variable
    6ad9643aa578 fs/netfs/read_pgpriv2: skip folio queues without `marks3`
    cc5faea5c4e7 arm64: hugetlb: Fix huge_ptep_get_and_clear() for non-present ptes
    a684bad77eb4 mm: hugetlb: Add huge page size param to huge_ptep_get_and_clear()
    e0da4bc015b1 iio: adc: at91-sama5d2_adc: fix sama7g5 realbits value
    3b15c2a9b903 iio: adc: ad7192: fix channel select
    acd26074c8ec iio: dac: ad3552r: clear reset status flag
    3d4f335c268d iio: light: apds9306: fix max_scale_nano values
    affe7249f9c1 iio: filter: admv8818: Force initialization of SDO
    1b8f7a2caa7f drivers: virt: acrn: hsm: Use kzalloc to avoid info leak in pmcmd_ioctl
    856ae1ce8b66 eeprom: digsy_mtc: Make GPIO lookup table match the device
    985d3cf56d87 bus: mhi: host: pci_generic: Use pci_try_reset_function() to avoid deadlock
    6abf3d8bb51c slimbus: messaging: Free transaction ID in delayed interrupt scenario
    b50e18791f40 drivers: core: fix device leak in __fw_devlink_relax_cycles()
    4e8df56636e3 char: misc: deallocate static minor in error path
    80fc880991ae intel_th: pci: Add Panther Lake-P/U support
    7f425ead4d69 intel_th: pci: Add Panther Lake-H support
    b1e8a3b5db58 intel_th: pci: Add Arrow Lake support
    adce9c491cbd mei: vsc: Use "wakeuphostint" when getting the host wakeup GPIO
    2636d1648003 mei: me: add panther lake P DID
    8473135f89c0 cdx: Fix possible UAF error in driver_override_show()
    b33b35b8bb67 KVM: x86: Explicitly zero EAX and EBX when PERFMON_V2 isn't supported by KVM
    9eb6f272a638 KVM: x86: Snapshot the host's DEBUGCTL after disabling IRQs
    c94120322553 KVM: SVM: Manually context switch DEBUGCTL if LBR virtualization is disabled
    5796ba40fb48 KVM: x86: Snapshot the host's DEBUGCTL in common x86
    6622db50d800 KVM: SVM: Suppress DEBUGCTL.BTF on AMD
    941135a335e9 KVM: SVM: Drop DEBUGCTL[5:2] from guest's effective value
    6e24d80edc82 KVM: SVM: Save host DR masks on CPUs with DebugSwap
    b2a37d358b59 KVM: SVM: Set RFLAGS.IF=1 in C code, to get VMRUN out of the STI shadow
    ea39f998647e usb: xhci: Enable the TRB overfetch quirk on VIA VL805
    d7015bb3c5dd xhci: pci: Fix indentation in the PCI device ID definitions
    f3accd043708 rust: map `long` to `isize` and `char` to `u8`
    31cdae8094e1 rust: finish using custom FFI integer types
    012b98cdb54c acpi: typec: ucsi: Introduce a ->poll_cci method
    06af63ce57ab kbuild: userprogs: use correct lld when linking through clang
    395011ee82b6 usb: gadget: Check bmAttributes only if configuration is valid
    dcd7ffdefb7c usb: gadget: Fix setting self-powered state on suspend
    4bf6c57a898b usb: gadget: Set self-powered based on MaxPower and bmAttributes
    2b2bd58e9517 usb: typec: tcpci_rt1711h: Unmask alert interrupts to fix functionality
    b38731252729 usb: typec: ucsi: increase timeout for PPM reset operations
    35db1f1829e2 usb: dwc3: gadget: Prevent irq storm when TH re-executes
    ced69d88eba4 usb: dwc3: Set SUSPENDENABLE soon after phy init
    cfc295f7cccf usb: atm: cxacru: fix a flaw in existing endpoint checks
    840afbea3fa7 usb: gadget: u_ether: Set is_suspend flag if remote wakeup fails
    e5aac1c9b297 usb: renesas_usbhs: Flush the notify_hotplug_work
    079a3e52f3e7 usb: typec: ucsi: Fix NULL pointer access
    0cab185c73bf usb: quirks: Add DELAY_INIT and NO_LPM for Prolific Mass Storage Card Reader
    4ea3319f3ef9 usb: hub: lack of clearing xHC resources
    8eac2346fb0b usb: renesas_usbhs: Use devm_usb_get_phy()
    39c2b2767e73 xhci: Restrict USB4 tunnel detection for USB3 devices to Intel hosts
    7c1f254c0743 usb: renesas_usbhs: Call clk_put()
    39e4a0b613bd Revert "drivers/card_reader/rtsx_usb: Restore interrupt based detection"
    292ce007df10 gpio: rcar: Fix missing of_node_put() call
    cc9a0b498b01 net: ipv6: fix missing dst ref drop in ila lwtunnel
    a3bf9969e208 net: ipv6: fix dst ref loop in ila lwtunnel
    d8be54c35aee mctp i3c: handle NULL header address
    bb73c406b4c6 net: dsa: mt7530: Fix traffic flooding for MMIO devices
    822c6a92d64c nvme-tcp: fix signedness bug in nvme_tcp_init_connection()
    b5741e4b9ef3 sched/fair: Fix potential memory corruption in child_cfs_rq_on_list
    b08e29032499 ublk: set_params: properly check if parameters can be applied
    2b484789e937 net-timestamp: support TCP GSO case for a few missing flags
    611015122d18 exfat: short-circuit zero-byte writes in exfat_file_write_iter
    c897b8ec4678 exfat: fix soft lockup in exfat_clear_bitmap
    5d609f0d2fba exfat: fix just enough dentries but allocate a new cluster to dir
    696973035a43 x86/sgx: Fix size overflows in sgx_encl_create()
    30e8aee77899 vlan: enforce underlying device type
    639c70352958 net: ethtool: netlink: Allow NULL nlattrs when getting a phy_device
    9c1d09cdbcf5 net: ethtool: plumb PHY stats to PHY drivers
    b71cd95764ad ethtool: linkstate: migrate linkstate functions to support multi-PHY setups
    8aa8a40c766b ppp: Fix KMSAN uninit-value warning with bpf
    d9312e0fdb25 net: ipa: Enable checksum for IPA_ENDPOINT_AP_MODEM_{RX,TX} for v4.7
    8274760798ba net: ipa: Fix QSB data for v4.7
    122e1a7fd935 net: ipa: Fix v4.7 resource group names
    a899adf7063c HID: hid-steam: Fix use-after-free when detaching device
    89f92c4215a6 drm/xe: Remove double pageflip
    f96fbd79e874 drm/i915: Plumb 'dsb' all way to the plane hooks
    7f74b1f4a947 drm/i915/color: Extract intel_color_modeset()
    9cfc43c0e6e6 net: hns3: make sure ptp clock is unregister and freed if hclge_ptp_get_cycle returns an error
    fd1ef3b1bdd3 be2net: fix sleeping while atomic bugs in be_ndo_bridge_getlink
    c78f4052cf40 drm/sched: Fix preprocessor guard
    2759467d3c50 hwmon: fix a NULL vs IS_ERR_OR_NULL() check in xgene_hwmon_probe()
    0f764208dc24 llc: do not use skb_get() before dev_queue_xmit()
    86f82bf2b5f9 ALSA: usx2y: validate nrpacks module parameter on probe
    ce1436ce15bf drm/imagination: Fix timestamps in firmware traces
    b98be1ffba93 tracing: probe-events: Remove unused MAX_ARG_BUF_LEN macro
    596ababab759 hwmon: (ad7314) Validate leading zero bits and return error
    274e2692ec83 hwmon: (ntc_thermistor) Fix the ncpXXxh103 sensor table
    0e12660ad4bb hwmon: (pmbus) Initialise page count in pmbus_identify()
    1688acf47722 perf/core: Fix pmus_lock vs. pmus_srcu ordering
    56cddf71cce3 caif_virtio: fix wrong pointer check in cfv_probe()
    084819b0d8b1 net: gso: fix ownership in __udp_gso_segment
    312d4fc46aa8 ALSA: hda/realtek: Remove (revert) duplicate Ally X config
    bc11b1f617d7 nvmet-tcp: Fix a possible sporadic response drops in weakly ordered arch
    9fbc953d6b38 nvme-tcp: fix potential memory corruption in nvme_tcp_recv_pdu()
    0ff76a25ab0c nvme-tcp: add basic support for the C2HTermReq PDU
    d7f35ebb5818 bluetooth: btusb: Initialize .owner field of force_poll_sync_fops
    a71fbf335e89 drm/nouveau: select FW caching
    7fc4fd8bf578 drm/nouveau: Run DRM default client setup
    dad0617fe3b9 drm/fbdev-ttm: Support struct drm_driver.fbdev_probe
    09d1157182d0 drm: Add client-agnostic setup helper
    7f5535fcbba2 drm/fbdev: Add memory-agnostic fbdev client
    f9c843f56d01 drm/fbdev-helper: Move color-mode lookup into 4CC format helper
    05d9eaa44498 wifi: mac80211: fix vendor-specific inheritance
    03b6e5e86827 wifi: mac80211: fix MLE non-inheritance parsing
    8ae5106e5df8 wifi: mac80211: Support parsing EPCS ML element
    9dedafd86e4d nvme-ioctl: fix leaked requests on mapping error
    3c63fb6ef7f3 nvme-pci: use sgls for all user requests if possible
    595a5b23eb72 nvme-pci: add support for sgl metadata
    5481dee296f6 coredump: Only sort VMAs when core_sort_vma sysctl is set
    dea6a349bcaf HID: intel-ish-hid: Fix use-after-free issue in ishtp_hid_remove()
    9c677fe859a7 HID: intel-ish-hid: Fix use-after-free issue in hid_ishtp_cl_remove()
    83a31fa2ffcc HID: google: fix unused variable warning under !CONFIG_ACPI
    6f6a3e6e87ef wifi: iwlwifi: Fix A-MSDU TSO preparation
    75f10d79cb50 wifi: iwlwifi: Free pages allocated when failing to build A-MSDU
    f265e6031d0b wifi: iwlwifi: limit printed string from FW file
    437e93ecd407 wifi: iwlwifi: mvm: don't try to talk to a dead firmware
    a88c18409b5d wifi: iwlwifi: mvm: clean up ROC on failure
    2e66d699417d mm: memory-hotplug: check folio ref count first in do_migrate_range
    576a2f4c437c hwpoison, memory_hotplug: lock folio before unmap hwpoisoned folio
    9ed33c7bac7c mm: fix finish_fault() handling for large folios
    605f53f13bc2 mm: don't skip arch_sync_kernel_mappings() in error paths
    608cc7deb428 mm: memory-failure: update ttu flag inside unmap_poisoned_folio
    79636d2981b0 mm: abort vma_modify() on merge out of memory failure
    9426f383721c mm/page_alloc: fix uninitialized variable
    f57e89c1cb63 block: fix conversion of GPT partition name to 7-bit
    2d448dbd4740 userfaultfd: do not block on locking a large folio with raised refcount
    5ae31c54cff7 NFS: fix nfs_release_folio() to not deadlock via kcompactd writeback
    845590b5a089 s390/traps: Fix test_monitor_call() inline assembly
    83732451a986 dma: kmsan: export kmsan_handle_dma() for modules
    22e4977141df rapidio: fix an API misues when rio_add_net() fails
    c332f3e2df0f rapidio: add check for rio_add_net() in rio_scan_alloc_net()
    848526581f68 selftests/damon/damon_nr_regions: sort collected regiosn before checking with min/max boundaries
    fa450e45ddca selftests/damon/damon_nr_regions: set ops update for merge results check to 100ms
    544e204ee9b9 selftests/damon/damos_quota: make real expectation of quota exceeds
    649edd5d6829 selftests/damon/damos_quota_goal: handle minimum quota that cannot be further reduced
    521e55c2b0d6 wifi: nl80211: reject cooked mode if it is set along with other flags
    be7c5f00aa7f wifi: cfg80211: regulatory: improve invalid hints checking
    7841180342c9 Bluetooth: Add check for mgmt_alloc_skb() in mgmt_device_connected()
    88310caff68a Bluetooth: Add check for mgmt_alloc_skb() in mgmt_remote_name()
    8d19543e941e drm/xe/userptr: Unmap userptrs in the mmu notifier
    ad876ee6c664 drm/xe/userptr: properly setup pfn_flags_mask
    5887c69eae7d drm/xe: Fix fault mode invalidation with unbind
    e8d040baa4d9 drm/xe: Fix GT "for each engine" workarounds
    4b228dae3d2c mptcp: fix 'scheduling while atomic' in mptcp_pm_nl_append_new_local_addr
    1ce892aeef69 drm/xe/vm: Validate userptr during gpu vma prefetching
    d7505770f479 drm/xe/vm: Fix a misplaced #endif
    2a24c98f0e4c drm/xe/hmm: Don't dereference struct page pointers without notifier lock
    9061689118ea drm/xe/hmm: Style- and include fixes
    3ba11a3d9fcb drm/xe: Add staging tree for VM binds
    733a22bfb31b x86/cpu: Properly parse CPUID leaf 0x2 TLB descriptor 0x63
    37309aaac386 x86/cpu: Validate CPUID leaf 0x2 EDX output
    9f89384087c3 x86/cacheinfo: Validate CPUID leaf 0x2 EDX output
    ebed28c4208a x86/boot: Sanitize boot params before parsing command line
    2a21690386f4 platform/x86: thinkpad_acpi: Add battery quirk for ThinkPad X131e
    3e710bac686e Revert "selftests/mm: remove local __NR_* definitions"
    48a934fc471e Revert "mm/page_alloc.c: don't show protection in zone's ->lowmem_reserve[] for empty zone"
    4ca67d51d90d drm/radeon: Fix rs400_gpu_init for ATI mobility radeon Xpress 200M
    3e31371dfff9 drm/imagination: only init job done fences once
    58e37cfcb12a drm/imagination: Hold drm_gem_gpuva lock for unmap
    d993ae736092 drm/imagination: avoid deadlock on fence release
    6c7025b9f86e drm/amd/pm: always allow ih interrupt from fw
    c3cbeafb4e00 drm/amdkfd: Fix NULL Pointer Dereference in KFD queue
    e0345c3478f1 drm/amd/display: Fix null check for pipe_ctx->plane_state in resource_build_scaling_params
    3e92d62d9534 hwmon: (peci/dimmtemp) Do not provide fake thresholds data
    9f956dcf3065 btrfs: fix a leaked chunk map issue in read_one_chunk()
    81eeb98640df ALSA: hda/realtek: update ALC222 depop optimize
    eca9ff7a0eed ALSA: hda/realtek - add supported Mic Mute LED for Lenovo platform
    32573f85ba6f ALSA: hda: intel: Add Dell ALC3271 to power_save denylist
    6d988149e11d ALSA: seq: Avoid module auto-load handling at event delivery
    8fb07fb1bba9 gpio: aggregator: protect driver attr handlers against module unload
    b42c84f9e4ec gpio: rcar: Use raw_spinlock to protect register access
    dbcd7fdd86f7 ksmbd: fix bug on trap in smb2_lock
    a0609097fd10 ksmbd: fix use-after-free in smb2_lock
    159d059cbcb0 ksmbd: fix out-of-bounds in parse_sec_desc()
    3cb2b2e41541 ksmbd: fix type confusion via race condition when using ipc_msg_send_request
    d335fce8b88b HID: appleir: Fix potential NULL dereference at raw event handle
    52532c6c6c69 LoongArch: KVM: Fix GPA size issue about VM
    3700cd7c171b LoongArch: KVM: Reload guest CSR registers after sleep
    5f3f7d2e9adf LoongArch: KVM: Add interrupt checking for AVEC
    41b0b3b75c77 LoongArch: Set max_pfn with the PFN of the last page
    7f50209ffe18 LoongArch: Use polling play_dead() when resuming from hibernation
    55eed991c5e4 LoongArch: Convert unreachable() to BUG()
    c10081d6648b stmmac: loongson: Pass correct arg to PCI function
    a23fbee189f8 tracing: tprobe-events: Reject invalid tracepoint name
    b4a92f312ad9 tracing: tprobe-events: Fix a memory leak when tprobe with $retval
    5b414ed3bbf6 Revert "of: reserved-memory: Fix using wrong number of cells to get property 'alignment'"
    84fc3616b206 rust: alloc: Fix `ArrayLayout` allocations
    641ecd0d0a21 rust: use custom FFI integer types
    0ea8582faa76 rust: map `__kernel_size_t` and friends also to usize/isize
    240529d8556e rust: fix size_t in bindgen prototypes of C builtins
    113720033d16 rust: kbuild: expand rusttest target for macros
    2f6b7da3f620 drm/panic: allow verbose version check
    b5f9e4b81099 drm/panic: allow verbose boolean for clarity
    524f6a2df74b drm/panic: correctly indent continuation of line in list item
    702646c7f02a drm/panic: remove redundant field when assigning value
    c264ae4597a9 drm/panic: prefer eliding lifetimes
    c9a21ede902a drm/panic: remove unnecessary borrow in alignment_pattern
    02ea0483934d drm/panic: avoid reimplementing Iterator::find
    14b6c043275b MAINTAINERS: add entry for the Rust `alloc` module
    298be04c036a kbuild: rust: remove the `alloc` crate and `GlobalAlloc`
    1ef4cf5f98c4 rust: alloc: update module comment of alloc.rs
    ec50a634be2b rust: str: test: replace `alloc::format`
    575f8f47112a rust: alloc: implement `Cmalloc` in module allocator_test
    8079b1b73c4f rust: alloc: implement `contains` for `Flags`
    f261b3ae28d9 rust: error: check for config `test` in `Error::name`
    9c330479d718 rust: error: use `core::alloc::LayoutError`
    718900ae1bf0 rust: alloc: add `Vec` to prelude
    61e82d643c7f rust: alloc: remove `VecExt` extension
    e64a79b9a57f rust: treewide: switch to the kernel `Vec` type
    0a798a23bbab rust: alloc: implement `collect` for `IntoIter`
    94091ef3d5aa rust: alloc: implement `IntoIterator` for `Vec`
    0ca66a44e241 rust: alloc: implement kernel `Vec` type
    2dbf25126498 rust: alloc: introduce `ArrayLayout`
    22e1e850e24f rust: alloc: add `Box` to prelude
    34eb8dcb6261 rust: alloc: remove extension of std's `Box`
    17bb4365ec18 rust: treewide: switch to our kernel `Box` type
    3ca8b102ef62 rust: alloc: implement kernel `Box`
    10027707e1ca rust: alloc: add __GFP_NOWARN to `Flags`
    b1ae22456ab5 rust: alloc: implement `KVmalloc` allocator
    88c5feb07ae0 rust: alloc: implement `Vmalloc` allocator
    a03b5e77dbb5 rust: alloc: add module `allocator_test`
    dcaf3206d942 rust: alloc: implement `Allocator` for `Kmalloc`
    594134eb9cb5 rust: alloc: make `allocator` module public
    e19e92087aba rust: alloc: implement `ReallocFunc`
    b3b7ea4b0d41 rust: alloc: rename `KernelAllocator` to `Kmalloc`
    e40d06619c20 rust: alloc: separate `aligned_size` from `krealloc_aligned`
    4b773fe5668d rust: alloc: add `Allocator` trait
    311d5ecf16c6 rust: error: optimize error type to use nonzero
    6e5a4992d146 rust: error: make conversion functions public
    cf1cdd56d399 Documentation: rust: discuss `#[expect(...)]` in the guidelines
    706d4296b843 rust: start using the `#[expect(...)]` attribute
    a24a26adbaaf Documentation: rust: add coding guidelines on lints
    87052e24eb46 rust: enable Clippy's `check-private-items`
    9dd2e0358b03 rust: provide proper code documentation titles
    a01b7b2c1e95 rust: replace `clippy::dbg_macro` with `disallowed_macros`
    503e18c448bf rust: introduce `.clippy.toml`
    b212da6fdf04 rust: sync: remove unneeded `#[allow(clippy::non_send_fields_in_send_ty)]`
    d09e7c93df7c rust: init: remove unneeded `#[allow(clippy::disallowed_names)]`
    85ad4713660f rust: enable `rustdoc::unescaped_backticks` lint
    c6447d4d83f5 rust: enable `clippy::ignored_unit_patterns` lint
    f07f6c135dbd rust: enable `clippy::unnecessary_safety_doc` lint
    c778ec35c3cc rust: enable `clippy::unnecessary_safety_comment` lint
    4e7072490d67 rust: enable `clippy::undocumented_unsafe_blocks` lint
    870de86d874e rust: types: avoid repetition in `{As,From}Bytes` impls
    3166e8aed0e0 rust: sort global Rust flags
    a3d5dcc9ec48 rust: workqueue: remove unneeded ``#[allow(clippy::new_ret_no_self)]`
    3c0369e453ff loongarch: Use ASM_REACHABLE
    4a442cd27b5f x86/microcode/AMD: Add some forgotten models to the SHA check
    61493dee53d8 btrfs: fix data overwriting bug during buffered write when block size < page size
    f2e8f906f9ed smb311: failure to open files of length 1040 when mounting with SMB3.1.1 POSIX extensions
    c011482fb5fa cifs: Remove symlink member from cifs_open_info_data union
    c13e4b0321ed gpio: vf610: add locking to gpio direction functions
    5d473aefbcd3 gpio: vf610: use generic device_get_match_data()
    729e7d4b1c54 drm/i915/dsi: Use TRANS_DDI_FUNC_CTL's own port width macro
    0131280ddf38 drm/i915/dsi: convert to struct intel_display
    2f8e609aea9a rust: block: fix formatting in GenDisk doc
    ebf6a763904e x86/amd_nb: Use rdmsr_safe() in amd_get_mmconfig_range()
    807165b1ec1c tools/power/x86/intel-speed-select: Prefix header search path with sysroot
    e97df805b938 drm/tilcdc: Set preferred depth
    7160a4379dcc arch/arm64/configs: remove CONFIG_SM_DISPCC_8650
    6d8ac5ebe6e8 aufs6: core
    587abc1b64c4 aufs6: standalone
    1af41d30ef42 aufs6: mmap
    6ee2464d2e9d aufs6: base
    103b676505f7 aufs6: kbuild
    67281562943f qemux86: add configuration symbol to select values
    73f315ca0823 sched/isolation: really align nohz_full with rcu_nocbs
    1e4e7f8ab622 clear_warn_once: add a clear_warn_once= boot parameter
    918e7a825e8b clear_warn_once: bind a timer to written reset value
    f533f87c3758 clear_warn_once: expand debugfs to include read support
    f149ca27cba9 tools: Remove some options from CLANG_CROSS_FLAGS
    e633abe9c44e libbpf: Fix build warning on ref_ctr_off
    ec0916a4cfc1 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    03721ceb5626 perf: x86-32: explicitly include <errno.h>
    4c36c5295bb0 perf: mips64: Convert __u64 to unsigned long long
    b0200449610d perf: fix bench numa compilation
    aff0940b2212 perf: add SLANG_INC for slang.h
    ef912018d28c perf: add sgidefs.h to for mips builds
    d8860f858b87 perf: change --root to --prefix for python install
    dc38a0eee6e5 perf: add 'libperl not found' warning
    6ed51f8786da perf: force include of <stdbool.h>
    c538d4c4ac65 fat: Replace prandom_u32() with get_random_u32()
    63d94846f0c5 fat: don't use obsolete random32 call in namei_vfat
    7816667451ef FAT: Added FAT_NO_83NAME
    f81dbd60f0d5 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    771cdefba44b FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    a24784fd8f88 yaffs2: update to v6.12 folio changes
    d0a48fd46db8 yaffs2: adapt to v6.10 i_time changes
    d097e4d4115a yaffs: fix mtime/itime field access
    4411e0d49fe3 yaffs2: update VFS ctime operations to 6.6+
    1b6619086e8b yaffs2: v6.5 fixups
    25b261ee3c54 yaffs2: Fix miscalculation of devname buffer length
    5c07936a5d1c yaffs2: convert user_namespace to mnt_idmap
    55986a1284b3 yaffs2: replace bdevname call with sprintf
    6f5508f8db8f yaffs2: convert read_page -> readfolio
    fd179a5df5d5 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    c9a620dacdd1 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    78588208ed17 yaffs2: v5.12+ build fixups (not runtime tested)
    8d2dddba272c yaffs: include blkdev.h
    8c1ca9ef9712 yaffs: Fix build failure by handling inode i_version with proper atomic API
    27005cbac2ed yaffs2: v5.6 build fixups
    668211c9f9b7 yaffs2: fix memory leak when /proc/yaffs is read
    285f911dcc1c yaffs: add strict check when call yaffs_internal_read_super
    ffc2ed489ccf yaffs: repair yaffs_get_mtd_device
    6dce4b70a5e3 yaffs: Fix build failure by handling inode i_version with proper atomic API
    19f283abc5d1 yaffs2: fix memory leak in mount/umount
    04e84672b571 yaffs: Avoid setting any ACL releated xattr
    4f221d6a32e2 Yaffs:check oob size before auto selecting Yaffs1
    81f36004e56b fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    26d7a3dd0054 yaffs2: adjust to proper location of MS_RDONLY
    a7016eac4540 yaffs2: import git revision b4ce1bb (jan, 2020)
    feb240bbb91e initramfs: allow an optional wrapper script around initramfs generation
    874746eaa341 drivers: gpu: drm: msm: registers: improve reproducibility
    1d42508faee8 tools: use basename to identify file in gen-mach-types
    4b055eca593d iwlwifi: select MAC80211_LEDS conditionally
    97e20e275ac0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    6dec58319165 defconfigs: drop obselete options
    a416ccb5b6c9 linux-yocto: Handle /bin/awk issues
    7efe8a1e5158 uvesafb: provide option to specify timeout for task completion
    78d10ae07eca uvesafb: print error message when task timeout occurs
    80473b7eb8ca compiler.h: Undef before redefining __attribute_const__
    ddeff2f1a9a7 vmware: include jiffies.h
    3dcdda8912b4 Resolve jiffies wrapping about arp
    3b1507db6735 nfs: Allow default io size to be configured.
    c2fedad05f77 check console device file on fs when booting
    208d6fbada3f mount_root: clarify error messages for when no rootfs found
    dbe9454c8ea0 mconf: fix output of cflags and libraries
    7c7b224f5cce menuconfig,mconf-cfg: Allow specification of ncurses location
    b6c189c81397 modpost: mask trivial warnings
    a5cc21325ba9 kbuild: exclude meta directory from distclean processing
    361ec143c23f powerpc: serialize image targets
    605e6ccb304c arm: serialize build targets
    e94b04fcb7d2 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    44cc7f69a0a0 cpu/amd: inhibit SMP check for qemux86
    a08cb65331e6 x86_64_defconfig: Fix warnings
    8ad332ef777b mips: make current_cpu_data preempt safe
    754f05ddce3f mips: vdso: fix 'jalr $t9' crash in vdso code
    325ff78ff44d mips: Kconfig: add QEMUMIPS64 option
    99ae0eadcf11 4kc cache tlb hazard: tlbp cache coherency
    c6894c66a534 malta uhci quirks: make allowance for slow 4k(e)c
    8b52c01f3294 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    16c7629f035e drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    6b60c874cbb0 arm64: defconfig: cleanup config options
    8e44673ecd89 vexpress: Pass LOADADDR to Makefile
    f34e6805aad5 arm: ARM EABI socketcall
    94dec9b88de4 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 7e15365e52..dd11a8836d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7c2d49c69f3f7e59a598fa8f618b37836fd56404"
-SRCREV_meta ?= "cf35a8d4adea70d86608241d50e1372d50a1484f"
+SRCREV_machine ?= "e9449f7fd2025227dbae7f3c254c1c22c086f856"
+SRCREV_meta ?= "44bd5711078ef3bf89012274afa8df13aaaebbfc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.18"
+LINUX_VERSION ?= "6.12.19"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 543d3e6f97..314bba5fb3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.18"
+LINUX_VERSION ?= "6.12.19"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
-SRCREV_meta ?= "cf35a8d4adea70d86608241d50e1372d50a1484f"
+SRCREV_machine ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
+SRCREV_meta ?= "44bd5711078ef3bf89012274afa8df13aaaebbfc"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 447b2d435e..d1a6b84321 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "375482318a509208c26bfcc6ad6c0958f8338c08"
-SRCREV_machine:qemuarm64 ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
-SRCREV_machine:qemuloongarch64 ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
-SRCREV_machine:qemumips ?= "ca249c72bb9918f520c737e9cd966feb1fc677e6"
-SRCREV_machine:qemuppc ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
-SRCREV_machine:qemuriscv64 ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
-SRCREV_machine:qemuriscv32 ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
-SRCREV_machine:qemux86 ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
-SRCREV_machine:qemux86-64 ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
-SRCREV_machine:qemumips64 ?= "e24e86ef9cfd6a60f835d03e83c78970b7353f48"
-SRCREV_machine ?= "5fb23ddafcdc46eaf87f7e4f50e416ac9114cbf7"
-SRCREV_meta ?= "cf35a8d4adea70d86608241d50e1372d50a1484f"
+SRCREV_machine:qemuarm ?= "e8404cbe72cb5bf44d8a89130f388357c71a73ad"
+SRCREV_machine:qemuarm64 ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
+SRCREV_machine:qemuloongarch64 ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
+SRCREV_machine:qemumips ?= "2afe846961bd3c8a12b803e9aebfd291d4257dfd"
+SRCREV_machine:qemuppc ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
+SRCREV_machine:qemuriscv64 ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
+SRCREV_machine:qemuriscv32 ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
+SRCREV_machine:qemux86 ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
+SRCREV_machine:qemux86-64 ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
+SRCREV_machine:qemumips64 ?= "1d91393bd4ca94c2689da237efc60b15b241be4d"
+SRCREV_machine ?= "1b5e52801e8db782ac8313ca7c10668880d84951"
+SRCREV_meta ?= "44bd5711078ef3bf89012274afa8df13aaaebbfc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "105a31925e2d17b766cebcff5d173f469e7b9e52"
+SRCREV_machine:class-devupstream ?= "e9cc806c0152fa9993f817cebf42989a3e2530bb"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.18"
+LINUX_VERSION ?= "6.12.19"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


