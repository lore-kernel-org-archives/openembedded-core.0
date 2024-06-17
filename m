Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6A5C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 11:44:14 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.54190.1718624647317249964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 04:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vx7dSn/Z;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso4384727e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 04:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718624645; x=1719229445; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=12Vm9aiQGGRVUPP11gA4YsNr7y+bsEUrNoA/DoDmcF4=;
        b=Vx7dSn/Z/uDJiNIyzt/Wqf3bRk6b9Z5OhwJ9AAR1qoMKngwAxnAnaIq+Mdpcr/QVc5
         mHi7vGhgRowqMae/h3/2Rp+8i1Rwf/rj65qOSzqHzNFxUmAoLi4B+ptWufdSE34Maa08
         i4Hd92IN37ppy2tD3kT0O4ql+lDYPFTtGDepqqdt1smBOaj5CBP31y375iXzBkR0H7oE
         pSPhdsDMfbFZUJZkgTqmz2fKXZOVtM5uvuuDhuT/ty7iryAH05Nek3/hLeBx9iUp2r+H
         hrY605MIRd2EBq62WcFzX+A2Jt9fK5tXApJlrs3MgTQxyfHmc2wiOlwGjA4m1LFI69rG
         5vQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718624645; x=1719229445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12Vm9aiQGGRVUPP11gA4YsNr7y+bsEUrNoA/DoDmcF4=;
        b=g2fV2pXC/4vPZdubwADJRKCEfnEDUCxycF/Peeo1IOrgk+9CBN6rmL2ViCSiopbHdY
         ReBK5dOFNLq4aeEbJuNxwingHJqy5gpu40loXHWyHsrY5IlMMh6SxZF6ugi8Lcr/1Wu7
         laMxaaNoi/Pv3acvw8E7e9BP6YF05rGiIYa1FjqzEnstKT5D0eEEQowwqKubYLAAI9sg
         ZFpNaHOM8WuolqY0cSEP1S44Wk9IBdle2/XrObEEu03G6z5OxUtKOPwtnslREqsV/Qve
         2ox66FzOjhMfgrHYlVQHhia/8Nc2CjIG7sUjzM6oTZGJqQD+dYzYzam6SU++QmoVxvLL
         ANyg==
X-Forwarded-Encrypted: i=1; AJvYcCU9S/jZua8hYjrLKo3NqBGYq6I+mScYVfwwu0MMTikcNP1MJ3n2LNQjdCjY2nxhgq/v91UtVxiCBMfjWlNFmSI764QY5dTaitvZEqck6foDpHerEAEkgpcu
X-Gm-Message-State: AOJu0Yx4IvNPpEooF5GyHVK1eyPYFbJgIMm3aYDKvT6UiIF8szQPNLNj
	2dC5cpvbotLQJhv0OevcLp6RhUAhjOe7fwY2mxJmuoKNzQBfZZwH8ks9cB1as7ytgAxpeFl1bCL
	u8faZzOke/mJuZQWtQoet8mHobAA=
X-Google-Smtp-Source: AGHT+IHR7NS7pYx2kXAgVpUnAbkl7cbSmzUPXVQWLmgMUrsKInFe05xakcrku17K8Pl6LQChj/3pXHSY4G5Z1F9C4AQ=
X-Received: by 2002:a05:6512:1384:b0:52c:b456:a918 with SMTP id
 2adb3069b0e04-52cb456adc7mr4478576e87.9.1718624644731; Mon, 17 Jun 2024
 04:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240617095954.10982-1-rasmus.villemoes@prevas.dk>
 <D4F6D0D8-F070-43A7-81A2-EF8F2C4520B1@arm.com> <be5f8301-f4a5-45fc-b784-9209d904c591@prevas.dk>
In-Reply-To: <be5f8301-f4a5-45fc-b784-9209d904c591@prevas.dk>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jun 2024 13:43:53 +0200
Message-ID: <CANNYZj9QZPAm+3kow-jxW6XZi+hZG4BGiG2F2oB=_tBqhC1-hg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] findutils: split into packages
To: rasmus.villemoes@prevas.dk
Cc: Ross Burton <Ross.Burton@arm.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000739b4b061b147b94"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 11:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200807

--000000000000739b4b061b147b94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This then needs to happen for all of the core system executables, and not
just these three ones you happen to be using. Packaging should follow a
policy and not be an inconsistent mishmash. But having a policy that splits
every executable into its own package would be a maintenance nightmare.

I=E2=80=99d say this should stay in a private layer if you really don=E2=80=
=99t want to
just use busybox.

Alex

On Mon 17. Jun 2024 at 13.30, Rasmus Villemoes via lists.openembedded.org
<rasmus.villemoes=3Dprevas.dk@lists.openembedded.org> wrote:

