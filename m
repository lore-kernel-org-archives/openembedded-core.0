Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BCFC44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 19:10:21 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2741.1784229015958207216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 12:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aGhLwXQy;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664d530fcfdso11160902d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 12:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784229015; cv=none;
        d=google.com; s=arc-20260327;
        b=ndKDUoEDOldd0mLtxPr/X5aE/fBB4OCbDZ9BbouSTXmQUuWFQRiGNIhvlVM9YFFctk
         1+FSvZCvQDbYcYJgCh+Z11B+4Tu1FabvLuz8X3UABLKemHGO8tE/NtPWSyoTzM6bbxsH
         Vzuq9NaiVrzWOh1lcLMXinFMs3IwS40n2pnD5gxpAZmLT34HTDa///HbVO87KBolTvTn
         Elk5DzkT/2r6sYar4n0dnt1GEt32cVO2Zs2Ns/jV3f98FFWuG7ufCNzojXFkRis6VsiA
         OB5u1npA2xezo1Qe6KiCqrqMYMlX1J7kEI9KoW9qoEC65YIAg8AC8aO4mWUBi+BFD+fD
         4BiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yEK1UcUImhRyUQoavhOdHXy4xIHCU68+Q3OL/NLdXxk=;
        fh=HRl8fk85xiEVlZw340zDk0oHiXM2wtcCPn2NZxDYbG8=;
        b=Vi+JgfoUm725Qg2raM+rAfzDIeBJkSlk26fF0zVTeYs/ylE+PWnl3hL0DzKy1kTDz6
         JYvnbrueMVoCJVady4jJqAnaPKWjCyvzfmvafD6JRIrBAKY6+sy/q2ZM5Acl6HNLuRQy
         CjYAp2Hjjz6OeyuewRY8zgETDhYh0hrVSyZNhRPuo6Q35Oawbt63zS3FQxMdIW39ZMW0
         06xjOtlqn/OtHbglABMDBwuJn5zfqEj/9mmnkeLqZBhK2iwUs3pEgo0SD/I/tVJwxxM4
         ysKTb598x92/ROxhk/ERuKXoj6Baq5oj+PWo4ZZF8qdpSD1PBrnABt/MATVsrM+4CD/f
         PYFQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784229015; x=1784833815; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEK1UcUImhRyUQoavhOdHXy4xIHCU68+Q3OL/NLdXxk=;
        b=aGhLwXQyJshjMAfn7vCfBG5bNX1oflEerl9/q9iRaWStuZumzNepQ+3r9+sBJUdxCt
         cu2wkWevBNp17A2VXJRKkU5r5d08yDAK7CxHsOZxviF2zxAoUXEsZYdiCpPiOoF1m35r
         JnoL79gz2fjOXU6ph/Ti8fx9pJuJuBDzOuCP+n7BGoDVdBo6fNbxNdzY/26r8k9b5p2w
         NGy7pQ7CK2Onoukuohy+gQv1Oy0Fs3qAgzih38BCUa/1wrV1IkSe60uPgx/kmNW/BSFB
         YRy2/SJf4fjreal3J37TECzfTmyD4UFYoFp6VlQB4Qf7Rd8hcmJZ/7xE1PZhWlwki0Xs
         ortQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784229015; x=1784833815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yEK1UcUImhRyUQoavhOdHXy4xIHCU68+Q3OL/NLdXxk=;
        b=SSrWoQAQgFa0dQFWhoQexiZBeJ+CRGdZcZOdI7r1IAGXgmCzLcM5nJ2Evp5Xad8w7S
         PEm50lqFMX/Bth4aXswFSr11NxK7lIHm+JybNU+TekbCVC7oPA4TcNPgMz68PUkkC+5m
         XuFKYk4TjMFFEl7HzajDlT6wST1aFnC+5/ICIyQ/lQKCP8qE0SYp+0SJeLi4QXIEziBO
         NvZsnvxupHgMuuN3mCIsJwRn2W2r8HXAHHtHtiVf1wolpLWzl9oMSArTIoVpq5xCJLWW
         yE8VZ4BfLKusLVAjF/99GaN0yQpAgHvNicw38AhSW0GLr9yqvAZvO1cs7DSPOLojiSrq
         E9kQ==
