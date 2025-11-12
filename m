Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90ACCD3435
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 17:38:49 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3296.1762969126348676473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 09:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VWo+3H/h;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71d71bcab6fso10906727b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 09:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762969125; x=1763573925; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=78mBH7PJN8eJg0frD6aLVL93EtDkKg0dxPiSa41JbkI=;
        b=VWo+3H/haHtELDb4ABnDH26w3ghwXWg8UlBRK4pACWg77sy0jcv9Gqlm6oK12g/Sd9
         klPtDdRbyYPvWCe1YIAvE66xoCtpjXnbJad277dquU80qTw4NUaeJ2Kj6OPiEm5Iju/U
         MlFj0aRNAGvCdffRcnSYLXv1SCV3ZGpIlDLO2UBzu0/l68h0ZuNSO235eYwB0d5ejcHT
         wiR6qlkyTrDQPxN0Yby0j+t2GtGMuqHOnb3yxws5LHqwxkQ4qOrqG/CeG3ZKnsliozpC
         /5BNr8iMqMoFh40lzr9dz0HUvxAWyO7iN8Ij2XGkVOap7Cjt/pKIFb1OLUz9myRaKpaf
         dYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762969125; x=1763573925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78mBH7PJN8eJg0frD6aLVL93EtDkKg0dxPiSa41JbkI=;
        b=r0vODRJL44Qk8eG4I/iBBrTLUaJDgpdXK4xP2x83omTLOiu45VZELR9CZ7N3TzxWk8
         hJ+vNoli2xqSev+QlJ+bkGfKCH04n+bK2TO6LQ/gcVu/aODKZggCpw6eMWGM+gzBJZ+r
         VQqt4yYOB88M/26+DBtyLs4daph0dGXzvWEJ4J36zFty6inBh7vfx51aNswZESkhmVeJ
         069+helGBNsdOkhm24pqauhz663zXejEHOuiPNPfpylKA6YV+MjsEI95pFjyBi9NdzNX
         vvDdsNU0t8cZrST/JFU2DsUZC4tNN7q1hQA0gdi6cQssgd326GDq3ZxtlV6o3tcHySfE
         1JOA==
X-Gm-Message-State: AOJu0YxM7XKAB9N5qb4PzN1N1iClDFJBVfmzU5qfVhlpr+lVM8YUOpzS
	6Xoc8QisUuiOCOvPeyfpIgYkICKA4Wg1mqZMd71RgWlsvoQz8xBsFwp1Xmj7aqWa+rWrGhla42b
	gFmQwt4h43rzWywo8zDIn3RC/FfQ7aAQ=
X-Gm-Gg: ASbGncttyDrSyWCtZ9IyYsDPV3xDoJBPJtwwYq4CmT6N5VzFT9ykPjbQmuKel8SiO6n
	YH1Br09yo3SX7xAeNTIs7rIZKBf5NRO6cFqR0iSBqHDBxFmw5DsGriMvbRU68hHY2ph8hPRUEi2
	HnNDPows9+UtUidAEqzoHfhr362USt3fGqMeAmuT880k77mdLpjWC9GiaEOuArmiNt80rgzRqyA
	9wtvuE4nU/3e2CFY6Njt0L5gXTApRMUKLRzvckNGwCGhTchX8nQ2vLzD2utsU4/4LKOCDEdk1Pq
	2UyBKO7WSI9eTAGTTdKxrsYcr1D8YoocgxuuWa6XWHlp6uKPa9KLssbWm92+cs9nIHLvu902k2f
	OXrpn
X-Google-Smtp-Source: AGHT+IHdol5ZCybJfP1QbYyzqvcl6oOhesNJHLhdy3QBnML8CW3LOQyvZVELvlhvjv5z0TNnrfxHxW0z5zVlvGaLYkA=
X-Received: by 2002:a05:690c:6892:b0:786:4fd5:e5de with SMTP id
 00721157ae682-78813f3b8e1mr29617857b3.67.1762969125204; Wed, 12 Nov 2025
 09:38:45 -0800 (PST)
MIME-Version: 1.0
References: <tencent_48D3734B550F356650C664773A0B33A9DF06@qq.com>
In-Reply-To: <tencent_48D3734B550F356650C664773A0B33A9DF06@qq.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Nov 2025 09:38:18 -0800
X-Gm-Features: AWmQ_bmAELnCmQUCoGF3xjSBhfRbHyBYES3TkUr0uZLsDBCt471YlOwJC2YooAE
Message-ID: <CAMKF1som4BhG9yEPoRCdzFwF5P=3D=AZ6o+2fY0Jc3NL4UytVg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH RESEND v3] nethogs: add recipe
To: wenyang.linux@foxmail.com
Cc: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: multipart/alternative; boundary="0000000000007535ed0643693cc6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 17:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226212

--0000000000007535ed0643693cc6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4127330/raw_inlin=
e

On Tue, Nov 11, 2025 at 9:24=E2=80=AFAM <wenyang.linux@foxmail.com> wrote:

