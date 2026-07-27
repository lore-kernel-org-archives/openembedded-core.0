Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E85C54F53
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:42 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43765.1785193001473293013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qkt5JHUO;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954d383e64so19884125e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785193000; x=1785797800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TSvTa4vboQbN3tuF0qNvZiUBI6V+xic74aQexPs6rPc=;
        b=qkt5JHUOA6sF7Pxx9qFvbu5lO1XNUJZ4wkY/wSXep+b+lhaIFS4vtf2h9VNFzKsywO
         9oO72qcSWHoLIUWKiDRB73ZKYZKkdzCUPyWp/oeix3f+DQMhkKLczo3RvDvE5rr1Ni9O
         z+L2Lxng9eKrKKGfyS9jRrNwEC9HIMpJ84uig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193000; x=1785797800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TSvTa4vboQbN3tuF0qNvZiUBI6V+xic74aQexPs6rPc=;
        b=ar0aZdigQMlJmgGOmb5p7aFQDpxG2su1dOKEianSBXVoAvRp0hckfaYv6TBuRQrzgD
         597bNyeVGOPJHnEavDIG81T7EswwTbWa3Vax0I0hf/jpRddQ6mfG/b1aAy662KHw+jKf
         JkC57wkWmpc+P9w6CLu7639aheQHGPrBQ96a3kv4UEkPNQFcF0tGG1advi1V67iFVwZg
         8zBcXT9EC1FZq+1jTHPTBcyultjyfe7U0PMUUBBfXu1RDJB7E2EDNLzQx7+JMjMpSNir
         dtS7gofagber9vNklY1PbP4hQRkNj+WI5XW/x53ZO6I/ZA2/oei9vgGsGgS6t59vmT/M
         NfQQ==
X-Gm-Message-State: AOJu0Yxu4gs8o7lpwK3wGtpcByRhpIuRA3IsPsIbaEeaj1Ijzn+wAncd
	myjPet15MpkK3zBhI/sT0E89DGUfSRRJR/vOcaI4EXcVieNgrFHeEPIVs8AZmGmtNSweG9V7EIn
	S/wYuX6E=
X-Gm-Gg: AR+sD12C04EvuvLwQJtEFS7jypccWwC76k+acvGGAN74I+Y7xYb1d63CU0SjWI89XRJ
	WGu+kzYgW6xkXNAdYdJVnn0Tl9It5pkX54XhoT1q3OBrrAfR/Fa5Tg5WC8rp1G+OmqQEMs02vEF
	HBFAE7l94+wn7zWzvMw2McZp9fjxzkAfPDewTHc/ldKpdcQe6eA6/YxHerbi269qH4tcWugcF0a
	9oaVptlhdjouZ2W3Zg/UkBww5N00o+LpzcbPJP4BIQLf+QOQ5K/WofR6bFkjDRb4QdvQaCUWJHy
	Fggt3iwxXcCIGTHpzUKtdHGmXtanpnr2FaUyt696zgD1QcyOuATFxCvCBIJqkIfLGO8bUs5HnoP
	pNBRfDHZHU9pqapE433ZhDu0ovLWiBFRlHd9a1ZNe4Mmn/++C61kK94iLCm4TfDRnRR6Qy7nf36
	7M9B62TrV5xMUBqjF8y9IEHe/IGS/egVeRhyN+aq5Vf8VpCZQeSJ4wdbHAfm/U//s5JDmkBFqhd
	tI7/w==
X-Received: by 2002:a05:600c:1d0d:b0:495:727f:40d2 with SMTP id 5b1f17b1804b1-496b571354amr133975185e9.38.1785192999511;
        Mon, 27 Jul 2026 15:56:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 27/36] linux-yocto/6.18: update to v6.18.38
