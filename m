Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65FBE6ADC5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:57 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87709.1766434128337565671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I7TR8nyX;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7a02592efaso624299566b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434127; x=1767038927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep0neCiO+LTxuZKUJa9g9wrP7hBxnajwD9f7yH+w/d8=;
        b=I7TR8nyX1sQdaC/SwT5uUYXjWAXc+iil8CAuji6ZXX7XuMuc1HzaNnqjQmoV4b7ihs
         KNlr3AWcOc875PJA07Mz556JDPL/JDVwXitq6cGvNKIw+Tr1hLZ0zzxUJ5iQtpWIqj6B
         0Eee5Lt0RNKa0ykZktzYNTiiqIL0qtMA+dVkcKfadpdHhVRtqjGYUkN5iSQOKmNwZ+fo
         7Pr5GgS6FCzWr5rAPp1FaSCGvOOAcS5F0lYDzI1hNiJpBHoEw87dE/quJsvJEWDaY7xV
         vzhNQ+2EE0EjwZ8XSpU6dRUoFa5jOErNBBwIBsQcqB6kS/o50/1ymrQrQ2u/BxSWnqZA
         7xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434127; x=1767038927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ep0neCiO+LTxuZKUJa9g9wrP7hBxnajwD9f7yH+w/d8=;
        b=D8YuGGnmh/84Ctd7shPVT1DFMVjc/e2JS1bBhzub+jk/G3bnTZ9Eq2MZG1Ri1Coy0X
         TaRuXiwA4puguF2frt0qH3t42uvG/XiNRmMnisy0KRw6zxNEmNdvsuiZGmiB8qs+EUKJ
         y5/U8jzPFfq4Mn+qzx/echXRghoXyndFVcgGJeAifhdD2LcZnn8oFZpnOQlGrWWhTz5Q
         +53J0j3qwNaTa6gVj1OMtbhBUOaVdzd0tWCLPZpgrh96q/0v5io5B4nZvB17esYmsiB2
         sLVqvd9vNcyGiFdy7UR3a3M3QEu0o5vWknB4sj7L06e+3uyFu3lM69Nz8UOJXrzlyuo3
         HvpA==
X-Gm-Message-State: AOJu0YyVdKcsHYYAZwWtUebvMQfxoFywCthqKtcbEiEUMjbvMoB671Y6
	Qr1cRBn1E2XM74nrse7JFdL1WhTMfsmYyhG/emVYgMZy8OuKFCs18pCymx/V2A==
X-Gm-Gg: AY/fxX6BcsP/YiL071rvFWurCDFn9RHvgwEFoUXlJZyErgO2Yro2HMpJ9+uDoypJSBD
	jAQs0Tp61qwr+0M3JWe1rd7hA2AUGDyCLzryNloGgt6+CR4wo8Oe+McPJDMxXMQ9naVViaFKfER
	YDvSXQHAFYqhZCqinFltPJeRuBNX+xoYRtRg8UGTF2tMobqAaMFtrisyPjs/kWJ25N8DJJqriuI
	5+VHsf+psFkpYXnppBxUKWBQpHcuA6pESicFuz+2HAvii/nLwBhYV4j1kBRmESMGGBYxM9JBz4n
	1vbsSNjWlRTOU791VLcjpZCMjY8EVlTbMF0Vs8yQMMoDbvlvD6fXjTmVrfgH+FZnIYkzAflL1yH
	5D1ab73hg1wgkHLV4TCo4EvGAL7IVq+gVLvlqauqcKYuY0QYlCxecQ6WeXEXGiCAFUEAdLehxQT
	3fLEIa70rv5rgauTk78UzAZ/cMl+/vtuYnv2woqqoXjFWKUJI=
X-Google-Smtp-Source: AGHT+IHNyOuYA/T4dw0RLRzYaaAbi/XH9S9ciRPtqiYE1x5A2uXv5aniQqF3/v8T/uxmwWIpoJjNew==
X-Received: by 2002:a17:907:6d12:b0:b76:bcf5:a388 with SMTP id a640c23a62f3a-b8037198f0cmr1266226666b.50.1766434126408;
        Mon, 22 Dec 2025 12:08:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 089/114] qemu: upgrade 10.0.7 -> 10.1.3
Date: Mon, 22 Dec 2025 21:07:11 +0100
Message-ID: <20251222200739.2278706-89-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228414

From: Alexander Kanavin <alex@linutronix.de>

