Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2397FC88E63
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:21:36 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6050.1789330885166120969
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CzucGntl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49e717c9841so6936575e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 13:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789330883; x=1789935683; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rJ+LqRvrsORtnLZWnaB8FQ4QP6osiCm3u2N2c8VzeMc=;
        b=CzucGntlUBwHgfQid3MYQSgsz9NxWqtDGeFodik79pnLL7+v1cB/zVH3Jkt9iBvZSn
         XXXGYnyeGAUyM+DdZfOFSL8R1lI/a/wCGTajEwbhgsJ984IAN0KIp6SP/xMmrPD+HkJs
         rMSJ9WkjkvsfqI7mvozdr03Aa7mUWbfGFD/6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330883; x=1789935683;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJ+LqRvrsORtnLZWnaB8FQ4QP6osiCm3u2N2c8VzeMc=;
        b=rF+xVrLfpsDLECNyroWyBGT0Og63uukZm0Xfmt0k6dxc5RtBPLjYg/ty5Z8yO7OfUM
         s9dpoq345YRgRacvS/QkbfEah4MNZQCF80wwpW+jHEM+kLb2+nZxCItLcpIIt1pDB+FS
         cruHuGZHCs9Cy7cXVPU12q5J1BJG7O33ExcYgiUaqvUBWEuDXHWY8zWErp4FUDmJ0KHF
         5aoSuvEz486DwpCapqXnXC7rAxdaVVXk/AN6NKYUyvwGgtQZa5g4gXfR3Bx0nJTynOkd
         Ovpg3aVeggIQPiVaB+v6tYYrSiM+aDL/zjtWYQVKwWha8vB6BioqZb9rF824/jZ88Tgl
         lZ/w==
X-Forwarded-Encrypted: i=1; AKwUvBzNiGOmhzvgzoklejID4i6hBtcMc8d31G9Opy4zDQxUNUC3dtqF4MjIp5NbzIoQgStY6WHZC3HFkgHKhJpdBzYj5Q==@lists.openembedded.org
X-Gm-Message-State: AFuF++mwI4df6ZOQ9IDJGFiUfH0SsXUxe7sR0/dpcvDt8UTNzjXNhxSZ
	WCc3LB7k+2Yb1DRYXkbaqwmeDNsDrvBD3JGOWfaU5v9W0NjwIpTjE1T1V81ZAcXzdXc=
X-Gm-Gg: AYBFou2U2ucwzO12uqPLkE08BeZ4yXh3AreqsCFclQPSIalK6PVKp7tA4cnTUtj/k7s
	ttIL7f2nsaK+fRdTN50kOWjBG/2+vRyIc/OttRvkgzzy9AiIjJJqNkAKgJQ4B59x0Y/Jggux0T4
	4dd45Kj8qRVbpN7acnVkLl8QwBAynlT8c0nPoNrHtBSkbFp3xJQwa6WqKYIK4T8ZgxpmIS8ehCa
	lDS+7689qMTO6jWT9vVoectH+cGWWoK6qsyEanAJI5uagaC+Bdwbp/dxZn8AfCtk2jjTx8F6DP3
	pPlcCsBce4VnUUU6/ON7SCIu6CbVEcONJ805LgWuphLzX+5XqNfmUT7XgnE/Fsh4rvV4icp2pG0
	9hAoRKufRf0lskUwoqT4uZaMc2gr7lOunO65nGtWEX/ygSs5sDdzs1F8Tf8b+gPOWhql0Gmi//Z
	1f72uPNdwQIQChEIwQYyZByCXe8SbUoVTNoE25q60v667Kk1Zn8hpC6xsvyksE02TJLmrHF3db0
	p6wZEZA/O3DA0z867oVxgdAFwliWokvYe3GZ/Vt/Pf1CxFTjE8+r6CrLoArowt40A==
