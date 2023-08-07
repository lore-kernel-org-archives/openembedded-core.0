Return-Path: <max.chichikalov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B905C001B0
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 14:41:33 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.36242.1691419289883859670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 07:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BZdk0A0m;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: max.chichikalov@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-63cf8754d95so19895506d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691419289; x=1692024089;
        h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1yxRb4xvUqur49cGhknBcbmD3d1JpKJ4jPywFdHyR4o=;
        b=BZdk0A0mG1CqnSJbUO1BJ3PdJ4HPLPUNj9GUc+XJ/aDhLZvr/Sb09Qsden4O7nXguM
         FqtRPXycgV1ik7ArwlXZFgIsChFJS9CXytaV4IIWKG+si36it9KW0Fi/GI3ZJRVgWQqT
         uPzAoT+yT3qRKFTP5aWC4o9SEos/hl22uEp9CGAFGGCWiqsC3XX2QfETWncIIQxMyDCe
         VhmkAhsVVb8AWI9CkkWrCtarOnxm/iGt7/js8h9bWwSjntxBYcrFKRcw+Ql33xGV3MTp
         l9tj+UzahL2EzM2MIfByMCo00gF/qmwkyTNBInauOKVpBjbEybN6Z1d0ThcJw+iuYNZ8
         IdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691419289; x=1692024089;
        h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yxRb4xvUqur49cGhknBcbmD3d1JpKJ4jPywFdHyR4o=;
        b=Kvrq6mWt2sXKhX2FDhSL4aXKCmOvaHn3ZH4JUwLZmm2761Yx26NE60SqstKfOUgPoT
         bk4Rj9GmMBXtP51Dw8BG4PQs/6saSDgBzt/h4dza6CPvV3/W/mEXDN8gaeXJjv1arexF
         F1TM5BpDTAlSzax3xwyEYO7+C3JiMK76OBzFxExI9FtZiPTCMrgzI9halRqdQDAx3rh3
         wcQVpht/xT4StWyxFMm3nfIUpOj410nUpitdfoduSuDK8hyNRr1XmQjvwqtCwFwjvtwd
         nq723aufmKqOaa34ayqAA/f8eASTfrAKCJPWUq86F14bWu9rIvuN4lV7slfIBknzhJ2/
         CJVQ==
X-Gm-Message-State: AOJu0YzHvYoMIS468v4tq92jXv3htTkY8oLNVEwuzZYggQPmDGchjfZW
	TkzNwxLGc6dth7mGpTG/leM=
X-Google-Smtp-Source: AGHT+IEX98qdw1pvQUVa7aQlyyrcPGqBhfcrrQhwPgS1kMxxjRL3eSBrwmY+g4qRFKdA0f2bCPSCiA==
X-Received: by 2002:ad4:4b2d:0:b0:63d:555:8cc6 with SMTP id s13-20020ad44b2d000000b0063d05558cc6mr6077898qvw.26.1691419288758;
        Mon, 07 Aug 2023 07:41:28 -0700 (PDT)
Received: from pc ([184.145.9.208])
        by smtp.gmail.com with ESMTPSA id m14-20020a0cf18e000000b0063d561ea04csm2837001qvl.102.2023.08.07.07.41.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 07:41:28 -0700 (PDT)
Date: Mon, 7 Aug 2023 10:41:19 -0400
From: Maksim Chichikalov <max.chichikalov@gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, OE-core
 <openembedded-core@lists.openembedded.org>
Message-ID: <C4B694B2-1129-492D-AE08-56FBF0A211D1@getmailspring.com>
In-Reply-To: <CAJdd5GZAuucvChGKA1VyRwh6bWLmi1O0RB_LA3x+kq4M5s0o-g@mail.gmail.com>
References: <CAJdd5GZAuucvChGKA1VyRwh6bWLmi1O0RB_LA3x+kq4M5s0o-g@mail.gmail.com>
Subject: Re: [OE-core] [OE] help with Equivalence Server
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="64d1028f_76f35057_80507"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 14:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185605

--64d1028f_76f35057_80507
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

