Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE60FC77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 19:02:11 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.29134.1683140529793508616
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 12:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bDQSSHCB;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-76355514e03so439711939f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683140529; x=1685732529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCmtGkchceTMYa6Olj04SeN7374hx1nmUgQi1Bo7vyE=;
        b=bDQSSHCBrgQBt5Pp3ZvTj/H++v/FKjW/avPATPH3VdSMpdNvIxctIOwrdL6C+qvR5l
         9zw2+NA+dMgEn6VE1C2fumN466HieBuZOTnMaDvpDxi2DZcqZISY2eCqvKaaHXa8XqnR
         0paeNGsrTmTunukNWtx3+vptquyfhp03woRD8EsjDuQ6EKBx5xurpCYmGBsFeBC1PKDF
         cmbtuavwEjyPpAGV2NsieWc6jVpbKTyL6Rb79V6bI8FwerJWChOwCD7AdIGMDNiox9KV
         T5FrNgaOcuW6yNuTEWUFnIUidav76O5KO7G/edw7+6jOs2vZHdqUi7ePF4Av667+I2R5
         yYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683140529; x=1685732529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCmtGkchceTMYa6Olj04SeN7374hx1nmUgQi1Bo7vyE=;
        b=aDjZnYKGU23qxjxE9ZyGGvMCfL4BbSBF8g2LfkaBBP2iJIlj2O0LD+QZnnL9F10YFi
         Gb32AW2G+Hjd/cjZ3ackjFBlZxjMCtjt0viXNr5zKsiK3yVfpifcdRKKFL3CRRhx/ERa
         FA7N96Pb0ZBVp2lo9+8Mg6lTGJDbkZFLWA1oPXOOlYJIxu+0KmcaVA6UiD0EGbh+S1dW
         kbUhzqBTNaOcwSbTN8+qk+/+mA2vujYIesSoXjl4ajJPDpgFewzGNVWi4gO01eCxRGnm
         DK67JXI7StLXlSqaDs3RZJFnqvaRIwCN8K7nsWK9pBquN0N3NiOLbZo9ItCw2Lvb4Jj9
         I5uA==
X-Gm-Message-State: AC+VfDwjbF+puc57whuBVjrbzqI+wObRS0QKdQiwRGMOwhlHwixajI1d
	6BbMT7KBNiD8utgwASfGdxh7VmftSfwSZFukpo8=
X-Google-Smtp-Source: ACHHUZ5bvm23Q7RfO7NuzvWcLnXjLTJKxBQTasEkVNoZsKpExrVOKUBP5La7Pd8sdhyE31RKbiytTxmH4oM7xHf3yeE=
X-Received: by 2002:a6b:ee17:0:b0:763:8ad8:e2b0 with SMTP id
 i23-20020a6bee17000000b007638ad8e2b0mr14549286ioh.7.1683140528831; Wed, 03
 May 2023 12:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <01010187d9352360-4eff0521-e848-4365-a203-ba8b516d3d8b-000000@us-west-2.amazonses.com>
 <ad51e892-f8cb-adf9-b958-1e2cad618015@windriver.com> <CANNYZj-CWh2pc=GhqdEWmi+Nqd+Ur0K8UFvuQBuV72upHBYuAQ@mail.gmail.com>
In-Reply-To: <CANNYZj-CWh2pc=GhqdEWmi+Nqd+Ur0K8UFvuQBuV72upHBYuAQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 3 May 2023 20:01:57 +0100
Message-ID: <CAO5Uq5SbpFvyOfFdZsWFBeOjya459pq2pVEWRY+5j5jzZeGURA@mail.gmail.com>
Subject: Re: [AUH] rust: upgrading to 1.69.0 FAILED -> Sundeep to do the update.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 19:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180835

Yeah, I think it's made it through testing in master-next?

On Wed, May 3, 2023 at 8:39=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> I think Alex Kiernan already sent an update here about a week ago?
>
> Alex
>
>
> On Wed, 3 May 2023 at 01:29, Randy MacLeod <randy.macleod@windriver.com> =
wrote:
> >
> > On 2023-05-01 17:25, auh@yoctoproject.org wrote:
> >
> > Hello,
> >
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe *rust* to *1.69.0* has=
 Failed (devtool error).
