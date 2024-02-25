Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD471C54E49
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:03 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.7426.1708897982489484984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TstMea7Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-53fa455cd94so1701145a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708897982; x=1709502782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdV9bfLI9hSGjzuv0K64PJ3j0B3u7oGyN4+L30pa9D4=;
        b=TstMea7YVN5JIMqywvoudUvYTlxWyysK+A9hD4FAwLLfmmmMUhqoa66BytaFATzepv
         GXy3HJwWfcf49Kqw7IzHziFKl88XGAw/HJMpoIWv6kld4+6OLeTLiYfRQEgrj3fAmxIg
         U79tvPr+ShYC54lmv0iNCfRR9t9eSOrp3qg2jp7Wps7iSm9MkHuuF7BtOOPx5YcdP7+v
         aMIevfQX/QWmOHBSxzlEo1xt/+bBWwRluPPhWjaYjKPFY3th+Pt4pV8Wk2CGZbdvhWf1
         AI46eSPPpAfHByGIwgUHYpHdmjz0UtjqZMEcH8NOci15t28cL7CiYgqQpvz60Q9G9Z6Y
         OQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708897982; x=1709502782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdV9bfLI9hSGjzuv0K64PJ3j0B3u7oGyN4+L30pa9D4=;
        b=bi+VQsWe40Z1Nya6lOZDxYAJAiUMU+rIT20UnVvy7ahwwQHwPT/M7MgN/tHiZ5TzsY
         CTWq26eFBFwfTqsuRgZyaj8D69bMwb/ixSOcrrNpvyrOwAqs5cLqix4P8igILVkpQceL
         vIDflvxlkN84N9kHv5IOZIKcwUkmJSUiw3f9V2TfEUpUksQRYD+RlEDHIh6irAjI2OJc
         ZXOtUU7KO+7WyXhLNiCx4Ah+voN4XEn+oujEzzv4NqoNnnkwZGMPVFYnORtm4Tl77/qF
         F/rld19OZXTWk4zXuOqhG1k3rnd+SYHr/DUjqyvWfhnLouLRg2b5ynfCrefyKFfQYm+g
         RHVg==
X-Gm-Message-State: AOJu0Yw+xQIOivknCbOxqSHZ9k1D1UvYF/Xmj95aYCsQ0P1Fp4YsfuH9
	L62Yekit0TL0H4Xi6zMjmOlVNO9fi04mhH7YrDZbTvnZg3IIgQm2N1+XSOM3EQRZFCxc625n9x/
	HsG6Z6Q==
X-Google-Smtp-Source: AGHT+IEzI4NVq1jk2pRtj0V3zKoJYJV0j3V8V/IY81h+Hi8Zt6Z02L12JY2fUHNujNS4rH5LauroMQ==
X-Received: by 2002:a17:90b:1b44:b0:299:2d59:a3d2 with SMTP id nv4-20020a17090b1b4400b002992d59a3d2mr3005972pjb.32.1708897981674;
        Sun, 25 Feb 2024 13:53:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/22] linux-yocto/5.10: update to v5.10.206
