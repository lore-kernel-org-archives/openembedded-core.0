Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC715C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 12:28:44 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.4897.1657196922916574550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 05:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=elvEpCke;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id r6so11507700edd.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 05:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iP8jXxQEvf/F4Jhht4dTOTee/ZE9TG23IZBnJut/Fro=;
        b=elvEpCkefm2TC2ZPhGqavlQHeBkbtrs9Aja+Y0+mQ9MP6NbTHlWad3oz1SdyX6WJc5
         KgULM1E0EfmMZe9C41oHNHrJEWkA9uDUt08V/NlyAeAqE9u6EONUvhw1EeSo1muMII4A
         /Th7J+pyMDKu4370WQ0xCoXEGN6qlFeTjZCh9ZrWHDssffnFl7OPDZvmOuzLSGD4ecrp
         NUz4ZLwPzHymuEkw482ZsgAW0RgT21Z8uUvXmrXSfiAL1vbLlxZl8H/d+IJjQzqmoh3R
         y778q2OMKZ+84MCnGnwsPeypK3FDLVd4DuSixT/bp0fsW+bx6TWZakmC92UYWp32IkSF
         tklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iP8jXxQEvf/F4Jhht4dTOTee/ZE9TG23IZBnJut/Fro=;
        b=5LrJmXAUGyclLIdzb2jSea2Eb40/J/83YO9B4GvFrS+mAEPHiAG5EpCkdvNSA9eaFi
         SePFfCJusSvZQ5gkOir88nsp4+eMWNuTPTuge8xUWnozPGtY1ukhcjRub7inMv+ZHe3m
         vU+evVwe0IToMw/0KDy///7pRBZCokna6K6GTOSux2yOY9XiBYLzNprmvKv9hgHuhxdw
         ffgVVrEWBFXq7EU7qptrhmiwIVt/rSKtocVdUSXR1K7ck+9zzkhurP6FCVKWVT311GHV
         poHtyjndJI/HZ7NV4jJhvGy2rv2zNdsYr7BsWOKPUttz2EJom+su7DN/lg7n/CL9lKiQ
         KwaQ==
X-Gm-Message-State: AJIora9Tc2Py475okfzwVja6DWJ6vNP6mw3Z3UqPzvqDWSP035ZgZOL6
	KhDNysreNZm067htryE5P6peW6Y0t4S0yz7MSWA=
X-Google-Smtp-Source: 
 AGRyM1sACO1xdteDfTULH7t2eTF1Da7395CIlxsKM7zZHTh0ykGVelHW3aO5qNqmv0tmbCC//1dPX0aVj4jzTei17dI=
X-Received: by 2002:a05:6402:5002:b0:437:7a54:12cd with SMTP id
 p2-20020a056402500200b004377a5412cdmr62680525eda.345.1657196921337; Thu, 07
 Jul 2022 05:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <16FE039DA287E43E.1980@lists.openembedded.org>
 <16FEA3B3CA900B93.1980@lists.openembedded.org>
 <16FEBD90A08F81A5.1980@lists.openembedded.org>
 <5b8c809573b0ecb0039333edcbeb1936b40db564.camel@linuxfoundation.org>
 <CAO5Uq5SPMd3FZwF8StQ6ofSustJiVFC2LLOe8RLTzMyyHXK5pQ@mail.gmail.com>
 <8877617E-E758-4948-9BF3-730FBB36E74A@arm.com>
In-Reply-To: <8877617E-E758-4948-9BF3-730FBB36E74A@arm.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 7 Jul 2022 13:28:28 +0100
Message-ID: 
 <CAO5Uq5SyuYfJcTM-WYhroZOLsoXM512gUv5JYvDr1ON5o7ZXmw@mail.gmail.com>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 12:28:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167774

On Thu, Jul 7, 2022 at 12:29 PM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 7 Jul 2022, at 12:14, Alex Kiernan via lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org> wrote:
> >>>> meta-gplv2 issue:
> >>>> stdio: WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexec/mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [buildpaths]
> >>>> stdio: WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debug/tar/1.17-r3/build/lib/string.h in package tar-src contains reference to TMPDIR
> >>
> >> This may be the end of meta-gplv2 since nobody cares.
> >>
> >
> > Much as I'd rather this just wasn't necessary, I'm taking a look.
>
> Is this an admittance that you use meta-gplv2?  Do you have an opinion on this thread?
>

Sadly, yes, as a dependency through a vendor layer which is
(currently) stuck on thud, rather than anything we depend on directly.
The value for me is in being able to build with these kind of checks
on master and find out what issues we're missing.

> https://lists.openembedded.org/g/openembedded-architecture/message/1566
>

Honestly I think it's probably the right approach, since keeping it
alive perpetuates the problem (now trying to decide if I should just
delete the two trivial fixes I have...)

-- 
Alex Kiernan

