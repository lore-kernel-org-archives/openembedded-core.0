Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EB1C74A4B
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:56 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.8700.1678229316859405297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NIz7joKU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id y19so8566903pgk.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTj8zWma5mXrgfVow+CDMRxnPTfqmfBWH7rdKjdL2LI=;
        b=NIz7joKUhIx4OEKAm2Y+uDsy6oR6PM3VmpVmLxsSp85e2PbDSlRASqEFhuin/1ujQJ
         3wD3G0UJYf262gP0s0/L2D5eJGpCZTId+VXfYWLWnnjVsZkipKPTGdqS9Gq1Hv8mRN8Z
         taSqW94dPzZxksywfT/XRisQ/Cl3Y+u68yERkukW1L21h1woLxcT3LOqEGpV/cSd8RgU
         JaaewCrFuWu0e5zfxTEDTk665je31+GMh0czNwk8yXlePSnxAAsqB8ZWm34bdVdkzkRQ
         k+GD+BQ+IQfvVGIVEFj4yetOfQ37gP+QWu/J6tRhBMESPv9r1XUeqvdLromVfo9NaZpt
         LPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTj8zWma5mXrgfVow+CDMRxnPTfqmfBWH7rdKjdL2LI=;
        b=0ziSN+n1I2J09Bkq2CT1G0bFZNMu5cv5YbI0jkKEqiEHdF9tEG9mqGNMOt5kRcu2SM
         ubFYaljcpm2HClo2ksTFTdaP7gkEDGnX0sCzM+cxr5AZMAIv5OrMdG+3DuC2ngsN7oPl
         7KmCspb8UfyhxeP/J+fT3OPU9Pu9y/Ffe77ngXFE/XXpU5tnLc8rrJoKEjQT2/Am/rq1
         AHX568x3Nv9PWWGgq5tXVOwDsNz9Eeo44hmqNQdqO5vHJP1M3CFfxzrZSuJBjww6uyVt
         ny0gEeb9F5EYe2iLKgnKrvOipSELHRKFSt1b4BF+PAxfqQBLozOYF7vji033AIJiH3Sm
         OyFw==
X-Gm-Message-State: AO0yUKWWmCrHqLKs9aoa/9aYpcDn/AcWs6sKxK+CWrWo2kv5kbKpprro
	hDDa3cADVNrHc3soIf2v1CCUXOcMpv8Gcq9dql0=
X-Google-Smtp-Source: AK7set+dk9K9wFWPC8QpHl2og2kgz0facfqyYrEKVwr75Ryu/prlQjQDDV5ivKZDF39I7j+OtNml1g==
X-Received: by 2002:aa7:9e44:0:b0:5d9:27a5:60bf with SMTP id z4-20020aa79e44000000b005d927a560bfmr13602078pfq.28.1678229332118;
        Tue, 07 Mar 2023 14:48:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/23] openssl: upgrade 1.1.1s to 1.1.1t
Date: Tue,  7 Mar 2023 12:47:53 -1000
Message-Id: <22de5ecae3ebb04a4bab05010c04b205c52ee888.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178141

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Major changes between OpenSSL 1.1.1s and OpenSSL 1.1.1t [7 Feb 2023]
* Fixed X.400 address type confusion in X.509 GeneralName (CVE-2023-0286)
* Fixed Use-after-free following BIO_new_NDEF (CVE-2023-0215)
* Fixed Double free after calling PEM_read_bio_ex (CVE-2022-4450)
* Fixed Timing Oracle in RSA Decryption (CVE-2022-4304)

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_1.1.1s.bb => openssl_1.1.1t.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1s.bb => openssl_1.1.1t.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
index 6c8f285996..a1956ad8c2 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6f18a6f74e4b6aa"
+SRC_URI[sha256sum] = "8dee9b24bdb1dcbf0c3d1e9b02fb8f6bf22165e807f45adeb7c9677536859d3b"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