Date: Sun, 25 Feb 2024 11:52:25 -1000
Message-Id: <28b884d3ba7854fbddd353f57214a4a24799f29c.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196158

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    cf13ba74e8eb Linux 5.10.206
    2df1e1887c68 spi: atmel: Fix PDC transfer setup bug
    2a0a658ed6ef Bluetooth: SMP: Fix crash when receiving new connection when debug is enabled
    ecd50f820d86 Revert "MIPS: Loongson64: Enable DMA noncoherent support"
    9175341bd80b dm-integrity: don't modify bio's immutable bio_vec in integrity_metadata()
    73117ea03363 netfilter: nf_tables: skip set commit for deleted/destroyed sets
    8bf79dec73fe tracing: Fix blocked reader of snapshot buffer
    0afe42022865 ring-buffer: Fix wake ups when buffer_percent is set to 100
    9db5239d7533 scsi: core: Always send batch on reset or error handling command
    f2d30198c053 scsi: core: Use a structure member to track the SCSI command submitter
    df83ca8e986d scsi: core: Use scsi_cmd_to_rq() instead of scsi_cmnd.request
    d054858a9c9e scsi: core: Make scsi_get_lba() return the LBA
    f230e6d4249b scsi: core: Introduce scsi_get_sector()
    294d66c35a4e scsi: core: Add scsi_prot_ref_tag() helper
    929f475ebaf0 spi: atmel: Fix CS and initialization bug
    23d9267c548b spi: atmel: Switch to transfer_one transfer method
    db1b14eec8c6 Bluetooth: af_bluetooth: Fix Use-After-Free in bt_sock_recvmsg
    0c54b79d1d9b smb: client: fix OOB in smbCalcSize()
    203a412e52b5 smb: client: fix OOB in SMB2_query_info_init()
    79e158ddc3c7 usb: fotg210-hcd: delete an incorrect bounds test
    da448f145f8d Bluetooth: MGMT/SMP: Fix address type when using SMP over BREDR/LE
    4bc912140b1c Bluetooth: use inclusive language in SMP
    e219c3110a16 Bluetooth: SMP: Convert BT_ERR/BT_DBG to bt_dev_err/bt_dev_dbg
    cdbc4a1115a5 ARM: dts: Fix occasional boot hang for am3 usb
    1e2db0124c69 9p/net: fix possible memory leak in p9_check_errors()
    c4a22227f7eb x86/alternatives: Sync core before enabling interrupts
    7d407ef18327 lib/vsprintf: Fix %pfwf when current node refcount == 0
    565fadc3ea91 bus: ti-sysc: Flush posted write only after srst_udelay
    e50cfb544742 tracing / synthetic: Disable events after testing in synth_event_gen_test_init()
    cd6e41593ed7 dt-bindings: nvmem: mxs-ocotp: Document fsl,ocotp
    786788bb1396 net: ks8851: Fix TX stall caused by TX buffer overrun
    391c1019a005 net: rfkill: gpio: set GPIO direction
    6d7b8e5a6d91 net: 9p: avoid freeing uninit memory in p9pdu_vreadf
    45b63f09ba89 Input: soc_button_array - add mapping for airplane mode button
    2aa744ad0e9e Bluetooth: L2CAP: Send reject on command corrupted request
    25a6fdd26d13 Bluetooth: hci_event: Fix not checking if HCI_OP_INQUIRY has been sent
    71e1c7654010 USB: serial: option: add Quectel RM500Q R13 firmware support
    d521896bcc0b USB: serial: option: add Foxconn T99W265 with new baseline
    d0cf8a4bee42 USB: serial: option: add Quectel EG912Y module support
    f41f44cea9eb USB: serial: ftdi_sio: update Actisense PIDs constant names
    20d84a19466f wifi: cfg80211: fix certs build to not depend on file order
    7a0a5cbfea34 wifi: cfg80211: Add my certificate
    9dcf50da596d iio: adc: ti_am335x_adc: Fix return value check of tiadc_request_dma()
    abbebddb19ac iio: common: ms_sensors: ms_sensors_i2c: fix humidity conversion time table
    c40db29812f9 scsi: bnx2fc: Fix skb double free in bnx2fc_rcv()
    e3749f85fddc Input: ipaq-micro-keys - add error handling for devm_kmemdup
    b5f67cea27fa iio: imu: inv_mpu6050: fix an error code problem in inv_mpu6050_read_raw
    505df1c0abe6 interconnect: Treat xlate() returning NULL node as an error
    cc5eec86a4ff btrfs: do not allow non subvolume root targets for snapshot
    bd267af18f7b smb: client: fix NULL deref in asn1_ber_decoder()
    41350e813acf ALSA: hda/hdmi: add force-connect quirk for NUC5CPYB
    a4692c38cd57 ALSA: hda/hdmi: Add quirk to force pin connectivity on NUC10
    e032ddb0e387 pinctrl: at91-pio4: use dedicated lock class for IRQ
    0b85149a9dc1 i2c: aspeed: Handle the coalesced stop conditions with the start conditions.
    3dce7a52b2fa afs: Fix overwriting of result of DNS query
    97be1e865e70 keys, dns: Allow key types (eg. DNS) to be reclaimed immediately on expiry
    9e0d18f946b2 net: check dev->gso_max_size in gso_features_check()
    59dc16ce095d net: warn if gso_type isn't set for a GSO SKB
    63ad66d4844b afs: Fix dynamic root lookup DNS check
    65d2c287fc00 afs: Fix the dynamic root's d_delete to always delete unused dentries
    a3218319ee86 net: check vlan filter feature in vlan_vids_add_by_dev() and vlan_vids_del_by_dev()
    12e5a4719c99 net/rose: fix races in rose_kill_by_device()
    be0988c9b075 ethernet: atheros: fix a memleak in atl1e_setup_ring_resources
    8b6f8bfe3a3a net: sched: ife: fix potential use-after-free
    f245312e9f4f net/mlx5e: Correct snprintf truncation handling for fw_version buffer used by representors
    e8ba688a64f9 net/mlx5: Fix fw tracer first block check
    fc4c53f8e929 net/mlx5e: Fix slab-out-of-bounds in mlx5_query_nic_vport_mac_list()
    50aa92e6999d Revert "net/mlx5e: fix double free of encap_header"
    b851889e9184 wifi: mac80211: mesh_plink: fix matches_local logic
    717f08fb5140 s390/vx: fix save/restore of fpu kernel context
    c48219fad182 reset: Fix crash when freeing non-existent optional resets
    c999682ce8de ARM: OMAP2+: Fix null pointer dereference and memory leak in omap_soc_device_init
    dbc8edb80f05 smb: client: fix OOB in smb2_query_reparse_point()
    bc3c57493b20 ksmbd: fix wrong name of SMB2_CREATE_ALLOCATION_SIZE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index f208e23603..dadee940a7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "26e9b120876a03baa8fed8bf2932be84720ac0a4"
