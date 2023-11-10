Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27C9C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 12:01:54 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.25558.1699617709528847753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Nov 2023 04:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mk+wrZWI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50797cf5b69so2570022e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 04:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699617708; x=1700222508; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iwwj6qVOiPQLkb/WqGL8eVRLytE4wlazYZ5ssqF3/pU=;
        b=Mk+wrZWIM9WCgR1ZtDrX5huOE6b9I+2m7nr0fRFaUm5u62VF1gLYlTkhqPFwdnJrdt
         zm8nYA+M9qW44JG3IOTm3WlkNnwBL9//PHYgaK+MbHIKVirfk3xr/MFCrYXdfD5OeZ3t
         kgQe9UTUXD8ODABmgmXWcC0mPpEb7Zy5gpYC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699617708; x=1700222508;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iwwj6qVOiPQLkb/WqGL8eVRLytE4wlazYZ5ssqF3/pU=;
        b=X+pAneBDEsmq2xhcuakBDVRl2XZCSvpOM2XE0BkLPcQjA22CWHS4bJ6R0sUCIE0Zbz
         cWDvpa59F9nDdi2aMpjGCzcFb/uRGtHP7ODT73CpR2gmhkNZl0MgrIXCs9oHjkixK8n9
         XyjO1aGntdCGbyLWRZHX9vorMAhJ3y3lEV11RmAhymKEIY3VCjRsOZkLpasx4axg+phQ
         +0i1hfV4Tsvphq23R8K58ap2PqT0EpdwEAcqLnaX3La5hevt9ZzNApM4sOqfKHap9EKK
         t7J/4Ahitb89bHE2Atpuzx7McEeAriUTrtEvpVrtobmVmJkA2THllYPQ+AeFiB3R7EJU
         zj9g==
X-Gm-Message-State: AOJu0Yx5iGSJiJyiO+utyxN8uH8E8LxFAcZ0b4xKxZhBmyjGXb3EiOU+
	0WUFCObKtq7iVlSjGQhIXVrheg==
X-Google-Smtp-Source: AGHT+IF69Y1WkeuE4NO6jWLc6GYIhvb3FfG6mvcylmjYdbdoKiEU0FnghlOVH0jNiSnIaYNg7jWjvQ==
X-Received: by 2002:ac2:520e:0:b0:507:9fc1:ca7a with SMTP id a14-20020ac2520e000000b005079fc1ca7amr3534654lfl.9.1699617707535;
        Fri, 10 Nov 2023 04:01:47 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3703:3761:dd76:7c61? ([2001:8b0:aba:5f3c:3703:3761:dd76:7c61])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b0032d886039easm1775490wrx.14.2023.11.10.04.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 04:01:47 -0800 (PST)
Message-ID: <89bcab47a31311c210d0372ef74e50ce51ce5d4c.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v14 03/11] sstate.bbclass: override tar with
 tar-native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2023 12:01:46 +0000
In-Reply-To: <2705101.mvXUDI8C0e@latitude>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
	 <3bf4d3c6ef38532d316ec3eefc9d670aad5ba21d.camel@linuxfoundation.org>
	 <178E804624FA5560.14388@lists.openembedded.org>
	 <2705101.mvXUDI8C0e@latitude>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 12:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190407

