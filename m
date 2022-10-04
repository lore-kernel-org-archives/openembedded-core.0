Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F57C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 10:10:56 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web09.8924.1664878247867705587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 03:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ofest-007iAP-QS; Tue, 04 Oct 2022 13:10:44 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ofest-00BUIR-H2; Tue, 04 Oct 2022 13:10:43 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/4] openssl-native.bbclass: add bbclass
Date: Tue,  4 Oct 2022 13:10:38 +0300
Message-Id: <20221004101038.2736600-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_DN_SOME(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221004101038.2736600-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 10:10:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171376

Using openssl-native shared libraries correctly is hard. A number
of environment variables need to be correctly set or
the errors may be really confusing. openssl can be made
to detect these paths automatically, but upstream has rejected
these ideas. openssl-native provides a wrapper script for 'openssl'
binary, but shared library users like python3-cryptgraphy-native
need to have the shared libraries working directly. Thus follow
example from python3native.bbclass and implement this via
openssl-native.bbclass.

If full certificate checking is needed, then users
also need to DEPEND on ca-certificates-native.

See also:
https://lists.openembedded.org/g/openembedded-core/topic/93651845#170562
https://github.com/openssl/openssl/issues/19242

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/ref-manual/classes.rst               | 11 +++++++++++
 meta/classes/openssl-native.bbclass                |  7 +++++++
 meta/recipes-connectivity/openssl/openssl_3.0.5.bb |  1 +
 3 files changed, 19 insertions(+)
 create mode 100644 meta/classes/openssl-native.bbclass

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 11e0d472e8..5fc30f9233 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1672,6 +1672,17 @@ one such example. However, being aware of this class can reduce the
 proliferation of different versions of similar classes across multiple
 layers.
 
+.. _ref-classes-openssl-native:
+
+``openssl-native.bbclass``
+==================
+
+The ``openssl-native`` class supports using the native version of openssl
+built by the build system rather than support of the version provided
+by the build host. It helps setting environment variables for engines,
+modules, certificates etc correctly. For full certificate checking
+users should also add ``ca-certificates-native`` to :term:`DEPENDS`.
+
 .. _ref-classes-overlayfs:
 
 ``overlayfs.bbclass``
diff --git a/meta/classes/openssl-native.bbclass b/meta/classes/openssl-native.bbclass
new file mode 100644
index 0000000000..753f0b0fa4
--- /dev/null
+++ b/meta/classes/openssl-native.bbclass
@@ -0,0 +1,7 @@
+DEPENDS += "openssl-native"
+
+export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
+export OPENSSL_ENGINES="${STAGING_LIBDIR_NATIVE}/engines-3"
+export OPENSSL_CONF="${STAGING_LIBDIR_NATIVE}/ssl-3/openssl.cnf"
+export SSL_CERT_DIR="${STAGING_LIBDIR_NATIVE}/ssl-3/certs"
+export SSL_CERT_FILE="${STAGING_LIBDIR_NATIVE}/ssl-3/cert.pem"
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
index 04aff04fab..a0e63d7830 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
@@ -163,6 +163,7 @@ do_install () {
 	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-3/openssl.cnf
 }
 
+# Please keep openssl-native.bbclass in sync with this wrapper
 do_install:append:class-native () {
 	create_wrapper ${D}${bindir}/openssl \
 	    OPENSSL_CONF=${libdir}/ssl-3/openssl.cnf \
-- 
2.17.1


