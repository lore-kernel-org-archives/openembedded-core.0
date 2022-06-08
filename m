Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AADCCCA47B
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:47:09 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.7372.1654699619214661460
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7EStGASB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id o6so12749431plg.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zHQnLX1DUNMMb0k6iVZIOhfu1BvPY/Kd+yXzmfUvrps=;
        b=7EStGASBaMWASlQ8CjRynkGvDRqwcOPUFoVyeaX6Sq+LxS/8lA4bVAY5YpLJuM7h2F
         6LNCRqCicTnBNe4SfiooYOgbQimZpWncPrRdckPzGNzdD54Ya8MDj2CdR86FKTGnr0UZ
         tALdPuBnQGH3lBlWNdoM1IC5489i7nVXMbELfbYZBHD/8371RUU+WLFECrk+0frYR5vx
         0680YdUGn7yGlJ9xZKSZncHMBa944554ASsHc4ax1CB89Dr8N32JgxLqxviEegIO5eda
         sp4KxCC+74tsNSkOHH4X71sy9mdq6fL3AKvHNsjyrD03AhvUPEMrfQRkkvR+2g57FD4+
         +3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zHQnLX1DUNMMb0k6iVZIOhfu1BvPY/Kd+yXzmfUvrps=;
        b=KBhJsbRmo2Pcdjs42eHAwBDCiemnX46At7UiqH/2/cyiCmRlaxYG31eQPKL1Q4QA+N
         iG1qcnvZ79/rYq8jBAk60e3KNpfs1lJO8vMx9gGKa9BBE6kCOM9EGIZXd3y0lEJQprzj
         4jJPGXJjh4i2j4Naw59mf1S+gh1729B3eog5lZeoC8bQhS+ybo7peStniuG2q2Mbznli
         r3AOtJBkXex/aUWmz3U29OFCzxvh7MhDIDSx/lrZXon4HOsb89qp/JbUnYHRttHCTT30
         w18pDJUlGbGG816NrXPzByQ/CTo5+eZO8mCqoBWqsqXrNpw+WwnfEizJTsSQLQKYBFnA
         EhEg==
X-Gm-Message-State: AOAM531Gg6R6IAs2s6DYz3WSH8K7APbojvVPR2uKZ7JmF9GE9lUZh82L
	P/K2jRM3TjiJKSQkB2pch0qjhzeOExwYWJTB
X-Google-Smtp-Source: 
 ABdhPJwL/qI28c1YKCOxGxNHhf2o9drzKGICh84AWnPCEnMZaMSoZqJiAwjNghxOhLXhOB4S8HBUzg==
X-Received: by 2002:a17:902:ea53:b0:15b:1bb8:ac9e with SMTP id
 r19-20020a170902ea5300b0015b1bb8ac9emr33678996plg.45.1654699618156;
        Wed, 08 Jun 2022 07:46:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm16709701pjb.37.2022.06.08.07.46.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:46:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] Revert "openssl: Backport fix for ptest cert
 expiry"
Date: Wed,  8 Jun 2022 04:46:25 -1000
Message-Id: 
 <68c97aa9e0da2799fa58de945a59b6768a5a7235.1654699348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654699348.git.steve@sakoman.com>
References: <cover.1654699348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:47:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166736

Version 1.1.1 requires additional changes

This reverts commit 4051d1a3aa5f70da96c381f9dea5f52cd9306939.
---
 ...ea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch | 55 -------------------
 .../openssl/openssl_1.1.1o.bb                 |  1 -
 2 files changed, 56 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch b/meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
