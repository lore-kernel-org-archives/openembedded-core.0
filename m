Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B830EC43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 20:30:47 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5311.1783974642706382078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 13:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BpAX1au0;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81e69a2db34so56763207b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 13:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783974642; cv=none;
        d=google.com; s=arc-20260327;
        b=L22M37AK3IaO3TaF8Qg78akiAv7hDc3qr/eWdZk+H7HhhRJgnwDGEjz9W/mDvUUbtZ
         /ZXuqcsAqT8C5jGqGFv+GZXN7sROHDGLfv0vDuj/LAacVfyM4cDFDQzsDV86qXn2SHHu
         VgB+1xs8jNahz2IVs+JLq+Q3BXW2NsAVgi71orrGjq1u++9mOUuy7fCCaZCp2dBmYmzp
         lorpxDHqxn4/3gZhV3bylwz2a0tyr2o01K49mOUo8otciIxhrHFNesmqn/wnM0qSCiEb
         KmOm2hSKmUdlwWrzIVKL1AkHayCaOZeilRfdR6zQgmH1PaeNyCWfJWtNdAjtrVsMjBPT
         5uag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rsCH4N6slsbUa9RHugqksABTRpjp43dgPeueyJ0T8dA=;
        fh=UzBzonqeunI88GlsmCiBqI7TlfyZ4IqnBtKGCBhx90U=;
        b=jaRXFQeJU5T+ukb91XfoSW+cv2p+CD3S2pa+Ur+mwnzFucVaK8wf3npio4nBghqXIY
         q+pnXtzz4aGSl8AVquWeoGoH0kufwAsH4tId0Kw3LZSehFe5r3uhSapemCUvzxssSV0m
         HgoPBzZgOHpPezeccth3dMbvDZeimfqsipQyAET5Bv4xFFVBMq38pfFHecxBg2qfB9vi
         YYsFxbA35vFv978DOz2ETp9Xde6iMJUlEy+/Ona8WV9wUVwBB9hQgXN1qmXsdg58msJ7
         SZiUSQ9J4Nl4Oh9gVhIZONeTv7tgTFtPn/IWbuS+ntOyjhvbODTsUg4kgRVIz0JVaJaV
         XqhQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783974642; x=1784579442; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsCH4N6slsbUa9RHugqksABTRpjp43dgPeueyJ0T8dA=;
        b=BpAX1au0+mTN68OGC9ydJkPADa5BlBaZGvGlf5LD4kTag32VlmmOr+9A97Dc6LP6Dq
         atMDhV6cVmIf0n4QvW8GP5lLcMG2evcWV+vx6WXwvrCoRJZ3lSOCqj6Otv7Hpygb5TFN
         DbO+5qT8qAJxmoLOYaIP5Y1L9l9VJ7DNVdrixWnYFELAWS4oaG2UuaFkUitioTDrYUag
         Ddevo3WJt+BdgQEbAmYWkpGy3EJd8287Hcl42TEMDBOOcydVpRE0xC/OYEpOZotnLBMw
         q26JvZFIWfFY/XMxyP9wiHE7wvwrIruHAl7nWgIo9eNSC5xq8f2QPugRITRCtqRqYwCs
         HINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783974642; x=1784579442;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rsCH4N6slsbUa9RHugqksABTRpjp43dgPeueyJ0T8dA=;
        b=JBorzvl17bicEVlqu4NbcEB2ELUVhSVUy0+pZhk2FXkSuHapN1dUhzPTt4N99CSfkY
         lT5m/8+BywFgEGc2KFEzvTo/3l0SqxWoIHW0ms0hTJtMX638WvCDbWrVQxnl41qAQQ6b
         5yGX5sk7ff4iLfDob4ljIF79UCwsdaqiyqtg6rAeZkGrkEl/EH+zLBMpNVVNPaebEDNr
         aXF4/NicOOo+BSswVccQBOx4TSvt2YUWTA/hHa8/6WQh7p54oCUu1VUUX9hUT4T/9jxZ
         q+GztqbhxSlmcw9nfodY1K7KpNuo/cAkPRNl89I9wePBMLGkIon78ynYaY/q7jGDwKdN
         062w==
