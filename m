Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A18C624DA
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:23:18 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12765.1788355392851034125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Cba0L/nm;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90ceab90152so8311586d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355392; x=1788960192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8uuP6XEbu6oRpw9vFX5Aw4NdAMw8fSc4nGSQKOudf7s=;
        b=Cba0L/nmDIGXg8aW0aY015oO/pNiPFTdIQPSyMNgkPNPrk8wTD5liiKM7V1GWNtPa0
         Mx6AJLpYog6mdzJP8b0W6lR+fcHvgfpWADTW1Gk2BrGKUoGwAatg/HxVOqFplVkW+mPB
         IHx/PwbUxk8oTiXMY60F9e9Y3E4IG7y+CBxwdtPV7rHeBwi9mX+v4qkKYQ6PsRLFsaui
         +l9XEsomm9l4io4to1zaNl+r7ZPfKx7INSamijwpHj019QcCWY62pyqcEp9/O96+jf2A
         zChLtRffyMIKw07hW7qhlMSVjZiokxTTMMBcgXNYfQemrMxHPWZZJpYMFSAaXHghnq7r
         QAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355392; x=1788960192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8uuP6XEbu6oRpw9vFX5Aw4NdAMw8fSc4nGSQKOudf7s=;
        b=dvGU/AQagKnVfehykVeTbNxa9WbxNA65s3yxkvkL+jf/KmnT1Vun5I9kLE+D19Ye9K
         z/pmQ+XoNax67wkMqkshdLxU7HBY/KXNWRqK+EZ2xxvFxWUzxR5zWjJey/oCPl+KS6iG
         WDW2FWlx25COxJ39EmMcXnV8CFfHasw2GiCCvslV4OXsmNZ7GWbXUGJYhsPG4roV7CRW
         c8IBRkoJOKacmQ/sMpy+Cz/I0scDilRtjkv07thZ+0UgfWkPKqy5XT5wD1AiRNeN43Ha
         3k607uQW8hdM/U0HGkoAIiitb8QPz1aGr+wkM0MgY+sM3FAn/MzZgsR0oXuEbILWexfY
         BnoQ==
X-Gm-Message-State: AFuF++mzRObF3obnZsRLTZcDsxvuAXecueppUScu4qwgaKX4b1SXJlaj
	kClU51se5UcInf6eN+x6iBSgXLpM1AhbN25djCMwmpWxQjRaV+5LJDxe
X-Gm-Gg: AR+sD13Rj2pEIFmYwv1zK7yUbpUDkpuNx/3JIt6kP+X7WXQLXbTV23noE0sl1fNUw4T
	u9O1wSaOGFRvE6LbSfbVaMzkNE08WeTUYPNs1Ep1WMUw/5KCh67lQ0uaAqeSgL7ueRmmKDKrFWm
	/g9R7Fr9dYrR/fDEmXl64NiRmhr7Rch1JaG9EfC8NIPkyraH5loNAq10fAvo4x0FOFksOAOT8nK
	WXlqECA2fIJRrCboq8SpYFaz4ZWxNfWXNxfzWQ37a+MayPd9ga0Jp26hZApfCHt3AkDsNxvSgrW
	ElNwLJ0qo7TU0qTErSlsOVfxxW94UgvZKvQHSpPAMSWVBh441jr4aNic9YiITb0SwkWO01aen8g
	/eIPumYmQPH8BBRCr9PejbLabi2ypxlsuiM4AXEqRbi/UB5LoMVtYLWbXqdW44hXS+TGu7g1aKn
	9i79EYygtyxB/FUUSkTmLSNmL/Ql3iJ696xoQC/O+tKyzRuLTjapbdd3pUe19LErPVORSCr3lzB
	9Mcp2lIvblF/OWA0swyEaYeJ1rY6NQ/rIL40O4KpgK49AXZ03WMbDul0nK7GKBoaNvbjDH8HbV/
	S0dE2k+f5xwwcArV5Vp21ZpIFLZ8ixfnHS4TNMbe8U/gWmPlJReg9jUJmU7kVZmXucr7Mk1jHRX
	2tOffP3bNVBGpaCw=
X-Received: by 2002:a05:620a:8e13:b0:915:83f3:780d with SMTP id af79cd13be357-93960fa2016mr398557785a.32.1788355390811;
        Wed, 02 Sep 2026 06:23:10 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee43763sm18059076d6.22.2026.09.02.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:23:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 03/07] linux-yocto/7.2: update to v7.2.2
