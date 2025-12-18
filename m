Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FCDD711BA
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:13 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2033.1766089389181285142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hd9DAdR3;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88888d80590so13391916d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089388; x=1766694188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb0ttfW4tlZM1vCKd8Fhi8udlW/6ESP8BOLq/qLzXMo=;
        b=hd9DAdR3vmSS1+8sJnBQCTBcMCMHzbYQqioI9fK5ayRbb7+jQ5HOq9wRI45Lgjqf9H
         8Peq8q8yBryZg2i0qWiPrHisEneqkORfGVTrZ3G8I9rfcaN8dLjmbNXS+Kh80yLTn0Oy
         xjzQbMRniuVUF+bqQSK+f6ALi70StSHEtq3LEABKv51zLeZHMJbdVv2FDqAFnFY2j1GS
         bTmQcWTFkwQXxey89DyiqWaupUYyuzcQO4vkiW3i45vrTDWQRlkaDX1rh4ydNv0OixnW
         EtoYOAIVGq+bBV1YlXaMaOBpTt0rceic7j1/Ga5XfalKZA/cW4LW3bieCPB4b5vBvyF+
         SOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089388; x=1766694188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nb0ttfW4tlZM1vCKd8Fhi8udlW/6ESP8BOLq/qLzXMo=;
        b=LoL1Bezv2Q2sBNsrTUcDiLqU7rQl5dtkRQ3jP1IVK2Y4QIcWJPwZS8MBF3Biv1vTL7
         h4UddXzy4IXvUx6e5ksh2GZ7BYdq/IsftoS/gfSJof4unDRJDa57q4JTMeLuu2cLcvho
         FDJhYO0OYzYWa0pKfrBcrRFyxW+Jf6E8sKKjpIwH/qMgVqeaROQqtQFv2vIzTSbNj7wU
         1wvjqmEhoAVIPWqW2FYuKWl2lwV3ZLroovHuvsr3qMXJ0CXxSGAeokCmDxLA+uZAwpFy
         n4W+W0Zvr0jSeBrk1HEcI7AItFo7tdXV837TzHq1Od7RdJzaVDI5rCLLfDtJD1S9t/mf
         eFEw==
X-Gm-Message-State: AOJu0YytOvIsYdKvZY6qq7mUkW3YKRRiDANd5S+GAG6fjq1kOK8nkCe8
	04CrY0TG7GLscYMls/rbFXmNMVk5AI/NGTBaT3jsPjboY79Jasv6KbeMbmYNOK3Hu80=
X-Gm-Gg: AY/fxX7gOfqluUekajTrWWyqB5zYkGs8YXUBGQK5pSg0fJrx5h6j986n91XSNSw1s0v
	TDPJw4gvpvhaWVsN2XhOvZ7emYfjyoWcRJ8KW59m+nKeXmpOP1KqnAUABbcXxB8kgyDGZFh/f5C
	YM6o1O0m0ZTwOjdA0nXNUzvNlzXhiOE+yCbubzWJXN20TZDOLfVtffQRV7p/RlnZplf+Jz4bhCV
	4RqLALvIUgtPH7xEAWIcFqMWh/ovSqXyG9NAVF1yI2346UbnOZuXWxcVXRdto5QISF6t/0bw3Wc
	JCNsRdoX6oU7BIMDbmWrAqMjBYrczxf1PdyR86/dsOEuZpqg7jhsl0ieU1uK9wgXhHeuzrT55ff
	FBnglK4CLoi2fwKNY6BYShsfbdG5vH4bctFcwX/IMTTt3A/RMTykh81f21KFn49nC8JZLFRW5LB
	h32Rj7NTfR8BC4s+/D+6CCligWvHBh8zT44i4FoTt8f0q5JioAelrgQ8S2Dpx8oXx7gPzVWgVlz
	zgkszNfisl9KpA=
X-Google-Smtp-Source: AGHT+IGDg+wRFUBf+Bas5PB+AVoG8vSc+8qYQsFbaT5cjBEcg5XM3qfO6gFMsXyYFe6cr8zPEprsrQ==
X-Received: by 2002:a05:6214:3f82:b0:88a:589b:5dac with SMTP id 6a1803df08f44-88d851f763dmr15181806d6.6.1766089388020;
        Thu, 18 Dec 2025 12:23:08 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:23:07 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [14/15][openembedded-core] linux-yocto/6.18: update to v6.18.1
