Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663B7C54736
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.9505.1724319334073983837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D6eXIDXB;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5bf006f37daso985021a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319332; x=1724924132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckK7VtxVrhLPbXAVzp5psBx3d3q405nmyJ66UfTjF1g=;
        b=D6eXIDXBLJeCQ/yiT5WG6e9+ED7FxBssGRxWXwQWT26rNfU63kue/cprqQVMnuSB4E
         CHhiUBt/tPp/jV93dAp97YXIw7eQK2qubbuxiobgN79OjlaTX1gvoD5eGlYhadmV2wuB
         CyEKaLvYjCTaMCh6NmQ86+7oHK8OTIi3MXPWRtO2ZPc1qzAj/OwnGQ6CSgmg4vleswN4
         RrN+vs5vOCW+deZyE0t/QMx95TgWYWLMLtJlN+QenXzrQ+wuNiyBysmi9XpGpQHGqcRX
         SvZ4MRXPeMSiv5/zN5OzOrrt0r9bgovmzry5GgWJu2ha1mixdnAj5/1L+BHy2A0bW5ch
         Z+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319332; x=1724924132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckK7VtxVrhLPbXAVzp5psBx3d3q405nmyJ66UfTjF1g=;
        b=OdlBCeHG24rhuNjj3Gv3Z4ZLIDFIs3Z8Vz2TGSD5QM+df2P+zetmyPwRhhHvtark7U
         dse0Js4fZSps/KHuN87/FodlpxPVRa3d87tzFRY48Loewwwa5R7osmBk+rsuKHK0PUd5
         TwQsgEtAVBZ99wzxcexjOLuF1hk5XD2hqHQmRDaRSVqELtwI9KcO1I84CZxmsctcAePr
         MCdujXWKv42SMdXrSgzSDkJxR+kE/pdQ8TpgcVHB77z2SVMg2SKBPwAUm0uleN8nSmBk
         pIKW8UqpZLMgJTjIzg2m+xMgLEkf6q+Pbfs+mAT4cpJ5zejFe8MfDjiyBh886IbVg562
         WexA==
X-Gm-Message-State: AOJu0Yy8ascpoY3q/NSDOHdeu4K4FRMKwYuInrCXae3v70z5SshST43l
	v7aWctZIAsInA+JdJ8SNb6p96+zbtm0xr2OTrz/i8ZINui0nDZ4bI0OfzA==
X-Google-Smtp-Source: AGHT+IFs5XDXn5P9Y1stFmDFL7LqGIte6pebAupmzawKp9/mcZ6W0tHd67GSXahCpy7/NwoAqy9EtA==
X-Received: by 2002:a05:6402:520d:b0:5be:d758:485f with SMTP id 4fb4d7f45d1cf-5bf2bfeb5e0mr2095153a12.7.1724319332213;
        Thu, 22 Aug 2024 02:35:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/32] kmod: upgrade 32 -> 33
Date: Thu, 22 Aug 2024 11:35:00 +0200
Message-Id: <20240822093521.36790-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203626

From: Alexander Kanavin <alex@linutronix.de>

Disable manpages, as they require scdoc, which is not currently
available in core (and adjust a related selftest).

Drop 0001-Use-portable-implementation-for-basename-API.patch
as upstream fixed the issue differently.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py |   8 +-
 ...able-implementation-for-basename-API.patch | 136 ------------------
 .../kmod/kmod/avoid_parallel_tests.patch      |  10 +-
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch |   9 +-
 .../kmod/{kmod_32.bb => kmod_33.bb}           |   7 +-
 5 files changed, 14 insertions(+), 156 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
 rename meta/recipes-kernel/kmod/{kmod_32.bb => kmod_33.bb} (94%)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index dc88c222bdc..74811d2c0aa 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -319,7 +319,7 @@ SKIP_RECIPE[busybox] = "Don't build this"
         """
         config = """
 DISTRO_FEATURES:append = " api-documentation"
