Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6C3C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 09:55:28 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.7755.1741341322838312944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 01:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PyWPPDEZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390e88caa4dso896418f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 01:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741341321; x=1741946121; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78S0e4JjBVmFV4gwZqlLx6GXPtWT8zTJYbpGuw+yseU=;
        b=PyWPPDEZQ2PSQ8WXSf8YamLjCTfBK/jeQ4L5PwZLxkIsbVez2tR9ZuzWV9huJNrTaL
         jF3PM0mamOIl46a+OECJjnqgrTzstQltiL5JXVa4CJLLjP8y3Wfk7fpfn9O1UYHmfEZa
         /I8Tsys0w5Cw2lrR1ZT6Pwz7vul7n3rVm3eWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741341321; x=1741946121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78S0e4JjBVmFV4gwZqlLx6GXPtWT8zTJYbpGuw+yseU=;
        b=D8Ru96Mrt+blAcSzGu2A/w1jAADS06hx0iN/Vqzu/NJrschalzuBc0ZSvDuBJ/kt8t
         IwXbDFWcDL3w/Lv8r7eGxfgOuLDImOGbZOnLaR8Q60XJfdiHWdwyg6DGE9Rw9RrdbfAe
         pfDavJvJEcGwLhD3olxmvfX4PEqnPzDSQE6yXUcqwQW09myVihY5O7EICs+WJzhLoBhG
         dy5Gum46OjiSKaXIFSNlwvJWnqyLcNkx5JsGW4QzQYLJSYOmzIBwuYKnvZ5uR1qFIl1I
         IOeTgF3bO10jQ9q00+/QaS+BsI7a4+WAYbe0fRl53Xn8ebGZ8X1IoKE+QxNiIg7SZFt2
         loKg==
X-Forwarded-Encrypted: i=1; AJvYcCUuFCTdwNCdf7olDEDl7vQjtUyMZpUr+qkgpdeAaZepkhWq54e9YA74OwaZkJqhKLdXS1RFd4aDxBrwsss8WrNOMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7LUyau9O6W/qB5qLD/WihAcNpPBrF7Tl9A5ByPCZ9DgByq83X
	VTjvNT7IoRPb+St9bnVF0f3sLW8hUqBhuiLaBk6WWVzQxntRx7jerHb8ezDXaUr6zdB9qkdOcJh
	apZbg4JYd68UaaDzxCuI17YZaxaRCss34Ngrn4Q==
X-Gm-Gg: ASbGncurcuX/qd0mV9OJlQE4AjpBs7ImfrfBieA7mZvsWp4r32kVmja/dzEdmqCar+L
	UtBuyb8dUO2eJG25Q78QozEzhveuFM106MgWrd++fQ2/VOCxhIYvVXqmjC0q1fAg5tc0yosvI+6
	b7yyVSdPYfJ+cjfQs2FXEyaUA3W82FfPlButnnEJFkuQqL5Cc0pUJBf9hwMPs=
X-Google-Smtp-Source: AGHT+IEg7fUusnzZ6ky8Qcr+e9XomuHQtFnhf58Eqp/nVQl3qXBe7PVcI+ubTHtRboPG4amLBZUfUdBugVlcDOCqp7A=
X-Received: by 2002:a05:6000:18a9:b0:391:13f7:92ad with SMTP id
 ffacd0b85a97d-39132d95913mr2039705f8f.27.1741341320963; Fri, 07 Mar 2025
 01:55:20 -0800 (PST)
MIME-Version: 1.0
References: <20250301094303.10707-1-peter.marko@siemens.com>
 <CAMSfU+6N6xHjqxCso_09sb6ia7dYJbPDoh6pFYMFeHaMivkePA@mail.gmail.com> <AS1PR10MB569775A17468AB0D08EC7F4EFDCA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569775A17468AB0D08EC7F4EFDCA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 7 Mar 2025 10:54:54 +0100
X-Gm-Features: AQ5f1Jp243qdiQaotHepNPR8asSmuW_mLCb59s41u-IxyfIdm4S7vv7SZS0zLk0
Message-ID: <CAMSfU+4fGUgBnYqDmTWBdw3cYfV7c-09WQ1WkTwwjkOxG=ZcQQ@mail.gmail.com>
Subject: Re: [OE-core][master][styhead][scarthgap][kirkstone][PATCH] puzzles:
 set CVE product
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: Ross Burton <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 09:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212424

Hi,

Le jeu. 6 mars 2025 =C3=A0 13:22, Marko, Peter <Peter.Marko@siemens.com> a =
=C3=A9crit :
> Sure, no problem.
> Will the patch from Ross be backported to all three active branches to cl=
eanup those CVEs there, too?

We did not talk about that during review but the best way to be sure
of this will be to send a backport request for each active stable
branch.

> Peter
>
> > -----Original Message-----
> > From: Yoann Congal <yoann.congal@smile.fr>
> > Sent: Thursday, March 6, 2025 11:31
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Cc: openembedded-core@lists.openembedded.org; Steve Sakoman
> > <steve@sakoman.com>
> > Subject: Re: [OE-core][master][styhead][scarthgap][kirkstone][PATCH] pu=
zzles: set
> > CVE product
> >
> > Hello,
> >
> > Le sam. 1 mars 2025 =C3=A0 10:44, Peter Marko via lists.openembedded.or=
g
> > <peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :
> > >
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> > > CVE reports now show 3 CVEs for this component.
> > > They are for "The Puzzles theme for WordPress" with cpe like
> > > "cpe:2.3:a:themerex:puzzles:*:*:*:*:*:wordpress:*:*".
> > >
> > > Setting vendor solves these false positives.
> > > Vendor is set per git path "git://git.tartarus.org/simon/puzzles.git"=
.
> > > This may be wrong value, but since we don't support negative regex, t=
his
> > > is the best we can do now if we don't want to start marking all with
> > > cpe-incorrect status one by one.
> > >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> >
> > Thank you for taking care of the CVEs.
> >
> > For this patch though, another patch was prefered :
> > https://lists.openembedded.org/g/openembedded-core/message/212280 (now
> > in master-next, should be merged soon)
> > The rationale is: since there is no CVEs on "our" puzzles, we can't
> > predict what the CPE will be when that happen, so, in the meantime, we
> > explicitly ignore CVEs from the wordpress plugin.
> >
> > Regards,
> >
> >
> > > ---
> > >  meta/recipes-sato/puzzles/puzzles_git.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-
> > sato/puzzles/puzzles_git.bb
> > > index 677a9e291e0..df2491ec850 100644
> > > --- a/meta/recipes-sato/puzzles/puzzles_git.bb
> > > +++ b/meta/recipes-sato/puzzles/puzzles_git.bb
> > > @@ -20,6 +20,8 @@ inherit cmake features_check pkgconfig
> > >
> > >  DEPENDS +=3D "gtk+3"
> > >
> > > +CVE_PRODUCT =3D "simon:puzzles"
> > > +
> > >  do_install:append () {
> > >      # net conflicts with Samba, so rename it
> > >      mv ${D}${bindir}/net ${D}${bindir}/puzzles-net
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#212092): https://lists.openembedded.org/g/openemb=
edded-
> > core/message/212092
> > > Mute This Topic: https://lists.openembedded.org/mt/111449818/4316185
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [yoann.congal@smile.fr]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > Yoann Congal
> > Smile ECS - Tech expert



--=20
Yoann Congal
Smile ECS - Tech expert