Date: Wed,  2 Sep 2026 09:23:00 -0400
Message-ID: <20260902132305.3685228-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
References: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244950

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/7.2 to the latest korg -stable release that comprises
the following commits:

    52c36105f76e9 Linux 7.2.2
    da857e448322a inet: frags: strip GSO state from fragments before reassembly
    458fbaaefba2f Linux 7.2.1
    2e596e7814ba3 ptp: vmclock: prevent read-only mappings from becoming writable
    33b9598769137 futex: Fix might_sleep() warning in futex_pivot_pending()
    2763b8bcb504e Bluetooth: hci_aml: validate firmware segment lengths
    6e1c44878aa3e Bluetooth: MGMT: reject HCI_CMD_SYNC params_len above 255
    190b719b787eb Bluetooth: ISO: zero the sockaddr before returning it in getname
    9f59f461dcae3 Bluetooth: ISO: do not force BT_LISTEN after a failed BIG sync
    29c59212a5078 Bluetooth: hci_sync: Fix accept list UAF during suspend
    6fc540e835ddd Bluetooth: hci_event: validate LE Set CIG Parameters response
    25b05e3ce31d9 Bluetooth: hci_event: fix LE list UAF on reset
    bf05f17b8439a HID: input: read battery capacity from its actual report offset
    c894143c508a7 HID: hyperv: validate initial device info bounds
    f13d0a00204b0 HID: uclogic: fix use-after-free of inrange_timer on remove
    7bb79a3cf45e0 HID: sensor: custom: Fix use-after-free in enable_sensor
    77832d8f1c81d HID: ft260: fix stack-use-after-return write in I2C read race
    e542edada3f79 HID: core: fix number/pointer type confusion on long items
    49b6fd28fbcc0 HID: rapoo: fix missing hid_is_usb() check
    2e0d98dc8a6de HID: nintendo: stop device IO before hid_hw_stop on probe failure
    27dc4b8eadac7 HID: nintendo: register input device after capabilities are set
    34725ed4719da HID: nintendo: fix out-of-bounds read in joycon_ctlr_read_handler()
    9acc2463991cd HID: huawei: fix missing hid_is_usb() check
    ee883906cf668 HID: asus: fix missing hid_is_usb() check
    ea081b4435515 net/ionic: avoid OOB TX partner lookup for hwstamp RXQ
    86b63adfa5e13 HID: pidff: fix OOB write when hid->inputs is empty
    cbcc0e8dea499 HID: core: fix OOB read of field->usage in hid_set_field()
    2ef16934e069d HID: magicmouse: do not keep a stale msc->input if no input is claimed
    753786a7e6f94 HID: magicmouse: re-enable multitouch after reset-resume
    d095de37f78c5 HID: magicmouse: prevent unbounded recursion in magicmouse_raw_event()
    8384a2e1a9abd HID: magicmouse: fix battery reporting for Bluetooth Magic Trackpad USB-C
    56a7b6a6880db nvmet: pci-epf: put CQ ref on create_cq mapping failure
    cede8d2852570 nvmet: pci-epf: fix use-after-free in nvmet_pci_epf_exec_iod_work()
    9b770e40bc003 nvmet-tcp: Do not WARN on remotely-controlled oversized SGL allocations
    d895e66628f93 nvmet-tcp: bound SGL data length before allocating command buffers
    94334ea92f4d7 nvmet-fc: fix invalid free in LS IOD error path
    1d6837d98bf96 nvmet-auth: zero the AUTH_RECEIVE response buffer
    3256d648211e9 dmaengine: fsl-edma: Add error handling for devm_kasprintf
    b233e7836d98d mailbox: mchp-ipc-sbi: Add null check for devm_kasprintf()
    73a187384a8c8 ipv6: fix use-after-free in ip6_finish_output2()
    c8a74adccaf02 ipv4: reject undersized MTUs in ip_do_fragment()
    7b079b9046916 nfc: nci: free destination parameters when closing a connection
    d6f743d3d3889 nfc: nci: fix uninit-value in the RF discover/activated NTF handlers
    129032c0616d8 nfc: nci: fix out-of-bounds write in nci_target_auto_activated()
    f5c534b53f8c4 nfc: nci: add data_len bound checks to activation parameter extractors
    f33cecf69095c nfc: st21nfca: validate ATR_REQ length against the received frame
    e95beff58b38c nfc: pn533: purge fragmented skbs during cleanup
    d3d90243393c4 nfc: llcp: reject PDUs shorter than the LLCP header
    875285a165fd3 nfc: llcp: fix OOB read and u8 offset wrap in TLV parsers
    0cfbdb0e13ab5 nfc: llcp: bound the connect_sn TLV walk to the skb
    953963b9ac5ee nfc: microread: validate target discovery payload lengths
    1aa3fc769b0c4 nfc: fdp: bound the device-reported read length and fix an skb leak
    31aa28ed732f6 nfc: digital: clamp SENSF_RES length to the destination buffer
    4d00a39c67627 xfs: restore nofs context unconditionally in xfs_trans_roll
    c35da2bac6f7c xfs: validate attr entry pointer before field access
    2207f26ce715c ext4: fix incorrect function call when initializing s_resgid
    e27bae352158c ext4: don't enable DAX on new encrypted files
    759830cde8247 ext4: propagate errors from fast commit range replay
    29c2844d67c54 ext4: avoid tail write_begin walk for uptodate folios
    f2c3829149014 ext4: clear error before retrying inode xattr space fallback
    fbcfb75c20d71 nilfs2: reject invalid block index in GC ioctl
    dbd4aea175ad3 ext4: stop retrying saturated xattr cache entries
    f8c9a3ec36b4e kcov: fix data corruption and race conditions on PREEMPT_RT
    a04b3afd4f02a null_blk: fix UBSAN shift-out-of-bounds when zone_size is 0 or overflows
    50f0cbec45b0f ocfs2: fix missing metadata reservation for large xattrs
    40b6ccf687318 io_uring: defer eventfd signaling when queued from a wakeup handler
    771f6258c068e io_uring/uring_cmd: don't skip completion for a synchronous multishot cmd
    3267d7c8ba516 io_uring/rsrc: fix folio size overflow in io_vec_fill_bvec()
    1bc9d45ebb814 io_uring/io-wq: fix worker accounting when canceling creation callbacks
    7068d3587a64a io_uring/cmd: fix iovec leak when the async cmd is not recycled
    690b721b9595f ALSA: dummy: Check card index validity at probe
    cd4f44ede0701 io_uring/futex: only mark private futex waits as inflight
    d6d24b858b636 io_uring/futex: don't mark futex wake requests as inflight
    c4b4972d8edcd futex: Fix race on the initial mm->futex.phash.ref allocation
    25408c62ed4eb futex: Avoid private hash use-after-free on final put
    d7944cee62ec6 futex/pi: Plug private futex exec() race
    72fd9cbbe0cfb futex: Sanitize and document task_struct::futex::state transitions
    43b148d796aa3 futex/pi: Reject cross-mm private futex owners
    123d664ac98d6 nvmet: fix NULL pointer dereference in nvmet_execute_identify_nslist()
    2ded89ca77fae rndis_host: add overflow check in rndis_rx_fixup()
    ecd2f83a4ddc0 ALSA: scarlett2: Use a private URB for the notification endpoint
    6db3c1d7e2872 ALSA: FCP: Use a private URB for the notification endpoint
    ffe6d379be20d iommu/iommufd: Fix NULL pointer deref in iommufd_ioas_change_process when racing with iopt_map_file_pages
    5994617e09ee6 iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free on teardown
    b405c2f96ae2e Bluetooth: RFCOMM: take rfcomm_mutex for the deferred setup accept
    0916948026f62 PCI: host-generic: Fix NULL pointer dereference on 32-bit CAM systems

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_7.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_7.2.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index 48f304ef22..9e17cb8b28 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1177250341f415eb484ad60cbef9107d4fca08c8"
-SRCREV_meta ?= "622c1c473d1d14aae5a94c1883274f77094caabc"
+SRCREV_machine ?= "f26e519ec35c8e267e06868e021c048bd2acc56a"
+SRCREV_meta ?= "92f4f82129cb5b0dcc665b31f704b540cf8153e3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "7.2"
+LINUX_VERSION ?= "7.2.2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index b62f25b2cd..f47866a688 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_7.2.inc
 
