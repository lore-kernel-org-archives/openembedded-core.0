Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B418C4450A
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:44 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155319.1783358256789734300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VRWZMYn2;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so21069975e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358255; x=1783963055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAueguGrpxFYgeMNTXrq9e1LUqLLMWxCZjBeVrbLUYs=;
        b=VRWZMYn2XXbaKdEnrMGTtNYuq56kSE/XuHX6h8kn5q1z/Rg1cyCl3hf5Cxsgf1+ghC
         Cxm83/4kS1BJpZfjjMdquZTi61YxiUz7UL3Y5E/3NHpy4IJhBKkCIk/8b4mnZp16QWFu
         9liaohN81hdQs2+XIflknYjjEZ8sI3JG4kTcyRVV0nkxH03RoutR8B7T4WVxeu3L/l9r
         DpvaYsrSJjKIdXCE1KNAbsSd2RGxZ7EkLpD3kvjxr06v0gWFjo3h78EQr9FC0VaQguid
         RNVvEpJBopZp8Clg0I/0BD5voURzzbhmWw2Lcd1Y4pIWNkxKWD6KxYexsWI+6hUTQpCm
         FBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358255; x=1783963055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DAueguGrpxFYgeMNTXrq9e1LUqLLMWxCZjBeVrbLUYs=;
        b=lmOo4kexS6ikVJZ3A79FRIxhCvAQLmyKBBuFcMumF4tAfDbMg9z4a2dsutZQ9D5CGf
         NM430fRqyJrNrhU1tXhICxPjWAEbwJs07dFS9Q/m1vgm2keN5L03hQWaWZz/pg8FG/Cw
         JIcZbqATtPPYT7H+VVPHbL/znRnGyXhx0Haf/jfNKfMplg8Qe7nNLcKxEcKykiqhncTp
         S72HhFi8daZN960zGL8aibXSBTmXlssXClxH1mpkkggSQOVCeWZiLs4zngcS24Yxqcbo
         USD5cZZdnQtu/gblnjcABqBflr7IJaJsDwXJgbHK11tII6ekPdDww70Y3gVuv6zUu/Rg
         zy0Q==
X-Gm-Message-State: AOJu0Yy/EBqwtvBJicTLCrVE49wcbpXfThop6Cdqsts3yXujyOxFRkMh
	httQ7UJWkvYVJZi2JgJbBd+DquJLAWLP8QyUihiU8sliYFx9n77+lO220MBoBw==
X-Gm-Gg: AfdE7cl/BiJMFeJSyt/gT9hIPKMR/RJqPFW4Ftc4Oe20gOVN8z9yTex4KDZjUWCRiqc
	Wtuc4oeqXX5gWEmAyyGgzrWxk4eSGIVE8kHm7LvelZnnhVavAjGxnUfJZvFdZvF4hD2oLOZ9TAH
	N0y/nCNmZS493idVj/p+/OsXW9P17WrEmgOFbUv2Wbex9qL7odLk5PuoBDm9gU8jKXkV0rj5wwL
	hAJaoCBm4YG9HkDTc7ooSiei+Fnk16WmL3bxjMEv6jqdVtYzFJDaYJGdZV3GnLcNbVeP6sOhrvI
	rHdF4wapxmREgqofdksQuDeags0Tt3hlORCYTqn1fiFb9dxCP3ahdX9iOmDPryAoLcg9ouA81Gy
	IU8Of8uJD+RT87XurBnpfJvUg+w/IuFhg1u5dzxS3yK8HeS+yBW0mZ8XyOAkeXu4mny/wBkzPPM
	wKkxlMf4EdqHX8M+MRnPlFgXBI1l+B8BPYS8c81McHw6d8vmyB
X-Received: by 2002:a05:600c:3f16:b0:492:454c:347c with SMTP id 5b1f17b1804b1-493df066413mr17256755e9.7.1783358254797;
        Mon, 06 Jul 2026 10:17:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/45] qemu: upgrade 11.0.1 -> 11.0.2
Date: Mon,  6 Jul 2026 19:16:48 +0200
Message-ID: <20260706171701.70536-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240320

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../qemu/{qemu-native_11.0.1.bb => qemu-native_11.0.2.bb}   | 0
 ...system-native_11.0.1.bb => qemu-system-native_11.0.2.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                         | 2 +-
 ...mu-Add-addition-environment-space-to-boot-loader-q.patch | 2 +-
 ...-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch | 6 +++---
 .../qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch      | 6 +++---
 .../qemu/0004-qemu-Do-not-include-file-if-not-exists.patch  | 4 ++--
 ...mu-Add-some-user-space-mmap-tweaks-to-address-musl.patch | 2 +-
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch             | 2 +-
 ...sts-meson.build-use-relative-path-to-refer-to-file.patch | 6 +++---
 ...fine-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch | 2 +-
 .../0010-configure-lookup-meson-exutable-from-PATH.patch    | 2 +-
 ...mu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch | 2 +-
 ...012-meson-fix-close_range-detection-on-older-glibc.patch | 2 +-
 ...-include-standard-headers-for-vhost-worker-structs.patch | 2 +-
 .../qemu/{qemu_11.0.1.bb => qemu_11.0.2.bb}                 | 0
 16 files changed, 20 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_11.0.1.bb => qemu-native_11.0.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_11.0.1.bb => qemu-system-native_11.0.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_11.0.1.bb => qemu_11.0.2.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_11.0.1.bb b/meta/recipes-devtools/qemu/qemu-native_11.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_11.0.1.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.0.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_11.0.1.bb b/meta/recipes-devtools/qemu/qemu-system-native_11.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_11.0.1.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.0.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 114a3d22a7..0fb77250f8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -42,7 +42,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "0d235f5820278d914a3155ec27af8e4258d697ea892895570807d69c0cb8cd64"
