Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079E3D5806E
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:02:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.17103.1732536113652226004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ty2S/5P9;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so38206165e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536112; x=1733140912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bX3PZP2XGPFg1m+HlLpeIH1sKEjRBZSIsffBpeu5rGo=;
        b=Ty2S/5P9ZLtXYOd8Wii0wsdNjv50pgDgoRqOuSaGDoHyCRzVDWvLTSum9EygHuvgzh
         33ayda8MKEq1P3vk1xqGU04yWCNqJ/iVBSx6LN+ZKL26A2wSleUocXNScUMnaa748/17
         Ow9Tw09YSQV5zllStkPDuoSGwpt9ohkX0XjgH1wnzsCiDLUCIRGVP0Zas+2hMXSM1yHN
         nDvmbYEFSTa0kLHaq5rWWufhhBBJAO7Yzws8vHtk+Eqj+b7yoS+jQ0lToxyKvYN7lxfk
         5tcycmyXGSDaJTO39IAJgMw6xZuM5Xme2ZLpuzQBQwoXx5TLQUPHmhrJsZp5y99Ol3c9
         xSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536112; x=1733140912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bX3PZP2XGPFg1m+HlLpeIH1sKEjRBZSIsffBpeu5rGo=;
        b=aaOhFhUXtNG0yzw6vtnZuGEtpaWhFVAUe7sqmtDdgIr/Xf+oTMgJ8Fm7JKgNaPXQCp
         RF00wz/A2AB/gFLKdiXDjkXynrB7P9fOnwFMHmVE0k7esHNfE7VHmPJkWdIAUw4VvDab
         wNJJzS89l+D2LR7GK7OCjBDSqsn/JgTdkqFdXjhxaDC7CwkybAQWf7haljMkYkEihHPN
         GDqqyE5Lhl5H3mLH2HTfbCWPA7j45lKZ1NMoovaN1nw3g1M4XlYmiHJxRIUbRQhZPkRz
         DRx3WUySeDHqzywai1HCxVOcRbJIhtm2vKndG13w+cajNIxSnOd87rxKuQSxggdIDtaZ
         TFnw==
X-Gm-Message-State: AOJu0YyEZdOJlq6/QVpGcfeoI1MWB7ItQ93mGOUgysJaoiZwsMbjExjO
	Orb/JbxhyQhZ2FVGy1PYPxMymifhk6kDcj0srD9fBRwaMz9RlS3+pHwR3A==
X-Gm-Gg: ASbGncswnmS2AwAahQODA+ycmvZO+56tlTEifawx8PXCL9pxm7OAdCbqSZb2VzM/qzX
	TqBZGoj4YHv9OGlFWsYEqbf2RAguHh+tDh6tWB/Xq5DkMgNgct4Vd5h/tkx7nej4FlyH5n/V9Rk
	va4id7GGv6nrFSSDiN/ZbuhSnvXociOvr/EULuUHUJAZQiuh1fB/0O2h42Nkh7EY4sWf59h7VK9
	VCXDzpZFDLsGomG3LQ0nq8C12TGsPmhtKUHc+aYWowFhi8KekcZnau2Lf32rT0S0wkX0SLITcgW
	IOBaz+KE58o=
X-Google-Smtp-Source: AGHT+IGNbhsVMT0ml/HjlhuGn3RZ5GZoIQ5yHAhrSCgKWG4vu8UleZunLmPGZg247j3JHe7baEvFRg==
X-Received: by 2002:a05:600c:5102:b0:434:a1e7:27b0 with SMTP id 5b1f17b1804b1-434a1e729e9mr8589545e9.11.1732536111482;
        Mon, 25 Nov 2024 04:01:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/35] qemu: upgrade 9.1.0 -> 9.1.1
