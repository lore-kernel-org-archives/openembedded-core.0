Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AD0C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:12:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.2280.1743577929648154796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CjK4/w24;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0782d787so41800515e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577927; x=1744182727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ix0SHsrgnSlGP6xjqmdjU+y/GrBySb55eLr8uILVy88=;
        b=CjK4/w24OR1SbUuJu1g48tCrjOGHxERLFjfRGBCAhykK+KXZbr8HLn0NCsa5O1Igv5
         qmS+JEOEqC3Mx1SA8ghGWsswRHU0jHQxnP18dmXIJZrEGLeBxOlpetI+fVBufsG3vFfT
         uSAhR6joclCM7mdQip+mlhOlzKvHQ/zJD45ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577927; x=1744182727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ix0SHsrgnSlGP6xjqmdjU+y/GrBySb55eLr8uILVy88=;
        b=U8cBQ4C7uP0pBuF+YHcIogH2aKtEVQhhSUZCB22fBzWhxKEPwprk2hF22mRfYJk3us
         0rzS8lV3miAzv77CA9vEVb07KMDKhjHbeS0AttyidLYn98UDHCzT2zFArfxTkYnnlUwy
         ZeBLEftITipIIf56o4Js2dWzbcXjIBJdOGt20fKACJxDXlTuPuasdP+HBAV+lBnzWeSB
         53JIf4hSbPziSRYFSViSsE5OOxxTFo2W8abNsXNi99Spg+Fy0YcPQC/KlDE8QUF5wHDb
         Cz20VJLFDKp39iZv4wWP9MvvewxD7LV/iQptWMxUIwReznFO/QTTZuJqcgflfvYCHxYM
         mQsg==
X-Gm-Message-State: AOJu0YwmCAZwm8mjz3AbGy5fCx7izE2r5zxnFYi6ihPDkNxcpbNXriNG
	FFM82OkwACbXS128cs766nQyiefinXbSlLeeDyTT9Kos2uqZTdTuU56nJtKC9yE4R4XHqEPqQRI
	8
X-Gm-Gg: ASbGncuzlqMNG2mHYKPTQJhK8D3Z1mhCrfTjhPK/pmFkYOAP0UXRnbLeflo7Sq4PDnz
	q1gYSbbYRtXHv7fPQaz8DMU0s/shpM/CcfbSern6ZDL45/3SYcTYs2Z+nEysWrnc6kcMmeLUcQy
	W03bYrehTOTFL4lmz3yAMjeRr1+iLPRXxO7nxpXS2CvypoAVjf90q8HVT+7Wq19mSE0ZZ1rPs/1
	SpJn9hipqGx2WzJAjz8F/MQ6eO5wFeQqS5hFqeCuIJEinPSbDDhEH7Yuk0lpo/ZskxVUS3+pYZN
	IggD5doP1dgxPlaY+IZniF8kN/LN5DttAe4Kzi4390ZPt44WkodxitmLupNKUmZWAuUkXF3UoQh
	1ZlzWfvRH
X-Google-Smtp-Source: AGHT+IF+C1Khq0U4vKXTN5zp+kKvx3WPlz6EE0OFAVLwkJfBHq99FPGJGaggptUoQzCzR7Sf618qLg==
X-Received: by 2002:a05:6000:2805:b0:391:41c9:7a8d with SMTP id ffacd0b85a97d-39c1211b763mr10608462f8f.54.1743577927359;
        Wed, 02 Apr 2025 00:12:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.12.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:12:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 43/48] qemu: Upgrade 9.2.0 -> 9.2.3
Date: Wed,  2 Apr 2025 08:10:12 +0100
Message-ID: <20250402071017.2157620-43-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214216

