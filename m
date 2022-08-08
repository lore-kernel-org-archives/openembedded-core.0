Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593B9C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:27:46 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.22514.1659940058856968769
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oKwEh-00Ge7M-N3; Mon, 08 Aug 2022 09:27:36 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oKwEh-0004IU-Kz; Mon, 08 Aug 2022 09:27:35 +0300
From: mikko.rapeli@bmw.de
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [PATCH][kirkstone] boost: fix install of fiber shared libraries
Date: Mon,  8 Aug 2022 09:27:19 +0300
Message-Id: <20220808062719.11704-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: ()
X-Rspam-Report: 
X-Rspam-Status: Yes
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:27:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169014

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
2.20.1


