Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A203CCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 09:36:25 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9893.1762940179561963884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 01:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I5b700bB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b31c610fcso484401f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 01:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1762940178; x=1763544978; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SOShIGMOtZoqINDjoMyg58Fp2Yp1viYupMHTcf1ZUME=;
        b=I5b700bBMA8spEH6olhBrxmx3OtSmNrwOb8ibGaXP/7x5Gn8F/XPTZitKqYsbInfLu
         RyFPLmIKOSyHWSBuHnCHtF3bSpACWaB/LLODMxyLjgNgvMkpgK46K/oane7aLNNp5ngR
         rocd5fAykGIlFmuL2iXElaw4o8wgeSm1ewowg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762940178; x=1763544978;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SOShIGMOtZoqINDjoMyg58Fp2Yp1viYupMHTcf1ZUME=;
        b=gEAb+2XCEzvdLlLOnCFSwnFJ1N78uY8WD2hV65jBQwvgjXhqroV8SpgnbyupQ0Dyf/
         HI9gsV5NTkhfJbw1GjxCeKRKY2MoKT3dMYcDm/hZncpPaCU8fUk1LES2e32nCL9zNubS
         KC32IlnsqPb41h2pNERKPaAfQx8WzgCGgHlJnHEaXli0dujjEmbU7A6us3zvknujohUO
         jMGwm6RZo3x9SzbpLb7uyb6ghu9stVq+P9w8PMg1fWGvcKlnHsMATm7Xo8kidkkgcjQm
         6RXjkVn/HfoBn3TxGRXML8mfRMicqpM+sTFFSkExekMutWop8BszhQ8AyUeZZzN5uPWd
         s2RA==
X-Forwarded-Encrypted: i=1; AJvYcCXNl7s7yXtxAYhk9h0NYxskX+29g2Tb12Oopo9sc7HWbN1x9RjKzde+tiFoArgLSv48WFfKB0V62NTn9yLvfagqEg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwB67ELx3C+12s/eejGZX4Qr9TxHBMemySP/R+loR6vzsmFFsN9
	Et8Lw+vTXO+20UIb7TiiQmvpH6h3KMchBGrdzwqEJ9Pf0Cngh3r2SZhkx9nPRQTy7c4=
X-Gm-Gg: ASbGncu39b06qqSR1fGgTHvpBr1wqUsRSnDy76PN6szHTNZwRW6EhsJZGoY6AO1R+da
	7VhYJIatqqUh46CXrTMCfr/xoL44dCIyicbxaqm4tI3xGdQEp0jkqCFEC1F++gt+JNDHJQlXv49
	pIJAdF8dixT9hrhyU722kfIuY4CvKtZ6Jw3U6oF+72NtYx5JjzLj4d/NhOEE9UYe8TdntFiFjcJ
	lVYD016yw5EDIAnxedQDZtMZv1sEkX8JGSsyr32/gnvMt28fj3fyo4FPLxdUV3k4Ho+T8w1cl91
	C2tY9WJQF7kOHp4grOz3jmJ99I/gmR8KQduy7K0GcwwtBP0paj63mZZuA5mHXdFBPe97Cn6DrIk
	Yc0TSSkJovZqn8xkfHCqpxk2u/Rw+jGPXkcInvniGkU3/qQUy4PJjto/JI1wM5N1S122gicBcj2
	XioHu5W0btjpxr13kvaifyFbxqWqW/nFGbHaawCdmCV3Zoxv5Nki14zDO4MYw/Hk3A
