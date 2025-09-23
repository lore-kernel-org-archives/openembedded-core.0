Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF788CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 19:11:53 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.201.1758654706927365230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 12:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S2xA1yWV;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-856701dc22aso4393985a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758654706; x=1759259506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN0Oxap+nNSoSWcW2AtXp3PXWg3Sq6sFkKT+ZvXQv+o=;
        b=S2xA1yWVMYjKPtNlY2IaxYP+uVGXTYqFo/v3Bc+xfNFzC5AwKGk/LeoP6T+0e2C8t2
         pmLbQTYd8j015+QsuwJWGqmHN7HCe6cg8+M3OyO+ZuZKnQsKn0vxl03AadUSF1vEgoFS
         i8iMbSm9BsrW6V2umCCnVKkvikT+3ipEEJP8kJI1w8cb489E57hN9+9WNfQYH5fvTc4o
         MSUj+WD2XEhHvpCnaKNFE14iofhygl8j1ha1LAslK7ZsU04aFz4/csLPv9hmVhBq3cc0
         oHjB/LQLlbWoYAmLJ6vh2V8MWt+GCB5+dc6rYbgYTTTgtj9qSAX5UHCFppwmXVIxSOOs
         rYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654706; x=1759259506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TN0Oxap+nNSoSWcW2AtXp3PXWg3Sq6sFkKT+ZvXQv+o=;
        b=YNqobVweXGbqm/MhTisLZq9OdYAPwsBhxfCKujFgW284sN6b9QI4wXVtRayfkDyblK
         PHvV77nQhqhLKf6mkldwgM+JOPkrCm77PenpAgSfS4NZeYPbY/hE5uH4lbIjm1VjkoS+
         lcwPfC+J/zIAFrInTdFZMH1Ah6P/Zxrh9vXLESd8wZ2MIiAMpyNWsq+ew9H7sfNu7n+t
         ZzTYI7M5pZg7CZ2jbV9qpk8Om28NejbdIYJ996xcVx2GpkkvENduodPQEVFQwEivXe8F
         Ijm441IMl8CXIFDAlNJhhA5faFTuEuC3L1hyTaD6UyC6F/hjYTMgCIJt4uqx8MXOczmJ
         NTRA==
X-Gm-Message-State: AOJu0YxA9srKZtXQKpgwQD1/kgCjuRntxOzEGFjDO4XUe6ZsQWVx1noN
	DkAQXZ2TS2cGSl9MSUIO/ZgmsIYotwiR1jTnY6gPJNi+GK/dqRo3w76EIPshT2MVM5Q=
X-Gm-Gg: ASbGncv9waTyXnai76aaYhdDlTnMhGhKCIJM6FZhNw4bZFISj/T7LnpFrL3PnKm4vj6
	xnkqa+zK+3pqTws8xBUhJGrjL2iyyLFfII+Z7eBksJ2LfURbBLsLJbnG28LjyOPVlckrL5nyIxA
	0b/ZnkDxAI9w1LxhrktBqupWtHPUfnQxwlr1bi/HwJ4ysqeECUJ4DYejU8Z1jjjgfQq3GlhL7eg
	R2iy9LTF9FC6gnjvwKiZKCu4WUhFM/d8QPbKuSW82rBif+2fasfs9lPqBLIE8dN3axMRx75Z9HH
	E0V9JeCsWapDlxwV1J++1E0v4Gbx3kTtXtWwMCd/0wascX53AzOatqL8VdNHXMee8I1YVa2i9SG
	387eoZ0dWzrJOsLdtIAfwqSO8F+c4REWNNsVcrPb1BDZgLf2FtGrfHFDBplLXYNL4SL1l4hP8fb
	Fj/HUT76qPjr+JtNJCqpSv4cPmQhWUUZEPXFRJCzS+0pXFSsRSLK7eflM=
X-Google-Smtp-Source: AGHT+IEu44hMlSIvhu2qPWry1+TcYsZKGNgRIprij3R55HdGPpVsF5u1n5A+DxEZrop5old6sJ82Ww==
X-Received: by 2002:a05:6214:1d23:b0:7e6:6e4e:8833 with SMTP id 6a1803df08f44-7e6ff32e4e6mr43161736d6.1.1758654705703;
        Tue, 23 Sep 2025 12:11:45 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793443cf48asm94109866d6.15.2025.09.23.12.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:11:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5 v2] linux-yocto/6.12: update to v6.12.48
