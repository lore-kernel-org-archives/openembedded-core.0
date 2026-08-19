Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41749C5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 19:24:45 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.912.1787158137362166421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 09:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=JB0lYjCL;
 spf=pass (domain: baylibre.com, ip: 209.85.160.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-446f87b6de1so1253231fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 09:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787158136; x=1787762936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ci1U93GOqoBAXoBtygEiSNJpR/FYeNGBm9OaFJGIkAo=;
        b=JB0lYjCLXuorrUF3BcOJwzAZt0b5bJWRtwYvNr3IjNdk7WsDxj6diBtfCgvSTD28j+
         fHWSigGm+89eXcbWWluveDkOKwg75HS8IT+szH083s+IKg9Zoigb0BvLfSHD6vmCHoTQ
         ZpbJkKTzHhUogR6WXZRk7Xkc25A+TkEOp+aF8yuHAbTe10FOtU6BxG8WDNry9Vhg2Whi
         HusYwqFeqfbkCJTib1J5krq1HYtWngYoaW417LejriWndwUHwJyC7dHWY7NdarsqdVfb
         +KwVvkupRTTBoyftApaFSB0T41uN420tuoV7yBOylfiK35tlMv0P7GxtmNCbuiGyWCTy
         fJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158136; x=1787762936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ci1U93GOqoBAXoBtygEiSNJpR/FYeNGBm9OaFJGIkAo=;
        b=ezMTF9Asup0E/ZTTAfmqj9FeX8s2HZBxToiDy6jeXIbI8txT6aJpMV4eMOh1mB4XmA
         OrhJgRD6zyfJAWmKziijknZXwxK7yGRHE94TIm+g8M3OxYqkIzMUrS3/fimLZ0AxBZPY
         sTblBW/6J0c4oA03+rBiP7Udfjx8cm8AIC9vRf/wgq04A7Ntr9K+PszuwY2qrwvVTsPo
         hFkNAB2avoEcMJt+rq3E4GUzwg3Sp/Gnp5Cb3r5vHXcE/Fhmr50z/zpPxAOYjxFbfIln
         +Kk5QpR0Ti1QJANdRcMyDsBOXmVeACctSJi7aM2i1CO/PeAZJNnN3D17Ihvr/qsA/ept
         jRxw==
X-Gm-Message-State: AOJu0Yz402rZh6RBWlSsQr7EGUSxf5l7ZuuZg0vjZH8fcgJFgd39Bg3+
	MM1LUBBp2yvC3Dt9Jl0H+UMJk9ZChNPUpYbzM+02mkc0FwdtEv3jorxeqYjliWmxIPN9NghITjx
	YHawrQX4=
X-Gm-Gg: AR+sD12ZAb3xyMwYTQTnbuLGZhQ51IY9sQc12LUWpVfsaPMTa5u3WfoDxhCY5GaUMZu
	cXXJ7BdVs4cZ2G/Mt9OdWTMQaetuFHz7Nqb9EjGFP54GN27jDaMMQvMlqRqb00Eu0Z5pYWB7ZsX
	zkcrphFzvA9l5b8oKJRT0OuY58Etkvc2xDxB7regsu7iH2dOj77QL6oJTyVAdYFBJpX38NwSoTj
	UwqhK49z1myQFba869QDV5HFTxhRbNrD4FhM42aaIR1iDFGQaLNoR7e5G+VNdqe7ZbU5S4qV+eW
	I50SguU5uOVrUYM8c7Qr7kY8T1XFhGU03bssTeiqZzFaH1V7ot8vIzYfxh4wH32JIQYq01SNjBz
	wOP9dGmbRWhv6Wx4bAQln6z0dvEqZr/llKFH/HY/JlyJgWvKJwt/tUDwRqe+NrXrZGJet+D1BbK
	BGzb/gV/awMfG5eVyClTWo3YzEL17ICR8+GfDR82s+0tbedffgQpz5T52yoRafdaUv
X-Received: by 2002:a05:6808:13d6:b0:4b2:6ca6:9cd8 with SMTP id 5614622812f47-4b2bc882f0cmr4420195b6e.1.1787158135973;
        Wed, 19 Aug 2026 09:48:55 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2960dfc9bsm6129659b6e.14.2026.08.19.09.48.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:48:55 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemu: upgrade 11.0.3 -> 11.1.0
Date: Wed, 19 Aug 2026 12:48:52 -0400
Message-ID: <20260819164852.3973514-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 19:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243781

Changelog: https://wiki.qemu.org/ChangeLog/11.1

Patch '0012-meson-fix-close_range-detection-on-older-glibc.patch' is
included in v11.1.0:

|tgamblin@megalith ~/workspace/git/qemu ((HEAD detached at v11.1.0))$ git tag --contains 5435254739dfdcc86cf5793def83cec6e5b53822
|v11.1.0
|v11.1.0-rc0
|v11.1.0-rc1
|v11.1.0-rc2
|v11.1.0-rc3

As is '0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch':
tgamblin@megalith ~/workspace/git/qemu ((HEAD detached at v11.1.0))$ git tag --contains 062c1b7d033e675ea622939b444d57516be56f6a
v11.1.0
v11.1.0-rc0
v11.1.0-rc1
v11.1.0-rc2
v11.1.0-rc3

Refresh patch '0007-tests-meson.build-use-relative-path-to-refer-to-file.patch' to
apply on the new version.

The glusterfs backend was removed in upstream commit
3822df47c240d91ea4789ab2812d1eafce2bd21a, so remove that PACKAGECONFIG
from qemu.inc.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...native_11.0.3.bb => qemu-native_11.1.0.bb} |  0
 ...11.0.3.bb => qemu-system-native_11.1.0.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           |  5 +--
 ...d-use-relative-path-to-refer-to-file.patch | 17 +++++---
 ...close_range-detection-on-older-glibc.patch | 39 -------------------
 5 files changed, 13 insertions(+), 48 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_11.0.3.bb => qemu-native_11.1.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_11.0.3.bb => qemu-system-native_11.1.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch

