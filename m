Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9DACCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 18:21:43 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.95.1762798896964106107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 10:21:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZMme4kpg;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-640d790d444so1524481d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 10:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762798896; x=1763403696; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RhwaHAlYNYJ62OGuzl9Oe3ekPFbkdzSneStV+mWDbuw=;
        b=ZMme4kpg+NU+uZcnvSURMtMr7JwWD1Gw/0HZZWPHrBoeRUB+14vPtGi30lsF8F32nw
         MQ4f8BQ1Pc/9AzpPWYw/1/9TWUDyB3vDBEg8DSoCnwO6vm0Fg0Lfb5rYGU3rt1xgGBHt
         3bydCH2lX7oZiTTuuVnEArWTIWRcukYfuPLnrcbBeKAQcmPmf+bf7MHjSKwYM1Bh38vz
         o/8leZgJn5ZwDDzD4jmhKEbzgF+fjeD25qIg8w9U1+4lYJdwVUhV5iDQLGwDD58Axnua
         RO6IrOqeFteEFyYLVx4pxJxMOSaoC5QvfvQQ8NE43xTrE6Wd8elLcu610919lh2g/1Cr
         NUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762798896; x=1763403696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhwaHAlYNYJ62OGuzl9Oe3ekPFbkdzSneStV+mWDbuw=;
        b=aTZI7cH0RsKbfBZaESHNVmHHNDqbuvVlkAyFIOnYu+by1f26VFygJQ/weqtg4OF+m1
         Ag4qOV5y4Y6+9Je/SD7KQJ/eRRkywysl4TvTOPj8tx3rT7MJWkarFIL6G0YappSijLol
         npNU3YgqN5wOBVQnKB2Y3ADj4F/m/Ik+Dj8V2//x5azEmBxm+PNyaLiRkiA6s9zZL1vB
         9J8v8HNMctG6HG0/84xcC03SZOvztEd/R86F2YzqyceeFesWSu30S/z6z8IH5EMezOCz
         lw12cI0lFevKE+OIMhhD5B1P77FWspRjtajsNPYMu8OETkuKzK2hkYejDv4KcanNtYj7
         pdrw==
X-Forwarded-Encrypted: i=1; AJvYcCUlXPhU+JiMjHT8u/SFx7CnuQDfHyV7v6tyNK7ILQJ67hoYKMwKQQGXb80d7cQZOJbMgos4O3aP+ZtYWY9jDQwJaQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQIFMeHmzTu+ItSX3t4oCAhWGutsv+FcMgp880xlNGLDPzIxz8
	hanQEY8Bzb94A6cGz2KQOCr+o6HlxPH8pln6qmCCNELXL75uYOTuUrpa5y9ttHb6L8pXJs6GRPx
	zT2xcdkbrpmQ5lgNkbfNzUE5aGhWp55fYDGp6RKQ=
X-Gm-Gg: ASbGncuzaOkgtJvlihrsXyEVOTm3Kbz+PCkwIOIshV7JTEmADfDSO/JC3eIHzSRHbxh
	N+n16H5mBzK3o5CfUKTeikczxv3OTqFk4CJh+kgKrwza9dEc5up8MlGhU/gqLctbm9i2gG09ecu
	G+7o3C5E8zt+BBdRUi0OFQzWKnl9iuqUjnIJ2+j/92jAInm5Xk2Daa4UcSWvlYTPkLUz3mvaWzY
	x1T3odqzVVismh4NTAEnrA+zY6xE8MxJ3CVvez3ti5ejxSh9ZHr6s+z/R7C3I9gekxLEiH2en2Z
	vMFAKS6nWLCLUjcM65duqOGAX7TYi84I9b6FAWlB4h2RwTTd2asxQoCQZ+c+9ImYXZPbSdcGQVP
	OyX+asc+Z
X-Google-Smtp-Source: AGHT+IF1ZqLllZtdjp8f04fHp0uqItquR6SHElwJCA3hWpPCS9Gduqd15LuZAXjwFBxb1oEYdGVKHXD+99kFxN9AXzU=
X-Received: by 2002:a05:690c:4a13:b0:786:57f5:b498 with SMTP id
 00721157ae682-787d5463d63mr74021457b3.61.1762798895660; Mon, 10 Nov 2025
 10:21:35 -0800 (PST)
MIME-Version: 1.0
References: <tencent_299EFFAA32A8918332261FD2A599A3FC0A09@qq.com>
 <CAMKF1srzy2bm6VTL7n-jat4pdeP-2wiKhb5YzitQ02+57iTFtQ@mail.gmail.com>
 <AS8PR02MB102010B3EA18EBF85BC0C1382EFC0A@AS8PR02MB10201.eurprd02.prod.outlook.com>
 <8c92344c-a5c8-427c-96ea-4743bc7fae4d@gmail.com> <tencent_2677F8D13FDF5559505F041D4D26A4CB320A@qq.com>
In-Reply-To: <tencent_2677F8D13FDF5559505F041D4D26A4CB320A@qq.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Nov 2025 10:21:09 -0800
X-Gm-Features: AWmQ_bkS6gq-xO26mQJQ1RTuJ0bB-faYnebOUlBkORbA-aOVUpyoFPglKQMh1fw
Message-ID: <CAMKF1sonj9z0VPYzfL-cydZSUHQb_BhgqxJzRcXqOEeVLeDRvQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] nethogs: add recipe
To: Wen Yang <wenyang.linux@foxmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fc825406434199be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 18:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226135

--000000000000fc825406434199be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v3 did not appear in lore or patchwork either. Please rebase on top of
master-next and resend

On Mon, Nov 10, 2025 at 9:34=E2=80=AFAM Wen Yang <wenyang.linux@foxmail.com=
> wrote:

