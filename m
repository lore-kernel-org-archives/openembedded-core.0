Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B07BC5479F
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:31:08 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.14017.1708612261723791650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zZtjQFmq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d932f6ccfaso66850295ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708612261; x=1709217061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vb8/WA3ymOD6AfSS37jZfSYc/8AmF0T8Y5s43qy+hLU=;
        b=zZtjQFmqDooWqqEnVcLFQv2ExbfQ1WrTfHZNjMa/AA6OjXQNimQoSs/7DtIsBq4cXj
         TZXPZ6uuWjN8HBzNVVgMbZ/1O5MKGdRXheey80a6KfjSVp1tmgcqMesYxQobDWh/DrjF
         x+VMspKrB+rzpzWx5ulvyA4cQemcnexPZ5BrV1eD0idmSEo8T/sjhZC4EHA/gaCzpafJ
         JkdU5AKJhUysXQfc95YIft7HfmM2I1xNejsgB5GZJoRJ2YGAWB+DEl4+Eo6xJs0ppz1o
         AYQ3UzTDYhPUJQqry8JipIaeU4Ie9GKq9/RedH/TZ66eKjQMLksFtslk2GIIN0XUDfsi
         Y1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708612261; x=1709217061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vb8/WA3ymOD6AfSS37jZfSYc/8AmF0T8Y5s43qy+hLU=;
        b=pydZACv7TlhVDVV64oe+bQebiSBTD/apvzL8G65//7C6fV/aorJq3OMkFbASrImWOD
         QExbCNYxAPEXGZ++9kaq4natNbVIDBaTnx/w9wFFaS8JLpdb5GAp1RMKUNksAK1/6rLa
         aM3lj0+b7wzNbA3bGKgCI3G71R4CSM3A0mdNUlqUIF7tBD5HeFG+2XNE335OxAzERHYB
         NeipMGbc/aeNRv26Rg7j5eelunGAi4O9vTO2BoDEh9WF14to0L42vyGJH070fMtutQ1/
         biiUdKK3g1iRYEr36CyVAcdOOdsAocfxl1V8/jYh0oMsgAW6ldueDGEKbB6evFE/E2ts
         +ZJg==
X-Gm-Message-State: AOJu0YxFgg577UqTN9aHP63IRJG8hCmc3+oiTga3L3Vy1wyuvoykDQWz
	nbr+uzwRK/VXx7C7S06ivbSqme7Yk9Dv1W4ik8ZQov+kfuc6CKqMUd3C37Iwi4w8NmhB4Zpo8Rh
	Juzk=
X-Google-Smtp-Source: AGHT+IGQJSVIT0APfg6mIy3RjtgPB2AVjqyh4iHXRMor82EoLTSMmW1bzmTG8czdOkEZs9gGbc8U8w==
X-Received: by 2002:a17:902:db01:b0:1db:f952:eebf with SMTP id m1-20020a170902db0100b001dbf952eebfmr12287046plx.44.1708612260693;
        Thu, 22 Feb 2024 06:31:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902f28d00b001dbcf653024sm9364558plc.293.2024.02.22.06.30.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:31:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/9] linux-yocto/5.4: update to v5.4.268
