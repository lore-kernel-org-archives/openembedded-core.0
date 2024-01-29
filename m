Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782A3C47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 12:11:36 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.12975.1706530293307267535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 04:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=DZ14x0oO;
 spf=pass (domain: madison.systems, ip: 209.85.208.41, mailfrom: matt@madison.systems)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-557dcb0f870so2529286a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 04:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google; t=1706530291; x=1707135091; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IZLFm5qDqS10hU2sZWLaHHzq6lCNS6aQy0RRZeU1gpU=;
        b=DZ14x0oOb5BW+qsFGVe3timJDQnMMjZi1AWPGUo+XfE11YzDATJ3NNBldJUwlWcJu2
         nlpGXb9W6n6+RR7+2Mp3c2THHx6nfVyc4WuE7h9m095iRf4ejAKYSGQHW1LGRn0lkA3N
         dy3w2H2ScPIVK9Ths0tDLUzkozWuTUlQvxwEUcI2nR8xIFKe7gCQYHwIMGMs0poQifLh
         giC0BLipxqmZeQ5D82QrHm6oyH94RQrjI5eMCQ/N8FbK+BtfHX2zmD66GZONXsZ0nMs2
         ijiJeXAeGAax1yAHalde8oll2khv0SseOF8HDnrhSrDZ/8+W7m+WjTIDBzOWCgmMEr4T
         Ah+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706530291; x=1707135091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZLFm5qDqS10hU2sZWLaHHzq6lCNS6aQy0RRZeU1gpU=;
        b=vEg3/UKDA2K5zxIvXaR1E9vp1HAmdF5GeidwdTE3vkkjRwoQqt40xB+E0++4s7GrtY
         fEs1LXgrq2ZexspsOQYvCuegZvzj0dl/wj4qLldLXxERNeYxlYYU7jWOGCoXC9jo8lzZ
         MAF3RHdQDVKypH81n4fsWGJaYw4kMzl6rKgx+KzLgUEMBy+KCJBd+hkzA9ch2AwxSZPW
         GV88ghN9htQabprROCrMXVivDJE2Zo/jk+P24Fo4Qov2qdLNtIgeA1IuuT1MURWDvwut
         YSgR+TbSYXxrP6VoMIlzmLJ6kyIa15011EfCant6delZH/8MpqbrI8I9PZ+hLOkF7S+M
         StDQ==
X-Gm-Message-State: AOJu0Yyqn96+ITzWzPcxpNqsDDVgd/TqfHjmM56Fd5PwGau3qkZWpUXM
	/AYgwxXKCIcC7bfKX3ckoG03XUPzsCyjsmV3ujpX9oPaMLdaAHM1V7ZMcQJI/y5u3BtPZ3d2hIl
	7utE/c5LVE53wxpAeZwyvWI4UvarnJRbTJ8GH9w==
X-Google-Smtp-Source: AGHT+IH0wgijr7CnbPuSAYOV9dZ7osXDQ0Gidw0ncy0pJCU13/piTTxkTFN+4RxBZFB3w3S9tmWDYxQQJB+dtmnlL/0=
X-Received: by 2002:a17:906:d923:b0:a35:b73b:e626 with SMTP id
 rn3-20020a170906d92300b00a35b73be626mr1695820ejb.73.1706530290844; Mon, 29
 Jan 2024 04:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20240126133455.2609378-1-alex@linutronix.de> <20240126133455.2609378-8-alex@linutronix.de>
 <CAMKF1sqYkSORQc+o3pfDzbuFKeVHcsG2i0904ppXMpSU8jm_TQ@mail.gmail.com>
 <17AE983A55179990.23935@lists.openembedded.org> <CANNYZj9x7T50-8AqBH2ofqkEti3J5776THMZaOau_aCmHtvwpQ@mail.gmail.com>
In-Reply-To: <CANNYZj9x7T50-8AqBH2ofqkEti3J5776THMZaOau_aCmHtvwpQ@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Mon, 29 Jan 2024 04:11:19 -0800
Message-ID: <CAGgRHJp3FNORVSgfJf4ebejZoR7tUFMrryO8DSkNvAaY=eEAsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/8] rpm: update 4.18.1 -> 4.19.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000c8d3c90610148bdd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 12:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194458

--000000000000c8d3c90610148bdd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I ran across a different failure due to the rpm upgrade, which I've traced
to this change:

https://github.com/rpm-software-management/rpm/commit/162110aadad445cc248a6=
8dc4c840fe05b79d00f

This is enabling 64-bit filesystem calls in the rpm-native build, causing
it to use statvfs64() instead of statvfs().  Pseudo doesn't handle
statvfs64(), so when rpm checks available disk space, it's looking at the
host system's rootfs instead of the disk where the build is happening.  I'm
not sure whether pseudo needs an update, or whether the hard-coded define
added by the above-mentioned commit should be turned off for -native builds=
.

Regards,
-Matt

