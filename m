Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AF7C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 09:42:56 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.8321.1678959772905732270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 02:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eeCBlsVQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id f16so964800ljq.10
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 02:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678959771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2MB4h6m2pnnug/En5V702KNm+R+Jji5bFZC/3pBJYY=;
        b=eeCBlsVQyi7PMcI4YXWbDtHbH8dPtEb+ExoKD2bUUcIL8fEKKkcUBqOpqr6p6doz2N
         SZd4KHM/yK489alC2b99U+qRl86CCyP18Ub6qkO6+WntzNpx0uYMqzthTwxCfOTVUvSi
         6ihDMqGJguT085Gn+SDjaTkrtR7orFZBgy7ULufP7gQeFlxQRBtOV1IgNTrR4Uk4+Gma
         zAG419GB9K8aLGOA8MHV/VDgjTXGSVitWioAGOKrs/KbMsI0rViokmUkd0kg1P9UGMIJ
         hAqlGzRj4ejpPuZIgZDKqngEETq9P27io7UBcY5CGFAdpDh3sUSgncBVh774uiQK+9Ri
         1uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678959771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2MB4h6m2pnnug/En5V702KNm+R+Jji5bFZC/3pBJYY=;
        b=1lZLppESEXF19Qui9KuSVevJy+/+ykH8PWRDzLpQr21NHH6v1M41//a/rXL4YWkIlo
         dYriEUNC6IPECid8ldfdtr1XYQUoSrOOcN9+EgyTNHq9EKiQSQjRjv99ByNBBQs5HPZm
         awduS31xsjXKq0reYq70leru/IUc6RicsFSMmcbpaqMHACbLuhbtEE0dpf90MF1bhqeZ
         AANr8JoNrJdX7qvGaIH/JtRYltYraa2w/xc7G9Rh1aGfJJAr/Rrmcof20d4HPaXriAVs
         BL2aAUII5wNce8d+2rqzHSo1gwSuOzzh1B7fhB2lUYibq3BZZtcYO/C/y9iDwplgg31J
         ILOw==
X-Gm-Message-State: AO0yUKUlVbgPzqZdWoFXT62k3jfLh62jHWhtaFxt4Itkh4QEbsCtCSLA
	K2VqtEe+scD8CG9sVLi3Ve3AySaQVyKBU9D2G7c=
X-Google-Smtp-Source: AK7set9f66TR1OeNcvCcAd3LAV+aES2tqCZjPrpJLz2uT2IwCl4HpDe728rySZ6QnJ503tUF26x37+ebh5PKnANTli0=
X-Received: by 2002:a2e:a496:0:b0:295:acea:5875 with SMTP id
 h22-20020a2ea496000000b00295acea5875mr1889547lji.2.1678959770920; Thu, 16 Mar
 2023 02:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230312145053.1427377-1-alex@linutronix.de> <20230312145053.1427377-2-alex@linutronix.de>
 <CAMKF1socC8aUuiZ1T9N88B7MXw_v-koQLAvO_pKE_VZfMC7Bdg@mail.gmail.com>
 <CAMKF1sqWK65Fo4MQG09MDr27t1CLCBg3dqXUEt-CrEXbjtv4Xg@mail.gmail.com>
 <174C3C4C8B75F870.18998@lists.openembedded.org> <CANNYZj8gBatFPzLP+c4CAtWXD1=qLh8RGrSH6t1bxS4pJ+Wk1g@mail.gmail.com>
 <20230315133822a043fde2@mail.local>
In-Reply-To: <20230315133822a043fde2@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 Mar 2023 10:42:39 +0100
Message-ID: <CANNYZj_d0xhN9ff801zsR8Gk0UKEZ6ePnY_qtOVy+E+oRLrSHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/7] bitbake.conf: do not set native opengl
 distro feature from target
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Markus Volk <f_l_k@t-online.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 09:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178697

I just sent a revised patchset that drops this patch and addresses the
sstatetests failure below. I did not run it through AB, but I don't
expect breakage.

Alex

On Wed, 15 Mar 2023 at 14:38, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> I did a build without this patch (as requested by Richard) and this fails=
:
>
> https://autobuilder.yoctoproject.org/typhoon/#builders/127/builds/1108/st=
eps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#builders/80/builds/4881/ste=
ps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#builders/87/builds/4962/ste=
ps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#builders/86/builds/4925/ste=
ps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#builders/79/builds/4933/ste=
ps/15/logs/stdio
>
> 2023-03-14 22:03:50,363 - oe-selftest - INFO - 5: 28/29 389/524 (117.66s)=
 (0 failed) (sstatetests.SStateHashSameSigs.test_sstate_32_64_same_hash)