License-Update: FSF physical address -> URI
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{qemu-native_10.0.7.bb => qemu-native_10.1.3.bb} |  0
 ...ative_10.0.7.bb => qemu-system-native_10.1.3.bb} |  1 +
 meta/recipes-devtools/qemu/qemu.inc                 |  7 ++++---
 ...ddition-environment-space-to-boot-loader-q.patch |  4 ++--
 .../qemu/0002-apic-fixup-fallthrough-to-PIC.patch   |  6 +++---
 ...004-qemu-Do-not-include-file-if-not-exists.patch |  6 +++---
 ...ome-user-space-mmap-tweaks-to-address-musl.patch |  6 +++---
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch     |  6 +++---
 ...n.build-use-relative-path-to-refer-to-file.patch |  2 +-
 ..._SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch |  2 +-
 ...-configure-lookup-meson-exutable-from-PATH.patch |  6 +++---
 ...e-pip-and-the-python-venv-aren-t-used-for-.patch |  6 +++---
 ...ard-Fix-size-check-for-backing-block-image.patch | 13 +++++--------
 .../qemu/qemu/fix-strerrorname_np.patch             |  6 +++---
 .../qemu/{qemu_10.0.7.bb => qemu_10.1.3.bb}         |  0
 15 files changed, 35 insertions(+), 36 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_10.0.7.bb => qemu-native_10.1.3.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.0.7.bb => qemu-system-native_10.1.3.bb} (97%)
 rename meta/recipes-devtools/qemu/{qemu_10.0.7.bb => qemu_10.1.3.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_10.0.7.bb b/meta/recipes-devtools/qemu/qemu-native_10.1.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_10.0.7.bb
rename to meta/recipes-devtools/qemu/qemu-native_10.1.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.0.7.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.1.3.bb
similarity index 97%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.0.7.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_10.1.3.bb
index 22462e2499..2e4f7328ad 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_10.0.7.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_10.1.3.bb
@@ -22,6 +22,7 @@ do_install:append() {
     # The following is also installed by qemu-native
     rm -f ${D}${datadir}/qemu/trace-events-all
     rm -rf ${D}${datadir}/qemu/keymaps
+    rm -rf ${D}${datadir}/qemu/dtb
     rm -rf ${D}${datadir}/icons/
     rm -rf ${D}${includedir}/qemu-plugin.h
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 63414196fa..62c5e8e46f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -15,8 +15,9 @@ require qemu-targets.inc
 # we need a full python3-native setup
 inherit pkgconfig ptest update-rc.d systemd python3native
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a3b50d8b88dcc0eb3d7d39b760b9e821 \
+                    file://COPYING.LIB;endline=24;md5=8a8178c06478747a771588adec965232 \
+                    "
 
 SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
@@ -39,7 +40,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "faeea5d45a4d9bdde60716814eafadac4286f8a03ce757be632671e0eaa4ce0b"
+SRC_URI[sha256sum] = "fbaa7a0d7a9a1deb5695b125916746ec28fe0de6275d4454f3e3bbaf8b339b53"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index f27208f45f..bc8dace013 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 27273fcac6857750f07a2632bdb6b0ed66ae982a Mon Sep 17 00:00:00 2001
+From f2d9bc614f7edf66412209aba78aa086e65dc75e Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
@@ -18,7 +18,7 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index 8e9cea70b..2268a8b61 100644
+index cbdbb2105..62681fdae 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
 @@ -65,7 +65,7 @@
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index ad5c5ba03e..afbe1bd381 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 19b95073e5d42dc4aa5392da3d422ab668003107 Mon Sep 17 00:00:00 2001
+From 945af9ecc80653955cbdbb7d3e28dce61795b251 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -29,10 +29,10 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index d18c1dbf2..45dde1fc5 100644
+index 143d08f1a..5bb008d59 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -758,7 +758,7 @@ int apic_accept_pic_intr(DeviceState *dev)
+@@ -756,7 +756,7 @@ int apic_accept_pic_intr(DeviceState *dev)
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index c04e42608f..2e738abaa3 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 913064f9fe724fa1b70b9bf6dd3444c7dddeb928 Mon Sep 17 00:00:00 2001
+From f8c1614b204c1d64af906dc70dbf4a1534eb6b38 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 8bfe4912e..d04984f66 100644
+index c236b2834..2a3527a87 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -118,7 +118,9 @@
+@@ -119,7 +119,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 388d11d10d..ffbbb1ab32 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From f2adfc703e94819b0daca98fde1d0a30168c292d Mon Sep 17 00:00:00 2001
+From 3621615790270449bf9c8a0777e8ef28eb762bf9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
@@ -22,10 +22,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
  1 file changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index d1f36e6f1..26ccf8f4d 100644
+index 002e1e668..912839dec 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1108,12 +1108,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+@@ -1109,12 +1109,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 4690d86315..5b24c18916 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From e032726e9da8de0088d6c70cfd92e0a52155315f Mon Sep 17 00:00:00 2001
+From 8b28a9376074067bc2d84d4f77d5c7a42433b31b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
@@ -16,10 +16,10 @@ RP 2021/3/1
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/scripts/decodetree.py b/scripts/decodetree.py
-index e8b72da3a..5cd86b142 100644
+index f992472b7..2e4218b14 100644
 --- a/scripts/decodetree.py
 +++ b/scripts/decodetree.py
-@@ -1558,7 +1558,7 @@ def main():
+@@ -1559,7 +1559,7 @@ def main():
      toppat = ExcMultiPattern(0)
  
      for filename in args:
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 7c24f432f2..a58c936d06 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From ebeab06747306ec16299207bf4bd7481a472b4de Mon Sep 17 00:00:00 2001
+From 097b75ad8310143decab92f6d1744144e7a4809f Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 54421544bb..af0eafb65f 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 9c225234a756f2745cf04c3c3af6ef6b6acf4277 Mon Sep 17 00:00:00 2001
+From 9d5deb767523ea0d1aeecb9960244c702530acad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 28a10d98bd..6e9350ad74 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 9adf3fc3ea2cbccb41d49695a53c74fed6850fb0 Mon Sep 17 00:00:00 2001
+From aaec67c133dddda7204d23964732b4b788cbc9ce Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure b/configure
-index 02f1dd231..2c5ecd346 100755
+index 274a77876..84e429409 100755
 --- a/configure
 +++ b/configure
-@@ -983,12 +983,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
+@@ -995,12 +995,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
       ${source_path}/pythondeps.toml meson || exit 1
  
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index b06020d106..d04596d313 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 0d85988457a475c25b84085cf090040150a9c16d Mon Sep 17 00:00:00 2001
+From c9f174b2f7b43e59e91f88c75c8b3e2ee30bfcdd Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
@@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 2c5ecd346..5315ede35 100755
+index 84e429409..1a9585e8e 100755
 --- a/configure
 +++ b/configure
-@@ -969,14 +969,14 @@ python="$(command -v "$python")"
+@@ -981,14 +981,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
diff --git a/meta/recipes-devtools/qemu/qemu/0012-hw-sd-sdcard-Fix-size-check-for-backing-block-image.patch b/meta/recipes-devtools/qemu/qemu/0012-hw-sd-sdcard-Fix-size-check-for-backing-block-image.patch
index a8e570db33..431b49bad7 100644
--- a/meta/recipes-devtools/qemu/qemu/0012-hw-sd-sdcard-Fix-size-check-for-backing-block-image.patch
+++ b/meta/recipes-devtools/qemu/qemu/0012-hw-sd-sdcard-Fix-size-check-for-backing-block-image.patch
@@ -1,7 +1,7 @@
-From be0a5f477ae2c73d80ade595f28783d85e1ef3e0 Mon Sep 17 00:00:00 2001
+From 9b262cda68d2b687f803a8030d3a1ad29a93a41e Mon Sep 17 00:00:00 2001
 From: Jan Kiszka <jan.kiszka@siemens.com>
 Date: Sun, 24 Aug 2025 09:18:33 +0200
-Subject: [PATCH 10/10] hw/sd/sdcard: Fix size check for backing block image
+Subject: [PATCH] hw/sd/sdcard: Fix size check for backing block image
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -28,10 +28,10 @@ Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
  1 file changed, 47 insertions(+), 20 deletions(-)
 
 diff --git a/hw/sd/sd.c b/hw/sd/sd.c
-index e541c57f8c3c..db86849b8512 100644
+index 8c290595f..58387440b 100644
 --- a/hw/sd/sd.c
 +++ b/hw/sd/sd.c
-@@ -2675,9 +2675,32 @@ static void sd_instance_finalize(Object *obj)
+@@ -2767,9 +2767,32 @@ static void sd_instance_finalize(Object *obj)
      timer_free(sd->ocr_power_timer);
  }
  
@@ -64,7 +64,7 @@ index e541c57f8c3c..db86849b8512 100644
      int ret;
  
      switch (sd->spec_version) {
-@@ -2690,32 +2713,36 @@ static void sd_realize(DeviceState *dev, Error **errp)
+@@ -2782,32 +2805,36 @@ static void sd_realize(DeviceState *dev, Error **errp)
      }
  
      if (sd->blk) {
@@ -121,6 +121,3 @@ index e541c57f8c3c..db86849b8512 100644
              return;
          }
  
--- 
-2.47.3
-
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index 1cc973443e..524e20a3dd 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 7e09654fa179ad5fab1dc0a47886c6a1a2acc097 Mon Sep 17 00:00:00 2001
+From 475dbdbee7ff878d113f45a1a623e9abbf0e55f3 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Sep 2024 16:19:37 -0700
 Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
@@ -20,10 +20,10 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index 8001ca153..79fb43f92 100644
+index e06d2126b..e1cc02fba 100644
 --- a/target/riscv/kvm/kvm-cpu.c
 +++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1968,8 +1968,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
+@@ -1994,8 +1994,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
      if (riscv_has_ext(&cpu->env, RVV)) {
          ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
          if (ret) {
diff --git a/meta/recipes-devtools/qemu/qemu_10.0.7.bb b/meta/recipes-devtools/qemu/qemu_10.1.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.0.7.bb
rename to meta/recipes-devtools/qemu/qemu_10.1.3.bb
-- 
2.47.3


