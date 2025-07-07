Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74645C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 16:53:56 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.2115.1751907231890768380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 09:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBnD8fD/;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-711a3dda147so31089887b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 09:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751907231; x=1752512031; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9QpM0c3oRq8G6DRSq2V2QMXVxw05TS9AHkaC6TO8/w=;
        b=LBnD8fD/IUT8lgWYPOoeAU7Y75MREGkr03iQwUDIXeosgw1A6Jucjyr7LRLvSaiF5P
         e44PRSXVSoAtwzDDdh/mFJwj9x6BJ/Fqg/9wbA/u2jdCFuHCwJFkVRPaBuBPtcUmeoEt
         gEi5iU2aUfz3o3n8ZOlfWpcaY26Iu9I/b3HdwShINU44aDfGDCZvsQs3K69ygczti+7N
         R34P9Mu1FkfvOmKmAhOs/Q5RpuxxxzxD40mn6/PyJPeeWkfVP23x4+jXDQvsC7PW1MPx
         XUDw70J7LFvs5gyVd4oqYccBwkPsJPl6lew3fCAXZxKxjf7/zuH8vR8NyZntZ6N+OQIw
         I6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751907231; x=1752512031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9QpM0c3oRq8G6DRSq2V2QMXVxw05TS9AHkaC6TO8/w=;
        b=JlUSggjp0u9/fuSA3yheF+iuzO03tNhaeBc3RZx+87kVeZ0Lte+WL45xElB95pcdAP
         GpslYWl1UnmCp5zflHh+14JpX+3OjMyDPOgKoQ73H4lNACdFyGbcEU6rB1UClVkVBAno
         02MrrlLrFS2q+pCYL/XfT6PZozt2SSfM5v32H+rrGY4SJ5nuXsCMhteKoxuU/zo9Kan/
         A+79PeLi5llSEcf13am/gR9uCMb670jXJOUjM6cCf+8qMnpTA8fLA/+E8B7M91P9ko+z
         K5pGxWswtxjHscbC/FgQaS3l0anDDwksGOAmI0LPHQ7m9in6LaoIDx8oJvuDiWtZ/uM6
         8+iQ==
X-Gm-Message-State: AOJu0YyqOBpQWfv7pTBSSgf7SVG8B57HO2WwbCfF7KaOKNcH72sUCqBH
	9aXAcnVFavme/dOxVrPqMAFOoBXYSYcesHd97H03DyhvDWHjHn23ruXdfTPVC5CU5MUZHrTpYCY
	F8p/CkwA4CEvf3r3HKX5JJVvMxIoTyR8IAB2yrbw=
X-Gm-Gg: ASbGncvvJU/L+l/71fUYbo2DYKCBxsIZbLZ2AjklnUDXHz/atMN4tR0LIUm3QDfgeGT
	3tO7eCg7eddVO813of5Nl+bnUaVXbZf7rDdH0xc4ldGjuX50z3yhJRoC97w6lSfVU/nh7PFOC63
	8tognEU80yjuWY48jdsVMNBxD0iljNVk4S5utv3Aan7j86WIrV/4w1Zg==
X-Google-Smtp-Source: AGHT+IFihJWsr3tDyGpmiuRsRtOTftQ6HYjQGW5Irh1oCdaUrYaxUNcnpU96te4UnHO7X+8Udw4jZnEH3UXe/RyKJBQ=
X-Received: by 2002:a05:690c:4d82:b0:714:2f2:5aa1 with SMTP id
 00721157ae682-7179e4a96ebmr3206747b3.38.1751907230899; Mon, 07 Jul 2025
 09:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250703132720.3378569-1-Moritz.Haase@bmw.de>
In-Reply-To: <20250703132720.3378569-1-Moritz.Haase@bmw.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Jul 2025 09:53:23 -0700
X-Gm-Features: Ac12FXxoobF5eKr0pakovPXZgC-5gW7hftFFP7b4pkseT-wos0jrvMR_17vm2eI
Message-ID: <CAMKF1sr80kZEZunuw4mo32TbKXdrGUb853J8sA3EHuvc8suN3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
To: Moritz.Haase@bmw.de
Cc: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com, 
	quentin.schulz@cherry.de, antonin.godard@bootlin.com, Peter.Marko@siemens.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 16:53:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219992

