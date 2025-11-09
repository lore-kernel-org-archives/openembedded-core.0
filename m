Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3A5CCFA1A
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:09:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27450.1762704551163846707
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XsKDnIfh;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297f35be2ffso10284085ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 08:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704550; x=1763309350; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=41UzUYlMWyxwr8cKfA9oIEfxLfgrUrUWE7s9h8CXl0I=;
        b=XsKDnIfhH7YyzOgPc2A2QrrEeWY9k4hxIFmuIU7eUAoVBH9kDeN8900Oie8YwL6ieD
         r6ZUj356dJEB9ozj/MmycNUOR1H9o27eLRQiudn8GlI5j81ln/Wb7iBKAcI1ARvDkoYF
         TEqygdKeWTu/2+ag4z1JoWeSuC5Ek3Yvke0AbAchZ5xdQ2rg4O9CRW4iNGEcwbaiyIoc
         PUVvpLNkegC4gHJecTAWZMa4yy5TYZgknuGmaHLv2HYdoRXMVaYHHG5MZt0iT5QQrSvo
         yz02MCYM9plokHEH5U+OwH3KMc3x/TCcr5IWxfGWajHsPRyEc+54FUt54x5X0mNRcHuR
         CtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704550; x=1763309350;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41UzUYlMWyxwr8cKfA9oIEfxLfgrUrUWE7s9h8CXl0I=;
        b=cshgo4lEErtbz+M6P5b5PePfQNunguXHsH9H3Q+o38Xk1Pjq34x9a1jbmN25NGwa8A
         /tQSFLRpa4qlixCfoJTC6qNNjByYNEUgggaB8277YRB6NEqL/LFfycs0hG6mfwLU4Axm
         ZLi+udpZfBcDO34qOaMJ6Ihelw3KM1PEYKZWsw0bRnAI+Qo8db1wkM+iFBWudvuBwl6Z
         4DhZlGuQeoagUOtwwSRMs6SbrWptF8bRK9bRt5NwbK/MuN/8QYajGG8yHsPQgVR7FWSW
         atT9WTNCmEjlManJy4exgM4Q5drio27i1gbnyFcfiaxCPeuU/zFO+GL+sSz77e7l50do
         C6Gw==
X-Gm-Message-State: AOJu0YxpOE6RD79Xm7yW9tB05GNmDJsYqjQEIAVYXTBhqKXQB3nMQzD3
	rWKLfGbEBKS68mjx8Lo8LmdpjDL4c1yVQzgh23koRDTbabl0O2FlDqnR
X-Gm-Gg: ASbGncuVuxssZE0jSRIuea6qTOr+zcO9PuWnZxEInChN1o4LQfxXmOVPHHDMJINwrly
	wqDEcGtYK8NMknAcIHZogQXQuMXJJHx+qskbafqABuJr/3smk8ADPol5bq9ebvQOLLAp9uetFb1
	K/u6/OnliQUnCK0N+ur7ADC6zstkIPNdg7/96xOZR1LJaPNGdWGozvt6qCOIOJASgzChY+HUtDT
	1zu/oQTS1+KoVfvoLmmZB2lmFU2mT2JNE+Lh4C8qoOhiuideMpuGb2ogWMUGBAjq1buUUIbd6+z
	I5NMl2PQD6G9oAbVu88frfgCC0DSFXJFkyuKkpurwbt5cHgDxI5P0Zc4fgr2ztX26B2eFahLZKp
	SiSxWsHdfKYn05y2Px7bmq7qYW+FrIXdJvM373Qf3FidfmRb1cENwYXve+OYpYRUo+g9Qj5e4u9
	HkYbjw9sf3a3tTpjUe5i7cfTmAB21SzQ78czIbr0WqAAMn3LuMoLAuMF5ZqNMlHkUaTQO1fxE=
X-Google-Smtp-Source: AGHT+IGykfXn6vlSliH+VHp8GkgruDH4DGL/WbiqdIc8paHSPK8SVUr+e7/sz81f5VZ+K9/zDuuTjg==
X-Received: by 2002:a17:902:bb8c:b0:295:94fe:d5dc with SMTP id d9443c01a7336-297e540d84emr59146075ad.2.1762704550211;
        Sun, 09 Nov 2025 08:09:10 -0800 (PST)
