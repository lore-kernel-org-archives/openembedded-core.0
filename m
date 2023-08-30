Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7457C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:48:59 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.1279.1693417736353504024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S/9+dA/x;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68becf931d0so4292921b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417735; x=1694022535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLQelPouGAo+nJi/U8LNsV+zJaqfHXj4JSvhqMq5V14=;
        b=S/9+dA/xgvdj3j8aVVHufE0K1IwvC7AJLPrHp+aZc4j+Y2YIAwziOmtNa5KlaNPAdo
         PjF2+7k4CrFZ4KGHs96lwZ8u+m9FEBY4vIuTJW9ux3bwL/zdPDjdR7W/ZP3D08C4EkFD
         Cw2KN5jj2B9XOhtsbtnLWoG9+k9GU2i9+Fz/Zh2KpktbW6+h5vMC4LVHR5i+514meWuq
         TSZUkesh8HVlGGnR/5SWUsVv3kSWSWGZmgU7RI0BdvpuSr8cbohZ4B0dKhveXwGrd/Qr
         3LlKbHeGZlRUmB9rJABYSaDPyd1RA9g3fGok7SWntWnxQ7pej4tQ+IvmBmIV7GfLK0nQ
         0mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417735; x=1694022535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLQelPouGAo+nJi/U8LNsV+zJaqfHXj4JSvhqMq5V14=;
        b=VAxA/QkkoZCF4xe7okbeZ4DBLV9ItCGj8nw7YOTcomplo3HWjNiZWmWFMD5zGQgap0
         Q/rN1dzfSFfZ5oZrAwqrtUaqaONW1NeRE3Ftlvo2e2e6t+ImBT/6DAZp7GfYJykB4UGO
         AZUO4fw+DQeEQpw8zOAQOkiQbfAMnOSHJ6WdSqx7GRv/gSfaIUMIiM5cJRH1vwTtaTKM
         VANDYIGjzmQctWfjAq5huakk44/0E5LNYKiZPFbh9JF8yzUrWRWnrj+cwSwio1EnaCKF
         6QsVkfQDonhRe3r9kgQOtEFK2m49x0HlXrn2XLx6njRBYbJSTiTFeLNujq+krewEJu0S
         /e0A==
X-Gm-Message-State: AOJu0YxXBN9XaRWQXt7A7sEsmWXAbed1VPZ17fB5i0hDa/mKHLX89xXZ
	Vy1dpdzCOXYtUt3uKPwakMQwz6SdJ6oEswQBBkU=
X-Google-Smtp-Source: AGHT+IGvk0GJ/+KVWRcV8uInUDNOnb/pW3RhU44+l9E+4GjSeQ2ezIbXEuaHnfdD6rzZhH6YBiswPQ==
X-Received: by 2002:a05:6a21:718b:b0:14d:abc:73dc with SMTP id wq11-20020a056a21718b00b0014d0abc73dcmr2515108pzb.32.1693417735256;
        Wed, 30 Aug 2023 10:48:55 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.48.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:48:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/20] linux-yocto/6.1: update to v6.1.46