> >
> > Detailed error information:
> >
> > The following devtool command failed:  upgrade rust -V 1.69.0
> >
> > Sundeep said that he will start working on this tomorrow unless someone=
 else speaks up
> > about having the update underway. 1.70 isn't due until June 1st or so.
> >
> > ../Randy
> >
> >
> > NOTE: Starting bitbake server...
> > NOTE: Reconnecting to bitbake server...
> > NOTE: Retrying server connection (#1)... (14:02:48.244299)
> > Loading cache...done.
> > Loaded 1799 entries from dependency cache.
> > Removing 1 recipes from the x86_64 sysroot...done.
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           =3D "2.4.0"
> > BUILD_SYS            =3D "x86_64-linux"
> > NATIVELSBSTRING      =3D "universal"
> > TARGET_SYS           =3D "x86_64-poky-linux"
> > MACHINE              =3D "qemux86-64"
> > DISTRO               =3D "poky"
> > DISTRO_VERSION       =3D "4.2"
> > TUNE_FEATURES        =3D "m64 core2"
> > TARGET_FPU           =3D ""
> > meta
> > meta-poky
> > meta-yocto-bsp       =3D "tmp-auh-upgrades:c08f5fabc6f19121f285caaed7c9=
9e1ba459baab"
> > workspace            =3D "master:cce6db2a59d309f77c1f9ca173fc674c506062=
d0"
> >
> > Initialising tasks...done.
> > Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% matc=
h, 100% complete)
> > NOTE: Executing Tasks
> > NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be =
rerun and all succeeded.
> > NOTE: Writing buildhistory
> > NOTE: Writing buildhistory took: 2 seconds
> > Loading cache...done.
> > Loaded 1799 entries from dependency cache.
> > Parsing recipes...done.
> > Parsing of 900 .bb files complete (898 cached, 2 parsed). 1800 targets,=
 39 skipped, 0 masked, 0 errors.
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           =3D "2.4.0"
> > BUILD_SYS            =3D "x86_64-linux"
> > NATIVELSBSTRING      =3D "universal"
> > TARGET_SYS           =3D "x86_64-poky-linux"
> > MACHINE              =3D "qemux86-64"
> > DISTRO               =3D "poky"
> > DISTRO_VERSION       =3D "4.2"
> > TUNE_FEATURES        =3D "m64 core2"
> > TARGET_FPU           =3D ""
> > meta
> > meta-poky
> > meta-yocto-bsp       =3D "tmp-auh-upgrades:c08f5fabc6f19121f285caaed7c9=
9e1ba459baab"
> > workspace            =3D "master:cce6db2a59d309f77c1f9ca173fc674c506062=
d0"
> >
> > Initialising tasks...done.
> > Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% matc=
h, 100% complete)
> > NOTE: Executing Tasks
> > NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be r=
erun and all succeeded.
> > NOTE: Writing buildhistory
> > NOTE: Writing buildhistory took: 2 seconds
> > DEBUG 5 [Errno 25] Inappropriate ioctl for device
> > Adding changed files:   0% |                                   | ETA:  =
--:--:--
> > Adding changed files:   0% |                                   | ETA:  =
--:--:--
> > Adding changed files:   1% |                                    | ETA: =
 0:01:03
> > Adding changed files:   2% |                                    | ETA: =
 0:00:45
> > Adding changed files:   3% |#                                   | ETA: =
 0:00:40
> > Adding changed files:   4% |#                                   | ETA: =
 0:00:36
> > Adding changed files:   5% |#                                   | ETA: =
 0:00:34
> > Adding changed files:   6% |##                                  | ETA: =
 0:00:33
> > Adding changed files:   7% |##                                  | ETA: =
 0:00:32
> > Adding changed files:   8% |##                                  | ETA: =
 0:00:31
> > Adding changed files:   9% |###                                 | ETA: =
 0:00:30
> > Adding changed files:  10% |###                                 | ETA: =
 0:00:30
> > Adding changed files:  11% |####                                | ETA: =
 0:00:29
> > Adding changed files:  12% |####                                | ETA: =
 0:00:29
> > Adding changed files:  13% |####                                | ETA: =
 0:00:28
> > Adding changed files:  14% |#####                               | ETA: =
 0:00:27
