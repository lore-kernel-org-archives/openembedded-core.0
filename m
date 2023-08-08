Return-Path: <max.chichikalov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF94C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 13:16:20 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.61213.1691500576081974752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 06:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iqIg9vIq;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: max.chichikalov@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-406b9bcad5dso27940051cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691500575; x=1692105375;
        h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i1CgFicL62bVCu5ZK2IYknqPaXI7WgPlfftAZC7Jvls=;
        b=iqIg9vIqOv3tddCO1sS+m1+6SJ0w2dyW1mmlOCTZgxMM8tYzjMMM/orGvLL7kzuh+O
         +EA4daLeH9UPZCuvRYgTwJD+wu5+mURxNUBCf8RRHaMMOtN1qo/ryNnHno/2vuKT1x0e
         C4He59YQ6ggc6UKWDOOkEmmlYS+Ra/wr20wDnf9oJVAK3SlYxJTZc2UYRCn6L11NxpKY
         ooItLY6V3oAMQcT7qER5v/sDMdUPEtS9L0fNpCVzc4G+pZm4oHaJpnPeUQVnq4usQiqg
         KARQwP70OomwQxNHsak/+7vTPG9fAyxzEAWGQHgqqYo2iY5s8k/SOxsq14v6yHkWEZEr
         N4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691500575; x=1692105375;
        h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1CgFicL62bVCu5ZK2IYknqPaXI7WgPlfftAZC7Jvls=;
        b=LclskO5BKuxm6hper2OZkLBfOHZqZE9fkMpiomgAUL30ud8HoUKUlpqLMOx1p5MrvB
         8BhIHhNPJVCbtHWZea+zwiF8bJ++mmzZ0a/pagIofQIjs11vR7MZCkUBJo+z1aaN5+lh
         MDHFBWxG86L+pRAH4tDPSMCWRKlLQPkpGXu5P/fzU1TNYsMw5ts52ark8dnHonSAv9a3
         8pnR0euSZGU2YUMgcWyS34yxkso7NZVhPCVA/h4ljUseHxEJskCvf5+4GlE9pXXQiJL3
         ljNtnqoQPMuI/vs6jvYNIYV6WKA3j0EiL7oduEcvDEbI/gFpVdt/CB5L6JaLlbehgmCL
         HccA==
X-Gm-Message-State: AOJu0YwOGpEPMDnww1HGPDWwUSIMI3tdUzLjfIvX2qPo4cbAX1m6gmJN
	+xu2iOJwsJ/oOymLn82WI9LceqCsKPvzdg==
X-Google-Smtp-Source: AGHT+IFmt9tMM78u+9EJ5frH6eECNmkX2D2jYjpTlCeTZZTyvcgxGhwf2Fh3IRPMPFfGiAgs7fSqXA==
X-Received: by 2002:ac8:7f4f:0:b0:410:961:668d with SMTP id g15-20020ac87f4f000000b004100961668dmr6950711qtk.33.1691500574731;
        Tue, 08 Aug 2023 06:16:14 -0700 (PDT)
Received: from pc (bras-base-kntaon1618w-grc-10-184-145-9-208.dsl.bell.ca. [184.145.9.208])
        by smtp.gmail.com with ESMTPSA id i24-20020ac871d8000000b0040324785e4csm3323009qtp.13.2023.08.08.06.16.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Aug 2023 06:16:14 -0700 (PDT)
Date: Tue, 8 Aug 2023 09:16:04 -0400
From: Maksim Chichikalov <max.chichikalov@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Watt <jpewhacker@gmail.com>, OE-core
 <openembedded-core@lists.openembedded.org>
Message-ID: <948C41C8-5ED0-4E0D-8528-4C7DC4ABF1CA@getmailspring.com>
In-Reply-To: <36ea406443d78c9451096f9479df8a2317da45fa.camel@linuxfoundation.org>
References: <36ea406443d78c9451096f9479df8a2317da45fa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [OE] help with Equivalence Server
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="64d24014_73fe297d_8896b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 13:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185662

--64d24014_73fe297d_8896b
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

