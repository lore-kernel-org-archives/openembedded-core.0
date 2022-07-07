Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A04BC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 22:00:11 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.744.1657231200956404346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=j3ploiXA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id s27so20763711pga.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ygu/ZYu+dStxQHPXwFvortc9yr7a3PAlrB/GvkeJgKA=;
        b=j3ploiXAwaNLKaBACLbMDogHHJYAx4bPNqfmSjBIM3nG3puHbfhMpkk1KN/HqOjcbc
         mdEC8aBDO/J0dObUxvFzNi75meebRq2cR3w6hTbBuUgANV9DwDI/pgu2JlkV3/dhzsk5
         Vu3LMUvAvo2O9R73k814X35HDmeEoaXQtY7TIbmA3wA+BXrohO7T8HggJSqJlK47SfV5
         B/znNvrBkIyds3bPqm5vQMBdXu8LkZ8qyy7qYfjnFpg0e8GzmXGWgtiOS/aHgYafV9HD
         K16cSxXVd/bLXkb2plPdv/PL+Nx+gRkLivhKhhQ14oAlVi71Dk07Poy6JJxL1o3wQ8YL
         lQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ygu/ZYu+dStxQHPXwFvortc9yr7a3PAlrB/GvkeJgKA=;
        b=f4BDBnfUeaILG79teQoqjctQA2Y+sAElEAAutfbpz2/NbHL+ipyDWROHOnEMuNjMFa
         UUuSk69PPqfML88Z4O8wNE1QYZWhwsSFrDwkdVSi9/F5LE76CxFrZHEZEDqAOK+qDlmR
         y8+0z4HJMVqhX9lSNARBZUwK/2fAwjtb/YTNCOAtKeMIpQHJoqOehf/XryTFUobQEvQf
         KN4eMRYmih/7KSdoTdD/DFQHCBf4/suIc6BKzStox6bSeiNLsNxjoNZ6F9fkMCe+D2Iz
         bY71yiv1EbQtRsL8yRyusiChq1X67FRavbmudD0rZOYg3wDTTYrfB3KS8NQjCRBuuqw8
         8RmQ==
X-Gm-Message-State: AJIora+3iskmXqpc0OP36SSLSkTkX2U1+1v6pUkWVcXRI8A7wkzriJ0H
	0cLJJwgWHgEMSr6D+47FoR/EUjTBf5SpUgK4
X-Google-Smtp-Source: 
 AGRyM1uMczyVkGKDaQLRAk3yFqhuD72n8ZxuoIIWRXvV8its/syrHVTxdA/RqkACv0FaBxkFj4/hCw==
X-Received: by 2002:a65:49cd:0:b0:40d:7553:e3be with SMTP id
 t13-20020a6549cd000000b0040d7553e3bemr232952pgs.370.1657231199447;
        Thu, 07 Jul 2022 14:59:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.14.59.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:59:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/14] openssl: Minor security upgrade 1.1.1o to
 1.1.1p
Date: Thu,  7 Jul 2022 11:59:25 -1000
Message-Id: 
 <a8283f9251f59d86f93f9d7cfd4c7e29c61e4631.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 22:00:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167801

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

This security upgrade fixes CVE-2022-2068 as per below link
Link: https://www.openssl.org/news/cl111.txt
Also, remove 73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch and
b7ce611887cfac633aacc052b2e71a7f195418b8.patch as these two are part
1.1.1p now

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...5d82489b3ec09ccc772dfcee14fef0e8e908.patch | 192 ------------------
 ...611887cfac633aacc052b2e71a7f195418b8.patch |  29 ---
 .../{openssl_1.1.1o.bb => openssl_1.1.1p.bb}  |   4 +-
 3 files changed, 1 insertion(+), 224 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e71a7f195418b8.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1o.bb => openssl_1.1.1p.bb} (97%)

