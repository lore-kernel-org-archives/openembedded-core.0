Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0D0D2FFEC
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 10:01:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.18924.1729245702293609355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 03:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dT8JIqcd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so11676555e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 03:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729245700; x=1729850500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8yqxervXqkxhCLcITSC0OxGBPCbxtyMAeB0FuY2pts=;
        b=dT8JIqcdLpJQn/8rJB1qXe/VXifkt3ul8C5N7LZDDtYV55gg5zEV0RO0+W4Mnm3/v4
         LkRFMXci4gGZeIZIe1FzpxA1IeqPPTK4OM2KyfJlmYHF2qvHXrA3cn9j9aNtujvVAc+B
         W/NvsaYg1wmJKGX0K8wzeqIxVwPvCMIqeAWXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245700; x=1729850500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8yqxervXqkxhCLcITSC0OxGBPCbxtyMAeB0FuY2pts=;
        b=EmLo26+Rhr77/0S4k44HSjzkxZWze4+IZYHsRHbr7H8pVsnZ2lUPFUqfduKEdaZvLl
         AH2dNNPzFcGTlKrQ5gyiSY6oRjTjUCEJSzXQdAzNGdM43ao8YghYMyDiZdmL0ds1tEVS
         ydQPm6WNH77POcjgSZgEptDNcXR6QbuhDoMzb2tS2JwLl2m6rIzthz5RbAclXE0p19hu
         0441SVPBhJnktKQF7xbsGf1DBeI8Q5ETdkvkDjd04AaZMWZ1ddQbGOf9zdXyPjws5QbC
         6ZbP9Kp2bxj1xLA+0E7Nh/jEHqqzvDWgbWNNfavH1lFuirW5DDzCbiMRNB2CgDpN8Zca
         5whg==
X-Gm-Message-State: AOJu0YwEE5pDo7FSVPe+joTZc2cbzHdzg968zTR7/YzpjzC6Bjcodyz6
	g+ZESrfqMsTOZKLGXxTd6piLytbQ+RNW4QsOqDj98T4UhDUiCQjAQdBGCaBuw5eU2Fl5ioTHctm
	M
X-Google-Smtp-Source: AGHT+IFFpNs/oIAusrvrf9g1MeD/HtdPMbzY3+DyK35xO6K8s/hgI6Cx9/wBUXmnxLwwHwmt++0eUg==
X-Received: by 2002:a05:600c:674a:b0:431:508a:1a7b with SMTP id 5b1f17b1804b1-431616a3f91mr13398245e9.34.1729245700209;
        Fri, 18 Oct 2024 03:01:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b6b8:7e19:2b4e:cb76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed5e9sm1491533f8f.76.2024.10.18.03.01.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:01:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] qemu: Upgrade 9.0.1 -> 9.1.0
Date: Fri, 18 Oct 2024 11:01:34 +0100
Message-ID: <20241018100138.2341819-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018100138.2341819-1-richard.purdie@linuxfoundation.org>
References: <20241018100138.2341819-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 10:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206046