> On Mon, Aug 7, 2023 at 4:01=E2=80=AFAM Richard Purdie
> <richard.purdie=40linuxfoundation.org> wrote:
> >
> > On Sun, 2023-08-06 at 13:15 -0600, Joshua Watt wrote:
> > > On Sat, Aug 5, 2023 at 7:54=E2=80=AFPM Maksim Chichikalov
> > > <max.chichikalov=40gmail.com> wrote:
> > > > My name is Max; nice to e-meet you. I need your help with
> > > > Equivalence Server :)
> > > > I watched your presentation on Youtube - it 100% helped me to
> > > > understand the logic better and debug the issue we are facing.
> > > > Thank you for all your input into OE development.
> > > >
> > > > I found in OE repo that you introduced =22def OEOuthashBasic()=22=
, so I
> > > > decided to write to you first before opening the topic on an emai=
l
> > > > list.
> > > >
> > > > The problem:
> > > >
> > > > Input data are propagated to the output hash generation function,=

> > > > which generates a different out-hash.
> > > >
> > > > Description:
> > > >
> > > > All =22=5Fgit.bb=22 recipes have to append SRCPV to PV. As a resu=
lt, PV
> > > > is different on each commit.
> > > >
> > > > The OEOuthashBasic function includes SSTATE=5FPKGSPEC to generate=

> > > > hash, which contains PV (PV contains git hash). As a result, ther=
e
> > > > is no way to generate the same out-hash even if changes introduce=
d
> > > > within a commit were trivial.
> > > >
> > >
> > > Right, this is sort of on purpose, because the hash equivalence is
> > > basically trying to say that an sstate object can be used in place =
of
> > > another one, even when the task hashes aren't the same (but the
> > > output hashes are). However, the sstate code itself will only look
> > > for sstate object with a certain name (which include PV); hash
> > > equivalency does have =5Fsome=5F control over the file name sstate =
looks
> > > for, since it will replace the taskhash portion of the name with th=
e
> > > unified hash, but it doesn't have complete control.
> > >
> > > >
> > > > In our codebase, our components have API part, which is managed b=
y
> > > > an independent recipe per component. The described above problem
> > > > caused the recompilation of all components dependent on API, even=

> > > > in cases when API was not changed. CI for pull requests recompile=
s
> > > > mostly the entire code base, I need to do something with it.
> > > > (sorry, quite hard for me to explain it in a nutshell, let me kno=
w
> > > > if you like to know slightly more details)
> > > >
> > >
> > > Ya, sounds like a typical mono-repo design=3F
> > >
> > > >
> > > > I see a couple of options for us:
> > > > * Add a custom implementation of out-hash generated function and
> > > > overwrite SSTATE=5FHASHEQUIV=5FMETHOD.
> > > > * Better understand why it's mandatory to append SRCPV to PV, and=

> > > > maybe it's flexible in our cases to do it.
> > > >
> > >
> > > This might be the best option, at least for your recipes, but I've
> > > CC'd the list for additional feedback
> > >
> > > > * Propose a patch to fix OEOuthashBasic().
> > > >
> > > > In my humble opinion, the commit's hash shouldn't be included in
> > > > out-hash generation, it doesn't make sense. Unless I'm missing
> > > > something important - What are your thoughts=3F
> > > >
> > >
> > > Yes and no. It's not intentional, but a side effect of hash
> > > equivalency trying to make sure that the things it's marking as
> > > equivalent can actually be found in sstate (basically, because ssta=
te
> > > include the commit hash, hash equivalency kinda has to include it).=

> >
> > This all sounds a bit unfortunate.
> >
> > sstate only works as long as the filenames are predictable. Some
> > elements of the sstate filenames are essential to operation, e.g. the=

> > package architecture since one input would result in multiple files
> > with the same hash in the filename of the output otherwise. The recip=
e
> > name and version are there mainly for debugging to allow someone to
> > more easily know where an sstate object came from and what it
> > represents. This is summarised by the comment in sstate.bbclass =22=46=
ields
> > 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for information=
=22
> > in generate=5Fsstatefn().
> >
> > When we added hash equivalence, we added the ability to equate the
> > hashes but we'd not considered that the version string mismatch may
> > stop significant artefact reuse. I suspect at the time we reasoned th=
at
> > if the version changes, the output probably does too.
> >
> > Sadly fixing this isn't simple. Changing the hash algorithm isn't
> > enough, we need to stop the SRCREV part of PV being used in the sstat=
e
> > filename. If we stop that happening, the output hash algorithm may we=
ll
> > =22just work=22 at that point, I'm not sure if it directly encodes PV=
 or
