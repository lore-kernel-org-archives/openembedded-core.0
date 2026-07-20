Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC7AC44524
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:59:01 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.828.1784563132661016832
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 08:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EyqJzMSo;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51bfbe05683so93585841cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563131; x=1785167931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cni8fAVc5Rzxy4JvjnqUDxe29DingeiVr1seI5x7f7k=;
        b=EyqJzMSox4cEvUc4aI6GX1KeCQx2u0MxY34KdjK0eBIITjJddZIVkXgCegAwdlOAiM
         U8fAsQ3xA86sby2r/QrS74ox0jL30DPznWrxBboTY8lDXpCKOuEU8pzbWF6na9K0VT1+
         0i4COkQ+GvXvWAVAUVu7qhgw+VZx4yL0onpiEs+mpdHVL8UFDH1hyzMa4ii161M2wcrJ
         FUwPUd/kex5O046xbfpAm4CwoDUJNtduJVLCFdr3ixJKbAt0wkEXaC/mgWcIREJrcZtO
         QgnHFqo6+UFkGIvL7+0WAiZeATjN3icBbCfUGJ1NIGsev0cKyj3tLBVrTffDVjabGVoe
         PXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563131; x=1785167931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cni8fAVc5Rzxy4JvjnqUDxe29DingeiVr1seI5x7f7k=;
        b=Ef0JjAioTfaJcxy8cH9cT8e9HO/PY4oCuB4onMR/hjIBotzHuEN+qI/bpetzf1Srif
         f5YBcHqCAAG1zsj0AT1A5riJwULnOhudi3SLiPGSGJm6c1HIrm6ulIq9Fsb+I8clD6ul
         eBelzWHTsSbLSaDTyaRFJyO7OfmFK5YhUopP2kt5zkfyziglH1ZQsfUn3zz2DyvbMmO/
         Qlk5g4/gKBxuHL8ZsZPTO+x/9GHLBu7CCzA0KY7JT8HAa8RE/TDfrMOUsQt2Kn6cEjXo
         bf3oJch6QKW2JF3bGzi2UCk0mnu6sRmntVH8R1ysDQeIfIdZ+2a28RvBf2cESugxM7i1
         cHlQ==
X-Gm-Message-State: AOJu0YxHdxuJEjhRTvHCNS4TKlEhbiF0ILAAJS1oi8aS85geSILRbAYn
	wRRrnTMUB0RsznkBLhITKesMh/6t4NUVX53zUcVMgzqAiABUAFFp9W3odDcEQZz4
X-Gm-Gg: AfdE7cmWjsZ1IDYDAyQAaytiTYT6V/0wKwXNb94CxsxGtOP41am2q2uxbjFNiJT4yyZ
	9437iT14NU3SvHO/WWjwhdusmYomfMJL8zHiCWkVBtmQftSyhTf3yS2/qdywBVRHR04tU9qYENk
	heHO1Pw+WW9qUJNoaLxY/mf6BNCm3CIuVPTYTcejdGrX4j88FFfl7lzVS4mUktUYA2sgvr2MJ0a
	G3wwHjcZcM1AZncjeEjUyy30xHfbUZ0KcwiUvRT/eA2iLUPzfM0I+JbXEnMYmpTrdQGLXlLIqsK
	xonnutkOY+0vDRUlKN/4pNP5u96YcsuJTZH9/DIOYcO3hVLX1388eJp9R3G+/e21OglV+hc6HF6
	ky5EN60gof0x2DIjoD104mIxCOUzNyA5uOqCF+ReMi8O5XaA3eGVBKH2FDmhz10OSkTmgrB/IQ/
	2XMWyQdNyKSoP0PAwEZY3RmP0w3Yq1WBp7jNBB4n/Hv+LFy1IjaanxlMhEYDF2RWfoTPQYbxRWl
	U/AxGdXRVgtdmGId8aqLLJJnnG5yDyskU3cMdIAXZVTBejvnz3ZwM9KjebTzUSSw8fhRa1y3DD4
	+qKuX42oxuS/+XQY2jvKJ1A=
X-Received: by 2002:a05:622a:ce:b0:51b:ff00:46e with SMTP id d75a77b69052e-5213c7e64b6mr140191361cf.32.1784563131309;
        Mon, 20 Jul 2026 08:58:51 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214f0162a7sm75504971cf.15.2026.07.20.08.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:58:50 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 05/06] yocto-bsps: update to v6.18.38
Date: Mon, 20 Jul 2026 11:58:40 -0400
Message-ID: <20260720155842.569263-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720155842.569263-1-bruce.ashfield@gmail.com>
References: <20260720155842.569263-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 15:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241421

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
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index c012ad3..d8790f3 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "c02123f16c412c8b8629ff2a9f06e9feca9077d6"
+SRCREV_machine:genericarm64 ?= "daaaf767b0cba42bcd9ba3f5b5f6b42b5e695a3f"
-- 
2.43.0


