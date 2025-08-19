Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFCFCA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:08:25 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.3392.1755634095190538160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=itbC/Ctk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso2089855b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755634094; x=1756238894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/M7WBgJLtQHaH71am0m0zHGTMoQC5u3TVtJBlXrOSE=;
        b=itbC/CtkpIJl4GZOhjlDyZedtUtxOGA0lyOHT1LVT1Nx/zjbQW6FWBDWkNP/mCdx0x
         hCuyRFRe2IMV+Cfmn/lWxoy8jPDgOj0vO6PGrbq59PzZZA+4ENeafTyaoOEB/hi+o/YY
         31XyQht9Fj1eJ+B3WuKXxq4qC70iJ/hSOhwFDV4+bMWaYeiHxudS3885Jbb9hzCJETZR
         BW3ntzHS+auzMZhgSBPLBLV8FbIxYd5rY80PH9PnX4GyTQ0xYx+DI3Rjkyc0X/530gUy
         BZ2eTF/URON6b1Mw+yHgUwU42yMmxO/8ibDRVX1GIoq+JTBazjbAAlwjpEcVlFivS/6O
         qnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634094; x=1756238894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/M7WBgJLtQHaH71am0m0zHGTMoQC5u3TVtJBlXrOSE=;
        b=vqYCTiJCJTwxMyvF/i5I5zjaqi6TbA+AIs5n46mmuDTUN2atRw/Pz7LK3amBbVFXxU
         DSOPNQcMkKohxsJzOM2Pv30nbaUuQ6v6FcuOnHUxOv2MeprxsGzSrtMt0WJ7e4xn9dOd
         f/jxnYDJd5FX3D9Pr20dTr8kgXwPCiarVfxvW9x8aB/mJraCf57Xx2QkkhvPd+66zdCi
         ZWXayUN5Yd2sXoOomMnl8ju4kgMq8LIPYI/y6Zeym/CWkiVbQAHojRUHVCwiaf41iI8l
         3p9A16XBPsnuBbN0+4gB2cwg4e1GdbQoo9qKy937kbqRvyKt+V14oIlzgUOWNJmsbyfg
         WaCQ==
X-Gm-Message-State: AOJu0Yw+5C6ns06WneUFAaLFcOLb5hebs6FCsf/BxzldeAthGel4sPx5
	nAK0jzer1rtpSlPqUApMtp1en9lv3lULX3QUx72H3WQ53Mb8TZDmm4Cn32XJDkDPW7/saR0ew18
	HQynO
X-Gm-Gg: ASbGncvdv6omPH/H4fAwvzQPOyukv8AgMd00cte7VfglMmnYSK2G0egheqpkHQbaGRc
	2vmqLxB3xl1lNLIFH6qIyhGaTmw1QQjxepMfocCYmrUFMviuxvAzwXlG2wiJg3l4Aptg7ka03tD
	+Wu1ng/RPZFpUlqlsTVs9DN0rEHeyh7MtytIxHTD62u+xULElT8AYpGK+YNwDghAs/kGD5RjhJo
	e1u5AAdcZ4MfV6Jp3lUUAXBkOJhVKie1qRYopXQ/40SfUXsg07Y9Gb+SlzjQt+SkBGAYZvp1P3l
	BvJB7AC7tvGGkIppMy3vC3c+UNRxXUQbPj6lyBBysuNzWUxqODSmnY13mFYLvjo09UpKIUwu7RK
	iVsalXvGmaooSmQ==
X-Google-Smtp-Source: AGHT+IEKSZqMrEiw/OJ/AqCe9pYFwXcbTfZ/JYUMMJG9dis+AAJ0EyKG1OlCaaNTcaa+ZcNkEbXFOg==
X-Received: by 2002:a05:6a00:464f:b0:748:e9e4:d970 with SMTP id d2e1a72fcca58-76e8db9d13cmr580105b3a.1.1755634094374;
        Tue, 19 Aug 2025 13:08:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm3348855b3a.29.2025.08.19.13.08.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:08:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/10] cairo: fix build with gcc-15 on host
