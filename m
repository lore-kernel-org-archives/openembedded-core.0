Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5424CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:35:55 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5600.1791840954059017858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dZbsiiJj;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so23741995e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 14:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791840952; x=1792445752; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BgrPVgZjE0ie9w9toQmIkvADuW7nUNc2FQPYMyfxXTE=;
        b=dZbsiiJj/a2h+y78NBauSXhlUVIK3JnKtCzhs9eb3+1UQ7rs8eNsT4x+lH1pDTF+uW
         bHa+LpypEX18Hl1sCLVAxYGrs/+8cUEoGj0W/Xqh/HMZHZIDm9M/DRyUP6OXMTKbkCiH
         kGLESk1T3VoTGSNU9WO1lD9LNOixFcYf2VnUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791840952; x=1792445752;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BgrPVgZjE0ie9w9toQmIkvADuW7nUNc2FQPYMyfxXTE=;
        b=VccbTsRTdCOISOQP9/TNbW0fCkPb4Jhidp7S5AO06gnoImBootqP13hfTf7bc3JMaG
         YY753Pnp7qC5AZ2UiPRIJz8h6U+ad6l8T2JOPlvHk6Q0DtgmvGalUUVt0YVyT8O3Xat7
         2PzF5i/L27156RhS7nawLFbbQ9/TactXpP5fjpmCtrmYx5v6JVGrmJYgeWVkF4y6SFnf
         C/m7bu64C6NemzF7zRoq8/lzbobrh3T6opcnjHZOM4w56a8yGLERImYubBC2euAfmZXR
         +wbDSNS4Z4kO6IXvGzNA13HXwfkO9tzwRJqDJNxnMDKy5e3zJ6CmwO2WePMMe1v8YxWm
         c60Q==
X-Forwarded-Encrypted: i=1; AKwUvBw+jae9z9sPUGDTpurSBB4pHlEZMZXtHNYo1ks+P1O6xMuzWzeH6xgfOjAxvMTJmQSOMa/dR40MmkQDzz3CwBO55Q==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJc+c6tRuPiZ8zQaQPgUbUCIa2GADnXvyr13xChhR4m9Cr5iv9b
	BBLbpY2VPE4QoaNbs+bNutkqzz9C+DcXMzxc8emkAarbpNEc6dZ4gNRTcyMa9XLfmkM=
X-Gm-Gg: AYBFou1HM77frOqmuStCwl1c4rTnlJHukjfQd2HuKCrW2xWSW7tACIZTpkkQD9bpNC6
	yVdqRqqwr2t0otP3PewyjIGssQUKkqabmRaVLAZCGGxKgWleJJVJRx0bJtIOXjx+ykQedOAPLyx
	MZnbszUkw4EcQefSOTG6U0FG/es9bslOPvq5MWOZQSi77NozTz/asR5/5ofs41/ZOTjWNjw4VY5
	D4TzcmcldVCiZuS/bNWBLB/Crr4g1/L9UTFt6YqL5ODDeKGUw8vcqIjaxkwPHCAPz2SZ9FPk1FG
	XBzYn4w39nBwLYWdXmfFbLubvCxqwOHV+DioPkf6VA9pHmgOZ4WmGKPCIbgudFyVSGhfN4OT/eQ
	iDgeA2ykuAx1KvmYXt/e5i3ytap+s66PwkvCJZXPC2lAagpxZMNKA7dk80GEjVf1BdiiRUxvm8q
	mnzdgEB/whUtWgNE7P4euXG2+s4EltWj6Nid+A+8LXCFjEzlLZszyMRzw0292F2/Y4faAbzx1O/
	9M0zvm40bV2iEg3s9R7Nrms3HOxVyVSTvFOWKjlrn2C81vdT5LpbAhaZjvqGg==
X-Received: by 2002:a05:600c:8b65:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a18e4ca244mr190817445e9.27.1791840952065;
        Mon, 12 Oct 2026 14:35:52 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4764sm1327903f8f.25.2026.10.12.14.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 14:35:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 23:35:51 +0200
Message-Id: <DM36LT8OIOKL.36QN6AXZ0AO52@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCHv2 1/2] glibc: Fix CVE-2026-5450
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <souravkumar.pramanik@bmwtechworks.in>
To: <UpStream_IP-SP@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261005055601.111500-1-UpStream_IP-SP@bmwtechworks.in>
In-Reply-To: <20261005055601.111500-1-UpStream_IP-SP@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 21:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247688

Hello,

On Mon Oct 5, 2026 at 7:56 AM CEST, Sourav Kumar Pramanik via lists.openemb=
edded.org wrote:
> From: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
>
> This change fixes CVE-2026-5450

Why? Please explain why you think this patch does fix this CVE (Usually
it comes from NVD data)

>
> Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=
=3D839898777226a3ed88c0859f25ffe712519b4ead]
^ This line is only useful in the patch file itself, not in the commit
message.

>
> Comment: Patch refreshed as per glibc 2.39 source code
Sorry but this comment states the obviously and does not provide
information about what was modified during the refresh.

