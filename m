Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B84BC43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 14:28:39 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.85131.1657031317545368041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 07:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ChGNxwbl;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id n15so14721739ljg.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 07:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oam0olGF/QeOMrrpg7xI7jB0o5NEEMQNqlPFpWjjBdY=;
        b=ChGNxwblYWX7chi4HsVwY27EYfosCMSQUr7gp6mDROr2nDDNPmwaGMvAI/GpaxW4+Q
         COGQPaV8Mk7TOQ1hacxFB9ZfdDaD5IOoGH9uZXOIPOs7Kt4r6ENoPh6CSsYQOlgmJ15T
         C66vJjLIkCAqFnnRwu01noQYHIecridBWXgwOz75PpCv/KXLQPcJ8akW5+RhnCXvRwIz
         K9BJJHjRYY/J0DMlCQxEGZdeXba3LfyFCrL8dxa84EXHODE7HWwdn9JXYZfOi6tJEFEf
         Q9ui3yg1boUODQR1057Fwc7ICEcNVqkWvdZiPmqDoah8CMGpndC8w2UEm4q47WCtroPk
         poWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oam0olGF/QeOMrrpg7xI7jB0o5NEEMQNqlPFpWjjBdY=;
        b=ORXnm5fbGST//IxaUu6nrCtaVHbU58jK2xf0LgRBUIzgRB1dd+UxjUzGai/qetOnDD
         G07lsn00tuoPp3mX3Ac0J7PlVX18YQV0ago9NHt0OHoma86Lj4SxuZBmFiHscHwm14DK
         jOzKyaKqWGutqiySAf6K+z8r9VxSjn+JaHQZUlweuFsNzJMQahEtm0wYA0K/LPdBEpce
         8wU+FXL3tVO8CVlKzC2aR6xp4oEXT9YI51I7t/3TQn8e75I3YrH84C5ROBhwkYEgQOxe
         p9d7FYneW3PVweU3MAJwDSEBhF9m1zpijgx2JK15OvyGJylBNwlHEGJCEjYRy5RczcYh
         UQkA==
X-Gm-Message-State: AJIora/1lizD0B19Nr8QSXTc2ljIct21TqNo9eIySftLPQ8HvWufX5LS
	REx1ZRCKVYy6C4/PowF5YAena3lhpqAt6CFIBho=
X-Google-Smtp-Source: 
 AGRyM1veU/TLHj0+pmP/LQ+s2qX9hYcPv69hgsl6+zdN9/L2MiEi24VTiZQFKJE4nDNpyCtnXGAMggwUVL9YaMOlDWA=
X-Received: by 2002:a2e:b8c2:0:b0:25b:d31b:7fd5 with SMTP id
 s2-20020a2eb8c2000000b0025bd31b7fd5mr10774819ljp.256.1657031315668; Tue, 05
 Jul 2022 07:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
 <CAJ86T=XPx1sVqmaJd+C2q81PV-jgjDK9x=cjrEzqRnGjqEghLw@mail.gmail.com>
 <CANNYZj-+2QvuXUT9Vshdq5T6-uLEV5p92QeAqw+kbajPm+UKyQ@mail.gmail.com>
 <481775663c6c797dde9596268fde594bc567a12d.camel@linuxfoundation.org>
 <CANNYZj9e6dmh1pFZZN5T705s6mtVa5SdWoov3+5vbUT0+VrhQg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9e6dmh1pFZZN5T705s6mtVa5SdWoov3+5vbUT0+VrhQg@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 5 Jul 2022 09:28:23 -0500
Message-ID: 
 <CAJdd5Gb=NgheS=4e28-zkjVDveGykFKv+z+2PzzKUZx1Ag5ZLg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Andre McCurdy <armccurdy@gmail.com>,
	Adrian Freihofer <adrian.freihofer@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 14:28:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167660

On Tue, Jul 5, 2022 at 4:16 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 5 Jul 2022 at 10:51, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The challenge with your approach is that it is bolted directly onto
> > bitbake-layers, which makes it not only OE-Core API but bitbake API
> > too. There is a standard such changes need to reach and I'm not
> > convinced that is doesn't tie our hands in future as is.
> >
> > I suspect in reality, we could probably have the same functionality in
> > a separate script in OE-Core, maybe improving the APIs/library
> > functions from bitbake-layers if needed. That would lower the bar and
> > mean we could have something focused on eSDK needs rather than the
> > wider problem.
>
> I added the layer config generator as a bitbake-layers plugin for these reasons:
> 1. It is layer management functionality, and so logically belongs in that tool.
> 2. It is more visible and discoverable when it is in there, as opposed
> to all those executables in poky/scripts/ which most people have no
> idea about.
> 3. It needs to get a list of active layers and their locations
> programmatically, which is trivial from a bitbake-layers plugin, less
> so from other places.
> 4. it can reuse code from meta/lib/oe if/when needed.

Focusing on the data model helps with that; as long as it's reasonable
to maintain the configuration manually, having the tool to create the
layer setup from your current layers is a useful way to initially
populate/maintain that. An easily consumable data model makes it
easier for 3rd party tools (e.g. kas) to pivot to using it instead of
making their own ad hoc, and makes it possible for whatever flavor of
other tooling to grow up around it.

In that regard, I'd prefer that the JSON file be what defines a layer
setup and included in layers. The setup python script is nice (and
convenient), but I think it would be better as an additional file
alongside the JSON file (or that someone can download independently if
the layer doesn't have one). I think a few tweaks would make it
possible to write the script so it can operate generically on any JSON
file input without needing templating.

I agree, it is harder to define a stable data model.... but probably
worth it in the long run?

Also, sticking to submodules doesn't mean I don't see the value here.
We need something for layer CI, first-time startup guides, et al, and
I think that either has to be "adopt kas", or take this approach. I
_much_ prefer this approach to kas. I apologize if it came off that I
didn't want to do this at all.

>
> There are a few things in there that I'd already like to do
> differently, and there's also the 'save the active build/conf in
> TEMPLATECONF format' piece missing, so there'll be a reworked version,
> arriving in bite-sized chunks for easier review/discussion.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167645): https://lists.openembedded.org/g/openembedded-core/message/167645
> Mute This Topic: https://lists.openembedded.org/mt/92117681/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

