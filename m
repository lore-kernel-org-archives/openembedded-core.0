Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C4DEA811F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 14:18:35 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20594.1770733112166266868
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 06:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GXWDAk9k;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-354a2a7d90fso523470a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 06:18:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770733111; cv=none;
        d=google.com; s=arc-20240605;
        b=hNlOybvQs2h9HE5vIC4SAD5wExFcoGgMdou9LFwobj4LElsEONff0a4A5bSt3mdWiv
         Vs6f9rwAntv+5TIkSwByb7NQLXKa3rQ+OvilyggMPsBEINsuvFdmcjqj1DpmQd0Ndtxp
         rT+3IF3IVXTUF9j9XWpxBBzOF7Fbj44NbA9jvnw1xnYrKkQ0icno9PHYPaZAH6Da5T2Y
         q1OQ8ZIKDkhAW1A3OPdEZTamWPsI93oI2u+VuOsxEIX2sh468ZRdWf0pn8PRYi9EvxKM
         pDFzz/r9AeOkPT5sZWgE2ujWi/zM30fqKFo+f+6dUMO5sw+QJmaJjwvj+l0WtZzTe8oV
         oGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WSiEn6n7rkwT7kcy41axwMnrru1jaoPRj6SP428Xvig=;
        fh=uHB9R4vZhgGZJETN2qHRAhOG2Y+k6W1/srmvEx834rE=;
        b=N4x4kJB8Smh+EMdwfLC1XZciEbXgSpKSVeKACI842yfxyoZSmYEJFDeeLdC6208Dkb
         Z+lvKJS7HzjKJ92GM/amPNgnHV9kPhGn6vXPv5ERmGga6P2EEhhN1l9abHr5yypdOKiQ
         REn+UQUgGNYigonJepM0bjC15GRqgmiWqwKEdi9vIN/x0500P1/g/7v10Fv9eU6fbRLD
         HnZJjiPvOQek2Ws16K49ZgXIYpvmDrik1+5zM5HpXibV/X1JSdIep+M9GXkDhAPd1GpN
         r1811ltnDQdY21zt+v2/TnM4caWT7vJ/6D2FQUIqvhs6CyLtBgMUTWvraYcdgNT9D2gY
         KiQg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770733111; x=1771337911; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WSiEn6n7rkwT7kcy41axwMnrru1jaoPRj6SP428Xvig=;
        b=GXWDAk9kLVtTnZMQkNR+3LSeS8j8vhk67bisWkSbalkJsQpNN9UtE5uW8qppm6kMRA
         0NL8lNErzY6FHl2R53zV+/4o1xqZWtrTHTxLLsrR0rNxflksmQkoJxZ2yL/QuhIGt/0Q
         /BQhK77ENbIbvCFscoYSo9j/LAQwHRHsN7lO5//visju8oG3pjyNYOLKWV7BrPidmfsK
         wABwhAmjW0OLcWWh3GHtB3hDQWp5G8h+2UPNVajfWoQo/DzMYWPqRStE0KUqDUlF0HHs
         JbwrVvYxpGemSnWXlkbUx9beLxo7RYUxOJSSkAbMlL+SWD+0jJPknx/98/a0cD142JvL
         QcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770733111; x=1771337911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSiEn6n7rkwT7kcy41axwMnrru1jaoPRj6SP428Xvig=;
        b=jD5e8TOtYOJCEChU1nRP2W8p41B7LrrKC/aG5YDENEM7LUqxbghfR3J+hFs0dqvUtS
         V8MlOc97qgTtqYM/AwrOPCHoMsLlgCFUnBafWfD09ATPOlCJ64Imo0gP9OeOVzpTaGZw
         FFylc2blrqPFWwQHYDUoJibEwr+y4FyqcSgmFBZXf7Ao9sRGoHrIeVmkXaW/d2dKWGzO
         Y2cCznpOJelvRzY3US0K10JKrGc6HyNsGH+C2LVsmJ7UnfFVGn6muh0QenCRfQ3y4a8l
         TRemB+2kvQNaQpgsfNfmhReich5hhOlD8MVZFGGud+q0Zn/vy7EVpz2gHG74l8oekjOP
         fHlA==
