Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A33C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 00:24:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.43034.1699662242571051542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Nov 2023 16:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MoayOEaC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso18291175e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 16:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699662241; x=1700267041; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRfzevd83Ory0o4Om1ASKL7I9abSKkPwNB7pCvk2l04=;
        b=MoayOEaCg+GliOWbuzVK+HS2+AKHK+exD4LU/PzU0wGisY5AjOq/QaNiveoWl+g5Ce
         4/wh8PM4nkI0PddD73QA4Fh1oub7C1yhqmx6kZOOXNgiVIQVRgb7qQMqKCwHfpj0fGjp
         Vr3vNp16iMF3mTku+nxeYB9Z6z8NaeXKOnbbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699662241; x=1700267041;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRfzevd83Ory0o4Om1ASKL7I9abSKkPwNB7pCvk2l04=;
        b=vmdhHQB9L0zMnwYxPzPPKLvvkKwJ3cmVxqYgQysowYiqTdJwRIziYonGby8Nf2+v3d
         qpnjVDIrgJ7vREPnMyCtJG6dGJ+E6XDFzyHik7zr8lkX/J8v5oTbMjY9C8aGrGKmhC/H
         FO4jElgjq0nr4p2v3o53jox+sESFHfKca1VGzn3noKcR4zrru9AvVqh1BKidS2DDMTJU
         Yr0gWVfZYr0gXn05JowIE0+2OqOAoaEXIw4CPP0E78K+4R0Vd9L9Gp9NNQLjpUplD1ff
         xIhDWWPV0CHA63EbXU3L4SEOAOzftl5OthOqlV65B6xEOXxT1VQ2Jy0/PT8BNizQAMkU
         9pHA==
X-Gm-Message-State: AOJu0YyAXuyJ417RriRvHDvesKkM72uUm+vYyB+LQnn+3kB3YxXmdq/0
	bUYRILXgFoZ6lgy8pHk8wwshDY+jUnwl3GXbokI=
X-Google-Smtp-Source: AGHT+IE9TKBNfCL9Cz3nEphUuI5xvr/9nAk1YLAboYUpybk11A5NBEP1QPTgkUoXb9T6vBNU7pHXqw==
X-Received: by 2002:a05:600c:4fd2:b0:406:84cb:b014 with SMTP id o18-20020a05600c4fd200b0040684cbb014mr518592wmq.22.1699662240874;
        Fri, 10 Nov 2023 16:24:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:de84:b269:f218:5c59? ([2001:8b0:aba:5f3c:de84:b269:f218:5c59])
        by smtp.gmail.com with ESMTPSA id w7-20020adff9c7000000b0033130644c87sm384010wrr.54.2023.11.10.16.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 16:24:00 -0800 (PST)
Message-ID: <60deee1f69f64e2ca97e47f68ba9c98f926c9002.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v14 03/11] sstate.bbclass: override tar with
 tar-native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Nov 2023 00:23:59 +0000
In-Reply-To: <5725724.DvuYhMxLoT@latitude>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
	 <2705101.mvXUDI8C0e@latitude>
	 <89bcab47a31311c210d0372ef74e50ce51ce5d4c.camel@linuxfoundation.org>
	 <5725724.DvuYhMxLoT@latitude>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 00:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190412