Moritz

While this change is a good one, this does have some implications on
the recipes especially from meta-openembedded, there are almost 100
which are failing, perhaps some of them are easy and others are not to
fix, but this does look invasive in nature. Like oe-core has been
fixed, I am afraid we need to fix meta-openembedded layers too. Here
is a sample world build logs for qemuarm

https://errors.yoctoproject.org/Errors/Build/210889/?page=3D1

This is also a call for recipe maintainers to fix the concerned
recipes if they are impacted.

On Thu, Jul 3, 2025 at 6:27=E2=80=AFAM Moritz Haase via lists.openembedded.=
org
<Moritz.Haase=3Dbmw.de@lists.openembedded.org> wrote:
>
> This patch series bumps CMake to 4.0.3, the most current of the 4.x relea=
ses.
> That bump allows us to drop all of the upstreamable patches for CMake its=
elf
> that we currently carry, which was the motivation for the update as sugge=
sted by
> Alex Kanavin in [0].
>
> A number of components require (minor) patches to build with the new CMak=
e
> version. In most cases, those are backports of commits that haven't made =
it into
> an upstream release yet.
>
> The bump depends on this patches, but not vice-versa (since we are alread=
y on
> CMake 3.31). Thus, if desired, it would be possible to pull the 'Allow bu=
ilds
> with CMake 4+' patches in in advance of the actual bump.
>
> changes in v5:
> - Fix for oe_selftest failure in 'DevtoolAddTests.test_devtool_add_librar=
y'
> - Updated patch for musl-locales based on upstream feedback
>
> changes in v4:
> - Fixed broken patch formatting.
>
> changes in v3:
>
> - Updated patch series description.
> - Added four additional commits with patches for build failures seen on
>   Autobuilder. Those should be all be fixed now, apart from the one in
>   meta-virt (yajl-2.1.0), which I don't have set up locally.
> - Fix for test failure seen in SDK tests.
>
> changes in v2:
>
> - Re-ordered / squashed commits to keep bisectability (see [3], [4])
> - Fixed patchtest findings
>
> [0]: https://lists.openembedded.org/g/openembedded-core/message/219113
> [1]: https://git.openembedded.org/openembedded-core/commit/?id=3Dc3efca74=
95889f3682225af8c9e01ceb094b1bb7
> [2]: https://git.openembedded.org/openembedded-core/commit/?id=3Dcb5234ac=
dab200bd43b89416d8d7e9df91af58cc
> [3]: https://lists.openembedded.org/g/openembedded-core/message/219403
> [4]: https://lists.openembedded.org/g/openembedded-core/message/219425
>
> CC: alex.kanavin@gmail.com
> CC: quentin.schulz@cherry.de
> CC: antonin.godard@bootlin.com
> CC: Peter.Marko@siemens.com
>
> Moritz Haase (7):
>   libcomps: Backport patch to support builds with CMake 4+
>   createrepo-c: Backport patches to support builds with CMake 4+
>   apt: Backport patch to support builds with CMake 4+
>   libubootenv: Backport patch to support builds with CMake 4+
>   musl-locales: Add patch to support builds with CMake 4+
>   libwpe: Add patch to support builds with CMake 4+
>   cmake: upgrade 3.31.6 -> 4.0.3
>
>  .../sdkext/files/myapp_cmake/CMakeLists.txt   |   2 +-
>  meta/lib/oeqa/selftest/cases/devtool.py       |  10 +-
>  ...Update-cmake_minimum_required-to-3.5.patch |  50 ++++
>  meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb  |   4 +-
>  ...red-CMake-version-to-3.5-to-allow-bu.patch |  41 ++++
>  meta/recipes-core/musl/musl-locales_git.bb    |   4 +-
>  ...mum_required-to-3.13-to-avoid-warnin.patch |  47 ++++
>  meta/recipes-devtools/apt/apt_2.6.1.bb        |   1 +
>  ...native_3.31.6.bb =3D> cmake-native_4.0.3.bb} |   6 +-
>  meta/recipes-devtools/cmake/cmake.inc         |   8 +-
>  ...mpilerABI-Strip-pipe-from-compile-fl.patch |  63 -----
>  ...xt2fs-ext2_fs.h-by-cmake-s-internal.patch} |   4 +-
>  ...ng-undocumented-type-for-CURLOPT_NET.patch |  30 ---
>  ...trary-characters-in-test-names-of-CT.patch | 202 ----------------
>  ...-CMakeLists.txt-disable-USE_NGHTTP2.patch} |   6 +-
>  .../cmake/{cmake_3.31.6.bb =3D> cmake_4.0.3.bb} |   1 -
>  .../0001-Fix-libname-of-Libs.private.patch    |  22 ++
>  ...ED_TARGET-for-3rd-party-dependencies.patch | 226 ++++++++++++++++++
>  ...-imported-targets-of-turned-off-depe.patch |  53 ++++
>  ...ds-without-Doxygen-being-present-wit.patch |  50 ++++
>  .../createrepo-c/createrepo-c_1.2.1.bb        |   4 +
>  ...libcomps-Support-builds-with-CMake-4.patch | 132 ++++++++++
>  .../libcomps/libcomps_0.1.21.bb               |   1 +
>  ...red-CMake-version-to-3.5-to-allow-bu.patch |  38 +++
>  meta/recipes-sato/webkit/libwpe_1.16.2.bb     |   6 +-
>  25 files changed, 695 insertions(+), 316 deletions(-)
>  create mode 100644 meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake=
_minimum_required-to-3.5.patch
>  create mode 100644 meta/recipes-core/musl/musl-locales/0001-cmake-Bump-r=
equired-CMake-version-to-3.5-to-allow-bu.patch
>  create mode 100644 meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimu=
m_required-to-3.13-to-avoid-warnin.patch
>  rename meta/recipes-devtools/cmake/{cmake-native_3.31.6.bb =3D> cmake-na=
tive_4.0.3.bb} (90%)
>  delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermine=
CompilerABI-Strip-pipe-from-compile-fl.patch
>  rename meta/recipes-devtools/cmake/cmake/{0005-Disable-use-of-ext2fs-ext=
2_fs.h-by-cmake-s-internal-.patch =3D> 0001-Disable-use-of-ext2fs-ext2_fs.h=
-by-cmake-s-internal.patch} (90%)
>  delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-u=
sing-undocumented-type-for-CURLOPT_NET.patch
>  delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-ar=
bitrary-characters-in-test-names-of-CT.patch
>  rename meta/recipes-devtools/cmake/cmake/{0001-CMakeLists.txt-disable-US=
E_NGHTTP2.patch =3D> 0002-CMakeLists.txt-disable-USE_NGHTTP2.patch} (83%)
>  rename meta/recipes-devtools/cmake/{cmake_3.31.6.bb =3D> cmake_4.0.3.bb}=
 (96%)
>  create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-=
Fix-libname-of-Libs.private.patch
>  create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0002-=
Use-IMPORTED_TARGET-for-3rd-party-dependencies.patch
>  create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0003-=
Don-t-try-to-use-imported-targets-of-turned-off-depe.patch
>  create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0004-=
cmake-Allow-builds-without-Doxygen-being-present-wit.patch
>  create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-libcomps=
-Support-builds-with-CMake-4.patch
>  create mode 100644 meta/recipes-sato/webkit/libwpe/0001-cmake-Bump-requi=
red-CMake-version-to-3.5-to-allow-bu.patch
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219881): https://lists.openembedded.org/g/openembedde=
d-core/message/219881
> Mute This Topic: https://lists.openembedded.org/mt/113965735/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

