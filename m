Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873A1C7EE31
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 19:52:21 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.5131.1750967535179612590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 12:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pc1Z5wMc;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d3f72391so13943055e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 12:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750967533; x=1751572333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wE+3W9LHITH8+GkQeKFt6g3cs/yTAbp4xErLDb7dYBw=;
        b=Pc1Z5wMcS9MGa0J1MmiLVusCjykRKYoiX/Uiyh5wo8DtbNbYGCsiZx1Or9qJQaUa6I
         KcyfI7r01dozQkrJHSnvX1neqyM2I14Yz0PsjaSP58e3pLgFcJx75usv1x6uUZz3ZiIj
         mHEXS1d+D337Fr74Cua9PmFSBxPGcUsUg6I9hyzcCrZynl/CS7Ma4SjwqLV06GZE/Q4p
         dqM7q1kz3jFoQKA5tBxokbNHK6th804ZY1glJmmiUA7Nh+HsqcnzH+fyc87H6tNy0EHS
         4ioHBWugkbEkicXGpyQD7kfctwYsqdxpLEM5RhMZwobQEgWXWJFneJuspyWV0j71WWIG
         9tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750967533; x=1751572333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wE+3W9LHITH8+GkQeKFt6g3cs/yTAbp4xErLDb7dYBw=;
        b=eQ0zxXFPWpT/ws2Dh2VT7H/2Shp3dmmYpPaRwDjyhSOcKLc+M4tHhmoIOdZXsKmrZx
         6ai8l8iAKGWtviI7G1fTmU4iq83RLVMbDOX7f+leLkdUrAgoTqWmpFXBvZBc2jwJVRJs
         UM6A5k1U26eFZjcoJOZTMpEL0VDnq0FTHQrv7ueNZ8DvVgnEqz1ulAtj5iERfobyAMMu
         t9J1dnn7w42DrLRqd4RmDZq99Maxq+o3ZLzUlmzGviAyPkygmORj1uidWfpFBWuh3i0X
         D3Z8wTANjd1XJfEHXEJOifg3F4Amm3Mq0hGXiSGpzjXZg/2XG0t0b8Q2EMo5oBI7Sg6A
         EUPw==
X-Gm-Message-State: AOJu0Yx8ivNk6VQsW6Ln0aG3rmnLzg6pyD4g5AvTzYA0IukM04rsmzep
	U4DtKM0bF54r/05s1HEsOBOScVnPHWQvgElH5/n68gocmaK9RcOOAhY7Jpu6lw==
X-Gm-Gg: ASbGncuXQlp0dymlsXu6h9vJIjuue9Kvt+Nc7MFwMHyeooBq2Iy2fs1Tjt77L24tk7G
	d1F7UgLY3c8w2MvHm3ya1qtQmiDbE0lH4UjKyengQanTy3sMfZTApf8KqolUONAoSy3iU2siOk2
	ifgWaMvPend5dcx4WVgrBoN/BUElgdXOKVqmYft3cqcIH+P0Jk7nTIefQFL81/F73U3ctf88eai
	y9mYh8b1reqwb2m0FnKIaHFmeYO6ipfQwzSmOyV/VRqYema+ZRw8aZdprYPgSFsOyoHlRHcpGCH
	/1UEo/XAgZ3cjrWiIcIGWW20K+E/WuKEp2TlYXeXhgHxip42PmDdUVRZ+qRJuJCt7QETyVDve9O
	nna+pKl3YhhE=
X-Google-Smtp-Source: AGHT+IFZwEyOHt/GL/PVqddPyoqXLX8XiiVGJVMC6gueB8TEnL36GBI5LMQbQCUvAitS+AIVwx9g2g==
X-Received: by 2002:a05:600c:4ed3:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4538f244121mr3740915e9.4.1750967532735;
        Thu, 26 Jun 2025 12:52:12 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ba553sm57389415e9.31.2025.06.26.12.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 12:52:12 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.1
Date: Thu, 26 Jun 2025 19:52:05 +0000
Message-ID: <20250626195205.1036229-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 19:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219367

