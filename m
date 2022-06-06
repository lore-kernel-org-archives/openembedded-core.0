Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9C4C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 10:33:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.30320.1654511576258549909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 03:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MzbjSC37;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 i17-20020a7bc951000000b0039c4760ec3fso1597683wml.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 03:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=5H7UovwW5NMElNIb3sb7Z9o8wA15Ofnbv8EdnmfouzA=;
        b=MzbjSC37U+Z/l1akqVOWHLjQcyjtVHe6c06rCX05ZaJRaeIUWsKYTcDIRjo8k/qen0
         9cA6rEdqC1MKS6Ykt0Qyv9cRGAbdLblmU8p/JZvHfV1TuVqoPDrgmJz0vO9GoJrPJd8s
         3lMQxyRxOemdP44AbdYga+OtQjilBXeXV0BNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=5H7UovwW5NMElNIb3sb7Z9o8wA15Ofnbv8EdnmfouzA=;
        b=v5eJoigbP6nRugAwsB9meQeyGBwpRFrArt65iBlp7GFR8iEiBfyD5it5H29B64QRJz
         8zy4OfVKfLweqoCDo4MfIDtmThsNhFVc+DNWToDOO7q/hi2c/45za/KrfQ364RPIK1tr
         evThdhasQaZ2ztDYaKofLUbVXURm4yGBLR2ep8luogAJOAsoYLe7hShFzarnv+Vj8EkN
         4fSms6yZhh+x6wL5XbpYZHZo+X7WqiXkQWEM0nLXh5y/msFzyPbGYg0XaO926Y/sHgaW
         FJVS+CEHuTYyUsPUiuk7d1g2eD+FDA8FmiBPGh3OGZuIyHmqjG4B9gGa4XXJ7L7mEZIZ
         +DDQ==
X-Gm-Message-State: AOAM531hIAkAb8sJI527gGCLrK6qI1gxiAIbjzF0BH55S8Zqz+tgiE9z
	ANWs5liB2XBcbDkd32GcjsBSSQ==
X-Google-Smtp-Source: 
 ABdhPJy8PzdH+BawJikt7bO8k3WtQzxAwAsm8pZxgytoYyoOYb9tmsSl4i9KGmg5vQ/j85oIZjDXBA==
X-Received: by 2002:a05:600c:5008:b0:39c:54a7:5664 with SMTP id
 n8-20020a05600c500800b0039c54a75664mr1729585wmr.35.1654511574645;
        Mon, 06 Jun 2022 03:32:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:22ca:1a07:c46c:a885?
 ([2001:8b0:aba:5f3c:22ca:1a07:c46c:a885])
        by smtp.gmail.com with ESMTPSA id
 v190-20020a1cacc7000000b003975c7058bfsm17115797wme.12.2022.06.06.03.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 03:32:53 -0700 (PDT)
Message-ID: 
 <c1fd78ea1ca0c875aade6fe0abbb4e36577b5ca2.camel@linuxfoundation.org>
Subject: Re: [swat] [OE-core] perl makefile race - any make experts who can
 help?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Randy MacLeod
 <randy.macleod@windriver.com>, openembedded-core
 <openembedded-core@lists.openembedded.org>, swat@lists.yoctoproject.org
Date: Mon, 06 Jun 2022 11:32:53 +0100
In-Reply-To: 
 <CAPbeDCnsxHsV=CKv7AVhNuvDn9QcORBQhx-DoQ4B9D-Qm+g3Kg@mail.gmail.com>
References: 
	<8f3b92e25906a33c828d61941d45a26448ace79f.camel@linuxfoundation.org>
	 <CANNYZj_+jtBR77R8pFONWjOCG31AhsSCHA98MLBV4tY7qvSpkw@mail.gmail.com>
	 <16F56B1475C84995.11448@lists.yoctoproject.org>
	 <061c22b495d0d2b5830332c5258c82ee30aa67fa.camel@linuxfoundation.org>
	 <CAMKF1sr+1oX4KbvHEUMnifKOEdjzbWiJPOThOwnLoeYrK9QS0g@mail.gmail.com>
	 <45cc4ad9-f7bc-e0ff-9252-512bb2d3d55e@gmail.com>
	 <2b098a7b1940704e69d5dca8e5df3db1fa185819.camel@linuxfoundation.org>
	 <CAPbeDCnsxHsV=CKv7AVhNuvDn9QcORBQhx-DoQ4B9D-Qm+g3Kg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 10:33:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166590

