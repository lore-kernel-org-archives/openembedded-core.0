Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AD5C7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 21:49:21 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.143661.1680731355926035667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 14:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nio36MVn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso2802353wmo.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 14:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680731354;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RSQXnM7SJCOKJbDpDszRD3GmxI6mmuZU5jgxHmBh+zk=;
        b=Nio36MVntXJ2o2EDD0Al2LLz18YDmbgbdCsSZivorqn5W8EmN1+4Ve6+vO2IN4IMbF
         9BsQ5/kxX04vbrA849ZKtFpsLy3D9BCBRJ2ov/Q7ycNMqA17MqxaCd9O6SlWSRLe6rdw
         wdDhL1IoJ9c1XmwkbolXtCSEdiLKLs1UHjHog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680731354;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RSQXnM7SJCOKJbDpDszRD3GmxI6mmuZU5jgxHmBh+zk=;
        b=CCuCzFpEQSAFOaf1bxuH5+3un64SLBADf2EvZPJCw3sVBdtOoRIiaRHLNhykaaRLan
         cUKM7TVjlF3jiRouKxHGLxq0OawyTGOIlMUto+9S74ubnN81u+nk7kD7jDEhAC8DktzJ
         AW7jwSQFgu6boRjpiSOs1zF/c0b6ac7NfYha3FJhpqH6jefTpCxKE7KjzxsLmhnFCyDV
         ndCwztFUYSozJ4agB7wPrDdtWgQ1QcJHQstkHCMFLed7DrO1xRCIGoQofvp6p34YYGVs
         Je/Gewy6Hs7le2OsN7ZknG1kd09Rjw2RlyD0pCMRAg0BXZmf4xWDsMDrX0sEefVJOwSv
         j6HQ==
X-Gm-Message-State: AAQBX9deWL1uM36GLqmAIKZ+pLqDmolG3uFbdvzgKJi8L5hNz4Yw74yr
	4BTGngMLr1DWe18VqQmL6h78JA==
X-Google-Smtp-Source: AKy350ayNmKsiYnydX/O1NytUonk0UWRjX854URecsFwr0aD0PYgccfFaWb8v46xMPOiaeu0FsH6qg==
X-Received: by 2002:a05:600c:291:b0:3ed:514d:e07f with SMTP id 17-20020a05600c029100b003ed514de07fmr6128372wmk.3.1680731354241;
        Wed, 05 Apr 2023 14:49:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6a84:552d:cd38:8d5? ([2001:8b0:aba:5f3c:6a84:552d:cd38:8d5])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c44c800b003ef4cd057f5sm3410035wmo.4.2023.04.05.14.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 14:49:13 -0700 (PDT)
Message-ID: <496761ae88d36ada1c0af4a0d94a8c45e2bbd3a1.camel@linuxfoundation.org>
Subject: Re: [OE-core][RFC PATCH] base: implement support for the
 PACKAGECONFIGEXTENDS variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Bartosz Golaszewski
	 <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, 
	=?ISO-8859-1?Q?Eil=EDs_N=ED_Fhlannag=E1in?=
	 <pidge@pidge.org>, openembedded-core@lists.openembedded.org, Bartosz
	Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 05 Apr 2023 22:49:13 +0100
In-Reply-To: <CADkTA4P1ytg42=uY0wJGa8yVKp=bUPZg6eaisvZ9LUwwMymyFQ@mail.gmail.com>
References: <20230405192413.170919-1-brgl@bgdev.pl>
	 <CADkTA4P1ytg42=uY0wJGa8yVKp=bUPZg6eaisvZ9LUwwMymyFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 21:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179752

On Wed, 2023-04-05 at 16:20 -0400, Bruce Ashfield wrote:
> On Wed, Apr 5, 2023 at 3:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> >=20
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >=20
> > Some PACKAGECONFIG switches enable building of additional artifacts tha=
t
> > end up in sub-packages for a recipe. For example in foo.bb we have:
> >=20
> >   PACKAGES =3D+ "foo-bar"
> >   PACKAGECONFIG[bar] =3D "--enable-bar,--disable-bar,libdep"
> >   FILES:foo-bar =3D "${bindir}/bar"
> >=20
> > Where ${bindir}/bar is only installed if PACKAGECONFIG contains "bar".
> >=20
> > In order to add foo-bar to the image we need to do:
> >=20
> >   IMAGE_INSTALL:append =3D " foo-bar"
> >   PACKAGECONFIG:append:pn-foo =3D " bar"
> >=20
> > This is redundant so with this change we need to add:
> >=20
> >   PACKAGECONFIGEXTENDS:foo-bar =3D "bar"
>=20
> FWIW, I prefer the explicit IMAGE_INSTALL and PACKAGECONFIG, as it
> keeps the manipulations visible.
>=20
> The level of coordination that this is doing is more like a distro
> feature, or somewhere around an image feature .. and image features
> are manipulated in image recipes, as the contents aren't global.
>=20
> So regardless of whether or not the behind the scenes work is desired,
> from what I'm seeing, this breaks the namespace and separation between
> a recipe variable and an image recipe variable. Depending on what the
> target of a build is (the recipe versus an image) both won't even be
> valid in a given run, so the variable tweaks won't work or will create
> races/other issues.

I'd agree with Bruce.

PACKAGECONFIG is controlling which packages get built and is a recipe
or distro configuration change.

Images are a separate thing which may or may not include a given
package. You may build multiple images in a single build which may or
may not include a given package.

Mixing up these two concepts is asking for trouble and will just end up
causing confusion.

Cheers,

Richard