X-Forwarded-Encrypted: i=1; AJvYcCUr1O7YdyN0Q/8jD2t2agXCy3UpZ4MK0ofgnNb/GiWaNQ2GlPTr2l1VL6iuxJHecutX0fV56coaMNMTDCs5umSHpg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyjcmvhGUWw9AtYq6uvvNRjROpVrQJJ2BBLMCx9lkQDyqtKpHEY
	qWGhUBMHq1DMgSr3n//FL99zu3PI1CTsR13evZn6Ly0aHRdytAUGehDHgylL+9UOwJhYjPrIEM6
	ghfS+Tyrl1zfoQ6n2/APQF7+4gWEVKAY=
X-Gm-Gg: AZuq6aKnABCZeyvKV4G+DjbtAB5bJ2jPkrxbUw4Xx2++LqYh0bZ9LYqyJzEUmN1jK0J
	J/OfMybJUnAYgfyZ1Tr25DynEx44cR5LawLSx1xkQnwFl3rh1AsfyIVqbVIAaWxtkJJoF5UG5Em
	TSEkAvQ1Aju5l2X8JkWydgfnXGkKkk4WQcnFnT80szRNleyxfNJ09x3//FBzysX2LbPzF94yY2E
	bUICvw5TQQl7NkLGwjsp0C7Q5L5PCdejD10pQVnMMXGl1F+fZJz9XBFdFIqHW7ioixQZiOfJnJm
	CjGZfX/O3Knv7FQ03oIM8TxnKNC4Odw8X1cdRQNL
X-Received: by 2002:a17:90b:2785:b0:356:3032:1d5e with SMTP id
 98e67ed59e1d1-356303224c0mr6508956a91.22.1770733111224; Tue, 10 Feb 2026
 06:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
 <DGB77NZHNM3V.2EJ7FXYV0OH5Q@bootlin.com> <e8f2e5e39f2ced4d3fd25d33159ce8bdaaa5313a.camel@linuxfoundation.org>
 <CADkTA4Nn8UA1Y9raEU4d+GT8q6yTKKxvCnmW1fDBwOHGitC_xQ@mail.gmail.com> <DGBCAE5TXZG4.2B7KRHDG5GBV4@bootlin.com>
In-Reply-To: <DGBCAE5TXZG4.2B7KRHDG5GBV4@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Feb 2026 09:18:19 -0500
X-Gm-Features: AZwV_QjqJ3_zzcuLhrnJ_tBg6TdltbHc22Cudv9tQFj79k9gLpkDzhJkMGijgDY
Message-ID: <CADkTA4Mwt=Vq4ODNxkY=V7nJN47TM60jTAtKCrOdvAXhm1VExQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/13] kernel-yocto: 6.18 updates and 6.12/6.16 removal
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000162b78064a78ee82"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 14:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230903

