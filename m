Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50A7CCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:14:34 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.4613.1760584466681328828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hu6TV6V2;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-88ed6837e2eso54473285a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584465; x=1761189265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUZghQGYKrfHVrSj4XigabPWm8y1cxTBl+FNBEswbbk=;
        b=hu6TV6V24sk3HkH9lloi6bgpFGYYvsgwnNdt4schL7FUeUHDn0lVVBkomdKvkpbDHu
         jBafAz4+mpQHWMjM1r1iBQ+LYTgMdcpafK7TUrHR94ZbYdjLndOxW8T1399Rn4+L7tIY
         abk5tAeCGZe8NGCIATMhkQtRnxgiD6ls/JMGhfwcZWvK1M57wZ4f3V5VvpDbKSOTqbfX
         DGfZ3TAU2t06cROuSpbjo4zEPvFvxXh6tcqlaMyBOxTsIlhBIElKJHVHUE11wP7rcJBe
         dQ3oHenAGGGSa/A/trgiN29hwwmjeDwS5IOm3/LFJTk1Vsg3cF5mtTA6aNL41iA1K1Ti
         C6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584465; x=1761189265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUZghQGYKrfHVrSj4XigabPWm8y1cxTBl+FNBEswbbk=;
        b=CL4oUKdcmYL+EO78n3xoW+piWk7Vl7gOh85UbEYE4rn/IFIKjshtCK0GT3A8jwqtOf
         yN1PUgcPj5sZYa73tNNkVK55jmatw6TB7gNIRti8GjCxIhYWbyeOJ/r+jXT+/dnd9SMo
         zI8SmPOG76W5H2dHd/SVh7Pu2KqcNBfR5dg8QKPGdt25wc/5djv31IDgM2R/sK0ZvQjY
         iz4925ce8BMMsOg3E8RjwW7+ZrS5ZHlOxI/aNEVOSGLhowf7AP76eoz4ShNdc3vYD9Iq
         eZBmL9bvHWlGhhtQoRM+CuS3vb+8EofGhJ+12tBttVk5AaETwk3suM2bfyh90mgof1YT
         mXig==
X-Gm-Message-State: AOJu0YxZu29odMjECnudirGLCi8/PTSTNBWvrrRFPkt9KbCY/5nA+u/A
	B2qQlgmV60/te3E05t/DSYmtZNYqaC88RMizm2QyPmvS9ILvIdaGFsH10xJsHpD0SMw=
X-Gm-Gg: ASbGnctO7vjK9fEO1hSQx5ms3cIwbDudYZhlAvjfvsaUZQ0yDDhgVtT0hb/EpzyC1/c
	ws39Y0Mq5TXNW/16vm+SYyPWJNCK+DaseiTPedc4Axn0t1RZMgM1570TImUDOyTFoKeJoR88ve9
	78hXy67RAn6haHgz8HYSnPNwIBFBIDZgbjwyh70tHIZaoABrHv00catEJHRyZakwsFO2kGX2IIO
	bUEcA3aaW3oINl8XyNbVVFUynFGKEyldJ4RSuTOdrw8BWdDPE0IKPpP0EOdVF+yCQx5+skJwDSE
	ex/khR0AsV7udkyntesEEUPzYJjY+g4UA1sQVEiYc1bnYZUGpn+7JYZuTRDCHOTt6YljiMHYiAx
	+Sf8G7chVsZwVmZbGjGfWvhU56uUjt7iLaq4XTUEyzxZYDZCRpgMoDy4llt5l2aP4KABnFsON5J
	RWoBXaAU+Uun8lSTqXC/u8zqfRMYCCkGn9Rvr98eazJ3QNIlO/RHsOjoDKAFMjkVyP+Nj5Uyd71
	9yi
X-Google-Smtp-Source: AGHT+IG9HzRAS93wqIeuE08RgxOERBAS3uxcg8j8cnivUdii5HkH5k8ugQJ9LNpFcOkkKyAOjCsfbg==
X-Received: by 2002:a05:620a:46a3:b0:85e:5fef:8731 with SMTP id af79cd13be357-883525c0d43mr4291288885a.40.1760584465027;
        Wed, 15 Oct 2025 20:14:25 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f37f45149sm109327085a.32.2025.10.15.20.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:14:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-core][scarthgap 03/12] linux-yocto/6.6: update to v6.6.100