> On Mon, 2023-08-07 at 11:30 -0400, Maksim Chichikalov wrote:
> > > On Mon, Aug 7, 2023 at 8:41=E2=80=AFAM Maksim Chichikalov
> > > <max.chichikalov=40gmail.com> wrote:
> > > >
> > > > On Mon, Aug 7, 2023 at 4:01=E2=80=AFAM Richard Purdie
> > > > <richard.purdie=40linuxfoundation.org> wrote:
> > > > >
> > > > > On Sun, 2023-08-06 at 13:15 -0600, Joshua Watt wrote:
> > > > > > On Sat, Aug 5, 2023 at 7:54=E2=80=AFPM Maksim Chichikalov
> > > > > > <max.chichikalov=40gmail.com> wrote:
> > > > > > > My name is Max; nice to e-meet you. I need your help with
> > > > > > > Equivalence Server :)
> > > > > > > I watched your presentation on Youtube - it 100% helped me
> > > > > > > to
> > > > > > > understand the logic better and debug the issue we are
> > > > > > > facing.
> > > > > > > Thank you for all your input into OE development.
> > > > > > >
> > > > > > > I found in OE repo that you introduced =22def
> > > > > > > OEOuthashBasic()=22, so I
> > > > > > > decided to write to you first before opening the topic on
> > > > > > > an email
> > > > > > > list.
> > > > > > >
> > > > > > > The problem:
> > > > > > >
> > > > > > > Input data are propagated to the output hash generation
> > > > > > > function,
> > > > > > > which generates a different out-hash.
> > > > > > >
> > > > > > > Description:
> > > > > > >
> > > > > > > All =22=5Fgit.bb=22 recipes have to append SRCPV to PV. As =
a
> > > > > > > result, PV
> > > > > > > is different on each commit.
> > > > > > >
> > > > > > > The OEOuthashBasic function includes SSTATE=5FPKGSPEC to
> > > > > > > generate
> > > > > > > hash, which contains PV (PV contains git hash). As a
> > > > > > > result, there
> > > > > > > is no way to generate the same out-hash even if changes
> > > > > > > introduced
> > > > > > > within a commit were trivial.
> > > > > > >
> > > > > >
> > > > > > Right, this is sort of on purpose, because the hash
> > > > > > equivalence is
> > > > > > basically trying to say that an sstate object can be used in
> > > > > > place of
> > > > > > another one, even when the task hashes aren't the same (but
> > > > > > the
> > > > > > output hashes are). However, the sstate code itself will only=

> > > > > > look
> > > > > > for sstate object with a certain name (which include PV);
> > > > > > hash
> > > > > > equivalency does have =5Fsome=5F control over the file name
> > > > > > sstate looks
> > > > > > for, since it will replace the taskhash portion of the name
> > > > > > with the
> > > > > > unified hash, but it doesn't have complete control.
> > > > > >
> > > > > > >
> > > > > > > In our codebase, our components have API part, which is
> > > > > > > managed by
> > > > > > > an independent recipe per component. The described above
> > > > > > > problem
> > > > > > > caused the recompilation of all components dependent on
> > > > > > > API, even
> > > > > > > in cases when API was not changed. CI for pull requests
> > > > > > > recompiles
> > > > > > > mostly the entire code base, I need to do something with
> > > > > > > it.
> > > > > > > (sorry, quite hard for me to explain it in a nutshell, let
> > > > > > > me know
> > > > > > > if you like to know slightly more details)
> > > > > > >
> > > > > >
> > > > > > Ya, sounds like a typical mono-repo design=3F
> > > > > >
> > > > > > >
> > > > > > > I see a couple of options for us:
> > > > > > > * Add a custom implementation of out-hash generated
> > > > > > > function and
> > > > > > > overwrite SSTATE=5FHASHEQUIV=5FMETHOD.
> > > > > > > * Better understand why it's mandatory to append SRCPV to
> > > > > > > PV, and
> > > > > > > maybe it's flexible in our cases to do it.
> > > > > > >
> > > > > >
> > > > > > This might be the best option, at least for your recipes, but=

> > > > > > I've
> > > > > > CC'd the list for additional feedback
> > > > > >
> > > > > > > * Propose a patch to fix OEOuthashBasic().
> > > > > > >
> > > > > > > In my humble opinion, the commit's hash shouldn't be
> > > > > > > included in
> > > > > > > out-hash generation, it doesn't make sense. Unless I'm
> > > > > > > missing
> > > > > > > something important - What are your thoughts=3F
> > > > > > >
> > > > > >
> > > > > > Yes and no. It's not intentional, but a side effect of hash
> > > > > > equivalency trying to make sure that the things it's marking
> > > > > > as
> > > > > > equivalent can actually be found in sstate (basically,
> > > > > > because sstate
> > > > > > include the commit hash, hash equivalency kinda has to
> > > > > > include it).
> > > > >
> > > > > This all sounds a bit unfortunate.
> > > > >
> > > > > sstate only works as long as the filenames are predictable.
> > > > > Some
> > > > > elements of the sstate filenames are essential to operation,
> > > > > e.g. the
> > > > > package architecture since one input would result in multiple
> > > > > files
> > > > > with the same hash in the filename of the output otherwise. The=

> > > > > recipe
> > > > > name and version are there mainly for debugging to allow
> > > > > someone to
> > > > > more easily know where an sstate object came from and what it
> > > > > represents. This is summarised by the comment in sstate.bbclass=

