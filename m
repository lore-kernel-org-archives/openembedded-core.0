Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B83BC87FCA
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 08:59:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2682.1753779582401936527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 01:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8BDD1516
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:59:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4477A3F66E
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:59:41 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/7] python_pep517: set CONFIGURE_FILES
Date: Tue, 29 Jul 2025 09:59:29 +0100
Message-ID: <20250729085935.1290438-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 08:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221037

Move the CONFIGURE_FILES assignment from python_mesonpy to the common
class, as it isn't specific to mesonpy.

Also extend, so that it doesn't clobber existing settings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_mesonpy.bbclass | 2 --
 meta/classes-recipe/python_pep517.bbclass  | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/python_mesonpy.bbclass b/meta/classes-re=
cipe/python_mesonpy.bbclass
index 81c087c7c75..37b231cef53 100644
--- a/meta/classes-recipe/python_mesonpy.bbclass
+++ b/meta/classes-recipe/python_mesonpy.bbclass
@@ -17,8 +17,6 @@ meson_do_qa_configure () {
 # ERROR: Got argument buildtype as both -Dbuildtype and --buildtype. Pic=
k one.
 MESONOPTS:remove =3D "--buildtype ${MESON_BUILDTYPE}"
=20
-CONFIGURE_FILES =3D "pyproject.toml"
-
 DEPENDS +=3D "python3-wheel-native python3-meson-python-native"
=20
 def mesonpy_get_args(d):
diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-rec=
ipe/python_pep517.bbclass
index e8cd1923ef2..2c144d39b38 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -61,3 +61,6 @@ python_pep517_do_bootstrap_install () {
 }
=20
 EXPORT_FUNCTIONS do_configure do_compile do_install
+
+# Tell externalsrc this changing means it needs to reconfigure
+CONFIGURE_FILES +=3D "pyproject.toml"
--=20
2.43.0


