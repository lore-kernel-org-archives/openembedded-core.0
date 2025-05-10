Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B533C3ABDB
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6807.1746866646363725752
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F22741595
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:43:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 966803F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/23] testsdk: allow user to specify which tests to run
Date: Sat, 10 May 2025 09:43:35 +0100
Message-ID: <20250510084400.269726-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216250

Following the usage of TEST_SUITES in testimage, add TESTSDK_SUITES to
specify the list of tests to execute. By default the variable is empty,
which means to run all discovered tests.

This makes it easier to work on a single test without having to run all
of the tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/testsdk.bbclass | 3 +++
 meta/lib/oeqa/sdk/testsdk.py        | 3 ++-
 meta/lib/oeqa/sdkext/testsdk.py     | 3 ++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/testsdk.bbclass b/meta/classes-recipe/te=
stsdk.bbclass
index fd82e6ef41d..59d2834c992 100644
--- a/meta/classes-recipe/testsdk.bbclass
+++ b/meta/classes-recipe/testsdk.bbclass
@@ -14,6 +14,9 @@
 #
 # where "<image-name>" is an image like core-image-sato.
=20
+# List of test modules to run, or run all that can be found if unset
+TESTSDK_SUITES ?=3D ""
+
 TESTSDK_CLASS_NAME ?=3D "oeqa.sdk.testsdk.TestSDK"
 TESTSDKEXT_CLASS_NAME ?=3D "oeqa.sdkext.testsdk.TestSDKExt"
=20
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 518b09febb6..52b702b6a28 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -114,7 +114,8 @@ class TestSDK(TestSDKBase):
                 host_pkg_manifest=3Dhost_pkg_manifest, **context_args)
=20
             try:
-                tc.loadTests(self.context_executor_class.default_cases)
+                modules =3D (d.getVar("TESTSDK_SUITES") or "").split()
+                tc.loadTests(self.context_executor_class.default_cases, =
modules)
             except Exception as e:
                 import traceback
                 bb.fatal("Loading tests failed:\n%s" % traceback.format_=
exc())
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/tests=
dk.py
index 9d5a99d900f..6dc23065a4a 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -82,7 +82,8 @@ class TestSDKExt(TestSDKBase):
                 host_pkg_manifest=3Dhost_pkg_manifest)
=20
             try:
-                tc.loadTests(OESDKExtTestContextExecutor.default_cases)
+                modules =3D (d.getVar("TESTSDK_SUITES") or "").split()
+                tc.loadTests(OESDKExtTestContextExecutor.default_cases, =
modules)
             except Exception as e:
                 import traceback
                 bb.fatal("Loading tests failed:\n%s" % traceback.format_=
exc())
--=20
2.43.0


