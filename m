Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19250C43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 07:48:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39627.1782892111921593612
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 00:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LCjjuTPd;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4758bd3731bso252715f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 00:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782892110; cv=none;
        d=google.com; s=arc-20260327;
        b=ZTpIm2Ws7e+oaMBpY+n9kfTNyOEeqBbSZ1qWS5SRhTdSmtPgUoEafpqCOg/VsrvU6R
         wVqE/BmyA9bKTIl0z2O0+Jf8MQoVa0KS5/qiEzdXODAMgOxejPp2ToZ6gqkNcr+gw+4p
         am7jp26ul5zsa7nbNR2I1FoEzyxAi6fDzj37L53yMRjcg/0oQT6ePH5bG7Q2Z/o2Z5BL
         NIvcwcKqyFtYgUhlI0aURvg8X9vQ76SukSlIqPLvpCLEJlDnvK1PqEQ3QY0yL1Cwjbxs
         j7prJqx8yTZ0SENWL7kEez8kLeTw5/YdeGN6ePlOyITT7vW+etrqR09+ljC0aTuhPsHe
         aDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FJnR7CNKIf/PbU6s0HI53edNuy9Jx1e+Y70BIkZyiEw=;
        fh=wowQPpB6fiuZ6rAY4SodIKU6hzFtI1bLP7RzMnL1BTo=;
        b=XRnLt5M/+Y52iaRBGDfpaN4PqHs3C2JYtxKpKX2Kp8u34Er2ParNPf9jWQ/nWURZ1w
         PN6rx6Xf3biqghSGFGK/WHd09QAZC7G55QkQdoJnENLdWiGlOd6H14LAy4GI5XoYjCb9
         OQBTQbGEACwdWPbqZYqDea1OzdSF1yBc7YwtKIOeP3gEu9RPMaUFkseKaetACqUwVcDd
         Sg0CfNr4e7n+1QnTr/N58s2lqPAeu4svQ0O1i1pVU0fQov6Rc3Ceu/mxoRpE5JN174VN
         dAj1+v53hfdAtessUwMTgedmCTBgJvgEL3KBramnmnJjBXePHzFR/6FMFOvqlOqPnnMG
         V0AQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782892110; x=1783496910; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FJnR7CNKIf/PbU6s0HI53edNuy9Jx1e+Y70BIkZyiEw=;
        b=LCjjuTPdJZlin72ErLx/tLZyjl+te4cAvAKwwhLkPG6QbMjIEYvIInrhwYZCWx55hR
         gZqXvsn4f9zfahOFdg8sJ+p/b6gcUimVUkYjMW0EdKrZumU+GSIWY24MVcjAKLalvFh6
         8OF7LEHN4+1cuDATWI7UQCZlerOGxYYRRb+mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892110; x=1783496910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJnR7CNKIf/PbU6s0HI53edNuy9Jx1e+Y70BIkZyiEw=;
        b=SwM31l9462qn9WJ4FxDD6HvwdvpPhNLNYl6Yk9Mn5IozJkcypxX/yz0r5GRLpK7S85
         yB4q6a2UtEkrBShMRkK4UKJqUbhJEuFnqF6LVNOykTud2HzVOu3WSXAg+2Yr5mBwWk1o
         eoP8KYtvEE8U07xLHaU4t5f6Ir+Kp0buKIp6mvysxIHFdnANVppENKyTGcYQwslLYn70
         uUuvSjWk1CzimiDQOVDrJkPdDCjYgug+y6pBlqD1t3Uh5PBim158gCRPyMCFhR00/IuM
         1cGybQJQ9gn5lCg25tjQeeK9blX5iU+qJxEt2ohjTmO02lVhFrhAPeNMeaGFK8pcAkDi
         rdcg==
X-Gm-Message-State: AOJu0YwH7RNTnZD3Igb1CKCGrhv7aDZkwst7djzVcOqta21MDEDTvtI7
	+9dIlbAVMEJfD2l30GISt1TUcbHiC4CISGA5ZPJYatQP5vuN20XNXZnldwsQ00rk9oHjGLk705F
	xZCcob5vbEj38lq1rO97iKfCusSbhFr4CoVQLKOxE0A==
