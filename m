Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40224C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 21:17:23 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.475.1784236642503560422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 14:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MPdwVvxN;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664ce3000e6so3355617d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 14:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784236641; cv=none;
        d=google.com; s=arc-20260327;
        b=KQYr+4r7XHem7Auk4O3qYhQMywmlNM1bmJm90jKIfs87vF89vm8XTZlGFBG6UjtVaf
         y1vz/A4ITigcRfIWFs1ADVjkZLAsTcIOf6IWDJ1CXP+lfNxDbFVwzK8/gcmq+fO+nElN
         f9g8udAXx6RJwHpY7ZwEpqC4hbX7pLNelfLC/6LOa++nJgtFefmtxqZ5hKw24v33AO5L
         AaAieKWmRVedmTuw4vU6KqjKeyHHTQjwnuXhSHHATl2rnVuClSNJqCyoqWgBYAa/fKBd
         i7dh+2JiqyGmyL1DoEjOGhi0QBTgQ0W9/iaM59ddyAWM9/7GOKQki9S2udjLQrH/aCi5
         2ecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rA/mkdymKtthZpcWDdCBT7XJM2KphmaMXb8iR4AiFvY=;
        fh=vr3n0+JE8NRY8FLcMAJ+JuO8myDD5QDT22t2qz5ZjIE=;
        b=d0tv/chyy3sdHxpKaKpNEoJ0cyiYLRyY3VuWFDPoaTDm2+t8rjfA+GAKrQ03dptvbu
         G2e2m5fWH3RX3flSnaCpjd47dq/aqvIzZgzcFegYh0OivHhH0Gby7LkiL6OK5YxtMq6y
         4kpyWfx2dgROP1G3f5vk7Nbg9Xh9+mX6v6lPeea1sDTuy7hHFJf/BOQp87AGS2S+QDyG
         FiOB7ogHfBl7s3iGUWbecdNWHiwDhjiQdmkBNWcIR0Ll8S6pB0wRXlpRZW3lDFk+9AIP
         IhFXicz8wr7SXsz3etIvYTXRxLBx1dgvH07AL/S081B/mHFrOpZJF56NZN4vH7M0dtIm
         LJZQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784236641; x=1784841441; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rA/mkdymKtthZpcWDdCBT7XJM2KphmaMXb8iR4AiFvY=;
        b=MPdwVvxNCMpBQn8ZSsLE+ruODvL8B/iLiHuz20K8oUO3iTq66Yz9wqEhlIJFZ39fiN
         X1WsgDU2hTGMLgQBa1dibwIllPrJM4crW7WbFhB29ylolBsH23vTLQmH9Qtf/VjRFKiW
         bBg6etm0mYV81O7dbyd4FWkW64qGpygXLte4AQCVJLBmTKXv92o9Jf4R66PPuaQqP3AF
         a2h8hdb1RJvM8uxxuwA3qeDGQetcopdgA9hCRYF+UpJQa4E4AzStR8y+GBqTzX9ZBXyV
         OyjqPZaN8bJk/o1eHcKpaAF2LmZxHaMAFVLoNc5Y+pHcjCvvUgw8ng2HcdImyk8SISJr
         RT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784236641; x=1784841441;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rA/mkdymKtthZpcWDdCBT7XJM2KphmaMXb8iR4AiFvY=;
        b=lzfZPHXLP9M6m1nlNmwgRR4dDvo1pHl92cTC7A4gvpYdrvjLZVDMak/tRIy2wMBqLU
         RAgzeqHNxp4cg6CRrSXHCUZlIecSH7MUfv8KpPVAVb9kFrwlSFZZPnNWGsiyEu2h5fN5
         B1PSf2UqE2E1odDPkhFqV++wHKJ6ZJIrRuiN0Vv1pOq7iwor5MqBYT3hhI+Sx4asqVFc
         11haepOqkZhWpF+BnFrzeJn+xhwv7unGaEnkpP4q072ckqLanc8lwDVnygLUKnSGfaiw
         ZIV0aB3GbQLqty97cTKSG+Uw2c9ykTGfKLWKVKeFmXoqpCwisKM/tNeILYquZtwEAclL
         24vg==
