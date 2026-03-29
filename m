Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD5DFC9815
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:43:19 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38681.1774824191574114683
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mt+RpQ+9;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439c56e822eso4228761f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824190; x=1775428990; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Fy9UBW0zVp1MI+QVcm/hIgPUR49IXZpQ4zPStF+hHU=;
        b=mt+RpQ+9ujcNXbmr3PbTYGRXNFz2OpVxzEC3K+Uy/OY4VgVP5gHukMh2fAtvWYR3sE
         Rk7+QQMR309SWVmscABkqJIs8Xr6Asij9zFnsfjbL5+xYQP9PqtGQa+HhwjGudGRRYi2
         vdVOStD18HDkREtoTK6TfrgKmt6ay8dJh9Ltk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824190; x=1775428990;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Fy9UBW0zVp1MI+QVcm/hIgPUR49IXZpQ4zPStF+hHU=;
        b=AqK2x9m+l1iy1xrBBzgJcvRikVkAPVYmOrtHsQhCdjKm0kpiu+mAH4S7a7Tm90Uc7q
         EzBpCMeKfKgEwRavMCaQuA27yPUKmybMiRRPAeXfFtdF1ocfhxmsANWrYpvpCSepPAfs
         4cR10BmHGirbp/nsppGWqza6MSqke5TSt3qWAi8A2gF4Jp8skrdx5pTmUb5CiSFnRv9t
         lfz3j2dISiWPvGpKK2y2+ZintbW6U8pKmcuAaqvXt9XPpRVdaF2nOF+7TGcpNvZqFFZg
         Jtz90u0lekGmWrQkzs31/Rehc7GQjnOrnamsSSdM86092tH7zUnI3a6Np8iVKqbXdeya
         o7sw==
X-Forwarded-Encrypted: i=1; AJvYcCXTAqDweY0Z9WHtHUMErQZrngGsXxAwIgCDyMPFK2s7ZP1J5HuowfvckI/iNPIJ29MR9StmkXcOvogW3mF6IPz2+g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YykKNmKByY02RsjaM+ln0uF2+4dAlVgp6aj/KV5QwYkFFEvtroJ
	GOKX2drr1U2uab2CybKfbA9CgPNlHCNrsZy4t9Mpb59j+Da6SnjiTBV0NaPlEZpgqK9+DfiErQ0
	FElyJ0dY=
X-Gm-Gg: ATEYQzxqqb3P/yWgUVmJf+9KFQT4ytQNGQfB66Xhs1ltyBOqqJ2+8VnYYpnnhTSczSZ
	m/eKVW4X/LG0y1EkT/pnBxRfHOoiY8jpd6+94mamPE4CHi8k0X+C9NSxNzzGVUADYrCN7pd9f+K
	zHMl/kKx1Rmz1r5q3+47lIE9O6UjGSKAQLcJDKXXLRzzh0oHzASFsEmq0/Jl1DaqCdvF8Yan1cC
	3+VD3/1pF49nYR8+5kgWvCT29o4cpOuY6eaNwBxyJHzcR/g5zTN+OPQwyh4d7En+k71dmokI5Ck
	Ihsp3wvwf8n2bXSArhkUliMLpOhfG4sKi3NcGvgRXOBvcRLnw9mxp0lfeg9653nSlqmxY/RayfK
	IOxJ32w/H/eONobApXpWgqjtOe9TLU32OQcZR9GCXX3yWvCwoFm1BjbdUXCDdJTRgjzguop7yZu
	jyuvKfZaTEG+uBI2XlJ1vVFuIZ+BMeZXsVajp7NTST59+0dzKqzREh/HioUYXl0JxTdhNep/XU0
	bId6Yh1D2oo8tU=
X-Received: by 2002:a5d:5f88:0:b0:43b:498f:b039 with SMTP id ffacd0b85a97d-43b9ea16d89mr17667455f8f.9.1774824189943;
        Sun, 29 Mar 2026 15:43:09 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21ebef9sm15239033f8f.13.2026.03.29.15.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 15:43:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 00:43:09 +0200
Message-Id: <DHFMO0O3MYD7.3BMNTNGD4GKSS@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 14/16] libxml-parser-perl: fix for
 CVE-2006-10003
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <cover.1774823430.git.yoann.congal@smile.fr>
 <3841818496f190e76351efeb38c6427c03977cd8.1774823430.git.yoann.congal@smile.fr>
In-Reply-To: <3841818496f190e76351efeb38c6427c03977cd8.1774823430.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234178

