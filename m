Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD47C83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 05:02:38 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.71625.1752469353672854855
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jul 2025 22:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tr5jPsTh;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so3216524276.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Jul 2025 22:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752469353; x=1753074153; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1Ljza80/Gdv69KeXPPF6IBOb+PYk3ls8E+F3R2zMNk=;
        b=Tr5jPsThVrKqtpfA86EutEIKjvHLFye1dDsAGgwzvZY0aTRoq4LUhRykIU5Kp1JYVd
         9VEB/SaKGumLA+0trl4QwVT10FIEtJ0/OlYqxbo4GFxU0Pb7jPrrzbZw7EveBHGuJMSG
         2fB+jX0S7odjogStuCsVoKAL+e4PDL7vOn3Qwjw1idtz2d8erkJxQtT3w1p4LCWiLLS/
         BZGSWjRKkWh8SBlacoRGBXYLMWKPgRGMvzL0Iuw35GHNIkcm7i7zoaYsRsrIk5c+orLb
         F1R9n11Uf90I0Yxfstzgcqv7Iyr+TLJ8a/66kVHCoxCEYWj0dk5lFSCNQO5lSN8sjAda
         Krzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752469353; x=1753074153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1Ljza80/Gdv69KeXPPF6IBOb+PYk3ls8E+F3R2zMNk=;
        b=HRtcU+Laqv2Cn5T5RqGQ2k0B4qOcfCjpw+qK8BZT58DBY6OvvhwYV2uOHnxJAdceYI
         3djmnl1R0IOXL6Tfg4EVki0q1PMDAPpmj60HNy8OofCGJjRA8Q3qprowsgTkpN/BPhTx
         6k7FOQQbRYOY20LVnelRWW6guNDNz5MVOYBwtw8kIlLdOX2ElbLVeSqDJ2nhFez5U+qx
         DJuvCB+uXybDBKzOO3yce7/NKOF87N1jUA1MQUR/+YyDKF7K60AVTTob45cSZ8rfeGge
         SIdqJZ7NiDyoWyp40GhatXxQOZPizJhubMv5TFHXAD0OyBFAZmppYJESNqIPFdqbq9KA
         GQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMBpBoj64IloaiHRTCUVQSMFDY4Rp+lOG3vYDTRETjlzERN9bc4PRifwbNAiP/y/KOD0ULVuUZfWGTXJgvL2uhEQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwyI86iJAYt9jROc4ZLpilZrdXSCqSwo1rHV5+Y+ZNTo2HUUSwN
	pk6dEsnC0oF6rwSO4chboyClFrrc5cprHabf/wVusUvoDqMNL7J0N+E6L7Ji+7V5+GvZczCnkfX
	7FOaW6zFHn7mCyWjDqjxvZGYTU+xaMno=
X-Gm-Gg: ASbGncsnZsLHLP8M09aenD4fTk8wTyQOgC6k9+hKcrk1Uo2sHOaqke1mFqOyo6/7KWr
	PynAqJz8mMPlaGYMiqBaOZw/9KRmw19qDuANb5Qh6ddjqnHFRJFVPN0TaXIgS0IlnPJtTfcX2DK
	wJdPH7N4+v97GCTlJ0GuDmZIjG7ZaYqNcli/3H
X-Google-Smtp-Source: AGHT+IFvSAbOj9q95WtXrb0qigTDBzAFOxwn6v1f+i2JmiznhkYOgKGwcRIjm4qFaY+MHKgjO4THdOtiGo8Ewg70uRg=
X-Received: by 2002:a05:690c:350d:b0:703:b3b8:1ca1 with SMTP id
 00721157ae682-717d5b81733mr169506967b3.5.1752469350801; Sun, 13 Jul 2025
 22:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <8340.1751980391085408362@lists.openembedded.org> <DB3PR09MB6202D15953E63F9683D3A14EEA48A@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CAMKF1spsAzE8MKQeemmi2Gs5PTSB4-KfdkRNo8P7KAUhbF1Znw@mail.gmail.com>
 <CAGpma=4Kr8D_R7Sn3mQNc5Eg-06DwK2fAmuunXZyESemFx1+VQ@mail.gmail.com>
 <CAMKF1sqm+88C1s0M7p4YQAFzFfY_6SZPjh+CvpvD87JkHb4bGg@mail.gmail.com>
 <DB3PR09MB620227B14CC05C925B253B93EA4BA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CAMKF1soMZMsFrKyW5TYNY1Eu+0XUHmRDyPQyTWjGEncpUxXs+g@mail.gmail.com> <CAMKF1soTRpUT5L=ocSpfwz91L+dhhTeH5WvzFeDUm1UGcaB4Bw@mail.gmail.com>
