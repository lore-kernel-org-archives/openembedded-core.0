Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821F0C0032E
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 11:53:13 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.97536.1697975584309887877
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 04:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CkhVa4NX;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507bd19eac8so3434189e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 04:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697975582; x=1698580382; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=frdnQxULVms8cVnmjisJCBLC6eWunDYX7i5nygGcPJE=;
        b=CkhVa4NX4C5vaDCMWfV8ZIKYH6htih9lftDnMbmQzeNYshec/lUA/HGZtJfsGJZlT6
         RNARkWNOcmYaVWhE/2Rfd0vpGi2qDi4Sb7qfllXj1EuWAfDZS1D1+TAtypRQJz9cuPJI
         CggQmXS2V7ujuE0BbzsO97d6FabThXDM0pT5zVA8AtbgNrc92twhHTNdZDNZD7YZbpGC
         NAvLGXrfmUJ1TKCHHPma1fnSROmurDzoJGynok/KusPonGxO12SvA1mgZ/kArpdciwoi
         4n5A1T3N6/MRKyBR5DtfeR2y+ceIfGzeie92s5nIrjmd55DYuSebUvoQv51U6H/mcK1O
         ghSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697975582; x=1698580382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frdnQxULVms8cVnmjisJCBLC6eWunDYX7i5nygGcPJE=;
        b=COYL8G5QXFHrztc7uYMSCwgU6oYYGPB2xP5NHTSq4lKntAllL49RVmTIMyHprQr/6r
         3vaCFxXsEoszK7vnQaZcKdaPeGaujoHNagPhYxxxwKt8vZqYWlkUaRgMQyNppdo1wBX6
         EqhTHOxBvSasdquM1DUeRoaUvEwGYMp7f/hhXqHD4gYKjiVJumFEkLIeJsfMgyB15FCY
         FoD4DyJELiJiL13JDBsg4JtAqGh+2MRfyoTHH3iUPv7lunykV1HazA9XbxTaHhhzM6xh
         E4O2DJ5S/KU1dcFmak5WKuk0e836+xar7Utf43SC1lNUGlL6ETwo0N9LaZo5ea9ve5An
         fpDg==
X-Gm-Message-State: AOJu0YwKm60CBVHKxH+UhTtpav+wVqZZ3JdZJkOvTwBjNsGHDEgJM4nd
	gvtUlaHnN8dHJXsZoCRuFa1c0+xVuJMY6p2Scqk=
X-Google-Smtp-Source: AGHT+IFzBsAGQ4JjaYupjzUjnu4PvHplkYNBhhMNKEHFzx+8w2X58m1VfRh6ccVENcVxnykqLCxdkUMs7zW1evGw7F4=
X-Received: by 2002:ac2:4c87:0:b0:507:975f:1df6 with SMTP id
 d7-20020ac24c87000000b00507975f1df6mr4074917lfl.14.1697975582198; Sun, 22 Oct
 2023 04:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231018084652.900785-1-alex@linutronix.de> <20231018193932e6cb99ef@mail.local>
 <CANNYZj9X6yi7D6unHuwa3eYkJq61jWJR5aQZ6_oOjGPrOV7ZEQ@mail.gmail.com>
 <2c31af449efdd50af8dee1642c614da33595366c.camel@linuxfoundation.org>
 <CANNYZj8LdSmPgNh9sXKZcS_dU+GveKTFDSjSWtRxopjJizwLkg@mail.gmail.com>
 <5b1e2359d03645983d923ddb6e8ecd6f97b304d8.camel@linuxfoundation.org> <17906BBEB8B5FFF5.20272@lists.openembedded.org>
In-Reply-To: <17906BBEB8B5FFF5.20272@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 22 Oct 2023 13:52:50 +0200
Message-ID: <CANNYZj9psB-6JEaKp6HyBbGy2VTHxn8DQ8MsRweGYJYLo+ikfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] selftest/sstatetests: add tests for 'bitbake
 -S printdiff'
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 11:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189601

On Sun, 22 Oct 2023 at 13:52, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > > > I did idly wonder if we need to set the sig handler to not use
> > > > hashequiv for these tests? I haven't checked if that would help though,
> > > > I'm just making a wild guess.
> > >
> > > I fired it up with BB_HASHSERVE = "auto" set inside the test, let's see:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2307
> >
> > BB_SIGNATURE_HANDLER = "OEBasicHash"
> >
> > is the thing I had in mind FWIW but that should be ok.
>
> Seems like that ('auto') had no effect. :-(

Hit send too quickly. Should I try with your suggestion?

Alex

