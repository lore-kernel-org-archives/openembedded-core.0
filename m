Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A9AC761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 16:11:42 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.106103.1680624694630560519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 09:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gXYTUqMu;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 6-20020a9d0106000000b006a177038dfeso8423323otu.7
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 09:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680624694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=As4Kdj/TneimEciG593zD3iqOF3edHicUgS4YS0/BBQ=;
        b=gXYTUqMulguQyntW/gMiehre4lE3J/iH+h8CMWmmPM5E69gQ5snpDTQtVzLoe/OEkM
         VLHcX259VJsP/UzGHpZXUV9ys2UbPS7yYXCqEF2+abSCTWrhCC6Fq+Xk9pUKF4Qm+Z92
         g0E/XjjRNwADnMXBO0fNfkHly5YCtchiP0sJwd1ueNd4XMkrRp+2kxNGtdv+3Ydg5JPT
         GqhH3/atiGp7tGCBLni21Y85c8u+vCdMOZFoHsURB0U5kmP/YSZJ4OqAVPXPjz6XzYvn
         wTKFIOsksXQ6SOLpBgQR7T1q2g5cEEGeAlln2/saLIfW6wHY3BzQ5Fg1K8nyMHLpubCB
         M3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680624694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=As4Kdj/TneimEciG593zD3iqOF3edHicUgS4YS0/BBQ=;
        b=pxMf72D6J7FCbCAS5q2zYieNXrSypgBsqyAWF3oFbCzHCaJnuuAXOR+e8LEYejfFI9
         zExItc0grVFQ17C3687XaKJvJAB2GHiapBK12uqrCbV8OuipJi0+CteqciZ9eo2Skygi
         729JJnBTgT3nusg7V/sEBNV1szTO3x5QtWWCGwJH5oHZFOolDYvzab5yLEbQvMVwXVs/
         wKQgKHE1TFGJdcl/FdpURa0KI2gJHWmJal01JRvjL+LiAvNDzmIjd1HAsnE78D6kOzc6
         kOzmNxxE3llvfui7e/WRxZOZFcybbM3iv5emq84trlxpzv6njgUZVbCHiYry2tKeJNHo
         mdfg==
X-Gm-Message-State: AAQBX9dXwuM5d96MM9SCNDKdzHmylFVonQO1JiqewJ/3taCnrvE+dkYD
	itT+AX4qHfSo9f9YPKG/rd+QygC0RLnTfAKc9k8=
X-Google-Smtp-Source: AKy350bjJAGOXjGzU7qB6vTLdTUM5PRsiNjqsDsL+vOddzWKfIq8I7ZNIWc1eLgcK31XLtHGBMlZsMJdLTt7sbFq67A=
X-Received: by 2002:a9d:75d1:0:b0:6a1:cbc6:f1b3 with SMTP id
 c17-20020a9d75d1000000b006a1cbc6f1b3mr1033561otl.2.1680624693784; Tue, 04 Apr
 2023 09:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230331104025.1478393-1-ejo@pengutronix.de> <7269b525eb965461ff7507ed59e79ccb24dbb388.camel@linuxfoundation.org>
 <9e38cb1cc2e7f7f64a47a7398961d73d6b386a7d.camel@pengutronix.de>
 <CAMKF1sp2benMoVS04jr-0Xps-jGyFR0ZbtipsKgL5sS3qNpETw@mail.gmail.com> <7f0461d39e639926f7367ba12f9b55099a02a6c3.camel@pengutronix.de>
In-Reply-To: <7f0461d39e639926f7367ba12f9b55099a02a6c3.camel@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Apr 2023 09:11:07 -0700
Message-ID: <CAMKF1sr9L+557qE-nokJ_OZ+-rz_Wdf1G7PrhvjacqZ4q_KotA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/9] Add barebox bootloader support (and testing)
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Alexander Kanavin <alex.kanavin@gmail.com>, alexandre.belloni@bootlin.com, 
	afa <afa@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 16:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179702

On Tue, Apr 4, 2023 at 4:13=E2=80=AFAM Enrico J=C3=B6rns <ejo@pengutronix.d=
e> wrote:
>
> Hi Khem,
>
> > Am Montag, dem 03.04.2023 um 19:33 -0700 schrieb Khem Raj:
>
>
> > [...]
>
> > I see that it fails to build with clang
> > https://errors.yoctoproject.org/Errors/Details/699467/
>
> thanks for testing this!
>
> > is it buildable with clang ? if not we can pin it to use gcc always in
> > meta-clang but I want to make sure first.
>
> barebox itself is unfortunately not buildable with clang since on some ar=
chitectures like ARM32 it
> uses GCC extensions that are not implemented by clang.
>
> The barebox-tools however that are built for 'sandbox' should be buildabl=
e with clang.
> It's just that when passing CROSS_COMPILE, barebox cannot guess if it has=
 to append 'clang' or 'gcc'
> suffix. The kernel seems to have an explicit handling for this by checkin=
g for "ifneq ($(LLVM),)"
> and plugging together CC differently.
>
> With barebox we could however still override the Makefile's default "CC =
=3D $(CROSS_COMPILE)gcc" when
> passing CC explicitly to EXTRA_OEMAKE. We have just successfully tested t=
his patch:
>
> --- a/meta/recipes-bsp/barebox/barebox-tools_2023.03.0.bb
> +++ b/meta/recipes-bsp/barebox/barebox-tools_2023.03.0.bb
> @@ -18,6 +18,8 @@ EXTRA_OEMAKE =3D " \
>    ARCH=3Dsandbox \
>    CROSS_COMPILE=3D${TARGET_PREFIX} -C ${S} O=3D${B} \
>    CROSS_PKG_CONFIG=3Dpkg-config \
> +  CC=3D'${CC}' \
> +  LD=3D'${LD}' \
>    "
>
>
> If that looks fine for you, I could add it to the recipe.
>

yeah I was testing one with CC alone and that worked too but also
containing LD is good, so please include above
changes in next patchset

>
> Best regards, Enrico
>
> >
> > >
> > > Thanks in advance and best regards
> > >
> > > Enrico
> > >
> > >
> > > > Cheers,
> > > >
> > > > Richard
> > > >
> > > >
> > >
> > > --
> > > Pengutronix e.K.                           | Enrico J=C3=B6rns       =
         |
> > > Embedded Linux Consulting & Support        | https://www.pengutronix.=
de/ |
> > > Steuerwalder Str. 21                       | Phone: +49-5121-206917-1=
80  |
> > > 31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9=
    |
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#179655): https://lists.openembedded.org/g/openemb=
edded-core/message/179655
> > > Mute This Topic: https://lists.openembedded.org/mt/97970644/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
>
> --
> Pengutronix e.K.                           | Enrico J=C3=B6rns           =
     |
> Embedded Linux Consulting & Support        | https://www.pengutronix.de/ =
|
> Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  =
|
> 31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    =
|
>

