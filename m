Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB431C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 18:38:17 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.97.1657564694929082906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 11:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=acAXnu6X;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id bf9so10106433lfb.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 11:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sGJab52bCg9vaoBVoFcbDlzpHCCtIFRAp3Mdkf7UZDc=;
        b=acAXnu6XMY3Tw8T7PcvalzQbabK75ylSBHwhOLigtSbhiLUEg2Jhry3PnYfMfgjro9
         Tkl/F+JKILUyx4BITHNbByS8ZuERg0uid1vhdYdV8QV8Q9WhGeU/bUwq/jUtNwbLbqZH
         5mtZQ/SoOE7zX9lTCe74gKPBeZyTYD8Suh0w9AP5ubvmT6x1kKjbn13+xj9pvKeV1UZM
         Pih99bvqcTRKd8zbiD96MBOrLzv3Arqi8/JsYvHfFDT5Cz9k3Zy251Pwanr+biesGkgM
         NPxkO124P5+nc3Ok/aXHBjQn1H4d1lY086iMJsGqefTOufp4OR38ck5snPO1GSr17Tpn
         8vTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sGJab52bCg9vaoBVoFcbDlzpHCCtIFRAp3Mdkf7UZDc=;
        b=2vOoldj/is2NhFYkGB9TTeaHSmUgedTveKqPDLwuvziXmiQFS0Vh5E13cla/6kz8pE
         bzhGSc+z/02A947UJfDsgP6s0G9H1mbDkpFhYLO4ZDOaYdp3drFlyNK0i4jXJYqsQTee
         ggVENqyR249VXr0Wxcyt7S52k5YjJxYj9jcBqAZMV89uoOSF094XRY9sLxm6NUMjD9dk
         dMcjPhiLq4Cf4blbQ1OlrvTbB3VDl5QSuKfj40zYOimQNvLlwH+OfUMk2yZy2p3pz5CA
         IRezMk6SBgFkkui+J+7zgc5w4OnYSNIIazrtxVQ5IJSRSkM082OWWDzRMragMEF8+hq4
         z70w==
X-Gm-Message-State: AJIora/7dNF2bdnox/AEJOEr2JFeWT+jXt6SX/tpwiTngQQnXa6gEcSq
	rLXaeCW6vue4F/esPnjkNSIRKjuec6vSnSs39Hk=
X-Google-Smtp-Source: 
 AGRyM1sAdq5eMMImT+7uGUUIYxeKKu6+iGbxDIDG2yM1Heux01DRw4P8nVLXirNnsp9bZNjSaB6vp3wfGCo3Eq/fwEE=
X-Received: by 2002:a05:6512:238a:b0:489:e6f6:c13f with SMTP id
 c10-20020a056512238a00b00489e6f6c13fmr2089999lfv.673.1657564693040; Mon, 11
 Jul 2022 11:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220708191730.3413011-1-alex@linutronix.de>
 <CAJdd5Gbs6YKYs3qNgt_jQriiR7ix8XtPubMAmc2ftK5CMuNNfQ@mail.gmail.com>
 <CANNYZj95c=syJT9-sW20UC79bf3qRjZDDJNaOmDUvq_jJPiYLQ@mail.gmail.com>
 <CAJdd5GYdxO_Th9_BV+7sWMsj9CDtdu+_nFpnr=eCGFWYXRM=Aw@mail.gmail.com>
In-Reply-To: 
 <CAJdd5GYdxO_Th9_BV+7sWMsj9CDtdu+_nFpnr=eCGFWYXRM=Aw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Jul 2022 20:38:01 +0200
Message-ID: 
 <CANNYZj-kpWt937GK1Hi-4GDamJdvj8CDS1CzE6+ddwP2Ogx9Zg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] meta/files: add layer setup JSON schema and
 example
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Tim Orling <ticotimo@gmail.com>,
 Adrian Freihofer <adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 18:38:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167877

On Mon, 11 Jul 2022 at 17:46, Joshua Watt <jpewhacker@gmail.com> wrote:
> I did think of one way in which the order matters: If you are planning
> on populating BBLAYERS from this list, the order would matter. If you
> are doing that (or we want to allow it at all) it would need to be a
> list instead of a dictionary.

This would not be allowed at all. This dict is strictly for checkout,
actual BBLAYERS is set in bblayers.conf.sample coming from a
configuration template pointed to by the json or from some other
description in the json or elsewhere.

> > They're not quite same as machines or distros, as they can be anywhere
> > in the layer. This saves you the trouble of walking over the layer
> > tree, especially when look at the layer repo through the browser.
>
> Configuring _what_ you want to build is probably even more contentious
> that describing how to fetch your layers, so for starters I'd really
> like to just focus on the layer fetching; TEMPLATECONF is far from the
> only method for doing build configuration and I don't think we should
> bake it into the "layer setup" piece at this point (same for machine &
> distro, although they aren't generally contentious, see below).

What are those other methods? TEMPLATECONF is contentious if you have
ugly legacy scripts (understood by no one) that write into local.conf,
and don't want to replace that with a clean set of templates. For new
projects or teaching beginners I really would want to encourage only
static, prefabricated templates that restrict local.conf to just two
lines: distro and machine. Describing where templateconfs are is not
mandatory in the scheme; if you don't want them, no one forces you to
have the respective items in the json or use them if they're there.
But they are standard, simple, and part of the core, and they work. I
don't see why we can't have them now, and then argue about those other
ways, what use cases they serve (that static templates cannot), and
how to integrate them into the schema and tools.

> I suspect that not including the machine/distro/template stuff for now
> might give us better adoption as standard way to describe layers,
> which is another reason I'm a little hesitant to include them (in
> addition to duplicating information available in the layer itself)

None of these are mandatory properties. You do not have to write them
into actual jsons, and if they are present, you are free to ignore
them. But I do want them, as I want something that can be used to
actually set up a build all the way to bitbake, instead of just going
halfway, and not being as functional as kas. We can make disclaimers
in the schema description fields.

Alex

