Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E05FE88D6E
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 22:07:34 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6095.1775254045481548409
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 15:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yyDxR50M;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so1995036f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 15:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775254044; x=1775858844; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkycYb2Iloi1OuYihixC9SZ6jEInBCqNtoAzmymnvmo=;
        b=yyDxR50MT1lfsfnqXTtp/1OQC5wxYfiEIHahdmRic6aW39k1dP7fupS2/KVkzs60ig
         0s58CUhZz7zVSt/lXI8fdQyuVDnmeOfzOhjBwsS3dWfnz6dlvo1mB/z6+/d26997yQmg
         OXBSoV6kE2r6kqWgAiJ2LYDz0wP6WBzgZ6cts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775254044; x=1775858844;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nkycYb2Iloi1OuYihixC9SZ6jEInBCqNtoAzmymnvmo=;
        b=CDVAn/BbD+FZFcwY5VyixHjCF1l53CdR/gJYA54K+U1G7LBvjP/74J5BMppL9zuLPb
         PztJHzVGd9VLc/gOmgmCPDFe73Y02mJnIOiU0yV6p7Gh/tyuoP+V16RolnDwDM7r2N33
         sKWZxOIqiqXlS9C9tJLSMkhntgzF2fvF1RbyIghersE8cHE0gm/yaHnvAm1WxHqaP9Fc
         dY0K7JkOL9WWYeRh88zjVRi62PqH1gmqCAve5TjDZr+jrpG9mQ99NtxWTqfHn/7PVqCj
         BuXhLGZtrIiDHHHYLP1/g2sAHsxMAHZeEwIEG+l/33V5uPrJv9ZIXuajgtZOfDy+EEAF
         YA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCcvFYGr+M6KPX97XWQ5mlV8MgFyzt/Effs+Uv/aoxgsCge6I4Sx14koVhF3+Nr8XSZG7nqXJMEfXBnvxexZtGxg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz2rYnH4NfFzIIjtC5gM01g6D4SiVPV0eXghCdy5usqM9PE1s02
	HlGskzUl+37gt+wK+1J+dFrk07n1IoGRkdJroooO7cBVe4TF2dO4HkNvJc9nCT8Z6xQ=
X-Gm-Gg: AeBDietmIsuwADRVEVSNcYVGILwD+1tS6y2C5gvPOmZvj+CgkkDTYPFQe21orlGBNUh
	yyRAUhmLElYBf/xgAaR6sSPxCHbQ47Nb0PmcCHgQHgxnQlqTqkzPyNRQ1stOsNV+gG5hO7RIlf1
	LORwdCW9C7rc1aJsWL6M3d6gzs9JxSFxf+Ndr077Rpak9ToWlUuph1lR+uzQRM8rZR8L6Oj7QIS
	bB+qiKljMcXNMFSlSHQHgvjs6389XF9pPx5LNZJz4Ki2JWQh1x/6I4afOk3afoy2m/BaMWn3LP5
	Qx4ka6k26o5oU45XgV44BuKQJ3gkdmwh2qHTVDbBoufINd3jwcf6MkBfYFoGuI/P5c3o8z6QjOF
	AFbaGnDgZ4lWszW6gde0pImdu+NasKOfKkgvJf+cfrOFiaokIEAbFFAvqHu/eoVWJC4U4YbTflg
	yLkz9c+eUPXZoUegjtJ/CkxXygzFSh7qnyab8T5ve2MEePacnxjRncsyRXwYtIkHPzDrds1HbjM
	jfM0N4wmZrTcf1m6F5YI2jY3g==
X-Received: by 2002:a05:6000:40da:b0:439:bd70:610f with SMTP id ffacd0b85a97d-43d292ecc9amr6570115f8f.44.1775254043617;
        Fri, 03 Apr 2026 15:07:23 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f73sm20839786f8f.8.2026.04.03.15.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 15:07:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 00:07:22 +0200
Message-Id: <DHJV1CGLXDFY.1T23NFX2R5HE8@smile.fr>
Subject: Re: [OE-core][kirkstone][PATCH] libarchive: Fix CVE-2026-4111
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260326075847.312211-1-vanusuri@mvista.com>
In-Reply-To: <20260326075847.312211-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 22:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234603

On Thu Mar 26, 2026 at 8:58 AM CET, Vijay Anusuri via lists.openembedded.or=
g wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Pick patch according to [1]
>
> [1] https://security-tracker.debian.org/tracker/CVE-2026-4111
> [2] https://github.com/libarchive/libarchive/pull/2877
> [3] https://access.redhat.com/errata/RHSA-2026:5080
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---

Hello,