Date: Mon, 25 Nov 2024 13:01:20 +0100
Message-Id: <20241125120127.2205232-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207776

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...u-native_9.1.0.bb => qemu-native_9.1.1.bb} |  1 +
 ...e_9.1.0.bb => qemu-system-native_9.1.1.bb} |  1 +
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 ...n-environment-space-to-boot-loader-q.patch | 11 ++--
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 12 ++--
 .../0002-apic-fixup-fallthrough-to-PIC.patch  |  9 +--
 ...mu-Do-not-include-file-if-not-exists.patch | 11 ++--
 ...er-space-mmap-tweaks-to-address-musl.patch | 12 ++--
 .../qemu/0006-qemu-Determinism-fixes.patch    |  9 +--
 ...d-use-relative-path-to-refer-to-file.patch | 16 +++---
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |  9 +--
 ...ce-use-of-lfs64-related-functions-an.patch | 56 +++++++++----------
 ...gure-lookup-meson-exutable-from-PATH.patch | 11 ++--
 ...and-the-python-venv-aren-t-used-for-.patch | 12 ++--
 .../qemu/qemu/fix-strerrorname_np.patch       | 14 ++++-
 .../qemu/{qemu_9.1.0.bb => qemu_9.1.1.bb}     |  0
 16 files changed, 82 insertions(+), 104 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_9.1.0.bb => qemu-native_9.1.1.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_9.1.0.bb => qemu-system-native_9.1.1.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu_9.1.0.bb => qemu_9.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_9.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_9.1.1.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-native_9.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_9.1.1.bb
index a77953529b1..26fa84c1807 100644
--- a/meta/recipes-devtools/qemu/qemu-native_9.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_9.1.1.bb
@@ -7,3 +7,4 @@ require qemu-native.inc
 EXTRA_OECONF:append = " --target-list=${@get_qemu_usermode_target_list(d)} --disable-tools --disable-install-blobs --disable-guest-agent"
 
 PACKAGECONFIG ??= "pie"
+
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_9.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_9.1.1.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-system-native_9.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_9.1.1.bb
index 5d2fbcbc029..e7bbe5d2916 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_9.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_9.1.1.bb
@@ -29,3 +29,4 @@ do_install:append() {
     install -d ${D}${libdir}/qemu-python/qmp/
     install -D ${S}/python/qemu/qmp/* ${D}${libdir}/qemu-python/qmp/
 }
+
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 02cd7c8dc8f..d6d1c848651 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,7 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "816b7022a8ba7c2ac30e2e0cf973e826f6bcc8505339603212c5ede8e94d7834"
+SRC_URI[sha256sum] = "7dc0f9da5491ff449500f3310063a36b619f236ee45706fd0846eb37d4bba889"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 2333cc84323..5e21855c507 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,7 +1,7 @@
-From e9baf07a667a1c04b57e14776cc4fa387448c908 Mon Sep 17 00:00:00 2001
+From 930b75aeade33690cec4bf748a954401da2be782 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
-Subject: [PATCH 01/11] qemu: Add addition environment space to boot loader
+Subject: [PATCH] qemu: Add addition environment space to boot loader
  qemu-system-mips
 
 Upstream-Status: Inappropriate - OE uses deep paths
@@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index af74008c82..a588b9ad4e 100644
+index 664a2ae0a..5124b158a 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
-@@ -63,7 +63,7 @@
+@@ -64,7 +64,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
@@ -30,6 +30,3 @@ index af74008c82..a588b9ad4e 100644
  
  /* Hardware addresses */
  #define FLASH_ADDRESS       0x1e000000ULL
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
index edb3e304c96..1233a07ff9a 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
@@ -1,7 +1,7 @@
-From ddb27569449c941014fa44b1b542de0831d993a0 Mon Sep 17 00:00:00 2001
+From 7030c0cd98de9e6c42e69be314204727ae335912 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 10 Oct 2024 22:40:32 -0700
-Subject: [PATCH v2] sched_attr: Do not define for glibc >= 2.41
+Subject: [PATCH] sched_attr: Do not define for glibc >= 2.41
 
 glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
 and struct sched_attr. Therefore, it needs to be checked for here as well before
@@ -18,16 +18,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Cc: Laurent Vivier <laurent@vivier.eu>
 Cc: Paolo Bonzini <pbonzini@redhat.com>
 ---
-v2: Use SCHED_ATTR_SIZE_VER0 instead of glibc version check
-
  linux-user/syscall.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 1354e75694..caecbb765d 100644
+index 27aa59594..b2c45b4c4 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -359,7 +359,8 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
+@@ -361,7 +361,8 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
  #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
  _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
            unsigned long *, user_mask_ptr);