Date: Thu, 22 Feb 2024 04:30:38 -1000
Message-Id: <4fcc89e90ed1399cdf761a0d2f7363d86fa23f23.1708612053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708612053.git.steve@sakoman.com>
References: <cover.1708612053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196026

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    f0602893f43a Linux 5.4.268
    5ff9836ab0f6 arm64: dts: armada-3720-turris-mox: set irq type for RTC
    300a55a3a6d4 perf top: Skip side-band event setup if HAVE_LIBBPF_SUPPORT is not set
    ea5587946a15 i2c: s3c24xx: fix transferring more than one message in polling mode
    90734f1cdee8 i2c: s3c24xx: fix read transfers in polling mode
    05b6d0234a37 mlxsw: spectrum_acl_erp: Fix error flow of pool allocation failure
    d5661f46c11d kdb: Fix a potential buffer overflow in kdb_local()
    cf6260a34d28 kdb: Censor attempts to set PROMPT without ENABLE_MEM_READ
    36b6db699c03 ipvs: avoid stat macros calls from preemptible context
    4c8a827d68ba netfilter: nf_tables: skip dead set elements in netlink dump
    db9fda526c8d net: dsa: vsc73xx: Add null pointer check to vsc73xx_gpio_probe
    8efe3e8a6c4c net: ravb: Fix dma_addr_t truncation in error case
    f7a153e3ac41 net: phy: micrel: populate .soft_reset for KSZ9131
    02467ab8b404 net: qualcomm: rmnet: fix global oob in rmnet_policy
    5b58cfcd4ce1 s390/pci: fix max size calculation in zpci_memcpy_toio()
    14a7e3a0d099 PCI: keystone: Fix race condition when initializing PHYs
    40d171ef2389 nvmet-tcp: Fix the H2C expected PDU len calculation
    258dccd67ba0 serial: imx: Correct clock error message in function probe()
    1d8e62b5569c apparmor: avoid crash when parsed profile name is empty
    4cd5db4fc46c perf env: Avoid recursively taking env->bpf_progs.lock
    f19a1cb1f9f4 perf bpf: Decouple creating the evlist from adding the SB event
    739b800279d0 perf top: Move sb_evlist to 'struct perf_top'
    2d59b6ed998d perf record: Move sb_evlist to 'struct record'
    14a9769a769e perf env: Add perf_env__numa_node()
    9638beb4e10a nvmet-tcp: fix a crash in nvmet_req_complete()
    ee5e7632e981 nvmet-tcp: Fix a kernel panic when host sends an invalid H2C PDU length
    887ab0a444f0 perf genelf: Set ELF program header addresses properly
    ed903eeb4e2e software node: Let args be NULL in software_node_get_reference_args
    dbb71ba53146 acpi: property: Let args be NULL in __acpi_node_get_property_reference
    b502fb43f7fb serial: 8250: omap: Don't skip resource freeing if pm_runtime_resume_and_get() failed
    d8003fdcc66c MIPS: Alchemy: Fix an out-of-bound access in db1550_dev_setup()
    93a7b8d4338b MIPS: Alchemy: Fix an out-of-bound access in db1200_dev_setup()
    fa873e90301c mips: Fix incorrect max_low_pfn adjustment
    b419fe1180f7 HID: wacom: Correct behavior when processing some confidence == false touches
    f7a92bec8eea x86/kvm: Do not try to disable kvmclock if it was not enabled
    1d6d95aaa692 wifi: mwifiex: configure BSSID consistently when starting AP
    249b78dbb154 wifi: rtlwifi: Convert LNKCTL change to PCIe cap RMW accessors
    c22b4f159b27 wifi: rtlwifi: Remove bogus and dangerous ASPM disable/enable code
    b33a30358826 rootfs: Fix support for rootfstype= when root= is given
    02bd78673b65 fbdev: flush deferred work in fb_deferred_io_fsync()
    7cfc97d1ec3f ALSA: oxygen: Fix right channel of capture volume mixer
    85f6a6590dcf usb: mon: Fix atomicity violation in mon_bin_vma_fault
    14e60d584a42 usb: typec: class: fix typec_altmode_put_partner to put plugs
    94f2aa8145f4 Revert "usb: typec: class: fix typec_altmode_put_partner to put plugs"
    a05ebd577979 usb: chipidea: wait controller resume finished for wakeup irq
    d9c8275c5960 Revert "usb: dwc3: don't reset device side if dwc3 was configured as host-only"
    548a00780d34 Revert "usb: dwc3: Soft reset phy on probe for host"
    c145217af8bf usb: dwc: ep0: Update request status in dwc3_ep0_stall_restart
    5d5d9827016a usb: phy: mxs: remove CONFIG_USB_OTG condition for mxs_phy_is_otg_host()
    29032c8e3e31 tick-sched: Fix idle and iowait sleeptime accounting vs CPU hotplug
    5c3d4930c7b7 binder: fix unused alloc->free_async_space
    252a2a5569eb binder: fix race between mmput() and do_exit()
    4404c2b832cf xen-netback: don't produce zero-size SKB frags
    ee4e9c5ffff9 Revert "ASoC: atmel: Remove system clock tree configuration for at91sam9g20ek"
    01fe1b7bb0aa Input: atkbd - use ab83 as id when skipping the getid command
    a53e15e592b4 binder: fix use-after-free in shinker's callback
    fc1119a3c65d binder: fix async space check for 0-sized buffers
    1b7c039260ce of: unittest: Fix of_count_phandle_with_args() expected value message
    a0a061151a62 of: Fix double free in of_parse_phandle_with_args_map
    a9de8a4f52ff mmc: sdhci_omap: Fix TI SoC dependencies
    b8bbe3354419 clk: si5341: fix an error code problem in si5341_output_clk_set_rate
    4810cce02967 watchdog: bcm2835_wdt: Fix WDIOC_SETTIMEOUT handling
    11a64041d921 watchdog/hpwdt: Only claim UNKNOWN NMI if from iLO
    0d5685c13d55 watchdog: set cdev owner before adding
    777aa44f63fa drivers: clk: zynqmp: calculate closest mux rate
    5a572eb32fd3 gpu/drm/radeon: fix two memleaks in radeon_vm_init
    8b55b06e737f drivers/amd/pm: fix a use-after-free in kv_parse_power_table
    06d95c99d5a4 drm/amd/pm: fix a double-free in si_dpm_init
    8ee1fb4c5168 drm/amdgpu/debugfs: fix error code when smc register accessors are NULL
    68ec0a0211c4 media: dvbdev: drop refcount on error path in dvb_device_open()
    06a9263ac925 media: cx231xx: fix a memleak in cx231xx_init_isoc
    6a421928f7b2 drm/bridge: tc358767: Fix return value on error case
    d46fe2e93e53 drm/radeon/trinity_dpm: fix a memleak in trinity_parse_power_table
    c0769f091ff9 drm/radeon/dpm: fix a memleak in sumo_parse_power_table
    5d12c5d75f7c drm/radeon: check the alloc_workqueue return value in radeon_crtc_init()
    09d59f73f46a drm/drv: propagate errors from drm_modeset_register_all()
    31b169a8bed7 drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
    9170aa07cb20 drm/msm/mdp4: flush vblank event on disable
    136f919816cc ASoC: cs35l34: Fix GPIO name and drop legacy include
    86af5d7acf4c ASoC: cs35l33: Fix GPIO name and drop legacy include
    94aa82723abb drm/radeon: check return value of radeon_ring_lock()
    bf48d891234b drm/radeon/r100: Fix integer overflow issues in r100_cs_track_check()
    8e5bcb781f87 drm/radeon/r600_cs: Fix possible int overflows in r600_cs_check_reg()
    5624a3c1b1eb f2fs: fix to avoid dirent corruption
    b083ec00f39e drm/bridge: Fix typo in post_disable() description
    47aa8fcd5e8b media: pvrusb2: fix use after free on context disconnection
    f6a35c21cde3 RDMA/usnic: Silence uninitialized symbol smatch warnings
    9bb977521768 ARM: davinci: always select CONFIG_CPU_ARM926T
    3f15ba3dc14e ip6_tunnel: fix NEXTHDR_FRAGMENT handling in ip6_tnl_parse_tlv_enc_lim()
    dcc9cd5ddb94 Bluetooth: btmtkuart: fix recv_buf() return value
    efcfcd5f2b5e Bluetooth: Fix bogus check for re-auth no supported with non-ssp
    598c902649ea netfilter: nf_tables: mark newset as dead on transaction abort
    8dbaaf71ffc2 wifi: rtlwifi: rtl8192se: using calculate_bit_shift()
    8fa54f7532c8 wifi: rtlwifi: rtl8192ee: using calculate_bit_shift()
    4838d1666660 wifi: rtlwifi: rtl8192de: using calculate_bit_shift()
    e15fcb194542 rtlwifi: rtl8192de: make arrays static const, makes object smaller
    ae1df4cc0adb wifi: rtlwifi: rtl8192ce: using calculate_bit_shift()
    a3a25b5d019c wifi: rtlwifi: rtl8192cu: using calculate_bit_shift()
    6f84a338ed61 wifi: rtlwifi: rtl8192c: using calculate_bit_shift()
    ee0a81cf7e7b wifi: rtlwifi: rtl8188ee: phy: using calculate_bit_shift()
    7cbcf5fe01d0 wifi: rtlwifi: add calculate_bit_shift()
    4985e507e0b9 dma-mapping: clear dev->dma_mem to NULL after freeing it
    48614d528b42 virtio/vsock: fix logic which reduces credit update messages
    332cd73a9298 selftests/net: fix grep checking for fib_nexthop_multiprefix
    12b91f36369b scsi: hisi_sas: Replace with standard error code return value
    14470da02dfc arm64: dts: qcom: sdm845-db845c: correct LED panic indicator
    c23c4984ce0b scsi: fnic: Return error if vmalloc() failed
    16d21bfcb371 wifi: rtlwifi: rtl8821ae: phy: fix an undefined bitwise shift behavior
    4a20fa7322e2 rtlwifi: Use ffs in <foo>_phy_calculate_bit_shift
    0226926ba326 firmware: ti_sci: Fix an off-by-one in ti_sci_debugfs_create()
    ef75f3c56bf3 net/ncsi: Fix netlink major/minor version numbers
    7276fac0a668 ncsi: internal.h: Fix a spello
    f6154d498365 ARM: dts: qcom: apq8064: correct XOADC register address
    bd1bf5e8056a wifi: libertas: stop selecting wext
    dc843ed97ddb bpf, lpm: Fix check prefixlen before walking trie
    93c71706a1f0 wifi: rtw88: fix RX filter in FIF_ALLMULTI flag
    aebe7e47c201 NFSv4.1/pnfs: Ensure we handle the error NFS4ERR_RETURNCONFLICT
    db55dbbba5e5 blocklayoutdriver: Fix reference leak of pnfs_device_node
    e0e3f4a18784 crypto: scomp - fix req->dst buffer overflow
    77d2b1833631 crypto: sahara - do not resize req->src when doing hash operations
    53ba86f765d4 crypto: sahara - fix processing hash requests with req->nbytes < sg->length
    ba1ef4276e10 crypto: sahara - improve error handling in sahara_sha_process()
    0274697075e1 crypto: sahara - fix wait_for_completion_timeout() error handling
    b588ed190b9a crypto: sahara - fix ahash reqsize
    aea92cca4375 crypto: virtio - Wait for tasklet to complete on device remove
    efc8ef87ab91 gfs2: Fix kernel NULL pointer dereference in gfs2_rgrp_dump
    d1fe1aede684 pstore: ram_core: fix possible overflow in persistent_ram_init_ecc()
    6e907574ef9b crypto: sahara - fix error handling in sahara_hw_descriptor_create()
    e82d07d5c709 crypto: sahara - fix processing requests with cryptlen < sg->length
    da43c26203d9 crypto: sahara - fix ahash selftest failure
    beb815a0001e crypto: sahara - remove FLAGS_NEW_KEY logic
    4c10928e31c7 crypto: af_alg - Disallow multiple in-flight AIO requests
    ca3484d5cadc crypto: ccp - fix memleak in ccp_init_dm_workarea
    9fffae6cc42b virtio_crypto: Introduce VIRTIO_CRYPTO_NOSPC
    01081d76cc3e crypto: virtio - don't use 'default m'
    830a4f073f7e crypto: virtio - Handle dataq logic with tasklet
    86a7c9ba839e selinux: Fix error priority for bind with AF_UNSPEC on PF_INET6 socket
    1bf4fe14e97c mtd: Fix gluebi NULL pointer dereference caused by ftl notifier
    6b84cb9e383d spi: sh-msiof: Enforce fixed DTDL for R-Car H3
    36e19f84634a calipso: fix memory leak in netlbl_calipso_add_pass()
    0396c1e211bb netlabel: remove unused parameter in netlbl_netlink_auditinfo()
    7b99eafea070 net: netlabel: Fix kerneldoc warnings
    6c38e791bde0 ACPI: LPIT: Avoid u32 multiplication overflow
    1e3a2b9b4039 ACPI: video: check for error while searching for backlight device parent
    f5ea2cf3bbb1 mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand controller response
    1e80aa25d186 powerpc/imc-pmu: Add a null pointer check in update_events_in_group()
    9da4a56dd377 powerpc/powernv: Add a null pointer check in opal_powercap_init()
    e93d7cf4c1dd powerpc/powernv: Add a null pointer check in opal_event_init()
    f84c1446daa5 powerpc/powernv: Add a null pointer check to scom_debug_init_one()
    b0200560b69e selftests/powerpc: Fix error handling in FPU/VMX preemption tests
    9b5f03500bc5 powerpc/pseries/memhp: Fix access beyond end of drmem array
    69c0b92f78a2 powerpc/pseries/memhotplug: Quieten some DLPAR operations
    5401b689ad44 powerpc/44x: select I2C for CURRITUCK
    245da9eebba0 powerpc: add crtsavres.o to always-y instead of extra-y
    5da3b6e7196f EDAC/thunderx: Fix possible out-of-bounds string access
    555a2f09a69d x86/lib: Fix overflow when counting digits
    6ee48d71021e coresight: etm4x: Fix width of CCITMIN field
    b00d5f7152ab parport: parport_serial: Add Brainboxes device IDs and geometry
    760a5ab4d880 parport: parport_serial: Add Brainboxes BAR details
    e93da893d52d uio: Fix use-after-free in uio_open
    da488e1aad20 binder: fix comment on binder_alloc_new_buf() return value
    a92b2797ca72 binder: fix trivial typo of binder_free_buf_locked()
    9774dabad707 binder: use EPOLLERR from eventpoll.h
    5e1eb0dfc95b ACPI: resource: Add another DMI match for the TongFang GMxXGxx
    c5b051750011 drm/crtc: fix uninitialized variable use
    cfc6afe930c6 ARM: sun9i: smp: fix return code check of of_property_match_string
    ef7152f8705f ida: Fix crash in ida_free when the bitmap is empty
    c97996451f94 Input: xpad - add Razer Wolverine V2 support
    510a7bc3682d ARC: fix spare error
    0fe6431622b7 s390/scm: fix virtual vs physical address confusion
    8fb5795bcf81 Input: i8042 - add nomux quirk for Acer P459-G2-M
    2c70bf99783b Input: atkbd - skip ATKBD_CMD_GETID in translated mode
    3d9a9c0881f4 reset: hisilicon: hi6220: fix Wvoid-pointer-to-enum-cast warning
    4f7512e779ae ring-buffer: Do not record in NMI if the arch does not support cmpxchg in NMI
    e405c22ee576 tracing: Add size check when printing trace_marker output
    f787481af4a8 tracing: Have large events show up as '[LINE TOO BIG]' instead of nothing
    d4408ffeb848 neighbour: Don't let neigh_forced_gc() disable preemption for long
    9cc9683aec42 drm/crtc: Fix uninit-value bug in drm_mode_setcrtc
    2f601e869611 jbd2: correct the printing of write_flags in jbd2_write_superblock()
    1c187cb210c1 clk: rockchip: rk3128: Fix HCLK_OTG gate register
    3f50a73fd929 drm/exynos: fix a wrong error checking
    8bc21ac17da8 drm/exynos: fix a potential error pointer dereference
    6eb975932853 nvme: introduce helper function to get ctrl state
    971c0b10c94d ASoC: da7219: Support low DC impedance headset
    ec76b9e057de net/tg3: fix race condition in tg3_reset_task()
    ef9fefca3fec nouveau/tu102: flush all pdbs on vmm flush
    b67005b284dd ASoC: rt5650: add mutex to avoid the jack detection failure
    4fece6617b57 ASoC: cs43130: Fix incorrect frame delay configuration
    1bf33a67a944 ASoC: cs43130: Fix the position of const qualifier
    61c1e46fb84e ASoC: Intel: Skylake: mem leak in skl register function
    81610106fd5b ASoC: nau8822: Fix incorrect type in assignment and cast to restricted __be16
    ad5a06e16365 ASoC: Intel: Skylake: Fix mem leak in few functions
    57a95d06da3e ALSA: hda - Fix speaker and headset mic pin config for CHUWI CoreBook XPro
    ebc3c8e090a0 pinctrl: lochnagar: Don't build on MIPS
    12cf91e23b12 f2fs: explicitly null-terminate the xattr list

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 44278cb2a4..e3a971cbe3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "36f355fd2c80860745565b2e5bd293d35a645b86"
-SRCREV_meta ?= "8ce0cca5a5a2895ef024bee2daff56c5e846c3bc"
+SRCREV_machine ?= "1a529c784c773e07e2e7a743cf92d99d5f64b175"
+SRCREV_meta ?= "c841eec84cf56e6b837f12a359c35c5dfb26da5f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.267"
+LINUX_VERSION ?= "5.4.268"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index abc7ecad06..00a32019d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.267"
+LINUX_VERSION ?= "5.4.268"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "f5c9f947b3349a982c032c81f4b636728e2b8004"
-SRCREV_machine ?= "028ae2c5666867a95ebc7b44723048286338bb0d"
-SRCREV_meta ?= "8ce0cca5a5a2895ef024bee2daff56c5e846c3bc"
+SRCREV_machine_qemuarm ?= "19870769466f545dbfacc448a212acb0dd1324a4"
+SRCREV_machine ?= "b0ebc762e3ecbc4f0338456767a5901fce805155"
+SRCREV_meta ?= "c841eec84cf56e6b837f12a359c35c5dfb26da5f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 550960dcd0..2a30cf6a4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8c115d2b1f1a2f1ddc5196fd13d2045ed65d5c6e"
-SRCREV_machine_qemuarm64 ?= "9f7ddd1312cafad0c67288936518e94d9f7cecc5"
-SRCREV_machine_qemumips ?= "6a033ec3a29689156cd3e9c16383560f21e230e2"
-SRCREV_machine_qemuppc ?= "d2ca96883f4c93dfd56e5dc203b15ea36151cf4c"
-SRCREV_machine_qemuriscv64 ?= "2ee6ae8d74b9921a1454fec6949b79bd676a95c8"
-SRCREV_machine_qemux86 ?= "2ee6ae8d74b9921a1454fec6949b79bd676a95c8"
-SRCREV_machine_qemux86-64 ?= "2ee6ae8d74b9921a1454fec6949b79bd676a95c8"
-SRCREV_machine_qemumips64 ?= "e75dbfccf896e92c327165880b90e42049774552"
-SRCREV_machine ?= "2ee6ae8d74b9921a1454fec6949b79bd676a95c8"
-SRCREV_meta ?= "8ce0cca5a5a2895ef024bee2daff56c5e846c3bc"
+SRCREV_machine_qemuarm ?= "a1fa03030adf951abcd2fc5c44f6133352e452da"
+SRCREV_machine_qemuarm64 ?= "31006b756f0b4b686b0fe4fad0f122ad427756de"
+SRCREV_machine_qemumips ?= "199be2c0b3869c13ea32737a316e51eca1a3cd6f"
+SRCREV_machine_qemuppc ?= "f1575e20066e5f61c363e7fccdcdf8b8ae23a8f3"
+SRCREV_machine_qemuriscv64 ?= "698e12267b8f334a5f6a2024e4b9b1f8a95a05ac"
+SRCREV_machine_qemux86 ?= "698e12267b8f334a5f6a2024e4b9b1f8a95a05ac"
+SRCREV_machine_qemux86-64 ?= "698e12267b8f334a5f6a2024e4b9b1f8a95a05ac"
+SRCREV_machine_qemumips64 ?= "a9c1d19cd3d1d0df846cd419cd75cf59995f89eb"
+SRCREV_machine ?= "698e12267b8f334a5f6a2024e4b9b1f8a95a05ac"
+SRCREV_meta ?= "c841eec84cf56e6b837f12a359c35c5dfb26da5f"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.267"
+LINUX_VERSION ?= "5.4.268"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