Date: Wed, 15 Oct 2025 23:14:12 -0400
Message-Id: <20251016031421.3207596-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251016031421.3207596-1-bruce.ashfield@gmail.com>
References: <20251016031421.3207596-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224929

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    dbcb8d8e4163 Linux 6.6.100
    3ee59c38ae73 KVM: x86/xen: Fix cleanup logic in emulation of Xen schedop poll hypercalls
    48e879184320 nvmem: layouts: u-boot-env: remove crc32 endianness conversion
    35542cbe66c6 i2c: omap: fix deprecated of_property_read_bool() use
    056b65a02edc Revert "selftests/bpf: dummy_st_ops should reject 0 for non-nullable params"
    c148b7282808 Revert "selftests/bpf: adjust dummy_st_ops_success to detect additional error"
    b9e50a5169b0 ASoC: fsl_sai: Force a software reset when starting in consumer mode
    8f2852c1d7aa regulator: pwm-regulator: Manage boot-on with disabled PWM channels
    cad3ec23e398 regulator: pwm-regulator: Calculate the output voltage for disabled PWMs
    7e5ec0059e4d i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe()
    a7b84035baa8 i2c: omap: Fix an error handling path in omap_i2c_probe()
    caa86f8b6c30 i2c: omap: Add support for setting mux
    6cfbff5f8dc9 usb: dwc3: qcom: Don't leave BCR asserted
    824fa25c85e8 usb: hub: Don't try to recover devices lost during warm reset.
    668c7b47a5ee usb: hub: Fix flushing of delayed work used for post resume purposes
    71f5c98d2931 usb: hub: Fix flushing and scheduling of delayed work that tunes runtime pm
    15fea75a7886 usb: hub: fix detection of high tier USB3 devices behind suspended hubs
    d5024dc5e644 arm64: Filter out SME hwcaps when FEAT_SME isn't implemented
    dc6a664089f1 clone_private_mnt(): make sure that caller has CAP_SYS_ADMIN in the right userns
    4cb17b11c8af ipv6: make addrconf_wq single threaded
    496efa228f0d sched: Change nr_uninterruptible type to unsigned long
    f371ad6471ee Revert "cgroup_freezer: cgroup_freezing: Check if not frozen"
    74bb4de32d92 rxrpc: Fix transmission of an abort in response to an abort
    7692bde89006 rxrpc: Fix recv-recv race of completed call
    7ff2d83ecf26 net/sched: Return NULL when htb_lookup_leaf encounters an empty rbtree
    7b0d42318393 net: bridge: Do not offload IGMP/MLD messages
    bb515c413064 net: vlan: fix VLAN 0 refcount imbalance of toggling filtering during runtime
    1f3a429c21e0 tls: always refresh the queue when reading sock
    007142a263db hv_netvsc: Set VF priv_flags to IFF_NO_ADDRCONF before open to prevent IPv6 addrconf
    bd3051a81621 Bluetooth: L2CAP: Fix attempting to adjust outgoing MTU
    76179961c423 netfilter: nf_conntrack: fix crash due to removal of uninitialised entry
    dcbc346f50a0 ipv6: mcast: Delay put pmc->idev in mld_del_delrec()
    6a213143e0ea net/mlx5: Correctly set gso_size when LRO is used
    ab94e7af363a Bluetooth: btusb: QCA: Fix downloading wrong NVM for WCN6855 GF variant without board ID
    4ceefc9c31e7 Bluetooth: SMP: Fix using HCI_ERROR_REMOTE_USER_TERM on timeout
    f3323b18e3cc Bluetooth: SMP: If an unallowed command is received consider it a failure
    32e624912eed Bluetooth: hci_sync: fix connectable extended advertising when using static random address
    c4f16f6b071a Bluetooth: Fix null-ptr-deref in l2cap_sock_resume_cb()
    5dd6a441748d usb: net: sierra: check for no status endpoint
    27591d926191 ice: add NULL check in eswitch lag check
    eda5e38cc4dd hwmon: (corsair-cpro) Validate the size of the received input buffer
    c18726607c8a selftests: net: increase inter-packet timeout in udpgro.sh
    167006f73005 wifi: cfg80211: remove scan request n_channels counted_by
    a2f02a87fe21 nvme: fix misaccounting of nvme-mpath inflight I/O
    ec158d05eaa9 net: phy: Don't register LEDs for genphy
    5d95fbbfaa8f nvme: fix inconsistent RCU list manipulation in nvme_ns_add_to_ctrl_list()
    2baaf5bbab2a smb: client: fix use-after-free in cifs_oplock_break
    62dcd9d6e61c rpl: Fix use-after-free in rpl_do_srh_inline().
    fbe48f06e641 net/sched: sch_qfq: Fix race condition on qfq_aggregate
    21033b49cf09 block: fix kobject leak in blk_unregister_queue
    c20dd7e8f359 net: emaclite: Fix missing pointer increment in aligned_read()
    bc016b7842f6 cachefiles: Fix the incorrect return value in __cachefiles_write()
    e7be679124ba bpf: Reject %p% format string in bprintf-like helpers
    12e023df10b6 soundwire: amd: fix for clearing command status register
    84830e033bd2 soundwire: amd: fix for handling slave alerts after link is down
    673ee92bd2d3 comedi: Fix initialization of data for instructions that write to subdevice
    10f9024a8c82 comedi: Fix use of uninitialized data in insn_rw_emulate_bits()
    63390b856178 comedi: Fix some signed shift left operations
    c9d3d9667443 comedi: Fail COMEDI_INSNLIST ioctl if n_insns is too large
    8a3637027cee comedi: das6402: Fix bit shift out of bounds
    adb7df8a8f9d comedi: das16m1: Fix bit shift out of bounds
    955e8835855f comedi: aio_iiro_16: Fix bit shift out of bounds
    7e470d8efd10 comedi: pcl812: Fix bit shift out of bounds
    8d8519aedbf1 iio: adc: stm32-adc: Fix race in installing chained IRQ handler
    6471d4b4ac61 iio: adc: max1363: Reorder mode_list[] entries
    edff26d038d2 iio: adc: max1363: Fix MAX1363_4X_CHANS/MAX1363_8X_CHANS[]
    dda42f23a8f5 iio: accel: fxls8962af: Fix use after free in fxls8962af_fifo_flush
    329a80adc0e5 soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled
    d93b20c88e5e soc: aspeed: lpc-snoop: Cleanup resources in stack-order
    15a0a5de4950 smb: client: fix use-after-free in crypt_message when using async crypto
    0c7b20f7785c s390/bpf: Fix bpf_arch_text_poke() with new_addr == NULL again
    600f55da8d90 pmdomain: governor: Consider CPU latency tolerance from pm_domain_cpu_gov
    d510116c80b3 net: libwx: properly reset Rx ring descriptor
    027701180a7b net: libwx: fix the using of Rx buffer DMA
    3c91a56762b1 net: libwx: remove duplicate page_pool_put_full_page()
    e30c5fa723dc mmc: sdhci_am654: Workaround for Errata i2312
    7ac120c00c5a mmc: sdhci-pci: Quirk for broken command queuing on Intel GLK-based Positivo models
    5bfd0078f738 mmc: bcm2835: Fix dma_unmap_sg() nents value
    4206824af6dd memstick: core: Zero initialize id_reg in h_memstick_read_dev_id()
    928f3a277f2c isofs: Verify inode mode when loading from disk
    4bb016438335 dmaengine: nbpfaxi: Fix memory corruption in probe()
    2bae35acbb6e af_packet: fix soft lockup issue caused by tpacket_snd()
    67ea5f37b203 af_packet: fix the SO_SNDTIMEO constraint not effective on tpacked_snd()
    e51cf5d4aa98 arm64: dts: rockchip: use cs-gpios for spi1 on ringneck
    645af2f069d6 arm64: dts: freescale: imx8mm-verdin: Keep LDO5 always on
    bec18ebcf05c arm64: dts: imx8mp-venice-gw74xx: fix TPM SPI frequency
    33eba752d9de net/mlx5: Update the list of the PCI supported devices
    29db3339db0e phonet/pep: Move call to pn_skb_get_dst_sockaddr() earlier in pep_sock_accept()
    d48845afa083 io_uring/poll: fix POLLERR handling
    c855b9aa093a ALSA: hda/realtek: Add quirk for ASUS ROG Strix G712LWS
    56f99fdb0b8d drm/amdgpu/gfx8: reset compute ring wptr on the GPU on resume
    823d79890048 tracing/osnoise: Fix crash in timerlat_dump_stack()
    6bc94f20a4c3 tracing: Add down_write(trace_event_sem) when adding trace event
    6ba89b382be4 tracing/probes: Avoid using params uninitialized in parse_btf_arg()
    0e5017d84d65 HID: core: do not bypass hid_hw_raw_request
    a1c0b87b7682 HID: core: ensure __hid_request reserves the report ID as the first byte
    fcda39a9c5b8 HID: core: ensure the allocated report buffer can contain the reserved report ID
    469a39a33a99 dm-bufio: fix sched in atomic context
    82b29ee8ba90 spi: Add check for 8-bit transfer with 8 IO mode support
    415d4966cb54 pch_uart: Fix dma_sync_sg_for_device() nents value
    db44a558b3af Input: xpad - set correct controller type for Acer NGR200
    0f6f30f5b01a nvmem: imx-ocotp: fix MAC address byte length
    0cd051cb5852 thunderbolt: Fix bit masking in tb_dp_port_set_hops()
    dc52aff53465 thunderbolt: Fix wake on connect at runtime
    e6a2ff56b06e i2c: stm32: fix the device used for the DMA map
    58bdd5160184 usb: gadget: configfs: Fix OOB read on empty string write
    ec35a7125d94 usb: musb: fix gadget state on disconnect
    311c434f5d76 USB: serial: ftdi_sio: add support for NDI EMGUIDE GEMINI
    909d80414869 USB: serial: option: add Foxconn T99W640
    84c320060d53 USB: serial: option: add Telit Cinterion FE910C04 (ECM) composition
    ad2437f4abca phy: tegra: xusb: Disable periodic tracking on Tegra234
    491175c139e5 phy: tegra: xusb: Decouple CYA_TRK_CODE_UPDATE_ON_IDLE from trk_hw_mode
    5367cdeb75cb phy: tegra: xusb: Fix unbalanced regulator disable in UTMI PHY mode

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index cfc7b72da8..032a648ee8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a1284b1ec1c1b4818675778b9746b28dfa62c4bb"
-SRCREV_meta ?= "62a638bf97b8ca5e8e7c2e889b9965d6e5aed1bc"
+SRCREV_machine ?= "53bdb3c01caf1113589d30065b983cd20b225124"
+SRCREV_meta ?= "d2387ec7cf374ccffe480f7a00102f46b990d529"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.99"
+LINUX_VERSION ?= "6.6.100"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index ecc94b4c70..34512201b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.99"
+LINUX_VERSION ?= "6.6.100"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a92b0c8786e4b797f2cd47fb12b36e621a79834d"
-SRCREV_meta ?= "62a638bf97b8ca5e8e7c2e889b9965d6e5aed1bc"
+SRCREV_machine ?= "fefda6092153d01adb8574acd075d7d3f4182442"
+SRCREV_meta ?= "d2387ec7cf374ccffe480f7a00102f46b990d529"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index d47a186a85..e9af2afc3b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "81a67e3d3d46f20a12e869078c60864c466a4fee"
-SRCREV_machine:qemuarm64 ?= "68f8e3b8ae0c65828794cdb9e03a8030d3a32c0b"
-SRCREV_machine:qemuloongarch64 ?= "58d3f59a009b2b25547fc4a9ec7cd59fca4776f0"
-SRCREV_machine:qemumips ?= "90565b2dd07c5ba430ecd9311a5297292f630d71"
-SRCREV_machine:qemuppc ?= "7fdf770f5adb7da51033fbf95a44fe4c7da08d74"
-SRCREV_machine:qemuriscv64 ?= "58d3f59a009b2b25547fc4a9ec7cd59fca4776f0"
-SRCREV_machine:qemuriscv32 ?= "58d3f59a009b2b25547fc4a9ec7cd59fca4776f0"
-SRCREV_machine:qemux86 ?= "58d3f59a009b2b25547fc4a9ec7cd59fca4776f0"
-SRCREV_machine:qemux86-64 ?= "58d3f59a009b2b25547fc4a9ec7cd59fca4776f0"
-SRCREV_machine:qemumips64 ?= "f8013e6f23a92cb0a74c7cff75a340a3e49e0e36"
-SRCREV_machine ?= "58d3f59a009b2b25547fc4a9ec7cd59fca4776f0"
-SRCREV_meta ?= "62a638bf97b8ca5e8e7c2e889b9965d6e5aed1bc"
+SRCREV_machine:qemuarm ?= "078fa42e2c5520b7c72b56c7f4556b108221386d"
+SRCREV_machine:qemuarm64 ?= "848733a4d57fe579bd9d72089fb12720b2c613e8"
+SRCREV_machine:qemuloongarch64 ?= "6f026111c3a003eaf81c2aee68d5c12a0a247873"
+SRCREV_machine:qemumips ?= "7bb806c4728fd747067d5ea4aa2827274603e3cc"
+SRCREV_machine:qemuppc ?= "d1d3313d10d048daeab874e67a2658907812e0cd"
+SRCREV_machine:qemuriscv64 ?= "6f026111c3a003eaf81c2aee68d5c12a0a247873"
+SRCREV_machine:qemuriscv32 ?= "6f026111c3a003eaf81c2aee68d5c12a0a247873"
+SRCREV_machine:qemux86 ?= "6f026111c3a003eaf81c2aee68d5c12a0a247873"
+SRCREV_machine:qemux86-64 ?= "6f026111c3a003eaf81c2aee68d5c12a0a247873"
+SRCREV_machine:qemumips64 ?= "2654aa46d76428df4acd0e74ad9b281eb4a085fc"
+SRCREV_machine ?= "6f026111c3a003eaf81c2aee68d5c12a0a247873"
+SRCREV_meta ?= "d2387ec7cf374ccffe480f7a00102f46b990d529"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d96eb99e2f0e32b6d29e7f12a790b08c08825503"
+SRCREV_machine:class-devupstream ?= "dbcb8d8e4163e46066f43e2bd9a6779e594ec900"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.99"
+LINUX_VERSION ?= "6.6.100"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