@@ -37,7 +35,7 @@ index 1354e75694..caecbb765d 100644
  struct sched_attr {
      uint32_t size;
      uint32_t sched_policy;
-@@ -372,6 +373,7 @@ struct sched_attr {
+@@ -374,6 +375,7 @@ struct sched_attr {
      uint32_t sched_util_min;
      uint32_t sched_util_max;
  };
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index 5f8fe4faa38..bcb0d0c0da8 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,7 +1,7 @@
-From 23bf534e463bf4c1ba2e1356eaf17be0b23b192e Mon Sep 17 00:00:00 2001
+From 1ba58dbd2dce4e6ccaf3be3ad5c9ecc22565313f Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
-Subject: [PATCH 02/11] apic: fixup fallthrough to PIC
+Subject: [PATCH] apic: fixup fallthrough to PIC
 
 Commit 0e21e12bb311c4c1095d0269dc2ef81196ccb60a [Don't route PIC
 interrupts through the local APIC if the local APIC config says so.]
@@ -29,7 +29,7 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index 4186c57b34..43cd805a96 100644
+index 4186c57b3..43cd805a9 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
 @@ -759,7 +759,7 @@ int apic_accept_pic_intr(DeviceState *dev)
@@ -41,6 +41,3 @@ index 4186c57b34..43cd805a96 100644
          return -1;
  
      lvt0 = s->lvt[APIC_LVT_LINT0];
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index d9cab428c44..2b4f2b17caa 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,7 +1,7 @@
-From 5223d46a8d5302396f9fc7cc5d830769e87242fe Mon Sep 17 00:00:00 2001
+From 081c1e4ee93b22ec00136db45c36650427213c09 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
-Subject: [PATCH 04/11] qemu: Do not include file if not exists
+Subject: [PATCH] qemu: Do not include file if not exists
 
 Script configure checks for if_alg.h and check failed but
 if_alg.h still included.
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 3df2b94d9a..18f09f1f07 100644
+index 9d5415674..22df46859 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -116,7 +116,9 @@
+@@ -117,7 +117,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
@@ -29,6 +29,3 @@ index 3df2b94d9a..18f09f1f07 100644
  #include <linux/rtc.h>
  #include <sound/asound.h>
  #ifdef HAVE_BTRFS_H
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 3c7f5776ff7..26ddf5e5978 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,8 +1,7 @@
-From 1c295069857b9850f15f2cd6b33b133ea641a454 Mon Sep 17 00:00:00 2001
+From 76efeccfd73a76834ac1c75d3c94de1899085714 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
-Subject: [PATCH 05/11] qemu: Add some user space mmap tweaks to address musl
- 32 bit
+Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
 
 When using qemu-i386 to build qemux86 webkitgtk on musl, it sits in an
 infinite loop of mremap calls of ever decreasing/increasing addresses.
@@ -23,10 +22,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
  1 file changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index be3b9a68eb..481286f01d 100644
+index e4bf5d5f3..04d920c11 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1060,12 +1060,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+@@ -1105,12 +1105,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
@@ -46,6 +45,3 @@ index be3b9a68eb..481286f01d 100644
          return -1;
      }
  
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index f07054f19ab..059257bce0e 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,7 +1,7 @@
-From 9d32df80e33a7541658858497f45bed1e59e3621 Mon Sep 17 00:00:00 2001
+From 09e8fac984cea71867c0b7a05b0dd8f7025bd25a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
-Subject: [PATCH 06/11] qemu: Determinism fixes
+Subject: [PATCH] qemu: Determinism fixes
 
 When sources are included within debug information, a couple of areas of the
 qemu build are not reproducible due to either full buildpaths or timestamps.
@@ -16,7 +16,7 @@ RP 2021/3/1
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/scripts/decodetree.py b/scripts/decodetree.py
-index e8b72da3a9..5cd86b1428 100644
+index e8b72da3a..5cd86b142 100644
 --- a/scripts/decodetree.py
 +++ b/scripts/decodetree.py
 @@ -1558,7 +1558,7 @@ def main():
@@ -28,6 +28,3 @@ index e8b72da3a9..5cd86b1428 100644
          f = open(filename, 'rt', encoding='utf-8')
          parse_file(f, toppat)
          f.close()
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 5471b77e18d..cd919048f4e 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,7 +1,7 @@
-From 77ebf67d0c96f51da91c8499200ebd13f4dcdd68 Mon Sep 17 00:00:00 2001
+From 1a574aa22c9b3700af7e5c0901abef59c72bb874 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
-Subject: [PATCH 07/11] tests/meson.build: use relative path to refer to files
+Subject: [PATCH] tests/meson.build: use relative path to refer to files
 
 Fix error like:
 Fatal error: can't create tests/ptimer-test.p/..._qemu-5.2.0_hw_core_ptimer.c.o: File name too long
@@ -13,13 +13,13 @@ Upstream-Status: Submitted [send to qemu-devel]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- tests/unit/meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ tests/unit/meson.build | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
-Index: qemu-9.1.0/tests/unit/meson.build
-===================================================================
---- qemu-9.1.0.orig/tests/unit/meson.build
-+++ qemu-9.1.0/tests/unit/meson.build
+diff --git a/tests/unit/meson.build b/tests/unit/meson.build
+index 490ab8182..d19ee5606 100644
+--- a/tests/unit/meson.build
++++ b/tests/unit/meson.build
 @@ -128,17 +128,17 @@ endif
  
  if have_system
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 2e28590e11c..7bbd96df84f 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,7 +1,7 @@
-From 21b159a11bbcb1eeb26f12456e4c3fd62a06cbec Mon Sep 17 00:00:00 2001
+From 06b5b26a0a1f7687576d90066e492cf2665fff1d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
-Subject: [PATCH 08/11] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
+Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
  systems
 
 linux only wires MAP_SYNC and MAP_SHARED_VALIDATE for architectures
@@ -18,7 +18,7 @@ Cc: Michael S. Tsirkin <mst@redhat.com>
  1 file changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
-index ed14f9c64d..038f5b4b55 100644
+index ed14f9c64..038f5b4b5 100644
 --- a/util/mmap-alloc.c
 +++ b/util/mmap-alloc.c
 @@ -10,14 +10,18 @@
@@ -43,6 +43,3 @@ index ed14f9c64d..038f5b4b55 100644
  #include "qemu/mmap-alloc.h"
  #include "qemu/host-utils.h"
  #include "qemu/cutils.h"
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch b/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
index 7577249d39c..f9eddb81786 100644
--- a/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
@@ -1,8 +1,7 @@
-From 23de30079dbf47a8026faddd550a9e181d609c8f Mon Sep 17 00:00:00 2001
+From a6b57d63bcdc3f3cae9827d2e1e3492d2293695f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 17 Dec 2022 08:37:46 -0800
-Subject: [PATCH 09/11] linux-user: Replace use of lfs64 related functions and
- macros
+Subject: [PATCH] linux-user: Replace use of lfs64 related functions and macros
 
 Builds defines -D_FILE_OFFSET_BITS=64 which makes the original functions
 anf macros behave same as their 64 suffixed counterparts. This also
@@ -17,10 +16,10 @@ Cc: Laurent Vivier <laurent@vivier.eu>
  1 file changed, 39 insertions(+), 114 deletions(-)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 18f09f1f07..1b7c50a2a7 100644
+index 22df46859..27aa59594 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -761,8 +761,8 @@ safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
+@@ -762,8 +762,8 @@ safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
   */
  #define safe_ioctl(...) safe_syscall(__NR_ioctl, __VA_ARGS__)
  /* Similarly for fcntl. Note that callers must always:
@@ -31,7 +30,7 @@ index 18f09f1f07..1b7c50a2a7 100644
   * This will then work and use a 64-bit offset for both 32-bit and 64-bit hosts.
   */
  #ifdef __NR_fcntl64
-@@ -6739,13 +6739,13 @@ static int target_to_host_fcntl_cmd(int cmd)
+@@ -6724,13 +6724,13 @@ static int target_to_host_fcntl_cmd(int cmd)
          ret = cmd;
          break;
      case TARGET_F_GETLK:
@@ -48,7 +47,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          break;
      case TARGET_F_GETOWN:
          ret = F_GETOWN;
-@@ -6759,17 +6759,6 @@ static int target_to_host_fcntl_cmd(int cmd)
+@@ -6744,17 +6744,6 @@ static int target_to_host_fcntl_cmd(int cmd)
      case TARGET_F_SETSIG:
          ret = F_SETSIG;
          break;
@@ -66,7 +65,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      case TARGET_F_SETLEASE:
          ret = F_SETLEASE;
          break;
-@@ -6821,8 +6810,8 @@ static int target_to_host_fcntl_cmd(int cmd)
+@@ -6806,8 +6795,8 @@ static int target_to_host_fcntl_cmd(int cmd)
       * them to 5, 6 and 7 before making the syscall(). Since we make the
       * syscall directly, adjust to what is supported by the kernel.
       */
@@ -77,7 +76,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      }
  #endif
  
