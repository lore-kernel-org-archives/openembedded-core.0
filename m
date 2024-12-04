Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753FCE77176
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:41 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.8175.1733294980693980760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gV6GWhhR;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385df8815fcso3213653f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294979; x=1733899779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GJlhiX87Gh6qi93RKZUcsbL4kPF6AlTzS+VotOzD8Q=;
        b=gV6GWhhRkm31FKDYerPl121aL0HF+uMNQqqoNj1+u6n8JuPMkL3JW5nZOUePNcEgc7
         jaF9fuM0nW14H2AKPKFq08GZQUW8TAWjizAndWTElTX7rF6g2ifY1lDneMLR8VCO9OeW
         fciVWdvPNX7SQGvej6CUOG+Gq7qTJBM3Zs+e5CXAlu1kPMpQWqCqUseAy6/5aSy0ElQd
         uEk3JXbyxRkSKtHPrgd3je4Xmv5WRzAmVjxfa9rNrTq19JI+to9Fp40oKa5NiqkafLrq
         sx7Jqt4fSBVt76dDbY3nUpu5zHxD5hjslksjVdumAJ/x+oqlFNoyhXBDDBxXTVIZwof1
         WhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294979; x=1733899779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GJlhiX87Gh6qi93RKZUcsbL4kPF6AlTzS+VotOzD8Q=;
        b=PCuzyBLpNyBjYF3ucdEJZEMFcWDOwRTzdPzZ1iZiyfnTsSLsn2Ej1UycvbJaBwKuXF
         dG3sZZbl0e/xPgkJBtZYBFoF5Xm40HS12jsu2+VKRHbOcPlIzM6+4QpuzPjoMSMrEACm
         Zu9p2V5UzygtipJZlextK8cmNxmUs7CG3Z8P1U17S1s1ni/5C/zJyn0xTOO6xRdTkXeF
         Cjw2YAPJYDAUcYbedtOmbgdNeO+nlKdv1x1Efj1lDfvzuQZFqXQp8Dbfv4ccCi+MPPe2
         CQvEcm68ZUSBWYhz3VOH+IFTP+OChveiP2AtaAuTJFW/VD84lftYsr0IMiPItI3ZeDOn
         Guvw==
X-Gm-Message-State: AOJu0YzSH+Y2pXOz+g9AWfSQ1LSb5Tvm7aQbXZV7GQQvs67p8hVGVsXA
	nrX/vhx2MF0MXczt/LNHacNlLN5U3iSJeRizTymqpf/hfAUxkpocATY8dA==
X-Gm-Gg: ASbGncs/J1Mjp3VDB3P9WqNF7qPyprGQMKnNGwmFmfHipk+8dLRGl2CmSwyiWb8EM5T
	NTpVOtErPrn16QhP1PJMtocLoYL8q4YQRQFTkKrJFhNFvoKK8k9he1pqDSuk+YfBpgUgzB830X2
	U2xLCZGFKUF1cCnenCJqS2AfIi3VgsWYs+lUhmRoEDMXREjgyo3WCLo9SRX7ZDA6+gfJ8g95gj4
	XDBhSGzz2Gbdl968ql6N0MknsNAG2oTSa4U5YcNuY6XXEzgiJHpmnAyPIIF2+Mv9CjIlPINnvqs
	+55t47NASYQ=
X-Google-Smtp-Source: AGHT+IHIsaRM5yjfuTfRPCQwk3xvO6Oh0ug6/wkDsBBM/zj5HmoXdgnfBEy4yhsJRT6CREJYk9+Q4g==
X-Received: by 2002:a05:6000:1787:b0:385:e411:c88e with SMTP id ffacd0b85a97d-385fd3ce061mr4379230f8f.9.1733294978836;
        Tue, 03 Dec 2024 22:49:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/37] elfutils: upgrade 0.191 -> 0.192
Date: Wed,  4 Dec 2024 07:48:53 +0100
Message-Id: <20241204064920.817016-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208239

From: Alexander Kanavin <alex@linutronix.de>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{elfutils_0.191.bb => elfutils_0.192.bb}  | 12 ++++---
 ...001-config-eu.am-do-not-force-Werror.patch | 34 ++++++++++++++++++
 ...01-debuginfod-Remove-unused-variable.patch | 34 ------------------
 .../elfutils/files/0001-dso-link-change.patch | 12 +++----
 ...libasm-may-link-with-libbz2-if-found.patch |  8 ++---
 ...-check-data_list.data.d.d_buf-before.patch |  6 ++--
 ...-skip-the-test-when-gcc-not-deployed.patch |  2 +-
 ...iles-fix-unused-variable-BUFFER_SIZE.patch | 36 -------------------
 ...m-compile-test_nlist-with-standard-C.patch |  6 ++--
 ...cvt_gunhash-if-dest-and-src-are-same.patch |  2 +-
 .../elfutils/files/0003-fixheadercheck.patch  |  2 +-
 .../elfutils/files/0003-musl-utils.patch      |  4 +--
 .../elfutils/files/ptest.patch                | 12 +++----
 13 files changed, 68 insertions(+), 102 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.191.bb => elfutils_0.192.bb} (95%)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-debuginfod-Remove-unused-variable.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