Date: Thu, 18 Dec 2025 15:22:39 -0500
Message-Id: <20251218202248.70476-14-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228157

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    25442251cbda7 Linux 6.18.1
    bf323db1d883c staging: rtl8723bs: fix out-of-bounds read in OnBeacon ESR IE parsing
    e841d8ea72231 staging: rtl8723bs: fix stack buffer overflow in OnAssocReq IE parsing
    c0d93d69e1472 staging: rtl8723bs: fix out-of-bounds read in rtw_get_ie() parser
    aac80e912de30 comedi: check device's attached status in compat ioctls
    543f4c380c2e1 comedi: multiq3: sanitize config options in multiq3_attach()
    888f7e2847bcb comedi: c6xdigio: Fix invalid PNP driver unregistration
    4e6a409774951 iio: adc: ad4080: fix chip identification
    401b10a72f5a6 wifi: rtw88: Add USB ID 2001:3329 for D-Link AC13U rev. A1
    f75b9d2c9f5b5 wifi: rtl8xxxu: Add USB ID 2001:3328 for D-Link AN3U rev. A1
    ce1d0f5c7b428 Documentation/rtla: rename common_xxx.rst files to common_xxx.txt
    e7edecc410886 USB: serial: kobil_sct: fix TIOCMBIS and TIOCMBIC
    1888f286b7afe USB: serial: belkin_sa: fix TIOCMBIS and TIOCMBIC
    a1210a4023aae serial: sh-sci: Fix deadlock during RSCI FIFO overrun error
    a136ffb888bbb dt-bindings: serial: rsci: Drop "uart-has-rtscts: false"
    48e5794baf58c serial: add support of CPCI cards
    64934857c8847 USB: serial: ftdi_sio: match on interface number for jtag
    a0538d99153f3 USB: serial: option: move Telit 0x10c7 composition in the right place
    1425cc83a839a USB: serial: option: add Telit Cinterion FE910C04 new compositions
    99115ab00c1fc USB: serial: option: add Foxconn T99W760
    53903ac9ca1ab KVM: SVM: Don't skip unrelated instruction if INT3/INTO is replaced
    877adccfacb32 comedi: pcl818: fix null-ptr-deref in pcl818_ai_cancel()
    3428831264096 rust_binder: fix race condition on death_list
    5cad18e527ba8 ext4: add i_data_sem protection in ext4_destroy_inline_data_nolock()
    e983feaa79de1 crypto: zstd - fix double-free in per-CPU stream cleanup
    396a9270a7b90 locking/spinlock/debug: Fix data-race in do_raw_write_lock
    8229c6ca50cea ksmbd: ipc: fix use-after-free in ipc_msg_send_request
    58df743faf21c ext4: refresh inline data size before write operations
    aa1703f3f706e jbd2: avoid bug_on in jbd2_journal_get_create_access() when file system corrupted
    a68b06bdc1720 Documentation: process: Also mention Sasha Levin as stable tree maintainer

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 8121baf143..32ed29f25e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e42d20aa0fa5148ff2db5606563b96d1f216c4d2"
-SRCREV_meta ?= "f224983ee724c8eb616ae63eb3dc2aac9752c07b"
+SRCREV_machine ?= "be7ae5a34401b4f6dcb48ff7ae47e67394dba79c"
+SRCREV_meta ?= "20f3b59dfee2c9766656309ece38c588854d5fc7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18"
+LINUX_VERSION ?= "6.18.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index a21a74f7b1..2afdc02467 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18"
+LINUX_VERSION ?= "6.18.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
-SRCREV_meta ?= "f224983ee724c8eb616ae63eb3dc2aac9752c07b"
+SRCREV_machine ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
+SRCREV_meta ?= "20f3b59dfee2c9766656309ece38c588854d5fc7"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 114556bcec..562a997020 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "c06c93977f3b4eb10dbb9d8115f5181076d6d20c"
-SRCREV_machine:qemuarm64 ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
-SRCREV_machine:qemuloongarch64 ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
+SRCREV_machine:qemuarm ?= "2ccfe72c732cedba580d6f485b0b4147ebe1a483"
+SRCREV_machine:qemuarm64 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
+SRCREV_machine:qemuloongarch64 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
-SRCREV_machine:qemuriscv64 ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
-SRCREV_machine:qemuriscv32 ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
-SRCREV_machine:qemux86 ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
-SRCREV_machine:qemux86-64 ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
+SRCREV_machine:qemuppc ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
+SRCREV_machine:qemuriscv64 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
+SRCREV_machine:qemuriscv32 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
+SRCREV_machine:qemux86 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
+SRCREV_machine:qemux86-64 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "8903f880c38c2a9b1db181b26bcd52a3d9a8a4d2"
-SRCREV_meta ?= "f224983ee724c8eb616ae63eb3dc2aac9752c07b"
+SRCREV_machine ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
+SRCREV_meta ?= "20f3b59dfee2c9766656309ece38c588854d5fc7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7d0a66e4bb9081d75c82ec4957c50034cb0ea449"
+SRCREV_machine:class-devupstream ?= "25442251cbda7590d87d8203a8dc1ddf2c93de61"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18"
+LINUX_VERSION ?= "6.18.1"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