--000000000000162b78064a78ee82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 9:08=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Tue Feb 10, 2026 at 2:42 PM CET, Bruce Ashfield via
> lists.openembedded.org wrote:
> > On Tue, Feb 10, 2026 at 8:19=E2=80=AFAM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> >
> >> On Tue, 2026-02-10 at 11:09 +0100, Mathieu Dubois-Briand wrote:
> >> > On Fri Feb 6, 2026 at 9:27 PM CET, Bruce Ashfield via
> >> lists.openembedded.org wrote:
> >> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> > >
> >> > > Hi all,
> >> > >
> >> > > Here's my series for the two repositories combined into one.
> >> > > I usually do end up missing some reference to the old kernels,
> >> > > so I'm never completely sure that I've gotten them all.
> >> > >
> >> > > But with this (and thanks to Kevin getting the beaglebone
> >> > > working with 6.18/standard/base), we are down to just the
> >> > > single reference kernel.
> >> > >
> >> > > As usual, I'll continue updating any kernel that is active
> >> > > upstream, and I'll send -stable updates to the appropriate
> >> > > branches.
> >> > >
> >> > > I also plan to make my scripts available for those that may
> >> > > want to bump SRCREVs by themselves to continue consuming my
> >> > > merges.
> >> > >
> >> > > I'm out for the weekend, but will pick up any issues with
> >> > > this on first thing Monday morning.
> >> >
> >> > Looks correct on the autobuilder.
> >> >
> >> > Just a quick note for Jan-Simon: once merged, this will break meta-
> >> > agl
> >> > layer, as it refers to 6.16 as a preferred version:
> >> >
> >> > WARNING: preferred version 6.16% of linux-yocto not available (for
> >> > item virtual/kernel)
> >> > WARNING: versions of linux-yocto available: 6.18.8+git
> >> >
> >> >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2987
> >>
> >> It mostly worked in my testing except for:
> >>
> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/314=
8
> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/317=
6
> >>
> >> linux-yocto-6.18.7+git-r0 do_kernel_version_sanity_check: Package
> Version
> >> (6.18.7+git) does not match of kernel being built (6.18.8). Please
> update
> >> the PV variable to match the kernel source or set
> >> KERNEL_VERSION_SANITY_SKIP=3D"1" in your recipe.
> >>
> >> Did I miss a patch or something?
> >>
> >
> > Something may have misfired in my scripts. I'm still adapting them
> > to non-poky combo layer.
> >
> > I'll have a look and see if one of mv PVs didn't bump properly.
> >
> > Bruce
> >
>
> I believe your series is complete, as it did build correctly with my
> branch. I think Richard is missing some commits in his branch,
> including:
> linux-yocto/6.18: update to v6.18.8
>
> Just a note about the process while we are at it: picking this series
> was not straightforward, at least with b4: it got confused by patches
> 1-4 appearing twice (1 oe-core, 1 meta-yocto). It was not a big deal and
> I have no suggestion for a better process so far, but it would be
> helpful if patch numbers were unique.
>

My export scripts are doing that numbering on purpose, so I can definitely
change it if it helps the picking of them.

