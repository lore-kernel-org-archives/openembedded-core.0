Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A913C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 14:53:25 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.29800.1660748001734121591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 07:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nCpqbrnP;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id t5so17802887edc.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=7q8ABa37RdqZmA+eOKQZ6ncqRrwuBS8a2AZ9OOa17uo=;
        b=nCpqbrnPzH1BJZHOFDTuUDjLpfaegFy9VNiffkoBQcK69orYPTRPDv6j1GSYlJL3Qm
         nUBHhPGmcjGG6ahj6ge4TcMsxdWG+hD0QDQyUWQwT/e7BVzS4llIFCyyJKob966akyfs
         KidNCtXxkRauY3BA9t1OE2EFKtWdbx0nb9G8asqpUJo8PlKuZd0XqAVlgyZ6dGv/Ekmy
         MZb4zXhKD9mOtww8AhD8VeCWgXxLjVzaNYNMnA7uTZEBfifPrtnljMWgODRkbfTC7zdC
         lsLTsRJzeUT3sZ2NIfbgox+HBBTodv2ITDy6VrpQPlcegpXQIJRk2aUO1VwToW01cTBS
         CTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=7q8ABa37RdqZmA+eOKQZ6ncqRrwuBS8a2AZ9OOa17uo=;
        b=usBQACQvgkPs2WjOabJ/He0HvL4hXKiuXGF6LV1MX4XsdkDBus/pEdlNUQpW/27rMe
         HHxkBb991/6jtfOMmSZ3bm+VQwWxoL4ZOW3fKLCPQ1LC3w10tmicCw18LgzEb6/+IRsD
         r4MDmUjcYnJ39+NM77j6AnQF015fQbz87DOpU3R/hQ0GNOicoMj4AcvOM181VmZFfJ+E
         XZwnKHFUMo7rXnVj9zekhsjV7Oj28qsTHPIGmhpMGpEMZyZsQ3oSvA1djaiSNhYQE0zB
         OpdEMZmRuUwPqi2O3cpbzYk5rV4sZYRLRkgZdF32sPfbk/zRk8WbNnxazWAQZ0FlDUL4
         DvAg==
X-Gm-Message-State: ACgBeo28SNiJ8RQqjE7kWaC5sxG0SmwyteDE/AZKKD244XXcUxUOd1Im
	1yWhbHWUAggN95lJDM/LOu4I8onBshq80z0i2oDabA==
X-Google-Smtp-Source: 
 AA6agR42p6jMfJT8LWk0iQsRubPFkDlwHZ1YdG7MxJrQ48f/Lk1RdNcIr/RcngAZGlMF9MqirHfqjuSrJ5f1nVKmgsk=
X-Received: by 2002:a05:6402:e96:b0:443:a086:e3e8 with SMTP id
 h22-20020a0564020e9600b00443a086e3e8mr15559328eda.330.1660748000148; Wed, 17
 Aug 2022 07:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <17094AB0976F2F91.7414@lists.openembedded.org>
 <Yvz74zSeKsf8e9ky@korppu>
In-Reply-To: <Yvz74zSeKsf8e9ky@korppu>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 17 Aug 2022 04:53:09 -1000
Message-ID: 
 <CAOSpxdZtAYiPL+utL4GtOdZ_LqrJHT6zmUDRYfmRaKG3ruhS7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][kirkstone] boost: fix install of fiber shared
 libraries
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 14:53:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169489

On Wed, Aug 17, 2022 at 4:32 AM <Mikko.Rapeli@bmw.de> wrote:

> Is there a problem applying this to kirkstone? Master and other
> branches are not affected.

No problem, it is in the patch set currently under test.  You can
always see what I am currently testing here:

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Your patch came after the 4.0.3 release cutoff, so it was a bit
delayed while we did the build and release testing.

Steve