X-Google-Smtp-Source: AGHT+IECJoZyrj46F2kOZxWRA4d/QEGE7FEBedKFVO3ny99IGp7shKecIb+3bmDOLkJEaF56WLxAXQ==
X-Received: by 2002:a05:6000:40cc:b0:42b:3746:3b82 with SMTP id ffacd0b85a97d-42b4bdb8305mr1930694f8f.54.1762940177843;
        Wed, 12 Nov 2025 01:36:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8876:d08f:2a0c:d6ff? ([2001:8b0:aba:5f3c:8876:d08f:2a0c:d6ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2e052f32sm26327441f8f.17.2025.11.12.01.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 01:36:17 -0800 (PST)
Message-ID: <35da4030cb0e66d21e0497c7f9c2b777150ce7b5.camel@linuxfoundation.org>
Subject: Re: [Automated-testing] bitbake, oe-core and meta-yocto tags in
 sync? (was Re: GPIT LAVA Test Report - Job 123474: OEQA ALL PASSED (24/75)
 passed)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Cc: automated-testing@lists.yoctoproject.org, bill.mills@linaro.org, 
	ilias.apalodimas@linaro.org, javier.tia@linaro.org
Date: Wed, 12 Nov 2025 09:36:16 +0000
In-Reply-To: <aRROLHFAmzOAbzRj@nuoska>
References: <691381dc.7b0a0220.35e53.800e@mx.google.com>
	 <aRROLHFAmzOAbzRj@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 09:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226201

On Wed, 2025-11-12 at 11:06 +0200, Mikko Rapeli via lists.yoctoproject.org =
wrote:
> Hi,
>=20
> On Tue, Nov 11, 2025 at 10:35:08AM -0800, ledge-bot@linaro.org=C2=A0wrote=
:
> > LAVA Test Report for Job 123474
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >=20
> > GitLab Pipeline Information:
> > =C2=A0 Project: gpit
> > =C2=A0 Branch: main
> > =C2=A0 Pipeline:
> > https://gitlab.com/Linaro/trustedsubstrate/gpit/-/pipelines/2152817594
> > =C2=A0 bitbake: 2c6c40bdab8ebc6c04fe9992524add967fb4a053
> > =C2=A0 bitbake git describe: yocto-5.2.1-149-g2c6c40bda
> > =C2=A0 openembedded-core: e556df28f47e754b53e1f46c97dde2b19fd8fad1
> > =C2=A0 openembedded-core git describe: uninative-5.0-152-ge556df28f4
> > =C2=A0 meta-yocto: 66ea31cee15309af07afeee8dec8a6fe1d92d28e
> > =C2=A0 meta-yocto git describe: 5.3_M3-3-g66ea31c
>=20
> So this is our first build and test run with separate bitbake,
> oe-core and meta-yocto built using kas to replace old poky repo
> master branch which no longer builds. Setup details in
> https://gitlab.com/Linaro/trustedsubstrate/gpit
>=20
> The "git describe" output with tags is a bit confusing. Would it be
> possible to use same version/milestone names there?
>=20
> Currently it's a bit hard to tell if the trees are fully in sync and
> if
> yocto-5.2.1, uninative-5.0 and 5.3_M3 are compatible with each other
> or not. From pure tags it is not easy to see if trees used same
> branches, for example.

This whole area is a mess.

The OE TSC required certain things in the past. We'd have to dig out
the minutes to remember all the details but I didn't 100% agree with
what was asked for and we went ahead and did it regardless. We probably
need to revisit this but the new TSC has been unable to work out a time
to meet or schedule its meetings. Even if we had, someone needs to look
up and summarise what decisions were made and why. Keep in mind there
is years of some people being very vocal if there were yocto references
outside of yocto 'owned' repositories (i.e. in bitbake/oe-core). I
think we're past some of that now but certainly not all of it. I
actually dread this whole topic.

We also need to work out what we are currently doing and not doing and
why. I know I recently asked release engineering to stop doing certain
things as they were completely non-sensical. We had a load of
problematic tags to remove and new ones to create to replace them to
try and ensure everything was consistent. I'd have to go and check
whether that happened and whether we're now doing the right things or
not.

Now, that all sounds fine, some people need to go and do some painful
work.=C2=A0It will be far from simple, take a ton of time and nobody will
actually really see it all or ever value the end result but it can be
done. Even if (when) we do this, it isn't going to quite give you what
you want due to things like the uninative tags. Those usually happen
mid release and will "corrupt" the git describe output as those tags
will be more recent.

So yes, it does need fixing but it isn't as simple as you might think.
I'm totally burnt out and the current release is stalled. Perhaps
someone else from the TSCs wants to go and resolve this?

Cheers,

Richard



