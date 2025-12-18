Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D97AD711AD
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:03 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1926.1766089373912001986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kC5lIN2Z;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88a2b99d8c5so7238266d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089373; x=1766694173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPlfMQe554dGqMViON0jkaWnYcVqKEwnXf1/y+n75e4=;
        b=kC5lIN2Z8t1mSMkEfwVULFDs3hnCsRn3fFGfLL9qr5GLfe+X6KABvNbjYHXYhczTiD
         2Mj53VLGOZiew7HM8V/jCvk1kolG02lbr8/H2C7D//5npKWVX3JqsHeGJfAdzDQJhLNn
         Rvi994PjBSgwEhGDaqFsM6v8YeVcQnBpRYiFeNelLDMe8UFP/+OFpxVAH0+Pz+nfZ5WE
         JfzUGUMyJ8JQMvil0R+hx1mwSCl1k0fdHtiGIWJNdNvNAoHoWsujhskKfaCj8mgoO02M
         V94BjyaexgMaFPhTJhlXW8lKicMXaJioMEYJ2JMeBDao95IHEJdiarQpYMg49QzvQxIR
         KpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089373; x=1766694173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPlfMQe554dGqMViON0jkaWnYcVqKEwnXf1/y+n75e4=;
        b=bsYDOfrXdAkqRSal3qQu0Y5L24rjWbwXySlpSnHHWqLx2S4jFfP9c1UXiRmrj/E17B
         SGNSsBEALHIE7dwXoHePp6O0O1OwNQeWjz8PYEbpAYb64El4lnokuZKBOMXFqYU8P+Hp
         KkdvlzPu/jOWt6wFffEeWFl/QwZJHYMY+I/69c7VF8I4sYgyZkgyKFjX7wwAgFEdyYk6
         j4jfBhAXiy1GD79HfD0RpjLUvUbg+EYl2YnjVk3pALY2kqyD06y/bqhBPt9T6VTMrP7m
         6SEI+DJ7ebfHb8NQOp/UppmudWp1I2Gjm5i190P9LnEUldJ1/ruRpFddr0erU3ga5aJM
         n6bQ==
X-Gm-Message-State: AOJu0YzlML/meqmKxZJjU0eLXcQ4ZNIsYrRPYrPHZABB+Pce8Sou4mvz
	zkyMnf6vkgWMO8Ru1q3Kzif0bULKjaBzrq9WvwQ2VH/ObpReMTacG67HFd7UUaG2AZY=
X-Gm-Gg: AY/fxX5Z8qh8he4KbR4ZaPjV56ch7+pME+p/G0e56mLGKCPMne9F6Gn6HNuIsZXueOF
	9KEQ0D6M7H6mAoJRpHwVoU12reIhUDZjJHSr03iJG7AJTH5qv4mSOm3n8Q7Lebc2+OntiSS4K2g
	AsJHTvtKgo34Cb53VYmkVrPtbGgv4z9a5rWGAFV0L/OujIjNLteXvTZDqfLrshhVfG0iQxidY1+
	3T4NCVTrLKc+n1/NX91Fnmc3huk+Zc4nFPcqNQ4k3FcGFobt2WL6JVbMBXw5LuQOUdx//8GUp0J
	G8trpE3IlZhfe8Xh4RJZXm7Ya4pAmdZENyhpT6cWj6HhplAfYrhuRBYRcVE5x1K7HngruBtVtgX
	TcczjF3OwPGR3pbIyHlyMH9aX1sM4ha6SG2BzEwVmoj94DYSQVFiVF7C6mWnlr3LzuDsXWUH4LR
	ROUMIlSW5UKG6SbxLietqH1vc9iCWczaWyC+hO5Zwfa30ja6/RvjczDDvVREErZNm6mnDEcjjNn
	tI8OB1D+pmzeY8=
X-Google-Smtp-Source: AGHT+IGbLR+vUVJ8KXkXuhB+H0VpgVa4G3CeE+fI4jVyNa3ZBc8f5DaYJ795yuAku1/IgYDQMqBtvw==
X-Received: by 2002:a05:6214:2f8a:b0:882:7857:a2c1 with SMTP id 6a1803df08f44-88d81950e13mr14125216d6.17.1766089372824;
        Thu, 18 Dec 2025 12:22:52 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:22:52 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [04/15][openembedded-core] linux-yocto/6.12: update to v6.12.62
