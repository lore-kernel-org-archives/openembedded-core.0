Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909EAC54F4E
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:21 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7140.1785054613513637922
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PczPwVwy;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1280055f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054611; x=1785659411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uTpxFsdhpBqL01Fv30SdUQulFkZV/BNavPp/nzL4XL0=;
        b=PczPwVwyJ9jyzHowN3Ihz60ZHGNG75Bv5O8K6yOMmbYpYbufRWUrjDxvXlKFxM5LAI
         slQ0SnqFKm1a3yFcLQh6VDjIeCvZ+Zz2R7hvEX9Y0LRdMAckwSbgss5Oa771KS6EURI8
         fNJllWnidB3YTRWZjf8oaApYtFDNGDpjXEGac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054611; x=1785659411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uTpxFsdhpBqL01Fv30SdUQulFkZV/BNavPp/nzL4XL0=;
        b=NMN46lYFJXekduCuJ6XHry2QQzP24TM4bF/4Bk/mTWCrmyVMwxSJ2MZC/oamoEEdQE
         NMXshAiXoYAPT4VEGVDTZ1Ct7UVoqjxoNK6DVbCJDKJx23VFYD9j+Y57wBlCE3rrTdUu
         3dS5KEvCMreiwf+KrrLCnlEUCGBd+wg/h7lrLRT4G4JEzG31mgD748iuiquJMlVpJ/cw
         8G7uUan6c9SKWocO3U2RUrDbFE54GU0Q4r20Xbfl1sl3JP0alpEKmP6mtFza7iVQk/IJ
         qm+YZrUSoerufS8091aN2UK1MjgSNcxYT2gmthCK447+1HaxoVVNHKCsofI5DVRtPLE7
         0kvQ==
X-Gm-Message-State: AOJu0Yy9xGit9c1WNz9yrGvmy1gRos10LM5Dl/h/+u1j7WiR9Pbr8cZG
	DNRn6NVsomcL4BaaGhq+3x45eKjbIRAmGLcHBQIglEa/mPNF299ghBt2BsZ/1hrFxss+RQbZkPO
	qUpzWReo=
X-Gm-Gg: AR+sD13X02mMI0WVfGCAR4i2bJ5S/RlcDfVqWonuLtH5wDY+iYv8yeMH2/cmcK5qdDz
	ZZFTN0ZZWxIM9De7oXgDDRStRfn6kVoXGPSnfg1yhRX0dE/Ampfa8/bAq3PYR1dB3yWJbZhmTi4
	zLfxaU54HXXH2j6MSV5d1EiJ3//JiDC+1m32KtYgweUv/pHzuaN0l1PLFjMx8uRHlMYZUGPURQF
	qvhoB2IFFTKbbdzKYUkTqveZRpkkZsjYhOwx5JQsArVQ277WxDGDd1FQegl7AsaAN0qJVXuH7ul
	yPHDCNdnUF8KHHnt8GzMsZLLnP6ljcqHz85S3l8j5yL3lAMqRqdYBMgQdu4YhthroFKbsb3TxSs
	ZxgFlJo2PJh2gc42ZlOMiMu6Ks0Eg3qay3Ul7AQw19bmmQI87KjhplL8fPn7OxuEmCcg1mJtcRw
	sMNKMjvPT9gTAGBHQAW00Qt4IwA3wFvtEHo+CJE3+51m1QyfKwr7zVmfUc2qrjJJlAxmZJyAZQJ
	jUrYgf7lSF15vYG
X-Received: by 2002:a05:600c:a49:b0:495:4e12:6ae5 with SMTP id 5b1f17b1804b1-496b5754379mr58784665e9.26.1785054611066;
        Sun, 26 Jul 2026 01:30:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/31] linux-yocto/6.6: update to v6.6.144