On Mon, Jan 29, 2024 at 3:57=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> I sent a patch.
>
> Alex
>
> On Sun, 28 Jan 2024 at 20:04, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> >      0257:                file =3D file.replace("%", "%%%%%%%%")
> >  *** 0258:                attr =3D get_attr(file)
> > ...
> >  *** 0203:                stat_f =3D os.stat(rootpath + "/" + path,
> > follow_symlinks=3DFalse)
> >
> > Exception: FileNotFoundError: [Errno 2] No such file or directory:
> >
> '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-=
linux/nodejs/20.8.1/packages-split/nodejs-ptest/usr/lib/nodejs/ptest/test/f=
ixtures/es-modules/test-esm-double-encoding-native%%%%%%%%20.mjs'
> >
> > Seems like 257 and 258 should be swapped. No idea what that %
> > replacement is for.
> >
> > Alex
> >
> > On Sun, 28 Jan 2024 at 17:54, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > I am seeing some failures in meta-oe ( especially nodejs ) which I
> > > suspect are due to rpm upgrade and patches around it.
> > >
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3566/st=
eps/15/logs/stdio
> > >
> > > On Fri, Jan 26, 2024 at 5:35=E2=80=AFAM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > Upstream has replaced autoconf with cmake, which necessitates a
> rewrite of the
> > > > recipe and available options, and a rebase to cmake of
> > > > 0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> > > >
> > > > Correct a mistake in 0001-Do-not-read-config-files-from-HOME.patch =
:
> > > > the patch was removing the NULL marker at the end of function
> arguments,
> > > > and 0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
> > > > was restoring it (in addition to the actual change the patch was
> making).
> > > > Now both patches preserve the NULL terminator.
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > ---
> > > >  ...olor-setting-for-mips64_n32-binaries.patch | 12 +--
> > > >  ...ook-for-lua-with-pkg-config-rather-t.patch | 28 +++++++
> > > >  ...estore-readline-support-as-an-explic.patch | 42 +++++++++++
> > > >  ...satisfiable-dependency-when-building.patch | 12 +--
> > > >  ...lib-rpm-as-the-installation-path-for.patch | 52 +++++--------
> > > >  ...1-Do-not-read-config-files-from-HOME.patch | 19 ++---
> > > >  ...-PATH-environment-variable-before-ru.patch | 12 +--
> > > >  ...lename-before-passing-it-to-basename.patch | 40 ----------
> > > >  ...ix-missing-basename-include-on-macOS.patch | 26 -------
> > > >  ...l-dependency-on-non-POSIX-GLOB_ONLYD.patch | 56 ++++++++++++++
> > > >  ...lling-execute-package-scriptlets-wit.patch | 24 ++----
> > > >  ...not-insert-payloadflags-into-.rpm-me.patch | 13 ++--
> > > >  ...-linux-gnux32-variant-to-triplet-han.patch | 28 -------
> > > >  ....c-fix-file-conflicts-for-MIPS64-N32.patch | 13 ++--
> > > >  .../files/0001-perl-disable-auto-reqs.patch   | 26 ++++---
> > > >  ...y_hash_t-instead-of-long-in-hdr_hash.patch | 35 ---------
> > > >  ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 31 ++++----
> > > >  ...txt-do-not-install-non-existent-docs.patch | 26 +++++++
> > > >  ...avoid-using-GLOB_BRACE-if-undefined-.patch | 34 +++++++++
> > > >  ...ge-logging-level-around-scriptlets-t.patch | 19 ++---
> > > >  ...87cfcf9cac87e5bc5e7db79b0338da9e355e.patch | 51 -------------
> > > >  .../rpm/files/fix-declaration.patch           | 39 ----------
> > > >  .../rpm/{rpm_4.18.1.bb =3D> rpm_4.19.1.bb}      | 73
> ++++++++-----------
> > > >  23 files changed, 328 insertions(+), 383 deletions(-)
> > > >  create mode 100644
> meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-with-pkg=
-config-rather-t.patch
> > > >  create mode 100644
> meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-supp=
ort-as-an-explic.patch
> > > >  delete mode 100644
> meta/recipes-devtools/rpm/files/0001-Duplicate-filename-before-passing-it=
-to-basename.patch
> > > >  delete mode 100644
> meta/recipes-devtools/rpm/files/0001-Fix-missing-basename-include-on-macO=
S.patch
> > > >  create mode 100644
> meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-non-=
POSIX-GLOB_ONLYD.patch
> > > >  delete mode 100644
> meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-varian=
t-to-triplet-han.patch
> > > >  delete mode 100644
> meta/recipes-devtools/rpm/files/0001-python-Use-Py_hash_t-instead-of-long=
-in-hdr_hash.patch
> > > >  create mode 100644
> meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install-n=
on-existent-docs.patch
> > > >  create mode 100644
> meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRA=
CE-if-undefined-.patch
> > > >  delete mode 100644
> meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.=
patch
> > > >  delete mode 100644
> meta/recipes-devtools/rpm/files/fix-declaration.patch
> > > >  rename meta/recipes-devtools/rpm/{rpm_4.18.1.bb =3D> rpm_4.19.1.bb=
}
> (72%)
> > > >
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32=
-binaries.patch
> b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32=
-binaries.patch
> > > > index 9fa486dfd3c..96fe57dfeb8 100644
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32=
-binaries.patch
> > > > +++
> b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32=
-binaries.patch
> > > > @@ -1,4 +1,4 @@
> > > > -From 93f219df68f3741ff63a294a16bcbe8deba1112f Mon Sep 17 00:00:00
> 2001
> > > > +From ecc45e3ae837ab50603088dcc8fd2f8e67a7ece6 Mon Sep 17 00:00:00
> 2001
> > > >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > >  Date: Thu, 9 Mar 2017 18:54:02 +0200
> > > >  Subject: [PATCH] Add a color setting for mips64_n32 binaries
> > > > @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> > > >   2 files changed, 6 insertions(+)
> > > >
> > > >  diff --git a/build/rpmfc.c b/build/rpmfc.c
> > > > -index 26606378f..a16e3f4e9 100644
> > > > +index 4b67a9bae..ed7e4e623 100644
> > > >  --- a/build/rpmfc.c
> > > >  +++ b/build/rpmfc.c
> > > > -@@ -646,6 +646,7 @@ exit:
> > > > +@@ -660,6 +660,7 @@ exit:
> > > >   static const struct rpmfcTokens_s rpmfcTokens[] =3D {
> > > >     { "directory",              RPMFC_INCLUDE },
> > > >
> > > > @@ -23,7 +23,7 @@ index 26606378f..a16e3f4e9 100644
> > > >     { "ELF 32-bit",             RPMFC_ELF32|RPMFC_INCLUDE },
> > > >     { "ELF 64-bit",             RPMFC_ELF64|RPMFC_INCLUDE },
> > > >
> > > > -@@ -1151,6 +1152,9 @@ static uint32_t getElfColor(const char *fn)
> > > > +@@ -1158,6 +1159,9 @@ static uint32_t getElfColor(const char *fn)
> > > >                 color =3D RPMFC_ELF32;
> > > >                 break;
> > > >             }
> > > > @@ -34,10 +34,10 @@ index 26606378f..a16e3f4e9 100644
> > > >         if (elf)
> > > >             elf_end(elf);
> > > >  diff --git a/rpmrc.in b/rpmrc.in
> > > > -index 2975a3a0e..c7232b48b 100644
> > > > +index 8646a966b..7349fdfd3 100644
> > > >  --- a/rpmrc.in
> > > >  +++ b/rpmrc.in
> > > > -@@ -139,6 +139,8 @@ archcolor: mipsr6el 1
> > > > +@@ -142,6 +142,8 @@ archcolor: mipsr6el 1
> > > >   archcolor: mips64r6 2
> > > >   archcolor: mips64r6el 2
> > > >
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-with-p=
kg-config-rather-t.patch
> b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-with-p=
kg-config-rather-t.patch
> > > > new file mode 100644
> > > > index 00000000000..5053caae33f
> > > > --- /dev/null
> > > > +++
> b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-with-p=
kg-config-rather-t.patch
> > > > @@ -0,0 +1,28 @@
> > > > +From ca4655f36c3c7883eb50381902890b23f0e8aaab Mon Sep 17 00:00:00
> 2001
> > > > +From: Alexander Kanavin <alex@linutronix.de>
> > > > +Date: Wed, 29 Nov 2023 14:06:15 +0100
> > > > +Subject: [PATCH] CMakeLists.txt: look for lua with pkg-config
> rather than
> > > > + cmake modules
> > > > +
> > > > +Otherwise cmake will try to find libm, badly, and fail.
> > > > +
> > > > +Upstream-Status: Inappropriate [oe-core specific]
> > > > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > +
> > > > +---
> > > > + CMakeLists.txt | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > > +index 7f0630453..d0ea565f3 100644
> > > > +--- a/CMakeLists.txt
> > > > ++++ b/CMakeLists.txt
> > > > +@@ -187,7 +187,7 @@ set(REQFUNCS
> > > > + )
> > > > +
> > > > + find_package(PkgConfig REQUIRED)
> > > > +-find_package(Lua 5.2 REQUIRED)
> > > > ++pkg_check_modules(LUA REQUIRED IMPORTED_TARGET lua>=3D5.2)
> > > > + find_package(ZLIB REQUIRED)
> > > > + find_package(BZip2)
> > > > + find_package(Iconv)
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-su=
pport-as-an-explic.patch
> b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-su=
pport-as-an-explic.patch
> > > > new file mode 100644
> > > > index 00000000000..db83b176b41
> > > > --- /dev/null
> > > > +++
> b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-su=
pport-as-an-explic.patch
> > > > @@ -0,0 +1,42 @@
> > > > +From 3c2e529c6cc1bae4bc94cbed7358c6e0cdd2de02 Mon Sep 17 00:00:00
> 2001
> > > > +From: Alexander Kanavin <alex@linutronix.de>
> > > > +Date: Tue, 16 Jan 2024 13:43:36 +0100
> > > > +Subject: [PATCH] CMakeLists.txt: restore readline support as an
> explicit
> > > > + option
> > > > +
> > > > +This was lost in autotools -> cmake transition. The particular
> > > > +reason to make it explicit is that readline is gpl version 3
> > > > +licensed, and in some builds components under that license
> > > > +need to be excluded.
> > > > +
> > > > +Upstream-Status: Submitted [
> https://github.com/rpm-software-management/rpm/pull/2852]
> > > > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > +---
> > > > + CMakeLists.txt | 7 ++++++-
> > > > + 1 file changed, 6 insertions(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > > +index 0a474106e..89e27417f 100644
> > > > +--- a/CMakeLists.txt
> > > > ++++ b/CMakeLists.txt
> > > > +@@ -31,6 +31,7 @@ option(WITH_AUDIT "Build with audit support" ON)
> > > > + option(WITH_FSVERITY "Build with fsverity support" OFF)
> > > > + option(WITH_IMAEVM "Build with IMA support" OFF)
> > > > + option(WITH_FAPOLICYD "Build with fapolicyd support" ON)
> > > > ++option(WITH_READLINE "Build with readline support" ON)
> > > > +
> > > > + set(RPM_CONFIGDIR
> "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/rpm" CACHE PATH "rpm hom=
e")
> > > > + set(RPM_VENDOR "vendor" CACHE STRING "rpm vendor string")
> > > > +@@ -193,7 +194,11 @@ find_package(BZip2)
> > > > + find_package(Iconv)
> > > > +
> > > > + pkg_check_modules(POPT REQUIRED IMPORTED_TARGET popt)
> > > > +-pkg_check_modules(READLINE IMPORTED_TARGET readline)
> > > > ++
> > > > ++if (WITH_READLINE)
> > > > ++    pkg_check_modules(READLINE REQUIRED IMPORTED_TARGET readline)
> > > > ++endif()
> > > > ++
> > > > + pkg_check_modules(ZSTD IMPORTED_TARGET libzstd>=3D1.3.8)
> > > > + pkg_check_modules(LIBELF IMPORTED_TARGET libelf)
> > > > + pkg_check_modules(LIBDW IMPORTED_TARGET libdw)
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-depend=
ency-when-building.patch
> b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-depend=
ency-when-building.patch
> > > > index 8440c3516d6..df5543873c1 100644
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-depend=
ency-when-building.patch
> > > > +++
> b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-depend=
ency-when-building.patch
> > > > @@ -1,4 +1,4 @@
> > > > -From f39c28eb52f12ae6e82db360ffd5a903ac8faca5 Mon Sep 17 00:00:00
> 2001
> > > > +From d77429bf20d138ec8ce577c0080cae1f1bc2aa6f Mon Sep 17 00:00:00
> 2001
> > > >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > >  Date: Mon, 9 Jan 2017 18:52:11 +0200
> > > >  Subject: [PATCH] Do not add an unsatisfiable dependency when
> building rpms in
> > > > @@ -14,11 +14,11 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> > > >   build/pack.c | 4 ----
> > > >   1 file changed, 4 deletions(-)
> > > >
> > > > -Index: git/build/pack.c
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ---- git.orig/build/pack.c
> > > > -+++ git/build/pack.c
> > > > -@@ -709,10 +709,6 @@ static rpmRC packageBinary(rpmSpec spec,
> > > > +diff --git a/build/pack.c b/build/pack.c
> > > > +index f7dac6d9a..f382c7da0 100644
> > > > +--- a/build/pack.c
> > > > ++++ b/build/pack.c
> > > > +@@ -711,10 +711,6 @@ static rpmRC packageBinary(rpmSpec spec,
> Package pkg, const char *cookie, int ch
> > > >         headerPutBin(pkg->header, RPMTAG_SOURCEPKGID,
> spec->sourcePkgId,16);
> > > >       }
> > > >
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-ins=
tallation-path-for.patch
> b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-ins=
tallation-path-for.patch
> > > > index 8fdc5edb10b..b056d19741a 100644
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-ins=
tallation-path-for.patch
> > > > +++
> b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-ins=
tallation-path-for.patch
> > > > @@ -1,4 +1,4 @@
> > > > -From 5fc560aaf1184d35d161f7d50dbb6323c90cc02d Mon Sep 17 00:00:00
> 2001
> > > > +From 7948f21e08bc7552b281ed0098a9c8099d2370cb Mon Sep 17 00:00:00
> 2001
> > > >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > >  Date: Mon, 27 Feb 2017 09:43:30 +0200
> > > >  Subject: [PATCH] Do not hardcode "lib/rpm" as the installation pat=
h
> for
> > > > @@ -8,29 +8,28 @@ Upstream-Status: Denied [
> https://github.com/rpm-software-management/rpm/pull/263
> > > >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > >
> > > >  ---
> > > > - configure.ac | 2 +-
> > > > - macros.in    | 2 +-
> > > > - rpm.am       | 4 ++--
> > > > - 3 files changed, 4 insertions(+), 4 deletions(-)
> > > > + CMakeLists.txt | 2 +-
> > > > + macros.in      | 2 +-
> > > > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > -diff --git a/configure.ac b/configure.ac
> > > > -index e6676c581..ec28db9b6 100644
> > > > ---- a/configure.ac
> > > > -+++ b/configure.ac
> > > > -@@ -942,7 +942,7 @@ else
> > > > -     usrprefix=3D$prefix
> > > > - fi
> > > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > > +index 2767915fb..7f0630453 100644
> > > > +--- a/CMakeLists.txt
> > > > ++++ b/CMakeLists.txt
> > > > +@@ -32,7 +32,7 @@ option(WITH_FSVERITY "Build with fsverity
> support" OFF)
> > > > + option(WITH_IMAEVM "Build with IMA support" OFF)
> > > > + option(WITH_FAPOLICYD "Build with fapolicyd support" ON)
> > > >
> > > > --RPMCONFIGDIR=3D"`echo ${usrprefix}/lib/rpm`"
> > > > -+RPMCONFIGDIR=3D"`echo ${libdir}/rpm`"
> > > > - AC_SUBST(RPMCONFIGDIR)
> > > > +-set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/lib/rpm" CACHE PATH
> "rpm home")
> > > > ++set(RPM_CONFIGDIR
> "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/rpm" CACHE PATH "rpm hom=
e")
> > > > + set(RPM_VENDOR "vendor" CACHE STRING "rpm vendor string")
> > > >
> > > > - AC_SUBST(OBJDUMP)
> > > > + # Emulate libtool versioning. Before a public release:
> > > >  diff --git a/macros.in b/macros.in
> > > > -index a2411d784..735b74d99 100644
> > > > +index b49ffaad4..3acbe78f6 100644
> > > >  --- a/macros.in
> > > >  +++ b/macros.in
> > > > -@@ -930,7 +930,7 @@ package or when debugging this package.\
> > > > +@@ -969,7 +969,7 @@ Supplements:   (%{name} =3D %{version}-%{relea=
se}
> and langpacks-%{1})\
> > > >   %_sharedstatedir      %{_prefix}/com
> > > >   %_localstatedir               %{_prefix}/var
> > > >   %_lib                 lib
> > > > @@ -39,20 +38,3 @@ index a2411d784..735b74d99 100644
> > > >   %_includedir          %{_prefix}/include
> > > >   %_infodir             %{_datadir}/info
> > > >   %_mandir              %{_datadir}/man
> > > > -diff --git a/rpm.am b/rpm.am
> > > > -index 55b5b3935..5a51f102b 100644
> > > > ---- a/rpm.am
> > > > -+++ b/rpm.am
> > > > -@@ -1,10 +1,10 @@
> > > > - # Internal binaries
> > > > - ## HACK: It probably should be $(libexecdir)/rpm or $(libdir)/rpm
> > > > --rpmlibexecdir =3D $(prefix)/lib/rpm
> > > > -+rpmlibexecdir =3D $(libdir)/rpm
> > > > -
> > > > - # Host independent config files
> > > > - ## HACK: it probably should be $(datadir)/rpm
> > > > --rpmconfigdir =3D $(prefix)/lib/rpm
> > > > -+rpmconfigdir =3D $(libdir)/rpm
> > > > -
> > > > - # Libtool version (current-revision-age) for all our libraries
> > > > - rpm_version_info =3D 13:0:4
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME=
.patch
> b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME=
.patch
> > > > index fda64eefe01..6a18679da2f 100644
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME=
.patch
> > > > +++
> b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME=
.patch
> > > > @@ -1,35 +1,36 @@
> > > > -From 35381b6cd6c1b571bf7e6b0640de0f54dbf94386 Mon Sep 17 00:00:00
> 2001
> > > > +From 4f34994d9ad38d96976578a9d1a006f72e5aca50 Mon Sep 17 00:00:00
> 2001
> > > >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > >  Date: Tue, 10 Jan 2017 14:11:30 +0200
> > > >  Subject: [PATCH] Do not read config files from $HOME
> > > >
> > > >  Upstream-Status: Inappropriate [oe-core specific]
> > > >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > +
> > > >  ---
> > > >   lib/rpmrc.c | 6 ++----
> > > >   1 file changed, 2 insertions(+), 4 deletions(-)
> > > >
> > > > -Index: git/lib/rpmrc.c
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ---- git.orig/lib/rpmrc.c
> > > > -+++ git/lib/rpmrc.c
> > > > +diff --git a/lib/rpmrc.c b/lib/rpmrc.c
> > > > +index 269d490ac..f39dcfc11 100644
> > > > +--- a/lib/rpmrc.c
> > > > ++++ b/lib/rpmrc.c
> > > >  @@ -458,8 +458,7 @@ static void setDefaults(void)
> > > >       if (!defrcfiles) {
> > > >         defrcfiles =3D rstrscat(NULL, confdir, "/rpmrc", ":",
> > > > -                               confdir, "/" RPMCANONVENDOR
> "/rpmrc", ":",
> > > > +                               confdir, "/" RPM_VENDOR "/rpmrc",
> ":",
> > > >  -                              SYSCONFDIR "/rpmrc", ":",
> > > >  -                              "~/.rpmrc", NULL);
> > > > -+                              SYSCONFDIR "/rpmrc", ":");
> > > > ++                              SYSCONFDIR "/rpmrc", NULL);
> > > >       }
> > > >
> > > >   #ifndef MACROFILES
> > > >  @@ -471,8 +470,7 @@ static void setDefaults(void)
> > > > -                               confdir, "/" RPMCANONVENDOR
> "/macros", ":",
> > > > +                               confdir, "/" RPM_VENDOR "/macros",
> ":",
> > > >                                 SYSCONFDIR "/rpm/macros.*", ":",
> > > >                                 SYSCONFDIR "/rpm/macros", ":",
> > > >  -                              SYSCONFDIR "/rpm/%{_target}/macros"=
,
> ":",
> > > >  -                              "~/.rpmmacros", NULL);
> > > > -+                              SYSCONFDIR "/rpm/%{_target}/macros"=
,
> ":");
> > > > ++                              SYSCONFDIR "/rpm/%{_target}/macros"=
,
> NULL);
> > > >       }
> > > >   #else
> > > >       macrofiles =3D MACROFILES;
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-=
variable-before-ru.patch
> b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-=
variable-before-ru.patch
> > > > index ae24b663aae..318f65ed375 100644
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-=
variable-before-ru.patch
> > > > +++
> b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-=
variable-before-ru.patch
> > > > @@ -1,4 +1,4 @@
> > > > -From a674b9cc7af448d7c6748bc163bf37dc14a57f09 Mon Sep 17 00:00:00
> 2001
> > > > +From 25beba1efc31901a3bb0b1b6f0604d6583dc0513 Mon Sep 17 00:00:00
> 2001
> > > >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > >  Date: Fri, 20 Jan 2017 13:32:06 +0200
> > > >  Subject: [PATCH] Do not reset the PATH environment variable before
> running
> > > > @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> > > >   lib/rpmscript.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > -Index: git/lib/rpmscript.c
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ---- git.orig/lib/rpmscript.c
> > > > -+++ git/lib/rpmscript.c
> > > > -@@ -231,7 +231,7 @@ static void doScriptExec(ARGV_const_t ar
> > > > +diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> > > > +index 36e37cf77..37ada014c 100644
> > > > +--- a/lib/rpmscript.c
> > > > ++++ b/lib/rpmscript.c
> > > > +@@ -252,7 +252,7 @@ static void doScriptExec(ARGV_const_t argv,
> ARGV_const_t prefixes,
> > > >         if (ipath && ipath[5] !=3D '%')
> > > >             path =3D ipath;
> > > >
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Duplicate-filename-before-passing-=
it-to-basename.patch
> b/meta/recipes-devtools/rpm/files/0001-Duplicate-filename-before-passing-=
it-to-basename.patch
> > > > deleted file mode 100644
> > > > index f9b809d1676..00000000000
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-Duplicate-filename-before-passing-=
it-to-basename.patch
> > > > +++ /dev/null
> > > > @@ -1,40 +0,0 @@
> > > > -From 3fa2ae78db9b31edb4c22f3b5cd36c6c972947f1 Mon Sep 17 00:00:00
> 2001
> > > > -From: Florian Festi <ffesti@redhat.com>
> > > > -Date: Wed, 26 Jul 2023 15:01:35 +0200
> > > > -Subject: [PATCH] Duplicate filename before passing it to basename
> > > > -
> > > > -basename is allowed change the string passed to it. While we don't
> need
> > > > -the filename after that just casting away the const seems a bit to=
o
> > > > -hacky.
> > > > -
> > > > -Upstream-Status: Backport [
> https://github.com/rpm-software-management/rpm/commit/3fa2ae78db9b31edb4c=
22f3b5cd36c6c972947f1
> ]
> > > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ----
> > > > - tools/rpmuncompress.c | 4 +++-
> > > > - 1 file changed, 3 insertions(+), 1 deletion(-)
> > > > -
> > > > -diff --git a/tools/rpmuncompress.c b/tools/rpmuncompress.c
> > > > -index 58ddf5683..e13cc6a66 100644
> > > > ---- a/tools/rpmuncompress.c
> > > > -+++ b/tools/rpmuncompress.c
> > > > -@@ -98,7 +98,8 @@ static char *doUntar(const char *fn)
> > > > -       if (needtar) {
> > > > -           rasprintf(&buf, "%s '%s' | %s %s -", zipper, fn, tar,
> taropts);
> > > > -       } else if (at->compressed =3D=3D COMPRESSED_GEM) {
> > > > --          const char *bn =3D basename(fn);
> > > > -+          char *tmp =3D xstrdup(fn);
> > > > -+          const char *bn =3D basename(tmp);
> > > > -           size_t nvlen =3D strlen(bn) - 3;
> > > > -           char *gem =3D rpmGetPath("%{__gem}", NULL);
> > > > -           char *gemspec =3D NULL;
> > > > -@@ -112,6 +113,7 @@ static char *doUntar(const char *fn)
> > > > -
> > > > -           free(gemspec);
> > > > -           free(gem);
> > > > -+          free(tmp);
> > > > -       } else {
> > > > -           rasprintf(&buf, "%s '%s'", zipper, fn);
> > > > -       }
> > > > ---
> > > > -2.43.0
> > > > -
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Fix-missing-basename-include-on-ma=
cOS.patch
> b/meta/recipes-devtools/rpm/files/0001-Fix-missing-basename-include-on-ma=
cOS.patch
> > > > deleted file mode 100644
> > > > index a93597a8352..00000000000
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-Fix-missing-basename-include-on-ma=
cOS.patch
> > > > +++ /dev/null
> > > > @@ -1,26 +0,0 @@
> > > > -From b2e67642fd8cb64d8cb1cca9e759396c1c10807d Mon Sep 17 00:00:00
> 2001
> > > > -From: Calvin Buckley <calvin@cmpct.info>
> > > > -Date: Tue, 11 Jul 2023 19:22:41 -0300
> > > > -Subject: [PATCH] Fix missing basename include on macOS
> > > > -
> > > > -Upstream-Status: Backport [
> https://github.com/rpm-software-management/rpm/commit/b2e67642fd8cb64d8cb=
1cca9e759396c1c10807d
> ]
> > > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ----
> > > > - tools/rpmuncompress.c | 1 +
> > > > - 1 file changed, 1 insertion(+)
> > > > -
> > > > -diff --git a/tools/rpmuncompress.c b/tools/rpmuncompress.c
> > > > -index bd4146d54..58ddf5683 100644
> > > > ---- a/tools/rpmuncompress.c
> > > > -+++ b/tools/rpmuncompress.c
> > > > -@@ -1,6 +1,7 @@
> > > > - #include "system.h"
> > > > -
> > > > - #include <popt.h>
> > > > -+#include <libgen.h>
> > > > - #include <errno.h>
> > > > - #include <stdio.h>
> > > > - #include <string.h>
> > > > ---
> > > > -2.43.0
> > > > -
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-no=
n-POSIX-GLOB_ONLYD.patch
> b/meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-no=
n-POSIX-GLOB_ONLYD.patch
> > > > new file mode 100644
> > > > index 00000000000..8e73e077049
> > > > --- /dev/null
> > > > +++
> b/meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-no=
n-POSIX-GLOB_ONLYD.patch
> > > > @@ -0,0 +1,56 @@
> > > > +From 1b3a182f38895de5ea8dda5a77867345845fb967 Mon Sep 17 00:00:00
> 2001
> > > > +From: Panu Matilainen <pmatilai@redhat.com>
> > > > +Date: Mon, 18 Dec 2023 12:25:04 +0200
> > > > +Subject: [PATCH] Fix unconditional dependency on non-POSIX
> GLOB_ONLYDIR flag
> > > > +
> > > > +This regressed when we axed our internal glob copy in commit
> > > > +66fa46c006bae0f28d93238b8f7f1c923645eee5. Luckily GLOB_ONLYDIR is
> only
> > > > +an optimization so we can just skip it if not available.
> > > > +
> > > > +Upstream-Status: Backport [
> https://github.com/rpm-software-management/rpm/commit/57f3711846f44da0f37=
cbc5dd66e8fba80a3bee1
> ]
> > > > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > +---
> > > > + CMakeLists.txt  | 1 +
> > > > + config.h.in     | 1 +
> > > > + rpmio/rpmglob.c | 2 ++
> > > > + 3 files changed, 4 insertions(+)
> > > > +
> > > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > > +index d0ea565f3..0a474106e 100644
> > > > +--- a/CMakeLists.txt
> > > > ++++ b/CMakeLists.txt
> > > > +@@ -351,6 +351,7 @@ if (LIBDW_FOUND)
> > > > +       set(HAVE_LIBDW 1)
> > > > + endif()
> > > > +
> > > > ++check_symbol_exists(GLOB_ONLYDIR "glob.h" HAVE_GLOB_ONLYDIR)
> > > > + check_symbol_exists(major "sys/sysmacros.h" MAJOR_IN_SYSMACROS)
> > > > + if (NOT MAJOR_IN_SYSMACROS)
> > > > +       check_symbol_exists(major "sys/mkdev.h" MAJOR_IN_MKDEV)
> > > > +diff --git a/config.h.in b/config.h.in
> > > > +index cb97827d0..ab1757a9a 100644
> > > > +--- a/config.h.in
> > > > ++++ b/config.h.in
> > > > +@@ -100,6 +100,7 @@
> > > > + #cmakedefine HAVE_ZSTD @HAVE_ZSTD@
> > > > + #cmakedefine HAVE___PROGNAME @HAVE___PROGNAME@
> > > > + #cmakedefine HAVE___SECURE_GETENV @HAVE___SECURE_GETENV@
> > > > ++#cmakedefine HAVE_GLOB_ONLYDIR @HAVE_GLOB_ONLYDIR@
> > > > + #cmakedefine MAJOR_IN_MKDEV @MAJOR_IN_MKDEV@
> > > > + #cmakedefine MAJOR_IN_SYSMACROS @MAJOR_IN_SYSMACROS@
> > > > + #cmakedefine RUNDIR @rundir@
> > > > +diff --git a/rpmio/rpmglob.c b/rpmio/rpmglob.c
> > > > +index 8276eddb4..243568766 100644
> > > > +--- a/rpmio/rpmglob.c
> > > > ++++ b/rpmio/rpmglob.c
> > > > +@@ -84,8 +84,10 @@ int rpmGlobPath(const char * pattern,
> rpmglobFlags flags,
> > > > +     gflags |=3D GLOB_BRACE;
> > > > +     if (home !=3D NULL && strlen(home) > 0)
> > > > +       gflags |=3D GLOB_TILDE;
> > > > ++#if HAVE_GLOB_ONLYDIR
> > > > +     if (dir_only)
> > > > +       gflags |=3D GLOB_ONLYDIR;
> > > > ++#endif
> > > > +     if (flags & RPMGLOB_NOCHECK)
> > > > +       gflags |=3D GLOB_NOCHECK;
> > > > +
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-pack=
age-scriptlets-wit.patch
> b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-pack=
age-scriptlets-wit.patch
> > > > index bd3314a90f8..fc89b44132b 100644
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-pack=
age-scriptlets-wit.patch
> > > > +++
> b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-pack=
age-scriptlets-wit.patch
> > > > @@ -1,4 +1,4 @@
> > > > -From a89daa75ac970d8e247edc762d1181e9a5b0c5d0 Mon Sep 17 00:00:00
> 2001
> > > > +From 82e6d1ad126df88c58120a31fc025691039db7f3 Mon Sep 17 00:00:00
> 2001
> > > >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > >  Date: Tue, 17 Jan 2017 14:07:17 +0200
> > > >  Subject: [PATCH] When cross-installing, execute package scriptlets
> without
> > > > @@ -24,24 +24,16 @@ Amended 2018-07-03 by Olof Johansson <
> olofjn@axis.com>:
> > > >
> > > >  Upstream-Status: Inappropriate [oe-core specific]
> > > >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > +
> > > >  ---
> > > >   lib/rpmscript.c | 11 ++++++++---
> > > >   1 file changed, 8 insertions(+), 3 deletions(-)
> > > >
> > > > -Index: git/lib/rpmscript.c
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ---- git.orig/lib/rpmscript.c
> > > > -+++ git/lib/rpmscript.c
> > > > -@@ -18,7 +18,7 @@
> > > > - #include "rpmio/rpmio_internal.h"
> > > > -
> > > > - #include "lib/rpmplugins.h"     /* rpm plugins hooks */
> > > > --
> > > > -+#include "lib/rpmchroot.h"      /* rpmChrootOut */
> > > > - #include "debug.h"
> > > > -
> > > > - struct scriptNextFileFunc_s {
> > > > -@@ -427,8 +427,7 @@ exit:
> > > > +diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> > > > +index b18f851a3..36e37cf77 100644
> > > > +--- a/lib/rpmscript.c
> > > > ++++ b/lib/rpmscript.c
> > > > +@@ -448,8 +448,7 @@ exit:
> > > >         Fclose(out);    /* XXX dup'd STDOUT_FILENO */
> > > >
> > > >       if (fn) {
> > > > @@ -51,7 +43,7 @@ Index: git/lib/rpmscript.c
> > > >         free(fn);
> > > >       }
> > > >       free(mline);
> > > > -@@ -462,7 +461,13 @@ rpmRC rpmScriptRun(rpmScript script, int
> > > > +@@ -483,7 +482,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1=
,
> int arg2, FD_t scriptFd,
> > > >
> > > >       if (rc !=3D RPMRC_FAIL) {
> > > >         if (script_type & RPMSCRIPTLET_EXEC) {
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payload=
flags-into-.rpm-me.patch
> b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payload=
flags-into-.rpm-me.patch
> > > > index 64433abb6a1..5820b2e7e5b 100644
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payload=
flags-into-.rpm-me.patch
> > > > +++
> b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payload=
flags-into-.rpm-me.patch
> > > > @@ -1,4 +1,4 @@
> > > > -From 2d351c666f09cc1b9e368422653fb42ac8b86249 Mon Sep 17 00:00:00
> 2001
> > > > +From ebe65b0e8622c37463697dcec779a42290c33810 Mon Sep 17 00:00:00
> 2001
> > > >  From: Alexander Kanavin <alex@linutronix.de>
> > > >  Date: Tue, 31 Aug 2021 10:37:05 +0200
> > > >  Subject: [PATCH] build/pack.c: do not insert payloadflags into .rp=
m
> metadata
> > > > @@ -9,15 +9,16 @@ host to the next and breaks reproducibility for
> .rpm).
> > > >
> > > >  Upstream-Status: Inappropriate [oe-core specific]
> > > >  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > +
> > > >  ---
> > > >   build/pack.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > -Index: git/build/pack.c
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ---- git.orig/build/pack.c
> > > > -+++ git/build/pack.c
> > > > -@@ -328,7 +328,7 @@ static char *getIOFlags(Package pkg)
> > > > +diff --git a/build/pack.c b/build/pack.c
> > > > +index f382c7da0..0889dd993 100644
> > > > +--- a/build/pack.c
> > > > ++++ b/build/pack.c
> > > > +@@ -330,7 +330,7 @@ static char *getIOFlags(Package pkg)
> > > >             headerPutString(pkg->header, RPMTAG_PAYLOADCOMPRESSOR,
> compr);
> > > >         buf =3D xstrdup(rpmio_flags);
> > > >         buf[s - rpmio_flags] =3D '\0';
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-vari=
ant-to-triplet-han.patch
> b/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-vari=
ant-to-triplet-han.patch
> > > > deleted file mode 100644
> > > > index 29b6686a940..00000000000
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-vari=
ant-to-triplet-han.patch
> > > > +++ /dev/null
> > > > @@ -1,28 +0,0 @@
> > > > -From 8f51462d41d8fe942d5d0a06f08d47f625141995 Mon Sep 17 00:00:00
> 2001
> > > > -From: Alexander Kanavin <alex@linutronix.de>
> > > > -Date: Thu, 4 Aug 2022 12:15:08 +0200
> > > > -Subject: [PATCH] configure.ac: add linux-gnux32 variant to triplet
> handling
> > > > -
> > > > -x32 is a 64 bit x86 ABI with 32 bit pointers.
> > > > -
> > > > -Upstream-Status: Submitted [
> https://github.com/rpm-software-management/rpm/pull/2143]
> > > > -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > ----
> > > > - configure.ac | 4 ++++
> > > > - 1 file changed, 4 insertions(+)
> > > > -
> > > > -Index: git/configure.ac
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ---- git.orig/configure.ac
> > > > -+++ git/configure.ac
> > > > -@@ -903,6 +903,10 @@ if echo "$host_os" | grep '.*-gnux32$' >
> > > > -       host_os=3D`echo "${host_os}" | sed 's/-gnux32$//'`
> > > > -       host_os_gnu=3D-gnux32
> > > > - fi
> > > > -+if echo "$host_os" | grep '.*-gnux32$' > /dev/null ; then
> > > > -+      host_os=3D`echo "${host_os}" | sed 's/-gnux32$//'`
> > > > -+      host_os_gnu=3D-gnux32
> > > > -+fi
> > > > - if echo "$host_os" | grep '.*-gnu$' > /dev/null ; then
> > > > -       host_os=3D`echo "${host_os}" | sed 's/-gnu$//'`
> > > > - fi
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflic=
ts-for-MIPS64-N32.patch
> b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflic=
ts-for-MIPS64-N32.patch
> > > > index 82e6567dc74..8b9f1f72944 100644
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflic=
ts-for-MIPS64-N32.patch
> > > > +++
> b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflic=
ts-for-MIPS64-N32.patch
> > > > @@ -1,4 +1,4 @@
> > > > -From 1ed066fc6fa7d7afffe3545c4e3ea937529e6c49 Mon Sep 17 00:00:00
> 2001
> > > > +From bfceae7386b5fec108f98ad59ad96e57aecb08d3 Mon Sep 17 00:00:00
> 2001
> > > >  From: Changqing Li <changqing.li@windriver.com>
> > > >  Date: Thu, 7 May 2020 17:40:58 +0800
> > > >  Subject: [PATCH] lib/transaction.c: fix file conflicts for MIPS64
> N32
> > > > @@ -27,15 +27,16 @@ Fixed by performing a 'last-in-wins' resolution
> when "neither is preferred".
> > > >  Upstream-Status: Submitted <
> https://github.com/rpm-software-management/rpm/issues/193>
> > > >
> > > >  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > > +
> > > >  ---
> > > >   lib/transaction.c | 13 ++++++++++++-
> > > >   1 file changed, 12 insertions(+), 1 deletion(-)
> > > >
> > > > -Index: git/lib/transaction.c
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ---- git.orig/lib/transaction.c
> > > > -+++ git/lib/transaction.c
> > > > -@@ -402,7 +402,18 @@ static int handleColorConflict(rpmts ts,
> > > > +diff --git a/lib/transaction.c b/lib/transaction.c
> > > > +index 70d2587ac..b89b30060 100644
> > > > +--- a/lib/transaction.c
> > > > ++++ b/lib/transaction.c
> > > > +@@ -400,7 +400,18 @@ static int handleColorConflict(rpmts ts,
> > > >                     rpmfsSetAction(ofs, ofx, FA_CREATE);
> > > >                 rpmfsSetAction(fs, fx, FA_SKIPCOLOR);
> > > >                 rConflicts =3D 0;
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
> b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
> > > > index a6c58699d36..388694d234f 100644
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
> > > > +++
> b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
> > > > @@ -1,4 +1,7 @@
> > > > -perl: disable auto requires
> > > > +From 7894b508a61bb87f05f7eb0a1e912a2422f4fcd2 Mon Sep 17 00:00:00
> 2001
> > > > +From: Mark Hatle <mark.hatle@windriver.com>
> > > > +Date: Tue, 15 Aug 2017 16:41:57 -0500
> > > > +Subject: [PATCH] perl: disable auto requires
> > > >
> > > >  When generating automatic requirements, it's possible for perl
> scripts to
> > > >  declare 'optional' dependencies.  These seem to often be incorrect
> and will
> > > > @@ -10,19 +13,24 @@ Upstream-Status: Inappropriate [OE specific
> configuration]
> > > >
> > > >  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > > >
> > > > -Index: git/fileattrs/perl.attr
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ---- git.orig/fileattrs/perl.attr
> > > > -+++ git/fileattrs/perl.attr
> > > > +---
> > > > + fileattrs/perl.attr    | 2 +-
> > > > + fileattrs/perllib.attr | 2 +-
> > > > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > > > +
> > > > +diff --git a/fileattrs/perl.attr b/fileattrs/perl.attr
> > > > +index 0daef58d5..81ddf5305 100644
> > > > +--- a/fileattrs/perl.attr
> > > > ++++ b/fileattrs/perl.attr
> > > >  @@ -1,3 +1,3 @@
> > > >  -%__perl_requires      %{_rpmconfigdir}/perl.req
> > > >  +#__perl_requires      %{_rpmconfigdir}/perl.req
> > > >   %__perl_magic         ^.*[Pp]erl .*$
> > > >   %__perl_flags         exeonly
> > > > -Index: git/fileattrs/perllib.attr
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ---- git.orig/fileattrs/perllib.attr
> > > > -+++ git/fileattrs/perllib.attr
> > > > +diff --git a/fileattrs/perllib.attr b/fileattrs/perllib.attr
> > > > +index fcad48099..495a28927 100644
> > > > +--- a/fileattrs/perllib.attr
> > > > ++++ b/fileattrs/perllib.attr
> > > >  @@ -1,5 +1,5 @@
> > > >   %__perllib_provides   %{_rpmconfigdir}/perl.prov
> > > >  -%__perllib_requires   %{_rpmconfigdir}/perl.req
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0001-python-Use-Py_hash_t-instead-of-lo=
ng-in-hdr_hash.patch
> b/meta/recipes-devtools/rpm/files/0001-python-Use-Py_hash_t-instead-of-lo=
ng-in-hdr_hash.patch
> > > > deleted file mode 100644
> > > > index d0e637191a8..00000000000
> > > > ---
> a/meta/recipes-devtools/rpm/files/0001-python-Use-Py_hash_t-instead-of-lo=
ng-in-hdr_hash.patch
> > > > +++ /dev/null
> > > > @@ -1,35 +0,0 @@
> > > > -From 6ef189c45b763aedac5ef57ed6a5fc125fa95b41 Mon Sep 17 00:00:00
> 2001
> > > > -From: Khem Raj <raj.khem@gmail.com>
> > > > -Date: Fri, 3 Mar 2023 09:54:48 -0800
> > > > -Subject: [PATCH] python: Use Py_hash_t instead of long in hdr_hash
> > > > -
> > > > -Fixes
> > > > -python/header-py.c:744:2: error: incompatible function pointer
> types initializing 'hashfunc' (aka 'int (*)(struct _object *)') with an
> expression of type 'long (PyObject *)' (aka 'long (struct _object *)')
> [-Wincompatible-function-pointer-types]
> > > > -|         hdr_hash,                       /* tp_hash */
> > > > -|         ^~~~~~~~
> > > > -
> > > > -Upstream-Status: Submitted [
> https://github.com/rpm-software-management/rpm/pull/2409]
> > > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ----
> > > > - python/header-py.c | 4 ++--
> > > > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > > > -
> > > > -diff --git a/python/header-py.c b/python/header-py.c
> > > > -index 0aed0c9267..c15503f359 100644
> > > > ---- a/python/header-py.c
> > > > -+++ b/python/header-py.c
> > > > -@@ -316,9 +316,9 @@ static PyObject * hdr_dsOfHeader(PyObject * s)
> > > > -                                  "(Oi)", s, RPMTAG_NEVR);
> > > > - }
> > > > -
> > > > --static long hdr_hash(PyObject * h)
> > > > -+static Py_hash_t hdr_hash(PyObject * h)
> > > > - {
> > > > --    return (long) h;
> > > > -+    return (Py_hash_t) h;
> > > > - }
> > > > -
> > > > - static PyObject * hdr_reduce(hdrObject *s)
> > > > ---
> > > > -2.39.2
> > > > -
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from=
-RPM_ETCCONFIGDIR-.patch
> b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from=
-RPM_ETCCONFIGDIR-.patch
> > > > index 2fe96a839c3..89c23f81975 100644
> > > > ---
> a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from=
-RPM_ETCCONFIGDIR-.patch
> > > > +++
> b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from=
-RPM_ETCCONFIGDIR-.patch
> > > > @@ -1,7 +1,7 @@
> > > > -From 383c0b097b7eba16801a9e3c4b8e36a4b6de74ab Mon Sep 17 00:00:00
> 2001
> > > > +From e53c0e2586bc6f4677db3c6898a6428283a6b785 Mon Sep 17 00:00:00
> 2001
> > > >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > >  Date: Fri, 20 Jan 2017 13:33:05 +0200
> > > > -Subject: [PATCH 2/2] Add support for prefixing /etc from
> RPM_ETCCONFIGDIR
> > > > +Subject: [PATCH] Add support for prefixing /etc from
> RPM_ETCCONFIGDIR
> > > >   environment variable
> > > >
> > > >  This is needed so that rpm can pick up target-specific configurati=
on
> > > > @@ -9,15 +9,16 @@ from target rootfs instead of its own native
> sysroot.
> > > >
> > > >  Upstream-Status: Inappropriate [oe-core specific]
> > > >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > +
> > > >  ---
> > > >   lib/rpmrc.c | 19 ++++++++++++++-----
> > > >   1 file changed, 14 insertions(+), 5 deletions(-)
> > > >
> > > > -Index: git/lib/rpmrc.c
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ---- git.orig/lib/rpmrc.c
> > > > -+++ git/lib/rpmrc.c
> > > > -@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const
> > > > +diff --git a/lib/rpmrc.c b/lib/rpmrc.c
> > > > +index f39dcfc11..f27f88753 100644
> > > > +--- a/lib/rpmrc.c
> > > > ++++ b/lib/rpmrc.c
> > > > +@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const char
> * name,
> > > >   static void setDefaults(void)
> > > >   {
> > > >       const char *confdir =3D rpmConfigDir();
> > > > @@ -27,26 +28,26 @@ Index: git/lib/rpmrc.c
> > > >  +
> > > >       if (!defrcfiles) {
> > > >         defrcfiles =3D rstrscat(NULL, confdir, "/rpmrc", ":",
> > > > -                               confdir, "/" RPMCANONVENDOR
> "/rpmrc", ":",
> > > > --                              SYSCONFDIR "/rpmrc", ":");
> > > > -+                              etcconfdir, SYSCONFDIR "/rpmrc",
> ":", NULL);
> > > > +                               confdir, "/" RPM_VENDOR "/rpmrc",
> ":",
> > > > +-                              SYSCONFDIR "/rpmrc", NULL);
> > > > ++                              etcconfdir, SYSCONFDIR "/rpmrc",
> NULL);
> > > >       }
> > > >
> > > >   #ifndef MACROFILES
> > > >  @@ -468,9 +472,9 @@ static void setDefaults(void)
> > > >                                 confdir,
> "/platform/%{_target}/macros", ":",
> > > >                                 confdir, "/fileattrs/*.attr", ":",
> > > > -                               confdir, "/" RPMCANONVENDOR
> "/macros", ":",
> > > > +                               confdir, "/" RPM_VENDOR "/macros",
> ":",
> > > >  -                              SYSCONFDIR "/rpm/macros.*", ":",
> > > >  -                              SYSCONFDIR "/rpm/macros", ":",
> > > > --                              SYSCONFDIR "/rpm/%{_target}/macros"=
,
> ":");
> > > > +-                              SYSCONFDIR "/rpm/%{_target}/macros"=
,
> NULL);
> > > >  +                              etcconfdir, SYSCONFDIR
> "/rpm/macros.*", ":",
> > > >  +                              etcconfdir, SYSCONFDIR
> "/rpm/macros", ":",
> > > > -+                              etcconfdir, SYSCONFDIR
> "/rpm/%{_target}/macros", ":", NULL);
> > > > ++                              etcconfdir, SYSCONFDIR
> "/rpm/%{_target}/macros", NULL);
> > > >       }
> > > >   #else
> > > >       macrofiles =3D MACROFILES;
> > > > -@@ -997,7 +1001,11 @@ static void read_auxv(void)
> > > > +@@ -1114,7 +1118,11 @@ static void read_auxv(void)
> > > >    */
> > > >   static void defaultMachine(rpmrcCtx ctx, const char ** arch, cons=
t
> char ** os)
> > > >   {
> > > > @@ -59,7 +60,7 @@ Index: git/lib/rpmrc.c
> > > >       static struct utsname un;
> > > >       char * chptr;
> > > >       canonEntry canon;
> > > > -@@ -1307,6 +1315,7 @@ static void defaultMachine(rpmrcCtx ctx,
> > > > +@@ -1434,6 +1442,7 @@ static void defaultMachine(rpmrcCtx ctx,
> const char ** arch, const char ** os)
> > > >
> > > >       if (arch) *arch =3D un.machine;
> > > >       if (os) *os =3D un.sysname;
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install=
-non-existent-docs.patch
> b/meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install=
-non-existent-docs.patch
> > > > new file mode 100644
> > > > index 00000000000..e7f0adc70c9
> > > > --- /dev/null
> > > > +++
> b/meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install=
-non-existent-docs.patch
> > > > @@ -0,0 +1,26 @@
> > > > +From 4e388caabf0906f09d697b8d08623a022f7270b2 Mon Sep 17 00:00:00
> 2001
> > > > +From: Alexander Kanavin <alex@linutronix.de>
> > > > +Date: Wed, 29 Nov 2023 14:09:06 +0100
> > > > +Subject: [PATCH] docs/CMakeLists.txt: do not install non-existent
> docs/html
> > > > +
> > > > +Building html would require doxygen-native.
> > > > +
> > > > +Upstream-Status: Inappropriate [oe-core specific]
> > > > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > +
> > > > +---
> > > > + docs/CMakeLists.txt | 1 -
> > > > + 1 file changed, 1 deletion(-)
> > > > +
> > > > +diff --git a/docs/CMakeLists.txt b/docs/CMakeLists.txt
> > > > +index 52dce7b4e..c01ff7757 100644
> > > > +--- a/docs/CMakeLists.txt
> > > > ++++ b/docs/CMakeLists.txt
> > > > +@@ -18,7 +18,6 @@ if (DOXYGEN_FOUND)
> > > > + elseif (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/html/index.html)
> > > > +       set(doxsrc ${CMAKE_CURRENT_SOURCE_DIR})
> > > > + endif()
> > > > +-install(DIRECTORY ${doxsrc}/html/ DESTINATION
> ${CMAKE_INSTALL_DOCDIR}/API)
> > > > +
> > > > + install(FILES
> > > > +       README.md
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_B=
RACE-if-undefined-.patch
> b/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_B=
RACE-if-undefined-.patch
> > > > new file mode 100644
> > > > index 00000000000..3d4b09bedb6
> > > > --- /dev/null
> > > > +++
> b/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_B=
RACE-if-undefined-.patch
> > > > @@ -0,0 +1,34 @@
> > > > +From f78e05544fb5ae9ef688963f19666f1af34c3d5c Mon Sep 17 00:00:00
> 2001
> > > > +From: Alexander Kanavin <alex@linutronix.de>
> > > > +Date: Tue, 16 Jan 2024 09:59:26 +0100
> > > > +Subject: [PATCH] rpmio/rpmglob.c: avoid using GLOB_BRACE if
> undefined by C
> > > > + library
> > > > +
> > > > +This addresses musl failures; if there is code out there relying o=
n
> > > > +those braces, it needs to be fixed when used on musl.
> > > > +
> > > > +This is unlikely to be trivially fixable upstream.
> > > > +
> > > > +Upstream-Status: Inappropriate [reported at
> https://github.com/rpm-software-management/rpm/issues/2844]
> > > > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > +---
> > > > + rpmio/rpmglob.c | 6 ++++++
> > > > + 1 file changed, 6 insertions(+)
> > > > +
> > > > +diff --git a/rpmio/rpmglob.c b/rpmio/rpmglob.c
> > > > +index 243568766..43c27074a 100644
> > > > +--- a/rpmio/rpmglob.c
> > > > ++++ b/rpmio/rpmglob.c
> > > > +@@ -33,6 +33,12 @@
> > > > +
> > > > + #include "debug.h"
> > > > +
> > > > ++/* Don't fail if the standard C library
> > > > +++ * doesn't provide brace expansion */
> > > > ++#ifndef GLOB_BRACE
> > > > ++#define GLOB_BRACE 0
> > > > ++#endif
> > > > ++
> > > > + /* Return 1 if pattern contains a magic char, see glob(7) for a
> list */
> > > > + static int ismagic(const char *pattern)
> > > > + {
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-a=
round-scriptlets-t.patch
> b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-a=
round-scriptlets-t.patch
> > > > index 9dbe7125ded..b3d57cc8703 100644
> > > > ---
> a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-a=
round-scriptlets-t.patch
> > > > +++
> b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-a=
round-scriptlets-t.patch
> > > > @@ -1,4 +1,4 @@
> > > > -From 989e425d416474c191b020d0825895e3df4bd033 Mon Sep 17 00:00:00
> 2001
> > > > +From 0005ab544230020e854e9709b2bc0501702c2968 Mon Sep 17 00:00:00
> 2001
> > > >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > >  Date: Thu, 10 Jan 2019 18:14:18 +0100
> > > >  Subject: [PATCH] rpmscript.c: change logging level around
> scriptlets to INFO
> > > > @@ -9,15 +9,16 @@ irrelevant noise to rootfs logs.
> > > >
> > > >  Upstream-Status: Inappropriate [oe-core specific]
> > > >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > +
> > > >  ---
> > > >   lib/rpmscript.c | 8 ++++----
> > > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > -Index: git/lib/rpmscript.c
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ---- git.orig/lib/rpmscript.c
> > > > -+++ git/lib/rpmscript.c
> > > > -@@ -270,7 +270,7 @@ static char * writeScript(const char *cm
> > > > +diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> > > > +index 37ada014c..bab0c97a6 100644
> > > > +--- a/lib/rpmscript.c
> > > > ++++ b/lib/rpmscript.c
> > > > +@@ -291,7 +291,7 @@ static char * writeScript(const char *cmd,
> const char *script)
> > > >       if (Ferror(fd))
> > > >         goto exit;
> > > >
> > > > @@ -26,7 +27,7 @@ Index: git/lib/rpmscript.c
> > > >         static const char set_x[] =3D "set -x\n";
> > > >         /* Assume failures will be caught by the write below */
> > > >         Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
> > > > -@@ -302,7 +302,7 @@ static rpmRC runExtScript(rpmPlugins plu
> > > > +@@ -323,7 +323,7 @@ static rpmRC runExtScript(rpmPlugins plugins,
> ARGV_const_t prefixes,
> > > >       char *mline =3D NULL;
> > > >       rpmRC rc =3D RPMRC_FAIL;
> > > >
> > > > @@ -35,7 +36,7 @@ Index: git/lib/rpmscript.c
> > > >
> > > >       if (script) {
> > > >         fn =3D writeScript(*argvp[0], script);
> > > > -@@ -354,7 +354,7 @@ static rpmRC runExtScript(rpmPlugins plu
> > > > +@@ -375,7 +375,7 @@ static rpmRC runExtScript(rpmPlugins plugins,
> ARGV_const_t prefixes,
> > > >                 sname, strerror(errno));
> > > >         goto exit;
> > > >       } else if (pid =3D=3D 0) {/* Child */
> > > > @@ -44,7 +45,7 @@ Index: git/lib/rpmscript.c
> > > >                sname, *argvp[0], (unsigned)getpid());
> > > >
> > > >         fclose(in);
> > > > -@@ -397,7 +397,7 @@ static rpmRC runExtScript(rpmPlugins plu
> > > > +@@ -418,7 +418,7 @@ static rpmRC runExtScript(rpmPlugins plugins,
> ARGV_const_t prefixes,
> > > >         reaped =3D waitpid(pid, &status, 0);
> > > >       } while (reaped =3D=3D -1 && errno =3D=3D EINTR);
> > > >
> > > > diff --git
> a/meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5e7db79b0338da9e355=
e.patch
> b/meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5e7db79b0338da9e355=
e.patch
> > > > deleted file mode 100644
> > > > index 470dda1dcfb..00000000000
> > > > ---
> a/meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5e7db79b0338da9e355=
e.patch
> > > > +++ /dev/null
> > > > @@ -1,51 +0,0 @@
> > > > -From ea3187cfcf9cac87e5bc5e7db79b0338da9e355e Mon Sep 17 00:00:00
> 2001
> > > > -From: Panu Matilainen <pmatilai@redhat.com>
> > > > -Date: Mon, 26 Jun 2023 12:45:09 +0300
> > > > -Subject: [PATCH] Don't muck with per-process global sqlite
> configuration from
> > > > - the db backend
> > > > -
> > > > -sqlite3_config() affects all in-process uses of sqlite. librpm
> being a
> > > > -low-level library, it has no business whatsoever making such
> decisions
> > > > -for the applications running on top of it. Besides that, the
> callback can
> > > > -easily end up pointing to an already closed database, causing an
> > > > -innocent API user to crash in librpm on an entirely unrelated erro=
r
> on
> > > > -some other database. "Oops."
> > > > -
> > > > -The sqlite API doesn't seem to provide any per-db or non-global
> context
> > > > -for logging errors, thus we can only remove the call and let sqlit=
e
> output
> > > > -errors the way it pleases (print through stderr, presumably).
> > > > -
> > > > -Thanks to Jan Palus for spotting and reporting!
> > > > -
> > > > -Upstream-Status: Backport [
> https://github.com/rpm-software-management/rpm/commit/ea3187cfcf9cac87e5b=
c5e7db79b0338da9e355e
> ]
> > > > -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > > > ----
> > > > - lib/backend/sqlite.c | 8 --------
> > > > - 1 file changed, 8 deletions(-)
> > > > -
> > > > -diff --git a/lib/backend/sqlite.c b/lib/backend/sqlite.c
> > > > -index 5a029d575a..b612732267 100644
> > > > ---- a/lib/backend/sqlite.c
> > > > -+++ b/lib/backend/sqlite.c
> > > > -@@ -44,13 +44,6 @@ static void rpm_match3(sqlite3_context *sctx,
> int argc, sqlite3_value **argv)
> > > > -     sqlite3_result_int(sctx, match);
> > > > - }
> > > > -
> > > > --static void errCb(void *data, int err, const char *msg)
> > > > --{
> > > > --    rpmdb rdb =3D data;
> > > > --    rpmlog(RPMLOG_WARNING, "%s: %s: %s\n",
> > > > --              rdb->db_descr, sqlite3_errstr(err), msg);
> > > > --}
> > > > --
> > > > - static int dbiCursorReset(dbiCursor dbc)
> > > > - {
> > > > -     if (dbc->stmt) {
> > > > -@@ -170,7 +163,6 @@ static int sqlite_init(rpmdb rdb, const char *
> dbhome)
> > > > -        * the "database is locked" errors at every cost
> > > > -        */
> > > > -       sqlite3_busy_timeout(sdb, 10000);
> > > > --      sqlite3_config(SQLITE_CONFIG_LOG, errCb, rdb);
> > > > -
> > > > -       sqlexec(sdb, "PRAGMA secure_delete =3D OFF");
> > > > -       sqlexec(sdb, "PRAGMA case_sensitive_like =3D ON");
> > > > diff --git a/meta/recipes-devtools/rpm/files/fix-declaration.patch
> b/meta/recipes-devtools/rpm/files/fix-declaration.patch
> > > > deleted file mode 100644
> > > > index e5c84ebd498..00000000000
> > > > --- a/meta/recipes-devtools/rpm/files/fix-declaration.patch
> > > > +++ /dev/null
> > > > @@ -1,39 +0,0 @@
> > > > -From b960c0b43a080287a7c13533eeb2d9f288db1414 Mon Sep 17 00:00:00
> 2001
> > > > -From: Florian Festi <ffesti@redhat.com>
> > > > -Date: Thu, 16 Mar 2023 19:05:04 +0100
> > > > -Subject: [PATCH] Fix compiler error on clang
> > > > -
> > > > -Turns out variable declarations are not allowed after a label, eve=
n
> in
> > > > -C99. And while some compilers don't seem to care others do.
> > > > -
> > > > -Moving the declaration of mayopen to the start of the function to
> avoid
> > > > -this problem.
> > > > -
> > > > -Resolves: #2435
> > > > -Upstream-Status: Backport [
> https://github.com/rpm-software-management/rpm/commit/b960c0b43a080287a7c=
13533eeb2d9f288db1414
> ]
> > > > -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > ----
> > > > - lib/fsm.c | 3 ++-
> > > > - 1 file changed, 2 insertions(+), 1 deletion(-)
> > > > -
> > > > -diff --git a/lib/fsm.c b/lib/fsm.c
> > > > -index 5671ac642d..183293edb0 100644
> > > > ---- a/lib/fsm.c
> > > > -+++ b/lib/fsm.c
> > > > -@@ -879,6 +879,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te,
> rpmfiles files,
> > > > -     int nodigest =3D (rpmtsFlags(ts) & RPMTRANS_FLAG_NOFILEDIGEST=
) ?
> 1 : 0;
> > > > -     int nofcaps =3D (rpmtsFlags(ts) & RPMTRANS_FLAG_NOCAPS) ? 1 :=
 0;
> > > > -     int firstlinkfile =3D -1;
> > > > -+    int mayopen =3D 0;
> > > > -     char *tid =3D NULL;
> > > > -     struct filedata_s *fdata =3D xcalloc(fc, sizeof(*fdata));
> > > > -     struct filedata_s *firstlink =3D NULL;
> > > > -@@ -1016,7 +1017,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte
> te, rpmfiles files,
> > > > -
> > > > - setmeta:
> > > > -           /* Special files require path-based ops */
> > > > --          int mayopen =3D S_ISREG(fp->sb.st_mode) ||
> S_ISDIR(fp->sb.st_mode);
> > > > -+          mayopen =3D S_ISREG(fp->sb.st_mode) ||
> S_ISDIR(fp->sb.st_mode);
> > > > -           if (!rc && fd =3D=3D -1 && mayopen) {
> > > > -               int flags =3D O_RDONLY;
> > > > -               /* Only follow safe symlinks, and never on temporar=
y
> files */
> > > > diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
> > > > similarity index 72%
> > > > rename from meta/recipes-devtools/rpm/rpm_4.18.1.bb
> > > > rename to meta/recipes-devtools/rpm/rpm_4.19.1.bb
> > > > index 3e85cbb8efe..af11dec5ef3 100644
> > > > --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> > > > +++ b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
> > > > @@ -24,7 +24,7 @@ HOMEPAGE =3D "http://www.rpm.org"
> > > >  LICENSE =3D "GPL-2.0-only"
> > > >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dc4eec0c20c6034b9407a09945b48a43f"
> > > >
> > > > -SRC_URI =3D "git://
> github.com/rpm-software-management/rpm;branch=3Drpm-4.18.x;protocol=3Dhtt=
ps \
> > > > +SRC_URI =3D "git://
> github.com/rpm-software-management/rpm;branch=3Drpm-4.19.x;protocol=3Dhtt=
ps \
> > > >
>  file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
> > > >             file://0001-Do-not-read-config-files-from-HOME.patch \
> > > >
>  file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
> > > > @@ -36,58 +36,51 @@ SRC_URI =3D "git://
> github.com/rpm-software-management/rpm;branch=3Drpm-4.18.x;protoc
> > > >
>  file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
> > > >
>  file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
> > > >
>  file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
> > > > -
>  file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
> > > > -
>  file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
> > > > -           file://fix-declaration.patch \
> > > > -           file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
> > > > -
>  file://0001-Duplicate-filename-before-passing-it-to-basename.patch \
> > > > -           file://0001-Fix-missing-basename-include-on-macOS.patch=
 \
> > > > +
>  file://0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch \
> > > > +
>  file://0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch \
> > > > +
>  file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
> > > > +
>  file://0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch \
> > > > +
>  file://0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch \
> > > >             "
> > > >
> > > >  PE =3D "1"
> > > > -SRCREV =3D "4588bc3f994338502d2770ad24cbfcdaa6c335ec"
> > > > +SRCREV =3D "98b301ebb44fb5cabb56fc24bc3aaa437c47c038"
> > > >
> > > >  S =3D "${WORKDIR}/git"
> > > >
> > > > -DEPENDS =3D "lua libgcrypt file popt xz bzip2 elfutils python3"
> > > > +DEPENDS =3D "lua libgcrypt file popt xz bzip2 elfutils python3
> sqlite3 zstd"
> > > >  DEPENDS:append:class-native =3D " file-replacement-native
> bzip2-replacement-native"
> > > >
> > > > -inherit autotools gettext pkgconfig python3native
> > > > -export PYTHON_ABI
> > > > -
> > > > -AUTOTOOLS_AUXDIR =3D "${S}/build-aux"
> > > > -
> > > > -# OE-core patches autoreconf to additionally run gnu-configize,
> which fails with this recipe
> > > > -EXTRA_AUTORECONF:append =3D " --exclude=3Dgnu-configize"
> > > > -
> > > > -# Vendor is detected differently on x86 and aarch64 hosts and can
> feed into target packages
> > > > -EXTRA_OECONF:append =3D " --enable-python --with-crypto=3Dlibgcryp=
t
> --with-vendor=3Dpc"
> > > > -EXTRA_OECONF:append:libc-musl =3D " --disable-nls --disable-openmp=
"
> > > > +EXTRA_OECMAKE:append:libc-musl =3D " -DENABLE_NLS=3DOFF
> -DENABLE_OPENMP=3DOFF"
> > > >
> > > >  # --sysconfdir prevents rpm from attempting to access
> machine-specific configuration in sysroot/etc; we need to have it in root=
fs
> > > >  # --localstatedir prevents rpm from writing its database to native
> sysroot when building images
> > > > -# Forcibly disable plugins for native/nativesdk, as the inhibit an=
d
> prioreset
> > > > -# plugins both behave badly inside builds.
> > > > -EXTRA_OECONF:append:class-native =3D " --sysconfdir=3D/etc
> --localstatedir=3D/var --disable-plugins"
> > > > -EXTRA_OECONF:append:class-nativesdk =3D " --sysconfdir=3D/etc
> --disable-plugins"
> > > > +EXTRA_OECMAKE:append:class-native =3D "
> -DCMAKE_INSTALL_SYSCONFDIR:PATH=3D/etc
> -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=3D/var"
> > > > +EXTRA_OECMAKE:append:class-nativesdk =3D "
> -DCMAKE_INSTALL_FULL_SYSCONFDIR=3D/etc"
> > > > +
> > > > +inherit cmake gettext pkgconfig python3targetconfig
> > > > +OECMAKE_GENERATOR =3D "Unix Makefiles"
> > > >
> > > >  BBCLASSEXTEND =3D "native nativesdk"
> > > >
> > > > -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', 'inhibit', '', d)} sqlite zstd"
> > > > -# The inhibit plugin serves no purpose outside of the target
> > > > -PACKAGECONFIG:remove:class-native =3D "inhibit"
> > > > -PACKAGECONFIG:remove:class-nativesdk =3D "inhibit"
> > > > +PACKAGECONFIG ??=3D "internal-openpgp"
> > > >
> > > > -PACKAGECONFIG[imaevm] =3D "--with-imaevm,,ima-evm-utils"
> > > > -PACKAGECONFIG[inhibit] =3D
> "--enable-inhibit-plugin,--disable-inhibit-plugin,dbus"
> > > > -PACKAGECONFIG[rpm2archive] =3D
> "--with-archive,--without-archive,libarchive"
> > > > -PACKAGECONFIG[sqlite] =3D
> "--enable-sqlite=3Dyes,--enable-sqlite=3Dno,sqlite3"
> > > > -PACKAGECONFIG[readline] =3D
> "--with-readline,--without-readline,readline"
> > > > -PACKAGECONFIG[ndb] =3D "--enable-ndb,--disable-ndb"
> > > > -PACKAGECONFIG[bdb-ro] =3D "--enable-bdb-ro,--disable-bdb-ro"
> > > > -PACKAGECONFIG[zstd] =3D "--enable-zstd=3Dyes,--enable-zstd=3Dno,zs=
td"
> > > > +PACKAGECONFIG[plugins] =3D "-DENABLE_PLUGINS=3DON,-DENABLE_PLUGINS=
=3DOFF"
> > > > +PACKAGECONFIG[testsuite] =3D
> "-DENABLE_TESTSUITE=3DON,-DENABLE_TESTSUITE=3DOFF"
> > > >
> > > > -ASNEEDED =3D ""
> > > > +# Deprecated! https://fedoraproject.org/wiki/Changes/RpmSequoia
> > > > +PACKAGECONFIG[internal-openpgp] =3D
> "-DWITH_INTERNAL_OPENPGP=3DON,-DWITH_INTERNAL_OPENPGP=3DOFF"
> > > > +
> > > > +PACKAGECONFIG[cap] =3D "-DWITH_CAP=3DON,-DWITH_CAP=3DOFF"
> > > > +PACKAGECONFIG[acl] =3D "-DWITH_ACL=3DON,-DWITH_ACL=3DOFF"
> > > > +PACKAGECONFIG[archive] =3D
> "-DWITH_ARCHIVE=3DON,-DWITH_ARCHIVE=3DOFF,libarchive"
> > > > +PACKAGECONFIG[selinux] =3D "-DWITH_SELINUX=3DON,-DWITH_SELINUX=3DO=
FF"
> > > > +PACKAGECONFIG[dbus] =3D "-DWITH_DBUS=3DON,-DWITH_DBUS=3DOFF"
> > > > +PACKAGECONFIG[audit] =3D "-DWITH_AUDIT=3DON,-DWITH_AUDIT=3DOFF"
> > > > +PACKAGECONFIG[fsverity] =3D "-DWITH_FSVERITY=3DON,-DWITH_FSVERITY=
=3DOFF"
> > > > +PACKAGECONFIG[imaevm] =3D "-DWITH_IMAEVM=3DON,-DWITH_IMAEVM=3DOFF"
> > > > +PACKAGECONFIG[fapolicyd] =3D
> "-DWITH_FAPOLICYD=3DON,-DWITH_FAPOLICYD=3DOFF"
> > > > +PACKAGECONFIG[readline] =3D
> "-DWITH_READLINE=3DON,-DWITH_READLINE=3DOFF,readline"
> > > >
> > > >  # Direct rpm-native to read configuration from our sysroot, not th=
e
> one it was compiled in
> > > >  # libmagic also has sysroot path contamination, so override it
> > > > @@ -105,10 +98,6 @@ WRAPPER_TOOLS =3D " \
> > > >     ${libdir}/rpm/rpmdeps \
> > > >  "
> > > >
> > > > -do_configure:prepend() {
> > > > -        mkdir -p ${S}/build-aux
> > > > -}
> > > > -
> > > >  do_install:append:class-native() {
> > > >          for tool in ${WRAPPER_TOOLS}; do
> > > >                  test -x ${D}$tool && create_wrapper ${D}$tool \
> > > > @@ -143,6 +132,7 @@ do_install:append:class-nativesdk() {
> > > >
> > > >  do_install:append () {
> > > >         sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
> > > > +            -e 's:${STAGING_DIR_NATIVE}/::g' \
> > > >             ${D}/${libdir}/rpm/macros
> > > >
> > > >  }
> > > > @@ -166,6 +156,7 @@ FILES:${PN}-build =3D "\
> > > >      ${libdir}/rpm/check-* \
> > > >      ${libdir}/rpm/sepdebugcrcfix \
> > > >      ${libdir}/rpm/find-lang.sh \
> > > > +    ${libdir}/rpm/sysusers.sh \
> > > >      ${libdir}/rpm/*provides* \
> > > >      ${libdir}/rpm/*requires* \
> > > >      ${libdir}/rpm/*deps* \
> > > > --
> > > > 2.39.2
> > > >
> > > >
> > > >
> > > >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194457):
> https://lists.openembedded.org/g/openembedded-core/message/194457
> Mute This Topic: https://lists.openembedded.org/mt/103975822/3618418
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [matt@madison.systems]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c8d3c90610148bdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I ran across a different failure due to the rpm upgrade, w=
hich I&#39;ve traced to this change:<br><br><div><a href=3D"https://github.=
com/rpm-software-management/rpm/commit/162110aadad445cc248a68dc4c840fe05b79=
d00f">https://github.com/rpm-software-management/rpm/commit/162110aadad445c=
c248a68dc4c840fe05b79d00f</a><br></div><div><br></div><div>This is enabling=
 64-bit filesystem calls in the rpm-native build, causing it to use statvfs=
64() instead of statvfs().=C2=A0 Pseudo doesn&#39;t handle statvfs64(), so =
when rpm checks available disk space, it&#39;s looking at the host system&#=
39;s rootfs instead of the disk where the build is happening.=C2=A0 I&#39;m=
 not sure whether pseudo needs an update, or whether the hard-coded define =
added by the above-mentioned commit should be turned off for -native builds=
.</div><div><br></div><div>Regards,</div><div>-Matt</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 29, 20=
24 at 3:57=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">I sent a patch.<br>
<br>
Alex<br>
<br>
On Sun, 28 Jan 2024 at 20:04, Alexander Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0257:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 file =3D file.replace(&quot;%&quot;, &quot;%%%%%%%%&quot;)<br>
&gt;=C2=A0 *** 0258:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 attr =3D get_attr(file)<br>
&gt; ...<br>
&gt;=C2=A0 *** 0203:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 stat_f =3D os.stat(rootpath + &quot;/&quot; + path,<br>
&gt; follow_symlinks=3DFalse)<br>
&gt;<br>
&gt; Exception: FileNotFoundError: [Errno 2] No such file or directory:<br>
&gt; &#39;/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-6=
4-poky-linux/nodejs/20.8.1/packages-split/nodejs-ptest/usr/lib/nodejs/ptest=
/test/fixtures/es-modules/test-esm-double-encoding-native%%%%%%%%20.mjs&#39=
;<br>
&gt;<br>
&gt; Seems like 257 and 258 should be swapped. No idea what that %<br>
&gt; replacement is for.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Sun, 28 Jan 2024 at 17:54, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; I am seeing some failures in meta-oe ( especially nodejs ) which =
I<br>
&gt; &gt; suspect are due to rpm upgrade and patches around it.<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/88/builds/3566/steps/15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">=
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3566/step=
s/15/logs/stdio</a><br>
&gt; &gt;<br>
&gt; &gt; On Fri, Jan 26, 2024 at 5:35=E2=80=AFAM Alexander Kanavin<br>
&gt; &gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">a=
lex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Upstream has replaced autoconf with cmake, which necessitate=
s a rewrite of the<br>
&gt; &gt; &gt; recipe and available options, and a rebase to cmake of<br>
&gt; &gt; &gt; 0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.pa=
tch<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Correct a mistake in 0001-Do-not-read-config-files-from-HOME=
.patch :<br>
&gt; &gt; &gt; the patch was removing the NULL marker at the end of functio=
n arguments,<br>
&gt; &gt; &gt; and 0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR=
-.patch<br>
&gt; &gt; &gt; was restoring it (in addition to the actual change the patch=
 was making).<br>
&gt; &gt; &gt; Now both patches preserve the NULL terminator.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@=
linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 ...olor-setting-for-mips64_n32-binaries.patch | 12 +--=
<br>
&gt; &gt; &gt;=C2=A0 ...ook-for-lua-with-pkg-config-rather-t.patch | 28 +++=
++++<br>
&gt; &gt; &gt;=C2=A0 ...estore-readline-support-as-an-explic.patch | 42 +++=
++++++++<br>
&gt; &gt; &gt;=C2=A0 ...satisfiable-dependency-when-building.patch | 12 +--=
<br>
&gt; &gt; &gt;=C2=A0 ...lib-rpm-as-the-installation-path-for.patch | 52 +++=
++--------<br>
&gt; &gt; &gt;=C2=A0 ...1-Do-not-read-config-files-from-HOME.patch | 19 ++-=
--<br>
&gt; &gt; &gt;=C2=A0 ...-PATH-environment-variable-before-ru.patch | 12 +--=
<br>
&gt; &gt; &gt;=C2=A0 ...lename-before-passing-it-to-basename.patch | 40 ---=
-------<br>
&gt; &gt; &gt;=C2=A0 ...ix-missing-basename-include-on-macOS.patch | 26 ---=
----<br>
&gt; &gt; &gt;=C2=A0 ...l-dependency-on-non-POSIX-GLOB_ONLYD.patch | 56 +++=
+++++++++++<br>
&gt; &gt; &gt;=C2=A0 ...lling-execute-package-scriptlets-wit.patch | 24 ++-=
---<br>
&gt; &gt; &gt;=C2=A0 ...not-insert-payloadflags-into-.rpm-me.patch | 13 ++-=
-<br>
&gt; &gt; &gt;=C2=A0 ...-linux-gnux32-variant-to-triplet-han.patch | 28 ---=
----<br>
&gt; &gt; &gt;=C2=A0 ....c-fix-file-conflicts-for-MIPS64-N32.patch | 13 ++-=
-<br>
&gt; &gt; &gt;=C2=A0 .../files/0001-perl-disable-auto-reqs.patch=C2=A0 =C2=
=A0| 26 ++++---<br>
&gt; &gt; &gt;=C2=A0 ...y_hash_t-instead-of-long-in-hdr_hash.patch | 35 ---=
------<br>
&gt; &gt; &gt;=C2=A0 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 31 +++=
+----<br>
&gt; &gt; &gt;=C2=A0 ...txt-do-not-install-non-existent-docs.patch | 26 +++=
++++<br>
&gt; &gt; &gt;=C2=A0 ...avoid-using-GLOB_BRACE-if-undefined-.patch | 34 +++=
++++++<br>
&gt; &gt; &gt;=C2=A0 ...ge-logging-level-around-scriptlets-t.patch | 19 ++-=
--<br>
&gt; &gt; &gt;=C2=A0 ...87cfcf9cac87e5bc5e7db79b0338da9e355e.patch | 51 ---=
----------<br>
&gt; &gt; &gt;=C2=A0 .../rpm/files/fix-declaration.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 39 ----------<br>
&gt; &gt; &gt;=C2=A0 .../rpm/{<a href=3D"http://rpm_4.18.1.bb" rel=3D"noref=
errer" target=3D"_blank">rpm_4.18.1.bb</a> =3D&gt; <a href=3D"http://rpm_4.=
19.1.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.19.1.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 | 73 ++++++++-----------<br>
&gt; &gt; &gt;=C2=A0 23 files changed, 328 insertions(+), 383 deletions(-)<=
br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/rpm/files/000=
1-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/rpm/files/000=
1-CMakeLists.txt-restore-readline-support-as-an-explic.patch<br>
&gt; &gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rpm/files/000=
1-Duplicate-filename-before-passing-it-to-basename.patch<br>
&gt; &gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rpm/files/000=
1-Fix-missing-basename-include-on-macOS.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/rpm/files/000=
1-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch<br>
&gt; &gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rpm/files/000=
1-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch<br>
&gt; &gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rpm/files/000=
1-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/rpm/files/000=
2-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/rpm/files/000=
2-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch<br>
&gt; &gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rpm/files/ea3=
187cfcf9cac87e5bc5e7db79b0338da9e355e.patch<br>
&gt; &gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rpm/files/fix=
-declaration.patch<br>
&gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rpm/{<a href=3D"http://rp=
m_4.18.1.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.18.1.bb</a> =3D&gt;=
 <a href=3D"http://rpm_4.19.1.bb" rel=3D"noreferrer" target=3D"_blank">rpm_=
4.19.1.bb</a>} (72%)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-colo=
r-setting-for-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0=
001-Add-a-color-setting-for-mips64_n32-binaries.patch<br>
&gt; &gt; &gt; index 9fa486dfd3c..96fe57dfeb8 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setti=
ng-for-mips64_n32-binaries.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setti=
ng-for-mips64_n32-binaries.patch<br>
&gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; -From 93f219df68f3741ff63a294a16bcbe8deba1112f Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From ecc45e3ae837ab50603088dcc8fd2f8e67a7ece6 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 Date: Thu, 9 Mar 2017 18:54:02 +0200<br>
&gt; &gt; &gt;=C2=A0 Subject: [PATCH] Add a color setting for mips64_n32 bi=
naries<br>
&gt; &gt; &gt; @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail=
.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A02 files changed, 6 insertions(+)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 diff --git a/build/rpmfc.c b/build/rpmfc.c<br>
&gt; &gt; &gt; -index 26606378f..a16e3f4e9 100644<br>
&gt; &gt; &gt; +index 4b67a9bae..ed7e4e623 100644<br>
&gt; &gt; &gt;=C2=A0 --- a/build/rpmfc.c<br>
&gt; &gt; &gt;=C2=A0 +++ b/build/rpmfc.c<br>
&gt; &gt; &gt; -@@ -646,6 +646,7 @@ exit:<br>
&gt; &gt; &gt; +@@ -660,6 +660,7 @@ exit:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0static const struct rpmfcTokens_s rpmfcTokens[] =
=3D {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0{ &quot;directory&quot;,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RPMFC_INCLUDE },<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -23,7 +23,7 @@ index 26606378f..a16e3f4e9 100644<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0{ &quot;ELF 32-bit&quot;,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RPMFC_ELF32|RPMFC_INCLUDE },<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0{ &quot;ELF 64-bit&quot;,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RPMFC_ELF64|RPMFC_INCLUDE },<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -@@ -1151,6 +1152,9 @@ static uint32_t getElfColor(const cha=
r *fn)<br>
&gt; &gt; &gt; +@@ -1158,6 +1159,9 @@ static uint32_t getElfColor(const cha=
r *fn)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0color =3D RPMFC_ELF32;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; @@ -34,10 +34,10 @@ index 26606378f..a16e3f4e9 100644<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (elf)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_end(elf);=
<br>
&gt; &gt; &gt;=C2=A0 diff --git a/<a href=3D"http://rpmrc.in" rel=3D"norefe=
rrer" target=3D"_blank">rpmrc.in</a> b/<a href=3D"http://rpmrc.in" rel=3D"n=
oreferrer" target=3D"_blank">rpmrc.in</a><br>
&gt; &gt; &gt; -index 2975a3a0e..c7232b48b 100644<br>
&gt; &gt; &gt; +index 8646a966b..7349fdfd3 100644<br>
&gt; &gt; &gt;=C2=A0 --- a/<a href=3D"http://rpmrc.in" rel=3D"noreferrer" t=
arget=3D"_blank">rpmrc.in</a><br>
&gt; &gt; &gt;=C2=A0 +++ b/<a href=3D"http://rpmrc.in" rel=3D"noreferrer" t=
arget=3D"_blank">rpmrc.in</a><br>
&gt; &gt; &gt; -@@ -139,6 +139,8 @@ archcolor: mipsr6el 1<br>
&gt; &gt; &gt; +@@ -142,6 +142,8 @@ archcolor: mipsr6el 1<br>
&gt; &gt; &gt;=C2=A0 =C2=A0archcolor: mips64r6 2<br>
&gt; &gt; &gt;=C2=A0 =C2=A0archcolor: mips64r6el 2<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists=
.txt-look-for-lua-with-pkg-config-rather-t.patch b/meta/recipes-devtools/rp=
m/files/0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 00000000000..5053caae33f<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-lo=
ok-for-lua-with-pkg-config-rather-t.patch<br>
&gt; &gt; &gt; @@ -0,0 +1,28 @@<br>
&gt; &gt; &gt; +From ca4655f36c3c7883eb50381902890b23f0e8aaab Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutron=
ix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; +Date: Wed, 29 Nov 2023 14:06:15 +0100<br>
&gt; &gt; &gt; +Subject: [PATCH] CMakeLists.txt: look for lua with pkg-conf=
ig rather than<br>
&gt; &gt; &gt; + cmake modules<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Otherwise cmake will try to find libm, badly, and fail.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; &gt; &gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex=
@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +---<br>
&gt; &gt; &gt; + CMakeLists.txt | 2 +-<br>
&gt; &gt; &gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; &gt; &gt; +index 7f0630453..d0ea565f3 100644<br>
&gt; &gt; &gt; +--- a/CMakeLists.txt<br>
&gt; &gt; &gt; ++++ b/CMakeLists.txt<br>
&gt; &gt; &gt; +@@ -187,7 +187,7 @@ set(REQFUNCS<br>
&gt; &gt; &gt; + )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; + find_package(PkgConfig REQUIRED)<br>
&gt; &gt; &gt; +-find_package(Lua 5.2 REQUIRED)<br>
&gt; &gt; &gt; ++pkg_check_modules(LUA REQUIRED IMPORTED_TARGET lua&gt;=3D5=
.2)<br>
&gt; &gt; &gt; + find_package(ZLIB REQUIRED)<br>
&gt; &gt; &gt; + find_package(BZip2)<br>
&gt; &gt; &gt; + find_package(Iconv)<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists=
.txt-restore-readline-support-as-an-explic.patch b/meta/recipes-devtools/rp=
m/files/0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 00000000000..db83b176b41<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-re=
store-readline-support-as-an-explic.patch<br>
&gt; &gt; &gt; @@ -0,0 +1,42 @@<br>
&gt; &gt; &gt; +From 3c2e529c6cc1bae4bc94cbed7358c6e0cdd2de02 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutron=
ix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; +Date: Tue, 16 Jan 2024 13:43:36 +0100<br>
&gt; &gt; &gt; +Subject: [PATCH] CMakeLists.txt: restore readline support a=
s an explicit<br>
&gt; &gt; &gt; + option<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +This was lost in autotools -&gt; cmake transition. The part=
icular<br>
&gt; &gt; &gt; +reason to make it explicit is that readline is gpl version =
3<br>
&gt; &gt; &gt; +licensed, and in some builds components under that license<=
br>
&gt; &gt; &gt; +need to be excluded.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/r=
pm-software-management/rpm/pull/2852" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/rpm-software-management/rpm/pull/2852</a>]<br>
&gt; &gt; &gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex=
@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; +---<br>
&gt; &gt; &gt; + CMakeLists.txt | 7 ++++++-<br>
&gt; &gt; &gt; + 1 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; &gt; &gt; +index 0a474106e..89e27417f 100644<br>
&gt; &gt; &gt; +--- a/CMakeLists.txt<br>
&gt; &gt; &gt; ++++ b/CMakeLists.txt<br>
&gt; &gt; &gt; +@@ -31,6 +31,7 @@ option(WITH_AUDIT &quot;Build with audit =
support&quot; ON)<br>
&gt; &gt; &gt; + option(WITH_FSVERITY &quot;Build with fsverity support&quo=
t; OFF)<br>
&gt; &gt; &gt; + option(WITH_IMAEVM &quot;Build with IMA support&quot; OFF)=
<br>
&gt; &gt; &gt; + option(WITH_FAPOLICYD &quot;Build with fapolicyd support&q=
uot; ON)<br>
&gt; &gt; &gt; ++option(WITH_READLINE &quot;Build with readline support&quo=
t; ON)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; + set(RPM_CONFIGDIR &quot;${CMAKE_INSTALL_PREFIX}/${CMAKE_IN=
STALL_LIBDIR}/rpm&quot; CACHE PATH &quot;rpm home&quot;)<br>
&gt; &gt; &gt; + set(RPM_VENDOR &quot;vendor&quot; CACHE STRING &quot;rpm v=
endor string&quot;)<br>
&gt; &gt; &gt; +@@ -193,7 +194,11 @@ find_package(BZip2)<br>
&gt; &gt; &gt; + find_package(Iconv)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; + pkg_check_modules(POPT REQUIRED IMPORTED_TARGET popt)<br>
&gt; &gt; &gt; +-pkg_check_modules(READLINE IMPORTED_TARGET readline)<br>
&gt; &gt; &gt; ++<br>
&gt; &gt; &gt; ++if (WITH_READLINE)<br>
&gt; &gt; &gt; ++=C2=A0 =C2=A0 pkg_check_modules(READLINE REQUIRED IMPORTED=
_TARGET readline)<br>
&gt; &gt; &gt; ++endif()<br>
&gt; &gt; &gt; ++<br>
&gt; &gt; &gt; + pkg_check_modules(ZSTD IMPORTED_TARGET libzstd&gt;=3D1.3.8=
)<br>
&gt; &gt; &gt; + pkg_check_modules(LIBELF IMPORTED_TARGET libelf)<br>
&gt; &gt; &gt; + pkg_check_modules(LIBDW IMPORTED_TARGET libdw)<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add=
-an-unsatisfiable-dependency-when-building.patch b/meta/recipes-devtools/rp=
m/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch<br>
&gt; &gt; &gt; index 8440c3516d6..df5543873c1 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-uns=
atisfiable-dependency-when-building.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-uns=
atisfiable-dependency-when-building.patch<br>
&gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; -From f39c28eb52f12ae6e82db360ffd5a903ac8faca5 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From d77429bf20d138ec8ce577c0080cae1f1bc2aa6f Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 Date: Mon, 9 Jan 2017 18:52:11 +0200<br>
&gt; &gt; &gt;=C2=A0 Subject: [PATCH] Do not add an unsatisfiable dependenc=
y when building rpms in<br>
&gt; &gt; &gt; @@ -14,11 +14,11 @@ Signed-off-by: Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail=
.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0build/pack.c | 4 ----<br>
&gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 4 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -Index: git/build/pack.c<br>
&gt; &gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; ---- git.orig/build/pack.c<br>
&gt; &gt; &gt; -+++ git/build/pack.c<br>
&gt; &gt; &gt; -@@ -709,10 +709,6 @@ static rpmRC packageBinary(rpmSpec spe=
c,<br>
&gt; &gt; &gt; +diff --git a/build/pack.c b/build/pack.c<br>
&gt; &gt; &gt; +index f7dac6d9a..f382c7da0 100644<br>
&gt; &gt; &gt; +--- a/build/pack.c<br>
&gt; &gt; &gt; ++++ b/build/pack.c<br>
&gt; &gt; &gt; +@@ -711,10 +711,6 @@ static rpmRC packageBinary(rpmSpec spe=
c, Package pkg, const char *cookie, int ch<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0headerPutBin(pkg-&gt;header=
, RPMTAG_SOURCEPKGID, spec-&gt;sourcePkgId,16);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-har=
dcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rp=
m/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch<br>
&gt; &gt; &gt; index 8fdc5edb10b..b056d19741a 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-l=
ib-rpm-as-the-installation-path-for.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-l=
ib-rpm-as-the-installation-path-for.patch<br>
&gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; -From 5fc560aaf1184d35d161f7d50dbb6323c90cc02d Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From 7948f21e08bc7552b281ed0098a9c8099d2370cb Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 Date: Mon, 27 Feb 2017 09:43:30 +0200<br>
&gt; &gt; &gt;=C2=A0 Subject: [PATCH] Do not hardcode &quot;lib/rpm&quot; a=
s the installation path for<br>
&gt; &gt; &gt; @@ -8,29 +8,28 @@ Upstream-Status: Denied [<a href=3D"https:=
//github.com/rpm-software-management/rpm/pull/263" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/rpm-software-management/rpm/pull/263</a><br=
>
&gt; &gt; &gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 ---<br>
&gt; &gt; &gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> | 2 +-<br>
&gt; &gt; &gt; - <a href=3D"http://macros.in" rel=3D"noreferrer" target=3D"=
_blank">macros.in</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt; &gt; - <a href=3D"http://rpm.am" rel=3D"noreferrer" target=3D"_bl=
ank">rpm.am</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt; &gt; - 3 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt; &gt; &gt; + CMakeLists.txt | 2 +-<br>
&gt; &gt; &gt; + <a href=3D"http://macros.in" rel=3D"noreferrer" target=3D"=
_blank">macros.in</a>=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt; &gt; + 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"norefer=
rer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" r=
el=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; &gt; &gt; -index e6676c581..ec28db9b6 100644<br>
&gt; &gt; &gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
&gt; &gt; &gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
&gt; &gt; &gt; -@@ -942,7 +942,7 @@ else<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0usrprefix=3D$prefix<br>
&gt; &gt; &gt; - fi<br>
&gt; &gt; &gt; +diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; &gt; &gt; +index 2767915fb..7f0630453 100644<br>
&gt; &gt; &gt; +--- a/CMakeLists.txt<br>
&gt; &gt; &gt; ++++ b/CMakeLists.txt<br>
&gt; &gt; &gt; +@@ -32,7 +32,7 @@ option(WITH_FSVERITY &quot;Build with fsv=
erity support&quot; OFF)<br>
&gt; &gt; &gt; + option(WITH_IMAEVM &quot;Build with IMA support&quot; OFF)=
<br>
&gt; &gt; &gt; + option(WITH_FAPOLICYD &quot;Build with fapolicyd support&q=
uot; ON)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --RPMCONFIGDIR=3D&quot;`echo ${usrprefix}/lib/rpm`&quot;<br>
&gt; &gt; &gt; -+RPMCONFIGDIR=3D&quot;`echo ${libdir}/rpm`&quot;<br>
&gt; &gt; &gt; - AC_SUBST(RPMCONFIGDIR)<br>
&gt; &gt; &gt; +-set(RPM_CONFIGDIR &quot;${CMAKE_INSTALL_PREFIX}/lib/rpm&qu=
ot; CACHE PATH &quot;rpm home&quot;)<br>
&gt; &gt; &gt; ++set(RPM_CONFIGDIR &quot;${CMAKE_INSTALL_PREFIX}/${CMAKE_IN=
STALL_LIBDIR}/rpm&quot; CACHE PATH &quot;rpm home&quot;)<br>
&gt; &gt; &gt; + set(RPM_VENDOR &quot;vendor&quot; CACHE STRING &quot;rpm v=
endor string&quot;)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - AC_SUBST(OBJDUMP)<br>
&gt; &gt; &gt; + # Emulate libtool versioning. Before a public release:<br>
&gt; &gt; &gt;=C2=A0 diff --git a/<a href=3D"http://macros.in" rel=3D"noref=
errer" target=3D"_blank">macros.in</a> b/<a href=3D"http://macros.in" rel=
=3D"noreferrer" target=3D"_blank">macros.in</a><br>
&gt; &gt; &gt; -index a2411d784..735b74d99 100644<br>
&gt; &gt; &gt; +index b49ffaad4..3acbe78f6 100644<br>
&gt; &gt; &gt;=C2=A0 --- a/<a href=3D"http://macros.in" rel=3D"noreferrer" =
target=3D"_blank">macros.in</a><br>
&gt; &gt; &gt;=C2=A0 +++ b/<a href=3D"http://macros.in" rel=3D"noreferrer" =
target=3D"_blank">macros.in</a><br>
&gt; &gt; &gt; -@@ -930,7 +930,7 @@ package or when debugging this package.=
\<br>
&gt; &gt; &gt; +@@ -969,7 +969,7 @@ Supplements:=C2=A0 =C2=A0(%{name} =3D %=
{version}-%{release} and langpacks-%{1})\<br>
&gt; &gt; &gt;=C2=A0 =C2=A0%_sharedstatedir=C2=A0 =C2=A0 =C2=A0 %{_prefix}/=
com<br>
&gt; &gt; &gt;=C2=A0 =C2=A0%_localstatedir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0%{_prefix}/var<br>
&gt; &gt; &gt;=C2=A0 =C2=A0%_lib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0lib<br>
&gt; &gt; &gt; @@ -39,20 +38,3 @@ index a2411d784..735b74d99 100644<br>
&gt; &gt; &gt;=C2=A0 =C2=A0%_includedir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %=
{_prefix}/include<br>
&gt; &gt; &gt;=C2=A0 =C2=A0%_infodir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0%{_datadir}/info<br>
&gt; &gt; &gt;=C2=A0 =C2=A0%_mandir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 %{_datadir}/man<br>
&gt; &gt; &gt; -diff --git a/<a href=3D"http://rpm.am" rel=3D"noreferrer" t=
arget=3D"_blank">rpm.am</a> b/<a href=3D"http://rpm.am" rel=3D"noreferrer" =
target=3D"_blank">rpm.am</a><br>
&gt; &gt; &gt; -index 55b5b3935..5a51f102b 100644<br>
&gt; &gt; &gt; ---- a/<a href=3D"http://rpm.am" rel=3D"noreferrer" target=
=3D"_blank">rpm.am</a><br>
&gt; &gt; &gt; -+++ b/<a href=3D"http://rpm.am" rel=3D"noreferrer" target=
=3D"_blank">rpm.am</a><br>
&gt; &gt; &gt; -@@ -1,10 +1,10 @@<br>
&gt; &gt; &gt; - # Internal binaries<br>
&gt; &gt; &gt; - ## HACK: It probably should be $(libexecdir)/rpm or $(libd=
ir)/rpm<br>
&gt; &gt; &gt; --rpmlibexecdir =3D $(prefix)/lib/rpm<br>
&gt; &gt; &gt; -+rpmlibexecdir =3D $(libdir)/rpm<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; - # Host independent config files<br>
&gt; &gt; &gt; - ## HACK: it probably should be $(datadir)/rpm<br>
&gt; &gt; &gt; --rpmconfigdir =3D $(prefix)/lib/rpm<br>
&gt; &gt; &gt; -+rpmconfigdir =3D $(libdir)/rpm<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; - # Libtool version (current-revision-age) for all our libra=
ries<br>
&gt; &gt; &gt; - rpm_version_info =3D 13:0:4<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-rea=
d-config-files-from-HOME.patch b/meta/recipes-devtools/rpm/files/0001-Do-no=
t-read-config-files-from-HOME.patch<br>
&gt; &gt; &gt; index fda64eefe01..6a18679da2f 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-Do-not-read-confi=
g-files-from-HOME.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-read-confi=
g-files-from-HOME.patch<br>
&gt; &gt; &gt; @@ -1,35 +1,36 @@<br>
&gt; &gt; &gt; -From 35381b6cd6c1b571bf7e6b0640de0f54dbf94386 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From 4f34994d9ad38d96976578a9d1a006f72e5aca50 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 Date: Tue, 10 Jan 2017 14:11:30 +0200<br>
&gt; &gt; &gt;=C2=A0 Subject: [PATCH] Do not read config files from $HOME<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; &gt; &gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<b=
r>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 ---<br>
&gt; &gt; &gt;=C2=A0 =C2=A0lib/rpmrc.c | 6 ++----<br>
&gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 4 deletions(-)<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -Index: git/lib/rpmrc.c<br>
&gt; &gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; ---- git.orig/lib/rpmrc.c<br>
&gt; &gt; &gt; -+++ git/lib/rpmrc.c<br>
&gt; &gt; &gt; +diff --git a/lib/rpmrc.c b/lib/rpmrc.c<br>
&gt; &gt; &gt; +index 269d490ac..f39dcfc11 100644<br>
&gt; &gt; &gt; +--- a/lib/rpmrc.c<br>
&gt; &gt; &gt; ++++ b/lib/rpmrc.c<br>
&gt; &gt; &gt;=C2=A0 @@ -458,8 +458,7 @@ static void setDefaults(void)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!defrcfiles) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defrcfiles =3D rstrscat(NUL=
L, confdir, &quot;/rpmrc&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0confdir, &quot;/&quot; =
RPMCANONVENDOR &quot;/rpmrc&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0confdir, &quot;/&quot; =
RPM_VENDOR &quot;/rpmrc&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSCONFDIR &quot;/rpmr=
c&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;~/.rpmrc&quot;, =
NULL);<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSCONFDIR &quot;/rpmrc&qu=
ot;, &quot;:&quot;);<br>
&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSCONFDIR &quot;/rpmrc&qu=
ot;, NULL);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0#ifndef MACROFILES<br>
&gt; &gt; &gt;=C2=A0 @@ -471,8 +470,7 @@ static void setDefaults(void)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0confdir, &quot;/&quot; =
RPMCANONVENDOR &quot;/macros&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0confdir, &quot;/&quot; =
RPM_VENDOR &quot;/macros&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSCONFDIR &quot=
;/rpm/macros.*&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSCONFDIR &quot=
;/rpm/macros&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSCONFDIR &quot;/rpm/=
%{_target}/macros&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;~/.rpmmacros&quo=
t;, NULL);<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSCONFDIR &quot;/rpm/%{_t=
arget}/macros&quot;, &quot;:&quot;);<br>
&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSCONFDIR &quot;/rpm/%{_t=
arget}/macros&quot;, NULL);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;=C2=A0 =C2=A0#else<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0macrofiles =3D MACROFILES;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-res=
et-the-PATH-environment-variable-before-ru.patch b/meta/recipes-devtools/rp=
m/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch<br>
&gt; &gt; &gt; index ae24b663aae..318f65ed375 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-=
PATH-environment-variable-before-ru.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-=
PATH-environment-variable-before-ru.patch<br>
&gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; -From a674b9cc7af448d7c6748bc163bf37dc14a57f09 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From 25beba1efc31901a3bb0b1b6f0604d6583dc0513 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 Date: Fri, 20 Jan 2017 13:32:06 +0200<br>
&gt; &gt; &gt;=C2=A0 Subject: [PATCH] Do not reset the PATH environment var=
iable before running<br>
&gt; &gt; &gt; @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail=
.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0lib/rpmscript.c | 2 +-<br>
&gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -Index: git/lib/rpmscript.c<br>
&gt; &gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; ---- git.orig/lib/rpmscript.c<br>
&gt; &gt; &gt; -+++ git/lib/rpmscript.c<br>
&gt; &gt; &gt; -@@ -231,7 +231,7 @@ static void doScriptExec(ARGV_const_t a=
r<br>
&gt; &gt; &gt; +diff --git a/lib/rpmscript.c b/lib/rpmscript.c<br>
&gt; &gt; &gt; +index 36e37cf77..37ada014c 100644<br>
&gt; &gt; &gt; +--- a/lib/rpmscript.c<br>
&gt; &gt; &gt; ++++ b/lib/rpmscript.c<br>
&gt; &gt; &gt; +@@ -252,7 +252,7 @@ static void doScriptExec(ARGV_const_t a=
rgv, ARGV_const_t prefixes,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ipath &amp;&amp; ipath[=
5] !=3D &#39;%&#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D ipat=
h;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Duplicate-=
filename-before-passing-it-to-basename.patch b/meta/recipes-devtools/rpm/fi=
les/0001-Duplicate-filename-before-passing-it-to-basename.patch<br>
&gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; index f9b809d1676..00000000000<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-Duplicate-filenam=
e-before-passing-it-to-basename.patch<br>
&gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; @@ -1,40 +0,0 @@<br>
&gt; &gt; &gt; -From 3fa2ae78db9b31edb4c22f3b5cd36c6c972947f1 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; -From: Florian Festi &lt;<a href=3D"mailto:ffesti@redhat.com=
" target=3D"_blank">ffesti@redhat.com</a>&gt;<br>
&gt; &gt; &gt; -Date: Wed, 26 Jul 2023 15:01:35 +0200<br>
&gt; &gt; &gt; -Subject: [PATCH] Duplicate filename before passing it to ba=
sename<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -basename is allowed change the string passed to it. While w=
e don&#39;t need<br>
&gt; &gt; &gt; -the filename after that just casting away the const seems a=
 bit too<br>
&gt; &gt; &gt; -hacky.<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Upstream-Status: Backport [<a href=3D"https://github.com/rp=
m-software-management/rpm/commit/3fa2ae78db9b31edb4c22f3b5cd36c6c972947f1" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-software-manage=
ment/rpm/commit/3fa2ae78db9b31edb4c22f3b5cd36c6c972947f1</a>]<br>
&gt; &gt; &gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt; - tools/rpmuncompress.c | 4 +++-<br>
&gt; &gt; &gt; - 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -diff --git a/tools/rpmuncompress.c b/tools/rpmuncompress.c<=
br>
&gt; &gt; &gt; -index 58ddf5683..e13cc6a66 100644<br>
&gt; &gt; &gt; ---- a/tools/rpmuncompress.c<br>
&gt; &gt; &gt; -+++ b/tools/rpmuncompress.c<br>
&gt; &gt; &gt; -@@ -98,7 +98,8 @@ static char *doUntar(const char *fn)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (needtar) {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rasprintf(&amp;buf=
, &quot;%s &#39;%s&#39; | %s %s -&quot;, zipper, fn, tar, taropts);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (at-&gt;compressed =3D=
=3D COMPRESSED_GEM) {<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *bn =3D base=
name(fn);<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *tmp =3D xstrdup(f=
n);<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *bn =3D base=
name(tmp);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t nvlen =3D s=
trlen(bn) - 3;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *gem =3D rpmG=
etPath(&quot;%{__gem}&quot;, NULL);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *gemspec =3D =
NULL;<br>
&gt; &gt; &gt; -@@ -112,6 +113,7 @@ static char *doUntar(const char *fn)<br=
>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(gemspec);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(gem);<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(tmp);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rasprintf(&amp;buf=
, &quot;%s &#39;%s&#39;&quot;, zipper, fn);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; -2.43.0<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-missin=
g-basename-include-on-macOS.patch b/meta/recipes-devtools/rpm/files/0001-Fi=
x-missing-basename-include-on-macOS.patch<br>
&gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; index a93597a8352..00000000000<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-Fix-missing-basen=
ame-include-on-macOS.patch<br>
&gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; @@ -1,26 +0,0 @@<br>
&gt; &gt; &gt; -From b2e67642fd8cb64d8cb1cca9e759396c1c10807d Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; -From: Calvin Buckley &lt;<a href=3D"mailto:calvin@cmpct.inf=
o" target=3D"_blank">calvin@cmpct.info</a>&gt;<br>
&gt; &gt; &gt; -Date: Tue, 11 Jul 2023 19:22:41 -0300<br>
&gt; &gt; &gt; -Subject: [PATCH] Fix missing basename include on macOS<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Upstream-Status: Backport [<a href=3D"https://github.com/rp=
m-software-management/rpm/commit/b2e67642fd8cb64d8cb1cca9e759396c1c10807d" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-software-manage=
ment/rpm/commit/b2e67642fd8cb64d8cb1cca9e759396c1c10807d</a>]<br>
&gt; &gt; &gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt; - tools/rpmuncompress.c | 1 +<br>
&gt; &gt; &gt; - 1 file changed, 1 insertion(+)<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -diff --git a/tools/rpmuncompress.c b/tools/rpmuncompress.c<=
br>
&gt; &gt; &gt; -index bd4146d54..58ddf5683 100644<br>
&gt; &gt; &gt; ---- a/tools/rpmuncompress.c<br>
&gt; &gt; &gt; -+++ b/tools/rpmuncompress.c<br>
&gt; &gt; &gt; -@@ -1,6 +1,7 @@<br>
&gt; &gt; &gt; - #include &quot;system.h&quot;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; - #include &lt;popt.h&gt;<br>
&gt; &gt; &gt; -+#include &lt;libgen.h&gt;<br>
&gt; &gt; &gt; - #include &lt;errno.h&gt;<br>
&gt; &gt; &gt; - #include &lt;stdio.h&gt;<br>
&gt; &gt; &gt; - #include &lt;string.h&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; -2.43.0<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-uncond=
itional-dependency-on-non-POSIX-GLOB_ONLYD.patch b/meta/recipes-devtools/rp=
m/files/0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 00000000000..8e73e077049<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-Fix-unconditional=
-dependency-on-non-POSIX-GLOB_ONLYD.patch<br>
&gt; &gt; &gt; @@ -0,0 +1,56 @@<br>
&gt; &gt; &gt; +From 1b3a182f38895de5ea8dda5a77867345845fb967 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From: Panu Matilainen &lt;<a href=3D"mailto:pmatilai@redhat=
.com" target=3D"_blank">pmatilai@redhat.com</a>&gt;<br>
&gt; &gt; &gt; +Date: Mon, 18 Dec 2023 12:25:04 +0200<br>
&gt; &gt; &gt; +Subject: [PATCH] Fix unconditional dependency on non-POSIX =
GLOB_ONLYDIR flag<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +This regressed when we axed our internal glob copy in commi=
t<br>
&gt; &gt; &gt; +66fa46c006bae0f28d93238b8f7f1c923645eee5. Luckily GLOB_ONLY=
DIR is only<br>
&gt; &gt; &gt; +an optimization so we can just skip it if not available.<br=
>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/rp=
m-software-management/rpm/commit/57f3711846f44da0f37cbc5dd66e8fba80a3bee1" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-software-manage=
ment/rpm/commit/57f3711846f44da0f37cbc5dd66e8fba80a3bee1</a>]<br>
&gt; &gt; &gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex=
@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; +---<br>
&gt; &gt; &gt; + CMakeLists.txt=C2=A0 | 1 +<br>
&gt; &gt; &gt; + <a href=3D"http://config.h.in" rel=3D"noreferrer" target=
=3D"_blank">config.h.in</a>=C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt; &gt; &gt; + rpmio/rpmglob.c | 2 ++<br>
&gt; &gt; &gt; + 3 files changed, 4 insertions(+)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; &gt; &gt; +index d0ea565f3..0a474106e 100644<br>
&gt; &gt; &gt; +--- a/CMakeLists.txt<br>
&gt; &gt; &gt; ++++ b/CMakeLists.txt<br>
&gt; &gt; &gt; +@@ -351,6 +351,7 @@ if (LIBDW_FOUND)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0set(HAVE_LIBDW 1)<br>
&gt; &gt; &gt; + endif()<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; ++check_symbol_exists(GLOB_ONLYDIR &quot;glob.h&quot; HAVE_G=
LOB_ONLYDIR)<br>
&gt; &gt; &gt; + check_symbol_exists(major &quot;sys/sysmacros.h&quot; MAJO=
R_IN_SYSMACROS)<br>
&gt; &gt; &gt; + if (NOT MAJOR_IN_SYSMACROS)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0check_symbol_exists(major &quot;=
sys/mkdev.h&quot; MAJOR_IN_MKDEV)<br>
&gt; &gt; &gt; +diff --git a/<a href=3D"http://config.h.in" rel=3D"noreferr=
er" target=3D"_blank">config.h.in</a> b/<a href=3D"http://config.h.in" rel=
=3D"noreferrer" target=3D"_blank">config.h.in</a><br>
&gt; &gt; &gt; +index cb97827d0..ab1757a9a 100644<br>
&gt; &gt; &gt; +--- a/<a href=3D"http://config.h.in" rel=3D"noreferrer" tar=
get=3D"_blank">config.h.in</a><br>
&gt; &gt; &gt; ++++ b/<a href=3D"http://config.h.in" rel=3D"noreferrer" tar=
get=3D"_blank">config.h.in</a><br>
&gt; &gt; &gt; +@@ -100,6 +100,7 @@<br>
&gt; &gt; &gt; + #cmakedefine HAVE_ZSTD @HAVE_ZSTD@<br>
&gt; &gt; &gt; + #cmakedefine HAVE___PROGNAME @HAVE___PROGNAME@<br>
&gt; &gt; &gt; + #cmakedefine HAVE___SECURE_GETENV @HAVE___SECURE_GETENV@<b=
r>
&gt; &gt; &gt; ++#cmakedefine HAVE_GLOB_ONLYDIR @HAVE_GLOB_ONLYDIR@<br>
&gt; &gt; &gt; + #cmakedefine MAJOR_IN_MKDEV @MAJOR_IN_MKDEV@<br>
&gt; &gt; &gt; + #cmakedefine MAJOR_IN_SYSMACROS @MAJOR_IN_SYSMACROS@<br>
&gt; &gt; &gt; + #cmakedefine RUNDIR @rundir@<br>
&gt; &gt; &gt; +diff --git a/rpmio/rpmglob.c b/rpmio/rpmglob.c<br>
&gt; &gt; &gt; +index 8276eddb4..243568766 100644<br>
&gt; &gt; &gt; +--- a/rpmio/rpmglob.c<br>
&gt; &gt; &gt; ++++ b/rpmio/rpmglob.c<br>
&gt; &gt; &gt; +@@ -84,8 +84,10 @@ int rpmGlobPath(const char * pattern, rp=
mglobFlags flags,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0gflags |=3D GLOB_BRACE;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (home !=3D NULL &amp;&amp; strlen(ho=
me) &gt; 0)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gflags |=3D GLOB_TILDE;<br>
&gt; &gt; &gt; ++#if HAVE_GLOB_ONLYDIR<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (dir_only)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gflags |=3D GLOB_ONLYDIR;<br>
&gt; &gt; &gt; ++#endif<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (flags &amp; RPMGLOB_NOCHECK)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gflags |=3D GLOB_NOCHECK;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross=
-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rp=
m/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch<br>
&gt; &gt; &gt; index bd3314a90f8..fc89b44132b 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-When-cross-instal=
ling-execute-package-scriptlets-wit.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-When-cross-instal=
ling-execute-package-scriptlets-wit.patch<br>
&gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; -From a89daa75ac970d8e247edc762d1181e9a5b0c5d0 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From 82e6d1ad126df88c58120a31fc025691039db7f3 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 Date: Tue, 17 Jan 2017 14:07:17 +0200<br>
&gt; &gt; &gt;=C2=A0 Subject: [PATCH] When cross-installing, execute packag=
e scriptlets without<br>
&gt; &gt; &gt; @@ -24,24 +24,16 @@ Amended 2018-07-03 by Olof Johansson &lt=
;<a href=3D"mailto:olofjn@axis.com" target=3D"_blank">olofjn@axis.com</a>&g=
t;:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; &gt; &gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<b=
r>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 ---<br>
&gt; &gt; &gt;=C2=A0 =C2=A0lib/rpmscript.c | 11 ++++++++---<br>
&gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 3 deletions(-)<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -Index: git/lib/rpmscript.c<br>
&gt; &gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; ---- git.orig/lib/rpmscript.c<br>
&gt; &gt; &gt; -+++ git/lib/rpmscript.c<br>
&gt; &gt; &gt; -@@ -18,7 +18,7 @@<br>
&gt; &gt; &gt; - #include &quot;rpmio/rpmio_internal.h&quot;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; - #include &quot;lib/rpmplugins.h&quot;=C2=A0 =C2=A0 =C2=A0/=
* rpm plugins hooks */<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; -+#include &quot;lib/rpmchroot.h&quot;=C2=A0 =C2=A0 =C2=A0 /=
* rpmChrootOut */<br>
&gt; &gt; &gt; - #include &quot;debug.h&quot;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; - struct scriptNextFileFunc_s {<br>
&gt; &gt; &gt; -@@ -427,8 +427,7 @@ exit:<br>
&gt; &gt; &gt; +diff --git a/lib/rpmscript.c b/lib/rpmscript.c<br>
&gt; &gt; &gt; +index b18f851a3..36e37cf77 100644<br>
&gt; &gt; &gt; +--- a/lib/rpmscript.c<br>
&gt; &gt; &gt; ++++ b/lib/rpmscript.c<br>
&gt; &gt; &gt; +@@ -448,8 +448,7 @@ exit:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Fclose(out);=C2=A0 =C2=A0 /=
* XXX dup&#39;d STDOUT_FILENO */<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fn) {<br>
&gt; &gt; &gt; @@ -51,7 +43,7 @@ Index: git/lib/rpmscript.c<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(fn);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0free(mline);<br>
&gt; &gt; &gt; -@@ -462,7 +461,13 @@ rpmRC rpmScriptRun(rpmScript script, i=
nt<br>
&gt; &gt; &gt; +@@ -483,7 +482,13 @@ rpmRC rpmScriptRun(rpmScript script, i=
nt arg1, int arg2, FD_t scriptFd,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc !=3D RPMRC_FAIL) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (script_type &amp; RPMSC=
RIPTLET_EXEC) {<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-build-pack=
.c-do-not-insert-payloadflags-into-.rpm-me.patch b/meta/recipes-devtools/rp=
m/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch<br>
&gt; &gt; &gt; index 64433abb6a1..5820b2e7e5b 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-n=
ot-insert-payloadflags-into-.rpm-me.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-n=
ot-insert-payloadflags-into-.rpm-me.patch<br>
&gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; -From 2d351c666f09cc1b9e368422653fb42ac8b86249 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From ebe65b0e8622c37463697dcec779a42290c33810 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex@lin=
utronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 Date: Tue, 31 Aug 2021 10:37:05 +0200<br>
&gt; &gt; &gt;=C2=A0 Subject: [PATCH] build/pack.c: do not insert payloadfl=
ags into .rpm metadata<br>
&gt; &gt; &gt; @@ -9,15 +9,16 @@ host to the next and breaks reproducibilit=
y for .rpm).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; &gt; &gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 ---<br>
&gt; &gt; &gt;=C2=A0 =C2=A0build/pack.c | 2 +-<br>
&gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -Index: git/build/pack.c<br>
&gt; &gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; ---- git.orig/build/pack.c<br>
&gt; &gt; &gt; -+++ git/build/pack.c<br>
&gt; &gt; &gt; -@@ -328,7 +328,7 @@ static char *getIOFlags(Package pkg)<br=
>
&gt; &gt; &gt; +diff --git a/build/pack.c b/build/pack.c<br>
&gt; &gt; &gt; +index f382c7da0..0889dd993 100644<br>
&gt; &gt; &gt; +--- a/build/pack.c<br>
&gt; &gt; &gt; ++++ b/build/pack.c<br>
&gt; &gt; &gt; +@@ -330,7 +330,7 @@ static char *getIOFlags(Package pkg)<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0headerPutStri=
ng(pkg-&gt;header, RPMTAG_PAYLOADCOMPRESSOR, compr);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D xstrdup(rpmio_flags=
);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf[s - rpmio_flags] =3D &#=
39;\0&#39;;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-configure.=
ac-add-linux-gnux32-variant-to-triplet-han.patch b/meta/recipes-devtools/rp=
m/files/0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch<br>
&gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; index 29b6686a940..00000000000<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-=
linux-gnux32-variant-to-triplet-han.patch<br>
&gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; @@ -1,28 +0,0 @@<br>
&gt; &gt; &gt; -From 8f51462d41d8fe942d5d0a06f08d47f625141995 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutron=
ix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; -Date: Thu, 4 Aug 2022 12:15:08 +0200<br>
&gt; &gt; &gt; -Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a>: add linux-gnux32 variant to tr=
iplet handling<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -x32 is a 64 bit x86 ABI with 32 bit pointers.<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/r=
pm-software-management/rpm/pull/2143" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/rpm-software-management/rpm/pull/2143</a>]<br>
&gt; &gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex=
@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> | 4 ++++<br>
&gt; &gt; &gt; - 1 file changed, 4 insertions(+)<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Index: git/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
&gt; &gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; ---- git.orig/<a href=3D"http://configure.ac" rel=3D"norefer=
rer" target=3D"_blank">configure.ac</a><br>
&gt; &gt; &gt; -+++ git/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a><br>
&gt; &gt; &gt; -@@ -903,6 +903,10 @@ if echo &quot;$host_os&quot; | grep &#=
39;.*-gnux32$&#39; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0host_os=3D`echo &quot;${host_os}=
&quot; | sed &#39;s/-gnux32$//&#39;`<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0host_os_gnu=3D-gnux32<br>
&gt; &gt; &gt; - fi<br>
&gt; &gt; &gt; -+if echo &quot;$host_os&quot; | grep &#39;.*-gnux32$&#39; &=
gt; /dev/null ; then<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 host_os=3D`echo &quot;${host_os}&quot=
; | sed &#39;s/-gnux32$//&#39;`<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 host_os_gnu=3D-gnux32<br>
&gt; &gt; &gt; -+fi<br>
&gt; &gt; &gt; - if echo &quot;$host_os&quot; | grep &#39;.*-gnu$&#39; &gt;=
 /dev/null ; then<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0host_os=3D`echo &quot;${host_os}=
&quot; | sed &#39;s/-gnu$//&#39;`<br>
&gt; &gt; &gt; - fi<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-lib-transa=
ction.c-fix-file-conflicts-for-MIPS64-N32.patch b/meta/recipes-devtools/rpm=
/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch<br>
&gt; &gt; &gt; index 82e6567dc74..8b9f1f72944 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c=
-fix-file-conflicts-for-MIPS64-N32.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c=
-fix-file-conflicts-for-MIPS64-N32.patch<br>
&gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; -From 1ed066fc6fa7d7afffe3545c4e3ea937529e6c49 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From bfceae7386b5fec108f98ad59ad96e57aecb08d3 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt;=C2=A0 From: Changqing Li &lt;<a href=3D"mailto:changqing.li@=
windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 Date: Thu, 7 May 2020 17:40:58 +0800<br>
&gt; &gt; &gt;=C2=A0 Subject: [PATCH] lib/transaction.c: fix file conflicts=
 for MIPS64 N32<br>
&gt; &gt; &gt; @@ -27,15 +27,16 @@ Fixed by performing a &#39;last-in-wins&=
#39; resolution when &quot;neither is preferred&quot;.<br>
&gt; &gt; &gt;=C2=A0 Upstream-Status: Submitted &lt;<a href=3D"https://gith=
ub.com/rpm-software-management/rpm/issues/193" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rpm-software-management/rpm/issues/193</a>&gt;<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 Signed-off-by: Changqing Li &lt;<a href=3D"mailto:chan=
gqing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt=
;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 ---<br>
&gt; &gt; &gt;=C2=A0 =C2=A0lib/transaction.c | 13 ++++++++++++-<br>
&gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 12 insertions(+), 1 deletion(-)<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -Index: git/lib/transaction.c<br>
&gt; &gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; ---- git.orig/lib/transaction.c<br>
&gt; &gt; &gt; -+++ git/lib/transaction.c<br>
&gt; &gt; &gt; -@@ -402,7 +402,18 @@ static int handleColorConflict(rpmts t=
s,<br>
&gt; &gt; &gt; +diff --git a/lib/transaction.c b/lib/transaction.c<br>
&gt; &gt; &gt; +index 70d2587ac..b89b30060 100644<br>
&gt; &gt; &gt; +--- a/lib/transaction.c<br>
&gt; &gt; &gt; ++++ b/lib/transaction.c<br>
&gt; &gt; &gt; +@@ -400,7 +400,18 @@ static int handleColorConflict(rpmts t=
s,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0rpmfsSetAction(ofs, ofx, FA_CREATE);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0rpmfsSetAction(fs, fx, FA_SKIPCOLOR);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0rConflicts =3D 0;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-perl-disab=
le-auto-reqs.patch b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto=
-reqs.patch<br>
&gt; &gt; &gt; index a6c58699d36..388694d234f 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-perl-disable-auto=
-reqs.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto=
-reqs.patch<br>
&gt; &gt; &gt; @@ -1,4 +1,7 @@<br>
&gt; &gt; &gt; -perl: disable auto requires<br>
&gt; &gt; &gt; +From 7894b508a61bb87f05f7eb0a1e912a2422f4fcd2 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver=
.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
&gt; &gt; &gt; +Date: Tue, 15 Aug 2017 16:41:57 -0500<br>
&gt; &gt; &gt; +Subject: [PATCH] perl: disable auto requires<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 When generating automatic requirements, it&#39;s possi=
ble for perl scripts to<br>
&gt; &gt; &gt;=C2=A0 declare &#39;optional&#39; dependencies.=C2=A0 These s=
eem to often be incorrect and will<br>
&gt; &gt; &gt; @@ -10,19 +13,24 @@ Upstream-Status: Inappropriate [OE speci=
fic configuration]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.h=
atle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -Index: git/fileattrs/perl.attr<br>
&gt; &gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; ---- git.orig/fileattrs/perl.attr<br>
&gt; &gt; &gt; -+++ git/fileattrs/perl.attr<br>
&gt; &gt; &gt; +---<br>
&gt; &gt; &gt; + fileattrs/perl.attr=C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt; &gt; + fileattrs/perllib.attr | 2 +-<br>
&gt; &gt; &gt; + 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +diff --git a/fileattrs/perl.attr b/fileattrs/perl.attr<br>
&gt; &gt; &gt; +index 0daef58d5..81ddf5305 100644<br>
&gt; &gt; &gt; +--- a/fileattrs/perl.attr<br>
&gt; &gt; &gt; ++++ b/fileattrs/perl.attr<br>
&gt; &gt; &gt;=C2=A0 @@ -1,3 +1,3 @@<br>
&gt; &gt; &gt;=C2=A0 -%__perl_requires=C2=A0 =C2=A0 =C2=A0 %{_rpmconfigdir}=
/perl.req<br>
&gt; &gt; &gt;=C2=A0 +#__perl_requires=C2=A0 =C2=A0 =C2=A0 %{_rpmconfigdir}=
/perl.req<br>
&gt; &gt; &gt;=C2=A0 =C2=A0%__perl_magic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^=
.*[Pp]erl .*$<br>
&gt; &gt; &gt;=C2=A0 =C2=A0%__perl_flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
xeonly<br>
&gt; &gt; &gt; -Index: git/fileattrs/perllib.attr<br>
&gt; &gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; ---- git.orig/fileattrs/perllib.attr<br>
&gt; &gt; &gt; -+++ git/fileattrs/perllib.attr<br>
&gt; &gt; &gt; +diff --git a/fileattrs/perllib.attr b/fileattrs/perllib.att=
r<br>
&gt; &gt; &gt; +index fcad48099..495a28927 100644<br>
&gt; &gt; &gt; +--- a/fileattrs/perllib.attr<br>
&gt; &gt; &gt; ++++ b/fileattrs/perllib.attr<br>
&gt; &gt; &gt;=C2=A0 @@ -1,5 +1,5 @@<br>
&gt; &gt; &gt;=C2=A0 =C2=A0%__perllib_provides=C2=A0 =C2=A0%{_rpmconfigdir}=
/perl.prov<br>
&gt; &gt; &gt;=C2=A0 -%__perllib_requires=C2=A0 =C2=A0%{_rpmconfigdir}/perl=
.req<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0001-python-Use=
-Py_hash_t-instead-of-long-in-hdr_hash.patch b/meta/recipes-devtools/rpm/fi=
les/0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch<br>
&gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; index d0e637191a8..00000000000<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0001-python-Use-Py_has=
h_t-instead-of-long-in-hdr_hash.patch<br>
&gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; @@ -1,35 +0,0 @@<br>
&gt; &gt; &gt; -From 6ef189c45b763aedac5ef57ed6a5fc125fa95b41 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; -Date: Fri, 3 Mar 2023 09:54:48 -0800<br>
&gt; &gt; &gt; -Subject: [PATCH] python: Use Py_hash_t instead of long in h=
dr_hash<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Fixes<br>
&gt; &gt; &gt; -python/header-py.c:744:2: error: incompatible function poin=
ter types initializing &#39;hashfunc&#39; (aka &#39;int (*)(struct _object =
*)&#39;) with an expression of type &#39;long (PyObject *)&#39; (aka &#39;l=
ong (struct _object *)&#39;) [-Wincompatible-function-pointer-types]<br>
&gt; &gt; &gt; -|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hdr_hash,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* tp_=
hash */<br>
&gt; &gt; &gt; -|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/r=
pm-software-management/rpm/pull/2409" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/rpm-software-management/rpm/pull/2409</a>]<br>
&gt; &gt; &gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt; - python/header-py.c | 4 ++--<br>
&gt; &gt; &gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -diff --git a/python/header-py.c b/python/header-py.c<br>
&gt; &gt; &gt; -index 0aed0c9267..c15503f359 100644<br>
&gt; &gt; &gt; ---- a/python/header-py.c<br>
&gt; &gt; &gt; -+++ b/python/header-py.c<br>
&gt; &gt; &gt; -@@ -316,9 +316,9 @@ static PyObject * hdr_dsOfHeader(PyObje=
ct * s)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(Oi)&quot=
;, s, RPMTAG_NEVR);<br>
&gt; &gt; &gt; - }<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; --static long hdr_hash(PyObject * h)<br>
&gt; &gt; &gt; -+static Py_hash_t hdr_hash(PyObject * h)<br>
&gt; &gt; &gt; - {<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 return (long) h;<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 return (Py_hash_t) h;<br>
&gt; &gt; &gt; - }<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; - static PyObject * hdr_reduce(hdrObject *s)<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; -2.39.2<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0002-Add-suppor=
t-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch b/meta/recipes-devtools/rp=
m/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch<br>
&gt; &gt; &gt; index 2fe96a839c3..89c23f81975 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0002-Add-support-for-p=
refixing-etc-from-RPM_ETCCONFIGDIR-.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0002-Add-support-for-p=
refixing-etc-from-RPM_ETCCONFIGDIR-.patch<br>
&gt; &gt; &gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; &gt; -From 383c0b097b7eba16801a9e3c4b8e36a4b6de74ab Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From e53c0e2586bc6f4677db3c6898a6428283a6b785 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 Date: Fri, 20 Jan 2017 13:33:05 +0200<br>
&gt; &gt; &gt; -Subject: [PATCH 2/2] Add support for prefixing /etc from RP=
M_ETCCONFIGDIR<br>
&gt; &gt; &gt; +Subject: [PATCH] Add support for prefixing /etc from RPM_ET=
CCONFIGDIR<br>
&gt; &gt; &gt;=C2=A0 =C2=A0environment variable<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 This is needed so that rpm can pick up target-specific=
 configuration<br>
&gt; &gt; &gt; @@ -9,15 +9,16 @@ from target rootfs instead of its own nati=
ve sysroot.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; &gt; &gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<b=
r>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 ---<br>
&gt; &gt; &gt;=C2=A0 =C2=A0lib/rpmrc.c | 19 ++++++++++++++-----<br>
&gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 14 insertions(+), 5 deletions(-)=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -Index: git/lib/rpmrc.c<br>
&gt; &gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; ---- git.orig/lib/rpmrc.c<br>
&gt; &gt; &gt; -+++ git/lib/rpmrc.c<br>
&gt; &gt; &gt; -@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(con=
st<br>
&gt; &gt; &gt; +diff --git a/lib/rpmrc.c b/lib/rpmrc.c<br>
&gt; &gt; &gt; +index f39dcfc11..f27f88753 100644<br>
&gt; &gt; &gt; +--- a/lib/rpmrc.c<br>
&gt; &gt; &gt; ++++ b/lib/rpmrc.c<br>
&gt; &gt; &gt; +@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(con=
st char * name,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0static void setDefaults(void)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0{<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *confdir =3D rpmConfigD=
ir();<br>
&gt; &gt; &gt; @@ -27,26 +28,26 @@ Index: git/lib/rpmrc.c<br>
&gt; &gt; &gt;=C2=A0 +<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!defrcfiles) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defrcfiles =3D rstrscat(NUL=
L, confdir, &quot;/rpmrc&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0confdir, &quot;/&quot; =
RPMCANONVENDOR &quot;/rpmrc&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSCONFDIR &quot;/rpmrc&qu=
ot;, &quot;:&quot;);<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 etcconfdir, SYSCONFDIR &qu=
ot;/rpmrc&quot;, &quot;:&quot;, NULL);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0confdir, &quot;/&quot; =
RPM_VENDOR &quot;/rpmrc&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSCONFDIR &quot;/rpmrc&qu=
ot;, NULL);<br>
&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 etcconfdir, SYSCONFDIR &qu=
ot;/rpmrc&quot;, NULL);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0#ifndef MACROFILES<br>
&gt; &gt; &gt;=C2=A0 @@ -468,9 +472,9 @@ static void setDefaults(void)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0confdir, &quot;/=
platform/%{_target}/macros&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0confdir, &quot;/=
fileattrs/*.attr&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0confdir, &quot;/&quot; =
RPMCANONVENDOR &quot;/macros&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0confdir, &quot;/&quot; =
RPM_VENDOR &quot;/macros&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSCONFDIR &quot;/rpm/=
macros.*&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSCONFDIR &quot;/rpm/=
macros&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSCONFDIR &quot;/rpm/%{_t=
arget}/macros&quot;, &quot;:&quot;);<br>
&gt; &gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSCONFDIR &quot;/rpm/%{_t=
arget}/macros&quot;, NULL);<br>
&gt; &gt; &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 etcconfdir, SYSCONFDIR=
 &quot;/rpm/macros.*&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 etcconfdir, SYSCONFDIR=
 &quot;/rpm/macros&quot;, &quot;:&quot;,<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 etcconfdir, SYSCONFDIR &qu=
ot;/rpm/%{_target}/macros&quot;, &quot;:&quot;, NULL);<br>
&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 etcconfdir, SYSCONFDIR &qu=
ot;/rpm/%{_target}/macros&quot;, NULL);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;=C2=A0 =C2=A0#else<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0macrofiles =3D MACROFILES;<br>
&gt; &gt; &gt; -@@ -997,7 +1001,11 @@ static void read_auxv(void)<br>
&gt; &gt; &gt; +@@ -1114,7 +1118,11 @@ static void read_auxv(void)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 */<br>
&gt; &gt; &gt;=C2=A0 =C2=A0static void defaultMachine(rpmrcCtx ctx, const c=
har ** arch, const char ** os)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0{<br>
&gt; &gt; &gt; @@ -59,7 +60,7 @@ Index: git/lib/rpmrc.c<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0static struct utsname un;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char * chptr;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0canonEntry canon;<br>
&gt; &gt; &gt; -@@ -1307,6 +1315,7 @@ static void defaultMachine(rpmrcCtx c=
tx,<br>
&gt; &gt; &gt; +@@ -1434,6 +1442,7 @@ static void defaultMachine(rpmrcCtx c=
tx, const char ** arch, const char ** os)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (arch) *arch =3D un.machine;<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (os) *os =3D un.sysname;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0002-docs-CMake=
Lists.txt-do-not-install-non-existent-docs.patch b/meta/recipes-devtools/rp=
m/files/0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 00000000000..e7f0adc70c9<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.t=
xt-do-not-install-non-existent-docs.patch<br>
&gt; &gt; &gt; @@ -0,0 +1,26 @@<br>
&gt; &gt; &gt; +From 4e388caabf0906f09d697b8d08623a022f7270b2 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutron=
ix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; +Date: Wed, 29 Nov 2023 14:09:06 +0100<br>
&gt; &gt; &gt; +Subject: [PATCH] docs/CMakeLists.txt: do not install non-ex=
istent docs/html<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Building html would require doxygen-native.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; &gt; &gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex=
@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +---<br>
&gt; &gt; &gt; + docs/CMakeLists.txt | 1 -<br>
&gt; &gt; &gt; + 1 file changed, 1 deletion(-)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +diff --git a/docs/CMakeLists.txt b/docs/CMakeLists.txt<br>
&gt; &gt; &gt; +index 52dce7b4e..c01ff7757 100644<br>
&gt; &gt; &gt; +--- a/docs/CMakeLists.txt<br>
&gt; &gt; &gt; ++++ b/docs/CMakeLists.txt<br>
&gt; &gt; &gt; +@@ -18,7 +18,6 @@ if (DOXYGEN_FOUND)<br>
&gt; &gt; &gt; + elseif (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/html/index.html=
)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0set(doxsrc ${CMAKE_CURRENT_SOURC=
E_DIR})<br>
&gt; &gt; &gt; + endif()<br>
&gt; &gt; &gt; +-install(DIRECTORY ${doxsrc}/html/ DESTINATION ${CMAKE_INST=
ALL_DOCDIR}/API)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; + install(FILES<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0README.md<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0002-rpmio-rpmg=
lob.c-avoid-using-GLOB_BRACE-if-undefined-.patch b/meta/recipes-devtools/rp=
m/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 00000000000..3d4b09bedb6<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-a=
void-using-GLOB_BRACE-if-undefined-.patch<br>
&gt; &gt; &gt; @@ -0,0 +1,34 @@<br>
&gt; &gt; &gt; +From f78e05544fb5ae9ef688963f19666f1af34c3d5c Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutron=
ix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; +Date: Tue, 16 Jan 2024 09:59:26 +0100<br>
&gt; &gt; &gt; +Subject: [PATCH] rpmio/rpmglob.c: avoid using GLOB_BRACE if=
 undefined by C<br>
&gt; &gt; &gt; + library<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +This addresses musl failures; if there is code out there re=
lying on<br>
&gt; &gt; &gt; +those braces, it needs to be fixed when used on musl.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +This is unlikely to be trivially fixable upstream.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Upstream-Status: Inappropriate [reported at <a href=3D"http=
s://github.com/rpm-software-management/rpm/issues/2844" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/rpm-software-management/rpm/issues/284=
4</a>]<br>
&gt; &gt; &gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex=
@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; +---<br>
&gt; &gt; &gt; + rpmio/rpmglob.c | 6 ++++++<br>
&gt; &gt; &gt; + 1 file changed, 6 insertions(+)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +diff --git a/rpmio/rpmglob.c b/rpmio/rpmglob.c<br>
&gt; &gt; &gt; +index 243568766..43c27074a 100644<br>
&gt; &gt; &gt; +--- a/rpmio/rpmglob.c<br>
&gt; &gt; &gt; ++++ b/rpmio/rpmglob.c<br>
&gt; &gt; &gt; +@@ -33,6 +33,12 @@<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; + #include &quot;debug.h&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; ++/* Don&#39;t fail if the standard C library<br>
&gt; &gt; &gt; +++ * doesn&#39;t provide brace expansion */<br>
&gt; &gt; &gt; ++#ifndef GLOB_BRACE<br>
&gt; &gt; &gt; ++#define GLOB_BRACE 0<br>
&gt; &gt; &gt; ++#endif<br>
&gt; &gt; &gt; ++<br>
&gt; &gt; &gt; + /* Return 1 if pattern contains a magic char, see glob(7) =
for a list */<br>
&gt; &gt; &gt; + static int ismagic(const char *pattern)<br>
&gt; &gt; &gt; + {<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/0016-rpmscript.=
c-change-logging-level-around-scriptlets-t.patch b/meta/recipes-devtools/rp=
m/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch<br>
&gt; &gt; &gt; index 9dbe7125ded..b3d57cc8703 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-chang=
e-logging-level-around-scriptlets-t.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-chang=
e-logging-level-around-scriptlets-t.patch<br>
&gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; -From 989e425d416474c191b020d0825895e3df4bd033 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From 0005ab544230020e854e9709b2bc0501702c2968 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kan=
avin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 Date: Thu, 10 Jan 2019 18:14:18 +0100<br>
&gt; &gt; &gt;=C2=A0 Subject: [PATCH] rpmscript.c: change logging level aro=
und scriptlets to INFO<br>
&gt; &gt; &gt; @@ -9,15 +9,16 @@ irrelevant noise to rootfs logs.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; &gt; &gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<b=
r>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 ---<br>
&gt; &gt; &gt;=C2=A0 =C2=A0lib/rpmscript.c | 8 ++++----<br>
&gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -Index: git/lib/rpmscript.c<br>
&gt; &gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; ---- git.orig/lib/rpmscript.c<br>
&gt; &gt; &gt; -+++ git/lib/rpmscript.c<br>
&gt; &gt; &gt; -@@ -270,7 +270,7 @@ static char * writeScript(const char *c=
m<br>
&gt; &gt; &gt; +diff --git a/lib/rpmscript.c b/lib/rpmscript.c<br>
&gt; &gt; &gt; +index 37ada014c..bab0c97a6 100644<br>
&gt; &gt; &gt; +--- a/lib/rpmscript.c<br>
&gt; &gt; &gt; ++++ b/lib/rpmscript.c<br>
&gt; &gt; &gt; +@@ -291,7 +291,7 @@ static char * writeScript(const char *c=
md, const char *script)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (Ferror(fd))<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -26,7 +27,7 @@ Index: git/lib/rpmscript.c<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static const char set_x[] =
=3D &quot;set -x\n&quot;;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Assume failures will be =
caught by the write below */<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Fwrite(set_x, sizeof(set_x[=
0]), sizeof(set_x)-1, fd);<br>
&gt; &gt; &gt; -@@ -302,7 +302,7 @@ static rpmRC runExtScript(rpmPlugins pl=
u<br>
&gt; &gt; &gt; +@@ -323,7 +323,7 @@ static rpmRC runExtScript(rpmPlugins pl=
ugins, ARGV_const_t prefixes,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *mline =3D NULL;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rpmRC rc =3D RPMRC_FAIL;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -35,7 +36,7 @@ Index: git/lib/rpmscript.c<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (script) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fn =3D writeScript(*argvp[0=
], script);<br>
&gt; &gt; &gt; -@@ -354,7 +354,7 @@ static rpmRC runExtScript(rpmPlugins pl=
u<br>
&gt; &gt; &gt; +@@ -375,7 +375,7 @@ static rpmRC runExtScript(rpmPlugins pl=
ugins, ARGV_const_t prefixes,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sname, strerror(errno));<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (pid =3D=3D 0) {/* Child=
 */<br>
&gt; &gt; &gt; @@ -44,7 +45,7 @@ Index: git/lib/rpmscript.c<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sname=
, *argvp[0], (unsigned)getpid());<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(in);<br>
&gt; &gt; &gt; -@@ -397,7 +397,7 @@ static rpmRC runExtScript(rpmPlugins pl=
u<br>
&gt; &gt; &gt; +@@ -418,7 +418,7 @@ static rpmRC runExtScript(rpmPlugins pl=
ugins, ARGV_const_t prefixes,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reaped =3D waitpid(pid, &am=
p;status, 0);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (reaped =3D=3D -1 &amp;&am=
p; errno =3D=3D EINTR);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/ea3187cfcf9cac8=
7e5bc5e7db79b0338da9e355e.patch b/meta/recipes-devtools/rpm/files/ea3187cfc=
f9cac87e5bc5e7db79b0338da9e355e.patch<br>
&gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; index 470dda1dcfb..00000000000<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5e=
7db79b0338da9e355e.patch<br>
&gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; @@ -1,51 +0,0 @@<br>
&gt; &gt; &gt; -From ea3187cfcf9cac87e5bc5e7db79b0338da9e355e Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; -From: Panu Matilainen &lt;<a href=3D"mailto:pmatilai@redhat=
.com" target=3D"_blank">pmatilai@redhat.com</a>&gt;<br>
&gt; &gt; &gt; -Date: Mon, 26 Jun 2023 12:45:09 +0300<br>
&gt; &gt; &gt; -Subject: [PATCH] Don&#39;t muck with per-process global sql=
ite configuration from<br>
&gt; &gt; &gt; - the db backend<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -sqlite3_config() affects all in-process uses of sqlite. lib=
rpm being a<br>
&gt; &gt; &gt; -low-level library, it has no business whatsoever making suc=
h decisions<br>
&gt; &gt; &gt; -for the applications running on top of it. Besides that, th=
e callback can<br>
&gt; &gt; &gt; -easily end up pointing to an already closed database, causi=
ng an<br>
&gt; &gt; &gt; -innocent API user to crash in librpm on an entirely unrelat=
ed error on<br>
&gt; &gt; &gt; -some other database. &quot;Oops.&quot;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -The sqlite API doesn&#39;t seem to provide any per-db or no=
n-global context<br>
&gt; &gt; &gt; -for logging errors, thus we can only remove the call and le=
t sqlite output<br>
&gt; &gt; &gt; -errors the way it pleases (print through stderr, presumably=
).<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Thanks to Jan Palus for spotting and reporting!<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Upstream-Status: Backport [<a href=3D"https://github.com/rp=
m-software-management/rpm/commit/ea3187cfcf9cac87e5bc5e7db79b0338da9e355e" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-software-manage=
ment/rpm/commit/ea3187cfcf9cac87e5bc5e7db79b0338da9e355e</a>]<br>
&gt; &gt; &gt; -Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mitta=
l@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt; - lib/backend/sqlite.c | 8 --------<br>
&gt; &gt; &gt; - 1 file changed, 8 deletions(-)<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -diff --git a/lib/backend/sqlite.c b/lib/backend/sqlite.c<br=
>
&gt; &gt; &gt; -index 5a029d575a..b612732267 100644<br>
&gt; &gt; &gt; ---- a/lib/backend/sqlite.c<br>
&gt; &gt; &gt; -+++ b/lib/backend/sqlite.c<br>
&gt; &gt; &gt; -@@ -44,13 +44,6 @@ static void rpm_match3(sqlite3_context *=
sctx, int argc, sqlite3_value **argv)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0sqlite3_result_int(sctx, match);<br>
&gt; &gt; &gt; - }<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; --static void errCb(void *data, int err, const char *msg)<br=
>
&gt; &gt; &gt; --{<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 rpmdb rdb =3D data;<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 rpmlog(RPMLOG_WARNING, &quot;%s: %s: %s\n&qu=
ot;,<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdb-&gt;d=
b_descr, sqlite3_errstr(err), msg);<br>
&gt; &gt; &gt; --}<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; - static int dbiCursorReset(dbiCursor dbc)<br>
&gt; &gt; &gt; - {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (dbc-&gt;stmt) {<br>
&gt; &gt; &gt; -@@ -170,7 +163,6 @@ static int sqlite_init(rpmdb rdb, const=
 char * dbhome)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the &quot;database is locked&=
quot; errors at every cost<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sqlite3_busy_timeout(sdb, 10000)=
;<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 =C2=A0 sqlite3_config(SQLITE_CONFIG_LOG, err=
Cb, rdb);<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sqlexec(sdb, &quot;PRAGMA secure=
_delete =3D OFF&quot;);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sqlexec(sdb, &quot;PRAGMA case_s=
ensitive_like =3D ON&quot;);<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/files/fix-declaration=
.patch b/meta/recipes-devtools/rpm/files/fix-declaration.patch<br>
&gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; index e5c84ebd498..00000000000<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/files/fix-declaration.patch<=
br>
&gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; @@ -1,39 +0,0 @@<br>
&gt; &gt; &gt; -From b960c0b43a080287a7c13533eeb2d9f288db1414 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; -From: Florian Festi &lt;<a href=3D"mailto:ffesti@redhat.com=
" target=3D"_blank">ffesti@redhat.com</a>&gt;<br>
&gt; &gt; &gt; -Date: Thu, 16 Mar 2023 19:05:04 +0100<br>
&gt; &gt; &gt; -Subject: [PATCH] Fix compiler error on clang<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Turns out variable declarations are not allowed after a lab=
el, even in<br>
&gt; &gt; &gt; -C99. And while some compilers don&#39;t seem to care others=
 do.<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Moving the declaration of mayopen to the start of the funct=
ion to avoid<br>
&gt; &gt; &gt; -this problem.<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Resolves: #2435<br>
&gt; &gt; &gt; -Upstream-Status: Backport [<a href=3D"https://github.com/rp=
m-software-management/rpm/commit/b960c0b43a080287a7c13533eeb2d9f288db1414" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-software-manage=
ment/rpm/commit/b960c0b43a080287a7c13533eeb2d9f288db1414</a>]<br>
&gt; &gt; &gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex=
@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt; - lib/fsm.c | 3 ++-<br>
&gt; &gt; &gt; - 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -diff --git a/lib/fsm.c b/lib/fsm.c<br>
&gt; &gt; &gt; -index 5671ac642d..183293edb0 100644<br>
&gt; &gt; &gt; ---- a/lib/fsm.c<br>
&gt; &gt; &gt; -+++ b/lib/fsm.c<br>
&gt; &gt; &gt; -@@ -879,6 +879,7 @@ int rpmPackageFilesInstall(rpmts ts, rp=
mte te, rpmfiles files,<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0int nodigest =3D (rpmtsFlags(ts) &amp; =
RPMTRANS_FLAG_NOFILEDIGEST) ? 1 : 0;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0int nofcaps =3D (rpmtsFlags(ts) &amp; R=
PMTRANS_FLAG_NOCAPS) ? 1 : 0;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0int firstlinkfile =3D -1;<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 int mayopen =3D 0;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0char *tid =3D NULL;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct filedata_s *fdata =3D xcalloc(fc=
, sizeof(*fdata));<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct filedata_s *firstlink =3D NULL;<=
br>
&gt; &gt; &gt; -@@ -1016,7 +1017,7 @@ int rpmPackageFilesInstall(rpmts ts, =
rpmte te, rpmfiles files,<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; - setmeta:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Special files r=
equire path-based ops */<br>
&gt; &gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mayopen =3D S_ISREG=
(fp-&gt;sb.st_mode) || S_ISDIR(fp-&gt;sb.st_mode);<br>
&gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mayopen =3D S_ISREG(fp-=
&gt;sb.st_mode) || S_ISDIR(fp-&gt;sb.st_mode);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rc &amp;&amp;=
 fd =3D=3D -1 &amp;&amp; mayopen) {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int =
flags =3D O_RDONLY;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* O=
nly follow safe symlinks, and never on temporary files */<br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm=
_4.18.1.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.18.1.bb</a> b/meta/r=
ecipes-devtools/rpm/<a href=3D"http://rpm_4.19.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">rpm_4.19.1.bb</a><br>
&gt; &gt; &gt; similarity index 72%<br>
&gt; &gt; &gt; rename from meta/recipes-devtools/rpm/<a href=3D"http://rpm_=
4.18.1.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.18.1.bb</a><br>
&gt; &gt; &gt; rename to meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.=
19.1.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.19.1.bb</a><br>
&gt; &gt; &gt; index 3e85cbb8efe..af11dec5ef3 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18.1=
.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.18.1.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.19.1=
.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.19.1.bb</a><br>
&gt; &gt; &gt; @@ -24,7 +24,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.r=
pm.org" rel=3D"noreferrer" target=3D"_blank">http://www.rpm.org</a>&quot;<b=
r>
&gt; &gt; &gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; &gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc4eec0=
c20c6034b9407a09945b48a43f&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-so=
ftware-management/rpm;branch=3Drpm-4.18.x;protocol=3Dhttps" rel=3D"noreferr=
er" target=3D"_blank">github.com/rpm-software-management/rpm;branch=3Drpm-4=
.18.x;protocol=3Dhttps</a> \<br>
&gt; &gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-so=
ftware-management/rpm;branch=3Drpm-4.19.x;protocol=3Dhttps" rel=3D"noreferr=
er" target=3D"_blank">github.com/rpm-software-management/rpm;branch=3Drpm-4=
.19.x;protocol=3Dhttps</a> \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-D=
o-not-add-an-unsatisfiable-dependency-when-building.patch \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-D=
o-not-read-config-files-from-HOME.patch \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-W=
hen-cross-installing-execute-package-scriptlets-wit.patch \<br>
&gt; &gt; &gt; @@ -36,58 +36,51 @@ SRC_URI =3D &quot;git://<a href=3D"http:=
//github.com/rpm-software-management/rpm;branch=3Drpm-4.18.x;protoc" rel=3D=
"noreferrer" target=3D"_blank">github.com/rpm-software-management/rpm;branc=
h=3Drpm-4.18.x;protoc</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0016-r=
pmscript.c-change-logging-level-around-scriptlets-t.patch \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-l=
ib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-b=
uild-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-config=
ure.ac-add-linux-gnux32-variant-to-triplet-han.patch \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-python=
-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-declara=
tion.patch \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ea3187cfcf9=
cac87e5bc5e7db79b0338da9e355e.patch \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Duplic=
ate-filename-before-passing-it-to-basename.patch \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-mi=
ssing-basename-include-on-macOS.patch \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-CMakeL=
ists.txt-look-for-lua-with-pkg-config-rather-t.patch \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-docs-C=
MakeLists.txt-do-not-install-non-existent-docs.patch \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-rpmio-=
rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-un=
conditional-dependency-on-non-POSIX-GLOB_ONLYD.patch \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-CMakeL=
ists.txt-restore-readline-support-as-an-explic.patch \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 PE =3D &quot;1&quot;<br>
&gt; &gt; &gt; -SRCREV =3D &quot;4588bc3f994338502d2770ad24cbfcdaa6c335ec&q=
uot;<br>
&gt; &gt; &gt; +SRCREV =3D &quot;98b301ebb44fb5cabb56fc24bc3aaa437c47c038&q=
uot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -DEPENDS =3D &quot;lua libgcrypt file popt xz bzip2 elfutils=
 python3&quot;<br>
&gt; &gt; &gt; +DEPENDS =3D &quot;lua libgcrypt file popt xz bzip2 elfutils=
 python3 sqlite3 zstd&quot;<br>
&gt; &gt; &gt;=C2=A0 DEPENDS:append:class-native =3D &quot; file-replacemen=
t-native bzip2-replacement-native&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -inherit autotools gettext pkgconfig python3native<br>
&gt; &gt; &gt; -export PYTHON_ABI<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -AUTOTOOLS_AUXDIR =3D &quot;${S}/build-aux&quot;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -# OE-core patches autoreconf to additionally run gnu-config=
ize, which fails with this recipe<br>
&gt; &gt; &gt; -EXTRA_AUTORECONF:append =3D &quot; --exclude=3Dgnu-configiz=
e&quot;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -# Vendor is detected differently on x86 and aarch64 hosts a=
nd can feed into target packages<br>
&gt; &gt; &gt; -EXTRA_OECONF:append =3D &quot; --enable-python --with-crypt=
o=3Dlibgcrypt --with-vendor=3Dpc&quot;<br>
&gt; &gt; &gt; -EXTRA_OECONF:append:libc-musl =3D &quot; --disable-nls --di=
sable-openmp&quot;<br>
&gt; &gt; &gt; +EXTRA_OECMAKE:append:libc-musl =3D &quot; -DENABLE_NLS=3DOF=
F -DENABLE_OPENMP=3DOFF&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 # --sysconfdir prevents rpm from attempting to access =
machine-specific configuration in sysroot/etc; we need to have it in rootfs=
<br>
&gt; &gt; &gt;=C2=A0 # --localstatedir prevents rpm from writing its databa=
se to native sysroot when building images<br>
&gt; &gt; &gt; -# Forcibly disable plugins for native/nativesdk, as the inh=
ibit and prioreset<br>
&gt; &gt; &gt; -# plugins both behave badly inside builds.<br>
&gt; &gt; &gt; -EXTRA_OECONF:append:class-native =3D &quot; --sysconfdir=3D=
/etc --localstatedir=3D/var --disable-plugins&quot;<br>
&gt; &gt; &gt; -EXTRA_OECONF:append:class-nativesdk =3D &quot; --sysconfdir=
=3D/etc --disable-plugins&quot;<br>
&gt; &gt; &gt; +EXTRA_OECMAKE:append:class-native =3D &quot; -DCMAKE_INSTAL=
L_SYSCONFDIR:PATH=3D/etc -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=3D/var&quot;<br=
>
&gt; &gt; &gt; +EXTRA_OECMAKE:append:class-nativesdk =3D &quot; -DCMAKE_INS=
TALL_FULL_SYSCONFDIR=3D/etc&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +inherit cmake gettext pkgconfig python3targetconfig<br>
&gt; &gt; &gt; +OECMAKE_GENERATOR =3D &quot;Unix Makefiles&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;systemd&#39;, &#39;inhibit&#39;, &#39;&#39;, d)} sqlite=
 zstd&quot;<br>
&gt; &gt; &gt; -# The inhibit plugin serves no purpose outside of the targe=
t<br>
&gt; &gt; &gt; -PACKAGECONFIG:remove:class-native =3D &quot;inhibit&quot;<b=
r>
&gt; &gt; &gt; -PACKAGECONFIG:remove:class-nativesdk =3D &quot;inhibit&quot=
;<br>
&gt; &gt; &gt; +PACKAGECONFIG ??=3D &quot;internal-openpgp&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -PACKAGECONFIG[imaevm] =3D &quot;--with-imaevm,,ima-evm-util=
s&quot;<br>
&gt; &gt; &gt; -PACKAGECONFIG[inhibit] =3D &quot;--enable-inhibit-plugin,--=
disable-inhibit-plugin,dbus&quot;<br>
&gt; &gt; &gt; -PACKAGECONFIG[rpm2archive] =3D &quot;--with-archive,--witho=
ut-archive,libarchive&quot;<br>
&gt; &gt; &gt; -PACKAGECONFIG[sqlite] =3D &quot;--enable-sqlite=3Dyes,--ena=
ble-sqlite=3Dno,sqlite3&quot;<br>
&gt; &gt; &gt; -PACKAGECONFIG[readline] =3D &quot;--with-readline,--without=
-readline,readline&quot;<br>
&gt; &gt; &gt; -PACKAGECONFIG[ndb] =3D &quot;--enable-ndb,--disable-ndb&quo=
t;<br>
&gt; &gt; &gt; -PACKAGECONFIG[bdb-ro] =3D &quot;--enable-bdb-ro,--disable-b=
db-ro&quot;<br>
&gt; &gt; &gt; -PACKAGECONFIG[zstd] =3D &quot;--enable-zstd=3Dyes,--enable-=
zstd=3Dno,zstd&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[plugins] =3D &quot;-DENABLE_PLUGINS=3DON,-DEN=
ABLE_PLUGINS=3DOFF&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[testsuite] =3D &quot;-DENABLE_TESTSUITE=3DON,=
-DENABLE_TESTSUITE=3DOFF&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -ASNEEDED =3D &quot;&quot;<br>
&gt; &gt; &gt; +# Deprecated! <a href=3D"https://fedoraproject.org/wiki/Cha=
nges/RpmSequoia" rel=3D"noreferrer" target=3D"_blank">https://fedoraproject=
.org/wiki/Changes/RpmSequoia</a><br>
&gt; &gt; &gt; +PACKAGECONFIG[internal-openpgp] =3D &quot;-DWITH_INTERNAL_O=
PENPGP=3DON,-DWITH_INTERNAL_OPENPGP=3DOFF&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +PACKAGECONFIG[cap] =3D &quot;-DWITH_CAP=3DON,-DWITH_CAP=3DO=
FF&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[acl] =3D &quot;-DWITH_ACL=3DON,-DWITH_ACL=3DO=
FF&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[archive] =3D &quot;-DWITH_ARCHIVE=3DON,-DWITH=
_ARCHIVE=3DOFF,libarchive&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[selinux] =3D &quot;-DWITH_SELINUX=3DON,-DWITH=
_SELINUX=3DOFF&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[dbus] =3D &quot;-DWITH_DBUS=3DON,-DWITH_DBUS=
=3DOFF&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[audit] =3D &quot;-DWITH_AUDIT=3DON,-DWITH_AUD=
IT=3DOFF&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[fsverity] =3D &quot;-DWITH_FSVERITY=3DON,-DWI=
TH_FSVERITY=3DOFF&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[imaevm] =3D &quot;-DWITH_IMAEVM=3DON,-DWITH_I=
MAEVM=3DOFF&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[fapolicyd] =3D &quot;-DWITH_FAPOLICYD=3DON,-D=
WITH_FAPOLICYD=3DOFF&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[readline] =3D &quot;-DWITH_READLINE=3DON,-DWI=
TH_READLINE=3DOFF,readline&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 # Direct rpm-native to read configuration from our sys=
root, not the one it was compiled in<br>
&gt; &gt; &gt;=C2=A0 # libmagic also has sysroot path contamination, so ove=
rride it<br>
&gt; &gt; &gt; @@ -105,10 +98,6 @@ WRAPPER_TOOLS =3D &quot; \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0${libdir}/rpm/rpmdeps \<br>
&gt; &gt; &gt;=C2=A0 &quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -do_configure:prepend() {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${S}/build-aux<br>
&gt; &gt; &gt; -}<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt;=C2=A0 do_install:append:class-native() {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for tool in ${WRAPPER_TOOL=
S}; do<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 test -x ${D}$tool &amp;&amp; create_wrapper ${D}$tool \<br>
&gt; &gt; &gt; @@ -143,6 +132,7 @@ do_install:append:class-nativesdk() {<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 do_install:append () {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s:${HOSTTOOL=
S_DIR}/::g&#39; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s:${STAGI=
NG_DIR_NATIVE}/::g&#39; \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${libdir=
}/rpm/macros<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; @@ -166,6 +156,7 @@ FILES:${PN}-build =3D &quot;\<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/rpm/check-* \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/rpm/sepdebugcrcfix \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/rpm/find-lang.sh \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 ${libdir}/rpm/sysusers.sh \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/rpm/*provides* \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/rpm/*requires* \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/rpm/*deps* \<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.39.2<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194457): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194457" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194457</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103975822/361=
8418" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103975822/3618418</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [matt@madison.systems]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c8d3c90610148bdd--

