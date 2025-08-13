Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3FECA0EE6
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 20:49:33 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.7101.1755118170119247783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 13:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O+N0QLNc;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70a9f5625b7so3269826d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 13:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755118169; x=1755722969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEQWG4faaRIvynGgt0SG1lHK8/RmGId72i5sJXUOCbU=;
        b=O+N0QLNcj+jn/C2eNYrykbAFw5oHMwjKXa6k1BFaisQEuUy8ijrFJF8qRly0mRJjAf
         Vg9OgX4DFMvsSxgT40sepVBZ2oBMnmloqG2JkpLwqB/+Xv3EthwS5EHWI2fV42VI/qm0
         hJdDLZ4448I4WBSrkO1vgj8zfeXwlN/CdRPILnQV+QQnhqJejRcUaK+X3UPqqMa8aFGN
         gGs4YCz2ResWKpzLLudNLfAjMt/EdQFy9SuoHT315uuNdLwjLTakmtt9bPBHAkHdHjeZ
         DPs0kUhqsM9iROWc2S/FcTGYX4/bu4r5kEJrBoI+WQRrJcwZpeajEP2iyQhG6W3wb/ju
         TZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755118169; x=1755722969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEQWG4faaRIvynGgt0SG1lHK8/RmGId72i5sJXUOCbU=;
        b=O5PlHqX/uiOay4Mn5C/zzl/IOI+GPfFnRVRW3vQwVVVOONu7P0whaV7XDmXPMRBZ/a
         FpnZnVVG8/lbNowvGJC4/XH0e/rSK7/f5W6PME3uWIZZyYm+PMBX1b7b1GRVr2bq4Cv2
         IvXBON6u0D+kyFOtw+MhMRC8uigbtJuWh8qECNz9nCTv9swJR4ALJqPEFpcF9yFbF5R3
         l5GPxHxxfXn0r5OBVePJ8RTpbhIVi3mRMCwrfBPrV3zMYHRvXIewI4/GqilQbNvcwHsm
         4yWC+wH5i2pqfsjTNlTV7yO77zSUkNAWl0U2I9FGDNb28zHriT1DAF/fTcPSv6wlPrF/
         iWtQ==
X-Gm-Message-State: AOJu0YyNnvBCXjFc5/rQvxbzVZ4tZY40eIxmq0lyWlZY4mp2wPFQiNAg
	Iq3DJPqCNzuL2cai+mfF/CjzPWR6HvFtct/wOp+t355JjSMV7e6woFzlc3MnCDK7
X-Gm-Gg: ASbGncsjmrhYmCGOmL8zopPM6TASAlmjn52NoAg8ygIVTnrOUoKiGMj440RCC35ZhA/
	usm4TUeQUN48cDIqnoK3PkLTSjmT+dZib5MR6Zf1wEAzvifirWWtz2z3eo16J+1ec709EBslXKW
	qmZWwrA5+adaQxTBxve9Z3nlJv67WDkCzZbSUVpPuQU5t2dq0v5crzT2iGzibRopM28QYn4zaIs
	pt+wZmJEPtZcLrfS64Hu/C0vtOhDUPqme1LeNH0Vj6KRO6l1iv6bGV7rIAqZCIWpxr/tAOMpyfY
	C55CsD3i0BqRnKmifsgTRJdylwHTQEr8XOdXdE7ibfBEfIgd7+f1+qLRAQFXrlkMPyh0DhrY9/D
	rMjjt4P+z05ALjEADjjcSXDZAjsFAKegIbea6nv2Yje5daqMo7gZljFC6h3i4EYKevszS+QBrIR
	axtYs2Dxxa2Vipn//VrFT7RZA=
X-Google-Smtp-Source: AGHT+IGfeG2ROnCfCNIV97ozKHOnMH4zfcdr2LCX5EaiOlJl9KQgb55meQM4DTjmDNd9oXiS3864+Q==
X-Received: by 2002:a05:6214:5007:b0:707:4628:3e72 with SMTP id 6a1803df08f44-70af5c7c2ddmr12274226d6.45.1755118168927;
        Wed, 13 Aug 2025 13:49:28 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70af5b07658sm3326516d6.43.2025.08.13.13.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:49:27 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/6.12: update to v6.12.40