X-Gm-Gg: AfdE7cm5WSOfO3kcZQ86nWnsHOSouDPLArlrvjHoCeHfmH4cyOIHlcKx2YUNq7UyIiy
	hZ/g4gzrtzNH3OTgpt+UzHVue/YFsML3xRejEXtQOFTdns6lVpmev86apMMgo78EtOQZfQr5+fS
	0oaM9t5zF+wHg2/p2yESVJumbFHO/nJPe+kQg7BmY4upvfYpp42tcG6bV3E6eDW8woG1odXNIzO
	UphvB5Chi/q+ZnFn5oOondA/M7ow62bgy+e5+Bzh29Dyx0TN0QioeFsXaO72vf7F14d+FYQcnRI
	ycx8k997gjPFhmdgmHaJbNTCnL1Hh3M=
X-Received: by 2002:a05:6000:612:b0:45e:dd32:92fa with SMTP id
 ffacd0b85a97d-475de54e294mr7445613f8f.12.1782892109944; Wed, 01 Jul 2026
 00:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260630130358.71091-1-roland.kovacs@est.tech>
 <20260630130358.71091-2-roland.kovacs@est.tech> <DJMEWS9R1XRF.1VEP9G7EHB1S6@smile.fr>
 <b8208b7ba43f8405d351b61b2e35ce40ae7fc979.camel@est.tech>
In-Reply-To: <b8208b7ba43f8405d351b61b2e35ce40ae7fc979.camel@est.tech>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 1 Jul 2026 09:48:18 +0200
X-Gm-Features: AVVi8Cf0DFiqvSiwfm0Tr-4f8eOkJlUQbK-xjAEpHIFqPUTCLM4rRDhp_rCaSDY
Message-ID: <CAMSfU+4WkSqLQdJ4kP3_uendZrF3onhAfSnA0kK9fLHbLzh0rQ@mail.gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH 1/2] gnupg: Upgrade 2.5.17 -> 2.5.20
To: =?UTF-8?Q?Roland_Kov=C3=A1cs?= <roland.kovacs@est.tech>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e2f420065587ea9f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 07:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239947

--000000000000e2f420065587ea9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 1 juil. 2026, 08:51, Roland Kov=C3=A1cs <roland.kovacs@est.tech> a
=C3=A9crit :

> On Tue, 2026-06-30 at 15:19 +0200, Yoann Congal wrote:
> > On Tue Jun 30, 2026 at 3:03 PM CEST, Roland Kov=C3=A1cs via
> lists.openembedded.org wrote:
> > > Bug fixes included in this release:
> > >    - gpg: Fix wrong assertion failure which could very rarely occur
> > >      during key signature checking.  [rG693f5642f6]
> > >    - gpg: Consider certify-only keys for revocation signature check.
> > >      [T8196]
> > >    - gpgsm: Fix possible double free in the CMS parser.  [T8240]
> > >    - gpgsm: Fix possible too early removal of ephemeral keys.  [T8236=
]
> > >    - gpgsm: Avoid emitting a final FAILURE status line if --status-fd
> > >      is not used.  [rG69c27fe377]
> > >    - gpgsm: Fix a regression in 2.5.19 for password encrypted GCM
> > >      data.  [rG60a823c97b]
> > >    - agent: Fix not using cache for pinentry loopback.  [rGd4b608a31f=
]
> > >    - agent: Fix command PUT_SECRET by saving input line.
> [rG1875bc185e]
> > >    - keyboxd: Mark keys searched but not imported via LDAP correctly
> > >      as ephemeral.  [T8048]
> > >    - scdaemon: Avoid buffer overflow with SC-HSM cards providing RSA
> > >      keys > 2k.  [T8244]
> > >    - dirmngr: Fix uninitialized use of the dns_any union in
> > >      dns_rr_cmp.  [T8251]
> > >  Release-info: https://dev.gnupg.org/T7997
> > >
> > > Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
> >
> > Sorry but that URL also contains:
> > > New and extended features:
> > >  gpgsm: Implement GCM encryption. Note that decryption works since
> > >         version 2.3.2. [T3979]
> > >  gpgsm: New option --attribute and server command SETATTR to include
> > >         arbitrary signed or unsigned attributes into a signature.
> > >         Enabled only with libksba 1.7.0 or later. [T4537]
> > >  gpgsm: Introduce system attribute _signingCertificateV2.
> [rG0335a9cb04]
> > ... which are new features, and thus, that upgrade is not acceptable fo=
r
> > stable branches.
> >
> Understood. Just for clarification, only bug fix release is accepted for
> stable branch, even if
> there's no backwards incompatible change?
>

Yes, that's right. No new features, no enhancement, only bug/security fixes=
.