> > just the sstate filename, hopefully the latter.
>
> It's including SSTATE=5FPKGSPEC in the output hash calculation,
> specifically so that a change in sstate filename changes the outhash
> (that way, hash equivalence will never map two difference sstate files
> as equivalent).
>
> >
> > The hard part is how to do this generically without adding a lot of
> > complex and potentially fragile code. The datastore context in that
> > function is the core configuration, not the recipe's datastore. The
> > options I can think of offhand:
> >
> > a) Live with the issue
> >
> > b) Put a hack into generate=5Fsstatefn() which changed the PV element=
 if
> > it matched a pattern but we'd have to do this for each SCM as needed.=

> > Ugly but lowest overhead.
> >
> > c) Indirect PV to SSTATEPV (or similar) and then alter SSTATEPV to dr=
op
> > SRCPV to a fixed string. Nicer code in some ways but horrible
> > parsing/performance overhead since every recipe, even non-SCM ones
> > would be affected.
> >
> > d) A partial version of c) where recipes can set SSTATEPV to a functi=
on
> > if they need it. Solves your specific case with overhead without
> > affecting everyone else. Would not solve the issue generally without
> > manual user intervention.
> >
> > I'm not sure which of these will end up making the most sense. These
> > assume the output hash code uses the sstate filename and not PV. If i=
t
> > uses PV there would be more work needed.
>
> I'm not seeing where SRCPV or SRCREV are being explicitly added to
> SSTATE=5FPKGSPEC; PV is added, but SRCPV or SRCREV would have to be
> manually added to PV in the recipe itself for that to happen correct=3F=

> Maybe it's as simple as not doing that in these particular recipes=3F
>

What are pitfalls of not adding SRCPV to PV for packages with SRCREV:=24=7B=
PN=7D =3D =24=7BAUTOREV=7D=3F Is it recommended just for improving tracea=
bility and debugging=3F
When I remove, bitbake is not happy - for example: if I remove explicit a=
ddition of SRCPV, the bitbake throws the following exception (need to dig=
 deeper tp figure out why it happens only for certain packages)
raise bb.fetch2.=46etchError(=22Recipe uses a floating tag/branch without=
 a fixed SRCREV yet doesn't call bb.fetch2.get=5Fsrcrev() (use SRCPV in P=
V for OE).=22)
BR,
Max Chichikalov

>
> Cheers,
>
> Richard


--64d1028f_76f35057_80507
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<blockquote><div><div>On Mon, Aug 7, 2023 at 4:01=E2=80=AFAM Richard Purd=
ie</div><div>&lt;richard.purdie=40linuxfoundation.org&gt; wrote:</div><di=
v>&gt;</div><div>&gt; On Sun, 2023-08-06 at 13:15 -0600, Joshua Watt wrot=
e:</div><div>&gt; &gt; On Sat, Aug 5, 2023 at 7:54=E2=80=AFPM Maksim Chic=
hikalov</div><div>&gt; &gt; &lt;max.chichikalov=40gmail.com&gt; wrote:</d=
iv><div>&gt; &gt; &gt; My name is Max; nice to e-meet you. I need your he=
lp with</div><div>&gt; &gt; &gt; Equivalence Server :)</div><div>&gt; &gt=
; &gt; I watched your presentation on Youtube - it 100% helped me to</div=
><div>&gt; &gt; &gt; understand the logic better and debug the issue we a=
re facing.</div><div>&gt; &gt; &gt; Thank you for all your input into OE =
development.</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; I found in=
 OE repo that you introduced =22def OEOuthashBasic()=22, so I</div><div>&=
gt; &gt; &gt; decided to write to you first before opening the topic on a=
n email</div><div>&gt; &gt; &gt; list.</div><div>&gt; &gt; &gt;</div><div=
>&gt; &gt; &gt; The problem:</div><div>&gt; &gt; &gt;</div><div>&gt; &gt;=
 &gt; Input data are propagated to the output hash generation function,</=
div><div>&gt; &gt; &gt; which generates a different out-hash.</div><div>&=
gt; &gt; &gt;</div><div>&gt; &gt; &gt; Description:</div><div>&gt; &gt; &=
gt;</div><div>&gt; &gt; &gt; All =22=5Fgit.bb=22 recipes have to append S=
RCPV to PV. As a result, PV</div><div>&gt; &gt; &gt; is different on each=
 commit.</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; The OEOuthashB=