> > Adding changed files:  15% |#####                               | ETA: =
 0:00:27
> > Adding changed files:  16% |#####                               | ETA: =
 0:00:27
> > Adding changed files:  17% |######                              | ETA: =
 0:00:26
> > Adding changed files:  18% |######                              | ETA: =
 0:00:26
> > Adding changed files:  19% |######                              | ETA: =
 0:00:25
> > Adding changed files:  20% |#######                             | ETA: =
 0:00:25
> > Adding changed files:  21% |#######                             | ETA: =
 0:00:25
> > Adding changed files:  22% |########                            | ETA: =
 0:00:24
> > Adding changed files:  23% |########                            | ETA: =
 0:00:24
> > Adding changed files:  24% |########                            | ETA: =
 0:00:23
> > Adding changed files:  25% |#########                           | ETA: =
 0:00:23
> > Adding changed files:  26% |#########                           | ETA: =
 0:00:23
> > Adding changed files:  27% |#########                           | ETA: =
 0:00:23
> > Adding changed files:  28% |##########                          | ETA: =
 0:00:23
> > Adding changed files:  29% |##########                          | ETA: =
 0:00:22
> > Adding changed files:  30% |##########                          | ETA: =
 0:00:22
> > Adding changed files:  31% |###########                         | ETA: =
 0:00:22
> > Adding changed files:  32% |###########                         | ETA: =
 0:00:22
> > Adding changed files:  33% |############                        | ETA: =
 0:00:21
> > Adding changed files:  34% |############                        | ETA: =
 0:00:21
> > Adding changed files:  35% |############                        | ETA: =
 0:00:21
> > Adding changed files:  36% |#############                       | ETA: =
 0:00:21
> > Adding changed files:  37% |#############                       | ETA: =
 0:00:20
> > Adding changed files:  38% |#############                       | ETA: =
 0:00:20
> > Adding changed files:  39% |##############                      | ETA: =
 0:00:20
> > Adding changed files:  40% |##############                      | ETA: =
 0:00:20
> > Adding changed files:  41% |##############                      | ETA: =
 0:00:19
> > Adding changed files:  42% |###############                     | ETA: =
 0:00:19
> > Adding changed files:  43% |###############                     | ETA: =
 0:00:19
> > Adding changed files:  44% |################                    | ETA: =
 0:00:18
> > Adding changed files:  45% |################                    | ETA: =
 0:00:18
> > Adding changed files:  46% |################                    | ETA: =
 0:00:18
> > Adding changed files:  47% |#################                   | ETA: =
 0:00:17
> > Adding changed files:  48% |#################                   | ETA: =
 0:00:17
> > Adding changed files:  49% |#################                   | ETA: =
 0:00:17
> > Adding changed files:  50% |##################                  | ETA: =
 0:00:17
> > Adding changed files:  51% |##################                  | ETA: =
 0:00:16
> > Adding changed files:  52% |###################                 | ETA: =
 0:00:16
> > Adding changed files:  53% |###################                 | ETA: =
 0:00:16
> > Adding changed files:  54% |###################                 | ETA: =
 0:00:15
> > Adding changed files:  55% |####################                | ETA: =
 0:00:15
> > Adding changed files:  56% |####################                | ETA: =
 0:00:15
> > Adding changed files:  57% |####################                | ETA: =
 0:00:14
> > Adding changed files:  58% |#####################               | ETA: =
 0:00:14
> > Adding changed files:  59% |#####################               | ETA: =
 0:00:14
> > Adding changed files:  60% |#####################               | ETA: =
 0:00:13
> > Adding changed files:  61% |######################              | ETA: =
 0:00:13
> > Adding changed files:  63% |######################              | ETA: =
 0:00:13
> > Adding changed files:  64% |#######################             | ETA: =
 0:00:12
> > Adding changed files:  65% |#######################             | ETA: =
 0:00:12
> > Adding changed files:  66% |#######################             | ETA: =
 0:00:12
> > Adding changed files:  67% |########################            | ETA: =
 0:00:11
> > Adding changed files:  68% |########################            | ETA: =
 0:00:11
> > Adding changed files:  69% |########################            | ETA: =
 0:00:11
> > Adding changed files:  70% |#########################           | ETA: =
 0:00:10
