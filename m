Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB85D24452
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 21:01:44 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.55675.1728594097752384250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 14:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PEDr9ZDH;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso218675766b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 14:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728594096; x=1729198896; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dpzpPpIhYRBkzk3onpMVvpsj5PvYUcvzfKeB/8aDCqw=;
        b=PEDr9ZDHxBZ1ikHxr9LJ7BRtoEwt6I0srp5tyUnW79MB0XTsXYogaWg33KVADgG4yD
         s0c03IWL/Po832SDhloxBFZWucLZbIRz3xGEtTo0/pXOmsql1ubY6tFL8mvlCs4AzbTW
         IHg8y2Id6tjguh9GLqXGIp7vuSx2d//Td3syZBwCqPjfHOjBN/tlFtdUnHgpdC7Q9+D7
         i2wlqAXh7t9JBGsXdTGnH5IZt2f2vbtuL49Vf1yKRS/sFGSzxehOR241a+W0nXlhABDU
         CT0O9uqlUz9/of6RgYC4z1jV0zutBDhly9DWvK6dod2C8YFs2odpZkwmmXIFU9sqI5VP
         Gi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728594096; x=1729198896;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpzpPpIhYRBkzk3onpMVvpsj5PvYUcvzfKeB/8aDCqw=;
        b=C+Im5EuUAsxuMdxXFX8KI53FFH+9LVG0IXCzJO9m/Zvkq7v+5RDDFzfxpAWmorjYYM
         S4IzEyU0MATBOMq1M4pUtaATtvSWunxkqyxW2L5RkrqgUO2ae8RMeDKDCWhXFmQ7/aNs
         vax6Xd2EzG083w9uuSPJULBQxjyzLw+WYVdu0kkNrynkhBfNHXtJmkLfz79pwkMxTGTC
         a1cZy12K/f+FKwZF4hii0t17a2xcAXKkaCbFQpOpOF7715vL14Qzdym0pqb6Mbxyqwph
         +fbcwX9KCTi+Ua0Z+nTaVKAFe3CWg0AQuWBibu3Nmzvy04ul9wV+zzEvUvwPe/6n9qJo
         jAIw==
X-Forwarded-Encrypted: i=1; AJvYcCVDxJ4QU8ZNvAW6awwS/i2Ern9757xF/9zedDt/ZZaSzVMe1lezrHvZMRKA44V1hAm2bex4UQvJqy6LOw1nHCcA0g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzV+jWlMBkAFJOFsQ6Q9eOXd4v2Fq5edy1JqA6h2JIY0xTwGYVx
	2C5WMAQ9RjUQEpkjkN5BxzeGBhAK3+koo7tWjQwvhVUyq9ljEvBj
X-Google-Smtp-Source: AGHT+IGT/qJd0r64RpMo5TadymjCuGpMqFZMBWjxrjNV/lDJvi8weeoCq4VO7WDHqsieZ6EKuAHHYQ==
X-Received: by 2002:a17:907:6eac:b0:a99:b6a1:bb4b with SMTP id a640c23a62f3a-a99b94097bemr25616766b.29.1728594095800;
        Thu, 10 Oct 2024 14:01:35 -0700 (PDT)
