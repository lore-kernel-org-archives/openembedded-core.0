Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.469.1589325621696055564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 16:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EfLlwdUT;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id b190so1374929pfg.6
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 16:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JkQ50q9ZLHxTVDdyNB49Msdwl+kVZ+BQvongiLMgPHc=;
        b=EfLlwdUTiPbH5+L6yE/RB6/cQM+LLEL97A/DWNF8g+OoRgzhPBg5eX6rbZXknVLzAa
         Imp9zM2xs4TlWZq9Ex74XcIJdPf5YZZKLx2Fq3UrOGzPXD1ptCZ2zKNUj0a5yZd6ZOcN
         xV7A8XHKOvmC0vWY8uzeW1mz4oGgSZ3chuWKvgqHMVHl8NEEnp/zCa9K4V1+Hvmhf3Yv
         ThKL69NnfQ7k55mdQPnezwyG6A/YxONE6zOwGV0mq7wm8q2hC7DsP7pZpPylqClYnPDE
         FVgfhg8/v4ukM0UnkYMmb+jfd0Cxvoq8egCxD/Pzc+4U6vuRdb4WKHm953xPsE2Mohcc
         79yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JkQ50q9ZLHxTVDdyNB49Msdwl+kVZ+BQvongiLMgPHc=;
        b=WmXvTikcgd1H0e+Mcud6Ew0w2vyVZlFzUerKIge3ExVHoG/d5nLauT8z1HeAZMOl/O
         lqxpL3PTdmXBCN1Fr7f4bBQQlBAS02kIWAS1eGcquigiwYTM8FADE017jrHYXyNO9Yd1
         XJlDyBp9B0kTFZ1HRW/cc+8fcEo2HQ6eicri6/BLrxQhsq3TWg9IU1ZX4iTqLFvxCTVj
         8Eu7yMfcE+KnDCvKVaIETbILmw2ZSaeb9ZntE3YBSpxm39BUb2PArki73wAODI7a3Ml9
         Ytg86cAuZ6HI+pghfDqElWcVVwPA+XcnTxGgxlN7654NwmzLAM8y8HYz35q7z8I4b2yZ
         5cTw==
X-Gm-Message-State: AGi0PuYT9nT5OGAyeOKz6FpSZLuoXhYUQRXgQzbWMHhkUX4ohAHDUPmn
	5UaHa19cJMU/M+6bZCNcE+JnyCr/64c=
X-Google-Smtp-Source: APiQypJnPB3fEJ8aj3cZtSvokSl1RDPviQAs1Chp6RzW7xaoo09VHbkmuE5XLg2p1p9+EltmpNEiTg==
X-Received: by 2002:a63:2b43:: with SMTP id r64mr21226219pgr.266.1589325620716;
        Tue, 12 May 2020 16:20:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8caf])
        by smtp.gmail.com with ESMTPSA id m19sm13679341pjv.30.2020.05.12.16.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 16:20:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glib-2.0: Fix stpcpy detection for mingw
Date: Tue, 12 May 2020 16:20:12 -0700
Message-Id: <20200512232012.2010078-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport an upstream patch to fix it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...etect-stpcpy-on-windows-platforms-on.patch | 53 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.64.2.bb |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Don-t-misdetect-stpcpy-on-windows-platforms-on.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Don-t-misdetect-stpcpy-on-windows-platforms-on.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Don-t-misdetect-stpcpy-on-windows-platforms-on.patch
new file mode 100644
index 0000000000..855bdfc0d9
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Don-t-misdetect-stpcpy-on-windows-platforms-on.patch
@@ -0,0 +1,53 @@
+From d4b1fd9cdb7ae07fa6be941ac95f97ece175fe55 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Martin=20Storsj=C3=B6?= <martin@martin.st>
+Date: Tue, 31 Mar 2020 23:54:17 +0300
+Subject: [PATCH] meson: Don't misdetect stpcpy on windows platforms on clang
+
+See https://github.com/mesonbuild/meson/issues/3672 and
+https://github.com/mesonbuild/meson/issues/5628 for explanations
+of cases where meson misdetects functions due to clang builtins (that
+always are available, regardless of whether the platform actually
+provides them).
+
+The same also happens on GCC 10, which added support for __has_builtin.
+
+Upstream-Status: Backport [https://github.com/GNOME/glib/commit/1b94bfbd72dbbfb696fa68f3742f40998096b438]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 72ca194..bbdac1c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -533,13 +533,23 @@ foreach f : functions
+   endif
+ endforeach
+ 
+-# Check that stpcpy() is usable; must use header
+-if cc.has_function('stpcpy', prefix : '#include <string.h>')
++# Check that stpcpy() is usable; must use header.
++# cc.has_function() in some cases (clang, gcc 10+) assumes that if the
++# compiler provides a builtin of the same name that the function exists, while
++# it's in fact not provided by any header or library. This is true for
++# stpcpy() on Windows using clang and gcc as well as posix_memalign() using
++# gcc on Windows. Skip these checks on Windows for now to avoid false
++# positives. See https://github.com/mesonbuild/meson/pull/7116,
++# https://github.com/mesonbuild/meson/issues/3672 and
++# https://github.com/mesonbuild/meson/issues/5628.
++# FIXME: Once meson no longer returns success for stpcpy() and
++# posix_memalign() on Windows using GCC and clang we can remove this.
++if host_system != 'windows' and cc.has_function('stpcpy', prefix : '#include <string.h>')
+   glib_conf.set('HAVE_STPCPY', 1)
+ endif
+ 
+ # Check that posix_memalign() is usable; must use header
+-if cc.has_function('posix_memalign', prefix : '#include <stdlib.h>')
++if host_system != 'windows' and cc.has_function('posix_memalign', prefix : '#include <stdlib.h>')
+   glib_conf.set('HAVE_POSIX_MEMALIGN', 1)
+ endif
+ 
+-- 
+2.26.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.64.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.64.2.bb
index 1a8e9d659e..d6207b5b1a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.64.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.64.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
+           file://0001-meson-Don-t-misdetect-stpcpy-on-windows-platforms-on.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.26.2

