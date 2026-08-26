Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83D5C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:34:10 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7829.1787733242398817834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZNhqO0hw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482c58a8683so501983f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787733240; x=1788338040; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DMqVUI+hCY73uU56uFAZkBAsFLYfG49AdBcQaJAJEWU=;
        b=ZNhqO0hwsl3W+cradYalWMBoHBod9ZkEhfFZvAe5/tJNXoxtZiZ4mrSA/+s7iQ98gr
         /zEhTT9YLxPxIEUU8Rc7h8vW/gszuFRVm8uDX5vhQJv9ShRp5kMy3+t3stKIRZl2mixx
         PA9+RWGo7gtiLiyOtj46qCfizqB+N6NRkgKHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787733240; x=1788338040;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMqVUI+hCY73uU56uFAZkBAsFLYfG49AdBcQaJAJEWU=;
        b=hwRR0hS6WrEdfbieV+AP0MlsHnJPhzdtiszJWdx41/CS+M5u9qpRaNMacBGz8aSKdm
         Ojy6sxt6fNFyX8fqzEqDTw3SeVlY8cRL3TZzVXzQEpK0PDwyXdGhWOyiR/ZhnzAKKR/x
         5YeGvNcTnRAuuBjTQRMbIx4/LwcmMNd9pWVJxrNV1Kv7wqZOtchDbZILwI9N0eOgFkUz
         CTExV8AdXGKxM2Ohh5g1RciBxspGyRD/ZXmNwSmfoAhbrj/cl/mq0CdFcFU7uu3wQJOR
         IdAU4qRl6PXdfeXnAQG6OiPjpJVx+gY4WfwBZ14KbFlACJwYYvXwX/fTIEq/Y0xqwHoA
         bLNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqooYsOYmtlfzDYYgQZqDqtkgTvKr7a962XBG01qtGdAD9EZoUZl3A2dXloSjBjxcLZd0oYAPPTkk3LybAlGDn+6A==@lists.openembedded.org
X-Gm-Message-State: AFuF++kUDPElINiuxMPt85h5oW1is6OErCMBk8LCC90NlJaqYkE//Tn5
	zuK4NfLk9rD/U0PjIgWryOgM8567CsvTawFhj2gW15RaE5477Lk7KNpU9rv/CJAu45Y=
X-Gm-Gg: AR+sD10kkgudq3S3PQcVnIaljzGuYeyYWgkAw3Fnzo5RjayaMZl/fB1jX/aDdKTE3oO
	Btw8QdjIIN0hpxh+17smECxxdrfkZ4oP4Sjd+4PbY31X4kaJtljrSPK94rpPY1/R27aDJUvir++
	nKZTiHqPI6fIbOPlVE/3OByTkMoL6Pa4b7JZyrN9U/hqhqR4+/aVQzt/smhtOY/zCWkaIKQ3Gum
	ZlT0lP9o993SRuNsyKHhyWKg8M/bfRt0XYyzQxLN3y2pcdUoKgs4OCza7fQ6BB19i7A2TLGul9N
	VvMLuuztIwciDCiAzJSKQ4dF8gKSPuw7FJ5wZJzSRjI+CzYVPnmAMwdoMqNJ6CRkPMlVtGFvnKG
	9ffUGFbfVe2Jd600DliH9iueXxGBVvbGdlbgbh1sLsDbkdOSO7pfvJcf1COUaTvjAxIQp8pAsjo
	F3mKR8/k9HCtH/MNasfgmX7OshWwQ0qDyO3vDsQEHvR2saoJ4+EzEPspzVaKI86XMV/jPWdUzyI
	3n6oIy3+kEICW0vEWyALMpxbzphNiNjCH0isiD+IhS7zSMR7Jcuqg==
X-Received: by 2002:a05:6000:653:b0:482:d9ef:984a with SMTP id ffacd0b85a97d-482e26f16bbmr5617142f8f.10.1787733240335;
        Wed, 26 Aug 2026 01:34:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e581:1e52:aeaa:4925? ([2001:8b0:aba:5f3c:e581:1e52:aeaa:4925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbe1dsm2024992f8f.22.2026.08.26.01.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:33:59 -0700 (PDT)
Message-ID: <6511319d17498eae1dba2a199f07123ca8488454.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v5 1/5] kernel-module-split.bbclass: add
 get_ext_mod function for module signing
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anis Bougrine <anis.bougrine10@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com, peter.kjellerstedt@axis.com, Ross
 Burton	 <ross.burton@arm.com>
Date: Wed, 26 Aug 2026 09:33:58 +0100
In-Reply-To: <20260825204931.17628-2-anis.bougrine10@gmail.com>
References: <20260825204931.17628-1-anis.bougrine10@gmail.com>
	 <20260825204931.17628-2-anis.bougrine10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244368

On Tue, 2026-08-25 at 22:49 +0200, Anis Bougrine wrote:
> Fixes [YOCTO #12927]
>=20
> Out-of-tree module Makefiles invoke the kernel Makefile by appending
> the M=3D (the module directory) variable to the MAKEFLAGS.
> However, they usually do not provide a modules_sign target. Therefore,
> the kernel modules_sign target has to be invoked manually after retrievin=
g
> M=3D variable from package source code Makefile.
>=20
> This function retrieves the M=3D variable from an external module Makefil=
e.
>=20
> Reported-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
> ---
> =C2=A0.../kernel-module-split.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++++++++++++++++++
> =C2=A01 file changed, 21 insertions(+)
>=20
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/class=
es-recipe/kernel-module-split.bbclass
> index ab2f0d1c37..bde7cd02dd 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -42,6 +42,27 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
> =C2=A0KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
> =C2=A0KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
> =C2=A0
> +def get_ext_mod(d):
> +=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0 Extract the resolved Kbuild M=3D variable from an out=
 of tree module Makefile variable database.
> +=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0 import re
> +=C2=A0=C2=A0=C2=A0 import bb.process
> +
> +=C2=A0=C2=A0=C2=A0 try:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output =3D bb.process.run(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "make=
 -C %s --dry-run --print-data-base" % d.getVar("B")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )[0]
> +=C2=A0=C2=A0=C2=A0 except bb.process.ExecutionError:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return d.getVar("S")
> +
> +=C2=A0=C2=A0=C2=A0 for line in output.splitlines():
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m =3D re.match(r'^M\s*=3D\s*(=
.*)$', line)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if m:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n m.group(1).strip()
> +
> +=C2=A0=C2=A0=C2=A0 return d.getVar("S")
> +
> =C2=A0python split_kernel_module_packages () {
> =C2=A0=C2=A0=C2=A0=C2=A0 import re
>=20

Sorry, a couple of more things. I'm not sure if it helps but there is a
scripts/makefile-getvar which may be a simpler way to do this? It was
created for this kind of usage.

Also, we're aiming to move python functions into meta/lib/oe, probably
kernel.py in this case so new functions should really go in there.

Cheers,

Richard