deleted file mode 100644
index 0249d4181b..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 770aea88c3888cc5cb3ebc94ffcef706c68bc1d2 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tomas@openssl.org>
-Date: Wed, 1 Jun 2022 12:06:33 +0200
-Subject: [PATCH] Update expired SCT issuer certificate
-
-Fixes #15179
-
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
-(Merged from https://github.com/openssl/openssl/pull/18444)
-
-Upstream-Status: Backport
-[Fixes ptest failures in OE-Core]
----
- test/certs/embeddedSCTs1_issuer.pem | 30 ++++++++++++++---------------
- 1 file changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/test/certs/embeddedSCTs1_issuer.pem b/test/certs/embeddedSCTs1_issuer.pem
-index 1fa449d5a098..6aa9455f09ed 100644
---- a/test/certs/embeddedSCTs1_issuer.pem
-+++ b/test/certs/embeddedSCTs1_issuer.pem
-@@ -1,18 +1,18 @@
- -----BEGIN CERTIFICATE-----
--MIIC0DCCAjmgAwIBAgIBADANBgkqhkiG9w0BAQUFADBVMQswCQYDVQQGEwJHQjEk
-+MIIC0jCCAjugAwIBAgIBADANBgkqhkiG9w0BAQsFADBVMQswCQYDVQQGEwJHQjEk
- MCIGA1UEChMbQ2VydGlmaWNhdGUgVHJhbnNwYXJlbmN5IENBMQ4wDAYDVQQIEwVX
--YWxlczEQMA4GA1UEBxMHRXJ3IFdlbjAeFw0xMjA2MDEwMDAwMDBaFw0yMjA2MDEw
--MDAwMDBaMFUxCzAJBgNVBAYTAkdCMSQwIgYDVQQKExtDZXJ0aWZpY2F0ZSBUcmFu
--c3BhcmVuY3kgQ0ExDjAMBgNVBAgTBVdhbGVzMRAwDgYDVQQHEwdFcncgV2VuMIGf
--MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDVimhTYhCicRmTbneDIRgcKkATxtB7
--jHbrkVfT0PtLO1FuzsvRyY2RxS90P6tjXVUJnNE6uvMa5UFEJFGnTHgW8iQ8+EjP
--KDHM5nugSlojgZ88ujfmJNnDvbKZuDnd/iYx0ss6hPx7srXFL8/BT/9Ab1zURmnL
--svfP34b7arnRsQIDAQABo4GvMIGsMB0GA1UdDgQWBBRfnYgNyHPmVNT4DdjmsMEk
--tEfDVTB9BgNVHSMEdjB0gBRfnYgNyHPmVNT4DdjmsMEktEfDVaFZpFcwVTELMAkG
--A1UEBhMCR0IxJDAiBgNVBAoTG0NlcnRpZmljYXRlIFRyYW5zcGFyZW5jeSBDQTEO
--MAwGA1UECBMFV2FsZXMxEDAOBgNVBAcTB0VydyBXZW6CAQAwDAYDVR0TBAUwAwEB
--/zANBgkqhkiG9w0BAQUFAAOBgQAGCMxKbWTyIF4UbASydvkrDvqUpdryOvw4BmBt
--OZDQoeojPUApV2lGOwRmYef6HReZFSCa6i4Kd1F2QRIn18ADB8dHDmFYT9czQiRy
--f1HWkLxHqd81TbD26yWVXeGJPE3VICskovPkQNJ0tU4b03YmnKliibduyqQQkOFP
--OwqULg==
-+YWxlczEQMA4GA1UEBxMHRXJ3IFdlbjAgFw0yMjA2MDExMDM4MDJaGA8yMTIyMDUw
-+ODEwMzgwMlowVTELMAkGA1UEBhMCR0IxJDAiBgNVBAoTG0NlcnRpZmljYXRlIFRy
-+YW5zcGFyZW5jeSBDQTEOMAwGA1UECBMFV2FsZXMxEDAOBgNVBAcTB0VydyBXZW4w
-+gZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANWKaFNiEKJxGZNud4MhGBwqQBPG
-+0HuMduuRV9PQ+0s7UW7Oy9HJjZHFL3Q/q2NdVQmc0Tq68xrlQUQkUadMeBbyJDz4
-+SM8oMczme6BKWiOBnzy6N+Yk2cO9spm4Od3+JjHSyzqE/HuytcUvz8FP/0BvXNRG
-+acuy98/fhvtqudGxAgMBAAGjga8wgawwHQYDVR0OBBYEFF+diA3Ic+ZU1PgN2Oaw
-+wSS0R8NVMH0GA1UdIwR2MHSAFF+diA3Ic+ZU1PgN2OawwSS0R8NVoVmkVzBVMQsw
-+CQYDVQQGEwJHQjEkMCIGA1UEChMbQ2VydGlmaWNhdGUgVHJhbnNwYXJlbmN5IENB
-+MQ4wDAYDVQQIEwVXYWxlczEQMA4GA1UEBxMHRXJ3IFdlboIBADAMBgNVHRMEBTAD
-+AQH/MA0GCSqGSIb3DQEBCwUAA4GBAD0aYh9OkFYfXV7kBfhrtD0PJG2U47OV/1qq
-++uFpqB0S1WO06eJT0pzYf1ebUcxjBkajbJZm/FHT85VthZ1lFHsky87aFD8XlJCo
-+2IOhKOkvvWKPUdFLoO/ZVXqEVKkcsS1eXK1glFvb07eJZya3JVG0KdMhV2YoDg6c
-+Doud4XrO
- -----END CERTIFICATE-----
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
index b3dceb659b..c9cfc759c9 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
@@ -18,7 +18,6 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://afalg.patch \
            file://reproducible.patch \
            file://reproducibility.patch \
-           file://770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.25.1


