Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDB0C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 23:10:57 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.676.1678749056548821577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 16:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hEyYrjyu;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id a4-20020a056830008400b0069432af1380so7546014oto.13
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 16:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678749056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKSrM9/1eKGW3r1o5n9hRnsSGftFLQpliOu423pG4s4=;
        b=hEyYrjyufrRKWtByibsaQY5xEGwxjdgG3il2keVmTOZLFRBZHzfyfJCAGeOfUXZfND
         vXjkYJ9CAMc+TRhxmee6+PQdc8w8O3ZTsOT+7TpQ4+BIdnUPNXykiKajIqPlcSA8Yvsg
         cdAFeBvLPHppmToxUsqUbsNJqGWalLSLFxb0KZqEaBNaa7ZIRO/GdPjUNP9hhRX0JUsV
         ao+iIAdoFlLEnecRcgyAy1INOOgqLfyQS9CFTJPRJZs1xhbxTc9DpD0zEyejVdcMqPOv
         gkTrVejpaIpiO9dhhcvM+g5NGeBCVKxvt68qKQjrVrZJVx9WPGFAdXa3rjyDftbF1R6E
         t9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678749056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKSrM9/1eKGW3r1o5n9hRnsSGftFLQpliOu423pG4s4=;
        b=XvV5A9Wk5AhKr/CA7sUeBLM4s+QUwYu4qc3u7q0QY/99xbhPXVw94gQMqUiLnfHwLV
         z/GepowvKrEtZ7BrnjUXR1TIZjEh4Pf8CtIN6y8pY0s/lzsyM11wksmECPBxNHOf0AZ5
         7EffmU5kPcxPXEE3rFgI8nptgm929IDTN5zaiMY+Bnwvx+gGZwmVuh6lW36KVvWJuDMc
         dtY141bTS8bhCepa5TD2U2b6VhYklNSVwvNWLaZG6UsOEop6KU3tyrYjR8ZWd/e0IESp
         b0q+8jK5x0LVXbzGntkPd2YaXhSIMvTSWHdGSyI3DlhGXVn+2jx8CYPW3dvPcSsyjM3L
         vrPg==
X-Gm-Message-State: AO0yUKXk66e1J+vdGDf6wVhUtOKnCUPBHk0Nxuo+N+y7PGmr57+wroN4
	VVcY7uraYSyjHx9wpxCPWl2a3f02sMa5pv4jbRhwEXFbElw=
X-Google-Smtp-Source: AK7set/BOLPvKQ9iJMbjBmtzByWoM88MLOAFRjv5w7itRc8WOmsLkkg4PY+nt9Qz9fRXFkPuE8ptgMFCpF/BqC4C4/o=
X-Received: by 2002:a9d:1984:0:b0:696:46dd:bec7 with SMTP id
 k4-20020a9d1984000000b0069646ddbec7mr289939otk.2.1678749055728; Mon, 13 Mar
 2023 16:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230312145053.1427377-1-alex@linutronix.de> <20230312145053.1427377-2-alex@linutronix.de>
 <CAMKF1socC8aUuiZ1T9N88B7MXw_v-koQLAvO_pKE_VZfMC7Bdg@mail.gmail.com>
In-Reply-To: <CAMKF1socC8aUuiZ1T9N88B7MXw_v-koQLAvO_pKE_VZfMC7Bdg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Mar 2023 16:10:29 -0700
Message-ID: <CAMKF1sqWK65Fo4MQG09MDr27t1CLCBg3dqXUEt-CrEXbjtv4Xg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/7] bitbake.conf: do not set native opengl
 distro feature from target
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 23:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178471

also seeing below errors which are related too

ERROR: Nothing PROVIDES 'gtk4-native' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-=
bluetooth/gnome-bluetooth_42.5.bb,
/mnt/b/yoe/master/
sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-text-editor/gnome-=
text-editor_43.1.bb,
/mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-
chess/gnome-chess_43.1.bb,
/mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-=
calculator/gnome-calculator_43.0.1.bb
DEPENDS on or otherwise require
s it)
gtk4-native was skipped: missing required distro feature 'opengl' (not
in DISTRO_FEATURES)

