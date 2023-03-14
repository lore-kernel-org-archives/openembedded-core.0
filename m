Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBFFC6FD1F
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 08:37:50 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.4006.1678783060103608282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 01:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RtjqD35d;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id a32so15170825ljq.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 01:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678783058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+CiTbbdKxWJM9sZ7M8kCYsCYZAZ0vYQtmE72qJQKF8=;
        b=RtjqD35d41f44SnK/PjgIeqncOG7UVEHrJsqGNWJcyinAsf3QZoAATwCYlEi4gu3u7
         I3IRPOHXE/CuLyUK1gOx8U/P84JUeuQKKYFdNBq3Wrk9UJQdq6SMCq6XWHaQ/YUSb4b4
         mhE7xW6TShEkUeidJpkmBhBJoBcFSntLwBv4Poxz5Hpg9bnwiSJQiFTMhV5JfEys/lnY
         aubFx54i3Pis1iztznBIV8eQoITrcxrk0rlgw1jidM7iDBfvNGHew8kg99NMwfdRaLJz
         X1sPIiKVbU1gAx+f4nxPMkzXZ3H9kegpHJFlXv4P0pLT2rCp/w8U5h09hAfv+teoV9XG
         CBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678783058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+CiTbbdKxWJM9sZ7M8kCYsCYZAZ0vYQtmE72qJQKF8=;
        b=Rd5jUjVHDIGXVmhYgihzGFTrBkRBPCfCmu8+QwXKnf8vWHJ/dsstF0oaXR27Kunsov
         0Ls38KtdWKstNHJtQhP57rHZe/sxw+QV6FPdwO/cuDOjPU3JkQY6va+1uglUo4lbUQBI
         1UOfNeOs1iixrm7NSA6t3GSjh3CyDGlKSs2UJz5qyifW0eDcvUKMn/25Wv50uwNYBntG
         Kp92+cYgbmAT5O0rP1xHG6c8QOdKFyxUzjYtTfQLYL8kA5YPi2HgCh+w6xh+lfM3/wpi
         0qs9Y9ROx21AXNXVsAp35/Iu6ncG7kVANl5dkDM7wUraKSDqiKKzHa3u7GU9hA2iLV1U
         s9cg==
X-Gm-Message-State: AO0yUKWV0bmJ7UHG/HmLSIJUtqj9JTa8zBdydCPRKDwV/j9ur6+8smqy
	cyoKvZmvzdWmzkWayKRgMrpzEH6gTK8gjKSeFZk=
X-Google-Smtp-Source: AK7set9UoL3CLRF1iq4sCsesSqd6c4599uPhFxjncvDKYdPERgP/i6E+U23nHh2rXTSZXRRxJu9MCaOxwi5FeHw+n3E=
X-Received: by 2002:a05:651c:1722:b0:298:6d79:c6d7 with SMTP id
 be34-20020a05651c172200b002986d79c6d7mr6769526ljb.7.1678783058053; Tue, 14
 Mar 2023 01:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230312145053.1427377-1-alex@linutronix.de> <20230312145053.1427377-2-alex@linutronix.de>
 <CAMKF1socC8aUuiZ1T9N88B7MXw_v-koQLAvO_pKE_VZfMC7Bdg@mail.gmail.com> <CAMKF1sqWK65Fo4MQG09MDr27t1CLCBg3dqXUEt-CrEXbjtv4Xg@mail.gmail.com>
In-Reply-To: <CAMKF1sqWK65Fo4MQG09MDr27t1CLCBg3dqXUEt-CrEXbjtv4Xg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Mar 2023 09:37:26 +0100
Message-ID: <CANNYZj91A=R5LbSjTwA+K+WTpgeQVnAZWq1dkG0yr2XsK6oLcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/7] bitbake.conf: do not set native opengl
 distro feature from target
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178476

This means opengl has to be added to DISTRO_FEATURES_NATIVE for this
build. I'll send a patch.

Alex