On Sun, 2022-06-05 at 04:26 +0200, Jacob Kroon wrote:
> On Sat, 4 Jun 2022, 19:40 Richard Purdie,
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2022-06-04 at 17:12 +0200, Jacob Kroon wrote:
> > > On 6/4/22 16:55, Khem Raj wrote:
> > > >=20
> > > >=20
> > > > On Sat, Jun 4, 2022 at 6:23 AM Richard Purdie=20
> > > > <richard.purdie@linuxfoundation.org=20
> > > > <mailto:richard.purdie@linuxfoundation.org>> wrote:
> > > >=20
> > > > =C2=A0 =C2=A0 =C2=A0On Sat, 2022-06-04 at 13:36 +0100, Richard Purd=
ie via
> > > > =C2=A0 =C2=A0 =C2=A0lists.yoctoproject.org <http://lists.yoctoproje=
ct.org>
> > > > wrote:
> > > > =C2=A0 =C2=A0 =C2=A0 > On Sat, 2022-06-04 at 13:51 +0200, Alexander=
 Kanavin
> > > > wrote:
> > > > =C2=A0 =C2=A0 =C2=A0 > > Here's something I didn't think of before.=
 Has this
> > > > occurred
> > > > =C2=A0 =C2=A0 =C2=A0anywhere
> > > > =C2=A0 =C2=A0 =C2=A0 > > else except Ubuntu 18.04?
> > > > =C2=A0 =C2=A0 =C2=A0 >
> > > > =C2=A0 =C2=A0 =C2=A0 > https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D14096
> > > > =C2=A0 =C2=A0 =C2=A0<https://bugzilla.yoctoproject.org/show_bug.cgi=
?id=3D14096>
> > > > =C2=A0 =C2=A0 =C2=A0 >
> > > > =C2=A0 =C2=A0 =C2=A0 > I'm struggling to get the data out from the =
old builds,
> > > > one mentions
> > > > =C2=A0 =C2=A0 =C2=A0 > ubuntu1604, there is an ubuntu1804 on both x=
86 and arm
> > > > hosts.
> > > > =C2=A0 =C2=A0 =C2=A0 >
> > > > =C2=A0 =C2=A0 =C2=A0 > It is possible this is an ubuntu specific ma=
ke issue or
> > > > a make bug.
> > > >=20
> > > > =C2=A0 =C2=A0 =C2=A0Ubuntu 18.04 uses make 4.1 which is old (Oct 20=
14).
> > > >=20
> > > > =C2=A0 =C2=A0 =C2=A0I noticed these patches from 2016:
> > > >=20
> > > > =C2=A0 =C2=A0
> > > > =C2=A0https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D9bb99=
4e8
> > > > 319c2b153cd3d6d61e2c2882895e7c3a
> > > > =C2=A0 =C2=A0
> > > > =C2=A0<https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D9bb9=
94e
> > > > 8319c2b153cd3d6d61e2c2882895e7c3a>
> > > > =C2=A0 =C2=A0
> > > > =C2=A0https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D47624=
80a
> > > > e9cb8df4878286411f178d32db14eff0
> > > > =C2=A0 =C2=A0
> > > > =C2=A0<https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D4762=
480
> > > > ae9cb8df4878286411f178d32db14eff0>
> > > >=20
> > > > =C2=A0 =C2=A0 =C2=A0I think we may want to mandate a modern make fo=
r both this
> > > > class of
> > > > =C2=A0 =C2=A0 =C2=A0issues and also perhaps for better loadavg supp=
ort to keep
> > > > load under
> > > > =C2=A0 =C2=A0 =C2=A0control on the autobuilders.
> > > >=20
> > > > =C2=A0 =C2=A0 =C2=A0I'm torn, on the one hand we need to test the d=
istros
> > > > people use, on
> > > > =C2=A0 =C2=A0 =C2=A0the other we do need to remove sources of inter=
mittent
> > > > issues. I think
> > > > =C2=A0 =C2=A0 =C2=A0this bug must be some issue with make itself.
> > > >=20
> > > > =C2=A0 =C2=A0 =C2=A0Adding a make-native dependency to perl would "=
hurt"
> > > > people on modern
> > > > =C2=A0 =C2=A0 =C2=A0distros...
> > > >=20
> > > >=20
> > > > Make perhaps does not have many complex dependency needs so it
> > > > might not=20
> > > > be as bad
> > > >=20
> > >=20
> > > My master build is already building make-native due to a
> > > dependency from=20
> > > glibc, since 2018:
> > >=20
> > > https://git.openembedded.org/openembedded-core/commit/?id=3D0cd89e4af=
625941f8ab8c033f72f900a2979b304
> > >=20
> > > Don't know if that dependency is still valid though.
> >=20
> > It is a fair point. We may as well add it to perl/perl-native.
> > Centos7
> > still has make 3.82 but I think we now already require buildtools
> > tarball there so we could probably drop the glibc dependency on
> > make-
> > native now.
>=20
>=20
> Would it be a bad idea to add make-native to DEPENDS depending on
> whether the host version of make is new enough or not ? Would it
> break sstate cache reuse in some way ?=C2=A0

We can't have a conditional dependency like that, the task checksums as
implemented today wouldn't work and it would break ssttate reuse.

Cheers,

Richard