Date: Tue, 28 Jul 2026 00:55:41 +0200
Message-ID: <6c9273c7f73969fee78055d784a5e9139d6d8243.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242144

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    e46dc0adfe397 Linux 6.18.38
    92c63a5ef3c7a apparmor: advertise the tcp fast open fix is applied
    e77fbefd1269b net/tcp-ao: fix use-after-free of key in del_async path
    3d205fe80f218 serial: 8250_dw: unregister 8250 port if clk_notifier_register() fails
    7627ff8c4f991 ksmbd: fix out-of-bounds read in smb_check_perm_dacl()
    62c26720121bf NFS: Prevent resource leak in nfs_alloc_server()
    6919eb549e8f3 NFSv4: clear exception state on successful mkdir retry
    012d37a568bfb NFSv4/pNFS: reject zero-length r_addr in nfs4_decode_mp_ds_addr
    d8c90c7cc0612 NFSv4/flexfiles: reject zero filehandle version count
    4367afc119c51 nfsd: reset write verifier on deferred writeback errors
    017a6150106b0 nfsd: avoid leaking pre-allocated openowner on unconfirmed retry race
    0f28337f54cfb nfsd: check get_user() return when reading princhashlen
    dba7da4835de7 nfsd: fix inverted cp_ttl check in async copy reaper
    136b416593f13 nfsd: fix posix_acl leak on SETACL decode failure
    c8a24effd96d4 NFSD: Fix SECINFO_NO_NAME decode error cleanup
    6a946038f2a5a i2c: core: fix adapter registration race
    fc6aa9bdbae60 fbdev: modedb: Fix misaligned fields in the 1920x1080-60 mode
    4d418cf8daf57 fbdev: modedb: fix a possible UAF in fb_find_mode()
    eea16b6f805c0 fbdev: Fix fb_new_modelist to prevent null-ptr-deref in fb_videomode_to_var
    7643e5622994f riscv: kfence: Call mark_new_valid_map() for kfence_unprotect()
    3b33dbb43e21a riscv: mm: Extract helper mark_new_valid_map()
    2205275be9be9 power: reset: linkstation-poweroff: fix use-after-free in the linkstation_poweroff_init()
    720949ed666f3 KVM: SVM: Fix page overflow in sev_dbg_crypt() for ENCRYPT path
    e36095d8d922b KVM: x86: hyper-v: Bound the bank index when querying sparse banks
    f9b57a0015c24 MIPS: smp: report dying CPU to RCU in stop_this_cpu()
    6dbe9443d9f5f 9p: avoid putting oldfid in p9_client_walk() error path
    4cd57ebee3950 ocfs2: reject oversized group bitmap descriptors
    104d100212396 rpmsg: char: Fix use-after-free on probe error path
    369496d885b4c fpga: region: fix use-after-free in child_regions_with_firmware()
    b3a3831b2eb88 irqchip/imgpdc: Fix resource leak, add missing chained handler cleanup on remove
    200e7637f4d6a pNFS: Fix use-after-free in pnfs_update_layout()
    90e254f18b8c2 LoongArch: Report dying CPU to RCU in stop_this_cpu()
    e18769616fd5a tipc: fix slab-use-after-free Read in tipc_aead_decrypt_done
    5e5b7f2ef8549 blk-cgroup: fix UAF in __blkcg_rstat_flush()
    5a84398101bf9 hdlc_ppp: sync per-proto timers before freeing hdlc state
    e91df6d273445 pwrseq: core: fix use-after-free in pwrseq_debugfs_seq_next()
    b85ef03f726b1 gfs2: fix use-after-free in gfs2_qd_dealloc
    8d8507a457667 crypto: nx - fix nx_crypto_ctx_exit argument
    5da9b1a87ec7c KVM: Replace guest-triggerable BUG_ON() in ioeventfd datamatch with get_unaligned()
    18587f9831612 KVM: x86/mmu: Ensure hugepage is in by slot before checking max mapping level
    adfacfbaeae2c exfat: fix potential use-after-free in exfat_find_dir_entry()
    6e61fc2e06e44 MIPS: DEC: Prevent initial console buffer from landing in XKPHYS
    65bd0c0afb0e1 bpf: use kvfree() for replaced sysctl write buffer
    3804e6de30ae7 block: Avoid mounting the bdev pseudo-filesystem in userspace
    db2c5b9fb9087 f2fs: keep atomic write retry from zeroing original data
    20190e4980579 f2fs: fix incorrect FI_NO_EXTENT handling in __destroy_extent_node()
    ff83de56882cb f2fs: validate ACL entry sizes in f2fs_acl_from_disk()
    888d94cc9afbf f2fs: fix to round down start offset of fallocate for pin file
    77f216ff9ce5c f2fs: validate compress cache inode only when enabled
    8aad54746c251 f2fs: validate orphan inode entry count
    1e48fefac682c f2fs: pass correct iostat type for single node writes
    1de92789ce31e wifi: iwlwifi: mld: validate sta_mask before ffs() in BA session handlers
    b0b07e04f0c72 wifi: iwlwifi: mld: fix race condition in PTP removal
    df626f284cb90 wifi: iwlwifi: mvm: fix race condition in PTP removal
    200d58c851b8f wifi: rtw88: usb: fix memory leaks on USB write failures
    73d427d271f7a wifi: rtw88: increase TX report timeout to fix race condition
    0aeb4d3ff6ced wifi: rtlwifi: rtl8821ae: Fix C2H bit location in RX descriptor
    40aa3c2b0cb8e wifi: ath11k: fix warning when unbinding
    a7cdc384c9c57 wifi: mt76: mt7925: don't disable AP BSS when removing TDLS peer
    7e25b5e22c1f4 wifi: mt76: mt76x2u: Add support for ELECOM WDC-867SU3S
    ec1c9e8962555 userfaultfd: ensure mremap_userfaultfd_fail() releases mmap_changing
    7216ce8cb12fe keys: Pin request_key_auth payload in instantiate paths
    b11c1fa326676 KEYS: fix overflow in keyctl_pkey_params_get_2()
    49d893b9cbcfc gcov: use atomic counter updates to fix concurrent access crashes
    2b7ec72786094 err.h: use __always_inline on all error pointer helpers
    1fcca1260c6e7 KVM: arm64: Omit tag sync on stage-2 mappings of the zero page
    97e1044e79c5d block: invalidate cached plug timestamp after task switch
    99e6c712cc300 kernel/fork: clear PF_BLOCK_TS in copy_process()
    0d35f9f194a85 fbdev: fix use-after-free in store_modes()
    81371dbd23601 NTB: epf: Avoid pci_iounmap() with offset when PEER_SPAD and CONFIG share BAR
    c3ca2631073b2 apparmor: fix use-after-free in rawdata dedup loop
    4a69b83045d31 apparmor: mediate the implicit connect of TCP fast open sendmsg
    1697957eb0971 net: ip_gre: require CAP_NET_ADMIN in the device netns for changelink
    1acdd14c0990d net: skmsg: preserve sg.copy across SG transforms
    bd968bdd568be mac802154: llsec: add skb_cow_data() before in-place crypto
    0cfa78c050662 af_unix: Set gc_in_progress to true in unix_gc().
    3c499851753a2 wifi: mt76: add wcid publish check in mt76_sta_add
    5e658b9245a52 ntfs3: reject direct userspace writes to reserved $LX* xattrs
    77798d7be6ef7 ipv4: account for fraggap on the paged allocation path
    6374fb9edf72c ipv6: account for fraggap on the paged allocation path
    565ab66005b14 batman-adv: tvlv: avoid race of cifsnotfound handler state
    4cc9f7711bb89 batman-adv: tvlv: enforce 2-byte alignment
    04e1a6557fbf8 batman-adv: dat: prevent false sharing between VLANs
    3f82fc92cf523 batman-adv: tt: track roam count per VID
    3470d583fc652 batman-adv: tt: don't merge change entries with different VIDs
    af5a069805f67 batman-adv: tp_meter: handle overlapping packets
    d511c72a83dd5 batman-adv: tp_meter: prevent parallel modifications of last_recv
    1dafdd0794be1 batman-adv: tp_meter: annotate last_recv_time access with READ/WRITE_ONCE
    2233787658db8 batman-adv: tp_meter: restrict number of unacked list entries
    3d4548c96d6f2 batman-adv: v: prevent OGM aggregation on disabled hardif
    44ae137a2acef batman-adv: frag: avoid underflow of TTL
    116e94025f0f4 batman-adv: frag: ensure fragment is writable before modifying TTL
    0473ae882624a batman-adv: fix (m|b)cast csum after decrementing TTL
    49bf27fcd7ee4 batman-adv: ensure bcast is writable before modifying TTL
    646b68639c06b batman-adv: gw: don't deselect gateway with active hardif
    95a061f587b76 batman-adv: tp_meter: initialize last_recv_time during init
    75612c100a9e2 batman-adv: prevent ELP transmission interval underflow
    43733e5b525fb batman-adv: bla: annotate lasttime access with READ/WRITE_ONCE
    23d085bd63086 batman-adv: tp_meter: add only finished tp_vars to lists
    b8bf8400e50cb batman-adv: tp_meter: handle seqno wrap-around for fast recovery detection
    1db02f3e315da batman-adv: tp_meter: fix fast recovery precondition
    7d2a44bc6bbe3 batman-adv: tp_meter: avoid divide-by-zero for dec_cwnd
    8e77fe0414f5c batman-adv: tp_meter: avoid window underflow
    7cb88d91d5f9f batman-adv: tp_meter: initialize dec_cwnd explicitly
    696c4cae872cc batman-adv: tp_meter: initialize dup_acks explicitly
    1c5a1268418e8 batman-adv: tp_meter: keep unacked list in ascending ordered
    e055e74b80eb8 lockd: fix TEST handling when not all permissions are available.
    671ec2eabb874 Revert "PCI: qcom: Advertise Hotplug Slot Capability with no Command Completion support"
    d844702198395 selinux: fix overlayfs mmap() and mprotect() access checks
    5dfcb15974e7d lsm: add backing_file LSM hooks
    5e470998a23e4 KVM: x86: Fix shadow paging use-after-free due to unexpected role
    0c503cf3dde2e Linux 6.18.37
    71003a32bef54 mm: do not copy page tables unnecessarily for VM_UFFD_WP
    2abfd3ffbd945 virtiofs: fix UAF on submount umount
    f965cf22dda7f media: vidtv: fix NULL pointer dereference in vidtv_mux_push_si
    7cad3ceaf679c ksmbd: reject non-VALID session in compound request branch
    6c25bf4e44a2b drivers/base/memory: set mem->altmap after successful device registration
    50b72074c5e8d serial: qcom_geni: Fix RX DMA stall when SE_DMA_RX_LEN_IN is zero
    7cc3dd79777f6 vc_screen: fix null-ptr-deref in vcs_notifier() during concurrent vcs_write
    b8ebf008696de crypto: qat - remove unused character device and IOCTLs
    d08d82d83ed45 iio: adc: ti-ads1298: add bounds check to pga_settings index
    0a89002737ee3 iio: light: veml6075: add bounds check to veml6075_it_ms index
    76db054931846 net: net_failover: Fix the deadlock in slave register
    c5b3871b567c2 net: export netif_open for self_test usage
    cc1494fd6c65d testing/selftests/mm: add soft-dirty merge self-test
    f563ce913a831 mm: propagate VM_SOFTDIRTY on merge
    b836839c1fd94 mm: set the VM_MAYBE_GUARD flag on guard region install
    3d6cb2ed06f7f mm: introduce copy-on-fork VMAs and make VM_MAYBE_GUARD one
    05cdec24a8589 mm: implement sticky VMA flags
    a093c80a1f139 mm: update vma_modify_flags() to handle residual flags, document
    bdeadba743375 mm: add atomic VMA flags and set VM_MAYBE_GUARD as such
    efce8a486bffc mm: introduce VM_MAYBE_GUARD and make visible in /proc/$pid/smaps
    0de7db2eb27e8 sctp: disable BH before calling udp_tunnel_xmit_skb()
    eee6be6ab6375 firmware: samsung: acpm: Fix cross-thread RX length corruption
    02ac3ba41628a Drivers: hv: vmbus: Improve the logic of reserving fb_mmio on Gen2 VMs
    072bbd2846d1b hv: utils: handle and propagate errors in kvp_register
    bde74af8d4466 regulator: core: fix locking in regulator_resolve_supply() error path
    9477cbc5107a8 rose: don't free fd-owned sockets when reaping in the heartbeat
    395b6573b389f rose: clear neighbour pointer in rose_kill_by_device()
    9e8fc2195f8b5 rose: cancel neighbour timers in rose_neigh_put() before freeing
    c31a0fa15a4b4 rose: drop CALL_REQUEST in loopback timer when device is not running
    74cbe94c913a4 rose: release netdev ref and destroy orphaned incoming sockets
    c794d35f73a7b rose: fix netdev double-hold in rose_make_new()
    ce27bcdd857a9 rose: disconnect orphaned STATE_2 sockets when device is gone
    ab849a6972c99 rose: set SOCK_DESTROY in rose_kill_by_device() for prompt cleanup
    c98cc00c2d3b1 rose: fix notifier unregistered too early in rose_exit()
    19139026dc1c0 rose: fix netdev double-hold in rose_rx_call_request()
    1d94857c11d60 rose: guard rose_neigh_put() against NULL in timer expiry
    270ef709257eb rose: clear neighbour pointer after rose_neigh_put() in state machines
    940f39e153323 rose: fix race between loopback timer and module removal
    fe8cbcc3e79d4 rose: hold loopback neighbour reference across timer callback
    7dac298524b41 rose: fix dev_put() leak in rose_loopback_timer()
    19b3691ec9402 ACPI: scan: Use async schedule function in acpi_scan_clear_dep_fn()
    53483a9f4ee9e agp/amd64: Fix broken error propagation in agp_amd64_probe()
    8b17adf6d4fb6 net: qualcomm: rmnet: fix endpoint use-after-free in rmnet_dellink()
    5f4d2bd028ebb i2c: stub: Reject I2C block transfers with invalid length
    e2b143df29003 RDMA/bnxt_re: zero shared page before exposing to userspace
    44b8b03a9fb5c debugobjects: Dont call fill_pool() in early boot hardirq context
    3a408cae608d9 debugobjects: Do not fill_pool() if pi_blocked_on
    9cd2087cd7026 debugobjects: Use LD_WAIT_CONFIG instead of LD_WAIT_SLEEP
    a460935022f51 debugobjects: Allow to refill the pool before SYSTEM_SCHEDULING
    95f9eb19d5e65 Revert "NFSD: Defer sub-object cleanup in export put callbacks"
    af2892249d982 fuse: re-lock request before replacing page cache folio
    29706ac73f93b net: stmmac: fix stm32 (and potentially others) resume regression
    b6099150949f8 io_uring/net: Avoid msghdr on op_connect/op_bind async data

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd5c480785a427fff97907646fb298f5002336ed)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index c4c68844ce9..23c43c0cc19 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f477695299adc9d29b883d1642a6672e4899a83f"
-SRCREV_meta ?= "0267ec897e3d765fd04d70212dc834570e72d438"
+SRCREV_machine ?= "0d0c54addf4ff32e49c485061bd9ea5bde241d94"
+SRCREV_meta ?= "bf23930cc9805c0e87bdaff762832446c730a39b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.36"
+LINUX_VERSION ?= "6.18.38"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index d8eb5724c8f..e186b5f9926 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.36"
+LINUX_VERSION ?= "6.18.38"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f1d01f240ab00120824a557c26509996d02ac37c"
-SRCREV_meta ?= "0267ec897e3d765fd04d70212dc834570e72d438"
+SRCREV_machine ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
+SRCREV_meta ?= "bf23930cc9805c0e87bdaff762832446c730a39b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 148b440fd4d..5c849202ada 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "15e3830e8c3a3c15924ce4e6f65430e6e9800512"
-SRCREV_machine:qemuarm64 ?= "f1d01f240ab00120824a557c26509996d02ac37c"
-SRCREV_machine:qemuloongarch64 ?= "f1d01f240ab00120824a557c26509996d02ac37c"
+SRCREV_machine:qemuarm ?= "053c98bdd6c074a24771d69d24ff077f6016b299"
+SRCREV_machine:qemuarm64 ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
+SRCREV_machine:qemuloongarch64 ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "f1d01f240ab00120824a557c26509996d02ac37c"
-SRCREV_machine:qemuriscv64 ?= "f1d01f240ab00120824a557c26509996d02ac37c"
-SRCREV_machine:qemuriscv32 ?= "f1d01f240ab00120824a557c26509996d02ac37c"
-SRCREV_machine:qemux86 ?= "f1d01f240ab00120824a557c26509996d02ac37c"
-SRCREV_machine:qemux86-64 ?= "f1d01f240ab00120824a557c26509996d02ac37c"
+SRCREV_machine:qemuppc ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
+SRCREV_machine:qemuriscv64 ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
+SRCREV_machine:qemuriscv32 ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
+SRCREV_machine:qemux86 ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
+SRCREV_machine:qemux86-64 ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "f1d01f240ab00120824a557c26509996d02ac37c"
-SRCREV_meta ?= "0267ec897e3d765fd04d70212dc834570e72d438"
+SRCREV_machine ?= "00e8270271ee18a1c5a5f04c37dacae77acb5636"
+SRCREV_meta ?= "bf23930cc9805c0e87bdaff762832446c730a39b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "275d294b2b24abcd65452198551cd8a5b8d4f775"
+SRCREV_machine:class-devupstream ?= "e46dc0adfe39724bcf52cea47b8f9c9aed86a394"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.36"
+LINUX_VERSION ?= "6.18.38"
 
 PV = "${LINUX_VERSION}+git"
 