> On Mon, Aug 08, 2022 at 09:27:19AM +0300, bounce+67612+169014+3616751+9982126@lists.openembedded.org wrote:
> > From: Mikko Rapeli <mikko.rapeli@bmw.de>
> >
> > For fiber, only CMake modules were installed in boost 1.78.0.
> > In 1.79.0 and versions before 1.78.0 also the shared libraries
> > are installed. This upstream patch fixes the issue in 1.78.0.
> >
> > Note that boost git repo does not show changes in tools/build
> > directory between 1.78.0 and 1.79.0 tags but the release tar balls
> > contain a large update of which this one is needed to fix the missing
> > shared libraries.
> >
> > Only kirkstone is affected.
> >
> > buildhistory shows the difference in metadata boost-fiber binary package
> > without and with this patch:
> >
> >  --- a/packages/core2-64-poky-linux/boost/boost-fiber/latest
> >  +++ b/packages/core2-64-poky-linux/boost/boost-fiber/latest
> > @@ -1,8 +1,9 @@
> >  PV = 1.78.0
> >  PR = r0
> > -RPROVIDES =
> > -RDEPENDS =
> > +PKG = libboost-fiber1.78.0
> > +RPROVIDES = boost-fiber (=1.78.0)
> > +RDEPENDS = boost-context (>= 1.78.0) glibc (>= 2.35) libgcc (>= 11.3.0) libstdc++ (>= 11.3.0)
> >  RRECOMMENDS =
> > -PKGSIZE = 0
> > +PKGSIZE = 80032
> >  FILES = /usr/lib/libboost_fiber*.so.*
> > -FILELIST =
> > +FILELIST = /usr/lib/libboost_fiber.so.1.78.0
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  ...ll-targets-if-there-s-build-no-in-ur.patch | 82 +++++++++++++++++++
> >  meta/recipes-support/boost/boost_1.78.0.bb    |  1 +
> >  2 files changed, 83 insertions(+)
> >  create mode 100644 meta/recipes-support/boost/boost/0001-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch
> >
> > diff --git a/meta/recipes-support/boost/boost/0001-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch b/meta/recipes-support/boost/boost/0001-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch
> > new file mode 100644
> > index 0000000000..df8b285700
> > --- /dev/null
> > +++ b/meta/recipes-support/boost/boost/0001-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch
> > @@ -0,0 +1,82 @@
> > +From 78fd284a42caabe8815cb0870b46e5567872e75b Mon Sep 17 00:00:00 2001
> > +From: Dmitry <grisumbras@gmail.com>
> > +Date: Sat, 11 Dec 2021 16:58:23 +0300
> > +Subject: [PATCH] Don't skip install targets if there's <build>no in ureqs
> > + (#113)
> > +
> > +---
> > + src/tools/stage.jam      |  4 ++++
> > + test/install_build_no.py | 26 ++++++++++++++++++++++++++
> > + test/test_all.py         |  1 +
> > + 3 files changed, 31 insertions(+)
> > + create mode 100755 test/install_build_no.py
> > +
> > +Fixes install of boost fiber shared libraries which are missing in 1.78.0
> > +but working in 1.79.0. Only kirkstone affected by this.
> > +
> > +Upstream-Status: Backport
> > +
> > +Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > +
> > +diff --git a/tools/build/src/tools/stage.jam b/tools/build/src/tools/stage.jam
> > +index c5f02e3ba..325129dc8 100644
> > +--- a/tools/build/src/tools/stage.jam
> > ++++ b/tools/build/src/tools/stage.jam
> > +@@ -478,6 +478,10 @@ class install-target-class : basic-target
> > +         return [ sequence.unique $(result2) ] ;
> > +     }
> > +
> > ++    rule skip-from-usage-requirements ( )
> > ++    {
> > ++    }
> > ++
> > +     # Returns true iff 'type' is subtype of some element of 'types-to-include'.
> > +     #
> > +     local rule include-type ( type : types-to-include * )
> > +diff --git a/tools/build/test/install_build_no.py b/tools/build/test/install_build_no.py
> > +new file mode 100755
> > +index 000000000..0ccf3c5cc
> > +--- /dev/null
> > ++++ b/tools/build/test/install_build_no.py
> > +@@ -0,0 +1,26 @@
> > ++#!/usr/bin/python
> > ++
> > ++# Copyright 2021 Dmitry Arkhipov (grisumbras@gmail.com)
> > ++# Distributed under the Boost Software License, Version 1.0.
> > ++# (See accompanying file LICENSE.txt or https://www.bfgroup.xyz/b2/LICENSE.txt)
> > ++
> > ++# Check that <build>no in usage-requirements of dependencies does not affect
> > ++# install rule, i.e. a skipped installed target does not affect insallation of
> > ++# other targets.
> > ++
> > ++import BoostBuild
> > ++
> > ++t = BoostBuild.Tester()
> > ++
> > ++t.write("a.cpp", "int main() {}\n")
> > ++
> > ++t.write("jamroot.jam", """
> > ++make x : : maker : <build>no ;
> > ++exe a : a.cpp ;
> > ++install install : x a ;
> > ++""")
> > ++
> > ++t.run_build_system()
> > ++t.expect_addition("install/a.exe")
> > ++
> > ++t.cleanup()
> > +diff --git a/tools/build/test/test_all.py b/tools/build/test/test_all.py
> > +index b7ef5ad70..9ed729d01 100644
> > +--- a/tools/build/test/test_all.py
> > ++++ b/tools/build/test/test_all.py
> > +@@ -250,6 +250,7 @@ tests = ["abs_workdir",
> > +          "inherit_toolset",
> > +          "inherited_dependency",
> > +          "inline",
> > ++         "install_build_no",
> > +          "libjpeg",
> > +          "liblzma",
> > +          "libpng",
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-support/boost/boost_1.78.0.bb b/meta/recipes-support/boost/boost_1.78.0.bb
> > index 58be9dcf12..08364a4c3c 100644
> > --- a/meta/recipes-support/boost/boost_1.78.0.bb
> > +++ b/meta/recipes-support/boost/boost_1.78.0.bb
> > @@ -7,4 +7,5 @@ SRC_URI += "file://boost-CVE-2012-2677.patch \
> >             file://0001-dont-setup-compiler-flags-m32-m64.patch \
> >             file://de657e01635306085488290ea83de541ec393f8b.patch \
> >             file://0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch \
> > +           file://0001-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch \
> >             "
> > --
> > 2.20.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169014): https://lists.openembedded.org/g/openembedded-core/message/169014
> > Mute This Topic: https://lists.openembedded.org/mt/92886894/3616751
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@bmw.de]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

