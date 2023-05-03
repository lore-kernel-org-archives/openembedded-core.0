Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA91C77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 07:39:38 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.13393.1683099576526214397
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 00:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SIMr7716;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4edc63c82d1so5496424e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 00:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683099575; x=1685691575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLCQw6kq3M6larLnZPtu7kTtVoG9bbKabrOxbsS6Kpg=;
        b=SIMr7716Da9iZyDmxDUxsmws9ZnHpNPkze0sXFA4YKJyCYTo+7evnOlNaDmsn4ofd0
         s8lJTPnGM43cxejGxvntm4z7G7qMNB+SB5eukbeszUrfQaff5TQY1z4XTYxeaII53xXC
         NmIBv5ydZb1ui7G3VuaCRDabdAvHQWoHdp5OMThdo+TIihntBjFOTpBKr/rTr9yUDKVl
         4o+Hk99tWIu8dkcDMlvUm6RABt9g/zKcP2W67j/WnQj4GGpwEIjiJDQNleU6tCUtwvRo
         ag6/Ndb05vYVhOcznaGXZCl+zhzgoLdFp9xUug1YllzIoaTuevjnnJi0Q8Lrb5jBqwo6
         j7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683099575; x=1685691575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLCQw6kq3M6larLnZPtu7kTtVoG9bbKabrOxbsS6Kpg=;
        b=g3RJ22hXbeRUaOKYIhs7aqBQrEcbSm7VAM+GZRk93oUPpneE0YvUIESTvrtg04yUsN
         bl/d4vRvgpBCJJaIEaPUqZ5sSFDqyHZLzjAYhkHZTUg7eUt8ME5U+dRnizWW6/KYes80
         Vnf2zZ6HiPuIQbUQ5wKlsBCAvhjQkfFNcaZLJ0BzD3aOIE4NqAZvhtCRxNnPwaVDMnyC
         uOnNGJUCD6KY7QGhKTRlJJuVMNRz9cdyBv1Y+JBq58X6w/3McN+1pVxjg9i5lddBVh9Q
         o2nBkW/keZub9iVsOmw8n7eYKQXuxprd3BNcP0+iccuNOiXn5dN/AKc9wLnGFXAF/WtY
         YjUQ==
X-Gm-Message-State: AC+VfDwTJ/NbXJ2ktpPNaA0KOcejoXu4Cn3p9plQbNEv9kNOl1+wVwOq
	kYeLsWbVjDysfCRDjLrEfNBGlBzPNHpnMvLxTXs=
X-Google-Smtp-Source: ACHHUZ5afpfqg809BeSCkJY1akF5InMrSmmARdVJFwK5WL5Suq7NgszRamNpzAfA9ZhDe+J8LXUOIRx/ywmV7IUhndc=
X-Received: by 2002:ac2:4c09:0:b0:4eb:3149:cbe1 with SMTP id
 t9-20020ac24c09000000b004eb3149cbe1mr602177lfq.10.1683099574446; Wed, 03 May
 2023 00:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <01010187d9352360-4eff0521-e848-4365-a203-ba8b516d3d8b-000000@us-west-2.amazonses.com>
 <ad51e892-f8cb-adf9-b958-1e2cad618015@windriver.com>
In-Reply-To: <ad51e892-f8cb-adf9-b958-1e2cad618015@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 May 2023 09:39:23 +0200
Message-ID: <CANNYZj-CWh2pc=GhqdEWmi+Nqd+Ur0K8UFvuQBuV72upHBYuAQ@mail.gmail.com>
Subject: Re: [AUH] rust: upgrading to 1.69.0 FAILED -> Sundeep to do the update.
To: Randy MacLeod <randy.macleod@windriver.com>, Alex Kiernan <alex.kiernan@gmail.com>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 07:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180784

I think Alex Kiernan already sent an update here about a week ago?

Alex


On Wed, 3 May 2023 at 01:29, Randy MacLeod <randy.macleod@windriver.com> wr=
ote:
>
> On 2023-05-01 17:25, auh@yoctoproject.org wrote:
>
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *rust* to *1.69.0* has F=
ailed (devtool error).
>
> Detailed error information:
>
> The following devtool command failed:  upgrade rust -V 1.69.0
>
> Sundeep said that he will start working on this tomorrow unless someone e=
lse speaks up
> about having the update underway. 1.70 isn't due until June 1st or so.
>
> ../Randy
>
>
> NOTE: Starting bitbake server...
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)... (14:02:48.244299)
> Loading cache...done.
> Loaded 1799 entries from dependency cache.
> Removing 1 recipes from the x86_64 sysroot...done.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.4.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "4.2"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "tmp-auh-upgrades:c08f5fabc6f19121f285caaed7c99e=
1ba459baab"
> workspace            =3D "master:cce6db2a59d309f77c1f9ca173fc674c506062d0=
"
>
> Initialising tasks...done.
> Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match,=
 100% complete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be re=