Date: Wed, 30 Aug 2023 07:48:15 -1000
Message-Id: <1520c698d0323002b9aa93d1b4e3e8cf13528261.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186913

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    6c44e13dc284 Linux 6.1.46
    5525c289dbcf drm/amd/pm/smu7: move variables to where they are used
    4346a66ad198 sch_netem: fix issues in netem_change() vs get_dist_table()
    3ae919c317dd alpha: remove __init annotation from exported page_is_ram()
    cbce265f959f ACPI: scan: Create platform device for CS35L56
    afc4ddd9507f platform/x86: serial-multi-instantiate: Auto detect IRQ resource for CSC3551
    38b0020f68b7 scsi: qedf: Fix firmware halt over suspend and resume
    a9518f4a4978 scsi: qedi: Fix firmware halt over suspend and resume
    fb004497b3ea scsi: fnic: Replace return codes in fnic_clean_pending_aborts()
    b191ff1f075c scsi: core: Fix possible memory leak if device_add() fails
    7723a5d5d187 scsi: snic: Fix possible memory leak if device_add() fails
    9fdb273ede6f scsi: 53c700: Check that command slot is not NULL
    8282d0b35880 scsi: ufs: renesas: Fix private allocation
    ed70fa5629a8 scsi: storvsc: Fix handling of virtual Fibre Channel timeouts
    0e1605ec5bea scsi: core: Fix legacy /proc parsing buffer overflow
    f3f0f95a0233 netfilter: nf_tables: report use refcount overflow
    c21fddce7e45 nvme-rdma: fix potential unbalanced freeze & unfreeze
    cddbaa8dee7e nvme-tcp: fix potential unbalanced freeze & unfreeze
    bf67802453d3 btrfs: set cache_block_group_error if we find an error
    3ae93b316ca4 btrfs: reject invalid reloc tree root keys with stack dump
    9d04716e3665 btrfs: exit gracefully if reloc roots don't match
    7112abc9e8f2 btrfs: properly clear end of the unreserved range in cow_file_range
    504d81c512f6 btrfs: don't stop integrity writeback too early
    4e18c827d61b btrfs: wait for actual caching progress during allocation
    b8cd871d0a18 gpio: sim: mark the GPIO chip as a one that can sleep
    227bd2c1eab1 gpio: ws16c48: Fix off-by-one error in WS16C48 resource region extent
    5e17b8ee64c1 ibmvnic: Ensure login failure recovery is safe from other resets
    206ccf4f0977 ibmvnic: Do partial reset on login failure
    31ccd1ba20d8 ibmvnic: Handle DMA unmapping of login buffs in release functions
    24556c1cc9db ibmvnic: Unmap DMA login rsp buffer on send login fail
    2c5dd8805e6c ibmvnic: Enforce stronger sanity checks on login response
    ad0f73cbace4 net/mlx5: Reload auxiliary devices in pci error handlers
    88ec484ef8e2 net/mlx5: Skip clock update work when device is in error state
    4276f3e7ae4a net/mlx5: LAG, Check correct bucket when modifying LAG
    a824d012ad8f net/mlx5: Allow 0 for total host VFs
    ab06983c5bbd dmaengine: owl-dma: Modify mismatched function name
    dff220037148 dmaengine: mcf-edma: Fix a potential un-allocated memory access
    c4f7de3e8ce1 net: hns3: fix strscpy causing content truncation issue
    87d7e140081f nexthop: Fix infinite nexthop bucket dump when using maximum nexthop ID
    8d6df2c523e2 nexthop: Make nexthop bucket dump more efficient
    0b10d8d1cf85 nexthop: Fix infinite nexthop dump when using maximum nexthop ID
    743f7c1762e0 net: hns3: fix deadlock issue when externel_lb and reset are executed together
    59bad9190ac7 net: hns3: add wait until mac link down
    667ce6a0ff80 net: hns3: refactor hclge_mac_link_status_wait for interface reuse
    758dbcfb257e net: dsa: ocelot: call dsa_tag_8021q_unregister() under rtnl_lock() on driver remove
    001b7d6706e2 net: phy: at803x: remove set/get wol callbacks for AR8032
    a3e5f3b7f25d net: marvell: prestera: fix handling IPv4 routes with nhid
    059ec8287fd3 net: tls: avoid discarding data on record close
    05e6b93da45d RDMA/umem: Set iova in ODP flow
    521860ddf314 wifi: cfg80211: fix sband iftype data lookup for AP_VLAN
    94916b314861 drm/rockchip: Don't spam logs in atomic check
    ac6640f4193d IB/hfi1: Fix possible panic during hotplug remove
    c2efcaf304fb iavf: fix potential races for FDIR filters
    bcbc48b12092 drivers: vxlan: vnifilter: free percpu vni stats on error path
    eeb0e4c1dbdf drivers: net: prevent tun_build_skb() to exceed the packet size limit
    a6ddc1c77487 dccp: fix data-race around dp->dccps_mss_cache
    00f033d451c4 bonding: Fix incorrect deletion of ETH_P_8021AD protocol vid from slaves
    15b453cf7348 xsk: fix refcount underflow in error path
    da5f42a6e748 tunnels: fix kasan splat when generating ipv4 pmtu error
    f20a941bc2c5 tcp: add missing family to tcp_set_ca_state() tracepoint
    ddebdaec1af2 net/smc: Use correct buffer sizes when switching between TCP and SMC
    584a783270c1 net/packet: annotate data-races around tp->status
    b249c510b43e mptcp: fix the incorrect judgment for msk->cb_flags
    fc0b41ac1106 macsec: use DEV_STATS_INC()
    ebceef298c56 mISDN: Update parameter type of dsp_cmx_send()
    6b2824b198a6 bpf, sockmap: Fix bug that strp_done cannot be called
    ed90fe7435c5 bpf, sockmap: Fix map type error in sock_map_del_link
    20acffcdc2b7 net: core: remove unnecessary frame_sz check in bpf_xdp_adjust_tail()
    e59a2e5a3123 selftests: forwarding: tc_flower: Relax success criterion
    352dc3ee33c6 selftests: forwarding: Switch off timeout
    2df0e4373507 selftests: forwarding: Skip test when no interfaces are specified
    9ff7465b9160 selftests: forwarding: hw_stats_l3_gre: Skip when using veth pairs
    693c0a5a02e1 selftests: forwarding: ethtool_extended_state: Skip when using veth pairs
    10519d0b260d selftests: forwarding: ethtool: Skip when using veth pairs
    1455765e28ce selftests: forwarding: Add a helper to skip test when using veth pairs
    e146162dcf2e selftests/rseq: Fix build with undefined __weak
    e12b1ebc758a interconnect: qcom: sm8450: add enable_mask for bcm nodes
    8d0e2802b111 interconnect: qcom: Add support for mask-based BCMs
    312f04ede209 iio: core: Prevent invalid memory access when there is no parent
    98e470dc73a9 drm/nouveau/disp: Revert a NULL check inside nouveau_connector_get_modes
    19e7feda8966 x86: Move gds_ucode_mitigated() declaration to header
    f276899f8dbc x86/speculation: Add cpu_show_gds() prototype
    179430c2aa46 x86/sev: Do not try to parse for the CC blob on non-AMD hardware
    9ad49178c00a x86/mm: Fix VDSO and VVAR placement on 5-level paging machines
    25085250a150 x86/cpu/amd: Enable Zenbleed fix for AMD Custom APU 0405
    d93eeac34e75 x86/srso: Fix build breakage with the LLVM linker
    6f75e0934354 usb: typec: altmodes/displayport: Signal hpd when configuring pin assignment
    57b8f5fb8f17 usb: typec: tcpm: Fix response to vsafe0V event
    e3b37754988a usb: common: usb-conn-gpio: Prevent bailing out if initial role is none
    bed19d95fcb9 USB: Gadget: core: Help prevent panic during UVC unconfigure
    d2a4ded0ee99 usb: dwc3: Properly handle processing of pending events
    0d2d5282d39a usb-storage: alauda: Fix uninit-value in alauda_check_media()
    8ee39ec47914 misc: rtsx: judge ASPM Mode to set PETXCFG Reg
    f11a26633eb6 binder: fix memory leak in binder_init()
    77b689cc27d4 iio: adc: ina2xx: avoid NULL pointer dereference on OF device match
    2f8ebbd0f03e iio: adc: ad7192: Fix ac excitation feature
    5e1ed816a0e1 iio: frequency: admv1013: propagate errors from regulator_get_voltage()
    366563c14f1f iio: cros_ec: Fix the allocation size for cros_ec_command
    5aac2726b693 io_uring: correct check for O_TMPFILE
    b61a06eca15c drm/amd/display: trigger timing sync only if TG is running
    07152d9e87ef drm/amd/display: fix the build when DRM_AMD_DC_DCN is not set
    647e12741e6d drm/amd/display: Retain phantom plane/stream if validation fails
    e61f0ad73668 drm/amd/display: Disable phantom OTG after enable for plane disable
    9caac2a9f69f drm/amd/display: Use update plane and stream routine for DCN32x
    e93ae6e6b660 drm/amd/display: Avoid ABM when ODM combine is enabled for eDP
    4fe91c51aa93 drm/amd/display: Update OTG instance in the commit stream
    b2415df0afba drm/amd/display: Handle seamless boot stream
    9b1a1f168c03 drm/amd/display: Add function for validate and update new stream
    60334c0cba2f drm/amd/display: Handle virtual hardware detect
    0f19195d6397 drm/amd/pm: avoid unintentional shutdown due to temperature momentary fluctuation
    b064f9ccf11c drm/amd/pm: fulfill powerplay peak profiling mode shader/memory clock settings
    b844033ea813 drm/amd/pm: expose swctf threshold setting for legacy powerplay
    2368afd60f64 drm/amd/pm: fulfill swsmu peak profiling mode shader/memory clock settings
    7532ff6edbf5 nilfs2: fix use-after-free of nilfs_root in dirtying inodes via iput
    79a96970293b radix tree test suite: fix incorrect allocation size for pthreads
    0176533f5a39 hwmon: (pmbus/bel-pfe) Enable PMBUS_SKIP_STATUS_CHECK for pfe1100
    088773aaafef cpuidle: dt_idle_genpd: Add helper function to remove genpd topology
    3d3fd58bfca1 drm/amd/display: limit DPIA link rate to HBR3
    10347b115da1 drm/amd: Disable S/G for APUs when 64GB or more host memory
    f6166ca452b8 drm/amdgpu: add S/G display parameter
    c3d2d4b02e5e drm/amd/display: check attr flag before set cursor degamma on DCN3+
    9a2393af1f35 drm/amdgpu: fix possible UAF in amdgpu_cs_pass1()
    2322dd8c9d3d drm/shmem-helper: Reset vma->vm_ops before calling dma_buf_mmap()
    a372c3f0db81 drm/nouveau/nvkm/dp: Add workaround to fix DP 1.3+ DPCD issues
    e179b058d720 drm/nouveau/gr: enable memory loads on helper invocation on all channels
    56c79fcae6f3 nvme-pci: add NVME_QUIRK_BOGUS_NID for Samsung PM9B1 256G and 512G
    3fdaa7fbc81b riscv/kexec: handle R_RISCV_CALL_PLT relocation type
    b374684018e4 riscv,mmio: Fix readX()-to-delay() ordering
    98a34f50c15f riscv/kexec: load initrd high in available memory
    593615bf14c9 net: mana: Fix MANA VF unload when hardware is unresponsive
    aec1ce9a30d4 dmaengine: pl330: Return DMA_PAUSED when transaction is paused
    ded9f5551ce5 mptcp: fix disconnect vs accept race
    84aa65a52561 mptcp: avoid bogus reset on fallback close
    d143c736020f selftests: mptcp: join: fix 'implicit EP' test
    aae988c09650 selftests: mptcp: join: fix 'delete and re-add' test
    a537fd9096a1 ipv6: adjust ndisc_is_useropt() to also return true for PIO
    ecab78febff0 mmc: moxart: read scr register without changing byte order
    260ec73757c1 wireguard: allowedips: expand maximum node depth
    839aae189e1f selftests: forwarding: Set default IPv6 traceroute utility
    aa4b5895a80f wifi: rtw89: fix 8852AE disconnection caused by RX full flags
    e642eb67b8c1 wifi: nl80211: fix integer overflow in nl80211_parse_mbssid_elems()
    5bdf1c1f346c KVM: SEV: only access GHCB fields once
    ec18273e41d9 KVM: SEV: snapshot the GHCB before accessing it
    f339d76a3a97 ksmbd: fix wrong next length validation of ea buffer in smb2_set_ea()
    c6bef3bc30fd ksmbd: validate command request size
    ccb1700ed606 tpm: Add a helper for checking hwrng enabled
    d8a7d6136cbf tpm: Disable RNG for all AMD fTPMs
    ed2f8701fb9b Revert "loongarch/cpu: Switch to arch_cpu_finalize_init()"
    65383fe06065 gcc-plugins: Reorganize gimple includes for GCC 13

