Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463CBC88E53
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50972.1789164946730923285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b/pwxh8V;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso16454615e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164945; x=1789769745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QlRudoMFiU+Tx+y0IeKlPFN9bAsxkJ8nDiqEALC/1wE=;
        b=b/pwxh8V8B5/MXY8EyM95FFbaio3cMgmOn7+hbEZRIt9aN8S/1Gv4qyxwKAzsg6nDD
         URqPFc/FAp0B4odXdFT+BgolbkTc20aibVmsocXgx60YV3y7I8PmnEYLt6dp9IKOa6EZ
         zJs6sWYunA7CKSc+L5SE7PmERvoe0oiqd1xJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164945; x=1789769745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QlRudoMFiU+Tx+y0IeKlPFN9bAsxkJ8nDiqEALC/1wE=;
        b=gEDluhBGQ7h55w+VJZhQZpul5DRG7wxmuIGC8/rdhXz814Sr0B8zet4HNdvYqp+Tlu
         lxNrFT35ljc3h427mwyJs2swXPn2Z5I2H1BKPBjUAZxJXlVklFaqoV7B+WL4yzAp9JkI
         DSApcGZK/ETMdMK9dJo7o4EASdCx9TkZE0DbfEXid4kIGzE7//+ZN2YVne2RliP6IQpw
         O2jjAAy5yXwmWn20scL97YGGt4hbgpeocn+axZloSgly0CqSbhKNT5aDxO+y4pwVv//B
         pxWAAo9Jbxj34nShbsQ077gtf5bKmPt/7rLyo8W32K6aKdCMfYo5lOGyQQC4H+L7S42K
         zdtw==
X-Gm-Message-State: AFuF++nUi8pj2PGX00EUCKIgd6+8XdAfPlNMtqJEdxg5hrRU7btuyxmo
	L1GtbY4OVV6EUzh7/xqYieQcYQ06pbySAhTF09t4lbLg6AmFUymXxusKu6T/ZwEYFQGMWeLADFg
	0FG7TMnc=
X-Gm-Gg: AYBFou1lZH0bEyx5gKtLzAZaDaq9pvlznQ5N/zfWH2GR/eUxHVZmuNIIrdoDQhHteOJ
	GoFBtYWp8wpgNXbXqw4g5p9NQ8mvdvvfgWM7TkZKFtjVRK27htqhsDkFlSihdysaZ3cbZJ3rxYT
	wjnyttNxlaIRUP0tUlU8NEUDOF80nl+Ti0dPr1pptsO0U1wICdmmrapDIGEwpLWDEfl416XE1Uw
	X449Xqp6BLWt0skQqIcp9itJKDmFeh93aSbFFrXGDkCI88mjXOMaOFTTbqj9tV9u3VTnGVodnrf
	Ohf/SjlHAZCqw6eyl2A4GMdgEAufOdBhBPWv13kGtpZuphEnHkpmgkYWN7/8SpA/vxg6+M4g/46
	u9mhANCe+um1DThDqiXG1B1pwtiO7gAxBYo/PyZdV0XXrczG6GnU49ZRw5durRgX6+ZxkC7QJB+
	fDd45XsylaZjLFYBPPZdGDEmWoYltsdnTxYOJxQtz4Hy0r4YQu+K5IYNpaQP6pbSlFEKSSkp6Dc
	eVFd5z5ZI7OP9fsyuAk8Crqij1PA0uRlScYWejh6QufMh6TNJWNk3bnvo17Zw+RhnrVMrtLrfU=
X-Received: by 2002:a05:600c:3513:b0:49e:6b62:edbd with SMTP id 5b1f17b1804b1-49e6b62ee31mr11959235e9.1.1789164944953;
        Fri, 11 Sep 2026 15:15:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/13] openssl: upgrade 3.5.7 -> 3.5.8
Date: Sat, 12 Sep 2026 00:14:57 +0200
Message-ID: <be8ba3d5f91675e390996dbc3bcbce3275052af8.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
References: <cover.1789163914.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245672

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

OpenSSL 3.5.8 is a security patch release. The most severe CVE fixed in this release is Moderate.
This release incorporates the following bug fixes and mitigations:
* Fixed QUIC server being able to trigger double free when processing INITIAL packet. (CVE-2026-18798)
* Fixed heap buffer overflow in CMS key unwrapping. (CVE-2026-63072)
* Fixed invalid pointer dereference in CMP server via crafted protectionAlg. (CVE-2026-63076)
* Fixed unbounded memory growth in QUIC server incoming channel queue. (CVE-2026-14456)
* Fixed RPK server signature algorithm selection being able to dereference a missing certificate. (CVE-2026-14457)
* Fixed excessive memory use buffering DTLS records for a future epoch. (CVE-2026-54874)
* Fixed untrusted Sender DN being used as a format string in CMP response validation. (CVE-2026-63073)
* Fixed CMP indefinite cache growth of extraCerts. (CVE-2026-63074)
* Fixed QUIC ACK-only packet retention being able to cause memory exhaustion. (CVE-2026-63075)
* Fixed possibility of AEAD forgeries with empty ciphertext when using EVP_Cipher(). (CVE-2026-75803)
* Fixed checking of authentication tags for empty ciphertexts for AEAD ciphers in CCM cipher mode.

[1] https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-357-and-openssl-358-25-aug-2026

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db81c1a42a0f552d9a8ec124f004ae2063d58c33)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssl/{openssl_3.5.7.bb => openssl_3.5.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb => openssl_3.5.8.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb b/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.7.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.8.bb
index 0b8e8afec81..be52e228f10 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8"
+SRC_URI[sha256sum] = "a8f84a39918ec6415ce765d9b429d313ba97b8143169c172e734b9514464f5b2"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

