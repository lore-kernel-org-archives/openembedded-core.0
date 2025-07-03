Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7DEC77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 13:21:36 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.22495.1751548892533727519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 06:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1uXJsY-000631-Pr; Thu, 03 Jul 2025 15:21:30 +0200
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1uXJsY-006bpK-0I;
	Thu, 03 Jul 2025 15:21:30 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1uXJsY-00Gny6-07;
	Thu, 03 Jul 2025 15:21:30 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH] openssl: add workaround for broken paths in native libcrypto.pc
Date: Thu,  3 Jul 2025 15:21:05 +0200
Message-Id: <20250703132105.4005278-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 13:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219880

Since d1b29222 ("openssl-native(sdk): poision built in paths") the
workaround for host path contamination in native(sdk) openssl is fixed.
But an unfortunate side-effect of forcing the directory variables
(OPENSSLDIR, ENGINESDIR, MODULESDIR) to be invalid is that it renders
the generated native pkg-config file (libcrypto.pc) unusable:

  [..]
  includedir=${prefix}/include
  enginesdir=${libdir}/../../../../../../../../../../../../../../../../not/builtin
  modulesdir=${libdir}/../../../../../../../../../../../../../../../../not/builtin

  Name: OpenSSL-libcrypto
  [..]

This will prevent other native tools (like libp11-native) from
installing their (.so) files into valid OpenSSL directories.

The strange paths are a result of OpenSSL's build system attempting to
resolve the dummy path "/not/builtin" relative to ${libdir} for
libcrypto.pc.in:

| enginesdir=${libdir}/{- $OpenSSL::safe::installdata::ENGINESDIR_REL_LIBDIR[0] -}

There doesn't appear to be a straightforward way to avoid embedding a
built-in host path while still generating a valid libcrypto.pc file.

This workaround now post-fixes the .pc files for openssl-native by using
two sed calls to replace the invalid paths with the valid ones.
(To prevent bitbake from early expanding the libdir variables, use a
group as a simple hack.)

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-connectivity/openssl/openssl_3.5.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
index 0f5c28dafa..a7d08d5b86 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
@@ -192,6 +192,11 @@ do_install:append:class-native () {
 	    SSL_CERT_FILE=\${SSL_CERT_FILE:-${libdir}/ssl-3/cert.pem} \
 	    OPENSSL_ENGINES=\${OPENSSL_ENGINES:-${libdir}/engines-3} \
 	    OPENSSL_MODULES=\${OPENSSL_MODULES:-${libdir}/ossl-modules}
+
+	# Setting ENGINESDIR and MODULESDIR to invalid paths prevents host contamination,
+	# but also breaks the generated libcrypto.pc file. Post-Fix it manually here.
+	sed -i 's|^enginesdir=\($.libdir.\)/.*|enginesdir=\1/engines-3|' ${D}${libdir}/pkgconfig/libcrypto.pc
+	sed -i 's|^modulesdir=\($.libdir.\)/.*|modulesdir=\1/ossl-modules|' ${D}${libdir}/pkgconfig/libcrypto.pc
 }
 
 do_install:append:class-nativesdk () {
-- 
2.39.5


