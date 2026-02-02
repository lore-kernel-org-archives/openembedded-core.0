Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BBBE7315E
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 12:35:27 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51226.1770035726449033503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 04:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LSm7C6bD;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a09d981507so31019005ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 04:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1770035725; x=1770640525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zI0fWEe+nimHwlue31QSFklbCAr6FRFe4SnSdc42oPE=;
        b=LSm7C6bDjd9Z9qtBh/jsRQezJ8D0vGgkb0rAoQDxI6v0QX8FXmJ1TH8vZcezm0C7pQ
         3pSIMDtuZblQNjfy3o0qRq1fDLFB1YAoVD7xnWM921iEbAbKq/MJnJzPFb+yZxG0lcx1
         fYXz8jsNgCO5hUziMvXYw6bweLK3nS68jG2eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035725; x=1770640525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zI0fWEe+nimHwlue31QSFklbCAr6FRFe4SnSdc42oPE=;
        b=vWezHJJhxGqyX4OT0vo5stFQ/XWz5JdMzWkQoYCgnM+ktu5wWuDSr2Oowxryfpel0r
         T9nnSmHrJsWaUAMr7jFBh5E7g628H45UyhnVLIHIReP/bqAGRQ50zasY4ut6rpmxTNWv
         KBP+AozdJ68RwGWSPFFzxGXTM6/WpACm+YS0ldIeey8DE431xnGlZ1fGnhb7caNWovu8
         ohtbNYE1y39ROpK9Yv5GHRlb3+pPW96hctBGOF0QDDgmp3Ks2/JTbVCWNWyFL0RHiV2F
         7ckDxdCrWFSJCPuonW7o6Yv/FQ/+uNbeZpHW4X66WJ7Pw5tHHWBsHRWTbLNNLy8abthe
         5d/A==
X-Gm-Message-State: AOJu0Yzm4mNXJcURyZsPce9x4OD2zWW4DAFFKkxk1uBbAMZCKL12Fi9S
	YkZNMNrIbPiHrzSbqp4Vwdi8aBS+UJ8qN3YoaHjGhqpCAQWT0UggttQ6BY3OW5KcqQEBH1FzJoZ
	MQ9iR
X-Gm-Gg: AZuq6aIFrz9tAj52dhDQtTIqgxU5bJy9fh4GJYJved8oQAxHM/T6mFS3MW+6m+XJGg8
	UFFQzErYUg8RvMbDo6hlSPlHwv8MSkRTIy3/w98Sf+8Ed7RRiqXrP/AUGQreohGjNAb1Rq/G6aD
	RN+8TYDt0MFtQUgoGUeMumnUguYXTjT/QjSulZBPzaDxX+JktCcpEviUpun+XKRRsknilj3XOvl
	5IPqpEdm3xD7sEQhOIu3iQH1ajylny2d0PARew4ooCVrVQbgJenhi9KOMqHMDkkjBh068sGs2if
	l3HBmciR07067o9SJJNl9C129ZD7+xcr+msXld5vB2dUCrW2CXGGtLAx6sbCIYS4De6pdIBUKq3
	WGmqMOGhlCqoiagpIovha3uxQbQoFaGrUztEd9DuUdh9P8dvIxTcjJo68MtishAXMSUGpyACbIx
	lLYS7hDiyTpcUEkF+7e13nULO1
X-Received: by 2002:a17:902:ebd2:b0:2a7:5952:f53c with SMTP id d9443c01a7336-2a8bd50d06amr143585165ad.23.1770035725462;
        Mon, 02 Feb 2026 04:35:25 -0800 (PST)
Received: from MVIN00013.mvista.com ([103.250.136.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d57sm144386805ad.60.2026.02.02.04.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 04:35:25 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] openssl: fix CVE-2025-69419
Date: Mon,  2 Feb 2026 18:05:11 +0530
Message-ID: <20260202123511.540058-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 12:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230350

Upstream-Status: Backport from https://github.com/openssl/openssl/commit/41be0f216404f14457bbf3b9cc488dba60b49296

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openssl/openssl/CVE-2025-69419.patch      | 61 +++++++++++++++++++
 .../openssl/openssl_3.2.6.bb                  |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
new file mode 100644
index 0000000000..dcfdba82ac
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
@@ -0,0 +1,61 @@
+From 41be0f216404f14457bbf3b9cc488dba60b49296 Mon Sep 17 00:00:00 2001
+From: Norbert Pocs <norbertp@openssl.org>
+Date: Thu, 11 Dec 2025 12:49:00 +0100
+Subject: [PATCH] Check return code of UTF8_putc
+
+Signed-off-by: Norbert Pocs <norbertp@openssl.org>
+
+Reviewed-by: Nikola Pajkovsky <nikolap@openssl.org>
+Reviewed-by: Viktor Dukhovni <viktor@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/29376)
+
+CVE: CVE-2025-69419
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/41be0f216404f14457bbf3b9cc488dba60b49296]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ crypto/asn1/a_strex.c   |  6 ++++--
+ crypto/pkcs12/p12_utl.c | 11 +++++++++--
+ 2 files changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/crypto/asn1/a_strex.c b/crypto/asn1/a_strex.c
+index f64e352..7d76700 100644
+--- a/crypto/asn1/a_strex.c
++++ b/crypto/asn1/a_strex.c
+@@ -204,8 +204,10 @@ static int do_buf(unsigned char *buf, int buflen,
+             orflags = CHARTYPE_LAST_ESC_2253;
+         if (type & BUF_TYPE_CONVUTF8) {
+             unsigned char utfbuf[6];
+-            int utflen;
+-            utflen = UTF8_putc(utfbuf, sizeof(utfbuf), c);
++            int utflen = UTF8_putc(utfbuf, sizeof(utfbuf), c);
++
++            if (utflen < 0)
++                return -1; /* error happened with UTF8 */
+             for (i = 0; i < utflen; i++) {
+                 /*
+                  * We don't need to worry about setting orflags correctly
+diff --git a/crypto/pkcs12/p12_utl.c b/crypto/pkcs12/p12_utl.c
+index a96623f..b109dab 100644
+--- a/crypto/pkcs12/p12_utl.c
++++ b/crypto/pkcs12/p12_utl.c
+@@ -206,8 +206,15 @@ char *OPENSSL_uni2utf8(const unsigned char *uni, int unilen)
+     /* re-run the loop emitting UTF-8 string */
+     for (asclen = 0, i = 0; i < unilen; ) {
+         j = bmp_to_utf8(asctmp+asclen, uni+i, unilen-i);
+-        if (j == 4) i += 4;
+-        else        i += 2;
++	/* when UTF8_putc fails */
++        if (j < 0) {
++            OPENSSL_free(asctmp);
++            return NULL;
++        }
++        if (j == 4)
++	    i += 4;
++        else
++	    i += 2;
+         asclen += j;
+     }
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
index 4fd13d52fe..88fa0285cd 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://CVE-2025-15467-02.patch \
            file://CVE-2025-15467-03.patch \
            file://CVE-2025-15468.patch \
+           file://CVE-2025-69419.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.50.1


