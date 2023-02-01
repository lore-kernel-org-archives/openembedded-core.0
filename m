Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B035C636D7
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:12 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.24055.1675260845647078349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KNB0jp86;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id r8so11709185pls.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtvQqXBHKUyFHuQNUMeNHp918fjCe3pi1RmL328klXQ=;
        b=KNB0jp86WEaSSaekZcoj6+tYt1TT07QRqg7Nko9LHy5iVq4zYMrIbPOWkq7xfUWjpP
         gJ96N1wAxg0ZAEqli9Bvr8LmP1mVK9Jm3yO1olVCwswmwmJecvzopqBuT/ukzSKixsCR
         GCsvJNpUc/TEhtQ7dOCWdVHpnxrI3zjGNLWHs0L758GAaccRWMZWTfEOnn4TWGEmdTRx
         nhzvx2FLmXEvZynbUQ4cwEJRVvNenbHp/ePlIDFDFyeQ2WVsmdlN+nJIQ0XzJFg5kiJV
         aeuG6flMb+3o7tWVdqoZylAg6Cz26gyEchdk9BReq3CStamY6BVCiJ+GQ/rwkhNYm43H
         qMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtvQqXBHKUyFHuQNUMeNHp918fjCe3pi1RmL328klXQ=;
        b=XLXkpwSltbcurApKbx+nISplPm/JyQpYxYfaHOXrvFy7nfbSc0nICpfvZuFylr2QTy
         zDI2bYeUr2KBqRqu5jLrBoNXJVxvCZobGAYJsUSGokgBYahWTberfz0L2snQCyxfNgbF
         99H+C3dXzq6KAesD5n+zQqUX59c9pVuavS2jYXpoeYJvlyEfEHBzS0sDIVnhQI8RJ8us
         0ZEQemgcU2PBzswmwddNXOcmccYeKLTRrbTghRf/dBMfm+Rpy//jhNqwgpCEEdPN2PZq
         R2ePyoUWpgELkEV5ahwXEJTVZ2BDH9qCRqBHVeU+yuFmFiGWOnIkkge6tTpaGCbA/pCF
         SgVg==
X-Gm-Message-State: AO0yUKWRAsqr6+M3AA5ib79Wubj//oWKh+ZhWmJpcq8yeldqUntqTHnO
	sTRm2Pg62sEb/tbjEe1PascMCDvxG0jDandW2uE=
X-Google-Smtp-Source: AK7set+h4JfrBhb3FtM8K3YFiRzrcEjOtjhobBbjym2aHgE5W7SrBvFMMdF/cV1xZzgGoBDMVf14gA==
X-Received: by 2002:a17:902:e2cb:b0:198:68b1:6255 with SMTP id l11-20020a170902e2cb00b0019868b16255mr2502236plc.56.1675260844611;
        Wed, 01 Feb 2023 06:14:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/17] openssl: fix CVE-2022-3996 double locking leads to denial of service
Date: Wed,  1 Feb 2023 04:13:39 -1000
Message-Id: <7007673bcdb606dbe78c71f72aceda6483485fb6.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176536

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2022-3996.patch       | 43 +++++++++++++++++++
 .../openssl/openssl_3.0.7.bb                  |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
new file mode 100644
index 0000000000..6d70b323d1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
@@ -0,0 +1,43 @@
+From 7725e7bfe6f2ce8146b6552b44e0d226be7638e7 Mon Sep 17 00:00:00 2001
+From: Pauli <pauli@openssl.org>
+Date: Fri, 11 Nov 2022 09:40:19 +1100
+Subject: [PATCH] x509: fix double locking problem
+
+This reverts commit 9aa4be691f5c73eb3c68606d824c104550c053f7 and removed the
+redundant flag setting.
+
+Fixes #19643
+
+Fixes LOW CVE-2022-3996
+
+Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/19652)
+
+(cherry picked from commit 4d0340a6d2f327700a059f0b8f954d6160f8eef5)
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/7725e7bfe6f2ce8146b6552b44e0d226be7638e7]
+CVE: CVE-2022-3996
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ crypto/x509/pcy_map.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/crypto/x509/pcy_map.c b/crypto/x509/pcy_map.c
+index 05406c6493..60dfd1e320 100644
+--- a/crypto/x509/pcy_map.c
++++ b/crypto/x509/pcy_map.c
+@@ -73,10 +73,6 @@ int ossl_policy_cache_set_mapping(X509 *x, POLICY_MAPPINGS *maps)
+ 
+     ret = 1;
+  bad_mapping:
+-    if (ret == -1 && CRYPTO_THREAD_write_lock(x->lock)) {
+-        x->ex_flags |= EXFLAG_INVALID_POLICY;
+-        CRYPTO_THREAD_unlock(x->lock);
+-    }
+     sk_POLICY_MAPPING_pop_free(maps, POLICY_MAPPING_free);
+     return ret;
+ 
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
index 45fd1de2fd..1842148592 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2022-3996.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.25.1


