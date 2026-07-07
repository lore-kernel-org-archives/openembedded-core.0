Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038DEC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:45:28 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.173664.1783431925884593363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 06:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0zDRCSsB;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47362928f65so3994610f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 06:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783431924; x=1784036724; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1w4ADb1pxcZMmWyYx5a3rxnWuzRPUzQG2U1M+e6mis=;
        b=0zDRCSsBgC49r7KCtlkNY4Oq04bAu99OrNZomZT5R4ylmM5p1MzFvxKFvVaWs8IzvY
         XKKnObc4Mr4x+IM4K0EMdweYtLjOrguMCKDFUQlNh/3ZZjUvKHOVjlhdK7YXZfckCbQZ
         K+A5HXZX0sILeJ/yPk0xRtxrH10ImJdPTFeiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431924; x=1784036724;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1w4ADb1pxcZMmWyYx5a3rxnWuzRPUzQG2U1M+e6mis=;
        b=auLFCoEZc9y7CGNKwrKtBS70c4wec9IFXd9iUp39nK5dtNja+CZuE/B8WCKJiTEYUz
         dsvHm91Q5SN7wf7RwZ6Aq3HC+uSjltj7Qt9Pls6aTh51Me5Cf1z/y4yd6GWyRIe1J7nL
         P64RpizHVfD5enbnq0EQECa5ZySkdZh9wWBTlDUIj1raHUzygXQuwrd1fbZUgNfI4xRU
         8ygDCRhLvx5QapP/xkdwi7GF+sjVrUiPsMoWeWpnLTE6tykn7AGj676I+ZIn6uf09sRU
         PMVAl7vTziLBfmctjAJIs/Gvgj415IEh0MwpY2Ij+zOTUOCUwtxhPGFPICqXlr8UrELS
         jE9g==
X-Forwarded-Encrypted: i=1; AHgh+RrM/Vn65IJwiq0yhmy7b3D9O4EtzU1Yb/50PbZGlsmWo2gOIlIIRxNyYXgucbBQK2ap34rbf66N6M9C81ot+Xg5sw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw09r1RP3QaJkTPP5V91FuXNz5EaTN8ukEgnYfVerTE/7fTpXFc
	zU3ZXnYdtysQQmCVMXlgip4lEBULA93JEBpzBPstjrZE0H3XazYMqhSN90Fd71+dpRMOv+02xOZ
	i2MTbIww=
X-Gm-Gg: AfdE7cmMdnaBSxJQXnRmNG+KAiU3Z5wB8qaGc1KV3rT6Dd4uiMYz4NYg50VEIfXtKSE
	x1H7ARW6R+xEke2+OQ7miv7h+dfLQda9gsM+ENjAG0/FxmyiHtmeewC+TD18Tx/IXnwnpY7PHsh
	Lg3dRHxZpRGdYxAvSuFa0mbxZp61Z3RAvA07i2I015gMo41iQUHL1pob4BHPY7T7jXM/dEaDcI7
	7Cy71hcbAEow880AsDdd3dQqNqhrx5VGuZLWONdB6bwzld/3fG0WMvk6Vo0WgRbphXGRgpwyA98
	ctJtywzFMKyIHq5u2oVTboNjUMnKmzp+HHehfVrvVkJoUbViMA0pa/AgHz0Le7qMVKU9g/o2F2c
	QFwPvQb2vFoSNT6og+sD7Huy+Hc7MXcuhonXpvhZn1nzfdPHgyltKcEBOgllrcxG9tBDNHd2XMV
	LsCE+ckAQng9KXu/Is8PFSIUz5fB1Ssx1JeYyWOS1Rpc+QkDH8c9QvxVmxqNlWjzhkI0mHKJJS
X-Received: by 2002:a05:6000:4694:b0:475:f0d1:eb6c with SMTP id ffacd0b85a97d-47de666d439mr3906858f8f.57.1783431923821;
        Tue, 07 Jul 2026 06:45:23 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm33606557f8f.24.2026.07.07.06.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:45:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 15:45:23 +0200
Message-Id: <DJSDUQYWTQ41.S7H4ENLDNW1R@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: fix CVE-2025-69649, and
 CVE-2025-69652
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <roland.kovacs@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260630082509.34865-1-roland.kovacs@est.tech>
In-Reply-To: <20260630082509.34865-1-roland.kovacs@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 13:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240387

Hello,

On Tue Jun 30, 2026 at 10:25 AM CEST, Roland Kov=C3=A1cs via lists.openembe=
dded.org wrote:
> CVE-2025-69649:
>   Null pointer dereference in readelf before 2.46 results in segfault whe=
n
>   processing a crafted ELF binary with malformed header fields.
>   No evidence of memory corruption beyond the null pointer dereference, n=
or
>   any possibility of code execution, was observed.
>
> CVE-2025-69652:
>   Null pointer dereference in readelf when processing a crafted ELF binar=
y
>   with malformed DWARF abbrev or debug information which leads to SIGABOR=
T.
>   No evidence of memory corruption or code execution was observed; the im=
pact
>   is limited to denial of service.
>
> Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
> ---
>  .../binutils/binutils-2.42.inc                |  2 +
>  .../binutils/binutils/CVE-2025-69649.patch    | 36 +++++++++++++++++
>  .../binutils/binutils/CVE-2025-69652.patch    | 39 +++++++++++++++++++
>  3 files changed, 77 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6964=
9.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6965=
2.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index 1a865c45f4..da954fc138 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -74,5 +74,7 @@ SRC_URI =3D "\
>       file://0030-CVE-2025-11840.patch \
>       file://CVE-2025-69647.patch \
>       file://CVE-2025-69648.patch \
> +     file://CVE-2025-69649.patch \
> +     file://CVE-2025-69652.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
> new file mode 100644
> index 0000000000..4865ad6535
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
> @@ -0,0 +1,36 @@
> +From 9d26af3871d5b8f8dd9c6b17987845e1f774eac4 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Mon, 8 Dec 2025 15:58:33 +1030
> +Subject: [PATCH] PR 33697, fuzzer segfault
> +
> +	PR 33697
> +	* readelf.c (process_relocs): Don't segfault on no sections.
> +
> +CVE: CVE-2025-69649
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbin=
utils-gdb.git;h=3D66a3492ce68e1ae45b2489bd9a815c39ea5d7f66]
> +
> +Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
> +---
> + binutils/readelf.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/binutils/readelf.c b/binutils/readelf.c
> +index 5e4ad6ea6ad..8c1987ffaec 100644
> +--- a/binutils/readelf.c
> ++++ b/binutils/readelf.c
> +@@ -8961,9 +8961,9 @@ process_relocs (Filedata * filedata)
> +       size_t i;
> +       bool found =3D false;
> +=20
> +-      for (i =3D 0, section =3D filedata->section_headers;
> +-	   i < filedata->file_header.e_shnum;
> +-	   i++, section++)
> ++      section =3D filedata->section_headers;
> ++      if (section !=3D NULL)
> ++	for (i =3D 0; i < filedata->file_header.e_shnum; i++, section++)
> + 	{
> + 	  if (   section->sh_type !=3D SHT_RELA
> + 	      && section->sh_type !=3D SHT_REL

This backport is sensibly different from the upstream commit. Upstream
has a short for loop but your patch is at the start of a really long
one!

Can you justify why your backport is safe & correct?

Thanks!
--=20
Yoann Congal
Smile ECS