On Tue, 14 Mar 2023 at 00:10, Khem Raj <raj.khem@gmail.com> wrote:
>
> also seeing below errors which are related too
>
> ERROR: Nothing PROVIDES 'gtk4-native' (but
> /mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gnom=
e-bluetooth/gnome-bluetooth_42.5.bb,
> /mnt/b/yoe/master/
> sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-text-editor/gnom=
e-text-editor_43.1.bb,
> /mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gnom=
e-
> chess/gnome-chess_43.1.bb,
> /mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gnom=
e-calculator/gnome-calculator_43.0.1.bb
> DEPENDS on or otherwise require
> s it)
> gtk4-native was skipped: missing required distro feature 'opengl' (not
> in DISTRO_FEATURES)
>
> On Mon, Mar 13, 2023 at 3:45=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > I am seeing waylandpp failing to build and YP layer compatibility tests=
 failing.
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2557/=
steps/11/logs/stdio
> >
> > On Sun, Mar 12, 2023 at 7:51=E2=80=AFAM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > This makes native opengl (and thus accelerated graphics in qemu) opt-=
in;
> > > the reason is that latest mesa tightly couples hardware drivers with =
its libraries,
> > > so we have to build both in mesa-native. Doing so significantly lengt=
hens
> > > the builds, and so cannot be imposed by default.
> > >
> > > Add a check and a hint to runqemu so that there is a helpful error wh=
en
> > > there is no native/nativesdk opengl/virgl support.
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  meta/conf/bitbake.conf                       |  4 ++--
> > >  meta/lib/oeqa/selftest/cases/runtime_test.py |  4 ++--
> > >  scripts/runqemu                              | 11 ++++++++++-
> > >  3 files changed, 14 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index afd9e2f552..d1dc428583 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -912,8 +912,8 @@ DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> > >
> > >  # Normally target distro features will not be applied to native buil=
ds:
> > >  # Native distro features on this list will use the target feature va=
lue
> > > -DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod ope=
ngl wayland"
> > > -DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod =
opengl wayland"
> > > +DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod way=
land"
> > > +DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod =
wayland"
> > >
> > >  DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspect=
ion-data ldconfig"
> > >  MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
> > > diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/=
oeqa/selftest/cases/runtime_test.py
> > > index 81b8d056cc..661c09c109 100644
> > > --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> > > +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> > > @@ -232,7 +232,7 @@ class TestImage(OESelftestTestCase):
> > >          if 'sdl' not in qemu_packageconfig:
> > >              features +=3D 'PACKAGECONFIG:append:pn-qemu-system-nativ=
e =3D " sdl"\n'
> > >          if 'opengl' not in qemu_distrofeatures:
> > > -            features +=3D 'DISTRO_FEATURES:append =3D " opengl"\n'
> > > +            features +=3D 'DISTRO_FEATURES_NATIVE:append =3D " openg=
l"\n'
> > >          features +=3D 'TEST_SUITES =3D "ping ssh virgl"\n'
> > >          features +=3D 'IMAGE_FEATURES:append =3D " ssh-server-dropbe=
ar"\n'
> > >          features +=3D 'IMAGE_INSTALL:append =3D " kmscube"\n'
> > > @@ -264,7 +264,7 @@ class TestImage(OESelftestTestCase):
> > >          qemu_distrofeatures =3D get_bb_var('DISTRO_FEATURES', 'qemu-=
system-native')
> > >          features =3D 'IMAGE_CLASSES +=3D "testimage"\n'
> > >          if 'opengl' not in qemu_distrofeatures:
> > > -            features +=3D 'DISTRO_FEATURES:append =3D " opengl"\n'
> > > +            features +=3D 'DISTRO_FEATURES_NATIVE:append =3D " openg=
l"\n'
> > >          features +=3D 'TEST_SUITES =3D "ping ssh virgl"\n'
> > >          features +=3D 'IMAGE_FEATURES:append =3D " ssh-server-dropbe=
ar"\n'
> > >          features +=3D 'IMAGE_INSTALL:append =3D " kmscube"\n'
> > > diff --git a/scripts/runqemu b/scripts/runqemu
> > > index 8e915f3d4c..9f82aa12f1 100755
> > > --- a/scripts/runqemu
> > > +++ b/scripts/runqemu
> > > @@ -447,7 +447,16 @@ class BaseConfig(object):
> > >              self.set("MACHINE", arg)
> > >
> > >      def set_dri_path(self):
> > > -        self.qemu_environ['LIBGL_DRIVERS_PATH'] =3D os.path.join(sel=
f.bindir_native, '../lib/dri')
> > > +        drivers_path =3D os.path.join(self.bindir_native, '../lib/dr=
i')
> > > +        if not os.path.exists(drivers_path) or not os.listdir(driver=
s_path):
> > > +            raise RunQemuError("""
> > > +qemu has been built without opengl support and accelerated graphics =
support is not available.
> > > +To enable it, add:
> > > +DISTRO_FEATURES_NATIVE:append =3D " opengl"
> > > +DISTRO_FEATURES_NATIVESDK:append =3D " opengl"
> > > +to your build configuration.
> > > +""")
> > > +        self.qemu_environ['LIBGL_DRIVERS_PATH'] =3D drivers_path
> > >
> > >      def check_args(self):
> > >          for debug in ("-d", "--debug"):
> > > --
> > > 2.30.2
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#178393): https://lists.openembedded.org/g/openemb=
edded-core/message/178393
> > > Mute This Topic: https://lists.openembedded.org/mt/97560251/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