Drop a patch merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...u-native_9.2.0.bb => qemu-native_9.2.3.bb} |  0
 ...e_9.2.0.bb => qemu-system-native_9.2.3.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           |  3 +-
 ...n-environment-space-to-boot-loader-q.patch |  4 +-
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 45 -------------------
 .../0002-apic-fixup-fallthrough-to-PIC.patch  |  2 +-
 ...mu-Do-not-include-file-if-not-exists.patch |  6 +--
 ...er-space-mmap-tweaks-to-address-musl.patch |  2 +-
 .../qemu/0006-qemu-Determinism-fixes.patch    |  2 +-
 ...d-use-relative-path-to-refer-to-file.patch |  6 +--
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |  2 +-
 ...gure-lookup-meson-exutable-from-PATH.patch |  6 +--
 ...and-the-python-venv-aren-t-used-for-.patch |  6 +--
 .../qemu/qemu/fix-strerrorname_np.patch       |  6 +--
 .../qemu/{qemu_9.2.0.bb => qemu_9.2.3.bb}     |  0
 15 files changed, 22 insertions(+), 68 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_9.2.0.bb => qemu-native_9.2.3.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_9.2.0.bb => qemu-system-native_9.2.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
 rename meta/recipes-devtools/qemu/{qemu_9.2.0.bb => qemu_9.2.3.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb b/meta/recipes-devtools/qemu/qemu-native_9.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_9.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_9.2.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_9.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_9.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_9.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_9.2.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 53f48375e4a..b38cac74816 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,7 +31,6 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
-           file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
@@ -39,7 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "f859f0bc65e1f533d040bbe8c92bcfecee5af2c921a6687c652fb44d089bd894"
+SRC_URI[sha256sum] = "baed494270c361bf69816acc84512e3efed71c7a23f76691642b80bc3de7693e"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 5e21855c507..7ca79b0e0b4 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 930b75aeade33690cec4bf748a954401da2be782 Mon Sep 17 00:00:00 2001
+From 29dce25c090792e360a1c1ff081af25d63d7df29 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
@@ -18,7 +18,7 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index 664a2ae0a..5124b158a 100644
+index 198da5ba3..736bf0999 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
 @@ -64,7 +64,7 @@
diff --git a/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
deleted file mode 100644
index 1233a07ff9a..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7030c0cd98de9e6c42e69be314204727ae335912 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 10 Oct 2024 22:40:32 -0700
-Subject: [PATCH] sched_attr: Do not define for glibc >= 2.41
-
-glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
-and struct sched_attr. Therefore, it needs to be checked for here as well before
-defining sched_attr
-
-Define sched_attr conditionally on SCHED_ATTR_SIZE_VER0
-
-Fixes builds with glibc/trunk
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
-
-Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/qemu-devel/patch/20241011193140.1047648-1-raj.khem@gmail.com/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Laurent Vivier <laurent@vivier.eu>
-Cc: Paolo Bonzini <pbonzini@redhat.com>
----
- linux-user/syscall.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 27aa59594..b2c45b4c4 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -361,7 +361,8 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
- #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
- _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
-           unsigned long *, user_mask_ptr);
--/* sched_attr is not defined in glibc */
-+/* sched_attr is not defined in glibc < 2.41 */
-+#ifndef SCHED_ATTR_SIZE_VER0
- struct sched_attr {
-     uint32_t size;
-     uint32_t sched_policy;
-@@ -374,6 +375,7 @@ struct sched_attr {
-     uint32_t sched_util_min;
-     uint32_t sched_util_max;
- };
-+#endif
- #define __NR_sys_sched_getattr __NR_sched_getattr
- _syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr,
-           unsigned int, size, unsigned int, flags);
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index bcb0d0c0da8..292c542442c 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 1ba58dbd2dce4e6ccaf3be3ad5c9ecc22565313f Mon Sep 17 00:00:00 2001
+From e069c66ccf29fb13ef5938b68f5362737b64d638 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index 2b4f2b17caa..ecfddfc0e15 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 081c1e4ee93b22ec00136db45c36650427213c09 Mon Sep 17 00:00:00 2001
+From 24e16b32dd0a4136ac30f8e2d48e266892814de6 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 9d5415674..22df46859 100644
+index 549e39e19..439c7beb0 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -117,7 +117,9 @@
+@@ -116,7 +116,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 26ddf5e5978..0e22a4fd866 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From 76efeccfd73a76834ac1c75d3c94de1899085714 Mon Sep 17 00:00:00 2001
+From ef7497674b2d41cffcb90f36bfe145c4951a03ba Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 059257bce0e..33de959fa4d 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 09e8fac984cea71867c0b7a05b0dd8f7025bd25a Mon Sep 17 00:00:00 2001
+From b0862cf4fecc11a181bc8c6602c7d09812148249 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index cd919048f4e..335d50be46b 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 1a574aa22c9b3700af7e5c0901abef59c72bb874 Mon Sep 17 00:00:00 2001
+From 7bce3a9379b09dfa7d24a377a9f7f1c6a2f8bdde Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
@@ -17,10 +17,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index 490ab8182..d19ee5606 100644
+index d5248ae51..2c581f055 100644
 --- a/tests/unit/meson.build
 +++ b/tests/unit/meson.build
-@@ -128,17 +128,17 @@ endif
+@@ -127,17 +127,17 @@ endif
  
  if have_system
    tests += {
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 7bbd96df84f..3f81154dbfe 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 06b5b26a0a1f7687576d90066e492cf2665fff1d Mon Sep 17 00:00:00 2001
+From 2c2fde4042578ee29714a6421c33e00c4301d744 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index f20851bff04..4a777dee52b 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 2e9642b9001df523628ab2cacbbbf2b208c49437 Mon Sep 17 00:00:00 2001
+From b3435faf13837f487231a01c2dca45a260ae323c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure b/configure
-index d08b71f14..af0bd2c66 100755
+index 18336376b..2b014b97c 100755
 --- a/configure
 +++ b/configure
-@@ -958,12 +958,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
+@@ -1002,12 +1002,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
       ${source_path}/pythondeps.toml meson || exit 1
  
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index 4adb2e5fa56..f949206717b 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 68a13afd6606c2aaf1f0debd325d7314aaa61411 Mon Sep 17 00:00:00 2001
+From 81b55a014b2e5f0863a5a3fd584168c9d4ce9eb8 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
@@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index af0bd2c66..88dab6a95 100755
+index 2b014b97c..45dc8b146 100755
 --- a/configure
 +++ b/configure
-@@ -944,14 +944,14 @@ python="$(command -v "$python")"
+@@ -988,14 +988,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index b57c4811838..ca667692b04 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 9de5de85fa917af58e7bc9cdd88f8f7ef8da2ca9 Mon Sep 17 00:00:00 2001
+From 6e5a6d44950c48957f3906294b8efd6a76b91576 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Sep 2024 16:19:37 -0700
 Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
@@ -20,10 +20,10 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index f6e3156b8..fad9eb21c 100644
+index c53ca1f76..3c67129ef 100644
 --- a/target/riscv/kvm/kvm-cpu.c
 +++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1859,8 +1859,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
+@@ -1870,8 +1870,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
      if (riscv_has_ext(&cpu->env, RVV)) {
          ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
          if (ret) {
diff --git a/meta/recipes-devtools/qemu/qemu_9.2.0.bb b/meta/recipes-devtools/qemu/qemu_9.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_9.2.0.bb
rename to meta/recipes-devtools/qemu/qemu_9.2.3.bb