Received: from ?IPV6:2601:646:8201:fd20::a95f? ([2601:646:8201:fd20::a95f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc1765bdsm8806718b3a.36.2025.11.09.08.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 08:09:09 -0800 (PST)
Message-ID: <8c92344c-a5c8-427c-96ea-4743bc7fae4d@gmail.com>
Date: Sun, 9 Nov 2025 08:09:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v3] nethogs: add recipe
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "wenyang.linux@foxmail.com" <wenyang.linux@foxmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <tencent_299EFFAA32A8918332261FD2A599A3FC0A09@qq.com>
 <CAMKF1srzy2bm6VTL7n-jat4pdeP-2wiKhb5YzitQ02+57iTFtQ@mail.gmail.com>
 <AS8PR02MB102010B3EA18EBF85BC0C1382EFC0A@AS8PR02MB10201.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <AS8PR02MB102010B3EA18EBF85BC0C1382EFC0A@AS8PR02MB10201.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 16:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226096

v3 ends up with

ERROR: nethogs-0.8.8+git-r0 do_patch: Applying patch 
'0003-meson-run-meson-format.patch' on target directory 
'/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/nethogs/0.8.8+git/sources/nethogs-0.8.8+git'
CmdError('quilt --quiltrc 
/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/nethogs/0.8.8+git/recipe-sysroot-native/etc/quiltrc 
push', 0, 'stdout: Applying patch 0003-meson-run-meson-format.patch
patching file meson.build
patching file src/meson.build
Hunk #1 FAILED at 3.
1 out of 1 hunk FAILED -- rejects in file src/meson.build
Patch 0003-meson-run-meson-format.patch does not apply (enforce with -f)

stderr: ')

On 11/8/25 10:23 AM, Peter Kjellerstedt wrote:
> For what it’s worth, libnethogs.so is a symbolic link when I build (for 
> aarch64), both with v2 and v3 of the patch.
> 
> //Peter
> 
> *From:*openembedded-devel@lists.openembedded.org <openembedded- 
> devel@lists.openembedded.org> *On Behalf Of *Khem Raj via 
> lists.openembedded.org
> *Sent:* den 8 november 2025 18:07
> *To:* wenyang.linux@foxmail.com
> *Cc:* openembedded-core@lists.openembedded.org; openembedded- 
> devel@lists.openembedded.org; Peter Kjellerstedt 
> <peter.kjellerstedt@axis.com>
> *Subject:* Re: [oe] [meta-oe][PATCH v3] nethogs: add recipe
> 
> Seeing this error
> 
> https://errors.yoctoproject.org/Errors/Details/887661/ <https:// 
> errors.yoctoproject.org/Errors/Details/887661/>
> 
> On Fri, Nov 7, 2025 at 10:40 PM <wenyang.linux@foxmail.com 
> <mailto:wenyang.linux@foxmail.com>> wrote:
> 
>     From: Wen Yang <wenyang.linux@foxmail.com
>     <mailto:wenyang.linux@foxmail.com>>
> 
>     NetHogs is a small 'net top' tool. Instead of breaking the traffic
>     down per protocol or per subnet, like most tools do, it groups
>     bandwidth by process.
> 
>     Signed-off-by: Wen Yang <wenyang.linux@foxmail.com
>     <mailto:wenyang.linux@foxmail.com>>
>     ---
>       ...0001-meson-cleanup-version-detection.patch |  49 +++++
>       ...n-fix-build-with-libnethogs-disabled.patch |  38 ++++
>       .../files/0003-meson-run-meson-format.patch   | 183 ++++++++++++++++++
>       .../files/0004-meson-fix-library-name.patch   |  25 +++
>       ...-security-flags-to-LDFLAGS-for-Linux.patch |  25 +++
>       ...S-for-devices.cpp-and-libnethogs.cpp.patch |  30 +++
>       .../nethogs/nethogs_git.bb <http://nethogs_git.bb>               
>          |  21 ++
>       7 files changed, 371 insertions(+)
>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>     files/0001-meson-cleanup-version-detection.patch
>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>     files/0002-meson-fix-build-with-libnethogs-disabled.patch
>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>     files/0003-meson-run-meson-format.patch
>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>     files/0004-meson-fix-library-name.patch
>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>     files/0005-Add-security-flags-to-LDFLAGS-for-Linux.patch
>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>     files/0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch
>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>     nethogs_git.bb <http://nethogs_git.bb>
> 
>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0001-meson-
>     cleanup-version-detection.patch b/meta-oe/recipes-connectivity/
>     nethogs/files/0001-meson-cleanup-version-detection.patch
>     new file mode 100644
>     index 0000000000..797c79225d
>     --- /dev/null
>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-
>     version-detection.patch
>     @@ -0,0 +1,49 @@
>     +From 049fff5623720fcd0b4fdc92501b586addbb6b48 Mon Sep 17 00:00:00 2001
>     +From: Sam James <sam@gentoo.org <mailto:sam@gentoo.org>>
>     +Date: Sat, 25 Jan 2025 16:03:12 +0000
>     +Subject: [PATCH 1/6] meson: cleanup version detection
>     +
>     +Tell Meson what version the project is, so that we set the right
>     versioning
>     +on libnethogs.
>     +
>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
>     commit/049fff5623720fcd0b4fdc92501b586addbb6b48 <https://github.com/
>     raboof/nethogs/commit/049fff5623720fcd0b4fdc92501b586addbb6b48>]
>     +---
>     + meson.build | 8 ++++----
>     + 1 file changed, 4 insertions(+), 4 deletions(-)
>     +
>     +diff --git a/meson.build b/meson.build
>     +index 81d7b59..16e61b4 100644
>     +--- a/meson.build
>     ++++ b/meson.build
>     +@@ -5,11 +5,11 @@
>     + project('nethogs',
>     +         ['c', 'cpp'],
>     +         default_options : ['warning_level=3',
>     +-                           'cpp_std=c++14']
>     ++                           'cpp_std=c++14'],
>     ++        version : run_command('./
>     determineVersion.sh').stdout().strip(),
>     +         )
>     +
>     + cc = meson.get_compiler('cpp')
>     +-version = run_command('./determineVersion.sh', check:
>     true).stdout().strip()
>     +
>     + #######################################
>     + ## Dependencies and flags definition ##
>     +@@ -19,7 +19,7 @@ projectinc = [include_directories('.', 'src')]
>     +
>     + # flags
>     + c_args = [
>     +-  '-DVERSION="' + version + '"'
>     ++  '-DVERSION="' + meson.project_version() + '"'
>     + ]
>     +
>     + # dependencies
>     +@@ -42,5 +42,5 @@ pkgconfig = import('pkgconfig')
>     + pkgconfig_install_dir = join_paths(get_option('libdir'), 'pkgconfig')
>     + pkgconfig.generate(libnethogs,
>     +                    requires: ['libpcap'],
>     +-                   version: version
>     ++                   version: meson.project_version()
>     +                    )
>     +--
>     +2.25.1
>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0002-meson-
>     fix-build-with-libnethogs-disabled.patch b/meta-oe/recipes-
>     connectivity/nethogs/files/0002-meson-fix-build-with-libnethogs-
>     disabled.patch
>     new file mode 100644
>     index 0000000000..c9a7cf69d6
>     --- /dev/null
>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-
>     build-with-libnethogs-disabled.patch
>     @@ -0,0 +1,38 @@
>     +From 5afce747f142f6df6a264ab368c99f47050d9984 Mon Sep 17 00:00:00 2001
>     +From: Sam James <sam@gentoo.org <mailto:sam@gentoo.org>>
>     +Date: Sat, 25 Jan 2025 16:05:20 +0000
>     +Subject: [PATCH 2/6] meson: fix build with libnethogs disabled
>     +
>     +Fix `meson.build:43:19: ERROR: Unknown variable "libnethogs".`.
>     +
>     +While src/ has this correct, the top-level meson.build wasn't right.
>     +
>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
>     commit/5afce747f142f6df6a264ab368c99f47050d9984 <https://github.com/
>     raboof/nethogs/commit/5afce747f142f6df6a264ab368c99f47050d9984>]
>     +---
>     + meson.build | 14 ++++++++------
>     + 1 file changed, 8 insertions(+), 6 deletions(-)
>     +
>     +diff --git a/meson.build b/meson.build
>     +index 16e61b4..8537718 100644
>     +--- a/meson.build
>     ++++ b/meson.build
>     +@@ -38,9 +38,11 @@ subdir('src')
>     + #############################
>     + ## Pkgconfig definition    ##
>     + #############################
>     +-pkgconfig = import('pkgconfig')
>     +-pkgconfig_install_dir = join_paths(get_option('libdir'), 'pkgconfig')
>     +-pkgconfig.generate(libnethogs,
>     +-                   requires: ['libpcap'],
>     +-                   version: meson.project_version()
>     +-                   )
>     ++if get_option('enable-libnethogs').enabled()
>     ++  pkgconfig = import('pkgconfig')
>     ++  pkgconfig_install_dir = join_paths(get_option('libdir'),
>     'pkgconfig')
>     ++  pkgconfig.generate(libnethogs,
>     ++                     requires: ['libpcap'],
>     ++                     version: meson.project_version()
>     ++                     )
>     ++endif
>     +--
>     +2.25.1
>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0003-meson-
>     run-meson-format.patch b/meta-oe/recipes-connectivity/nethogs/
>     files/0003-meson-run-meson-format.patch
>     new file mode 100644
>     index 0000000000..9c92a9d835
>     --- /dev/null
>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-
>     meson-format.patch
>     @@ -0,0 +1,183 @@
>     +From fcbde46b0082b4c571392ea9b6427f5e11941393 Mon Sep 17 00:00:00 2001
>     +From: Sam James <sam@gentoo.org <mailto:sam@gentoo.org>>
>     +Date: Sat, 25 Jan 2025 16:06:12 +0000
>     +Subject: [PATCH 3/6] meson: run `meson format`
>     +
>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
>     commit/fcbde46b0082b4c571392ea9b6427f5e11941393 <https://github.com/
>     raboof/nethogs/commit/fcbde46b0082b4c571392ea9b6427f5e11941393>]
>     +---
>     + meson.build     | 34 +++++++++----------
>     + src/meson.build | 87 ++++++++++++++++++++++---------------------------
>     + 2 files changed, 54 insertions(+), 67 deletions(-)
>     +
>     +diff --git a/meson.build b/meson.build
>     +index 8537718..eb9f16e 100644
>     +--- a/meson.build
>     ++++ b/meson.build
>     +@@ -2,12 +2,12 @@
>     + # See COPYING for more information about licensing
>     + #
>     +
>     +-project('nethogs',
>     +-        ['c', 'cpp'],
>     +-        default_options : ['warning_level=3',
>     +-                           'cpp_std=c++14'],
>     +-        version : run_command('./
>     determineVersion.sh').stdout().strip(),
>     +-        )
>     ++project(
>     ++    'nethogs',
>     ++    ['c', 'cpp'],
>     ++    default_options: ['warning_level=3', 'cpp_std=c++14'],
>     ++    version: run_command('./determineVersion.sh').stdout().strip(),
>     ++)
>     +
>     + cc = meson.get_compiler('cpp')
>     +
>     +@@ -18,17 +18,12 @@ cc = meson.get_compiler('cpp')
>     + projectinc = [include_directories('.', 'src')]
>     +
>     + # flags
>     +-c_args = [
>     +-  '-DVERSION="' + meson.project_version() + '"'
>     +-]
>     ++c_args = ['-DVERSION="' + meson.project_version() + '"']
>     +
>     + # dependencies
>     + thread_dep = dependency('threads', required: true)
>     + libpcap_dep = dependency('libpcap', required: true)
>     +-project_deps = [
>     +-  thread_dep,
>     +-  libpcap_dep
>     +-]
>     ++project_deps = [thread_dep, libpcap_dep]
>     +
>     + #############################
>     + ## Code Compilation        ##
>     +@@ -39,10 +34,11 @@ subdir('src')
>     + ## Pkgconfig definition    ##
>     + #############################
>     + if get_option('enable-libnethogs').enabled()
>     +-  pkgconfig = import('pkgconfig')
>     +-  pkgconfig_install_dir = join_paths(get_option('libdir'),
>     'pkgconfig')
>     +-  pkgconfig.generate(libnethogs,
>     +-                     requires: ['libpcap'],
>     +-                     version: meson.project_version()
>     +-                     )
>     ++    pkgconfig = import('pkgconfig')
>     ++    pkgconfig_install_dir = join_paths(get_option('libdir'),
>     'pkgconfig')
>     ++    pkgconfig.generate(
>     ++        libnethogs,
>     ++        requires: ['libpcap'],
>     ++        version: meson.project_version(),
>     ++    )
>     + endif
>     +diff --git a/src/meson.build b/src/meson.build
>     +index 03f1b58..1329df4 100644
>     +--- a/src/meson.build
>     ++++ b/src/meson.build
>     +@@ -3,65 +3,56 @@
>     + #
>     +
>     + sources = [
>     +-  files([
>     +-    'connection.cpp',
>     +-    'conninode.cpp',
>     +-    'decpcap.c',
>     +-    'devices.cpp',
>     +-    'inode2prog.cpp',
>     +-    'packet.cpp',
>     +-    'process.cpp',
>     +-  ])
>     ++    files(
>     ++        'connection.cpp',
>     ++        'conninode.cpp',
>     ++        'decpcap.c',
>     ++        'devices.cpp',
>     ++        'inode2prog.cpp',
>     ++        'packet.cpp',
>     ++        'process.cpp',
>     ++    ),
>     + ]
>     +
>     + # --- Executable Compilation ---
>     +
>     + if get_option('enable-nethogs-app').enabled()
>     +-  app_sources = [
>     +-    files([
>     +-      'main.cpp',
>     +-      'cui.cpp',
>     +-    ])
>     +-  ]
>     +-
>     +-  cursespp_dep = dependency('ncurses++', required: true)
>     +-  curses_dep = dependency('ncurses', required: true)
>     +-
>     +-  executable('nethogs',
>     +-    [app_sources + sources],
>     +-    include_directories: [projectinc],
>     +-    cpp_args: c_args,
>     +-    c_args: c_args,
>     +-    install: true,
>     +-    dependencies : [project_deps, cursespp_dep, curses_dep]
>     +-  )
>     ++    app_sources = [files('cui.cpp', 'main.cpp')]
>     ++
>     ++    cursespp_dep = dependency('ncurses++', required: true)
>     ++    curses_dep = dependency('ncurses', required: true)
>     ++
>     ++    executable(
>     ++        'nethogs',
>     ++        [app_sources + sources],
>     ++        include_directories: [projectinc],
>     ++        cpp_args: c_args,
>     ++        c_args: c_args,
>     ++        install: true,
>     ++        dependencies: [project_deps, cursespp_dep, curses_dep],
>     ++    )
>     + endif
>     +
>     + # --- Library Compilation ---
>     +
>     + if get_option('enable-libnethogs').enabled()
>     +-  lib_sources = [
>     +-    files([
>     +-      'libnethogs.cpp',
>     +-    ])
>     +-  ]
>     ++    lib_sources = [files('libnethogs.cpp')]
>     ++
>     ++    libnethogs = shared_library(
>     ++        'libnethogs' ,
>     ++        sources + lib_sources,
>     ++        cpp_args: c_args,
>     ++        c_args: c_args,
>     ++        install: true,
>     ++        soversion: meson.project_version(),
>     ++        include_directories: [projectinc],
>     ++        dependencies: [project_deps],
>     ++    )
>     +
>     +-  libnethogs = shared_library('libnethogs' ,
>     +-    sources + lib_sources,
>     +-    cpp_args: c_args,
>     +-    c_args: c_args,
>     +-    install: true,
>     +-    soversion: meson.project_version(),
>     +-    include_directories: [projectinc],
>     +-    dependencies: [project_deps]
>     +-  )
>     +-
>     +-  libnethogs_dep = declare_dependency(link_with: libnethogs)
>     ++    libnethogs_dep = declare_dependency(link_with: libnethogs)
>     +
>     +-  # --- Header Installation ---
>     ++    # --- Header Installation ---
>     +
>     +-  lib_headers = [
>     +-    files('libnethogs.h'),
>     +-  ]
>     +-  install_headers(lib_headers, subdir : 'libnethogs')
>     ++    lib_headers = [files('libnethogs.h')]
>     ++    install_headers(lib_headers, subdir: 'libnethogs')
>     + endif
>     +--
>     +2.25.1
>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0004-meson-
>     fix-library-name.patch b/meta-oe/recipes-connectivity/nethogs/
>     files/0004-meson-fix-library-name.patch
>     new file mode 100644
>     index 0000000000..cc69a66748
>     --- /dev/null
>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-
>     library-name.patch
>     @@ -0,0 +1,25 @@
>     +From ba25a64dcd35f4a58c4d397160e90560e9851c79 Mon Sep 17 00:00:00 2001
>     +From: CAB233 <yidaduizuoye@outlook.com
>     <mailto:yidaduizuoye@outlook.com>>
>     +Date: Mon, 24 Feb 2025 20:06:52 +0800
>     +Subject: [PATCH 4/6] meson: fix library name
>     +
>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
>     commit/ba25a64dcd35f4a58c4d397160e90560e9851c79 <https://github.com/
>     raboof/nethogs/commit/ba25a64dcd35f4a58c4d397160e90560e9851c79>]
>     +---
>     + src/meson.build | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/src/meson.build b/src/meson.build
>     +index 1329df4..7f6dcba 100644
>     +--- a/src/meson.build
>     ++++ b/src/meson.build
>     +@@ -39,7 +39,7 @@ if get_option('enable-libnethogs').enabled()
>     +     lib_sources = [files('libnethogs.cpp')]
>     +
>     +     libnethogs = shared_library(
>     +-        'libnethogs' ,
>     ++        'nethogs' ,
>     +         sources + lib_sources,
>     +         cpp_args: c_args,
>     +         c_args: c_args,
>     +--
>     +2.25.1
>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0005-Add-
>     security-flags-to-LDFLAGS-for-Linux.patch b/meta-oe/recipes-
>     connectivity/nethogs/files/0005-Add-security-flags-to-LDFLAGS-for-
>     Linux.patch
>     new file mode 100644
>     index 0000000000..553b382a66
>     --- /dev/null
>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-
>     flags-to-LDFLAGS-for-Linux.patch
>     @@ -0,0 +1,25 @@
>     +From 42e7950db8e412160e3f1f74b6cbc7298714c587 Mon Sep 17 00:00:00 2001
>     +From: Matheus Polkorny <mpolkorny@ipt.br <mailto:mpolkorny@ipt.br>>
>     +Date: Tue, 25 Mar 2025 00:47:04 -0300
>     +Subject: [PATCH 5/6] Add security flags to LDFLAGS for Linux
>     +
>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
>     commit/42e7950db8e412160e3f1f74b6cbc7298714c587 <https://github.com/
>     raboof/nethogs/commit/42e7950db8e412160e3f1f74b6cbc7298714c587>]
>     +---
>     + src/MakeLib.mk | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/src/MakeLib.mk b/src/MakeLib.mk
>     +index 96ba694..1be0361 100644
>     +--- a/src/MakeLib.mk
>     ++++ b/src/MakeLib.mk
>     +@@ -10,7 +10,7 @@ all: $(LIBNAME) libnethogs.a
>     +
>     + UNAME_S := $(shell uname -s)
>     + ifeq ($(UNAME_S),Linux)
>     +-  LDFLAGS:= -shared -Wl,-soname,$(SO_NAME)
>     ++  LDFLAGS:= -shared -Wl,-soname,$(SO_NAME) -Wl,-z,now -Wl,-z,relro
>     + else ifeq ($(UNAME_S),FreeBSD)
>     +   LDFLAGS:= -shared -Wl,-soname,$(SO_NAME)
>     + else
>     +--
>     +2.25.1
>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0006-
>     Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch b/meta-oe/
>     recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-
>     devices.cpp-and-libnethogs.cpp.patch
>     new file mode 100644
>     index 0000000000..485d476c50
>     --- /dev/null
>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0006-Include-
>     CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch
>     @@ -0,0 +1,30 @@
>     +From 1407f83485c31cd6f29614402bb2a3e912a3dd34 Mon Sep 17 00:00:00 2001
>     +From: Matheus Polkorny <mpolkorny@ipt.br <mailto:mpolkorny@ipt.br>>
>     +Date: Tue, 25 Mar 2025 00:48:20 -0300
>     +Subject: [PATCH 6/6] Include $(CPPFLAGS) for devices.cpp and
>     libnethogs.cpp
>     +
>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
>     commit/1407f83485c31cd6f29614402bb2a3e912a3dd34 <https://github.com/
>     raboof/nethogs/commit/1407f83485c31cd6f29614402bb2a3e912a3dd34>]
>     +---
>     + src/MakeLib.mk | 4 ++--
>     + 1 file changed, 2 insertions(+), 2 deletions(-)
>     +
>     +diff --git a/src/MakeLib.mk b/src/MakeLib.mk
>     +index 1be0361..513096e 100644
>     +--- a/src/MakeLib.mk
>     ++++ b/src/MakeLib.mk
>     +@@ -97,11 +97,11 @@ $(ODIR)/conninode.o: conninode.cpp nethogs.h
>     conninode.h
>     +
>     + $(ODIR)/devices.o: devices.cpp devices.h
>     +       @mkdir -p $(ODIR)
>     +-      $(CXX) $(CXXFLAGS) -o $@ -c devices.cpp
>     ++      $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c devices.cpp
>     +
>     + $(ODIR)/libnethogs.o: libnethogs.cpp libnethogs.h
>     +       @mkdir -p $(ODIR)
>     +-      $(CXX) $(CXXFLAGS) -o $@ -c libnethogs.cpp -
>     DVERSION=\"$(LIBVERSION)\"
>     ++      $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c libnethogs.cpp -
>     DVERSION=\"$(LIBVERSION)\"
>     +
>     + .PHONY: clean
>     + clean:
>     +--
>     +2.25.1
>     diff --git a/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
>     <http://nethogs_git.bb> b/meta-oe/recipes-connectivity/nethogs/
>     nethogs_git.bb <http://nethogs_git.bb>
>     new file mode 100644
>     index 0000000000..816cd9c542
>     --- /dev/null
>     +++ b/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb <http://
>     nethogs_git.bb>
>     @@ -0,0 +1,21 @@
>     +SUMMARY = "NetHogs is a small 'net top' tool that can group
>     bandwidth by process"
>     +HOMEPAGE = "https://github.com/raboof/nethogs <https://github.com/
>     raboof/nethogs>"
>     +SECTION = "console/network"
>     +LICENSE = "GPL-2.0-only"
>     +LIC_FILES_CHKSUM = "file://
>     COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 <file://
>     COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263>"
>     +
>     +SRC_URI = "git://github.com/raboof/
>     nethogs.git;branch=main;protocol=https <http://github.com/raboof/
>     nethogs.git;branch=main;protocol=https> \
>     + file://0001-meson-cleanup-version-detection.patch <file://0001-
>     meson-cleanup-version-detection.patch> \
>     + file://0002-meson-fix-build-with-libnethogs-disabled.patch
>     <file://0002-meson-fix-build-with-libnethogs-disabled.patch> \
>     + file://0003-meson-run-meson-format.patch <file://0003-meson-run-
>     meson-format.patch> \
>     + file://0004-meson-fix-library-name.patch <file://0004-meson-fix-
>     library-name.patch> \
>     + file://0005-Add-security-flags-to-LDFLAGS-for-Linux.patch
>     <file://0005-Add-security-flags-to-LDFLAGS-for-Linux.patch> \
>     + file://0006-Include-CPPFLAGS-for-devices.cpp-and-
>     libnethogs.cpp.patch <file://0006-Include-CPPFLAGS-for-devices.cpp-
>     and-libnethogs.cpp.patch> \
>     +           "
>     +
>     +DEPENDS = "ncurses libpcap"
>     +
>     +inherit meson pkgconfig
>     +
>     +SRCREV = "632a78846eb3cc3259dc45c59a47fa9c293a2831"
>     +PV = "0.8.8+git"
>     -- 
>     2.25.1
> 


