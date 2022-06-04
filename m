Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6A8C43334
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 17:40:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.12356.1654364427968105107
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 10:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ifNjIVV9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id q15so6260896wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 10:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=8Co7dppNYbngSngw+1LWZMhT0/YTOT8ewFjiu3BLnEU=;
        b=ifNjIVV9V7BS+O65B8Ta7QaDN2BaXLH3iP8Z6u/i/3ENnvgScpu9S7LW3okz4Ph9CL
         vIunvNbvGLqo/MuL7mJmhaxQSoqsZzgVq3imKFKNDMRaiuV3u+bq9q8HigQ9M1kgv5w7
         UHqho6aoVJ54XkjgIaPzt65Jv9zKttfo5ZcmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=8Co7dppNYbngSngw+1LWZMhT0/YTOT8ewFjiu3BLnEU=;
        b=u/LVFDkxp/WIvbHDC8WlnZ3JI034yIZSQgP1moKauD9SyhlC9EGGlBMiAuJ3eDhoUk
         yTj2uvNJwDyViv8qf/Or9PFLGrXBh0xS3BWjXSi33JJ8EX/v3x5vPS1wbLYx7GPsOYc5
         /iD0u81ob7ohsaAPU208mnsdDfqADfWzymnL8ySRnvbcGlhjvLSaB+oebWtYwzp0hqVv
         xbHL2lTxzvf7/tDLOSQ0zu9oJ90b4+TgBn4gmnV7yfsL2pawv4oHvR8cO1XEr9CFMept
         WRVYjyQ8cS0tyGpf4a5xPiFXIalRZf91Er7ZVAsoB/FuFXnPkmJHFEGrT4TIiRL6uwAN
         INLw==
X-Gm-Message-State: AOAM532Alvyk+/BxGBqZ9kWOL0CDwyjhChgReDetxacwphkygRyYQNe7
	wOV2lXAzizHa913qJ/cI5G77aw==
X-Google-Smtp-Source: 
 ABdhPJx8C3hROSJsvdc/nk9RxXORJmeheKx6jjLXCKQNjBZsWxNf+oMMMOBIDqjfqRiwfSUHrayaTQ==
X-Received: by 2002:a05:6000:1889:b0:210:27d5:2a95 with SMTP id
 a9-20020a056000188900b0021027d52a95mr13644389wri.612.1654364426305;
        Sat, 04 Jun 2022 10:40:26 -0700 (PDT)
Received: from max.broadband ([90.255.151.131])
        by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c35d300b0039c2e2d0502sm9658335wmq.4.2022.06.04.10.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 10:40:25 -0700 (PDT)
Message-ID: 
 <2b098a7b1940704e69d5dca8e5df3db1fa185819.camel@linuxfoundation.org>
Subject: Re: [swat] [OE-core] perl makefile race - any make experts who can
 help?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Randy MacLeod
 <randy.macleod@windriver.com>,  openembedded-core
 <openembedded-core@lists.openembedded.org>, swat@lists.yoctoproject.org
Date: Sat, 04 Jun 2022 18:40:24 +0100
In-Reply-To: <45cc4ad9-f7bc-e0ff-9252-512bb2d3d55e@gmail.com>
References: 
	<8f3b92e25906a33c828d61941d45a26448ace79f.camel@linuxfoundation.org>
	 <CANNYZj_+jtBR77R8pFONWjOCG31AhsSCHA98MLBV4tY7qvSpkw@mail.gmail.com>
	 <16F56B1475C84995.11448@lists.yoctoproject.org>
	 <061c22b495d0d2b5830332c5258c82ee30aa67fa.camel@linuxfoundation.org>
	 <CAMKF1sr+1oX4KbvHEUMnifKOEdjzbWiJPOThOwnLoeYrK9QS0g@mail.gmail.com>
	 <45cc4ad9-f7bc-e0ff-9252-512bb2d3d55e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 17:40:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166572

On Sat, 2022-06-04 at 17:12 +0200, Jacob Kroon wrote:
> On 6/4/22 16:55, Khem Raj wrote:
> >=20
> >=20
> > On Sat, Jun 4, 2022 at 6:23 AM Richard Purdie=20
> > <richard.purdie@linuxfoundation.org=20
> > <mailto:richard.purdie@linuxfoundation.org>> wrote:
> >=20
> >     On Sat, 2022-06-04 at 13:36 +0100, Richard Purdie via
> >     lists.yoctoproject.org <http://lists.yoctoproject.org> wrote:
> >      > On Sat, 2022-06-04 at 13:51 +0200, Alexander Kanavin wrote:
> >      > > Here's something I didn't think of before. Has this occurred
> >     anywhere
> >      > > else except Ubuntu 18.04?
> >      >
> >      > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14096
> >     <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14096>
> >      >
> >      > I'm struggling to get the data out from the old builds, one ment=
ions
> >      > ubuntu1604, there is an ubuntu1804 on both x86 and arm hosts.
> >      >
> >      > It is possible this is an ubuntu specific make issue or a make b=
ug.
> >=20
> >     Ubuntu 18.04 uses make 4.1 which is old (Oct 2014).
> >=20
> >     I noticed these patches from 2016:
> >=20
> >     https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D9bb994e8319=
c2b153cd3d6d61e2c2882895e7c3a
> >     <https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D9bb994e831=
9c2b153cd3d6d61e2c2882895e7c3a>
> >     https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D4762480ae9c=
b8df4878286411f178d32db14eff0
> >     <https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D4762480ae9=
cb8df4878286411f178d32db14eff0>
> >=20
> >     I think we may want to mandate a modern make for both this class of
> >     issues and also perhaps for better loadavg support to keep load und=
er
> >     control on the autobuilders.
> >=20
> >     I'm torn, on the one hand we need to test the distros people use, o=
n
> >     the other we do need to remove sources of intermittent issues. I th=
ink
> >     this bug must be some issue with make itself.
> >=20
> >     Adding a make-native dependency to perl would "hurt" people on mode=
rn
> >     distros...
> >=20
> >=20
> > Make perhaps does not have many complex dependency needs so it might no=
t=20
> > be as bad
> >=20
>=20
> My master build is already building make-native due to a dependency from=
=20
> glibc, since 2018:
>=20
> https://git.openembedded.org/openembedded-core/commit/?id=3D0cd89e4af6259=
41f8ab8c033f72f900a2979b304
>=20
> Don't know if that dependency is still valid though.

It is a fair point. We may as well add it to perl/perl-native. Centos7
still has make 3.82 but I think we now already require buildtools
tarball there so we could probably drop the glibc dependency on make-
native now.

Cheers,

Richard

