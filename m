Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330A9C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 11:44:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.27064.1643283888545921279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 03:44:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 673D91FB
	for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 03:44:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 127053F7D8
	for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 03:44:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: export OPENSSL_MODULES in the wrapper
Date: Thu, 27 Jan 2022 11:44:45 +0000
Message-Id: <20220127114445.2625495-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 11:44:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161040

OpenSSL 3 added the concept of provider modules which are loaded from
disk.  The load path is hard-coded into the library and needs to be
relocated when running natively, so add OPENSSL_MODULES to the wrapper.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/openssl/openssl_3.0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.1.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.0.1.bb
index 7727ec43e87..e97c986b398 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
@@ -160,7 +160,8 @@ do_install:append:class-native () {
 	    OPENSSL_CONF=3D${libdir}/ssl-3/openssl.cnf \
 	    SSL_CERT_DIR=3D${libdir}/ssl-3/certs \
 	    SSL_CERT_FILE=3D${libdir}/ssl-3/cert.pem \
-	    OPENSSL_ENGINES=3D${libdir}/engines-3
+	    OPENSSL_ENGINES=3D${libdir}/engines-3 \
+	    OPENSSL_MODULES=3D${libdir}/ossl-modules
 }
=20
 do_install:append:class-nativesdk () {
--=20
2.25.1


