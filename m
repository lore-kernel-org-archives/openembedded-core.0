Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9805CC25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 13:38:23 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.10250.1716385097923620849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 06:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ip5u+QGv;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e3e18c240fso62502291fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716385096; x=1716989896; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VSm+iJCXLTKPBZQuwzzbFsx8lrS1VjjQgPBCld9+Ywk=;
        b=ip5u+QGv4Jjuca30ZVipi2hqZM1YuLsmCg2yQEqlwiNMLbCgBiwIxwy780NTZ1s8VE
         +8+KulCEfB5kSYr7PjyAHc/SFQ7KiLAlBKlyy61qAPg16KNwjEj1/kazXa45IKMK0SEv
         wUiiJSKhPtQ41iyIvUEJS54BKxDQaY10xHEuLTEGcN1A1rh3VyPiZ04J1FVTe0DV8p8j
         FHQYmW/ECuAnCk4UhFeV6iMdsECVWcfNtfrSv4q7Ckdx5njxleRMT51rZ610i7FFIPHY
         LYzPH/lj+Q9DqC0ayRc3QNQhxwINiUlLoW0flIp/Obt6XfSWOsJuPzpEUvUlgkRmQRs4
         awsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716385096; x=1716989896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSm+iJCXLTKPBZQuwzzbFsx8lrS1VjjQgPBCld9+Ywk=;
        b=lIUoDzmI+cvSFhelMpTeQNe/8fG308xHIf8THLC5PxgNB0QEGsXtpLyr3kmUprZPBg
         5ut923iXkUiGfYfidb4JB0oahy+L9/n7EUMR6tJBqTdST0nZaAQaAlF2yeb/L5wF4kcY
         Z3ZcLozdFOA1MLfcgYTt50mGmx5ZnGFWDpeZ1D0xZ6Qwvm3IxS6CwU2qLeJUVxerSFAs
         yNtkwqj5xlIuUYxJ5R+U7ONxYQicZowVJdJGltw0XlbtI7U/c+wxXTJa+/A4y707QfBo
         Cut2goHG1XnB1IVO/b17bu3wRHXXjIgre9eQ/PuybPx/1G5Jo/tj/3c+BkGeWvCjVeQg
         F/5g==
X-Gm-Message-State: AOJu0Yx+7EZiFN+fr43w2zAUbq2GRbSTqvdSW88XVhqOk8rjVzjMNi9K
	FoqXFYx0iIYpQgiLuYRiAW5xDAP53scvUnq2ox9HithdFGudtQiRx2kcOdKJWRvHkDx38kbHPZy
	zk9xoyEnBbpHPL4Nx6SXXirsN/m8=
X-Google-Smtp-Source: AGHT+IFOWLvAXSTnXwde1BYjoRZTS+Q81HQNXrEnwMNsGSVDRozsqa6OBHIH635rc6gUkRWJAMjDqLVRfolwR7X2pAE=
X-Received: by 2002:a2e:880d:0:b0:2e2:9416:a63f with SMTP id
 38308e7fff4ca-2e9495bacc7mr16796471fa.53.1716385095667; Wed, 22 May 2024
 06:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <0101018f7d4fe0a4-4632843a-42c8-45d9-addd-75ffe059f3f5-000000@us-west-2.amazonses.com>
 <4388b3629308e9d1d3121c3d987f38733b974fb7.camel@geanix.com>
In-Reply-To: <4388b3629308e9d1d3121c3d987f38733b974fb7.camel@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 May 2024 15:38:04 +0200
Message-ID: <CANNYZj_NBASzaMDuEU7aEFJTCTejUnLqFMTSjMtJuRFuwbF_3A@mail.gmail.com>
Subject: Re: [OE-core] [AUH] qemu: upgrading to 9.0.0 FAILED
To: martin@geanix.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 13:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199754

I think there's still a single autobuilder machine that still runs
that distro, and because it's an ARM host, and there's a shortage of
those, and we don't want to break it through update to a newer ubuntu,
and everyone's generally overworked, it stayed at that version.

I think there'll be a new cluster of machines soon-ish, Michael
Halstead and RP know more about it.

Alex