> > Adding changed files:  71% |#########################           | ETA: =
 0:00:10
> > Adding changed files:  72% |#########################           | ETA: =
 0:00:10
> > Adding changed files:  73% |##########################          | ETA: =
 0:00:09
> > Adding changed files:  74% |##########################          | ETA: =
 0:00:09
> > Adding changed files:  75% |###########################         | ETA: =
 0:00:09
> > Adding changed files:  76% |###########################         | ETA: =
 0:00:08
> > Adding changed files:  77% |###########################         | ETA: =
 0:00:08
> > Adding changed files:  78% |############################        | ETA: =
 0:00:07
> > Adding changed files:  79% |############################        | ETA: =
 0:00:07
> > Adding changed files:  80% |############################        | ETA: =
 0:00:07
> > Adding changed files:  81% |#############################       | ETA: =
 0:00:06
> > Adding changed files:  82% |#############################       | ETA: =
 0:00:06
> > Adding changed files:  83% |#############################       | ETA: =
 0:00:06
> > Adding changed files:  84% |##############################      | ETA: =
 0:00:05
> > Adding changed files:  85% |##############################      | ETA: =
 0:00:05
> > Adding changed files:  86% |###############################     | ETA: =
 0:00:05
> > Adding changed files:  87% |###############################     | ETA: =
 0:00:04
> > Adding changed files:  88% |###############################     | ETA: =
 0:00:04
> > Adding changed files:  89% |################################    | ETA: =
 0:00:03
> > Adding changed files:  90% |################################    | ETA: =
 0:00:03
> > Adding changed files:  91% |################################    | ETA: =
 0:00:03
> > Adding changed files:  92% |#################################   | ETA: =
 0:00:02
> > Adding changed files:  93% |#################################   | ETA: =
 0:00:02
> > Adding changed files:  94% |##################################  | ETA: =
 0:00:02
> > Adding changed files:  95% |##################################  | ETA: =
 0:00:01
> > Adding changed files:  96% |##################################  | ETA: =
 0:00:01
> > Adding changed files:  97% |################################### | ETA: =
 0:00:00
> > Adding changed files:  98% |################################### | ETA: =
 0:00:00
> > Adding changed files:  99% |################################### | ETA: =
 0:00:00
> > Adding changed files: 100% |####################################| Time:=
 0:00:36
> >
> > INFO: Extracting current version source...
> > INFO: Extracting upgraded version source...
> > INFO: Fetching https://static.rust-lang.org/dist/rustc-1.69.0-src.tar.x=
z;name=3Drust...
> > INFO: Rebasing devtool onto 501a8ba40bc5d3e5ab5ee81bf2819c527bc8f221
> > WARNING: Command 'git rebase 501a8ba40bc5d3e5ab5ee81bf2819c527bc8f221' =
failed:
> > CONFLICT (modify/delete): vendor/crossbeam-utils-0.8.12/.cargo-checksum=
.json deleted in HEAD and modified in 8ca3ec0aa (rust: Fix crossbeam-utils =
for arches without atomics).  Version 8ca3ec0aa (rust: Fix crossbeam-utils =
for arches without atomics) of vendor/crossbeam-utils-0.8.12/.cargo-checksu=
m.json left in tree.
> > CONFLICT (modify/delete): vendor/crossbeam-utils-0.8.12/build.rs delete=
d in HEAD and modified in 8ca3ec0aa (rust: Fix crossbeam-utils for arches w=
ithout atomics).  Version 8ca3ec0aa (rust: Fix crossbeam-utils for arches w=
ithout atomics) of vendor/crossbeam-utils-0.8.12/build.rs left in tree.
> >
> > ERROR: Execution of 'git checkout devtool' failed with exit code 1:
> > error: you need to resolve your current index first
> > vendor/crossbeam-utils-0.8.12/.cargo-checksum.json: needs merge
> > vendor/crossbeam-utils-0.8.12/build.rs: needs merge
> >
> >
> >
> > Please review the attached files for further information and build/upda=
te failures.
> > Any problem please file a bug at https://bugzilla.yoctoproject.org/ente=
r_bug.cgi?product=3DAutomated%20Update%20Handler
> >
> > Regards,
> > The Upgrade Helper
> >
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux



--=20
Alex Kiernan