> From: Wen Yang <wenyang.linux@foxmail.com>
>
> NetHogs is a small 'net top' tool. Instead of breaking the traffic
> down per protocol or per subnet, like most tools do, it groups
> bandwidth by process.
>
> Signed-off-by: Wen Yang <wenyang.linux@foxmail.com>
> ---
>  ...0001-meson-cleanup-version-detection.patch |  49 +++++
>  ...n-fix-build-with-libnethogs-disabled.patch |  38 ++++
>  .../files/0003-meson-run-meson-format.patch   | 183 ++++++++++++++++++
>  .../files/0004-meson-fix-library-name.patch   |  25 +++
>  ...-security-flags-to-LDFLAGS-for-Linux.patch |  25 +++
>  ...S-for-devices.cpp-and-libnethogs.cpp.patch |  30 +++
>  .../nethogs/nethogs_git.bb                    |  21 ++
>  7 files changed, 371 insertions(+)
>  create mode 100644
> meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-version-det=
ection.patch
>  create mode 100644
> meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-build-with-libn=
ethogs-disabled.patch
>  create mode 100644
> meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-meson-format.pa=
tch
>  create mode 100644
> meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-library-name.pa=
tch
>  create mode 100644
> meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-flags-to-LDF=
LAGS-for-Linux.patch
>  create mode 100644
> meta-oe/recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-devi=
ces.cpp-and-libnethogs.cpp.patch
>  create mode 100644 meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
>
> diff --git
> a/meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-version-d=
etection.patch
> b/meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-version-d=
etection.patch
> new file mode 100644
> index 0000000000..797c79225d
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-version-d=
etection.patch
> @@ -0,0 +1,49 @@
> +From 049fff5623720fcd0b4fdc92501b586addbb6b48 Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Sat, 25 Jan 2025 16:03:12 +0000
> +Subject: [PATCH 1/6] meson: cleanup version detection
> +
> +Tell Meson what version the project is, so that we set the right
> versioning
> +on libnethogs.
> +
> +Upstream-Status: Backport [
> https://github.com/raboof/nethogs/commit/049fff5623720fcd0b4fdc92501b586a=
ddbb6b48
> ]
> +---
> + meson.build | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 81d7b59..16e61b4 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -5,11 +5,11 @@
> + project('nethogs',
> +         ['c', 'cpp'],
> +         default_options : ['warning_level=3D3',
> +-                           'cpp_std=3Dc++14']
> ++                           'cpp_std=3Dc++14'],
> ++        version : run_command('./determineVersion.sh').stdout().strip()=
,
> +         )
> +
> + cc =3D meson.get_compiler('cpp')
> +-version =3D run_command('./determineVersion.sh', check:
> true).stdout().strip()
> +
> + #######################################
> + ## Dependencies and flags definition ##
> +@@ -19,7 +19,7 @@ projectinc =3D [include_directories('.', 'src')]
> +
> + # flags
> + c_args =3D [
> +-  '-DVERSION=3D"' + version + '"'
> ++  '-DVERSION=3D"' + meson.project_version() + '"'
> + ]
> +
> + # dependencies
> +@@ -42,5 +42,5 @@ pkgconfig =3D import('pkgconfig')
> + pkgconfig_install_dir =3D join_paths(get_option('libdir'), 'pkgconfig')
> + pkgconfig.generate(libnethogs,
> +                    requires: ['libpcap'],
> +-                   version: version
> ++                   version: meson.project_version()
> +                    )
> +--
> +2.25.1
> diff --git
> a/meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-build-with-li=
bnethogs-disabled.patch
> b/meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-build-with-li=
bnethogs-disabled.patch
> new file mode 100644
> index 0000000000..c9a7cf69d6
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-build-with-li=
bnethogs-disabled.patch
> @@ -0,0 +1,38 @@
> +From 5afce747f142f6df6a264ab368c99f47050d9984 Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Sat, 25 Jan 2025 16:05:20 +0000
> +Subject: [PATCH 2/6] meson: fix build with libnethogs disabled
> +
> +Fix `meson.build:43:19: ERROR: Unknown variable "libnethogs".`.
> +
> +While src/ has this correct, the top-level meson.build wasn't right.
> +
> +Upstream-Status: Backport [
> https://github.com/raboof/nethogs/commit/5afce747f142f6df6a264ab368c99f47=
050d9984
> ]
> +---
> + meson.build | 14 ++++++++------
> + 1 file changed, 8 insertions(+), 6 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 16e61b4..8537718 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -38,9 +38,11 @@ subdir('src')
> + #############################
> + ## Pkgconfig definition    ##
> + #############################
> +-pkgconfig =3D import('pkgconfig')
> +-pkgconfig_install_dir =3D join_paths(get_option('libdir'), 'pkgconfig')
> +-pkgconfig.generate(libnethogs,
> +-                   requires: ['libpcap'],
> +-                   version: meson.project_version()
> +-                   )
> ++if get_option('enable-libnethogs').enabled()
> ++  pkgconfig =3D import('pkgconfig')
> ++  pkgconfig_install_dir =3D join_paths(get_option('libdir'), 'pkgconfig=
')
> ++  pkgconfig.generate(libnethogs,
> ++                     requires: ['libpcap'],
> ++                     version: meson.project_version()
> ++                     )
> ++endif
> +--
> +2.25.1
> diff --git
> a/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-meson-format.=
patch
> b/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-meson-format.=
patch
> new file mode 100644
> index 0000000000..9c92a9d835
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-meson-format.=
patch
> @@ -0,0 +1,183 @@
> +From fcbde46b0082b4c571392ea9b6427f5e11941393 Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Sat, 25 Jan 2025 16:06:12 +0000
> +Subject: [PATCH 3/6] meson: run `meson format`
> +
> +Upstream-Status: Backport [
> https://github.com/raboof/nethogs/commit/fcbde46b0082b4c571392ea9b6427f5e=
11941393
> ]
> +---
> + meson.build     | 34 +++++++++----------
> + src/meson.build | 87 ++++++++++++++++++++++---------------------------
> + 2 files changed, 54 insertions(+), 67 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 8537718..eb9f16e 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -2,12 +2,12 @@
> + # See COPYING for more information about licensing
> + #
> +
> +-project('nethogs',
> +-        ['c', 'cpp'],
> +-        default_options : ['warning_level=3D3',
> +-                           'cpp_std=3Dc++14'],
> +-        version : run_command('./determineVersion.sh').stdout().strip()=
,
> +-        )
> ++project(
> ++    'nethogs',
> ++    ['c', 'cpp'],
> ++    default_options: ['warning_level=3D3', 'cpp_std=3Dc++14'],
> ++    version: run_command('./determineVersion.sh').stdout().strip(),
> ++)
> +
> + cc =3D meson.get_compiler('cpp')
> +
> +@@ -18,17 +18,12 @@ cc =3D meson.get_compiler('cpp')
> + projectinc =3D [include_directories('.', 'src')]
> +
> + # flags
> +-c_args =3D [
> +-  '-DVERSION=3D"' + meson.project_version() + '"'
> +-]
> ++c_args =3D ['-DVERSION=3D"' + meson.project_version() + '"']
> +
> + # dependencies
> + thread_dep =3D dependency('threads', required: true)
> + libpcap_dep =3D dependency('libpcap', required: true)
> +-project_deps =3D [
> +-  thread_dep,
> +-  libpcap_dep
> +-]
> ++project_deps =3D [thread_dep, libpcap_dep]
> +
> + #############################
> + ## Code Compilation        ##
> +@@ -39,10 +34,11 @@ subdir('src')
> + ## Pkgconfig definition    ##
> + #############################
> + if get_option('enable-libnethogs').enabled()
> +-  pkgconfig =3D import('pkgconfig')
> +-  pkgconfig_install_dir =3D join_paths(get_option('libdir'), 'pkgconfig=
')
> +-  pkgconfig.generate(libnethogs,
> +-                     requires: ['libpcap'],
> +-                     version: meson.project_version()
> +-                     )
> ++    pkgconfig =3D import('pkgconfig')
> ++    pkgconfig_install_dir =3D join_paths(get_option('libdir'), 'pkgconf=
ig')
> ++    pkgconfig.generate(
> ++        libnethogs,
> ++        requires: ['libpcap'],
> ++        version: meson.project_version(),
> ++    )
> + endif
> +diff --git a/src/meson.build b/src/meson.build
> +index 03f1b58..1329df4 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -3,65 +3,56 @@
> + #
> +
> + sources =3D [
> +-  files([
> +-    'connection.cpp',
> +-    'conninode.cpp',
> +-    'decpcap.c',
> +-    'devices.cpp',
> +-    'inode2prog.cpp',
> +-    'packet.cpp',
> +-    'process.cpp',
> +-  ])
> ++    files(
> ++        'connection.cpp',
> ++        'conninode.cpp',
> ++        'decpcap.c',
> ++        'devices.cpp',
> ++        'inode2prog.cpp',
> ++        'packet.cpp',
> ++        'process.cpp',
> ++    ),
> + ]
> +
> + # --- Executable Compilation ---
> +
> + if get_option('enable-nethogs-app').enabled()
> +-  app_sources =3D [
> +-    files([
> +-      'main.cpp',
> +-      'cui.cpp',
> +-    ])
> +-  ]
> +-
> +-  cursespp_dep =3D dependency('ncurses++', required: true)
> +-  curses_dep =3D dependency('ncurses', required: true)
> +-
> +-  executable('nethogs',
> +-    [app_sources + sources],
> +-    include_directories: [projectinc],
> +-    cpp_args: c_args,
> +-    c_args: c_args,
> +-    install: true,
> +-    dependencies : [project_deps, cursespp_dep, curses_dep]
> +-  )
> ++    app_sources =3D [files('cui.cpp', 'main.cpp')]
> ++
> ++    cursespp_dep =3D dependency('ncurses++', required: true)
> ++    curses_dep =3D dependency('ncurses', required: true)
> ++
> ++    executable(
> ++        'nethogs',
> ++        [app_sources + sources],
> ++        include_directories: [projectinc],
> ++        cpp_args: c_args,
> ++        c_args: c_args,
> ++        install: true,
> ++        dependencies: [project_deps, cursespp_dep, curses_dep],
> ++    )
> + endif
> +
> + # --- Library Compilation ---
> +
> + if get_option('enable-libnethogs').enabled()
> +-  lib_sources =3D [
> +-    files([
> +-      'libnethogs.cpp',
> +-    ])
> +-  ]
> ++    lib_sources =3D [files('libnethogs.cpp')]
> ++
> ++    libnethogs =3D shared_library(
> ++        'libnethogs' ,
> ++        sources + lib_sources,
> ++        cpp_args: c_args,
> ++        c_args: c_args,
> ++        install: true,
> ++        soversion: meson.project_version(),
> ++        include_directories: [projectinc],
> ++        dependencies: [project_deps],
> ++    )
> +
> +-  libnethogs =3D shared_library('libnethogs' ,
> +-    sources + lib_sources,
> +-    cpp_args: c_args,
> +-    c_args: c_args,
> +-    install: true,
> +-    soversion: meson.project_version(),
> +-    include_directories: [projectinc],
> +-    dependencies: [project_deps]
> +-  )
> +-
> +-  libnethogs_dep =3D declare_dependency(link_with: libnethogs)
> ++    libnethogs_dep =3D declare_dependency(link_with: libnethogs)
> +
> +-  # --- Header Installation ---
> ++    # --- Header Installation ---
> +
> +-  lib_headers =3D [
> +-    files('libnethogs.h'),
> +-  ]
> +-  install_headers(lib_headers, subdir : 'libnethogs')
> ++    lib_headers =3D [files('libnethogs.h')]
> ++    install_headers(lib_headers, subdir: 'libnethogs')
> + endif
> +--
> +2.25.1
> diff --git
> a/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-library-name.=
patch
> b/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-library-name.=
patch
> new file mode 100644
> index 0000000000..cc69a66748
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-library-name.=
patch
> @@ -0,0 +1,25 @@
> +From ba25a64dcd35f4a58c4d397160e90560e9851c79 Mon Sep 17 00:00:00 2001
> +From: CAB233 <yidaduizuoye@outlook.com>
> +Date: Mon, 24 Feb 2025 20:06:52 +0800
> +Subject: [PATCH 4/6] meson: fix library name
> +
> +Upstream-Status: Backport [
> https://github.com/raboof/nethogs/commit/ba25a64dcd35f4a58c4d397160e90560=
e9851c79
> ]
> +---
> + src/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index 1329df4..7f6dcba 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -39,7 +39,7 @@ if get_option('enable-libnethogs').enabled()
> +     lib_sources =3D [files('libnethogs.cpp')]
> +
> +     libnethogs =3D shared_library(
> +-        'libnethogs' ,
> ++        'nethogs' ,
> +         sources + lib_sources,
> +         cpp_args: c_args,
> +         c_args: c_args,
> +--
> +2.25.1
> diff --git
> a/meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-flags-to-L=
DFLAGS-for-Linux.patch
> b/meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-flags-to-L=
DFLAGS-for-Linux.patch
> new file mode 100644
> index 0000000000..553b382a66
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-flags-to-L=
DFLAGS-for-Linux.patch
> @@ -0,0 +1,25 @@
> +From 42e7950db8e412160e3f1f74b6cbc7298714c587 Mon Sep 17 00:00:00 2001
> +From: Matheus Polkorny <mpolkorny@ipt.br>
> +Date: Tue, 25 Mar 2025 00:47:04 -0300
> +Subject: [PATCH 5/6] Add security flags to LDFLAGS for Linux
> +
> +Upstream-Status: Backport [
> https://github.com/raboof/nethogs/commit/42e7950db8e412160e3f1f74b6cbc729=
8714c587
> ]
> +---
> + src/MakeLib.mk | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/MakeLib.mk b/src/MakeLib.mk
> +index 96ba694..1be0361 100644
> +--- a/src/MakeLib.mk
> ++++ b/src/MakeLib.mk
> +@@ -10,7 +10,7 @@ all: $(LIBNAME) libnethogs.a
> +
> + UNAME_S :=3D $(shell uname -s)
> + ifeq ($(UNAME_S),Linux)
> +-  LDFLAGS:=3D -shared -Wl,-soname,$(SO_NAME)
> ++  LDFLAGS:=3D -shared -Wl,-soname,$(SO_NAME) -Wl,-z,now -Wl,-z,relro
> + else ifeq ($(UNAME_S),FreeBSD)
> +   LDFLAGS:=3D -shared -Wl,-soname,$(SO_NAME)
> + else
> +--
> +2.25.1
> diff --git
> a/meta-oe/recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-de=
vices.cpp-and-libnethogs.cpp.patch
> b/meta-oe/recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-de=
vices.cpp-and-libnethogs.cpp.patch
> new file mode 100644
> index 0000000000..485d476c50
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-de=
vices.cpp-and-libnethogs.cpp.patch
> @@ -0,0 +1,30 @@
> +From 1407f83485c31cd6f29614402bb2a3e912a3dd34 Mon Sep 17 00:00:00 2001
> +From: Matheus Polkorny <mpolkorny@ipt.br>
> +Date: Tue, 25 Mar 2025 00:48:20 -0300
> +Subject: [PATCH 6/6] Include $(CPPFLAGS) for devices.cpp and
> libnethogs.cpp
> +
> +Upstream-Status: Backport [
> https://github.com/raboof/nethogs/commit/1407f83485c31cd6f29614402bb2a3e9=
12a3dd34
> ]
> +---
> + src/MakeLib.mk | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/MakeLib.mk b/src/MakeLib.mk
> +index 1be0361..513096e 100644
> +--- a/src/MakeLib.mk
> ++++ b/src/MakeLib.mk
> +@@ -97,11 +97,11 @@ $(ODIR)/conninode.o: conninode.cpp nethogs.h
> conninode.h
> +
> + $(ODIR)/devices.o: devices.cpp devices.h
> +       @mkdir -p $(ODIR)
> +-      $(CXX) $(CXXFLAGS) -o $@ -c devices.cpp
> ++      $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c devices.cpp
> +
> + $(ODIR)/libnethogs.o: libnethogs.cpp libnethogs.h
> +       @mkdir -p $(ODIR)
> +-      $(CXX) $(CXXFLAGS) -o $@ -c libnethogs.cpp
> -DVERSION=3D\"$(LIBVERSION)\"
> ++      $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c libnethogs.cpp
> -DVERSION=3D\"$(LIBVERSION)\"
> +
> + .PHONY: clean
> + clean:
> +--
> +2.25.1
> diff --git a/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
> b/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
> new file mode 100644
> index 0000000000..816cd9c542
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "NetHogs is a small 'net top' tool that can group bandwidth =
by
> process"
> +HOMEPAGE =3D "https://github.com/raboof/nethogs"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRC_URI =3D "git://github.com/raboof/nethogs.git;branch=3Dmain;protocol=
=3Dhttps
> \
> +           file://0001-meson-cleanup-version-detection.patch \
> +           file://0002-meson-fix-build-with-libnethogs-disabled.patch \
> +           file://0003-meson-run-meson-format.patch \
> +           file://0004-meson-fix-library-name.patch \
> +           file://0005-Add-security-flags-to-LDFLAGS-for-Linux.patch \
> +
>  file://0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch \
> +           "
> +
> +DEPENDS =3D "ncurses libpcap"
> +
> +inherit meson pkgconfig
> +
> +SRCREV =3D "632a78846eb3cc3259dc45c59a47fa9c293a2831"
> +PV =3D "0.8.8+git"
> --
> 2.25.1
>
>

--0000000000007535ed0643693cc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/a=
pi/v2/logs/4127330/raw_inline">https://autobuilder.yoctoproject.org/valkyri=
e/api/v2/logs/4127330/raw_inline</a></div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 11, 2=
025 at 9:24=E2=80=AFAM &lt;<a href=3D"mailto:wenyang.linux@foxmail.com">wen=
yang.linux@foxmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Wen Yang &lt;<a href=3D"mailto:wenyang.linux@fo=
xmail.com" target=3D"_blank">wenyang.linux@foxmail.com</a>&gt;<br>
<br>
NetHogs is a small &#39;net top&#39; tool. Instead of breaking the traffic<=
br>
down per protocol or per subnet, like most tools do, it groups<br>
bandwidth by process.<br>
<br>
Signed-off-by: Wen Yang &lt;<a href=3D"mailto:wenyang.linux@foxmail.com" ta=
rget=3D"_blank">wenyang.linux@foxmail.com</a>&gt;<br>
---<br>
=C2=A0...0001-meson-cleanup-version-detection.patch |=C2=A0 49 +++++<br>
=C2=A0...n-fix-build-with-libnethogs-disabled.patch |=C2=A0 38 ++++<br>
=C2=A0.../files/0003-meson-run-meson-format.patch=C2=A0 =C2=A0| 183 +++++++=
+++++++++++<br>
=C2=A0.../files/0004-meson-fix-library-name.patch=C2=A0 =C2=A0|=C2=A0 25 ++=
+<br>
=C2=A0...-security-flags-to-LDFLAGS-for-Linux.patch |=C2=A0 25 +++<br>
=C2=A0...S-for-devices.cpp-and-libnethogs.cpp.patch |=C2=A0 30 +++<br>
=C2=A0.../nethogs/<a href=3D"http://nethogs_git.bb" rel=3D"noreferrer" targ=
et=3D"_blank">nethogs_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 21 ++<br>
=C2=A07 files changed, 371 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/nethogs/files/0001-me=
son-cleanup-version-detection.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/nethogs/files/0002-me=
son-fix-build-with-libnethogs-disabled.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/nethogs/files/0003-me=
son-run-meson-format.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/nethogs/files/0004-me=
son-fix-library-name.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/nethogs/files/0005-Ad=
d-security-flags-to-LDFLAGS-for-Linux.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/nethogs/files/0006-In=
clude-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/nethogs/<a href=3D"ht=
tp://nethogs_git.bb" rel=3D"noreferrer" target=3D"_blank">nethogs_git.bb</a=
><br>
<br>
diff --git a/meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-=
version-detection.patch b/meta-oe/recipes-connectivity/nethogs/files/0001-m=
eson-cleanup-version-detection.patch<br>
new file mode 100644<br>
index 0000000000..797c79225d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-version=
-detection.patch<br>
@@ -0,0 +1,49 @@<br>
+From 049fff5623720fcd0b4fdc92501b586addbb6b48 Mon Sep 17 00:00:00 2001<br>
+From: Sam James &lt;<a href=3D"mailto:sam@gentoo.org" target=3D"_blank">sa=
m@gentoo.org</a>&gt;<br>
+Date: Sat, 25 Jan 2025 16:03:12 +0000<br>
+Subject: [PATCH 1/6] meson: cleanup version detection<br>
+<br>
+Tell Meson what version the project is, so that we set the right versionin=
g<br>
+on libnethogs.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/raboof/nethogs/co=
mmit/049fff5623720fcd0b4fdc92501b586addbb6b48" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/raboof/nethogs/commit/049fff5623720fcd0b4fdc925=
01b586addbb6b48</a>]<br>
+---<br>
+ meson.build | 8 ++++----<br>
+ 1 file changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index 81d7b59..16e61b4 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -5,11 +5,11 @@<br>
+ project(&#39;nethogs&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;c&#39;, &#39;cpp&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default_options : [&#39;warning_level=3D=
3&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;cpp_std=3Dc++14&#39;]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;cpp_std=3Dc++14&#39;],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 version : run_command(&#39;./determineVersion=
.sh&#39;).stdout().strip(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+<br>
+ cc =3D meson.get_compiler(&#39;cpp&#39;)<br>
+-version =3D run_command(&#39;./determineVersion.sh&#39;, check: true).std=
out().strip()<br>
+<br>
+ #######################################<br>
+ ## Dependencies and flags definition ##<br>
+@@ -19,7 +19,7 @@ projectinc =3D [include_directories(&#39;.&#39;, &#39;sr=
c&#39;)]<br>
+<br>
+ # flags<br>
+ c_args =3D [<br>
+-=C2=A0 &#39;-DVERSION=3D&quot;&#39; + version + &#39;&quot;&#39;<br>
++=C2=A0 &#39;-DVERSION=3D&quot;&#39; + meson.project_version() + &#39;&quo=
t;&#39;<br>
+ ]<br>
+<br>
+ # dependencies<br>
+@@ -42,5 +42,5 @@ pkgconfig =3D import(&#39;pkgconfig&#39;)<br>
+ pkgconfig_install_dir =3D join_paths(get_option(&#39;libdir&#39;), &#39;p=
kgconfig&#39;)<br>
+ pkgconfig.generate(libnethogs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 requ=
ires: [&#39;libpcap&#39;],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vers=
ion: version<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vers=
ion: meson.project_version()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br=
>
+--<br>
+2.25.1<br>
diff --git a/meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-buil=
d-with-libnethogs-disabled.patch b/meta-oe/recipes-connectivity/nethogs/fil=
es/0002-meson-fix-build-with-libnethogs-disabled.patch<br>
new file mode 100644<br>
index 0000000000..c9a7cf69d6<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-build-with-=
libnethogs-disabled.patch<br>
@@ -0,0 +1,38 @@<br>
+From 5afce747f142f6df6a264ab368c99f47050d9984 Mon Sep 17 00:00:00 2001<br>
+From: Sam James &lt;<a href=3D"mailto:sam@gentoo.org" target=3D"_blank">sa=
m@gentoo.org</a>&gt;<br>
+Date: Sat, 25 Jan 2025 16:05:20 +0000<br>
+Subject: [PATCH 2/6] meson: fix build with libnethogs disabled<br>
+<br>
+Fix `meson.build:43:19: ERROR: Unknown variable &quot;libnethogs&quot;.`.<=
br>
+<br>
+While src/ has this correct, the top-level meson.build wasn&#39;t right.<b=
r>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/raboof/nethogs/co=
mmit/5afce747f142f6df6a264ab368c99f47050d9984" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/raboof/nethogs/commit/5afce747f142f6df6a264ab36=
8c99f47050d9984</a>]<br>
+---<br>
+ meson.build | 14 ++++++++------<br>
+ 1 file changed, 8 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index 16e61b4..8537718 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -38,9 +38,11 @@ subdir(&#39;src&#39;)<br>
+ #############################<br>
+ ## Pkgconfig definition=C2=A0 =C2=A0 ##<br>
+ #############################<br>
+-pkgconfig =3D import(&#39;pkgconfig&#39;)<br>
+-pkgconfig_install_dir =3D join_paths(get_option(&#39;libdir&#39;), &#39;p=
kgconfig&#39;)<br>
+-pkgconfig.generate(libnethogs,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0requ=
ires: [&#39;libpcap&#39;],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vers=
ion: meson.project_version()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br=
>
++if get_option(&#39;enable-libnethogs&#39;).enabled()<br>
++=C2=A0 pkgconfig =3D import(&#39;pkgconfig&#39;)<br>
++=C2=A0 pkgconfig_install_dir =3D join_paths(get_option(&#39;libdir&#39;),=
 &#39;pkgconfig&#39;)<br>
++=C2=A0 pkgconfig.generate(libnethogs,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0requires: [&#39;libpcap&#39;],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0version: meson.project_version()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0)<br>
++endif<br>
+--<br>
+2.25.1<br>
diff --git a/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-meso=
n-format.patch b/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-=
meson-format.patch<br>
new file mode 100644<br>
index 0000000000..9c92a9d835<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-meson-forma=
t.patch<br>
@@ -0,0 +1,183 @@<br>
+From fcbde46b0082b4c571392ea9b6427f5e11941393 Mon Sep 17 00:00:00 2001<br>
+From: Sam James &lt;<a href=3D"mailto:sam@gentoo.org" target=3D"_blank">sa=
m@gentoo.org</a>&gt;<br>
+Date: Sat, 25 Jan 2025 16:06:12 +0000<br>
+Subject: [PATCH 3/6] meson: run `meson format`<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/raboof/nethogs/co=
mmit/fcbde46b0082b4c571392ea9b6427f5e11941393" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/raboof/nethogs/commit/fcbde46b0082b4c571392ea9b=
6427f5e11941393</a>]<br>
+---<br>
+ meson.build=C2=A0 =C2=A0 =C2=A0| 34 +++++++++----------<br>
+ src/meson.build | 87 ++++++++++++++++++++++---------------------------<br=
>
+ 2 files changed, 54 insertions(+), 67 deletions(-)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index 8537718..eb9f16e 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -2,12 +2,12 @@<br>
+ # See COPYING for more information about licensing<br>
+ #<br>
+<br>
+-project(&#39;nethogs&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;c&#39;, &#39;cpp&#39;],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 default_options : [&#39;warning_level=3D3&#39=
;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;cpp_std=3Dc++14&#39;],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 version : run_command(&#39;./determineVersion=
.sh&#39;).stdout().strip(),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++project(<br>
++=C2=A0 =C2=A0 &#39;nethogs&#39;,<br>
++=C2=A0 =C2=A0 [&#39;c&#39;, &#39;cpp&#39;],<br>
++=C2=A0 =C2=A0 default_options: [&#39;warning_level=3D3&#39;, &#39;cpp_std=
=3Dc++14&#39;],<br>
++=C2=A0 =C2=A0 version: run_command(&#39;./determineVersion.sh&#39;).stdou=
t().strip(),<br>
++)<br>
+<br>
+ cc =3D meson.get_compiler(&#39;cpp&#39;)<br>
+<br>
+@@ -18,17 +18,12 @@ cc =3D meson.get_compiler(&#39;cpp&#39;)<br>
+ projectinc =3D [include_directories(&#39;.&#39;, &#39;src&#39;)]<br>
+<br>
+ # flags<br>
+-c_args =3D [<br>
+-=C2=A0 &#39;-DVERSION=3D&quot;&#39; + meson.project_version() + &#39;&quo=
t;&#39;<br>
+-]<br>
++c_args =3D [&#39;-DVERSION=3D&quot;&#39; + meson.project_version() + &#39=
;&quot;&#39;]<br>
+<br>
+ # dependencies<br>
+ thread_dep =3D dependency(&#39;threads&#39;, required: true)<br>
+ libpcap_dep =3D dependency(&#39;libpcap&#39;, required: true)<br>
+-project_deps =3D [<br>
+-=C2=A0 thread_dep,<br>
+-=C2=A0 libpcap_dep<br>
+-]<br>
++project_deps =3D [thread_dep, libpcap_dep]<br>
+<br>
+ #############################<br>
+ ## Code Compilation=C2=A0 =C2=A0 =C2=A0 =C2=A0 ##<br>
+@@ -39,10 +34,11 @@ subdir(&#39;src&#39;)<br>
+ ## Pkgconfig definition=C2=A0 =C2=A0 ##<br>
+ #############################<br>
+ if get_option(&#39;enable-libnethogs&#39;).enabled()<br>
+-=C2=A0 pkgconfig =3D import(&#39;pkgconfig&#39;)<br>
+-=C2=A0 pkgconfig_install_dir =3D join_paths(get_option(&#39;libdir&#39;),=
 &#39;pkgconfig&#39;)<br>
+-=C2=A0 pkgconfig.generate(libnethogs,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0requires: [&#39;libpcap&#39;],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0version: meson.project_version()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0)<br>
++=C2=A0 =C2=A0 pkgconfig =3D import(&#39;pkgconfig&#39;)<br>
++=C2=A0 =C2=A0 pkgconfig_install_dir =3D join_paths(get_option(&#39;libdir=
&#39;), &#39;pkgconfig&#39;)<br>
++=C2=A0 =C2=A0 pkgconfig.generate(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 libnethogs,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 requires: [&#39;libpcap&#39;],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 version: meson.project_version(),<br>
++=C2=A0 =C2=A0 )<br>
+ endif<br>
+diff --git a/src/meson.build b/src/meson.build<br>
+index 03f1b58..1329df4 100644<br>
+--- a/src/meson.build<br>
++++ b/src/meson.build<br>
+@@ -3,65 +3,56 @@<br>
+ #<br>
+<br>
+ sources =3D [<br>
+-=C2=A0 files([<br>
+-=C2=A0 =C2=A0 &#39;connection.cpp&#39;,<br>
+-=C2=A0 =C2=A0 &#39;conninode.cpp&#39;,<br>
+-=C2=A0 =C2=A0 &#39;decpcap.c&#39;,<br>
+-=C2=A0 =C2=A0 &#39;devices.cpp&#39;,<br>
+-=C2=A0 =C2=A0 &#39;inode2prog.cpp&#39;,<br>
+-=C2=A0 =C2=A0 &#39;packet.cpp&#39;,<br>
+-=C2=A0 =C2=A0 &#39;process.cpp&#39;,<br>
+-=C2=A0 ])<br>
++=C2=A0 =C2=A0 files(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;connection.cpp&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;conninode.cpp&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;decpcap.c&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;devices.cpp&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;inode2prog.cpp&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;packet.cpp&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;process.cpp&#39;,<br>
++=C2=A0 =C2=A0 ),<br>
+ ]<br>
+<br>
+ # --- Executable Compilation ---<br>
+<br>
+ if get_option(&#39;enable-nethogs-app&#39;).enabled()<br>
+-=C2=A0 app_sources =3D [<br>
+-=C2=A0 =C2=A0 files([<br>
+-=C2=A0 =C2=A0 =C2=A0 &#39;main.cpp&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 &#39;cui.cpp&#39;,<br>
+-=C2=A0 =C2=A0 ])<br>
+-=C2=A0 ]<br>
+-<br>
+-=C2=A0 cursespp_dep =3D dependency(&#39;ncurses++&#39;, required: true)<b=
r>
+-=C2=A0 curses_dep =3D dependency(&#39;ncurses&#39;, required: true)<br>
+-<br>
+-=C2=A0 executable(&#39;nethogs&#39;,<br>
+-=C2=A0 =C2=A0 [app_sources + sources],<br>
+-=C2=A0 =C2=A0 include_directories: [projectinc],<br>
+-=C2=A0 =C2=A0 cpp_args: c_args,<br>
+-=C2=A0 =C2=A0 c_args: c_args,<br>
+-=C2=A0 =C2=A0 install: true,<br>
+-=C2=A0 =C2=A0 dependencies : [project_deps, cursespp_dep, curses_dep]<br>
+-=C2=A0 )<br>
++=C2=A0 =C2=A0 app_sources =3D [files(&#39;cui.cpp&#39;, &#39;main.cpp&#39=
;)]<br>
++<br>
++=C2=A0 =C2=A0 cursespp_dep =3D dependency(&#39;ncurses++&#39;, required: =
true)<br>
++=C2=A0 =C2=A0 curses_dep =3D dependency(&#39;ncurses&#39;, required: true=
)<br>
++<br>
++=C2=A0 =C2=A0 executable(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;nethogs&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 [app_sources + sources],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 include_directories: [projectinc],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpp_args: c_args,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 c_args: c_args,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 install: true,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [project_deps, cursespp_dep, cu=
rses_dep],<br>
++=C2=A0 =C2=A0 )<br>
+ endif<br>
+<br>
+ # --- Library Compilation ---<br>
+<br>
+ if get_option(&#39;enable-libnethogs&#39;).enabled()<br>
+-=C2=A0 lib_sources =3D [<br>
+-=C2=A0 =C2=A0 files([<br>
+-=C2=A0 =C2=A0 =C2=A0 &#39;libnethogs.cpp&#39;,<br>
+-=C2=A0 =C2=A0 ])<br>
+-=C2=A0 ]<br>
++=C2=A0 =C2=A0 lib_sources =3D [files(&#39;libnethogs.cpp&#39;)]<br>
++<br>
++=C2=A0 =C2=A0 libnethogs =3D shared_library(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;libnethogs&#39; ,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sources + lib_sources,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpp_args: c_args,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 c_args: c_args,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 install: true,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 soversion: meson.project_version(),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 include_directories: [projectinc],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [project_deps],<br>
++=C2=A0 =C2=A0 )<br>
+<br>
+-=C2=A0 libnethogs =3D shared_library(&#39;libnethogs&#39; ,<br>
+-=C2=A0 =C2=A0 sources + lib_sources,<br>
+-=C2=A0 =C2=A0 cpp_args: c_args,<br>
+-=C2=A0 =C2=A0 c_args: c_args,<br>
+-=C2=A0 =C2=A0 install: true,<br>
+-=C2=A0 =C2=A0 soversion: meson.project_version(),<br>
+-=C2=A0 =C2=A0 include_directories: [projectinc],<br>
+-=C2=A0 =C2=A0 dependencies: [project_deps]<br>
+-=C2=A0 )<br>
+-<br>
+-=C2=A0 libnethogs_dep =3D declare_dependency(link_with: libnethogs)<br>
++=C2=A0 =C2=A0 libnethogs_dep =3D declare_dependency(link_with: libnethogs=
)<br>
+<br>
+-=C2=A0 # --- Header Installation ---<br>
++=C2=A0 =C2=A0 # --- Header Installation ---<br>
+<br>
+-=C2=A0 lib_headers =3D [<br>
+-=C2=A0 =C2=A0 files(&#39;libnethogs.h&#39;),<br>
+-=C2=A0 ]<br>
+-=C2=A0 install_headers(lib_headers, subdir : &#39;libnethogs&#39;)<br>
++=C2=A0 =C2=A0 lib_headers =3D [files(&#39;libnethogs.h&#39;)]<br>
++=C2=A0 =C2=A0 install_headers(lib_headers, subdir: &#39;libnethogs&#39;)<=
br>
+ endif<br>
+--<br>
+2.25.1<br>
diff --git a/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-libr=
ary-name.patch b/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-=
library-name.patch<br>
new file mode 100644<br>
index 0000000000..cc69a66748<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-library-nam=
e.patch<br>
@@ -0,0 +1,25 @@<br>
+From ba25a64dcd35f4a58c4d397160e90560e9851c79 Mon Sep 17 00:00:00 2001<br>
+From: CAB233 &lt;<a href=3D"mailto:yidaduizuoye@outlook.com" target=3D"_bl=
ank">yidaduizuoye@outlook.com</a>&gt;<br>
+Date: Mon, 24 Feb 2025 20:06:52 +0800<br>
+Subject: [PATCH 4/6] meson: fix library name<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/raboof/nethogs/co=
mmit/ba25a64dcd35f4a58c4d397160e90560e9851c79" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/raboof/nethogs/commit/ba25a64dcd35f4a58c4d39716=
0e90560e9851c79</a>]<br>
+---<br>
+ src/meson.build | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/meson.build b/src/meson.build<br>
+index 1329df4..7f6dcba 100644<br>
+--- a/src/meson.build<br>
++++ b/src/meson.build<br>
+@@ -39,7 +39,7 @@ if get_option(&#39;enable-libnethogs&#39;).enabled()<br>
+=C2=A0 =C2=A0 =C2=A0lib_sources =3D [files(&#39;libnethogs.cpp&#39;)]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0libnethogs =3D shared_library(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;libnethogs&#39; ,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;nethogs&#39; ,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sources + lib_sources,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpp_args: c_args,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_args: c_args,<br>
+--<br>
+2.25.1<br>
diff --git a/meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-f=
lags-to-LDFLAGS-for-Linux.patch b/meta-oe/recipes-connectivity/nethogs/file=
s/0005-Add-security-flags-to-LDFLAGS-for-Linux.patch<br>
new file mode 100644<br>
index 0000000000..553b382a66<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-flags-to=
-LDFLAGS-for-Linux.patch<br>
@@ -0,0 +1,25 @@<br>
+From 42e7950db8e412160e3f1f74b6cbc7298714c587 Mon Sep 17 00:00:00 2001<br>
+From: Matheus Polkorny &lt;<a href=3D"mailto:mpolkorny@ipt.br" target=3D"_=
blank">mpolkorny@ipt.br</a>&gt;<br>
+Date: Tue, 25 Mar 2025 00:47:04 -0300<br>
+Subject: [PATCH 5/6] Add security flags to LDFLAGS for Linux<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/raboof/nethogs/co=
mmit/42e7950db8e412160e3f1f74b6cbc7298714c587" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/raboof/nethogs/commit/42e7950db8e412160e3f1f74b=
6cbc7298714c587</a>]<br>
+---<br>
+ src/MakeLib.mk | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/MakeLib.mk b/src/MakeLib.mk<br>
+index 96ba694..1be0361 100644<br>
+--- a/src/MakeLib.mk<br>
++++ b/src/MakeLib.mk<br>
+@@ -10,7 +10,7 @@ all: $(LIBNAME) libnethogs.a<br>
+<br>
+ UNAME_S :=3D $(shell uname -s)<br>
+ ifeq ($(UNAME_S),Linux)<br>
+-=C2=A0 LDFLAGS:=3D -shared -Wl,-soname,$(SO_NAME)<br>
++=C2=A0 LDFLAGS:=3D -shared -Wl,-soname,$(SO_NAME) -Wl,-z,now -Wl,-z,relro=
<br>
+ else ifeq ($(UNAME_S),FreeBSD)<br>
+=C2=A0 =C2=A0LDFLAGS:=3D -shared -Wl,-soname,$(SO_NAME)<br>
+ else<br>
+--<br>
+2.25.1<br>
diff --git a/meta-oe/recipes-connectivity/nethogs/files/0006-Include-CPPFLA=
GS-for-devices.cpp-and-libnethogs.cpp.patch b/meta-oe/recipes-connectivity/=
nethogs/files/0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patc=
h<br>
new file mode 100644<br>
index 0000000000..485d476c50<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-=
devices.cpp-and-libnethogs.cpp.patch<br>
@@ -0,0 +1,30 @@<br>
+From 1407f83485c31cd6f29614402bb2a3e912a3dd34 Mon Sep 17 00:00:00 2001<br>
+From: Matheus Polkorny &lt;<a href=3D"mailto:mpolkorny@ipt.br" target=3D"_=
blank">mpolkorny@ipt.br</a>&gt;<br>
+Date: Tue, 25 Mar 2025 00:48:20 -0300<br>
+Subject: [PATCH 6/6] Include $(CPPFLAGS) for devices.cpp and libnethogs.cp=
p<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/raboof/nethogs/co=
mmit/1407f83485c31cd6f29614402bb2a3e912a3dd34" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/raboof/nethogs/commit/1407f83485c31cd6f29614402=
bb2a3e912a3dd34</a>]<br>
+---<br>
+ src/MakeLib.mk | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/MakeLib.mk b/src/MakeLib.mk<br>
+index 1be0361..513096e 100644<br>
+--- a/src/MakeLib.mk<br>
++++ b/src/MakeLib.mk<br>
+@@ -97,11 +97,11 @@ $(ODIR)/conninode.o: conninode.cpp nethogs.h conninode=
.h<br>
+<br>
+ $(ODIR)/devices.o: devices.cpp devices.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@mkdir -p $(ODIR)<br>
+-=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CXXFLAGS) -o $@ -c devices.cpp<br>
++=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c devices.cpp<=
br>
+<br>
+ $(ODIR)/libnethogs.o: libnethogs.cpp libnethogs.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@mkdir -p $(ODIR)<br>
+-=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CXXFLAGS) -o $@ -c libnethogs.cpp -DVERSION=
=3D\&quot;$(LIBVERSION)\&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c libnethogs.c=
pp -DVERSION=3D\&quot;$(LIBVERSION)\&quot;<br>
+<br>
+ .PHONY: clean<br>
+ clean:<br>
+--<br>
+2.25.1<br>
diff --git a/meta-oe/recipes-connectivity/nethogs/<a href=3D"http://nethogs=
_git.bb" rel=3D"noreferrer" target=3D"_blank">nethogs_git.bb</a> b/meta-oe/=
recipes-connectivity/nethogs/<a href=3D"http://nethogs_git.bb" rel=3D"noref=
errer" target=3D"_blank">nethogs_git.bb</a><br>
new file mode 100644<br>
index 0000000000..816cd9c542<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/nethogs/<a href=3D"http://nethogs_git.bb=
" rel=3D"noreferrer" target=3D"_blank">nethogs_git.bb</a><br>
@@ -0,0 +1,21 @@<br>
+SUMMARY =3D &quot;NetHogs is a small &#39;net top&#39; tool that can group=
 bandwidth by process&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/raboof/nethogs" rel=3D"no=
referrer" target=3D"_blank">https://github.com/raboof/nethogs</a>&quot;<br>
+SECTION =3D &quot;console/network&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/raboof/nethogs.git;br=
anch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.c=
om/raboof/nethogs.git;branch=3Dmain;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson-cleanup-version=
-detection.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-meson-fix-build-with-=
libnethogs-disabled.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-meson-run-meson-forma=
t.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-meson-fix-library-nam=
e.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Add-security-flags-to=
-LDFLAGS-for-Linux.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-Include-CPPFLAGS-for-=
devices.cpp-and-libnethogs.cpp.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+DEPENDS =3D &quot;ncurses libpcap&quot;<br>
+<br>
+inherit meson pkgconfig<br>
+<br>
+SRCREV =3D &quot;632a78846eb3cc3259dc45c59a47fa9c293a2831&quot;<br>
+PV =3D &quot;0.8.8+git&quot;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000007535ed0643693cc6--

