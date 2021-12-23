Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33797C433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 14:53:01 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.33692.1640271180123281150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 06:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GZG+GLoW;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id mj19so5246206pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 06:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JIiD0zDdnoCZTgIDseuZDa8Guj3NlFA8uzQuR5ydVJA=;
        b=GZG+GLoW5rQ87PEyeMR7HcXfr76w0q2hS5fwuRUUQU0bBHvvA4uMtKjHFFcuqVRm7S
         CfvfTRIa6HjDmZCSmG1o9P6VQFvV/IWMhNKTmcbytaie4rPCB5P5DuC9X2Xpf9VPgUNw
         RLIqU3xQsBkGlcKWj2f2n5aJwKpBoXmRINqWlrvmYp32w51d2UZuYbfc47K+6Zd5vkcV
         /TaV25LZBoN1mZ2S+ulLCxxgjHLXARaYL5JOYvPn1T45re45bN/ilvg814IO9nZSFg1v
         moPNnRlAYQ2rKOz36W9DU7S2F6KvRNjkG20hR6dpRw3NItT7AIduPPwi9Z5Ov4jah1/Y
         ynaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JIiD0zDdnoCZTgIDseuZDa8Guj3NlFA8uzQuR5ydVJA=;
        b=FZg6f3jnBgP7XUNFBhehQBUhPmFh5RiVB7YOzE3k2AIVcBvmHlw/SAvkyZ6n5U+w4m
         dibJL6N04IWtjcH8+4zyTMHrDW3Mt0MQBQkXxMRbxhZ9Ku54d082MBc/OAyRe7AXmxTJ
         57ZSgZ9M888Nbu6RQj39HKTGZ3v8C39sEuPPiZqWdCflLmZm8xUxKm1yfI9nlOgRr8UW
         phdB/QQWgghQ/75MSOMEva+bYvKD+U+mfitpb6Dz1l/vRfHxe9RTb0pSKJGLvBJvf0eo
         B7yQZGPmhWjAHxN4MGjEv0DmseLxqKUA7qz9q3ieeXXUxsfddX7L0AZHe1a5MvdR3zPu
         9Wmg==
X-Gm-Message-State: AOAM532bjPAX2Yg9TZHT9ZSmS5SRRbhYPmfXvncRSXiMyYAy/V8BbIZr
	0zpKFynt5EDOjA8FfXZNbCTw4F9C/FhPyfV5e0E=
X-Google-Smtp-Source: 
 ABdhPJyJyjbgcpdcfYMAHgMxKVO13AzCwPXlBq5aqDRrevQ94KBroKfA1MDLGVwo1mzxxVdnpPgPDXr5p+kPNK1h+dQ=
X-Received: by 2002:a17:902:e5c2:b0:149:3cd:ebf5 with SMTP id
 u2-20020a170902e5c200b0014903cdebf5mr2665723plf.1.1640271179632; Thu, 23 Dec
 2021 06:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <baa4d9a18f054cc9a9064f9ca415d829@axis.com>
 <AM9PR09MB46424FF6EC0BC8DA32B7B66BA87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <a468b92caeabf9fc6307ee951e462e4adbd10bbe.camel@linuxfoundation.org>
 <AM9PR09MB4642704AE66377CD0DB6803DA87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642704AE66377CD0DB6803DA87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 23 Dec 2021 15:52:46 +0100
Message-ID: 
 <CALbNGRR365UQ7-sykFb9X1eSOSz=MefZd8t9019RyAnz82CiaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 14:53:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159986

On Thu, Dec 23, 2021 at 2:19 PM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
>
>
> On 23.12.21 14:11, Richard Purdie wrote:
> > On Thu, 2021-12-23 at 12:31 +0100, Konrad Weihmann wrote:
> >>
> >> On 23.12.21 11:49, Peter Kjellerstedt wrote:
> >>>> -----Original Message-----
> >>>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
> >>>> Sent: den 23 december 2021 00:21
> >>>> To: openembedded-core@lists.openembedded.org
> >>>> Subject: [OE-core] [PATCH] base/patch: Disable network for unpack/patch/configure/compile/install
> >>>>
> >>>> Use the newly added nonetwork task flag to disable network access where
> >>>> possible in unpack/patch/configure/compile/install tasks.
> >>>>
> >>>> We can't disable networking in sstate tasks due to sstate downloads and
> >>>> also so we can report hash equivalence to the server.
> >>>
> >>> Since no tasks except fetch (and apparently the sstate tasks) are expected
> >>> to use the network, wouldn't it make more sense to reverse this flag? I.e.,
> >>> add do_fetch[network] = "1" instead. That way you don't get away with
> >>> adding some random task and using the network from it unless you explicitly
> >>> state that you will.
> >>
> >> This is actually a brilliant idea, which would also make it easier to
> >> control this behavior from a user's perspective
> >
> > Part of me wonders if we really do want to make this "easy" for the user :/
>
> "easier" may have sounded wrong - what I mean is that it would be then
> explicit, with no network access being the default.
>
> So for instance a simple grep on a new layer could confirm whether a
> layer needs network access or not - while with the opt-out method of
> your patch things may be a bit more difficult to check.
>
> side note: this could also be put into the check-layer script (as I
> think the official badge shall just go to layers that do not need
> network access out of the scope defined by core)
>
> And yes I got a ton of additional tasks in the layers I work with and
> none of these would be affected by the opt-in model.
>
> Either way, I really love to see this feature finally happen
>
Out of curiosity (will see fallout at least on libreoffice): Why is
this a feature to love?

Andreas

