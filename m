Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AEBEA811F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 14:15:54 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20383.1770732954654866590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 06:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZlWGDX/T;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2aad802a27aso17248115ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 06:15:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770732954; cv=none;
        d=google.com; s=arc-20240605;
        b=CoK7gl8dKmEEpfw3Qbd972Km8SX6QxuLPvhfvRZga8wtazAWomgLxbc35673HGTlDw
         kG7JK1f/mDqHKq1upJ3eNTFFLN29m2a+5wtZDOSBtdL8CG5KtadpC8elqbg6onB6N93M
         0Gu+jTpsJuTcD6PefymmW6yCh0+c03zHVbdPfJ/2mrbX5g4n0eb/o71FQJDFtIPUmUO3
         DDf4iCE+OlWZX4HVzrZlXjdZar9z2z6WhC9dU3nd6Kuwfs9bakHlBrTFce+AfC9/ZJk1
         aPY3wQzYQ7QsxwSuYprzkh06m5H8njV2l9nWll+CQvaxiK0QSCPPVpw0WR7yOeuHcuH2
         fBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h11cTLaN0KMhk1ADMP8tUVaaCA7g6+kMwUVmd/HbNLM=;
        fh=Pd1cGzr/KNnXJJeikIk0ixF7hxUq7xThP3JC8BzxunA=;
        b=MLhIQBH/f35E4NSpSsDsRkujieBNk4YYYw+qVVpA+U6WqKdojKnf7GgnyPJL48IeMl
         FKfS+V+C+0H+yWH0wmSm4lMw19Udk7U4FxXR4UFmHKN8PQOTZ5jU3L03xC4cObnPFyZm
         YsjqYGhkRvYau5oNllOHVZ52qSKWetTJwBgKy3wr/1fXvQDuhcVh0Xa/MQVAiKBlGRzO
         7Vf7VPrjYGpoblVlIQsBFBnlaJViumB9P7Kl4ThHf3BTxYtHlq3vpyi7odzafGTiIrX7
         NI+8ZtEXOK4QkUW4cDtIDaQZ1LWsk0oDG93uKG7QIRL3f3oUCaRfU5K4ZFlGA/4xmo9o
         /JSQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770732954; x=1771337754; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h11cTLaN0KMhk1ADMP8tUVaaCA7g6+kMwUVmd/HbNLM=;
        b=ZlWGDX/TV88O3++K4oBzvPQIorjPlDnVCYjdNff08N/Rp3WVLXvvD6Jh54+KCNsubD
         NFk9SxQGkiwjCwG/1GLYexOHMNfOxUaUf6SL71+6OgLaLxY4iYpyCS2AzsOE5EImyj0q
         WBh4BDeLiSNSO1CghsGj5fhpOOvjFdMqndfL18cgSoc/n7TbdrTsMbRi2a6xuhcwIpBE
         Dd3YY6kPRNKMe+4HTU5vsW8MbvIRE/HNtQKdC48cwl4EAZmQ/UaE2kmqXzRDYu0nVB/f
         /57mKdsw+pLDhKTgDcocqvlgWDkHmu2XgMXFvojcYY/wDBfedqPeYRRjSuZIHzkFDXE+
         ka8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770732954; x=1771337754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h11cTLaN0KMhk1ADMP8tUVaaCA7g6+kMwUVmd/HbNLM=;
        b=lz9DjC7LpwF8QXB6aKHZrK6zWIovZUXS/lnjAfb7A/4hv8fm6DpGvq6tbYcM8c8utI
         d7o2qBftFOZwCgJwL3qVQCJxunus8oy32z8uxaOBFGNbclOeAVHiui/NRMFiW40Kns/k
         s1p049AFIRkjH5RqNgPzQ4hUlPh/wk9v5Flg+5jrt9qATwdbK+BD0E+P1AXvapyeAKVj
         oJTZV/OCFl1oPkT3IY0IMtjjXN3uC0p2U5bvpcuGtGFhiDgEmskjDnSp3yE/52+Cv0BA
         2tH02PHhsqNAvUZpukFq56cCA6YNcqj8XxlHnEfQna47vo0gZvhvyE0iBqbIxdvT+Wxh
         OTsA==