Date: Wed, 13 Aug 2025 16:49:17 -0400
Message-Id: <a2106de88ac667beef1e112c290731bfac3a6624.1755118020.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1755118020.git.bruce.ashfield@gmail.com>
References: <cover.1755118020.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 20:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221823

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    d90ecb2b1308 Linux 6.12.40
    fd627ac8a5cf KVM: x86/xen: Fix cleanup logic in emulation of Xen schedop poll hypercalls
    ff7ccaadb0bf iommu/vt-d: Fix misplaced domain_attached assignment
    e82d8825f712 smb: client: let smbd_post_send_iter() respect the peers max_send_size and transmit all data
    11f430b8f5fc drm/xe: Move page fault init after topology init
    ce7585324b20 drm/xe/mocs: Initialize MOCS index early
    8fc25d3055ba sched,freezer: Remove unnecessary warning in __thaw_task
    7258b437d55d i2c: omap: fix deprecated of_property_read_bool() use
    f701716812cb i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe()
    ba35cc0598f3 i2c: omap: Fix an error handling path in omap_i2c_probe()
    c1a786faa6ec i2c: omap: Add support for setting mux
    35fdf1093109 selftests/bpf: Set test path for token/obj_priv_implicit_token_envvar
    d9ebd928288b rust: use `#[used(compiler)]` to fix build and `modpost` with Rust >= 1.89.0
    affb46db59f9 net: libwx: fix multicast packets received count
    75747e25beca usb: dwc3: qcom: Don't leave BCR asserted
    c45b48b4f4c0 usb: hub: Don't try to recover devices lost during warm reset.
    bf71baa3cfe7 usb: hub: Fix flushing of delayed work used for post resume purposes
    e11359640090 usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm
    aec11e5f9c45 usb: hub: fix detection of high tier USB3 devices behind suspended hubs
    ee56da95f896 btrfs: fix block group refcount race in btrfs_create_pending_block_groups()
    e77078e52fbf clone_private_mnt(): make sure that caller has CAP_SYS_ADMIN in the right userns
    7fc808d98215 sched: Change nr_uninterruptible type to unsigned long
    816d36973467 efivarfs: Fix memory leak of efivarfs_fs_info in fs_context error paths
    44e73241b8be libbpf: Fix handling of BPF arena relocations
    f0de9702f9b2 drm/mediatek: only announce AFBC if really supported
    40b5b4ba8ed8 drm/mediatek: Add wait_event_timeout when disabling plane
    b04fb2628b28 Revert "cgroup_freezer: cgroup_freezing: Check if not frozen"
    d7c1098787a6 rxrpc: Fix transmission of an abort in response to an abort
    839fe96c1520 rxrpc: Fix recv-recv race of completed call
    e5c480dc62a3 net/sched: Return NULL when htb_lookup_leaf encounters an empty rbtree
    71f435f846b0 net: bridge: Do not offload IGMP/MLD messages
    8984bcbd1edf net: vlan: fix VLAN 0 refcount imbalance of toggling filtering during runtime
    cdb767915fc9 tls: always refresh the queue when reading sock
    4e7c46362550 virtio-net: fix recursived rtnl_lock() during probe()
    1a71bf5c91ab hv_netvsc: Set VF priv_flags to IFF_NO_ADDRCONF before open to prevent IPv6 addrconf
    5db93cbd7d50 Bluetooth: L2CAP: Fix attempting to adjust outgoing MTU
    1259b780e7b9 drm/xe/pf: Prepare to stop SR-IOV support prior GT reset
    be77ce6b3a6b drm/xe/pf: Move VFs reprovisioning to worker
    abe59c53b626 drm/xe/pf: Sanitize VF scratch registers on FLR
    fc38c249c622 netfilter: nf_conntrack: fix crash due to removal of uninitialised entry
    7c532f222361 net: fix segmentation after TCP/UDP fraglist GRO
    7929d27c747e ipv6: mcast: Delay put pmc->idev in mld_del_delrec()
    35b501a2393a net/mlx5: Correctly set gso_size when LRO is used
    f47400547a95 Bluetooth: btusb: QCA: Fix downloading wrong NVM for WCN6855 GF variant without board ID
    f5a40e54cd6c Bluetooth: hci_core: add missing braces when using macro parameters
    db386fc5fa65 Bluetooth: SMP: Fix using HCI_ERROR_REMOTE_USER_TERM on timeout
    6c586fcb880a Bluetooth: SMP: If an unallowed command is received consider it a failure
    05ab8da312ec Bluetooth: hci_sync: fix connectable extended advertising when using static random address
    b97be7ee8a1c Bluetooth: Fix null-ptr-deref in l2cap_sock_resume_cb()
    95a13b0a6b04 riscv: traps_misaligned: properly sign extend value in misaligned load handler
    32b14e757404 riscv: Enable interrupt during exception handling
    efad4e2a0fa7 loop: use kiocb helpers to fix lockdep warning
    65c666aff44e usb: net: sierra: check for no status endpoint
    cd469b173d14 ice: check correct pointer in fwlog debugfs
    5a5d64f0eec8 ice: add NULL check in eswitch lag check
    3c4bdc8a852e hwmon: (corsair-cpro) Validate the size of the received input buffer
    dcf0f03d7f74 selftests: net: increase inter-packet timeout in udpgro.sh
    33711db90bd5 can: tcan4x5x: fix reset gpio usage during probe
    d587e6929b7c can: tcan4x5x: add option for selecting nWKRQ voltage
    d57dda2056fa wifi: cfg80211: remove scan request n_channels counted_by
    6a466ac72fd4 nvmet-tcp: fix callback lock for TLS handshake
    f9a90478207a nvme: fix misaccounting of nvme-mpath inflight I/O
    fd6493533af9 net: phy: Don't register LEDs for genphy
    5b02e397929e smc: Fix various oops due to inet_sock type confusion.
    124765c20603 nvme: fix endianness of command word prints in nvme_log_err_passthru()
    8184ee3c667d nvme: fix inconsistent RCU list manipulation in nvme_ns_add_to_ctrl_list()
    9a7de97b915a fix a leak in fcntl_dirnotify()
    09bce2138a30 smb: client: fix use-after-free in cifs_oplock_break
    06ec83b6c792 rpl: Fix use-after-free in rpl_do_srh_inline().
    a6d735100f60 net/sched: sch_qfq: Fix race condition on qfq_aggregate
    e8767b89cd82 block: fix kobject leak in blk_unregister_queue
    20648ff4a203 net: emaclite: Fix missing pointer increment in aligned_read()
    894780d6dd3e cachefiles: Fix the incorrect return value in __cachefiles_write()
    dc05051dd10d selftests/sched_ext: Fix exit selftest hang on UP
    6952aeace93f bpf: Reject %p% format string in bprintf-like helpers
    e80692789679 arm64: dts: imx95: Correct the DMA interrupter number of pcie0_ep
    6353bf36f56b soundwire: amd: fix for clearing command status register
    a6e232ee0f86 soundwire: amd: fix for handling slave alerts after link is down
    8814cbbddcaf arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi 4B
    6cb38e5d359a arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi CM5
    c42116dc70af comedi: Fix initialization of data for instructions that write to subdevice
    2af1e7d389c2 comedi: Fix use of uninitialized data in insn_rw_emulate_bits()
    8c20a5cb9879 comedi: Fix some signed shift left operations
    992d600f284e comedi: Fail COMEDI_INSNLIST ioctl if n_insns is too large
    3eab654f5d19 comedi: das6402: Fix bit shift out of bounds
    076b13ee60eb comedi: das16m1: Fix bit shift out of bounds
    e0f3c0867d7d comedi: aio_iiro_16: Fix bit shift out of bounds
    a27e27eee313 comedi: pcl812: Fix bit shift out of bounds
    610615c96680 iio: common: st_sensors: Fix use of uninitialize device structs
    6eea9f7648dd iio: backend: fix out-of-bound write
    404b1d0fe0c6 iio: adc: stm32-adc: Fix race in installing chained IRQ handler
    07c9a0617d9a iio: adc: max1363: Reorder mode_list[] entries
    0ceb2893d360 iio: adc: max1363: Fix MAX1363_4X_CHANS/MAX1363_8X_CHANS[]
    086a76474121 iio: adc: axp20x_adc: Add missing sentinel to AXP717 ADC channel maps
    bfcda3e10157 iio: accel: fxls8962af: Fix use after free in fxls8962af_fifo_flush
    b361598b7352 soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled
    855d4da5f270 soc: aspeed: lpc-snoop: Cleanup resources in stack-order
    2a76bc2b24ed smb: client: fix use-after-free in crypt_message when using async crypto
    d5629d1af060 s390/bpf: Fix bpf_arch_text_poke() with new_addr == NULL again
    11c19d42d3a7 pmdomain: governor: Consider CPU latency tolerance from pm_domain_cpu_gov
    10e27b2a6ebe net: libwx: properly reset Rx ring descriptor
    ba7c793f96c1 net: libwx: fix the using of Rx buffer DMA
    08d18bda0d03 net: libwx: remove duplicate page_pool_put_full_page()
    74cb0f102d4b net: stmmac: intel: populate entire system_counterval_t in get_time_fn() callback
    516cd0943a22 mmc: sdhci_am654: Workaround for Errata i2312
    5280e0b8bc69 mmc: sdhci-pci: Quirk for broken command queuing on Intel GLK-based Positivo models
    6198bfe1af77 mmc: bcm2835: Fix dma_unmap_sg() nents value
    a25ebc337022 memstick: core: Zero initialize id_reg in h_memstick_read_dev_id()
    2594d5ffc081 isofs: Verify inode mode when loading from disk
    122160289adf dmaengine: nbpfaxi: Fix memory corruption in probe()
    573f1e59024c cpuidle: psci: Fix cpuhotplug routine with PREEMPT_RT=y
    9e11e0db4e27 Bluetooth: btintel: Check if controller is ISO capable on btintel_classify_pkt_type
    1ddedbd8087d af_packet: fix soft lockup issue caused by tpacket_snd()
    fa0796cd62c2 af_packet: fix the SO_SNDTIMEO constraint not effective on tpacked_snd()
    0e9c4b36ad0c arm64: dts: rockchip: use cs-gpios for spi1 on ringneck
    b0c7f2984356 arm64: dts: imx8mp-venice-gw73xx: fix TPM SPI frequency
    9650e49db619 arm64: dts: imx8mp-venice-gw72xx: fix TPM SPI frequency
    a3964e87cf15 arm64: dts: imx8mp-venice-gw71xx: fix TPM SPI frequency
    1a54317f3868 arm64: dts: freescale: imx8mm-verdin: Keep LDO5 always on
    a86ea423dc13 arm64: dts: add big-endian property back into watchdog node
    c70000779432 arm64: dts: imx8mp-venice-gw74xx: fix TPM SPI frequency
    5419adaef571 net/mlx5: Update the list of the PCI supported devices
    837a9631f180 phonet/pep: Move call to pn_skb_get_dst_sockaddr() earlier in pep_sock_accept()
    938126995e64 mptcp: reset fallback status gracefully at disconnect() time
    f81b6fbe13c7 mptcp: plug races between subflow fail and subflow creation
    54999dea879f mptcp: make fallback action and fallback decision atomic
    f28044a60506 io_uring/poll: fix POLLERR handling
    134ec1ed468f ALSA: hda/realtek: Add quirk for ASUS ROG Strix G712LWS
    61e867574444 ALSA: hda/realtek - Fix mute LED for HP Victus 16-r0xxx
    084eb54b820f drm/amd/display: Free memory allocation
    74162dda80e7 drm/amd/display: Disable CRTC degamma LUT for DCN401
    62f2a58a4cb0 drm/amdgpu: Increase reset counter only on success
    228ad2ab5b33 drm/amdgpu/gfx8: reset compute ring wptr on the GPU on resume
    21e649b0bd1a objtool/rust: add one more `noreturn` Rust function for Rust 1.89.0
    7bb9ea515cda tracing/osnoise: Fix crash in timerlat_dump_stack()
    33e20747b47d tracing: Add down_write(trace_event_sem) when adding trace event
    692cfff241f1 tracing/probes: Avoid using params uninitialized in parse_btf_arg()
    d18f63e84884 HID: core: do not bypass hid_hw_raw_request
    953af3c0814a HID: core: ensure __hid_request reserves the report ID as the first byte
    a262370f385e HID: core: ensure the allocated report buffer can contain the reserved report ID
    68860d1ade38 dm-bufio: fix sched in atomic context
    0758f7ef402b spi: Add check for 8-bit transfer with 8 IO mode support
    40f79e2bf6a4 pch_uart: Fix dma_sync_sg_for_device() nents value
    9ecfed987bc8 Input: xpad - set correct controller type for Acer NGR200
    c29a2328af96 nvmem: layouts: u-boot-env: remove crc32 endianness conversion
    c85295f624db nvmem: imx-ocotp: fix MAC address byte length
    ff628593ba7c Revert "staging: vchiq_arm: Create keep-alive thread during probe"
    970635ed63da thunderbolt: Fix bit masking in tb_dp_port_set_hops()
    17a6ea23890e thunderbolt: Fix wake on connect at runtime
    1a1190b4ba7b i2c: stm32f7: unmap DMA mapped buffer
    79b63523bfdc i2c: stm32: fix the device used for the DMA map
    783ea37b237a usb: gadget: configfs: Fix OOB read on empty string write
    032f22962bfc usb: dwc2: gadget: Fix enter to hibernation for UTMI+ PHY
    231bf7e839a8 usb: musb: fix gadget state on disconnect
    951dd99ac05a USB: serial: ftdi_sio: add support for NDI EMGUIDE GEMINI
    8b8cb0c34c66 USB: serial: option: add Foxconn T99W640
    ba1d8dc87ae7 USB: serial: option: add Telit Cinterion FE910C04 (ECM) composition
    248ba00d13ff phy: tegra: xusb: Disable periodic tracking on Tegra234
    2f2a375304b0 phy: tegra: xusb: Decouple CYA_TRK_CODE_UPDATE_ON_IDLE from trk_hw_mode
    ec7f98ff05f0 phy: tegra: xusb: Fix unbalanced regulator disable in UTMI PHY mode

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index c003d8464b..fdb0caa943 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ae0f27c5992d230fddf2cab92dc5ae86417285d3"
-SRCREV_meta ?= "ae758a118311062560d89a3721abd38d4a35fc1c"
+SRCREV_machine ?= "96c3b8967c299edb7c8fd1beff358624e3aac443"
+SRCREV_meta ?= "52dd739a32215ffca801bc40daebee19a01b6f20"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.39"
+LINUX_VERSION ?= "6.12.40"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 50da62af74..3dccc9e723 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.39"
+LINUX_VERSION ?= "6.12.40"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "faa83e63e24b8a42361214170269144e55ea85fb"
-SRCREV_meta ?= "ae758a118311062560d89a3721abd38d4a35fc1c"
+SRCREV_machine ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
+SRCREV_meta ?= "52dd739a32215ffca801bc40daebee19a01b6f20"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index f65bc4796a..c58e5f07f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7898594c1d6927a383cceea44c8e29fdcadaa721"
-SRCREV_machine:qemuarm64 ?= "faa83e63e24b8a42361214170269144e55ea85fb"
-SRCREV_machine:qemuloongarch64 ?= "faa83e63e24b8a42361214170269144e55ea85fb"
-SRCREV_machine:qemumips ?= "465c2461220fbd9e9942cb6360bee9b018fbcd23"
-SRCREV_machine:qemuppc ?= "faa83e63e24b8a42361214170269144e55ea85fb"
-SRCREV_machine:qemuriscv64 ?= "faa83e63e24b8a42361214170269144e55ea85fb"
-SRCREV_machine:qemuriscv32 ?= "faa83e63e24b8a42361214170269144e55ea85fb"
-SRCREV_machine:qemux86 ?= "faa83e63e24b8a42361214170269144e55ea85fb"
-SRCREV_machine:qemux86-64 ?= "faa83e63e24b8a42361214170269144e55ea85fb"
-SRCREV_machine:qemumips64 ?= "cabddbe6741f5b05819b50432e33a0b5a9fe1d68"
-SRCREV_machine ?= "faa83e63e24b8a42361214170269144e55ea85fb"
-SRCREV_meta ?= "ae758a118311062560d89a3721abd38d4a35fc1c"
+SRCREV_machine:qemuarm ?= "3884ae3c574f932b6cfe528f86c83214c2e8a36e"
+SRCREV_machine:qemuarm64 ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
+SRCREV_machine:qemuloongarch64 ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
+SRCREV_machine:qemumips ?= "39d23e283ab644b5a8758046130b8c22847176f8"
+SRCREV_machine:qemuppc ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
+SRCREV_machine:qemuriscv64 ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
+SRCREV_machine:qemuriscv32 ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
+SRCREV_machine:qemux86 ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
+SRCREV_machine:qemux86-64 ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
+SRCREV_machine:qemumips64 ?= "3cf1294a14f4a23376b86201ab5bdff6159102ad"
+SRCREV_machine ?= "50893c3858cc7bbc15a174f06fa30fba25306cac"
+SRCREV_meta ?= "52dd739a32215ffca801bc40daebee19a01b6f20"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "cdf264c0a5906063a0e2b750d420d77cb992446d"
+SRCREV_machine:class-devupstream ?= "d90ecb2b1308b3e362ec4c21ff7cf0a051b445df"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.39"
+LINUX_VERSION ?= "6.12.40"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