-CORE_IMAGE_EXTRA_INSTALL = "man-pages kmod-doc"
+CORE_IMAGE_EXTRA_INSTALL = "man-pages"
 """
         self.write_config(config)
         bitbake("core-image-minimal")
@@ -330,7 +330,7 @@ CORE_IMAGE_EXTRA_INSTALL = "man-pages kmod-doc"
             self.assertEqual(status, 1, 'Failed to run apropos: %s' % (output))
             self.assertIn("iso_8859_15", output)
 
-            # This manpage is provided by kmod
-            status, output = qemu.run_serial("man --pager=cat modprobe")
+            # This manpage is provided by man-pages
+            status, output = qemu.run_serial("man --pager=cat intro")
             self.assertEqual(status, 1, 'Failed to run man: %s' % (output))
-            self.assertIn("force-modversion", output)
+            self.assertIn("introduction to user commands", output)
diff --git a/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch b/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
deleted file mode 100644
index 6a7f9ded4fa..00000000000
--- a/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-From 721ed6040c7aa47070faf6378c433089e178bd43 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Dec 2023 17:35:59 -0800
-Subject: [PATCH] Use portable implementation for basename API
-
-musl has removed the non-prototype declaration of basename from
-string.h [1] which now results in build errors with clang-17+ compiler
-
-Implement GNU basename behavior using strchr which is portable across libcs
-
-Fixes
-../git/tools/kmod.c:71:19: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-71 | "Commands:\n", basename(argv[0]));
-| ^
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://github.com/kmod-project/kmod/pull/32]
-
-Suggested-by: Rich Felker
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libkmod/libkmod-config.c | 2 +-
- shared/util.c            | 4 ++--
- shared/util.h            | 7 +++++++
- testsuite/testsuite.c    | 2 +-
- tools/depmod.c           | 2 +-
- tools/kmod.c             | 4 ++--
- 6 files changed, 14 insertions(+), 7 deletions(-)
-
-diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
-index e83621b..8aa555a 100644
---- a/libkmod/libkmod-config.c
-+++ b/libkmod/libkmod-config.c
-@@ -794,7 +794,7 @@ static int conf_files_insert_sorted(struct kmod_ctx *ctx,
- 	bool is_single = false;
- 
- 	if (name == NULL) {
--		name = basename(path);
-+		name = gnu_basename(path);
- 		is_single = true;
- 	}
- 
-diff --git a/shared/util.c b/shared/util.c
-index e2bab83..0e16670 100644
---- a/shared/util.c
-+++ b/shared/util.c
-@@ -172,9 +172,9 @@ char *modname_normalize(const char *modname, char buf[static PATH_MAX], size_t *
- 
- char *path_to_modname(const char *path, char buf[static PATH_MAX], size_t *len)
- {
--	char *modname;
-+	const char *modname;
- 
--	modname = basename(path);
-+	modname = gnu_basename(path);
- 	if (modname == NULL || modname[0] == '\0')
- 		return NULL;
- 
-diff --git a/shared/util.h b/shared/util.h
-index c4a3916..073dc5a 100644
---- a/shared/util.h
-+++ b/shared/util.h
-@@ -5,6 +5,7 @@
- #include <stdbool.h>
- #include <stdlib.h>
- #include <stdio.h>
-+#include <string.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <time.h>
-@@ -76,6 +77,12 @@ do {						\
- 	__p->__v = (val);			\
- } while(0)
- 
-+static _always_inline_ const char *gnu_basename(const char *s)
-+{
-+  const char *p = strrchr(s, '/');
-+  return p ? p+1 : s;
-+}
-+
- static _always_inline_ unsigned int ALIGN_POWER2(unsigned int u)
- {
- 	return 1 << ((sizeof(u) * 8) - __builtin_clz(u - 1));
-diff --git a/testsuite/testsuite.c b/testsuite/testsuite.c
-index 318343a..aafc987 100644
---- a/testsuite/testsuite.c
-+++ b/testsuite/testsuite.c
-@@ -70,7 +70,7 @@ static void help(void)
- 
- 	printf("Usage:\n"
- 	       "\t%s [options] <test>\n"
--	       "Options:\n", basename(progname));
-+	       "Options:\n", gnu_basename(progname));
- 
- 	for (itr = options, itr_short = options_short;
- 				itr->name != NULL; itr++, itr_short++)
-diff --git a/tools/depmod.c b/tools/depmod.c
-index 43fc354..cfb15b1 100644
---- a/tools/depmod.c
-+++ b/tools/depmod.c
-@@ -762,7 +762,7 @@ static int cfg_files_insert_sorted(struct cfg_file ***p_files, size_t *p_n_files
- 	if (name != NULL)
- 		namelen = strlen(name);
- 	else {
--		name = basename(dir);
-+		name = gnu_basename(dir);
- 		namelen = strlen(name);
- 		dirlen -= namelen + 1;
- 	}
-diff --git a/tools/kmod.c b/tools/kmod.c
-index 55689c0..df91e5c 100644
---- a/tools/kmod.c
-+++ b/tools/kmod.c
-@@ -68,7 +68,7 @@ static int kmod_help(int argc, char *argv[])
- 			"Options:\n"
- 			"\t-V, --version     show version\n"
- 			"\t-h, --help        show this help\n\n"
--			"Commands:\n", basename(argv[0]));
-+			"Commands:\n", gnu_basename(argv[0]));
- 
- 	for (i = 0; i < ARRAY_SIZE(kmod_cmds); i++) {
- 		if (kmod_cmds[i]->help != NULL) {
-@@ -156,7 +156,7 @@ static int handle_kmod_compat_commands(int argc, char *argv[])
- 	const char *cmd;
- 	size_t i;
- 
--	cmd = basename(argv[0]);
-+	cmd = gnu_basename(argv[0]);
- 
- 	for (i = 0; i < ARRAY_SIZE(kmod_compat_cmds); i++) {
- 		if (streq(kmod_compat_cmds[i]->name, cmd))
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
index 04a82048153..6db4fa7e97e 100644
--- a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
+++ b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From be6f82c54f694617c646ca1f8b5bcf93694e20ad Mon Sep 17 00:00:00 2001
+From 7a22abf188e5b688080bb1321a77588474114339 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Fri, 6 Sep 2013 21:11:57 +0000
 Subject: [PATCH] kmod: avoid parallel-tests
@@ -11,16 +11,15 @@ serial-tests is now required
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Inappropriate (disable feature incompatible with ptest)
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index ee72283..60980c0 100644
+index 2f1c525..7056aae 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -14,8 +14,8 @@ AC_USE_SYSTEM_EXTENSIONS
+@@ -14,7 +14,7 @@ AC_USE_SYSTEM_EXTENSIONS
  AC_SYS_LARGEFILE
  AC_PREFIX_DEFAULT([/usr])
  AM_MAINTAINER_MODE([enable])
@@ -28,5 +27,4 @@ index ee72283..60980c0 100644
 +AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules tar-pax no-dist-gzip dist-xz subdir-objects color-tests serial-tests])
  AM_SILENT_RULES([yes])
  LT_INIT([disable-static pic-only])
-
- AS_IF([test "x$enable_static" = "xyes"], [AC_MSG_ERROR([--enable-static is not supported by kmod])])
+ 
diff --git a/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch b/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
index a34ea466e8e..91d622b8c7b 100644
--- a/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
+++ b/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
@@ -1,4 +1,4 @@
-From dd59095f70f774f6d1e767010e25b35ef6db4c4b Mon Sep 17 00:00:00 2001
+From 90fb7bb85002cde39de3b3d2e2481933390832af Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 8 Dec 2023 22:35:45 +0000
 Subject: [PATCH] configure: set docdir in GTK_DOC_CHECK
@@ -16,10 +16,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index de01e08..67696c4 100644
+index 7056aae..d53a20c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -255,7 +255,7 @@ AS_IF([test "x$enable_coverage" = "xyes"], [
+@@ -236,7 +236,7 @@ AS_IF([test "x$enable_coverage" = "xyes"], [
  AM_CONDITIONAL([ENABLE_COVERAGE], [test "x$enable_coverage" = "xyes"])
  
  m4_ifdef([GTK_DOC_CHECK], [
@@ -28,6 +28,3 @@ index de01e08..67696c4 100644
  ], [
  AM_CONDITIONAL([ENABLE_GTK_DOC], false)])
  
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/kmod/kmod_32.bb b/meta/recipes-kernel/kmod/kmod_33.bb
similarity index 94%
rename from meta/recipes-kernel/kmod/kmod_32.bb
rename to meta/recipes-kernel/kmod/kmod_33.bb
index 1c4e5a94db7..15f42766f3b 100644
--- a/meta/recipes-kernel/kmod/kmod_32.bb
+++ b/meta/recipes-kernel/kmod/kmod_33.bb
@@ -13,14 +13,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tools/COPYING;md5=751419260aa954499f7abaabaa882bbe \
                    "
-inherit autotools bash-completion gtk-doc pkgconfig manpages update-alternatives
+inherit autotools bash-completion gtk-doc pkgconfig update-alternatives
 
-SRCREV = "41faa59711742c1476d59985011ee0f27ed91d30"
+SRCREV = "e193aeb99a04fb4b63ce47eb2c7f119db59446a0"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master;protocol=https \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
-           file://0001-Use-portable-implementation-for-basename-API.patch \
            file://gtkdocdir.patch \
            "
 
@@ -31,7 +30,7 @@ EXTRA_OECONF += "--enable-tools"
 PACKAGECONFIG ??= "zlib xz openssl"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[logging] = " --enable-logging,--disable-logging"
-PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
+PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, scdoc-native"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
 PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
-- 
2.39.2


