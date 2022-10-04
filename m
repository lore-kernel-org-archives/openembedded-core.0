Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59304C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:27:38 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web09.12295.1664897256723614213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ofjpU-009DcB-5T; Tue, 04 Oct 2022 18:27:32 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ofjpT-0044RN-SF; Tue, 04 Oct 2022 18:27:31 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 1/5] openssl-native.bbclass: add bbclass
Date: Tue,  4 Oct 2022 18:27:22 +0300
Message-Id: <20221004152722.965898-1-mikko.rapeli@linaro.org>
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
 Message-ID: 20221004152722.965898-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:27:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171402

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
https://github.com/openssl/openssl/pull/19260

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes/openssl-native.bbclass                | 7 +++++++
 meta/recipes-connectivity/openssl/openssl_3.0.5.bb | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 meta/classes/openssl-native.bbclass

v1 https://lists.openembedded.org/g/openembedded-core/topic/docs_patch_1_4/94110827?p=,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,94110827,previd%3D1664895400514033654,nextid%3D1664840452025327543&previd=1664895400514033654&nextid=1664840452025327543

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