diff --git a/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb b/meta/recipes-devtools/qemu/qemu-native_11.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_11.0.3.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.1.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_11.0.3.bb b/meta/recipes-devtools/qemu/qemu-system-native_11.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_11.0.3.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.1.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b28f4002ee..a60050125b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,8 +32,6 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
-           file://0012-meson-fix-close_range-detection-on-older-glibc.patch \
-           file://0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            file://0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch \
@@ -42,7 +40,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "da5fcffc32762820568b828ed430a728864d34d50b6d2f30358597760cbb0523"
+SRC_URI[sha256sum] = "6ee1d1a61f68212476b27108c26da5f449dc09b626d42f8279ba0dc2e08fa858"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
@@ -213,7 +211,6 @@ PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice"
 PACKAGECONFIG[dbus-display] = "--enable-dbus-display,--disable-dbus-display,glib-2.0-native,dbus"
 PACKAGECONFIG[usb-redir] = "--enable-usb-redir,--disable-usb-redir,usbredir"
 PACKAGECONFIG[snappy] = "--enable-snappy,--disable-snappy,snappy"
-PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs,glusterfs"
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,udev"
 PACKAGECONFIG[attr] = "--enable-attr,--disable-attr,attr,"
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 61d7924969..7af7876920 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 3d7bf86f69b5ff80dbe54dc2b3bd3dba0971e0ac Mon Sep 17 00:00:00 2001
+From 8342d13939436afab61bf231574e116686484d1c Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
@@ -12,15 +12,19 @@ filename too long. Fixed by using relative path to refer to files
 Upstream-Status: Submitted [send to qemu-devel]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Refresh to apply on v11.1.0.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  tests/unit/meson.build | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index f768e882a..9c7931a87 100644
+index dc3fb954c0..914845b221 100644
 --- a/tests/unit/meson.build
 +++ b/tests/unit/meson.build
-@@ -125,17 +125,17 @@ endif
+@@ -127,17 +127,17 @@ endif
  
  if have_system
    tests += {
@@ -39,5 +43,8 @@ index f768e882a..9c7931a87 100644
 -    'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
 +    'test-smp-parse': [qom, '../../hw/core/machine-smp.c'],
      'test-vmstate': [migration, io],
-     'test-yank': ['socket-helpers.c', qom, io, chardev]
-   }
+     'test-yank': ['socket-helpers.c', qom, io, chardev],
+     'test-ram-discard-manager': [
+-- 
+2.55.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch b/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
deleted file mode 100644
index ccef853c3b..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b2b9a9e38f20fb8aa6ed26a3c38962651e3a9eae Mon Sep 17 00:00:00 2001
-From: Quan Sun <Quan.Sun@windriver.com>
-Date: Fri, 5 Jun 2026 11:54:57 +0000
-Subject: [PATCH] meson: fix close_range detection on older glibc
-
-The has_function('close_range') check succeeds at link time on hosts
-with kernel >= 5.9 even when glibc does not declare the function
-(glibc < 2.34, e.g. AlmaLinux 8 / CentOS 8 with glibc 2.28). This
-causes CONFIG_CLOSE_RANGE to be set, but compilation then fails with:
-
-  error: implicit declaration of function 'close_range' [-Wimplicit-function-declaration]
-
-Fix by adding a prefix that includes <unistd.h>, so the meson check
-only succeeds when the C library actually declares close_range() in
-its headers. When the check fails, the existing fallback path in
-oslib-posix.c (which returns false and falls through to the /proc
-based fd closing) is used instead.
-
-Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20260522201850.1342167-1-Quan.Sun@windriver.com/]
-
-Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
----
- meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 51f5f2851..4353200db 100644
---- a/meson.build
-+++ b/meson.build
-@@ -2637,7 +2637,8 @@ if host_os == 'windows'
- endif
- 
- # has_function
--config_host_data.set('CONFIG_CLOSE_RANGE', cc.has_function('close_range'))
-+config_host_data.set('CONFIG_CLOSE_RANGE',
-+                     cc.has_function('close_range', prefix: '#include <unistd.h>'))
- config_host_data.set('CONFIG_ACCEPT4', cc.has_function('accept4'))
- config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
- config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
-- 
2.55.0