> > > > > =22=46ields
> > > > > 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for
> > > > > information=22
> > > > > in generate=5Fsstatefn().
> > > > >
> > > > > When we added hash equivalence, we added the ability to equate
> > > > > the
> > > > > hashes but we'd not considered that the version string mismatch=

> > > > > may
> > > > > stop significant artefact reuse. I suspect at the time we
> > > > > reasoned that
> > > > > if the version changes, the output probably does too.
> > > > >
> > > > > Sadly fixing this isn't simple. Changing the hash algorithm
> > > > > isn't
> > > > > enough, we need to stop the SRCREV part of PV being used in the=

> > > > > sstate
> > > > > filename. If we stop that happening, the output hash algorithm
> > > > > may well
> > > > > =22just work=22 at that point, I'm not sure if it directly enco=
des
> > > > > PV or
> > > > > just the sstate filename, hopefully the latter.
> > > >
> > > > It's including SSTATE=5FPKGSPEC in the output hash calculation,
> > > > specifically so that a change in sstate filename changes the
> > > > outhash
> > > > (that way, hash equivalence will never map two difference sstate
> > > > files
> > > > as equivalent).
> > > >
> > > > >
> > > > > The hard part is how to do this generically without adding a
> > > > > lot of
> > > > > complex and potentially fragile code. The datastore context in
> > > > > that
> > > > > function is the core configuration, not the recipe's datastore.=

> > > > > The
> > > > > options I can think of offhand:
> > > > >
> > > > > a) Live with the issue
> > > > >
> > > > > b) Put a hack into generate=5Fsstatefn() which changed the PV
> > > > > element if
> > > > > it matched a pattern but we'd have to do this for each SCM as
> > > > > needed.
> > > > > Ugly but lowest overhead.
> > > > >
> > > > > c) Indirect PV to SSTATEPV (or similar) and then alter SSTATEPV=

> > > > > to drop
> > > > > SRCPV to a fixed string. Nicer code in some ways but horrible
> > > > > parsing/performance overhead since every recipe, even non-SCM
> > > > > ones
> > > > > would be affected.
> > > > >
> > > > > d) A partial version of c) where recipes can set SSTATEPV to a
> > > > > function
> > > > > if they need it. Solves your specific case with overhead
> > > > > without
> > > > > affecting everyone else. Would not solve the issue generally
> > > > > without
> > > > > manual user intervention.
> > > > >
> > > > > I'm not sure which of these will end up making the most sense.
> > > > > These
> > > > > assume the output hash code uses the sstate filename and not
> > > > > PV. If it
> > > > > uses PV there would be more work needed.
> > > >
> > > > I'm not seeing where SRCPV or SRCREV are being explicitly added
> > > > to
> > > > SSTATE=5FPKGSPEC; PV is added, but SRCPV or SRCREV would have to =
be
> > > > manually added to PV in the recipe itself for that to happen
> > > > correct=3F
> > > > Maybe it's as simple as not doing that in these particular
> > > > recipes=3F
> > > >
> > > >
> > > > What are pitfalls of not adding SRCPV to PV for packages with
> > > > SRCREV:=24=7BPN=7D =3D =24=7BAUTOREV=7D=3F Is it recommended just=
 for improving
> > > > traceability and debugging=3F
> > > >
> > > > When I remove, bitbake is not happy - for example: if I remove
> > > > explicit addition of SRCPV, the bitbake throws the following
> > > > exception (need to dig deeper tp figure out why it happens only
> > > > for certain packages)
> > > >
> > > > raise bb.fetch2.=46etchError(=22Recipe uses a floating tag/branch=

> > > > without a fixed SRCREV yet doesn't call bb.fetch2.get=5Fsrcrev()
> > > > (use SRCPV in PV for OE).=22)
> > >
> > > Ah, I didn't realize you were using AUTOREV; I would recommend not
> > > doing that and instead manually specifying the SRCREV you want to
> > > build from instead; aside from giving a more reproducible history,
> > > I
> > > think it means you can remove SRCPV from PV and hash equivalency
> > > will
> > > work
> > >
> > > At my =24DAYJOB, we don't use AUTOREV. Instead, we have a (rather
> > > dumb)
> > > script that makes a commit to update the SRCREV to match the
> > > current
> > > head revision of the BRANCH specified in a recipe. We run this
> > > every
> > > night for recipes where we want AUTOREV-like behavior. Upstream
> > > also
> > > has the Auto-Upgrade-Helper (AUH) that does something similar if
> > > you
> > > want to look at that too.
> >
> > TY Joshua=21
> > AUTOREV is in use for pull request builds, when a package(s -> multi
> > PR builds) should be built from the latest commit of the specific
> > branch. I don't think we can stop using it, unless we add some
> > mechanism of setting SRCREV to hash of the latest commit on each
> > build invocation.
> >
> > Richard, what are your thoughts about:
> > * What are pitfalls of not adding SRCPV to PV for packages with
> > SRCREV:=24=7BPN=7D =3D =24=7BAUTOREV=7D=3F
>
> If you don't add SRCREV (via SRCPV) to PV, PV doesn't change when the
> source control revision changes.
>
> If the version doesn't change, how does bitbake know to rebuild=3F How =
do
> packages get the right version in them so upgrades work=3F
>
> I guess in modern times with hashes in task stamps, SRCREV can be
> included directly into the task hashes so that part of this
> functionality is partly obsolete. Reworking things to adapt to that
> would be interesting but a fair amount of change/work.
>
> > * Is it recommended just for improving traceability and debugging,
> > or it has some bitabke/OE business logic implication=3F
>
> As it stands today, it is relied upon to trigger rebuilds with a number=

