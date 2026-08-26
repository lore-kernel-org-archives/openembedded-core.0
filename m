Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE6BC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 23:16:17 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25158.1787786174995416171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 16:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZoYfh8aR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482e2fdf5abso610181f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 16:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787786173; x=1788390973; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T4prCF1w4IsjDKZ8B95+kza1mawRqLyn4zyQUcb/7RI=;
        b=ZoYfh8aRu3ETblR6EncjPWDcd10bBxm2lAx8wZlrK6GEK/xvyX9VVaGBAvJ4RC2usR
         8CSjV0yKP+uEMBDAoShwmB7+t4V1vFT5FNh1Q+f0h6E+M8oxYln3RfeOkIS4RzgNoc7Y
         J6yXC0j2CIETUa2BbxgwMdoaEskf2a1W/EUsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787786173; x=1788390973;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4prCF1w4IsjDKZ8B95+kza1mawRqLyn4zyQUcb/7RI=;
        b=HbX6NB8b0FcKX2TTFCQCSiBtXoLDmNluyOB+7INUKKB+llZ7kF0+WwP5Tke7Ie7olh
         guX0tnxBVw3yk3vbWUbuBDkUVMzf+lmX9N00fsC/GHAToe+PtmnSXPbFb6s0OQGRYU9t
         BwVBNsMAVSGkb0RHbs17N8OhDFG6YknWSA2FwJltmjm1jf0LupLtjrRNFw9hQTpycYCv
         c57znZlXrktQdMiNQAA7grscsXAPln3KHeaxoVUUObcyrzQQfqRNlpk3INbg0FbhYDno
         ZPLbr66KY4MdvEmVNrYUJYWILduswb5XG30kJim0o9ymR6wUU8m9ZRXBKUjd9Kl23h5M
         6WdA==
X-Forwarded-Encrypted: i=1; AHgh+RpT3+T71iLL0OZBt/BaJxiZjhXRx8UWBS/vzRJ3YFko5wuBCpDiuAb6VUW/okcxw4oLZeOkkUVQamJz5Sdk4kBwoA==@lists.openembedded.org
X-Gm-Message-State: AFuF++ln3LL2UAfs9xm5WiRMVs/mVuReIT5h+TnnMwtIEac89uzPB7Gn
	Hn1gLqc5gMLvSbo1E4cJMja6cUhysycV5bKL+WXYem4DmC7AomvE7lFxvhZMhFIl03A=
X-Gm-Gg: AR+sD106jtuT0sBPvtM36Mwzc2Sk1KC2HxReKb1AtbPWgcc2PgqO+NjLCApRkKGrw/J
	g8vqddeYxOIWj1dEVwwFR1CrCuo2V95MEmY3wqiGAV+6wQlKq7bLO4yZOdhAIA8jo820ZvGj5Dw
	Z4EvILUNA9dQLB0zLaRAqLi50V2DZcpAlxnZyhaMkptquPQDjU2AxgzX3MWKmJXozGWOXp1Zxx8
	aqDZ+4TVzUHlWCLJoeHArcsleGip3cE9LtNRRsLxZ2A38G7FGbGeTnAcbIN4zqjU6IJV2XYl4UC
	9iI61AHR3tGucw2O/6O/CZbG7mA/ceHI229uUd0uWT2VvdiwB10h3g7Y8edUXAUPimGwtbX97Ly
	DFqa1CMY3RT/7i+F7YFoHDqA0NQId5Cqc/KqV58yDgv4X8wClR8EI3GUTcqfBdPy9CD0Ci//LVz
	7/lEX8ICRk9P8jxLWH/Q9ZxkH62vLc68w7X1PusoIlkjRszyG5jF65DSrZ3c4UPS6R5c/v/UN81
	UFwKMVt7ppc/meI/Z8F1zsVGHcTU8AESB5DCCDkao+rQgCwyeCstQ==
X-Received: by 2002:a05:600c:3acf:b0:499:5210:c537 with SMTP id 5b1f17b1804b1-499dc6ea13emr114648785e9.1.1787786172925;
        Wed, 26 Aug 2026 16:16:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e581:1e52:aeaa:4925? ([2001:8b0:aba:5f3c:e581:1e52:aeaa:4925])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b465226d8sm4271875e9.0.2026.08.26.16.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 16:16:11 -0700 (PDT)
Message-ID: <cb8e455c527739e2777cca0e026d9f9aabfce81a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v18 10/16] pkgconf: add /usr/bin/pkg-config to
 RPROVIDES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sumanth.gavini@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com, 
	mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com, 
	randy.macleod@windriver.com
Date: Thu, 27 Aug 2026 00:16:10 +0100
In-Reply-To: <20260826214548.3002838-11-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
	 <20260826214548.3002838-11-sumanth.gavini@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 23:16:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244434

On Wed, 2026-08-26 at 14:45 -0700, Sumanth Gavini via lists.openembedded.or=
g wrote:
> RPM 6's fileattr script generator produces Requires: /usr/bin/pkg-config
> for packages that call pkg-config in their scriptlets. Add
> /usr/bin/pkg-config as an explicit RPROVIDES in pkgconf so these
> file-path dependencies resolve correctly.
> Remove /usr/bin/pkg-config from nativesdk-sdk-provides-dummy.bb since
> pkgconf now provides it explicitly via RPROVIDES.
>=20
> Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
> ---
> =C2=A0meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 1 -
> =C2=A0meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A02 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/met=
a/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> index 6075770bf0..37dad54409 100644
> --- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> @@ -11,7 +11,6 @@ DUMMYPROVIDES =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 /bin/sh \
> =C2=A0=C2=A0=C2=A0=C2=A0 /bin/bash \
> =C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/env \
> -=C2=A0=C2=A0=C2=A0 /usr/bin/pkg-config \
> =C2=A0=C2=A0=C2=A0=C2=A0 libGL.so()(64bit) \
> =C2=A0=C2=A0=C2=A0=C2=A0 libGL.so \
> =C2=A0"
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_3.0.6.bb
> index 471433e7b5..0249c87878 100644
> --- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
> +++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
> @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://pkgconf.org"
> =C2=A0BUGTRACKER =3D "https://github.com/pkgconf/pkgconf/issues"
> =C2=A0SECTION =3D "devel"
> =C2=A0PROVIDES +=3D "pkgconfig"
> -RPROVIDES:${PN} +=3D "pkgconfig"
> +RPROVIDES:${PN} +=3D "pkgconfig /usr/bin/pkg-config"
> =C2=A0
> =C2=A0# The pkgconf license seems to be functionally equivalent to BSD-2-=
Clause or
> =C2=A0# ISC, but has different wording, so needs its own name.
>=20

This reverts half of patch 5 in the series. Do we still need patch 5 at all=
?

Do we need the RPROVIDES of /usr/bin/pkg-config if we have the pkg-
config dependency code in rpm disabled (e.g as in patch 16)?

Cheers,

Richard