X-Forwarded-Encrypted: i=1; AHgh+RqP+KSrKudSbzumu11mSqOfQiBqUBsR+LoQuq+lb/q+lAPlNGIOWeFX91rUcrgbZZHKIgWxFAYL/WrBgVtv7ZcI9Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzC1ryu5Hll0d9D2La1crvwQkntmPBasdn5timnwsU8sYoJ/WtP
	5tE7qhiRlpGVpcPbrD5Zp67VcmInY/XDgGy45CO1wrgKjhMogYkt5UMNyf+xsAdIjueqHANj1sF
	edfoBqGykC3ZmMXT2Qk0bil1DITG4Ofs=
X-Gm-Gg: AfdE7cnZnPHsRFLW/EImfQ9XXYD3wNPTb/cUeKCL9iCJCDfbbxshu1E0/rluy3m6sK8
	mIlkDqknEhcxXvv0+Yq4VFF4Aa/jkFfJswYWvqRjVkDAIho6LukLxp7B0cIakNMuu2lhAtE4irU
	KFp/rDUWDcecsrF0N+Sb0Red2qF8MGgCgq8JZY+VMTNYZJLNV4lAePoFiqrnMvnP+CbDw5knapy
	UlSRVezwwmVuIPyvP+bnKHJW/9aYppcDQd0CDHrUzdMiIRHB3AL0B/2zSvsptyNv/0Xyud4At4l
X-Received: by 2002:a05:690e:168b:b0:668:1433:de09 with SMTP id
 956f58d0204a3-6681433e6a0mr5957270d50.95.1784229014656; Thu, 16 Jul 2026
 12:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260708143704.2643050-1-leon.anavi@konsulko.com>
 <c068df721aaa08116114fca946a3eaa6936b4f76.camel@pengutronix.de>
 <CAJdd5GaqWhzsOS-5DVxDGyS8ORd-hmDqW3PKYu95H2XcKCyERg@mail.gmail.com> <490aa6b947a8701f102846683c99f1b226f71e04.camel@pengutronix.de>