(From OE-Core rev: 91711cc075d0b44a1a1adab5b3c27da95264dc6f)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6c758bece326cf43eb46c95a420f0c9eb42e36ad)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 7b410df847..0c211dbb72 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "57eb889d204238845f238b44db6affe64480b958"
-SRCREV_meta ?= "2e1a81f17434de2a9bd27676efdde7861946582e"
+SRCREV_machine ?= "3d4b5681aeedac4a5129dd50e12afbda86cad699"
+SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.45"
+LINUX_VERSION ?= "6.1.46"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index a37da27401..5b58466774 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.45"
+LINUX_VERSION ?= "6.1.46"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
-SRCREV_meta ?= "2e1a81f17434de2a9bd27676efdde7861946582e"
+SRCREV_machine ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 4d3fbba9c6..57d4f457b9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "df11584ee46919ffa45c33ba496754db47c59b66"
-SRCREV_machine:qemuarm64 ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
-SRCREV_machine:qemuloongarch64 ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
-SRCREV_machine:qemumips ?= "5d4417bb0ff0d6c89e41a694e20135e1dce778f3"
-SRCREV_machine:qemuppc ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
-SRCREV_machine:qemuriscv64 ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
-SRCREV_machine:qemuriscv32 ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
-SRCREV_machine:qemux86 ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
-SRCREV_machine:qemux86-64 ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
-SRCREV_machine:qemumips64 ?= "c2a60bb7b1739180481e1d7a7e87bb573aa01ae7"
-SRCREV_machine ?= "786775632028f7909d9f905c4530d7eaae0b2ab0"
-SRCREV_meta ?= "2e1a81f17434de2a9bd27676efdde7861946582e"
+SRCREV_machine:qemuarm ?= "bafadaeb59cfe58562e6c6f5b98d9aa2ebb41cae"
+SRCREV_machine:qemuarm64 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_machine:qemuloongarch64 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_machine:qemumips ?= "858e92d1f51930ba57f4cd9013c094da15d4ac65"
+SRCREV_machine:qemuppc ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_machine:qemuriscv64 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_machine:qemuriscv32 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_machine:qemux86 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_machine:qemux86-64 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_machine:qemumips64 ?= "41bf8e89bdd29252ee75fe6c8ad0ac65bf2b7bca"
+SRCREV_machine ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "1321ab403b38366a4cfb283145bb2c005becb1e5"
+SRCREV_machine:class-devupstream ?= "6c44e13dc284f7f4db17706ca48fd016d6b3d49a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.45"
+LINUX_VERSION ?= "6.1.46"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


