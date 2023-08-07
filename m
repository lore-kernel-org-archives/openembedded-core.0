Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7E3C00528
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 14:15:53 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.35575.1691417746396710346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 07:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=S5VPUq1B;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b9cbaee7a9so73819321fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 07:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691417744; x=1692022544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AKxRTSadzk4SrG2xjCPGsbCtV0ciPmgRCZytrThyV8=;
        b=S5VPUq1BAtSZVxzkrb7h83O20KoLUh4GsHiUC8BvZksA5wIbztqVnpEdSMyYCmZFF1
         pU9m/AS4pwBIoLwmvauCPpkAheObFSAEv7KPpMA9716CjCEklZOxAdBwSf0tIZcac2au
         0Ujz8Vdch2RYhJOdPVah8vjytdirTIW4/wnRZexTGld9RXhLIm+FY2gx2KKnAyTmX80K
         ZW9Z4FozNcBDODw1pnQob3M+UhPfyJyf5LwK9tg6jtksSiaAe6N/ct5RGJgFrcHdMKzi
         3NCGaQ7UKqwhB5v17OnnhqNxk24kYbELTiPmDoxcsqgpKDa5Duhc0WHEu29uP9tR+0UI
         aBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691417744; x=1692022544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AKxRTSadzk4SrG2xjCPGsbCtV0ciPmgRCZytrThyV8=;
        b=X+DYZaoi7j2ZMeG96zpH/dr558QxoiD1SkoYy0BpiaQyl0qCsW7IAfesvJOGyrFMdI
         PldA2ZaupWjKv6UOlr2hSjbZPrgixEfzbiMC1NKSqF5RsxByq66jTMQ5ZEOsXQj43jlB
         EuxaxW0PEeH6l2qGYPb4dUK0qRvygzv/RAJE4Ar2IJ3908JM4v0d9FOS84cFkzUCzJI3
         wEurwyxo6eCpwgim8Hn4Pm8za+ack7xkocel6VEz5IEH6lGMaDnVmCBJ8Nnk4G47t3wL
         PXFBPDJsbdNicWtBbWUcoDqK4k3wL1mPqDRYQ8K5htWXmEd+MS05JgS+4sLY38ZqFXvv
         lmtA==
X-Gm-Message-State: AOJu0YwQhqdpa7hnbXDumBUytMl/N0CVLTiS7LUnwzQLGn+ozXrGD3TG
	y1HxWqCwyCq7ol4qcIbNd6EalmadA7BLyEZekHY=
X-Google-Smtp-Source: AGHT+IF3NbIZ1nu2rIuBPF4Xt3h4UYy+XoV1LhEHBsr/CWv//4OMhJpo+sRbtERT5XGe5+ceKciOn0X9gnjLaxRNlCs=
X-Received: by 2002:a2e:9a8a:0:b0:2b1:ed29:7c47 with SMTP id
 p10-20020a2e9a8a000000b002b1ed297c47mr6962364lji.8.1691417744245; Mon, 07 Aug
 2023 07:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <88B62901-053C-4E95-9896-868EE16A4467@getmailspring.com>
 <CAJdd5GayZMQscBprpoqXW8JgixQKpVkAhNRJVPDD0Pffqj6Tvw@mail.gmail.com> <964e59cb4a5f2497955511aa7e1734b98b90d3b0.camel@linuxfoundation.org>
In-Reply-To: <964e59cb4a5f2497955511aa7e1734b98b90d3b0.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 7 Aug 2023 08:15:32 -0600
Message-ID: <CAJdd5GZAuucvChGKA1VyRwh6bWLmi1O0RB_LA3x+kq4M5s0o-g@mail.gmail.com>
Subject: Re: [OE-core] [OE] help with Equivalence Server
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Maksim Chichikalov <max.chichikalov@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 14:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185601

