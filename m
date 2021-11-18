Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DD5C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 11:11:30 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.223.1637233879359208167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 03:11:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=atHjx8mx;
 spf=pass (domain: burtonini.com, ip: 209.85.128.46,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f46.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso5566857wmh.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 03:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uryhpnsRsuhWdPMXPLa98r0Ta9pbQs7v0TjJvhSMk7w=;
        b=atHjx8mxyA9w1C3jOiLaMp04auTQwnB9g5uCfhmw77Lztq7DNmYs7y/2XDMRhr7xgj
         aDj7mJMaQLy4VZrg6BAaQ6Cw8wUVotB/NxQck/yrKypSf6nmoFf/0vTyvxOWV9qWisGk
         73Lr8N5P+H91fnLNLDErjvNYgvoLooOibKkeondzwUdzXNilP65br79YAWOKrwQorm4K
         aFRu2pcHOuafb+k7j8rs0qGiVe/DeO5ZYwG54wZclbSMzx6o1HOn5SYIWJtpPCJh7w32
         PcUkX8nlWYHCRCn47HWWw2Sn5/O/OxflUI0Bx/SbCEzNiqb0KBHwYgw6d/gvB8gZ8ftr
         a0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uryhpnsRsuhWdPMXPLa98r0Ta9pbQs7v0TjJvhSMk7w=;
        b=fJCaDAqNS7rtgxpRhBm+8aEuBWaVi92crMVoVBhFRdastksgh4HCvyMqF8NUNBI3/X
         oeQiATuR1+Y+jbrNN/11WeoCYh+6Xf/2SX0lC2q9rRjdI0fqifcuXG0SMADUScU14NCP
         ceM8wt5hWGnm33IvzMLNuADnLlFWIQk77afktigqSSN3a8bo02EazxI8lTVQALSwatD+
         2rNsK54wl78V0pTHs8+JA/daTiTYP3o2eA5WXD6ZKhHxzZ8d4blFSL2UgLK87CD2bUr1
         PvzmeC8N5bDhnP56dSldfBjfZjQOTqIDAgAILJgTFpXjvXqcFvRyOjnBM9XpLJVqaMyN
         n1Ww==
X-Gm-Message-State: AOAM530QPMnodHKBhno8YIV6J9OHtSLp7FJ9gILfBkq2Mf/8TDrMscFj
	LVoMUj3wMnz4lnkIpC34ycJC5NHyxILTtmQKQowVeZYT5E4g4scV
X-Google-Smtp-Source: 
 ABdhPJwrag9+6Gihu/NLIrsg/1ZSqXA9p3Kz93ipp03W9jk77pL7hWVeT1hL2MWsenHZh/0L2xPMETEXL0dnc+sP3H8=
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr8890535wmd.184.1637233877047;
 Thu, 18 Nov 2021 03:11:17 -0800 (PST)
MIME-Version: 1.0
References: <8ca5808d-1fd6-751-f9c9-b99ab8242cd6@crashcourse.ca>
In-Reply-To: <8ca5808d-1fd6-751-f9c9-b99ab8242cd6@crashcourse.ca>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 18 Nov 2021 11:11:06 +0000
Message-ID: 
 <CAAnfSTvfHM0eBoA8N48=UVBcDPnGUrfkHt21VseMWFOMMe5YwQ@mail.gmail.com>
Subject: Re: [OE-core] how to "prune" dead sstate-cache?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 11:11:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158474

If you can say that you've touched all the sstate you'll need then the
find trick is sufficient.  I use it on our CI to prune any sstate that
hasn't been touched in a month, for example.

The script is more powerful and can selectively save or destroy
things, but can potentially be more complicated than just nuking
anything old.

Ross

On Thu, 18 Nov 2021 at 10:38, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   assuming my (correct) understanding of sstate-cache is that, as time
> goes by, it just gets larger and larger, it will increasingly contain
> content that is of little value anymore, what is the simplest way to
> purge or prune entries that are no longer involved in any desired
> builds?
>
>   i'm guessing a simple way to do that is to first delete tmp/, then
> build any current targets/images, immediately followed by something
> like:
>
>   $ find sstate-cache -type f -atime +1 -delete
>
> is there anything fancier than that?
>
> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158468): https://lists.openembedded.org/g/openembedded-core/message/158468
> Mute This Topic: https://lists.openembedded.org/mt/87140377/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

