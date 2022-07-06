Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF652C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 20:57:23 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.2479.1657141038252459169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 13:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bRv5HlCl;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id d12so4554151lfq.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 13:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hwxUn3IBSut8P9GMI/xUXTRxf2RaeyVQujOFYLQImOM=;
        b=bRv5HlCl5OVWfImTernbS4BX0f54PdI7LMdZ/uJKbHAQoL7Js1kL1EMNVMl02MQoaB
         e2qlMleeLWrLiDLjYKLCS7OPvg15qRyBUmqdY9Ewf3QHYvsbwu+jgK8RxBpkMMESj1ZP
         jvsNtIUeUbjSAYTfrgXkN86icjaiuiU+9sTRUdmvvQYtY5cchQLCo5e/CNJEmGE3iy3U
         kUk39bANcdBACWCn2eqCl0I92geEC0mBBTS8AHu6qX+lVP0MNULo/CvINr8K22lc3lq6
         iAUMpMifAvkATOA5ZTYtXxOtB762BrItX3NpHubkkoviQ21vbrX9/pd0I2kpeSF8hHGv
         +a1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hwxUn3IBSut8P9GMI/xUXTRxf2RaeyVQujOFYLQImOM=;
        b=xMrrf0c3Ft55YjRSx1BFGn4q3mSNHD2A8ZcyiHMxR7hZb1bCT+WRR0nWdRDFIEvxEB
         TIzOTjYUYn5rAOdYuEF7T0D0Te12nVDl5qOdRzXNAJAIv3mgSMqRQ5GTw1D5oIxm+vTo
         5/n+1hhF+u5gd80oXFt6wM/gghUEnGlOFGUpCmR6t85rI9Js6mFnPSXqYZenAb69BZoV
         EwudKNBye+Kn4NAHhJcDc1prS5dFqfLtqWLUA37nLJ5RcHr0cJq/TYA2HhAX7bW4iGOP
         kxSO3BQXL+Oabw/uuKKLeueBiDPVzGxVPMa/f+JGbnhE2n3FfJbx0lnzD88r7Sul4FAT
         wI0g==
X-Gm-Message-State: AJIora8eO1lF/kJKQl9yr/Oyty7737jmtyD0k3RgvXfbFug3a8rIduOx
	fvXEnbR1ijGlVEItNbGnDYqJflFwQjqTbTNuYZM=
X-Google-Smtp-Source: 
 AGRyM1sh6EZS8/3MjDhohlXNs8GGISJtA2PHAv0cjD1nNK5H53+8zFtVXRUiFNCEQGugtPUbhvB2bO2GYunsRRH7Rks=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr27396411lfa.380.1657141036364; Wed, 06
 Jul 2022 13:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
 <CAJ86T=XPx1sVqmaJd+C2q81PV-jgjDK9x=cjrEzqRnGjqEghLw@mail.gmail.com>
 <CANNYZj-+2QvuXUT9Vshdq5T6-uLEV5p92QeAqw+kbajPm+UKyQ@mail.gmail.com>
 <481775663c6c797dde9596268fde594bc567a12d.camel@linuxfoundation.org>
 <CANNYZj9e6dmh1pFZZN5T705s6mtVa5SdWoov3+5vbUT0+VrhQg@mail.gmail.com>
 <CAJdd5Gb=NgheS=4e28-zkjVDveGykFKv+z+2PzzKUZx1Ag5ZLg@mail.gmail.com>
 <CANNYZj_ng0B4mA1sir3X_pXBKXhdra4ErUhY-YeNKhv3oqjcgQ@mail.gmail.com>
 <CAJdd5GbBWAZ8-+qM6MymFih8-3RHpV+Z+fXo5cOTeyWPMuyrzg@mail.gmail.com>
In-Reply-To: 
 <CAJdd5GbBWAZ8-+qM6MymFih8-3RHpV+Z+fXo5cOTeyWPMuyrzg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Jul 2022 22:57:04 +0200
Message-ID: 
 <CANNYZj8H5Bf=t5wAUEMojHioMfiLD61mw_wPkT3nevUhkikGpg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Andre McCurdy <armccurdy@gmail.com>,
	Adrian Freihofer <adrian.freihofer@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 20:57:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167746

On Wed, 6 Jul 2022 at 21:54, Joshua Watt <jpewhacker@gmail.com> wrote:
> I think my interest here is more in the JSON schema, and I think
> that's the more important piece for consolidating tools around a
> common standard in the long run. I've pushed up an RFC patch with a
> proposed schema and example layer JSON file to review. It would be
> nice if the script outlined here didn't have to be generated from
> bblayers and was a static script that could operate on any JSON file,
> since that is more generally useful; it would also be a good starting
> point for a generic layer setup tool that we can point users to and
> can be replaced by something more comprehensive (like what Richard
> outlines) later without having to change the actual layer data (the
> JSON). Or put another way, I'd prefer the data be kept separate from
> the code.

Defining the format formally in a verifiable way is quite useful,
thanks. I'll integrate it into my patchset.

And yes, I have a different viewpoint: I do not want separate tools
that need to be pointed to, or any extra steps, or data decoupled from
code. What I do want is to clone a layer, run a single script once,
and be dropped into an environment where I can run sstate-accelerated
bitbake. Maybe making a choice about what target I want to build for
on the way. And without ever having to read a (often) badly written,
unhelpful layer README, or asking anyone for help. If it's not like
that, it's not good enough.

> Note that my schema is missing the "is_bootstrap" option yours has; I
> wasn't quite clear if that meant anything other than "don't fetch this
> layer by default"?

Yes. The idea is that the tools shouldn't have to guess if the json
itself is hosted inside one of the layers it describes, and so that
fact should be written into the json. It can be named
'contains_this_file' or something like that.

Alex

