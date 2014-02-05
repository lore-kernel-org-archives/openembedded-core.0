Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD486E2D8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 13:56:50 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so5440536wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2014 05:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fH6mfChAElbbRMRTh9cCBFofUC4b3jplrKDYysD72ZQ=;
	b=Xu4lYhwKiYRtf+mo4j7E8+uN2OJJLhosbz4AAXX8kZu1oPNTuijVQowqcCa3o58Dse
	alAria0rQLsX835ST+8kEwe4h+QngGlFhx0XJSSJ4BVUbTFefXAMSe9d4S6TNrBrRC2q
	AJFRdw6aOHRUiJ21gcBvBUthdQzOi+aocy5oFekVA2zg+EHoZPtFU7TGB2hDq9b/aKkp
	YClW6Evh7w0O5G2OEbkuBtDWC4fUrLTBSHMQa/wUBnKHpLF9Vz7RxQAYPwTMdIJJyYA8
	hGpjT95k2gf28ZgiEikVNMnED2p8m63rxxqc6KPEjWOwV51daejCjSajFlwCC4oGacTx
	kqtA==
X-Gm-Message-State: ALoCoQnYCSLkd7HOORejF28JtEOahOAMDQlEysu27XVkOuHj/5tMaT2YCIIsN72H2YeqyjW0EZvw
X-Received: by 10.194.202.230 with SMTP id kl6mr1480660wjc.9.1391608610519;
	Wed, 05 Feb 2014 05:56:50 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id po3sm61645966wjc.3.2014.02.05.05.56.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Feb 2014 05:56:49 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2014 14:56:34 +0100
Message-Id: <1391608594-13680-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [RFC][PATCH] curl: point CA bundle to /etc/ssl/certs/ca-certificates.crt instead of using the buildhost location
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 13:56:51 -0000

Configure would look at the buildhost and hardcode the bundle location for there into the target. This leads to non-working https support.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---

This is marked as RFC since:
 1) it needs to get tried on buildhosts where the bundle isn't located in /etc/ssl/certs
 2) package dependencies need to get sorted out (curl-ca-certs vs ca-certificates)
 


 meta/recipes-support/curl/curl_7.34.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_7.34.0.bb b/meta/recipes-support/curl/curl_7.34.0.bb
index b49c6e4..3f20bb1 100644
--- a/meta/recipes-support/curl/curl_7.34.0.bb
+++ b/meta/recipes-support/curl/curl_7.34.0.bb
@@ -30,6 +30,7 @@ EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
                 --enable-crypto-auth \
                 --disable-ldap \
                 --disable-ldaps \
+                --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
                 ${CURLGNUTLS} \
                 "
 
-- 
1.8.4.2


