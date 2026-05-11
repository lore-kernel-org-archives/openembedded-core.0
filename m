Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980ECCD4F23
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 20:25:35 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60229.1778531127475032742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 13:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ai/30AHo;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50e5c7eb565so46574591cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778531126; x=1779135926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xOjqEop3ZdQv4/1HVRcLt7Sy+U/hgvl3J0DoQBps6w=;
        b=ai/30AHoIg+kaxBaGIE9Y9y3uCRZ8zKgiL8QoEySQ0vw5COX1A3xRz9w1chT+ymL4/
         msyFQEfZCnYULU8VxDt5ee0fzUEU3MOC+3xZSohbra99LoIWV6Jye1T81WFh64mNAz2U
         6csKxAhzovlXL4JE0FS5WB2Hk/7unp/l38ewuZqmfy7JYYrR2tjWCBtEuTrW9N2lMPeF
         usRTAgQFjIBm2DxyZBpGCrxETEfBF/tmuGyimvx/xav7bKN29Oklca1W5apm11aWW16V
         Xaa4bY31up5+JPM7tIIH0AiYpnNTHa6x0zBrKU1qxCSE8K76WDi/KF4vcBH+uoe3+xS1
         4Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531126; x=1779135926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xOjqEop3ZdQv4/1HVRcLt7Sy+U/hgvl3J0DoQBps6w=;
        b=oRgib4XWugBMkeHt4/WjGgnDmgtZU3pG5zqIEQkUE3ZBHN3+oTd3R5BZ5kLC+xgMBP
         +wH/nGb174RWgKF0nfqkWmgFg4Rbp2wgywQYw83MsvL14xNMMrQ2BdFEmIHWhDVhk3aB
         nn6AVGbYxR/47cCRtqk7fhHMU0O1EJX1oE8RtOqhEr8lOwkIxPxuyF13iusRcHVXEpTm
         7rTcismmzB7gEXKvtOftxo4qd/s7TrMRflzYlchSlNf6qpE2a3mme5eHpCPYGtt6uc+f
         B/RCUfvXdGEhvjdQkXZt8ws0pDP3hEtNONI77n39eq6riAOUkfcPRTfxptIXYNHdGu6n
         qM6w==
X-Gm-Message-State: AOJu0Yw6a4apEpmqGuy5MUtBdU399oRQN0nfC5fmHVEixlst07CLSiZL
	caNmUk6Ns6zo3epTAvTXmpUU7MeVZQbtzmy/BKeW9mfPkvCDNxOqxiXp1TWEPUiHROm3Yw==
X-Gm-Gg: Acq92OEHZHTtmLbpOn7kUo+ujPA7LngTb2CfPlCEisJGZvMmAViZqg5ycYl9IAm3wy+
	hoLaSvg/t0t7IfQBbbD5dK3CjM+N/SyrgdHkJVtA+sZDnCJqXbmOY3dQCdXo1p4GZ+FymBF8UHt
	OGPpGOYKTcm6Vb4KWj7qxFvkrXQhaC+bXYyEllsD8ZF4zEuaRCzJbnpefFJVjTxWMX+6zKGyXDW
	QIhFvhueXnwPXzIXvfQDoeI7EJ3C/wazIvfeEDeJBpPIGl4vXt+ih9NK+SO7tjEdpKN1oU9Zuw3
	09oJp+sKow2izdbaZYBhpFJ7d8p1uGHorjklA27LbOp/KA7j2qvbwxX1LZYITEg7aDGTFLrr3HW
	ExMoNqGPj/KU5UTGRlgbeK4N2FjWw7R8qqHqVB+tybKgKdnwwFkEgPupwPxxQOjw/ISn5bnEiNH
	r5JtBV6dH1w8Z4dpa3jvSJ6RGPYtSx9RQhCm1qQfZMi2lEPOSoENiMPr1eNIt0ima8zrcvYOv2J
	3i7QWJWJC3nK7sTI/Veg+idKY1AKbAVAlI8jH+1bKpOsHmU6hZYHUVk0aU=
