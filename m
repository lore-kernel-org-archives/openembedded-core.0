Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22EBC77B72
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 13:28:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13900.1679318880054355842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 06:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A36B8106F;
	Mon, 20 Mar 2023 06:28:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A83A3F71E;
	Mon, 20 Mar 2023 06:27:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 09/17] python3-jinja2: use python3-unittest-automake-output
Date: Mon, 20 Mar 2023 13:27:43 +0000
Message-Id: <20230320132751.518693-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320132751.518693-1-ross.burton@arm.com>
References: <20230320132751.518693-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 13:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178821

Instead of using sed to reformat the output use this new module.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-jinja2/run-ptest |  2 +-
 meta/recipes-devtools/python/python3-jinja2_3.1.2.bb  | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest b/meta=
/recipes-devtools/python/python3-jinja2/run-ptest
index 5cec7116968..8d2017d39ce 100644
--- a/meta/recipes-devtools/python/python3-jinja2/run-ptest
+++ b/meta/recipes-devtools/python/python3-jinja2/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
=20
-pytest
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb b/meta/=
recipes-devtools/python/python3-jinja2_3.1.2.bb
index 80e0b856701..cd248cc0b4f 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
@@ -12,8 +12,7 @@ CVE_PRODUCT =3D "jinja2 jinja"
=20
 CLEANBROKEN =3D "1"
=20
-inherit pypi setuptools3
-inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
+inherit pypi setuptools3 ptest
=20
 SRC_URI +=3D " \
 	file://run-ptest \
@@ -25,9 +24,10 @@ do_install_ptest() {
 }
=20
 RDEPENDS:${PN}-ptest +=3D " \
-	${PYTHON_PN}-pytest \
-        ${PYTHON_PN}-toml \
-	${PYTHON_PN}-unixadmin \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-unittest-automake-output \
+    ${PYTHON_PN}-toml \
+    ${PYTHON_PN}-unixadmin \
 "
=20
 RDEPENDS:${PN} +=3D " \
--=20
2.34.1