-SRCREV_meta ?= "24626abfda4a68c8208d7f35073bd3b88ed5ec21"
+SRCREV_machine ?= "14061087c21bd1e06e1bc2481963775df5352ddb"
+SRCREV_meta ?= "4a986ccf44f0b0704aac7219c0c50657b1243869"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.205"
+LINUX_VERSION ?= "5.10.206"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 2f8da6c9d6..8e8502082f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.205"
+LINUX_VERSION ?= "5.10.206"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "edc2a17c5d9e6b79ee236576d290c01f6954c668"
-SRCREV_machine ?= "b92447a12f8948eb4b225ea8381a3fd7f68eb95a"
-SRCREV_meta ?= "24626abfda4a68c8208d7f35073bd3b88ed5ec21"
+SRCREV_machine:qemuarm ?= "0eb69a54e4228b28635969d8b5285fa00b2d46bf"
+SRCREV_machine ?= "adab8533b3eab4befe6a5c22ef3c0f799f35473c"
+SRCREV_meta ?= "4a986ccf44f0b0704aac7219c0c50657b1243869"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 39c73167b7..7f10707287 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5dcb45e1013a50afd74d45251c53adcc11e49c43"
-SRCREV_machine:qemuarm64 ?= "f30706a152e40f416d1a917e903f910e1d9f750d"
-SRCREV_machine:qemumips ?= "667e97ccdf32c32d43e65478a3d6de906f4c32ba"
-SRCREV_machine:qemuppc ?= "1c961b6a76a0a3943877f957d82fe4015dd01299"
-SRCREV_machine:qemuriscv64 ?= "0e1dfe1d29013deb4cfa75170fa414e75a14c530"
-SRCREV_machine:qemuriscv32 ?= "0e1dfe1d29013deb4cfa75170fa414e75a14c530"
-SRCREV_machine:qemux86 ?= "0e1dfe1d29013deb4cfa75170fa414e75a14c530"
-SRCREV_machine:qemux86-64 ?= "0e1dfe1d29013deb4cfa75170fa414e75a14c530"
-SRCREV_machine:qemumips64 ?= "c8120c253335d4e2d043d21aee1ae53a85f2811c"
-SRCREV_machine ?= "0e1dfe1d29013deb4cfa75170fa414e75a14c530"
-SRCREV_meta ?= "24626abfda4a68c8208d7f35073bd3b88ed5ec21"
+SRCREV_machine:qemuarm ?= "86b57918e638288aaf1978fc5d848471f5b7b753"
+SRCREV_machine:qemuarm64 ?= "7265b197984efac64d0208735e45012651034b13"
+SRCREV_machine:qemumips ?= "577c296749ff07c282addf48ebe477e37736c6a6"
+SRCREV_machine:qemuppc ?= "efd25ea4b055690af54891598de44c2e50a43754"
+SRCREV_machine:qemuriscv64 ?= "bda297fbd0d0544947816c760977fe3157a197f9"
+SRCREV_machine:qemuriscv32 ?= "bda297fbd0d0544947816c760977fe3157a197f9"
+SRCREV_machine:qemux86 ?= "bda297fbd0d0544947816c760977fe3157a197f9"
+SRCREV_machine:qemux86-64 ?= "bda297fbd0d0544947816c760977fe3157a197f9"
+SRCREV_machine:qemumips64 ?= "543fd3927ab8613288a8e6cfbd9e0a3ba66cfdef"
+SRCREV_machine ?= "bda297fbd0d0544947816c760977fe3157a197f9"
+SRCREV_meta ?= "4a986ccf44f0b0704aac7219c0c50657b1243869"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.205"
+LINUX_VERSION ?= "5.10.206"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


