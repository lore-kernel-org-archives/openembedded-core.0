Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85E9C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 08:44:09 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.48780.1724661846910201986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 01:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q3J2aeWz;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f4f8742138so29535521fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724661845; x=1725266645; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=94Xem1kYducuOoo60/fZmYysEl9+u3ORtDQVvjT5JD8=;
        b=Q3J2aeWzhNszH2c6aTyommO0BxzJZm/VFctx37jode+mD41PTMMkqelCrlDSYmIXUe
         0/FCprDW8aUBhMrmTjyrCFaoMGEf98q1JO2uesrgBEQrIApOiTivrBWCXLFf3UlP+bhr
         s2/vawKSazsnvnV8ux7w3xhZOwAgpPaGXCKZAljlpEuzhpdoaPNfRltUo4wLMpX36ZN0
         WJMezWCiqXQALiSX8tWmibYxRbcq1IR4wD8yfXUbEe7D2tOw2udm1vY9GBmlc1rr4VYQ
         2fJ7zKJu7UxtjQrZTEVlZNzeMnIwvGs4KkUnK2YvGeivQxJtV1Sf+SqhJAAqFCus+id8
         9s9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724661845; x=1725266645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94Xem1kYducuOoo60/fZmYysEl9+u3ORtDQVvjT5JD8=;
        b=EjFM61LR2OE2PDqZz+WryDGOTJLEhpApNX03kmmFHaPNV5IODmUl5EwFc1u5NRY20n
         ljQvoiWJjKy5DdF0h1VOaSfW8tR8VsRSULVHfEoLSqAKKEYrwgN3u9xu5lGZRAUzitUY
         qDjAClvo6HVyPfWZ0A0z+tq+K6BgC4XRZy6aHeaEL5vZSCw6tg9/pBB194oGpeBVbIWb
         imiH81NjVMQxAvAWnlNQ+SKcxzZyXLJJ47slCye/tnevsNA6GlD4BIRdaQpEalur1gFU
         dKJ6ZXJ4niIgSOIt9MacfRP3Si8BluEkP0sbrib+UhRP362uGs7TR4OAQM/i33rHUo2a
         3+wg==
X-Gm-Message-State: AOJu0YywKTJyXL3+r9Hx6zJ2/Zfa+jz9hdoInVKmjiZ3d8hJiqAB+g1z
	Vz1mZExVV5KYjwjMJv4Vc6AgcSpWE3EFUFAYj6CTYSonPK4NoTnxklVr6HKd0a4M24/79pJgFQD
	IKvAztqgtXN3RYFO6jgoeGPBd8zU=
X-Google-Smtp-Source: AGHT+IEKesudhEPK1YvWjFSOSOz6+hvgQ6fJNioU5TNd4wLaH7ethg6vKAZ7S8tCHsYTe2UbI7Z1KA/IArbnDKZJ+AM=
X-Received: by 2002:a2e:a990:0:b0:2f4:9fb:5905 with SMTP id
 38308e7fff4ca-2f4f473a43fmr67392821fa.0.1724661844377; Mon, 26 Aug 2024
 01:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAHirDJ8tUihjou3-4qirjk1vGVTXVrRg+TjKxmu2qvOtj2EVwQ@mail.gmail.com>
In-Reply-To: <CAHirDJ8tUihjou3-4qirjk1vGVTXVrRg+TjKxmu2qvOtj2EVwQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Aug 2024 10:43:53 +0200
Message-ID: <CANNYZj-aBjxP_usuhdoMNKvdcEAzw7-N2UiSqCTkoBqRAv9j4w@mail.gmail.com>
Subject: Re: [OE-core] SDK in scarthgap after package_manager: Change
 complementary package handling to not include soft dependencies
To: claus.stovgaard@gmail.com
Cc: oe-core <openembedded-core@lists.openembedded.org>, 
	Andreas Helbech Kleist <andreaskleist@gmail.com>, Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 08:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203739

The standard way is to have an image recipe that does include the app,
and then create the SDK based on that image. Then all dependencies
etc. will be pulled in through standard mechanisms, and if something
doesn't work that way, we can take a look.

I would recommend you look into giving app developers a sstate-driven
yocto build, where they can set up the SDK environment directly from
latest layer metadata:
https://docs.yoctoproject.org/sdk-manual/extensible.html#installing-the-extensible-sdk

Alex

On Mon, 26 Aug 2024 at 10:38, Claus Stovgaard via
lists.openembedded.org
<claus.stovgaard=gmail.com@lists.openembedded.org> wrote:
>
> Hi folks.
>
> I am working on upgrading a project from Kirkstone to Scarthgap, and
> hit a problem I would like to have your input on, regarding the change
> in Langdale to not include soft dependencies.
>
> The background is that the project has 2 teams. An embedded group for
> handling yocto etc. and an application team using a SDK created by the
> embedded group to create applications.
> As the applications has dependency on libs and utilites from the
> yocto, and we need to give the application team a SDK so they can
> incorperate the change in dependency before creating an image for the
> target, we have used "dummy" packages.
>
> This means that we has the DEPENDS located in a include file, and have
> two recipes including those
> * dummy-app.bb (used by the SDK, and is just an "empty" package with 1 txt file)
> * the_real_app.bb (used by the image for target)
>
> Until know the SDK has included all the packages mentioned in the
> DEPENDS, but this is not the case anymore.
> In process_depchains - we have the pkg_adddeprrecs method updating the
> RRECOMMENDS with a filtered result from the DEPENDS.
> And RRECOMMENDS ends in the recommends for the rpm file - not
> installed in the SDK after we are not including the soft dependencies.
>
> As I don't expect to be alone in needing to create a SDK for some
> applications, where the applications and the DEPENDS changes so you
> need to create the SDK with all the dependencies for this application
> without the application itself part of the sdk.
> What is the preferred way of doing it, now soft dependencies is removed?
>
> A workaround might be to hack the RDEPENDS for the dev package in the
> dummy-app.bb - something like
>
> RDEPENDS:${PN}-dev += "boost-dev cli11-dev ......"
>
> But I don't really like it - as the DEPENDS does not really fit 1 to 1
> with this.
>
> Any input on this.
> How do you designs SDK's for applications, where the applications
> itself is not part of the image. Do you manually add to the
> TOOLCHAIN_TARGET_TASK or similar?
>
> Looking forward to your input
>
> /Claus - A.K.A frosteyes on irc
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203738): https://lists.openembedded.org/g/openembedded-core/message/203738
> Mute This Topic: https://lists.openembedded.org/mt/108100662/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

