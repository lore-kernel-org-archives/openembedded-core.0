Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDA5C7EE32
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:04 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.39289.1683653031361427637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ULUvWiGR;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9659c5b14d8so1001397166b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653033; x=1686245033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0d1aMhcNN5aaHGn+LLRwudCONysVNGffqF7WqQiAWg=;
        b=ULUvWiGRCkYgij3DeFeDx2CcVF0qMaCHjHOW5+swpUlDN8/b1WRIoIc6sE7dZL/7Sb
         zg9/fAriMH0FRGPyhTd9t75C2Fb0E6THECNlEXc2V3KRrFG5TuLS6PrM2VAOECV9cvJr
         kUDGTvwmbuNDZShPL4WNIi9rZ4ru5h1mvj10cj/MQcFhJOj9rQ+h3qk/8NFQsei/dcbV
         oLO/Bntsxn9kdq/BB/Hm2ZwjooPR+rark7zuHpqT/EfbfriZkCirazqpbDgy/+tFqHtb
         EHo38bqir+jdjqnZWXv72XNDWlH9jYM/2yJn3UeHNLzUVsstbvHpO21E/cqzVh89jWqT
         mlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653033; x=1686245033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0d1aMhcNN5aaHGn+LLRwudCONysVNGffqF7WqQiAWg=;
        b=SllZZV20Ho4PzfRIHaSz+ViOcwJuR9sKizHKUvvKcqwxqOhUX5RBbSYOAPMLjyIEPF
         4n7dxNJNOSFnq8sIfEMfUFK0RCnePW/DFF/Y0rBF2CB9AyNjv6Ni2AeA2Bzkujcjf8Bi
         6+oESekmSdoPg7o1n3187a/D5/GZkganAoxccyhRstAGgcnNSIs6frfMiJ6g70VK4kwf
         9WonQ16rFj1ZXV+qnB878HUP3QtVMm9OYsXruaCtoyb6yi9hA35gcavHcmXG5P4TxP5p
         3Qgik9rfnbHlX06SPtHEkvj0SpNanfGOEV6AV2hBz3We0tSI6leO4I+K6hY5n1A2llo8
         g+xw==
X-Gm-Message-State: AC+VfDw5TSKa5HZdMgwML4DvgfVRvAzoAHOIIraFvovE99Vv5kBkDNMa
	kliDy/JhgnA1af6CNrgjh5afPiIE7TQ=
X-Google-Smtp-Source: ACHHUZ57MxevJ3pmPkVC+A9Gdtwz3c0nzEqbcR8W/aKj27JW/BwdXrCTA0o6Padx7+fjMUrX/3n1sg==
X-Received: by 2002:a17:907:3f18:b0:966:31a1:8d6e with SMTP id hq24-20020a1709073f1800b0096631a18d6emr9251381ejc.57.1683653033149;
        Tue, 09 May 2023 10:23:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:23:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/27] elfutils: update 0.188 -> 0.189
Date: Tue,  9 May 2023 19:23:25 +0200
Message-Id: <20230509172344.1516743-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181063

