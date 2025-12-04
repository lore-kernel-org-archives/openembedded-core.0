Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D96D1D862
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:52 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35255.1764822651774643285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O6TBAIQj;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8824888ce97so6329906d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822651; x=1765427451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFiDAzzVvh8sWaFwloEh0BgK9NLj8JetdZAE1qHzKzA=;
        b=O6TBAIQjMZdveKa3e0ONl2RCMoPvNCniLyIHYu54gWsQ9GuATloi2GhgWWMUH8mfTH
         CEMCxlZ/cXFSpbLwa74xgibCW2EMMZDXMtj4r/shkJHS6XVl580ZzvTUNgKhxWuV+gDk
         XfECHaot2wuTLRyvbtb7UXyXOOtW51ij3tLK1ap2Tk9H7auSm3UL0DdoiJGvAHh26Vfe
         kClMicQZWUH6vVJYEqRuQNpSXGND+GYXvotg1MB8o+hZEt+ydheaf7uEz1LEU8Q7R6oq
         ZQJRrc8xTvw5EE4wC8MhPKrs7cGqioLYWqhxo4P/2DSOToMxISJQ4LFALXCAXNndWFFz
         bmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822651; x=1765427451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFiDAzzVvh8sWaFwloEh0BgK9NLj8JetdZAE1qHzKzA=;
        b=sNEj4du4+foGhJluwc5wZcfq5Jf72gGfYtMhyKuCkMBlRvZiLx9WrHk4+nnNNXf/mD
         iRKNku6n0Fs+t1Pycyy5wkzPm9+jrBXAFr2zhi+VyKA1gfQARDJJQuV5QwjDhIohmPvC
         X1FWZJs2BVWsN6SHQwnMrMhP4FEHgsfgG0W51stfHNJHmbj7MTEOkcunt9UkIDDn2gC2
         Ej9Wg3u6WZSiALrUJ5llh4/nmW6Ajqi8IymHF4Ce6Le1Yi8zycNOGJOrwc001lewLMda
         pJWEXvRd/r1bELYFz2n7G/JdlGD+biT7H1iL2zfznK2yJZ65znTDWMG8LfCdFOCSx7Ic
         +VPw==
X-Gm-Message-State: AOJu0Yy8oJTNXkt+PqnI9BTqE8cUnSjGdeyUtCf7aSKyCFJ2EPyUhPTd
	dXYX7pfHxzIRimBHnFC68NhcqN2IQqWtoM5JBflW0pevdgx7bl2bGant/zBK/bJDg1A=
X-Gm-Gg: ASbGncv/TzKbo+BTLquEkl6nibaLxaqxL7O/gP83jTGJnwl5cw5mTgmxnclgUe53WPZ
	OwOvEjNP6/7KT6EZboWns868Me8AmqpCuKnamED+10ZLkwL7j9qvnNCD7xN9FGDPd30onbydzeP
	j2YMOpGJgjnUsatQbV4xKSQYfHQ6wrONXXQZ9tu+ESwZY/WUdN0aT310nd+zih1dpS3f3Ej2xJ4
	170JRtBPMElRPcliBRn4+uTwUvaJFwY5qxUXHHdrF6M9D3PXPfwIGtrqat06kwO7Zd8/yLquZ6O
	j+2HGpzkceVkZHIjo9P2920U3sXFEjn13kqJiafxu93Khp6IHbZTtMFWrUUftUCExGzmawpljuO
	lt4d97ewF2F4/LK02TGtDP4jIvKmZ8+dJCB3mJGnD7Eh99QoxH11n2d/GqZXgpCPHr7V4M0ykTY
	oGnu/9EclOjTlYPddFACToTIUGZ2riB/UWgcmsMkI8b2QOggN1p2fyNjjk+UY+MYHq12uB33xST
	pKm+1PhqEOjl7A=
X-Google-Smtp-Source: AGHT+IEDyF+lG2KLFNZXT+iIryPKeuFzPWH49i3oc5gxWz+ETzHWujq7DIAH+M/4hhnddC7fMDxoRA==
X-Received: by 2002:a05:6214:1cc7:b0:880:45ad:3db5 with SMTP id 6a1803df08f44-888194c9c6cmr73014096d6.3.1764822650724;
        Wed, 03 Dec 2025 20:30:50 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:50 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/16] linux-yocto/6.12: update to v6.12.60