On Fri, 2023-11-10 at 10:12 +0000, Piotr =C5=81obacz wrote:
> Dnia poniedzia=C5=82ek, 16 pa=C5=BAdziernika 2023 07:45:41 CET Piotr =C5=
=81obacz via=20
> lists.openembedded.org pisze:
> > Dnia niedziela, 15 pa=C5=BAdziernika 2023 20:26:49 CEST Richard Purdie =
pisze:
> > > On Sun, 2023-10-15 at 16:57 +0200, Piotr =C5=81obacz wrote:
> > > > Due to the bugs
> > > > https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsavann
> > > > a%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Cbac3f04a07664b3a912a=
08dbce0
> > > > b282c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6383303195458083=
51%7C
> > > > Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haW
> > > > wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D875wwpxmvY10%2BUdvEbJFTJwc=
1zW%2Bq
> > > > 0YOn8g9wgVvdUA%3D&reserved=3D0
> > > > h.gnu.org%2Fbugs%2F%3F61934&data=3D05%7C01%7Cp.lobacz%40welotec.com=
%7C208
> > > > 43c
> > > > d409ff471ad53b08dbcdac4d55%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7=
C0%7
> > > > C63
> > > > 8329912144020487%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2
> > > > luM
> > > > zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DU8%2Fmm02=
MR5ps5
> > > > btR JnE1EnySNk4NJV498kRX66jjeeQ%3D&reserved=3D0 and
> > > > https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsavann
> > > > a%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Cbac3f04a07664b3a912a=
08dbce0
> > > > b282c%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6383303195458083=
51%7C
> > > > Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haW
> > > > wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D875wwpxmvY10%2BUdvEbJFTJwc=
1zW%2Bq
> > > > 0YOn8g9wgVvdUA%3D&reserved=3D0
> > > > h.gnu.org%2Fbugs%2F%3F59184&data=3D05%7C01%7Cp.lobacz%40welotec.com=
%7C208
> > > > 43c
> > > > d409ff471ad53b08dbcdac4d55%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7=
C0%7
> > > > C63
> > > > 8329912144020487%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2
> > > > luM
> > > > zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DJ3cwWWAQ6=
BHP1aG
> > > > VeP 1yRIGnGyG1fqVvPaVJY6kjKWc%3D&reserved=3D0, which are fixed in t=
ar
> > > > version 1.35, we need to force yocto to use it instead
> > > > of the one provided by the host machine.
> > > >=20
> > > > sstate_create_package and sstate_unpack_package functions,
> > > > will use the tar provided by tar recipe, which is already
> > > > in proper version.
> > > >=20
> > > > Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> > > > ---
> > > >=20
> > > >  meta/classes-global/sstate.bbclass | 6 +++++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/meta/classes-global/sstate.bbclass
> > > > b/meta/classes-global/sstate.bbclass index 2676f18e0a..5ae6f515f2 1=
00644
> > > > --- a/meta/classes-global/sstate.bbclass
> > > > +++ b/meta/classes-global/sstate.bbclass
> > > > @@ -152,7 +152,9 @@ python () {
> > > >=20
> > > >      else:
> > > >          d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
> > > >=20
> > > > -    if bb.data.inherits_class('native', d) or
> > > > bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cr=
oss',
> > > > d): +    is_native =3D bb.data.inherits_class('native', d) or
> > > > bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cr=
oss',
> > > > d) +
> > > >=20
> > > > +    if is_native:
> > > >          d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
> > > >          d.setVar('BB_HASHFILENAME', "True ${SSTATE_PKGSPEC}
> > > >          ${SSTATE_SWSPEC}")
> > > >          d.setVar('SSTATE_EXTRAPATHWILDCARD', "${NATIVELSBSTRING}/"=
)
> > > >=20
> > > > @@ -164,6 +166,8 @@ python () {
> > > >=20
> > > >          d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc"=
)
> > > >          d.setVarFlag(task, 'network', '1')
> > > >          d.setVarFlag(task + "_setscene", 'network', '1')
> > > >=20
> > > > +        if not is_native:
> > > > +            d.appendVarFlag(task, 'deptask', '
> > > > tar-replacement-native:do_populate_sysroot')>
> > > >=20
> > > >  }
> > >=20
> > > >  def sstate_init(task, d):
> > > I don't think this dependency is enough to ensure that the setscene
> > > task for one of these tasks has tar-native present when the sstate
> > > package is extracted from sstate?
> > >=20
> > > Cheers,
> > >=20
> > > Richard
> >=20
> > Hi Richard, proposals are welcome :-)
> >=20
> > BR
> > Piotr
> BTW. Richard was it tested already by you?

No, sadly I can tell from the patches alone that there are issues there
:(

Cheers,

Richard



