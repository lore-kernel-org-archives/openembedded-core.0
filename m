Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2938BC636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 13:54:00 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.10854.1677160435863496396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 05:53:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IXKe6KjF;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id b5so1103798iow.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 05:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xW+gFyGwwVDhkgvKZrWrrBTpqG7DaLb7h0lB3DzpQJM=;
        b=IXKe6KjFfp/teLaUil1u7Zi+dq4BPwiURb7nz4WDGUmS19ZSDKavTZzZhSIAfUCbXW
         7VMkurFnUaXZxJ+hqNyERihoAlcLqbXf5hZjI09m7J5o6TwNDtxKf46ldou3OLULfcGc
         cOXoPj/fe19Ep46v4Bbmh6mtMz8L9XtskfY05xlFemVdvICiVKOUtuW2XK1CPxvFYClN
         a1TKEY22h5BP6atB34arxYBt//QgF/6UFqgGFH/8EvjeYAqufBgM+BaQoxvJD7rU91dW
         SnLgB3rDP8B0poLwI7L4OIgB8bEGE9+kAtGDFI9d9yj32tFAQTACR/Kh8BPL/GTsGHl6
         +f6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xW+gFyGwwVDhkgvKZrWrrBTpqG7DaLb7h0lB3DzpQJM=;
        b=B4gPGRvKhL1PcifbUadmsClSmhwyuF1omAMnFADLB12k/jIV8AlFkZI7NThSV93EsL
         i70VeBsHR3jkogMXp1YFCpOfdd7uCuq+90r7HAwiE2VRmUtVMkFpWZbEMIrcesqrKpbQ
         8QfmaoCfPIMRH6XpAHIjlOJu9OQz2uCYkkDF/u8QHo3C7WK6BqKeCDS+OpT8MXsPTDCJ
         S9JJQOAk1UcotRqVWxleLqjkMaQ/DvwhrvCdcvmT0qppVQR69mD39FbRyuo8xMNvXHUD
         C2vfgcoNLS3+7PUahykiQWrg5W0iBAV02JFIhFjoIjFbTIY8rXKGx/EQArUQ8gCvjmG8
         JAIA==
X-Gm-Message-State: AO0yUKV/ObKWZT97+6Q1JAzqpWy1LETe7PVkG5zFYrqFQwJ+Ik8/nVAn
	KXRwYwD+TEnEfgLrsCNuof5C06T64LeDyf3WVK0=
X-Google-Smtp-Source: AK7set+ZQVCY32V0L4EAG0/2/mJARZCCOd+aC7UEL4p/5EpMA3PIT1bwZsZAGOoitqFml9RdBhcdQ5Du9oyB3Lp+s34=
X-Received: by 2002:a6b:7b48:0:b0:71c:1bd4:b768 with SMTP id
 m8-20020a6b7b48000000b0071c1bd4b768mr3345282iop.84.1677160435119; Thu, 23 Feb
 2023 05:53:55 -0800 (PST)
MIME-Version: 1.0
References: <20230223062754.3162249-1-chee.yang.lee@intel.com>
 <CADkTA4MV5JMfhG6hSCHqRO2RSguE9k-DCYHX6h8R9_xRD_0TOQ@mail.gmail.com> <0383bf0d23cb729d492771f658b31c6ae6584c60.camel@linuxfoundation.org>
In-Reply-To: <0383bf0d23cb729d492771f658b31c6ae6584c60.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Feb 2023 08:54:45 -0500
Message-ID: <CADkTA4PcYYATspzxdsrp+1xP7emdJ58GZdjYN--OvjqOipR1Hg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] checklayer: check for patch file upstream status
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Lee Chee Yang <chee.yang.lee@intel.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 13:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177608

On Thu, Feb 23, 2023 at 8:48 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-02-23 at 08:33 -0500, Bruce Ashfield wrote:
> > I don't recall the upstream-status being added as a yocto
> > compatibility requirement. Can someone point me to a discussion that I
> > missed ?
>
> It isn't a requirement at this time and there isn't any recent
> discussion you've missed.
>
> The topic has come up now and again at various points, including with
> the YP TSC and I suspect that was why we have
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14642 from back in
> 2021. I think the view of the YP TSC was that we probably should warn
> about things like this from yocto-check-layer perspective as it is a
> best practise we want to raise the profile of.
>
> > As everyone can recall, I wasn't on board with this being a default QA
> > check and error, and I'm also not on board with it being a yocto
> > compliance error.
> >
> > I realize it isn't being made an error in this patch, but I wanted to
> > raise my concerns now, before someone throws that switch.
>
> Your concerns are definitely known! As I said at the time in the
> discussion, the TSC does intend to add some extra checks around QA
> issues to YP Compatible but no decision on which ones has been made
> yet, I think that action rests with me to make a proposal. My view is
> this one can remain a warning, I can't speak for the rest of the TSC. I
> do think having yocto-check-layer show more warnings about best
> practises if the direction things will move though even if it doesn't
> change the resulting compatibility status.
>
> There is an intent to improve "quality" over time so I can't promise
> this will never become an error but I don't have any plans to push this
> beyond a warning. As above, I can't speak for all TSC members though.
>

Sounds good.

Summary: Everything is under control, and I didn't manage to zone out
and miss something while battling with the latest round of golang
craziness.

I've already gone through my layers and updated the formatting and put
inappropriate on most of the patches (I may have missed some), so my
argument isn't really an argument at this point. With the QA check
being around now, and anyone being able to turn it on, patches without
a status should be fairly rare.

If it did become a compatibility requirement, I'd of course make the
changes and stay compatible (maybe grumbling a bit at the same time
;))

Cheers,

Bruce

> Cheers,
>
> Richard
>
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

