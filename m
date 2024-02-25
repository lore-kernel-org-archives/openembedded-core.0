Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E26DC54E52
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:24 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.7519.1708897996210270877
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y2/Qp38d;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e0f803d9dfso1632331b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708897995; x=1709502795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLgWtL/np0sDmA3gfx2/0gwePULBeWbzrOOkrw3xhzE=;
        b=y2/Qp38dRxq64LpUw1kfXRUd9/y9/aTKI4niw0kNQ9XU2eHJrkag3HvnRCOO/2Vt+c
         Ftpfu74nsVqA8LSH5mg7giwV6ntvIByDuo8GidDGaJJID6WpjHVDqcxF+wB7oCJWFxUc
         MzlQ2Yv9/BrmUyduOkChU2HHfVVEH6nCGV+Yj+2FNd+R4fQkfntHtPKKSkffalfEfZc6
         r2vKgbUctFryOAOXt7r8lIw1rXmc+BJ5wholhiSld1Kwd9d5bEu9Hd5jHQjrtCQvycCN
         SczigB9XC29tBjWuB4a4xamw/GC3YE9+XaUdLzOriIpvdJQ4P5a+HdbswKZY6oxeNFQ5
         wkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708897995; x=1709502795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLgWtL/np0sDmA3gfx2/0gwePULBeWbzrOOkrw3xhzE=;
        b=IHbXFLm/+ixHDTrOJi6xrTCBgnBGy7bUlVv6116Dt4FlpjxCtjy7OakO1g31kMhma5
         LLwGua2BOyzok50PodPoSjilUUbjaVjRFeBzc0zo92lpgZh6PQ2EIX92VPGUriEtNuL4
         iYMlTG/N7GF9g4YcOrxH5H31RZrw7ZmECe4DANPHN2nVJk5qNSAFjOBqc2i6ZqkudRTq
         aeDRcEv/qnuuUE4yRf124ZiBXVPTCjb+HpEfY72CaGooBTRVPsLU24TE97Vndi21uMuZ
         ysKCK2TDLjK/p4FYVYUXR6a0i18eqenZDVOs+4r+nvmaCVYQOQgbzGmwEPlVNw+KWQwZ
         CQ3w==
X-Gm-Message-State: AOJu0YysLe6GUNl8/zERoq1tkkFb5jeSgT5ny6aKhB31/1JrGRjDcbM0
	f2qjBaBoxHqExw4WkePZhpPhhgmHFXEPK8tpoqHNYoVOpeGF35RFO+/IrqL1ps0eoK790rcq7ew
	ETPBZCA==
X-Google-Smtp-Source: AGHT+IEEjCq9Oh0+hnHhpxvpBjariM+wszkUIJ1XukIeRrhbLhA0i/csp+fEskSz8AkCVwfGQZDJpg==
X-Received: by 2002:a05:6a20:9f05:b0:19e:4e58:5026 with SMTP id mk5-20020a056a209f0500b0019e4e585026mr9052694pzb.4.1708897995428;
        Sun, 25 Feb 2024 13:53:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/22] linux-yocto/5.15: update to v5.15.146
