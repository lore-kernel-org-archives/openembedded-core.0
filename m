Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311B4CCA47B
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:39 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.7287.1654699230805625898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=c6CH7bfT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id n18so17816507plg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y6XTLgPYP0oJTJUYgLDAFsukgKoH8Cx+3DgNXTreCBQ=;
        b=c6CH7bfTg1EYgVUvJemwHfIrbsodc4POodqCj5IFdC+xOpBs9BZF8n+pjG49HIk1xk
         imN5YdgnAIDKR1lNnyRlgOzK4VPHQEUCxRTS2do22hD/UvTlyGuTUDkODTcs8FalIrge
         kxb2CM7aR9RU+mrJdBXBqk9X8ZpUnzDywghiaTF2FpvfLVSVJy2EuCXDNWTXBwrb7MUA
         0QrxjF9jAin6g7ww5aBG2GKatyYti45SlJe1SVU3+arx9KZl5Fg4qLeFlao+AbDUujtE
         yV4EXbn7XqY9dYwcRxT4pMSSk3L0TMctIudSusRpELqo2oLQPzAqYbJdGxCAWKgWSGsl
         8sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y6XTLgPYP0oJTJUYgLDAFsukgKoH8Cx+3DgNXTreCBQ=;
        b=Bls4KYayLuHN1/j/BZ0dsy2D+rS03YDy4SK52WJ6ars1TDSo22TJxaeA8Kz7lqgt4y
         /YQzngYd7mCqTYeenscxNcJveQZaMVwNvrzgfMCgPhDjNuisWVWBaM80y/pD0Z24tnTI
         P8clg8w58Qj+/pqRsS68Ovtl+0oaH1WnsPcjZ0wc1yv/oV2+WGqX6K+oG0QIsChuOUeu
         pGmYV3WAPZAnC6E+IkVpxnPc2aABjSnhUyqJUQcrT5nu6pLbaR8m95uXHacqEmr24LUb
         QgYJgYvoO6E5hm32btVdjYil6t6bsw3ZKZq62ymcRUc9USs1/yv3fucs/1EDmStfkSWo
         86kw==
X-Gm-Message-State: AOAM530bCfT83n9DeCVNjT9XoRwpvkVriGAVKwCR7VNTK6hSImOH9ToE
	urk4cbc6zxaOdJsPxjxGhmu0hTDu4Mme2LpT
X-Google-Smtp-Source: 
 ABdhPJziYeBToJDZLeFPGdu0hipB6SPb07QRbLWgj+0UweKEdBikV98Xgd8hoFbbe8sqJybjyywPgQ==
X-Received: by 2002:a17:90a:1c02:b0:1e0:df7:31f2 with SMTP id
 s2-20020a17090a1c0200b001e00df731f2mr74213122pjs.222.1654699229580;
        Wed, 08 Jun 2022 07:40:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/22] openssl: Backport fix for ptest cert
 expiry
Date: Wed,  8 Jun 2022 04:39:27 -1000
Message-Id: 
 <c3b7f7a9184188db5ce9ac665e6c2f3e22065fec.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166725

From: Richard Purdie <richard.purdie@linuxfoundation.org>

ptests in in openssl have started failing as one of the test certificates has
expired. Backport a fix for this from upstream, replacing the test
certificate to allow the ptests to pass again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f26f0b34f12bbca2beed153da402a3594d127374)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch | 55 +++++++++++++++++++
 .../openssl/openssl_3.0.3.bb                  |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch b/meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