On Fri, 2023-11-10 at 19:23 +0000, Piotr =C5=81obacz wrote:
> Dnia pi=C4=85tek, 10 listopada 2023 13:01:46 CET Richard Purdie pisze:
> > On Fri, 2023-11-10 at 10:12 +0000, Piotr =C5=81obacz wrote:
> > > Dnia poniedzia=C5=82ek, 16 pa=C5=BAdziernika 2023 07:45:41 CET Piotr =
=C5=81obacz via
> > >=20
> > > lists.openembedded.org pisze:
> > > > Dnia niedziela, 15 pa=C5=BAdziernika 2023 20:26:49 CEST Richard Pur=
die pisze:
> > > > > On Sun, 2023-10-15 at 16:57 +0200, Piotr =C5=81obacz wrote:
> > > > > > Due to the bugs
> > > > > > https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsa
> > > > > > vann%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C6cb785a640ac4=
9183830
> > > > > > 08dbe1e4d185%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C63835=
21451
> > > > > > 16769023%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzI
> > > > > > iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DNNKAagY=
Pr3Lzk5
> > > > > > 18gY3ceRLgWpKnHODZQylBweyOyAI%3D&reserved=3D0
> > > > > > a%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Cbac3f04a07664b3a=
912a08
> > > > > > dbce0
> > > > > > b282c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638330319545=
8083
> > > > > > 51%7C
> > > > > > Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6I
> > > > > > k1haW
> > > > > > wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D875wwpxmvY10%2BUdvEbJF=
TJwc1z
> > > > > > W%2Bq 0YOn8g9wgVvdUA%3D&reserved=3D0
> > > > > > h.gnu.org%2Fbugs%2F%3F61934&data=3D05%7C01%7Cp.lobacz%40welotec=
.com%7C
> > > > > > 208
> > > > > > 43c
> > > > > > d409ff471ad53b08dbcdac4d55%7C25111a7f1d5a4c51a4ca7f8e44011b39%7=
C0%7C
> > > > > > 0%7
> > > > > > C63
> > > > > > 8329912144020487%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjo
> > > > > > iV2
> > > > > > luM
> > > > > > zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DU8%2F=
mm02MR5
> > > > > > ps5
> > > > > > btR JnE1EnySNk4NJV498kRX66jjeeQ%3D&reserved=3D0 and
> > > > > > https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsa
> > > > > > vann%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C6cb785a640ac4=
9183830
> > > > > > 08dbe1e4d185%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C63835=
21451
> > > > > > 16769023%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzI
> > > > > > iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DNNKAagY=
Pr3Lzk5
> > > > > > 18gY3ceRLgWpKnHODZQylBweyOyAI%3D&reserved=3D0
> > > > > > a%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Cbac3f04a07664b3a=
912a08
> > > > > > dbce0
> > > > > > b282c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638330319545=
8083
> > > > > > 51%7C
> > > > > > Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6I
> > > > > > k1haW
> > > > > > wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D875wwpxmvY10%2BUdvEbJF=
TJwc1z
> > > > > > W%2Bq 0YOn8g9wgVvdUA%3D&reserved=3D0
> > > > > > h.gnu.org%2Fbugs%2F%3F59184&data=3D05%7C01%7Cp.lobacz%40welotec=
.com%7C
> > > > > > 208
> > > > > > 43c
> > > > > > d409ff471ad53b08dbcdac4d55%7C25111a7f1d5a4c51a4ca7f8e44011b39%7=
C0%7C
> > > > > > 0%7
> > > > > > C63
> > > > > > 8329912144020487%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjo
> > > > > > iV2
> > > > > > luM
> > > > > > zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DJ3cwW=
WAQ6BHP
> > > > > > 1aG
> > > > > > VeP 1yRIGnGyG1fqVvPaVJY6kjKWc%3D&reserved=3D0, which are fixed =
in tar
> > > > > > version 1.35, we need to force yocto to use it instead
> > > > > > of the one provided by the host machine.
> > > > > >=20
> > > > > > sstate_create_package and sstate_unpack_package functions,
> > > > > > will use the tar provided by tar recipe, which is already
> > > > > > in proper version.
> > > > > >=20
> > > > > > Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> > > > > > ---
> > > > > >=20
> > > > > >  meta/classes-global/sstate.bbclass | 6 +++++-
> > > > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/meta/classes-global/sstate.bbclass
> > > > > > b/meta/classes-global/sstate.bbclass index 2676f18e0a..5ae6f515=
f2
> > > > > > 100644
> > > > > > --- a/meta/classes-global/sstate.bbclass
> > > > > > +++ b/meta/classes-global/sstate.bbclass
> > > > > > @@ -152,7 +152,9 @@ python () {
> > > > > >=20
> > > > > >      else:
> > > > > >          d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}")=
)
> > > > > >=20
> > > > > > -    if bb.data.inherits_class('native', d) or
> > > > > > bb.data.inherits_class('crosssdk', d) or
> > > > > > bb.data.inherits_class('cross',
> > > > > > d): +    is_native =3D bb.data.inherits_class('native', d) or
> > > > > > bb.data.inherits_class('crosssdk', d) or
> > > > > > bb.data.inherits_class('cross',
> > > > > > d) +
> > > > > >=20
> > > > > > +    if is_native:
> > > > > >          d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
> > > > > >          d.setVar('BB_HASHFILENAME', "True ${SSTATE_PKGSPEC}
> > > > > >          ${SSTATE_SWSPEC}")
> > > > > >          d.setVar('SSTATE_EXTRAPATHWILDCARD', "${NATIVELSBSTRIN=
G}/")
> > > > > >=20
> > > > > > @@ -164,6 +166,8 @@ python () {
> > > > > >=20
> > > > > >          d.appendVarFlag(task, 'postfuncs', " sstate_task_postf=
unc")
> > > > > >          d.setVarFlag(task, 'network', '1')
> > > > > >          d.setVarFlag(task + "_setscene", 'network', '1')
> > > > > >=20
> > > > > > +        if not is_native:
> > > > > > +            d.appendVarFlag(task, 'deptask', '
> > > > > > tar-replacement-native:do_populate_sysroot')>
> > > > > >=20
> > > > > >  }
> > > > >=20
> > > > > >  def sstate_init(task, d):
> > > > > I don't think this dependency is enough to ensure that the setsce=
ne
> > > > > task for one of these tasks has tar-native present when the sstat=
e
> > > > > package is extracted from sstate?
> > > > >=20
> > > > > Cheers,
> > > > >=20
> > > > > Richard
> > > >=20
> > > > Hi Richard, proposals are welcome :-)
> > > >=20
> > > > BR
> > > > Piotr
> > >=20
> > > BTW. Richard was it tested already by you?
> >=20
> > No, sadly I can tell from the patches alone that there are issues there
> >=20
> > :(
> >=20
> > Cheers,
> >=20
> > Richard
> You mean there are issues with the patches or what?

I mean that the problem I mentioned above, that the dependency won't
work for setscene tasks will cause breakage. If I can see that just
looking at the patch there is little point in testing it further.

I ended with a question mark as I'm not 100% sure and I was basically
saying "correct me if I'm wrong", but I am fairly certain it won't work
in some corner cases.

Cheers,

Richard