On Mon, Mar 13, 2023 at 3:45=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> I am seeing waylandpp failing to build and YP layer compatibility tests f=
ailing.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2557/st=
eps/11/logs/stdio
>
> On Sun, Mar 12, 2023 at 7:51=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This makes native opengl (and thus accelerated graphics in qemu) opt-in=
;
> > the reason is that latest mesa tightly couples hardware drivers with it=
s libraries,
> > so we have to build both in mesa-native. Doing so significantly lengthe=
ns
> > the builds, and so cannot be imposed by default.
> >
> > Add a check and a hint to runqemu so that there is a helpful error when
> > there is no native/nativesdk opengl/virgl support.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/conf/bitbake.conf                       |  4 ++--
> >  meta/lib/oeqa/selftest/cases/runtime_test.py |  4 ++--
> >  scripts/runqemu                              | 11 ++++++++++-
> >  3 files changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index afd9e2f552..d1dc428583 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -912,8 +912,8 @@ DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> >
> >  # Normally target distro features will not be applied to native builds=
:
> >  # Native distro features on this list will use the target feature valu=
e
> > -DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod openg=
l wayland"
> > -DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod op=
engl wayland"
> > +DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod wayla=
nd"
> > +DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod wa=
yland"
> >
> >  DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspectio=
n-data ldconfig"
> >  MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
> > diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oe=
qa/selftest/cases/runtime_test.py
> > index 81b8d056cc..661c09c109 100644
> > --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> > +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> > @@ -232,7 +232,7 @@ class TestImage(OESelftestTestCase):
> >          if 'sdl' not in qemu_packageconfig:
> >              features +=3D 'PACKAGECONFIG:append:pn-qemu-system-native =
=3D " sdl"\n'
> >          if 'opengl' not in qemu_distrofeatures:
> > -            features +=3D 'DISTRO_FEATURES:append =3D " opengl"\n'
> > +            features +=3D 'DISTRO_FEATURES_NATIVE:append =3D " opengl"=
\n'
> >          features +=3D 'TEST_SUITES =3D "ping ssh virgl"\n'
> >          features +=3D 'IMAGE_FEATURES:append =3D " ssh-server-dropbear=
"\n'
> >          features +=3D 'IMAGE_INSTALL:append =3D " kmscube"\n'
> > @@ -264,7 +264,7 @@ class TestImage(OESelftestTestCase):
> >          qemu_distrofeatures =3D get_bb_var('DISTRO_FEATURES', 'qemu-sy=
stem-native')
> >          features =3D 'IMAGE_CLASSES +=3D "testimage"\n'
> >          if 'opengl' not in qemu_distrofeatures:
> > -            features +=3D 'DISTRO_FEATURES:append =3D " opengl"\n'
> > +            features +=3D 'DISTRO_FEATURES_NATIVE:append =3D " opengl"=
\n'
> >          features +=3D 'TEST_SUITES =3D "ping ssh virgl"\n'
> >          features +=3D 'IMAGE_FEATURES:append =3D " ssh-server-dropbear=
"\n'
> >          features +=3D 'IMAGE_INSTALL:append =3D " kmscube"\n'
> > diff --git a/scripts/runqemu b/scripts/runqemu
> > index 8e915f3d4c..9f82aa12f1 100755
> > --- a/scripts/runqemu
> > +++ b/scripts/runqemu
> > @@ -447,7 +447,16 @@ class BaseConfig(object):
> >              self.set("MACHINE", arg)
> >
> >      def set_dri_path(self):
> > -        self.qemu_environ['LIBGL_DRIVERS_PATH'] =3D os.path.join(self.=
bindir_native, '../lib/dri')
> > +        drivers_path =3D os.path.join(self.bindir_native, '../lib/dri'=
)
> > +        if not os.path.exists(drivers_path) or not os.listdir(drivers_=
path):
> > +            raise RunQemuError("""
> > +qemu has been built without opengl support and accelerated graphics su=
pport is not available.
> > +To enable it, add:
> > +DISTRO_FEATURES_NATIVE:append =3D " opengl"
> > +DISTRO_FEATURES_NATIVESDK:append =3D " opengl"
> > +to your build configuration.
> > +""")
> > +        self.qemu_environ['LIBGL_DRIVERS_PATH'] =3D drivers_path
> >
> >      def check_args(self):
> >          for debug in ("-d", "--debug"):
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#178393): https://lists.openembedded.org/g/openembed=
ded-core/message/178393
> > Mute This Topic: https://lists.openembedded.org/mt/97560251/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

