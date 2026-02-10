Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39B4EA8118
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 13:42:44 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19819.1770730955370621633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 05:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+f+Xrti;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso327832a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 05:42:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770730955; cv=none;
        d=google.com; s=arc-20240605;
        b=Oq8qWd0DrUpXXsNo/09WX9KDxw+G8cSLy2CCVFl+MKPJeNiC0yBzF94zSFOfoaMCgl
         y07USh0soSmrXy6xeyDdfkv69q+gkolwMJPTJWLCRjKhZIXzk5AZFsR0MKAnH4aXGKCJ
         JMVcuZFTXD7Xo64IACQIh6kXZpoj4cHmGG96VN2F7R+TWDgtGY5GUXEMaWhDS6s4iDtu
         NFKA7maKRXfiiofcNhuH16iaHg+wOrKSFBCFNE7Ac+Rieizp7MaBcHaPZHAqaIxM/EMG
         xFikWTvea/l1x4K04GDvUO2uZeIpE/r1u7Jdz0syozdRUnmYZ89RIYfX5JNg7fA/x0ut
         H9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K/mS79Ntl6zB/KA5yf2rlHNT5lWdWEfmEHy0OsUFoG8=;
        fh=kuu4dBg0oTn1qVJAvaEXLbnZWpNGRLR/JpNdbW2kbcQ=;
        b=Fa2vvSlJssOWOqLTxWnSrn4Y1YypOu5XbrFQPBOtWFXenNT6J8wQj8GWT2x9hGSpkW
         CqnNvMhgBcUoxWbAWwQtwi6KcxXqV2YoaB3BK4Fs9+iPQ84gMfNYPVK50Al8kCIhsRue
         q5oZe89rY4sf/a3HexJH72z45AVPR8wL8EFVru/BSnuhNjrEvmuj+gNPt1HnqVK+Sxeg
         oYwWUyPRDFkur93Terq73OlJ12kfqb75MUSnTEOFmS/zPpKz9hBTs6yVM5+r5eQFAO+F
         H3aP42WaZ5B5hZ/by51w1WjT1LoUYlZir2/HH4XXnkhnpBeWlBDkThYyM7/9b+KG3fbQ
         qF0Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770730955; x=1771335755; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K/mS79Ntl6zB/KA5yf2rlHNT5lWdWEfmEHy0OsUFoG8=;
        b=Z+f+XrtiBaqUktj8ln5T3etkfOSaDZtDICq6nrSqjyak/aRQaQ7u2j2/MZ0TpPUnHB
         U9gX8AvufYycZa6Xn8It6LZgL84FhD0IdAKjU3p1gzOJCoiJuzGy1cYy4Zi+T1VqUPTE
         dLjuQSXOcSRsYHtU39Nxr7J+MOg2EE+rv+1dq8R3quchxigz2J2+pInJ/oROHNW2+sg6
         TpQthOVAKTCIe5SoSQoG6n3UFqlVfuMfYFAzBfLhI4FLV/C1NpGXuPvDRNehmAxsoxo+
         wZzHSMua7WzhWxTyCEw5Wx/rYC8QisPFtYjdskuZm5Bd0nkNSCH66TQqABNZ3OFvqaVw
         HDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730955; x=1771335755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/mS79Ntl6zB/KA5yf2rlHNT5lWdWEfmEHy0OsUFoG8=;
        b=R3d3ZUruK2Co5sJY19bNl86fqqZdsFyKiQFksYByuBtth0EB9ZC2k7JlE2Rmx5209Y
         GLNiuaOdBqYIbqYa8pzsa55EG4klh9B7gE1ZgoAFQfpDZj0Zq6rVoxjWx2n2Yt+lN3Yp
         qKym7sk49yVJKFL01OamrdWGvjKF25eWQJLNscHvskCzJo/GoSwWppr+56HFd6LTxNiz
         3lLToIXkfFEXfTHbEzj+BoZ3qsTXsTeNQqcHnhOxKD/nwoaYQX0Nwq39LadvDyNdq2Wo
         wl2GxFf2KqEMAQq0LH7dWoBqKx2YQ6aGjpTOjBzBZdsaDexCdRniUsg+5rKWB/XmSOkG
         NQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCXsz6d0fcT3AAnpCdasoqwMaFjJNUxC90m/7/H+BCE9iABcpr6ploq0FIw6pCKLGTd62/9gHSOnn8O3wv0F0WCcSA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwgXbPZx/f/+AnwSVlNUdqsdzcZJlYhAdrLVCFRVE0DYkgJ3nW0
	b26KemWssRcWbvm9j8cTA7wK4cKFUmDuIjjHgTxUVyPs+wPGf482ng/Dn58NOeyvu1xkYb1w/Bj
	AO1D1qvaYZscTltclOG4EOuEVxGBjJ2Y=
X-Gm-Gg: AZuq6aKD+1EF8sSYHK7lR0RDDxtjaAmGar2CkC/s+ZDlWz5c89d2zYEe5clFMtnXSbb
	Vtebjtlfy29cb67F+f8G9Wus+QCtGjXuEWBSVp6rKj2EJjeLItKdO77qe6jiWsdJe0aKWJdeX3j
	q9nlCBsUWtWnF90vW8hLQDi6GBsMgL3ZjsucFlTMjU4sIqvyUk2oXjEaLoNBMufN+1MW5w92p/R
	S/5hHrvm621dxzmZxVPjYvcxutgD4pPSDU+sb6pF8iCm11M1b1I8HdNUVQcgM1gUBxAlrFrOsdg
	x1+kK6ZcmQBGRs6o7mwrOUf3JmsiS5CzZXjZDYfjFd/dIdnAIpU=
X-Received: by 2002:a17:90b:58c4:b0:33b:bed8:891c with SMTP id
 98e67ed59e1d1-354b3e2ee80mr12420815a91.23.1770730954558; Tue, 10 Feb 2026
 05:42:34 -0800 (PST)
MIME-Version: 1.0
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
 <DGB77NZHNM3V.2EJ7FXYV0OH5Q@bootlin.com> <e8f2e5e39f2ced4d3fd25d33159ce8bdaaa5313a.camel@linuxfoundation.org>
In-Reply-To: <e8f2e5e39f2ced4d3fd25d33159ce8bdaaa5313a.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Feb 2026 08:42:23 -0500
X-Gm-Features: AZwV_QjGCYHSqmRldXRVqiw3x3sR9EdHv65Xw2A3hpjhCnhD50m8rAWaMa5UWBk
Message-ID: <CADkTA4Nn8UA1Y9raEU4d+GT8q6yTKKxvCnmW1fDBwOHGitC_xQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/13] kernel-yocto: 6.18 updates and 6.12/6.16 removal
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	=?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008a10eb064a786d9e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 13:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230898

--0000000000008a10eb064a786d9e
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

Something may have misfired in my scripts. I'm still adapting them
to non-poky combo layer.

I'll have a look and see if one of mv PVs didn't bump properly.

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

--0000000000008a10eb064a786d9e
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
lass=3D"gmail_default" style=3D"font-size:small">Something may have misfire=
d in my scripts. I&#39;m still adapting them</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">to non-poky combo layer.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">I&#39;ll have a look and see if one of mv PVs=
 didn&#39;t bump properly.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
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

--0000000000008a10eb064a786d9e--

