Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641D1C433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 17:10:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.181.1652721049805088914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 10:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4AE31063;
	Mon, 16 May 2022 10:10:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E8EF3F66F;
	Mon, 16 May 2022 10:10:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] python3-setuptools: upgrade to 62.2.0
Date: Mon, 16 May 2022 18:10:44 +0100
Message-Id: <20220516171045.3049978-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 17:10:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165689

Drop 0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch as
the in-tree copy of sysconfig now simply calls the one in Python, so this
is not needed anymore.

Drop 0001-change-shebang-to-python3.patch as it is patching a file which
never gets executed directly, so is pointless.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...nfig-append-STAGING_LIBDIR-python-sy.patch | 35 -------------------
 .../0001-change-shebang-to-python3.patch      | 25 -------------
 ...59.5.0.bb =3D> python3-setuptools_62.2.0.bb} |  7 +---
 3 files changed, 1 insertion(+), 66 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-=
_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-=
change-shebang-to-python3.patch
 rename meta/recipes-devtools/python/{python3-setuptools_59.5.0.bb =3D> p=
ython3-setuptools_62.2.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distut=
ils-sysconfig-append-STAGING_LIBDIR-python-sy.patch b/meta/recipes-devtoo=
ls/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIB=
DIR-python-sy.patch
deleted file mode 100644
index 3150187951d..00000000000
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sys=
config-append-STAGING_LIBDIR-python-sy.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1ff575308248b183639c8cb14afee7c8572bd2b8 Mon Sep 17 00:00:00 2001
-From: Tim Orling <timothy.t.orling@intel.com>
-Date: Wed, 20 Oct 2021 17:38:10 +0000
-Subject: [PATCH] _distutils/sysconfig: append
- STAGING_LIBDIR/python-sysconfigdata to sys.path
-
-When python modules set SETUPTOOLS_USE_DISTULS=3D'local', this uses the
-vendored _distutils in setuptools rather than distutils in the Standard
-Library. This is needed so that target configuration can be used with
-python3-setuptools-native.
-
-Based on python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-s=
ys.patch
-from Alex Kanavin <alex.kanavin@gmail.com>
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
-
----
- setuptools/_distutils/sysconfig.py | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/=
sysconfig.py
-index d36d94f..616eb91 100644
---- a/setuptools/_distutils/sysconfig.py
-+++ b/setuptools/_distutils/sysconfig.py
-@@ -484,6 +484,8 @@ def _init_posix():
-             multiarch=3Dgetattr(sys.implementation, '_multiarch', ''),
-         ),
-     )
-+    if 'STAGING_LIBDIR' in os.environ:
-+        sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfig=
data')
-     try:
-         _temp =3D __import__(name, globals(), locals(), ['build_time_va=
rs'], 0)
-     except ImportError:
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-change-=
shebang-to-python3.patch b/meta/recipes-devtools/python/python3-setuptool=
s/0001-change-shebang-to-python3.patch
deleted file mode 100644
index 6dcf52771b2..00000000000
--- a/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang=
-to-python3.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c39d0896930e25c224cc897660fc8511ccae30c8 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 23 Apr 2020 10:01:12 +0000
-Subject: [PATCH] change shebang to python3
-
-Upstream-Status: Pending
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- pkg_resources/_vendor/appdirs.py   | 2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/pkg_resources/_vendor/appdirs.py b/pkg_resources/_vendor/ap=
pdirs.py
-index ae67001..933e398 100644
---- a/pkg_resources/_vendor/appdirs.py
-+++ b/pkg_resources/_vendor/appdirs.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- # Copyright (c) 2005-2010 ActiveState Software Inc.
- # Copyright (c) 2013 Eddy Petri=C8=99or
---=20
-2.24.1
-
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/=
meta/recipes-devtools/python/python3-setuptools_62.2.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_62.2.0.bb
index f2810e18d31..452ccf73251 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_62.2.0.bb
@@ -8,12 +8,7 @@ inherit pypi python_setuptools_build_meta
=20
 SRC_URI:append:class-native =3D " file://0001-conditionally-do-not-fetch=
-code-by-easy_install.patch"
=20
-SRC_URI +=3D "\
-    file://0001-change-shebang-to-python3.patch \
-    file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.pat=
ch \
-"
-
-SRC_URI[sha256sum] =3D "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb=
77573f6e2fa4fad0"
+SRC_URI[sha256sum] =3D "ca6ba73b7fd5f734ae70ece8c4c1f7062b07f3352f6428f6=
277e27c8f5c64237"
=20
 DEPENDS +=3D "${PYTHON_PN}"
=20
--=20
2.25.1


