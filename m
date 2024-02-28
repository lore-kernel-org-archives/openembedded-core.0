Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87849C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 13:31:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13004.1709127068268513875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 05:31:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E680C15
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 05:31:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC38B3F762
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 05:31:06 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gstreamer1.0: skip a test that is known to be flaky
Date: Wed, 28 Feb 2024 13:31:04 +0000
Message-Id: <20240228133104.608403-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 13:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196384

From: Ross Burton <ross.burton@arm.com>

The aggregator testcase test_infinite_seek_50_src_live is known upstream
to be flaky[1] and when this fails in their CI they just ignore it.

It's failing often on our autobuilder, so disable the test case for now
until upstream have resolved this issue.

[ YOCTO #15054 ]

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/410

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gstreamer1.0/skip-aggregator-test.patch   | 35 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.22.10.bb         |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/skip-a=
ggregator-test.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/skip-aggregat=
or-test.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/skip-aggre=
gator-test.patch
new file mode 100644
index 00000000000..81337512fdd
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/skip-aggregator-test=
.patch
@@ -0,0 +1,35 @@
+From 9b72aa7cdbc2a81cffc6f855933afe90c81046d5 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 28 Feb 2024 12:40:34 +0000
+Subject: [PATCH] Skip aggregator test
+
+This test case is known to be flaky upstream[1] and often fails on the
+autobuilder[2], so skip it until this has been resolved upstream.
+
+[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/410
+[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15054
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/check/libs/aggregator.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/check/libs/aggregator.c b/tests/check/libs/aggregator=
.c
+index 1f2c5b4..27b3ac7 100644
+--- a/tests/check/libs/aggregator.c
++++ b/tests/check/libs/aggregator.c
+@@ -1475,7 +1475,9 @@ gst_aggregator_suite (void)
+   tcase_add_test (general, test_flushing_seek);
+   tcase_add_test (general, test_infinite_seek);
+   tcase_add_test (general, test_infinite_seek_50_src);
+-  tcase_add_test (general, test_infinite_seek_50_src_live);
++  // This test case is known to be flaky, remove it until resolved:
++  // https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/410
++  // tcase_add_test (general, test_infinite_seek_50_src_live);
+   tcase_add_test (general, test_linear_pipeline);
+   tcase_add_test (general, test_two_src_pipeline);
+   tcase_add_test (general, test_timeout_pipeline);
+--=20
+2.34.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
index 0c944e9e110..c16f0de3b72 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstr=
eamer/gstreamer-${PV}.tar.x
            file://0002-tests-add-support-for-install-the-tests.patch \
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_test=
s.patch \
+           file://skip-aggregator-test.patch \
            "
 SRC_URI[sha256sum] =3D "969aaef396f252ce925132a4be2aa004e0320f5c1baf0aca=
aae09c544a6759f4"
=20
--=20
2.34.1


