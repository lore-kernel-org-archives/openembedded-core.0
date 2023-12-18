Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19F8C46CD2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 16:20:46 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.47470.1702916439164310165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 08:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gSxx7D5n;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50c04ebe1bbso4308341e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702916437; x=1703521237; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pFWhnrJ+MUmAxVyJemnJK+MTCs7un1mRYDuGuqEFCiU=;
        b=gSxx7D5no7p+ksX44/eSmCNKzJwAO5cpknRy/mwNHvK7A5M/TC64e07WOS4mGbh1WF
         8+okKu68OoHBBnxY6dd8Yk6oHoClD5dCMvXc+Vsr12gMH5DUXurxV8g5n6BGeajQZ1D8
         zrBRS0a+xc0/8ZUZAe54vLHRrvvDB8l4QJmTV3MKfZL6QTN4xqgcJA80K/Y3cObM+hkP
         X+WYwHsxtcNif0YDApXw2cO6WnfmSTfxjj1A8kOGbhNLbvURKV/5c8DbuyfhaiMRyvQt
         uab0hqREbC+UwQaxsGZhbjdsp4D4R+X2U/RS3LeI8RHhztNewyLNMNwoolEvYsdP4Qcd
         sfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702916437; x=1703521237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFWhnrJ+MUmAxVyJemnJK+MTCs7un1mRYDuGuqEFCiU=;
        b=uTi5aYIHla/LxE0Du0u+QrN2ZulErvzPeaYhfxr1Vjav2YeFOyoo6Cj5LGHLYAXSwa
         qwgrkF0SzJTsadIcLnK4ALz57yOm+y8oJ35/FieUIAl3cXouFuL5BMhhWAVQshrM0yOL
         +8LUiF/UzSK8X/U7heQnIe6byMTb+lwNc7FS/bYTXf8wUdvHvJCX6RGKm0eRtI4GlSeA
         W8TEse+a2uSYePH3rp7HfZA1HiNto0On7tlePL6+arll4+laLE4Xt6saWCzCNTCCKA/y
         KPovnvf0F/TzIXqEX8ikEZZwlQNV2dWJDX492uehFG/JTxIdzdECHhehQxGL2e35YTS5
         lFQg==
X-Gm-Message-State: AOJu0YzVoboGayMfu/RgC8sOwmIG+1pTF4nt3UYacDO2eM91sm8Va1yY
	F+639LZHl4f6esbZnhW/Hm0Qlk4+3KlBABveQng=
X-Google-Smtp-Source: AGHT+IEkjEFWV9euU4Kg6i6qjCwNf6WKN/UX3q3IK1zJm/r9J81CE3nCc7ELOXkOUvt8cSfCnXf3FnjM0eeSSVrlv5g=
X-Received: by 2002:ac2:53ab:0:b0:50e:3e1c:5cad with SMTP id
 j11-20020ac253ab000000b0050e3e1c5cadmr709812lfh.17.1702916437046; Mon, 18 Dec
 2023 08:20:37 -0800 (PST)
MIME-Version: 1.0
References: <e2ad5c51a48a8c85bae1c9c7e21912e8fb412c77.camel@infinera.com>
 <CANNYZj-+T-uXRwVOkF3YmZJzOKaqogBnNKp+WFA9mpNyW2Y=EQ@mail.gmail.com> <e19a55e23d08d670fedb5f290a225f4ed21f82e9.camel@infinera.com>
In-Reply-To: <e19a55e23d08d670fedb5f290a225f4ed21f82e9.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Dec 2023 17:20:25 +0100
Message-ID: <CANNYZj-N0_Jb-J2OE2=R4X4guhhddDEzejxOY_sXT_bTT4NumA@mail.gmail.com>
Subject: Re: [OE-core] kirkstone: oe-selftest -v -r reproducible.ReproducibleTests.test_reproducible_builds
 broken ?
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 16:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192662

I suppose you can run oe-selftest again with -K, then its build
directories (a and b ones) will be preserved and you can inspect them.

Alex