Drop backports, rebase musl patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{elfutils_0.188.bb => elfutils_0.189.bb}  |  5 +-
 ...od-Fix-usage-of-deprecated-CURLINFO_.patch | 49 -----------
 ...t-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch | 34 -------
 .../elfutils/files/0003-musl-utils.patch      | 14 +--
 .../0015-config-eu.am-do-not-use-Werror.patch | 10 +--
 .../handle_DW_TAG_unspecified_type.patch      | 88 -------------------
 6 files changed, 13 insertions(+), 187 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.188.bb => elfutils_0.189.bb} (96%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/handle_DW_TAG_unspecified_type.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.188.bb b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
similarity index 96%
rename from meta/recipes-devtools/elfutils/elfutils_0.188.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.189.bb
index 74271b2411e..236f8cef92d 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.188.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
@@ -21,15 +21,12 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
-           file://0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch \
-           file://0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch \
-           file://handle_DW_TAG_unspecified_type.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            file://0015-config-eu.am-do-not-use-Werror.patch \
            "
-SRC_URI[sha256sum] = "fb8b0e8d0802005b9a309c60c1d8de32dd2951b56f0c3a3cb56d21ce01595dff"
+SRC_URI[sha256sum] = "39bd8f1a338e2b7cd4abc3ff11a0eddc6e690f69578a57478d8179b4148708c8"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch b/meta/recipes-devtools/elfutils/files/0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch
deleted file mode 100644
index ee192e35816..00000000000
--- a/meta/recipes-devtools/elfutils/files/0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From d2bf497b12fbd49b4996ccf0744303ffd67735b1 Mon Sep 17 00:00:00 2001
-From: Andrew Paprocki <andrew@ishiboo.com>
-Date: Wed, 21 Dec 2022 11:15:00 -0500
-Subject: [PATCH] PR29926: debuginfod: Fix usage of deprecated CURLINFO_*
-
-The `CURLINFO_SIZE_DOWNLOAD_T` and `CURLINFO_CONTENT_LENGTH_DOWNLOAD_T`
-identifiers are `enum`s, not pre-processor definitions, so the current
-`#ifdef` logic is not selecting the newer API.  This results in the
-older identifiers being used and they now generate errors when compiled
-against Curl 7.87, which has silently deprecated them, causing GCC to
-emit `-Werror=deprecated-declarations`.
-
-Instead, the newer identifiers were added in Curl 7.55, so explicitly
-check for `CURL_AT_LEAST_VERSION(7, 55, 0)` instead of the current
-logic.  This eliminates the error when compiling against Curl 7.87.
-
-Ref: https://github.com/curl/curl/pull/1511
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=d2bf497b12fbd49b4996ccf0744303ffd67735b1]
-Signed-off-by: Andrew Paprocki <andrew@ishiboo.com>
----
- debuginfod/debuginfod-client.c | 4 ++--
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
-index 8873fcc8..692aecce 100644
---- a/debuginfod/debuginfod-client.c
-+++ b/debuginfod/debuginfod-client.c
-@@ -1456,7 +1456,7 @@ debuginfod_query_server (debuginfod_client *c,
-              deflate-compressing proxies, this number is likely to be
-              unavailable, so -1 may show. */
-           CURLcode curl_res;
--#ifdef CURLINFO_CONTENT_LENGTH_DOWNLOAD_T
-+#if CURL_AT_LEAST_VERSION(7, 55, 0)
-           curl_off_t cl;
-           curl_res = curl_easy_getinfo(target_handle,
-                                        CURLINFO_CONTENT_LENGTH_DOWNLOAD_T,
-@@ -1491,7 +1491,7 @@ debuginfod_query_server (debuginfod_client *c,
-           if (target_handle) /* we've committed to a server; report its download progress */
-             {
-               CURLcode curl_res;
--#ifdef CURLINFO_SIZE_DOWNLOAD_T
-+#if CURL_AT_LEAST_VERSION(7, 55, 0)
-               curl_off_t dl;
-               curl_res = curl_easy_getinfo(target_handle,
-                                            CURLINFO_SIZE_DOWNLOAD_T,
--- 
-2.39.1
-
diff --git a/meta/recipes-devtools/elfutils/files/0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch b/meta/recipes-devtools/elfutils/files/0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch
deleted file mode 100644
index 2d4c912e824..00000000000
--- a/meta/recipes-devtools/elfutils/files/0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6560fb26a62ef135a804357ef4f15a47de3e49b3 Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Tue, 10 Jan 2023 23:20:41 +0100
-Subject: [PATCH] debuginfod-client: Use CURLOPT_PROTOCOLS_STR for libcurl >= 7.85.0
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=29926
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=6560fb26a62ef135a804357ef4f15a47de3e49b3]
-Signed-off-by: Mark Wielaard <mark@klomp.org>
----
- debuginfod/debuginfod-client.c | 5 +++++
- 2 files changed, 10 insertions(+)
-
-diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
-index a16165bd..1ce45632 100644
---- a/debuginfod/debuginfod-client.c
-+++ b/debuginfod/debuginfod-client.c
-@@ -1336,8 +1336,13 @@ debuginfod_query_server (debuginfod_client *c,
- 
-       /* Only allow http:// + https:// + file:// so we aren't being
- 	 redirected to some unsupported protocol.  */
-+#if CURL_AT_LEAST_VERSION(7, 85, 0)
-+      curl_easy_setopt_ck(data[i].handle, CURLOPT_PROTOCOLS_STR,
-+			  "http,https,file");
-+#else
-       curl_easy_setopt_ck(data[i].handle, CURLOPT_PROTOCOLS,
- 			  (CURLPROTO_HTTP | CURLPROTO_HTTPS | CURLPROTO_FILE));
-+#endif
-       curl_easy_setopt_ck(data[i].handle, CURLOPT_URL, data[i].url);
-       if (vfd >= 0)
- 	curl_easy_setopt_ck(data[i].handle, CURLOPT_ERRORBUFFER,
--- 
-2.39.1
-
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 1c7cde6d7dd..93f5bdcd00e 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 81da32c3404b58cbad7b3af00854e0cf2dc3dbf1 Mon Sep 17 00:00:00 2001
+From 262ac90394e36e0b4e86042d9c5385703f5b6536 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -22,7 +22,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 29 insertions(+)
 
 diff --git a/src/arlib.h b/src/arlib.h
-index e117166..8326f6c 100644
+index d4a4221..f6336d9 100644
 --- a/src/arlib.h
 +++ b/src/arlib.h
 @@ -29,6 +29,12 @@
@@ -39,7 +39,7 @@ index e117166..8326f6c 100644
  /* State of -D/-U flags.  */
  extern bool arlib_deterministic_output;
 diff --git a/src/elfcompress.c b/src/elfcompress.c
-index 92f2fac..0b037a5 100644
+index 18ade66..a6ed4e1 100644
 --- a/src/elfcompress.c
 +++ b/src/elfcompress.c
 @@ -37,6 +37,13 @@
@@ -57,10 +57,10 @@ index 92f2fac..0b037a5 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
 diff --git a/src/strip.c b/src/strip.c
-index 30a1f9d..e89a7f0 100644
+index 2a2cc80..8e9f773 100644
 --- a/src/strip.c
 +++ b/src/strip.c
-@@ -46,6 +46,13 @@
+@@ -45,6 +45,13 @@
  #include <system.h>
  #include <printversion.h>
  
@@ -75,10 +75,10 @@ index 30a1f9d..e89a7f0 100644
  
  /* Name and version of program.  */
 diff --git a/src/unstrip.c b/src/unstrip.c
-index 3472637..40c73f3 100644
+index d5bd182..d797823 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
-@@ -52,6 +52,15 @@
+@@ -51,6 +51,15 @@
  #include "libeu.h"
  #include "printversion.h"
  
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
index a7715587db7..bf8bd7bd958 100644
--- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
@@ -1,4 +1,4 @@
-From ff6ab57ba5dd37947ef1ffe5de7af5dbebfeb4e9 Mon Sep 17 00:00:00 2001
+From c209233857a73970d7a7dd8da664903570efc7ea Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jun 2020 21:35:16 +0000
 Subject: [PATCH] config/eu.am: do not use -Werror
@@ -16,18 +16,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/config/eu.am b/config/eu.am
-index 58cd3c4..ac42390 100644
+index e6c241f..4136e7c 100644
 --- a/config/eu.am
 +++ b/config/eu.am
-@@ -91,7 +91,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
- 	    -Wold-style-definition -Wstrict-prototypes $(TRAMPOLINES_WARNING) \
+@@ -99,7 +99,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
  	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
+ 	    $(USE_AFTER_FREE3_WARNING) \
 -	    $(if $($(*F)_no_Werror),,-Werror) \
  	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
  	    $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
-@@ -101,7 +100,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
+@@ -109,7 +108,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
  	   $(TRAMPOLINES_WARNING) \
  	   $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	   $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
diff --git a/meta/recipes-devtools/elfutils/files/handle_DW_TAG_unspecified_type.patch b/meta/recipes-devtools/elfutils/files/handle_DW_TAG_unspecified_type.patch
deleted file mode 100644
index 8cab01c29a0..00000000000
--- a/meta/recipes-devtools/elfutils/files/handle_DW_TAG_unspecified_type.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From: Mark Wielaard <mark@klomp.org>
-Date: Thu, 26 Jan 2023 17:19:15 +0000 (+0100)
-Subject: backends: Handle DW_TAG_unspecified_type in dwarf_peeled_die_type
-X-Git-Url: https://sourceware.org/git/?p=elfutils.git;a=commitdiff_plain;h=f2c522567ad63ac293535fba9704895e685ab5bc;hp=3fa98a6f29b0f370e32549ead7eb897c839af980
-
-backends: Handle DW_TAG_unspecified_type in dwarf_peeled_die_type
-
-binutils 2.40 introduces DW_TAG_unspecified_type for assembly
-functions with an unknown return type. This breaks the
-run-funcretval.sh testcase because dwfl_module_return_value_location
-returns an error for such functions because it cannot determine the
-return value location. Fix that by treating DW_TAG_unspecified_type
-as if the DIE doesn't have a DW_AT_type.
-
-Also update the testcase to explicitly checking for
-DW_TAG_unspecified_type and printing "returns unspecified type".
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=30047
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=f2c522567ad63ac293535fba9704895e685ab5bc;hp=3fa98a6f29b0f370e32549ead7eb897c839af980]
-Signed-off-by: Mark Wielaard <mark@klomp.org>
----
-
---- a/backends/libebl_CPU.h
-+++ b/backends/libebl_CPU.h
-@@ -1,5 +1,6 @@
- /* Common interface for libebl modules.
-    Copyright (C) 2000, 2001, 2002, 2003, 2005, 2013, 2014 Red Hat, Inc.
-+   Copyright (C) 2023 Mark J. Wielaard <mark@klomp.org>
-    This file is part of elfutils.
- 
-    This file is free software; you can redistribute it and/or modify
-@@ -53,7 +54,9 @@ extern bool (*generic_debugscn_p) (const
-      dwarf_tag (_die); })
- 
- /* Get a type die corresponding to DIE.  Peel CV qualifiers off
--   it.  */
-+   it.  Returns zero if the DIE doesn't have a type, or the type
-+   is DW_TAG_unspecified_type.  Returns -1 on error.  Otherwise
-+   returns the result tag DW_AT value.  */
- static inline int
- dwarf_peeled_die_type (Dwarf_Die *die, Dwarf_Die *result)
- {
-@@ -69,7 +72,14 @@ dwarf_peeled_die_type (Dwarf_Die *die, D
-   if (dwarf_peel_type (result, result) != 0)
-     return -1;
- 
--  return DWARF_TAG_OR_RETURN (result);
-+  if (result == NULL)
-+    return -1;
-+
-+  int tag = dwarf_tag (result);
-+  if (tag == DW_TAG_unspecified_type)
-+    return 0; /* Treat an unspecified type as if there was no type.  */
-+
-+  return tag;
- }
- 
- #endif	/* libebl_CPU.h */
---- a/tests/funcretval.c
-+++ b/tests/funcretval.c
-@@ -1,5 +1,6 @@
- /* Test program for dwfl_module_return_value_location.
-    Copyright (C) 2005 Red Hat, Inc.
-+   Copyright (C) 2023 Mark J. Wielaard <mark@klomp.org>
-    This file is part of elfutils.
- 
-    This file is free software; you can redistribute it and/or modify
-@@ -67,7 +68,18 @@ handle_function (Dwarf_Die *funcdie, voi
-     error (EXIT_FAILURE, 0, "dwfl_module_return_value_location: %s",
- 	   dwfl_errmsg (-1));
-   else if (nlocops == 0)
--    puts ("returns no value");
-+    {
-+      // Check if this is the special unspecified type
-+      // https://sourceware.org/bugzilla/show_bug.cgi?id=30047
-+      Dwarf_Die die_mem, *typedie = &die_mem;
-+      Dwarf_Attribute attr_mem, *attr;
-+      attr = dwarf_attr_integrate (funcdie, DW_AT_type, &attr_mem);
-+      if (dwarf_formref_die (attr, typedie) != NULL
-+	  && dwarf_tag (typedie) == DW_TAG_unspecified_type)
-+	puts ("returns unspecified type");
-+      else
-+	puts ("returns no value");
-+    }
-   else
-     {
-       printf ("return value location:");
-- 
2.30.2


