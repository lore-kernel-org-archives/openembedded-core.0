Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789CDC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:38:11 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44790.1784716504868731097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bzC72aos;
 spf=pass (domain: konsulko.com, ip: 209.85.216.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38175907a56so4575266a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 03:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784716504; cv=none;
        d=google.com; s=arc-20260327;
        b=WXoj42D1cphImBjtuIa5sf1bJnbiWZg1sw5oEJa+cNHTve+Be6jFusp/TpSh5pAUCR
         l/hj6AmJqmBuSaY6N49oe5kwlGEPXTi0fmzOtFczcxTkv6Ic9xgPiURoWhQzr2YBO2bi
         M9CfDd5wBGDj0g26S49Z0RHI9aXerqsXXC8itJTSA8M7gvBRe6/otmyJ7KnJunWr7G40
         cbFsP/kg7xcKuv/Omo/EwofO6WfVJ/A0ECMjPvHO1jjg/m9K0CpEMSJGi53ehRlj2roq
         F9glwmzuEKkUEKXLwivNDtjI/E4ozBT01tPx/xH5EAl8bMFN3nfQ3GqucI72bRb+Dhzp
         uefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9ETriKH8QpVjN6hPPr+CcVg6oTpNg2ku3/SZRD6knrU=;
        fh=hUVqK0aAl83dE4fAdhFDNRLccYL8ScK5abtMTC498pc=;
        b=W/lHAwwz803u/9K+wjk+HyfhKRYb7IJHahNtLoizxpp1UNM7JFoptCaSdLsi72EaO4
         tJYy9Mza/w3tBWc7Lppzt09ri03/iHk4xhTZ5oUum7fCkoSC/QI9wiTTMH1lsPKJZXuD
         qWYvaM71lb/YQuoVwivDKpPQtdXKLv4NqW061kEN/Vs2RimBHn029o2Q3CVqEqfIkVf2
         nIxX/VWFEuLAc+qqbqFckMqRgXUTQhJ3oUsDVZTCdPt4OAk6+aBQJP/Rz/rams0Kfmr+
         1Zbm+K+3tSzQKETsZ68vnWsdT16CMeDBn44UxLLlLvsiq8Mpy07xl/KlDQ8+NZeE2Vlv
         7RPw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784716504; x=1785321304; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ETriKH8QpVjN6hPPr+CcVg6oTpNg2ku3/SZRD6knrU=;
        b=bzC72aosdz8ZCbCXujRwZIvdaxcDCzDo6apQxHX4ktpjMcE1Rb5ZpUMS/0Eu29Am3v
         hCZjIy8JbTXO2OQXLu8+ascLp5DTJGMbM3MPSgv5xtr7XcRvyNM7MsqkRnKIobFwnAOf
         sNY2PjoWteFPg0QeLZKpoQt2b+bWignAGvNig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716504; x=1785321304;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ETriKH8QpVjN6hPPr+CcVg6oTpNg2ku3/SZRD6knrU=;
        b=SFG9H3HB/Dkg8cU0W9r9X7caVpgaHVUdZsaPgPdXAxORFVYixhufa+rD2l8beWkmOc
         0fiOSCQIEaJyQbC9ymECtuEzgu+ljBCRvmJOEC4A0kRRe+gamXPpgYgrJTaVd7LwS1XD
         Wl9A4b1dzP9o7V3uL8IsKaWY1jyMmPhmivlwE4giMFKWdcgsbs4SMvWH4b6cF6n0xMcB
         CNoSJd4l7VzCNIAv5MFxeyfXdAmwnQBASwhODYZ7I1JvVjmyiz6DhX/+S1K5Ri0XX660
         FmcrH0f3U9uF6Io6BahOWK7jlrR/VTtWV1z3IgH/WDzUQh76/24oBV2KkzZhJMi0YJxn
         SKeA==
X-Forwarded-Encrypted: i=1; AHgh+Rqv4M7FuiFbty/S13p1tGDWMiGbC955SHOFiS8FTo+JT7ozMcGWo6d74SKx7WfiX8k1EeHWIQEdkuQxrGogQDK0YA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzrOyB6HrFGMaVDj0GI5nDPJkrO5ErW29kyOyyNtJbGwJBLg4q9
	6grL/S+3f5i4mWJ47vUatTLDUaICTKTKxb0aa8iIK8ao26cJsc0zI62b1lPv4w4htvXdN4nJYWx
	ZEA2Cl9Q2MXl2iI9NE6riqkB6QQ/E4XL6Lck4LEH8cA==
X-Gm-Gg: AR+sD11aa3s+CU/yA2j5oR3mIoX9tOYIRx1ceHGcEdZbKy1xvMHvJ2qtFTmoL2btJkb
	+FlUqih1TzVzVKpwAj1cM/WciOb3wCgemUO/wJrDgYw+fRuMf8aX4W5VOCrcTtW48a+DBs+vmZ1
	hQqt/6m0L6dYPtvWs6g5NlPsU9mM6HEeZjOAlr8GHiAsEIwXeG3tXqmuaUkC+oc57ECK5C9zHZ/
	VdwFP7cdF2cnIyypJ8IzI94JxK8uZrNh9V0WQXXlVWy35jKEqTfiDWc5jpc9ytDuwdnzipukplP
	VtimF0M6Djp0AI9TsYz7OmztSotbNffBodydlv6KEED01jpSimGpnpTug9YqnMQW/D4MZlEw
X-Received: by 2002:a17:90b:5806:b0:37f:d265:18d2 with SMTP id
 98e67ed59e1d1-38ea341d4b9mr2799300a91.7.1784716503999; Wed, 22 Jul 2026
 03:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260708143704.2643050-1-leon.anavi@konsulko.com>
 <7e6827804a7b8da37204e54171d8fb9f7b490b35.camel@linuxfoundation.org>
 <20260716182737.GP749385@bill-the-cat> <ea3daf0012f4f0d582081fef8f4b6f0a7e2a9556.camel@linuxfoundation.org>
 <20260716232011.GR749385@bill-the-cat> <51b4348470f9f620160358d2ac8f14159248a5c7.camel@linuxfoundation.org>
In-Reply-To: <51b4348470f9f620160358d2ac8f14159248a5c7.camel@linuxfoundation.org>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Wed, 22 Jul 2026 13:34:52 +0300
X-Gm-Features: AUfX_mx3KZAKyfQJkBmj5IEfpp7rYz6-ZZOtJccFzLTursWqdKq18dLyXuJFrfE
Message-ID: <CALtQ3O37n66_kooxb=vrXRBeJirU0UicQAodUAeqemZsWhi5WA@mail.gmail.com>
Subject: Re: [OE-core] [[PATCHv3] meta: Add pam to the defaults if using systemd
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003ef71d065730b1b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241654

--0000000000003ef71d065730b1b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Just as a quick update, following the decision not to add pam to the
default distro features, Matt Madison, the maintainer of meta-tegra BSP
layer, committed a patch to remove the unneeded Weston dependency from
recipe l4t-graphics-demos:
https://github.com/OE4T/meta-tegra/commit/abf7600589090740565cfc0afc94c01e7=
e1f6ce0

As a result, the yocto-check-script successfully passes for meta-tegra, so
the issue I was initially having is resolved.

However, considering the shared details about weston/pam/vnc, in my
personal opinion it is still worth addressing Joshua's very valid question
and figuring out how to improve weston-init and weston recipes to make pam
really required only for vnc.

Best regards, Leon

On Fri, Jul 17, 2026 at 9:11=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2026-07-16 at 17:20 -0600, Tom Rini wrote:
> > On Thu, Jul 16, 2026 at 09:28:26PM +0100, Richard Purdie wrote:
> > > On Thu, 2026-07-16 at 12:27 -0600, Tom Rini wrote:
> > > > On Thu, Jul 16, 2026 at 12:25:00PM +0100, Richard Purdie wrote:
> > > > > On Wed, 2026-07-08 at 17:37 +0300, Leon Anavi via
> > > > > lists.openembedded.org wrote:
> > > > > > This fixes issues with test_machine_world when running the
> > > > > > yocto-check-layer script for BSP layers that include weston in
> > > > > > the
> > > > > > dependency chain, for example meta-tegra:
> > > > > >
> > > > > > ERROR: Required build target 'meta-world-pkgdata' has no
> > > > > > buildable
> > > > > > providers.
> > > > > > Missing or unbuildable dependency chain was: ['meta-world-
> > > > > > pkgdata',
> > > > > > 'l4t-graphics-demos', 'weston']
> > > > >
> > > > > Why wouldn't l4t-graphics-demos just list pam as a required distr=
o
> > > > > feature for that recipe?
> > > >
> > > > Because it doesn't come from l4t-graphics-demos it comes from westo=
n?
> > > > And l4t-graphics-demos supports wayland or x11. Doing something her=
e
> > > > would be the not satisfying approach Paul mentioned on v1 or so of
> > > > this thread. It shuts yocto-check-layer up while doing nothing of
> > > > value.
> > >
> > > I should explain a little about the unfortunate way that
> > > REQUIRED_DISTRO_FEATURES works.
> > >
> > > Anything that needs a specific distro feature uses that but it has a
> > > unfortunate ripple side effect where anything with that recipe as a
> > > dependency, must also then have the same REQUIRED_DISTRO_FEATURES lin=
e
> > > (or more restrictive).
> > >
> > > This was discussed extensively in the past and you will see this in t=
he
> > > way x11 is rippled through recipes.
> > >
> > > I appreciate you will then argue this should be automatic as obviousl=
y
> > > anything depending on X will require Y as a DISTRO_FEATURE. I have
> > > refused to implement any such magic as it turns out it can misfire
> > > spectacularly badly and end up just masking every recipe out as a
> > > ripple effect for a poorly thought out change as the worst case
> > > scenario. There are plenty of scenarios where unexpected bad things c=
an
> > > happen which would be hard to spot. This was discussed in the past to=
o.
> > >
> > > So, my point is that if you have weston-init as a dependency, even
> > > indirectly, you have the required distro features requirement passed =
to
> > > that recipe and need to mark the recipe as such.
> > >
> > > No, it isn't great, but the alternatives can go spectacularly wrong t=
oo
> > > and you can't work out how to do this correctly automatically in a sa=
fe
> > > way.
> > >
> > > You are doing something of value, you're clearly marking the
> > > requirement of the recipe (which it has via it's dependencies).
> > >
> > > I think the question is marking the recipe in question to say it
> > > requires "pam+systemd+weston" or "x11", which might mean anonymous
> > > python but is definitely doable.
> >
> > This specific problem has (will be) fixed in meta-tegra since weston ca=
n
> > just be dropped. But if I follow what you're saying right, since
> > meta/recipes-graphics/wayland/weston_15.0.0.bb ends up with:
> > REQUIRED_DISTRO_FEATURES =3D "wayland opengl
> ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam',
> '', d)}"
> > essentially every recipe that has DEPENDS on a PACKAGECONFIG that
> > brings in weston *also* needs that same logic, to not run in to a
> > problem later on.
>
> Correct.
>
> > Is there tooling to find and check that? And is the answer yes, we just
> > ran in to it?
>
> I'm not aware of any such tooling, it has all just been done manually so
> far.
>
> Cheers,
>
> Richard
>

--0000000000003ef71d065730b1b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>Just as a quick update, following the decision =
not to add pam to the default distro features,  Matt Madison, the maintaine=
r of meta-tegra BSP layer, committed a patch to remove the unneeded Weston =
dependency from recipe l4t-graphics-demos:<br><a href=3D"https://github.com=
/OE4T/meta-tegra/commit/abf7600589090740565cfc0afc94c01e7e1f6ce0">https://g=
ithub.com/OE4T/meta-tegra/commit/abf7600589090740565cfc0afc94c01e7e1f6ce0</=
a><br><br>As a result, the yocto-check-script successfully passes for meta-=
tegra, so the issue I was initially having is resolved.<br><br>However, con=
sidering the shared details about weston/pam/vnc, in my personal opinion it=
 is still worth addressing Joshua&#39;s very valid question and figuring ou=
t how to improve weston-init and weston recipes to make pam really required=
 only for vnc.<br><br>Best regards, Leon</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 1=
7, 2026 at 9:11=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.pur=
die@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2026-07-=
16 at 17:20 -0600, Tom Rini wrote:<br>
&gt; On Thu, Jul 16, 2026 at 09:28:26PM +0100, Richard Purdie wrote:<br>
&gt; &gt; On Thu, 2026-07-16 at 12:27 -0600, Tom Rini wrote:<br>
&gt; &gt; &gt; On Thu, Jul 16, 2026 at 12:25:00PM +0100, Richard Purdie wro=
te:<br>
&gt; &gt; &gt; &gt; On Wed, 2026-07-08 at 17:37 +0300, Leon Anavi via<br>
&gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; &gt; &gt; This fixes issues with test_machine_world when run=
ning the<br>
&gt; &gt; &gt; &gt; &gt; yocto-check-layer script for BSP layers that inclu=
de weston in<br>
&gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; dependency chain, for example meta-tegra:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; ERROR: Required build target &#39;meta-world-pkgda=
ta&#39; has no<br>
&gt; &gt; &gt; &gt; &gt; buildable<br>
&gt; &gt; &gt; &gt; &gt; providers.<br>
&gt; &gt; &gt; &gt; &gt; Missing or unbuildable dependency chain was: [&#39=
;meta-world-<br>
&gt; &gt; &gt; &gt; &gt; pkgdata&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &#39;l4t-graphics-demos&#39;, &#39;weston&#39;]<br=
>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Why wouldn&#39;t l4t-graphics-demos just list pam as a =
required distro<br>
&gt; &gt; &gt; &gt; feature for that recipe?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Because it doesn&#39;t come from l4t-graphics-demos it comes=
 from weston?<br>
&gt; &gt; &gt; And l4t-graphics-demos supports wayland or x11. Doing someth=
ing here<br>
&gt; &gt; &gt; would be the not satisfying approach Paul mentioned on v1 or=
 so of<br>
&gt; &gt; &gt; this thread. It shuts yocto-check-layer up while doing nothi=
ng of<br>
&gt; &gt; &gt; value.<br>
&gt; &gt; <br>
&gt; &gt; I should explain a little about the unfortunate way that<br>
&gt; &gt; REQUIRED_DISTRO_FEATURES works.<br>
&gt; &gt; <br>
&gt; &gt; Anything that needs a specific distro feature uses that but it ha=
s a<br>
&gt; &gt; unfortunate ripple side effect where anything with that recipe as=
 a<br>
&gt; &gt; dependency, must also then have the same REQUIRED_DISTRO_FEATURES=
 line<br>
&gt; &gt; (or more restrictive).<br>
&gt; &gt; <br>
&gt; &gt; This was discussed extensively in the past and you will see this =
in the<br>
&gt; &gt; way x11 is rippled through recipes.<br>
&gt; &gt; <br>
&gt; &gt; I appreciate you will then argue this should be automatic as obvi=
ously<br>
&gt; &gt; anything depending on X will require Y as a DISTRO_FEATURE. I hav=
e<br>
&gt; &gt; refused to implement any such magic as it turns out it can misfir=
e<br>
&gt; &gt; spectacularly badly and end up just masking every recipe out as a=
<br>
&gt; &gt; ripple effect for a poorly thought out change as the worst case<b=
r>
&gt; &gt; scenario. There are plenty of scenarios where unexpected bad thin=
gs can<br>
&gt; &gt; happen which would be hard to spot. This was discussed in the pas=
t too.<br>
&gt; &gt; <br>
&gt; &gt; So, my point is that if you have weston-init as a dependency, eve=
n<br>
&gt; &gt; indirectly, you have the required distro features requirement pas=
sed to<br>
&gt; &gt; that recipe and need to mark the recipe as such.<br>
&gt; &gt; <br>
&gt; &gt; No, it isn&#39;t great, but the alternatives can go spectacularly=
 wrong too<br>
&gt; &gt; and you can&#39;t work out how to do this correctly automatically=
 in a safe<br>
&gt; &gt; way.<br>
&gt; &gt; <br>
&gt; &gt; You are doing something of value, you&#39;re clearly marking the<=
br>
&gt; &gt; requirement of the recipe (which it has via it&#39;s dependencies=
).<br>
&gt; &gt; <br>
&gt; &gt; I think the question is marking the recipe in question to say it<=
br>
&gt; &gt; requires &quot;pam+systemd+weston&quot; or &quot;x11&quot;, which=
 might mean anonymous<br>
&gt; &gt; python but is definitely doable.<br>
&gt; <br>
&gt; This specific problem has (will be) fixed in meta-tegra since weston c=
an<br>
&gt; just be dropped. But if I follow what you&#39;re saying right, since<b=
r>
&gt; meta/recipes-graphics/wayland/<a href=3D"http://weston_15.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">weston_15.0.0.bb</a> ends up with:<br>
&gt; REQUIRED_DISTRO_FEATURES =3D &quot;wayland opengl ${@oe.utils.conditio=
nal(&#39;VIRTUAL-RUNTIME_init_manager&#39;, &#39;systemd&#39;, &#39;pam&#39=
;, &#39;&#39;, d)}&quot;<br>
&gt; essentially every recipe that has DEPENDS on a PACKAGECONFIG that<br>
&gt; brings in weston *also* needs that same logic, to not run in to a<br>
&gt; problem later on.<br>
<br>
Correct.<br>
<br>
&gt; Is there tooling to find and check that? And is the answer yes, we jus=
t<br>
&gt; ran in to it?<br>
<br>
I&#39;m not aware of any such tooling, it has all just been done manually s=
o far.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--0000000000003ef71d065730b1b1--

