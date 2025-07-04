Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C884C83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:10:48 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.14486.1751641844306452552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lViYcuqJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74931666cbcso924466b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751641843; x=1752246643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pX5wqYP7larv/otUKyhHlH8hfcppCfqluBsG49Aqs8=;
        b=lViYcuqJY6dAq85sOuLFUSUkO7GPVNUA3YSp2wldhGh1ylQ8fnKxtdR6T2qGlccBP6
         PJTWrSJTjAz625BVIQBnHrWDHoPrOkyKkmrQaPoubg1zNafOiZP3ZwII0bskvt19wiQh
         sYvOy8AfKhyGOKytix4hLkweDHYSKGcUmXcTtQK0S9FCtb2kPfC727/0caN4699UXs1H
         GciMrvlk1AT5UdTBjGstYD87suJEAsyN2IywqXDQfrskH3WkipK5uMvlFLDNUgFRJW2j
         qES36GdEgveqJ32SvC74phi2XZOl4BtTqLkk8ldgE4JhoK411Q1ZAZZnSJ99UkKDZ1Kj
         B8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641843; x=1752246643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pX5wqYP7larv/otUKyhHlH8hfcppCfqluBsG49Aqs8=;
        b=DvVFVancP/WHg/3nMob/EdUCh6Qhn8/Fo6mp2WnrMH2LmWUepHNmVsIUnAnQxmu6Xy
         TZjUd5pSblAkvKRAjGYVQnLqXt2gRic5K17GGj+tZmbleZh3idGoapYtMJ7shZIAnSCw
         vBBS4pAjw2dwYdtakGUr1qJjdER26iU2BMdcbuWpXe0NrU736i+8aXrUsEiAh9jL7sMa
         VDX9GLXeGRYsmWPfbtgSLxnOgpkjdD32JxTXIVDEOWp5XxCz2QsNnaMMtJjdowELdNjc
         lbjzWzDSLSwQb2Ua9g9KrEN9hWRAgFxFQqzWg/PxH3aLNfk6QDRcUKcbABBS1V6nuVRo
         tTcA==
X-Gm-Message-State: AOJu0YzDsZFb/FsPHkJAELCVxsFD9K1JROWMkbk+y9xtw46hwpjL0cMv
	IRCc/8H0fR4fYerpgLxkcq9VPC7+w7TDAlUumtQfS4F+QK2j5Jl0YbTyOR8koqVSpQyKL4AbuZi
	8kjcY
X-Gm-Gg: ASbGnctByPbu7qlZxCq+Zy17J3y1NDI4Iu45nHnXh4iSpY8uOGVJT9C5jNWjourwkkE
	dMx4A04sDlhw21D9hyZl6I7Gh9BJCwxhFUJFDUzfPszyu4NRRXpZJIdutUeN6kBGRk/fwJujncE
	wxnHMymVyeVVHjDTCxc8hS0UKgg49vc6S2DJRVB7MGlpOEhOvOb89o+h7ZMuIxHLRpDsHE0RJvB
	r1sA98jDrzyPdi1vc4JAMWrZsM8bKtxD18g0af4YOfmRPrtOlQ5glQwhzgD6TPAXJqjmPxZxXjS
	PHrRX76X65irhRNUQtFR0y0229bFAX0pccoLS2lhb5lrldBkGaqmTw==
X-Google-Smtp-Source: AGHT+IFeW1zKHZjHccToCp2z8N1EAk01o77a9MfG//7wThnwmmOhctatgKa559wb0NbMAyNSaBFCQQ==
X-Received: by 2002:a05:6a00:2e02:b0:749:9c2:e154 with SMTP id d2e1a72fcca58-74ce68e4bccmr4211411b3a.4.1751641843311;
        Fri, 04 Jul 2025 08:10:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e869sm2159592b3a.82.2025.07.04.08.10.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:10:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/11] libarchive: fix CVE-2025-5914
Date: Fri,  4 Jul 2025 08:10:24 -0700
Message-ID: <b7d8249bda296620a5bbf592f4cdf566b4537563.1751641631.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641631.git.steve@sakoman.com>
References: <cover.1751641631.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219927

From: Divya Chellam <divya.chellam@windriver.com>

A vulnerability has been identified in the libarchive library, specifically within the archiv
e_read_format_rar_seek_data() function. This flaw involves an integer overflow that can ultim
ately lead to a double-free condition. Exploiting a double-free vulnerability can result in m
emory corruption, enabling an attacker to execute arbitrary code or cause a denial-of-service
condition.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-5914

Upstream-patch:
https://github.com/libarchive/libarchive/commit/09685126fcec664e2b8ca595e1fc371bd494d209

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/libarchive/CVE-2025-5914.patch | 48 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
new file mode 100644
index 0000000000..89022b38fd
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
@@ -0,0 +1,48 @@
+From 09685126fcec664e2b8ca595e1fc371bd494d209 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
+Date: Sun, 11 May 2025 02:17:19 +0200
+Subject: [PATCH] rar: Fix double free with over 4 billion nodes (#2598)
+
+If a system is capable of handling 4 billion nodes in memory, a double
+free could occur because of an unsigned integer overflow leading to a
+realloc call with size argument of 0. Eventually, the client will
+release that memory again, triggering a double free.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+CVE: CVE-2025-5914
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/09685126fcec664e2b8ca595e1fc371bd494d209]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ libarchive/archive_read_support_format_rar.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 9d155c6..9eb3c84 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -335,8 +335,8 @@ struct rar
+   int found_first_header;
+   char has_endarc_header;
+   struct data_block_offsets *dbo;
+-  unsigned int cursor;
+-  unsigned int nodes;
++  size_t cursor;
++  size_t nodes;
+   char filename_must_match;
+ 
+   /* LZSS members */
+@@ -1186,7 +1186,7 @@ archive_read_format_rar_seek_data(struct archive_read *a, int64_t offset,
+     int whence)
+ {
+   int64_t client_offset, ret;
+-  unsigned int i;
++  size_t i;
+   struct rar *rar = (struct rar *)(a->format->data);
+ 
+   if (rar->compression_method == COMPRESS_METHOD_STORE)
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 4dd6794bb1..c26a14e32e 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://configurehack.patch \
+           file://CVE-2025-5914.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


