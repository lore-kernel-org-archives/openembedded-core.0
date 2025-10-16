Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB30CCD19F
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:08:54 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.4647.1760584130467441065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZL3GDBE+;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-87be45cba29so4351776d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584129; x=1761188929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zceV5fvgGqWJ08CkdP8zogFvpuI7J2bfolzq3hAva8Q=;
        b=ZL3GDBE+D/2dAqUxsRwMdl0llMZVUUZRRJlKosRF7m4xwoNHcQFKRba+FSLQosHgIY
         KnJ7NIUUeFfDGgiYuJNN4TZI+cVI8dlp+/iEsDDNtPb3HXROS4HtIq+U+ssfzMoFmtFe
         SknV8v9jv3cgsGuj8ORMGKIRA/1/oryhAs41uRoVsURhHNyBqMQtLcOPJV01UX9UKpTF
         zKJOazcMvsREjMgyip++L2zQXrIBtDPcYX6rnuRsu3b8XrKA+A/Tq+JMxqX7QsIJgFj8
         mMv4S4+PENOxTqni5Te8RKUz7QqRLBzz3GhVIUToS9dtjobVla9aL78TtS32cABGizjB
         66xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584129; x=1761188929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zceV5fvgGqWJ08CkdP8zogFvpuI7J2bfolzq3hAva8Q=;
        b=OQvyWTgACGdsVRt4Lp9hrTjwreh/ItCGqAr7COvkNXwLkgu0yQrDRLVKb4KXD+Yr2c
         BLoVLpe+IN4PJGg0PPe+KQLmFmmx2lWoSKkMVgwXzwKBnOBnwSpgJGNQ12cs5pXt0nvb
         UbqfntHDdV6ngrMdBsVU8i7COpEVYIVl9hC2XKMg6Sy1xofyWwBD3eItfJZwarsXC5jR
         uGCLJX4thRbOxNh9JH1WY/y2K+lBhVVm3bFGUMExIgEKKfFauVR6TJwltA3KLjB28qxD
         /1kt+2GftI7pBvnynidSUdaIO65+BhGTNqADDgLSSEu6fwmhIpxBYVHvn8HBvd0MCTxJ
         uyRQ==
X-Gm-Message-State: AOJu0YxggVFkzXDuJ5Wa1e6C+EkBlLpKJZ+tfy5++EyhYX2216b5KCAG
	gJeTrFzOGqvcm/oysuFi4LWn9FXqS6VH30J8h05jVwlnHLw+tHcjUw67FGN1N5GksQY=
X-Gm-Gg: ASbGncs9wyuCGe4qcw0PATOqzCEBg+leg7xZ9EHlIxEoMr3PDFfV/3cz/iQxeJCLEuG
	aSFxZWyZLqa/cZyfl2A9OVoG7tmNNvQ/h6yj6E8y3T8IPM7sSseoeS9u6K/TrobVQvlVVUJc5BG
	NPT9iXiJfTbOSdssGCCb9IL6UqgDHBoGo23yk0ECYo9o8xBUGnY4w8JR7Cu27SLkUzPwHrMwWnP
	N7aV1yjwTMx0gJJ9AUom9mrrFEfapSsmxE79qZ+AtD9fm3HjASTpy99SiFuIJh7cHXHec6tpc7P
	wsF01Rj4uLeV3IYEI+iKyDoXOgHzAMzP0RtZOz9mR2shUiM3MuYWfDj3qOy6ZNktfp2/pGtIQ+b
	oceeMjAWNCd690SihWCJv+i+sZkkTnLQFMjfIckLVrgNko1+prMYjqYEJq0KPezJRoSHNDpxceO
	is/hofYADNI2e+DS4H5tQjxcBpo4A1JQgy5IGBWJKJYybzywIdTJPI3Hhk36DNUqaVmsx8ideIY
	IPL
X-Google-Smtp-Source: AGHT+IFKyqjBI4LHOjag0M4kNLhFhskrrnRucmp0i9+GF6Wjva+JfS/G6U/DdAfJo6w5Po4RuOroSw==
X-Received: by 2002:ad4:5f4b:0:b0:809:aa63:1c34 with SMTP id 6a1803df08f44-87b2efa8496mr415757336d6.32.1760584129320;
        Wed, 15 Oct 2025 20:08:49 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012a39d9sm30824986d6.44.2025.10.15.20.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:08:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/11] linux-yocto/6.12: update to v6.12.50