asic function includes SSTATE=5FPKGSPEC to generate</div><div>&gt; &gt; &=
gt; hash, which contains PV (PV contains git hash). As a result, there</d=
iv><div>&gt; &gt; &gt; is no way to generate the same out-hash even if ch=
anges introduced</div><div>&gt; &gt; &gt; within a commit were trivial.</=
div><div>&gt; &gt; &gt;</div><div>&gt; &gt;</div><div>&gt; &gt; Right, th=
is is sort of on purpose, because the hash equivalence is</div><div>&gt; =
&gt; basically trying to say that an sstate object can be used in place o=
f</div><div>&gt; &gt; another one, even when the task hashes aren't the s=
ame (but the</div><div>&gt; &gt; output hashes are). However, the sstate =
code itself will only look</div><div>&gt; &gt; for sstate object with a c=
ertain name (which include PV); hash</div><div>&gt; &gt; equivalency does=
 have =5Fsome=5F control over the file name sstate looks</div><div>&gt; &=
gt; for, since it will replace the taskhash portion of the name with the<=
/div><div>&gt; &gt; unified hash, but it doesn't have complete control.</=
div><div>&gt; &gt;</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; In o=
ur codebase, our components have API part, which is managed by</div><div>=
&gt; &gt; &gt; an independent recipe per component. The described above p=
roblem</div><div>&gt; &gt; &gt; caused the recompilation of all component=
s dependent on API, even</div><div>&gt; &gt; &gt; in cases when API was n=
ot changed. CI for pull requests recompiles</div><div>&gt; &gt; &gt; most=
ly the entire code base, I need to do something with it.</div><div>&gt; &=
gt; &gt; (sorry, quite hard for me to explain it in a nutshell, let me kn=
ow</div><div>&gt; &gt; &gt; if you like to know slightly more details)</d=
iv><div>&gt; &gt; &gt;</div><div>&gt; &gt;</div><div>&gt; &gt; Ya, sounds=
 like a typical mono-repo design=3F</div><div>&gt; &gt;</div><div>&gt; &g=
t; &gt;</div><div>&gt; &gt; &gt; I see a couple of options for us:</div><=
div>&gt; &gt; &gt; * Add a custom implementation of out-hash generated fu=
nction and</div><div>&gt; &gt; &gt; overwrite SSTATE=5FHASHEQUIV=5FMETHOD=
.</div><div>&gt; &gt; &gt; * Better understand why it's mandatory to appe=
nd SRCPV to PV, and</div><div>&gt; &gt; &gt; maybe it's flexible in our c=
ases to do it.</div><div>&gt; &gt; &gt;</div><div>&gt; &gt;</div><div>&gt=
; &gt; This might be the best option, at least for your recipes, but I've=
</div><div>&gt; &gt; CC'd the list for additional feedback</div><div>&gt;=
 &gt;</div><div>&gt; &gt; &gt; * Propose a patch to fix OEOuthashBasic().=
