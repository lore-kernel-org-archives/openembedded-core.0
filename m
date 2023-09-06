Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9514BEB8FAD
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:41:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.292.1693968057863853420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=TFkPl5B4;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693968059; x=1725504059;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Gq+/rV68d1lW1xJaa7649nVVpAsjfNQMAMBNz7X7mxg=;
  b=TFkPl5B4lDgDj5AlgoPrxKDaP2HMFP2EGQ/We0CcfWiXi+1naC5Yhazq
   LojthACgKWRqqn1CggDzq0oNcPlFA6LLryBxi7MLd4I9XybfCf1E6T7Fp
   p65E4XGUataWvpojzGsb+N9y+2tpg59kUPB8N4+beVLtJPpAaLQveltJK
   6sBp1PcyTq0RbqxbR5dl29kA6ISN10+CIfr/gaEME3+HlZ8PqR3ghpKrj
   eAUDjP91wNyKRnkFl0MFTZBJ536EjAqATtXIRcbtol9qoU62J3A3CAozj
   zPsh9Xw2/TOUsT3rtyRH6kiHULu4HZxeX4WTjWKDjK56yZOwlEfGyVV63
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407953263"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="407953263"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 19:40:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776408657"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="776408657"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 05 Sep 2023 19:40:58 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 4/5] nasm: update 2.15.03 -> 2.15.05
Date: Wed,  6 Sep 2023 10:21:17 +0800
Message-Id: <20230906022118.1593547-4-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230906022118.1593547-1-chee.yang.lee@intel.com>
References: <20230906022118.1593547-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 02:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187271

From: Alexander Kanavin <alex.kanavin@gmail.com>

Use autotools-brokensep as new version needs that.

upgrade include fix for CVE-2020-21686 and CVE-2022-29654

(cherry picked from commit c9c724ffa36757b56e70bc8d7b880c0c5777b153)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../0002-Add-debug-prefix-map-option.patch    | 42 +++++++++----------
 .../nasm/{nasm_2.15.03.bb => nasm_2.15.05.bb} |  4 +-
 2 files changed, 22 insertions(+), 24 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.15.03.bb => nasm_2.15.05.bb} (84%)

diff --git a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
index f788e0fd43..9f4c8dc0bd 100644
--- a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
+++ b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
@@ -1,4 +1,4 @@
-From bb4e42ad3a0cdd23a1d1797e6299c76b474867c0 Mon Sep 17 00:00:00 2001
+From 81d6519499dcfebe7d21e65e002a8885a4e8d852 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 13:12:17 -0600
 Subject: [PATCH] Add --debug-prefix-map option
@@ -11,7 +11,7 @@ Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
 
 ---
- asm/nasm.c              | 26 +++++++++++++++++++++++++-
+ asm/nasm.c              | 24 ++++++++++++++++++++++++
  include/nasmlib.h       |  9 +++++++++
  nasm.txt                |  4 ++++
  nasmlib/filename.c      | 20 ++++++++++++++++++++
@@ -23,34 +23,32 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  stdlib/strlcat.c        |  2 +-
  test/elfdebugprefix.asm |  6 ++++++
  test/performtest.pl     | 12 ++++++++++--
- 12 files changed, 83 insertions(+), 10 deletions(-)
+ 12 files changed, 82 insertions(+), 9 deletions(-)
  create mode 100644 test/elfdebugprefix.asm
 
 diff --git a/asm/nasm.c b/asm/nasm.c
-index a0e1719..fc6c62e 100644
+index e5ae89a..7a7f8b4 100644
 --- a/asm/nasm.c
 +++ b/asm/nasm.c