As far as I can tell, this CVE applies to whinlatter and master.
Since this is the end of kirkstone soon, I'll take it into the reviews
series but can only merge it if there is a patch sent for this CVE in
those branches.

Regards,

>  .../libarchive/CVE-2026-4111-1.patch          |  32 ++
>  .../libarchive/CVE-2026-4111-2.patch          | 308 ++++++++++++++++++
>  .../libarchive/libarchive_3.6.2.bb            |   2 +
>  3 files changed, 342 insertions(+)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-=
4111-1.patch
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-=
4111-2.patch
>
> diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.=
patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
> new file mode 100644
> index 0000000000..1f065b1364
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
> @@ -0,0 +1,32 @@
> +From 7273d04803a1e5a482f26d8d0fbaf2b204a72168 Mon Sep 17 00:00:00 2001
> +From: Tim Kientzle <kientzle@acm.org>
> +Date: Sun, 1 Mar 2026 20:24:56 -0800
> +Subject: [PATCH] Reject filters when the block length is nonsensical
> +
> +Credit: Grzegorz Antoniak @antekone
> +
> +Upstream-Status: Backport [https://github.com/libarchive/libarchive/comm=
it/7273d04803a1e5a482f26d8d0fbaf2b204a72168]
> +CVE: CVE-2026-4111
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + libarchive/archive_read_support_format_rar5.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/libarchive/archive_read_support_format_rar5.c b/libarchive/=
archive_read_support_format_rar5.c
> +index 38979cb..867f0a8 100644
> +--- a/libarchive/archive_read_support_format_rar5.c
> ++++ b/libarchive/archive_read_support_format_rar5.c
> +@@ -2914,7 +2914,9 @@ static int parse_filter(struct archive_read* ar, c=
onst uint8_t* p) {
> + 	if(block_length < 4 ||
> + 	    block_length > 0x400000 ||
> + 	    filter_type > FILTER_ARM ||
> +-	    !is_valid_filter_block_start(rar, block_start))
> ++	    !is_valid_filter_block_start(rar, block_start) ||
> ++	    (rar->cstate.window_size > 0 &&
> ++	     (ssize_t)block_length > rar->cstate.window_size >> 1))
> + 	{
> + 		archive_set_error(&ar->archive, ARCHIVE_ERRNO_FILE_FORMAT,
> + 		    "Invalid filter encountered");
> +--=20
> +2.25.1
> +
> diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.=
patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
> new file mode 100644
> index 0000000000..243a03a8e5
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
> @@ -0,0 +1,308 @@
> +From ef53e2023d75a205cf7cbddb5d01c4cc592e9ce4 Mon Sep 17 00:00:00 2001
> +From: Tim Kientzle <kientzle@acm.org>
> +Date: Sun, 1 Mar 2026 10:04:01 -0800
> +Subject: [PATCH] Infinite loop in Rar5 decompression
> +
> +Found by: Elhanan Haenel
> +
> +Upstream-Status: Backport [https://github.com/libarchive/libarchive/comm=
it/ef53e2023d75a205cf7cbddb5d01c4cc592e9ce4]
> +CVE: CVE-2026-4111
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + Makefile.am                                   |   2 +
> + libarchive/test/CMakeLists.txt                |   1 +
> + .../test/test_read_format_rar5_loop_bug.c     |  53 +++++
> + .../test_read_format_rar5_loop_bug.rar.uu     | 189 ++++++++++++++++++
> + 4 files changed, 245 insertions(+)
> + create mode 100644 libarchive/test/test_read_format_rar5_loop_bug.c
> + create mode 100644 libarchive/test/test_read_format_rar5_loop_bug.rar.u=
u
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index dd1620d..14edb2a 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -507,6 +507,7 @@ libarchive_test_SOURCES=3D \
> + 	libarchive/test/test_read_format_rar_invalid1.c \
> + 	libarchive/test/test_read_format_rar_overflow.c \
> + 	libarchive/test/test_read_format_rar5.c \
> ++	libarchive/test/test_read_format_rar5_loop_bug.c \
> + 	libarchive/test/test_read_format_raw.c \
> + 	libarchive/test/test_read_format_tar.c \
> + 	libarchive/test/test_read_format_tar_concatenated.c \
> +@@ -869,6 +870,7 @@ libarchive_test_EXTRA_DIST=3D\
> + 	libarchive/test/test_read_format_rar5_invalid_dict_reference.rar.uu \
> + 	libarchive/test/test_read_format_rar5_leftshift1.rar.uu \
> + 	libarchive/test/test_read_format_rar5_leftshift2.rar.uu \
> ++	libarchive/test/test_read_format_rar5_loop_bug.rar.uu \
> + 	libarchive/test/test_read_format_rar5_multiarchive.part01.rar.uu \
> + 	libarchive/test/test_read_format_rar5_multiarchive.part02.rar.uu \
> + 	libarchive/test/test_read_format_rar5_multiarchive.part03.rar.uu \
> +diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists=
.txt
> +index 05c6fd7..c8f2e90 100644
> +--- a/libarchive/test/CMakeLists.txt
> ++++ b/libarchive/test/CMakeLists.txt
> +@@ -156,6 +156,7 @@ IF(ENABLE_TEST)
> +     test_read_format_rar_filter.c
> +     test_read_format_rar_overflow.c
> +     test_read_format_rar5.c
> ++    test_read_format_rar5_loop_bug.c
> +     test_read_format_raw.c
> +     test_read_format_tar.c
> +     test_read_format_tar_concatenated.c
> +diff --git a/libarchive/test/test_read_format_rar5_loop_bug.c b/libarchi=
ve/test/test_read_format_rar5_loop_bug.c
> +new file mode 100644
> +index 0000000..77dd78c
> +--- /dev/null
> ++++ b/libarchive/test/test_read_format_rar5_loop_bug.c
> +@@ -0,0 +1,53 @@
> ++/*-
> ++ * Copyright (c) 2026 Tim Kientzle
> ++ * All rights reserved.
> ++ *
> ++ * Redistribution and use in source and binary forms, with or without
> ++ * modification, are permitted provided that the following conditions
> ++ * are met:
> ++ * 1. Redistributions of source code must retain the above copyright
> ++ *    notice, this list of conditions and the following disclaimer.
> ++ * 2. Redistributions in binary form must reproduce the above copyright
> ++ *    notice, this list of conditions and the following disclaimer in t=
he
> ++ *    documentation and/or other materials provided with the distributi=
on.
> ++ *
> ++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS=
 OR
> ++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRA=
NTIES
> ++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIM=
ED.
> ++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
> ++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,=
 BUT
> ++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF=
 USE,
> ++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON AN=
Y
> ++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> ++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E OF
> ++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> ++ */
> ++#include "test.h"
> ++
> ++DEFINE_TEST(test_read_format_rar5_loop_bug)
> ++{
> ++  const char *reffile =3D "test_read_format_rar5_loop_bug.rar";
> ++  struct archive_entry *ae;
> ++  struct archive *a;
> ++  const void *buf;
> ++  size_t size;
> ++  la_int64_t offset;
> ++
> ++  extract_reference_file(reffile);
> ++  assert((a =3D archive_read_new()) !=3D NULL);
> ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
> ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
> ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, reffile,=
 10240));
