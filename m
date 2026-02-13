Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B335BEF48D2
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 17:47:44 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77674.1771004853900192747
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 09:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1vqxGN-0007jE-NI; Fri, 13 Feb 2026 18:47:31 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1vqxGM-000cFT-0c;
	Fri, 13 Feb 2026 18:47:31 +0100
Received: from jlu by dude06.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1vqxGN-000000051dt-22A1;
	Fri, 13 Feb 2026 18:47:31 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [PATCH] openssl: add support for config snippet includes
Date: Fri, 13 Feb 2026 18:47:29 +0100
Message-ID: <20260213174730.1197940-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 17:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231133

This allows configuration (such as enabling providers) to be done by
adding snippet files to /usr/lib/ssl-3/openssl.cnf.d or
/etc/ssl/openssl.cnf.d instead of modifying a copy of the full
configuration file. As new snippets can be added from separate recipes,
targeted changes can be done in multiple layers.

For example, the pkcs11-provider can be enabled by adding a pkcs11.cnf
containing something like:
  [default_sect]
  activate = 1

  [provider_sect]
  pkcs11 = pkcs11_sect

  [pkcs11_sect]
  pkcs11-module-path = /usr/lib/libckteec.so.0
  pkcs11-module-quirks = no-operation-state no-deinit
  pkcs11-module-encode-provider-uri-to-pem = true
  activate = 1

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta/recipes-connectivity/openssl/openssl_3.5.5.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
index c0d02b617ba5..7375867dd1df 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
@@ -186,6 +186,16 @@ do_install () {
 	fi
 }
 
+do_install:append:class-target () {
+        # Add support for config snippet includes
+        echo "" >> ${D}${sysconfdir}/ssl/openssl.cnf
+        echo ".include ${libdir}/ssl-3/openssl.cnf.d" >> ${D}${sysconfdir}/ssl/openssl.cnf
+        echo ".include ${sysconfdir}/ssl/openssl.cnf.d" >> ${D}${sysconfdir}/ssl/openssl.cnf
+
+        install -d ${D}${libdir}/ssl-3/openssl.cnf.d
+        install -d ${D}${sysconfdir}/ssl/openssl.cnf.d
+}
+
 do_install:append:class-native () {
 	create_wrapper ${D}${bindir}/openssl \
 	    OPENSSL_CONF=\${OPENSSL_CONF:-${libdir}/ssl-3/openssl.cnf} \
-- 
2.47.3