-@@ -6855,55 +6844,11 @@ static int host_to_target_flock(int type)
+@@ -6840,55 +6829,11 @@ static int host_to_target_flock(int type)
      return type;
  }
  
@@ -136,7 +135,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      abi_short l_type;
      abi_short l_whence;
      abi_llong l_start;
-@@ -6911,10 +6856,10 @@ struct target_oabi_flock64 {
+@@ -6896,10 +6841,10 @@ struct target_oabi_flock64 {
      abi_int   l_pid;
  } QEMU_PACKED;
  
@@ -149,7 +148,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      int l_type;
  
      if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -6935,10 +6880,10 @@ static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
+@@ -6920,10 +6865,10 @@ static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
      return 0;
  }
  
@@ -163,7 +162,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      short l_type;
  
      if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -6956,10 +6901,10 @@ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
+@@ -6941,10 +6886,10 @@ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
  }
  #endif
  
@@ -176,7 +175,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      int l_type;
  
      if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -6980,10 +6925,10 @@ static inline abi_long copy_from_user_flock64(struct flock64 *fl,
+@@ -6965,10 +6910,10 @@ static inline abi_long copy_from_user_flock64(struct flock64 *fl,
      return 0;
  }
  
@@ -190,7 +189,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      short l_type;
  
      if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7002,7 +6947,7 @@ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
+@@ -6987,7 +6932,7 @@ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
  
  static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
  {
@@ -199,7 +198,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  #ifdef F_GETOWN_EX
      struct f_owner_ex fox;
      struct target_f_owner_ex *target_fox;
-@@ -7015,6 +6960,7 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+@@ -7000,6 +6945,7 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
  
      switch(cmd) {
      case TARGET_F_GETLK:
@@ -207,7 +206,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          ret = copy_from_user_flock(&fl64, arg);
          if (ret) {
              return ret;
-@@ -7024,32 +6970,11 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+@@ -7009,32 +6955,11 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
              ret = copy_to_user_flock(arg, &fl64);
          }
          break;
@@ -241,7 +240,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          if (ret) {
              return ret;
          }
-@@ -7278,7 +7203,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
+@@ -7269,7 +7194,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -250,7 +249,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  }
  #endif
  
-@@ -7292,7 +7217,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
+@@ -7283,7 +7208,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -259,7 +258,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  }
  #endif
  
-@@ -8667,7 +8592,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8668,7 +8593,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
      void *tdirp;
      int hlen, hoff, toff;
      int hreclen, treclen;
@@ -268,7 +267,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  
      hdirp = g_try_malloc(count);
      if (!hdirp) {
-@@ -8720,7 +8645,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8721,7 +8646,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
               * Return what we have, resetting the file pointer to the
               * location of the first record not returned.
               */
@@ -277,7 +276,7 @@ index 18f09f1f07..1b7c50a2a7 100644
              break;
          }
  
-@@ -8754,7 +8679,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8755,7 +8680,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
      void *tdirp;
      int hlen, hoff, toff;
      int hreclen, treclen;
@@ -286,7 +285,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  
      hdirp = g_try_malloc(count);
      if (!hdirp) {
-@@ -8796,7 +8721,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8797,7 +8722,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
               * Return what we have, resetting the file pointer to the
               * location of the first record not returned.
               */
@@ -295,7 +294,7 @@ index 18f09f1f07..1b7c50a2a7 100644
              break;
          }
  
-@@ -11527,7 +11452,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -11528,7 +11453,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  return -TARGET_EFAULT;
              }
          }
