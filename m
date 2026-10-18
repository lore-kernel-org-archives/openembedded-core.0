Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A3BCCF2D5
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 22:37:04 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23197.1792363018714897878
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 15:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NizqzEX2;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e812e2b31bso7317135ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 15:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363018; x=1792967818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+SN3HsiFJ4anunMMQPp8EKsPa8vWvPCEB8+bnr+CWk=;
        b=NizqzEX2tiosx0zvEAWg2peBLKY70uYHzbpOcRqP34hSjSXrNZuBDI6FoaFwv9Doz7
         h8gL70Qb2/qu4QkHg+wfT97N2nZL6t1iGJqVXZXrxTBVXU3zI6kTFlxV2I/eakuyI/4T
         Ry0cKi4nRgUl29L4FHzUpRm/sxH1TJ7bR9IBIDk1gqH948cStw3+jPtm4IQcNZelRe5s
         wehsLVevVP4VtSxKGicI9wrirSMWkEyTedOLwdg691vMYaadOdzIyPZZuvH3ncQm0Jn1
         EcSEwZZiPDS6bFhSC7HBmnbqwUvS3Y6w28NBq2+2Ytgh3E0K5iCekUzAFH4gQCcPmKJg
         FrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363018; x=1792967818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+SN3HsiFJ4anunMMQPp8EKsPa8vWvPCEB8+bnr+CWk=;
        b=nCCsixhJrMLZzqBzfXfak9trPJwh46rtDSJCFW2NZ7Xu+fFlLLjhXAW1M8LcAB3QdD
         YE3PpkW73pC3PiszojxqzjDhQELb5O5y1r37d4Zi/0i58c72QTPEKb+uUI3mqEN0pawS
         FGLh6ijqoK3hYJLfxo7mvPRjD/NLk3Tb2e/0g4r9sapr4uOiSR/x/C3KnM/wzZthmTBM
         2c6HsAHy5JuqwGIQEg33+ANjsEff4tDVJiIRWJmmfeV7dEp7eaCAICMWGsE4mdweHtmb
         8dsTr32VhWKp3ZGRwbEdD6yj/kfbzOP9MMNk0bnKEiBjOiUuBHgQ/pDpiWN74V40uNwQ
         KrzQ==
X-Gm-Message-State: AFq9FYLOXTcL3XlAVNJgrFat5A0ECsY6wdlTYjPxLZfmuf7G1EXZyKAj
	y0glORRmagivUfYudJj6SRJaWLDxy/Ecg2Hsr2W+GIE0HvPQ4ivqkYg4cVReEw==
X-Gm-Gg: AYBFou0DXXlmwhggHvbdM5Bbo55aFW8eNDjnCbyqm59vvC2NZsWkKprv15JhC2c3aNr
	BI/qB0my/K0bTTPMQr8iLmITPq8w2Fjrcbh7q35+e1toogUS4Cc0EluRgzu0TUZ9kIVrdbRoGi+
	aKp4S99RvISCmRaVmKJrt48kenyeScQkSOdMW/mxmldr7Ww9Kv7lr3+Mbm9znxWqUWPt3Evtsvr
	569OFo76VKMNP/yOQVEA+S4N4acMDGqg8q2f5Fn5okBsRaN2UquaEc6AjUAAmVDmIPpY2YmgKpB
	JyxpQA40KOOPliRbiXP/VjC8FXJbwb5DobWqWU1JnyYx2tbmzZ2LsmOz03MAncVDELGodF0uf1K
	nS1bo4/R61rHRRcHCfilqMJJoDRSbcfKZ30juhtWcrEsX+BMQGQ/7bJ9nViruGQm4uvo7acQb1U
	evmKyLePn9hsd0fV6h0DElGcjd/LcaKTYZHvrF91UcagO3GxfN5OmZzLxqgyGX7doBwSUNqwLva
	tbRfc28jgXSxf2+7xYboXM0qHFmbBWG5VPpkXs=
X-Received: by 2002:a17:90b:380b:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3acef14451fmr5314144a91.24.1792363017768;
        Sun, 18 Oct 2026 15:36:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm17875989a91.0.2026.10.18.15.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:36:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 4/5] libarchive: upgrade 3.8.9 -> 3.8.10