new file mode 100644
index 0000000000..0249d4181b
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
@@ -0,0 +1,55 @@
+From 770aea88c3888cc5cb3ebc94ffcef706c68bc1d2 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Wed, 1 Jun 2022 12:06:33 +0200
+Subject: [PATCH] Update expired SCT issuer certificate
+
+Fixes #15179
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
+(Merged from https://github.com/openssl/openssl/pull/18444)
+
+Upstream-Status: Backport
+[Fixes ptest failures in OE-Core]
+---
+ test/certs/embeddedSCTs1_issuer.pem | 30 ++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/test/certs/embeddedSCTs1_issuer.pem b/test/certs/embeddedSCTs1_issuer.pem
+index 1fa449d5a098..6aa9455f09ed 100644
+--- a/test/certs/embeddedSCTs1_issuer.pem
++++ b/test/certs/embeddedSCTs1_issuer.pem
+@@ -1,18 +1,18 @@
+ -----BEGIN CERTIFICATE-----
+-MIIC0DCCAjmgAwIBAgIBADANBgkqhkiG9w0BAQUFADBVMQswCQYDVQQGEwJHQjEk
++MIIC0jCCAjugAwIBAgIBADANBgkqhkiG9w0BAQsFADBVMQswCQYDVQQGEwJHQjEk
+ MCIGA1UEChMbQ2VydGlmaWNhdGUgVHJhbnNwYXJlbmN5IENBMQ4wDAYDVQQIEwVX
+-YWxlczEQMA4GA1UEBxMHRXJ3IFdlbjAeFw0xMjA2MDEwMDAwMDBaFw0yMjA2MDEw
+-MDAwMDBaMFUxCzAJBgNVBAYTAkdCMSQwIgYDVQQKExtDZXJ0aWZpY2F0ZSBUcmFu
+-c3BhcmVuY3kgQ0ExDjAMBgNVBAgTBVdhbGVzMRAwDgYDVQQHEwdFcncgV2VuMIGf
+-MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDVimhTYhCicRmTbneDIRgcKkATxtB7
+-jHbrkVfT0PtLO1FuzsvRyY2RxS90P6tjXVUJnNE6uvMa5UFEJFGnTHgW8iQ8+EjP
+-KDHM5nugSlojgZ88ujfmJNnDvbKZuDnd/iYx0ss6hPx7srXFL8/BT/9Ab1zURmnL
+-svfP34b7arnRsQIDAQABo4GvMIGsMB0GA1UdDgQWBBRfnYgNyHPmVNT4DdjmsMEk
+-tEfDVTB9BgNVHSMEdjB0gBRfnYgNyHPmVNT4DdjmsMEktEfDVaFZpFcwVTELMAkG
+-A1UEBhMCR0IxJDAiBgNVBAoTG0NlcnRpZmljYXRlIFRyYW5zcGFyZW5jeSBDQTEO
+-MAwGA1UECBMFV2FsZXMxEDAOBgNVBAcTB0VydyBXZW6CAQAwDAYDVR0TBAUwAwEB
+-/zANBgkqhkiG9w0BAQUFAAOBgQAGCMxKbWTyIF4UbASydvkrDvqUpdryOvw4BmBt
+-OZDQoeojPUApV2lGOwRmYef6HReZFSCa6i4Kd1F2QRIn18ADB8dHDmFYT9czQiRy
+-f1HWkLxHqd81TbD26yWVXeGJPE3VICskovPkQNJ0tU4b03YmnKliibduyqQQkOFP
+-OwqULg==
++YWxlczEQMA4GA1UEBxMHRXJ3IFdlbjAgFw0yMjA2MDExMDM4MDJaGA8yMTIyMDUw
++ODEwMzgwMlowVTELMAkGA1UEBhMCR0IxJDAiBgNVBAoTG0NlcnRpZmljYXRlIFRy
++YW5zcGFyZW5jeSBDQTEOMAwGA1UECBMFV2FsZXMxEDAOBgNVBAcTB0VydyBXZW4w
++gZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANWKaFNiEKJxGZNud4MhGBwqQBPG
++0HuMduuRV9PQ+0s7UW7Oy9HJjZHFL3Q/q2NdVQmc0Tq68xrlQUQkUadMeBbyJDz4
++SM8oMczme6BKWiOBnzy6N+Yk2cO9spm4Od3+JjHSyzqE/HuytcUvz8FP/0BvXNRG
++acuy98/fhvtqudGxAgMBAAGjga8wgawwHQYDVR0OBBYEFF+diA3Ic+ZU1PgN2Oaw
++wSS0R8NVMH0GA1UdIwR2MHSAFF+diA3Ic+ZU1PgN2OawwSS0R8NVoVmkVzBVMQsw
++CQYDVQQGEwJHQjEkMCIGA1UEChMbQ2VydGlmaWNhdGUgVHJhbnNwYXJlbmN5IENB
++MQ4wDAYDVQQIEwVXYWxlczEQMA4GA1UEBxMHRXJ3IFdlboIBADAMBgNVHRMEBTAD
++AQH/MA0GCSqGSIb3DQEBCwUAA4GBAD0aYh9OkFYfXV7kBfhrtD0PJG2U47OV/1qq
+++uFpqB0S1WO06eJT0pzYf1ebUcxjBkajbJZm/FHT85VthZ1lFHsky87aFD8XlJCo
++2IOhKOkvvWKPUdFLoO/ZVXqEVKkcsS1eXK1glFvb07eJZya3JVG0KdMhV2YoDg6c
++Doud4XrO
+ -----END CERTIFICATE-----
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.3.bb b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
index fd88ae807d..35a62755ad 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.25.1


