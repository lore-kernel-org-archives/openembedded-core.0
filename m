Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D00C54722
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.12715.1724136737091045194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JD2ONE8K;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136737; x=1755672737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=138kAJjIRHr3E0a2Xoe0/I1IZtx5auBdAT1ovRFhfSE=;
  b=JD2ONE8Kypn8HGlIAZoW27WlU2VCnhPNPeSmXBV6JiilRkDyfOpanyej
   3pjdYqI+LH5t3j87sRxJ02NJ0sONZaUlwRyOKhqYqq3+djaaXbaiupqYB
   lOthQn6Rnlz2/AdM5J0HQlqGUxkn3ouZ7i3m0pCxiAqDw/zWbKaECj1cS
   Feb/w59hWB2HEn7Kf595eN+pD7oQHv12n+TR41wBbrU8RLbtdMaK4DKXZ
   PF37hRf8JDZihnPm/55GOO344qJROHr1fQaxT26OXx9t/Px75ALkRA3N0
   LE2vwt/sk9V7nWaygriai49hGUJkuO91KGM9GjgClKxxihjNVYL45l1Jr
   g==;
X-CSE-ConnectionGUID: +FqJlJ1sRhqMNF76LQ/5Pw==
X-CSE-MsgGUID: JhT3l+2kSJ238vtj/E8nrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="159075231"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="159075231"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:14 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D2296C2142
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 28798D7461
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A67A5216F50
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 513CC1A000C;
	Tue, 20 Aug 2024 14:52:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/24] kmod: upgrade 32 -> 33
Date: Tue, 20 Aug 2024 14:51:29 +0800
Message-Id: <1724136703-20023-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.005
X-TMASE-Result: 10--14.491700-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/yTo39wOA02LhYdZm+NnGVQffUZT83lbkEO79
	DJRUi35pm9L28Suig/jMau1T20usrn9JXYBaBfzuTuctSpiuWyUUi4Ehat0547V5fSMRD1zq52T
	VLUt3BXmeFuV/fTXEqAlJ/ieHRHSnFEdiE1IIBNO628cXbnOhT2vaomg0i4KNm4e2HT1oP/tjFr
	zDFNuGe8kO8WviWK4cdwmhLLIxW2cJtPHo4WMLBn84FZpy/6JV0bdjqKOoG3fHwEnu5Jwrbd+/T
	XmGXmfIwUvinrDLhqltASqs1hKkhEYaJmfFAOwGpKSqN+Z3dp49mZudjaoMibRPJs/q8vyU07za
	VZEg+DOw3kcq3o2mNIAy6p60ZV62fJ5/bZ6npdjiRhduhvElsqX8y2tPBLhQdqtv6npX0ZP8ryl
	ui43cTVhurXlzUTPoP+gn+FZ2MMTxjIOlcQ16ig==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203530

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-portable-implementation-for-basename-API.patch
avoid_parallel_tests.patch
gtkdocdir.patch
refreshed for 33

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...able-implementation-for-basename-API.patch | 50 +++++++------------
 .../kmod/kmod/avoid_parallel_tests.patch      | 10 ++--
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch |  9 ++--
 .../kmod/{kmod_32.bb => kmod_33.bb}           |  2 +-
 4 files changed, 26 insertions(+), 45 deletions(-)
 rename meta/recipes-kernel/kmod/{kmod_32.bb => kmod_33.bb} (98%)

diff --git a/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch b/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
index 6a7f9ded4f..57330ff2a6 100644
--- a/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
+++ b/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
@@ -1,4 +1,4 @@
-From 721ed6040c7aa47070faf6378c433089e178bd43 Mon Sep 17 00:00:00 2001
+From 1ea666f8a2384581b5a960020acb958310cae95b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 9 Dec 2023 17:35:59 -0800
 Subject: [PATCH] Use portable implementation for basename API
@@ -22,18 +22,18 @@ Suggested-by: Rich Felker
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  libkmod/libkmod-config.c | 2 +-
- shared/util.c            | 4 ++--
- shared/util.h            | 7 +++++++
+ shared/util.c            | 2 +-
+ shared/util.h            | 6 ++++++
  testsuite/testsuite.c    | 2 +-
  tools/depmod.c           | 2 +-
  tools/kmod.c             | 4 ++--
- 6 files changed, 14 insertions(+), 7 deletions(-)
+ 6 files changed, 12 insertions(+), 6 deletions(-)
 
 diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
-index e83621b..8aa555a 100644
+index 919f4ed..02aca03 100644
 --- a/libkmod/libkmod-config.c
 +++ b/libkmod/libkmod-config.c
