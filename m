Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A33E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:25:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.107778.1733765109595234308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 09:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S22ZeuDl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so30702085e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 09:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733765108; x=1734369908; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/gulzysL20Wiv2eFh9FQeKVUYTQiaEoLxOZJ35Z/qE=;
        b=S22ZeuDl754RLN8/HIHcvpKz5pFQ67n/9NlSE6fzSpXwgQhhhemtRchJbGQMwBRqgS
         955N15XnfsiSmVPhe69bLPbm+Ig9Ev4t6PjwISpC6bW+1QO/Hfuk089i/EekRnzuuRQT
         o/OlkAqjFM64YYhcfHQeULziyfbmBz6H1q9Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733765108; x=1734369908;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/gulzysL20Wiv2eFh9FQeKVUYTQiaEoLxOZJ35Z/qE=;
        b=QWRo88A76CwOTiU2grwvfozR7pCefjLL73Qu57VZXzz/dGCqVZO2lb1atJ3jBdFhyH
         DiQu8jnX0exKGl666q4Fpy34YikT/juyFn2YV+GXZxEvP+sXRXloVw6xoh9nGNTDJMj1
         puKAk8nThGeCBR0QT8RPrZSkCjaQ3i1GykWnjGDfLxo90Oa3LU7MN4g3MxgQOyQ+mS25
         DRgHNeQXA4Xd+4IPvMeRp8qq6AMV/+lsmU4EIyD010NmZrwfCJVwp37zSjWOo3EJgS8W
         VIyUrMNaF04bb6aH5YcJeYvL41qfzTxt9tf4ljd3SS1fBggEND0nsEshshByxvIgO2dM
         jKiw==
X-Forwarded-Encrypted: i=1; AJvYcCXDerVuR3TnCqmPgOAiJ1mKypzI8QQLqgTVrmfSHGyjAbp4S0JXS5+3rx2mcIvpDy5Xnf+ihQuZQ9WN6ttvzBifqw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyAKzTx304MFlR6Bqm07ur6iCMaNVdg3pkxKXMKoH1Ci2t9hZIX
	q5qbdupTaUplu+pd07ucv3IXdTsq6g3GC7gBBqpWJw+L2q1JoHwGhVfnboYWF9k=
X-Gm-Gg: ASbGnctVLTvb2J2iyJ9ZBpTB09ZT4OAw3fYn2+FlnB6kkTOT8PzU2+acKQslf4aXW7/
	Aa7U0kfbLpqK2OFPd26sLK2LEWQeHg8a+yOxpgeAzAbAw73WlCO2Cx9QYnb08HpHsbEyOgQN3op
	fj2/qJV1gFfU/NjUz37woXE5rkuf14DIrrbwcy84458D/eaaANsUhJQ/+OIsTuOE+HTMSkmeMh9
	RxwXt7QcJXQyqYDbGXcg1Zkhc9jvUwqnZIOhsfEce/sOfQsGAsUXmUPQxknEnkZfzTjwteGnSKA
	WgxM+ddDbYk6n3wwx2bw1tNNF3AdlMBr3hd7Gwg=
