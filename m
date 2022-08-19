Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752E4C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:55 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.50629.1660877011766583774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xkVGc49L;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id m2so3043103pls.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=lK7LEokjqLCCD+joUPQ17cEw2wkXmuIO6NqR1HNAMqg=;
        b=xkVGc49LOxLLHZw6ze/842TT8LPr7sHpDzs0WoYzWPVDe2ORYj7XAamCUFhKr7nVHn
         s4usIIku8OYmzAiUnuV3p1vP+aW/FCZXitqsqoQ9G0mTGNvDDBauYk7hwxf8W0szh2wV
         m+5aY00G7Aptm308ezQyH/4rcD0cH9ezuMQRsw2jj0WscTufQRQSxgQ1v+nTuBDhPQeZ
         IHClvvjqkMzzPrtvdT9axGdoSJkDGDr1lIHvRQd4WmfgeBfNTBHBpFcR+SdO/skgT3LP
         Yta5BQfzILSh2OuKf0MBtOQ19IjzuDoPqTODNYz8KNW/kRbe7fpZQmOm+1v7MaRJk3WD
         fj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=lK7LEokjqLCCD+joUPQ17cEw2wkXmuIO6NqR1HNAMqg=;
        b=fQYdIH3GnvxpWIkDzUlPJ8GQnbnw+IHsRJzbBcTbWOfsyEPq1KmFrkCqz9GAwU2SwG
         fSCTKO2t5v0BxXQoXAkB4bE3UcWWrCo/5hMzfhcf+PsOaimjPoLYtFU4xFfjzwN5CnjA
         /Rb49uvIuOnadX356o9y2k8XUU5OHyHBVThyOAQERzE8WKUS9Z1Ns4mUuoY0TQ6ozP4Z
         Gi1vfeC6h4acIofXmXCT16GgbzGoFKxSN7s3ScWrQfUopOzsCBgCHDJQchpdK0bk+JV2
         dJIBY/SLvGnRnzdkyeXXHKTM9gshesUJge2btFDsWuptnHl9QABR/5b03H61Htc4Fhqc
         C7zQ==
X-Gm-Message-State: ACgBeo3X/4kWBrmtMbDXU2J9a2L3t80rHVwnsICxFvv1AFAl2Bn+9XKV
	qyQY33muhOtEBz4GSQ3BGRpfracMbhzPG2+d
X-Google-Smtp-Source: 
 AA6agR6hJVsrhC8+4HgL6FmhRI4wg7H9GdxSfWARsmGknV/cLMiV0iAVcufWbvrocw2zPUPapCq01g==
X-Received: by 2002:a17:90b:4acc:b0:1f5:7f05:12e8 with SMTP id
 mh12-20020a17090b4acc00b001f57f0512e8mr5871651pjb.92.1660877025728;
        Thu, 18 Aug 2022 19:43:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/26] boost: fix install of fiber shared
 libraries
Date: Thu, 18 Aug 2022 16:42:40 -1000
Message-Id: 
 <f5952401a89a84b40f98c1c946daba2d83a2b18a.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169561

From: Mikko Rapeli <mikko.rapeli@bmw.de>

For fiber, only CMake modules were installed in boost 1.78.0.
In 1.79.0 and versions before 1.78.0 also the shared libraries
are installed. This upstream patch fixes the issue in 1.78.0.

Note that boost git repo does not show changes in tools/build
directory between 1.78.0 and 1.79.0 tags but the release tar balls
contain a large update of which this one is needed to fix the missing
shared libraries.

Only kirkstone is affected.

buildhistory shows the difference in metadata boost-fiber binary package
without and with this patch:

 --- a/packages/core2-64-poky-linux/boost/boost-fiber/latest
 +++ b/packages/core2-64-poky-linux/boost/boost-fiber/latest
@@ -1,8 +1,9 @@
 PV = 1.78.0
 PR = r0
-RPROVIDES =
-RDEPENDS =
+PKG = libboost-fiber1.78.0
+RPROVIDES = boost-fiber (=1.78.0)
+RDEPENDS = boost-context (>= 1.78.0) glibc (>= 2.35) libgcc (>= 11.3.0) libstdc++ (>= 11.3.0)
 RRECOMMENDS =