> of follow on expectations.
>
> I'm not against changing this as when I step back and think about it,
> the reasoning for some of what we do is obsolete and we have better
> mechanisms for it now. It will be a lot of work to change though.
>
> Cheers,
> Richard

Richard, Joshua, thank you so much for being responsive and helping to un=
derstand the situation better. I need time to grasp it, consult with my c=
olleagues, and decide how to overcome it.
J=46YI, I observed it, and was under the impression that bitbake rebuilds=
 even if SRCPV is not part of PV for packages using AUTORV. Because of it=
, I decided to try it out, and yes, bitbake fetches updated code (new com=
mits) and recompiling package - not sure how it works and what informatio=
n it's using :) Based on details you shared above, it shouldn't. Maybe it=
's some sort of side effect of something else in my environment.
Decided to share it with you.

I have a question about the discussion above - Do you guys want me to cre=
ate a bug in the Bugzila=3F
BR,
Max


--64d24014_73fe297d_8896b
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<blockquote><div><div>On Mon, 2023-08-07 at 11:30 -0400, Maksim Chichikal=
ov wrote:</div><div>&gt; &gt; On Mon, Aug 7, 2023 at 8:41=E2=80=AFAM Maks=
im Chichikalov</div><div>&gt; &gt; &lt;max.chichikalov=40gmail.com&gt; wr=
ote:</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; On Mon, Aug 7, 202=
3 at 4:01=E2=80=AFAM Richard Purdie</div><div>&gt; &gt; &gt; &lt;richard.=
purdie=40linuxfoundation.org&gt; wrote:</div><div>&gt; &gt; &gt; &gt;</di=
v><div>&gt; &gt; &gt; &gt; On Sun, 2023-08-06 at 13:15 -0600, Joshua Watt=
 wrote:</div><div>&gt; &gt; &gt; &gt; &gt; On Sat, Aug 5, 2023 at 7:54=E2=
=80=AFPM Maksim Chichikalov</div><div>&gt; &gt; &gt; &gt; &gt; &lt;max.ch=
ichikalov=40gmail.com&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt; &gt; =
My name is Max; nice to e-meet you. I need your help with</div><div>&gt; =
&gt; &gt; &gt; &gt; &gt; Equivalence Server :)</div><div>&gt; &gt; &gt; &=
gt; &gt; &gt; I watched your presentation on Youtube - it 100% helped me<=
/div><div>&gt; &gt; &gt; &gt; &gt; &gt; to</div><div>&gt; &gt; &gt; &gt; =
&gt; &gt; understand the logic better and debug the issue we are</div><di=
v>&gt; &gt; &gt; &gt; &gt; &gt; facing.</div><div>&gt; &gt; &gt; &gt; &gt=
; &gt; Thank you for all your input into OE development.</div><div>&gt; &=
gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; I found i=
n OE repo that you introduced =22def</div><div>&gt; &gt; &gt; &gt; &gt; &=
gt; OEOuthashBasic()=22, so I</div><div>&gt; &gt; &gt; &gt; &gt; &gt; dec=
ided to write to you first before opening the topic on</div><div>&gt; &gt=
; &gt; &gt; &gt; &gt; an email</div><div>&gt; &gt; &gt; &gt; &gt; &gt; li=
st.</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt;=
 &gt; &gt; The problem:</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div=