> I'll remove the recipe update and only keep the CVE fix in V2.
>

Sounds good, thanks!

>



> > > ---
> > >  .../recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb} | 3
> ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >  rename meta/recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20=
.bb}
> (95%)
> > >
> > > diff --git a/meta/recipes-support/gnupg/gnupg_2.5.17.bb
> b/meta/recipes-
> > > support/gnupg/gnupg_2.5.20.bb
> > > similarity index 95%
> > > rename from meta/recipes-support/gnupg/gnupg_2.5.17.bb
> > > rename to meta/recipes-support/gnupg/gnupg_2.5.20.bb
> > > index fd6588769c..a1a50e2384 100644
> > > --- a/meta/recipes-support/gnupg/gnupg_2.5.17.bb
> > > +++ b/meta/recipes-support/gnupg/gnupg_2.5.20.bb
> > > @@ -16,6 +16,7 @@ inherit autotools gettext texinfo pkgconfig
> upstream-version-is-even
> > >  require drop-unknown-suffix.inc
> > >
> > >  UPSTREAM_CHECK_URI =3D "https://gnupg.org/ftp/gcrypt/gnupg/"
> > > +SRCREV =3D "343d0cb8910441aa44c56ce8673a78e137040c87"
> > >  SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
> > >             file://0002-use-pkgconfig-instead-of-npth-config.patch \
> > >             file://0001-Woverride-init-is-not-needed-with-gcc-9.patch=
 \
> > > @@ -24,7 +25,7 @@ SRC_URI:append:class-native =3D "
> > > file://0001-configure.ac-use-a-custom-value-for-
> > >                                  file://relocate.patch"
> > >  SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
> > >
> > > -SRC_URI[sha256sum] =3D
> "2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af4bc3a10888685d"
> > > +SRC_URI[sha256sum] =3D
> "6461266e99c308419a379abe6c356d54c214136c4589bd65951091138989ffc6"
> > >
> > >  EXTRA_OECONF =3D "--disable-ldap \
> > >             --disable-ccid-driver \
> >
>
> Cheers,
>         Roland
>

--000000000000e2f420065587ea9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le mer. 1 juil. 2026, 08:51,=
 Roland Kov=C3=A1cs &lt;roland.kovacs@est.tech&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2026-06-30 a=
t 15:19 +0200, Yoann Congal wrote:<br>
&gt; On Tue Jun 30, 2026 at 3:03 PM CEST, Roland Kov=C3=A1cs via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; Bug fixes included in this release:<br>
&gt; &gt; =C2=A0=C2=A0 - gpg: Fix wrong assertion failure which could very =
rarely occur<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 during key signature checking.=C2=A0 [rG=
693f5642f6]<br>
&gt; &gt; =C2=A0=C2=A0 - gpg: Consider certify-only keys for revocation sig=
nature check.<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 [T8196]<br>
&gt; &gt; =C2=A0=C2=A0 - gpgsm: Fix possible double free in the CMS parser.=
=C2=A0 [T8240]<br>
&gt; &gt; =C2=A0=C2=A0 - gpgsm: Fix possible too early removal of ephemeral=
 keys.=C2=A0 [T8236]<br>
&gt; &gt; =C2=A0=C2=A0 - gpgsm: Avoid emitting a final FAILURE status line =
if --status-fd<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 is not used.=C2=A0 [rG69c27fe377]<br>
&gt; &gt; =C2=A0=C2=A0 - gpgsm: Fix a regression in 2.5.19 for password enc=
rypted GCM<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 data.=C2=A0 [rG60a823c97b]<br>
&gt; &gt; =C2=A0=C2=A0 - agent: Fix not using cache for pinentry loopback.=
=C2=A0 [rGd4b608a31f]<br>
&gt; &gt; =C2=A0=C2=A0 - agent: Fix command PUT_SECRET by saving input line=
.=C2=A0 [rG1875bc185e]<br>
&gt; &gt; =C2=A0=C2=A0 - keyboxd: Mark keys searched but not imported via L=
DAP correctly<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 as ephemeral.=C2=A0 [T8048]<br>
&gt; &gt; =C2=A0=C2=A0 - scdaemon: Avoid buffer overflow with SC-HSM cards =
providing RSA<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 keys &gt; 2k.=C2=A0 [T8244]<br>
&gt; &gt; =C2=A0=C2=A0 - dirmngr: Fix uninitialized use of the dns_any unio=
n in<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 dns_rr_cmp.=C2=A0 [T8251]<br>
&gt; &gt; =C2=A0Release-info: <a href=3D"https://dev.gnupg.org/T7997" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://dev.gnupg.org/T7997</a=
><br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Roland Kovacs &lt;roland.kovacs@est.tech&gt;<br>
&gt; <br>
&gt; Sorry but that URL also contains:<br>
&gt; &gt; New and extended features:<br>
&gt; &gt; =C2=A0gpgsm: Implement GCM encryption. Note that decryption works=
 since<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 version 2.3.2. [T3979]=
