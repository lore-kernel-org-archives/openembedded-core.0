Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A849C4332F
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 23:23:07 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.61083.1669936981529939659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 15:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n8vu8oQd;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-14286d5ebc3so3947693fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ViTkA4GsUYl3ZurjlBrPxOGCr5YhrA3ByXQEy+f5Qzo=;
        b=n8vu8oQdaMRu1UggJr68Iz7ZtAtmi6gTE+VYCsp64nEpB8cVtUciQgGo4OrkFztlfd
         QpG9K3Vr7CO0s7XHBn00Hg9gvozAU4Zqk/jxp7Cn1TDZYvbIIODR0BteS6Q5yxdVBRNP
         y5p/E0Y3LvkOb4t7f1KQnB4D9qPcVLDGxoWlYzOKpGimga2K4PySKCk0xMtypW/judSt
         WC3HFIhC/jJGXeEDe0STC8qou3EL3j/O8EIZ8uyYutBRCqXsbxJR3GohH4LqPiDi9fvi
         Ss4f9ii1wO2TzTooqud6elPGbsRtbnMZWLDIA+CMii+MCfBx4wMCeWX+bQJuCznWD7NB
         9WAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViTkA4GsUYl3ZurjlBrPxOGCr5YhrA3ByXQEy+f5Qzo=;
        b=hII/8LjcI/UXynix7wxEjrULA2YmDXjhTeYaFpSC9hqePRIak8StWmKVvaKOP93fMR
         SDVFI4Bk4pmguT8ahyo56W9zbG4nDMH/SSJ37wvavlUmy6JaxTiw2mcIq+NhUnfrGeLW
         ZuCo5ncunAJEP1mrY8ZJ7KZ1OTccf/bqB0aDnjPXh5pFS95vNo5iYjtiEcXTzuHWmYwv
         lHa6gZIUrvgR65N44feJJaZVWH4x1wXl83PN8H3wxeHnL2/5j26aY5K4nDrK5BMl3FeC
         e203h+tz5pYTkJHD6RtfQ6AVvXJHyJ6s9LcpWjLkD0pfuLjmb9CLxZn7FWLD+mO72UuA
         XkpQ==
X-Gm-Message-State: ANoB5pmpbkh3e/R1vv/xatBZcie8N55i5Nwn5RNRsR7qb89/4CckJ1TG
	SDAzEGDZVwxBBozCDRNytS1cKYINO2K94y5sHx0=
X-Google-Smtp-Source: AA0mqf4/d5fAIM0i4aspeWu/E/tueQdNAT93DhA+RC9Wep4H/HRV8wyM3HkOnra/oL/psErmUFXO7EptnQS/EGt/1og=
X-Received: by 2002:a05:6870:1784:b0:13b:1e05:a73d with SMTP id
 r4-20020a056870178400b0013b1e05a73dmr40597438oae.55.1669936980680; Thu, 01
 Dec 2022 15:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20221201190248.175753-1-raj.khem@gmail.com> <20221201190248.175753-6-raj.khem@gmail.com>
 <e65f40a225318abefd91c75d51943fc141368082.camel@linuxfoundation.org>
 <Y4kzP3WMTabOHMYB@mail.local> <CAMKF1spdT_yK7K-Do++uMvbxsfAhuPZMu-6qgPn2uBkwi-aSGg@mail.gmail.com>
 <bd44a8ef327c3316e82a4f6a5b8e5b96c00d8019.camel@linuxfoundation.org>
In-Reply-To: <bd44a8ef327c3316e82a4f6a5b8e5b96c00d8019.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2022 15:22:34 -0800
Message-ID: <CAMKF1sqN=QnQOZbQn77QjvGYiu9G8hV6LpRx+TjLdG8V8-XJbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] pseudo: Disable LFS on 32bit arches
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 23:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174217

On Thu, Dec 1, 2022 at 3:20 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-12-01 at 15:07 -0800, Khem Raj wrote:
> > On Thu, Dec 1, 2022 at 3:05 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > On 01/12/2022 19:12:50+0000, Richard Purdie wrote:
> > > > On Thu, 2022-12-01 at 11:02 -0800, Khem Raj wrote:
> > > > > pseudo overrides certain libc functions which are aliases when LFS64 is
> > > > > enabled. In anycase pseudo may not be much used on 32bit systems anyway
> > > > >
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ---
> > > > >  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > > > > index c34580b4ff..c3f0a987fc 100644
> > > > > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> > > > > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > > > > @@ -17,5 +17,7 @@ SRCREV = "c9670c27ff67ab899007ce749254b16091577e55"
> > > > >  S = "${WORKDIR}/git"
> > > > >  PV = "1.9.0+git${SRCPV}"
> > > > >
> > > > > +TARGET_CPPFLAGS:remove = "-D_LARGEFILE_SOURCE -D
> > > > > +
> > > > >
> > > >
> > > > We need to put some comments in here about what this is doing and why.
> > > >
> > >
> > > Note that this was one of the issues I had with the
> > > -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64 build. My guess is that we also
> > > have to remove -D_TIME_BITS=64.
> >
> > Eventually yes, however lets do that incrementally. First I am trying
> > to get LFS handled.
>
> Pseudo is a bit of a special case so if we can see an issue here, lets
> add the other bit needed as well please! :)
>
> I don't mind if it is one or two patches but we should do it.
>

OK, I wanted to first fail with that option because we are removing
-D_FILE_OFFSET_BITS=64 it should be enough
for 64bit time_t as well.

> Cheers,
>
> Richard
>

