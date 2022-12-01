Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833A9C4332F
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 23:20:17 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.61007.1669936813150182011
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 15:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FtBU2Pch;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id f18so5291118wrj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rsnsp29dBSHOTx2gPtrQhtMgrHYXcpJymcjSEPedqJ0=;
        b=FtBU2PchPStoEGjPBT855ZQf9DbRBfFfIYT5TLr23V3LvvtUq45r2B+8C77P1ls8Mt
         bYpi2vqnShlYLLQVaG64otMey7XcmwmDfWg0D6rf1yHHGsqCzb+4i0tvC4adSxs9URYW
         8jbAq1g0V6GBTmuzUx6wf0WA1UL0oYMk7xUL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rsnsp29dBSHOTx2gPtrQhtMgrHYXcpJymcjSEPedqJ0=;
        b=TnHGilM3z4Bs/Ft+jYsT8lXtlz/OGdT94zynhl9dxoy+Difm5Mxy/eE1jNA2fp6+JJ
         3hg8MhmYH39BGvkExxicxbhaeETgdGdYjoWRJRlovSL1ACvEPt0tXsih3G54Korr4V/Y
         u1FJnUNCA0OIckyLBZ3TpQMM9bv9rVxrUeTwfCr0YmAJ+Qe7yD976KHNOkzuyhP9+/1C
         f8+Uf1U+9rmVpblZRTnc6e3Ftc73CI5+Y+/oe4JtDoUrWaEbCsz6+BdeYclK4LbhXOwm
         GZ0qQGgEOO0XI/Kcu71KDf3dpQCojj9ggoeaAfGLfo4fRKaCumDzU3pXnk3CwGtSyIwu
         Bp1g==
X-Gm-Message-State: ANoB5pl75zlrEa/JNQGizC2FG7LMWttpn7YxKfOrNUkmJzxFOdGPBgPn
	O/TYy27meJ9rVKUVUUzI47zFYQ==
X-Google-Smtp-Source: AA0mqf4oXklB3nH68sUt3t0YyGcIgDVtYwsw9e0TQhFZVlNdo9ujiR4cuq9/gGVN/CtdR1TacYL1hA==
X-Received: by 2002:adf:dc01:0:b0:241:b6d0:97e with SMTP id t1-20020adfdc01000000b00241b6d0097emr31217332wri.100.1669936811196;
        Thu, 01 Dec 2022 15:20:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3f4c:de93:c029:9984? ([2001:8b0:aba:5f3c:3f4c:de93:c029:9984])
        by smtp.gmail.com with ESMTPSA id co16-20020a0560000a1000b00241b6d27ef1sm5745885wrb.104.2022.12.01.15.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:20:10 -0800 (PST)
Message-ID: <bd44a8ef327c3316e82a4f6a5b8e5b96c00d8019.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/6] pseudo: Disable LFS on 32bit arches
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 01 Dec 2022 23:20:10 +0000
In-Reply-To: <CAMKF1spdT_yK7K-Do++uMvbxsfAhuPZMu-6qgPn2uBkwi-aSGg@mail.gmail.com>
References: <20221201190248.175753-1-raj.khem@gmail.com>
	 <20221201190248.175753-6-raj.khem@gmail.com>
	 <e65f40a225318abefd91c75d51943fc141368082.camel@linuxfoundation.org>
	 <Y4kzP3WMTabOHMYB@mail.local>
	 <CAMKF1spdT_yK7K-Do++uMvbxsfAhuPZMu-6qgPn2uBkwi-aSGg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 23:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174216

On Thu, 2022-12-01 at 15:07 -0800, Khem Raj wrote:
> On Thu, Dec 1, 2022 at 3:05 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >=20
> > On 01/12/2022 19:12:50+0000, Richard Purdie wrote:
> > > On Thu, 2022-12-01 at 11:02 -0800, Khem Raj wrote:
> > > > pseudo overrides certain libc functions which are aliases when LFS6=
4 is
> > > > enabled. In anycase pseudo may not be much used on 32bit systems an=
yway
> > > >=20
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >=20
> > > > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/reci=
pes-devtools/pseudo/pseudo_git.bb
> > > > index c34580b4ff..c3f0a987fc 100644
> > > > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> > > > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > > > @@ -17,5 +17,7 @@ SRCREV =3D "c9670c27ff67ab899007ce749254b16091577=
e55"
> > > >  S =3D "${WORKDIR}/git"
> > > >  PV =3D "1.9.0+git${SRCPV}"
> > > >=20
> > > > +TARGET_CPPFLAGS:remove =3D "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BIT=
S=3D64"
> > > > +
> > > >=20
> > >=20
> > > We need to put some comments in here about what this is doing and why=
.
> > >=20
> >=20
> > Note that this was one of the issues I had with the
> > -D_FILE_OFFSET_BITS=3D64 -D_TIME_BITS=3D64 build. My guess is that we a=
lso
> > have to remove -D_TIME_BITS=3D64.
>=20
> Eventually yes, however lets do that incrementally. First I am trying
> to get LFS handled.

Pseudo is a bit of a special case so if we can see an issue here, lets
add the other bit needed as well please! :)

I don't mind if it is one or two patches but we should do it.

Cheers,

Richard


