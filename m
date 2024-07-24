Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F51C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 22:13:52 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.23014.1721859226823343523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 15:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PXoo2G3J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3685b9c8998so97145f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 15:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721859225; x=1722464025; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=78CAN/Vrw03xt8IpL1GWxL7e2cDvYZ27ClTccM3DqOk=;
        b=PXoo2G3JvIn0S/q3DHqZUNBPOfCgfxBauYzAaX+0TPbOlz0vZkseloWKnoE6v8oyk7
         fnNgmNg/GYuh7Ls7yPfvn2Z2YKBeU6j6c+cKXmyJU7gBX8nWuhIbwOfrIOwHYVKvNzH4
         M7DW2l1AdK6iKFTvaEHgg8ahPfAHsPbBljtns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721859225; x=1722464025;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78CAN/Vrw03xt8IpL1GWxL7e2cDvYZ27ClTccM3DqOk=;
        b=Iss2cmb0QI82ZF9DfoVI7VDjlnStKw/V2tbTvUj+QWbcTI6zW+LRdL4bC5Eug73ART
         7siRnbaraLNf1N38k+OoL9HuOeuZDeicxGJU/j26AAXWiGuixLBbMPO4d6dw0d464uwU
         ZookAjQW2K0dzSHbXEfp4kXwGCIRUxsaOAj1eMWKl2X9obTDB5NsszDrea1wz32zlS35
         jOWZN82M+3uT6+NG5uvbilKhxaDEOHqTE2+lnFIYcWlYIR1JBgbVAIEwvJGk0DuANwJ4
         04NRhXa33OPG08yEcW3xld86yvNk4jP/rwpjU1cxcqQUNCZFUjcGiU07o+aVa/B9TbkL
         tM4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3sIlgBvd6/w5Ihj2xd3Rl1OEl1meDsV266A8GGzpUt4DCoGRJBDU4J+O154JZd+l/915S+tIQ4GcgP0ld3rVP2t4fTX9rmFO3MwcOz9akm8FlSRVCFKDo
X-Gm-Message-State: AOJu0YwF/fwKX/btidCm6jg/cHWqQsdB3fKQoyKQt9ZIQ1YXMBUwoiDG
	+u0IzDo/ejjbSMGQIFreLnIBQTEKSqB2QGSE5Wxfy+Du4XWFU7Ixr18akhhUAEU=
X-Google-Smtp-Source: AGHT+IG+xpTszTHx8F0HbEhonAPQ3SWBnam+P4lr9zgKdU4ulrSOM6YknGR8F8HQ/j+ceCHMtkBp2Q==
X-Received: by 2002:adf:f48d:0:b0:368:7583:54c7 with SMTP id ffacd0b85a97d-36b319de409mr616819f8f.8.1721859224805;
        Wed, 24 Jul 2024 15:13:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a74c:d12c:aa87:d7af? ([2001:8b0:aba:5f3c:a74c:d12c:aa87:d7af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b368706c2sm13327f8f.117.2024.07.24.15.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 15:13:44 -0700 (PDT)
Message-ID: <078214f14849ba7ca8f5017ebdeed1dc66cf91c8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: dnagodra@cisco.com, "Marko, Peter" <Peter.Marko@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "xe-linux-external(mailer
 list)" <xe-linux-external@cisco.com>
Date: Wed, 24 Jul 2024 23:13:43 +0100
In-Reply-To: <CAApg2=Q2pLxPL0EXH1URPBACknO9Gz0R1Ux_mK8Lp3p5H5zvpA@mail.gmail.com>
References: <20240724044505.3345411-1-dnagodra@cisco.com>
	 <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <SN7PR11MB6971246F61B1A502B2D20391D4AA2@SN7PR11MB6971.namprd11.prod.outlook.com>
	 <f54a3d6f471e2e612e693e79d0ef351d6274357d.camel@linuxfoundation.org>
	 <CAApg2=Q2pLxPL0EXH1URPBACknO9Gz0R1Ux_mK8Lp3p5H5zvpA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 22:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202488

On Wed, 2024-07-24 at 18:10 +0200, Marta Rybczynska wrote:
> On Wed, Jul 24, 2024 at 10:46=E2=80=AFAM Richard Purdie via lists.openemb=
edded.org <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wro=
te:
> >=20
> > This is far from straightforward unfortunately.
> >=20
>=20
>=20
> I agree and also agree with Dhairya. We are facing the same issue within =
the VEX work.
> And this is going to come back in the context of the CRA.
> =C2=A0
> >=20
> > Some people are using these lists as "are there any issues we need to
> > worry about?".
> >=20
> > In that context, if an upstream has assessed a CVE and decided nothing
> > need be done about it, our decision to "ignore" it is correct as there
> > is nothing to be done.
> >=20
>=20
>=20
> The project might have decided not to fix for multiple reasons. Some of t=
hem
> may be good, some not.
>=20
> I do not completely agree that there is nothing to be done. We might deci=
de to
> use a configuration option that disables the vulnerable feature. In this =
case there
> is an appropriate status to put. We can do an in-depth analysis and figur=
e out
> if the vulnerable code can be reached in our configuration. If not, there=
 is an
> appropriate status to put.

I'm working on the assumption that if either of those two things were
the case, we'd have done them in preference to the wontfix status. The
wontfix status is the last resort where upstream disagrees there is an
issue or that the issue is an actual problem.

In those situations, there isn't much we can do. The status is spelt
out separately so anyone wanting to find this "class" of problems can.
How they want to map and export that into lossy formats is up to the
user and configurable.

The only "decision" we're making is that we won't show that status as
"open" on our standard lists as someone has looked at it and decided
there isn't anything to be done (or can be done).

> > On the other hand, the CVE is open and unpatched, so listing it as
> > unmitigated is also correct in some senses. The problem is that there
> > is no planned way of moving forward with the CVE, so it will sit in a
> > list of other "unpatched" CVEs and this dilutes the value of the list
> > as you can't tell which ones are being rejected by upstream as wontfix
> > and which ones are real and need attention.
> >=20
> > We knew that people would have different views and needs on how to
> > handle this, which is precisely why the mapping variables exist. You
> > can certainly configure this according to your needs and this may be a
> > case where you'd need to do that as there isn't going to be a 100%
> > right answer we can have.
> >=20
>=20
>=20
> I think the problem here is that we had used the "Ignored" status for mul=
tiple
> reasons in the past, also to avoid having a look multiple times at the sa=
me
> issue.
>=20
> Again, the CRA is formal here, and downstreams will need to re-analyse al=
l
> those issues (or disable affected recipes). Either downstreams, or we wil=
l
> do it all together.... (which is a better option IMO).
>
> There's the same issue with some other statuses like 'disputed'.

Your argument appears to be that we aren't in a position to make any
decision on the status of any CVE and we can't share this work, it has
to be pushed to the end user to do on their own and the CRM mandates
that?

I don't believe that to be true but that does appear to be the case
you're making :(.

Cheers,

Richard