similarity index 95%
rename from meta/recipes-devtools/elfutils/elfutils_0.191.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.192.bb
index 95364cef975..f455178e16c 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "elfutils is a collection of utilities and libraries to read, crea
 SECTION = "base"
 LICENSE = "( GPL-2.0-or-later | LGPL-3.0-or-later ) & GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://debuginfod/debuginfod-client.c;endline=28;md5=f0a7c3170776866ee94e8f9225a6ad79 \
+                    file://debuginfod/debuginfod-client.c;endline=28;md5=6b7b0a4b25197d7f2e12b2f4aa1c86b8 \
                     "
 DEPENDS = "zlib virtual/libintl"
 DEPENDS:append:libc-musl = " argp-standalone fts musl-legacy-error musl-obstack"
@@ -20,13 +20,12 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
-           file://0001-debuginfod-Remove-unused-variable.patch \
-           file://0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch \
+           file://0001-config-eu.am-do-not-force-Werror.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] = "df76db71366d1d708365fc7a6c60ca48398f14367eb2b8954efc8897147ad871"
+SRC_URI[sha256sum] = "616099beae24aba11f9b63d86ca6cc8d566d968b802391334c91df54eab416b4"
 
 inherit autotools gettext ptest pkgconfig
 
@@ -46,7 +45,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'debuginfod', 'debugi
 PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
 PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
-PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl"
+PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl json-c"
 PACKAGECONFIG[debuginfod] = "--enable-debuginfod,--disable-debuginfod,libarchive sqlite3 libmicrohttpd"
 
 RDEPENDS:${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils iproute2-ss bsdtar gcc-symlinks binutils-symlinks libgcc-dev"
@@ -69,6 +68,7 @@ do_install_ptest() {
 	# copy the files which needed by the cases
 	TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint elfcompress elfclassify stack unstrip srcfiles"
 	install -d -m 755                       ${D}${PTEST_PATH}/src
+	install -d -m 755                       ${D}${PTEST_PATH}/config
 	install -d -m 755                       ${D}${PTEST_PATH}/lib
 	install -d -m 755                       ${D}${PTEST_PATH}/libelf
 	install -d -m 755                       ${D}${PTEST_PATH}/libdw
@@ -96,6 +96,7 @@ do_install_ptest() {
 	cp -r ${S}/tests/                       ${D}${PTEST_PATH}
 	cp -r ${B}/tests/*                      ${D}${PTEST_PATH}/tests
 	cp -r ${B}/config.h                     ${D}${PTEST_PATH}
+	cp -r ${B}/config/profile.sh            ${D}${PTEST_PATH}/config
 	cp -r ${B}/backends                     ${D}${PTEST_PATH}
 	cp -r ${B}/debuginfod                   ${D}${PTEST_PATH}
 	sed -i '/^Makefile:/c Makefile:'        ${D}${PTEST_PATH}/tests/Makefile
@@ -121,6 +122,7 @@ LICENSE:libasm = "GPL-2.0-or-later | LGPL-3.0-or-later"
 LICENSE:libdw = "GPL-2.0-or-later | LGPL-3.0-or-later"
 LICENSE:libdebuginfod = "GPL-2.0-or-later | LGPL-3.0-or-later"
 
+FILES:${PN} += "${datadir}/fish"
 FILES:${PN}-binutils = "\
     ${bindir}/eu-addr2line \
     ${bindir}/eu-ld \
diff --git a/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
new file mode 100644
index 00000000000..d4e141927f1
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
@@ -0,0 +1,34 @@
+From e169c3fc734be1783b3e1a4768dbec05fb64cb4f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 22 Nov 2024 12:50:48 +0100
+Subject: [PATCH] config/eu.am: do not force -Werror
+
+This is undesirable when compiler versions may not be the same
+as what upstream is using for their own testing.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ config/eu.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/config/eu.am b/config/eu.am
+index 0b7dab5..5e7a03f 100644
+--- a/config/eu.am
++++ b/config/eu.am
+@@ -99,7 +99,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
+ 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+ 	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
+ 	    $(USE_AFTER_FREE3_WARNING) \
+-	    $(if $($(*F)_no_Werror),,-Werror) \
+ 	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
+ 	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
+ 	    $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
+@@ -109,7 +108,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
+ 	   $(TRAMPOLINES_WARNING) \
+ 	   $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+ 	   $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
+-	   $(if $($(*F)_no_Werror),,-Werror) \
+ 	   $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
+ 	   $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
+ 	   $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-Remove-unused-variable.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-Remove-unused-variable.patch
deleted file mode 100644
index 81f49dbf216..00000000000
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-Remove-unused-variable.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c3502140e51886bffc6ae5cd256308e40e0cbb78 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Mar 2024 15:52:32 -0800
-Subject: [PATCH] debuginfod: Remove unused variable
-
-Recent commit acd9525e9 has removed all references to max_fds
-therefore remove it, moreover clang18 is happier
-
-| ../../elfutils-0.191/debuginfod/debuginfod.cxx:1448:8: error: private field 'max_fds' is not used [-Werror,-Wunused-private-field]
-|  1448 |   long max_fds;
-|       |        ^
-| 1 error generated.
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2024q1/006900.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- debuginfod/debuginfod.cxx | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
-index 560880f2..72617848 100644
---- a/debuginfod/debuginfod.cxx
-+++ b/debuginfod/debuginfod.cxx
-@@ -1445,7 +1445,6 @@ private:
- 
-   map<key,fdcache_entry> entries; // optimized for lookup
-   time_t last_cleaning;
--  long max_fds;
-   long max_mbs;
- 
- public:
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
index 4f7539bef2c..0eb532f3dd5 100644
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -1,4 +1,4 @@
-From 63070df4b0dc7af37a720915b5e6494204463c9a Mon Sep 17 00:00:00 2001
+From 7b0f78c86bf2e658649327fb3dd1b862f282c42e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:10:57 +0800
 Subject: [PATCH] dso link change
@@ -22,10 +22,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 1d592d4..853eda4 100644
+index 6bdf2df..3bcee3c 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -50,7 +50,7 @@ libdebuginfod =
+@@ -56,7 +56,7 @@ libdebuginfod =
  endif
  else
  libasm = ../libasm/libasm.so
@@ -35,11 +35,11 @@ index 1d592d4..853eda4 100644
  if LIBDEBUGINFOD
  libdebuginfod = ../debuginfod/libdebuginfod.so
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 9141074..ee49d07 100644
+index 76f1682..865a604 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -694,7 +694,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
+@@ -733,7 +733,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
+ libelf = ../libelf/libelf.a -lz $(zstd_LIBS) $(libeu)
  libasm = ../libasm/libasm.a
  else
 -libdw = ../libdw/libdw.so
diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
index a9f5e030fc0..6031b721fcb 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
@@ -1,4 +1,4 @@
-From 46d9d889a07fc9f9f089f800e5c0e895889c44ae Mon Sep 17 00:00:00 2001
+From 7bcee92c2006b7adad463be28cf4c3af21489cd2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 Oct 2017 22:30:46 -0700
 Subject: [PATCH] libasm may link with libbz2 if found
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 853eda4..da7f3b4 100644
+index 3bcee3c..18eed9a 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -40,7 +40,7 @@ EXTRA_DIST += make-debug-archive.in
+@@ -46,7 +46,7 @@ EXTRA_DIST += make-debug-archive.in
  CLEANFILES += make-debug-archive
  
  if BUILD_STATIC
@@ -28,7 +28,7 @@ index 853eda4..da7f3b4 100644
  libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
  libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
  if LIBDEBUGINFOD
-@@ -49,7 +49,7 @@ else
+@@ -55,7 +55,7 @@ else
  libdebuginfod =
  endif
  else
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
index 57e4b3890ab..1ee50588dce 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From 19d9e9d838e74e4a0a22f08ae03167380f8aa490 Mon Sep 17 00:00:00 2001
+From c4a26ff38182b289a1076bbef263e808b5e3aa97 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 16 Aug 2018 09:58:26 +0800
 Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before free it
@@ -19,10 +19,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf_end.c b/libelf/elf_end.c
-index 80f4d13..b103959 100644
+index da8f3a2..8557658 100644
 --- a/libelf/elf_end.c
 +++ b/libelf/elf_end.c
-@@ -169,14 +169,16 @@ elf_end (Elf *elf)
+@@ -170,14 +170,16 @@ elf_end (Elf *elf)
  		   architecture doesn't require overly stringent
  		   alignment the raw data buffer is the same as the
  		   one used for presenting to the caller.  */
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
index 096361e2150..2fc526372df 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -1,4 +1,4 @@
-From f9ab54454000fd210dbaa92cf516084d05060f9d Mon Sep 17 00:00:00 2001
+From d59d6fd13e4a7fe3fdca2a4ce1cd2def36356bb4 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Tue, 21 May 2019 15:20:34 +0800
 Subject: [PATCH] skip the test when gcc not deployed
diff --git a/meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch b/meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch
deleted file mode 100644
index b3032327a23..00000000000
--- a/meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From db51a55a8e3811d19265bf12d2ff715c6cf558b4 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <jose.quaresma@foundries.io>
-Date: Tue, 19 Mar 2024 10:17:59 +0000
-Subject: [PATCH] srcfiles: fix unused variable BUFFER_SIZE
-
-The const variable BUFFER_SIZE is used only on the zip_files
-function witch is only available with LIBARCHIVE.
-
-| ../../elfutils-0.191/src/srcfiles.cxx:81:18: error: unused variable 'BUFFER_SIZE' [-Werror,-Wunused-const-variable]
-|    81 | constexpr size_t BUFFER_SIZE = 8192;
-|       |                  ^~~~~~~~~~~
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=ef8a4b841aaf26326b8961a651dbe915d54d23e7]
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- src/srcfiles.cxx | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/srcfiles.cxx b/src/srcfiles.cxx
-index 892737cc..09d50f8d 100644
---- a/src/srcfiles.cxx
-+++ b/src/srcfiles.cxx
-@@ -78,7 +78,9 @@ ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
- /* Bug report address.  */
- ARGP_PROGRAM_BUG_ADDRESS_DEF = PACKAGE_BUGREPORT;
- 
-+#ifdef HAVE_LIBARCHIVE
- constexpr size_t BUFFER_SIZE = 8192;
-+#endif
- 
- /* Definitions of arguments for argp functions.  */
- static const struct argp_option options[] =
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index d410eb13d81..f3790a6d259 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From 2d4dfb814dda02193e49c9203147cf73e6d3f8b7 Mon Sep 17 00:00:00 2001
+From 34ae914b362c84ff0a96b8936beedb44a2e3f451 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 23 Jun 2020 07:49:35 +0000
 Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAGS
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 3bd8e58..370c6a8 100644
+index eed9bd4..5dd6e05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -103,7 +103,7 @@ endif
+@@ -104,7 +104,7 @@ endif
  test-nlist$(EXEEXT): test-nlist.c
  	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
  	  $(AM_CPPFLAGS) $(CPPFLAGS) \
diff --git a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index fa2282b8dd9..bf177cce4a3 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From d8f07a23d608b744dcc0592f9f32f258b186a77c Mon Sep 17 00:00:00 2001
+From bd78783254a7126d82eab26a2069b3a457b98e2e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:13:59 +0800
 Subject: [PATCH] Fix elf_cvt_gunhash if dest and src are same.
diff --git a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index e8b986e4ba4..a539396fd8b 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From 614f062b22e6da108643f8644a3e92a1108f2b9b Mon Sep 17 00:00:00 2001
+From da61b483072b7b0bfac1f034ad03972f5104a410 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:17:20 +0800
 Subject: [PATCH] fixheadercheck
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 230ea88f418..d8961f62936 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From aab5985a29bd7ab6e0b06eaab190b42a04e10f70 Mon Sep 17 00:00:00 2001
+From b1c956cd739f364c4a80381578ddaba43e36903b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -56,7 +56,7 @@ index f771b92..263de62 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
 diff --git a/src/strip.c b/src/strip.c
-index 6436443..1608496 100644
+index 403e0f6..738e948 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -45,6 +45,13 @@
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipes-devtools/elfutils/files/ptest.patch
index 2152875d63d..1de82ef32b3 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,4 @@
-From d49f6a135762ec1f1831d0e80b8df2a4269b0a66 Mon Sep 17 00:00:00 2001
+From 74dad3295f2b8dc06b7e6bb876bc4541e927ef47 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 16:37:48 +0100
 Subject: [PATCH] Changes to allow ptest to run standalone on target:
@@ -21,7 +21,7 @@ Upstream-Status: Inappropriate [oe specific]
  3 files changed, 3 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index bbe8673..488712b 100644
+index f191488..426a68f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -49,7 +49,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2024 The elfutils developers.])
@@ -34,20 +34,20 @@ index bbe8673..488712b 100644
  
  AM_SILENT_RULES([yes])
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index ee49d07..3bd8e58 100644
+index 865a604..eed9bd4 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -852,3 +852,5 @@ check: check-am coverage
+@@ -893,3 +893,5 @@ check: check-am coverage
  coverage:
  	-$(srcdir)/coverage.sh
  endif
 +oecheck:
 +	$(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS)
 diff --git a/tests/test-subr.sh b/tests/test-subr.sh
-index 411e5f2..a638ff9 100644
+index ea80cbe..7632d20 100644
 --- a/tests/test-subr.sh
 +++ b/tests/test-subr.sh
-@@ -91,12 +91,6 @@ installed_testrun()
+@@ -92,12 +92,6 @@ installed_testrun()
    program="$1"
    shift
    case "$program" in
-- 
2.39.5