Date: Mon, 19 Oct 2026 11:36:42 +1300
Message-ID: <20261018223644.291257-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018223644.291257-1-ankur.tyagi85@gmail.com>
References: <20261018223644.291257-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 22:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248113

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches are merged in the upstream version.

Changelog:
https://github.com/libarchive/libarchive/releases/tag/v3.8.10

PTEST pass:root@qemux86-64:~# ptest-runner libarchive
START: ptest-runner
2026-10-18T22:03
BEGIN: /usr/lib/libarchive/ptest
...
...
END: /usr/lib/libarchive/ptest
2026-10-18T22:07
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...nd_filter-Use-last-bidder-for-filter.patch | 188 -------------
 ...-Verify-that-bidder-and-filter-match.patch | 103 -------
 ...aes256-streaming-test-when-no-crypto.patch |  46 ----
 .../libarchive/0003-Remove-bidder-name.patch  | 258 ------------------
 ...barchive_3.8.9.bb => libarchive_3.8.10.bb} |   6 +-
 5 files changed, 1 insertion(+), 600 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-last-bidder-for-filter.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.8.9.bb => libarchive_3.8.10.bb} (90%)

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-last-bidder-for-filter.patch b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-last-bidder-for-filter.patch
deleted file mode 100644
index 8e1eb0e938..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-last-bidder-for-filter.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-From 50b585bb55484cdc70bd92852a477178dc43485c Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Sun, 2 Aug 2026 14:27:17 +0200
-Subject: [PATCH] append_filter: Use last bidder for filter
-
-Appending a filter implies appending a bidder. Always use the last added
-bidder, since it was just added. This avoids desync situations where
-previously added bidders could erroneously match.
-
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/50b585bb]
----
- libarchive/archive_read_append_filter.c | 72 ++++++++-----------------
- 1 file changed, 22 insertions(+), 50 deletions(-)
-
-diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
-index 8de1b2ea..9dd9f536 100644
---- a/libarchive/archive_read_append_filter.c
-+++ b/libarchive/archive_read_append_filter.c
-@@ -33,14 +33,25 @@
- #include "archive_private.h"
- #include "archive_read_private.h"
- 
-+static struct archive_read_filter_bidder *
-+get_last_bidder(struct archive_read *a)
-+{
-+  size_t i;
-+
-+  for (i = 0; i < sizeof(a->bidders) / sizeof(a->bidders[0]); i++)
-+  {
-+    if (a->bidders[i].vtable == NULL)
-+      break;
-+  }
-+
-+  return a->bidders + (i - 1);
-+}
-+
- int
- archive_read_append_filter(struct archive *_a, int code)
- {
--  int r1, r2, number_bidders, i;
--  const char *str;
--  struct archive_read_filter_bidder *b;
--  struct archive_read_filter *f;
-   struct archive_read *a = (struct archive_read *)_a;
-+  int r1, r2;
- 
-   r2 = (ARCHIVE_OK);
-   switch (code)
-@@ -53,15 +64,12 @@ archive_read_append_filter(struct archive *_a, int code)
-       r1 = (ARCHIVE_OK);
-       break;
-     case ARCHIVE_FILTER_GZIP:
--      str = "gzip";
-       r1 = archive_read_support_filter_gzip(_a);
-       break;
-     case ARCHIVE_FILTER_BZIP2:
--      str = "bzip2";
-       r1 = archive_read_support_filter_bzip2(_a);
-       break;
-     case ARCHIVE_FILTER_COMPRESS:
--      str = "compress (.Z)";
-       r1 = archive_read_support_filter_compress(_a);
-       break;
-     case ARCHIVE_FILTER_PROGRAM:
-@@ -69,43 +77,33 @@ archive_read_append_filter(struct archive *_a, int code)
-           "Cannot append program filter using archive_read_append_filter");
-       return (ARCHIVE_FATAL);
-     case ARCHIVE_FILTER_LZMA:
--      str = "lzma";
-       r1 = archive_read_support_filter_lzma(_a);
-       break;
-     case ARCHIVE_FILTER_XZ:
--      str = "xz";
-       r1 = archive_read_support_filter_xz(_a);
-       break;
-     case ARCHIVE_FILTER_UU:
--      str = "uu";
-       r1 = archive_read_support_filter_uu(_a);
-       break;
-     case ARCHIVE_FILTER_RPM:
--      str = "rpm";
-       r1 = archive_read_support_filter_rpm(_a);
-       break;
-     case ARCHIVE_FILTER_LZ4:
--      str = "lz4";
-       r1 = archive_read_support_filter_lz4(_a);
-       break;
-     case ARCHIVE_FILTER_ZSTD:
--      str = "zstd";
-       r1 = archive_read_support_filter_zstd(_a);
-       break;
-     case ARCHIVE_FILTER_LZIP:
--      str = "lzip";
-       r1 = archive_read_support_filter_lzip(_a);
-       break;
-     case ARCHIVE_FILTER_LZOP:
--      str = "lzop";
-       r1 = archive_read_support_filter_lzop(_a);
-       break;
-     case ARCHIVE_FILTER_LRZIP:
--      str = "lrzip";
-       r1 = archive_read_support_filter_lrzip(_a);
-       break;
-     case ARCHIVE_FILTER_GRZIP:
--      str = "grzip";
-       r1 = archive_read_support_filter_grzip(_a);
-       break;
-     default:
-@@ -114,22 +112,10 @@ archive_read_append_filter(struct archive *_a, int code)
-       return (ARCHIVE_FATAL);
-   }
- 
--  if (code != ARCHIVE_FILTER_NONE)
-+  if (r1 > ARCHIVE_FATAL && code != ARCHIVE_FILTER_NONE)
-   {
--    number_bidders = sizeof(a->bidders) / sizeof(a->bidders[0]);
--
--    b = a->bidders;
--    for (i = 1; i < number_bidders; i++, b++)
--    {
--      if (!b->name || !strcmp(b->name, str))
--        break;
--    }
--    if (!b->name || strcmp(b->name, str))
--    {
--      archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
--          "Internal error: Unable to append filter");
--      return (ARCHIVE_FATAL);
--    }
-+    struct archive_read_filter_bidder *b;
-+    struct archive_read_filter *f;
- 
-     f = calloc(1, sizeof(*f));
-     if (f == NULL)
-@@ -137,6 +123,7 @@ archive_read_append_filter(struct archive *_a, int code)
-       archive_set_error(&a->archive, ENOMEM, "Out of memory");
-       return (ARCHIVE_FATAL);
-     }
-+    b = get_last_bidder(a);
-     f->bidder = b;
-     f->archive = a;
-     f->upstream = a->filter;
-@@ -162,37 +149,22 @@ int
- archive_read_append_filter_program_signature(struct archive *_a,
-   const char *cmd, const void *signature, size_t signature_len)
- {
--  int r, number_bidders, i;
-+  struct archive_read *a = (struct archive_read *)_a;
-   struct archive_read_filter_bidder *b;
-   struct archive_read_filter *f;
--  struct archive_read *a = (struct archive_read *)_a;
-+  int r;
- 
-   if (archive_read_support_filter_program_signature(_a, cmd, signature,
-     signature_len) != (ARCHIVE_OK))
-     return (ARCHIVE_FATAL);
- 
--  number_bidders = sizeof(a->bidders) / sizeof(a->bidders[0]);
--
--  b = a->bidders;
--  for (i = 0; i < number_bidders; i++, b++)
--  {
--    /* Program bidder name set to filter name after initialization */
--    if (b->data && !b->name)
--      break;
--  }
--  if (!b->data)
--  {
--    archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
--        "Internal error: Unable to append program filter");
--    return (ARCHIVE_FATAL);
--  }
--
-   f = calloc(1, sizeof(*f));
-   if (f == NULL)
-   {
-     archive_set_error(&a->archive, ENOMEM, "Out of memory");
-     return (ARCHIVE_FATAL);
-   }
-+  b = get_last_bidder(a);
-   f->bidder = b;
-   f->archive = a;
-   f->upstream = a->filter;
--- 
-2.54.0
-
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
deleted file mode 100644
index a91f518207..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From db4fb440792278cd01e0829c93f6b62f567b704b Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Sun, 2 Aug 2026 14:26:22 +0200
-Subject: [PATCH 1/3] append_filter: Verify that bidder and filter match
-
-Make sure that appending a filter always matches its supposed bidder.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
----
- Makefile.am                                   |  1 +
- libarchive/test/CMakeLists.txt                |  1 +
- .../test/test_archive_read_append_filter.c    | 54 +++++++++++++++++++
- 3 files changed, 56 insertions(+)
- create mode 100644 libarchive/test/test_archive_read_append_filter.c
-
-diff --git a/Makefile.am b/Makefile.am
-index 2fb4fdf4..c96b3bc6 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -404,6 +404,7 @@ libarchive_test_SOURCES= \
- 	libarchive/test/test_archive_pathmatch_oob.c \
- 	libarchive/test/test_archive_read.c \
- 	libarchive/test/test_archive_read_add_passphrase.c \
-+	libarchive/test/test_archive_read_append_filter.c \
- 	libarchive/test/test_archive_read_close_twice.c \
- 	libarchive/test/test_archive_read_multiple_data_objects.c \
- 	libarchive/test/test_archive_read_next_header_empty.c \
-diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
-index 44f839f8..c4102c3d 100644
---- a/libarchive/test/CMakeLists.txt
-+++ b/libarchive/test/CMakeLists.txt
-@@ -33,6 +33,7 @@ IF(ENABLE_TEST)
-     test_archive_pathmatch_oob.c
-     test_archive_read.c
-     test_archive_read_add_passphrase.c
-+    test_archive_read_append_filter.c
-     test_archive_read_close_twice.c
-     test_archive_read_multiple_data_objects.c
-     test_archive_read_next_header_empty.c
-diff --git a/libarchive/test/test_archive_read_append_filter.c b/libarchive/test/test_archive_read_append_filter.c
-new file mode 100644
-index 00000000..5c301d52
---- /dev/null
-+++ b/libarchive/test/test_archive_read_append_filter.c
-@@ -0,0 +1,54 @@
-+/*-
-+ * Copyright (c) 2026 Tobias Stoeckmann
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in the
-+ *    documentation and/or other materials provided with the distribution.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
-+ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
-+ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
-+ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-+ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-+ */
-+
-+#include "archive.h"
-+#include "test.h"
-+
-+DEFINE_TEST(test_archive_read_append_filter)
-+{
-+	struct archive *a;
-+	int r;
-+
-+	a = archive_read_new();
-+	assert(a != NULL);
-+
-+	/* Append a program bidder (without filter). */
-+	assertEqualIntA(a, ARCHIVE_OK,
-+	    archive_read_support_filter_program(a, "prog1"));
-+
-+	/* Append a filter program which comes with its own bidder. */
-+	r = archive_read_append_filter_program(a, "prog2");
-+
-+	/* Verify that filter uses its own bidder. */
-+	if (r == ARCHIVE_FATAL) {
-+		assertEqualStringA(a, "Can't initialize filter; unable to run program \"prog2\"",
-+			archive_error_string(a));
-+	} else {
-+		assertEqualIntA(a, ARCHIVE_OK, r);
-+		assertEqualStringA(a, "Program: prog2", archive_filter_name(a, 0));
-+	}
-+
-+	archive_read_free(a);
-+}
--- 
-2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch b/meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch
deleted file mode 100644
index fc96225141..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c2b00a5fff659bbe8d70b5e00cb6abb831170aeb Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Wed, 29 Jul 2026 13:33:10 +0000
-Subject: [PATCH] test: skip ppmd8 aes256 streaming test when no crypto library
- is present
-
-test_read_format_zip_ppmd8_aes256_streaming fails with 6 assertion
-failures on systems without a crypto library (openssl/nettle/mbedtls)
-because it tries to decrypt a pre-built encrypted zipx file without
-checking crypto availability first.
-
-Add the same guard used by the other encrypted zip tests in this file.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3335]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- .../test/test_read_format_zip_zipx_encrypted.c     | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/libarchive/test/test_read_format_zip_zipx_encrypted.c b/libarchive/test/test_read_format_zip_zipx_encrypted.c
-index f07e1e5c..a0a431fb 100644
---- a/libarchive/test/test_read_format_zip_zipx_encrypted.c
-+++ b/libarchive/test/test_read_format_zip_zipx_encrypted.c
-@@ -257,8 +257,22 @@ DEFINE_TEST(test_read_format_zip_zipx_zstd_encrypted_streaming)
- DEFINE_TEST(test_read_format_zip_ppmd8_aes256_streaming)
- {
- 	const char *refname = "test_read_format_zip_ppmd8_aes256_streaming.zipx";
-+	struct archive *a;
- 	size_t used;
- 	char buff[600];
-+
-+	/* Check if running system has cryptographic functionality. */
-+	assert((a = archive_write_new()) != NULL);
-+	assertEqualIntA(a, ARCHIVE_OK, archive_write_set_format_zip(a));
-+	assertEqualIntA(a, ARCHIVE_OK, archive_write_add_filter_none(a));
-+	if (ARCHIVE_OK != archive_write_set_options(a,
-+			"zip:encryption=aes256")) {
-+		skipping("This system does not have cryptographic library");
-+		archive_write_free(a);
-+		return;
-+	}
-+	archive_write_free(a);
-+
- 	extract_reference_file(refname);
- 	FILE *f = fopen(refname, "rb");
- 	used = fread(buff, 1, sizeof(buff), f);
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
deleted file mode 100644
index bbd2478577..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
+++ /dev/null
@@ -1,258 +0,0 @@
-From 76c7142bd2595184826722063598fddf62031cca Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Sun, 2 Aug 2026 14:31:33 +0200
-Subject: [PATCH 3/3] Remove bidder name
-
-The name was only needed to find the appropriate bidder for a filter.
-Since this has been resolved by accessing the last bidder, since in these
-situations the bidder is added first, then the filter, the name is not
-needed anymore.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
-Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
-Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
----
- libarchive/archive_read.c                         | 2 --
- libarchive/archive_read_append_filter.c           | 1 -
- libarchive/archive_read_private.h                 | 3 ---
- libarchive/archive_read_support_filter_bzip2.c    | 2 +-
- libarchive/archive_read_support_filter_compress.c | 2 +-
- libarchive/archive_read_support_filter_grzip.c    | 2 +-
- libarchive/archive_read_support_filter_gzip.c     | 2 +-
- libarchive/archive_read_support_filter_lrzip.c    | 2 +-
- libarchive/archive_read_support_filter_lz4.c      | 2 +-
- libarchive/archive_read_support_filter_lzop.c     | 2 +-
- libarchive/archive_read_support_filter_program.c  | 2 +-
- libarchive/archive_read_support_filter_rpm.c      | 2 +-
- libarchive/archive_read_support_filter_uu.c       | 2 +-
- libarchive/archive_read_support_filter_xz.c       | 6 +++---
- libarchive/archive_read_support_filter_zstd.c     | 2 +-
- 15 files changed, 14 insertions(+), 20 deletions(-)
-
-diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
-index e844e42d..406d84de 100644
---- a/libarchive/archive_read.c
-+++ b/libarchive/archive_read.c
-@@ -1290,7 +1290,6 @@ __archive_read_register_format(struct archive_read *a,
- int
- __archive_read_register_bidder(struct archive_read *a,
- 	void *bidder_data,
--	const char *name,
- 	const struct archive_read_filter_bidder_vtable *vtable)
- {
- 	struct archive_read_filter_bidder *bidder;
-@@ -1307,7 +1306,6 @@ __archive_read_register_bidder(struct archive_read *a,
- 		memset(a->bidders + i, 0, sizeof(a->bidders[0]));
- 		bidder = (a->bidders + i);
- 		bidder->data = bidder_data;
--		bidder->name = name;
- 		bidder->vtable = vtable;
- 		if (bidder->vtable->bid == NULL || bidder->vtable->init == NULL) {
- 			archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
-diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
-index 9dd9f536..5cc8ff55 100644
---- a/libarchive/archive_read_append_filter.c
-+++ b/libarchive/archive_read_append_filter.c
-@@ -174,7 +174,6 @@ archive_read_append_filter_program_signature(struct archive *_a,
-     __archive_read_free_filters(a);
-     return (ARCHIVE_FATAL);
-   }
--  b->name = a->filter->name;
- 
-   a->bypass_filter_bidding = 1;
-   return r;
-diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_private.h
-index 3bd8de2d..e30b6c2b 100644
---- a/libarchive/archive_read_private.h
-+++ b/libarchive/archive_read_private.h
-@@ -68,8 +68,6 @@ struct archive_read_filter_bidder_vtable {
- struct archive_read_filter_bidder {
- 	/* Configuration data for the bidder. */
- 	void *data;
--	/* Name of the filter */
--	const char *name;
- 	const struct archive_read_filter_bidder_vtable *vtable;
- };
- 
-@@ -250,7 +248,6 @@ int	__archive_read_register_format(struct archive_read *a,
- 
- int __archive_read_register_bidder(struct archive_read *a,
- 		void *bidder_data,
--		const char *name,
- 		const struct archive_read_filter_bidder_vtable *vtable);
- 
- const void *__archive_read_ahead(struct archive_read *, size_t, ssize_t *);
-diff --git a/libarchive/archive_read_support_filter_bzip2.c b/libarchive/archive_read_support_filter_bzip2.c
-index 588953f2..1cfc55dc 100644
---- a/libarchive/archive_read_support_filter_bzip2.c
-+++ b/libarchive/archive_read_support_filter_bzip2.c
-@@ -91,7 +91,7 @@ archive_read_support_filter_bzip2(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "bzip2",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&bzip2_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_compress.c b/libarchive/archive_read_support_filter_compress.c
-index 4e1f1dc5..4763995e 100644
---- a/libarchive/archive_read_support_filter_compress.c
-+++ b/libarchive/archive_read_support_filter_compress.c
-@@ -160,7 +160,7 @@ archive_read_support_filter_compress(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	return __archive_read_register_bidder(a, NULL, "compress (.Z)",
-+	return __archive_read_register_bidder(a, NULL,
- 			&compress_bidder_vtable);
- }
- 
-diff --git a/libarchive/archive_read_support_filter_grzip.c b/libarchive/archive_read_support_filter_grzip.c
-index 9d9ad46e..8457ec7c 100644
---- a/libarchive/archive_read_support_filter_grzip.c
-+++ b/libarchive/archive_read_support_filter_grzip.c
-@@ -62,7 +62,7 @@ archive_read_support_filter_grzip(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "grzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&grzip_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_gzip.c b/libarchive/archive_read_support_filter_gzip.c
-index 89ae0f37..34b174b7 100644
---- a/libarchive/archive_read_support_filter_gzip.c
-+++ b/libarchive/archive_read_support_filter_gzip.c
-@@ -96,7 +96,7 @@ archive_read_support_filter_gzip(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "gzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&gzip_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_lrzip.c b/libarchive/archive_read_support_filter_lrzip.c
-index 33910fe1..a1d45d77 100644
---- a/libarchive/archive_read_support_filter_lrzip.c
-+++ b/libarchive/archive_read_support_filter_lrzip.c
-@@ -61,7 +61,7 @@ archive_read_support_filter_lrzip(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "lrzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lrzip_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_lz4.c b/libarchive/archive_read_support_filter_lz4.c
-index 19086a1f..28189a07 100644
---- a/libarchive/archive_read_support_filter_lz4.c
-+++ b/libarchive/archive_read_support_filter_lz4.c
-@@ -118,7 +118,7 @@ archive_read_support_filter_lz4(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "lz4",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lz4_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_lzop.c b/libarchive/archive_read_support_filter_lzop.c
-index ebfaf01e..5a552fce 100644
---- a/libarchive/archive_read_support_filter_lzop.c
-+++ b/libarchive/archive_read_support_filter_lzop.c
-@@ -109,7 +109,7 @@ archive_read_support_filter_lzop(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "lzop",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lzop_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_program.c b/libarchive/archive_read_support_filter_program.c
-index cf7c3613..a9e02a32 100644
---- a/libarchive/archive_read_support_filter_program.c
-+++ b/libarchive/archive_read_support_filter_program.c
-@@ -156,7 +156,7 @@ archive_read_support_filter_program_signature(struct archive *_a,
- 		memcpy(state->signature, signature, signature_len);
- 	}
- 
--	if (__archive_read_register_bidder(a, state, NULL,
-+	if (__archive_read_register_bidder(a, state,
- 				&program_bidder_vtable) != ARCHIVE_OK) {
- 		free_state(state);
- 		return (ARCHIVE_FATAL);
-diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
-index 01bd1bf7..1cfddf75 100644
---- a/libarchive/archive_read_support_filter_rpm.c
-+++ b/libarchive/archive_read_support_filter_rpm.c
-@@ -71,7 +71,7 @@ archive_read_support_filter_rpm(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	return __archive_read_register_bidder(a, NULL, "rpm",
-+	return __archive_read_register_bidder(a, NULL,
- 			&rpm_bidder_vtable);
- }
- 
-diff --git a/libarchive/archive_read_support_filter_uu.c b/libarchive/archive_read_support_filter_uu.c
-index c0f6f48e..10d49648 100644
---- a/libarchive/archive_read_support_filter_uu.c
-+++ b/libarchive/archive_read_support_filter_uu.c
-@@ -92,7 +92,7 @@ archive_read_support_filter_uu(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	return __archive_read_register_bidder(a, NULL, "uu",
-+	return __archive_read_register_bidder(a, NULL,
- 			&uudecode_bidder_vtable);
- }
- 
-diff --git a/libarchive/archive_read_support_filter_xz.c b/libarchive/archive_read_support_filter_xz.c
-index 7c8e0cb5..b00ba543 100644
---- a/libarchive/archive_read_support_filter_xz.c
-+++ b/libarchive/archive_read_support_filter_xz.c
-@@ -115,7 +115,7 @@ archive_read_support_filter_xz(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "xz",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&xz_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-@@ -147,7 +147,7 @@ archive_read_support_filter_lzma(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "lzma",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lzma_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-@@ -180,7 +180,7 @@ archive_read_support_filter_lzip(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "lzip",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&lzip_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
-diff --git a/libarchive/archive_read_support_filter_zstd.c b/libarchive/archive_read_support_filter_zstd.c
-index 12eac04c..163f54b5 100644
---- a/libarchive/archive_read_support_filter_zstd.c
-+++ b/libarchive/archive_read_support_filter_zstd.c
-@@ -87,7 +87,7 @@ archive_read_support_filter_zstd(struct archive *_a)
- {
- 	struct archive_read *a = (struct archive_read *)_a;
- 
--	if (__archive_read_register_bidder(a, NULL, "zstd",
-+	if (__archive_read_register_bidder(a, NULL,
- 				&zstd_bidder_vtable) != ARCHIVE_OK)
- 		return (ARCHIVE_FATAL);
- 
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.10.bb
similarity index 90%
rename from meta/recipes-extended/libarchive/libarchive_3.8.9.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.10.bb
index 2eefa28532..dfe1b94972 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.10.bb
@@ -31,16 +31,12 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
-           file://0001-append_filter-Use-last-bidder-for-filter.patch \
-           file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch \
-           file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
-           file://0003-Remove-bidder-name.patch \
            file://0004-Convert-RPM-reader-into-a-proper-format.patch \
            file://0005-Disable-RPM-filter-auto-bidding.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "f5a6539059cf5e597dbeda37bfa4874b1e8dea063c8d93bf85a2b44af90a5bd4"
+SRC_URI[sha256sum] = "a1bffbe5152cfe869751179e7b16648c87c461cb8c46eee75062efbe164cc57c"
 
 inherit autotools update-alternatives pkgconfig ptest
 

