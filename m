Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3C4CCFA13
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 17:07:59 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9726.1762621676725535101
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Nov 2025 09:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AL3TKKMq;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-63f96d5038dso1650392d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 09:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762621676; x=1763226476; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h2xJGQ1XBzoc1OKFuXlIQh83lXQJ4mDfxxTi5KK7t8g=;
        b=AL3TKKMqLJ9U9S2yx7dnr2iFapJi0B2Cyj4ARRzhHKvaWo6Fr1Tv0rRFE8nK1T95a9
         2PdVc3snNLrqTJ2/yed/hyHK0CroK3/eqeIA+LgiStxpOFudXyPwwyfG1C/NLKI3IxY2
         /kkV1C8X+JmQuM7jofbsVqBRWinr2euIqUXFuNPabOIZERyYn+4jne4tcsmjXrQ9rrDI
         Ew1Q7w9DjJzU5/+7uKGtUC7NMI3yKiwWhOQWSPYoDLdpv+wTA+S4QpAgHe1IrvjkGsye
         7WwnduDGko/QvGnUWvh7+Jy5eqCXX8ZZIn7FYJ6BTEHcVvmxXNlg4MV1Gq3qW5Utlgzm
         aLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762621676; x=1763226476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2xJGQ1XBzoc1OKFuXlIQh83lXQJ4mDfxxTi5KK7t8g=;
        b=sjYYMirljNyh4Bi87aO0m4YemnkdNFpRzIsTrz6pqYSb7z4XiuDwIW2vAIyU1Cm+rd
         4od4vxa25f+lYpyeuiCSqaScZosykQN5yEyhwu4ky8MEQ6EuJQPlK3UFkW8cwEuZt30F
         hrV+j/KPQd+wEsDapiQCNuzEwBuVrYYx9rXpj0hCvxHeM/7AORSsw9UZD98ZfsIMoRny
         hvJIBZA/49kj4QuKHF71kpwVhXlN4lvq5BSxgA3DkQebOC+Ca1PJt4Nq0jhCsi4whxAa
         kFaV9f0ruwkWAPZyb29z3AZ85Ar7Gfzydq+NzK+z9/boN4mo1z4D3e0i4eFq8GyCm8pH
         Le3g==
X-Gm-Message-State: AOJu0YzqVwTAuNI8lHsZN9ub+mTbeqjorw5keo1YKfdivl38k6Ok0/vb
	/j26Hj/+DN44sRF1T1WjBCDMDhw00IBUE4hCr4TG/AzDL92/NkDrBVlaKRgoYwr5V+n3yS6/keN
	qH2sSykzkkyzIgvHIaYZZxsMjb4H/G6M=
X-Gm-Gg: ASbGncspNWdhSdZu3ycUHV1I5JURaK0Inq5Q9VKOdtFZfPjZV7TcT943hkXN+wBJ24u
	D4fBqb4Ny6IEsFSF017LxeG0VZjA668OntWKSB6VBY8lhPQFGeTV1HOAvd+EBb1FuP99wpDU+LG
	UGoiRiFh4jMBYgvAbJEbe1hwjiYJKYdWVnVN9LELuV900ef1VvczY2unYZgMN7J5SNqsUqKzBLC
	Azo/4FRtSweEYjX1f3DRa5lHzMRDzkXxuMHpgrDdL3ZNsMGDwClSMFXq46GnbCwjImm9ChXgf2C
	/gY/0mjVSwfFkKUgg+LJIK+I9HLfxsxP4Y6UbI6F9DlQvn8NwHvcxvDQ37A7djIblT4SEm8mGDK
	C1EI=
X-Google-Smtp-Source: AGHT+IEgagyNaSPZ2I6sM+tKN3hSrF81zf0HRfrNtg5Aag/7xwkOVzv050i04vuaiLy3HPt8zGULVo9z4EGdbeOwU9A=
X-Received: by 2002:a05:690e:23d3:b0:63e:1df9:c895 with SMTP id
 956f58d0204a3-640d4600008mr2088776d50.66.1762621675651; Sat, 08 Nov 2025
 09:07:55 -0800 (PST)
MIME-Version: 1.0
References: <tencent_299EFFAA32A8918332261FD2A599A3FC0A09@qq.com>
In-Reply-To: <tencent_299EFFAA32A8918332261FD2A599A3FC0A09@qq.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Nov 2025 09:07:29 -0800
X-Gm-Features: AWmQ_bl2NCQqUjCS9edJGyv2IvvCZDwpDo6ozpUJAcyaZ1xHEU_CnpXhASngv_U
Message-ID: <CAMKF1srzy2bm6VTL7n-jat4pdeP-2wiKhb5YzitQ02+57iTFtQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] nethogs: add recipe
To: wenyang.linux@foxmail.com
Cc: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: multipart/alternative; boundary="000000000000d9c54106431856a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 17:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226083

--000000000000d9c54106431856a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seeing this error

https://errors.yoctoproject.org/Errors/Details/887661/

On Fri, Nov 7, 2025 at 10:40=E2=80=AFPM <wenyang.linux@foxmail.com> wrote:

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

--000000000000d9c54106431856a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Seeing this error=C2=A0<div><br></div><div><a href=3D"http=
s://errors.yoctoproject.org/Errors/Details/887661/">https://errors.yoctopro=
ject.org/Errors/Details/887661/</a></div></div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov =
7, 2025 at 10:40=E2=80=AFPM &lt;<a href=3D"mailto:wenyang.linux@foxmail.com=
">wenyang.linux@foxmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">From: Wen Yang &lt;<a href=3D"mailto:wenyang.lin=
ux@foxmail.com" target=3D"_blank">wenyang.linux@foxmail.com</a>&gt;<br>
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

--000000000000d9c54106431856a3--