X-Forwarded-Encrypted: i=1; AHgh+RpCYpXORjuiJYmmdBQy+zlrUkIEm6IDGrviHtYRRysClwfZcbymi4Ttrab4bm5/zv2B6wjytzdxIr5w9snF7iFTNA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyp+bhWshqXOKJ203OPYp64N7qxc9dKhLsZgpkb1+YuKZUEAHhk
	qRGwvKcelNPnOTFJ6PexmGI1BLN/+TDm4Vs+jeXuiAhJ/RT6Va6AzQfCfgcP581VnWFXtdwCi8d
	BhfEZeINdrVibTeZyJRCjKiHiGiGHj9A=
X-Gm-Gg: AfdE7cks3XO3jx3gTgXR9/sUEU8bmfdihUjp82leUDKIFHKz8ZFKxxf5ki1Xi/7w+qO
	f0SbUus0Q8j3Pa8vBTgK5ogU1Pxr8ad06rouukx0/zJTmvtTKBmaYIRrZeIb32Qdweyrvv3akyc
	WbRIAgnzlvdE1GU9NRFu2act9b0S3gDYh0GP4hHedAO73/qLTojxDm82NBfNHZejgF08bHA41fZ
	jTUoPhAO9iSG/EkArTgPRTzk27sqMbsfmiwEm45xRpGYTnK4v/VEoqbUV8LE+a22CPd12fYAARD
X-Received: by 2002:a53:accb:0:20b0:667:f270:93d9 with SMTP id
 956f58d0204a3-66836ed8168mr348301d50.51.1784236641337; Thu, 16 Jul 2026
 14:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260708143704.2643050-1-leon.anavi@konsulko.com>
 <7e6827804a7b8da37204e54171d8fb9f7b490b35.camel@linuxfoundation.org>
 <20260716182737.GP749385@bill-the-cat> <ea3daf0012f4f0d582081fef8f4b6f0a7e2a9556.camel@linuxfoundation.org>