X-Forwarded-Encrypted: i=1; AJvYcCVPvwS8tdB1xo0wYBBg0BoT0OEn0LuJF7V++EfD/whbvdZMYqU5qfRfs4qhqnoGq96qgQER0QkUXNEO6GIPy9Ns8w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwB9SDDOag/UhflT08I1AwQxD2RGmIRkoFtwZKQaW7EsTUZRjwI
	4kAUkl4WweIDx6+2TlQsLhRdi3U2/U9PqEM/u60B0J+ph1rL1jwC1xvYcPgv14nDzLO2eLYTH8S
	mNzZ2djMVH2LHU2zYcVcK3/BLFuVRiePeDL/+
X-Gm-Gg: AZuq6aIX5zManRCnpUR+eIYw4f5/Iqoyz0zZInk4hD32i1ECLwRD7je22uHCKFJaeKY
	yuf6xC6sD1+04CfafFAZwf26UnLAFr62mdRwlFWFKBVALMmxHF/TAVEuDp5LUYHEN4Pk3d3rgS7
	s9vJHWErrS3/UpgLbRnOVRfKL1bT/fOSw7DvxILa+1ES0tl3yklr2nlB3Ow2v8RtwU00mEAjKNb
	EPoi1o5Mc7Csuv1m85u79zf5V57WxLHJltczyaEz/WjkYFUasO92lTt0/BubU7rYd74LJG7yVrj
	uZGxlXSYjkX0KaQg9RXtVDUrdxFNEWhM2CersU3/
X-Received: by 2002:a17:903:2f08:b0:2a7:95d0:d77d with SMTP id
 d9443c01a7336-2a95180f91dmr148054505ad.30.1770732953910; Tue, 10 Feb 2026
 06:15:53 -0800 (PST)
MIME-Version: 1.0
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
 <DGB77NZHNM3V.2EJ7FXYV0OH5Q@bootlin.com> <e8f2e5e39f2ced4d3fd25d33159ce8bdaaa5313a.camel@linuxfoundation.org>
In-Reply-To: <e8f2e5e39f2ced4d3fd25d33159ce8bdaaa5313a.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Feb 2026 09:15:41 -0500
X-Gm-Features: AZwV_QhRtNojo2q4aU19UFByGgCUHJ2Pl1y-KmbxX1AyO5P4NB-pFleR7UsyNSg
Message-ID: <CADkTA4NG_9_b5q0JGiS3bGF7hYiPaRWfiNsmM8ED3QoDXbbjNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/13] kernel-yocto: 6.18 updates and 6.12/6.16 removal
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	=?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b5c25d064a78e43d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 14:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230902

--000000000000b5c25d064a78e43d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 8:19=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2026-02-10 at 11:09 +0100, Mathieu Dubois-Briand wrote:
> > On Fri Feb 6, 2026 at 9:27 PM CET, Bruce Ashfield via
> lists.openembedded.org wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Hi all,
> > >
> > > Here's my series for the two repositories combined into one.
> > > I usually do end up missing some reference to the old kernels,
> > > so I'm never completely sure that I've gotten them all.
> > >
> > > But with this (and thanks to Kevin getting the beaglebone
> > > working with 6.18/standard/base), we are down to just the
> > > single reference kernel.
> > >
> > > As usual, I'll continue updating any kernel that is active
> > > upstream, and I'll send -stable updates to the appropriate
> > > branches.
> > >
> > > I also plan to make my scripts available for those that may
> > > want to bump SRCREVs by themselves to continue consuming my
> > > merges.
> > >
> > > I'm out for the weekend, but will pick up any issues with
> > > this on first thing Monday morning.
> >
> > Looks correct on the autobuilder.
> >
> > Just a quick note for Jan-Simon: once merged, this will break meta-
> > agl
> > layer, as it refers to 6.16 as a preferred version:
> >
> > WARNING: preferred version 6.16% of linux-yocto not available (for
> > item virtual/kernel)
> > WARNING: versions of linux-yocto available: 6.18.8+git
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2987
>
> It mostly worked in my testing except for:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3148
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3176
>
> linux-yocto-6.18.7+git-r0 do_kernel_version_sanity_check: Package Version
> (6.18.7+git) does not match of kernel being built (6.18.8). Please update
> the PV variable to match the kernel source or set
> KERNEL_VERSION_SANITY_SKIP=3D"1" in your recipe.
>
> Did I miss a patch or something?
>

