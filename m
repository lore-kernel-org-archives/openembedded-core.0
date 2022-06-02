Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5512C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 09:25:49 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.4640.1654161943187086242
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 02:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c2lkud5r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id x17so5661665wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JCEuwE+9586zt6myVRJMLMABX2FNeFUWAPnTqp0EDbA=;
        b=c2lkud5rvbrSRkegyKW+SPs0Q6OKSpN3fOvvUCKm+pTjH8/KYuN7EHMla/EzhWupqq
         wqeM5MV47s6xhP5d+6WpkGxxnMOU/hRFR3J2KRyl7etSu137zR1vgCl9tNb95Rc5Mswi
         5Cu/HzScvvTeg4d7UxlZ9lhf7aDZjPeOYciqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JCEuwE+9586zt6myVRJMLMABX2FNeFUWAPnTqp0EDbA=;
        b=bc0llL5y8Xzy96CUGd7rirEH7VBF+0/KFDtbta082zeRGVRyCaojmWj/AL1TV7h2GT
         X1hbD1pYnEtbzlHjBFSNhJ3+kJslyuOP2zlsP3gF/jkv/9UWAm6sMIt5i4ypxOWpjEOz
         rb7CqEyXVtgdEYLni7HTaRf8iA1FgmD+ad2NJXxbMN6evj3wt8eI00gLDf+/uZYhxVih
         o8k6iQvwurdoAoUdyV3B9m8DjKYzml/LaUVZOQwt7CTsJOc2dTKGyq5ii+yQi1vT7j0h
         Oue5E8cb6LYQyetFJuubX9KamzV0e7ZuDGJu0rsLuM+P/OyNN0pKt3UQDP+5qvh5WFCJ
         tWiQ==
X-Gm-Message-State: AOAM532VvfbFt09jcgHr3GIx2cBTGYd1MoOb0nqNJrczq+vt/Vbnmvuf
	UDFQgix8STqG466+owE1nKZ9sIVST9ijiudd
X-Google-Smtp-Source: 
 ABdhPJzAz1kYyV47TJsRJpnf5kkjtmUOkPy69/4LfalNvBRsXBifdBlTDSfmnhPkCF2AflZFOvkf4g==
X-Received: by 2002:a5d:6348:0:b0:213:3a8e:e75d with SMTP id
 b8-20020a5d6348000000b002133a8ee75dmr1393861wrw.55.1654161941207;
        Thu, 02 Jun 2022 02:25:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:171c:95a:9d1d:26d3])
        by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4c8b000000b0020e5b4ebaecsm3874728wrs.4.2022.06.02.02.25.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 02:25:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: Backport fix for ptest cert expiry
Date: Thu,  2 Jun 2022 10:25:40 +0100
Message-Id: <20220602092540.129452-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 09:25:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166465

ptests in in openssl have started failing as one of the test certificates has
expired. Backport a fix for this from upstream, replacing the test
certificate to allow the ptests to pass again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch | 55 +++++++++++++++++++
 .../openssl/openssl_3.0.3.bb                  |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch b/meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
new file mode 100644
index 00000000000..0249d4181be
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
index fd88ae807da..35a62755ad4 100644
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
2.34.1