X-Forwarded-Encrypted: i=1; AHgh+RompDgbaDD4SmSSWBLZP0fMySnkjyss9Nxo2XYmHU5/rxqS74rx/Rnu8nBFd8xeoGoBh/dgQufTGqZu+eBEKJBMvw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxDpRs1B6RTqW5Rl5OqED11Uso1XZK1YUDr8zIZCJw3IPmh4OFl
	rpBhRjmNi7T0vpV1/rLc4OD+JHiYntBvAfZk3jefTRL7S1rPK4ordctYZ2oKPdukPec6fSRNdQc
	pEdunVsMFT4QG2ZOhnc84+dKa9xJp6sY=
X-Gm-Gg: AfdE7clL66EDzVE0hZ3lI0saI9VO+b6490RRR8rIfg4f4YoFREBx9aXrys9kPOih+PJ
	cGCsu5guaAcADyxGnMPrmUuG0WlKx0ViUm764qp1zJmF5tMSrrFRGc1Rkol5GzY7um8nx0oUcID
	I2XTVQ8dY2DaB1GEyrmsu7S/+D+04YZrVuX2H9+Ak6j33aLMAxeqEjL2Dz8OWjQSXC/wXr5CWMg
	PK0Xi7eyc0By8FiF6Kwt0AfW7XkpnkiLK3iyoTUU/gppQODOKYV6DLw59RbIcJZMaUnjpjTkYAB
	M526rQ9+rvwsb4LOIq3Ebw==
X-Received: by 2002:a05:690c:3344:b0:80c:85e5:875d with SMTP id
 00721157ae682-81e903112a3mr73456647b3.70.1783974641650; Mon, 13 Jul 2026
 13:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260708143704.2643050-1-leon.anavi@konsulko.com> <c068df721aaa08116114fca946a3eaa6936b4f76.camel@pengutronix.de>
