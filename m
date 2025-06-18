Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9464BC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:17:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.3003.1750238215692398775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fl0E+b+T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d54214adso51371265e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750238214; x=1750843014; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WI5eokaJkkZ5ohzXxSm+M9LI6w86l5duO/XUupnUpM0=;
        b=Fl0E+b+Ti1lsnahzizT58/tref9fu/WeW4qCVcp3JOW6jwNSqCh7edJFeJPajSUExo
         0Bbu0ZEotOxPtpYZaR4ZnuW6AQVOBfqqz4amOuQjGfFdkCWEtg3ewC/TWfn6KloPeQDl
         yptFEh9h/an6eOHXTTnJFIaz3AdL+uhCnoBn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238214; x=1750843014;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WI5eokaJkkZ5ohzXxSm+M9LI6w86l5duO/XUupnUpM0=;
        b=r2SBe7BahlJJO/K6nF6lpalxIy8Mw07Wm5jqLG47xnBIRWpdbQKC4fd/cK0RGc9si9
         c1QxaIMZxvdWtFppd8oNa/EA+T9NMRBmv/ZzK+JWE74MY+DnWyuK/AGtC6RsdMjmWePA
         PsAqSzo3Odxe3rgR3MaEjY9UWhv3tnX0Qns7fmUYjSqnqve77qo6CZbjKTUV/ws8xJyF
         UU4JKvSl7k+1+sU14g7o1CS9n82j6ueATNcfbLobH2uVJv0r94KZTYJLqYCUoPIlp+p6
         pa2UNWRnKptRKUzp4SgvwXzl4igBRbZaqCFM6zXlEcNl8ade75a4CNpwkYUKQkLQGWBR
         ti/g==
X-Forwarded-Encrypted: i=1; AJvYcCUtTspnL7rq5Cc5ctb7L5SfN3FROtkQBMzeUNMuK8ayyEC0NfpMwNzYykfEooAeuWte90dDXLrciihZjxPv+mT7hg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxnG7Xl66qvWzMuFOSSRjPLNSlwI6BUgssnOv/MJ26r3gjjxKku
	2s1s04DmcQc7UeFzClJIYFmKCm+rC5abM/fu0r79fg6m9LU7iqiNAxq+IvWVAowruas=
X-Gm-Gg: ASbGncvAynFBt/KLPjX48Ioh/aFhVtnI5ama3s4+aJpCWtKFtutYhwfOVNYA05fTLj5
	GlF2i7Ji45WDS4MlHSZ96higzVXUFOjjf2sqVQgBrYRZisRQVian7lid4rcDVkuaeZiV84kaUsz
	IAsmTDQliyCZxDAeRQddp2ki2Ph+Ei4zyQYFZDa7Ltm6D9336yl3y1/PJ4A+95gK8h5UZEgSpvW
	ccAVqvL8d+4nQYXNSeQbnwbOGLKTl6Rg4dOFDVCg+1+gzHWBSPNoYRbxRdQNibnEK5n28TrHNZj
	b4ZseEJ7RKA1SF2zIbbnPcVUEfNvbCqYCBcxY4QWi6sSWua3V3Q1tuvkX34VoJGX/QCEzantD1k
	H2Qb1F+TTRTO+AjIDambaKcJb91N0QOz0WKDYR7PoYjfOXbKb
X-Google-Smtp-Source: AGHT+IHuUx1f8TdXWmI1DovVN7QQM0L2JF2vvOFg8DMLgEqewPhxn7MqONBPyjovhTg4CS9g60ZmhA==
X-Received: by 2002:a05:600c:35cc:b0:453:23fe:ca86 with SMTP id 5b1f17b1804b1-4533ca466e5mr150149595e9.4.1750238213972;
        Wed, 18 Jun 2025 02:16:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6b28:e0f6:35f:8b38? ([2001:8b0:aba:5f3c:6b28:e0f6:35f:8b38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b798d3sm16255693f8f.100.2025.06.18.02.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:16:53 -0700 (PDT)
Message-ID: <4c05d53a7665ca1568309eec2d07fd0b7d9a27f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] packagegroup-base: fix override syntax
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, adrian.freihofer@siemens.com, 
	openembedded-core@lists.openembedded.org
Date: Wed, 18 Jun 2025 10:16:52 +0100
In-Reply-To: <805efa18-5a8c-435f-af91-737618a1c16f@cherry.de>
References: <20250615191535.1261591-1-adrian.freihofer@siemens.com>
	 <805efa18-5a8c-435f-af91-737618a1c16f@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218985

On Wed, 2025-06-18 at 11:07 +0200, Quentin Schulz via lists.openembedded.or=
g wrote:
> Hi Adrian,
>=20
> On 6/15/25 9:15 PM, Adrian Freihofer via lists.openembedded.org wrote:
> > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > Looks like one more left over from the override syntax change.
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> > =C2=A0 meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/met=
a/recipes-core/packagegroups/packagegroup-base.bb
> > index cb9d1f07af5..2e051dba33d 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > @@ -119,7 +119,7 @@ python __anonymous () {
> > =C2=A0 # packages added by distribution
> > =C2=A0 #
> > =C2=A0 SUMMARY:packagegroup-distro-base =3D "${DISTRO} extras"
> > -DEPENDS_packagegroup-distro-base =3D "${DISTRO_EXTRA_DEPENDS}"
> > +DEPENDS:packagegroup-distro-base =3D "${DISTRO_EXTRA_DEPENDS}"
>=20
> I'm not sure this is actually doing anything?
>=20
> Nothing sets DISTRO_EXTRA_DEPENDS in poky, it's also not documented.
>=20
> This line was added 18 years ago during a git sync with svn=20
> (3e5ee5acdca51af57c7b6ccd2136f7b548a80293) so history is lost sadly.
>=20
> DEPENDS:recipe-name isnt' even a valid override as far as i know (it=20
> should be pn-recipe-name) and even if it was, what would be the point,=
=20
> we already are in the recipe so there's no need for an override. The=20
> RDEPENDS overrides make sense because it applies for the package and not=
=20
> recipe (and most recipes have the main package named after the recipe).
>=20
> So I think we should simply remove this line?

Good point. I think it can be removed as you're right, the override
makes no sense anyway.

Cheers,

Richard

