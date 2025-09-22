Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489C0CAC5AA
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:21:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.53336.1758550862679287084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 07:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 180A5236D
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 07:20:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D955F3F66E
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 07:21:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] libdnf: remove obsolete path path
Date: Mon, 22 Sep 2025 15:20:31 +0100
Message-ID: <20250922142031.3625684-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922142031.3625684-1-ross.burton@arm.com>
References: <20250922142031.3625684-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 14:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223829

We needed to remove the build path from the source tree because it was
embedded into libdnf/dnf-repo.cpp.  However, this was replaced with an
environment variable in 0.67.0 onwards[1].

[1] libdnf 04d7fba0 ("Use environment variable in unittest instead of ugl=
y hack in libdnf")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libdnf/enable_test_data_dir_set.patch     | 36 -------------------
 meta/recipes-devtools/libdnf/libdnf_0.74.0.bb |  1 -
 2 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/enable_test_data_=
dir_set.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set=
.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.pat=
ch
deleted file mode 100644
index 6fc05d9ff8a..00000000000
--- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 870f50ba4761317f2db018ac130a42087230dded Mon Sep 17 00:00:00 2001
-From: Joe Slater <joe.slater@windriver.com>
-Date: Wed, 22 Jul 2020 13:31:11 -0700
-Subject: [PATCH] libdnf: allow reproducible binary builds
-
-Use a dummy directory for test data if not built WITH_TESTS.  Allow for =
overriding
-TESTDATADIR, since the default is guaranteed to be wrong for target buil=
ds.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- CMakeLists.txt | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b1daacb..f461e54 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -131,7 +131,12 @@ add_definitions(-DGETTEXT_DOMAIN=3D"libdnf")
- add_definitions(-DG_LOG_DOMAIN=3D"libdnf")
-=20
- # tests
--add_definitions(-DTESTDATADIR=3D"${CMAKE_SOURCE_DIR}/data/tests")
-+if(NOT WITH_TESTS)
-+  set(TEST_DATA_DIR "/notests")
-+elseif(NOT DEFINED TEST_DATA_DIR)
-+  set(TEST_DATA_DIR "${CMAKE_SOURCE_DIR}/data/tests")
-+endif()
-+add_definitions(-DTESTDATADIR=3D\\"${TEST_DATA_DIR}\\")
-=20
- # librhsm
- if(ENABLE_RHSM_SUPPORT)
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb b/meta/recipes=
-devtools/libdnf/libdnf_0.74.0.bb
index fafd8c5905a..720e7d6e6f7 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
 SRC_URI =3D "git://github.com/rpm-software-management/libdnf;branch=3Ddn=
f-4-master;protocol=3Dhttps \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own=
-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-li=
bdn.patch \
-           file://enable_test_data_dir_set.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://armarch.patch \
            file://optional-check.patch \
--=20
2.43.0