On Mon, Aug 7, 2023 at 4:01=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2023-08-06 at 13:15 -0600, Joshua Watt wrote:
> > On Sat, Aug 5, 2023 at 7:54=E2=80=AFPM Maksim Chichikalov
> > <max.chichikalov@gmail.com> wrote:
> > > My name is Max; nice to e-meet you. I need your help with
> > > Equivalence Server :)
> > > I watched your presentation on Youtube - it 100% helped me to
> > > understand the logic better and debug the issue we are facing.
> > > Thank you for all your input into OE development.
> > >
> > > I found in OE repo that you introduced "def OEOuthashBasic()", so I
> > > decided to write to you first before opening the topic on an email
> > > list.
> > >
> > > The problem:
> > >
> > > Input data are propagated to the output hash generation function,
> > > which generates a different out-hash.
> > >
> > > Description:
> > >
> > > All "_git.bb" recipes have to append SRCPV to PV. As a result, PV
> > > is different on each commit.
> > >
> > > The OEOuthashBasic function includes SSTATE_PKGSPEC to generate
> > > hash, which contains PV (PV contains git hash). As a result, there
> > > is no way to generate the same out-hash even if changes introduced
> > > within a commit were trivial.
> > >
> >
> > Right, this is sort of on purpose, because the hash equivalence is
> > basically trying to say that an sstate object can be used in place of
> > another one, even when the task hashes aren't the same (but the
> > output hashes are). However, the sstate code itself will only look
> > for sstate object with a certain name (which include PV); hash
> > equivalency does have _some_ control over the file name sstate looks
> > for, since it will replace the taskhash portion of the name with the
> > unified hash, but it doesn't have complete control.
> >
> > >
> > > In our codebase, our components have API part, which is managed by
> > > an independent recipe per component. The described above problem
> > > caused the recompilation of all components dependent on API, even
> > > in cases when API was not changed. CI for pull requests recompiles
> > > mostly the entire code base, I need to do something with it.
> > > (sorry, quite hard for me to explain it in a nutshell, let me know
> > > if you like to know slightly more details)
> > >
> >
> > Ya, sounds like a typical mono-repo design?
> >
> > >
> > > I see a couple of options for us:
> > >  * Add a custom implementation of out-hash generated function and
> > > overwrite SSTATE_HASHEQUIV_METHOD.
> > >  * Better understand why it's mandatory to append SRCPV to PV, and
> > > maybe it's flexible in our cases to do it.
> > >
> >
> > This might be the best option, at least for your recipes, but I've
> > CC'd the list for additional feedback
> >
> > >  * Propose a patch to fix OEOuthashBasic().
> > >
> > > In my humble opinion, the commit's hash shouldn't be included in
> > > out-hash generation, it doesn't make sense. Unless I'm missing
> > > something important - What are your thoughts?
> > >
> >
> > Yes and no. It's not intentional, but a side effect of hash
> > equivalency trying to make sure that the things it's marking as
> > equivalent can actually be found in sstate (basically, because sstate
> > include the commit hash, hash equivalency kinda has to include it).
>
> This all sounds a bit unfortunate.
>
> sstate only works as long as the filenames are predictable. Some
> elements of the sstate filenames are essential to operation, e.g. the
> package architecture since one input would result in multiple files
> with the same hash in the filename of the output otherwise. The recipe
> name and version are there mainly for debugging to allow someone to
> more easily know where an sstate object came from and what it
> represents. This is summarised by the comment in sstate.bbclass "Fields
> 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for information"
> in generate_sstatefn().
>
> When we added hash equivalence, we added the ability to equate the
> hashes but we'd not considered that the version string mismatch may
> stop significant artefact reuse. I suspect at the time we reasoned that
> if the version changes, the output probably does too.
>
> Sadly fixing this isn't simple. Changing the hash algorithm isn't
> enough, we need to stop the SRCREV part of PV being used in the sstate
> filename. If we stop that happening, the output hash algorithm may well
> "just work" at that point, I'm not sure if it directly encodes PV or
> just the sstate filename, hopefully the latter.

It's including SSTATE_PKGSPEC in the output hash calculation,
specifically so that a change in sstate filename changes the outhash
(that way, hash equivalence will never map two difference sstate files
as equivalent).

>
> The hard part is how to do this generically without adding a lot of
> complex and potentially fragile code. The datastore context in that
> function is the core configuration, not the recipe's datastore. The
> options I can think of offhand:
>
> a) Live with the issue
>
> b) Put a hack into generate_sstatefn() which changed the PV element if
> it matched a pattern but we'd have to do this for each SCM as needed.
> Ugly but lowest overhead.
>
> c) Indirect PV to SSTATEPV (or similar) and then alter SSTATEPV to drop
> SRCPV to a fixed string. Nicer code in some ways but horrible
> parsing/performance overhead since every recipe, even non-SCM ones
> would be affected.
>
> d) A partial version of c) where recipes can set SSTATEPV to a function
> if they need it. Solves your specific case with overhead without
> affecting everyone else. Would not solve the issue generally without
> manual user intervention.
>
> I'm not sure which of these will end up making the most sense. These
> assume the output hash code uses the sstate filename and not PV. If it
> uses PV there would be more work needed.

I'm not seeing where SRCPV or SRCREV are being explicitly added to
SSTATE_PKGSPEC; PV is added, but SRCPV or SRCREV would have to be
manually added to PV in the recipe itself for that to happen correct?
Maybe it's as simple as not doing that in these particular recipes?

>
> Cheers,
>
> Richard