-@@ -938,7 +938,8 @@ enum text_options {
-     OPT_LIMIT,
+@@ -939,6 +939,7 @@ enum text_options {
      OPT_KEEP_ALL,
      OPT_NO_LINE,
--    OPT_DEBUG
-+    OPT_DEBUG,
-+    OPT_DEBUG_PREFIX_MAP
+     OPT_DEBUG,
++    OPT_DEBUG_PREFIX_MAP,
+     OPT_REPRODUCIBLE
  };
  enum need_arg {
-     ARG_NO,
-@@ -970,6 +971,7 @@ static const struct textargs textopts[] = {
+@@ -971,6 +972,7 @@ static const struct textargs textopts[] = {
      {"keep-all", OPT_KEEP_ALL, ARG_NO, 0},
      {"no-line",  OPT_NO_LINE, ARG_NO, 0},
      {"debug",    OPT_DEBUG, ARG_MAYBE, 0},
 +    {"debug-prefix-map", OPT_DEBUG_PREFIX_MAP, true, 0},
+     {"reproducible", OPT_REPRODUCIBLE, ARG_NO, 0},
      {NULL, OPT_BOGUS, ARG_NO, 0}
  };
- 
-@@ -1332,6 +1334,26 @@ static bool process_arg(char *p, char *q, int pass)
-                 case OPT_DEBUG:
-                     debug_nasm = param ? strtoul(param, NULL, 10) : debug_nasm+1;
+@@ -1337,6 +1339,26 @@ static bool process_arg(char *p, char *q, int pass)
+                 case OPT_REPRODUCIBLE:
+                     reproducible = true;
                      break;
 +                case OPT_DEBUG_PREFIX_MAP: {
 +                    struct debug_prefix_list *d;
@@ -75,7 +73,7 @@ index a0e1719..fc6c62e 100644
                  case OPT_HELP:
                      help(stdout);
                      exit(0);
-@@ -2297,6 +2319,8 @@ static void help(FILE *out)
+@@ -2304,6 +2326,8 @@ static void help(FILE *out)
          "    -w-x          disable warning x (also -Wno-x)\n"
          "    -w[+-]error   promote all warnings to errors (also -Werror)\n"
          "    -w[+-]error=x promote warning x to errors (also -Werror=x)\n"
@@ -85,7 +83,7 @@ index a0e1719..fc6c62e 100644
  
      fprintf(out, "       %-20s %s\n",
 diff --git a/include/nasmlib.h b/include/nasmlib.h
-index e9bfbcc..98fc653 100644
+index 438178d..4c3e90d 100644
 --- a/include/nasmlib.h
 +++ b/include/nasmlib.h
 @@ -250,10 +250,19 @@ int64_t readstrnum(char *str, int length, bool *warn);
@@ -181,10 +179,10 @@ index 54b22f8..c4a412c 100644
  
  static void as86_cleanup(void)
 diff --git a/output/outcoff.c b/output/outcoff.c
-index bcd9ff3..15bfcf3 100644
+index 58fa024..14baf7b 100644
 --- a/output/outcoff.c
 +++ b/output/outcoff.c
-@@ -1095,14 +1095,14 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
+@@ -1072,14 +1072,14 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
  
  static void coff_write_symbols(void)
  {
@@ -215,7 +213,7 @@ index 61af020..1292958 100644
      nsects = sectlen = 0;
      syms = saa_init((int32_t)sizeof(struct elf_symbol));
 diff --git a/output/outieee.c b/output/outieee.c
-index 4cc0f0f..2468724 100644
+index 6d6d4b2..cdb8333 100644
 --- a/output/outieee.c
 +++ b/output/outieee.c
 @@ -207,7 +207,7 @@ static void ieee_unqualified_name(char *, char *);
@@ -228,10 +226,10 @@ index 4cc0f0f..2468724 100644
      fpubhead = NULL;
      fpubtail = &fpubhead;
 diff --git a/output/outobj.c b/output/outobj.c
-index 0d4d311..d8dd6a0 100644
+index 56b43f9..fefea94 100644
 --- a/output/outobj.c
 +++ b/output/outobj.c
-@@ -638,7 +638,7 @@ static enum directive_result obj_directive(enum directive, char *);
+@@ -644,7 +644,7 @@ static enum directive_result obj_directive(enum directive, char *);
  
  static void obj_init(void)
  {
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.03.bb b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
similarity index 84%
rename from meta/recipes-devtools/nasm/nasm_2.15.03.bb
rename to meta/recipes-devtools/nasm/nasm_2.15.05.bb
index fc7046244a..43088baf71 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
@@ -10,11 +10,11 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0002-Add-debug-prefix-map-option.patch \
            "
 
-SRC_URI[sha256sum] = "04e7343d9bf112bffa9fda86f6c7c8b120c2ccd700b882e2db9f57484b1bd778"
+SRC_URI[sha256sum] = "3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa6f35668bee2fd0"
 
 EXTRA_AUTORECONF_append = " -I autoconf/m4"
 
-inherit autotools
+inherit autotools-brokensep
 
 BBCLASSEXTEND = "native"
 
-- 
2.37.3