In-Reply-To: <ea3daf0012f4f0d582081fef8f4b6f0a7e2a9556.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 16 Jul 2026 15:17:08 -0600
X-Gm-Features: AUfX_my2apePyIQ3xZleQTzn3xd1yGk4gZ4x7JhQMfQrUL8m8Hlm9RE2wNnAC7Q
Message-ID: <CAJdd5GZZ2EdronEC-Yyx6XMSEvjgOqrAT32FfhC6UZsPUjN5Aw@mail.gmail.com>
Subject: Re: [OE-core] [[PATCHv3] meta: Add pam to the defaults if using systemd
To: richard.purdie@linuxfoundation.org
Cc: Tom Rini <trini@konsulko.com>, leon.anavi@konsulko.com, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000033c6730656c0f772"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 21:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241109

--00000000000033c6730656c0f772
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 2:28=E2=80=AFPM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Thu, 2026-07-16 at 12:27 -0600, Tom Rini wrote:
> > On Thu, Jul 16, 2026 at 12:25:00PM +0100, Richard Purdie wrote:
> > > On Wed, 2026-07-08 at 17:37 +0300, Leon Anavi via
> > > lists.openembedded.org wrote:
> > > > This fixes issues with test_machine_world when running the
> > > > yocto-check-layer script for BSP layers that include weston in
> > > > the
> > > > dependency chain, for example meta-tegra:
> > > >
> > > > ERROR: Required build target 'meta-world-pkgdata' has no
> > > > buildable
> > > > providers.
> > > > Missing or unbuildable dependency chain was: ['meta-world-
> > > > pkgdata',
> > > > 'l4t-graphics-demos', 'weston']
> > >
> > > Why wouldn't l4t-graphics-demos just list pam as a required distro
> > > feature for that recipe?
> >
> > Because it doesn't come from l4t-graphics-demos it comes from weston?
> > And l4t-graphics-demos supports wayland or x11. Doing something here
> > would be the not satisfying approach Paul mentioned on v1 or so of
> > this thread. It shuts yocto-check-layer up while doing nothing of
> > value.
>
> I should explain a little about the unfortunate way that
> REQUIRED_DISTRO_FEATURES works.
>
> Anything that needs a specific distro feature uses that but it has a
> unfortunate ripple side effect where anything with that recipe as a
> dependency, must also then have the same REQUIRED_DISTRO_FEATURES line
> (or more restrictive).
>
> This was discussed extensively in the past and you will see this in the
> way x11 is rippled through recipes.
>
> I appreciate you will then argue this should be automatic as obviously
> anything depending on X will require Y as a DISTRO_FEATURE. I have
> refused to implement any such magic as it turns out it can misfire
> spectacularly badly and end up just masking every recipe out as a
> ripple effect for a poorly thought out change as the worst case
> scenario. There are plenty of scenarios where unexpected bad things can
> happen which would be hard to spot. This was discussed in the past too.
>
> So, my point is that if you have weston-init as a dependency, even
> indirectly, you have the required distro features requirement passed to
> that recipe and need to mark the recipe as such.
>
> No, it isn't great, but the alternatives can go spectacularly wrong too
> and you can't work out how to do this correctly automatically in a safe
> way.
>
> You are doing something of value, you're clearly marking the
> requirement of the recipe (which it has via it's dependencies).
>
> I think the question is marking the recipe in question to say it
> requires "pam+systemd+weston" or "x11", which might mean anonymous
> python but is definitely doable.
>

The weird part of that (in my mind) is that maybe the compositor is
something other then weston, or weston is starting some other way than
`weston-init`, or running on something other than systemd in which case
neither weston, nor pam, nor systemd make sense to be required; the recipe
should work with any wayland compositor, regardless of how said compositor
is started (IMHO).

But, I don't think we need to change that; I would propose an easier
solution. I read through the weston source code, and it truly does only
need PAM for vnc (which is already captured in its PACKAGECONFIG).

So, the question is: Does weston actually need to RRECOMMENDS weston-init?
It's been clear from prior patches that weston-init isn't really suitable
for everyone and some would prefer something else (or nothing at all). If
we remove weston-init as a RRECOMMENDS of weston, we can also remove "pam"
from weston REQUIRED_DISTRO_FEATURES and this would also prevent it from
needing to be added to all downstream recipes. This would require users to
opt-in to weston-init if they want that as the weston autostart mechanism,
but that's probably OK; that recipe should keep pam as a
REQUIRED_DISTRO_FEATURE.


>
> Cheers,
>
> Richard
>
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#241108):
> https://lists.openembedded.org/g/openembedded-core/message/241108
> Mute This Topic: https://lists.openembedded.org/mt/120174368/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000033c6730656c0f772
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 16,=
 2026 at 2:28=E2=80=AFPM Richard Purdie via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailt=
o:linuxfoundation.org@lists.openembedded.org">linuxfoundation.org@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Thu, 2026-07-16 at 12:27 -0600, Tom Rini wrote:<br>
&gt; On Thu, Jul 16, 2026 at 12:25:00PM +0100, Richard Purdie wrote:<br>
&gt; &gt; On Wed, 2026-07-08 at 17:37 +0300, Leon Anavi via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; This fixes issues with test_machine_world when running the<b=
r>
&gt; &gt; &gt; yocto-check-layer script for BSP layers that include weston =
in<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; dependency chain, for example meta-tegra:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ERROR: Required build target &#39;meta-world-pkgdata&#39; ha=
s no<br>
&gt; &gt; &gt; buildable<br>
&gt; &gt; &gt; providers.<br>
&gt; &gt; &gt; Missing or unbuildable dependency chain was: [&#39;meta-worl=
d-<br>
&gt; &gt; &gt; pkgdata&#39;,<br>
&gt; &gt; &gt; &#39;l4t-graphics-demos&#39;, &#39;weston&#39;]<br>
&gt; &gt; <br>
&gt; &gt; Why wouldn&#39;t l4t-graphics-demos just list pam as a required d=
istro<br>
&gt; &gt; feature for that recipe?<br>
&gt; <br>
&gt; Because it doesn&#39;t come from l4t-graphics-demos it comes from west=
on?<br>
&gt; And l4t-graphics-demos supports wayland or x11. Doing something here<b=
r>
&gt; would be the not satisfying approach Paul mentioned on v1 or so of<br>
&gt; this thread. It shuts yocto-check-layer up while doing nothing of<br>
&gt; value.<br>
<br>
I should explain a little about the unfortunate way that<br>
REQUIRED_DISTRO_FEATURES works.<br>
<br>
Anything that needs a specific distro feature uses that but it has a<br>
unfortunate ripple side effect where anything with that recipe as a<br>
dependency, must also then have the same REQUIRED_DISTRO_FEATURES line<br>
(or more restrictive).<br>
<br>
This was discussed extensively in the past and you will see this in the<br>
way x11 is rippled through recipes.<br>
<br>
I appreciate you will then argue this should be automatic as obviously<br>
anything depending on X will require Y as a DISTRO_FEATURE. I have<br>
refused to implement any such magic as it turns out it can misfire<br>
spectacularly badly and end up just masking every recipe out as a<br>
ripple effect for a poorly thought out change as the worst case<br>
scenario. There are plenty of scenarios where unexpected bad things can<br>
happen which would be hard to spot. This was discussed in the past too.<br>
<br>
So, my point is that if you have weston-init as a dependency, even<br>
indirectly, you have the required distro features requirement passed to<br>
that recipe and need to mark the recipe as such.<br>
<br>
No, it isn&#39;t great, but the alternatives can go spectacularly wrong too=
<br>
and you can&#39;t work out how to do this correctly automatically in a safe=
<br>
way.<br>
<br>
You are doing something of value, you&#39;re clearly marking the<br>
requirement of the recipe (which it has via it&#39;s dependencies).<br>
<br>
I think the question is marking the recipe in question to say it<br>
requires &quot;pam+systemd+weston&quot; or &quot;x11&quot;, which might mea=
n anonymous<br>
python but is definitely doable.<br></blockquote><div><br></div><div>The we=
ird part of that (in my mind) is that maybe the compositor is something oth=
er then weston, or weston is starting some other way than `weston-init`, or=
 running on something other than systemd in which case neither weston, nor =
pam, nor systemd make sense to be required; the recipe should work with any=
 wayland compositor, regardless of how said compositor is started (IMHO).</=
div><div><br></div><div>But, I don&#39;t think we need to change that; I wo=
uld propose an easier solution. I read through the weston source code, and =
it truly does only need PAM for vnc (which is already captured in its PACKA=
GECONFIG).</div><div><br></div><div>So, the question is: Does weston actual=
ly need to RRECOMMENDS weston-init? It&#39;s been clear from prior patches =
that weston-init isn&#39;t really suitable for everyone and some would pref=
er something else (or nothing at all). If we remove weston-init as a RRECOM=
MENDS of weston, we can also remove &quot;pam&quot; from weston REQUIRED_DI=
STRO_FEATURES and this would also prevent it from needing to be added to al=
l downstream recipes. This would require users to opt-in to weston-init if =
they want that as the weston autostart mechanism, but that&#39;s probably O=
K; that recipe should keep pam as a REQUIRED_DISTRO_FEATURE.</div><div></di=
v><div></div><div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#241108): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/241108" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/241108</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120174368/361=
6693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120174368/3616693</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000033c6730656c0f772--