Handle CVE-2025-3277, CVE-2025-29087 and CVE-2025-29088.

This update includes major change in how it is built.
Instead of autotools, autosetup is used.

Autosetup (https://msteveb.github.io/autosetup/) claims to be
* Replacement for autoconf in many situations
However it also claims NOT to
* Intended to replace all possible uses of autoconf
This means that some autoconf features are not available.

Recipe changes:
* stop inheriting autotools and define B, do_configure and do_install
* depend on zlib unconditionally, autoconf cannot be preconfigured in
  similar way as autotools
* update packageconfig options to match new syntax
* libedit is detected with ncurses linking options (as seen in
  do_configure log)
* backport rpaths fix
* define soname to avoid file-rdeps QA error due to wrong library name
* add hack to force cross-compilation in native case to link against
  zlib in sysroot and thus avoid crashes when sstate-cache from different
  distro is used
* clean B for do_configure as the new Makefiles do not seem to properly
  retrigger build if configuration changes

Kudos to Peter Marko for the initial work on upgrading SQLite

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3.inc       | 43 ++++++++++---
 ...rpath-configure-script-flag-to-addre.patch | 60 +++++++++++++++++++
 .../{sqlite3_3.48.0.bb => sqlite3_3.50.1.bb}  |  4 +-
 3 files changed, 98 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.48.0.bb => sqlite3_3.50.1.bb} (53%)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 28a33282ae..3251d310fb 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -14,34 +14,37 @@ def sqlite_download_version(d):
 SQLITE_PV = "${@sqlite_download_version(d)}"
 
 S = "${UNPACKDIR}/sqlite-autoconf-${SQLITE_PV}"
+B = "${WORKDIR}/build"
 
-UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
+UPSTREAM_CHECK_URI = "https://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
 
 CVE_PRODUCT = "sqlite"
 
-inherit autotools pkgconfig siteinfo
+inherit pkgconfig siteinfo
+
+# zlib is autodetected and gets to sysroots as transitive dependency, make this deterministic
+DEPENDS = "zlib"
 
 # enable those which are enabled by default in configure
 PACKAGECONFIG ?= "fts4 fts5 rtree dyn_ext"
 PACKAGECONFIG:class-native ?= "fts4 fts5 rtree dyn_ext"
 
-PACKAGECONFIG[editline] = "--enable-editline,--disable-editline,libedit"
-PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline ncurses"
+PACKAGECONFIG[editline] = "--enable-editline --with-readline-header=${includedir}/editline/readline.h,--disable-editline,libedit ncurses"
+PACKAGECONFIG[readline] = "--enable-readline --with-readline-header=${includedir}/readline/readline.h,--disable-readline,readline ncurses"
 PACKAGECONFIG[fts3] = "--enable-fts3,--disable-fts3"
 PACKAGECONFIG[fts4] = "--enable-fts4,--disable-fts4"
 PACKAGECONFIG[fts5] = "--enable-fts5,--disable-fts5"
 PACKAGECONFIG[rtree] = "--enable-rtree,--disable-rtree"
 PACKAGECONFIG[session] = "--enable-session,--disable-session"
-PACKAGECONFIG[dyn_ext] = "--enable-dynamic-extensions,--disable-dynamic-extensions"
-PACKAGECONFIG[zlib] = ",,zlib"
-
-CACHED_CONFIGUREVARS += "${@bb.utils.contains('PACKAGECONFIG', 'zlib', '', 'ac_cv_search_deflate=no',d)}"
+PACKAGECONFIG[dyn_ext] = "--enable-load-extension,--disable-load-extension"
 
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-threadsafe \
+    --disable-rpath \
     --disable-static-shell \
+    --soname=${PV} \
 "
 
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
@@ -65,4 +68,28 @@ FILES:lib${BPN}-staticdev = "${libdir}/lib*.a"
 
 AUTO_LIBNAME_PKGS = "${MLPREFIX}lib${BPN}"
 
