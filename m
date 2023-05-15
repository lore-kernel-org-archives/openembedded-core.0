Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4683C7EE2F
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 13:30:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.88213.1684157400611989634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 06:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7423A4B3;
	Mon, 15 May 2023 06:30:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49BAA3F67D;
	Mon, 15 May 2023 06:29:59 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/8] gnutls: clean up ptest compilation
Date: Mon, 15 May 2023 14:29:51 +0100
Message-Id: <20230515132955.2231164-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515132955.2231164-1-ross.burton@arm.com>
References: <20230515132955.2231164-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 13:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181254

From: Ross Burton <ross.burton@arm.com>

Don't always build the tests in do_compile, use do_compile_ptest so they
are only built when needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.0.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.0.bb
index 0758eb15a93..eef004efa5b 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.0.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.0.bb
@@ -66,6 +66,10 @@ do_configure:prepend() {
 	done
 }
=20
+do_compile_ptest() {
+    oe_runmake -C tests buildtest-TESTS
+}
+
 do_install:append:class-target() {
         if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false'=
, d)}; then
           install -d ${D}${bindir}/bin
@@ -73,10 +77,6 @@ do_install:append:class-target() {
         fi
 }
=20
-do_compile:append() {
-        oe_runmake ${PARALLEL_MAKE} -C tests buildtest-TESTS
-}
-
 PACKAGES =3D+ "${PN}-dane ${PN}-openssl ${PN}-xx ${PN}-fips"
=20
 FILES:${PN}-dev +=3D "${bindir}/gnutls-cli-debug"
--=20
2.34.1


