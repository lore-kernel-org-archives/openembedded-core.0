Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35A0C3ABA3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 14:02:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12954.1746108160339640041
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 07:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE943168F
	for <openembedded-core@lists.openembedded.org>; Thu,  1 May 2025 07:02:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0EBFF3F673
	for <openembedded-core@lists.openembedded.org>; Thu,  1 May 2025 07:02:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] classes/yocto-check-layer: refactor to be extended easily
Date: Thu,  1 May 2025 15:02:33 +0100
Message-ID: <20250501140234.4113519-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 14:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215773

Rearrange the class so that the check is a separate function, to make it
neater to add further tests in the future.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/yocto-check-layer.bbclass | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/yocto-check-layer.bbclass b/meta/classes=
-global/yocto-check-layer.bbclass
index 1cdab49661b..92a392af9c3 100644
--- a/meta/classes-global/yocto-check-layer.bbclass
+++ b/meta/classes-global/yocto-check-layer.bbclass
@@ -4,17 +4,17 @@
 # SPDX-License-Identifier: MIT
 #
=20
-#
-# This class is used by yocto-check-layer script to ensure that packages
-# from Yocto Project Compatible layers don't skip required QA checks lis=
ted
-# in CHECKLAYER_REQUIRED_TESTS defined by insane.bbclass
+# This class is used by the yocto-check-layer script for additional
+# per-recipe tests.
 #
 # It adds an anonymous python function with extra processing to all reci=
pes,
 # globally inheriting this class isn't advisable - yocto-check-layer scr=
ipt
 # handles that during its signature dump
-#
=20
-python () {
+
+# Ensure that recipes don't skip required QA checks as listed
+# in CHECKLAYER_REQUIRED_TESTS, defined by insane.bbclass
+def check_insane_skip(d):
     required_tests =3D set((d.getVar('CHECKLAYER_REQUIRED_TESTS') or '')=
.split())
     packages =3D set((d.getVar('PACKAGES') or '').split())
     for package in packages:
@@ -25,4 +25,8 @@ python () {
             oe.qa.write_error(" ".join(skip_required), 'Package %s is sk=
ipping required QA tests.' % package, d)
             bb.error("QA Issue: %s [%s]" % ('Package %s is skipping requ=
ired QA tests.' % package, " ".join(skip_required)))
             d.setVar("QA_ERRORS_FOUND", "True")
+
+
+python () {
+    check_insane_skip(d)
 }
--=20
2.43.0