>&gt; &gt; &gt; &gt; &gt; &gt; Input data are propagated to the output ha=
sh generation</div><div>&gt; &gt; &gt; &gt; &gt; &gt; function,</div><div=
>&gt; &gt; &gt; &gt; &gt; &gt; which generates a different out-hash.</div=
><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &g=
t; Description:</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &g=
t; &gt; &gt; &gt; &gt; All =22=5Fgit.bb=22 recipes have to append SRCPV t=
o PV. As a</div><div>&gt; &gt; &gt; &gt; &gt; &gt; result, PV</div><div>&=
gt; &gt; &gt; &gt; &gt; &gt; is different on each commit.</div><div>&gt; =
&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; The OEOu=
thashBasic function includes SSTATE=5FPKGSPEC to</div><div>&gt; &gt; &gt;=
 &gt; &gt; &gt; generate</div><div>&gt; &gt; &gt; &gt; &gt; &gt; hash, wh=
ich contains PV (PV contains git hash). As a</div><div>&gt; &gt; &gt; &gt=
; &gt; &gt; result, there</div><div>&gt; &gt; &gt; &gt; &gt; &gt; is no w=
ay to generate the same out-hash even if changes</div><div>&gt; &gt; &gt;=
 &gt; &gt; &gt; introduced</div><div>&gt; &gt; &gt; &gt; &gt; &gt; within=
 a commit were trivial.</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div=
>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; Right, this =
is sort of on purpose, because the hash</div><div>&gt; &gt; &gt; &gt; &gt=
; equivalence is</div><div>&gt; &gt; &gt; &gt; &gt; basically trying to s=
ay that an sstate object can be used in</div><div>&gt; &gt; &gt; &gt; &gt=
; place of</div><div>&gt; &gt; &gt; &gt; &gt; another one, even when the =
task hashes aren't the same (but</div><div>&gt; &gt; &gt; &gt; &gt; the</=
div><div>&gt; &gt; &gt; &gt; &gt; output hashes are). However, the sstate=
 code itself will only</div><div>&gt; &gt; &gt; &gt; &gt; look</div><div>=
&gt; &gt; &gt; &gt; &gt; for sstate object with a certain name (which inc=
lude PV);</div><div>&gt; &gt; &gt; &gt; &gt; hash</div><div>&gt; &gt; &gt=
; &gt; &gt; equivalency does have =5Fsome=5F control over the file name</=
div><div>&gt; &gt; &gt; &gt; &gt; sstate looks</div><div>&gt; &gt; &gt; &=
gt; &gt; for, since it will replace the taskhash portion of the name</div=
><div>&gt; &gt; &gt; &gt; &gt; with the</div><div>&gt; &gt; &gt; &gt; &gt=
; unified hash, but it doesn't have complete control.</div><div>&gt; &gt;=
 &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &g=
t; &gt; &gt; &gt; &gt; In our codebase, our components have API part, whi=
ch is</div><div>&gt; &gt; &gt; &gt; &gt; &gt; managed by</div><div>&gt; &=
gt; &gt; &gt; &gt; &gt; an independent recipe per component. The describe=
d above</div><div>&gt; &gt; &gt; &gt; &gt; &gt; problem</div><div>&gt; &g=
t; &gt; &gt; &gt; &gt; caused the recompilation of all components depende=
nt on</div><div>&gt; &gt; &gt; &gt; &gt; &gt; API, even</div><div>&gt; &g=
t; &gt; &gt; &gt; &gt; in cases when API was not changed. CI for pull req=
uests</div><div>&gt; &gt; &gt; &gt; &gt; &gt; recompiles</div><div>&gt; &=
gt; &gt; &gt; &gt; &gt; mostly the entire code base, I need to do somethi=
ng with</div><div>&gt; &gt; &gt; &gt; &gt; &gt; it.</div><div>&gt; &gt; &=
gt; &gt; &gt; &gt; (sorry, quite hard for me to explain it in a nutshell,=
 let</div><div>&gt; &gt; &gt; &gt; &gt; &gt; me know</div><div>&gt; &gt; =
&gt; &gt; &gt; &gt; if you like to know slightly more details)</div><div>=
&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt;</div><di=
v>&gt; &gt; &gt; &gt; &gt; Ya, sounds like a typical mono-repo design=3F<=
/div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt=
;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; I see a couple of options for u=
s:</div><div>&gt; &gt; &gt; &gt; &gt; &gt; * Add a custom implementation =
of out-hash generated</div><div>&gt; &gt; &gt; &gt; &gt; &gt; function an=
d</div><div>&gt; &gt; &gt; &gt; &gt; &gt; overwrite SSTATE=5FHASHEQUIV=5F=
METHOD.</div><div>&gt; &gt; &gt; &gt; &gt; &gt; * Better understand why i=
t's mandatory to append SRCPV to</div><div>&gt; &gt; &gt; &gt; &gt; &gt; =
PV, and</div><div>&gt; &gt; &gt; &gt; &gt; &gt; maybe it's flexible in ou=
r cases to do it.</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; =
&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; This might be the =
best option, at least for your recipes, but</div><div>&gt; &gt; &gt; &gt;=
 &gt; I've</div><div>&gt; &gt; &gt; &gt; &gt; CC'd the list for additiona=
