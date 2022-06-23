Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E695C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 14:53:09 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.8505.1655995987621541011
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 07:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YpTi4ei5;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id s10so23582323ljh.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 07:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b9JrlIlWeSMy8lTPouipyPwufHhAsKQLosdFHo9suUY=;
        b=YpTi4ei5l14yR98NsKjvfcL2BR0GLd0WcTUeMiV6Y+5H+Y4qA7Pi6kp4mXUn7Oh1cE
         aLDr8HaNVtAPA7IBB9j/yg8urVcWHDiw4XCstfcVC5/tHKS/tg+CDdFp7mWZ7gkJmpnw
         nTWheyOq1Mua0yKsPuBm+TZ3htX7GGZSZ5Fztxq712zWvUkjZ6mlqBOTjoATM5Xn+AAg
         SOdHHlcHudKRh5P/trn5u16sl3pnuDJdltAQpN6XwnI0c51s5aVZgJewGZrlw0mOQ4N0
         N8qu7COEi1IqcjvgU/f0kS0UGKI2T+0tyWxJYGeAKlR9zNlbulrs/yU5S8jy7qejLtwA
         /6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b9JrlIlWeSMy8lTPouipyPwufHhAsKQLosdFHo9suUY=;
        b=gT2LQUtIcLGOJmTevpys7GOBp4LrSc14BGHlm8pdeXXdy2WY7PTfZWZNy1OJ5sBghm
         56V6XszTZQd1mcuT4ATkXjXK0dhTenPNtz47aiMB/SmHdogUSW4N5ia27L0eeJ8mufcD
         gt3qCoX+76C5wKpJS4bX3fNy479PGvnondKRdwhOaRHDQaChG1Iwg0PwI1aFZI0tjU8k
         TVipwK5oIErwjmwXkLVcDkle5bzL+eZFRYfYnxxp8LGsbgYyOmeNZZY0jKjKdeDLHyKR
         tDFY1SafStF2iVmrAMDOCpLCCeAf0ff8+yga5K3fBe2C8wiNp5ADv97N07KrRqrhAqnc
         J2cw==
X-Gm-Message-State: AJIora9zBWKWxcKeKntzAeDocKKys+1uePDFkEcxnGlhPxVj0y+6g6tX
	O2IdZV5IZZc9A0C7FForXjshDTd4bmhtjpcGPRc=
X-Google-Smtp-Source: 
 AGRyM1ty7bvXSGAbt5v3ZLUg2fu8BeojaU5/Q7XysYxx7GlPvSY0SVgZ1FRRl+8iC93Z2hken69P4U8jXj4UgwgSsUs=
X-Received: by 2002:a05:651c:4c7:b0:25a:755d:5f9f with SMTP id
 e7-20020a05651c04c700b0025a755d5f9fmr4731082lji.109.1655995985871; Thu, 23
 Jun 2022 07:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220622103312.1098389-1-alex@linutronix.de>
 <20220622103312.1098389-3-alex@linutronix.de>
 <20220623120337.28f9cb12@booty>
In-Reply-To: <20220623120337.28f9cb12@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Jun 2022 16:52:55 +0200
Message-ID: 
 <CANNYZj-GAsOMpoqC6RWvrWnbNHS4+00d_wZtEWwwPH5-w0bu2Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/6] meta-ide-support: adjust to provide
 (e)SDK experience directly in a yocto build
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 14:53:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167273

Thanks Luca, this was not meant for merging (RFC), but it helps to see
the issues upfront.

Alex

On Thu, 23 Jun 2022 at 12:03, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Alex,
>
> On Wed, 22 Jun 2022 12:33:08 +0200
> "Alexander Kanavin" <alex.kanavin@gmail.com> wrote:
>
> > Specifically:
> > 1. Add a few more toolchain items to DEPENDS so they're available in the recipe sysroot.
> > 2. Use deploy mechanism to place the SDK environment setup file and testdata for testing it
> > into the image deploy directory.
> > 3. Add ability to run SDK tests via the testsdk class and task. This also requires providing
> > a testdata json file.
> > 4. Ensure sysroot population always runs, as those items are mean to be picked up
> > by 'bitbake build-sysroots' into the unified sysroot.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>
>
> This series is failing on the ABs:
>
> AssertionError: Adding layer meta-mingw changed signatures.
> 9 signatures changed, initial differences (first hash before, second after):
>    meta-ide-support:do_prepare_recipe_sysroot: 8a46421fcb080b73cb27047df1d44a256ccb8115ff5646e8a312a9437d8544dd -> 13c339e339f0e7bd9cd13fcdb28135f37de785dd801e64588e240eced8c1e8c4
>       bitbake-diffsigs --task meta-ide-support do_prepare_recipe_sysroot --signature 8a46421fcb080b73cb27047df1d44a256ccb8115ff5646e8a312a9437d8544dd 13c339e339f0e7bd9cd13fcdb28135f37de785dd801e64588e240eced8c1e8c4
>       NOTE: Starting bitbake server...
>       Taint (by forced/invalidated task) changed from nostamp(uuid4):33106dd5-141b-4115-95b2-69cf0d5d6e2c to nostamp(uuid4):b8a53034-116c-44e6-87a4-744d6c021eb1
>
> Logs:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/5417/steps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/5417/steps/17/logs/stdio
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