diff --git a/meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch b/meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch
deleted file mode 100644
index 438ecdcd32..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From 73db5d82489b3ec09ccc772dfcee14fef0e8e908 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tomas@openssl.org>
-Date: Wed, 1 Jun 2022 12:47:44 +0200
-Subject: [PATCH] Update expired SCT certificates
-
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
-(Merged from https://github.com/openssl/openssl/pull/18446)
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/73db5d82489b3ec09ccc772dfcee14fef0e8e908]
-Signed-off-by: Steve Sakoman <steve@sakoman.com>
-
----
- test/certs/embeddedSCTs1-key.pem        | 38 ++++++++++++++++---------
- test/certs/embeddedSCTs1.pem            | 35 ++++++++++++-----------
- test/certs/embeddedSCTs1.sct            | 12 ++++----
- test/certs/embeddedSCTs1_issuer-key.pem | 15 ++++++++++
- test/certs/embeddedSCTs1_issuer.pem     | 30 +++++++++----------
- 5 files changed, 79 insertions(+), 51 deletions(-)
- create mode 100644 test/certs/embeddedSCTs1_issuer-key.pem
-
-diff --git a/test/certs/embeddedSCTs1-key.pem b/test/certs/embeddedSCTs1-key.pem
-index e3e66d55c510..28dd206dbe8d 100644
---- a/test/certs/embeddedSCTs1-key.pem
-+++ b/test/certs/embeddedSCTs1-key.pem
-@@ -1,15 +1,27 @@
- -----BEGIN RSA PRIVATE KEY-----
--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
- -----END RSA PRIVATE KEY-----
-diff --git a/test/certs/embeddedSCTs1.pem b/test/certs/embeddedSCTs1.pem
-index d1e85120a043..d2a111fb8235 100644
---- a/test/certs/embeddedSCTs1.pem
-+++ b/test/certs/embeddedSCTs1.pem
-@@ -1,20 +1,21 @@
- -----BEGIN CERTIFICATE-----
--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
-+YT6yTEIzJuO07Xp61qnB1CE2TrinUWlyC46Zkw==
- -----END CERTIFICATE-----
-diff --git a/test/certs/embeddedSCTs1.sct b/test/certs/embeddedSCTs1.sct
-index 59362dcee1f4..35c9eb9e3bed 100644
---- a/test/certs/embeddedSCTs1.sct
-+++ b/test/certs/embeddedSCTs1.sct
-@@ -2,11 +2,11 @@ Signed Certificate Timestamp:
-     Version   : v1 (0x0)
-     Log ID    : DF:1C:2E:C1:15:00:94:52:47:A9:61:68:32:5D:DC:5C:
-                 79:59:E8:F7:C6:D3:88:FC:00:2E:0B:BD:3F:74:D7:64
--    Timestamp : Apr  5 17:04:16.275 2013 GMT
-+    Timestamp : Jan  1 00:00:00.000 2020 GMT
-     Extensions: none
-     Signature : ecdsa-with-SHA256
--                30:45:02:20:48:2F:67:51:AF:35:DB:A6:54:36:BE:1F:
--                D6:64:0F:3D:BF:9A:41:42:94:95:92:45:30:28:8F:A3:
--                E5:E2:3E:06:02:21:00:E4:ED:C0:DB:3A:C5:72:B1:E2:
--                F5:E8:AB:6A:68:06:53:98:7D:CF:41:02:7D:FE:FF:A1:
--                05:51:9D:89:ED:BF:08
-\ No newline at end of file
-+                30:45:02:20:7C:33:E8:F1:10:2B:9B:FB:DC:48:46:7A:
-+                D3:C4:35:BB:E5:D0:E7:94:01:BB:AE:D2:64:4B:99:C4:
-+                BA:5B:50:CD:02:21:00:D1:B2:07:13:B9:DE:0F:0F:2F:
-+                02:82:0F:A5:1D:E0:12:ED:4C:60:48:A0:5B:58:0C:E7:
-+                60:EB:A8:AF:03:5E:C3
-\ No newline at end of file
-diff --git a/test/certs/embeddedSCTs1_issuer-key.pem b/test/certs/embeddedSCTs1_issuer-key.pem
-new file mode 100644
-index 000000000000..9326e38b1eb7
---- /dev/null
-+++ b/test/certs/embeddedSCTs1_issuer-key.pem
-@@ -0,0 +1,15 @@
-+-----BEGIN RSA PRIVATE KEY-----
-+MIICXAIBAAKBgQDVimhTYhCicRmTbneDIRgcKkATxtB7jHbrkVfT0PtLO1FuzsvR
-+yY2RxS90P6tjXVUJnNE6uvMa5UFEJFGnTHgW8iQ8+EjPKDHM5nugSlojgZ88ujfm
-+JNnDvbKZuDnd/iYx0ss6hPx7srXFL8/BT/9Ab1zURmnLsvfP34b7arnRsQIDAQAB
-+AoGAJLR6xEJp+5IXRFlLn7WTkFvO0ddtxJ7bXhiIkTctyruyfqp7LF9Jv1G2m3PK
-+QPUtBc73w/GYkfnwIwdfJbOmPHL7XyEGHZYmEXgIgEtw6LXvAv0G5JpUnNwsSBfL
-+GfSQqI5Z5ytyzlJXkMcTGA2kTgNAYc73h4EnU+pwUnDPdAECQQD2aj+4LtYk1XPq
-+r3gjgI6MoGvgYJfPmAtZhxxVbhXQKciFUCAcBiwlQdHIdLWE9j65ctmZRWidKifr
-+4O4nz+TBAkEA3djNW/rTQq5fKZy+mCF1WYnIU/3yhJaptzRqLm7AHqe7+hdrGXJw
-++mCtU8T3L/Ms8bH1yFBZhmkp1PbR8gl48QJAQo70YyWThiN5yfxXcQ96cZWrTdIJ
-+b3NcLXSHPLQdhDqlBQ1dfvRT3ERpC8IqfZ2d162kBPhwh3MpkVcSPQK0gQJAC/dY
-+xGBYKt2a9nSk9zG+0bCT5Kvq++ngh6hFHfINXNnxUsEWns3EeEzkrIMQTj7QqszN
-+lBt5aL2dawZRNrv6EQJBAOo4STF9KEwQG0HLC/ryh1FeB0OBA5yIepXze+eJVKei
-+T0cCECOQJKfWHEzYJYDJhyEFF/sYp9TXwKSDjOifrsU=
-+-----END RSA PRIVATE KEY-----
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
diff --git a/meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e71a7f195418b8.patch b/meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e71a7f195418b8.patch
deleted file mode 100644
index 832f651660..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e71a7f195418b8.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b7ce611887cfac633aacc052b2e71a7f195418b8 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tomas@openssl.org>
-Date: Wed, 1 Jun 2022 13:06:46 +0200
-Subject: [PATCH] ct_test.c: Update the epoch time
-
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
-(Merged from https://github.com/openssl/openssl/pull/18446)
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/b7ce611887cfac633aacc052b2e71a7f195418b8]
-Signed-off-by: Steve Sakoman <steve@sakoman.com>
-
----
- test/ct_test.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/ct_test.c b/test/ct_test.c
-index 78d11ca98cf7..535897d09a77 100644
---- a/test/ct_test.c
-+++ b/test/ct_test.c
-@@ -63,7 +63,7 @@ static CT_TEST_FIXTURE *set_up(const char *const test_case_name)
-     if (!TEST_ptr(fixture = OPENSSL_zalloc(sizeof(*fixture))))
-         goto end;
-     fixture->test_case_name = test_case_name;
--    fixture->epoch_time_in_ms = 1473269626000ULL; /* Sep 7 17:33:46 2016 GMT */
-+    fixture->epoch_time_in_ms = 1580335307000ULL; /* Wed 29 Jan 2020 10:01:47 PM UTC */
-     if (!TEST_ptr(fixture->ctlog_store = CTLOG_STORE_new())
-             || !TEST_int_eq(
-                     CTLOG_STORE_load_default_file(fixture->ctlog_store), 1))
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1p.bb
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1p.bb
index e24467739f..8916218c33 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1p.bb
@@ -18,15 +18,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://afalg.patch \
            file://reproducible.patch \
            file://reproducibility.patch \
-           file://73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch \
-           file://b7ce611887cfac633aacc052b2e71a7f195418b8.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "9384a2b0570dd80358841464677115df785edb941c71211f75076d72fe6b438f"
+SRC_URI[sha256sum] = "bf61b62aaa66c7c7639942a94de4c9ae8280c08f17d4eac2e44644d9fc8ace6f"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