l feedback</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &g=
t; &gt; &gt; * Propose a patch to fix OEOuthashBasic().</div><div>&gt; &g=
t; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; In my humb=
le opinion, the commit's hash shouldn't be</div><div>&gt; &gt; &gt; &gt; =
&gt; &gt; included in</div><div>&gt; &gt; &gt; &gt; &gt; &gt; out-hash ge=
neration, it doesn't make sense. Unless I'm</div><div>&gt; &gt; &gt; &gt;=
 &gt; &gt; missing</div><div>&gt; &gt; &gt; &gt; &gt; &gt; something impo=
rtant - What are your thoughts=3F</div><div>&gt; &gt; &gt; &gt; &gt; &gt;=
</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; Ye=
s and no. It's not intentional, but a side effect of hash</div><div>&gt; =
&gt; &gt; &gt; &gt; equivalency trying to make sure that the things it's =
marking</div><div>&gt; &gt; &gt; &gt; &gt; as</div><div>&gt; &gt; &gt; &g=
t; &gt; equivalent can actually be found in sstate (basically,</div><div>=
&gt; &gt; &gt; &gt; &gt; because sstate</div><div>&gt; &gt; &gt; &gt; &gt=
; include the commit hash, hash equivalency kinda has to</div><div>&gt; &=
gt; &gt; &gt; &gt; include it).</div><div>&gt; &gt; &gt; &gt;</div><div>&=
gt; &gt; &gt; &gt; This all sounds a bit unfortunate.</div><div>&gt; &gt;=
 &gt; &gt;</div><div>&gt; &gt; &gt; &gt; sstate only works as long as the=
 filenames are predictable.</div><div>&gt; &gt; &gt; &gt; Some</div><div>=
&gt; &gt; &gt; &gt; elements of the sstate filenames are essential to ope=
ration,</div><div>&gt; &gt; &gt; &gt; e.g. the</div><div>&gt; &gt; &gt; &=
gt; package architecture since one input would result in multiple</div><d=
iv>&gt; &gt; &gt; &gt; files</div><div>&gt; &gt; &gt; &gt; with the same =
hash in the filename of the output otherwise. The</div><div>&gt; &gt; &gt=
; &gt; recipe</div><div>&gt; &gt; &gt; &gt; name and version are there ma=
inly for debugging to allow</div><div>&gt; &gt; &gt; &gt; someone to</div=
><div>&gt; &gt; &gt; &gt; more easily know where an sstate object came fr=
om and what it</div><div>&gt; &gt; &gt; &gt; represents. This is summaris=
ed by the comment in sstate.bbclass</div><div>&gt; &gt; &gt; &gt; =22=46i=
elds</div><div>&gt; &gt; &gt; &gt; 0,5,6 are mandatory, 1 is most useful,=
 2,3,4 are just for</div><div>&gt; &gt; &gt; &gt; information=22</div><di=
v>&gt; &gt; &gt; &gt; in generate=5Fsstatefn().</div><div>&gt; &gt; &gt; =
&gt;</div><div>&gt; &gt; &gt; &gt; When we added hash equivalence, we add=
ed the ability to equate</div><div>&gt; &gt; &gt; &gt; the</div><div>&gt;=
 &gt; &gt; &gt; hashes but we'd not considered that the version string mi=
smatch</div><div>&gt; &gt; &gt; &gt; may</div><div>&gt; &gt; &gt; &gt; st=
op significant artefact reuse. I suspect at the time we</div><div>&gt; &g=
t; &gt; &gt; reasoned that</div><div>&gt; &gt; &gt; &gt; if the version c=
hanges, the output probably does too.</div><div>&gt; &gt; &gt; &gt;</div>=
<div>&gt; &gt; &gt; &gt; Sadly fixing this isn't simple. Changing the has=
h algorithm</div><div>&gt; &gt; &gt; &gt; isn't</div><div>&gt; &gt; &gt; =
&gt; enough, we need to stop the SRCREV part of PV being used in the</div=
><div>&gt; &gt; &gt; &gt; sstate</div><div>&gt; &gt; &gt; &gt; filename. =
If we stop that happening, the output hash algorithm</div><div>&gt; &gt; =
&gt; &gt; may well</div><div>&gt; &gt; &gt; &gt; =22just work=22 at that =
point, I'm not sure if it directly encodes</div><div>&gt; &gt; &gt; &gt; =
PV or</div><div>&gt; &gt; &gt; &gt; just the sstate filename, hopefully t=
he latter.</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; It's includi=
ng SSTATE=5FPKGSPEC in the output hash calculation,</div><div>&gt; &gt; &=
gt; specifically so that a change in sstate filename changes the</div><di=
v>&gt; &gt; &gt; outhash</div><div>&gt; &gt; &gt; (that way, hash equival=
ence will never map two difference sstate</div><div>&gt; &gt; &gt; files<=
/div><div>&gt; &gt; &gt; as equivalent).</div><div>&gt; &gt; &gt;</div><d=
iv>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; The hard part is how=
 to do this generically without adding a</div><div>&gt; &gt; &gt; &gt; lo=
