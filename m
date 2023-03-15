Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D95C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 13:38:30 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.8186.1678887507220492464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 06:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dKDlc5At;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1873F240017;
	Wed, 15 Mar 2023 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678887504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/PBxNvdgogwhsU0XJiItSkABQpK0geXP8foQaRv86M=;
	b=dKDlc5AtTD/yGjDbAEcp3WTEsGhBjln5WoM0MQJs31ggmr8yP6yTOtMXpEUfwxFHgATbi5
	w9cTUk1y+lgtr0tQyDar5C3YB1AX0ti4acet20I8PEZsFmm2c5ZS6A9CfNuE6OpwvgOdqC
	5o2mb9/pD31G7/NubKsyiFZsd4rMlt9+DhD1RDTGBq5T9UNw9fYIr5AmnnRXXHmpYFFinf
	Oyr8M5Mxl8M+RKO+HIKrb4oABHb/BUp0eAt7wbMFUeVUaKpeBCnNuTjWw73G9j+R4pb6b8
	hm4+PAmm+3vUnVUiaDa1p4XzKXhe9GuD9SIankUBSrzMI/agad2+lbmGYwsg4Q==
Date: Wed, 15 Mar 2023 14:38:22 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>,
	Markus Volk <f_l_k@t-online.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/7] bitbake.conf: do not set native opengl
 distro feature from target
Message-ID: <20230315133822a043fde2@mail.local>
References: <20230312145053.1427377-1-alex@linutronix.de>
 <20230312145053.1427377-2-alex@linutronix.de>
 <CAMKF1socC8aUuiZ1T9N88B7MXw_v-koQLAvO_pKE_VZfMC7Bdg@mail.gmail.com>
 <CAMKF1sqWK65Fo4MQG09MDr27t1CLCBg3dqXUEt-CrEXbjtv4Xg@mail.gmail.com>
 <174C3C4C8B75F870.18998@lists.openembedded.org>
 <CANNYZj8gBatFPzLP+c4CAtWXD1=qLh8RGrSH6t1bxS4pJ+Wk1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANNYZj8gBatFPzLP+c4CAtWXD1=qLh8RGrSH6t1bxS4pJ+Wk1g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 13:38:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178548

Hello,

I did a build without this patch (as requested by Richard) and this fails:

https://autobuilder.yoctoproject.org/typhoon/#builders/127/builds/1108/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/80/builds/4881/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/87/builds/4962/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/86/builds/4925/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/79/builds/4933/steps/15/logs/stdio

2023-03-14 22:03:50,363 - oe-selftest - INFO - 5: 28/29 389/524 (117.66s) (0 failed) (sstatetests.SStateHashSameSigs.test_sstate_32_64_same_hash)
2023-03-14 22:03:50,363 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/sstatetests.py", line 384, in test_sstate_32_64_same_hash
    self.assertCountEqual(files1, files2)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/unittest/case.py", line 1233, in assertCountEqual
    self.fail(msg)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/unittest/case.py", line 703, in fail
    raise self.failureException(msg)
AssertionError: Element counts were not equal:
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3258797/tmp-sstatesamehash/stamps/x86_64-linux/qemu-system-native/7.2.0-r0.do_install.sigdata.d8cf53551eece8c83f2c7af7604df092d24c822c2e81b1f24db8387e2725b79a'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3258797/tmp-sstatesamehash/stamps/x86_64-linux/qemu-system-native/7.2.0-r0.do_configure.sigdata.7d1cb6d46ec6af33727e5a149e9e3adc948cfc5b008523c7ac59e9e909087e53'
[...]