Date: Wed, 15 Oct 2025 23:08:36 -0400
Message-Id: <9f9cf3ea799ed84428c2e5c93077139437ea1f7c.1760583881.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1760583881.git.bruce.ashfield@gmail.com>
References: <cover.1760583881.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224918

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    72b82d56b8213 Linux 6.12.50
    f89a0f1459dbc drm/i915/backlight: Return immediately when scale() finds invalid parameters
    cbfd3c7d4ed26 Revert "usb: xhci: remove option to change a default ring's TRB cycle bit"
    17195a7d754a5 iommufd: Fix race during abort for file descriptors
    51b8258efe254 fbcon: Fix OOB access in font allocation
    4a4bac869560f fbcon: fix integer overflow in fbcon_do_set_font
    910d7749346c4 mm/hugetlb: fix folio is still mapped when deleted
    f84e487070518 kmsan: fix out-of-bounds access to shadow memory
    159c156fd7148 gpiolib: Extend software-node support to support secondary software-nodes
    ca988dcdc6683 fs/proc/task_mmu: check p->vec_buf for NULL
    a13dbc5e20c72 afs: Fix potential null pointer dereference in afs_put_server
    aae514959d82b drm/ast: Use msleep instead of mdelay for edid read
    e2ded0872300c arm64: dts: marvell: cn9132-clearfog: fix multi-lane pci x2 and x4 ports
    562a1342224f9 arm64: dts: marvell: cn9132-clearfog: disable eMMC high-speed modes
    cb20fe9502635 ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY address
    573b1e39edfcb tracing: dynevent: Add a missing lockdown check on dynevent
    316b090c2fee9 crypto: af_alg - Fix incorrect boolean values in af_alg_ctx
    494ebb7b2f056 i40e: improve VF MAC filters accounting
    be4b969d28923 i40e: add mask to apply valid bits for itr_idx
    d33e5d6631ac4 i40e: add max boundary check for VF filters
    6128bbc7adc25 i40e: fix validation of VF state in get resources
    3118f41d8fa57 i40e: fix input validation logic for action_meta
    bfcc1dff429d4 i40e: fix idx validation in config queues msg
    cc4191e8ef40d i40e: fix idx validation in i40e_validate_queue_map
    05fe81fb9db20 i40e: add validation for ring_len param
    980ddc3a1ba65 HID: asus: add support for missing PX series fn keys
    bfb1e2aad1fec smb: client: fix wrong index reference in smb2_compound_op()
    26923ea48e33a platform/x86: lg-laptop: Fix WMAB call in fan_mode_store()
    894e005a01bdd drm/panthor: Defer scheduler entitiy destruction to queue release
    a170b9c0dde83 futex: Prevent use-after-free during requeue-PI
    f800f7054d2cf drm/gma500: Fix null dereference in hdmi teardown
    895fab2a4257a mm: folio_may_be_lru_cached() unless folio_test_large()
    9422cfa89e1dc mm: revert "mm/gup: clear the LRU flag of a page before adding to LRU batch"
    0db0d69bc962c mm/gup: local lru_add_drain() to avoid lru_add_drain_all()
    c41b2941a024d octeontx2-pf: Fix potential use after free in otx2_tc_add_flow()
    ca74b67b475b9 net: dsa: lantiq_gswip: suppress -EINVAL errors for bridge FDB entries added to the CPU port
    7d7e29b959f9b net: dsa: lantiq_gswip: move gswip_add_single_port_br() call to port_setup()
    fbf6548f0f0f9 selftests: fib_nexthops: Fix creation of non-FDB nexthops
    f0e49fd13afe9 nexthop: Forbid FDB status change while nexthop is in a group
    3bc813c5e6bf3 net: allow alloc_skb_with_frags() to use MAX_SKB_FRAGS
    90cfbb4e73db7 bnxt_en: correct offset handling for IPv6 destination address
    d2be773a92874 vhost: Take a reference on the task in struct vhost_task.
    484c7d571a3d1 Bluetooth: hci_event: Fix UAF in hci_acl_create_conn_sync
    23c9c485fa4c7 Bluetooth: hci_sync: Fix hci_resume_advertising_sync
    262f3836962c2 ethernet: rvu-af: Remove slash from the driver name
    14fc4fdae42e3 net/smc: fix warning in smc_rx_splice() when calling get_page()
    953200d56fc23 net: tun: Update napi->skb after XDP process
    eb79ed9706703 can: peak_usb: fix shift-out-of-bounds issue
    6b9fb82df8868 can: mcba_usb: populate ndo_change_mtu() to prevent buffer overflow
    de77841652e57 can: sun4i_can: populate ndo_change_mtu() to prevent buffer overflow
    def814b4ba31b can: hi311x: populate ndo_change_mtu() to prevent buffer overflow
    b26cccd87dcdd can: etas_es58x: populate ndo_change_mtu() to prevent buffer overflow
    9fcedabaae009 xfrm: xfrm_alloc_spi shouldn't use 0 as SPI
    452ad25358504 bpf: Reject bpf_timer for PREEMPT_RT
    7a75aae4c0c21 can: rcar_can: rcar_can_resume(): fix s2ram with PSCI
    79dc6d4932de4 wifi: virt_wifi: Fix page fault on connect
    7b478122cd39b btrfs: don't allow adding block device of less than 1 MB
    3d429cb1278e9 bpf: Check the helper function is valid in get_helper_proto
    ecb6383b79c3f smb: server: use disable_work_sync in transport_rdma.c
    1d6e5bd5b6114 smb: server: don't use delayed_work for post_recv_credits_work
    596575060f4cd cpufreq: Initialize cpufreq-based invariance before subsys
    6833714e12d12 ARM: dts: kirkwood: Fix sound DAI cells for OpenRD clients
    88c1bb807f79a arm64: dts: imx8mp: Correct thermal sensor index
    d755823f2c0b3 firmware: imx: Add stub functions for SCMI MISC API
    edeae8be4d263 HID: amd_sfh: Add sync across amd sfh work functions
    7a7bb18680eaa IB/mlx5: Fix obj_type mismatch for SRQ event subscriptions
    d2be6c429d8cc net: sfp: add quirk for FLYPRO copper SFP+ module
    2368ce440dfbc ALSA: usb-audio: Add mute TLV for playback volumes on more devices
    c2564438d30a8 ALSA: usb-audio: move mixer_quirks' min_mute into common quirk
    6074537a680de ALSA: usb-audio: Add DSD support for Comtrue USB Audio device
    5cae5420519d8 i2c: designware: Add quirk for Intel Xe
    aaac704646b8f mmc: sdhci-cadence: add Mobileye eyeQ support
    34a8909831836 net: sfp: add quirk for Potron SFP+ XGSPON ONU Stick
    7edb8abcc9773 net: fec: rename struct fec_devinfo fec_imx6x_info -> fec_imx6sx_info
    9e85e98516e13 usb: core: Add 0x prefix to quirks debug output
    6b66c7181d265 ALSA: usb-audio: Fix build with CONFIG_INPUT=n
    a9bed48ddee3d ALSA: hda/realtek: Add support for ASUS NUC using CS35L41 HDA
    1f1bc26ba97af ALSA: usb-audio: Convert comma to semicolon
    a705899ec6085 ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5
    1847877529d71 ALSA: usb-audio: Remove unneeded wmb() in mixer_quirks
    80fffa366ad64 ALSA: usb-audio: Simplify NULL comparison in mixer_quirks
    33b1035eec4b4 ALSA: usb-audio: Avoid multiple assignments in mixer_quirks
    d7a58b4d5ccf6 ALSA: usb-audio: Drop unnecessary parentheses in mixer_quirks
    9fdb2390b0e49 ALSA: usb-audio: Fix block comments in mixer_quirks
    058cfa459cc70 ALSA: usb-audio: Fix code alignment in mixer_quirks
    b728110b16467 firewire: core: fix overlooked update of subsystem ABI version
    8d685863f557c scsi: ufs: mcq: Fix memory allocation checks for SQE and CQE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 37233199f0..8d6efadf58 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b82952f1b1b128089e27cadf3b16c11a7be2644d"
