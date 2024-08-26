Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFCEC5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:26:20 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.48659.1724664376529746128
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cctniWB7;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e165ab430e7so4142173276.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 02:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724664376; x=1725269176; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4L7v2M5iyv/5APd/rwRT2L37BJRnjP56SR/NY+TGwZg=;
        b=cctniWB7zEt+aV6j5gpb3/7jM7AP/1zz9wDnq51QmbrxKeqDj/nvdGGx+1wUVBxpw8
         XcJDsXH2Ps7DYWebLGZluaxQ248KK+MjnQ0SRNW3JxvbIm+lqCS3hktYfbzMhfbxTQmM
         VGRkC6itK3iR4BJ+4zWMgnQ3e0JsshEzvqM1If9X6X6BLbtdHjdW70uhWKgY3QuWvdVx
         888WyOBVuwrKUolt8PScTv+z8DZ6xL0cGjGLKdsQpNKeWU34Enpwv1PY/74yUW7g4Q6Q
         tIMOahYm+ZBq11DWEmYjbhvz5LFnYEAtXzu4KYeNWL3o21l/1/Snx9gpM34GUFscgceK
         T4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724664376; x=1725269176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4L7v2M5iyv/5APd/rwRT2L37BJRnjP56SR/NY+TGwZg=;
        b=fTlanPve0yoa9JH8SO33BiTWMDpuM2A6PYnVMWxSapzVYvhByIzkXYSZDftT4RNZNP
         ajp3LOnOkVlw3cQKQF9UNoGO8KhJrpWql1XMo7U30PUb5tGLSovwqMC0M9P+kFFX4Vov
         KEKXbOyaDMkUnV5JqvamfOSYZsf3jX77YerU2mHu3sXBHNYAHeoNERpm69f0YbwVDtWW
         PDM0n6hp2EscBJM35k1Bg9HtNUMdteOM89iptHWnThGkZtnIFzt9CMCDMhZlju1OWtQz
         8nIF9SmQ94Gdud07xfe0Ny5iZ9UhUMjtHeR9Z2nEWP6SAGzvKL3oUj60H7XD1dZbuc7v
         MglA==
X-Gm-Message-State: AOJu0YyI0PjYx6fQjss1xjXzTuK47Cru78WpW/4oDuwzCplgiStS5oOC
	8A8G1ARr84/dBO/sQton2JIXeY7OaBlqu8PiiFuyGs1lQsRXDviaeMEAC1msmfwWa0yv+fDKwLA
	oMq/QzOwRn9BNXUuiMbryyqJ34qA=
X-Google-Smtp-Source: AGHT+IHHKD7WdMUJwBIJufmg2bVpjDD3QV1Q7+HYwPYzE5wUj3NYTOLdNIPmtL0UZ9U+DPc0ciHjuz83EBIBaxz3UDc=
X-Received: by 2002:a05:6902:1023:b0:e11:7e64:175b with SMTP id
 3f1490d57ef6-e17a86a7835mr11071546276.53.1724664375507; Mon, 26 Aug 2024
 02:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAHirDJ8tUihjou3-4qirjk1vGVTXVrRg+TjKxmu2qvOtj2EVwQ@mail.gmail.com>
 <CANNYZj-aBjxP_usuhdoMNKvdcEAzw7-N2UiSqCTkoBqRAv9j4w@mail.gmail.com>
In-Reply-To: <CANNYZj-aBjxP_usuhdoMNKvdcEAzw7-N2UiSqCTkoBqRAv9j4w@mail.gmail.com>
From: Claus Stovgaard <claus.stovgaard@gmail.com>
Date: Mon, 26 Aug 2024 11:26:04 +0200
Message-ID: <CAHirDJ_V1Tc4a268w1uUXYrNAd_MJCjuVJOY0YPwzjF3wvS9-Q@mail.gmail.com>
Subject: Re: [OE-core] SDK in scarthgap after package_manager: Change
 complementary package handling to not include soft dependencies
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>, 
	Andreas Helbech Kleist <andreaskleist@gmail.com>, Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 09:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203742