>
> Thanks for your feedback.
> We have tried multiple times to test this v3 patch, and nethogs have
> been successfully, as follows:
>
> bitbake nethogs -c cleanall
> bitbake nethogs -v
>
>
>
> NOTE: nethogs-0.8.8+git-r0 do_patch: Installed into sysroot:
> ['quilt-native', 'patch-native']
> NOTE: nethogs-0.8.8+git-r0 do_patch: Skipping as already exists in
> sysroot: ['gettext-minimal-native', 'libtool-native',
> 'texinfo-dummy-native', 'attr-native']
>
> NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch
> '0001-meson-cleanup-version-detection.patch'
>
> (../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0001-mes=
on-cleanup-version-detection.patch)
> NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch
> '0002-meson-fix-build-with-libnethogs-disabled.patch'
>
> (../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0002-mes=
on-fix-build-with-libnethogs-disabled.patch)
> NOTE: nethogs-0.8.8+git-r0 do_collect_spdx_deps: Direct dependencies are
>
> ['/mnt_vde/work/yocto/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.69.bb:do_populate_sysroot',
>
>
> 'virtual:native:/mnt_vde/work/yocto/openembedded-core/meta/recipes-devtoo=
ls/patch/patch_2.8.bb:
> do_populate_sysroot']
> NOTE: nethogs-0.8.8+git-r0 do_collect_spdx_deps: Installed into sysroot: =
[]
> NOTE: nethogs-0.8.8+git-r0 do_collect_spdx_deps: Skipping as already
> exists in sysroot: ['gettext-minimal-native', 'libtool-native',
> 'quilt-native', 'texinfo-dummy-native', 'patch-native', 'attr-native']
>
>
> NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch
> '0003-meson-run-meson-format.patch'
>
> (../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0003-mes=
on-run-meson-format.patch)
> NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch
> '0004-meson-fix-library-name.patch'
>
> (../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0004-mes=
on-fix-library-name.patch)
> NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch
> '0005-Add-security-flags-to-LDFLAGS-for-Linux.patch'
>
> (../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0005-Add=
-security-flags-to-LDFLAGS-for-Linux.patch)
> NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch
> '0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch'
>
> (../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0006-Inc=
lude-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch)
>
>
>
> NOTE: nethogs-0.8.8+git-r0 do_populate_lic: nethogs: md5 checksum
> matched for file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263
>
>
> ...
> NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-dbg
> NOTE: nethogs-0.8.8+git-r0 do_package_qa: riscv64-oe-linux-objdump -p
>
> /mnt_vde/work/yocto/build/tmp/work/riscv64imafdc-oe-linux/nethogs/0.8.8+g=
it/packages-split/nethogs-dbg/usr/bin/.debug/nethogs
> NOTE: nethogs-0.8.8+git-r0 do_package_qa: riscv64-oe-linux-objdump -p
>
> /mnt_vde/work/yocto/build/tmp/work/riscv64imafdc-oe-linux/nethogs/0.8.8+g=
it/packages-split/nethogs-dbg/usr/lib/.debug/libnethogs.so.0.8.8
>
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: Not creating empty
> archive for nethogs-locale-0.8.8+git0+632a78846e-r0
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping
> done: glibc -> libc6
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping
> done: libgcc -> libgcc1
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping
> done: libpcap -> libpcap1
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping
> done: libstdc++ -> libstdc++6
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping
> done: ncurses-libncurses -> libncurses5
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping
> done: ncurses-libtinfo -> libtinfo5
> NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-dev
> NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package:
> nethogs-staticdev
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: Not creating empty
> archive for nethogs-doc-0.8.8+git0+632a78846e-r0
> NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: libc6-dev rprovides
> glibc-dev, not replacing the latter
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: libgcc-s-dev rprovides
> libgcc-dev, not replacing the latter
> NOTE: nethogs-0.8.8+git-r0 do_package_qa: riscv64-oe-linux-objdump -p
>
> /mnt_vde/work/yocto/build/tmp/work/riscv64imafdc-oe-linux/nethogs/0.8.8+g=
it/packages-split/nethogs/usr/bin/nethogs
> NOTE: nethogs-0.8.8+git-r0 do_package_qa: riscv64-oe-linux-objdump -p
>
> /mnt_vde/work/yocto/build/tmp/work/riscv64imafdc-oe-linux/nethogs/0.8.8+g=
it/packages-split/nethogs/usr/lib/libnethogs.so.0.8.8
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: Not creating empty
> archive for nethogs-staticdev-0.8.8+git0+632a78846e-r0
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: libc6-dbg rprovides
> glibc-dbg, not replacing the latter
> NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: libgcc-s-dbg rprovides
> libgcc-dbg, not replacing the latter
> NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-local=
e
> NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-src
> NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-doc
>
> ---
> Best wishes,
> Wen
>
>
> On 11/10/25 00:09, Khem Raj wrote:
> > v3 ends up with
> >
> > ERROR: nethogs-0.8.8+git-r0 do_patch: Applying patch
> > '0003-meson-run-meson-format.patch' on target directory
> >
> '/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/nethogs/0.8.8+git/s=
ources/nethogs-0.8.8+git'
> > CmdError('quilt --quiltrc
> >
> /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/nethogs/0.8.8+git/re=
cipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch 0003-meson-run-meson-format.patch
> > patching file meson.build
> > patching file src/meson.build
> > Hunk #1 FAILED at 3.
> > 1 out of 1 hunk FAILED -- rejects in file src/meson.build
> > Patch 0003-meson-run-meson-format.patch does not apply (enforce with -f=
)
> >
> > stderr: ')
> >
> > On 11/8/25 10:23 AM, Peter Kjellerstedt wrote:
> >> For what it=E2=80=99s worth, libnethogs.so is a symbolic link when I b=
uild
> >> (for aarch64), both with v2 and v3 of the patch.
> >>
> >> //Peter
> >>
> >> *From:*openembedded-devel@lists.openembedded.org <openembedded-
> >> devel@lists.openembedded.org> *On Behalf Of *Khem Raj via
> >> lists.openembedded.org
> >> *Sent:* den 8 november 2025 18:07
> >> *To:* wenyang.linux@foxmail.com
> >> *Cc:* openembedded-core@lists.openembedded.org; openembedded-
> >> devel@lists.openembedded.org; Peter Kjellerstedt
> >> <peter.kjellerstedt@axis.com>
> >> *Subject:* Re: [oe] [meta-oe][PATCH v3] nethogs: add recipe
> >>
> >> Seeing this error
> >>
> >> https://errors.yoctoproject.org/Errors/Details/887661/ <https://
> >> errors.yoctoproject.org/Errors/Details/887661/>
> >>
> >> On Fri, Nov 7, 2025 at 10:40=E2=80=AFPM <wenyang.linux@foxmail.com
> >> <mailto:wenyang.linux@foxmail.com>> wrote:
> >>
> >>     From: Wen Yang <wenyang.linux@foxmail.com
> >>     <mailto:wenyang.linux@foxmail.com>>
> >>
> >>     NetHogs is a small 'net top' tool. Instead of breaking the traffic
> >>     down per protocol or per subnet, like most tools do, it groups
> >>     bandwidth by process.
> >>
> >>     Signed-off-by: Wen Yang <wenyang.linux@foxmail.com
> >>     <mailto:wenyang.linux@foxmail.com>>
> >>     ---
> >>       ...0001-meson-cleanup-version-detection.patch |  49 +++++
> >>       ...n-fix-build-with-libnethogs-disabled.patch |  38 ++++
> >>       .../files/0003-meson-run-meson-format.patch   | 183
> >> ++++++++++++++++++
> >>       .../files/0004-meson-fix-library-name.patch   |  25 +++
> >>       ...-security-flags-to-LDFLAGS-for-Linux.patch |  25 +++
> >>       ...S-for-devices.cpp-and-libnethogs.cpp.patch |  30 +++
> >>       .../nethogs/nethogs_git.bb <http://nethogs_git.bb>          |
> >> 21 ++
> >>       7 files changed, 371 insertions(+)
> >>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
> >>     files/0001-meson-cleanup-version-detection.patch
> >>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
> >>     files/0002-meson-fix-build-with-libnethogs-disabled.patch
> >>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
> >>     files/0003-meson-run-meson-format.patch
> >>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
> >>     files/0004-meson-fix-library-name.patch
> >>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
> >>     files/0005-Add-security-flags-to-LDFLAGS-for-Linux.patch
> >>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
> >>     files/0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.pat=
ch
> >>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
> >>     nethogs_git.bb <http://nethogs_git.bb>
> >>
> >>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0001-meson=
-
> >>     cleanup-version-detection.patch b/meta-oe/recipes-connectivity/
> >>     nethogs/files/0001-meson-cleanup-version-detection.patch
> >>     new file mode 100644
> >>     index 0000000000..797c79225d
> >>     --- /dev/null
> >>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanu=
p-
> >>     version-detection.patch
> >>     @@ -0,0 +1,49 @@
> >>     +From 049fff5623720fcd0b4fdc92501b586addbb6b48 Mon Sep 17 00:00:00
> >> 2001
> >>     +From: Sam James <sam@gentoo.org <mailto:sam@gentoo.org>>
> >>     +Date: Sat, 25 Jan 2025 16:03:12 +0000
> >>     +Subject: [PATCH 1/6] meson: cleanup version detection
> >>     +
> >>     +Tell Meson what version the project is, so that we set the right
> >>     versioning
> >>     +on libnethogs.
> >>     +
> >>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
> >>     commit/049fff5623720fcd0b4fdc92501b586addbb6b48 <
> https://github.com/
> >>     raboof/nethogs/commit/049fff5623720fcd0b4fdc92501b586addbb6b48>]
> >>     +---
> >>     + meson.build | 8 ++++----
> >>     + 1 file changed, 4 insertions(+), 4 deletions(-)
> >>     +
> >>     +diff --git a/meson.build b/meson.build
> >>     +index 81d7b59..16e61b4 100644
> >>     +--- a/meson.build
> >>     ++++ b/meson.build
> >>     +@@ -5,11 +5,11 @@
> >>     + project('nethogs',
> >>     +         ['c', 'cpp'],
> >>     +         default_options : ['warning_level=3D3',
> >>     +-                           'cpp_std=3Dc++14']
> >>     ++                           'cpp_std=3Dc++14'],
> >>     ++        version : run_command('./
> >>     determineVersion.sh').stdout().strip(),
> >>     +         )
> >>     +
> >>     + cc =3D meson.get_compiler('cpp')
> >>     +-version =3D run_command('./determineVersion.sh', check:
> >>     true).stdout().strip()
> >>     +
> >>     + #######################################
> >>     + ## Dependencies and flags definition ##
> >>     +@@ -19,7 +19,7 @@ projectinc =3D [include_directories('.', 'src')=
]
> >>     +
> >>     + # flags
> >>     + c_args =3D [
> >>     +-  '-DVERSION=3D"' + version + '"'
> >>     ++  '-DVERSION=3D"' + meson.project_version() + '"'
> >>     + ]
> >>     +
> >>     + # dependencies
> >>     +@@ -42,5 +42,5 @@ pkgconfig =3D import('pkgconfig')
> >>     + pkgconfig_install_dir =3D join_paths(get_option('libdir'),
> >> 'pkgconfig')
> >>     + pkgconfig.generate(libnethogs,
> >>     +                    requires: ['libpcap'],
> >>     +-                   version: version
> >>     ++                   version: meson.project_version()
> >>     +                    )
> >>     +--
> >>     +2.25.1
> >>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0002-meson=
-
> >>     fix-build-with-libnethogs-disabled.patch b/meta-oe/recipes-
> >>     connectivity/nethogs/files/0002-meson-fix-build-with-libnethogs-
> >>     disabled.patch
> >>     new file mode 100644
> >>     index 0000000000..c9a7cf69d6
> >>     --- /dev/null
> >>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-
> >>     build-with-libnethogs-disabled.patch
> >>     @@ -0,0 +1,38 @@
> >>     +From 5afce747f142f6df6a264ab368c99f47050d9984 Mon Sep 17 00:00:00
> >> 2001
> >>     +From: Sam James <sam@gentoo.org <mailto:sam@gentoo.org>>
> >>     +Date: Sat, 25 Jan 2025 16:05:20 +0000
> >>     +Subject: [PATCH 2/6] meson: fix build with libnethogs disabled
> >>     +
> >>     +Fix `meson.build:43:19: ERROR: Unknown variable "libnethogs".`.
> >>     +
> >>     +While src/ has this correct, the top-level meson.build wasn't
> right.
> >>     +
> >>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
> >>     commit/5afce747f142f6df6a264ab368c99f47050d9984 <
> https://github.com/
> >>     raboof/nethogs/commit/5afce747f142f6df6a264ab368c99f47050d9984>]
> >>     +---
> >>     + meson.build | 14 ++++++++------
> >>     + 1 file changed, 8 insertions(+), 6 deletions(-)
> >>     +
> >>     +diff --git a/meson.build b/meson.build
> >>     +index 16e61b4..8537718 100644
> >>     +--- a/meson.build
> >>     ++++ b/meson.build
> >>     +@@ -38,9 +38,11 @@ subdir('src')
> >>     + #############################
> >>     + ## Pkgconfig definition    ##
> >>     + #############################
> >>     +-pkgconfig =3D import('pkgconfig')
> >>     +-pkgconfig_install_dir =3D join_paths(get_option('libdir'),
> >> 'pkgconfig')
> >>     +-pkgconfig.generate(libnethogs,
> >>     +-                   requires: ['libpcap'],
> >>     +-                   version: meson.project_version()
> >>     +-                   )
> >>     ++if get_option('enable-libnethogs').enabled()
> >>     ++  pkgconfig =3D import('pkgconfig')
> >>     ++  pkgconfig_install_dir =3D join_paths(get_option('libdir'),
> >>     'pkgconfig')
> >>     ++  pkgconfig.generate(libnethogs,
> >>     ++                     requires: ['libpcap'],
> >>     ++                     version: meson.project_version()
> >>     ++                     )
> >>     ++endif
> >>     +--
> >>     +2.25.1
> >>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0003-meson=
-
> >>     run-meson-format.patch b/meta-oe/recipes-connectivity/nethogs/
> >>     files/0003-meson-run-meson-format.patch
> >>     new file mode 100644
> >>     index 0000000000..9c92a9d835
> >>     --- /dev/null
> >>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-
> >>     meson-format.patch
> >>     @@ -0,0 +1,183 @@
> >>     +From fcbde46b0082b4c571392ea9b6427f5e11941393 Mon Sep 17 00:00:00
> >> 2001
> >>     +From: Sam James <sam@gentoo.org <mailto:sam@gentoo.org>>
> >>     +Date: Sat, 25 Jan 2025 16:06:12 +0000
> >>     +Subject: [PATCH 3/6] meson: run `meson format`
> >>     +
> >>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
> >>     commit/fcbde46b0082b4c571392ea9b6427f5e11941393 <
> https://github.com/
> >>     raboof/nethogs/commit/fcbde46b0082b4c571392ea9b6427f5e11941393>]
> >>     +---
> >>     + meson.build     | 34 +++++++++----------
> >>     + src/meson.build | 87
> >> ++++++++++++++++++++++---------------------------
> >>     + 2 files changed, 54 insertions(+), 67 deletions(-)
> >>     +
> >>     +diff --git a/meson.build b/meson.build
> >>     +index 8537718..eb9f16e 100644
> >>     +--- a/meson.build
> >>     ++++ b/meson.build
> >>     +@@ -2,12 +2,12 @@
> >>     + # See COPYING for more information about licensing
> >>     + #
> >>     +
> >>     +-project('nethogs',
> >>     +-        ['c', 'cpp'],
> >>     +-        default_options : ['warning_level=3D3',
> >>     +-                           'cpp_std=3Dc++14'],
> >>     +-        version : run_command('./
> >>     determineVersion.sh').stdout().strip(),
> >>     +-        )
> >>     ++project(
> >>     ++    'nethogs',
> >>     ++    ['c', 'cpp'],
> >>     ++    default_options: ['warning_level=3D3', 'cpp_std=3Dc++14'],
> >>     ++    version:
> run_command('./determineVersion.sh').stdout().strip(),
> >>     ++)
> >>     +
> >>     + cc =3D meson.get_compiler('cpp')
> >>     +
> >>     +@@ -18,17 +18,12 @@ cc =3D meson.get_compiler('cpp')
> >>     + projectinc =3D [include_directories('.', 'src')]
> >>     +
> >>     + # flags
> >>     +-c_args =3D [
> >>     +-  '-DVERSION=3D"' + meson.project_version() + '"'
> >>     +-]
> >>     ++c_args =3D ['-DVERSION=3D"' + meson.project_version() + '"']
> >>     +
> >>     + # dependencies
> >>     + thread_dep =3D dependency('threads', required: true)
> >>     + libpcap_dep =3D dependency('libpcap', required: true)
> >>     +-project_deps =3D [
> >>     +-  thread_dep,
> >>     +-  libpcap_dep
> >>     +-]
> >>     ++project_deps =3D [thread_dep, libpcap_dep]
> >>     +
> >>     + #############################
> >>     + ## Code Compilation        ##
> >>     +@@ -39,10 +34,11 @@ subdir('src')
> >>     + ## Pkgconfig definition    ##
> >>     + #############################
> >>     + if get_option('enable-libnethogs').enabled()
> >>     +-  pkgconfig =3D import('pkgconfig')
> >>     +-  pkgconfig_install_dir =3D join_paths(get_option('libdir'),
> >>     'pkgconfig')
> >>     +-  pkgconfig.generate(libnethogs,
> >>     +-                     requires: ['libpcap'],
> >>     +-                     version: meson.project_version()
> >>     +-                     )
> >>     ++    pkgconfig =3D import('pkgconfig')
> >>     ++    pkgconfig_install_dir =3D join_paths(get_option('libdir'),
> >>     'pkgconfig')
> >>     ++    pkgconfig.generate(
> >>     ++        libnethogs,
> >>     ++        requires: ['libpcap'],
> >>     ++        version: meson.project_version(),
> >>     ++    )
> >>     + endif
> >>     +diff --git a/src/meson.build b/src/meson.build
> >>     +index 03f1b58..1329df4 100644
> >>     +--- a/src/meson.build
> >>     ++++ b/src/meson.build
> >>     +@@ -3,65 +3,56 @@
> >>     + #
> >>     +
> >>     + sources =3D [
> >>     +-  files([
> >>     +-    'connection.cpp',
> >>     +-    'conninode.cpp',
> >>     +-    'decpcap.c',
> >>     +-    'devices.cpp',
> >>     +-    'inode2prog.cpp',
> >>     +-    'packet.cpp',
> >>     +-    'process.cpp',
> >>     +-  ])
> >>     ++    files(
> >>     ++        'connection.cpp',
> >>     ++        'conninode.cpp',
> >>     ++        'decpcap.c',
> >>     ++        'devices.cpp',
> >>     ++        'inode2prog.cpp',
> >>     ++        'packet.cpp',
> >>     ++        'process.cpp',
> >>     ++    ),
> >>     + ]
> >>     +
> >>     + # --- Executable Compilation ---
> >>     +
> >>     + if get_option('enable-nethogs-app').enabled()
> >>     +-  app_sources =3D [
> >>     +-    files([
> >>     +-      'main.cpp',
> >>     +-      'cui.cpp',
> >>     +-    ])
> >>     +-  ]
> >>     +-
> >>     +-  cursespp_dep =3D dependency('ncurses++', required: true)
> >>     +-  curses_dep =3D dependency('ncurses', required: true)
> >>     +-
> >>     +-  executable('nethogs',
> >>     +-    [app_sources + sources],
> >>     +-    include_directories: [projectinc],
> >>     +-    cpp_args: c_args,
> >>     +-    c_args: c_args,
> >>     +-    install: true,
> >>     +-    dependencies : [project_deps, cursespp_dep, curses_dep]
> >>     +-  )
> >>     ++    app_sources =3D [files('cui.cpp', 'main.cpp')]
> >>     ++
> >>     ++    cursespp_dep =3D dependency('ncurses++', required: true)
> >>     ++    curses_dep =3D dependency('ncurses', required: true)
> >>     ++
> >>     ++    executable(
> >>     ++        'nethogs',
> >>     ++        [app_sources + sources],
> >>     ++        include_directories: [projectinc],
> >>     ++        cpp_args: c_args,
> >>     ++        c_args: c_args,
> >>     ++        install: true,
> >>     ++        dependencies: [project_deps, cursespp_dep, curses_dep],
> >>     ++    )
> >>     + endif
> >>     +
> >>     + # --- Library Compilation ---
> >>     +
> >>     + if get_option('enable-libnethogs').enabled()
> >>     +-  lib_sources =3D [
> >>     +-    files([
> >>     +-      'libnethogs.cpp',
> >>     +-    ])
> >>     +-  ]
> >>     ++    lib_sources =3D [files('libnethogs.cpp')]
> >>     ++
> >>     ++    libnethogs =3D shared_library(
> >>     ++        'libnethogs' ,
> >>     ++        sources + lib_sources,
> >>     ++        cpp_args: c_args,
> >>     ++        c_args: c_args,
> >>     ++        install: true,
> >>     ++        soversion: meson.project_version(),
> >>     ++        include_directories: [projectinc],
> >>     ++        dependencies: [project_deps],
> >>     ++    )
> >>     +
> >>     +-  libnethogs =3D shared_library('libnethogs' ,
> >>     +-    sources + lib_sources,
> >>     +-    cpp_args: c_args,
> >>     +-    c_args: c_args,
> >>     +-    install: true,
> >>     +-    soversion: meson.project_version(),
> >>     +-    include_directories: [projectinc],
> >>     +-    dependencies: [project_deps]
> >>     +-  )
> >>     +-
> >>     +-  libnethogs_dep =3D declare_dependency(link_with: libnethogs)
> >>     ++    libnethogs_dep =3D declare_dependency(link_with: libnethogs)
> >>     +
> >>     +-  # --- Header Installation ---
> >>     ++    # --- Header Installation ---
> >>     +
> >>     +-  lib_headers =3D [
> >>     +-    files('libnethogs.h'),
> >>     +-  ]
> >>     +-  install_headers(lib_headers, subdir : 'libnethogs')
> >>     ++    lib_headers =3D [files('libnethogs.h')]
> >>     ++    install_headers(lib_headers, subdir: 'libnethogs')
> >>     + endif
> >>     +--
> >>     +2.25.1
> >>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0004-meson=
-
> >>     fix-library-name.patch b/meta-oe/recipes-connectivity/nethogs/
> >>     files/0004-meson-fix-library-name.patch
> >>     new file mode 100644
> >>     index 0000000000..cc69a66748
> >>     --- /dev/null
> >>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-
> >>     library-name.patch
> >>     @@ -0,0 +1,25 @@
> >>     +From ba25a64dcd35f4a58c4d397160e90560e9851c79 Mon Sep 17 00:00:00
> >> 2001
> >>     +From: CAB233 <yidaduizuoye@outlook.com
> >>     <mailto:yidaduizuoye@outlook.com>>
> >>     +Date: Mon, 24 Feb 2025 20:06:52 +0800
> >>     +Subject: [PATCH 4/6] meson: fix library name
> >>     +
> >>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
> >>     commit/ba25a64dcd35f4a58c4d397160e90560e9851c79 <
> https://github.com/
> >>     raboof/nethogs/commit/ba25a64dcd35f4a58c4d397160e90560e9851c79>]
> >>     +---
> >>     + src/meson.build | 2 +-
> >>     + 1 file changed, 1 insertion(+), 1 deletion(-)
> >>     +
> >>     +diff --git a/src/meson.build b/src/meson.build
> >>     +index 1329df4..7f6dcba 100644
> >>     +--- a/src/meson.build
> >>     ++++ b/src/meson.build
> >>     +@@ -39,7 +39,7 @@ if get_option('enable-libnethogs').enabled()
> >>     +     lib_sources =3D [files('libnethogs.cpp')]
> >>     +
> >>     +     libnethogs =3D shared_library(
> >>     +-        'libnethogs' ,
> >>     ++        'nethogs' ,
> >>     +         sources + lib_sources,
> >>     +         cpp_args: c_args,
> >>     +         c_args: c_args,
> >>     +--
> >>     +2.25.1
> >>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0005-Add-
> >>     security-flags-to-LDFLAGS-for-Linux.patch b/meta-oe/recipes-
> >>     connectivity/nethogs/files/0005-Add-security-flags-to-LDFLAGS-for-
> >>     Linux.patch
> >>     new file mode 100644
> >>     index 0000000000..553b382a66
> >>     --- /dev/null
> >>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0005-Add-security=
-
> >>     flags-to-LDFLAGS-for-Linux.patch
> >>     @@ -0,0 +1,25 @@
> >>     +From 42e7950db8e412160e3f1f74b6cbc7298714c587 Mon Sep 17 00:00:00
> >> 2001
> >>     +From: Matheus Polkorny <mpolkorny@ipt.br <mailto:mpolkorny@ipt.br
> >>
> >>     +Date: Tue, 25 Mar 2025 00:47:04 -0300
> >>     +Subject: [PATCH 5/6] Add security flags to LDFLAGS for Linux
> >>     +
> >>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
> >>     commit/42e7950db8e412160e3f1f74b6cbc7298714c587 <
> https://github.com/
> >>     raboof/nethogs/commit/42e7950db8e412160e3f1f74b6cbc7298714c587>]
> >>     +---
> >>     + src/MakeLib.mk | 2 +-
> >>     + 1 file changed, 1 insertion(+), 1 deletion(-)
> >>     +
> >>     +diff --git a/src/MakeLib.mk b/src/MakeLib.mk
> >>     +index 96ba694..1be0361 100644
> >>     +--- a/src/MakeLib.mk
> >>     ++++ b/src/MakeLib.mk
> >>     +@@ -10,7 +10,7 @@ all: $(LIBNAME) libnethogs.a
> >>     +
> >>     + UNAME_S :=3D $(shell uname -s)
> >>     + ifeq ($(UNAME_S),Linux)
> >>     +-  LDFLAGS:=3D -shared -Wl,-soname,$(SO_NAME)
> >>     ++  LDFLAGS:=3D -shared -Wl,-soname,$(SO_NAME) -Wl,-z,now -Wl,-z,r=
elro
> >>     + else ifeq ($(UNAME_S),FreeBSD)
> >>     +   LDFLAGS:=3D -shared -Wl,-soname,$(SO_NAME)
> >>     + else
> >>     +--
> >>     +2.25.1
> >>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0006-
> >>     Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch b/meta-o=
e/
> >>     recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-
> >>     devices.cpp-and-libnethogs.cpp.patch
> >>     new file mode 100644
> >>     index 0000000000..485d476c50
> >>     --- /dev/null
> >>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0006-Include-
> >>     CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch
> >>     @@ -0,0 +1,30 @@
> >>     +From 1407f83485c31cd6f29614402bb2a3e912a3dd34 Mon Sep 17 00:00:00
> >> 2001
> >>     +From: Matheus Polkorny <mpolkorny@ipt.br <mailto:mpolkorny@ipt.br
> >>
> >>     +Date: Tue, 25 Mar 2025 00:48:20 -0300
> >>     +Subject: [PATCH 6/6] Include $(CPPFLAGS) for devices.cpp and
> >>     libnethogs.cpp
> >>     +
> >>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
> >>     commit/1407f83485c31cd6f29614402bb2a3e912a3dd34 <
> https://github.com/
> >>     raboof/nethogs/commit/1407f83485c31cd6f29614402bb2a3e912a3dd34>]
> >>     +---
> >>     + src/MakeLib.mk | 4 ++--
> >>     + 1 file changed, 2 insertions(+), 2 deletions(-)
> >>     +
> >>     +diff --git a/src/MakeLib.mk b/src/MakeLib.mk
> >>     +index 1be0361..513096e 100644
> >>     +--- a/src/MakeLib.mk
> >>     ++++ b/src/MakeLib.mk
> >>     +@@ -97,11 +97,11 @@ $(ODIR)/conninode.o: conninode.cpp nethogs.h
> >>     conninode.h
> >>     +
> >>     + $(ODIR)/devices.o: devices.cpp devices.h
> >>     +       @mkdir -p $(ODIR)
> >>     +-      $(CXX) $(CXXFLAGS) -o $@ -c devices.cpp
> >>     ++      $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c devices.cpp
> >>     +
> >>     + $(ODIR)/libnethogs.o: libnethogs.cpp libnethogs.h
> >>     +       @mkdir -p $(ODIR)
> >>     +-      $(CXX) $(CXXFLAGS) -o $@ -c libnethogs.cpp -
> >>     DVERSION=3D\"$(LIBVERSION)\"
> >>     ++      $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c libnethogs.cpp -
> >>     DVERSION=3D\"$(LIBVERSION)\"
> >>     +
> >>     + .PHONY: clean
> >>     + clean:
> >>     +--
> >>     +2.25.1
> >>     diff --git a/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
> >>     <http://nethogs_git.bb> b/meta-oe/recipes-connectivity/nethogs/
> >>     nethogs_git.bb <http://nethogs_git.bb>
> >>     new file mode 100644
> >>     index 0000000000..816cd9c542
> >>     --- /dev/null
> >>     +++ b/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb <http://
> >>     nethogs_git.bb>
> >>     @@ -0,0 +1,21 @@
> >>     +SUMMARY =3D "NetHogs is a small 'net top' tool that can group
> >>     bandwidth by process"
> >>     +HOMEPAGE =3D "https://github.com/raboof/nethogs <https://github.c=
om/
> >>     raboof/nethogs>"
> >>     +SECTION =3D "console/network"
> >>     +LICENSE =3D "GPL-2.0-only"
> >>     +LIC_FILES_CHKSUM =3D "file://
> >>     COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 <file://
> >>     COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263>"
> >>     +
> >>     +SRC_URI =3D "git://github.com/raboof/
> >>     nethogs.git;branch=3Dmain;protocol=3Dhttps <http://github.com/rabo=
of/
> >>     nethogs.git;branch=3Dmain;protocol=3Dhttps> \
> >>     + file://0001-meson-cleanup-version-detection.patch <file://0001-
> >>     meson-cleanup-version-detection.patch> \
> >>     + file://0002-meson-fix-build-with-libnethogs-disabled.patch
> >>     <file://0002-meson-fix-build-with-libnethogs-disabled.patch> \
> >>     + file://0003-meson-run-meson-format.patch <file://0003-meson-run-
> >>     meson-format.patch> \
> >>     + file://0004-meson-fix-library-name.patch <file://0004-meson-fix-
> >>     library-name.patch> \
> >>     + file://0005-Add-security-flags-to-LDFLAGS-for-Linux.patch
> >>     <file://0005-Add-security-flags-to-LDFLAGS-for-Linux.patch> \
> >>     + file://0006-Include-CPPFLAGS-for-devices.cpp-and-
> >>     libnethogs.cpp.patch <file://0006-Include-CPPFLAGS-for-devices.cpp=
-
> >>     and-libnethogs.cpp.patch> \
> >>     +           "
> >>     +
> >>     +DEPENDS =3D "ncurses libpcap"
> >>     +
> >>     +inherit meson pkgconfig
> >>     +
> >>     +SRCREV =3D "632a78846eb3cc3259dc45c59a47fa9c293a2831"
> >>     +PV =3D "0.8.8+git"
> >>     --     2.25.1
> >>
>
>

