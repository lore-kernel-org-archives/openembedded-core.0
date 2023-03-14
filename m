Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55E8C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 09:30:30 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.4573.1678786227668981283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 02:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c40C2QTe;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id g18so15339158ljl.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 02:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678786225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6fYssV85HEFwrpbCAn2jig6FsrvPN0YEGFvr4xs+g8=;
        b=c40C2QTeid7jEDE9mX+7xVQk0aWUJXcmDDK6MS8lkLOPzJMmGtDMRtUkTLR3qL1GY7
         O0DcI89VryLMWXS63GZo/pJHjqY/OZrXGw8wBAF1h0GtlC76UmLKjCpN7LoWGGAkL8hx
         wvXLeS+ja+BmK+c7t8+ivzCInwTBScqsf2/HNHV5EOC+SNwfMqmVtCgDVomcobkNYWFc
         BQBBpn1dLk/MA9ad1G60fU++asA6mp+UF7Geq75Y1KrHLEctHxU9RMX8cDNGfZh8sLAE
         VyJdL7uXadGMNQuqCUVkuwAUvFi4evqcmlsejf1ggB8d8JjfnYdbtiPNuAnCdV1yqSyf
         +sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678786225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6fYssV85HEFwrpbCAn2jig6FsrvPN0YEGFvr4xs+g8=;
        b=lsqrqC0JbluKRmYfGZhALPR2oeo9WkhVtZGsEpjL+9UBxXZHknN5zjQTAMmRAHSaYP
         mpg6nolnOolK+z+8sraVcqC1s0/48PkMB/MlYDF8HEF+W4/xA1tNl5NsqfX+97Psf6Kw
         Ir3aQuhj0IcDko5CSoJcuhwOKhOpyauVD2VuH17xOH9mCZihKbUdykypyqiQ5jqKeODl
         lOqcl3kZM3qULIFTGCR21GPLCUDj1LuPiQ3ip8MM6ubWA8ZIURJ1dTssf024UD4/fiFO
         a5hQ7PC2YD+2fBK+IhMv2x0H8cA44Sg1E+SzaF7Iur/fEhdjs4WA3Aax1lJjkUetsI3t
         1Mkg==
X-Gm-Message-State: AO0yUKWD8k4WojTLhTl8BLuVCN7WUaVuUVBCD7O1zGolIiaCFitaCIUJ
	1oN46l3wris+yws3gfy18oX3SE+LYRxSOE7DtOY=
X-Google-Smtp-Source: AK7set+aNP0M4Mpat1dB1unFlIf4gHmJdDgY4CRuXs1HeIlQE7TWr++6aURMTpeCWYte+rtmZevRUqHqavVcJq3SENo=
X-Received: by 2002:a05:651c:1722:b0:298:6d79:c6d7 with SMTP id
 be34-20020a05651c172200b002986d79c6d7mr6818300ljb.7.1678786225502; Tue, 14
 Mar 2023 02:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230312145053.1427377-1-alex@linutronix.de> <20230312145053.1427377-2-alex@linutronix.de>
 <CAMKF1socC8aUuiZ1T9N88B7MXw_v-koQLAvO_pKE_VZfMC7Bdg@mail.gmail.com>
 <CAMKF1sqWK65Fo4MQG09MDr27t1CLCBg3dqXUEt-CrEXbjtv4Xg@mail.gmail.com> <174C3C4C8B75F870.18998@lists.openembedded.org>
In-Reply-To: <174C3C4C8B75F870.18998@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Mar 2023 10:30:14 +0100
Message-ID: <CANNYZj8gBatFPzLP+c4CAtWXD1=qLh8RGrSH6t1bxS4pJ+Wk1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/7] bitbake.conf: do not set native opengl
 distro feature from target
To: alex.kanavin@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Markus Volk <f_l_k@t-online.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 09:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178478

On second thought I'm not sure anymore. The issue comes from items
requiring -native versions of themselves, and REQUIRED_DISTRO_FEATURES
(which skips unbuildable recipes) doesn't cross that boundary. If
opengl is in target features, but not in native features, then it
won't figure out that skipping is required.

Should we just keep opengl in native distro features by default?
Sooner or later there will be an item in core that needs gtk4-native
(and thus mesa-native and llvm-native). Llvm is not *that* heavy, rust
for example is four times heavier.

Alex

