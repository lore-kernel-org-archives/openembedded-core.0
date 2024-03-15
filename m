Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CBFC54E67
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 14:37:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24117.1710513462452193509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 07:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5806BC15
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:38:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B127E3F73F
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:37:41 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] gstreamer1.0: improve test reliability
Date: Fri, 15 Mar 2024 14:37:38 +0000
Message-Id: <20240315143738.1234858-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315143738.1234858-1-ross.burton@arm.com>
References: <20240315143738.1234858-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 14:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197135

From: Ross Burton <ross.burton@arm.com>

First, libcheck has the ability to increase all test timeouts by an arbit=
rary
multiplier. Because we run our tests on loaded build machines,
increase all timeouts by 10x to reduce the chance of load causing failure=
s.

Second, use GST_CHECKS_IGNORE to list test cases that should be skipped.

Drop skip-aggregator-test.patch as this is now redundant, and also skip
gstnetclientclock.c:test_functioning as this is very sensitive to load.

[ YOCTO #14808 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gstreamer/gstreamer1.0/run-ptest          | 16 ++++++++-
 .../gstreamer1.0/skip-aggregator-test.patch   | 35 -------------------
 .../gstreamer/gstreamer1.0_1.22.10.bb         |  1 -
 3 files changed, 15 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/skip-a=
ggregator-test.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 0cfa955f033..7d0312005f4 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -1,2 +1,16 @@
-#!/usr/bin/env sh
+#! /bin/sh
+
+# Multiply all timeouts by ten so they're more likely to work
+# on a loaded system.
+export CK_TIMEOUT_MULTIPLIER=3D5
+
+# Skip some tests that we know are problematic
+export GST_CHECKS_IGNORE=3D""
+# gstnetclientclock.c:test_functioning is very sensitive to load
+GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,test_functioning"
+
+# aggregator.c:test_infinite_seek_50_src_live is known to be flaky
+# https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/410
+GST_CHECKS_IGNORE=3D"$GST_CHECKS_IGNORE,test_infinite_seek_50_src_live"
+
 gnome-desktop-testing-runner gstreamer
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/skip-aggregat=
or-test.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/skip-aggre=
gator-test.patch
deleted file mode 100644
index 81337512fdd..00000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/skip-aggregator-test=
.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9b72aa7cdbc2a81cffc6f855933afe90c81046d5 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 28 Feb 2024 12:40:34 +0000
-Subject: [PATCH] Skip aggregator test
-
-This test case is known to be flaky upstream[1] and often fails on the
-autobuilder[2], so skip it until this has been resolved upstream.
-
-[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/410
-[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15054
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tests/check/libs/aggregator.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tests/check/libs/aggregator.c b/tests/check/libs/aggregator=
.c
-index 1f2c5b4..27b3ac7 100644
---- a/tests/check/libs/aggregator.c
-+++ b/tests/check/libs/aggregator.c
-@@ -1475,7 +1475,9 @@ gst_aggregator_suite (void)
-   tcase_add_test (general, test_flushing_seek);
-   tcase_add_test (general, test_infinite_seek);
-   tcase_add_test (general, test_infinite_seek_50_src);
--  tcase_add_test (general, test_infinite_seek_50_src_live);
-+  // This test case is known to be flaky, remove it until resolved:
-+  // https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/410
-+  // tcase_add_test (general, test_infinite_seek_50_src_live);
-   tcase_add_test (general, test_linear_pipeline);
-   tcase_add_test (general, test_two_src_pipeline);
-   tcase_add_test (general, test_timeout_pipeline);
---=20
-2.34.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
index c16f0de3b72..0c944e9e110 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
@@ -21,7 +21,6 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstr=
eamer/gstreamer-${PV}.tar.x
            file://0002-tests-add-support-for-install-the-tests.patch \
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_test=
s.patch \
-           file://skip-aggregator-test.patch \
            "
 SRC_URI[sha256sum] =3D "969aaef396f252ce925132a4be2aa004e0320f5c1baf0aca=
aae09c544a6759f4"
=20
--=20
2.34.1