run and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 2 seconds
> Loading cache...done.
> Loaded 1799 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 900 .bb files complete (898 cached, 2 parsed). 1800 targets, 3=
9 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.4.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "4.2"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "tmp-auh-upgrades:c08f5fabc6f19121f285caaed7c99e=
1ba459baab"
> workspace            =3D "master:cce6db2a59d309f77c1f9ca173fc674c506062d0=
"
>
> Initialising tasks...done.
> Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match,=
 100% complete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rer=
un and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 2 seconds
> DEBUG 5 [Errno 25] Inappropriate ioctl for device
> Adding changed files:   0% |                                   | ETA:  --=
:--:--
> Adding changed files:   0% |                                   | ETA:  --=
:--:--
> Adding changed files:   1% |                                    | ETA:  0=
:01:03
> Adding changed files:   2% |                                    | ETA:  0=
:00:45
> Adding changed files:   3% |#                                   | ETA:  0=
:00:40
> Adding changed files:   4% |#                                   | ETA:  0=
:00:36
> Adding changed files:   5% |#                                   | ETA:  0=
:00:34
> Adding changed files:   6% |##                                  | ETA:  0=
:00:33
> Adding changed files:   7% |##                                  | ETA:  0=
:00:32
> Adding changed files:   8% |##                                  | ETA:  0=
:00:31
> Adding changed files:   9% |###                                 | ETA:  0=
:00:30
> Adding changed files:  10% |###                                 | ETA:  0=
:00:30
> Adding changed files:  11% |####                                | ETA:  0=
:00:29
> Adding changed files:  12% |####                                | ETA:  0=
:00:29
> Adding changed files:  13% |####                                | ETA:  0=
:00:28
> Adding changed files:  14% |#####                               | ETA:  0=
:00:27
> Adding changed files:  15% |#####                               | ETA:  0=
:00:27
> Adding changed files:  16% |#####                               | ETA:  0=
:00:27
> Adding changed files:  17% |######                              | ETA:  0=
:00:26
> Adding changed files:  18% |######                              | ETA:  0=
:00:26
> Adding changed files:  19% |######                              | ETA:  0=
:00:25
> Adding changed files:  20% |#######                             | ETA:  0=
:00:25
> Adding changed files:  21% |#######                             | ETA:  0=
:00:25
> Adding changed files:  22% |########                            | ETA:  0=
:00:24
> Adding changed files:  23% |########                            | ETA:  0=
:00:24
> Adding changed files:  24% |########                            | ETA:  0=
:00:23
> Adding changed files:  25% |#########                           | ETA:  0=
:00:23
> Adding changed files:  26% |#########                           | ETA:  0=
:00:23
> Adding changed files:  27% |#########                           | ETA:  0=
:00:23
> Adding changed files:  28% |##########                          | ETA:  0=
:00:23
> Adding changed files:  29% |##########                          | ETA:  0=
:00:22
> Adding changed files:  30% |##########                          | ETA:  0=
:00:22
> Adding changed files:  31% |###########                         | ETA:  0=
:00:22
> Adding changed files:  32% |###########                         | ETA:  0=
:00:22
> Adding changed files:  33% |############                        | ETA:  0=
:00:21
> Adding changed files:  34% |############                        | ETA:  0=
:00:21
> Adding changed files:  35% |############                        | ETA:  0=
:00:21
> Adding changed files:  36% |#############                       | ETA:  0=
:00:21
> Adding changed files:  37% |#############                       | ETA:  0=
:00:20
> Adding changed files:  38% |#############                       | ETA:  0=
:00:20
> Adding changed files:  39% |##############                      | ETA:  0=
:00:20
> Adding changed files:  40% |##############                      | ETA:  0=
:00:20
> Adding changed files:  41% |##############                      | ETA:  0=
:00:19
> Adding changed files:  42% |###############                     | ETA:  0=
:00:19
> Adding changed files:  43% |###############                     | ETA:  0=
:00:19
> Adding changed files:  44% |################                    | ETA:  0=
:00:18
> Adding changed files:  45% |################                    | ETA:  0=
:00:18
> Adding changed files:  46% |################                    | ETA:  0=
:00:18
> Adding changed files:  47% |#################                   | ETA:  0=
:00:17
> Adding changed files:  48% |#################                   | ETA:  0=
:00:17
> Adding changed files:  49% |#################                   | ETA:  0=
:00:17
> Adding changed files:  50% |##################                  | ETA:  0=
:00:17
> Adding changed files:  51% |##################                  | ETA:  0=
:00:16
> Adding changed files:  52% |###################                 | ETA:  0=
:00:16
> Adding changed files:  53% |###################                 | ETA:  0=
:00:16
> Adding changed files:  54% |###################                 | ETA:  0=
:00:15
> Adding changed files:  55% |####################                | ETA:  0=
:00:15
> Adding changed files:  56% |####################                | ETA:  0=
:00:15
> Adding changed files:  57% |####################                | ETA:  0=
:00:14
> Adding changed files:  58% |#####################               | ETA:  0=
:00:14
> Adding changed files:  59% |#####################               | ETA:  0=
:00:14
> Adding changed files:  60% |#####################               | ETA:  0=
:00:13
> Adding changed files:  61% |######################              | ETA:  0=
:00:13
> Adding changed files:  63% |######################              | ETA:  0=
:00:13
> Adding changed files:  64% |#######################             | ETA:  0=
:00:12
> Adding changed files:  65% |#######################             | ETA:  0=
:00:12
> Adding changed files:  66% |#######################             | ETA:  0=
:00:12
> Adding changed files:  67% |########################            | ETA:  0=
:00:11
> Adding changed files:  68% |########################            | ETA:  0=
:00:11
> Adding changed files:  69% |########################            | ETA:  0=
:00:11
> Adding changed files:  70% |#########################           | ETA:  0=
:00:10
> Adding changed files:  71% |#########################           | ETA:  0=
:00:10
> Adding changed files:  72% |#########################           | ETA:  0=
:00:10
> Adding changed files:  73% |##########################          | ETA:  0=
:00:09
> Adding changed files:  74% |##########################          | ETA:  0=
:00:09
> Adding changed files:  75% |###########################         | ETA:  0=
:00:09
> Adding changed files:  76% |###########################         | ETA:  0=
:00:08
> Adding changed files:  77% |###########################         | ETA:  0=
:00:08
> Adding changed files:  78% |############################        | ETA:  0=
:00:07
> Adding changed files:  79% |############################        | ETA:  0=
:00:07
> Adding changed files:  80% |############################        | ETA:  0=
:00:07
> Adding changed files:  81% |#############################       | ETA:  0=
:00:06
> Adding changed files:  82% |#############################       | ETA:  0=
:00:06
> Adding changed files:  83% |#############################       | ETA:  0=
:00:06
> Adding changed files:  84% |##############################      | ETA:  0=
:00:05
> Adding changed files:  85% |##############################      | ETA:  0=
:00:05
> Adding changed files:  86% |###############################     | ETA:  0=
:00:05
> Adding changed files:  87% |###############################     | ETA:  0=
:00:04
> Adding changed files:  88% |###############################     | ETA:  0=
:00:04
> Adding changed files:  89% |################################    | ETA:  0=
:00:03
> Adding changed files:  90% |################################    | ETA:  0=
:00:03
> Adding changed files:  91% |################################    | ETA:  0=
:00:03
> Adding changed files:  92% |#################################   | ETA:  0=
:00:02
> Adding changed files:  93% |#################################   | ETA:  0=
:00:02
> Adding changed files:  94% |##################################  | ETA:  0=
:00:02
> Adding changed files:  95% |##################################  | ETA:  0=
:00:01
> Adding changed files:  96% |##################################  | ETA:  0=
:00:01
> Adding changed files:  97% |################################### | ETA:  0=
:00:00
> Adding changed files:  98% |################################### | ETA:  0=
:00:00
> Adding changed files:  99% |################################### | ETA:  0=
:00:00
> Adding changed files: 100% |####################################| Time: 0=
:00:36
>
> INFO: Extracting current version source...
> INFO: Extracting upgraded version source...
> INFO: Fetching https://static.rust-lang.org/dist/rustc-1.69.0-src.tar.xz;=
name=3Drust...
> INFO: Rebasing devtool onto 501a8ba40bc5d3e5ab5ee81bf2819c527bc8f221
> WARNING: Command 'git rebase 501a8ba40bc5d3e5ab5ee81bf2819c527bc8f221' fa=
iled:
> CONFLICT (modify/delete): vendor/crossbeam-utils-0.8.12/.cargo-checksum.j=
son deleted in HEAD and modified in 8ca3ec0aa (rust: Fix crossbeam-utils fo=
r arches without atomics).  Version 8ca3ec0aa (rust: Fix crossbeam-utils fo=
r arches without atomics) of vendor/crossbeam-utils-0.8.12/.cargo-checksum.=
json left in tree.
> CONFLICT (modify/delete): vendor/crossbeam-utils-0.8.12/build.rs deleted =
in HEAD and modified in 8ca3ec0aa (rust: Fix crossbeam-utils for arches wit=
hout atomics).  Version 8ca3ec0aa (rust: Fix crossbeam-utils for arches wit=
hout atomics) of vendor/crossbeam-utils-0.8.12/build.rs left in tree.
>
> ERROR: Execution of 'git checkout devtool' failed with exit code 1:
> error: you need to resolve your current index first
> vendor/crossbeam-utils-0.8.12/.cargo-checksum.json: needs merge
> vendor/crossbeam-utils-0.8.12/build.rs: needs merge
>
>
>
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
>
> --
> # Randy MacLeod
> # Wind River Linux

