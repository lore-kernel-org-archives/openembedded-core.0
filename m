Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDD7C35296
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net
 (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.2990.1650367338058457262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 04:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WkBS99Rk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228,
 mailfrom: fm-256628-2022041911221429d8bb903ec83cf3ea-dhxri1@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id
 2022041911221429d8bb903ec83cf3ea
        for <openembedded-core@lists.openembedded.org>;
        Tue, 19 Apr 2022 13:22:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=S0JHmmnLlVL4fCvAblSaecwc/Y+H4ukdk9+1bDxOtlM=;
 b=WkBS99Rk8AKI5emWoi5PYajoE/jBlMybOO6wOIJnVsd8LdvnCQLf2INug5xx4owHHNPl7D
 iVyp+WEff9V2Cp/QD+yi3fvJNWral6zcnG29EzIoIDVYuJBOue1bjaz03QYIZ0L4Sgd1clV1
 d0lOLMf9dluER4ODOfuwd/WrhUCs8=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] openssl: extract legacy provider module to a
 separate package
Date: Tue, 19 Apr 2022 13:21:18 +0200
Message-Id: <20220419112118.60914-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164624

This module contains legacy cipher suites from libcrypto.
We should not need to include base package because we want
  to use this part of libcrypto.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssl/openssl_3.0.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb b/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
index ff2a22c6c3..a809666aa7 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
@@ -224,7 +224,7 @@ do_install_ptest () {
 # file to be installed for both the openssl-bin package and the libcrypto
 # package since the openssl-bin package depends on the libcrypto package.
 
-PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
+PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${PN}-ossl-module-legacy"
 
 FILES:libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES:libssl = "${libdir}/libssl${SOLIBS}"
@@ -235,12 +235,13 @@ FILES:${PN}-engines = "${libdir}/engines-3"
 # ${prefix} comes from what we pass into --prefix at configure time (which is used for INSTALLTOP)
 FILES:${PN}-engines:append:mingw32:class-nativesdk = " ${prefix}${libdir}/engines-3"
 FILES:${PN}-misc = "${libdir}/ssl-3/misc ${bindir}/c_rehash"
+FILES:${PN}-ossl-module-legacy = "${libdir}/ossl-modules/legacy.so"
 FILES:${PN} =+ "${libdir}/ssl-3/* ${libdir}/ossl-modules/"
 FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
 CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 
-RRECOMMENDS:libcrypto += "openssl-conf"
+RRECOMMENDS:libcrypto += "openssl-conf ${PN}-ossl-module-legacy"
 RDEPENDS:${PN}-misc = "perl"
 RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed"
 
-- 
2.30.2