X-Received: by 2002:ac8:57d3:0:b0:50d:89f0:9a00 with SMTP id d75a77b69052e-514d2215eb4mr2619471cf.42.1778531126072;
        Mon, 11 May 2026 13:25:26 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e83aa2bsm98213401cf.28.2026.05.11.13.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:25:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 05/09] linux-yocto/6.18: update to v6.18.28
Date: Mon, 11 May 2026 16:25:12 -0400
Message-ID: <20260511202517.1648910-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
References: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 20:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236830

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    c31b94a4231c Linux 6.18.28
    71a1d9d985d2 xfrm: esp: avoid in-place decrypt on shared skb frags
    ce685b6a03dc Linux 6.18.27
    97d35052a816 ipmi:ssif: NULL thread on error
    52a7c9a2823d ipmi:ssif: Remove unnecessary indention
    6f820139d16a netfilter: reject zero shift in nft_bitwise
    b778b6d09542 net: ipv6: fix NOREF dst use in seg6 and rpl lwtunnels
    a8d95d274be2 mm/slab: return NULL early from kmalloc_nolock() in NMI on UP
    05b4ed8bef30 mm/page_alloc: return NULL early from alloc_frozen_pages_nolock() in NMI on UP
    e9b057a44def vmalloc: fix buffer overflow in vrealloc_node_align()
    bdd9503c3d22 ALSA: aloop: Fix peer runtime UAF during format-change stop
    6153878c5255 ALSA: caiaq: fix usb_dev refcount leak on probe failure
    30c000a49094 drm/amdgpu: fix zero-size GDS range init on RDNA4
    c261d07a8057 ipv6: rpl: reserve mac_len headroom when recompressed SRH grows
    3d46009e2ad4 ALSA: caiaq: Don't abort when no input device is available
    1d160e30aa42 ALSA: caiaq: Fix potentially leftover ep1_in_urb at error path
    b8c5acce56e0 driver core: Add kernel-doc for DEV_FLAG_COUNT enum value
    b42821c15445 crypto: authencesn - reject short ahash digests during instance creation
    5cf6d5e5e3b8 net: qrtr: ns: Limit the total number of nodes
    20855cef7e65 net: qrtr: ns: Limit the maximum number of lookups
    35fb4a0c077c net: qrtr: ns: Limit the maximum server registration per node
    5e9f1bad26df iio: frequency: admv1013: fix NULL pointer dereference on str
    c772e9efe2b1 iio: frequency: admv1013: add dev variable
    0adac0ee2c42 media: rc: igorplugusb: heed coherency rules
    7ba734027b2b media: rc: ttusbir: respect DMA coherency rules
    7d7863018f40 wifi: mt76: mt792x: fix mt7925u USB WFSYS reset handling
    0bc155c4ca47 wifi: mt76: mt792x: describe USB WFSYS reset with a descriptor
    09e1c96594af phy: qcom: m31-eusb2: clear PLL_EN during init
    37ef11ab2cf3 phy: qcom: m31-eusb2: Update init sequence to set PHY_ENABLE
    da4a33e739dc mei: me: add nova lake point H DID
    09033be12a82 mei: me: use PCI_DEVICE_DATA macro
    38f113f81d3f lib: test_hmm: evict device pages on file close to avoid use-after-free
    1e67c82fb778 arm64: mm: Fix rodata=full block mapping support for realm guests
    5e07126d7ab8 arm64: mm: Simplify check in arch_kfence_init_pool()
    6f977b0472f7 mm: prevent droppable mappings from being locked
    bbc4bfae9e43 seg6: fix seg6 lwtunnel output redirect for L2 reduced encap mode
    13e550fbfccd scsi: sd: fix missing put_disk() when device_add(&disk_dev) fails
    9da6e314ea5f sched_ext: Documentation: Clarify ops.dispatch() role in task lifecycle
    43222ac484f9 rxgk: Fix potential integer overflow in length check
    3fb7394a8377 rtmutex: Use waiter::task instead of current in remove_waiter()
    f1af27cec07a ntfs3: fix integer overflow in run_unpack() volume boundary check
    d3012690a706 ntfs3: add buffer boundary checks to run_unpack()
    83e31039e0d7 NFSv4.1: Apply session size limits on clone path
    fc8d81f189f0 ktest: Fix the month in the name of the failure directory
    9f4ba5966c78 IB/core: Fix zero dmac race in neighbor resolution
    4db061a40543 gtp: disable BH before calling udp_tunnel_xmit_skb()
    b91e535f208c ceph: only d_add() negative dentries when they are unhashed
    87c99a50e0fd dm mirror: fix integer overflow in create_dirty_log()
    a616126cb080 crypto: nx - Fix packed layout in struct nx842_crypto_header
    354a27e28447 crypto: nx - fix context leak in nx842_crypto_free_ctx
    5c07962fed66 crypto: nx - fix bounce buffer leaks in nx842_crypto_{alloc,free}_ctx
    2ae365e32998 crypto: atmel-sha204a - Fix uninitialized data access on OTP read error
    1193c12126d3 crypto: atmel-sha204a - Fix potential UAF and memory leak in remove path
    64ea9dbf4c77 crypto: atmel-sha204a - Fix error codes in OTP reads
    863d11b39277 crypto: atmel-tdes - fix DMA sync direction
    910f335786a0 crypto: ccree - fix a memory leak in cc_mac_digest()
    808685bfd124 crypto: hisilicon - Fix dma_unmap_single() direction
    9c032781c2b1 crypto: atmel-ecc - Release client on allocation failure
    61516b4a5b26 crypto: atmel-aes - Fix 3-page memory leak in atmel_aes_buff_cleanup
    4d713333dd32 crypto: arm64/aes - Fix 32-bit aes_mac_update() arg treated as 64-bit
    343a5bf68a8f crypto: acomp - fix wrong pointer stored by acomp_save_req()
    c524c124e309 can: ucan: fix devres lifetime
    1656698656f6 bus: mhi: host: pci_generic: Switch to async power up to avoid boot delays
    e08d75753db1 Bluetooth: hci_event: fix potential UAF in SSP passkey handlers
    b4339521bb43 apparmor: use target task's context in apparmor_getprocattr()
    b7a953374db9 mfd: core: Preserve OF node when ACPI handle is present
    e88827bb0399 taskstats: set version in TGID exit notifications
    83bb57635d7c tcp: call sk_data_ready() after listener migration
    69c4d137b22d wifi: rtl8xxxu: fix potential use of uninitialized value
    4f3374c990fb x86/shstk: Prevent deadlock during shstk sigreturn
    ef7ce8f4a341 x86/cpu: Disable FRED when PTI is forced on
    fdaa42ca370d inotify: fix watch count leak when fsnotify_add_inode_mark_locked() fails
    371f4dc80601 HID: apple: ensure the keyboard backlight is off if suspending
    ea43a34452a6 check-uapi: link into shared objects
    73ce72edd113 md/raid5: validate payload size before accessing journal metadata
    1985cb3247e8 md/raid5: fix soft lockup in retry_aligned_read()
    9142f00a9287 md/md-llbitmap: raise barrier before state machine transition
    98623c7e2a51 md/md-llbitmap: skip reading rdevs that are not in_sync
    f7d9d0e4a64f amdgpu/jpeg: fix deepsleep register for jpeg 5_0_0 and 5_0_2
    ac858718219f mtd: spinand: winbond: Declare the QE bit on W25NxxJW
    134975be170b mtd: spi-nor: sst: Fix write enable before AAI sequence
    1e6b0a69bf2c ext4: fix missing brelse() in ext4_xattr_inode_dec_ref_all()
    537e06597702 ext4: fix bounds check in check_xattrs() to prevent out-of-bounds access
    6b4bf6519e50 ring-buffer: Do not double count the reader_page
    f9c279ffee6b ARM: 9472/1: fix race condition on PG_dcache_clean in __sync_icache_dcache()
    cd2689d625b0 perf annotate: Use jump__delete when freeing LoongArch jumps
    5955e053ff00 KVM: nSVM: Always intercept VMMCALL when L2 is active
    009c0f726abe KVM: nSVM: Raise #UD if unhandled VMMCALL isn't intercepted by L1
    83f7e055c138 KVM: nSVM: Add missing consistency check for nCR3 validity
    0d1f3fd2664b KVM: nSVM: Drop the non-architectural consistency check for NP_ENABLE
    aabd785f9565 KVM: nSVM: Add missing consistency check for EFER, CR0, CR4, and CS
    d79720fc9959 KVM: nSVM: Clear tracking of L1->L2 NMI and soft IRQ on nested #VMEXIT
    b6656ba26525 KVM: nSVM: Clear EVENTINJ fields in vmcb12 on nested #VMEXIT
    c2fad967e652 KVM: nSVM: Clear GIF on nested #VMEXIT(INVALID)
    d6f6371bbea6 KVM: nSVM: Triple fault if mapping VMCB12 fails on nested #VMEXIT
    410ea5575c66 KVM: nSVM: Refactor writing vmcb12 on nested #VMEXIT as a helper
    72fe7d04a669 KVM: nSVM: Refactor checking LBRV enablement in vmcb12 into a helper
    49c8b2395bac KVM: nSVM: Always inject a #GP if mapping VMCB12 fails on nested VMRUN
    2b922a42b531 KVM: SVM: Add missing save/restore handling of LBR MSRs
    18ff4ab16412 KVM: SVM: Switch svm_copy_lbrs() to a macro
    a5ea402844f1 KVM: nSVM: Delay setting soft IRQ RIP tracking fields until vCPU run
    a3f0981a5a0e KVM: nSVM: Avoid clearing VMCB_LBR in vmcb12
    88572f9d83d7 KVM: nSVM: Use vcpu->arch.cr2 when updating vmcb12 on nested #VMEXIT
    3a95eb7c6950 KVM: nSVM: Delay stuffing L2's current RIP into NextRIP until vCPU run
    3428ed1529a1 KVM: nSVM: Always use NextRIP as vmcb02's NextRIP after first L2 VMRUN
    46b3827abc44 KVM: nSVM: Ensure AVIC is inhibited when restoring a vCPU to guest mode
    8302e9be9f9c KVM: SVM: Explicitly mark vmcb01 dirty after modifying VMCB intercepts
    c15392ed9e49 KVM: SVM: Inject #UD for INVLPGA if EFER.SVME=0
    497f6af9679f KVM: nSVM: Sync interrupt shadow to cached vmcb12 after VMRUN of L2
    076ab13fe321 KVM: nSVM: Sync NextRIP to cached vmcb12 after VMRUN of L2
    e07ad47e53e9 KVM: nSVM: Mark all of vmcb02 dirty when restoring nested state
    c098979293da KVM: x86: Defer non-architectural deliver of exception payload to userspace read
    26f01d03775e LoongArch: KVM: Use CSR_CRMD_PLV in kvm_arch_vcpu_in_kernel()
    fe06ea2f7b7f userfaultfd: allow registration of ranges below mmap_min_addr
    0fedd09ef952 mm/damon/core: use time_in_range_open() for damos quota window start
    b09958e235f2 mm/damon/core: validate damos_quota_goal->nid for node_mem_{used,free}_bp
    8a62c58411cb mm/damon/stat: fix memory leak on damon_start() failure in damon_stat_start()
    c42a7efb9060 mm/mempolicy: fix memory leaks in weighted_interleave_auto_store()
    687ccdf58216 mm/vmalloc: take vmap_purge_lock in shrinker
    5184e2c065e3 rtc: ntxec: fix OF node reference imbalance
    b5856e85a1f0 tpm: tpm_tis: stop transmit if retries are exhausted
    6503775a5c41 tpm: tpm_tis: add error logging for data transfer
    53e6d2d834df tpm: Use kfree_sensitive() to free auth session in tpm_dev_release()
    726ce5042359 tpm: Fix auth session leak in tpm2_get_random() error path
    f8775d9d9062 tpm2-sessions: Fix missing tpm_buf_destroy() in tpm2_read_public()
    82aa32a4d697 pwm: imx-tpm: Count the number of enabled channels in probe
    dedaa897b9d7 crypto: talitos - rename first/last to first_desc/last_desc
    4861d6cd923f crypto: talitos - fix SEC1 32k ahash request limitation
    75d40ccf38ca firmware: google: framebuffer: Do not unregister platform device
    5c293a1e1ef0 xfs: fix a resource leak in xfs_alloc_buftarg()
    fe570daa5193 xfs: start gc on zonegc_low_space attribute updates
    27f561bf894e crypto: qat - fix IRQ cleanup on 6xxx probe failure
    6d8087a7d0f3 arm64: dts: ti: am62-verdin: Enable pullup for eMMC data pins
    52e1a80bacc6 mmc: sdhci-of-dwcmshc: Disable clock before DLL configuration
    d73c3a4070dc mmc: block: use single block write in retry
    d780f24a4939 randomize_kstack: Maintain kstack_offset per task
    95d48e37a130 hwmon: (pt5161l) Fix bugs in pt5161l_read_block_data()
    6b11dfb3c517 ASoC: Intel: avs: replace strcmp with sysfs_streq
    77eb3e79a3e7 drm/amd: Fix set but not used warnings
    b3166d165753 fs: prepare for adding LSM blob to backing_file
    b69a8729f84a hwmon: (isl28022) Fix integer overflow in power calculation on 32-bit
    bff7dbfc326a power: supply: axp288_charger: Do not cancel work before initializing it
    988eff645be4 LoongArch: Show CPU vulnerabilites correctly
    c5dfddc57f1b tpm: avoid -Wunused-but-set-variable
    80f54d6f9142 extract-cert: Wrap key_pass with '#ifdef USE_PKCS11_ENGINE'
    11baa8b24bcb spi: fix resource leaks on device setup failure
    016bc6636573 libceph: Prevent potential null-ptr-deref in ceph_handle_auth_reply()
    c2178ff1c70e ipv4: icmp: validate reply type before using icmp_pointers
    9b924f3a26b2 RDMA/rxe: Validate pad and ICRC before payload_size() in rxe_rcv
    f344f04e33bf tracing/fprobe: Reject registration of a registered fprobe before init
    38387ccc0fbe slub: fix data loss and overflow in krealloc()
    9eed57e9defd drm/arcpgu: fix device node leak
    e9be7d2fb0b1 net: ks8851: Avoid excess softirq scheduling
    f826f0000100 net: mctp: fix don't require received header reserved bits to be zero
    20ba739bd627 netconsole: avoid out-of-bounds access on empty string in trim_newline()
    5424e678f9b3 net: bridge: use a stable FDB dst snapshot in RCU readers
    be8aad558b46 net: ks8851: Reinstate disabling of BHs around IRQ handler
    ea0b5d0fe963 net/smc: avoid early lgr access in smc_clc_wait_msg
    1c2afc4a1dd1 net: txgbe: fix firmware version check
    033370ffb3c9 net: rds: fix MR cleanup on copy error
    154fc7fe3f62 net: qrtr: ns: Free the node during ctrl_cmd_bye()
    7ef5b521785b arm64: dts: marvell: uDPU: add ethernet aliases
    d29cafc7e4ee net: txgbe: fix RTNL assertion warning when remove module
    491344b826a5 tools/accounting: handle truncated taskstats netlink messages
    ff591df2cd7f EDAC/versalnet: Fix memory leak in remove and probe error paths
    761c37b761ed rxrpc: Fix rxrpc_input_call_event() to only unshare DATA packets
    76cb9a2d2522 rxrpc: Fix re-decryption of RESPONSE packets
    293095ef6188 rxrpc: Fix error handling in rxgk_extract_token()
    f0d3efd03b2a rxrpc: Fix rxkad crypto unalignment handling
    ca71ac2de389 rxrpc: Fix conn-level packet handling to unshare RESPONSE packets
    861b9a0a1823 rxrpc: Fix memory leaks in rxkad_verify_response()
    996b0487b3cd rxrpc: Fix potential UAF after skb_unshare() failure
    d42d5404782f iio: adc: ad7768-1: remove switch to one-shot mode
    4ca3746d9492 iio: adc: ad7768-1: fix one-shot mode data acquisition
    54af1a51bb8b ALSA: pcmtest: Fix resource leaks in module init error paths
    91c8e75ba1f1 ALSA: pcmtest: fix reference leak on failed device registration
    89ed38540e6b ALSA: hda/realtek - Add mute LED support for HP Victus 15-fa2xxx
    1ac67f49ae2c ALSA: 6fire: Fix input volume change detection
    e59ecd4ee3a4 ALSA: caiaq: Handle probe errors properly
    30bd9ed68c84 ALSA: caiaq: Fix control_put() result and cache rollback
    33df74673674 ALSA: core: Fix potential data race at fasync handling
    9678e1b7f512 io_uring/poll: ensure EPOLL_ONESHOT is propagated for EPOLL_URING_WAKE
    ea0697129807 io_uring/poll: fix signed comparison in io_poll_get_ownership()
    23b4b18bac28 iio: adc: ti-ads7950: use iio_push_to_buffers_with_ts_unaligned()
    8661370e0865 block: relax pgmap check in bio_add_page for compatible zone device pages
    dd154d768db5 io_uring/timeout: check unused sqe fields
    81880f84cb36 block: fix zone write plugs refcount handling in disk_zone_wplug_schedule_bio_work()
    ad0126ffcba8 rbd: fix null-ptr-deref when device_add_disk() fails
    4d79d0cf6538 selftests/landlock: Skip stale records in audit_match_record()
    127ae2e73e61 selftests/landlock: Fix snprintf truncation checks in audit helpers
    1e85a1ae1452 selftests/landlock: Fix format warning for __u64 in net_test
    a496488e1702 selftests/landlock: Drain stale audit records on init
    2fcde49092aa landlock: Fix LOG_SUBDOMAINS_OFF inheritance across fork()
    df865a3bb91b selftests/mqueue: Fix incorrectly named file
    558aa1e2cd11 sched: Use u64 for bandwidth ratio calculations
    961db0b89200 reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device lifetime
    06d0bed2552f remoteproc: xlnx: Only access buffer information if IPI is buffered
    8ba804869382 RDMA/mana_ib: Disable RX steering on RSS QP destroy
    dffdcbeabaac PCI: cadence: Use cdns_pcie_read_sz() for byte or word read access
    1fe317364cb5 parisc: Drop ip_fast_csum() inline assembly implementation
    e6e3724c7870 parisc: _llseek syscall is only available for 32-bit userspace
    c2462d54af3c nvme: respect NVME_QUIRK_DISABLE_WRITE_ZEROES when wzsl is set
    8bcc66896e01 nvme-pci: add NVME_QUIRK_DISABLE_WRITE_ZEROES for Kingston OM3SGP4
    d89044889ecd mtd: docg3: fix use-after-free in docg3_release()
    2774bcf71473 mm/hugetlb: fix early boot crash on parameters without '=' separator
    2691332ad88b mm/damon/core: fix damon_call() vs kdamond_fn() exit race
    d5b495ba9de0 mm/alloc_tag: clear codetag for pages allocated before page_ext initialization
    3c52d0946977 mfd: stpmic1: Attempt system shutdown twice in case PMIC is confused
    377f5ad257fb io_uring/register: fix ring resizing with mixed/large SQEs/CQEs
    cac2106bb9a2 md/raid10: fix deadlock with check operation and nowait requests
    bdf33ba450af KVM: selftests: Fix reserved value WRMSR testcase for multi-feature MSRs
    2b2fee890250 jbd2: fix deadlock in jbd2_journal_cancel_revoke()
    858bc8b9edb6 ipmi:ssif: Clean up kthread on errors
    8ebb951a284b erofs: fix the out-of-bounds nameoff handling for trailing dirents
    33074b1e6c18 ALSA: seq_oss: return full count for successful SEQ_FULLSIZE writes
    09496158f6eb ALSA: ctxfi: Add fallback to default RSR for S/PDIF
    8d3124290a03 ALSA: aoa: Skip devices with no codecs in i2sbus_resume()
    df462e82e82c ALSA: aoa: i2sbus: fix OF node lifetime handling
    e79427ee11a8 ALSA: aoa: i2sbus: clear stale prepared state
    0ae7d28dda5c mm/zsmalloc: copy KMSAN metadata in zs_page_migrate()
    2dde6377ab2e ext2: reject inodes with zero i_nlink and valid mode in ext2_iget()
    2e127ceb1c41 net: qrtr: ns: Fix use-after-free in driver remove()
    da47f8a5958c media: i2c: imx219: Check return value of devm_gpiod_get_optional() in imx219_probe()
    4d3a4638e9d2 lib/ts_kmp: fix integer overflow in pattern length calculation
    dca29d20ab23 PCI: epf-mhi: Return 0, not remaining timeout, when eDMA ops complete
    127a1fe59c78 Revert "ALSA: usb: Increase volume range that triggers a warning"
    65fc57c8b8f0 PCI: endpoint: pci-epf-ntb: Remove duplicate resource teardown
    4ca4351d269f crypto: atmel-sha204a - Fix OTP sysfs read and error handling
    26506a30e0e2 media: mtk-jpeg: fix use-after-free in release path due to uncancelled work
    19ca9475f18f net: strparser: fix skb_head leak in strp_abort_strp()
    63d21a3aa010 net: caif: clear client service pointer on teardown
    654c818a69c2 ALSA: control: Validate buf_len before strnlen() in snd_ctl_elem_init_enum_names()
    fdc150dac1ad media: amphion: Fix race between m2m job_abort and device_run
    e0a621459c61 PCI: imx6: Skip waiting for L2/L3 Ready on i.MX6SX
    b6e61356ad24 EDAC/versalnet: Fix device_node leak in mc_probe()
    b6cb07f02253 hwmon: (powerz) Fix missing usb_kill_urb() on signal interrupt
    5b6122a67a29 of: unittest: fix use-after-free in testdrv_probe()
    7f0f0926f301 of: unittest: fix use-after-free in of_unittest_changeset()
    824897e69d7a dt-bindings: display: ti, am65x-dss: Fix AM62L DSS reg and clock constraints
    77d55bc8675e crypto: pcrypt - Fix handling of MAY_BACKLOG requests
    ebc235675f24 crypto: algif_aead - snapshot IV for async AEAD requests
    efc52947247a mm: call ->free_folio() directly in folio_unmap_invalidate()
    ff8a7996dc8b spi: ch341: fix memory leaks on probe failures
    132e47030b0b spi: imx: fix use-after-free on unbind
    75f8f3c3e091 thermal: core: Fix thermal zone governor cleanup issues
    2810fc760aaf um: drivers: call kernel_strrchr() explicitly in cow_user.c
    5d6c349c9823 vfio/cdx: Fix NULL pointer dereference in interrupt trigger path
    7b436ade16cc vfio/cdx: Serialize VFIO_DEVICE_SET_IRQS with a per-device mutex
    08da3594c8ba vfio/virtio: Convert list_lock from spinlock to mutex
    7aa27b20e938 vfio: selftests: Fix VLA initialisation in vfio_pci_irq_set()
    4e179a60a60c wifi: mwifiex: fix use-after-free in mwifiex_adapter_cleanup()
    000134a20bbf wifi: rtw88: check for PCI upstream bridge existence
    a02363f71a79 zram: do not forget to endio for partial discard requests
    a516d4388662 Input: edt-ft5x06 - fix use-after-free in debugfs teardown
    3c636a3edca9 ocfs2: split transactions in dio completion to avoid credit exhaustion
    944a6864aa06 mm: migrate: requeue destination folio on deferred split queue
    3f8805b8ca23 arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
    ecb3e4fa31ff firmware: google: framebuffer: Do not mark framebuffer as busy
    f51f85c04480 fs: afs: revert mmap_prepare() change
    d4d0c91a0afc kbuild: rust: allow `clippy::uninlined_format_args`
    5447be57b311 rust: dma: remove DMA_ATTR_NO_KERNEL_MAPPING from public attrs
    4404d7d2dda4 drm/nouveau: fix nvkm_device leak on aperture removal failure
    fa9a4c5e69aa device property: Make modifications of fwnode "flags" thread safe
    3e8fefd2997c driver core: Don't let a device probe until it's ready
    c1c2417c60db ibmasm: fix heap over-read in ibmasm_send_i2o_message()
    ee5737891464 ibmasm: fix OOB reads in command_file_write due to missing size checks
    22a16d3eafee misc: ibmasm: fix OOB MMIO read in ibmasm_handle_mouse_interrupt()
    b2801647c203 greybus: gb-beagleplay: fix sleep in atomic context in hdlc_tx_frames()
    fb91d4e49fcb greybus: gb-beagleplay: bound bootloader receive buffering
    438e357b3cc6 leds: qcom-lpg: Check for array overflow when selecting the high resolution
    332884f5eb79 drm/nouveau: fix u32 overflow in pushbuf reloc bounds check
    85cbf7fb568a LoongArch: Add spectre boundry for syscall dispatch table
    c578b48b9fdf ALSA: usb-audio: Evaluate packsize caps at the right place
    b216de91c0c0 usb: chipidea: core: allow ci_irq_handler() handle both ID and VBUS change
    6f480aa64d4d usb: chipidea: otg: not wait vbus drop if use role_switch
    49340680d41f usb: xhci: Make usb_host_endpoint.hcpriv survive endpoint_disable()
    f28a8281792b ALSA: usb-audio: Fix Audio Advantage Micro II SPDIF switch
    9bbbbbd404d3 ALSA: usb-audio: Avoid false E-MU sample-rate notifications
    4d7893a137ea ALSA: usb-audio: stop parsing UAC2 rates at MAX_NR_RATES

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 0be25ae2a2..8002faf245 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e1a1c058b8b1fd85e631c877cacb0e5c38da1c57"
-SRCREV_meta ?= "127f83ad4e21b6663d72fceba80bfb945c21e4f0"
+SRCREV_machine ?= "67f352d4d0901a3c3c2cb2cbecd23c66c793e860"
+SRCREV_meta ?= "c99063540e188e32b089f957e192780f5a4adf88"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.26"
+LINUX_VERSION ?= "6.18.28"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 1ff5f5d1d1..2b824c75c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.26"
+LINUX_VERSION ?= "6.18.28"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
-SRCREV_meta ?= "127f83ad4e21b6663d72fceba80bfb945c21e4f0"
+SRCREV_machine ?= "ed7dda90e9cbe47b9a234a82c41be27d624f7ee7"
+SRCREV_meta ?= "c99063540e188e32b089f957e192780f5a4adf88"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 87e46024ca..de435d99e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "11ba8770344f8b1cf3d6960b2d04ca19ed6d1f81"
-SRCREV_machine:qemuarm64 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
-SRCREV_machine:qemuloongarch64 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_machine:qemuarm ?= "3f4d05e9da100380b042f317240ef81262ed1574"
+SRCREV_machine:qemuarm64 ?= "ed7dda90e9cbe47b9a234a82c41be27d624f7ee7"
+SRCREV_machine:qemuloongarch64 ?= "ed7dda90e9cbe47b9a234a82c41be27d624f7ee7"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
-SRCREV_machine:qemuriscv64 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
-SRCREV_machine:qemuriscv32 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
-SRCREV_machine:qemux86 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
-SRCREV_machine:qemux86-64 ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
+SRCREV_machine:qemuppc ?= "ed7dda90e9cbe47b9a234a82c41be27d624f7ee7"
+SRCREV_machine:qemuriscv64 ?= "ed7dda90e9cbe47b9a234a82c41be27d624f7ee7"
+SRCREV_machine:qemuriscv32 ?= "ed7dda90e9cbe47b9a234a82c41be27d624f7ee7"
+SRCREV_machine:qemux86 ?= "ed7dda90e9cbe47b9a234a82c41be27d624f7ee7"
+SRCREV_machine:qemux86-64 ?= "ed7dda90e9cbe47b9a234a82c41be27d624f7ee7"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "4267d0126960b8bc599060c71014e8d8a4b8becf"
-SRCREV_meta ?= "127f83ad4e21b6663d72fceba80bfb945c21e4f0"
+SRCREV_machine ?= "ed7dda90e9cbe47b9a234a82c41be27d624f7ee7"
+SRCREV_meta ?= "c99063540e188e32b089f957e192780f5a4adf88"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "1fe06068166d4fc16722201f267b1fe19efad639"
+SRCREV_machine:class-devupstream ?= "c31b94a4231c974dca12e6b83f2af1d1d95dfc5e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.26"
+LINUX_VERSION ?= "6.18.28"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


