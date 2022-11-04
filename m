Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBB9C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:27 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.7127.1667530883773100432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fR1HGnHV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id k15so3384385pfg.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x24hCMCcucIw5sPlAWZ5PxMJ/RFs7nBss6CnYNustIk=;
        b=fR1HGnHVW3fIew9LqD94SoSlv0NahePQKlcL1wTskjxy236XaaNOugKErbTQVkqQtr
         mkMdmtaKN/o2LUFI3ymnflVgxm8xLjVjwJgrNra2ILlvcXUEd0IsrEFNAy+nE/VuQat1
         VKpziPnBMSUtKN/+yMMy+GWZbneNpHWcLCH3CpqRAwoHjrQ2Kt1acL3PfSDBuyS3K1Ot
         CiiIyedp4oShaD4QIsFY7e+nrsTWiksETvz+XR2wMmE4slBTUzieeNmrR936dwH7ZLzv
         9/6Q9x2ucm0OjFkJDrFDouDFolLpSnN7Kg/Xz1s1aFJ979G0wr4aFHRHop/gude+C4c3
         mrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x24hCMCcucIw5sPlAWZ5PxMJ/RFs7nBss6CnYNustIk=;
        b=K5QdfHfAkhnF4u119a1SYqnimf+W7/m/FCaA1NRcmAgyM5zK7Kmtb2U2sbr0qtFuZ9
         IDF1YnatAv2+NH5bK/lwkIX4/hxI+nG4IJs3PdbtXLG2Hy8R9+91oLDvFY2xG8Kz7YCo
         4pPRkogY63SWeKDqbjhSZE3udkkEoD/KXpin02cFO6wolqeI9vxnS/0Ve1Ftf92rLA4J
         xmcBkxOjeQ0r79uznWQ48MBm7c3WSCI59DGEl0GKuEG1NGIloAfRYXa9PhA2+m2ZxkRd
         AGx2AKZNq2nsYFBsRcS+yrbUdq40Kz7NeYdq4Z9WPMT5K6tatApVwvfuT9Po+EStSeT4
         xo1A==
X-Gm-Message-State: ACrzQf3ng+zWoJwsaSrWjiArqakzBVLH6lCr/n4KAGMuYaJjYVePJiYN
	PX26+Cc4+Ju4T5+FqOLwSr3uUw6XIo3vmVNd
X-Google-Smtp-Source: AMsMyM6Fxs4hPesvzjsHeEpkPoICKz+QVDlzbet9dolsEAzkgGewzpaery/AM3FNggduEPSKe6kVaQ==
X-Received: by 2002:a63:5205:0:b0:46f:6320:9016 with SMTP id g5-20020a635205000000b0046f63209016mr29136753pgb.437.1667530882804;
        Thu, 03 Nov 2022 20:01:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/31] openssl: Fix SSL_CERT_FILE to match ca-certs location
Date: Thu,  3 Nov 2022 17:00:37 -1000
Message-Id: <d45879ac4a46ee5b6182a57c5bf4b2f0d5e20219.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172663

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In OE-Core d6b15d1e70b99185cf245d829ada5b6fb99ec1af,
"openssl: export necessary env vars in SDK", the value added for
SSL_CERT_FILE was in conflict with the value used elsewhere, such as
in buildtools. This makes them match and fixes buildtools testsdk
failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d383a7fc6da666c80f2fc037af5f49a3388eb2b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit a9a50f2216951e26b62ed2f86f341d9ad13acf48)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-connectivity/openssl/files/environment.d-openssl.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index 516bbd1c56..6f23490c87 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,5 +1,5 @@
 export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
 export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
-export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/cert.pem"
+export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
-- 
2.25.1