>
> Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.i=
n>
> ---
>  .../glibc/glibc/CVE-2026-5450.patch           | 113 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
>  2 files changed, 114 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-5450.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-5450.patch b/meta/rec=
ipes-core/glibc/glibc/CVE-2026-5450.patch
> new file mode 100644
> index 0000000000..adea5c3f01
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2026-5450.patch
> @@ -0,0 +1,113 @@
> +From 839898777226a3ed88c0859f25ffe712519b4ead Mon Sep 17 00:00:00 2001
> +From: Rocket Ma <marocketbd@gmail.com>
> +Date: Fri, 17 Apr 2026 23:48:41 -0700
> +Subject: [PATCH] stdio-common: Fix buffer overflow in scanf %mc [BZ #340=
08]
> +
> +* stdio-common/vfscanf-internal.c: When enlarging allocated buffer with
> +format %mc or %mC, glibc allocates one byte less, leading to
> +user-controlled one byte overflow. This commit fixes BZ #34008, or
> +CVE-2026-5450.
> +
> +CVE: CVE-2026-5450
> +Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=
=3D839898777226a3ed88c0859f25ffe712519b4ead]
> +Comment: Patch refreshed as per glibc 2.39 source code

(See above about "Comment:")


> +
> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> +Signed-off-by: Rocket Ma <marocketbd@gmail.com>
> +Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
> +Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.=
in>
> +---
> + stdio-common/Makefile              |  4 ++++
> + stdio-common/tst-vfscanf-bz34008.c | 48 +++++++++++++++++++++++++++++++=
++++++
> + stdio-common/vfscanf-internal.c    |  6 +++---
> + 3 files changed, 55 insertions(+), 3 deletions(-)
> + create mode 100644 stdio-common/tst-vfscanf-bz34008.c
> +
> +diff --git a/stdio-common/Makefile b/stdio-common/Makefile
> +--- a/stdio-common/Makefile
> ++++ b/stdio-common/Makefile
> +@@ -266,6 +266,7 @@ tests :=3D \
> +   tst-vfprintf-width-i18n \
> +   tst-vfprintf-width-prec \
> +   tst-vfprintf-width-prec-alloc \
> ++  tst-vfscanf-bz34008 \
> +   tst-wc-printf \
> +   tstdiomisc \
> +   tstgetln \
> +@@ -401,6 +402,9 @@ tst-printf-bz18872-ENV =3D MALLOC_TRACE=3D$(objpfx)t=
st-printf-bz18872.mtrace \
> + tst-vfprintf-width-prec-ENV =3D \
> +   MALLOC_TRACE=3D$(objpfx)tst-vfprintf-width-prec.mtrace \
> +   LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
> ++tst-vfscanf-bz34008-ENV =3D \
> ++  MALLOC_CHECK_=3D3 \
> ++  LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
> + tst-printf-bz25691-ENV =3D \
> +   MALLOC_TRACE=3D$(objpfx)tst-printf-bz25691.mtrace \
> +   LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
> +diff --git a/stdio-common/tst-vfscanf-bz34008.c b/stdio-common/tst-vfsca=
nf-bz34008.c
> +new file mode 100644
> +--- /dev/null
> ++++ b/stdio-common/tst-vfscanf-bz34008.c
> +@@ -0,0 +1,48 @@
> ++/* Regression test for vfscanf %Nmc out-of-bound write (BZ #34008)
> ++   Copyright (C) 2026 The GNU Toolchain Authors.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <https://www.gnu.org/licenses/>.  */
> ++
> ++#include "malloc/mcheck.h"
> ++#include <stddef.h>
> ++#include <stdio.h>
> ++#include <string.h>
> ++#include <wchar.h>
> ++#include <stdlib.h>
> ++#include <malloc.h>
> ++#include <support/check.h>
> ++
> ++#define WIDTH 0x410
> ++#define SCANFSTR "%1040mc"
> ++static int
> ++do_test (void)
> ++{
> ++  mcheck_pedantic (NULL);
> ++  char *input =3D malloc (WIDTH + 1);
> ++  TEST_VERIFY (input !=3D NULL);
> ++  memset (input, 'A', WIDTH);
> ++  input[WIDTH] =3D '\0';
> ++
> ++  char *buf =3D NULL;
> ++  TEST_VERIFY (sscanf (input, SCANFSTR, &buf) !=3D -1);
> ++  TEST_VERIFY (buf !=3D NULL);
> ++
> ++  free (buf);
> ++  free (input);
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +diff --git a/stdio-common/vfscanf-internal.c b/stdio-common/vfscanf-inte=
rnal.c
> +--- a/stdio-common/vfscanf-internal.c
> ++++ b/stdio-common/vfscanf-internal.c
> +@@ -857 +857 @@ __vfscanf_internal (FILE *s, const char *format, va_list=
 argptr,
> +-			      + (strsize >=3D width ? width - 1 : strsize);
> ++			      + (strsize >=3D width ? width : strsize);
> +@@ -928 +928 @@ __vfscanf_internal (FILE *s, const char *format, va_list=
 argptr,
> +-			=3D strsize + (strsize > width ? width - 1 : strsize);
> ++			=3D strsize + (strsize >=3D width ? width : strsize);
> +@@ -983 +983 @@ __vfscanf_internal (FILE *s, const char *format, va_list=
 argptr,
> +-		      =3D strsize + (strsize > width ? width - 1 : strsize);
> ++		      =3D strsize + (strsize >=3D width ? width : strsize);

The above 3 hunks have no context which greatly increase the chances of
a badly applied patch.

Can you send a v3 with the usual "3 lines of context"?

> +--=20
> +2.43.7
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
> index 88ad5e44e8..b01225e530 100644
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -57,6 +57,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
>             file://0023-qemu-stale-process.patch \
>             file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patc=
h \
>             file://0024-CVE-2026-5435.patch \
> +           file://CVE-2026-5450.patch \
>  "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"

Thanks!
--=20
Yoann Congal
Smile ECS


