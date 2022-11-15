Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A11C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 22:16:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.7868.1668550609687327584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 14:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OFCf1Ud1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so142224wmg.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 14:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fxEux4UTthVXBv3g8nZhqlJfYxPRdUl5ZQ39FTdGU0=;
        b=OFCf1Ud1pPO9ezEAk/+64k8pojnhwC8Q74Y0ibSatDzKitXlujNuhSycN2Ldbj5vek
         qwD1R8PEHChfrMRGDDwf54Xv0LBh7duTCms+Jp5XRBKh3BWMSILykOqW/soXOLWb0aI2
         2kSmXKSNBm07Bq0ZdlNpVN4X3Czvel5Hns1fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7fxEux4UTthVXBv3g8nZhqlJfYxPRdUl5ZQ39FTdGU0=;
        b=qTh32kQ8YqbNMvJznLk0e4dDb1Ro2kr4tJdGAH47/Zi8obvWe+fXCEMqpx2j5sJ2s1
         fR9caUB2H3Pym8/ZN6Wm4XnXqgOeaDLC5wShkWzXXlyqVnTRseqjIXjbXgpNh9fHZIU1
         QQyddsmWdAvL3F838ZbPY+IqsbPW/pzBIgsrK92U8wR62hTFtUpFxEFYrxw818ukqsE3
         GJjDG6T3oqbsttoQ/dq7TRYTbpYpWGbl3XKd9xA9k0aN/BPVYBiOTzeoDQ8MxZUNwrut
         XF2TACrSWRbDR4BivXP443bTAuROa6616Su7kAaKsZ/wX060TVy9WSjEfhuahhPuPuYp
         Lh3A==
X-Gm-Message-State: ANoB5pntgf6SBwWnYfZxL40tYctCeP7i2uOHZC9100rE9ZCUs3Q1ZqaD
	iZHr3bTYIEgztykCHNiYS4IymIaqVCgiZQ==
X-Google-Smtp-Source: AA0mqf5kHpw6jkhntxCiDogZsCRbcsCrq+VEYlEJ+/zDnkCaLGcBZTF3KXmvwGtXTRiMfzhL5oqkTg==
X-Received: by 2002:a05:600c:1d92:b0:3cf:78fc:eda2 with SMTP id p18-20020a05600c1d9200b003cf78fceda2mr249267wms.47.1668550607806;
        Tue, 15 Nov 2022 14:16:47 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6779:84d:e47:6803? ([2001:8b0:aba:5f3c:6779:84d:e47:6803])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c4eca00b003c6b874a0dfsm126227wmq.14.2022.11.15.14.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 14:16:47 -0800 (PST)
Message-ID: <c5f326ab71f86866bc0f0665debf93f885bc7516.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity: Drop data finalize call
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2022 22:16:45 +0000
In-Reply-To: <b74451c1aba840738a8ae62a6287c04c@axis.com>
References: <20221111225827.2412062-1-richard.purdie@linuxfoundation.org>
	 <b74451c1aba840738a8ae62a6287c04c@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 22:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173358

On Tue, 2022-11-15 at 15:10 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Richard
> > Purdie
> > Sent: den 11 november 2022 23:58
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] sanity: Drop data finalize call
> >=20
> > This call was effectively like update_data and no longer did
> > anything
> > in bitbake. Drop it as it is obsolete.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/classes-global/sanity.bbclass | 11 ++---------
> > =C2=A01 file changed, 2 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-
> > global/sanity.bbclass
> > index 8c7d4d08809..6cb0d6cf882 100644
> > --- a/meta/classes-global/sanity.bbclass
> > +++ b/meta/classes-global/sanity.bbclass
> > @@ -1003,13 +1003,6 @@ def check_sanity(sanity_data):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if status.messages !=3D "":
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0raise_sanity_erro=
r(sanity_data.expand(status.messages),
> > sanity_data, status.network_error)
> >=20
> > -# Create a copy of the datastore and finalise it to ensure appends
> > and
> > -# overrides are set - the datastore has yet to be finalised at
> > ConfigParsed
> > -def copy_data(e):
> > -    sanity_data =3D bb.data.createCopy(e.data)
> > -    sanity_data.finalize()
> > -    return sanity_data
> > -
> > =C2=A0addhandler config_reparse_eventhandler
> > =C2=A0config_reparse_eventhandler[eventmask] =3D "bb.event.ConfigParsed=
"
> > =C2=A0python config_reparse_eventhandler() {
> > @@ -1020,13 +1013,13 @@ addhandler check_sanity_eventhandler
> > =C2=A0check_sanity_eventhandler[eventmask] =3D "bb.event.SanityCheck
> > bb.event.NetworkTest"
> > =C2=A0python check_sanity_eventhandler() {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if bb.event.getName(e) =3D=3D "SanityChec=
k":
> > -        sanity_data =3D copy_data(e)
> > +        sanity_data =3D bb.data.createCopy(e.data)
>=20
> For my understanding, wouldn't it be the same to do:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sanity_data =3D bb.data.c=
reateCopy(d)

Yes.

> I found this in the bitbake documentation, which seems to support my=20
> understanding: A global variable "e" is defined, which represents the
> current event. ... The global datastore is available as "d". In
> legacy=20
> code, you might see "e.data" used to get the datastore. However,
> realize=20
> that "e.data" is deprecated and you should use "d" going forward.

e.data is how we used to have to access the datastore in event
contexts. We did add d to allow standardisation and we do want to
remove e.data but haven't cleaned out the old references yet. Arguably
I could/should have here but I was already nesting a few issues deep in
cleanups so I've left that for another time.

> Further, is there any reason to use bb.data.createCopy(d) instead of=20
> d.createCopy()? AFAICT, the former just calls the latter.

d.createCopy() is indeed the preferred syntax and functionally the
same.


Cheers,

Richard


