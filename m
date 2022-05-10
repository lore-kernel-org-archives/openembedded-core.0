Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AF6C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:37:45 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.10723.1652193461434910399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=J3XJc1Xs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id p12so15132634pfn.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w+OLhAVmZSh0QCKL+2po3lcJTnFT1nGbga6G9AsnaQA=;
        b=J3XJc1XsHFgLHiXPxKowfWJ7vSBpTqrnWyS7mQ9T7qdzvtV2Wwf8QyvnkGY2oF3IAn
         IgrW0L6Va9KGy2fi9YN+ErcuocRld6MwbioAxJEC6M5uexcpyBKbQanqEFUcMkBL1Ky4
         1z7PVTimplH+Na5bYBD7McxmuPYgv+7iH9739HKUUs50V39GfTQaxdKH2ZaEmZon9ax0
         LCFlzRx3Z27JX7IC6iqKTSuk+olAwXMpwtGmxXWwUw3aRwgxVifHJj/SFO9+XfzJ2y1a
         rXqThUvspTqe2aQhD8IPWbXcswdVf2kt05oktwPm7/jZg+AItUUh79KFgyjzXgSkJNJs
         swRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w+OLhAVmZSh0QCKL+2po3lcJTnFT1nGbga6G9AsnaQA=;
        b=GBEOyc++hYFL8GckVPDpIa8ww0j48ds65dcxMivxIoXGMCbZ27dWZ36rwUOxIPjAeB
         SO3WCnOFJe34KRAl6eeKr28c+8rNyCawUZNU8r6XkZ0vTOLMrMrRRTvnNcjX5lG/Z7Kj
         dW8EboZcWqfpAi4gXF74i770JbKKWMi+iSI70bc4w9GMpHccxHsE7iOqzAoVMBWvGrvi
         se/lnV1mROX5qkBV2MiSrQq77pXOMEzL5eGhah3rokXmhBfkxyWPnO4U9gqXMEurIapj
         +V8sGkFOroIhu70njA6RAzgEWMZuKa5nEKsXtvPnI9rVSQ3+f8e5Bg9u/qdvLI3zCx86
         BkqQ==
X-Gm-Message-State: AOAM53344r5dg2bnqVlTr27GMakcYp3qjkHzN4xE8LoJdRMazeXsIJf9
	hYdFo8IdmKxE3cip2sSwpd4dQlzrWoJ4RzsN
X-Google-Smtp-Source: 
 ABdhPJxmx8PTvPnJsFRq7MKRbqWfFVBP8uMNBXdyUbToYkCyv5kTNt5KV7ZonDleMzFlcOfv+mejjQ==
X-Received: by 2002:aa7:888c:0:b0:505:7832:98fc with SMTP id
 z12-20020aa7888c000000b00505783298fcmr20414641pfe.0.1652193460202;
        Tue, 10 May 2022 07:37:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.37.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:37:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/40] openssl: extract legacy provider module to
 a separate package
Date: Tue, 10 May 2022 04:36:40 -1000
Message-Id: 
 <f44368f58645715f210b46ca3f747d064b872b20.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:37:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165418

From: Peter Marko <peter.marko@siemens.com>

This module contains legacy cipher suites from libcrypto.
We should not need to include base package because we want
  to use this part of libcrypto.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1537ebc3f6ae2aec9a3864b03704ab4dbc0e971b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


