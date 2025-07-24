Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E314C87FCF
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 16:15:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.673.1753373750052568111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 09:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 235341A00
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:15:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 319633F66E
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:15:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] setuptools3_legacy: add pyproject.toml check
Date: Thu, 24 Jul 2025 17:15:39 +0100
Message-ID: <20250724161543.2253776-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724161543.2253776-1-ross.burton@arm.com>
References: <20250724161543.2253776-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 16:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220844

Copy the pyproject.toml check from setuptools3.bbclass so that the legacy
class will also warn if there's a modern build framework available.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/setuptools3_legacy.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes-recipe/setuptools3_legacy.bbclass b/meta/classe=
s-recipe/setuptools3_legacy.bbclass
index 8197f443c91..6b51b9796bc 100644
--- a/meta/classes-recipe/setuptools3_legacy.bbclass
+++ b/meta/classes-recipe/setuptools3_legacy.bbclass
@@ -30,6 +30,20 @@ SETUPTOOLS_PYTHON:class-native =3D "nativepython3"
=20
 SETUPTOOLS_SETUP_PATH ?=3D "${S}"
=20
+python do_check_backend() {
+    import re
+    filename =3D d.expand("${SETUPTOOLS_SETUP_PATH}/pyproject.toml")
+    if os.path.exists(filename):
+        for line in open(filename):
+            match =3D re.match(r"build-backend\s*=3D\s*\W([\w.]+)\W", li=
ne)
+            if not match: continue
+
+            msg =3D f"inherits setuptools3_legacy but has pyproject.toml=
 with {match[1]}, use the correct class"
+            if "pep517-backend" not in (d.getVar("INSANE_SKIP") or "").s=
plit():
+                oe.qa.handle_error("pep517-backend", msg, d)
+}
+addtask check_backend after do_patch before do_configure
+
 setuptools3_legacy_do_configure() {
     :
 }
--=20
2.43.0