I also just sent another patch to the bbappend, to bump it to 6.18.9, but
you
can ignore that patch, as I haven't sent the base uprev yet.

genericarm64 has its own SRCREV, so we always need the patch to bump
it along with the base kernel or we'll get those version mismatch warnings.

I could fix it by putting a PV into the bbappend, and then only when I
update
both the SRCREV and the PV will the reference board move forward .. but
I think we should leave it as-is, since it prevents them from falling behin=
d
the other qemu based reference boards.

Bruce



>
> Cheers,
>
> Richard
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b5c25d064a78e43d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 10, 2026 at 8:19=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Tue, 2026-02-10 at 11:09 +01=
00, Mathieu Dubois-Briand wrote:<br>
&gt; On Fri Feb 6, 2026 at 9:27 PM CET, Bruce Ashfield via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
&gt; &gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Hi all,<br>
&gt; &gt; <br>
&gt; &gt; Here&#39;s my series for the two repositories combined into one.<=
br>
&gt; &gt; I usually do end up missing some reference to the old kernels,<br=
>
&gt; &gt; so I&#39;m never completely sure that I&#39;ve gotten them all.<b=
r>
&gt; &gt; <br>
&gt; &gt; But with this (and thanks to Kevin getting the beaglebone<br>
&gt; &gt; working with 6.18/standard/base), we are down to just the<br>
&gt; &gt; single reference kernel.<br>
&gt; &gt; <br>
&gt; &gt; As usual, I&#39;ll continue updating any kernel that is active<br=
>
&gt; &gt; upstream, and I&#39;ll send -stable updates to the appropriate<br=
>
&gt; &gt; branches.<br>
&gt; &gt; <br>
&gt; &gt; I also plan to make my scripts available for those that may<br>
&gt; &gt; want to bump SRCREVs by themselves to continue consuming my<br>
&gt; &gt; merges.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;m out for the weekend, but will pick up any issues with<br>
&gt; &gt; this on first thing Monday morning.<br>
&gt; <br>
&gt; Looks correct on the autobuilder.<br>
&gt; <br>
&gt; Just a quick note for Jan-Simon: once merged, this will break meta-<br=
>
&gt; agl<br>
&gt; layer, as it refers to 6.16 as a preferred version:<br>
&gt; <br>
&gt; WARNING: preferred version 6.16% of linux-yocto not available (for<br>
&gt; item virtual/kernel)<br>
&gt; WARNING: versions of linux-yocto available: 6.18.8+git<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/55=
/builds/2987" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/55/builds/2987</a><br>
<br>
It mostly worked in my testing except for:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/buil=
ds/3148" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/60/builds/3148</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/buil=
ds/3176" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/22/builds/3176</a><br>
<br>
linux-yocto-6.18.7+git-r0 do_kernel_version_sanity_check: Package Version (=
6.18.7+git) does not match of kernel being built (6.18.8). Please update th=
e PV variable to match the kernel source or set KERNEL_VERSION_SANITY_SKIP=
=3D&quot;1&quot; in your recipe.<br>
<br>
Did I miss a patch or something?<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">I also just sent another p=
atch to the bbappend, to bump it to 6.18.9, but you</div><div class=3D"gmai=
l_default" style=3D"font-size:small">can ignore that patch, as I haven&#39;=
t sent the base uprev yet.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">genericarm64 has its own SRCREV, so we always need the patch to bump</div=
><div class=3D"gmail_default" style=3D"font-size:small">it along with the b=
ase kernel or we&#39;ll get those version mismatch warnings.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">I could fix it by putting a PV into the=
 bbappend, and then only when I update</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">both the SRCREV and the PV will the reference board=
 move forward .. but</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I think we should leave it as-is, since it prevents them from falling=
 behind</div><div class=3D"gmail_default" style=3D"font-size:small">the oth=
er qemu based reference boards.</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000b5c25d064a78e43d--

