Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E354BC5321E
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 08:31:19 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.13803.1724142672405438917
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 01:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oUOs+YIr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724142673; x=1755678673;
  h=from:to:cc:subject:date:message-id;
  bh=7DJIXwsaP7u4TBnkyT8noyAgRSze/OepAsAHhrCmhgo=;
  b=oUOs+YIroA2Y4BXq1+cp82XjmvjikxRtVYydP2qPKvVHCaRVJJ37cGuU
   ZBvEpc6quIRyHtefsMn8RqR1BrRdMvVhMFylHlMgAynAIeC8VcGFSHxbb
   vtkxurNuOhJEbQCKG1HVhxokdQgb3N//mkMfexCdPxq9Dy7j4mrw4f2w6
   zT6HX8rcEsw8G/All38G2y7GL0MeW1ivzAXzlxWIs2PbIvuyc/xhee+Hw
   v3fPUKg95YndjAhuvm1hYeClM03ey7BmdPpppL2yuVJcrAcjKS/nGU/YU
   yfc0ybHWbUBa5/b4VoEvCzBijuMtvyb8+GaHpM2zuh0ElX2CLQNt9zY/G
   g==;
X-CSE-ConnectionGUID: J0E5QRx+TO2suWUZysf+9w==
X-CSE-MsgGUID: ZfKXZm/+QNS5u3ETuYKSVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="171133856"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="171133856"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 17:31:09 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F31FDC9443
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 17:31:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4406311C5B
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 17:31:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C67EDE2B1F
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 17:31:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6400C1A0002;
	Tue, 20 Aug 2024 16:31:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] kmod: upgrade 32 -> 33
Date: Tue, 20 Aug 2024 16:30:43 +0800
Message-Id: <1724142644-20746-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.006
X-TMASE-Result: 10--12.339500-10.000000
X-TMASE-MatchedRID: 82BO9bqjodKjz0nOeth/yTo39wOA02LhMVx/3ZYby79QZ//SkC0u0opb
	wG9fIuITCC8aAmGeO6lSDG72SpdbElromRa6X9R8v5rsfD7H2pn6DHtjrOvoOQfxTM57BPHDvwU
	evDt+uW40gGvDuBPXdC//MlDRqI8m9R7dwXny/beQJOFc+qyqK5avEiw1kTqHfAGf77cJ1+5qCG
	tWzyBwDOtxl5LuZTL3a+VO0woGBHAesEq1FYBLYZ1U1lojafr/yiKgKtIyB4p5tT/E8F0bYtlvG
	szx4amthnKpA5k8STEJSf4nh0R0pxRHYhNSCATT5JzEkxvZR/h+tO36GYDlsu12u3rNgchMVXFz
	93jC3xevELDLMqgVakusQE+B0D7cbin97rG5g5xZNYSHk3Zr0SLLJGCSgZKkSMg2Oe/b8EyZENK
	HekISQwgrlr7+3X3cSCxb0XT8nOtNrNthuybAE2K3N9p/OFh6U2fjZiNvIymQQMHLj9XFbJFjQn
	J9F0Di4aYaoqZxF9zcFPFR1xoqQh8TzIzimOwPbdTuPa9VRGvEQdG7H66TyKsQd9qPXhnJtcsE/
	u6ZQxvSVHXjZ6wT9rMbLQmZ+y3V40Ey+byYsPVxO20CCuTeJw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 08:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203551

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-portable-implementation-for-basename-API.patch
removed since it's included in 33

avoid_parallel_tests.patch
gtkdocdir.patch
refreshed for 33

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...able-implementation-for-basename-API.patch | 136 ------------------
 .../kmod/kmod/avoid_parallel_tests.patch      |  10 +-
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch |   9 +-
 .../kmod/{kmod_32.bb => kmod_33.bb}           |   3 +-
 4 files changed, 8 insertions(+), 150 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
 rename meta/recipes-kernel/kmod/{kmod_32.bb => kmod_33.bb} (96%)

diff --git a/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch b/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
deleted file mode 100644
index 6a7f9ded4f..0000000000
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
index 04a8204815..f7ebe184a3 100644
--- a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
+++ b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From be6f82c54f694617c646ca1f8b5bcf93694e20ad Mon Sep 17 00:00:00 2001
+From 94aa964b875b391ad03ff79ea36c82292d53bf17 Mon Sep 17 00:00:00 2001
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
index a34ea466e8..8aa2763d9c 100644
--- a/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
+++ b/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
@@ -1,4 +1,4 @@
-From dd59095f70f774f6d1e767010e25b35ef6db4c4b Mon Sep 17 00:00:00 2001
+From 1d6d57c2da502dfcc4f09356306177130ceceec9 Mon Sep 17 00:00:00 2001
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
similarity index 96%
rename from meta/recipes-kernel/kmod/kmod_32.bb
rename to meta/recipes-kernel/kmod/kmod_33.bb
index 1c4e5a94db..a4a3a6b088 100644
--- a/meta/recipes-kernel/kmod/kmod_32.bb
+++ b/meta/recipes-kernel/kmod/kmod_33.bb
@@ -15,12 +15,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools bash-completion gtk-doc pkgconfig manpages update-alternatives
 
-SRCREV = "41faa59711742c1476d59985011ee0f27ed91d30"
+SRCREV = "e193aeb99a04fb4b63ce47eb2c7f119db59446a0"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master;protocol=https \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
-           file://0001-Use-portable-implementation-for-basename-API.patch \
            file://gtkdocdir.patch \
            "
 
-- 
2.34.1


