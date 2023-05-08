Return-Path: <xmdy61@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67396C77B7D
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 02:13:06 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.98499.1683511980098460768
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 May 2023 19:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AwRxuRVW;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: xmdy61@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1aaf7067647so26521015ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 07 May 2023 19:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683511979; x=1686103979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MW2OzyNDU3DB2a+QXdmbMSJtwH1ZUpltoXWOsdE6gjg=;
        b=AwRxuRVWFvpqBL3m+0qqbXIV78jhJE3zzeszmKwdx8xrfaQK2kwbObAOM2wx+WRkJD
         DrOTm0iD+t7D5cvyNgQEVgM63itMVMwbmPCmBnyvoNxXraUYMHFv3Qg/9+x2xI8MWmX1
         l8SiAIX8NMSUvigBWV1gUCvNjaB/KpQ9RRqfhpF61u6vb0Ms+aV8zXDIYCpsza2LbN4n
         TVzWWLLqDMjba+VlQPKg7ZDS/FnnYF58Cq2hEcAZUbE7c0EuThVXf8YOPs7tso41WBE6
         CP/HWQAqX0gVfeOfmuBvEP9xHVTyCF7KXi3fFEQ8jjSt7uMjoqoGJ8A7cT/8ewtwJ6Co
         5DRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683511979; x=1686103979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MW2OzyNDU3DB2a+QXdmbMSJtwH1ZUpltoXWOsdE6gjg=;
        b=VGpHZsSaMZESwYqFmhe0nkYq98irqpvQ+7feIdsJ6UGdsWMZNHp+ItKbPgkWKGdPIs
         SA9liI819OaoZUsL7Lo5pXwZcKsz7H7sx09F7mGz3t/E5Sy1FCDo6ft6i3v1ic/hw7yq
         rlDudBia+rMUmBnaHLNfIjuQZBHFIorJs+s98LCjUKn3i7iQ64NuhkHlkMB/QQYuyYjz
         L628gFQ1w9n9Fe0ltSw4VlSUALcmYpzXb/5U7UkEd9deqd+2dgPgZ17ZxsndoolucZew
         VRHwRrfLNih0h2SIrF1Flmi7JpOk2snakyoK10sp5SoAPtHNPly3jRZq/grPzi2OnPh1
         LA7A==
X-Gm-Message-State: AC+VfDwC4q1WGVZrvcwk4Nj6EuaMKtk5hTyXC8EmVZVGZdUWa3L19cEB
	2p31C9mG5ivZhquH7qgrk4YGUMX7oU32zboCxX4=
X-Google-Smtp-Source: ACHHUZ5y8JNZ8G3nkXLIuCR4nKeD1L7xnkZTjKhZqAGoSIizEaUChtDSP3ZbkjX5MFUItPMx/mWWuA==
X-Received: by 2002:a17:902:a516:b0:1a6:b971:faf6 with SMTP id s22-20020a170902a51600b001a6b971faf6mr7902263plq.35.1683511978880;
        Sun, 07 May 2023 19:12:58 -0700 (PDT)
Received: from zangrc-Virtual-Machine.mshome.net ([112.81.43.38])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001ac2be2639asm5824359plh.223.2023.05.07.19.12.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 19:12:58 -0700 (PDT)
From: Zang Ruochen <xmdy61@gmail.com>
X-Google-Original-From: Zang Ruochen <zangruochen@loongson.cn>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] elfutils: upgrade 0.188 -> 0.189
Date: Mon,  8 May 2023 10:12:56 +0800
Message-Id: <20230508021256.2662575-1-zangruochen@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 02:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181014

Refresh the following patch.
0015-config-eu.am-do-not-use-Werror.patch

Remove the following patches as they have been fixed in the new version.
0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch
0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch

changelog:
Version 0.189 "Don't deflate!"

configure: eu-nm, eu-addr2line and eu-stack can provide demangled symbols
           when linked with libstdc++. Use --disable-demangler to disable.

           A new option --enable-sanitize-memory has been added for msan
           sanitizer support.

libelf: elf_compress now supports ELFCOMPRESS_ZSTD when build against
        libzstd

libdwfl: dwfl_module_return_value_location now returns 0 (no return type)
         for DIEs that point to a DW_TAG_unspecified_type.

elfcompress: -t, --type= now support zstd if libelf has been build with
             ELFCOMPRESS_ZSTD support.

backends: Add support for LoongArch and Synopsys ARCv2 processors.

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 .../{elfutils_0.188.bb => elfutils_0.189.bb}  |  5 +-
 ...od-Fix-usage-of-deprecated-CURLINFO_.patch | 49 -----------
 ...t-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch | 34 -------
 .../0015-config-eu.am-do-not-use-Werror.patch | 10 +--
 .../handle_DW_TAG_unspecified_type.patch      | 88 -------------------
 5 files changed, 6 insertions(+), 180 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.188.bb => elfutils_0.189.bb} (96%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/handle_DW_TAG_unspecified_type.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.188.bb b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
similarity index 96%
rename from meta/recipes-devtools/elfutils/elfutils_0.188.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.189.bb
index 74271b2411..236f8cef92 100644
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
index ee192e3581..0000000000
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
index 2d4c912e82..0000000000
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
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
index a7715587db..fd1ec010e5 100644
--- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
@@ -14,20 +14,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  config/eu.am | 2 --
  1 file changed, 2 deletions(-)
-
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
@@ -35,3 +34,4 @@ index 58cd3c4..ac42390 100644
  	   $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	   $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
  	   $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
+-- 
diff --git a/meta/recipes-devtools/elfutils/files/handle_DW_TAG_unspecified_type.patch b/meta/recipes-devtools/elfutils/files/handle_DW_TAG_unspecified_type.patch
deleted file mode 100644
index 8cab01c29a..0000000000
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
2.25.1