> 2023-03-14 22:03:50,363 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oe=
qa/selftest/cases/sstatetests.py", line 384, in test_sstate_32_64_same_hash
>     self.assertCountEqual(files1, files2)
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/=
sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/unittest/case.py", line 12=
33, in assertCountEqual
>     self.fail(msg)
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/=
sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/unittest/case.py", line 70=
3, in fail
>     raise self.failureException(msg)
> AssertionError: Element counts were not equal:
> First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest-cen=
tos/build/build-st-3258797/tmp-sstatesamehash/stamps/x86_64-linux/qemu-syst=
em-native/7.2.0-r0.do_install.sigdata.d8cf53551eece8c83f2c7af7604df092d24c8=
22c2e81b1f24db8387e2725b79a'
> First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest-cen=
tos/build/build-st-3258797/tmp-sstatesamehash/stamps/x86_64-linux/qemu-syst=
em-native/7.2.0-r0.do_configure.sigdata.7d1cb6d46ec6af33727e5a149e9e3adc948=
cfc5b008523c7ac59e9e909087e53'
> [...]
>
> On 14/03/2023 10:30:14+0100, Alexander Kanavin wrote:
> > On second thought I'm not sure anymore. The issue comes from items
> > requiring -native versions of themselves, and REQUIRED_DISTRO_FEATURES
> > (which skips unbuildable recipes) doesn't cross that boundary. If
> > opengl is in target features, but not in native features, then it
> > won't figure out that skipping is required.
> >
> > Should we just keep opengl in native distro features by default?
> > Sooner or later there will be an item in core that needs gtk4-native
> > (and thus mesa-native and llvm-native). Llvm is not *that* heavy, rust
> > for example is four times heavier.
> >
> > Alex
> >
> > On Tue, 14 Mar 2023 at 09:37, Alexander Kanavin via
> > lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org=
>
> > wrote:
> > >
> > > This means opengl has to be added to DISTRO_FEATURES_NATIVE for this
> > > build. I'll send a patch.
> > >
> > > Alex
> > >
> > > On Tue, 14 Mar 2023 at 00:10, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > also seeing below errors which are related too
> > > >
> > > > ERROR: Nothing PROVIDES 'gtk4-native' (but
> > > > /mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnom=
e/gnome-bluetooth/gnome-bluetooth_42.5.bb,
> > > > /mnt/b/yoe/master/
> > > > sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-text-edito=
r/gnome-text-editor_43.1.bb,
> > > > /mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnom=
e/gnome-
> > > > chess/gnome-chess_43.1.bb,
> > > > /mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnom=
e/gnome-calculator/gnome-calculator_43.0.1.bb
> > > > DEPENDS on or otherwise require
> > > > s it)
> > > > gtk4-native was skipped: missing required distro feature 'opengl' (=
not
> > > > in DISTRO_FEATURES)
> > > >
> > > > On Mon, Mar 13, 2023 at 3:45=E2=80=AFPM Khem Raj <raj.khem@gmail.co=
m> wrote:
> > > > >
> > > > > I am seeing waylandpp failing to build and YP layer compatibility=
 tests failing.
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds=
/2557/steps/11/logs/stdio
> > > > >
> > > > > On Sun, Mar 12, 2023 at 7:51=E2=80=AFAM Alexander Kanavin
> > > > > <alex.kanavin@gmail.com> wrote:
> > > > > >
> > > > > > This makes native opengl (and thus accelerated graphics in qemu=
) opt-in;
> > > > > > the reason is that latest mesa tightly couples hardware drivers=
 with its libraries,
> > > > > > so we have to build both in mesa-native. Doing so significantly=
 lengthens