X-Received: by 2002:a05:600c:3513:b0:49c:fc6e:a3d2 with SMTP id 5b1f17b1804b1-49e619bfdc8mr142633155e9.17.1789330883242;
        Sun, 13 Sep 2026 13:21:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3? ([2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f1f7sm21571677f8f.24.2026.09.13.13.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:21:22 -0700 (PDT)
Message-ID: <3d12110d88ce771519ccedb12e7b6d0d24d7d17a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] flex: fix stage1flex build under a C23 default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: aurelien@hackers.camp, openembedded-core@lists.openembedded.org
Cc: aurelien.desbrieres@gmail.com
Date: Sun, 13 Sep 2026 21:21:21 +0100
In-Reply-To: <20260913160558.2569053-1-aurelien@hackers.camp>
References: <20260913160558.2569053-1-aurelien@hackers.camp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245739

On Sun, 2026-09-13 at 18:05 +0200, Aurelien DESBRIERES via lists.openembedd=
ed.org wrote:
> lib/malloc.c declares "void *malloc ();" with an empty parameter list
> and calls it with one argument. That meant "unspecified" in C89 and
> means "none" in C23, so the call is rejected:
>=20
> =C2=A0 lib/malloc.c:16:15: error: too many arguments to function 'malloc'=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 expected 0, have 1
>=20
> It is the language mode that decides, not the compiler version: the
> same GCC 16 compiles the file with -std=3Dgnu17 and rejects it with
> -std=3Dgnu23. GCC 15 made gnu23 the default, so every host from that
> release on hits it while GCC 14 does not.
>=20
> The file is compiled by stage1flex -- the bootstrap scanner flex builds
> with the host compiler before it can build itself -- so neither CFLAGS
> nor BUILD_CFLAGS reaches that command line and no flag in the recipe
> can silence it.
>=20
> stdlib.h has the right declaration and the file already includes
> sys/types.h for size_t. lib/realloc.c includes stdlib.h already and
> needs no change.
>=20
> Signed-off-by: Aurelien DESBRIERES <aurelien@hackers.camp>
> ---
> =C2=A0...b-malloc-declare-malloc-via-stdlib.h.patch | 38 ++++++++++++++++=
+++
> =C2=A0meta/recipes-devtools/flex/flex_2.6.4.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> =C2=A02 files changed, 39 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/flex/flex/0001-lib-malloc-=
declare-malloc-via-stdlib.h.patch
>=20
> diff --git a/meta/recipes-devtools/flex/flex/0001-lib-malloc-declare-mall=
oc-via-stdlib.h.patch b/meta/recipes-devtools/flex/flex/0001-lib-malloc-dec=
lare-malloc-via-stdlib.h.patch
> new file mode 100644
> index 0000000000..a64d6220a8
> --- /dev/null
> +++ b/meta/recipes-devtools/flex/flex/0001-lib-malloc-declare-malloc-via-=
stdlib.h.patch
> @@ -0,0 +1,38 @@
> +From: Aurelien Desbrieres <aurelien@hackers.camp>
> +Date: Sat, 13 Sep 2026 00:00:00 +0200
> +Subject: [PATCH] lib/malloc.c: declare malloc via stdlib.h
> +
> +The gnulib fallback declares "void *malloc ();" with an empty parameter
> +list and calls it with one argument. That meant "unspecified" in C89 and
> +means "none" in C23, which GCC 14 and later implement by default, so the
> +call is rejected:
> +
> +=C2=A0 lib/malloc.c:16:15: error: too many arguments to function 'malloc=
';
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 expected 0, have 1
> +
> +stdlib.h has the right declaration and the file already includes
> +sys/types.h for size_t, so the local one has nothing to add.
> +lib/realloc.c includes stdlib.h already and needs no change.
> +
> +The file is dead code wherever malloc(0) returns non-NULL -- glibc
> +included -- since AC_FUNC_MALLOC substitutes rpl_malloc only where it
> +does not, but it is compiled regardless and the build stops there.
> +
> +Upstream-Status: Inappropriate [flex 2.6.4 is the last release, 2017]

I'm not sure I follow that reasoning. It might be better to follow what
upstream did:

https://github.com/westes/flex/commit/bf254c75b1e0d2641ebbd7fc85fb183f36a62=
ea7

so this patch is then a backport and will fall out if/as/when we do see
another release of flex?

Cheers,

Richard



