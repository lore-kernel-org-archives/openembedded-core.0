Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D5BC48BC1
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 17:45:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13056.1707759945663737705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 09:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D67BDA7
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 09:46:26 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E50C83F5A1
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 09:45:44 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libpam: remove redundant PTEST_ENABLED conditional
Date: Mon, 12 Feb 2024 17:45:42 +0000
Message-Id: <20240212174542.1200514-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212174542.1200514-1-ross.burton@arm.com>
References: <20240212174542.1200514-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 17:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195354

From: Ross Burton <ross.burton@arm.com>

do_install_ptest is only called if ptest is enabled, so don't guard it
again.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/pam/libpam_1.5.3.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-ext=
ended/pam/libpam_1.5.3.bb
index 809d927f55b..4dd98906064 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -163,11 +163,9 @@ do_install() {
 }
=20
 do_install_ptest() {
-    if [ ${PTEST_ENABLED} =3D "1" ]; then
-        mkdir -p ${D}${PTEST_PATH}/tests
-        install -m 0755 ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests
-        install -m 0644 ${S}/tests/confdir ${D}${PTEST_PATH}/tests
-    fi
+    mkdir -p ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests
+    install -m 0644 ${S}/tests/confdir ${D}${PTEST_PATH}/tests
 }
=20
 pkg_postinst:${PN}() {
--=20
2.34.1


