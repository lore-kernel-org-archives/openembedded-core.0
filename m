Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9667FC61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 12:17:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4961.1787919465500270974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 05:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cd2yY3Lz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49954b88fffso6617055e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787919464; x=1788524264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9i5EVBakE6epAKsJLxp7Fawu6AqYBzhbfkr9YoyE5uo=;
        b=Cd2yY3LzOyTgPnIGIi5AIUED/mKOZ7B86/50WaLX333ofrmbKUqbWmpoEGwoWF+nQk
         0WF/MFwApLiVofe0vOmfxrPTdURzQLSR5AqM1zifirkyP5V7XZz4Ztu7TOnRBbZoNcZw
         0/iuh5iUHK+iv7u0PT6OE8KmcVYB35kH5zX2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919464; x=1788524264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9i5EVBakE6epAKsJLxp7Fawu6AqYBzhbfkr9YoyE5uo=;
        b=i2UFdjiBcawbY0XI02xqrGRsUR2sEO/6piYUJwf10y+A+Mixp/DhY3Ztn0+Q1GMEqr
         74FV5OrkZBvpWAaeukZMvsFUYi4jhaXCmIaw8MKIn8zyvCTl27mtaxjulW/8V6IdVf8y
         Wb3P1M3h7/bLxJ3/rfPZ4tFVFOYIKbx2BHY8WJ0FYODdI/NiixaOdjObLZXkL8LToIsg
         60Ob4kLyUNq70ZE6NUJ+S3xVdxuMgnX4sCo9HXWmH2/KyAynLlutpuiev/WRnKyOkM43
         2tSmJZhISKVAW9CS6vrJ24Y8A6KSrRDn1RcDHmj3TLQVeRanV4M+OUKrHNuWfauP/dLx
         TlLw==
X-Gm-Message-State: AFuF++lE2N3WieMVV2ge8g/Cps4BJY/00+3+D8mgzINasiEu488UOHhO
	grqp04r8AjT5yDb1IqgyHXczqmsqWyKcSyX4c5qO1c12euI+cv7Oo2TxhNsyFtPmQaF0UC+FCu8
	EATXbkB0=
X-Gm-Gg: AR+sD12RvJimv3bXuMPTXCfKh/JApn0ewa/zukvy5CRsQM1nVcN2IPaV4R0kGVdfkBs
	zyndyGRkc26pO1eyKShdpOPlVDo733BatM2z4Nrrfp0bJC1ll+2xrhXukGOwMkiUpwHO3q0gDbB
	uf1WFUZfNgHd013WcFBSV/HUHZ2Ihy1RqKMyBfpaewh/mTSPFDKwg/bfbBRk/zp3gOjiBCLln+g
	O9tACHAdlxn8KG/IeXElBdDO+v0X+gOpb+NPqqKH0EZAL1Lpa2pBEF030/RAMxphmr6agHilvSR
	djRbALhgDqDWTHXjkGAYBVUt0ZahObLObJgK8sQXTzcbCeStRpZux8pucef5CsUu35qIyV1AW9I
	IoELXz978/UeQCMiWl3dmcfRn55CQBfLI7EPnMCC9YNSY0QUT+d84PCArc4PBt5OVy8sMsW1pbg
	ITx1xVSInVuS33X553JjRks2aXlEg6/xb+jm5Lwo+OlPlbw6RDMwwc67yWHjXi2ROkmgVOS8zjc
	V1juqOxr/CK0C5MVQ==
X-Received: by 2002:a05:600c:1d1d:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49b91c3ddbcmr77589915e9.10.1787919463130;
        Fri, 28 Aug 2026 05:17:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c3f1:c7b4:8368:83c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc1076sm47067425e9.3.2026.08.28.05.17.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:17:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: 11.1.0 -> 11.1.1
Date: Fri, 28 Aug 2026 13:17:41 +0100
Message-ID: <20260828121741.1150482-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244536

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../qemu/{qemu-native_11.1.0.bb => qemu-native_11.1.1.bb}  | 0
 ...ystem-native_11.1.0.bb => qemu-system-native_11.1.1.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                        | 2 +-
 ...u-Add-addition-environment-space-to-boot-loader-q.patch | 6 +++---
 ...sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch | 6 +++---
 .../qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch     | 6 +++---
 .../qemu/0004-qemu-Do-not-include-file-if-not-exists.patch | 4 ++--
 ...u-Add-some-user-space-mmap-tweaks-to-address-musl.patch | 6 +++---
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch            | 2 +-
 ...ts-meson.build-use-relative-path-to-refer-to-file.patch | 7 ++-----
 ...ine-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch | 2 +-
 .../0010-configure-lookup-meson-exutable-from-PATH.patch   | 6 +++---
 ...u-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch | 6 +++---
 .../qemu/{qemu_11.1.0.bb => qemu_11.1.1.bb}                | 0
 14 files changed, 25 insertions(+), 28 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_11.1.0.bb => qemu-native_11.1.1.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_11.1.0.bb => qemu-system-native_11.1.1.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_11.1.0.bb => qemu_11.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_11.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_11.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_11.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.1.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_11.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_11.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_11.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.1.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a60050125b9..f19cf70dd61 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,7 +40,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "6ee1d1a61f68212476b27108c26da5f449dc09b626d42f8279ba0dc2e08fa858"
