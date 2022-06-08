Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A79FCCA487
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:47:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.7418.1654699621692168131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=blfUc2+e;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id t2so17832223pld.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y+Et+wKiIXk2Xfj17EbxxLe3yyvlGXinnHcSGg6FAqg=;
        b=blfUc2+eeI87Glw6AKW8eDs2kCEZreNddcVmdyYuGmOfjd256pkYosZJQUm+q3SrF9
         xzwcXwrJLuwLLDB4/pyOC4BQrM2lFL2PE3/RH4WOLg2GJEsBcVvGsUQia4ie0qPL+E9h
         wkb/EKlouUSu7guOCXqthMrXyF/YO7Pz3T1vgJYuEfMjYgijvmA4CUIlPDaslPGOHT+v
         9/MDI59cEH8pv1uwZatRP+qhYhb35pwhoGxTFQJs5rLjr7AdLKG9VrAwzi3r+NIDs8Ae
         4idBxVP4ObyOxMPPR6ow5oeHjUVVioUS4c5HEOJRUqYGOm+qR4El2hCEiPtl7sWVcbJF
         QLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y+Et+wKiIXk2Xfj17EbxxLe3yyvlGXinnHcSGg6FAqg=;
        b=TFS49C4aOy7hFLdlTmukEQL5dlUvM8DW49E0fdQNH91egWGM60iDRtfVl//yWUpc0E
         mnv/b3rcGetNfWlL2GxkSVIWZw5tn6XEJmt/Hue+DFh3xTiRlujl64AegRjQ2EGLnkzY
         hVVMNjCJpK5plo3mWh5Ggn+sGRbmbszIUWiu53+fDjCYT02GkqHa7QW98mHzXdRoRDE/
         tpfmjMMDeYKqhcKA6QuKHy9djYZDF0OL3H3xv9BqdcQfBI+PmdyMtvvdZ3h17XyTo+5W
         JUMpUbFMUAe7iGuD4kedN9Pg1ptokNf0j52QyZte7R/AawK3yknyOi8NNPQMFQ/sgJMH
         YPmw==
X-Gm-Message-State: AOAM533pFI2jI3YTYH7EvVe67JWBPzq9FskI6DZvKHjW56ti5/P4zgIZ
	00at4gQwIzTFOsHQxJo30NEhXOYmXesdoUwp
X-Google-Smtp-Source: 
 ABdhPJz+YQvz3i/bf6E2xjUxBiKhow7Y+zw2WS0J7GYmlzhCKD/UFQQen5Mw3EtVUQ/owmPqyKzCDg==
X-Received: by 2002:a17:902:d102:b0:167:4f35:9580 with SMTP id
 w2-20020a170902d10200b001674f359580mr25404068plw.38.1654699620499;
        Wed, 08 Jun 2022 07:47:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm16709701pjb.37.2022.06.08.07.46.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:46:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/14] openssl: backport fix for ptest certificate
 expiration
Date: Wed,  8 Jun 2022 04:46:26 -1000
Message-Id: 
 <40858a05989d45b0c772fdec837d3dc95d4df59d.1654699348.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/166737

ptests in in openssl have started failing as test certificates have
expired. Backport a fix for this from upstream, replacing the test
certificates to allow the ptests to pass again.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...5d82489b3ec09ccc772dfcee14fef0e8e908.patch | 192 ++++++++++++++++++
 .../openssl/openssl_1.1.1o.bb                 |   1 +
 2 files changed, 193 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch b/meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch
new file mode 100644
index 0000000000..438ecdcd32
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch
@@ -0,0 +1,192 @@
+From 73db5d82489b3ec09ccc772dfcee14fef0e8e908 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Wed, 1 Jun 2022 12:47:44 +0200
+Subject: [PATCH] Update expired SCT certificates
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
+(Merged from https://github.com/openssl/openssl/pull/18446)
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/73db5d82489b3ec09ccc772dfcee14fef0e8e908]
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ test/certs/embeddedSCTs1-key.pem        | 38 ++++++++++++++++---------
+ test/certs/embeddedSCTs1.pem            | 35 ++++++++++++-----------
+ test/certs/embeddedSCTs1.sct            | 12 ++++----
+ test/certs/embeddedSCTs1_issuer-key.pem | 15 ++++++++++
+ test/certs/embeddedSCTs1_issuer.pem     | 30 +++++++++----------
+ 5 files changed, 79 insertions(+), 51 deletions(-)
+ create mode 100644 test/certs/embeddedSCTs1_issuer-key.pem
+
+diff --git a/test/certs/embeddedSCTs1-key.pem b/test/certs/embeddedSCTs1-key.pem
+index e3e66d55c510..28dd206dbe8d 100644
+--- a/test/certs/embeddedSCTs1-key.pem
++++ b/test/certs/embeddedSCTs1-key.pem
+@@ -1,15 +1,27 @@
+ -----BEGIN RSA PRIVATE KEY-----
+-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
+ -----END RSA PRIVATE KEY-----
+diff --git a/test/certs/embeddedSCTs1.pem b/test/certs/embeddedSCTs1.pem
+index d1e85120a043..d2a111fb8235 100644
+--- a/test/certs/embeddedSCTs1.pem
++++ b/test/certs/embeddedSCTs1.pem
+@@ -1,20 +1,21 @@
+ -----BEGIN CERTIFICATE-----
+-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
+ -----END CERTIFICATE-----
+diff --git a/test/certs/embeddedSCTs1.sct b/test/certs/embeddedSCTs1.sct
+index 59362dcee1f4..35c9eb9e3bed 100644
+--- a/test/certs/embeddedSCTs1.sct
++++ b/test/certs/embeddedSCTs1.sct
+@@ -2,11 +2,11 @@ Signed Certificate Timestamp:
+     Version   : v1 (0x0)
+     Log ID    : DF:1C:2E:C1:15:00:94:52:47:A9:61:68:32:5D:DC:5C:
+                 79:59:E8:F7:C6:D3:88:FC:00:2E:0B:BD:3F:74:D7:64
+-    Timestamp : Apr  5 17:04:16.275 2013 GMT
++    Timestamp : Jan  1 00:00:00.000 2020 GMT
+     Extensions: none
+     Signature : ecdsa-with-SHA256
+-                30:45:02:20:48:2F:67:51:AF:35:DB:A6:54:36:BE:1F:
+-                D6:64:0F:3D:BF:9A:41:42:94:95:92:45:30:28:8F:A3:
+-                E5:E2:3E:06:02:21:00:E4:ED:C0:DB:3A:C5:72:B1:E2:
+-                F5:E8:AB:6A:68:06:53:98:7D:CF:41:02:7D:FE:FF:A1:
+-                05:51:9D:89:ED:BF:08
+\ No newline at end of file
++                30:45:02:20:7C:33:E8:F1:10:2B:9B:FB:DC:48:46:7A:
++                D3:C4:35:BB:E5:D0:E7:94:01:BB:AE:D2:64:4B:99:C4:
++                BA:5B:50:CD:02:21:00:D1:B2:07:13:B9:DE:0F:0F:2F:
++                02:82:0F:A5:1D:E0:12:ED:4C:60:48:A0:5B:58:0C:E7:
++                60:EB:A8:AF:03:5E:C3
+\ No newline at end of file
+diff --git a/test/certs/embeddedSCTs1_issuer-key.pem b/test/certs/embeddedSCTs1_issuer-key.pem
+new file mode 100644
+index 000000000000..9326e38b1eb7
+--- /dev/null
++++ b/test/certs/embeddedSCTs1_issuer-key.pem
+@@ -0,0 +1,15 @@
++-----BEGIN RSA PRIVATE KEY-----
++MIICXAIBAAKBgQDVimhTYhCicRmTbneDIRgcKkATxtB7jHbrkVfT0PtLO1FuzsvR
++yY2RxS90P6tjXVUJnNE6uvMa5UFEJFGnTHgW8iQ8+EjPKDHM5nugSlojgZ88ujfm
++JNnDvbKZuDnd/iYx0ss6hPx7srXFL8/BT/9Ab1zURmnLsvfP34b7arnRsQIDAQAB
++AoGAJLR6xEJp+5IXRFlLn7WTkFvO0ddtxJ7bXhiIkTctyruyfqp7LF9Jv1G2m3PK
++QPUtBc73w/GYkfnwIwdfJbOmPHL7XyEGHZYmEXgIgEtw6LXvAv0G5JpUnNwsSBfL
++GfSQqI5Z5ytyzlJXkMcTGA2kTgNAYc73h4EnU+pwUnDPdAECQQD2aj+4LtYk1XPq
++r3gjgI6MoGvgYJfPmAtZhxxVbhXQKciFUCAcBiwlQdHIdLWE9j65ctmZRWidKifr
++4O4nz+TBAkEA3djNW/rTQq5fKZy+mCF1WYnIU/3yhJaptzRqLm7AHqe7+hdrGXJw
+++mCtU8T3L/Ms8bH1yFBZhmkp1PbR8gl48QJAQo70YyWThiN5yfxXcQ96cZWrTdIJ
++b3NcLXSHPLQdhDqlBQ1dfvRT3ERpC8IqfZ2d162kBPhwh3MpkVcSPQK0gQJAC/dY
++xGBYKt2a9nSk9zG+0bCT5Kvq++ngh6hFHfINXNnxUsEWns3EeEzkrIMQTj7QqszN
++lBt5aL2dawZRNrv6EQJBAOo4STF9KEwQG0HLC/ryh1FeB0OBA5yIepXze+eJVKei
++T0cCECOQJKfWHEzYJYDJhyEFF/sYp9TXwKSDjOifrsU=
++-----END RSA PRIVATE KEY-----
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
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
index c9cfc759c9..b306414776 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://afalg.patch \
            file://reproducible.patch \
            file://reproducibility.patch \
+           file://73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.25.1