Date: Thu, 18 Dec 2025 15:22:29 -0500
Message-Id: <20251218202248.70476-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228147

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    53d3c6ddbb974 Linux 6.12.62
    7bce22989c7b7 bus: mhi: host: pci_generic: Add Telit FN990B40 modem support
    4e3297ec0c469 bus: mhi: host: pci_generic: Add Telit FN920C04 modem support
    d1ab7f9cee22e staging: rtl8723bs: fix out-of-bounds read in OnBeacon ESR IE parsing
    61871c83259a5 staging: rtl8723bs: fix stack buffer overflow in OnAssocReq IE parsing
    a54e2b2db1b7d staging: rtl8723bs: fix out-of-bounds read in rtw_get_ie() parser
    f6e629dfe6f59 comedi: check device's attached status in compat ioctls
    8952bc1973cd5 comedi: multiq3: sanitize config options in multiq3_attach()
    9fd8c8ad35c8d comedi: c6xdigio: Fix invalid PNP driver unregistration
    ff100f869c2e6 wifi: rtw88: Add USB ID 2001:3329 for D-Link AC13U rev. A1
    2f6ea894eba4c wifi: rtl8xxxu: Add USB ID 2001:3328 for D-Link AN3U rev. A1
    68852305e967c samples: work around glibc redefining some of our defines wrong
    4d9fb5428568f LoongArch: Mask all interrupts during kexec/kdump
    898c0794e7997 HID: elecom: Add support for ELECOM M-XT3URBK (018F)
    15bfd5b946a0c platform/x86/amd/pmc: Add spurious_8042 to Xbox Ally
    84c2898ad1412 platform/x86/amd: pmc: Add Lenovo Legion Go 2 to pmc quirk list
    9fc36198989e6 platform/x86: huawei-wmi: add keys for HONOR models
    b22703f8b5b37 HID: apple: Add SONiX AK870 PRO to non_apple_keyboards quirk list
    6e55ee83b1426 platform/x86: acer-wmi: Ignore backlight event
    a71677392ca53 pinctrl: qcom: msm: Fix deadlock in pinmux configuration
    e8061d02b49c5 nvme: fix admin request_queue lifetime
    573bccc5c2fcc HID: hid-input: Extend Elan ignore battery quirk to USB
    77899444d4616 bfs: Reconstruct file type when loading from disk
    002c4d2d8482b ALSA: usb-audio: Add native DSD quirks for PureAudio DAC series
    e71a1bafe6f68 drm/amdkfd: Fix GPU mappings for APU after prefetch
    ef9b1e6b8f902 smb: fix invalid username check in smb3_fs_context_parse_param()
    4c5b89f381543 Bluetooth: btrtl: Avoid loading the config file on security chips
    f09812f4dcb13 drm/vmwgfx: Use kref in vmw_bo_dirty
    5daaca0150db8 spi: imx: keep dma request disabled before dma transfer setup
    a215b8db00b51 spi: xilinx: increase number of retries before declaring stall
    deff7dfc4dc4e ftrace: bpf: Fix IPMODIFY + DIRECT in modify_ftrace_direct()
    700d4d1e785d8 USB: serial: kobil_sct: fix TIOCMBIS and TIOCMBIC
    2ceb2b5813b29 USB: serial: belkin_sa: fix TIOCMBIS and TIOCMBIC
    0423aaa295cee serial: add support of CPCI cards
    ccf6e31b91ae6 USB: serial: ftdi_sio: match on interface number for jtag
    31dea5e1c28ce USB: serial: option: move Telit 0x10c7 composition in the right place
    b38c151b4aaf6 USB: serial: option: add Telit Cinterion FE910C04 new compositions
    1f39939fbe2ef USB: serial: option: add Foxconn T99W760
    87cc1622c88a4 KVM: SVM: Don't skip unrelated instruction if INT3/INTO is replaced
    5caa40e7c6a43 comedi: pcl818: fix null-ptr-deref in pcl818_ai_cancel()
    22a76b0861ae6 ext4: add i_data_sem protection in ext4_destroy_inline_data_nolock()
    b163a5e8c7032 locking/spinlock/debug: Fix data-race in do_raw_write_lock
    5ac763713a1ef ksmbd: ipc: fix use-after-free in ipc_msg_send_request
    210ac60a86a3a ext4: refresh inline data size before write operations
    a2a7f854d154a jbd2: avoid bug_on in jbd2_journal_get_create_access() when file system corrupted
    432cb68e4555c Documentation: process: Also mention Sasha Levin as stable tree maintainer
    f68ffd58d444c xfrm: flush all states in xfrm_state_fini
    f7d879c19d306 xfrm: also call xfrm_state_delete_tunnel at destroy time for states that were never added
    13b32a7e544c0 Revert "xfrm: destroy xfrm_state synchronously on net exit path"
    dc3636912d417 xfrm: delete x->tunnel as we delete x

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 9e29a82ea5..9ac8507f9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "114f737b448424bfd7c43548ae1e58fd59629d69"
-SRCREV_meta ?= "b79e50adbe76c872daa7748ac7ac9c80b253e2b9"
+SRCREV_machine ?= "921e3aa4f264810a46d67b9d6d84ff2707035cbc"
+SRCREV_meta ?= "0bc72383691f29eb7fc4661afa9d67e106635929"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.61"
+LINUX_VERSION ?= "6.12.62"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 7654b1f1ce..940561352c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.61"
+LINUX_VERSION ?= "6.12.62"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b9d9738047f6057fdbdb871bdc93771069995308"
-SRCREV_meta ?= "b79e50adbe76c872daa7748ac7ac9c80b253e2b9"
+SRCREV_machine ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
+SRCREV_meta ?= "0bc72383691f29eb7fc4661afa9d67e106635929"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 9c34e0b51f..84419f8c78 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "01d15e59dee5c1c149992c55072ea3ffd06e803f"
-SRCREV_machine:qemuarm64 ?= "b9d9738047f6057fdbdb871bdc93771069995308"
-SRCREV_machine:qemuloongarch64 ?= "b9d9738047f6057fdbdb871bdc93771069995308"
-SRCREV_machine:qemumips ?= "20382395aabd0edcee9edb6e4a9fc964782e9f66"
-SRCREV_machine:qemuppc ?= "b9d9738047f6057fdbdb871bdc93771069995308"
-SRCREV_machine:qemuriscv64 ?= "b9d9738047f6057fdbdb871bdc93771069995308"
-SRCREV_machine:qemuriscv32 ?= "b9d9738047f6057fdbdb871bdc93771069995308"
-SRCREV_machine:qemux86 ?= "b9d9738047f6057fdbdb871bdc93771069995308"
-SRCREV_machine:qemux86-64 ?= "b9d9738047f6057fdbdb871bdc93771069995308"
-SRCREV_machine:qemumips64 ?= "795cfe93f0ba66e70c427b244c3a42a3150d23d1"
-SRCREV_machine ?= "b9d9738047f6057fdbdb871bdc93771069995308"
-SRCREV_meta ?= "b79e50adbe76c872daa7748ac7ac9c80b253e2b9"
+SRCREV_machine:qemuarm ?= "2b0e0a13ceb7489631bbd27be1562e7203b6bbde"
+SRCREV_machine:qemuarm64 ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
+SRCREV_machine:qemuloongarch64 ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
+SRCREV_machine:qemumips ?= "6b71abf154b206dfc44af020a74c9b9700fa966c"
+SRCREV_machine:qemuppc ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
+SRCREV_machine:qemuriscv64 ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
+SRCREV_machine:qemuriscv32 ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
+SRCREV_machine:qemux86 ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
+SRCREV_machine:qemux86-64 ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
+SRCREV_machine:qemumips64 ?= "abc4547fe89dba23de4366b8cd183226cab0cf85"
+SRCREV_machine ?= "f206d396d0a1a71cc4911b8c6714fcc1ba561caf"
+SRCREV_meta ?= "0bc72383691f29eb7fc4661afa9d67e106635929"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "dcbeffaf66d03968970d7d68ec7800032d00180e"
+SRCREV_machine:class-devupstream ?= "53d3c6ddbb9749ebc06956a13ed6eead31402a7d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.61"
+LINUX_VERSION ?= "6.12.62"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