t of</div><div>&gt; &gt; &gt; &gt; complex and potentially fragile code. =
The datastore context in</div><div>&gt; &gt; &gt; &gt; that</div><div>&gt=
; &gt; &gt; &gt; function is the core configuration, not the recipe's dat=
astore.</div><div>&gt; &gt; &gt; &gt; The</div><div>&gt; &gt; &gt; &gt; o=
ptions I can think of offhand:</div><div>&gt; &gt; &gt; &gt;</div><div>&g=
t; &gt; &gt; &gt; a) Live with the issue</div><div>&gt; &gt; &gt; &gt;</d=
iv><div>&gt; &gt; &gt; &gt; b) Put a hack into generate=5Fsstatefn() whic=
h changed the PV</div><div>&gt; &gt; &gt; &gt; element if</div><div>&gt; =
&gt; &gt; &gt; it matched a pattern but we'd have to do this for each SCM=
 as</div><div>&gt; &gt; &gt; &gt; needed.</div><div>&gt; &gt; &gt; &gt; U=
gly but lowest overhead.</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt=
; &gt; &gt; c) Indirect PV to SSTATEPV (or similar) and then alter SSTATE=
PV</div><div>&gt; &gt; &gt; &gt; to drop</div><div>&gt; &gt; &gt; &gt; SR=
CPV to a fixed string. Nicer code in some ways but horrible</div><div>&gt=
; &gt; &gt; &gt; parsing/performance overhead since every recipe, even no=
n-SCM</div><div>&gt; &gt; &gt; &gt; ones</div><div>&gt; &gt; &gt; &gt; wo=
uld be affected.</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &=
gt; d) A partial version of c) where recipes can set SSTATEPV to a</div><=
div>&gt; &gt; &gt; &gt; function</div><div>&gt; &gt; &gt; &gt; if they ne=
ed it. Solves your specific case with overhead</div><div>&gt; &gt; &gt; &=
gt; without</div><div>&gt; &gt; &gt; &gt; affecting everyone else. Would =
not solve the issue generally</div><div>&gt; &gt; &gt; &gt; without</div>=
<div>&gt; &gt; &gt; &gt; manual user intervention.</div><div>&gt; &gt; &g=
t; &gt;</div><div>&gt; &gt; &gt; &gt; I'm not sure which of these will en=
d up making the most sense.</div><div>&gt; &gt; &gt; &gt; These</div><div=
>&gt; &gt; &gt; &gt; assume the output hash code uses the sstate filename=
 and not</div><div>&gt; &gt; &gt; &gt; PV. If it</div><div>&gt; &gt; &gt;=
 &gt; uses PV there would be more work needed.</div><div>&gt; &gt; &gt;</=
div><div>&gt; &gt; &gt; I'm not seeing where SRCPV or SRCREV are being ex=
plicitly added</div><div>&gt; &gt; &gt; to</div><div>&gt; &gt; &gt; SSTAT=
E=5FPKGSPEC; PV is added, but SRCPV or SRCREV would have to be</div><div>=
&gt; &gt; &gt; manually added to PV in the recipe itself for that to happ=
en</div><div>&gt; &gt; &gt; correct=3F</div><div>&gt; &gt; &gt; Maybe it'=
s as simple as not doing that in these particular</div><div>&gt; &gt; &gt=
; recipes=3F</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt;</div><div>=
&gt; &gt; &gt; What are pitfalls of not adding SRCPV to PV for packages w=
ith</div><div>&gt; &gt; &gt; SRCREV:=24=7BPN=7D =3D =24=7BAUTOREV=7D=3F I=
s it recommended just for improving</div><div>&gt; &gt; &gt; traceability=
 and debugging=3F</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; When =
I remove, bitbake is not happy - for example: if I remove</div><div>&gt; =
&gt; &gt; explicit addition of SRCPV, the bitbake throws the following</d=
iv><div>&gt; &gt; &gt; exception (need to dig deeper tp figure out why it=
 happens only</div><div>&gt; &gt; &gt; for certain packages)</div><div>&g=