Received: from [192.168.1.70] (0x57346aa5.static.cust.fastspeed.dk. [87.52.106.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80efb4csm134838966b.197.2024.10.10.14.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:01:35 -0700 (PDT)
Message-ID: <41e5d235b97218e65737069ea5f541ae2114dbc9.camel@gmail.com>
Subject: Re: [OE-core] [RFC][master][PATCH] populate_sdk_base: Add
 SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Date: Thu, 10 Oct 2024 23:01:34 +0200
In-Reply-To: <CANNYZj-LcppbLy4bsHH6oRJeK6pPVXgVB_oq1UPik9B5wO2oGg@mail.gmail.com>
References: <20240927132040.200122-1-claus.stovgaard@gmail.com>
	 <c3155a29aa855283f3396582c989263d93ded4f3.camel@linuxfoundation.org>
	 <2456863182484d2b15f75fe0f67a3473240a3fe6.camel@gmail.com>
	 <CANNYZj-Wna0xVjvoX0hJwd9Kg_=yaVB+dNLecBDsjpSayo1zVg@mail.gmail.com>
	 <2b4615fffa3c131e9795255c4884d6b9eea98c86.camel@gmail.com>
	 <CANNYZj-LcppbLy4bsHH6oRJeK6pPVXgVB_oq1UPik9B5wO2oGg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 21:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205646

On Tue, 2024-10-08 at 13:42 +0200, Alexander Kanavin wrote:
> > On Tue, 8 Oct 2024 at 13:24, <claus.stovgaard@gmail.com> wrote:
> >=20
> > > > It is a build time dependency as I see it.
> > > >=20
> > > > if foo.bb is setting DEPENDS to include "bar baz and qux" to
> > > > indicate
> > > > it need it for compilation.
> > > >=20
> > > > When foo is added to an image, and we then populate_sdk for
> > > > this
> > > > image
> > > > I expect that the SDK includes the dev packages of bar baz and
> > > > qux
> > > > to
> > > > be able to compile foo with it.
> > > >=20
> > > > This has working until now as the SDK installed the recommended
> > > > packages.
> > > >=20
> > > > The key is that process_depchains in package.py make the
> > > > recommendation. From the comment
> > > >=20
> > > > <snip>
> > > > def process_depchains(pkgfiles, d):
> > > > =C2=A0=C2=A0=C2=A0 """
> > > > =C2=A0=C2=A0=C2=A0 For a given set of prefix and postfix modifiers,=
 make those
> > > > packages
> > > > =C2=A0=C2=A0=C2=A0 RRECOMMENDS on the corresponding packages for it=
s RDEPENDS.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 Example:=C2=A0 If package A depends upon package=
 B, and A's .bb
> > > > emits an
> > > > =C2=A0=C2=A0=C2=A0 A-dev package, this would make A-dev Recommends:=
 B-dev.
> > > > </snip>
> > > >=20
> > > > I will start on creating an example on my github account
> > > > showing
> > > > the
> > > > issue better if it is not yet clear.
> >=20
> > I still don't understand why the standard SDK population mechanism
> > doesn't work for you. It does pull in -dev for everything that is
> > in
> > the image, so where does this break down?
> >=20
> > Alex


I have made a small example on github - in the sdk_example branch
https://github.com/frosteyes/yocto-master/tree/fe/sdk_example

In short it has a layer named meta-fe.
This contains a small app named fe-app (just a program with boost
dependency), and a dummy-fe-app as placeholder for the same
dependencies.

https://github.com/frosteyes/yocto-master/tree/fe/sdk_example/meta-fe/recip=
es-application/fe-app

Next their is two images. image-amp-base based on core-image-minimal,
just adding dummy-fe-app, and a image-fe starting from the base image,
but removing the dummy-fe-app and adding the fe-app instead.

Think of this as a pattern, where you have several dummy packages, and
that the dependency includes a significant number of packages like
boost, qt packages, gstreamer, etc.

Until know this pattern have worked great for having a base sdk /
image, able to be shared to an application team, so they have something
to code against when upgrading, so their is breaking changes of the
application.

It is based around that the SDK installed the recommends packages, as
the list of packages ends in the recommends section of the RPM
packages.

yocto@yocto:~/./deploy/rpm/core2_64$ rpm -q --recommends dummy-fe-app-
dev*
boost-dev
dummy-fe-app =3D git-r0

But as the dummy package only contain a text file and no binary, the
rpm --requires only list the default rpmlib and not all the files
located for the binary of fe-app.

Hope it make it more clear what workflow their is broken with the
change, and why my patch suggest to making it a configurable option.

Will update the patch (split out documentation and better commit
message) and send v1 of the patch.

/Claus


