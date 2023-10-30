Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E6CC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 13:50:52 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.149455.1698673850433821690
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 06:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i7I0pQan;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso62448981fa.1;
        Mon, 30 Oct 2023 06:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698673848; x=1699278648; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vUhTXuTt528Y+1KQ91kdb59E16b2JhQQwxijfbqe11Y=;
        b=i7I0pQaneq954pORNqo9TK0BQX7iwJ1uQ3pyDz2tlm2Ws5sm7BSfLyvRn31s+e/V3+
         mQKsr6bRnXwoNa7eCc9cu9ZCW/fTGi7Fd7lxWiUYBCP3VYgXVNEzfjCdfdkutK1Pt4sV
         sG2f1MxwRswKGVkxIQ0o7Gqm/0xsWUH9nmjNoXUT7m7kpYH4CKlM8M3lUJqdNpH3ZuV2
         FFCD5yIwLRUw/flR29QgomP9lfRb/4B9iCd1K6x/XcOL4HU8bTDplRrwoq6K/GrfW8ge
         sHzEYfHOi1lAS5WMAgeOSV4NFb8JpRsfLTpAatohio9wH6cRtQvtlLOwPOaicYnAt12+
         CT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698673848; x=1699278648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUhTXuTt528Y+1KQ91kdb59E16b2JhQQwxijfbqe11Y=;
        b=p4I2C1Ss0ioSUG+buxy0FC7DOErCJ77QA9sR2ZDRAZN4zJnWv4Cv9feL3MqGhBsOOG
         tyZLbHWRr1x4V9qjr6p4fj9HH9+NCkizOVal0EfakIGNpkv3A5dmdvrZLjnAlD/Nc1Km
         tJ9dBR8Gr8t8EzrwaQMawY5g5e4E9YHLSaV2nv5ydi1Py2m32yNRvRifNOAFExAZJ57F
         jUJZxbtxfQJI2RRg8AYe2m0bPzkBGpewEq8Yd1T9KZH3Ofzkuxnb0mADssKUzbkoTYkq
         Pns84dbC5YrQDf5bpBzn+ayFtmabR9e1Hj5qQRZ6dpomhsQO0ewDMtLaiSVaiExLfdCD
         M0eA==
X-Gm-Message-State: AOJu0YyE+i/M92O+C1Mup21Js8LRKZR9insOTLjDg7An4JKW7AyvisYM
	rTSIkH9D4xuUJgrfbH1SyNDya8d5tj9+6Bm0sMA=
X-Google-Smtp-Source: AGHT+IH91vmQPyBhhkKPn7l7PeYIZ5FOPINtFcZk+RL4O3uEIDqNFZSUFj3wxwlJJfxySkGLZnx6bKptbRj4VKcBXu8=
X-Received: by 2002:a2e:b814:0:b0:2c5:16c0:623b with SMTP id
 u20-20020a2eb814000000b002c516c0623bmr6954650ljo.34.1698673848088; Mon, 30
 Oct 2023 06:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com> <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
In-Reply-To: <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Oct 2023 14:50:36 +0100
Message-ID: <CANNYZj-JhGnGFRxaF0+Q_5Sqq76kAg1pSBBMka_xefuhMv6-vQ@mail.gmail.com>
Subject: Re: Core workflow: sstate for all, bblock/bbunlock, tools for why is
 sstate not being reused?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 13:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189796

On Thu, 14 Sept 2023 at 14:56, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> There are design elements to this work. We need to work out how we can
> make eSDK and "normal" builds more similar and less of an overhead to
> switch between one and the other. A "bblock all" command does partly
> get you to an eSDK effectively so part of this may be switching eSDK to
> use the new lock command. What other differences are there? What other
> differences are necessary or make sense for the use cases eSDK was
> designed for? How would you turn an existing build into an eSDK like
> one? Could you provide a copy of a local build to someone else easily
> using something like eSDK's tooling? What does the eSDK look like at
> the end of this. One section we don't have good answers to yet is setup
> and configuration although I know you've started on some of that.

So I see the following differences between esdk and normal modes:

1. Environment and tooling availability.

a) esdk sets a number of variables from its initialization script that
aid with cross-compiling components directly (e.g. the core use case
of SDKs). Normal mode doesn't do that, but recently added
meta-ide-support will generate a similar initialization script that
will set up the same environment from the normal mode. There are tests
and documentation for it.

b) PATH. eSDK has a number of items in PATH that point to various
locations inside tmp/sysroots/, collectively they provide the
cross-toolchain.

eSDK also puts a selection of yocto tools into path - wic, devtool but
not bitbake:

