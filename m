Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AAAC47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 15:10:52 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.76358.1705936249601206169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 07:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yazuq5Ir;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cdeb954640so33828081fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 07:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705936248; x=1706541048; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iCTalas8/D3tz8f10GIiAPN/kve0LzMCZhFbUDfCMF0=;
        b=Yazuq5Ir0PPmLEytDIRkv0+jouqnBGtvwOf+aAmk5am4kojJsNOhE4CakpYPm/QN45
         B6tV2f2aKhQPjclBrp12+6AwA1cqZeRKn8d+MaysP4LUx+rTx9nta2+SzbzV+1CcFOSr
         xb9RaYACCohNqNmfp1nf4wLOlHvv6cjwA7kZcB5Qr9MgC8n2H072TbG8v5mZF/Lr9/yE
         MPM2DSYt0xZFm0FWjzd27L/CpM5XM/YFRSwr5bw5FZn4Yb0RGIhX2MEHIYnJK+gZR+es
         1WHTbLm+2vz6fRZBLIZRG5jRtNiLiRLrWn6JIGyxn51zN4p9eJZSzNeiwAQ8YBLGBGL3
         +ayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705936248; x=1706541048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCTalas8/D3tz8f10GIiAPN/kve0LzMCZhFbUDfCMF0=;
        b=lTIXLnS9k50ako8rkgfDSA5dBgJ5sJQq8frGkdL7O3uwc+j6VDSXPTMLzAlr2eUiEN
         VfGZwFhjyGzaSidGfdg2jDyXxVE/nVxpRhbu69xorQVFMsPL/ut/JfOj3o2h1Xunt0SD
         8mX3GVb+Ys+gXCMVGNM+KVgfzv7g38yi1qDfglhTtlJqaVj0bhyWxLrmFCWvbYa+bNO8
         uN+2WDkOtUbfRerAXooiarooIhlURG02QemqDOBQ2OmDlcOP2ptzg9HC0gb/MNL4jVqt
         dZpJZy4EX4r9AkiltFDqzbcOb8GenrcrXw2z/MdOign1suuf2xOQjJKJCL6nvJcbDcOP
         gmig==
X-Gm-Message-State: AOJu0Yx7JZkSE6JLoZvmAdWI1jixibeZJm1ieZAqhR1LODK5soVkalAq
	4rqrqpd0f/MNvRTk5gxGEwGwCOv64MMtrs2NtxYZXJ0670uwHrwVl36IEBtvRK81yq2VjGeaQJe
	nsLHYOEW2vED4OMjQorzyj8HkMLA=
X-Google-Smtp-Source: AGHT+IH1uoA6YzF8MJGbnzKxypZTCW/cKp/JjJze1haSzwyFkEfL9hgZzfsbauECpKx6gW5UrKl8lV4gEhdUa+oVtkw=
X-Received: by 2002:a2e:8249:0:b0:2cd:ff6:c089 with SMTP id
 j9-20020a2e8249000000b002cd0ff6c089mr1663553ljh.99.1705936247483; Mon, 22 Jan
 2024 07:10:47 -0800 (PST)
MIME-Version: 1.0
References: <5387538c4d9cdb021ad26dec9d8553ed0ead8e6b.camel@infinera.com>
In-Reply-To: <5387538c4d9cdb021ad26dec9d8553ed0ead8e6b.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Jan 2024 16:10:36 +0100
Message-ID: <CANNYZj8hkwep=rLn2_tiBmFJhYPpgB9gbkGssdpq6uZbn_qZig@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest -v -K -r reproducible.ReproducibleTests.test_reproducible_builds
 always succeeds, even when pkg is non-reproducible
To: Joakim.Tjernlund@infinera.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 15:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194175

You are not showing what kind of error you expect to see. What is
being tested for non-reproducibility?

Also the short completion time is suspicious: it might indicate that
both runs indeed take the same package from sstate. The test expects
that the second run uses a private empty sstate to trigger a full
rebuild.