In-Reply-To: <c068df721aaa08116114fca946a3eaa6936b4f76.camel@pengutronix.de>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 13 Jul 2026 14:30:30 -0600
X-Gm-Features: AUfX_mzs1WnGuAAzlmIr_z_l3RcXlr3XHUXjkUPRrqyhA7G7iNRdlyFl0HxoQU4
Message-ID: <CAJdd5GaqWhzsOS-5DVxDGyS8ORd-hmDqW3PKYu95H2XcKCyERg@mail.gmail.com>
Subject: Re: [OE-core] [[PATCHv3] meta: Add pam to the defaults if using systemd
To: p.zabel@pengutronix.de
Cc: Leon Anavi <leon.anavi@konsulko.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cdcf50065683f675"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 20:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240854

--000000000000cdcf50065683f675
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 2:45=E2=80=AFAM Philipp Zabel via lists.openembedded=
.org
<p.zabel=3Dpengutronix.de@lists.openembedded.org> wrote:

> On Mi, 2026-07-08 at 17:37 +0300, Leon Anavi wrote:
> > Add pam to DISTRO_FEATURES_DEFAULTS in init-manager-systemd.inc.
> > This way pam will available if variable VIRTUAL-RUNTIME_init_manager
> > has been set to systemd. Otherwise having systemd in conjunction
> > with wayland but without pam leads to a conflict with the
> > REQUIRED_DISTRO_FEATURES for weston related recipes.
>
> I think these requirements are partially incorrect, btw.
>
> Weston itself only requires PAM for the VNC password, so if
> PACKAGECONFIG[vnc] is disabled, there is no PAM dependency from
> weston_15.0.1.bb at all, and if vnc is enabled, the PAM dependency has
> nothing to do with systemd being enabled or used as init system.
>
> The PAM dependency in weston-init.bb comes from the PAMName=3Dweston-
> autologin option in weston.service and the corresponding weston-
> autologin PAM configuration. Those files are always installed if
> DISTRO_FEATURES has systemd, even if VIRTUAL-RUNTIME_init_manager is
> set to something else.
> Shouldn't either the pam distro feature depend on the systemd distro
> feature, or should the weston.service/weston-autologin files be
> installed at all if the systemd distro feature is enabled but
> init_manager is set to something else?
> I think it wouldn't be even better to remove the PAM requirement from
> weston-init if VNC is disabled, as Weston doesn't need the PAM login in
> that case.
>

I believe weston-init needs PAM regardless of VNC being enabled.

The intention of weston-init is to provide a minimal setup to start weston
on boot and not run as root (since that's a huge pain). There are
certainly other ways of starting weston (such as a login manager), but this
one has been around for a while and is nice because it "just works" even on
devices with no keyboard for (e.g. a user login in a login manager), has a
good security model (not running as root), aside from PAM has almost no
dependencies, and is quite simple. IMHO, It works well for an embedded
device because you can set the weston shell to the kiosk shell and
immediately start your application as a client to show your UI, but it's
not really great for a "desktop" experience (but I never found that a
useful experience on an embedded device outside of demonstration purposes).
It's more or less a copy of a similar system I use in my day job and I had
lofty goals of removing our version for the upstream one, but I'm beginning
to think this is an unrealistic goal.

Regardless, if we continue to use weston-init, we probably need PAM by
default - not because of weston, but because of weston-init. Alternatively,
we can do something other than weston-init, but I don't really have any
idea what that should be, what it would take to switch, or how useful it
would be in the real world.



>
> regards
> Philipp
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240546):
> https://lists.openembedded.org/g/openembedded-core/message/240546
> Mute This Topic: https://lists.openembedded.org/mt/120174368/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cdcf50065683f675
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 9, =
2026 at 2:45=E2=80=AFAM Philipp Zabel via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;p.zabel=3D<a href=3D"mailto:pengutr=
onix.de@lists.openembedded.org">pengutronix.de@lists.openembedded.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mi,=
 2026-07-08 at 17:37 +0300, Leon Anavi wrote:<br>
&gt; Add pam to DISTRO_FEATURES_DEFAULTS in init-manager-systemd.inc.<br>
&gt; This way pam will available if variable VIRTUAL-RUNTIME_init_manager<b=
r>
&gt; has been set to systemd. Otherwise having systemd in conjunction<br>
&gt; with wayland but without pam leads to a conflict with the<br>
&gt; REQUIRED_DISTRO_FEATURES for weston related recipes.<br>
<br>
I think these requirements are partially incorrect, btw.<br>
<br>
Weston itself only requires PAM for the VNC password, so if<br>
PACKAGECONFIG[vnc] is disabled, there is no PAM dependency from<br>
<a href=3D"http://weston_15.0.1.bb" rel=3D"noreferrer" target=3D"_blank">we=
ston_15.0.1.bb</a> at all, and if vnc is enabled, the PAM dependency has<br=
>
nothing to do with systemd being enabled or used as init system.<br>
<br>
The PAM dependency in <a href=3D"http://weston-init.bb" rel=3D"noreferrer" =
target=3D"_blank">weston-init.bb</a> comes from the PAMName=3Dweston-<br>
autologin option in weston.service and the corresponding weston-<br>
autologin PAM configuration. Those files are always installed if<br>
DISTRO_FEATURES has systemd, even if VIRTUAL-RUNTIME_init_manager is<br>
set to something else.<br>
Shouldn&#39;t either the pam distro feature depend on the systemd distro<br=
>
feature, or should the weston.service/weston-autologin files be<br>
installed at all if the systemd distro feature is enabled but<br>
init_manager is set to something else?<br>
I think it wouldn&#39;t be even better to remove the PAM requirement from<b=
r>
weston-init if VNC is disabled, as Weston doesn&#39;t need the PAM login in=
<br>
that case.<br></blockquote><div><br></div><div>I believe=C2=A0weston-init n=
eeds PAM regardless of VNC being enabled.</div><div><br></div><div>The inte=
ntion of weston-init is to provide a minimal setup to start weston on boot =
and not run as root (since that&#39;s a huge pain). There are certainly=C2=
=A0other ways of starting weston (such as a login manager), but this one ha=
s been around for a while and is nice because it &quot;just works&quot; eve=
n on devices with no keyboard for (e.g. a user login in a login manager), h=
as a good security model (not running as root), aside from PAM has almost n=
o dependencies, and is quite simple. IMHO, It works well for an embedded de=
vice because you can set the weston shell to the kiosk shell and immediatel=
y=C2=A0start your application as a client to=C2=A0show your UI,=C2=A0but it=
&#39;s not really great for a &quot;desktop&quot; experience (but I never f=
ound that a useful=C2=A0experience on an embedded device outside of demonst=
ration purposes). It&#39;s more or less a copy of a similar system I use in=
 my day job and I had lofty goals of removing our version for the upstream =
one, but I&#39;m beginning to think this is an unrealistic goal.</div><div>=
<br></div><div>Regardless, if we continue to use weston-init, we probably n=
eed PAM by default - not because of weston, but because of weston-init. Alt=
ernatively, we can do something other than weston-init, but I don&#39;t rea=
lly have any idea what that should be, what it would take to switch, or how=
 useful it would be in the real world.</div><div></div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
regards<br>
Philipp<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#240546): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240546" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/240546</a><br>
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

--000000000000cdcf50065683f675--