============================
alex@Zen2:~/poky_sdk$ ls -l sysroots/x86_64-pokysdk-linux/usr/bin/
total 48
lrwxrwxrwx 1 alex alex  39 Oct 30 12:52 devtool ->
../../../../layers/poky/scripts/devtool
lrwxrwxrwx 1 alex alex  54 Oct 30 12:52 oe-find-native-sysroot ->
../../../../layers/poky/scripts/oe-find-native-sysroot
lrwxrwxrwx 1 alex alex  42 Oct 30 12:52 recipetool ->
../../../../layers/poky/scripts/recipetool
lrwxrwxrwx 1 alex alex  39 Oct 30 12:52 runqemu ->
../../../../layers/poky/scripts/runqemu
lrwxrwxrwx 1 alex alex  55 Oct 30 12:52 runqemu-addptable2image ->
../../../../layers/poky/scripts/runqemu-addptable2image
lrwxrwxrwx 1 alex alex  53 Oct 30 12:52 runqemu-export-rootfs ->
../../../../layers/poky/scripts/runqemu-export-rootfs
lrwxrwxrwx 1 alex alex  51 Oct 30 12:52 runqemu-extract-sdk ->
../../../../layers/poky/scripts/runqemu-extract-sdk
lrwxrwxrwx 1 alex alex  51 Oct 30 12:52 runqemu-gen-tapdevs ->
../../../../layers/poky/scripts/runqemu-gen-tapdevs
lrwxrwxrwx 1 alex alex  46 Oct 30 12:52 runqemu-ifdown ->
../../../../layers/poky/scripts/runqemu-ifdown
lrwxrwxrwx 1 alex alex  44 Oct 30 12:52 runqemu-ifup ->
../../../../layers/poky/scripts/runqemu-ifup
lrwxrwxrwx 1 alex alex 100 Oct 30 12:52 unfsd ->
../../../../tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/recipe-sysroot-native/usr/bin/unfsd
lrwxrwxrwx 1 alex alex  35 Oct 30 12:52 wic ->
../../../../layers/poky/scripts/wic
==============================

'normal mode' puts bitbake/bin/ and oe-core/scripts in PATH.
Cross-toolchain can be added by the same environment script made by
meta-ide-support as mentioned in 1a.

2. Configuration (e.g. local.conf).

eSDK local.conf is local.conf from the normal mode that was used to
produce eSDK, stripped of all comments, and with a bunch of extra
settings:

============================
INHERIT:remove = "buildhistory icecc"
CONNECTIVITY_CHECK_URIS = ""

SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK = "none"

SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"

BB_HASHCONFIG_IGNORE_VARS:append = " SIGGEN_UNLOCKED_RECIPES"

BB_SETSCENE_ENFORCE_IGNORE_TASKS = "%:* *:do_shared_workdir
*:do_rm_work wic-tools:* *:do_addto_recipe_sysroot"

BUILDCFG_HEADER = ""

METADATA_REVISION:poky = "4a1e0b9625729e422fcf24e632ee2a3c79f986d5"

# Provide a flag to indicate we are in the EXT_SDK Context
WITHIN_EXT_SDK = "1"

SSTATE_MIRRORS += " file://universal/(.*) file://universal-4.9/\1
file://universal-4.9/(.*) file://universal-4.8/\1"

require conf/locked-sigs.inc
require conf/unlocked-sigs.inc
===============================

Devtool also has a special configuration:
=================
alex@Zen2:~/poky_sdk$ cat conf/devtool.conf
[General]
bitbake_subdir = layers/poky/bitbake
init_path = layers/poky/oe-init-build-env
core_meta_subdir = layers/poky/meta

[SDK]
sdk_targets = core-image-minimal
==================
There is currently no tooling to add/remove these extras in either
esdk mode or normal mode as far as I understand. Their individual
purposes and effects are also not exactly clear to me, and need to be
investigated one by one.

3. Setting up a normal mode in a eSDK installation.

This is actually pretty easy: rather than sourcing the sdk environment
script, source the poky/oe-init-build-env:
==============
alex@Zen2:~/poky_sdk$ . layers/poky/oe-init-build-env .

### Shell environment set up for builds. ###
...
===============
Bitbake will then simply run, albeit with all those extra
esdk-specific items in local.conf (which can be easily taken out to
achieve a pristine normal mode). There will be some warnings but
builds will proceed:
===============
WARNING: You are using a local hash equivalence server but have
configured an sstate mirror. This will likely mean no sstate will
match from the mirror. You may wish to disable the hash equivalence
use (BB_HASHSERVE), or use a hash equivalence server alongside the
sstate mirror.
...
WARNING: spirv-headers-native-1_1.3.261.1-r0 do_fetch: Failed to fetch
URL git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main,
attempting MIRRORS if available
WARNING: libepoxy-1.5.10-r0 do_fetch: Failed to fetch URL
git://github.com/anholt/libepoxy;branch=master;protocol=https,
attempting MIRRORS if available
WARNING: spirv-tools-native-1_1.3.261.1-r0 do_fetch: Failed to fetch
URL git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https,
attempting MIRRORS if available
WARNING: shaderc-native-2023.6-r0 do_fetch: Failed to fetch URL
git://github.com/google/shaderc.git;protocol=https;branch=main,
attempting MIRRORS if available
===============
4. Setting up esdk mode in a normal yocto installation.

This is on one hand easy: cross-toolchain and unified sysroots are
made available for direct component builds by meta-ide-support and
build-sysroots.

On the other hand, setting up the exact same environment as eSDK sets
up isn't currently possible: tooling to replicate all the local.conf
tweaks (that includes locked-sigs items) would be necessary, at a
minimum. A more pedantic approach would also ensure that
- only the 'allowed' set of tools is in PATH, and not everything from
bitbake/bin/ and scripts/
- environment variables and toolchain sysroots match between what eSDK
sets up, and what meta-ide-support sets up

5. In conclusion: to be honest, right now I'm not sure which direction
should be taken to unify and simplify things. Hopefully the above
sparks some ideas; they might pop into my head later as well :-)

Alex

