Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF89EC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 17:33:59 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web09.14333.1639416839359425489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 09:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=at6/+ELU;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id n9so11501293uaq.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 09:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yvZuHK8B/SmRSBqp78kdR9f3+P8919aVA34zBpR91OE=;
        b=at6/+ELU5c5/psz3Wbi3wBT0dAiu6P/6taUtY0wXvIxSnij4ha7QSG658XyEj1XpXL
         oiwzP4Tj+Dh2f/HwDWWUl3srTgc+2U5rW+xSFpna7hJcsfv1csvl7ifDUI4+BAzXJKan
         VfSUC18hVFVc9HNWB/Sru6yILTWeRKcrE77XJ8qWz8KRlZO9+WzO8Fo3/ewXCg700FRx
         0TB+iVqiZiKC11V+FT/bbtg7R8n1vgUtLVKs/Hg9fsJioZS94tzINNa4JFSwFlh6fMcS
         culLszZYrVSLDALlIEeXdJMoGnbM2s42xzAGQcgpOnU54IsnrZRbuSQNMl19ogYIvmNZ
         ZS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yvZuHK8B/SmRSBqp78kdR9f3+P8919aVA34zBpR91OE=;
        b=vpb+fDmuxMMun0R1HaneAGLFXzdsOfxtkqAqtTJ81VAOpdprs/eHi89gtLJOUBJZ+9
         hb5Avn50oJPOhdmbke7ov0gBtjNuf7G3yDYMyDJe6/eP5tRMd6p50VUOKe50/MHwerQs
         pxnZSo9dBEqvSXL5s4s+JxY0lprMZ1YEQv8vbur5ocFtlgsKePoxfpnijdWPwRFb0jXk
         1ptZI1rPIxicQhMC7cCqrKAHoply8oH92Cv19TT0LrQkDt2ii/GcCUf5D9pqd6azRXSA
         6F2F9jKD2RYo+YjCyZYHKz9dMBx5rrPlDYYIwoXpYooTFWvc7FiaoAARQe/XK/tMvPx2
         94wg==
X-Gm-Message-State: AOAM532V52yiJYVKLrVNp3vE6dCplJ4VtfxEIiMDv6pwwa6SSRI1dgCU
	to5wYofPC9EU3QpNe+oRIXt1rWJiHXcwe6cwjA8=
X-Google-Smtp-Source: 
 ABdhPJywAP7b9y2x28XtPEvqDEKibO4u5CfPpZDadULdgIk/hG9eARbf7LwGz8rtOJH3tHmITaklFfRhNWo4fSJhy+w=
X-Received: by 2002:ab0:36c4:: with SMTP id v4mr41602210uau.8.1639416838375;
 Mon, 13 Dec 2021 09:33:58 -0800 (PST)
MIME-Version: 1.0
References: <20211210130458.39716-1-max.krummenacher@toradex.com>
 <b2a5cb5f05016901b1c9d56e0d68f939c549db19.camel@linuxfoundation.org>
In-Reply-To: 
 <b2a5cb5f05016901b1c9d56e0d68f939c549db19.camel@linuxfoundation.org>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 13 Dec 2021 18:33:47 +0100
Message-ID: 
 <CAEHkU3U4g-dtXUujeyN0TowzA09HJowv4+Vz+n_um80A+Uk2Zg@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/2] implement applying patches from a
 directory
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 17:33:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159654

On Fri, Dec 10, 2021 at 4:57 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-12-10 at 14:04 +0100, Max Krummenacher wrote:
> > The current developer manual [1] specifies that patches that are
> > part of a directory which is given in SRC_URI are applied by
> > the do_patch task. However that is not implemented in the
> > current code.
> >
> > This patchset implements that, but deviates from what is
> > documented. If the patches are applied I will send a patch
> > for the documentation changing the relevant part to:
> >
> > ```
> > If you have a directory full of patch files and you want to
> > apply them all you can add the directory to SRC_URI and add
> > the "apply=yes" parameter. This will apply ALL files in the
> > directiory, including files in subdirectories.
> > The patches will be applied sorted by their filename. Files
> > from subdirectories will be sorted into the list at the
> > position given by the subdirectory name.
> >
> >    SRC_URI = " \
> >        git://path_to_repo/some_package \
> >        file://path_to_lots_of_patch_files;apply=yes \
> >        "
> >
> > In the previous example all the files in the directory holding
> > the patch files would be applied as a patch.
> > ```
> >
> > Max
> >
> > [1] https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#ref-tasks-patch
> >
> > Max Krummenacher (2):
> >   lib/oe/patch.py: apply patches from src_uri specified directories
> >   lib/oe/recipeutils.py: follow changed method argument list
> >
>
> Can I ask about the motivation here? Have you a use case you needed this to work
> with or are you just making the code match the docs?
>
> I'm a little worried about adding features like this which aren't commonly used
> and clearly haven't been needed for a while. Such changes really do need some
> kind of test case and as Bruce mentions, ordering of patches patches in
> directories is a concern, you did at least sort the listdir() output which is
> good :)
>
> In the past when I've needed something like this, dumping "ls -1" into a file
> and turning it into a SRC_URI hasn't been too hard even for long lists of
> patches...

I want to do continuous integration / testing in our upstreaming efforts
to U-Boot/Kernel. So I would create a directory with any prerequisite
patchsets and our mainlining patchsets which are on the ML but not yet
in the repo and put the individual patches in the relevant directory.

Should any work on the repo break any of the patches automated testing
would then trigger us to rebase/change whatever needed.
With the directory approach would take away the burden of fiddling
with patch lists in SRC_URI.

I assume there already is a test for do_patch in the current automated
testing. I could integrate the recipe I used for testing this extension
of the patch functionality.

I used the "ls -1" approach in the past to make my life easier, I guess
however that the directory approach would simplify things even more.

Would a patchset with a test be acceptable?

Cheers,
Max
>
> Cheers,
>
> Richard
>