On 14/03/2023 10:30:14+0100, Alexander Kanavin wrote:
> On second thought I'm not sure anymore. The issue comes from items
> requiring -native versions of themselves, and REQUIRED_DISTRO_FEATURES
> (which skips unbuildable recipes) doesn't cross that boundary. If
> opengl is in target features, but not in native features, then it
> won't figure out that skipping is required.
> 
> Should we just keep opengl in native distro features by default?
> Sooner or later there will be an item in core that needs gtk4-native
> (and thus mesa-native and llvm-native). Llvm is not *that* heavy, rust
> for example is four times heavier.
> 
> Alex
> 
> On Tue, 14 Mar 2023 at 09:37, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> >
> > This means opengl has to be added to DISTRO_FEATURES_NATIVE for this
> > build. I'll send a patch.
> >
> > Alex
> >
> > On Tue, 14 Mar 2023 at 00:10, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > also seeing below errors which are related too
> > >
> > > ERROR: Nothing PROVIDES 'gtk4-native' (but
> > > /mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.5.bb,
> > > /mnt/b/yoe/master/
> > > sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_43.1.bb,
> > > /mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-
> > > chess/gnome-chess_43.1.bb,
> > > /mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_43.0.1.bb
> > > DEPENDS on or otherwise require
> > > s it)
> > > gtk4-native was skipped: missing required distro feature 'opengl' (not
> > > in DISTRO_FEATURES)
> > >
> > > On Mon, Mar 13, 2023 at 3:45 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > I am seeing waylandpp failing to build and YP layer compatibility tests failing.
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2557/steps/11/logs/stdio
> > > >
> > > > On Sun, Mar 12, 2023 at 7:51 AM Alexander Kanavin
> > > > <alex.kanavin@gmail.com> wrote:
> > > > >
> > > > > This makes native opengl (and thus accelerated graphics in qemu) opt-in;
> > > > > the reason is that latest mesa tightly couples hardware drivers with its libraries,
> > > > > so we have to build both in mesa-native. Doing so significantly lengthens
> > > > > the builds, and so cannot be imposed by default.
> > > > >
> > > > > Add a check and a hint to runqemu so that there is a helpful error when
> > > > > there is no native/nativesdk opengl/virgl support.
> > > > >
> > > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > > ---
> > > > >  meta/conf/bitbake.conf                       |  4 ++--
> > > > >  meta/lib/oeqa/selftest/cases/runtime_test.py |  4 ++--
> > > > >  scripts/runqemu                              | 11 ++++++++++-
> > > > >  3 files changed, 14 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > > > index afd9e2f552..d1dc428583 100644
> > > > > --- a/meta/conf/bitbake.conf
> > > > > +++ b/meta/conf/bitbake.conf
> > > > > @@ -912,8 +912,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
> > > > >
> > > > >  # Normally target distro features will not be applied to native builds:
> > > > >  # Native distro features on this list will use the target feature value
> > > > > -DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl wayland"
> > > > > -DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl wayland"
> > > > > +DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod wayland"
> > > > > +DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod wayland"
> > > > >
> > > > >  DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
> > > > >  MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
> > > > > diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
> > > > > index 81b8d056cc..661c09c109 100644
> > > > > --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> > > > > +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> > > > > @@ -232,7 +232,7 @@ class TestImage(OESelftestTestCase):
> > > > >          if 'sdl' not in qemu_packageconfig:
> > > > >              features += 'PACKAGECONFIG:append:pn-qemu-system-native = " sdl"\n'
> > > > >          if 'opengl' not in qemu_distrofeatures:
> > > > > -            features += 'DISTRO_FEATURES:append = " opengl"\n'
> > > > > +            features += 'DISTRO_FEATURES_NATIVE:append = " opengl"\n'
> > > > >          features += 'TEST_SUITES = "ping ssh virgl"\n'
> > > > >          features += 'IMAGE_FEATURES:append = " ssh-server-dropbear"\n'
> > > > >          features += 'IMAGE_INSTALL:append = " kmscube"\n'
> > > > > @@ -264,7 +264,7 @@ class TestImage(OESelftestTestCase):
> > > > >          qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
> > > > >          features = 'IMAGE_CLASSES += "testimage"\n'
> > > > >          if 'opengl' not in qemu_distrofeatures:
> > > > > -            features += 'DISTRO_FEATURES:append = " opengl"\n'
> > > > > +            features += 'DISTRO_FEATURES_NATIVE:append = " opengl"\n'
> > > > >          features += 'TEST_SUITES = "ping ssh virgl"\n'
> > > > >          features += 'IMAGE_FEATURES:append = " ssh-server-dropbear"\n'
> > > > >          features += 'IMAGE_INSTALL:append = " kmscube"\n'
> > > > > diff --git a/scripts/runqemu b/scripts/runqemu
> > > > > index 8e915f3d4c..9f82aa12f1 100755
> > > > > --- a/scripts/runqemu
> > > > > +++ b/scripts/runqemu
> > > > > @@ -447,7 +447,16 @@ class BaseConfig(object):
> > > > >              self.set("MACHINE", arg)
> > > > >
> > > > >      def set_dri_path(self):
> > > > > -        self.qemu_environ['LIBGL_DRIVERS_PATH'] = os.path.join(self.bindir_native, '../lib/dri')
> > > > > +        drivers_path = os.path.join(self.bindir_native, '../lib/dri')
> > > > > +        if not os.path.exists(drivers_path) or not os.listdir(drivers_path):
> > > > > +            raise RunQemuError("""
> > > > > +qemu has been built without opengl support and accelerated graphics support is not available.
> > > > > +To enable it, add:
> > > > > +DISTRO_FEATURES_NATIVE:append = " opengl"
> > > > > +DISTRO_FEATURES_NATIVESDK:append = " opengl"
> > > > > +to your build configuration.
> > > > > +""")
> > > > > +        self.qemu_environ['LIBGL_DRIVERS_PATH'] = drivers_path
> > > > >
> > > > >      def check_args(self):
> > > > >          for debug in ("-d", "--debug"):
> > > > > --
> > > > > 2.30.2
> > > > >
> > > > >
> > > > >
> > > > >
> >
> > 
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178478): https://lists.openembedded.org/g/openembedded-core/message/178478
> Mute This Topic: https://lists.openembedded.org/mt/97560251/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