-@@ -794,7 +794,7 @@ static int conf_files_insert_sorted(struct kmod_ctx *ctx,
+@@ -957,7 +957,7 @@ static int conf_files_insert_sorted(struct kmod_ctx *ctx,
  	bool is_single = false;
  
  	if (name == NULL) {
@@ -43,15 +43,12 @@ index e83621b..8aa555a 100644
  	}
  
 diff --git a/shared/util.c b/shared/util.c
-index e2bab83..0e16670 100644
+index 66a7622..c46af99 100644
 --- a/shared/util.c
 +++ b/shared/util.c
-@@ -172,9 +172,9 @@ char *modname_normalize(const char *modname, char buf[static PATH_MAX], size_t *
- 
- char *path_to_modname(const char *path, char buf[static PATH_MAX], size_t *len)
+@@ -160,7 +160,7 @@ char *path_to_modname(const char *path, char buf[static PATH_MAX], size_t *len)
  {
--	char *modname;
-+	const char *modname;
+ 	const char *modname;
  
 -	modname = basename(path);
 +	modname = gnu_basename(path);
@@ -59,18 +56,10 @@ index e2bab83..0e16670 100644
  		return NULL;
  
 diff --git a/shared/util.h b/shared/util.h
-index c4a3916..073dc5a 100644
+index 2a377dd..073dc5a 100644
 --- a/shared/util.h
 +++ b/shared/util.h
-@@ -5,6 +5,7 @@
- #include <stdbool.h>
- #include <stdlib.h>
- #include <stdio.h>
-+#include <string.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <time.h>
-@@ -76,6 +77,12 @@ do {						\
+@@ -77,6 +77,12 @@ do {						\
  	__p->__v = (val);			\
  } while(0)
  
@@ -84,10 +73,10 @@ index c4a3916..073dc5a 100644
  {
  	return 1 << ((sizeof(u) * 8) - __builtin_clz(u - 1));
 diff --git a/testsuite/testsuite.c b/testsuite/testsuite.c
-index 318343a..aafc987 100644
+index a567839..1af8702 100644
 --- a/testsuite/testsuite.c
 +++ b/testsuite/testsuite.c
-@@ -70,7 +70,7 @@ static void help(void)
+@@ -59,7 +59,7 @@ static void help(void)
  
  	printf("Usage:\n"
  	       "\t%s [options] <test>\n"
@@ -97,10 +86,10 @@ index 318343a..aafc987 100644
  	for (itr = options, itr_short = options_short;
  				itr->name != NULL; itr++, itr_short++)
 diff --git a/tools/depmod.c b/tools/depmod.c
-index 43fc354..cfb15b1 100644
+index 8b0a428..e8e3869 100644
 --- a/tools/depmod.c
 +++ b/tools/depmod.c
-@@ -762,7 +762,7 @@ static int cfg_files_insert_sorted(struct cfg_file ***p_files, size_t *p_n_files
+@@ -724,7 +724,7 @@ static int cfg_files_insert_sorted(struct cfg_file ***p_files, size_t *p_n_files
  	if (name != NULL)
  		namelen = strlen(name);
  	else {
@@ -110,10 +99,10 @@ index 43fc354..cfb15b1 100644
  		dirlen -= namelen + 1;
  	}
 diff --git a/tools/kmod.c b/tools/kmod.c
-index 55689c0..df91e5c 100644
+index d28ec7b..4e5c422 100644
 --- a/tools/kmod.c
 +++ b/tools/kmod.c
-@@ -68,7 +68,7 @@ static int kmod_help(int argc, char *argv[])
+@@ -50,7 +50,7 @@ static int kmod_help(int argc, char *argv[])
  			"Options:\n"
  			"\t-V, --version     show version\n"
  			"\t-h, --help        show this help\n\n"
@@ -122,7 +111,7 @@ index 55689c0..df91e5c 100644
  
  	for (i = 0; i < ARRAY_SIZE(kmod_cmds); i++) {
  		if (kmod_cmds[i]->help != NULL) {
-@@ -156,7 +156,7 @@ static int handle_kmod_compat_commands(int argc, char *argv[])
+@@ -138,7 +138,7 @@ static int handle_kmod_compat_commands(int argc, char *argv[])
  	const char *cmd;
  	size_t i;
  
@@ -131,6 +120,3 @@ index 55689c0..df91e5c 100644
  
  	for (i = 0; i < ARRAY_SIZE(kmod_compat_cmds); i++) {
  		if (streq(kmod_compat_cmds[i]->name, cmd))
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
similarity index 98%
rename from meta/recipes-kernel/kmod/kmod_32.bb
rename to meta/recipes-kernel/kmod/kmod_33.bb
index 1c4e5a94db..8ee9618982 100644
--- a/meta/recipes-kernel/kmod/kmod_32.bb
+++ b/meta/recipes-kernel/kmod/kmod_33.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools bash-completion gtk-doc pkgconfig manpages update-alternatives
 
-SRCREV = "41faa59711742c1476d59985011ee0f27ed91d30"
+SRCREV = "e193aeb99a04fb4b63ce47eb2c7f119db59446a0"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master;protocol=https \
            file://depmod-search.conf \
-- 
2.34.1