Date: Wed,  3 Dec 2025 23:30:27 -0500
Message-Id: <7bc4542456616ef7e88f911b8f959a034091df5b.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227266

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    318a47068f7b Linux 6.12.60
    81fdac68539a Revert "gpio: swnode: don't use the swnode's name as the key for GPIO lookup"
    53ca559992e6 drm/amd/display: Prevent Gating DTBCLK before It Is Properly Latched
    25dcf6299dc9 drm/amd/display: Insert dccg log for easy debug
    b1515304a523 drm/amd/display: disable DPP RCG before DPP CLK enable
    467904aabbfd drm/amd/display: avoid reset DTBCLK at clock init
    7c2d68e09158 xfs: fix out of bounds memory read error in symlink repair
    12335f6ce2d5 xfs: Replace strncpy with memcpy
    6d3275d4ca62 mptcp: fix a race in mptcp_pm_del_add_timer()
    3e5271f22404 drm/i915/dp_mst: Disable Panel Replay
    4ade59d68a0a maple_tree: fix tracepoint string pointers
    c95e5af4b65a tty/vt: fix up incorrect backport to stable releases
    1ebfea90f9f0 smb: client: fix incomplete backport in cfids_invalidation_worker()
    a45d6359eefb drm/amdgpu: fix gpu page fault after hibernation on PF passthrough
    2e628227bc25 tracing/tools: Fix incorrcet short option in usage text for --threads
    fbb53727ca78 net: ethernet: ti: netcp: Standardize knav_dma_open_channel to return NULL on error
    05695cec60e8 ALSA: usb-audio: fix uac2 clock source at terminal parser
    b514ad872a4e s390/mm: Fix __ptep_rdp() inline assembly
    23ba534d73c6 drm/xe: Prevent BIT() overflow when handling invalid prefetch region
    ac9cc4db5435 Revert "RDMA/irdma: Update Kconfig"
    2678ceed5898 KVM: arm64: Make all 32bit ID registers fully writable
    fdf0dc82eb60 ALSA: usb-audio: Fix missing unlock at error path of maxpacksize check
    f16b97babd4a kconfig/nconf: Initialize the default locale at startup
    9e3a38292926 kconfig/mconf: Initialize the default locale at startup
    c944a850eb65 net: tls: Cancel RX async resync request on rcd_delta overflow
    1f0f07fd8f41 blk-crypto: use BLK_STS_INVAL for alignment errors
    74bf749662a2 net: tls: Change async resync helpers argument
    e8d7fa04c386 selftests: net: use BASH for bareudp testing
    09c4f1a378d9 x86/microcode/AMD: Limit Entrysign signature checking to known generations
    47c8b35a1f1d scsi: core: Fix a regression triggered by scsi_host_busy()
    cfc16a0fb0d7 cifs: fix typo in enable_gcm_256 module parameter
    62df4bd32011 bcma: don't register devices disabled in OF
    f1c170cae285 vsock: Ignore signal/timeout on connect() if already established
    48d692902708 cifs: fix memory leak in smb3_fs_context_parse_param error path
    55d879d1f8db LoongArch: Use UAPI types in ptrace UAPI header
    2b7b4efca068 af_unix: Read sk_peek_offset() again after sleeping in unix_stream_read_generic().
    232bd2cf504c af_unix: Cache state->msg in unix_stream_read_generic().
    6ebd02cf2dde net/mlx5: Clean up only new IRQ glue on request_irq() failure
    c70df6c17d38 devlink: rate: Unset parent pointer in devl_rate_nodes_destroy
    39697862fc4b pinctrl: s32cc: initialize gpio_pin_config::list after kmalloc()
    583ac7f65791 pinctrl: s32cc: fix uninitialized memory in s32_pinctrl_desc
    f5eb91f876eb ice: fix PTP cleanup on driver removal in error path
    a0e1c9bc1c9f idpf: fix possible vport_config NULL pointer deref in remove
    917a9d02182a net: qlogic/qede: fix potential out-of-bounds read in qede_tpa_cont() and qede_tpa_end()
    d1fd9ca65a8e platform/x86/intel/speed_select_if: Convert PCIBIOS_* return codes to errnos
    01a726aaa8c4 selftests: net: lib: Do not overwrite error messages
    b9dbfb1b5699 s390/ctcm: Fix double-kfree
    ef4ab2a8abe5 nvme-multipath: fix lockdep WARN due to partition scan work
    b91ef042e21a tools: riscv: Fixed misalignment of CSR related definitions
    9c61d8fe1350 net: openvswitch: remove never-working support for setting nsh fields
    336ffac44f99 net: mlxsw: linecards: fix missing error check in mlxsw_linecard_devlink_info_get()
    470a2416b6fc net: dsa: hellcreek: fix missing error handling in LED registration
    cbf2cbdb0733 drm/tegra: Add call to put_pid()
    59e9e1d5a360 mlxsw: spectrum: Fix memory leak in mlxsw_sp_flower_stats()
    03f159df3ef8 platform/x86: msi-wmi-platform: Fix typo in WMI GUID
    243e2419cfc3 platform/x86: msi-wmi-platform: Only load on MSI devices
    36f91eeffd03 pinctrl: cirrus: Fix fwnode leak in cs42l43_pin_probe()
    f15a3d791040 xfrm: Prevent locally generated packets from direct output in tunnel mode
    18a9f216d6a5 xfrm: Determine inner GSO type from packet inner protocol
    cff5ad585a42 pinctrl: realtek: Select REGMAP_MMIO for RTD driver
    e7b4e6e18964 xfrm: set err and extack on failure to create pcpu SA
    ba670eba9918 xfrm: drop SA reference in xfrm_state_update if dir doesn't match
    a077ec70561b drm/amd/display: Clear the CUR_ENABLE register on DCN20 on DPP5
    ded77c120916 drm/amd/display: Fix pbn to kbps Conversion
    a45450c36e3a drm/amd/display: Move sleep into each retry for retrieve_link_cap()
    cd145ed8c56f drm/amd/display: Increase DPCD read retries
    806f54a75988 drm/amdgpu: Skip emit de meta data on gfx11 with rs64 enabled
    349238d296fc drm/amd: Skip power ungate during suspend for VPE
    73bc12d6a547 drm/radeon: delete radeon_fence_process in is_signaled, no deadlock
    871fba63bec0 drm/tegra: dc: Fix reference leak in tegra_dc_couple()
    aab400cf8e35 mptcp: do not fallback when OoO is present
    5f1a923461eb mptcp: decouple mptcp fastclose from tcp close
    2a01665f772d mptcp: avoid unneeded subflow-level drops
    482577bfc4ac selftests: mptcp: join: userspace: longer timeout
    88a2d0541242 selftests: mptcp: join: endpoints: longer timeout
    80f27a97aca6 mptcp: fix premature close in case of fallback
    f6fb2cbc91a8 mptcp: fix duplicate reset on fastclose
    ae43625bccb7 mptcp: fix ack generation for fallback msk
    ac28dfddedf6 mptcp: fix race condition in mptcp_schedule_work()
    eeaa628bc6b1 LoongArch: Don't panic if no valid cache info for PCI
    cd1a68eebb46 dt-bindings: pinctrl: toshiba,visconti: Fix number of items in groups
    d096d3c1babe MIPS: Malta: Fix !EVA SOC-it PCI MMIO
    72e883107926 scsi: target: tcm_loop: Fix segfault in tcm_loop_tpg_address_show()
    b2c0340cfa25 scsi: sg: Do not sleep in atomic context
    48ae433c6cc6 nvme: nvme-fc: Ensure ->ioerr_work is cancelled in nvme_fc_delete_ctrl()
    17c3a66d7ea2 nvme: nvme-fc: move tagset removal to nvme_fc_delete_ctrl()
    6492add9a3a1 nouveau/firmware: Add missing kfree() of nvkm_falcon_fw::boot
    6a13b56537e7 mm/mempool: fix poisoning order>0 pages with HIGHMEM
    9ab67eff6d65 Input: pegasus-notetaker - fix potential out-of-bounds access
    56881294915a Input: imx_sc_key - fix memory corruption on unload
    47420474a1d9 Input: goodix - add support for ACPI ID GDIX1003
    6d8106868515 Input: cros_ec_keyb - fix an invalid memory access
    11c030f61ada Revert "drm/tegra: dsi: Clear enable register if powered by bootloader"
    4d61cc2bc4fe net: dsa: microchip: lan937x: Fix RGMII delay tuning
    1ecd86ec6efd be2net: pass wrb_params in case of OS2BMC
    f7fc52c1b008 ata: libata-scsi: Add missing scsi_device_put() in ata_scsi_dev_rescan()
    7b39fa2c3be0 smb: client: introduce close_cached_dir_locked()
    10354dcab6fd ata: libata-scsi: Fix system suspend for a security locked drive
    9b1980b6f23f mptcp: Fix proto fallback detection with BPF
    8800f7640b26 mptcp: Disallow MPTCP subflows from sockmap
    93c8a03a107f exfat: check return value of sb_min_blocksize in exfat_read_boot_sector
    94acf4082be9 shmem: fix tmpfs reconfiguration (remount) when noswap is set
    8480f8678bd4 isofs: check the return value of sb_min_blocksize() in isofs_fill_super
    eb9361484814 mtdchar: fix integer overflow in read/write ioctls
    0c635241a62f mtd: rawnand: cadence: fix DMA device NULL pointer dereference
    6de1997439cc arm64: dts: rockchip: disable HS400 on RK3588 Tiger
    d35cf935cabc arm64: dts: rockchip: include rk3399-base instead of rk3399 in rk3399-op1
    ecb7305676da arm64: dts: rockchip: fix PCIe 3.3V regulator voltage on orangepi-5
    3e6d93e2aebe arm64: dts: rockchip: Fix vccio4-supply on rk3566-pinetab2
    45bdb0312cb0 HID: quirks: work around VID/PID conflict for 0x4c4a/0x4155
    3979d2a52514 HID: amd_sfh: Stop sensor before starting
    176725f48483 timers: Fix NULL function pointer race in timer_shutdown_sync()
    bc1909ef3878 KVM: arm64: Check the untrusted offset in FF-A memory share

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index e225ee0679d..c4cef55c864 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ef33526a988ac2426ddcae4ebb216917bbe1f6b2"
-SRCREV_meta ?= "92390f2029a3ea4caa05ba35d94a4cceaa9c63bc"
+SRCREV_machine ?= "b23e01aff4eb21167db80c8d178ffeaf174be51c"
+SRCREV_meta ?= "204830448d850850867fa4ca7ee0dab04fdb7011"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.59"
+LINUX_VERSION ?= "6.12.60"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index da82fc37941..2818a9fd406 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.59"
+LINUX_VERSION ?= "6.12.60"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
-SRCREV_meta ?= "92390f2029a3ea4caa05ba35d94a4cceaa9c63bc"
+SRCREV_machine ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
+SRCREV_meta ?= "204830448d850850867fa4ca7ee0dab04fdb7011"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 4e567ae5a26..4a82ea08a2b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c2ab1a0f5d463f20b29128d22944625f68223cb9"
-SRCREV_machine:qemuarm64 ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
-SRCREV_machine:qemuloongarch64 ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
-SRCREV_machine:qemumips ?= "df0fdc232411ea220c1abcc74e6373d4b900772c"
-SRCREV_machine:qemuppc ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
-SRCREV_machine:qemuriscv64 ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
-SRCREV_machine:qemuriscv32 ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
-SRCREV_machine:qemux86 ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
-SRCREV_machine:qemux86-64 ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
-SRCREV_machine:qemumips64 ?= "c509db83e2524daf994eeb5f0dd8f6c844241d58"
-SRCREV_machine ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
-SRCREV_meta ?= "92390f2029a3ea4caa05ba35d94a4cceaa9c63bc"
+SRCREV_machine:qemuarm ?= "0435f9a900bbfb3daa3a28123d517c6437831628"
+SRCREV_machine:qemuarm64 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
+SRCREV_machine:qemuloongarch64 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
+SRCREV_machine:qemumips ?= "07d29856173d5d2cec0a67801492a95a00e03491"
+SRCREV_machine:qemuppc ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
+SRCREV_machine:qemuriscv64 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
+SRCREV_machine:qemuriscv32 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
+SRCREV_machine:qemux86 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
+SRCREV_machine:qemux86-64 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
+SRCREV_machine:qemumips64 ?= "f21d4ebef1ebdfd38a182e87c7bdaad6fe79ba3c"
+SRCREV_machine ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
+SRCREV_meta ?= "204830448d850850867fa4ca7ee0dab04fdb7011"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d5dc97879a97b328a89ec092271faa3db9f2bff3"
+SRCREV_machine:class-devupstream ?= "318a47068f7b88de838518897500d7509e3fe205"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.59"
+LINUX_VERSION ?= "6.12.60"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