@@ -304,7 +303,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          unlock_user(p, arg2, ret);
          return ret;
      case TARGET_NR_pwrite64:
-@@ -11544,7 +11469,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -11545,7 +11470,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  return -TARGET_EFAULT;
              }
          }
@@ -313,7 +312,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          unlock_user(p, arg2, 0);
          return ret;
  #endif
-@@ -12404,14 +12329,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -12405,14 +12330,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
      case TARGET_NR_fcntl64:
      {
          int cmd;
@@ -333,7 +332,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          }
  #endif
  
-@@ -12421,7 +12346,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -12422,7 +12347,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
          }
  
          switch(arg2) {
@@ -342,7 +341,7 @@ index 18f09f1f07..1b7c50a2a7 100644
              ret = copyfrom(&fl, arg3);
              if (ret) {
                  break;
-@@ -12432,8 +12357,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -12433,8 +12358,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
              }
  	    break;
  
@@ -353,6 +352,3 @@ index 18f09f1f07..1b7c50a2a7 100644
              ret = copyfrom(&fl, arg3);
              if (ret) {
                  break;
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 98ce85a8cf1..f20851bff04 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,7 +1,7 @@
-From e12a93174f9b652604dda8d8464b9559b62b29d5 Mon Sep 17 00:00:00 2001
+From 2e9642b9001df523628ab2cacbbbf2b208c49437 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
-Subject: [PATCH 10/11] configure: lookup meson exutable from PATH
+Subject: [PATCH] configure: lookup meson exutable from PATH
 
 Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
 ---
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure b/configure
-index 3cd736b139..482a1f8ef3 100755
+index d08b71f14..af0bd2c66 100755
 --- a/configure
 +++ b/configure
-@@ -956,12 +956,7 @@ fi
+@@ -958,12 +958,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
       ${source_path}/pythondeps.toml meson || exit 1
  
@@ -26,6 +26,3 @@ index 3cd736b139..482a1f8ef3 100755
  
  # Conditionally ensure Sphinx is installed.
  
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index c7bb9b1b47f..4adb2e5fa56 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,8 +1,7 @@
-From a93c2a6b2c9db9c4bd30298da43c37c5e5c6236e Mon Sep 17 00:00:00 2001
+From 68a13afd6606c2aaf1f0debd325d7314aaa61411 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
-Subject: [PATCH 11/11] qemu: Ensure pip and the python venv aren't used for
- meson
+Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
 
 Qemu wants to use a supported python version and a specific meson version
 to "help" users and uses pip and creates a venv to do this. This is a nightmare
@@ -30,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 482a1f8ef3..0da4bf3e4d 100755
+index af0bd2c66..88dab6a95 100755
 --- a/configure
 +++ b/configure
-@@ -938,14 +938,14 @@ python="$(command -v "$python")"
+@@ -944,14 +944,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
@@ -50,6 +49,3 @@ index 482a1f8ef3..0da4bf3e4d 100755
  
  # Finish preparing the virtual environment using vendored .whl files
  
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index 5098e8a4e5a..b57c4811838 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,7 @@
-target/riscv/kvm: do not use non-portable strerrorname_np()
+From 9de5de85fa917af58e7bc9cdd88f8f7ef8da2ca9 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 18 Sep 2024 16:19:37 -0700
+Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
 
 strerrorname_np is non-portable and breaks building with musl libc.
 
@@ -7,15 +10,20 @@ Use strerror(errno) instead, like we do other places.
 Upstream-Status: Submitted [https://mail.gnu.org/archive/html/qemu-stable/2023-12/msg00069.html]
 
 Cc: qemu-stable@nongnu.org
-Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg' error 
+Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg' error
 msg)
 Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2041
 Buglink: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15541
 Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+ target/riscv/kvm/kvm-cpu.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
+diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
+index f6e3156b8..fad9eb21c 100644
 --- a/target/riscv/kvm/kvm-cpu.c
 +++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1731,8 +1731,7 @@ static bool kvm_cpu_realize(CPUState *cs
+@@ -1859,8 +1859,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
      if (riscv_has_ext(&cpu->env, RVV)) {
          ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
          if (ret) {
diff --git a/meta/recipes-devtools/qemu/qemu_9.1.0.bb b/meta/recipes-devtools/qemu/qemu_9.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_9.1.0.bb
rename to meta/recipes-devtools/qemu/qemu_9.1.1.bb
-- 
2.39.5