Date: Sun, 25 Feb 2024 11:52:31 -1000
Message-Id: <ee4695138e36155c8e0b173f7952372693c0589a.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196164

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    26c690eff0a5 Linux 5.15.146
    13578b4ea461 bpf: Fix prog_array_map_poke_run map poke update
    339add0430e7 device property: Allow const parameter to dev_fwnode()
    4d9dcdb333ca dm-integrity: don't modify bio's immutable bio_vec in integrity_metadata()
    a033bb82a10c ring-buffer: Fix slowpath of interrupted event
    d10f7540c554 netfilter: nf_tables: skip set commit for deleted/destroyed sets
    d739f2b6d8f5 ksmbd: fix slab-out-of-bounds in smb_strndup_from_utf16()
    53bed9b9f431 ring-buffer: Remove useless update to write_stamp in rb_try_to_discard()
    7fb264aedec9 tracing: Fix blocked reader of snapshot buffer
    c73cb01af11f ring-buffer: Fix wake ups when buffer_percent is set to 100
    c0be52181f35 mm/filemap: avoid buffered read/write race to read inconsistent data
    2b16d960c79a Bluetooth: af_bluetooth: Fix Use-After-Free in bt_sock_recvmsg
    ded3cfdefec8 smb: client: fix OOB in smbCalcSize()
    bfd18c0f570e smb: client: fix OOB in SMB2_query_info_init()
    1228354a9889 iio: imu: adis16475: add spi_device_id table
    bd1be85dbbbd spi: Introduce spi_get_device_match_data() helper
    fcf6fce2f147 device property: Add const qualifier to device_get_match_data() parameter
    d63fafd6cc28 net: usb: ax88179_178a: avoid failed operations when device is disconnected
    f860413aa00c net: usb: ax88179_178a: wol optimizations
    2964a0de7526 net: usb: ax88179_178a: clean up pm calls
    597305fd7708 ethernet: constify references to netdev->dev_addr in drivers
    32d9a4ce5240 usb: fotg210-hcd: delete an incorrect bounds test
    d529cc227897 ARM: dts: Fix occasional boot hang for am3 usb
    8bf06286d740 ksmbd: fix wrong allocation size update in smb2_open()
    06208a04a7bd ksmbd: avoid duplicate opinfo_put() call on error of smb21_lease_break_ack()
    9444c47d2c3b ksmbd: lazy v2 lease break on smb2_write()
    f58afd8c7011 ksmbd: send v2 lease break notification for directory
    86967f696586 ksmbd: downgrade RWH lease caching state to RH for directory
    f7c8270be3cb ksmbd: set v2 lease capability
    1bf476d8a89a ksmbd: set epoch in create context v2 lease
    ac385518598f ksmbd: have a dependency on cifs ARC4
    b54b9fbc16a0 fuse: share lookup state between submount and its parent
    1c811b7c83a4 x86/alternatives: Sync core before enabling interrupts
    ccda72aa73c7 KVM: arm64: vgic: Force vcpu vgic teardown on vcpu destroy
    46bc250b082c lib/vsprintf: Fix %pfwf when current node refcount == 0
    f9dc6e0a0b02 gpio: dwapb: mask/unmask IRQ when disable/enale it
    e4d3534c6818 bus: ti-sysc: Flush posted write only after srst_udelay
    d47b2b6a087a tracing / synthetic: Disable events after testing in synth_event_gen_test_init()
    da95f8b7bc6a scsi: core: Always send batch on reset or error handling command
    686774523f8e dt-bindings: nvmem: mxs-ocotp: Document fsl,ocotp
    7c25c5d72746 net: ks8851: Fix TX stall caused by TX buffer overrun
    28855385bff1 net: rfkill: gpio: set GPIO direction
    4431cf7c3310 net: 9p: avoid freeing uninit memory in p9pdu_vreadf
    85fd35ce5bc0 Input: soc_button_array - add mapping for airplane mode button
    a346cfc6389a Bluetooth: MGMT/SMP: Fix address type when using SMP over BREDR/LE
    916ca52a3e28 Bluetooth: L2CAP: Send reject on command corrupted request
    70db6466c029 Bluetooth: hci_event: Fix not checking if HCI_OP_INQUIRY has been sent
    094ae245f7aa USB: serial: option: add Quectel RM500Q R13 firmware support
    d0adf8fe08b9 USB: serial: option: add Foxconn T99W265 with new baseline
    a67f0b5bc2fa USB: serial: option: add Quectel EG912Y module support
    0e285069fd2a USB: serial: ftdi_sio: update Actisense PIDs constant names
    433889344e82 wifi: cfg80211: fix certs build to not depend on file order
    69fab6dc3748 wifi: cfg80211: Add my certificate
    498f212a774f ALSA: usb-audio: Increase delay in MOTU M quirk
    5a16bb60b8ce iio: triggered-buffer: prevent possible freeing of wrong buffer
    3becd9bc5af3 iio: adc: ti_am335x_adc: Fix return value check of tiadc_request_dma()
    b9ccf18e315f iio: common: ms_sensors: ms_sensors_i2c: fix humidity conversion time table
    f1d9a66e9ce9 scsi: bnx2fc: Fix skb double free in bnx2fc_rcv()
    1e3effe67e75 Input: ipaq-micro-keys - add error handling for devm_kmemdup
    25c441a07360 iio: imu: inv_mpu6050: fix an error code problem in inv_mpu6050_read_raw
    3cbae23d481b interconnect: Treat xlate() returning NULL node as an error
    f47e3f60f239 smb: client: fix OOB in smb2_query_reparse_point()
    fd3951b798c8 smb: client: fix NULL deref in asn1_ber_decoder()
    6ded9038e4b1 drm/i915: Fix intel_atomic_setup_scalers() plane_state handling
    f9954b18c4fa drm/i915: Relocate intel_atomic_setup_scalers()
    2a4ef0d6e5f0 drm/i915/mtl: limit second scaler vertical scaling in ver >= 14
    6bbeb3960aad ksmbd: fix wrong name of SMB2_CREATE_ALLOCATION_SIZE
    c0c4e9767e57 gpiolib: cdev: add gpio_device locking wrapper around gpio_ioctl()
    8bdcedfdb026 pinctrl: at91-pio4: use dedicated lock class for IRQ
    f0c52b790a00 i2c: aspeed: Handle the coalesced stop conditions with the start conditions.
    c87ab6e306ba ASoC: hdmi-codec: fix missing report for jack initial status
    98fb5eaade74 afs: Fix use-after-free due to get/remove race in volume tree
    57bf56295068 afs: Use refcount_t rather than atomic_t
    d1fe946cb5b2 afs: Fix overwriting of result of DNS query
    2552b32b0b34 keys, dns: Allow key types (eg. DNS) to be reclaimed immediately on expiry
    a1ab650f1421 net: check dev->gso_max_size in gso_features_check()
    56eaa3ec3140 afs: Fix dynamic root lookup DNS check
    3f85785bc4ac afs: Fix the dynamic root's d_delete to always delete unused dentries
    3739e0a52d4d net: check vlan filter feature in vlan_vids_add_by_dev() and vlan_vids_del_by_dev()
    c124a75b2497 net: mana: select PAGE_POOL
    c0e527c532a0 net/rose: fix races in rose_kill_by_device()
    66d2116880e6 ethernet: atheros: fix a memleak in atl1e_setup_ring_resources
    87255af408df net: sched: ife: fix potential use-after-free
    242670aab84b net/mlx5e: Correct snprintf truncation handling for fw_version buffer used by representors
    da2396b54625 net/mlx5: Fix fw tracer first block check
    b0873aa484e9 net/mlx5e: fix a potential double-free in fs_udp_create_groups
    4ddba57b659a net/mlx5e: Fix slab-out-of-bounds in mlx5_query_nic_vport_mac_list()
    5ae420f65aff Revert "net/mlx5e: fix double free of encap_header"
    135fa6fac9b6 Revert "net/mlx5e: fix double free of encap_header in update funcs"
    b387f06849b4 wifi: mac80211: mesh_plink: fix matches_local logic
    6558f4aa2032 wifi: iwlwifi: pcie: add another missing bh-disable for rxq->lock
    183ea95f7374 s390/vx: fix save/restore of fpu kernel context
    58f3fc833321 reset: Fix crash when freeing non-existent optional resets
    52c69a070b94 ARM: OMAP2+: Fix null pointer dereference and memory leak in omap_soc_device_init
    d3ffbbb0bca5 ARM: dts: dra7: Fix DRA7 L3 NoC node register size

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 4f02e5acfa..1e61698222 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cf2f74df4ffdee7034979616bc37c5717b0d6070"
-SRCREV_meta ?= "d3ba5beca1136447584b7af10546fff974c36cc1"
+SRCREV_machine ?= "daa620f017a02ae381f1e54be7ceb8a2f3e3caee"
+SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.145"
+LINUX_VERSION ?= "5.15.146"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 037c33f434..c7c4e09bd9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.145"
+LINUX_VERSION ?= "5.15.146"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3b30ca7fb1716cd0f7bbf16c1253d8a4bbdeb421"
-SRCREV_meta ?= "d3ba5beca1136447584b7af10546fff974c36cc1"
+SRCREV_machine ?= "aade2fc343af128889d6c6f1071ec1a8e9a548a8"
+SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 0cb559b162..ef8c18b1b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5b261b61614c090b787fdadb865c5db3ee0171f4"
-SRCREV_machine:qemuarm64 ?= "fdaf870c63fc887b40138cca652ae961c9556a95"
-SRCREV_machine:qemumips ?= "8a07b5a788879035d1eea4df0780a40d131cf5d9"
-SRCREV_machine:qemuppc ?= "fffda6901d92bf63f7876cb6d912492030995588"
-SRCREV_machine:qemuriscv64 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
-SRCREV_machine:qemuriscv32 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
-SRCREV_machine:qemux86 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
-SRCREV_machine:qemux86-64 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
-SRCREV_machine:qemumips64 ?= "510f5a0a3daaf9f970b610a427f77c52289a2777"
-SRCREV_machine ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
-SRCREV_meta ?= "d3ba5beca1136447584b7af10546fff974c36cc1"
+SRCREV_machine:qemuarm ?= "f59d00a628c3ddb39052284a4a7bd54f9ee12999"
+SRCREV_machine:qemuarm64 ?= "8b10556d4fd67dec1a16252ef0d3058dfe31dff5"
+SRCREV_machine:qemumips ?= "b0c8aefa7811fd3b7cebb25c1565f73523c7b2ac"
+SRCREV_machine:qemuppc ?= "0ebd785a8436934e3f3e6dea6506de7f7ed9947e"
+SRCREV_machine:qemuriscv64 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
+SRCREV_machine:qemuriscv32 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
+SRCREV_machine:qemux86 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
+SRCREV_machine:qemux86-64 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
+SRCREV_machine:qemumips64 ?= "187d249255a797c470b0680f28e18a17a05c3bb4"
+SRCREV_machine ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
+SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d93fa2c78854d25ed4b67ac87f1c3c264d8b27fb"
+SRCREV_machine:class-devupstream ?= "26c690eff0a56293e0b6911a38e406c211b35547"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.145"
+LINUX_VERSION ?= "5.15.146"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


