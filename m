Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C79DC47DA9
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:37:59 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.8360.1706323071102624018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rSopgfYO;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3bd884146e9so1026314b6e.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323070; x=1706927870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrjKxCyCZR8nofHwGI6kkaB3Dh2fF2ELFJtyS3Z8mj8=;
        b=rSopgfYO7to8OJa2YPwZRnEsaA3wf+HXXIjN8/YlVO6k54U7f3UveVIbkCVvsBZYT/
         hI9rT5ZGejmRen+0fIfUAGSrssaVN5a1A/B1e1D/bd2q8tIisGup2CLbyMf94yp+v22z
         g0hYKuZdX7iZ1xaYInCXRBZ4oULRlJwxYMhhe2B0KXEwSWtTqcEGxEK35XU6ihqCdZGW
         hk51Pa4K0Oc7cbvpZouUK0EpJSZ6w6RKwqmbQPYI+hRf7nRziDRsWaLkAlhdn9djZ1ud
         uS9BYSDBmjTkcv4fTYVt69Tk2jcEQQR/tOPpxGsECj8+flMMHLvBBLJRjT5gQElp3iJd
         RYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323070; x=1706927870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrjKxCyCZR8nofHwGI6kkaB3Dh2fF2ELFJtyS3Z8mj8=;
        b=WyueEjkLhDz3rWxyaTpi4T0bErkJk/0XBujWQpXc9Ss/ObA8FAMsZJH2JCev9EA6Q3
         ydnV8u6OmkwXS9txwqPhzWJhKkmMo2/XJP1KkvWQgD8+wC5D0nILRw9ck253mbwWd9+D
         Q94e6PaTW3anePw3eOL48DH4m9vyk8JctrgZCsSj6okQeKz0vIFu1G2yF+IsQqxs0hqc
         aJBwaDw7YB9GbMdwa3vImzqioamnkTfjVJzfwEyqB64h/1ClRLjia/xpnjQzDY5BWXUG
         p4eDrWamTa1sYCZXP16laAVi3q6Im0ifdUfvOvnIt8labKyku+GisCz/b5SN9kbC2wCl
         jcAg==
X-Gm-Message-State: AOJu0YzqiAKYpdLoIYtzg0kW3oF9/lRbFwSx+Uryb4sfmYNn3ph5A+TV
	j497QSfausJNEvM80A8p4WZ2vU4gv/Yy2rebP5fr4I5KLkC4Yu2q1Vqjgkx090Xu4Xe2aopEy8H
	JDMKwMg==
X-Google-Smtp-Source: AGHT+IFrmknQJ03MSpDsvbTjxfkrnE8ZWseL4H1sH+rbHsw6+FCADgR7cYyWXeD7dRnz+1S6JgXbnA==
X-Received: by 2002:a05:6358:e498:b0:176:7c21:a978 with SMTP id by24-20020a056358e49800b001767c21a978mr893603rwb.40.1706323069545;
        Fri, 26 Jan 2024 18:37:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.37.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:37:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 06/23] linux-yocto/6.1: update to v6.1.70