Hi Alex
Thanks for the quick response.
I know of this approach - and it has also with this - but it is flawed
in that it is a catch 22 regarding dependencies.
For the embedded team to make changes to the yocto part (e.g. upgrade
boost, or other libs, compiler etc.) the application needs to be able
to compile with this change. For the application team to update the
app to be able to handle those yocto changes they need a SDK with it)

Thats why I have used the dummy package until now. I could make the
changes to our yocto part - knowingly that our image for the target is
not able to be build as the applications can't compile yet in a
branch, and let our CI system generate a SDK. Ask the application team
to update the code to handle the new components and then merge a
commit in our yocto where both the applications SRCREV is changed and
the other changes to yocto.

Being able to generate an image without the application itself - but
with all the dependencies also has the advantage that you can create a
docker container or similar, and using it for CI of the application
code.

Currently we are not using the eSDK - as it requires significantly
more yocto knowledge than the basic SDK. (Not all app developers is on
Linux, and they don't necessarily care about yocto)

Will look more into it eSDK, though I would expect other also has the
need to generate SDK to support app teams without the specific app
itself part of the SDK, but with all the dependencies for the app.

Thanks.

On Mon, Aug 26, 2024 at 10:44=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> The standard way is to have an image recipe that does include the app,
> and then create the SDK based on that image. Then all dependencies
> etc. will be pulled in through standard mechanisms, and if something
> doesn't work that way, we can take a look.
>
> I would recommend you look into giving app developers a sstate-driven
> yocto build, where they can set up the SDK environment directly from
> latest layer metadata:
> https://docs.yoctoproject.org/sdk-manual/extensible.html#installing-the-e=
xtensible-sdk
>
> Alex
>
> On Mon, 26 Aug 2024 at 10:38, Claus Stovgaard via
> lists.openembedded.org
> <claus.stovgaard=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Hi folks.
> >
> > I am working on upgrading a project from Kirkstone to Scarthgap, and
> > hit a problem I would like to have your input on, regarding the change
> > in Langdale to not include soft dependencies.
> >
> > The background is that the project has 2 teams. An embedded group for
> > handling yocto etc. and an application team using a SDK created by the
> > embedded group to create applications.
> > As the applications has dependency on libs and utilites from the
> > yocto, and we need to give the application team a SDK so they can
> > incorperate the change in dependency before creating an image for the
> > target, we have used "dummy" packages.
> >
> > This means that we has the DEPENDS located in a include file, and have
> > two recipes including those
> > * dummy-app.bb (used by the SDK, and is just an "empty" package with 1 =
txt file)
> > * the_real_app.bb (used by the image for target)
> >
> > Until know the SDK has included all the packages mentioned in the
> > DEPENDS, but this is not the case anymore.
> > In process_depchains - we have the pkg_adddeprrecs method updating the
> > RRECOMMENDS with a filtered result from the DEPENDS.
> > And RRECOMMENDS ends in the recommends for the rpm file - not
> > installed in the SDK after we are not including the soft dependencies.
> >
> > As I don't expect to be alone in needing to create a SDK for some
> > applications, where the applications and the DEPENDS changes so you
> > need to create the SDK with all the dependencies for this application
> > without the application itself part of the sdk.
> > What is the preferred way of doing it, now soft dependencies is removed=
?
> >
> > A workaround might be to hack the RDEPENDS for the dev package in the
> > dummy-app.bb - something like
> >
> > RDEPENDS:${PN}-dev +=3D "boost-dev cli11-dev ......"
> >
> > But I don't really like it - as the DEPENDS does not really fit 1 to 1
> > with this.
> >
> > Any input on this.
> > How do you designs SDK's for applications, where the applications
> > itself is not part of the image. Do you manually add to the
> > TOOLCHAIN_TARGET_TASK or similar?
> >
> > Looking forward to your input
> >
> > /Claus - A.K.A frosteyes on irc
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#203738): https://lists.openembedded.org/g/openembed=
ded-core/message/203738
> > Mute This Topic: https://lists.openembedded.org/mt/108100662/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