<br>
&gt; &gt; =C2=A0gpgsm: New option --attribute and server command SETATTR to=
 include<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arbitrary signed or un=
signed attributes into a signature.<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enabled only with libk=
sba 1.7.0 or later. [T4537]<br>
&gt; &gt; =C2=A0gpgsm: Introduce system attribute _signingCertificateV2. [r=
G0335a9cb04]<br>
&gt; ... which are new features, and thus, that upgrade is not acceptable f=
or<br>
&gt; stable branches.<br>
&gt; <br>
Understood. Just for clarification, only bug fix release is accepted for st=
able branch, even if<br>
there&#39;s no backwards incompatible change?<br></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Yes, that&#39;s right. No new =
features, no enhancement, only bug/security fixes.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;ll remove the recipe update and only keep the CVE fix in V2.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sounds go=
od, thanks!</div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_co=
ntainer"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote=
_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0.../recipes-support/gnupg/{<a href=3D"http://gnupg_2.5.17.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gnupg_2.5.17.bb</a> =3D&=
gt; <a href=3D"http://gnupg_2.5.20.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">gnupg_2.5.20.bb</a>} | 3 ++-<br>
&gt; &gt; =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt; =C2=A0rename meta/recipes-support/gnupg/{<a href=3D"http://gnupg_=
2.5.17.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnupg_2.5.17.bb<=
/a> =3D&gt; <a href=3D"http://gnupg_2.5.20.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">gnupg_2.5.20.bb</a>} (95%)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2=
.5.17.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnupg_2.5.17.bb</=
a> b/meta/recipes-<br>
&gt; &gt; support/gnupg/<a href=3D"http://gnupg_2.5.20.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">gnupg_2.5.20.bb</a><br>
&gt; &gt; similarity index 95%<br>
&gt; &gt; rename from meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.=
5.17.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnupg_2.5.17.bb</a=
><br>
&gt; &gt; rename to meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.=
20.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnupg_2.5.20.bb</a><=
br>
&gt; &gt; index fd6588769c..a1a50e2384 100644<br>
&gt; &gt; --- a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.17.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gnupg_2.5.17.bb</a><br>
&gt; &gt; +++ b/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.20.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gnupg_2.5.20.bb</a><br>
&gt; &gt; @@ -16,6 +16,7 @@ inherit autotools gettext texinfo pkgconfig ups=
tream-version-is-even<br>
&gt; &gt; =C2=A0require drop-unknown-suffix.inc<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; =C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gnupg.org/f=
tp/gcrypt/gnupg/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
nupg.org/ftp/gcrypt/gnupg/</a>&quot;<br>
&gt; &gt; +SRCREV =3D &quot;343d0cb8910441aa44c56ce8673a78e137040c87&quot;<=
br>
&gt; &gt; =C2=A0SRC_URI =3D &quot;${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.b=
z2 \<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://0002-use-pkgconfig-instead-of-npth-config.patch=C2=A0\<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://0001-Woverride-init-is-not-needed-with-gcc-9.patch=C2=A0\<br>
&gt; &gt; @@ -24,7 +25,7 @@ SRC_URI:append:class-native =3D &quot;<br>
&gt; &gt; file://0001-configure.ac-use-a-custom-value-for-<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://relocate.patc=
h&quot;<br>
&gt; &gt; =C2=A0SRC_URI:append:class-nativesdk =3D &quot; file://relocate.p=
atch&quot;<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;2c1fbe20e2958fd8fb53cf37d7c38e84a90=
0edc0d561a1c4af4bc3a10888685d&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;6461266e99c308419a379abe6c356d54c21=
4136c4589bd65951091138989ffc6&quot;<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; =C2=A0EXTRA_OECONF =3D &quot;--disable-ldap \<br>
&gt; &gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-ccid-dri=
ver \<br>
&gt; <br>
<br>
Cheers,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Roland<br>
</blockquote></div></div></div>

--000000000000e2f420065587ea9f--