-LINUX_VERSION ?= "7.2"
+LINUX_VERSION ?= "7.2.2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
-SRCREV_meta ?= "622c1c473d1d14aae5a94c1883274f77094caabc"
+SRCREV_machine ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
+SRCREV_meta ?= "92f4f82129cb5b0dcc665b31f704b540cf8153e3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index 3047c310ef..c3412b596d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v7.2/standard/base"
 KBRANCH:qemuloongarch64  ?= "v7.2/standard/base"
 KBRANCH:qemumips64 ?= "v7.2/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "6d22d24315883bd227182ee7af003f563820821c"
-SRCREV_machine:qemuarm64 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
-SRCREV_machine:qemuloongarch64 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
+SRCREV_machine:qemuarm ?= "50c95a086bae6860a661d425650f7777495a9d0f"
+SRCREV_machine:qemuarm64 ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
+SRCREV_machine:qemuloongarch64 ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
 SRCREV_machine:qemumips ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine:qemuppc ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
-SRCREV_machine:qemuriscv64 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
-SRCREV_machine:qemuriscv32 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
-SRCREV_machine:qemux86 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
-SRCREV_machine:qemux86-64 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
+SRCREV_machine:qemuppc ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
+SRCREV_machine:qemuriscv64 ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
+SRCREV_machine:qemuriscv32 ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
+SRCREV_machine:qemux86 ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
+SRCREV_machine:qemux86-64 ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
-SRCREV_meta ?= "622c1c473d1d14aae5a94c1883274f77094caabc"
+SRCREV_machine ?= "fba15564479e1a6f48ff3b591c11030f7a4f7229"
+SRCREV_meta ?= "92f4f82129cb5b0dcc665b31f704b540cf8153e3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8d3ae59288f1e7d58d76558a6ee96d533bc5019f"
+SRCREV_machine:class-devupstream ?= "52c36105f76e96b638152a42e735f2e7767ed946"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v7.2/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "7.2"
+LINUX_VERSION ?= "7.2.2"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


