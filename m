Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6405CC5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 20:17:05 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5254.1787170572298770634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 13:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=cEtohouu;
 spf=pass (domain: baylibre.com, ip: 209.85.167.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4b21f09ec76so1016050b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 13:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787170571; x=1787775371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+OiKpLKC6KZPxTCGSf9bVMK+JbOvcnJCWUN56AOcDI=;
        b=cEtohouuf6A+g/1b6CrPw0xyXcZv9Pc8Ilh/VOum1zvsFE2cuHmOM6eXffTuIqobgK
         ObqhtXk92HUecIf8QutfZGxi1SC3/7e3LszH+t5jGMAJTt7E1dXqgtD7k3FguEedia3N
         4HIMIzbbMp3QV7o41B86vhwzuw1bC7OOl8VktxgoPvhd4goHX1QHqwDxHMeqoiueX1Kr
         DMML0zfgm7qsMmuQ24l/GbF9IVFRtjVSqKNIQ7AI6BpvrcqyJKGfCRYaZTvDKmfgfE3q
         L8Vf4HU1KrcsaB9ArKqUWqCEORBIcuew4H6Rlsd6hK7ufTMPoVUZ2Zdi4EFQ+jC5IEEl
         qnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787170571; x=1787775371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5+OiKpLKC6KZPxTCGSf9bVMK+JbOvcnJCWUN56AOcDI=;
        b=CLe+PTxOo90VYG/rub2TXsiQXMKs4WpGNpCT1XdhAqyWd+TVGBYXrOSuB6tJnrpv/6
         6H5BERUB0D2Y5Nlbt6Z6mbpXc0yW21DEs4kzsGP77KRWEvZO54qaa9kp9Kke60t8oy76
         Au64hR/kKMeEm31D4UGKo4lVc2tOzq1XZU6vqI39QcZ8c9y74x2jDdJxwXvmXGbOKops
         iOLdIc7kT67aGDpvjP5NcIlmV/3WSC5CgRuElNIFUqIVq/ViGX6Fq/SSGsDG8CpIdC3+
         z+BJIkLUKHLBPIv/H8iRqDG5tRQ+zVFiA26+LTWUzoNBITHV8QzrqXFyawootUTCPov9
         TLOg==
X-Gm-Message-State: AOJu0YxgfSArRbfkZP+kKAZ6zNcJqpn2x6tOl7ZST7CTbPVPAxzILGfn
	tB6DASkSGLo6BMFGiP3TTr2LH+OYC66IT0feu8x8LsmnLKJQxNMRIFkW5bV6BSAPLTRaN+ILtAL
	hLDU7Il4=
X-Gm-Gg: AR+sD13LtPA100/Ln6euEE2b5yW9VTVs/hy6m/niGOWnIg6PvQae2HzTotz73yGXyEq
	+UjZXGiGbhnp4Y9nkn19IY9JsWq7rAJDY8yi9UDFhWD+3tMnAIkTeIvHWjVFkZMfddomGp123HC
	EppumHDswK/BTBwUxUlM/y6/N8+nv0b7KPi6oPEtQlJLR2VhBreWybu1QiPJ2CWMjfR0p0IIx9i
	qqRLLZFtkIEGJLkVCo8XEwnwYmZuF0F1xxbJp9eKZETiONUT9zuLXVRRk7KxgmcsCRnVXnzR395
	x6oPUi0WNwhnQRQv3PHDep9DWASkaIMP8weQ9Tk2k6XtFfXX5y9ckYpHZui1L5/yw42iBRyuKjW
	vn2Ixx7n4ekvAc3IXmMLnIV4GCZxfbYgSOdY2HRuybj9g8UGU+FcQyqIKAdTA5qhKXt3nXwOs3W
	x9Gb1LInPPUo9pRVa97Q7zsEwQu4s2o2wOfbf96kKQYZovmxNSwHApvGGU+NIBzSZZ
X-Received: by 2002:a05:6808:1250:b0:4a4:ed9a:e793 with SMTP id 5614622812f47-4b2bcabfd0emr6699095b6e.16.1787170571098;
        Wed, 19 Aug 2026 13:16:11 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b290ad5073sm6941463b6e.8.2026.08.19.13.16.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:16:10 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] qemu: upgrade 11.0.3 -> 11.1.0
Date: Wed, 19 Aug 2026 16:16:07 -0400
Message-ID: <20260819201607.205295-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 20:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243783

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
 ...ard-headers-for-vhost-worker-structs.patch | 37 ------------------
 6 files changed, 13 insertions(+), 85 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_11.0.3.bb => qemu-native_11.1.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_11.0.3.bb => qemu-system-native_11.1.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch

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
diff --git a/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch b/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
deleted file mode 100644
index d157ce0652..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b8736798a109e2b3a4d5c02f5fd833bf870ba771 Mon Sep 17 00:00:00 2001
-From: Quan Sun <Quan.Sun@windriver.com>
-Date: Fri, 5 Jun 2026 11:54:58 +0000
-Subject: [PATCH] hw/scsi/vhost-scsi: fix build with older kernel headers
-
-On build hosts with kernel headers older than 6.0, the system's
-<linux/vhost_types.h> does not define struct vhost_vring_worker or
-struct vhost_worker_state, causing compilation of vhost-scsi.c to
-fail:
-
-  error: storage size of 'vq_worker' isn't known
-
-Fix by including standard-headers/linux/vhost_types.h before the
-system's <linux/vhost.h>, matching the existing pattern used in
-hw/virtio/vhost-backend.c. QEMU's bundled header provides the
-struct definitions, and its include guard prevents redefinition
-when the system header pulls in its own vhost_types.h.
-
-Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20260525182730.4098543-1-Quan.Sun@windriver.com/]
-
-Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
----
- hw/scsi/vhost-scsi.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
-index 699863cc1..10e8fbe50 100644
---- a/hw/scsi/vhost-scsi.c
-+++ b/hw/scsi/vhost-scsi.c
-@@ -15,6 +15,7 @@
-  */
- 
- #include "qemu/osdep.h"
-+#include "standard-headers/linux/vhost_types.h"
- #include <linux/vhost.h>
- #include <sys/ioctl.h>
- #include "qapi/error.h"
-- 
2.55.0