> On 17/06/2024 12.22, Ross Burton wrote:
> > On 17 Jun 2024, at 10:59, Rasmus Villemoes via lists.openembedded.org
> <rasmus.villemoes=3Dprevas.dk@lists.openembedded.org> wrote:
> >>
> >> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> >>
> >> It can be useful to have find and/or xargs by themselves without
> >> pulling in locate and its associated binaries updatedb and frcode. In
> >> my case, I just need xargs in an initramfs, which is a 42K binary; the
> >> other binaries add over 300K of dead weight.
> >
> > busybox has both find and xargs, why is that not satisfactory for a
> initramfs?
>
> It might be, for this particular use case, and where I control everything=
.
>
> But, the problem with relying on busybox for anything is that there's no
> way to say "depend on busybox built with at least CONFIG_XARGS and
> CONFIG_FEATURE_XARGS_SUPPORT_QUOTES". So in order to make the recipe for
> my script correct, I'd rather just say "RDEPENDS +=3D findutils-xargs" an=
d
> know that I get something with the required features and semantics. I
> was bitten by precisely this; I tested whether my script would even work
> with busybox xargs on my host machine, was pleasantly surprised that it
> did, then tested on target and then realized that the busybox shipped
> with Ubuntu apparently has that feature flag set whereas poky's default
> busybox config does not.
>
> Apart from the size issue (which of course mostly matters in initramfs
> and other constrained environments), there's in general value in being
> able to not install binaries that are not needed [*], and apart from
> being provided by the same recipe, these binaries don't really have a
> lot in common. Yes, 'find -print0 | xargs -0' is a common and useful
> thing, but xargs and find can certainly be used by themselves.
>
> [*] Say, when some severe CVE is found in findutils-locate, it's nice to
> be able to say "not affected, that binary is not on any of our targets"
> despite findutils being in the sbom.
>
> Rasmus
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200806):
> https://lists.openembedded.org/g/openembedded-core/message/200806
> Mute This Topic: https://lists.openembedded.org/mt/106717870/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000739b4b061b147b94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><div dir=3D"auto">This then needs to happen for all of the core s=
ystem executables, and not just these three ones you happen to be using. Pa=
ckaging should follow a policy and not be an inconsistent mishmash. But hav=
ing a policy that splits every executable into its own package would be a m=
aintenance nightmare.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
=E2=80=99d say this should stay in a private layer if you really don=E2=80=
=99t want to just use busybox.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Alex=C2=A0</div></div></div><div><div><div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 17. Jun 2024 at 13.30, R=
asmus Villemoes via <a href=3D"http://lists.openembedded.org" target=3D"_bl=
ank">lists.openembedded.org</a> &lt;rasmus.villemoes=3D<a href=3D"mailto:pr=
evas.dk@lists.openembedded.org" target=3D"_blank">prevas.dk@lists.openembed=
ded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)">On 17/06/2024 12.22, Ross =
Burton wrote:<br>
&gt; On 17 Jun 2024, at 10:59, Rasmus Villemoes via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> &lt;rasmus.villemoes=3D<a href=3D"mailto:prevas.dk@lists.openembedd=
ed.org" target=3D"_blank">prevas.dk@lists.openembedded.org</a>&gt; wrote:<b=
r>
&gt;&gt;<br>
&gt;&gt; From: Rasmus Villemoes &lt;<a href=3D"mailto:rasmus.villemoes@prev=
as.dk" target=3D"_blank">rasmus.villemoes@prevas.dk</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; It can be useful to have find and/or xargs by themselves without<b=
r>
&gt;&gt; pulling in locate and its associated binaries updatedb and frcode.=
 In<br>
&gt;&gt; my case, I just need xargs in an initramfs, which is a 42K binary;=
 the<br>
&gt;&gt; other binaries add over 300K of dead weight.<br>
&gt; <br>
&gt; busybox has both find and xargs, why is that not satisfactory for a in=
itramfs?<br>
<br>
It might be, for this particular use case, and where I control everything.<=
br>
<br>
But, the problem with relying on busybox for anything is that there&#39;s n=
o<br>
way to say &quot;depend on busybox built with at least CONFIG_XARGS and<br>
CONFIG_FEATURE_XARGS_SUPPORT_QUOTES&quot;. So in order to make the recipe f=
or<br>
my script correct, I&#39;d rather just say &quot;RDEPENDS +=3D findutils-xa=
rgs&quot; and<br>
know that I get something with the required features and semantics. I<br>
was bitten by precisely this; I tested whether my script would even work<br=
>
with busybox xargs on my host machine, was pleasantly surprised that it<br>
did, then tested on target and then realized that the busybox shipped<br>
with Ubuntu apparently has that feature flag set whereas poky&#39;s default=
<br>
busybox config does not.<br>
<br>
Apart from the size issue (which of course mostly matters in initramfs<br>
and other constrained environments), there&#39;s in general value in being<=
br>
able to not install binaries that are not needed [*], and apart from<br>
being provided by the same recipe, these binaries don&#39;t really have a<b=
r>
lot in common. Yes, &#39;find -print0 | xargs -0&#39; is a common and usefu=
l<br>
thing, but xargs and find can certainly be used by themselves.<br>
<br>
[*] Say, when some severe CVE is found in findutils-locate, it&#39;s nice t=
o<br>
be able to say &quot;not affected, that binary is not on any of our targets=
&quot;<br>
despite findutils being in the sbom.<br>
<br>
Rasmus<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200806): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200806" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200806</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106717870/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106717870/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</div>
</div>

--000000000000739b4b061b147b94--