Drop the gnutls patch since something equivalent was merged upsteam.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...u-native_9.0.2.bb => qemu-native_9.1.0.bb} |  0
 ...e_9.0.2.bb => qemu-system-native_9.1.0.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           |  3 +-
 ...dd-pkg-config-handling-for-libgcrypt.patch | 31 -----------------
 ...d-use-relative-path-to-refer-to-file.patch | 34 +++++++++----------
 .../qemu/{qemu_9.0.2.bb => qemu_9.1.0.bb}     |  0
 7 files changed, 19 insertions(+), 51 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_9.0.2.bb => qemu-native_9.1.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_9.0.2.bb => qemu-system-native_9.1.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
 rename meta/recipes-devtools/qemu/{qemu_9.0.2.bb => qemu_9.1.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1d2771239e7..b1cc8b12855 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.43%"
 GDBVERSION ?= "15.%"
 GLIBCVERSION ?= "2.40%"
 LINUXLIBCVERSION ?= "6.10%"
-QEMUVERSION ?= "9.0%"
+QEMUVERSION ?= "9.1%"
 GOVERSION ?= "1.22%"
 RUSTVERSION ?= "1.79%"
 
diff --git a/meta/recipes-devtools/qemu/qemu-native_9.0.2.bb b/meta/recipes-devtools/qemu/qemu-native_9.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_9.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_9.1.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_9.0.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_9.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_9.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_9.1.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 223de71efee..02cd7c8dc8f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -24,7 +24,6 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://fix-strerrorname_np.patch \
            file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
            file://0002-apic-fixup-fallthrough-to-PIC.patch \
-           file://0003-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://0004-qemu-Do-not-include-file-if-not-exists.patch \
            file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch \
            file://0006-qemu-Determinism-fixes.patch \
@@ -39,7 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "a8c3f596aece96da3b00cafb74baafa0d14515eafb8ed1ee3f7f5c2d0ebf02b6"
+SRC_URI[sha256sum] = "816b7022a8ba7c2ac30e2e0cf973e826f6bcc8505339603212c5ede8e94d7834"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
deleted file mode 100644
index 30e269f8f4f..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e4f6c6b9f43b28271bc9dc6cbcafad53f80387e0 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Wed, 28 Aug 2019 19:56:28 +0800
-Subject: [PATCH 03/11] configure: Add pkg-config handling for libgcrypt
-
-libgcrypt may also be controlled by pkg-config, this patch adds pkg-config
-handling for libgcrypt.
-
-Upstream-Status: Denied [https://lists.nongnu.org/archive/html/qemu-devel/2019-08/msg06333.html]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 91a0aa64c6..e8373d55b8 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1655,7 +1655,7 @@ endif
- if not gnutls_crypto.found()
-   if (not get_option('gcrypt').auto() or have_system) and not get_option('nettle').enabled()
-     gcrypt = dependency('libgcrypt', version: '>=1.8',
--                        method: 'config-tool',
-+                        method: 'pkg-config',
-                         required: get_option('gcrypt'))
-     # Debian has removed -lgpg-error from libgcrypt-config
-     # as it "spreads unnecessary dependencies" which in
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 74de158b2e3..5471b77e18d 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -16,20 +16,23 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  tests/unit/meson.build | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index 228a21d03c..272fb4c6ca 100644
---- a/tests/unit/meson.build
-+++ b/tests/unit/meson.build
-@@ -47,7 +47,7 @@ tests = {
-   'test-keyval': [testqapi],
-   'test-logging': [],
-   'test-uuid': [],
--  'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
-+  'ptimer-test': ['ptimer-test-stubs.c', '../../hw/core/ptimer.c'],
-   'test-qapi-util': [],
-   'test-interval-tree': [],
-   'test-xs-node': [qom],
-@@ -138,7 +138,7 @@ if have_system
+Index: qemu-9.1.0/tests/unit/meson.build
+===================================================================
+--- qemu-9.1.0.orig/tests/unit/meson.build
++++ qemu-9.1.0/tests/unit/meson.build
+@@ -128,17 +128,17 @@ endif
+ 
+ if have_system
+   tests += {
+-    'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
++    'ptimer-test': ['ptimer-test-stubs.c', '../../hw/core/ptimer.c'],
+     'test-iov': [],
+     'test-opts-visitor': [testqapi],
+     'test-xs-node': [qom],
+-    'test-virtio-dmabuf': [meson.project_source_root() / 'hw/display/virtio-dmabuf.c'],
++    'test-virtio-dmabuf': ['../../hw/display/virtio-dmabuf.c'],
+     'test-qmp-cmds': [testqapi],
+     'test-xbzrle': [migration],
      'test-util-sockets': ['socket-helpers.c'],
      'test-base64': [],
      'test-bufferiszero': [],
@@ -38,6 +41,3 @@ index 228a21d03c..272fb4c6ca 100644
      'test-vmstate': [migration, io],
      'test-yank': ['socket-helpers.c', qom, io, chardev]
    }
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu_9.0.2.bb b/meta/recipes-devtools/qemu/qemu_9.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_9.0.2.bb
rename to meta/recipes-devtools/qemu/qemu_9.1.0.bb

