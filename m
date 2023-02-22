Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C895C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 21:12:25 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.14.1677100342770794798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 13:12:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bekQU7Ke;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id bf15so4146771iob.7
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 13:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9YEghRNx+GVNcSt5xJlKgnIcOpCP0RF9haIq9xy0o18=;
        b=bekQU7KeQFKfzUFn8O8q07gfmWIBVOUq1HK0qtMWY4G53lplIYZsmsJN9+DmpNxFhW
         /NBgsKUdConpAnHtwaf3W/68rYh0+k44rTbQmnLctsGx68i08KsfGnjU07L4HKItSlgK
         KWfkip6VztJZA6g2UKykg6a/zJIU2t8/z+/fr5CTaEBFlHlMVNyB+wXIOsn9nMHO+TGX
         P+bD6I34tAqjmB3FQoLgQDz1aOHM2hRWZY/oIVRJRSR+kfX8b7R62+TJu+1U7hCTtUgT
         WP1mX10tFNpw4R7fIfRY042e3TGY3fiXqPsvN0PMKryrCytW/afvAqTWlzFoiixKM6a4
         f2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YEghRNx+GVNcSt5xJlKgnIcOpCP0RF9haIq9xy0o18=;
        b=pa5fI0UAaQCV0xYwXAQZ8aLUuUvdBIDD/NLQOna57+rCumCbtUCj9IG/LdeHL0YGVb
         SOGHJqXQW05IMk+GYmqM3TR+osrMqiZWktqexjFDLxfFG4+o00Zr18k+BzmOlLHfNz9g
         Ryq+Rb/0I51Klm39U1iEQ6paPps6DPZmrFvypvoEXFyI3IarFq3kmuckIuL3yN+ZWpJ3
         x/BRjmiRlPzJ3i8CCHJPTe84PhhA9rXFe+WvucNRxR9HXWhMCbxdlEo/k6xS5L/aqX+A
         eI3P+w4ihooYftdfHTXsS957oOb6+kXmm+6JzmTM/R2NyraDYdVB8xTpmShzS9wXKIw/
         NuZw==
X-Gm-Message-State: AO0yUKVBuZYY93lK6wmWFuTynTZ7vYSs7R95QoCsXIZWJOPsq+O5568X
	oFGEX1RvYg9pOrxDnNLI5NF4Ioy5tCsg8pMJs/o=
X-Google-Smtp-Source: AK7set9ZpufJtEbsVjVaWX8WXXGSEfjNYTsXFAibKnMqVIimhr4s2TTuxyqTg1qm1LAFnEiC94d6ievzzPerI5w92PQ=
X-Received: by 2002:a02:8604:0:b0:3e5:a7d9:17f0 with SMTP id
 e4-20020a028604000000b003e5a7d917f0mr441983jai.4.1677100341921; Wed, 22 Feb
 2023 13:12:21 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5Qe4+kJANi+HuDrNK=9okEj9XgaFYzhhuixpVqdtZft1w@mail.gmail.com>
 <3983cc0aa3ab47e2b726103ab9dbd2a5408c76bb.camel@linuxfoundation.org>
In-Reply-To: <3983cc0aa3ab47e2b726103ab9dbd2a5408c76bb.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 22 Feb 2023 21:12:11 +0000
Message-ID: <CAO5Uq5QMfj-5nnf+V3gEh2HuZ_rK9ziT2S9632-mtcTn3zdB5Q@mail.gmail.com>
Subject: Re: [OE-core] sstate cache management
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 21:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177586

On Wed, Feb 22, 2023 at 8:33 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-02-22 at 17:56 +0000, Alex Kiernan wrote:
> > I needed to do something about our shared sstate store and waded into
> > the sstate cache management problem as the existing script takes hours
> > to run over NFS (which for better or worse is where ours is). I've set
> > myself the problem of replacing the existing script with something
> > more extensible, understandable and performant.
> >
> > I've got something which I believed was roughly right, but I'm ending
> > up with questions I can't answer when comparing the two outputs...
> >
> > If I run the existing shell script against a tiny sstate-cache (on my
> > laptop) I get 420 duplicate files eligible for removal, if I run my
> > script I get 491, looking into the delta, I pick out things like
> > these:
> >
> > $ find sstate-cache/ -name
> > sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:*_populate_sysroot.tar.zst*
> > -ls
> >     49067     16 -rw-r--r--   1 alexk    alexk       14435 Feb 18
> > 15:29 sstate-cache/25/59/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:2559429e2a553085bc657f3d2a21a111818061448e5fa2aa16398afb5dad8b90_populate_sysroot.tar.zst
> >     49129     16 -rw-r--r--   1 alexk    alexk       15205 Feb 18
> > 15:29 sstate-cache/25/59/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:2559429e2a553085bc657f3d2a21a111818061448e5fa2aa16398afb5dad8b90_populate_sysroot.tar.zst.siginfo
> >   2490392     16 -rw-r--r--   1 alexk    alexk       15204 Feb 20
> > 13:24 sstate-cache/bf/08/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:bf08f26e6bc5ab56ed128441fb05edeef41aa881330d04eea127a93ede51713d_populate_sysroot.tar.zst.siginfo
> >    339439     16 -rw-r--r--   1 alexk    alexk       14423 Feb 20
> > 13:24 sstate-cache/bf/08/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:bf08f26e6bc5ab56ed128441fb05edeef41aa881330d04eea127a93ede51713d_populate_sysroot.tar.zst
> >
> > Which look to me like I should be able to delete the older ones, or am
> > I missing something? Trying to follow what the existing script is
> > supposed to do is challenging!
>
> I'd say delete the older one but it does depend a lot on what you're
> building against the cache (e.g. multiple releases). The system is
> meant to touch files it uses and the autobuilder just ages out things
> not touched for X time where X has varied depending on the pressure on
> our NAS.
>

Thanks, so seems like the existing script not spotting that those
could be removed (using `-d`) is just a bug?

-- 
Alex Kiernan