In-Reply-To: <CAMKF1soTRpUT5L=ocSpfwz91L+dhhTeH5WvzFeDUm1UGcaB4Bw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Jul 2025 22:02:04 -0700
X-Gm-Features: Ac12FXw0zGvy1mtDLCOpmWINUMv4uWIpNDZ_ZC5Hj-kyKKyxGejRwi1gsMm_kew
Message-ID: <CAMKF1sqT=soDHr3sv2tcLf4q9kief68vMs3dF_tEymB7_2zn+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
To: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
Cc: Alper Ak <alperyasinak1@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, "f_l_k@t-online.de" <f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 05:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220213

12 left

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2959398/raw_inlin=
e

On Sat, Jul 12, 2025 at 10:45=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> We are left with 16 recipes to fix, here are latest qemuarm world build r=
esults
>
> https://errors.yoctoproject.org/Errors/Build/211210/
>
>
> On Sat, Jul 12, 2025 at 9:22=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > Somehow errors.yp.org is not responsing so my latest build errors are
> > not being reported, we are left with 28 failures
> >
> > Summary: 26 tasks failed:
> >   meta-openembedded/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb:do_conf=
igure
> >   meta-openembedded/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb=
:do_configure
> >   meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.1.bb:do_co=
nfigure
> >   meta-openembedded/meta-oe/recipes-graphics/libvncserver/libvncserver_=
0.9.14.bb:do_configure
> >   meta-openembedded/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.=
bb:do_configure
> >   meta-openembedded/meta-oe/recipes-devtools/libubox/libubox_git.bb:do_=
configure
> >   meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb:d=
o_configure
> >   meta-openembedded/meta-oe/recipes-dbs/soci/soci_4.0.3.bb:do_configure
> >   meta-openembedded/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb:do_=
configure
> >   meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-w=
hiskermenu-plugin_2.7.1.bb:do_configure
> >   meta-openembedded/meta-multimedia/recipes-multimedia/musicbrainz/libm=
usicbrainz_git.bb:do_compile
> >   virtual:native:meta-openembedded/meta-oe/recipes-connectivity/obex/op=
enobex_1.7.2.bb:do_configure
> >   meta-openembedded/meta-xfce/recipes-apps/catfish/catfish_4.18.0.bb:do=
_configure
> >   virtual:native:meta-openembedded/meta-oe/recipes-navigation/proj/proj=
_9.3.1.bb:do_configure
> >   meta-openembedded/meta-networking/recipes-connectivity/civetweb/civet=
web_1.16.bb:do_configure
> >   meta-openembedded/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb:d=
o_configure
> >   virtual:native:meta-openembedded/meta-oe/recipes-extended/wxwidgets/w=
xwidgets_3.2.6.bb:do_configure
> >   meta-openembedded/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99=
.1.bb:do_configure
> >   meta-openembedded/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.=
bb:do_configure
> >   meta-openembedded/meta-networking/recipes-connectivity/openthread/ot-=
br-posix_git.bb:do_configure
> >   meta-openembedded/meta-networking/recipes-connectivity/openthread/ot-=
daemon_git.bb:do_configure
> >   meta-openembedded/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.=
2.12.0.bb:do_configure
> >   meta-openembedded/meta-networking/recipes-connectivity/nanomsg/nngpp_=
git.bb:do_configure
> >   meta-openembedded/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb=
:do_configure
> >   meta-openembedded/meta-oe/recipes-connectivity/transmission/transmiss=
ion_4.0.6.bb:do_compile
> >   meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.11.0.bb:do_=
compile
> >
> > On Fri, Jul 11, 2025 at 3:25=E2=80=AFAM Haase Moritz, JD-62 <Moritz.Haa=
se@bmw.de> wrote:
> > >
> > > Hi,
> > >
> > > awesome, we are closing the gap :) I just sent another 10 patches to =
the mailing
> > > list via [0]. Hope to get some more done today, will keep the shared =
spreadsheet
> > > (very good idea BTW) updated.
> > >
> > > [0]: https://lists.openembedded.org/g/openembedded-devel/topic/meta_o=
e_patch_00_10/114097827
> > >
> > > Moritz

