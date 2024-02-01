Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D2DC4828F
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 14:53:02 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.17181.1706799179935453392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 06:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WNMVx4ek;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d7431e702dso8947655ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 06:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706799179; x=1707403979; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzaHA0NjQJRuLXkCfO2tRuwaz9m6rqzEr55t4yPxUBk=;
        b=WNMVx4ekj6V0ShP3f9P/pH7LXxBpGN/33rjek8J4WDBAOSFxsN6PrChV/NKFMWTbfy
         ptXdLNe1Mv0GDmSXi6h10+pzGO0RzrUZzvKhXZlS/4i6Ii1YmZUWqmpNPxY0jEr+ehAL
         i+IfxE93g+u0xnTk4jMchXMsMNMefmWartKoY/plAvIIEWPksLyxFjxq7TVUNEnoITyj
         JpsGyrP+AGhcOP8a33A5RarqfizEfg16LUKfzBQTfU6mL1Xs747/HkPGKf6tf3ZCs443
         3cgf8PERmDzaxY6yGzJ+4jxBJI6AWFeRZkoLlwPKp6X+BmLTuiKQC98K+IILd62amYOm
         ymxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706799179; x=1707403979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzaHA0NjQJRuLXkCfO2tRuwaz9m6rqzEr55t4yPxUBk=;
        b=L9u7ZvdyFxOomyRTheFSCRC8A01WVh5z1g5gOW2S3w6tdPptKU6r5vJ4X+6a0aYrrA
         X2glwEIbQtqb3lHISBMiovDDkPGnDejMNW5CxZ3/5aUZCEVj5tFa3PP8vJicWZxcymDR
         cOi2UIeGOTx07ZCTifrka66R6tXQmsM3WaR1cLfSwwg+9BOLF5sj+peIcJds4c2L0/pA
         jwmdaszr4NtGFZ3uAbP9OqX/tAagqWVShaF46Vgex8n0htcyB8IOBSehNDkcKYQhgJ+m
         JXLPqlPMXbI0aJL1FW/XWVRiK+E6+r6xSpvkiQoPGcYXeFhXQscpoUETEJtc38UProgO
         6oDg==
X-Gm-Message-State: AOJu0YzHvuh2sfYNmhlYv+1V8+ctAk1JSkuyf/t0g5ew9dCMjJgzeHVg
	8P+1LYrLTKls6r5RWnVeohLcXeSHmnVhWZ0Ok3j3a2PQnIsSpjgsUtyAhIInpLP6Jxe/if4rhlh
	9rmHuAmqhKhCNAKW1gp+ROrJNtUY=
X-Google-Smtp-Source: AGHT+IEsiDfWhi2RHR7je4RgXRfiRSNbE7mGMukgIjMQOGAW9mFH3ZVSU+Y190OVH+tDEstcT6oc4Ki5PEM5m3hr7Yk=
X-Received: by 2002:a05:6a20:e307:b0:19e:42e1:b86e with SMTP id
 nb7-20020a056a20e30700b0019e42e1b86emr1737258pzb.54.1706799179222; Thu, 01
 Feb 2024 06:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20240201115326.506503-1-claus.stovgaard@gmail.com>
 <CADkTA4NBTEH9js2E+KBGx3_LeLzd0RDCVY9gw2gHp-qP5ooO_Q@mail.gmail.com>
 <b594d06bbba5dd65e8f1f9a7cc865a7e5aaaff66.camel@gmail.com>
 <CADkTA4MUkExGV3WM6LLZA6i9Nk=XU9G2Yc+0AkQchY5UJgAbMg@mail.gmail.com> <212ff1e6d6315bba5371855ebd826bbbdd58f365.camel@gmail.com>
In-Reply-To: <212ff1e6d6315bba5371855ebd826bbbdd58f365.camel@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Feb 2024 09:52:47 -0500
Message-ID: <CADkTA4MeOQR1Tq+nzQAnEch9B06F9eudYe_UGrFoSsW6GbM5WA@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] kernel-devsrc: fix missing RDEPENDS
 gawk and make
To: claus.stovgaard@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 14:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194593

On Thu, Feb 1, 2024 at 9:37=E2=80=AFAM <claus.stovgaard@gmail.com> wrote:
>
> On Thu, 2024-02-01 at 08:41 -0500, Bruce Ashfield wrote:
> > On Thu, Feb 1, 2024 at 8:31=E2=80=AFAM <claus.stovgaard@gmail.com> wrot=
e:
> > >
> > >
> > > Thanks for your quick reply Bruce
> > >
> > > On Thu, 2024-02-01 at 07:45 -0500, Bruce Ashfield wrote:
> > > > On Thu, Feb 1, 2024 at 6:54=E2=80=AFAM Claus Stovgaard
> > > > <claus.stovgaard@gmail.com> wrote:
> > > > >
> > > > > gawk is also needed for x86-64. See scripts/check-sysctl-docs
> > > > > Since version 6.6 the package rules has been split up into a
> > > > > rules
> > > > > file
> > > > > resulting in the need for make. See
> > > > > scripts/package/debian/rules
> > > >
> > > > When I looked, the rules aren't actually used when we are
> > > > building an
> > > > out
> > > > of tree module (and via make scripts prepare) indirectly.
> > > >
> > > > In a situation like this the approach I've taken to exclude the
> > > > source from
> > > > devsrc to keep it minimal.
> > >
> > > Okay. I will patch the do_install instead and remove the debian
> > > rules
> > > file. I don't see the usage either so it is fine with me.
> >
> > Just remove it in kernel-devsrc's copy of things. We can let the
> > kernel continue to install them, we just don't need them in kernel-
> > devsrc
> > itself.
> >
>
> I have sent a new patch to rm the rules file - removing the need for
> make, as you suggested.
>
> > >
> > > >
> > > > If you are seeing gawk required as part of building a module or
> > > > make
> > > > scripts prepare, then we definitely do need to add the
> > > > dependency.
> > > >
> > >
> > > I can see we are including the scripts/check-sysctl-docs and
> > > objdump-
> > > func needing gawk - no matter the architecture.
> > >
> > > Alternative we should properly remove those also.
> >
> > We definitely can, if they are bringing in something we don't need to
> > prepare the source tree for building modules.
> >
> > The ones I've added over time have all been related to that.
> >
> > Bruce
> >
>
> I looked a bit more into it, and I could remove the check-sysctl-docs
> script, but it will still end up needing an awk.
> (Also check-sysctl-docs has been there since 5.10)
>
> A quick look revealed the folloing files.
>
> usr/src/kernel/arch/x86/tools/gen-insn-attr-x86.awk:#!/usr/bin/awk -f
> usr/src/kernel/scripts/ver_linux:#!/usr/bin/awk -f
> usr/src/kernel/tools/arch/x86/tools/gen-insn-attr-86.awk:#!/usr/bin/awk
> -f
>
> My guess is that for all normal SDK's a awk/gawk has always been
> present, hiding the issue. So I would suggest that we just change the
> RDEPEND to cover all architectures, and not depend on some other
> package include gawk.

Definitely. We don't want any dependencies being fulfilled transitively.

In particular since gawk has already been required by arm64 for a while,
it isn't a completely unreasonable thing to add.

>
> (I only noticed the gawk issue, because I had a SDK with had the "make"
> issue, and created the most basic setup to reproduce it with poky only.
> For all normal SDK's I would expect it to include gawk)
>
> What do you think Bruce?

Seems reasonable to me.

Bruce

>
> /Claus
>
>
>
> > >
> > > Will split it up in two commits, and start with the "make" fix
> > >
> > > /Claus
> > >
> > >
> > > >
>

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