Date: Fri, 26 Jan 2024 16:37:14 -1000
Message-Id: <ef32e8e1aae94b75247cd94f837fb34fff029a03.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194415

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    a507f147e6f0 Linux 6.1.70
    a413b88cdb69 loop: deprecate autoloading callback loop_probe()
    75c27bdb2144 wifi: nl80211: fix deadlock in nl80211_set_cqm_rssi (6.6.x)
    15577a98ef29 wifi: cfg80211: fix CQM for non-range use
    706448f716c1 fuse: share lookup state between submount and its parent
    ec7b81b0abcd mm/damon/core: make damon_start() waits until kdamond_fn() starts
    41f4ff9fe22c x86/alternatives: Sync core before enabling interrupts
    425379154b7f KVM: arm64: vgic: Force vcpu vgic teardown on vcpu destroy
    5dfacfd0fcd6 KVM: arm64: vgic: Add a non-locking primitive for kvm_vgic_vcpu_destroy()
    3a0fd93cd9f7 KVM: arm64: vgic: Simplify kvm_vgic_destroy()
    3339028dd082 thunderbolt: Fix memory leak in margining_port_remove()
    69b6596c6e4a lib/vsprintf: Fix %pfwf when current node refcount == 0
    2dd6f2286047 gpio: dwapb: mask/unmask IRQ when disable/enale it
    ab1c3f91d174 bus: ti-sysc: Flush posted write only after srst_udelay
    cd9f9ef59d85 pinctrl: starfive: jh7100: ignore disabled device tree nodes
    7f7efa30fa87 dm-integrity: don't modify bio's immutable bio_vec in integrity_metadata()
    33b976a0f2ae tracing / synthetic: Disable events after testing in synth_event_gen_test_init()
    d2b549d3107b scsi: core: Always send batch on reset or error handling command
    72e472a91c0d Revert "scsi: aacraid: Reply queue mapping to CPUs based on IRQ affinity"
    4258274bacfb selftests: mptcp: join: fix subflow_send_ack lookup
    a8555c86f508 ublk: move ublk_cancel_dev() out of ub->mutex
    1c250f2c5fa5 ubifs: fix possible dereference after free
    3c42cc437d7e btrfs: zoned: no longer count fresh BG region as zone unusable
    b09a67617621 Revert "drm/amd/display: Do not set DRR on pipe commit"
    93da3d8af9ee dm thin metadata: Fix ABBA deadlock by resetting dm_bufio_client
    e9779fac685e loop: do not enforce max_loop hard limit by (new) default
    600043e1856c RISC-V: Fix do_notify_resume / do_work_pending prototype
    764c6790dd71 9p: prevent read overrun in protocol dump tracepoint
    7d09c84df5ab drm/i915: Reject async flips with bigjoiner
    c60e10d1549f smb: client: fix OOB in smbCalcSize()
    bef4315f19ba smb: client: fix OOB in SMB2_query_info_init()
    71fe685b6a47 smb: client: fix potential OOB in cifs_dump_detail()
    277832a306f9 smb: client: fix OOB in cifsd when receiving compounded resps
    3f6da210470c dt-bindings: nvmem: mxs-ocotp: Document fsl,ocotp
    1092525155ea net: ks8851: Fix TX stall caused by TX buffer overrun
    e9df9f089128 net: rfkill: gpio: set GPIO direction
    805611157d68 net: 9p: avoid freeing uninit memory in p9pdu_vreadf
    4c775b4cd8dd Input: soc_button_array - add mapping for airplane mode button
    5df2b49e7e78 net: usb: ax88179_178a: avoid failed operations when device is disconnected
    0f7bffd40a51 Bluetooth: Add more enc key size check
    39347d645081 Bluetooth: MGMT/SMP: Fix address type when using SMP over BREDR/LE
    e14a7ebafe4e Bluetooth: L2CAP: Send reject on command corrupted request
    37f71e2c9f51 Bluetooth: af_bluetooth: Fix Use-After-Free in bt_sock_recvmsg
    470896ecbc92 Bluetooth: hci_event: Fix not checking if HCI_OP_INQUIRY has been sent
    d36d945f94c3 ALSA: hda/realtek: Add quirk for ASUS ROG GV302XA
    9599a5e34ca9 USB: serial: option: add Quectel RM500Q R13 firmware support
    a91fb450df5d USB: serial: option: add Foxconn T99W265 with new baseline
    73b6b6ab03ae USB: serial: option: add Quectel EG912Y module support
    9b968a708678 USB: serial: ftdi_sio: update Actisense PIDs constant names
    db57ef0dd4c2 wifi: cfg80211: fix certs build to not depend on file order
    ec350809cd98 wifi: cfg80211: Add my certificate
    228d9960ae81 usb-storage: Add quirk for incorrect WP on Kingston DT Ultimate 3.0 G3
    82f913724bc9 ALSA: usb-audio: Increase delay in MOTU M quirk
    01bc94b58192 iio: triggered-buffer: prevent possible freeing of wrong buffer
    c508a99fbc21 iio: adc: ti_am335x_adc: Fix return value check of tiadc_request_dma()
    1b670b0eeefa iio: common: ms_sensors: ms_sensors_i2c: fix humidity conversion time table
    1fe4c93fc77b scsi: bnx2fc: Fix skb double free in bnx2fc_rcv()
    66ccf5f7437a Input: ipaq-micro-keys - add error handling for devm_kmemdup
    3637f6bdfe2c interconnect: qcom: sm8250: Enable sync_state
    90aa62722d3e iio: imu: inv_mpu6050: fix an error code problem in inv_mpu6050_read_raw
    50d60bfc9681 interconnect: Treat xlate() returning NULL node as an error
    900c1b3c62f9 drm/i915: Fix ADL+ tiled plane stride when the POT stride is smaller than the original
    de4349bdf9f3 drm/i915/mtl: Add MTL for remapping CCS FBs
    52c1a67dd303 drm/i915/dpt: Only do the POT stride remap when using DPT
    7afe8109456d drm/i915: Fix intel_atomic_setup_scalers() plane_state handling
    b097184f8026 drm/i915: Relocate intel_atomic_setup_scalers()
    99767368b7fa drm/i915/mtl: limit second scaler vertical scaling in ver >= 14
    387e8077593e nvme-pci: fix sleeping function called from interrupt context
    b506833ee887 gpiolib: cdev: add gpio_device locking wrapper around gpio_ioctl()
    6eb51df9e739 pinctrl: at91-pio4: use dedicated lock class for IRQ
    903bb0c7b81f x86/xen: add CPU dependencies for 32-bit build
    2550d96aa248 i2c: aspeed: Handle the coalesced stop conditions with the start conditions.
    5c11f637999c ASoC: fsl_sai: Fix channel swap issue on i.MX8MP
    264d8c9b7f7f ASoC: hdmi-codec: fix missing report for jack initial status
    9b4c95a63e2d afs: Fix use-after-free due to get/remove race in volume tree
    17605162e26b afs: Fix overwriting of result of DNS query
    791d5409cdb9 keys, dns: Allow key types (eg. DNS) to be reclaimed immediately on expiry
    3e617c7e39eb net: check dev->gso_max_size in gso_features_check()
    087b96adc694 afs: Fix dynamic root lookup DNS check
    9c6ea7abe3ed afs: Fix the dynamic root's d_delete to always delete unused dentries
    a70c2dd74198 net: check vlan filter feature in vlan_vids_add_by_dev() and vlan_vids_del_by_dev()
    ea03196ebc47 net: mana: select PAGE_POOL
    a1986c429c68 Bluetooth: hci_event: shut up a false-positive warning
    fc6471510582 Bluetooth: Fix deadlock in vhci_send_frame
    3e0d1585799d net/rose: fix races in rose_kill_by_device()
    51e28c37d960 ethernet: atheros: fix a memleak in atl1e_setup_ring_resources
    6707baabe432 net: sched: ife: fix potential use-after-free
    31edab12229c net: Return error from sk_stream_wait_connect() if sk_wait_event() fails
    9d00421e1430 octeontx2-pf: Fix graceful exit during PFC configuration failure
    b0cee294022f net: mscc: ocelot: fix eMAC TX RMON stats for bucket 256-511 and above
    72b8de75b394 net/mlx5e: Correct snprintf truncation handling for fw_version buffer used by representors
    18b4a5e0c3f5 net/mlx5e: Correct snprintf truncation handling for fw_version buffer
    94c8485b449e net/mlx5: Fix fw tracer first block check
    1750f55d855a net/mlx5e: fix a potential double-free in fs_udp_create_groups
    01877daaeff0 net/mlx5e: Fix a race in command alloc flow
    f3739647a737 net/mlx5: Re-organize mlx5_cmd struct
    148ec770c63e net/mlx5: Prevent high-rate FW commands from populating all slots
    bd6e09162910 net/mlx5: Introduce and use opcode getter in command interface
    0f5de95fa266 net/mlx5e: Fix slab-out-of-bounds in mlx5_query_nic_vport_mac_list()
    31037cfceff8 Revert "net/mlx5e: fix double free of encap_header"
    8a84413505a6 Revert "net/mlx5e: fix double free of encap_header in update funcs"
    2f635af7d6b4 wifi: mac80211: mesh_plink: fix matches_local logic
    7a07af00aa88 wifi: mac80211: mesh: check element parsing succeeded
    40ba7f9ab82a wifi: mac80211: check if the existing link config remains unchanged
    e90da1c7c6e7 wifi: iwlwifi: pcie: add another missing bh-disable for rxq->lock
    912652366f9e s390/vx: fix save/restore of fpu kernel context
    0a6e700c3d7b reset: Fix crash when freeing non-existent optional resets
    930a61fd795d ARM: OMAP2+: Fix null pointer dereference and memory leak in omap_soc_device_init
    228a00a77d50 ARM: dts: dra7: Fix DRA7 L3 NoC node register size
    913463f8e6cd drm/amd/display: fix hw rotated modes when PSR-SU is enabled
    a4f48f77bbe7 HID: i2c-hid: Add IDEA5002 to i2c_hid_acpi_blacklist[]
    413bef367ba6 HID: i2c-hid: acpi: Unify ACPI ID tables format
    57a6b0a464eb bpf: Fix prog_array_map_poke_run map poke update
    4768f82272a7 kasan: disable kasan_non_canonical_hook() for HW tags

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit a0bfc167a283372297881baa696bc91bcea7787a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 5a2883c87a..3dbec14af8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "98f81d89530aff38b127115065e71773e4e771ec"
-SRCREV_meta ?= "50f164ae552b44c7b4c02394a795b997a13c366b"
+SRCREV_machine ?= "c7164e4299dfbd93c9ec4f9bd307ebbb88aa6b71"
+SRCREV_meta ?= "4fe5dc52631f3b990aefbb3f97330137c4ebb288"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.69"
+LINUX_VERSION ?= "6.1.70"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 8ac9259e85..01641a8462 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.69"
+LINUX_VERSION ?= "6.1.70"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
-SRCREV_meta ?= "50f164ae552b44c7b4c02394a795b997a13c366b"
+SRCREV_machine ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
+SRCREV_meta ?= "4fe5dc52631f3b990aefbb3f97330137c4ebb288"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index bbc5543ede..fc7bed9fcd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0a00ee457af7e769ac4c813d5a5c2edbe227ca56"
-SRCREV_machine:qemuarm64 ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
-SRCREV_machine:qemuloongarch64 ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
-SRCREV_machine:qemumips ?= "b0c5bfb120afb832e5bd9d9df2b5a15173e4c930"
-SRCREV_machine:qemuppc ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
-SRCREV_machine:qemuriscv64 ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
-SRCREV_machine:qemuriscv32 ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
-SRCREV_machine:qemux86 ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
-SRCREV_machine:qemux86-64 ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
-SRCREV_machine:qemumips64 ?= "c30b2a4361fb2c7dc3dbfebc46b9ee8a59ae7c78"
-SRCREV_machine ?= "175de8d5cbb8d4003e13ad29ab2e0ae29b585c90"
-SRCREV_meta ?= "50f164ae552b44c7b4c02394a795b997a13c366b"
+SRCREV_machine:qemuarm ?= "b763843c7f0f71c1488daf5d7453656360bfd217"
+SRCREV_machine:qemuarm64 ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
+SRCREV_machine:qemuloongarch64 ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
+SRCREV_machine:qemumips ?= "f72c516f5594f4eef9c26d380abf60768695c7da"
+SRCREV_machine:qemuppc ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
+SRCREV_machine:qemuriscv64 ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
+SRCREV_machine:qemuriscv32 ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
+SRCREV_machine:qemux86 ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
+SRCREV_machine:qemux86-64 ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
+SRCREV_machine:qemumips64 ?= "951e24cce7143380de09baa2d1d59062a969d021"
+SRCREV_machine ?= "7d183bf1b0b8ded0b2a8a352aa75729a37293b1e"
+SRCREV_meta ?= "4fe5dc52631f3b990aefbb3f97330137c4ebb288"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4aa6747d935281df8a1888feeb6e22e0097d0b86"
+SRCREV_machine:class-devupstream ?= "a507f147e6f06e86b7649b46bc1d3caa34b196d6"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.69"
+LINUX_VERSION ?= "6.1.70"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