Date: Tue, 23 Sep 2025 15:11:38 -0400
Message-Id: <9b0efb7802c6df3c65b6191778e548c5dbe55b30.1758654576.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1758654576.git.bruce.ashfield@gmail.com>
References: <cover.1758654576.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 19:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223921

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    f1e375d5eb68 Linux 6.12.48
    9e70cd1b775b x86: disable image size check for test builds
    44b2be6d5994 netfilter: nft_set_pipapo: fix null deref for empty set
    5539bc82ceda drm/amdgpu: fix a memory leak in fence cleanup when unloading
    215ea32e1fba drm/i915/power: fix size for for_each_set_bit() in abox iteration
    b9f9035d9481 net: mdiobus: release reset_gpio in mdiobus_unregister_device()
    01e528e63c2b x86/cpu/topology: Always try cpu_parse_topology_ext() on AMD/Hygon
    170eaf97d5e4 phy: ti-pipe3: fix device leak at unbind
    4dae01a7b20c phy: ti: omap-usb2: fix device leak at unbind
    28cfc6ab15b9 phy: tegra: xusb: fix device and OF node leak at probe
    feb1f80228c1 dmaengine: dw: dmamux: Fix device reference leak in rzn1_dmamux_route_allocate
    1fc14731f0be dmaengine: qcom: bam_dma: Fix DT error handling for num-channels/ees
    877135c58a2e usb: gadget: midi2: Fix MIDI2 IN EP max packet size
    47949bcf66b4 usb: gadget: midi2: Fix missing UMP group attributes initialization
    edfa1f21c278 usb: typec: tcpm: properly deliver cable vdms to altmode drivers
    2d10b29a7ea5 USB: gadget: dummy-hcd: Fix locking bug in RT-enabled kernels
    e64b2ff8643c xhci: fix memory leak regression when freeing xhci vdev devices depth first
    cfcde627f08c RISC-V: Remove unnecessary include from compat.h
    eba05e46f8f2 regulator: sy7636a: fix lifecycle of power good gpio
    069fd1688c57 dmaengine: ti: edma: Fix memory allocation size for queue_priority_map
    ec5430d090d0 dmaengine: idxd: Fix double free in idxd_setup_wqs()
    ce81905bec91 dmaengine: idxd: Fix refcount underflow on module unload
    dd7a7e432697 dmaengine: idxd: Remove improper idxd_free
    fcd4f1af12a2 phy: qualcomm: phy-qcom-eusb2-repeater: fix override properties
    dac341e35749 hsr: use hsr_for_each_port_rtnl in hsr_port_get_hsr
    d04d9d1aea70 hsr: use rtnl lock when iterating over ports
    c707d2c5541d net: hsr: Add VLAN CTAG filter support
    d74b49bb6b3c netfilter: nf_tables: restart set lookup on base_seq change
    4c34625f7dee netfilter: nf_tables: make nft_set_do_lookup available unconditionally
    259c4e86d083 netfilter: nf_tables: place base_seq in struct net
    dbe85d3115c7 netfilter: nf_tables: Reintroduce shortened deletion notifications
    9f1cc747c9ba netfilter: nft_set_rbtree: continue traversal if element is inactive
    6fe348e837c7 netfilter: nft_set_pipapo: don't check genbit from packetpath lookups
    42a02ba5beb8 netfilter: nft_set_pipapo: don't return bogus extension pointer
    3a2d45819a19 netfilter: nft_set_pipapo: merge pipapo_get/lookup
    39ce3db914c4 netfilter: nft_set: remove one argument from lookup and update functions
    6c110df7b984 netfilter: nft_set_pipapo: remove unused arguments
    725b33deebd6 can: xilinx_can: xcan_write_frame(): fix use-after-free of transmitted SKB
    a6d84e51ab4e can: j1939: j1939_local_ecu_get(): undo increment when j1939_local_ecu_get() fails
    1ca9748ee5be can: j1939: j1939_sk_bind(): call j1939_priv_put() immediately when j1939_local_ecu_get() failed
    03653847b6ef drm/amd/display: use udelay rather than fsleep
    a30afd6617c3 i40e: fix IRQ freeing in i40e_vsi_request_irq_msix error path
    21a3cd01ca07 igb: fix link test skipping when interface is admin down
    2935d8230ea6 docs: networking: can: change bcm_msg_head frames member to support flexible array
    badc803b8af2 tunnels: reset the GSO metadata before reusing the skb
    40600cddf429 net: bridge: Bounce invalid boolopts
    98c9d884047a genetlink: fix genl_bind() invoking bind() after -EPERM
    4fe53aaa4271 net: fec: Fix possible NPD in fec_enet_phy_reset_after_clk_enable()
    a506ffe193b2 drm/panthor: validate group queue count
    e7639cf1e6dd Disable SLUB_TINY for build testing
    b15c4bffdccf USB: serial: option: add Telit Cinterion LE910C4-WWX new compositions
    18bae1d4926b USB: serial: option: add Telit Cinterion FN990A w/audio compositions
    fee858fa032c dt-bindings: serial: brcm,bcm7271-uart: Constrain clocks
    d02bb770ec92 serial: sc16is7xx: fix bug in flow control levels init
    32864297aa1d tty: hvc_console: Call hvc_kick in hvc_write unconditionally
    8a0e676dc53b Revert "net: usb: asix: ax88772: drop phylink use in PM to avoid MDIO runtime PM wakeups"
    7158588efdf2 Input: i8042 - add TUXEDO InfinityBook Pro Gen10 AMD to i8042 quirk table
    f80c46c5fb72 Input: iqs7222 - avoid enabling unused interrupts
    51d7f652b381 hrtimers: Unconditionally update target CPU base after offline timer migration
    2dd4679961cd btrfs: fix corruption reading compressed range when block size is smaller than page size
    7cd3bc42ad12 btrfs: use readahead_expand() on compressed extents
    044ba8d23889 mtd: spinand: winbond: Fix oob_layout for W25N01JW
    deccd93ae19b mm/hugetlb: add missing hugetlb_lock in __unmap_hugepage_range()
    5d6eeb3c683c mm/damon/reclaim: avoid divide-by-zero in damon_reclaim_apply_parameters()
    26d29b2ac87a mm/damon/sysfs: fix use-after-free in state_show()
    305935130d54 ceph: fix race condition where r_parent becomes stale before sending message
    db378e6f83ec ceph: fix race condition validating r_parent before applying state
    35dbbc3dbf8b libceph: fix invalid accesses to ceph_connection_v1_info
    7e64474aba78 kernfs: Fix UAF in polling when open file is released
    3ac1ec2745ce netlink: specs: mptcp: fix if-idx attribute type
    20a2c389b3a6 netlink: specs: mptcp: replace underscores with dashes in names
    e295bf08b2b4 netlink: specs: mptcp: clearly mention attributes
    5ea53f2701f9 netlink: specs: mptcp: add missing 'server-side' attr
    6dc4eddeb7e6 drm/amdgpu/vcn4: Fix IB parsing with multiple engine info packages
    c53a6447d1ab drm/amdgpu/vcn: Allow limiting ctx to instance 0 for AV1 at any time
    7d07bc9c4f53 drm/xe: Attempt to bring bos back to VRAM after eviction
    b58a26cdd479 drm/mediatek: fix potential OF node use-after-free
    af0ae62b9353 mm/damon/lru_sort: avoid divide-by-zero in damon_lru_sort_apply_parameters()
    1797fd7b431c mm/damon/core: set quota->charged_from to jiffies at first charge window
    de84f2978d2e mm/memory-failure: fix redundant updates for already poisoned pages
    7618fd443aa4 mm/memory-failure: fix VM_BUG_ON_PAGE(PagePoisoned(page)) when unpoison memory
    fd714c92b13d mm/khugepaged: fix the address passed to notifier on testing young
    532b87643f6a fuse: prevent overflow in copy_file_range return value
    b7c40f063ff4 fuse: check if copy_file_range() returns larger than requested size
    30814d40fc8a fuse: do not allow mapping a non-regular backing file
    b6f8cd737b70 mtd: rawnand: stm32_fmc2: fix ECC overwrite
    26adba1e7d79 mtd: rawnand: stm32_fmc2: avoid overlapping mappings on ECC buffer
    040c78723a1f mtd: nand: raw: atmel: Respect tAR, tCLR in read setup timing
    2e2eb789066f net: usb: asix: ax88772: drop phylink use in PM to avoid MDIO runtime PM wakeups
    f98d88bf36b9 i2c: i801: Hide Intel Birch Stream SoC TCO WDT
    9ba898c9fcbe btrfs: fix subvolume deletion lockup caused by inodes xarray race
    6e9a12ab0705 btrfs: fix squota compressed stats leak
    1d3c96547ee2 ocfs2: fix recursive semaphore deadlock in fiemap call
    9be08390ed30 mptcp: sockopt: make sync_socket_options propagate SOCK_KEEPOPEN
    5b4605974b6d compiler-clang.h: define __SANITIZE_*__ macros only when undefined
    02f6274f9fc5 Revert "SUNRPC: Don't allow waiting for exiting tasks"
    589a319dcd60 EDAC/altera: Delete an inappropriate dma_free_coherent() call
    1ddb0a6ffac9 proc: fix type confusion in pde_set_flags()
    539920180c55 tcp_bpf: Call sk_msg_free() when tcp_bpf_send_verdict() fails to allocate psock->cork.
    cd1fd26bb134 bpf: Tell memcg to use allow_spinning=false path in bpf_timer_init()
    82967254a92e bpf: Allow fall back to interpreter for programs with stack size <= 512
    0126358df12d bpf: Fix out-of-bounds dynptr write in bpf_crypto_crypt
    4eebb6c60e85 s390/cpum_cf: Deny all sampling events by counter PMU
    5665ac5c5151 s390/pai: Deny all events not handled by this PMU
    88525accf169 tracing: Silence warning when chunk allocation fails in trace_pid_write
    f15ebc876fb2 NFSv4/flexfiles: Fix layout merge mirror check.
    b7c6c76c8585 NFS: nfs_invalidate_folio() must observe the offset and size arguments
    e1651ba799d4 NFSv4.2: Serialise O_DIRECT i/o and copy range
    fc0e6342ad8a NFSv4.2: Serialise O_DIRECT i/o and clone range
    5eb9e22919c8 NFSv4.2: Serialise O_DIRECT i/o and fallocate()
    abfd17844a0a NFS: Serialise O_DIRECT i/o and truncate()
    7f08d14103f3 fs/nfs/io: make nfs_start_io_*() killable
    fd84053dafeb ftrace/samples: Fix function size computation
    57c1bb02b4fc nfs/localio: restore creds before releasing pageio data
    a707c9a8380f nfs/localio: add direct IO enablement with sync and async IO support
    b0bf81e05b7a nfs/localio: remove extra indirect nfs_to call to check {read,write}_iter
    3f9b5dfbc444 tracing: Fix tracing_marker may trigger page fault during preempt_disable
    526d747df4b2 NFSv4: Clear the NFS_CAP_XATTR flag if not supported by the server
    643ccedbbee6 NFSv4: Clear NFS_CAP_OPEN_XOR and NFS_CAP_DELEGTIME if not supported
    4e7c053674a2 NFSv4: Clear the NFS_CAP_FS_LOCATIONS flag if it is not set
    35601bc50d06 trace/fgraph: Fix error handling
    2bc206085642 NFSv4: Don't clear capabilities that won't be reset
    2f7f112eaea9 SUNRPC: call xs_sock_process_cmsg for all cmsg
    606da574c1a8 flexfiles/pNFS: fix NULL checks on result of ff_layout_choose_ds_for_read
    8d7cc147124e drm/amdgpu: Add back JPEG to video caps for carrizo and newer
    66809e11a23e ALSA: hda/realtek: Fix built-in mic assignment on ASUS VivoBook X515UA
    86c7bcb6993c Revert "drm/amd/display: Optimize cursor position updates"
    278d96bd0b48 drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed
    996ab5ee7d72 drm/i915/pmu: Fix zero delta busyness issue
    aa66603ddf1b ext4: introduce linear search for dentries
    3a7fd0e56eaa Revert "udmabuf: fix vmap_udmabuf error page set"
    87bbcb73d603 nvme-pci: skip nvme_write_sq_db on empty rqlist
    63371be47f35 dma-debug: fix physical address calculation for struct dma_debug_entry
    a0d2200def1e dma-mapping: fix swapped dir/flags arguments to trace_dma_alloc_sgt_err
    e3253bab3c4a mm: introduce and use {pgd,p4d}_populate_kernel()
    5682aad0276f net/mlx5: HWS, change error flow on matcher disconnect
    464a33c29c9a kunit: kasan_test: disable fortify string checker on kasan_strings() test
    c6eb8d2d6371 dma-debug: don't enforce dma mapping check on noncoherent allocations
    245eb0b6bd8f dma-mapping: trace more error paths
    f776ae61e12e dma-mapping: use trace_dma_alloc for dma_alloc* instead of using trace_dma_map
    1edd532f24a7 dma-mapping: trace dma_alloc/free direction
    c39e8483dbcb dma-debug: store a phys_addr_t in struct dma_debug_entry
    b80d9c520898 fhandle: use more consistent rules for decoding file handle from userns

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index e04450bf99..8ef8085adb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b463156a724cd3f095e1dadd87bf3c1c8115c9ff"
-SRCREV_meta ?= "fb30a9a1d027d938de70890be92c22b33e0194b1"
+SRCREV_machine ?= "ea24c2991c68b041981a182bd57d818f0dc683f8"
+SRCREV_meta ?= "b26293f57cc7090add0aead45f294e256287641b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.47"
+LINUX_VERSION ?= "6.12.48"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 03582980bd..fe6f9595fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.47"
+LINUX_VERSION ?= "6.12.48"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
-SRCREV_meta ?= "fb30a9a1d027d938de70890be92c22b33e0194b1"
+SRCREV_machine ?= "17a823196be18a8b859307b2fd53de3895893ebd"
+SRCREV_meta ?= "b26293f57cc7090add0aead45f294e256287641b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 47590bd0f4..a2c80b9402 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ace248eb90be5ddc94caea17db41d7190fc87817"
-SRCREV_machine:qemuarm64 ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
-SRCREV_machine:qemuloongarch64 ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
-SRCREV_machine:qemumips ?= "a766160558c9434368462f9fada2ac0871017cbd"
-SRCREV_machine:qemuppc ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
-SRCREV_machine:qemuriscv64 ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
-SRCREV_machine:qemuriscv32 ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
-SRCREV_machine:qemux86 ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
-SRCREV_machine:qemux86-64 ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
-SRCREV_machine:qemumips64 ?= "ea35e13b7cd3d7cea1c2e8c17f8144209496a8b7"
-SRCREV_machine ?= "8161e9a0fe4611484f3f055a7c633759a513bd84"
-SRCREV_meta ?= "fb30a9a1d027d938de70890be92c22b33e0194b1"
+SRCREV_machine:qemuarm ?= "febf5dbebc3c6d987c7e6529c9cc6175c04f6610"
+SRCREV_machine:qemuarm64 ?= "17a823196be18a8b859307b2fd53de3895893ebd"
+SRCREV_machine:qemuloongarch64 ?= "17a823196be18a8b859307b2fd53de3895893ebd"
+SRCREV_machine:qemumips ?= "95bd1155f0d490344743ddfffb7a8b9522ce481c"
+SRCREV_machine:qemuppc ?= "17a823196be18a8b859307b2fd53de3895893ebd"
+SRCREV_machine:qemuriscv64 ?= "17a823196be18a8b859307b2fd53de3895893ebd"
+SRCREV_machine:qemuriscv32 ?= "17a823196be18a8b859307b2fd53de3895893ebd"
+SRCREV_machine:qemux86 ?= "17a823196be18a8b859307b2fd53de3895893ebd"
+SRCREV_machine:qemux86-64 ?= "17a823196be18a8b859307b2fd53de3895893ebd"
+SRCREV_machine:qemumips64 ?= "3cdb66bba9057d03c019086417843daee40ef906"
+SRCREV_machine ?= "17a823196be18a8b859307b2fd53de3895893ebd"
+SRCREV_meta ?= "b26293f57cc7090add0aead45f294e256287641b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f6cf124428f51e3ef07a8e54c743873face9d2b2"
+SRCREV_machine:class-devupstream ?= "f1e375d5eb68f990709fce37ee1c0ecae3645b6f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.47"
+LINUX_VERSION ?= "6.12.48"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