X-Google-Smtp-Source: AGHT+IGb7dJqCwPfzw6cYZww7cdaa/eoj5VBNflSZ3BjXj3Lfxsq2Zn0OiGC3JBo/nkS9xldaGy/GQ==
X-Received: by 2002:a05:600c:3b99:b0:431:44fe:fd9a with SMTP id 5b1f17b1804b1-434fff98d7fmr13446205e9.19.1733765108011;
        Mon, 09 Dec 2024 09:25:08 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b41:c06d:2eaf:52ed? ([2001:8b0:aba:5f3c:2b41:c06d:2eaf:52ed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527395csm197424125e9.17.2024.12.09.09.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:25:07 -0800 (PST)
Message-ID: <d470ced4a402955d9061201ba33c8b875f0bce63.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] icecc: fix PN 'no-pn' handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: m.felsch@pengutronix.de, openembedded-core@lists.openembedded.org, 
	yocto@pengutronix.de
Date: Mon, 09 Dec 2024 17:25:06 +0000
In-Reply-To: <180F920C983A7BC6.8554@lists.openembedded.org>
References: <20241209164608.3595821-1-m.felsch@pengutronix.de>
	 <180F920C983A7BC6.8554@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 17:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208492

On Mon, 2024-12-09 at 17:22 +0000, Richard Purdie via lists.openembedded.or=
g wrote:
> On Mon, 2024-12-09 at 17:46 +0100, Marco Felsch via lists.openembedded.or=
g wrote:
> > Since bitbake commit f24bbaaddb36 ("data: Add support for new
> > BB_HASH_CODEPARSER_VALS for cache optimisation") the
> > BB_HASH_CODEPARSER_VALS are passed during the bb.build_dependencies()
> > step.
> >=20
> > With PN set to 'no-pn' and the icecc_version() running during
> > bb.build_dependencies() (due to the 'vardepsexclude') the bb.fatal() is
> > triggered while parsing target-sdk-provides-dummy.bb albeit it was
> > already disabled via ICECC_RECIPE_DISABLE.
> >=20
> > To fix this use_icecc() need to verify if PN is set to 'no-pn' which
> > indicates the early bb.build_dependencies() task and return 'no' in tha=
t
> > case.
> >=20
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > Hi,
> >=20
> > this patch should fix the reoprted ICECC bug:
> >=20
> > https://lists.yoctoproject.org/g/yocto/topic/icecc_support_broken/10342=
9714
> >=20
> > Regards,
> > =C2=A0 Marco
> >=20
> > =C2=A0meta/classes/icecc.bbclass | 6 ++++++
> > =C2=A01 file changed, 6 insertions(+)
> >=20
> > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > index 159cae20f8ca..df73e31e9514 100644
> > --- a/meta/classes/icecc.bbclass
> > +++ b/meta/classes/icecc.bbclass
> > @@ -159,6 +159,12 @@ def use_icecc(bb,d):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bb.debug(1, "%s: bbclass %s found in disable, disable icecc" % (pn, bbc=
lass))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return "no"
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 # PN set to 'no-pn' indicates that bitbake is at th=
e early
> > +=C2=A0=C2=A0=C2=A0 # bb.build_dependencies() stage and it's not possib=
le to use the value to
> > +=C2=A0=C2=A0=C2=A0 # decide if icecc can be used.
> > +=C2=A0=C2=A0=C2=A0 if pn =3D=3D "no-pn":
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "no"
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 disabled_recipes =3D (d.getVar('ICECC_RECIPE_D=
ISABLE') or "").split()
> > =C2=A0=C2=A0=C2=A0=C2=A0 enabled_recipes =3D (d.getVar('ICECC_RECIPE_EN=
ABLE') or "").split()
> > =C2=A0
>=20
> I'm not sure the patch description is quite right and I'm also not sure
> this is a safe way to solve the issue here.
>=20
> Bitbake is trying to work out the dependencies of the various
> functions. The reasoning was that setting some dummy values for that
> code would stop it spiralling off and analysing multiple pieces of code
> that were effectively functionally identical where for example a
> version string just changes.
>=20
> This gets messy with shell function, for example with the shell
> function:
>=20
> set_icecc_env() {
> =C2=A0=C2=A0=C2=A0 if [ "${@use_icecc(bb, d)}" =3D "no" ]
> =C2=A0=C2=A0=C2=A0 then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
> =C2=A0=C2=A0=C2=A0 fi
> }
>=20
> it has to run use_icecc() to expand that in case it turned into a block
> of code.
>=20
> If we take a patch like this, I would like the comment above and the
> commit message to be correct. "bb.build_dependencies" doesn't exist and
> the early stage you refer to is misleading as it doesn't work like
> that.
>=20
> If we're hitting the "NULL prefix" code in icecc_version(), wouldn't it
> be better to special case pn =3D=3D "no-pn" there, note that it is at
> dependency parse time and return a dummy "parse-time-dummy-
> icetarball.tgz" value?

I meant to add, if we rewrite some of these functions in python, these
issues would go away as we don't expand data in python functions.

The modern way of doing much of this would be a python prefunc on the
appropriate tasks. I have to wonder how many people are using icecc :/.

Cheers,

Richard