-SRCREV_meta ?= "8eec73988615290c4a3370553c44d2d3bdbf4034"
+SRCREV_machine ?= "b4f5907de1e85e0f945b658dac152de95e615377"
+SRCREV_meta ?= "39c7e069b8475a8751d1a584a6181e072033f25d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.49"
+LINUX_VERSION ?= "6.12.50"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index b934b925b4..f920dd4f21 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.49"
+LINUX_VERSION ?= "6.12.50"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
-SRCREV_meta ?= "8eec73988615290c4a3370553c44d2d3bdbf4034"
+SRCREV_machine ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
+SRCREV_meta ?= "39c7e069b8475a8751d1a584a6181e072033f25d"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index b1b7f95bb5..fd98ab0fe3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b522400a3cd8c649a7a040398eecd4adc5cbecd2"
-SRCREV_machine:qemuarm64 ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
-SRCREV_machine:qemuloongarch64 ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
-SRCREV_machine:qemumips ?= "e3476588db698ac8f2f47cc6b7594f0740b80a40"
-SRCREV_machine:qemuppc ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
-SRCREV_machine:qemuriscv64 ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
-SRCREV_machine:qemuriscv32 ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
-SRCREV_machine:qemux86 ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
-SRCREV_machine:qemux86-64 ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
-SRCREV_machine:qemumips64 ?= "fd00218b9063fff14c5815dfff6be2e0e5bb5861"
-SRCREV_machine ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
-SRCREV_meta ?= "8eec73988615290c4a3370553c44d2d3bdbf4034"
+SRCREV_machine:qemuarm ?= "a0a67cc2a9c525cdbbee0a53396d6260a25839c2"
+SRCREV_machine:qemuarm64 ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
+SRCREV_machine:qemuloongarch64 ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
+SRCREV_machine:qemumips ?= "be1da28e2e753af1c661bad7982eb8bc29c885d8"
+SRCREV_machine:qemuppc ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
+SRCREV_machine:qemuriscv64 ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
+SRCREV_machine:qemuriscv32 ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
+SRCREV_machine:qemux86 ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
+SRCREV_machine:qemux86-64 ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
+SRCREV_machine:qemumips64 ?= "cf66b7844c1b375a1b473f21ea920cccc9f692aa"
+SRCREV_machine ?= "258800fd1696b1a356a754fcef83cbfdee399ae1"
+SRCREV_meta ?= "39c7e069b8475a8751d1a584a6181e072033f25d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f1e375d5eb68f990709fce37ee1c0ecae3645b6f"
+SRCREV_machine:class-devupstream ?= "da274362a7bd9ab3a6e46d15945029145ebce672"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.49"
+LINUX_VERSION ?= "6.12.50"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