Date: Tue, 19 Aug 2025 13:07:51 -0700
Message-ID: <c9fa1ceafb5de45c0f7478c1185c8bbf478dba96.1755633925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755633925.git.steve@sakoman.com>
References: <cover.1755633925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222135

From: Martin Jansa <martin.jansa@gmail.com>

* backports from 1.18.2 used since:
  https://git.openembedded.org/openembedded-core/commit/?id=070d79c8adec7e0a8862019cf61910a59b18613a

* fixes build on hosts with gcc-15 (e.g. ubuntu-25.10)

../cairo-1.18.0/test/pdiff/pdiff.h:22:13: error: âboolâ cannot be defined via âtypedefâ
   22 | typedef int bool;
      |             ^~~~
../cairo-1.18.0/test/pdiff/pdiff.h:22:13: note: âboolâ is a keyword with â-std=c23â onwards
../cairo-1.18.0/test/pdiff/pdiff.h:22:1: warning: useless type name in empty declaration
   22 | typedef int bool;
      | ^~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cairo/cairo/0001-Require-C11.patch        | 25 +++++++++++++++++++
 .../cairo/cairo/0002-Meson-Require-C-11.patch | 22 ++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.18.0.bb   |  2 ++
 3 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/0001-Require-C11.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/0002-Meson-Require-C-11.patch

diff --git a/meta/recipes-graphics/cairo/cairo/0001-Require-C11.patch b/meta/recipes-graphics/cairo/cairo/0001-Require-C11.patch
new file mode 100644
index 0000000000..a2e888e46b
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/0001-Require-C11.patch
@@ -0,0 +1,25 @@
+From de2452228814e804b103dfa7c2d37b3a216c6155 Mon Sep 17 00:00:00 2001
+From: Adrian Johnson <ajohnson@redneon.com>
+Date: Sun, 28 Apr 2024 21:31:41 +0930
+Subject: [PATCH] Require C11
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/cairo/cairo/-/commit/b60f47dfd5bbe98aec43f6c356ba3be9a1b7989e]
+---
+ meson.build | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 9100152..f8432fd 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,7 +1,8 @@
+ project('cairo', 'c', 'cpp',
+-  meson_version: '>= 0.59.0',
++  meson_version: '>= 1.3.0',
+   version: run_command(find_program('version.py'), check: true).stdout().strip(),
+-  default_options: ['warning_level=2'],
++  default_options: ['c_std=gnu11,c11',
++                    'warning_level=2'],
+ )
+ 
+ freetype_required_version = '>= 9.7.3'
diff --git a/meta/recipes-graphics/cairo/cairo/0002-Meson-Require-C-11.patch b/meta/recipes-graphics/cairo/cairo/0002-Meson-Require-C-11.patch
new file mode 100644
index 0000000000..b395fbbc8b
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/0002-Meson-Require-C-11.patch
@@ -0,0 +1,22 @@
+From d9cc95b94b2bb1e67f2095cda484d4a8a63aba10 Mon Sep 17 00:00:00 2001
+From: Luca Bacci <luca.bacci982@gmail.com>
+Date: Thu, 16 Jan 2025 16:48:12 +0100
+Subject: [PATCH] Meson: Require C++11
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/cairo/cairo/-/commit/dfd06ab3884d79de3b5bac782d1e8b2a0bd791ab]
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index f8432fd..85434d2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2,6 +2,7 @@ project('cairo', 'c', 'cpp',
+   meson_version: '>= 1.3.0',
+   version: run_command(find_program('version.py'), check: true).stdout().strip(),
+   default_options: ['c_std=gnu11,c11',
++                    'cpp_std=gnu++11,c++11',
+                     'warning_level=2'],
+ )
+ 
diff --git a/meta/recipes-graphics/cairo/cairo_1.18.0.bb b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
index 4c97e973d0..f1a87ccb3f 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
@@ -30,6 +30,8 @@ DEPENDS = "fontconfig freetype glib-2.0 libpng pixman zlib"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
+           file://0001-Require-C11.patch \
+           file://0002-Meson-Require-C-11.patch \
           "
 
 SRC_URI[sha256sum] = "243a0736b978a33dee29f9cca7521733b78a65b5418206fef7bd1c3d4cf10b64"
-- 
2.43.0