t; &gt; &gt;</div><div>&gt; &gt; &gt; raise bb.fetch2.=46etchError(=22Rec=
ipe uses a floating tag/branch</div><div>&gt; &gt; &gt; without a fixed S=
RCREV yet doesn't call bb.fetch2.get=5Fsrcrev()</div><div>&gt; &gt; &gt; =
(use SRCPV in PV for OE).=22)</div><div>&gt; &gt;</div><div>&gt; &gt; Ah,=
 I didn't realize you were using AUTOREV; I would recommend not</div><div=
>&gt; &gt; doing that and instead manually specifying the SRCREV you want=
 to</div><div>&gt; &gt; build from instead; aside from giving a more repr=
oducible history,</div><div>&gt; &gt; I</div><div>&gt; &gt; think it mean=
s you can remove SRCPV from PV and hash equivalency</div><div>&gt; &gt; w=
ill</div><div>&gt; &gt; work</div><div>&gt; &gt;</div><div>&gt; &gt; At m=
y =24DAYJOB, we don't use AUTOREV. Instead, we have a (rather</div><div>&=
gt; &gt; dumb)</div><div>&gt; &gt; script that makes a commit to update t=
he SRCREV to match the</div><div>&gt; &gt; current</div><div>&gt; &gt; he=
ad revision of the BRANCH specified in a recipe. We run this</div><div>&g=
t; &gt; every</div><div>&gt; &gt; night for recipes where we want AUTOREV=
-like behavior. Upstream</div><div>&gt; &gt; also</div><div>&gt; &gt; has=
 the Auto-Upgrade-Helper (AUH) that does something similar if</div><div>&=
gt; &gt; you</div><div>&gt; &gt; want to look at that too.</div><div>&gt;=
</div><div>&gt; TY Joshua=21</div><div>&gt; AUTOREV is in use for pull re=
quest builds, when a package(s -&gt; multi</div><div>&gt; PR builds) shou=
ld be built from the latest commit of the specific</div><div>&gt; branch.=
 I don't think we can stop using it, unless we add some</div><div>&gt; me=
chanism of setting SRCREV to hash of the latest commit on each</div><div>=
&gt; build invocation.</div><div>&gt;</div><div>&gt; Richard, what are yo=
ur thoughts about:</div><div>&gt; &nbsp;* What are pitfalls of not adding=
 SRCPV to PV for packages with</div><div>&gt; SRCREV:=24=7BPN=7D =3D =24=7B=
AUTOREV=7D=3F</div><br><div>If you don't add SRCREV (via SRCPV) to PV, PV=
 doesn't change when the</div><div>source control revision changes.</div>=
<br><div>If the version doesn't change, how does bitbake know to rebuild=3F=
 How do</div><div>packages get the right version in them so upgrades work=
=3F</div><br><div>I guess in modern times with hashes in task stamps, SRC=
REV can be</div><div>included directly into the task hashes so that part =
of this</div><div>functionality is partly obsolete. Reworking things to a=
dapt to that</div><div>would be interesting but a fair amount of change/w=
ork.</div><br><div>&gt; &nbsp;* Is it recommended just for improving trac=
eability and debugging,</div><div>&gt; or it has some bitabke/OE business=
 logic implication=3F</div><br><div>As it stands today, it is relied upon=
 to trigger rebuilds with a number</div><div>of follow on expectations.</=
div><br><div>I'm not against changing this as when I step back and think =
about it,</div><div>the reasoning for some of what we do is obsolete and =
we have better</div><div>mechanisms for it now. It will be a lot of work =
to change though.</div><br><div>Cheers,</div><br><div>Richard</div></div>=
</blockquote><div><br><div>Richard, Joshua, thank you so much for being r=
esponsive and helping to understand the situation better. I need time to =
grasp it, consult with my colleagues, and decide how to overcome it.</div=
><br><div>J=46YI, I observed it, and was under the impression that bitbak=
e rebuilds even if SRCPV is not part of PV for packages using AUTORV. Bec=
ause of it, I decided to try it out, and yes, bitbake fetches updated cod=
e (new commits) and recompiling package - not sure how it works and what =
information it's using :) Based on details you shared above, it shouldn't=
. Maybe it's some sort of side effect of something else in my environment=
.</div><div>Decided to share it with you.</div><br><div>I have a question=
 about the discussion above - Do you guys want me to create a bug in the =
Bugzila=3F</div><br><div>BR,</div><div>Max</div></div><img class=3D=22mai=
lspring-open=22 alt=3D=22Sent from Mailspring=22 width=3D=220=22 height=3D=
=220=22 style=3D=22border:0; width:0; height:0;=22 src=3D=22https://link.=
getmailspring.com/open/948C41C8-5ED0-4E0D-8528-4C7DC4AB=461CA=40getmailsp=
ring.com=3Fme=3Ddf8223ac&amp;recipient=3Db3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu=
b3BlbmVtYmVkZGVkLm9yZw%3D%3D=22>
--64d24014_73fe297d_8896b--