On Tue, 14 Mar 2023 at 09:37, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This means opengl has to be added to DISTRO_FEATURES_NATIVE for this
> build. I'll send a patch.
>
> Alex
>
> On Tue, 14 Mar 2023 at 00:10, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > also seeing below errors which are related too
> >
> > ERROR: Nothing PROVIDES 'gtk4-native' (but
> > /mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gn=
ome-bluetooth/gnome-bluetooth_42.5.bb,
> > /mnt/b/yoe/master/
> > sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-text-editor/gn=
ome-text-editor_43.1.bb,
> > /mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gn=
ome-
> > chess/gnome-chess_43.1.bb,
> > /mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gn=
ome-calculator/gnome-calculator_43.0.1.bb
> > DEPENDS on or otherwise require
> > s it)
> > gtk4-native was skipped: missing required distro feature 'opengl' (not
> > in DISTRO_FEATURES)
> >
> > On Mon, Mar 13, 2023 at 3:45=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > I am seeing waylandpp failing to build and YP layer compatibility tes=
ts failing.
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/255=
7/steps/11/logs/stdio
> > >
> > > On Sun, Mar 12, 2023 at 7:51=E2=80=AFAM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > This makes native opengl (and thus accelerated graphics in qemu) op=
t-in;
> > > > the reason is that latest mesa tightly couples hardware drivers wit=
h its libraries,
> > > > so we have to build both in mesa-native. Doing so significantly len=
gthens
> > > > the builds, and so cannot be imposed by default.
> > > >
> > > > Add a check and a hint to runqemu so that there is a helpful error =
when
> > > > there is no native/nativesdk opengl/virgl support.
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > ---
> > > >  meta/conf/bitbake.conf                       |  4 ++--
> > > >  meta/lib/oeqa/selftest/cases/runtime_test.py |  4 ++--
> > > >  scripts/runqemu                              | 11 ++++++++++-
> > > >  3 files changed, 14 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > > index afd9e2f552..d1dc428583 100644
> > > > --- a/meta/conf/bitbake.conf
> > > > +++ b/meta/conf/bitbake.conf
> > > > @@ -912,8 +912,8 @@ DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> > > >
> > > >  # Normally target distro features will not be applied to native bu=
ilds:
> > > >  # Native distro features on this list will use the target feature =
value
> > > > -DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod o=
pengl wayland"
> > > > -DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfo=
d opengl wayland"
> > > > +DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod w=
ayland"
> > > > +DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfo=
d wayland"
> > > >
> > > >  DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspe=
ction-data ldconfig"
> > > >  MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
> > > > diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/li=
b/oeqa/selftest/cases/runtime_test.py
> > > > index 81b8d056cc..661c09c109 100644
> > > > --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> > > > +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> > > > @@ -232,7 +232,7 @@ class TestImage(OESelftestTestCase):
> > > >          if 'sdl' not in qemu_packageconfig:
> > > >              features +=3D 'PACKAGECONFIG:append:pn-qemu-system-nat=
ive =3D " sdl"\n'
> > > >          if 'opengl' not in qemu_distrofeatures:
> > > > -            features +=3D 'DISTRO_FEATURES:append =3D " opengl"\n'
> > > > +            features +=3D 'DISTRO_FEATURES_NATIVE:append =3D " ope=
ngl"\n'
> > > >          features +=3D 'TEST_SUITES =3D "ping ssh virgl"\n'
> > > >          features +=3D 'IMAGE_FEATURES:append =3D " ssh-server-drop=
bear"\n'
> > > >          features +=3D 'IMAGE_INSTALL:append =3D " kmscube"\n'
> > > > @@ -264,7 +264,7 @@ class TestImage(OESelftestTestCase):
> > > >          qemu_distrofeatures =3D get_bb_var('DISTRO_FEATURES', 'qem=
u-system-native')
> > > >          features =3D 'IMAGE_CLASSES +=3D "testimage"\n'
> > > >          if 'opengl' not in qemu_distrofeatures:
> > > > -            features +=3D 'DISTRO_FEATURES:append =3D " opengl"\n'
> > > > +            features +=3D 'DISTRO_FEATURES_NATIVE:append =3D " ope=
ngl"\n'
> > > >          features +=3D 'TEST_SUITES =3D "ping ssh virgl"\n'
> > > >          features +=3D 'IMAGE_FEATURES:append =3D " ssh-server-drop=
bear"\n'
> > > >          features +=3D 'IMAGE_INSTALL:append =3D " kmscube"\n'
> > > > diff --git a/scripts/runqemu b/scripts/runqemu
> > > > index 8e915f3d4c..9f82aa12f1 100755
> > > > --- a/scripts/runqemu
> > > > +++ b/scripts/runqemu
> > > > @@ -447,7 +447,16 @@ class BaseConfig(object):
> > > >              self.set("MACHINE", arg)
> > > >
> > > >      def set_dri_path(self):
> > > > -        self.qemu_environ['LIBGL_DRIVERS_PATH'] =3D os.path.join(s=
elf.bindir_native, '../lib/dri')
> > > > +        drivers_path =3D os.path.join(self.bindir_native, '../lib/=
dri')
> > > > +        if not os.path.exists(drivers_path) or not os.listdir(driv=
ers_path):
> > > > +            raise RunQemuError("""
> > > > +qemu has been built without opengl support and accelerated graphic=
s support is not available.
> > > > +To enable it, add:
> > > > +DISTRO_FEATURES_NATIVE:append =3D " opengl"
> > > > +DISTRO_FEATURES_NATIVESDK:append =3D " opengl"
> > > > +to your build configuration.
> > > > +""")
> > > > +        self.qemu_environ['LIBGL_DRIVERS_PATH'] =3D drivers_path
> > > >
> > > >      def check_args(self):
> > > >          for debug in ("-d", "--debug"):
> > > > --
> > > > 2.30.2
> > > >
> > > >
> > > >
> > > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178476): https://lists.openembedded.org/g/openembedde=
d-core/message/178476
> Mute This Topic: https://lists.openembedded.org/mt/97560251/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

