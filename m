Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0844DCE7B08
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 12:57:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17322.1763125009825097211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 04:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C82FF1063
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:56:41 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 122D33F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:56:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/image: add new task to list defined image features
Date: Fri, 14 Nov 2025 12:56:47 +0000
Message-ID: <20251114125647.1607504-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 12:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226296

Add a list_image_features task that lists the available IMAGE_FEATURES
for a specific image.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/image.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/imag=
e.bbclass
index ccad308b939..53f1a9dc45b 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -702,4 +702,27 @@ reproducible_final_image_task () {
=20
 IMAGE_PREPROCESS_COMMAND:append =3D " reproducible_final_image_task "
=20
+python do_list_image_features() {
+    """
+    Task to list the available values for IMAGE_FEATURES for a specific =
image.
+    """
+    features =3D set()
+
+    for var in d:
+        if var.startswith("FEATURE_PACKAGES_"):
+            features.add(var.replace("FEATURE_PACKAGES_", ""))
+
+    for flag in d.getVarFlags("COMPLEMENTARY_GLOB"):
+        if flag !=3D "doc":
+            features.add(flag)
+
+    for feat in d.getVarFlag("IMAGE_FEATURES", "validitems").split():
+        features.add(feat)
+
+    bb.plain("Available features for IMAGE_FEATURES:")
+    for feature in sorted(features):
+        bb.plain(" - " + feature)
+}
+addtask list_image_features
+
 CVE_PRODUCT =3D ""
--=20
2.43.0