On Wed, 22 May 2024 at 14:19, Martin Hundeb?ll via
lists.openembedded.org <martin=geanix.com@lists.openembedded.org>
wrote:
>
> Upgrading to qemu-9.0.0 involves rebasing patches needed for ubuntu-
> 18.04. Is this really needed still?
>
> Wouldn't it make sense to drop ubuntu-18.04 for the next release?
>
> // Martin
>
> On Wed, 2024-05-15 at 17:32 +0000, Auto Upgrade Helper wrote:
> > Hello,
> >
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe *qemu* to *9.0.0*
> > has Failed (devtool error).
> >
> > Detailed error information:
> >
> > Running 'devtool upgrade' for recipe qemu failed.
> > NOTE: Reconnecting to bitbake server...
> > Loading cache...done.
> > Loaded 1881 entries from dependency cache.
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           = "2.9.1"
> > BUILD_SYS            = "x86_64-linux"
> > NATIVELSBSTRING      = "universal"
> > TARGET_SYS           = "x86_64-poky-linux"
> > MACHINE              = "qemux86-64"
> > DISTRO               = "poky"
> > DISTRO_VERSION       = "5.0+snapshot-
> > b42883fef514bff64dc37a5bcd44402eea630a93"
> > TUNE_FEATURES        = "m64 core2"
> > TARGET_FPU           = ""
> > meta
> > meta-poky
> > meta-yocto-bsp
> > workspace            = "tmp-auh-
> > upgrades:b42883fef514bff64dc37a5bcd44402eea630a93"
> >
> > Initialising tasks...NOTE: The /proc/pressure files can't be read.
> > Continuing build without monitoring pressure
> > Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22
> > (100% match, 100% complete)
> > done.
> > NOTE: Executing Tasks
> > NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to
> > be rerun and all succeeded.
> > NOTE: Writing buildhistory
> > NOTE: Writing buildhistory took: 3 seconds
> > Loading cache...done.
> > Loaded 1881 entries from dependency cache.
> > Parsing recipes...done.
> > Parsing of 922 .bb files complete (920 cached, 2 parsed). 1880
> > targets, 35 skipped, 0 masked, 0 errors.
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           = "2.9.1"
> > BUILD_SYS            = "x86_64-linux"
> > NATIVELSBSTRING      = "universal"
> > TARGET_SYS           = "x86_64-poky-linux"
> > MACHINE              = "qemux86-64"
> > DISTRO               = "poky"
> > DISTRO_VERSION       = "5.0+snapshot-
> > b42883fef514bff64dc37a5bcd44402eea630a93"
> > TUNE_FEATURES        = "m64 core2"
> > TARGET_FPU           = ""
> > meta
> > meta-poky
> > meta-yocto-bsp
> > workspace            = "tmp-auh-
> > upgrades:b42883fef514bff64dc37a5bcd44402eea630a93"
> >
> > Initialising tasks...NOTE: The /proc/pressure files can't be read.
> > Continuing build without monitoring pressure
> > Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90%
> > match, 96% complete)
> > done.
> > NOTE: Executing Tasks
> > NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be
> > rerun and all succeeded.
> > NOTE: Writing buildhistory
> > NOTE: Writing buildhistory took: 3 seconds
> > DEBUG 5 [Errno 25] Inappropriate ioctl for device
> > Adding changed files:   0% |                                   |
> > ETA:  --:--:--
> > Adding changed files:   0% |                                   |
> > ETA:  --:--:--
> > Adding changed files:   3% |#                                   |
> > ETA:  0:00:13
> > Adding changed files:   6% |##                                  |
> > ETA:  0:00:09
> > Adding changed files:   9% |###                                 |
> > ETA:  0:00:08
> > Adding changed files:  13% |####                                |
> > ETA:  0:00:07
> > Adding changed files:  16% |#####                               |
> > ETA:  0:00:07
> > Adding changed files:  19% |#######                             |
> > ETA:  0:00:07
> > Adding changed files:  22% |########                            |
> > ETA:  0:00:06
> > Adding changed files:  26% |#########                           |
> > ETA:  0:00:06
> > Adding changed files:  29% |##########                          |
> > ETA:  0:00:06
> > Adding changed files:  32% |###########                         |
> > ETA:  0:00:05
> > Adding changed files:  35% |############                        |
> > ETA:  0:00:05
> > Adding changed files:  39% |##############                      |
> > ETA:  0:00:05
> > Adding changed files:  42% |###############                     |
> > ETA:  0:00:04
> > Adding changed files:  45% |################                    |
> > ETA:  0:00:04
> > Adding changed files:  48% |#################                   |
> > ETA:  0:00:04
> > Adding changed files:  52% |##################                  |
> > ETA:  0:00:03
> > Adding changed files:  55% |###################                 |
> > ETA:  0:00:03
> > Adding changed files:  58% |#####################               |
> > ETA:  0:00:03
> > Adding changed files:  61% |######################              |
> > ETA:  0:00:03
> > Adding changed files:  65% |#######################             |
> > ETA:  0:00:03
> > Adding changed files:  68% |########################            |
> > ETA:  0:00:02
> > Adding changed files:  71% |#########################           |
> > ETA:  0:00:02
> > Adding changed files:  75% |###########################         |
> > ETA:  0:00:02
> > Adding changed files:  78% |############################        |
> > ETA:  0:00:01
> > Adding changed files:  81% |#############################       |
> > ETA:  0:00:01
> > Adding changed files:  84% |##############################      |
> > ETA:  0:00:01
> > Adding changed files:  88% |###############################     |
> > ETA:  0:00:01
> > Adding changed files:  91% |################################    |
> > ETA:  0:00:00
> > Adding changed files:  94% |##################################  |
> > ETA:  0:00:00
> > Adding changed files:  97% |################################### |
> > ETA:  0:00:00
> > Adding changed files: 100% |####################################|
> > Time: 0:00:09
> > INFO: Extracting current version source...
> > INFO: SRC_URI contains some conditional appends/prepends - will
> > create branches to represent these
> > INFO: Adding local source files to srctree...
> > INFO: Extracting upgraded version source...
> > INFO: Fetching https://download.qemu.org/qemu-9.0.0.tar.xz...
> > INFO: Rebasing devtool onto cbc3269b59233ac8572ad7a77fcf355a2cc2f66a
> > WARNING: Command 'git rebase
> > cbc3269b59233ac8572ad7a77fcf355a2cc2f66a' failed:
> > Auto-merging linux-user/mmap.c
> > CONFLICT (content): Merge conflict in linux-user/mmap.c
> >
> > You will need to resolve conflicts in order to complete the upgrade.
> > INFO: Rebasing devtool-override-class-native onto
> > cbc3269b59233ac8572ad7a77fcf355a2cc2f66a
> > WARNING: Command 'git rebase
> > cbc3269b59233ac8572ad7a77fcf355a2cc2f66a' failed:
> > Auto-merging linux-user/mmap.c
> > CONFLICT (content): Merge conflict in linux-user/mmap.c
> >
> > You will need to resolve conflicts in order to complete the upgrade.
> > INFO: Rebasing devtool-override-class-nativesdk onto
> > cbc3269b59233ac8572ad7a77fcf355a2cc2f66a
> > WARNING: Command 'git rebase
> > cbc3269b59233ac8572ad7a77fcf355a2cc2f66a' failed:
> > Auto-merging linux-user/mmap.c
> > CONFLICT (content): Merge conflict in linux-user/mmap.c
> >
> > You will need to resolve conflicts in order to complete the upgrade.
> > INFO: Upgraded source extracted to /home/pokybuild/yocto-
> > worker/auh/build/build/workspace/sources/qemu
> > INFO: New recipe is /home/pokybuild/yocto-
> > worker/auh/build/build/workspace/recipes/qemu/qemu_9.0.0.bb
> > WARNING: Version is pinned to 8.2% via PREFERRED_VERSION; it may need
> > adjustment to match the new version before any further steps are
> > taken
> >
> >
> >
> > Please review the attached files for further information and
> > build/update failures.
> > Any problem please file a bug at
> > https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
> >
> > Regards,
> > The Upgrade Helper
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199748): https://lists.openembedded.org/g/openembedded-core/message/199748
> Mute This Topic: https://lists.openembedded.org/mt/106118828/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