Date: Sun, 26 Jul 2026 10:29:27 +0200
Message-ID: <6eeed0e2fee69c3c13f3b20f419d0ca25c9d8def.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241985

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    da47cbc254661 Linux 6.6.144
    6848a6e39cac4 crypto: qat - remove unused character device and IOCTLs
    1a42f84b0f6b5 crypto: qat - Return pointer directly in adf_ctl_alloc_resources
    30d648e225447 crypto: qat - Replace kzalloc() + copy_from_user() with memdup_user()
    c0b8e6eea1b2b Documentation: ioctl-number: Extend "Include File" column width
    802e113cf120d drivers/base/memory: set mem->altmap after successful device registration
    511d2b92f8d20 serial: 8250_dw: unregister 8250 port if clk_notifier_register() fails
    851e1847f881e serial: qcom_geni: Fix RX DMA stall when SE_DMA_RX_LEN_IN is zero
    36599894fa853 ksmbd: fix out-of-bounds read in smb_check_perm_dacl()
    2ef8f2a5695ae NFS: Prevent resource leak in nfs_alloc_server()
    6c344fff2feff NFSv4/pNFS: reject zero-length r_addr in nfs4_decode_mp_ds_addr
    abc978daffd26 nfsd: check get_user() return when reading princhashlen
    1e96239fddcef nfsd: fix posix_acl leak on SETACL decode failure
    1e04be34cafae NFSD: Fix SECINFO_NO_NAME decode error cleanup
    1a7ee9f9f3957 fbdev: modedb: Fix misaligned fields in the 1920x1080-60 mode
    c7dc382439f7b fbdev: modedb: fix a possible UAF in fb_find_mode()
    7640b4f68acb5 fbdev: Fix fb_new_modelist to prevent null-ptr-deref in fb_videomode_to_var
    c04d606f8b35e power: reset: linkstation-poweroff: fix use-after-free in the linkstation_poweroff_init()
    889c2a9c59897 KVM: SVM: Fix page overflow in sev_dbg_crypt() for ENCRYPT path
    d18756b12aab3 KVM: x86: hyper-v: Bound the bank index when querying sparse banks
    b84f46179c806 9p: avoid putting oldfid in p9_client_walk() error path
    c5a125eadba05 ocfs2: reject oversized group bitmap descriptors
    ddf13f91ca82c rpmsg: char: Fix use-after-free on probe error path
    fbaf509ad7cb2 fpga: region: fix use-after-free in child_regions_with_firmware()
    44567537a2623 irqchip/imgpdc: Fix resource leak, add missing chained handler cleanup on remove
    7e37e9b3e82ad pNFS: Fix use-after-free in pnfs_update_layout()
    eaca7dae02fab tipc: fix slab-use-after-free Read in tipc_aead_decrypt_done
    96e545410c4f7 blk-cgroup: fix UAF in __blkcg_rstat_flush()
    508a0139d3bf6 hdlc_ppp: sync per-proto timers before freeing hdlc state
    4fe388218826d gfs2: fix use-after-free in gfs2_qd_dealloc
    8e0abc17fbd7e exfat: fix potential use-after-free in exfat_find_dir_entry()
    ab465495b1ed5 MIPS: DEC: Prevent initial console buffer from landing in XKPHYS
    81fc9a13acae9 bpf: use kvfree() for replaced sysctl write buffer
    fda128096fc84 f2fs: keep atomic write retry from zeroing original data
    7e4d8f98be63f f2fs: fix incorrect FI_NO_EXTENT handling in __destroy_extent_node()
    1ddf3fd21c4c6 f2fs: validate ACL entry sizes in f2fs_acl_from_disk()
    24f8c87070c3e f2fs: fix to round down start offset of fallocate for pin file
    13e4b59d3a941 f2fs: validate compress cache inode only when enabled
    bd499f138ccf7 wifi: iwlwifi: mvm: fix race condition in PTP removal
    2b2060c2075a7 wifi: rtw88: usb: fix memory leaks on USB write failures
    6579dcb5e0f74 wifi: rtw88: increase TX report timeout to fix race condition
    16eef2a52687b wifi: rtlwifi: rtl8821ae: Fix C2H bit location in RX descriptor
    318703b6f71d1 wifi: ath11k: fix warning when unbinding
    a2e631fa91bb2 wifi: mt76: mt76x2u: Add support for ELECOM WDC-867SU3S
    35ab4db86774d keys: Pin request_key_auth payload in instantiate paths
    5966e4e2ba213 KEYS: fix overflow in keyctl_pkey_params_get_2()
    03ef56495f0be err.h: use __always_inline on all error pointer helpers
    5267eab88fa4c fbdev: fix use-after-free in store_modes()
    06f6dd2ff2bd0 NTB: epf: Avoid pci_iounmap() with offset when PEER_SPAD and CONFIG share BAR
    15fd83a1e42ed apparmor: fix use-after-free in rawdata dedup loop
    faea60deaa05c apparmor: mediate the implicit connect of TCP fast open sendmsg
    0eb4c16c4adb2 net: skmsg: preserve sg.copy across SG transforms
    e28e7fd34c449 mac802154: llsec: add skb_cow_data() before in-place crypto
    82c17e13d404f af_unix: Set gc_in_progress to true in unix_gc().
    5f0b95ef68ab9 nvmet-tcp: fix race between ICReq handling and queue teardown
    e8852ae29868e ntfs3: reject direct userspace writes to reserved $LX* xattrs
    ce494707a9c07 ipv4: account for fraggap on the paged allocation path
    f79f0db614160 inet: add indirect call wrapper for getfrag() calls
    65fb14cbebb0c ipv6: account for fraggap on the paged allocation path
    2660bd8333ab6 batman-adv: tvlv: avoid race of cifsnotfound handler state
    9c9f4e69368a4 batman-adv: tvlv: enforce 2-byte alignment
    d7fdbab25eae6 batman-adv: dat: prevent false sharing between VLANs
    a8da361cdd929 batman-adv: tt: track roam count per VID
    e82a02a0c1aa2 batman-adv: tt: don't merge change entries with different VIDs
    0e868200cf042 batman-adv: tp_meter: handle overlapping packets
    31dec4dc86cf6 batman-adv: tp_meter: prevent parallel modifications of last_recv
    be3af0c705a13 batman-adv: tp_meter: annotate last_recv_time access with READ/WRITE_ONCE
    f8c499fd275e5 batman-adv: tp_meter: restrict number of unacked list entries
    97644fdaaf644 batman-adv: v: prevent OGM aggregation on disabled hardif
    3af7f10d5fe44 batman-adv: frag: avoid underflow of TTL
    cb96aa1737200 batman-adv: frag: ensure fragment is writable before modifying TTL
    5263ff0bbd132 batman-adv: fix (m|b)cast csum after decrementing TTL
    4741001ca0b04 batman-adv: ensure bcast is writable before modifying TTL
    29f59324e61fc batman-adv: tp_meter: initialize last_recv_time during init
    b88f8f4e5e78e batman-adv: prevent ELP transmission interval underflow
    b5cf66cdc49b1 batman-adv: bla: annotate lasttime access with READ/WRITE_ONCE
    75445cf501ac7 batman-adv: tp_meter: add only finished tp_vars to lists
    4774a32baec46 batman-adv: tp_meter: handle seqno wrap-around for fast recovery detection
    ec8ef37fea33c batman-adv: tp_meter: fix fast recovery precondition
    cd74176cf1685 batman-adv: tp_meter: avoid divide-by-zero for dec_cwnd
    f58e5df92180e batman-adv: tp_meter: avoid window underflow
    774d22045a8fa batman-adv: tp_meter: initialize dec_cwnd explicitly
    0c610db91bbde batman-adv: tp_meter: initialize dup_acks explicitly
    edae04afb11f6 batman-adv: tp_meter: keep unacked list in ascending ordered
    bc6c380c1159d selinux: fix overlayfs mmap() and mprotect() access checks
    41c5b269af8b1 lsm: add backing_file LSM hooks
    ba3ebdd89fa20 fs: prepare for adding LSM blob to backing_file
    922a03b26e354 Bluetooth: btmtk: accept too short WMT FUNC_CTRL events
    36c85f7029484 Bluetooth: btmtk: validate WMT event SKB length before struct access
    7536ebe0473d9 Revert "ptp: add testptp mask test"
    48b91ed7e22bb KVM: x86/mmu: Ensure hugepage is in by slot before checking max mapping level
    9291654d69e08 KVM: x86: Fix shadow paging use-after-free due to unexpected role
    2de4db145b299 eventpoll: fix ep_remove struct eventpoll / struct file UAF
    a0e685da1efe0 eventpoll: move epi_fget() up
    20423e2c1c84a eventpoll: rename ep_remove_safe() back to ep_remove()
    0a4a2db528b0e eventpoll: drop vestigial __ prefix from ep_remove_{file,epi}()
    f484ab90b2290 eventpoll: kill __ep_remove()
    903070f8f3552 eventpoll: split __ep_remove()
    ff4fe83a9aabb eventpoll: use hlist_is_singular_node() in __ep_remove()
    44e8907b81fea file: add fput() cleanup helper
    2181a09ba980f virtiofs: fix UAF on submount umount
    cd923dadefadb media: vidtv: fix NULL pointer dereference in vidtv_mux_push_si
    d2bbbb6c55812 ksmbd: reject non-VALID session in compound request branch
    8232fca738011 vc_screen: fix null-ptr-deref in vcs_notifier() during concurrent vcs_write
    08fbcba06e968 scripts/sorttable: Fix endianness handling in build-time mcount sort
    80514e97c50ab scripts/sorttable: Allow matches to functions before function entry
    9ba53f9808e1e scripts/sorttable: Use normal sort if theres no relocs in the mcount section
    e115e9fa69b48 ftrace: Check against is_kernel_text() instead of kaslr_offset()
    379e755ec2c54 ftrace: Test mcount_loc addr before calling ftrace_call_addr()
    bf802b936a7b2 ftrace: Do not over-allocate ftrace memory
    4c30b173b6176 ftrace: Have ftrace pages output reflect freed pages
    dc06779d338de ftrace: Update the mcount_loc check of skipped entries
    4893af6318fe8 scripts/sorttable: Zero out weak functions in mcount_loc table
    bbfbacec9e000 scripts/sorttable: Always use an array for the mcount_loc sorting
    38be2ffe9808b scripts/sorttable: Have mcount rela sort use direct values
    fe0434d604a94 arm64: scripts/sorttable: Implement sorting mcount_loc at boot for arm64
    8297f13962063 scripts/sorttable: Use a structure of function pointers for elf helpers
    ff7e015d63849 scripts/sorttable: Get start/stop_mcount_loc from ELF file directly
    ecbb09356560c scripts/sorttable: Move code from sorttable.h into sorttable.c
    7fbddce9a2685 scripts/sorttable: Use uint64_t for mcount sorting
    23b5a9659a27d scripts/sorttable: Add helper functions for Elf_Sym
    8cd6caaa4a244 scripts/sorttable: Add helper functions for Elf_Shdr
    a03240485cf57 scripts/sorttable: Add helper functions for Elf_Ehdr
    1dd7def1ae877 scripts/sorttable: Convert Elf_Sym MACRO over to a union
    1afca399cc4d5 scripts/sorttable: Replace Elf_Shdr Macro with a union
    7ce5ed40d976e scripts/sorttable: Convert Elf_Ehdr to union
    e6bb2482b5b17 scripts/sorttable: Make compare_extable() into two functions
    d5e14532a8b86 scripts/sorttable: Have the ORC code use the _r() functions to read
    4f2fba2de0620 scripts/sorttable: Remove unneeded Elf_Rel
    c13a4c1fd1b74 scripts/sorttable: Remove unused write functions
    d9e259e63b36b scripts/sorttable: Remove unused macro defines
    030fe3e9d8abd fuse: re-lock request before replacing page cache folio
    fe95e90559bce slimbus: qcom-ngd-ctrl: Balance pm_runtime enablement for NGD
    e65ae7c948640 slimbus: qcom-ngd-ctrl: Fix up platform_driver registration
    5d1ae4e17a3ec rxrpc: Fix the ACK parser to extract the SACK table for parsing
    09c9b92c20104 net: phonet: free phonet_device after RCU grace period
    210ac54bdd8df phonet: Pass net and ifindex to phonet_address_notify().
    cf30797ea8cea phonet: Pass ifindex to fill_addr().
    6707d7e0b7174 locking/rtmutex: Skip remove_waiter() when waiter is not enqueued
    67fde21e4522e Drivers: hv: vmbus: Improve the logic of reserving fb_mmio on Gen2 VMs
    5df8310a41391 hv: utils: handle and propagate errors in kvp_register
    23e5a1b9ae954 mptcp: pm: fix extra_subflows underflow on userspace PM subflow creation
    4830fb44d12f5 netfilter: nf_tables: always walk all pending catchall elements
    7109d69bec6ed dlm: prevent NPD when writing a positive value to event_done
    c84860dac7af7 regulator: core: fix locking in regulator_resolve_supply() error path
    c2716362ec335 ring-buffer: Remove ring_buffer_read_prepare_sync()
    f155b8f1c9576 selftests/bpf: Update comments find_equal_scalars->sync_linked_regs
    8e655dbef4c9e selftests/bpf: Tests for per-insn sync_linked_regs() precision tracking
    78da8e1be90c5 bpf: Remove mark_precise_scalar_ids()
    0252b9d262222 bpf: Track equal scalars history on per-instruction level
    b741c9c6ef59f af_unix: Reject SIOCATMARK on non-stream sockets
    f68f34033d403 selftests/bpf: Add test to ensure kprobe_multi is not sleepable
    89327ed787746 bpf: Reject sleepable kprobe_multi programs at attach time
    eb045714bc6a2 agp/amd64: Fix broken error propagation in agp_amd64_probe()
    1078ae8175777 net: qualcomm: rmnet: fix endpoint use-after-free in rmnet_dellink()
    1c4ffe6b4f043 i2c: stub: Reject I2C block transfers with invalid length
    c19b360fa10c5 RDMA/bnxt_re: zero shared page before exposing to userspace
    218c24bfc3334 KVM: VMX: Update SVI during runtime APICv activation
    de1ba6c93868f ARM: fix branch predictor hardening
    1f7cc85046f1c ARM: fix hash_name() fault
    98b209cd62ef9 ARM: allow __do_kernel_fault() to report execution of memory faults
    89b37df6f805f ARM: group is_permission_fault() with is_translation_fault()
    5d95f6b267f3d debugobjects: Dont call fill_pool() in early boot hardirq context
    a3383df76f0d7 debugobjects: Do not fill_pool() if pi_blocked_on
    c8cd2ca8f085c debugobjects: Use LD_WAIT_CONFIG instead of LD_WAIT_SLEEP
    0d2a64411b097 debugobjects: Allow to refill the pool before SYSTEM_SCHEDULING
    40fe77146137b batman-adv: tt: prevent TVLV entry number overflow
    abb069fdf51a9 drm/v3d: Skip CSD when it has zeroed workgroups
    756724002c5a6 drm/v3d: Store the active job inside the queue's state
    f4b6b4af7ef06 ip6_vti: set netns_immutable on the fallback device.
    499c6b43a79dd drm/amd/display: Bound VBIOS record-chain walk loops
    b685d6ef6f07a net/sched: fix pedit partial COW leading to page cache corruption
    8bef2f840b43e fuse: limit FUSE_NOTIFY_RETRIEVE to uptodate folios

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index e5a3882efea..cb8d8c418f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fcddef60733f35eb43e4f8d5c7fd23d1c5bc4b24"
-SRCREV_meta ?= "b32016757524151fa9577e2c13b2fcc0355a076f"
+SRCREV_machine ?= "d7fbdb4e5e7a35bdb8bb87d159204d74ef130a32"
+SRCREV_meta ?= "a77e1b965423603456f2d9dbf3de53bb8a3d75af"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.143"
+LINUX_VERSION ?= "6.6.144"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index ed4b0c67ae7..73d971f7eee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.143"
+LINUX_VERSION ?= "6.6.144"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "14b1b02cc139bf807405c9ad97a799a1dbfc0e4d"
-SRCREV_meta ?= "b32016757524151fa9577e2c13b2fcc0355a076f"
+SRCREV_machine ?= "25b07b85b558f3587c11c9363cccd9cb93fcef45"
+SRCREV_meta ?= "a77e1b965423603456f2d9dbf3de53bb8a3d75af"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index c682d6ff17a..64609554ee2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "900d4f2a9c0cd33b2f32053ea438c709ca4fc69c"
-SRCREV_machine:qemuarm64 ?= "5f9c75b34f19ebfb1ac2cf26b0cdf1e637b0a67b"
-SRCREV_machine:qemuloongarch64 ?= "d7c355e593fea6abba6099c009d0b4ec566ffba1"
-SRCREV_machine:qemumips ?= "d066c05c4207d69ff781175fbd4544af3a57a6e4"
-SRCREV_machine:qemuppc ?= "c9444b37f0f19f6f7186e4936f940b2e29cef806"
-SRCREV_machine:qemuriscv64 ?= "d7c355e593fea6abba6099c009d0b4ec566ffba1"
-SRCREV_machine:qemuriscv32 ?= "d7c355e593fea6abba6099c009d0b4ec566ffba1"
-SRCREV_machine:qemux86 ?= "d7c355e593fea6abba6099c009d0b4ec566ffba1"
-SRCREV_machine:qemux86-64 ?= "d7c355e593fea6abba6099c009d0b4ec566ffba1"
-SRCREV_machine:qemumips64 ?= "4c96d4f0d9ae5848015aa021c683bc1c68b596ee"
-SRCREV_machine ?= "d7c355e593fea6abba6099c009d0b4ec566ffba1"
-SRCREV_meta ?= "b32016757524151fa9577e2c13b2fcc0355a076f"
+SRCREV_machine:qemuarm ?= "3adc19c1e1e3ee865f9b0d7bc0fedd0e4aeee995"
+SRCREV_machine:qemuarm64 ?= "39a4fe09d3d795042cc14eb3c78f6a03874c48df"
+SRCREV_machine:qemuloongarch64 ?= "2baf8e92ef6ad38945005adf39342b9efb4509ec"
+SRCREV_machine:qemumips ?= "ba0b8f925ec8b5926c6c2ddbc2c2c77305324bab"
+SRCREV_machine:qemuppc ?= "66c01b44545110249c940f865c4ed10d4d315b29"
+SRCREV_machine:qemuriscv64 ?= "2baf8e92ef6ad38945005adf39342b9efb4509ec"
+SRCREV_machine:qemuriscv32 ?= "2baf8e92ef6ad38945005adf39342b9efb4509ec"
+SRCREV_machine:qemux86 ?= "2baf8e92ef6ad38945005adf39342b9efb4509ec"
+SRCREV_machine:qemux86-64 ?= "2baf8e92ef6ad38945005adf39342b9efb4509ec"
+SRCREV_machine:qemumips64 ?= "1793417d6568e244579278e6f1fc7107987946f5"
+SRCREV_machine ?= "2baf8e92ef6ad38945005adf39342b9efb4509ec"
+SRCREV_meta ?= "a77e1b965423603456f2d9dbf3de53bb8a3d75af"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d1cfde2d5d15be14123bdd1689162bd27f995a90"
+SRCREV_machine:class-devupstream ?= "da47cbc254661aa66d61ef061485a7080305c4be"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.143"
+LINUX_VERSION ?= "6.6.144"
 
 PV = "${LINUX_VERSION}+git"
 