On Mon, 18 Dec 2023 at 14:58, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
>
> Sounds plausible but how is that possible? I don't understand what those tweaks are(unless you
> mean the SOURCE_DATE_EPOCH="$(date +%s)" tweak)
> Maybe I should try without SSTATE cache at all just to see if that make a difference?
>
>  Jocke
>
> On Mon, 2023-12-18 at 14:11 +0100, Alexander Kanavin wrote:
> > The short execution time is suspicious. The test is written so that
> > build B doesn't reuse the cache from build A, and if it does because
> > of your local tweaks, then you're probably just comparing the A
> > package with itself.
> >
> > Alex
> >
> > On Mon, 18 Dec 2023 at 12:20, Joakim Tjernlund via
> > lists.openembedded.org
> > <Joakim.Tjernlund=infinera.com@lists.openembedded.org> wrote:
> > >
> > > I setup above test for reproducible builds and build one pkg(u-boot) and try to force a
> > > non-reproducible build to test the framework:
> > > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > > @@ -9,7 +9,7 @@ inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kerne
> > >
> > >  DEPENDS += "swig-native"
> > >
> > > -EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
> > > +EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1 SOURCE_DATE_EPOCH="$(date +%s)"'
> > >  EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
> > >  EXTRA_OEMAKE += 'STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
> > >
> > > forcing EPOCH to current build date but I still get an success report:
> > >
> > > oe-selftest -v -r reproducible.ReproducibleTests.test_reproducible_builds
> > > 2023-12-18 12:05:22,355 - oe-selftest - INFO - Adding layer libraries:
> > > 2023-12-18 12:05:22,356 - oe-selftest - INFO -  /home/jocke/yocto-xr/3pp/poky/meta/lib
> > > 2023-12-18 12:05:22,356 - oe-selftest - INFO -  /home/jocke/yocto-xr/3pp/poky/meta-yocto-bsp/lib
> > > 2023-12-18 12:05:22,356 - oe-selftest - INFO -  /home/jocke/yocto-xr/3pp/meta-openembedded/meta-oe/lib
> > > 2023-12-18 12:05:22,356 - oe-selftest - INFO -  /home/jocke/yocto-xr/meta-xr/lib
> > > 2023-12-18 12:05:22,356 - oe-selftest - INFO -  /home/jocke/yocto-xr/3pp/poky/meta-selftest/lib
> > > 2023-12-18 12:05:22,359 - oe-selftest - INFO - Running bitbake -e to test the configuration is valid/parsable
> > > 2023-12-18 12:05:27,248 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/jocke/yocto-xr/build/infn-xr/gmcu-st/conf/local.conf
> > > 2023-12-18 12:05:27,248 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
> > > 2023-12-18 12:05:27,248 - oe-selftest - INFO - test_reproducible_builds (reproducible.ReproducibleTests)
> > > 2023-12-18 12:05:29,724 - oe-selftest - DEBUG - Writing to: /home/jocke/yocto-xr/build/infn-xr/gmcu-st/conf/selftest.inc
> > >
> > >
> > > 2023-12-18 12:08:26,539 - oe-selftest - INFO - Building reproducibleA (sstate allowed)...
> > > 2023-12-18 12:08:26,545 - oe-selftest - DEBUG - Writing to: /home/jocke/yocto-xr/build/infn-xr/gmcu-st/conf/selftest.inc
> > > PACKAGE_CLASSES = "package_ipk"
> > > INHIBIT_PACKAGE_STRIP = "1"
> > > TMPDIR = "/home/jocke/yocto-xr/build/infn-xr/reproducibleA/tmp"
> > > LICENSE_FLAGS_ACCEPTED = "commercial"
> > > DISTRO_FEATURES:append = ' systemd pam'
> > > USERADDEXTENSION = "useradd-staticids"
> > > USERADD_ERROR_DYNAMIC = "skip"
> > > USERADD_UID_TABLES += "files/static-passwd"
> > > USERADD_GID_TABLES += "files/static-group"
> > >
> > >
> > > 2023-12-18 12:09:08,936 - oe-selftest - INFO - Building reproducibleB (sstate NOT allowed)...
> > > 2023-12-18 12:09:08,937 - oe-selftest - DEBUG - Writing to: /home/jocke/yocto-xr/build/infn-xr/gmcu-st/conf/selftest.inc
> > > PACKAGE_CLASSES = "package_ipk"
> > > INHIBIT_PACKAGE_STRIP = "1"
> > > TMPDIR = "/home/jocke/yocto-xr/build/infn-xr/reproducibleB/tmp"
> > > LICENSE_FLAGS_ACCEPTED = "commercial"
> > > DISTRO_FEATURES:append = ' systemd pam'
> > > USERADDEXTENSION = "useradd-staticids"
> > > USERADD_ERROR_DYNAMIC = "skip"
> > > USERADD_UID_TABLES += "files/static-passwd"
> > > USERADD_GID_TABLES += "files/static-group"
> > > SSTATE_DIR = "${TMPDIR}/sstate"
> > > SSTATE_MIRRORS = "file://.*/.*-native.*  http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH file://.*/.*-cross.*
> > > http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
> > >
> > >
> > > 2023-12-18 12:09:24,772 - oe-selftest - INFO - Checking ipk packages for differences...
> > > 2023-12-18 12:09:24,843 - oe-selftest - INFO - Reproducibility summary for ipk: same=4 different=0 different_excluded=0 missing=0 total=4
> > > unused_exclusions=[]
> > > 2023-12-18 12:09:24,847 - oe-selftest - INFO -  ... ok
> > > 2023-12-18 12:09:26,044 - oe-selftest - INFO - ----------------------------------------------------------------------
> > > 2023-12-18 12:09:26,044 - oe-selftest - INFO - Ran 1 test in 241.335s
> > > 2023-12-18 12:09:26,045 - oe-selftest - INFO - OK
> > > 2023-12-18 12:09:32,355 - oe-selftest - INFO - RESULTS:
> > > 2023-12-18 12:09:32,356 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (237.60s)
> > > 2023-12-18 12:09:32,361 - oe-selftest - INFO - SUMMARY:
> > > 2023-12-18 12:09:32,362 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 241.336s
> > > 2023-12-18 12:09:32,362 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)
> > >
> > >
> > > Looking harder I don't see oe-seftest ever creating reproducibleA/reproducibleB directories.
> > > I have these set
> > > OEQA_REPRODUCIBLE_TEST_PACKAGE = "ipk"
> > > OEQA_REPRODUCIBLE_TEST_TARGET = "xr-u-boot"
> > >
> > > I am missing something?
> > >
> > >  Jocke
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#192631): https://lists.openembedded.org/g/openembedded-core/message/192631
> > > Mute This Topic: https://lists.openembedded.org/mt/103240689/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
>