+SRC_URI[sha256sum] = "3745f6ea88e2e87fe0dc838b2b1d4e0a770bf48e01a1d5a186842a1fff76ccf5"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 999d34aa75..94f23558bc 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From ae20f7ba1494b3593761a96b2300a9df9c5f6040 Mon Sep 17 00:00:00 2001
+From 4c030fef6b75bfc9aed21099b12648f13f7626a6 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
diff --git a/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch b/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
index 6b84254ac1..a49710c86d 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
@@ -1,4 +1,4 @@
-From ba4efe836c488d00e0f44929ee45feb3b1c1e014 Mon Sep 17 00:00:00 2001
+From 0a029de8c4c31507cae542b5413491283569467c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 10 Jun 2026 15:00:26 +0200
 Subject: [PATCH] ui/sdl2.c: force-disable SDL_HINT_VIDEO_X11_FORCE_EGL,
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ui/sdl2.c b/ui/sdl2.c
-index 987ad334b..b4c8a50de 100644
+index eccc5b0e9..ab91eaf25 100644
 --- a/ui/sdl2.c
 +++ b/ui/sdl2.c
-@@ -871,7 +871,7 @@ static void sdl2_set_hint_x11_force_egl(void)
+@@ -874,7 +874,7 @@ static void sdl2_set_hint_x11_force_egl(void)
           * It's always safe to set the hint even if X11 is not used by SDL.
           * SDL will work regardless of the hint.
           */
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index 5e74abbc8d..fe9ca05614 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 6a739f00ffa39aaf42545a7d27aa4d696b5b1cf9 Mon Sep 17 00:00:00 2001
+From eb7f727c64b09337b39b231be65360134e2065e8 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -33,10 +33,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index 8766ed00b..581fc6deb 100644
+index ced7df49b..87f1137c9 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -741,7 +741,7 @@ int apic_accept_pic_intr(APICCommonState *s)
+@@ -740,7 +740,7 @@ int apic_accept_pic_intr(APICCommonState *s)
  {
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index 0715261124..a4150620d6 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From d0bbf4a782b7caa452d91bd31512c2c625988670 Mon Sep 17 00:00:00 2001
+From 33940327a10cd5dda9d417cceef47fc34e9e269d Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,7 +16,7 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 65bbeb855..3ed891bd2 100644
+index 11d3b41df..2c36df57f 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
 @@ -117,7 +117,9 @@
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 53675ea4bd..28988146a8 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From 7330a1ed776e5bfb322ecf36a1ee757127289895 Mon Sep 17 00:00:00 2001
+From 072e2a2a97e0376e56d975c984db3f8584022849 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 966f78186e..7a81278537 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 4f35bc947f61b8cc3af069e236c715a75a13d0f3 Mon Sep 17 00:00:00 2001
+From 2267fcad1416f1ceef88ab052f9d69efe26f7d58 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index b2237fe05d..61d7924969 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From c4e2880b044a96a232d2d362f824c898292197a1 Mon Sep 17 00:00:00 2001
+From 3d7bf86f69b5ff80dbe54dc2b3bd3dba0971e0ac Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
@@ -17,10 +17,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index 41e8b06c3..ce5df4957 100644
+index f768e882a..9c7931a87 100644
 --- a/tests/unit/meson.build
 +++ b/tests/unit/meson.build
-@@ -124,17 +124,17 @@ endif
+@@ -125,17 +125,17 @@ endif
  
  if have_system
    tests += {
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 4bd4eafcc1..480e1c6a07 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From e3ab7c32d71f35577e8e28ac7cd671174739f435 Mon Sep 17 00:00:00 2001
+From 02ad3d36cfd395d05609540e23048e171da779ba Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 4ce4e8e167..7043c942b2 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 53b173fd19123b6fdcbfec3c0d458b074db09ced Mon Sep 17 00:00:00 2001
+From ef9ea8e83468ce974079964a5104df170beba85b Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index e379400ea2..bb4398f474 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 79dbf4d366e322dc544c749679d8a1abbbc91b7e Mon Sep 17 00:00:00 2001
+From d62f78fea47f4b32fd0f48c46253f161cf305547 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
diff --git a/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch b/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
index 6ee3ae52b9..ccef853c3b 100644
--- a/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
+++ b/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
@@ -1,4 +1,4 @@
-From b072e3d025da9d5f266683b0b12796796c4208b3 Mon Sep 17 00:00:00 2001
+From b2b9a9e38f20fb8aa6ed26a3c38962651e3a9eae Mon Sep 17 00:00:00 2001
 From: Quan Sun <Quan.Sun@windriver.com>
 Date: Fri, 5 Jun 2026 11:54:57 +0000
 Subject: [PATCH] meson: fix close_range detection on older glibc
diff --git a/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch b/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
index 25be3c2d08..d157ce0652 100644
--- a/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
+++ b/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
@@ -1,4 +1,4 @@
-From 6b613dae1eb1bad99fce6ee28f3c67fd0561b527 Mon Sep 17 00:00:00 2001
+From b8736798a109e2b3a4d5c02f5fd833bf870ba771 Mon Sep 17 00:00:00 2001
 From: Quan Sun <Quan.Sun@windriver.com>
 Date: Fri, 5 Jun 2026 11:54:58 +0000
 Subject: [PATCH] hw/scsi/vhost-scsi: fix build with older kernel headers
diff --git a/meta/recipes-devtools/qemu/qemu_11.0.1.bb b/meta/recipes-devtools/qemu/qemu_11.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_11.0.1.bb
rename to meta/recipes-devtools/qemu/qemu_11.0.2.bb
-- 
2.47.3