-PKGSIZE = 0
+PKGSIZE = 80032
 FILES = /usr/lib/libboost_fiber*.so.*
-FILELIST =
+FILELIST = /usr/lib/libboost_fiber.so.1.78.0

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ll-targets-if-there-s-build-no-in-ur.patch | 82 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.78.0.bb    |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch

diff --git a/meta/recipes-support/boost/boost/0001-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch b/meta/recipes-support/boost/boost/0001-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch
new file mode 100644
index 0000000000..df8b285700
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch
@@ -0,0 +1,82 @@
+From 78fd284a42caabe8815cb0870b46e5567872e75b Mon Sep 17 00:00:00 2001
+From: Dmitry <grisumbras@gmail.com>
+Date: Sat, 11 Dec 2021 16:58:23 +0300
+Subject: [PATCH] Don't skip install targets if there's <build>no in ureqs
+ (#113)
+
+---
+ src/tools/stage.jam      |  4 ++++
+ test/install_build_no.py | 26 ++++++++++++++++++++++++++
+ test/test_all.py         |  1 +
+ 3 files changed, 31 insertions(+)
+ create mode 100755 test/install_build_no.py
+
+Fixes install of boost fiber shared libraries which are missing in 1.78.0
+but working in 1.79.0. Only kirkstone affected by this.
+
+Upstream-Status: Backport
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
+
+diff --git a/tools/build/src/tools/stage.jam b/tools/build/src/tools/stage.jam
+index c5f02e3ba..325129dc8 100644
+--- a/tools/build/src/tools/stage.jam
++++ b/tools/build/src/tools/stage.jam
+@@ -478,6 +478,10 @@ class install-target-class : basic-target
+         return [ sequence.unique $(result2) ] ;
+     }
+ 
++    rule skip-from-usage-requirements ( )
++    {
++    }
++
+     # Returns true iff 'type' is subtype of some element of 'types-to-include'.
+     #
+     local rule include-type ( type : types-to-include * )
+diff --git a/tools/build/test/install_build_no.py b/tools/build/test/install_build_no.py
+new file mode 100755
+index 000000000..0ccf3c5cc
+--- /dev/null
++++ b/tools/build/test/install_build_no.py
+@@ -0,0 +1,26 @@
++#!/usr/bin/python
++
++# Copyright 2021 Dmitry Arkhipov (grisumbras@gmail.com)
++# Distributed under the Boost Software License, Version 1.0.
++# (See accompanying file LICENSE.txt or https://www.bfgroup.xyz/b2/LICENSE.txt)
++
++# Check that <build>no in usage-requirements of dependencies does not affect
++# install rule, i.e. a skipped installed target does not affect insallation of
++# other targets.
++
++import BoostBuild
++
++t = BoostBuild.Tester()
++
++t.write("a.cpp", "int main() {}\n")
++
++t.write("jamroot.jam", """
++make x : : maker : <build>no ;
++exe a : a.cpp ;
++install install : x a ;
++""")
++
++t.run_build_system()
++t.expect_addition("install/a.exe")
++
++t.cleanup()
+diff --git a/tools/build/test/test_all.py b/tools/build/test/test_all.py
+index b7ef5ad70..9ed729d01 100644
+--- a/tools/build/test/test_all.py
++++ b/tools/build/test/test_all.py
+@@ -250,6 +250,7 @@ tests = ["abs_workdir",
+          "inherit_toolset",
+          "inherited_dependency",
+          "inline",
++         "install_build_no",
+          "libjpeg",
+          "liblzma",
+          "libpng",
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/boost/boost_1.78.0.bb b/meta/recipes-support/boost/boost_1.78.0.bb
index 58be9dcf12..08364a4c3c 100644
--- a/meta/recipes-support/boost/boost_1.78.0.bb
+++ b/meta/recipes-support/boost/boost_1.78.0.bb
@@ -7,4 +7,5 @@ SRC_URI += "file://boost-CVE-2012-2677.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://de657e01635306085488290ea83de541ec393f8b.patch \
            file://0001-futex-fix-build-on-32-bit-architectures-using-64-bit.patch \
+           file://0001-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch \
            "
-- 
2.25.1