> > > > > > the builds, and so cannot be imposed by default.
> > > > > >
> > > > > > Add a check and a hint to runqemu so that there is a helpful er=
ror when
> > > > > > there is no native/nativesdk opengl/virgl support.
> > > > > >
> > > > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > > > ---
> > > > > >  meta/conf/bitbake.conf                       |  4 ++--
> > > > > >  meta/lib/oeqa/selftest/cases/runtime_test.py |  4 ++--
> > > > > >  scripts/runqemu                              | 11 ++++++++++-
> > > > > >  3 files changed, 14 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > > > > index afd9e2f552..d1dc428583 100644
> > > > > > --- a/meta/conf/bitbake.conf
> > > > > > +++ b/meta/conf/bitbake.conf
> > > > > > @@ -912,8 +912,8 @@ DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> > > > > >
> > > > > >  # Normally target distro features will not be applied to nativ=
e builds:
> > > > > >  # Native distro features on this list will use the target feat=
ure value
> > > > > > -DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginf=
od opengl wayland"
> > > > > > -DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debug=
infod opengl wayland"
> > > > > > +DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginf=
od wayland"
> > > > > > +DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debug=
infod wayland"
> > > > > >
> > > > > >  DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-intr=
ospection-data ldconfig"
> > > > > >  MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
> > > > > > diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/met=
a/lib/oeqa/selftest/cases/runtime_test.py
> > > > > > index 81b8d056cc..661c09c109 100644
> > > > > > --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> > > > > > +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> > > > > > @@ -232,7 +232,7 @@ class TestImage(OESelftestTestCase):
> > > > > >          if 'sdl' not in qemu_packageconfig:
> > > > > >              features +=3D 'PACKAGECONFIG:append:pn-qemu-system=
-native =3D " sdl"\n'
> > > > > >          if 'opengl' not in qemu_distrofeatures:
> > > > > > -            features +=3D 'DISTRO_FEATURES:append =3D " opengl=
"\n'
> > > > > > +            features +=3D 'DISTRO_FEATURES_NATIVE:append =3D "=
 opengl"\n'
> > > > > >          features +=3D 'TEST_SUITES =3D "ping ssh virgl"\n'
> > > > > >          features +=3D 'IMAGE_FEATURES:append =3D " ssh-server-=
dropbear"\n'
> > > > > >          features +=3D 'IMAGE_INSTALL:append =3D " kmscube"\n'
> > > > > > @@ -264,7 +264,7 @@ class TestImage(OESelftestTestCase):
> > > > > >          qemu_distrofeatures =3D get_bb_var('DISTRO_FEATURES', =
'qemu-system-native')
> > > > > >          features =3D 'IMAGE_CLASSES +=3D "testimage"\n'
> > > > > >          if 'opengl' not in qemu_distrofeatures:
> > > > > > -            features +=3D 'DISTRO_FEATURES:append =3D " opengl=
"\n'
> > > > > > +            features +=3D 'DISTRO_FEATURES_NATIVE:append =3D "=
 opengl"\n'
> > > > > >          features +=3D 'TEST_SUITES =3D "ping ssh virgl"\n'
> > > > > >          features +=3D 'IMAGE_FEATURES:append =3D " ssh-server-=
dropbear"\n'
> > > > > >          features +=3D 'IMAGE_INSTALL:append =3D " kmscube"\n'
> > > > > > diff --git a/scripts/runqemu b/scripts/runqemu
> > > > > > index 8e915f3d4c..9f82aa12f1 100755
> > > > > > --- a/scripts/runqemu
> > > > > > +++ b/scripts/runqemu
> > > > > > @@ -447,7 +447,16 @@ class BaseConfig(object):
> > > > > >              self.set("MACHINE", arg)
> > > > > >
> > > > > >      def set_dri_path(self):
> > > > > > -        self.qemu_environ['LIBGL_DRIVERS_PATH'] =3D os.path.jo=
in(self.bindir_native, '../lib/dri')
> > > > > > +        drivers_path =3D os.path.join(self.bindir_native, '../=
lib/dri')
> > > > > > +        if not os.path.exists(drivers_path) or not os.listdir(=
drivers_path):
> > > > > > +            raise RunQemuError("""
> > > > > > +qemu has been built without opengl support and accelerated gra=
phics support is not available.
> > > > > > +To enable it, add:
> > > > > > +DISTRO_FEATURES_NATIVE:append =3D " opengl"
> > > > > > +DISTRO_FEATURES_NATIVESDK:append =3D " opengl"
> > > > > > +to your build configuration.
> > > > > > +""")
> > > > > > +        self.qemu_environ['LIBGL_DRIVERS_PATH'] =3D drivers_pa=
th
> > > > > >
> > > > > >      def check_args(self):
> > > > > >          for debug in ("-d", "--debug"):
> > > > > > --
> > > > > > 2.30.2
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > >
> > >
> > >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#178478): https://lists.openembedded.org/g/openembed=
ded-core/message/178478
> > Mute This Topic: https://lists.openembedded.org/mt/97560251/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

