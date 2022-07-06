Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917F4C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 19:54:33 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.1733.1657137272928740093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 12:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LjV0CcD1;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id d12so4320995lfq.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 12:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x6H2bxgiKCiXCpW3TSMGENT73I8nKH9PoVEW/83qotk=;
        b=LjV0CcD1emV3C2Ek9UpfDiloQCOTB+t3g8qqRtnc6Ty/NJHgy7+yI2d+J7yQ7TsJMG
         91d2Cu/T+i0/AAMtuCoh9jJJHOFuFZLgEtv5GLh4G0UGqy047QkLwMCCPTw1RGnKFVjj
         lK2KmBzAD6T36vvs/4WhOixNVzJ5fhgF6H9gQrpAhMwqgQFhYxoOHhBgpfJ0lfrBNl3+
         Rcgj7z1vECpl5WPd6Ps3Y+xd32wxCpNfTMlHO2NlHa1dvC56beXw8/4XVCx7kbefnpU5
         yUdXoxV8VR+UymNUTZGVc0I4XnrTTx4hnRVddHUaCSUsq0ujwYMVwyWpsR71oneFg7Y5
         Cxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x6H2bxgiKCiXCpW3TSMGENT73I8nKH9PoVEW/83qotk=;
        b=7EUXzVC+nMClGnmyh5k+gCpXw3tH4xCRrMcUIMRRheGjYCfQM66jrERQ7UTiuhNAmo
         YOi0aWPmKpTy8Qh2rEdiqN+63qoRMsQsYme+kgCClhQqbwbWHwkXGa8ZJoTl2dQaqF1O
         U+ywtJ0QKOcy+XlQ624wZPawaKBgLUVSVMuWkAxD2yD7pZeAWWB9p2J+qKMvVhdNRjNL
         hE4B5TeM718mLWTuZs+pt4sZk/9cp/YhOUnSUJelid+fyOzzEwOthJp262+2x1jcHNFv
         FlnC8YofGik0qPDBBSGmfrEZEcN+fdM5U7Bag2GlE4sPvMPtwfbe8QTZnasKnFmlbH53
         1v/A==
X-Gm-Message-State: AJIora/fZcHACYjiFqwoNuz18MPJuvrzDHHloyKzpp6vtRyqczZek5sL
	kKPHsNVINsB+iklTaiDjVaA0fzV1++sAyddz4XQ=
X-Google-Smtp-Source: 
 AGRyM1scND/SkHkq9VvrD/KZLyzASqepTYB/jjG9wBxbckRY8c5I9hxJYG8q4Y/u0W8lIeoeUYLEwOkrrIF0RF5nUbo=
X-Received: by 2002:ac2:5fa8:0:b0:481:4470:413a with SMTP id
 s8-20020ac25fa8000000b004814470413amr25177805lfe.449.1657137271175; Wed, 06
 Jul 2022 12:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
 <CAJ86T=XPx1sVqmaJd+C2q81PV-jgjDK9x=cjrEzqRnGjqEghLw@mail.gmail.com>
 <CANNYZj-+2QvuXUT9Vshdq5T6-uLEV5p92QeAqw+kbajPm+UKyQ@mail.gmail.com>
 <481775663c6c797dde9596268fde594bc567a12d.camel@linuxfoundation.org>
 <CANNYZj9e6dmh1pFZZN5T705s6mtVa5SdWoov3+5vbUT0+VrhQg@mail.gmail.com>
 <CAJdd5Gb=NgheS=4e28-zkjVDveGykFKv+z+2PzzKUZx1Ag5ZLg@mail.gmail.com>
 <CANNYZj_ng0B4mA1sir3X_pXBKXhdra4ErUhY-YeNKhv3oqjcgQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_ng0B4mA1sir3X_pXBKXhdra4ErUhY-YeNKhv3oqjcgQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 6 Jul 2022 14:54:19 -0500
Message-ID: 
 <CAJdd5GbBWAZ8-+qM6MymFih8-3RHpV+Z+fXo5cOTeyWPMuyrzg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 19:54:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167745

On Tue, Jul 5, 2022 at 11:04 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 5 Jul 2022 at 16:28, Joshua Watt <jpewhacker@gmail.com> wrote:
> > In that regard, I'd prefer that the JSON file be what defines a layer
> > setup and included in layers. The setup python script is nice (and
> > convenient), but I think it would be better as an additional file
> > alongside the JSON file (or that someone can download independently if
> > the layer doesn't have one). I think a few tweaks would make it
> > possible to write the script so it can operate generically on any JSON
> > file input without needing templating.
>
> You have that choice when you run the generator: write out the bare
> json, write out the script that embeds the json (and is guaranteed to
> be compatible with it), or both. Additionally, the script can print
> the json inside itself with --print-config. If you prefer to include
> just the json into the layer, that's fine, but I don't particularly
> want to solve the problem of where to find tools that can do something
> with it (without exploding with cryptic compatibility errors), and I
> can imagine most people, and especially beginners, would just want to
> run the script directly.

I think my interest here is more in the JSON schema, and I think
that's the more important piece for consolidating tools around a
common standard in the long run. I've pushed up an RFC patch with a
proposed schema and example layer JSON file to review. It would be
nice if the script outlined here didn't have to be generated from
bblayers and was a static script that could operate on any JSON file,
since that is more generally useful; it would also be a good starting
point for a generic layer setup tool that we can point users to and
can be replaced by something more comprehensive (like what Richard
outlines) later without having to change the actual layer data (the
JSON). Or put another way, I'd prefer the data be kept separate from
the code.

Note that my schema is missing the "is_bootstrap" option yours has; I
wasn't quite clear if that meant anything other than "don't fetch this
layer by default"?

>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167667): https://lists.openembedded.org/g/openembedded-core/message/167667
> Mute This Topic: https://lists.openembedded.org/mt/92117681/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