</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; In my humble opinion, =
the commit's hash shouldn't be included in</div><div>&gt; &gt; &gt; out-h=
ash generation, it doesn't make sense. Unless I'm missing</div><div>&gt; =
&gt; &gt; something important - What are your thoughts=3F</div><div>&gt; =
&gt; &gt;</div><div>&gt; &gt;</div><div>&gt; &gt; Yes and no. It's not in=
tentional, but a side effect of hash</div><div>&gt; &gt; equivalency tryi=
ng to make sure that the things it's marking as</div><div>&gt; &gt; equiv=
alent can actually be found in sstate (basically, because sstate</div><di=
v>&gt; &gt; include the commit hash, hash equivalency kinda has to includ=
e it).</div><div>&gt;</div><div>&gt; This all sounds a bit unfortunate.</=
div><div>&gt;</div><div>&gt; sstate only works as long as the filenames a=
re predictable. Some</div><div>&gt; elements of the sstate filenames are =
essential to operation, e.g. the</div><div>&gt; package architecture sinc=
e one input would result in multiple files</div><div>&gt; with the same h=
ash in the filename of the output otherwise. The recipe</div><div>&gt; na=
me and version are there mainly for debugging to allow someone to</div><d=
iv>&gt; more easily know where an sstate object came from and what it</di=
v><div>&gt; represents. This is summarised by the comment in sstate.bbcla=
ss =22=46ields</div><div>&gt; 0,5,6 are mandatory, 1 is most useful, 2,3,=
4 are just for information=22</div><div>&gt; in generate=5Fsstatefn().</d=
iv><div>&gt;</div><div>&gt; When we added hash equivalence, we added the =
ability to equate the</div><div>&gt; hashes but we'd not considered that =
the version string mismatch may</div><div>&gt; stop significant artefact =
reuse. I suspect at the time we reasoned that</div><div>&gt; if the versi=
on changes, the output probably does too.</div><div>&gt;</div><div>&gt; S=
adly fixing this isn't simple. Changing the hash algorithm isn't</div><di=
v>&gt; enough, we need to stop the SRCREV part of PV being used in the ss=
tate</div><div>&gt; filename. If we stop that happening, the output hash =
algorithm may well</div><div>&gt; =22just work=22 at that point, I'm not =
sure if it directly encodes PV or</div><div>&gt; just the sstate filename=
, hopefully the latter.</div><br><div>It's including SSTATE=5FPKGSPEC in =
the output hash calculation,</div><div>specifically so that a change in s=
state filename changes the outhash</div><div>(that way, hash equivalence =
will never map two difference sstate files</div><div>as equivalent).</div=
><br><div>&gt;</div><div>&gt; The hard part is how to do this generically=
 without adding a lot of</div><div>&gt; complex and potentially fragile c=
ode. The datastore context in that</div><div>&gt; function is the core co=
nfiguration, not the recipe's datastore. The</div><div>&gt; options I can=
 think of offhand:</div><div>&gt;</div><div>&gt; a) Live with the issue</=
div><div>&gt;</div><div>&gt; b) Put a hack into generate=5Fsstatefn() whi=
ch changed the PV element if</div><div>&gt; it matched a pattern but we'd=
 have to do this for each SCM as needed.</div><div>&gt; Ugly but lowest o=
verhead.</div><div>&gt;</div><div>&gt; c) Indirect PV to SSTATEPV (or sim=
ilar) and then alter SSTATEPV to drop</div><div>&gt; SRCPV to a fixed str=
ing. Nicer code in some ways but horrible</div><div>&gt; parsing/performa=
nce overhead since every recipe, even non-SCM ones</div><div>&gt; would b=
e affected.</div><div>&gt;</div><div>&gt; d) A partial version of c) wher=
e recipes can set SSTATEPV to a function</div><div>&gt; if they need it. =
Solves your specific case with overhead without</div><div>&gt; affecting =
everyone else. Would not solve the issue generally without</div><div>&gt;=
 manual user intervention.</div><div>&gt;</div><div>&gt; I'm not sure whi=
ch of these will end up making the most sense. These</div><div>&gt; assum=
e the output hash code uses the sstate filename and not PV. If it</div><d=
iv>&gt; uses PV there would be more work needed.</div><br><div>I'm not se=
eing where SRCPV or SRCREV are being explicitly added to</div><div>SSTATE=
=5FPKGSPEC; PV is added, but SRCPV or SRCREV would have to be</div><div>m=
anually added to PV in the recipe itself for that to happen correct=3F</d=
iv><div>Maybe it's as simple as not doing that in these particular recipe=
s=3F</div></div></blockquote><div><br><div>What are pitfalls of not addin=
g SRCPV to PV for packages with SRCREV:=24=7BPN=7D =3D =24=7BAUTOREV=7D=3F=
 Is it recommended just for improving traceability and debugging=3F</div>=
<br><div>When I remove, bitbake is not happy - for example: if I remove e=
xplicit addition of SRCPV, the bitbake throws the following exception (ne=
ed to dig deeper tp figure out why it happens only for certain packages)<=
/div><br><div>raise bb.fetch2.=46etchError(=22Recipe uses a floating tag/=
branch without a fixed SRCREV yet doesn't call bb.fetch2.get=5Fsrcrev() (=
use SRCPV in PV for OE).=22)</div><br><div>BR,</div><div>Max Chichikalov<=
/div><br><div>&gt;</div><div>&gt; Cheers,</div><div>&gt;</div><div>&gt; R=
ichard</div></div><br>
--64d1028f_76f35057_80507--