> ++
> ++  // This has just one entry
> ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_next_header(a, &ae));
> ++
> ++  // Read blocks until the end of the entry
> ++  while (ARCHIVE_OK =3D=3D archive_read_data_block(a, &buf, &size, &off=
set)) {
> ++  }
> ++
> ++  assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &ae));
> ++
> ++  assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
> ++  assertEqualInt(ARCHIVE_OK, archive_free(a));
> ++}
> +diff --git a/libarchive/test/test_read_format_rar5_loop_bug.rar.uu b/lib=
archive/test/test_read_format_rar5_loop_bug.rar.uu
> +new file mode 100644
> +index 0000000..3e47004
> +--- /dev/null
> ++++ b/libarchive/test/test_read_format_rar5_loop_bug.rar.uu
> +@@ -0,0 +1,189 @@
> ++begin 644 test_read_format_rar5_loop_bug.rar
> ++M4F%R(1H'`0#%&C,R`P$``)T-9%L.`@+P0`"`@`P`@`,``6'(WFP@`?\7_U/^
> ++M8@!.`B`H````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++M````````````````````````````````````````````````````````````
> ++5```````````````````Y^;*!`@4`
> ++`
> ++end
> +--=20
> +2.25.1
> +
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/=
recipes-extended/libarchive/libarchive_3.6.2.bb
> index e74326b40f..85fe6e5baa 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
> @@ -50,6 +50,8 @@ SRC_URI =3D "http://libarchive.org/downloads/libarchive=
-${PV}.tar.gz \
>             file://0001-Merge-pull-request-2768-from-Commandoss-master.pa=
tch \
>             file://CVE-2025-60753-01.patch \
>             file://CVE-2025-60753-02.patch \
> +           file://CVE-2026-4111-1.patch \
> +           file://CVE-2026-4111-2.patch \
>             "
>  UPSTREAM_CHECK_URI =3D "http://libarchive.org/"
> =20


--=20
Yoann Congal
Smile ECS


