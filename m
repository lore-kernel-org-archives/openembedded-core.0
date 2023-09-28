Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C598CCE7AF3
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:49:18 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.6180.1695869354401914439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l9jur9m5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6bd04558784so7440556a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869353; x=1696474153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJ74rk1O4PQ8vreaKhrrgWOS50x7X1N9QuDLJIYIIZU=;
        b=l9jur9m5JArrLpfvZ/jmwfkf/LgvrlOSx51j2DgOsudtBMQ+h4oLheaLpZgYsqJ2BL
         c4hRWb9rSZGKbu1FV12KdoBxlQaI+vSkP64TisXG0VLZSc3Asprmb34wVRxCQYCgDM/z
         RCSCg+xFgfwhgsC65lSoL6UQmQpPHZ1dgaIcc6zdb+A2zuHzDtry2L41wG05ACRb1GO0
         x8ByItH1XKqJ35uUcooSQAunSH/75Hq9ose9nt3eogeUbtN/UMWlfsQOLytblGxrWytQ
         XOZC4L17g7D+sm3ospFCGydH7aHKcX9PkNJSQTBI6WuRfFy9jjRE9tKdNWrH1Q7xuNte
         x4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869353; x=1696474153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJ74rk1O4PQ8vreaKhrrgWOS50x7X1N9QuDLJIYIIZU=;
        b=E86ft6S9lqUT2txAdeqHUFIUNV6qSENUpP/mV6+YJ7P959Np2TirxQCvVPVAdPlkai
         IgM/aQrGC5MVY29/g/MuncRF9k8SFyeg4KJ3FqNzicuzXkMtAV9DSLdrJbSe8T2bscXq
         txg2mFZ+MU2DEh0oEdbqUMfTtuyZN5Fu9J7XvLFe+MY21lfraZzyC8r0fMlLFc2Ym+z/
         ObNvB6W68Q4s9HZ9LyGRxfE8D+UwWUEOIq0Yh0byVFNEH4szyyfQdTptrrm6mdzFSJN9
         xWG6GP2e37olTN1iahasbN7tI48FkyL/gLRHnl2lmgXZkEWx05cFoiNe3myKrbfx3JHH
         KESw==
X-Gm-Message-State: AOJu0Yxn9nMVFiEYHTQefGpWNOIDRcPtWPKZuQJ9goT5yuAH8i5Tj2tj
	VYVJXgx+HqRn1FFhfgWxFEpZvpfyR8VTFPkZSys=
X-Google-Smtp-Source: AGHT+IFwYe+GyogotCSvN1Lsm51s90zYpaaRuz5CCscQALm0e5hLmYEhOsw7pj02V3+dkaTh5PZVBw==
X-Received: by 2002:a9d:4d12:0:b0:6bd:7252:9db1 with SMTP id n18-20020a9d4d12000000b006bd72529db1mr4130922otf.11.1695869353463;
        Wed, 27 Sep 2023 19:49:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.49.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:49:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/17] openssl: Upgrade 3.0.10 -> 3.0.11
Date: Wed, 27 Sep 2023 16:48:42 -1000
Message-Id: <1263bb1784e8e052d903408faffcf39431fd9a10.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188363

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.0/NEWS.md#major-changes-between-openssl-3010-and-openssl-3011-19-sep-2023
Major changes between OpenSSL 3.0.10 and OpenSSL 3.0.11 [19 Sep 2023]
* Fix POLY1305 MAC implementation corrupting XMM registers on Windows (CVE-2023-4807)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_3.0.10.bb => openssl_3.0.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.10.bb => openssl_3.0.11.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.10.bb b/meta/recipes-connectivity/openssl/openssl_3.0.11.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.10.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.11.bb
index c770f1c712..22eaa3af33 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.10.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.11.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "1761d4f5b13a1028b9b6f3d4b8e17feb0cedc9370f6afe61d7193d2cdce83323"
+SRC_URI[sha256sum] = "b3425d3bb4a2218d0697eb41f7fc0cdede016ed19ca49d168b78e8d947887f55"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