+do_configure() {
+    ${S}/configure \
+        --build=${BUILD_SYS} \
+        --host=${TARGET_SYS} \
+        --prefix=${prefix} \
+        --bindir=${bindir} \
+        --libdir=${libdir} \
+        --includedir=${includedir} \
+        --mandir=${mandir} \
+        ${EXTRA_OECONF} \
+        ${PACKAGECONFIG_CONFARGS}
+}
+do_configure[cleandirs] = "${B}"
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+
+    # binaries are stripped during installation when not cross-compiling, take the unstripped ones instead
+    if [ "${BUILD_SYS}" = "${TARGET_SYS}" ]; then
+        install -m 0644 ${B}/sqlite3 ${D}${bindir}
+        install -m 0644 ${B}/libsqlite3.so ${D}${libdir}/libsqlite3.so.${PV}
+    fi
+}
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
new file mode 100644
index 0000000000..9625b3045d
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
@@ -0,0 +1,60 @@
+From 509f5574267c8353a10ff81e96d8393248810b80 Mon Sep 17 00:00:00 2001
+From: stephan <stephan@noemail.net>
+Date: Sun, 22 Jun 2025 22:48:11 +0000
+Subject: [PATCH] Add the --disable-rpath configure script flag to address
+ [forum:13cac3b56516f849 | forum post 13cac3b56516f849].
+
+FossilOrigin-Name: a59d9bb25e518f5d79f654615b92f6c50cfb704b5abee0f820912644b89366c5
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/87c807c6dd4df67328919fa28e89a06839e634fe]
+Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
+---
+ autosetup/sqlite-config.tcl | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
+index 85fe414382..8409dbdd81 100644
+--- a/autosetup/sqlite-config.tcl
++++ b/autosetup/sqlite-config.tcl
+@@ -334,8 +334,8 @@ proc sqlite-configure {buildMode configScript} {
+           => {Link the sqlite3 shell app against the DLL instead of embedding sqlite3.c}
+       }
+       {canonical autoconf} {
+-        # A potential TODO without a current use case:
+-        #rpath=1 => {Disable use of the rpath linker flag}
++        rpath=1 => {Disable use of the rpath linker flag}
++
+         # soname: https://sqlite.org/src/forumpost/5a3b44f510df8ded
+         soname:=legacy
+           => {SONAME for libsqlite3.so. "none", or not using this flag, sets no
+@@ -2119,7 +2119,6 @@ proc sqlite-handle-tcl {} {
+ ########################################################################
+ # Handle the --enable/disable-rpath flag.
+ proc sqlite-handle-rpath {} {
+-  proj-check-rpath
+   # autosetup/cc-shared.tcl sets the rpath flag definition in
+   # [get-define SH_LINKRPATH], but it does so on a per-platform basis
+   # rather than as a compiler check. Though we should do a proper
+@@ -2128,12 +2127,13 @@ proc sqlite-handle-rpath {} {
+   # for which sqlite-env-is-unix-on-windows returns a non-empty
+   # string.
+ 
+-#  if {[proj-opt-truthy rpath]} {
+-#    proj-check-rpath
+-#  } else {
+-#    msg-result "Disabling use of rpath."
+-#    define LDFLAGS_RPATH ""
+-#  }
++  # https://sqlite.org/forum/forumpost/13cac3b56516f849
++  if {[proj-opt-truthy rpath]} {
++    proj-check-rpath
++  } else {
++    msg-result "Disabling use of rpath."
++    define LDFLAGS_RPATH ""
++  }
+ }
+ 
+ ########################################################################
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.50.1.bb
similarity index 53%
rename from meta/recipes-support/sqlite/sqlite3_3.48.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.50.1.bb
index bd2ac6614d..bf2e883082 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.50.1.bb
@@ -4,5 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
+SRC_URI[sha256sum] = "00a65114d697cfaa8fe0630281d76fd1b77afcd95cd5e40ec6a02cbbadbfea71"
+
+SRC_URI += "file://0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch"
 
-- 
2.43.0