+SRC_URI[sha256sum] = "079ffbff8a7111bbc89022107cbabf3bbfd614d5fc9d7cc675991196aca12482"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 94f23558bcb..1980b2407e1 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 4c030fef6b75bfc9aed21099b12648f13f7626a6 Mon Sep 17 00:00:00 2001
+From 76727fef9006b0936846938b6f8bbbccd829a75f Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
@@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index 812ff64d8..daf929943 100644
+index 38c71f66f..59ab5eb3a 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
-@@ -66,7 +66,7 @@
+@@ -65,7 +65,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
diff --git a/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch b/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
index a49710c86dc..abc55a4fe50 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
@@ -1,4 +1,4 @@
-From 0a029de8c4c31507cae542b5413491283569467c Mon Sep 17 00:00:00 2001
+From bbd0cb5705e5dff0c4ad54c957f6f6d4617ad174 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 10 Jun 2026 15:00:26 +0200
 Subject: [PATCH] ui/sdl2.c: force-disable SDL_HINT_VIDEO_X11_FORCE_EGL,
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ui/sdl2.c b/ui/sdl2.c
-index eccc5b0e9..ab91eaf25 100644
+index 1c97d23a4..abb19e37f 100644
 --- a/ui/sdl2.c
 +++ b/ui/sdl2.c
-@@ -874,7 +874,7 @@ static void sdl2_set_hint_x11_force_egl(void)
+@@ -890,7 +890,7 @@ static void sdl2_set_hint_x11_force_egl(void)
           * It's always safe to set the hint even if X11 is not used by SDL.
           * SDL will work regardless of the hint.
           */
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index fe9ca056141..974fb3923b2 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From eb7f727c64b09337b39b231be65360134e2065e8 Mon Sep 17 00:00:00 2001
+From a499a56467f56f362c4a7e31d64265a47faefacb Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -33,10 +33,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index ced7df49b..87f1137c9 100644
+index 74e25c60a..66e5427e9 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -740,7 +740,7 @@ int apic_accept_pic_intr(APICCommonState *s)
+@@ -741,7 +741,7 @@ int apic_accept_pic_intr(APICCommonState *s)
  {
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index a4150620d65..b4750eb1499 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 33940327a10cd5dda9d417cceef47fc34e9e269d Mon Sep 17 00:00:00 2001
+From e9a86f3bd5392b12baddb9ee65335c9cda3cad56 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,7 +16,7 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 11d3b41df..2c36df57f 100644
+index cfa68dfbd..ab2cecbfb 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
 @@ -117,7 +117,9 @@
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 28988146a84..7b7c653d73e 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From 072e2a2a97e0376e56d975c984db3f8584022849 Mon Sep 17 00:00:00 2001
+From f92e779a55ab3e5d14884a4ea55369f7a16923d3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
@@ -22,10 +22,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 5 insertions(+)
 
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index b635b6a21..a5a617516 100644
+index cc0c2ee6c..5afd41319 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1113,6 +1113,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+@@ -1114,6 +1114,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 7a81278537d..655d7802933 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 2267fcad1416f1ceef88ab052f9d69efe26f7d58 Mon Sep 17 00:00:00 2001
+From 3186be2d62be9211bdb63fd2c2bc201567c72a2e Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 7af7876920f..bdfbc7e7297 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 8342d13939436afab61bf231574e116686484d1c Mon Sep 17 00:00:00 2001
+From ae3bcb46784c43ba99e2e52bd38fea7cbc79543e Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
@@ -21,7 +21,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index dc3fb954c0..914845b221 100644
+index dc3fb954c..914845b22 100644
 --- a/tests/unit/meson.build
 +++ b/tests/unit/meson.build
 @@ -127,17 +127,17 @@ endif
@@ -45,6 +45,3 @@ index dc3fb954c0..914845b221 100644
      'test-vmstate': [migration, io],
      'test-yank': ['socket-helpers.c', qom, io, chardev],
      'test-ram-discard-manager': [
--- 
-2.55.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 480e1c6a072..5686ca81fbd 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 02ad3d36cfd395d05609540e23048e171da779ba Mon Sep 17 00:00:00 2001
+From 0999c002153ab64befd3df4c5f35dbe3611d137f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 7043c942b27..188f55cf037 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From ef9ea8e83468ce974079964a5104df170beba85b Mon Sep 17 00:00:00 2001
+From 13b84f40e56cf70d0a74a2a9fb51161b041a31bf Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
@@ -13,10 +13,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index eea903067..217af781f 100755
+index 6ddfe4b53..13cb19ee5 100755
 --- a/configure
 +++ b/configure
-@@ -981,10 +981,7 @@ get_pwd() {
+@@ -967,10 +967,7 @@ get_pwd() {
      fi
  }
  
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index bb4398f4747..456833c7f69 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From d62f78fea47f4b32fd0f48c46253f161cf305547 Mon Sep 17 00:00:00 2001
+From 9b01ec57a976ed9e3b66f2ffbe5547ad9d0b05c8 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
@@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 217af781f..cf8666337 100755
+index 13cb19ee5..b354aa9b1 100755
 --- a/configure
 +++ b/configure
-@@ -951,14 +951,14 @@ python="$(command -v "$python")"
+@@ -937,14 +937,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
diff --git a/meta/recipes-devtools/qemu/qemu_11.1.0.bb b/meta/recipes-devtools/qemu/qemu_11.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_11.1.0.bb
rename to meta/recipes-devtools/qemu/qemu_11.1.1.bb