I can also just send them to the two separate lists, but I'm trying to
simulate
the unified series so that we don't miss coordinating between the two
lists (and that's why the numbering is individual).

I do have a "flat mode" in the tools, and that would just number them from
0-N through the entire series.

I'm open to either option. I can send 0-N to the single list, or do the two
0-N sends on separate lists and let the coordination happen on your end
between the two.

Just let me know which you prefer and I'll switch to it.

Bruce



>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000162b78064a78ee82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 10, 2026 at 9:08=
=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-bria=
nd@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Tue Feb 10, 2026 at 2:4=
2 PM CET, Bruce Ashfield via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; On Tue, Feb 10, 2026 at 8:19=E2=80=AFAM Richard Purdie &lt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; On Tue, 2026-02-10 at 11:09 +0100, Mathieu Dubois-Briand wrote:<br=
>
&gt;&gt; &gt; On Fri Feb 6, 2026 at 9:27 PM CET, Bruce Ashfield via<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt; &gt; &gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfiel=
d@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Hi all,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Here&#39;s my series for the two repositories combined i=
nto one.<br>
&gt;&gt; &gt; &gt; I usually do end up missing some reference to the old ke=
rnels,<br>
&gt;&gt; &gt; &gt; so I&#39;m never completely sure that I&#39;ve gotten th=
em all.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; But with this (and thanks to Kevin getting the beaglebon=
e<br>
&gt;&gt; &gt; &gt; working with 6.18/standard/base), we are down to just th=
e<br>
&gt;&gt; &gt; &gt; single reference kernel.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; As usual, I&#39;ll continue updating any kernel that is =
active<br>
&gt;&gt; &gt; &gt; upstream, and I&#39;ll send -stable updates to the appro=
priate<br>
&gt;&gt; &gt; &gt; branches.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I also plan to make my scripts available for those that =
may<br>
&gt;&gt; &gt; &gt; want to bump SRCREVs by themselves to continue consuming=
 my<br>
&gt;&gt; &gt; &gt; merges.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I&#39;m out for the weekend, but will pick up any issues=
 with<br>
&gt;&gt; &gt; &gt; this on first thing Monday morning.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Looks correct on the autobuilder.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Just a quick note for Jan-Simon: once merged, this will break=
 meta-<br>
&gt;&gt; &gt; agl<br>
&gt;&gt; &gt; layer, as it refers to 6.16 as a preferred version:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; WARNING: preferred version 6.16% of linux-yocto not available=
 (for<br>
&gt;&gt; &gt; item virtual/kernel)<br>
&gt;&gt; &gt; WARNING: versions of linux-yocto available: 6.18.8+git<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/bu=
ilders/55/builds/2987" rel=3D"noreferrer" target=3D"_blank">https://autobui=
lder.yoctoproject.org/valkyrie/#/builders/55/builds/2987</a><br>
&gt;&gt;<br>
&gt;&gt; It mostly worked in my testing except for:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builder=
s/60/builds/3148" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/valkyrie/#/builders/60/builds/3148</a><br>
&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builder=
s/22/builds/3176" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/valkyrie/#/builders/22/builds/3176</a><br>
&gt;&gt;<br>
&gt;&gt; linux-yocto-6.18.7+git-r0 do_kernel_version_sanity_check: Package =
Version<br>
&gt;&gt; (6.18.7+git) does not match of kernel being built (6.18.8). Please=
 update<br>
&gt;&gt; the PV variable to match the kernel source or set<br>
&gt;&gt; KERNEL_VERSION_SANITY_SKIP=3D&quot;1&quot; in your recipe.<br>
&gt;&gt;<br>
&gt;&gt; Did I miss a patch or something?<br>
&gt;&gt;<br>
&gt;<br>
&gt; Something may have misfired in my scripts. I&#39;m still adapting them=
<br>
&gt; to non-poky combo layer.<br>
&gt;<br>
&gt; I&#39;ll have a look and see if one of mv PVs didn&#39;t bump properly=
.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
<br>
I believe your series is complete, as it did build correctly with my<br>
branch. I think Richard is missing some commits in his branch,<br>
including:<br>
linux-yocto/6.18: update to v6.18.8<br>
<br>
Just a note about the process while we are at it: picking this series<br>
was not straightforward, at least with b4: it got confused by patches<br>
1-4 appearing twice (1 oe-core, 1 meta-yocto). It was not a big deal and<br=
>
I have no suggestion for a better process so far, but it would be<br>
helpful if patch numbers were unique.<br></blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">My export scripts are=
 doing that numbering on purpose, so I can definitely</div><div class=3D"gm=
ail_default" style=3D"font-size:small">change it if it helps the picking of=
 them.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">I can also just se=
nd them to the two separate lists, but I&#39;m trying to simulate</div><div=
 class=3D"gmail_default" style=3D"font-size:small">the unified series so th=
at we don&#39;t miss coordinating between the two</div><div class=3D"gmail_=
default" style=3D"font-size:small">lists (and that&#39;s why the numbering =
is individual).=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I d=
o have a &quot;flat mode&quot; in the tools, and that would just number the=
m from</div><div class=3D"gmail_default" style=3D"font-size:small">0-N thro=
ugh the entire series.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I&=
#39;m open to either option. I can send 0-N to the single list, or do the t=
wo</div><div class=3D"gmail_default" style=3D"font-size:small">0-N sends on=
 separate lists and let the coordination happen on your end</div><div class=
=3D"gmail_default" style=3D"font-size:small">between the two.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Just let me know which you prefer and =
I&#39;ll switch to it.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000162b78064a78ee82--