Alex

On Mon, 22 Jan 2024 at 16:01, Joakim Tjernlund via
lists.openembedded.org
<Joakim.Tjernlund=infinera.com@lists.openembedded.org> wrote:
>
> Whatever I do, ReproducibleTests always succeeds and I think I got a clue.
> Looking at the logs below and the files after build one can see thate there
> are no  ...reproducibleA/tmp or ...reproducibleB/tmp dirs in the FS.
>
> Furthermore, deploy_A and deploy_B are the same. This all ends up with the two builds overwrites
> each other then ReproducibleTests compares the package with itself and that will always succeed.
>
> I can't see/find an error in our yocto(Kirkstone) system, so I wonder if this is an upstream bug?
>
>  Jocke
>
> oe-selftest -v -K -r reproducible.ReproducibleTests.test_reproducible_builds
> 2024-01-15 18:03:45,563 - oe-selftest - INFO - Adding layer libraries:
> 2024-01-15 18:03:45,563 - oe-selftest - INFO -  /home/jocke/yocto-xr/3pp/poky/meta/lib
> 2024-01-15 18:03:45,563 - oe-selftest - INFO -  /home/jocke/yocto-xr/3pp/poky/meta-yocto-bsp/lib
> 2024-01-15 18:03:45,563 - oe-selftest - INFO -  /home/jocke/yocto-xr/3pp/meta-openembedded/meta-oe/lib
> 2024-01-15 18:03:45,563 - oe-selftest - INFO -  /home/jocke/yocto-xr/meta-xr/lib
> 2024-01-15 18:03:45,563 - oe-selftest - INFO -  /home/jocke/yocto-xr/3pp/poky/meta-selftest/lib
> 2024-01-15 18:03:45,565 - oe-selftest - INFO - Running bitbake -e to test the configuration is valid/parsable
> 2024-01-15 18:03:50,702 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/jocke/yocto-xr/build/infn-xr/gmcu-st/conf/local.conf
> 2024-01-15 18:03:50,702 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
> 2024-01-15 18:03:50,702 - oe-selftest - INFO - test_reproducible_builds (reproducible.ReproducibleTests)
> 2024-01-15 18:03:53,375 - oe-selftest - DEBUG - Writing to: /home/jocke/yocto-xr/build/infn-xr/gmcu-st/conf/selftest.inc
>
>
> 2024-01-15 18:06:44,995 - oe-selftest - INFO - Config: PACKAGE_CLASSES = "package_ipk"
> INHIBIT_PACKAGE_STRIP = "1"
> TMPDIR = "/home/jocke/yocto-xr/build/infn-xr/gmcu-st/reproducibleA/tmp"
> LICENSE_FLAGS_ACCEPTED = "commercial"
> DISTRO_FEATURES:append = ' systemd pam'
> USERADDEXTENSION = "useradd-staticids"
> USERADD_ERROR_DYNAMIC = "skip"
> USERADD_UID_TABLES += "files/static-passwd"
> USERADD_GID_TABLES += "files/static-group"
>
> 2024-01-15 18:06:44,996 - oe-selftest - INFO - Building reproducibleA (sstate allowed)...
> 2024-01-15 18:06:44,996 - oe-selftest - DEBUG - Writing to: /home/jocke/yocto-xr/build/infn-xr/gmcu-st/conf/selftest.inc
> PACKAGE_CLASSES = "package_ipk"
> INHIBIT_PACKAGE_STRIP = "1"
> TMPDIR = "/home/jocke/yocto-xr/build/infn-xr/gmcu-st/reproducibleA/tmp"
> LICENSE_FLAGS_ACCEPTED = "commercial"
> DISTRO_FEATURES:append = ' systemd pam'
> USERADDEXTENSION = "useradd-staticids"
> USERADD_ERROR_DYNAMIC = "skip"
> USERADD_UID_TABLES += "files/static-passwd"
> USERADD_GID_TABLES += "files/static-group"
>
>
> 2024-01-15 18:07:02,142 - oe-selftest - INFO - Config: PACKAGE_CLASSES = "package_ipk"
> INHIBIT_PACKAGE_STRIP = "1"
> TMPDIR = "/home/jocke/yocto-xr/build/infn-xr/gmcu-st/reproducibleB/tmp"
> LICENSE_FLAGS_ACCEPTED = "commercial"
> DISTRO_FEATURES:append = ' systemd pam'
> USERADDEXTENSION = "useradd-staticids"
> USERADD_ERROR_DYNAMIC = "skip"
> USERADD_UID_TABLES += "files/static-passwd"
> USERADD_GID_TABLES += "files/static-group"
>
> 2024-01-15 18:07:02,143 - oe-selftest - INFO - Building reproducibleB (sstate NOT allowed)...
> 2024-01-15 18:07:02,143 - oe-selftest - DEBUG - Writing to: /home/jocke/yocto-xr/build/infn-xr/gmcu-st/conf/selftest.inc
> PACKAGE_CLASSES = "package_ipk"
> INHIBIT_PACKAGE_STRIP = "1"
> TMPDIR = "/home/jocke/yocto-xr/build/infn-xr/gmcu-st/reproducibleB/tmp"
> LICENSE_FLAGS_ACCEPTED = "commercial"
> DISTRO_FEATURES:append = ' systemd pam'
> USERADDEXTENSION = "useradd-staticids"
> USERADD_ERROR_DYNAMIC = "skip"
> USERADD_UID_TABLES += "files/static-passwd"
> USERADD_GID_TABLES += "files/static-group"
> SSTATE_DIR = "${TMPDIR}/sstate"
> SSTATE_MIRRORS = "file://.*/.*-native.*  http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH file://.*/.*-cross.*
> http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
>
>
> 2024-01-15 18:07:16,424 - oe-selftest - INFO - vars_A:{'DEPLOY_DIR_IPK': '/home/jocke/yocto-xr/build/infn-xr/gmcu-st/tmp/deploy/ipk'}
> 2024-01-15 18:07:16,424 - oe-selftest - INFO - vars_B:{'DEPLOY_DIR_IPK': '/home/jocke/yocto-xr/build/infn-xr/gmcu-st/tmp/deploy/ipk'}
> 2024-01-15 18:07:16,424 - oe-selftest - INFO - c in package_classes:ipk
> 2024-01-15 18:07:16,424 - oe-selftest - INFO - deploy_A:/home/jocke/yocto-xr/build/infn-xr/gmcu-st/tmp/deploy/ipk
> 2024-01-15 18:07:16,425 - oe-selftest - INFO - deplay_B:/home/jocke/yocto-xr/build/infn-xr/gmcu-st/tmp/deploy/ipk
> 2024-01-15 18:07:16,425 - oe-selftest - INFO - Checking ipk packages for differences...
> 2024-01-15 18:07:16,442 - oe-selftest - INFO - Reproducibility summary for ipk: same=4 different=0 different_excluded=0 missing=0 total=4
> unused_exclusions=[]
> 2024-01-15 18:07:16,442 - oe-selftest - INFO -  ... ok
> 2024-01-15 18:07:16,443 - oe-selftest - INFO - ----------------------------------------------------------------------
> 2024-01-15 18:07:16,443 - oe-selftest - INFO - Ran 1 test in 208.397s
> 2024-01-15 18:07:16,443 - oe-selftest - INFO - OK
> 2024-01-15 18:07:22,150 - oe-selftest - INFO - RESULTS:
> 2024-01-15 18:07:22,150 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (205.74s)
> 2024-01-15 18:07:22,154 - oe-selftest - INFO - SUMMARY:
> 2024-01-15 18:07:22,154 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 208.398s
> 2024-01-15 18:07:22,154 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194174): https://lists.openembedded.org/g/openembedded-core/message/194174
> Mute This Topic: https://lists.openembedded.org/mt/103887646/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