On Mon Mar 30, 2026 at 12:37 AM CEST, Yoann Congal wrote:
> From: Hitendra Prajapati <hprajapati@mvista.com>
>
> Pick patch from [1].
>
> [1] https://security-tracker.debian.org/tracker/CVE-2006-10003
>
> More details :
> https://nvd.nist.gov/vuln/detail/CVE-2006-10003
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---

I did not wanted to send that patch, please ignore.

>  .../libxml-parser-perl/CVE-2006-10003.patch   | 73 +++++++++++++++++++
>  .../perl/libxml-parser-perl_2.47.bb           |  1 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/libxml-parser-perl/CVE-200=
6-10003.patch
>
> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003=
.patch b/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
> new file mode 100644
> index 00000000000..e9a4b692d2d
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
> @@ -0,0 +1,73 @@
> +From 08dd37c35ec5e64e26aacb8514437f54708f7fd1 Mon Sep 17 00:00:00 2001
> +From: Toddr Bot <toddbot@rinaldo.us>
> +Date: Mon, 16 Mar 2026 22:16:11 +0000
> +Subject: [PATCH] fix: off-by-one heap buffer overflow in st_serial_stack
> + growth check
> +
> +When st_serial_stackptr =3D=3D st_serial_stacksize - 1, the old check
> +(stackptr >=3D stacksize) would not trigger reallocation. The subsequent
> +++stackptr then writes at index stacksize, one element past the
> +allocated buffer.
> +
> +Fix by checking stackptr + 1 >=3D stacksize so the buffer is grown
> +before the pre-increment write.
> +
> +Add a deep nesting test (600 levels) to exercise this code path.
> +
> +Fixes #39
> +
> +Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
> +
> +CVE: CVE-2006-10003
> +Upstream-Status: Backport [https://github.com/cpan-authors/XML-Parser/co=
mmit/08dd37c35ec5e64e26aacb8514437f54708f7fd1]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + Expat/Expat.xs   |  2 +-
> + t/deep_nesting.t | 22 ++++++++++++++++++++++
> + 2 files changed, 23 insertions(+), 1 deletion(-)
> + create mode 100644 t/deep_nesting.t
> +
> +diff --git a/Expat/Expat.xs b/Expat/Expat.xs
> +index dbad380..f04a0cf 100644
> +--- a/Expat/Expat.xs
> ++++ b/Expat/Expat.xs
> +@@ -499,7 +499,7 @@ startElement(void *userData, const char *name, const=
 char **atts)
> +     }
> +   }
> +=20
> +-  if (cbv->st_serial_stackptr >=3D cbv->st_serial_stacksize) {
> ++  if (cbv->st_serial_stackptr + 1 >=3D cbv->st_serial_stacksize) {
> +     unsigned int newsize =3D cbv->st_serial_stacksize + 512;
> +=20
> +     Renew(cbv->st_serial_stack, newsize, unsigned int);
> +diff --git a/t/deep_nesting.t b/t/deep_nesting.t
> +new file mode 100644
> +index 0000000..8237b5f
> +--- /dev/null
> ++++ b/t/deep_nesting.t
> +@@ -0,0 +1,22 @@
> ++BEGIN { print "1..1\n"; }
> ++
> ++# Test for deeply nested elements to exercise st_serial_stack reallocat=
ion.
> ++# This catches off-by-one errors in the stack growth check (GH #39).
> ++
> ++use XML::Parser;
> ++
> ++my $depth =3D 600;
> ++
> ++my $xml =3D '';
> ++for my $i (1 .. $depth) {
> ++    $xml .=3D "<e$i>";
> ++}
> ++for my $i (reverse 1 .. $depth) {
> ++    $xml .=3D "</e$i>";
> ++}
> ++
> ++my $p =3D XML::Parser->new;
> ++eval { $p->parse($xml) };
> ++
> ++print "not " if $@;
> ++print "ok 1\n";
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb b/meta=
/recipes-devtools/perl/libxml-parser-perl_2.47.bb
> index 803164f713d..6a36b763a83 100644
> --- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
> +++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
> @@ -8,6 +8,7 @@ DEPENDS +=3D "expat"
> =20
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/T/TO/TODDR/XML-Parser-${PV}.tar.g=
z \
>             file://0001-Makefile.PL-make-check_lib-cross-friendly.patch \
> +           file://CVE-2006-10003.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "ad4aae643ec784f489b956abe952432871a622d4e2b5c619=
e8855accbfc4d1d8"


--=20
Yoann Congal
Smile ECS