--000000000000fc825406434199be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v3 did not appear in lore or patchwork either. Please reba=
se on top of master-next and resend=C2=A0</div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov =
10, 2025 at 9:34=E2=80=AFAM Wen Yang &lt;<a href=3D"mailto:wenyang.linux@fo=
xmail.com">wenyang.linux@foxmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><br>
Thanks for your feedback.<br>
We have tried multiple times to test this v3 patch, and nethogs have <br>
been successfully, as follows:<br>
<br>
bitbake nethogs -c cleanall<br>
bitbake nethogs -v<br>
<br>
<br>
<br>
NOTE: nethogs-0.8.8+git-r0 do_patch: Installed into sysroot: <br>
[&#39;quilt-native&#39;, &#39;patch-native&#39;]<br>
NOTE: nethogs-0.8.8+git-r0 do_patch: Skipping as already exists in <br>
sysroot: [&#39;gettext-minimal-native&#39;, &#39;libtool-native&#39;, <br>
&#39;texinfo-dummy-native&#39;, &#39;attr-native&#39;]<br>
<br>
NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch <br>
&#39;0001-meson-cleanup-version-detection.patch&#39; <br>
(../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0001-meson=
-cleanup-version-detection.patch)<br>
NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch <br>
&#39;0002-meson-fix-build-with-libnethogs-disabled.patch&#39; <br>
(../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0002-meson=
-fix-build-with-libnethogs-disabled.patch)<br>
NOTE: nethogs-0.8.8+git-r0 do_collect_spdx_deps: Direct dependencies are <b=
r>
[&#39;/mnt_vde/work/yocto/openembedded-core/meta/recipes-devtools/quilt/qui=
lt-native_0.69.bb:do_populate_sysroot&#39;, <br>
&#39;virtual:native:/mnt_vde/work/yocto/openembedded-core/meta/recipes-devt=
ools/patch/patch_2.8.bb:do_populate_sysroot&#39;]<br>
NOTE: nethogs-0.8.8+git-r0 do_collect_spdx_deps: Installed into sysroot: []=
<br>
NOTE: nethogs-0.8.8+git-r0 do_collect_spdx_deps: Skipping as already <br>
exists in sysroot: [&#39;gettext-minimal-native&#39;, &#39;libtool-native&#=
39;, <br>
&#39;quilt-native&#39;, &#39;texinfo-dummy-native&#39;, &#39;patch-native&#=
39;, &#39;attr-native&#39;]<br>
<br>
<br>
NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch <br>
&#39;0003-meson-run-meson-format.patch&#39; <br>
(../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0003-meson=
-run-meson-format.patch)<br>
NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch <br>
&#39;0004-meson-fix-library-name.patch&#39; <br>
(../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0004-meson=
-fix-library-name.patch)<br>
NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch <br>
&#39;0005-Add-security-flags-to-LDFLAGS-for-Linux.patch&#39; <br>
(../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0005-Add-s=
ecurity-flags-to-LDFLAGS-for-Linux.patch)<br>
NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch <br>
&#39;0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch&#39; <b=
r>
(../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0006-Inclu=
de-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch)<br>
<br>
<br>
<br>
NOTE: nethogs-0.8.8+git-r0 do_populate_lic: nethogs: md5 checksum <br>
matched for file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263<br>
<br>
<br>
...<br>
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-dbg<br>
NOTE: nethogs-0.8.8+git-r0 do_package_qa: riscv64-oe-linux-objdump -p <br>
/mnt_vde/work/yocto/build/tmp/work/riscv64imafdc-oe-linux/nethogs/0.8.8+git=
/packages-split/nethogs-dbg/usr/bin/.debug/nethogs<br>
NOTE: nethogs-0.8.8+git-r0 do_package_qa: riscv64-oe-linux-objdump -p <br>
/mnt_vde/work/yocto/build/tmp/work/riscv64imafdc-oe-linux/nethogs/0.8.8+git=
/packages-split/nethogs-dbg/usr/lib/.debug/libnethogs.so.0.8.8<br>
<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: Not creating empty <br>
archive for nethogs-locale-0.8.8+git0+632a78846e-r0<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping <br>
done: glibc -&gt; libc6<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping <br>
done: libgcc -&gt; libgcc1<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping <br>
done: libpcap -&gt; libpcap1<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping <br>
done: libstdc++ -&gt; libstdc++6<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping <br>
done: ncurses-libncurses -&gt; libncurses5<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping <br>
done: ncurses-libtinfo -&gt; libtinfo5<br>
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-dev<br>
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: <br>
nethogs-staticdev<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: Not creating empty <br>
archive for nethogs-doc-0.8.8+git0+632a78846e-r0<br>
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: libc6-dev rprovides <br>
glibc-dev, not replacing the latter<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: libgcc-s-dev rprovides <br=
>
libgcc-dev, not replacing the latter<br>
NOTE: nethogs-0.8.8+git-r0 do_package_qa: riscv64-oe-linux-objdump -p <br>
/mnt_vde/work/yocto/build/tmp/work/riscv64imafdc-oe-linux/nethogs/0.8.8+git=
/packages-split/nethogs/usr/bin/nethogs<br>
NOTE: nethogs-0.8.8+git-r0 do_package_qa: riscv64-oe-linux-objdump -p <br>
/mnt_vde/work/yocto/build/tmp/work/riscv64imafdc-oe-linux/nethogs/0.8.8+git=
/packages-split/nethogs/usr/lib/libnethogs.so.0.8.8<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: Not creating empty <br>
archive for nethogs-staticdev-0.8.8+git0+632a78846e-r0<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: libc6-dbg rprovides <br>
glibc-dbg, not replacing the latter<br>
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: libgcc-s-dbg rprovides <br=
>
libgcc-dbg, not replacing the latter<br>
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-locale<=
br>
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-src<br>
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-doc<br>
<br>
---<br>
Best wishes,<br>
Wen<br>
<br>
<br>
On 11/10/25 00:09, Khem Raj wrote:<br>
&gt; v3 ends up with<br>
&gt; <br>
&gt; ERROR: nethogs-0.8.8+git-r0 do_patch: Applying patch <br>
&gt; &#39;0003-meson-run-meson-format.patch&#39; on target directory <br>
&gt; &#39;/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/nethogs/0.8.=
8+git/sources/nethogs-0.8.8+git&#39;<br>
&gt; CmdError(&#39;quilt --quiltrc <br>
&gt; /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/nethogs/0.8.8+git=
/recipe-sysroot-native/etc/quiltrc push&#39;, 0, &#39;stdout: Applying patc=
h 0003-meson-run-meson-format.patch<br>
&gt; patching file meson.build<br>
&gt; patching file src/meson.build<br>
&gt; Hunk #1 FAILED at 3.<br>
&gt; 1 out of 1 hunk FAILED -- rejects in file src/meson.build<br>
&gt; Patch 0003-meson-run-meson-format.patch does not apply (enforce with -=
f)<br>
&gt; <br>
&gt; stderr: &#39;)<br>
&gt; <br>
&gt; On 11/8/25 10:23 AM, Peter Kjellerstedt wrote:<br>
&gt;&gt; For what it=E2=80=99s worth, libnethogs.so is a symbolic link when=
 I build <br>
&gt;&gt; (for aarch64), both with v2 and v3 of the patch.<br>
&gt;&gt;<br>
&gt;&gt; //Peter<br>
&gt;&gt;<br>
&gt;&gt; *From:*<a href=3D"mailto:openembedded-devel@lists.openembedded.org=
" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;opene=
mbedded- <br>
&gt;&gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_blank">=
devel@lists.openembedded.org</a>&gt; *On Behalf Of *Khem Raj via <br>
&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a><br>
&gt;&gt; *Sent:* den 8 november 2025 18:07<br>
&gt;&gt; *To:* <a href=3D"mailto:wenyang.linux@foxmail.com" target=3D"_blan=
k">wenyang.linux@foxmail.com</a><br>
&gt;&gt; *Cc:* <a href=3D"mailto:openembedded-core@lists.openembedded.org" =
target=3D"_blank">openembedded-core@lists.openembedded.org</a>; openembedde=
d- <br>
&gt;&gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_blank">=
devel@lists.openembedded.org</a>; Peter Kjellerstedt <br>
&gt;&gt; &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blan=
k">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt;&gt; *Subject:* Re: [oe] [meta-oe][PATCH v3] nethogs: add recipe<br>
&gt;&gt;<br>
&gt;&gt; Seeing this error<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/887661/"=
 rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Error=
s/Details/887661/</a> &lt;https:// <br>
&gt;&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/887661/" =
rel=3D"noreferrer" target=3D"_blank">errors.yoctoproject.org/Errors/Details=
/887661/</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Nov 7, 2025 at 10:40=E2=80=AFPM &lt;<a href=3D"mailto:weny=
ang.linux@foxmail.com" target=3D"_blank">wenyang.linux@foxmail.com</a> <br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:wenyang.linux@foxmail.com" target=3D"=
_blank">wenyang.linux@foxmail.com</a>&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 From: Wen Yang &lt;<a href=3D"mailto:wenyang.li=
nux@foxmail.com" target=3D"_blank">wenyang.linux@foxmail.com</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;mailto:<a href=3D"mailto:wenyang.linux@foxm=
ail.com" target=3D"_blank">wenyang.linux@foxmail.com</a>&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 NetHogs is a small &#39;net top&#39; tool. Inst=
ead of breaking the traffic<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 down per protocol or per subnet, like most tool=
s do, it groups<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 bandwidth by process.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Signed-off-by: Wen Yang &lt;<a href=3D"mailto:w=
enyang.linux@foxmail.com" target=3D"_blank">wenyang.linux@foxmail.com</a><b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;mailto:<a href=3D"mailto:wenyang.linux@foxm=
ail.com" target=3D"_blank">wenyang.linux@foxmail.com</a>&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0...0001-meson-cleanup-version-detec=
tion.patch |=C2=A0 49 +++++<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0...n-fix-build-with-libnethogs-disa=
bled.patch |=C2=A0 38 ++++<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0.../files/0003-meson-run-meson-form=
at.patch=C2=A0 =C2=A0| 183 <br>
&gt;&gt; ++++++++++++++++++<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0.../files/0004-meson-fix-library-na=
me.patch=C2=A0 =C2=A0|=C2=A0 25 +++<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0...-security-flags-to-LDFLAGS-for-L=
inux.patch |=C2=A0 25 +++<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0...S-for-devices.cpp-and-libnethogs=
.cpp.patch |=C2=A0 30 +++<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0.../nethogs/<a href=3D"http://netho=
gs_git.bb" rel=3D"noreferrer" target=3D"_blank">nethogs_git.bb</a> &lt;<a h=
ref=3D"http://nethogs_git.bb" rel=3D"noreferrer" target=3D"_blank">http://n=
ethogs_git.bb</a>&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 |=C2=A0 <br>
&gt;&gt; 21 ++<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A07 files changed, 371 insertions(+)<=
br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-=
connectivity/nethogs/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 files/0001-meson-cleanup-version-detection.patc=
h<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-=
connectivity/nethogs/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 files/0002-meson-fix-build-with-libnethogs-disa=
bled.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-=
connectivity/nethogs/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 files/0003-meson-run-meson-format.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-=
connectivity/nethogs/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 files/0004-meson-fix-library-name.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-=
connectivity/nethogs/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 files/0005-Add-security-flags-to-LDFLAGS-for-Li=
nux.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-=
connectivity/nethogs/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 files/0006-Include-CPPFLAGS-for-devices.cpp-and=
-libnethogs.cpp.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-=
connectivity/nethogs/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 <a href=3D"http://nethogs_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">nethogs_git.bb</a> &lt;<a href=3D"http://nethogs_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">http://nethogs_git.bb</a>&gt;<br=
>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 diff --git a/meta-oe/recipes-connectivity/netho=
gs/files/0001-meson-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 cleanup-version-detection.patch b/meta-oe/recip=
es-connectivity/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 nethogs/files/0001-meson-cleanup-version-detect=
ion.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 new file mode 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 index 0000000000..797c79225d<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 --- /dev/null<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +++ b/meta-oe/recipes-connectivity/nethogs/file=
s/0001-meson-cleanup-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 version-detection.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 @@ -0,0 +1,49 @@<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +From 049fff5623720fcd0b4fdc92501b586addbb6b48 =
Mon Sep 17 00:00:00 <br>
&gt;&gt; 2001<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +From: Sam James &lt;<a href=3D"mailto:sam@gent=
oo.org" target=3D"_blank">sam@gentoo.org</a> &lt;mailto:<a href=3D"mailto:s=
am@gentoo.org" target=3D"_blank">sam@gentoo.org</a>&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Date: Sat, 25 Jan 2025 16:03:12 +0000<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Subject: [PATCH 1/6] meson: cleanup version de=
tection<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Tell Meson what version the project is, so tha=
t we set the right<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 versioning<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +on libnethogs.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Upstream-Status: Backport [<a href=3D"https://=
github.com/raboof/nethogs/" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/raboof/nethogs/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 commit/049fff5623720fcd0b4fdc92501b586addbb6b48=
 &lt;<a href=3D"https://github.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 raboof/nethogs/commit/049fff5623720fcd0b4fdc925=
01b586addbb6b48&gt;]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + meson.build | 8 ++++----<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + 1 file changed, 4 insertions(+), 4 deletions(=
-)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +diff --git a/meson.build b/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +index 81d7b59..16e61b4 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--- a/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++++ b/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +@@ -5,11 +5,11 @@<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + project(&#39;nethogs&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;c&#39;=
, &#39;cpp&#39;],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default_opti=
ons : [&#39;warning_level=3D3&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;cpp_std=3Dc++14&#3=
9;]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;cpp_std=3Dc++14&#3=
9;],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 version : run_com=
mand(&#39;./<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 determineVersion.sh&#39;).stdout().strip(),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + cc =3D meson.get_compiler(&#39;cpp&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-version =3D run_command(&#39;./determineVersi=
on.sh&#39;, check:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 true).stdout().strip()<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + #######################################<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + ## Dependencies and flags definition ##<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +@@ -19,7 +19,7 @@ projectinc =3D [include_dire=
ctories(&#39;.&#39;, &#39;src&#39;)]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + # flags<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + c_args =3D [<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 &#39;-DVERSION=3D&quot;&#39; + version=
 + &#39;&quot;&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 &#39;-DVERSION=3D&quot;&#39; + meson.p=
roject_version() + &#39;&quot;&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + ]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + # dependencies<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +@@ -42,5 +42,5 @@ pkgconfig =3D import(&#39;pk=
gconfig&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + pkgconfig_install_dir =3D join_paths(get_opti=
on(&#39;libdir&#39;), <br>
&gt;&gt; &#39;pkgconfig&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + pkgconfig.generate(libnethogs,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 requires: [&#39;libpcap&#39;],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0version: version<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0version: meson.project_version()<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +2.25.1<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 diff --git a/meta-oe/recipes-connectivity/netho=
gs/files/0002-meson-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 fix-build-with-libnethogs-disabled.patch b/meta=
-oe/recipes-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 connectivity/nethogs/files/0002-meson-fix-build=
-with-libnethogs-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 disabled.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 new file mode 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 index 0000000000..c9a7cf69d6<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 --- /dev/null<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +++ b/meta-oe/recipes-connectivity/nethogs/file=
s/0002-meson-fix-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 build-with-libnethogs-disabled.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 @@ -0,0 +1,38 @@<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +From 5afce747f142f6df6a264ab368c99f47050d9984 =
Mon Sep 17 00:00:00 <br>
&gt;&gt; 2001<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +From: Sam James &lt;<a href=3D"mailto:sam@gent=
oo.org" target=3D"_blank">sam@gentoo.org</a> &lt;mailto:<a href=3D"mailto:s=
am@gentoo.org" target=3D"_blank">sam@gentoo.org</a>&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Date: Sat, 25 Jan 2025 16:05:20 +0000<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Subject: [PATCH 2/6] meson: fix build with lib=
nethogs disabled<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Fix `meson.build:43:19: ERROR: Unknown variabl=
e &quot;libnethogs&quot;.`.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +While src/ has this correct, the top-level mes=
on.build wasn&#39;t right.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Upstream-Status: Backport [<a href=3D"https://=
github.com/raboof/nethogs/" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/raboof/nethogs/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 commit/5afce747f142f6df6a264ab368c99f47050d9984=
 &lt;<a href=3D"https://github.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 raboof/nethogs/commit/5afce747f142f6df6a264ab36=
8c99f47050d9984&gt;]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + meson.build | 14 ++++++++------<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + 1 file changed, 8 insertions(+), 6 deletions(=
-)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +diff --git a/meson.build b/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +index 16e61b4..8537718 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--- a/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++++ b/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +@@ -38,9 +38,11 @@ subdir(&#39;src&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + #############################<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + ## Pkgconfig definition=C2=A0 =C2=A0 ##<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + #############################<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-pkgconfig =3D import(&#39;pkgconfig&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-pkgconfig_install_dir =3D join_paths(get_opti=
on(&#39;libdir&#39;), <br>
&gt;&gt; &#39;pkgconfig&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-pkgconfig.generate(libnethogs,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0requires: [&#39;libpcap&#39;],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0version: meson.project_version()<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++if get_option(&#39;enable-libnethogs&#39;).en=
abled()<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 pkgconfig =3D import(&#39;pkgconfig&#3=
9;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 pkgconfig_install_dir =3D join_paths(g=
et_option(&#39;libdir&#39;),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &#39;pkgconfig&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 pkgconfig.generate(libnethogs,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0requires: [&#39;libpcap&#39;],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version: meson.project_version()<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++endif<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +2.25.1<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 diff --git a/meta-oe/recipes-connectivity/netho=
gs/files/0003-meson-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 run-meson-format.patch b/meta-oe/recipes-connec=
tivity/nethogs/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 files/0003-meson-run-meson-format.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 new file mode 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 index 0000000000..9c92a9d835<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 --- /dev/null<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +++ b/meta-oe/recipes-connectivity/nethogs/file=
s/0003-meson-run-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 meson-format.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 @@ -0,0 +1,183 @@<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +From fcbde46b0082b4c571392ea9b6427f5e11941393 =
Mon Sep 17 00:00:00 <br>
&gt;&gt; 2001<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +From: Sam James &lt;<a href=3D"mailto:sam@gent=
oo.org" target=3D"_blank">sam@gentoo.org</a> &lt;mailto:<a href=3D"mailto:s=
am@gentoo.org" target=3D"_blank">sam@gentoo.org</a>&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Date: Sat, 25 Jan 2025 16:06:12 +0000<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Subject: [PATCH 3/6] meson: run `meson format`=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Upstream-Status: Backport [<a href=3D"https://=
github.com/raboof/nethogs/" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/raboof/nethogs/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 commit/fcbde46b0082b4c571392ea9b6427f5e11941393=
 &lt;<a href=3D"https://github.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 raboof/nethogs/commit/fcbde46b0082b4c571392ea9b=
6427f5e11941393&gt;]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + meson.build=C2=A0 =C2=A0 =C2=A0| 34 +++++++++=
----------<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + src/meson.build | 87 <br>
&gt;&gt; ++++++++++++++++++++++---------------------------<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + 2 files changed, 54 insertions(+), 67 deletio=
ns(-)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +diff --git a/meson.build b/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +index 8537718..eb9f16e 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--- a/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++++ b/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +@@ -2,12 +2,12 @@<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + # See COPYING for more information about lice=
nsing<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + #<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-project(&#39;nethogs&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;c&#39;, &#3=
9;cpp&#39;],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 default_options :=
 [&#39;warning_level=3D3&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;cpp_std=3Dc++14&#3=
9;],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 version : run_com=
mand(&#39;./<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 determineVersion.sh&#39;).stdout().strip(),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++project(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 &#39;nethogs&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 [&#39;c&#39;, &#39;cpp&#39;],<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 default_options: [&#39;warning_=
level=3D3&#39;, &#39;cpp_std=3Dc++14&#39;],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 version: run_command(&#39;./det=
ermineVersion.sh&#39;).stdout().strip(),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + cc =3D meson.get_compiler(&#39;cpp&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +@@ -18,17 +18,12 @@ cc =3D meson.get_compiler(=
&#39;cpp&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + projectinc =3D [include_directories(&#39;.&#3=
9;, &#39;src&#39;)]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + # flags<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-c_args =3D [<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 &#39;-DVERSION=3D&quot;&#39; + meson.p=
roject_version() + &#39;&quot;&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++c_args =3D [&#39;-DVERSION=3D&quot;&#39; + me=
son.project_version() + &#39;&quot;&#39;]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + # dependencies<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + thread_dep =3D dependency(&#39;threads&#39;, =
required: true)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + libpcap_dep =3D dependency(&#39;libpcap&#39;,=
 required: true)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-project_deps =3D [<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 thread_dep,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 libpcap_dep<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++project_deps =3D [thread_dep, libpcap_dep]<br=
>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + #############################<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + ## Code Compilation=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ##<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +@@ -39,10 +34,11 @@ subdir(&#39;src&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + ## Pkgconfig definition=C2=A0 =C2=A0 ##<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + #############################<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + if get_option(&#39;enable-libnethogs&#39;).en=
abled()<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 pkgconfig =3D import(&#39;pkgconfig&#3=
9;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 pkgconfig_install_dir =3D join_paths(g=
et_option(&#39;libdir&#39;),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &#39;pkgconfig&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 pkgconfig.generate(libnethogs,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0requires: [&#39;libpcap&#39;],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version: meson.project_version()<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 pkgconfig =3D import(&#39;pkgco=
nfig&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 pkgconfig_install_dir =3D join_=
paths(get_option(&#39;libdir&#39;),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &#39;pkgconfig&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 pkgconfig.generate(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 libnethogs,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 requires: [&#39;l=
ibpcap&#39;],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 version: meson.pr=
oject_version(),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 )<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + endif<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +diff --git a/src/meson.build b/src/meson.build=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +index 03f1b58..1329df4 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--- a/src/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++++ b/src/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +@@ -3,65 +3,56 @@<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + #<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + sources =3D [<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 files([<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 &#39;connection.cpp&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 &#39;conninode.cpp&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 &#39;decpcap.c&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 &#39;devices.cpp&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 &#39;inode2prog.cpp&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 &#39;packet.cpp&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 &#39;process.cpp&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 ])<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 files(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;connection.c=
pp&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;conninode.cp=
p&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;decpcap.c&#3=
9;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;devices.cpp&=
#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;inode2prog.c=
pp&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;packet.cpp&#=
39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;process.cpp&=
#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 ),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + ]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + # --- Executable Compilation ---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + if get_option(&#39;enable-nethogs-app&#39;).e=
nabled()<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 app_sources =3D [<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 files([<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 &#39;main.cpp&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 &#39;cui.cpp&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 ])<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 ]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 cursespp_dep =3D dependency(&#39;ncurs=
es++&#39;, required: true)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 curses_dep =3D dependency(&#39;ncurses=
&#39;, required: true)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 executable(&#39;nethogs&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 [app_sources + sources],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 include_directories: [projectin=
c],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 cpp_args: c_args,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 c_args: c_args,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 install: true,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 dependencies : [project_deps, c=
ursespp_dep, curses_dep]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 )<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 app_sources =3D [files(&#39;cui=
.cpp&#39;, &#39;main.cpp&#39;)]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 cursespp_dep =3D dependency(&#3=
9;ncurses++&#39;, required: true)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 curses_dep =3D dependency(&#39;=
ncurses&#39;, required: true)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 executable(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;nethogs&#39;=
,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 [app_sources + so=
urces],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 include_directori=
es: [projectinc],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpp_args: c_args,=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 c_args: c_args,<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 install: true,<br=
>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [pr=
oject_deps, cursespp_dep, curses_dep],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 )<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + endif<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + # --- Library Compilation ---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + if get_option(&#39;enable-libnethogs&#39;).en=
abled()<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 lib_sources =3D [<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 files([<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 &#39;libnethogs.cpp&#39;=
,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 ])<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 ]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 lib_sources =3D [files(&#39;lib=
nethogs.cpp&#39;)]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 libnethogs =3D shared_library(<=
br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;libnethogs&#=
39; ,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sources + lib_sou=
rces,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpp_args: c_args,=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 c_args: c_args,<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 install: true,<br=
>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 soversion: meson.=
project_version(),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 include_directori=
es: [projectinc],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [pr=
oject_deps],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 )<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 libnethogs =3D shared_library(&#39;lib=
nethogs&#39; ,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 sources + lib_sources,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 cpp_args: c_args,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 c_args: c_args,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 install: true,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 soversion: meson.project_versio=
n(),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 include_directories: [projectin=
c],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 dependencies: [project_deps]<br=
>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 )<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 libnethogs_dep =3D declare_dependency(=
link_with: libnethogs)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 libnethogs_dep =3D declare_depe=
ndency(link_with: libnethogs)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 # --- Header Installation ---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 # --- Header Installation ---<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 lib_headers =3D [<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 files(&#39;libnethogs.h&#39;),<=
br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 ]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 install_headers(lib_headers, subdir : =
&#39;libnethogs&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 lib_headers =3D [files(&#39;lib=
nethogs.h&#39;)]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 install_headers(lib_headers, su=
bdir: &#39;libnethogs&#39;)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + endif<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +2.25.1<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 diff --git a/meta-oe/recipes-connectivity/netho=
gs/files/0004-meson-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 fix-library-name.patch b/meta-oe/recipes-connec=
tivity/nethogs/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 files/0004-meson-fix-library-name.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 new file mode 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 index 0000000000..cc69a66748<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 --- /dev/null<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +++ b/meta-oe/recipes-connectivity/nethogs/file=
s/0004-meson-fix-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 library-name.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 @@ -0,0 +1,25 @@<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +From ba25a64dcd35f4a58c4d397160e90560e9851c79 =
Mon Sep 17 00:00:00 <br>
&gt;&gt; 2001<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +From: CAB233 &lt;<a href=3D"mailto:yidaduizuoy=
e@outlook.com" target=3D"_blank">yidaduizuoye@outlook.com</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;mailto:<a href=3D"mailto:yidaduizuoye@outlo=
ok.com" target=3D"_blank">yidaduizuoye@outlook.com</a>&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Date: Mon, 24 Feb 2025 20:06:52 +0800<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Subject: [PATCH 4/6] meson: fix library name<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Upstream-Status: Backport [<a href=3D"https://=
github.com/raboof/nethogs/" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/raboof/nethogs/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 commit/ba25a64dcd35f4a58c4d397160e90560e9851c79=
 &lt;<a href=3D"https://github.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 raboof/nethogs/commit/ba25a64dcd35f4a58c4d39716=
0e90560e9851c79&gt;]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + src/meson.build | 2 +-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + 1 file changed, 1 insertion(+), 1 deletion(-)=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +diff --git a/src/meson.build b/src/meson.build=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +index 1329df4..7f6dcba 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--- a/src/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++++ b/src/meson.build<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +@@ -39,7 +39,7 @@ if get_option(&#39;enable-li=
bnethogs&#39;).enabled()<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0lib_sources =3D [files(&#3=
9;libnethogs.cpp&#39;)]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0libnethogs =3D shared_libr=
ary(<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;libnethogs&#=
39; ,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;nethogs&#39;=
 ,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sources + li=
b_sources,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpp_args: c_=
args,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_args: c_ar=
gs,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +2.25.1<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 diff --git a/meta-oe/recipes-connectivity/netho=
gs/files/0005-Add-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 security-flags-to-LDFLAGS-for-Linux.patch b/met=
a-oe/recipes-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 connectivity/nethogs/files/0005-Add-security-fl=
ags-to-LDFLAGS-for-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Linux.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 new file mode 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 index 0000000000..553b382a66<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 --- /dev/null<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +++ b/meta-oe/recipes-connectivity/nethogs/file=
s/0005-Add-security-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 flags-to-LDFLAGS-for-Linux.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 @@ -0,0 +1,25 @@<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +From 42e7950db8e412160e3f1f74b6cbc7298714c587 =
Mon Sep 17 00:00:00 <br>
&gt;&gt; 2001<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +From: Matheus Polkorny &lt;<a href=3D"mailto:m=
polkorny@ipt.br" target=3D"_blank">mpolkorny@ipt.br</a> &lt;mailto:<a href=
=3D"mailto:mpolkorny@ipt.br" target=3D"_blank">mpolkorny@ipt.br</a>&gt;&gt;=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Date: Tue, 25 Mar 2025 00:47:04 -0300<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Subject: [PATCH 5/6] Add security flags to LDF=
LAGS for Linux<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Upstream-Status: Backport [<a href=3D"https://=
github.com/raboof/nethogs/" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/raboof/nethogs/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 commit/42e7950db8e412160e3f1f74b6cbc7298714c587=
 &lt;<a href=3D"https://github.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 raboof/nethogs/commit/42e7950db8e412160e3f1f74b=
6cbc7298714c587&gt;]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + src/MakeLib.mk | 2 +-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + 1 file changed, 1 insertion(+), 1 deletion(-)=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +diff --git a/src/MakeLib.mk b/src/MakeLib.mk<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +index 96ba694..1be0361 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--- a/src/MakeLib.mk<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++++ b/src/MakeLib.mk<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +@@ -10,7 +10,7 @@ all: $(LIBNAME) libnethogs.a=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + UNAME_S :=3D $(shell uname -s)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + ifeq ($(UNAME_S),Linux)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 LDFLAGS:=3D -shared -Wl,-soname,$(SO_N=
AME)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 LDFLAGS:=3D -shared -Wl,-soname,$(SO_N=
AME) -Wl,-z,now -Wl,-z,relro<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + else ifeq ($(UNAME_S),FreeBSD)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0LDFLAGS:=3D -shared -Wl,-soname,$=
(SO_NAME)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + else<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +2.25.1<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 diff --git a/meta-oe/recipes-connectivity/netho=
gs/files/0006-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Include-CPPFLAGS-for-devices.cpp-and-libnethogs=
.cpp.patch b/meta-oe/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 recipes-connectivity/nethogs/files/0006-Include=
-CPPFLAGS-for-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 devices.cpp-and-libnethogs.cpp.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 new file mode 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 index 0000000000..485d476c50<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 --- /dev/null<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +++ b/meta-oe/recipes-connectivity/nethogs/file=
s/0006-Include-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.pat=
ch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 @@ -0,0 +1,30 @@<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +From 1407f83485c31cd6f29614402bb2a3e912a3dd34 =
Mon Sep 17 00:00:00 <br>
&gt;&gt; 2001<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +From: Matheus Polkorny &lt;<a href=3D"mailto:m=
polkorny@ipt.br" target=3D"_blank">mpolkorny@ipt.br</a> &lt;mailto:<a href=
=3D"mailto:mpolkorny@ipt.br" target=3D"_blank">mpolkorny@ipt.br</a>&gt;&gt;=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Date: Tue, 25 Mar 2025 00:48:20 -0300<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Subject: [PATCH 6/6] Include $(CPPFLAGS) for d=
evices.cpp and<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 libnethogs.cpp<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +Upstream-Status: Backport [<a href=3D"https://=
github.com/raboof/nethogs/" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/raboof/nethogs/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 commit/1407f83485c31cd6f29614402bb2a3e912a3dd34=
 &lt;<a href=3D"https://github.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 raboof/nethogs/commit/1407f83485c31cd6f29614402=
bb2a3e912a3dd34&gt;]<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + src/MakeLib.mk | 4 ++--<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + 1 file changed, 2 insertions(+), 2 deletions(=
-)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +diff --git a/src/MakeLib.mk b/src/MakeLib.mk<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +index 1be0361..513096e 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--- a/src/MakeLib.mk<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++++ b/src/MakeLib.mk<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +@@ -97,11 +97,11 @@ $(ODIR)/conninode.o: conni=
node.cpp nethogs.h<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 conninode.h<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + $(ODIR)/devices.o: devices.cpp devices.h<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0@mkdir -p $(ODIR)<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CXXFLAGS) -o $@=
 -c devices.cpp<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CPPFLAGS) $(CXX=
FLAGS) -o $@ -c devices.cpp<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + $(ODIR)/libnethogs.o: libnethogs.cpp libnetho=
gs.h<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0@mkdir -p $(ODIR)<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CXXFLAGS) -o $@=
 -c libnethogs.cpp -<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 DVERSION=3D\&quot;$(LIBVERSION)\&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CPPFLAGS) $(CXX=
FLAGS) -o $@ -c libnethogs.cpp -<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 DVERSION=3D\&quot;$(LIBVERSION)\&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + .PHONY: clean<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + clean:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +--<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +2.25.1<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 diff --git a/meta-oe/recipes-connectivity/netho=
gs/<a href=3D"http://nethogs_git.bb" rel=3D"noreferrer" target=3D"_blank">n=
ethogs_git.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://nethogs_git.bb" rel=3D"no=
referrer" target=3D"_blank">http://nethogs_git.bb</a>&gt; b/meta-oe/recipes=
-connectivity/nethogs/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 <a href=3D"http://nethogs_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">nethogs_git.bb</a> &lt;<a href=3D"http://nethogs_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">http://nethogs_git.bb</a>&gt;<br=
>
&gt;&gt; =C2=A0=C2=A0=C2=A0 new file mode 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 index 0000000000..816cd9c542<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 --- /dev/null<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +++ b/meta-oe/recipes-connectivity/nethogs/<a h=
ref=3D"http://nethogs_git.bb" rel=3D"noreferrer" target=3D"_blank">nethogs_=
git.bb</a> &lt;http://<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 <a href=3D"http://nethogs_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">nethogs_git.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 @@ -0,0 +1,21 @@<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +SUMMARY =3D &quot;NetHogs is a small &#39;net =
top&#39; tool that can group<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 bandwidth by process&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +HOMEPAGE =3D &quot;<a href=3D"https://github.c=
om/raboof/nethogs" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
raboof/nethogs</a> &lt;<a href=3D"https://github.com/" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 raboof/nethogs&gt;&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +SECTION =3D &quot;console/network&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +LIC_FILES_CHKSUM =3D &quot;file://<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
&lt;file://<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263&=
gt;&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +SRC_URI =3D &quot;git://<a href=3D"http://gith=
ub.com/raboof/" rel=3D"noreferrer" target=3D"_blank">github.com/raboof/</a>=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 nethogs.git;branch=3Dmain;protocol=3Dhttps &lt;=
<a href=3D"http://github.com/raboof/" rel=3D"noreferrer" target=3D"_blank">=
http://github.com/raboof/</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 nethogs.git;branch=3Dmain;protocol=3Dhttps&gt; =
\<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + file://0001-meson-cleanup-version-detection.p=
atch &lt;file://0001-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 meson-cleanup-version-detection.patch&gt; \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + file://0002-meson-fix-build-with-libnethogs-d=
isabled.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;file://0002-meson-fix-build-with-libnethogs=
-disabled.patch&gt; \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + file://0003-meson-run-meson-format.patch &lt;=
file://0003-meson-run-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 meson-format.patch&gt; \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + file://0004-meson-fix-library-name.patch &lt;=
file://0004-meson-fix-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 library-name.patch&gt; \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + file://0005-Add-security-flags-to-LDFLAGS-for=
-Linux.patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;file://0005-Add-security-flags-to-LDFLAGS-f=
or-Linux.patch&gt; \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 + file://0006-Include-CPPFLAGS-for-devices.cpp-=
and-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 libnethogs.cpp.patch &lt;file://0006-Include-CP=
PFLAGS-for-devices.cpp-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 and-libnethogs.cpp.patch&gt; \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +DEPENDS =3D &quot;ncurses libpcap&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +inherit meson pkgconfig<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +SRCREV =3D &quot;632a78846eb3cc3259dc45c59a47f=
a9c293a2831&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +PV =3D &quot;0.8.8+git&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 -- =C2=A0=C2=A0=C2=A0 2.25.1<br>
&gt;&gt;<br>
<br>
</blockquote></div>

--000000000000fc825406434199be--