In-Reply-To: <490aa6b947a8701f102846683c99f1b226f71e04.camel@pengutronix.de>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 16 Jul 2026 13:10:02 -0600
X-Gm-Features: AUfX_mwPqekedjVnQrVWkgmbBWtk6s3Lteb30GLrqE3wiqhLX4RYhinGFAPYLIE
Message-ID: <CAJdd5GYTp2VKy0yw3+coWz49x2Aprb8GuwJyzj+gMSb=X4m0RA@mail.gmail.com>
Subject: Re: [OE-core] [[PATCHv3] meta: Add pam to the defaults if using systemd
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Leon Anavi <leon.anavi@konsulko.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009ddf1b0656bf30fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 19:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241103

--0000000000009ddf1b0656bf30fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 5:13=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix.=
de>
wrote:

> On Mo, 2026-07-13 at 14:30 -0600, Joshua Watt wrote:
> > On Thu, Jul 9, 2026 at 2:45=E2=80=AFAM Philipp Zabel via lists.openembe=
dded.org
> > <p.zabel=3Dpengutronix.de@lists.openembedded.org> wrote:
> >
> > > On Mi, 2026-07-08 at 17:37 +0300, Leon Anavi wrote:
> > > > Add pam to DISTRO_FEATURES_DEFAULTS in init-manager-systemd.inc.
> > > > This way pam will available if variable VIRTUAL-RUNTIME_init_manage=
r
> > > > has been set to systemd. Otherwise having systemd in conjunction
> > > > with wayland but without pam leads to a conflict with the
> > > > REQUIRED_DISTRO_FEATURES for weston related recipes.
> > >
> > > I think these requirements are partially incorrect, btw.
> > >
> > > Weston itself only requires PAM for the VNC password, so if
> > > PACKAGECONFIG[vnc] is disabled, there is no PAM dependency from
> > > weston_15.0.1.bb at all, and if vnc is enabled, the PAM dependency ha=
s
> > > nothing to do with systemd being enabled or used as init system.
> > >
> > > The PAM dependency in weston-init.bb comes from the PAMName=3Dweston-
> > > autologin option in weston.service and the corresponding weston-
> > > autologin PAM configuration. Those files are always installed if
> > > DISTRO_FEATURES has systemd, even if VIRTUAL-RUNTIME_init_manager is
> > > set to something else.
> > > Shouldn't either the pam distro feature depend on the systemd distro
> > > feature, or should the weston.service/weston-autologin files be
> > > installed at all if the systemd distro feature is enabled but
> > > init_manager is set to something else?
> > > I think it wouldn't be even better to remove the PAM requirement from
> > > weston-init if VNC is disabled, as Weston doesn't need the PAM login =
in
> > > that case.
> > >
> >
> > I believe weston-init needs PAM regardless of VNC being enabled.
>
> Yes. I failed to realize weston-init relies on pam_systemd.so to set
> XDG_RUNTIME_DIR (which weston needs to create the wayland socket) in
> its current state. The weston.service could just as well pass it via
> the environment, though, for example:
>

It does more than that. It creates an entire user session, which does that
(among other things); I don't think just setting XDG_RUNTIME_DIR would
actually fix the problem.

weston-init is as simple as it because uses PAM+systemd to do the session
managment, which means it still behaves like a normal session (like you
would get when you login). It quite simply wouldn't work as expected
without PAM because there would be no more session. Are there session
managers that _don't_ use PAM?

Also, what's the real goal here? Do we want weston to run on startup one
way or another? If so, it probably needs a session manager of *some* kind
(weston-init being one), which will probably use PAM (even though weston
itself does not use PAM). Otherwise, the other option is to just say that
oe-core doesn't support that by default and you have to login on the
console and run weston after login (in which case, we need neither PAM nor
weston-init).


>
> RuntimeDirectory=3Dweston
> Environment=3DXDG_RUNTIME_DIR=3D/run/weston
>
> We've used this with an explicit socket path and WAYLAND_DISPLAY
> exported via the systemd environment:
>
> ExecStart=3D/usr/bin/weston --socket=3D${RUNTIME_DIRECTORY}/wayland-1 ...
> ExecStartPost=3D+/usr/bin/systemctl set-environment
> WAYLAND_DISPLAY=3D${RUNTIME_DIRECTORY}/wayland-1
>
>
> regards
> Philipp
>

--0000000000009ddf1b0656bf30fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 16,=
 2026 at 5:13=E2=80=AFAM Philipp Zabel &lt;<a href=3D"mailto:p.zabel@pengut=
ronix.de">p.zabel@pengutronix.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mo, 2026-07-13 at 14:30 -0600, Joshua W=
att wrote:<br>
&gt; On Thu, Jul 9, 2026 at 2:45=E2=80=AFAM Philipp Zabel via <a href=3D"ht=
tp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a><br>
&gt; &lt;p.zabel=3D<a href=3D"mailto:pengutronix.de@lists.openembedded.org"=
 target=3D"_blank">pengutronix.de@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mi, 2026-07-08 at 17:37 +0300, Leon Anavi wrote:<br>
&gt; &gt; &gt; Add pam to DISTRO_FEATURES_DEFAULTS in init-manager-systemd.=
inc.<br>
&gt; &gt; &gt; This way pam will available if variable VIRTUAL-RUNTIME_init=
_manager<br>
&gt; &gt; &gt; has been set to systemd. Otherwise having systemd in conjunc=
tion<br>
&gt; &gt; &gt; with wayland but without pam leads to a conflict with the<br=
>
&gt; &gt; &gt; REQUIRED_DISTRO_FEATURES for weston related recipes.<br>
&gt; &gt; <br>
&gt; &gt; I think these requirements are partially incorrect, btw.<br>
&gt; &gt; <br>
&gt; &gt; Weston itself only requires PAM for the VNC password, so if<br>
&gt; &gt; PACKAGECONFIG[vnc] is disabled, there is no PAM dependency from<b=
r>
&gt; &gt; <a href=3D"http://weston_15.0.1.bb" rel=3D"noreferrer" target=3D"=
_blank">weston_15.0.1.bb</a> at all, and if vnc is enabled, the PAM depende=
ncy has<br>
&gt; &gt; nothing to do with systemd being enabled or used as init system.<=
br>
&gt; &gt; <br>
&gt; &gt; The PAM dependency in <a href=3D"http://weston-init.bb" rel=3D"no=
referrer" target=3D"_blank">weston-init.bb</a> comes from the PAMName=3Dwes=
ton-<br>
&gt; &gt; autologin option in weston.service and the corresponding weston-<=
br>
&gt; &gt; autologin PAM configuration. Those files are always installed if<=
br>
&gt; &gt; DISTRO_FEATURES has systemd, even if VIRTUAL-RUNTIME_init_manager=
 is<br>
&gt; &gt; set to something else.<br>
&gt; &gt; Shouldn&#39;t either the pam distro feature depend on the systemd=
 distro<br>
&gt; &gt; feature, or should the weston.service/weston-autologin files be<b=
r>
&gt; &gt; installed at all if the systemd distro feature is enabled but<br>
&gt; &gt; init_manager is set to something else?<br>
&gt; &gt; I think it wouldn&#39;t be even better to remove the PAM requirem=
ent from<br>
&gt; &gt; weston-init if VNC is disabled, as Weston doesn&#39;t need the PA=
M login in<br>
&gt; &gt; that case.<br>
&gt; &gt; <br>
&gt; <br>
&gt; I believe weston-init needs PAM regardless of VNC being enabled.<br>
<br>
Yes. I failed to realize weston-init relies on pam_systemd.so to set<br>
XDG_RUNTIME_DIR (which weston needs to create the wayland socket) in<br>
its current state. The weston.service could just as well pass it via<br>
the environment, though, for example:<br></blockquote><div><br></div><div>I=
t does more than that. It creates an entire user session, which does that (=
among other things); I don&#39;t think just setting XDG_RUNTIME_DIR would a=
ctually fix the problem.</div><div><br></div><div>weston-init is as simple =
as it because uses PAM+systemd to do the session managment, which means it =
still behaves like a normal session (like you would get when you login). It=
 quite simply wouldn&#39;t work as expected without PAM because there would=
 be no more session. Are there session managers that _don&#39;t_ use PAM?</=
div><div><br></div><div>Also, what&#39;s the real goal here? Do we want wes=
ton to run on startup one way or=C2=A0another? If so, it probably needs a s=
ession manager of *some* kind (weston-init being one), which will probably =
use PAM (even though weston itself does not use PAM). Otherwise, the other =
option is to just say that oe-core doesn&#39;t support that by default and =
you have to login on the console and run weston after login (in which case,=
 we need neither PAM nor weston-init).</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
RuntimeDirectory=3Dweston<br>
Environment=3DXDG_RUNTIME_DIR=3D/run/weston<br>
<br>
We&#39;ve used this with an explicit socket path and WAYLAND_DISPLAY<br>
exported via the systemd environment:<br>
<br>
ExecStart=3D/usr/bin/weston --socket=3D${RUNTIME_DIRECTORY}/wayland-1 ...<b=
r>
ExecStartPost=3D+/usr/bin/systemctl set-environment WAYLAND_DISPLAY=3D${RUN=
TIME_DIRECTORY}/wayland-1<br>
<br>
<br>
regards<br>
Philipp<br>
</blockquote></div></div>

--0000000000009ddf1b0656bf30fa--

