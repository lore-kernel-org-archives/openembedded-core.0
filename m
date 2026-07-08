Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CC3C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 06:37:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2922.1783492648930867947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 23:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cSgVYxEO;
 spf=pass (domain: konsulko.com, ip: 209.85.214.170, mailfrom: leon.anavi@konsulko.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccf2360620so21985ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 23:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783492648; cv=none;
        d=google.com; s=arc-20260327;
        b=N4a0xNp3PXsNTunNIOk1Ib2IlUiXq2W4m5zPMAzbSEtMGrWBi7QydvYvPXkQ1/ekEQ
         Se9hWghfGDnogRZtBYC1nkNeuUftmX40e2ZKDYjbZUo1V5NXxgzofaRASYeaE929RMIq
         tCGMC1b5q2M65Ao/d0Y7XomG+PvQRYqSv7IeiCOMu4nV86CF3xL19k5m4Dtoc39prUMn
         S+4tbVfUNNltXvXWhLO5+E+N6cAVXIyqZyGt4E5oMBAlGpYZ4fvpcaRKDGutcm+RMYDi
         67CWc2liRM7VQjRI+AfpMN/JswM44iSvkrVphsGKKc1blhhCwgx27poRxXmah71x+vYu
         IaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IJ75u6vCxXMLuDRSa2AxDWdTZYt0Zze57zSHGK+OtF8=;
        fh=cQhUk7FAYywZLjh/YY/rvLfGRDiwQ5sI2rOGkKBxWGQ=;
        b=W8JgVYIYN/rITFETcYUIapSbhkHilezoAJ1tfOTXMHDXiZDSaP1qI/y1mDmBMHxCuo
         r+2S6OH5aLKH8QooQuL8s20NwdCAQJC4fmFdHMyDEBrl1N4CPZ5hm6rJuh2Qkm9Z6NKi
         Gx7Z356JTfSEMTba1lT2OQ6k1MJsjaEdOULOZfOIq3o88q3q58OiHEfHHPLXM6O3XCm6
         yFOTlu8/kEgo8bAsJCi4SqxA6T6OJE5bRgcO+lna0VK85LBoZ1ZS7zNAZA1zoEF6ZRW8
         +oCjd/diGu4nwK/oUHDCHKfLpjVPpeHGBD5hgoYkmMK3Gz9SJY5WdXisajvThX/PxOPm
         dtdQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783492648; x=1784097448; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJ75u6vCxXMLuDRSa2AxDWdTZYt0Zze57zSHGK+OtF8=;
        b=cSgVYxEOis6b7n2QpPRCPZDVUs2sYgTM0ikLT3WNJQ3MKIDBYHMyA4pQRaGxvv2GK+
         M6eYIHUUfqyQzcS+Uxiz6X936tvn7SmsA4tr2yIS2LmZ1xA0AEbqDO3YEfxR4RI5qP3z
         DZoNbPrSyMWwnM0z8e6m7NzsfTcg4SkQxK4oQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783492648; x=1784097448;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IJ75u6vCxXMLuDRSa2AxDWdTZYt0Zze57zSHGK+OtF8=;
        b=T5KzBy02+nTFD5R2qqZ4v39WguMLvKgYP/jLixjjjP0ALQqhMNn+CmdxMTGqrBfsm3
         YoPA5mfogeK2s38G57FtmaX3EYQ81Q+fvxFgDLEg9awePgSE1LxJ80KriOcTPxdO+eg8
         iohW6XtjJgYOsaEcrBRX7Db23kAcdJAs13NnSeei0U2vh8eRN6yBFajTVc7s/hkcLEa9
         nH5MadtqTaD/9u8R9Ou7hXPhS9EuzbcT4YpJgBVC4ywBMkUW0dYxYjiqEP7AkJuITqXu
         aKoctee/wDXUDxetiuAGfuFhkdDgbw9p946431hwgiHZv+mxHiK1CoZ/ygeesTN1sFRL
         j8sg==
X-Gm-Message-State: AOJu0YwIXT0T2wIgVd1XSgx/quP58SdN0OhoZ/2wMXBEZ2ZGGP52q+Dy
	1tScq4yjg44pwRA1O9CMGLakljJFv3i2Sd9y+rpAhVi1X81uPVaadhIVW3SzU4ZmRqkUSje6lU+
	ZzOowAw2U57h4umFbPMAav589ROqW+yOkuzdfeKPo/Mh8QyaE29sEWWk=
X-Gm-Gg: AfdE7cldRgYdczNkVN5sqVa4x92XEUae1AfsKgpMPITyW+tdEFBzUDHuISERSPvNLSa
	HwXt34kW65Ukfe+Cel727XXWu0r09ER+Sw3ybH2nDlTZirmesAfe8euWnebZ+VeoRVT3yfJc7ZY
	IhmKt5QQqtPEI3Sor2v7yxkzaS6wuJdKhGac/Cxkl1qpwuX62JQ5+KLzvjt6o/eyNhctNtuoCNK
	qPctmxhkJP0MqseiZhvLVPVU1e3M116O6Hd5bdQgqNnnPyMRRaxy/5xcPqDo4b6MD9BNSwL7C+r
	n5Z3agrut3lGkWfmHsbBY6W/janTJH0w9PKQbcqYCYzOanCIbqL3VCUnfURJDQdme+x7NaN9DSN
	PHkPUdyQ=
X-Received: by 2002:a17:903:298f:b0:2c0:b6c7:227e with SMTP id
 d9443c01a7336-2ccea3485b7mr16183645ad.5.1783492648020; Tue, 07 Jul 2026
 23:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260707090248.417251-1-leon.anavi@konsulko.com> <ak0mCn1v18QBHsYI@navimatix.de>
In-Reply-To: <ak0mCn1v18QBHsYI@navimatix.de>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Wed, 8 Jul 2026 09:37:16 +0300
X-Gm-Features: AVVi8CdVB6ycQ75pfXBC0GIWPtcnMfR3wubcchu9kfT308TXBJwfSTnuhOhiT3A
Message-ID: <CALtQ3O07H7h7v5GzckUB=Am2R7KaX6ZK=tpUhQLUPK0ovkEBmQ@mail.gmail.com>
Subject: Re: [OE-core] [[PATCHv2] meta: Add pam to DISTRO_FEATURES if using systemd
To: =?UTF-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000beba4f065613bd6e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 06:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240439

--000000000000beba4f065613bd6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi J=C3=B6rg,

On Tue, Jul 7, 2026 at 7:25=E2=80=AFPM J=C3=B6rg Sommer <joerg.sommer@navim=
atix.de>
wrote:

> Leon Anavi via lists.openembedded.org schrieb am Di 07. Jul, 12:02
> (+0300):
> > Add pam to the list of DISTRO_FEATURES in init-manager-systemd.inc.
> > This way pam will available if variable VIRTUAL-RUNTIME_init_manager
> > has been set to systemd. Otherwise having systemd in conjunction
> > with wayland but without pam leads to a conflict with the
> > REQUIRED_DISTRO_FEATURES for weston related recipes.
> >
> > This adjustment is required following these recent changes that
> > switched VIRTUAL-RUNTIME_init_manager to systemd by default and added
> > wayland to DISTRO_FEATURES_DEFAULTS which affects "nodistro":
> >
> > - 159148f4de2595556fef6e8678578df83383857b
> >   meta: Support opting out of any distro features
> >   (Please note that this commit also extended DISTRO_FEATURES_DEFAULTS
> >   with wayland and vulkan.)
> >
> > - 0b4061c5d50261f826d0edb4b478d2d305274b7c
> >   conf: Switch to systemd by default and simplify init manager selectio=
n
> >
> > This fixes issues with test_machine_world when running the
> > yocto-check-layer script for BSP layers that include weston in the
> > dependency chain, for example meta-tegra:
> >
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'l4t-graphics-demos', 'weston']
> >
> > The weston recipe has pam in REQUIRED_DISTRO_FEATURES if systemd is
> > enabled. Therefore, it makes sense to also add pam to the defaults
> > through DISTRO_FEATURES in init-manager-systemd.inc.
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  meta/conf/distro/include/init-manager-systemd.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/include/init-manager-systemd.inc
> b/meta/conf/distro/include/init-manager-systemd.inc
> > index 63fd225ca5..2e9eef24b5 100644
> > --- a/meta/conf/distro/include/init-manager-systemd.inc
> > +++ b/meta/conf/distro/include/init-manager-systemd.inc
> > @@ -1,5 +1,5 @@
> >  # Use systemd for system initialization
> > -DISTRO_FEATURES:append =3D " systemd usrmerge"
> > +DISTRO_FEATURES:append =3D " systemd usrmerge pam"
>
> systemd and usrmerge are required features for systemd. But pam is option=
al
> and should be in DISTRO_FEATURES_DEFAULTS to allow for easy opt-out.
>
>
Thank you for your feedback but please note that version 1 of my patch was
adding pam to DISTRO_FEATURES_DEFAULTS if systemd was enabled. Here is a
link to v1 of my patch:
https://lists.openembedded.org/g/openembedded-core/message/240113

Following the code review and feedback provided by Paul Barker I modified
the patch and submitted version 2. For your convenience, here is a link to
Paul's email with his recommendation that init-manager-systemd.inc is the
better place for this:
https://lists.openembedded.org/g/openembedded-core/message/240233


> On the other side: Is pam so much common that it should be enabled by
> default?


The purpose of my proposed patch is to fix the behavior of the
yocto-check-layer script when running it with DISTRO=3D"nodistro" for layer=
s
that depend on recipes requiring pam, such as weston. Since the Wrynose
release and the previously mentioned git commits by Richard and Paul,
openembedded-core has switched to systemd by default and extended
DISTRO_FEATURES_DEFAULTS with wayland and vulkan. Because wayland is now
enabled by default, in certain recipes the PACKAGECONFIG option for wayland
is enabled and drags weston, causing the test_machine_world test from the
yocto-check-layer script to fail for meta-world-pkgdata if pam is not also
enabled. For example, this occurs with the l4t-graphics-demos recipe from
meta-tegra:
https://github.com/OE4T/meta-tegra/blob/master/recipes-graphics/l4t-graphic=
s-demos/l4t-graphics-demos_39.2.0.bb#L23


> Why not leave this decision to the distro or the local.conf when
> the user selects the content of the image?
>

Based on my experience with meta-tegra, these changes introduce kind of a
breaking change when running yocto-check-layer with the default
DISTRO=3D"nodistro" on layers that have recipes depending on weston. My
understanding of yocto-check-layer is that it assesses how compatible a
layer is with the Yocto Project without modifications to local.conf
therefore I don't want to add pam to DISTRO_FEATURES locally in it.
Probably there are other layers out there that are affected in the same way
by new defaults in DISTRO_FEATURES_DEFAULTS and systemd. For my particular
use case, I run yocto-check-layer for meta-tegra as follows:

source openembedded-core/oe-init-build-env build
yocto-check-layer --no-auto-dependency ../meta-tegra  --machines
jetson-orin-nano-devkit-nvme

Best regards, Leon


>
>
> Kind regards, J=C3=B6rg
>
> >  VIRTUAL-RUNTIME_init_manager ??=3D "systemd"
> >  VIRTUAL-RUNTIME_initscripts ??=3D ""
> >  VIRTUAL-RUNTIME_login_manager ??=3D "shadow-base"
> > --
> > 2.47.3
> >
>
> --
> Navimatix GmbH           T: 03641 - 327 99 0
> Tatzendpromenade 2       F: 03641 - 526 306
> 07745 Jena               www.navimatix.de
>
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480
>

--000000000000beba4f065613bd6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0J=C3=B6rg,</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 7=
, 2026 at 7:25=E2=80=AFPM J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.somm=
er@navimatix.de">joerg.sommer@navimatix.de</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Leon Anavi via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a> schrieb am Di 07. Jul, 12:02 (+0300):<br>
&gt; Add pam to the list of DISTRO_FEATURES in init-manager-systemd.inc.<br=
>
&gt; This way pam will available if variable VIRTUAL-RUNTIME_init_manager<b=
r>
&gt; has been set to systemd. Otherwise having systemd in conjunction<br>
&gt; with wayland but without pam leads to a conflict with the<br>
&gt; REQUIRED_DISTRO_FEATURES for weston related recipes.<br>
&gt; <br>
&gt; This adjustment is required following these recent changes that<br>
&gt; switched VIRTUAL-RUNTIME_init_manager to systemd by default and added<=
br>
&gt; wayland to DISTRO_FEATURES_DEFAULTS which affects &quot;nodistro&quot;=
:<br>
&gt; <br>
&gt; - 159148f4de2595556fef6e8678578df83383857b<br>
&gt;=C2=A0 =C2=A0meta: Support opting out of any distro features<br>
&gt;=C2=A0 =C2=A0(Please note that this commit also extended DISTRO_FEATURE=
S_DEFAULTS<br>
&gt;=C2=A0 =C2=A0with wayland and vulkan.)<br>
&gt; <br>
&gt; - 0b4061c5d50261f826d0edb4b478d2d305274b7c<br>
&gt;=C2=A0 =C2=A0conf: Switch to systemd by default and simplify init manag=
er selection<br>
&gt; <br>
&gt; This fixes issues with test_machine_world when running the<br>
&gt; yocto-check-layer script for BSP layers that include weston in the<br>
&gt; dependency chain, for example meta-tegra:<br>
&gt; <br>
&gt; ERROR: Required build target &#39;meta-world-pkgdata&#39; has no build=
able providers.<br>
&gt; Missing or unbuildable dependency chain was: [&#39;meta-world-pkgdata&=
#39;, &#39;l4t-graphics-demos&#39;, &#39;weston&#39;]<br>
&gt; <br>
&gt; The weston recipe has pam in REQUIRED_DISTRO_FEATURES if systemd is<br=
>
&gt; enabled. Therefore, it makes sense to also add pam to the defaults<br>
&gt; through DISTRO_FEATURES in init-manager-systemd.inc.<br>
&gt; <br>
&gt; Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.co=
m" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/init-manager-systemd.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/=
conf/distro/include/init-manager-systemd.inc<br>
&gt; index 63fd225ca5..2e9eef24b5 100644<br>
&gt; --- a/meta/conf/distro/include/init-manager-systemd.inc<br>
&gt; +++ b/meta/conf/distro/include/init-manager-systemd.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 # Use systemd for system initialization<br>
&gt; -DISTRO_FEATURES:append =3D &quot; systemd usrmerge&quot;<br>
&gt; +DISTRO_FEATURES:append =3D &quot; systemd usrmerge pam&quot;<br>
<br>
systemd and usrmerge are required features for systemd. But pam is optional=
<br>
and should be in DISTRO_FEATURES_DEFAULTS to allow for easy opt-out.<br>
<br></blockquote><div><br></div><div>Thank you for your feedback but please=
 note that version 1 of my patch was adding pam to DISTRO_FEATURES_DEFAULTS=
 if systemd was enabled. Here is a link to v1 of my patch:<br><a href=3D"ht=
tps://lists.openembedded.org/g/openembedded-core/message/240113">https://li=
sts.openembedded.org/g/openembedded-core/message/240113</a><br><br>Followin=
g the code review and feedback provided by Paul Barker I modified the patch=
 and submitted version 2. For your convenience, here is a link to Paul&#39;=
s email with his recommendation that init-manager-systemd.inc is the better=
 place for this:<br><a href=3D"https://lists.openembedded.org/g/openembedde=
d-core/message/240233">https://lists.openembedded.org/g/openembedded-core/m=
essage/240233</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
On the other side: Is pam so much common that it should be enabled by<br>
default? </blockquote><div><br></div><div><span style=3D"background-color:t=
ransparent">The purpose of my proposed patch is to fix the behavior of the =
yocto-check-layer script when running it with DISTRO=3D&quot;nodistro&quot;=
 for layers that depend on recipes requiring pam, such as weston. Since the=
 Wrynose release and the previously mentioned git commits by Richard and Pa=
ul, openembedded-core has switched to systemd by default and extended DISTR=
O_FEATURES_DEFAULTS with wayland and vulkan. Because wayland is now enabled=
 by default, in certain recipes the PACKAGECONFIG option for wayland is ena=
bled and drags weston, causing the=C2=A0</span>test_machine_world test<span=
 style=3D"background-color:transparent">=C2=A0from the yocto-check-layer sc=
ript to fail for=C2=A0</span>meta-world-pkgdata=C2=A0<span style=3D"backgro=
und-color:transparent">if pam is not also enabled. For example, this occurs=
 with the l4t-graphics-demos recipe from meta-tegra:<br></span><a href=3D"h=
ttps://github.com/OE4T/meta-tegra/blob/master/recipes-graphics/l4t-graphics=
-demos/l4t-graphics-demos_39.2.0.bb#L23">https://github.com/OE4T/meta-tegra=
/blob/master/recipes-graphics/l4t-graphics-demos/l4t-graphics-demos_39.2.0.=
bb#L23</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Why not leave this decision to the distro or the local.conf when<br=
>
the user selects the content of the image?<br></blockquote><div><br>Based o=
n my experience with meta-tegra, these changes introduce kind of a breaking=
 change when running yocto-check-layer with the default DISTRO=3D&quot;nodi=
stro&quot; on layers that have recipes depending on weston. My understandin=
g of yocto-check-layer is that it assesses how compatible a layer is with t=
he Yocto Project without modifications to local.conf therefore I don&#39;t =
want to add pam to DISTRO_FEATURES locally in it. Probably there are other =
layers out there that are affected in the same way by new defaults in DISTR=
O_FEATURES_DEFAULTS and systemd. For my particular use case, I run yocto-ch=
eck-layer for meta-tegra as follows:<br><br>source openembedded-core/oe-ini=
t-build-env build<br>yocto-check-layer --no-auto-dependency ../meta-tegra =
=C2=A0--machines jetson-orin-nano-devkit-nvme<br><br></div><div>Best regard=
s, Leon</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
<br>
Kind regards, J=C3=B6rg<br>
<br>
&gt;=C2=A0 VIRTUAL-RUNTIME_init_manager ??=3D &quot;systemd&quot;<br>
&gt;=C2=A0 VIRTUAL-RUNTIME_initscripts ??=3D &quot;&quot;<br>
&gt;=C2=A0 VIRTUAL-RUNTIME_login_manager ??=3D &quot;shadow-base&quot;<br>
&gt; -- <br>
&gt; 2.47.3<br>
&gt; <br>
<br>
-- <br>
Navimatix GmbH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0T: 03641 - 327 99 0<=
br>
Tatzendpromenade 2=C2=A0 =C2=A0 =C2=A0 =C2=A0F: 03641 - 526 306<br>
07745 Jena=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D=
"http://www.navimatix.de" rel=3D"noreferrer" target=3D"_blank">www.navimati=
x.de</a><br>
<br>
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley<br>
Registergericht: Amtsgericht Jena, HRB 501480<br>
</blockquote></div></div>

--000000000000beba4f065613bd6e--

