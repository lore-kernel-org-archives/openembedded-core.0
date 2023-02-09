Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53474C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 14:37:18 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.16700.1675953436277998218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 06:37:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NVDe+AKO;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id u9so3015960plf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 06:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OwtGYb9YHCx4h4jXgYjhXbO6fFxaqPkkeiruetWCfJc=;
        b=NVDe+AKOjdGfbD5KYlnBpXqRcLK7d2w9yYlbafFh0Qfd/ETLclwWgr22N1eP6PhkYR
         SSxh8o1AY6tJvHsrSQWMpwTzf4AS4Jog9LblVD5mR1l+G1S+z+tpV1qiH7KSLzYJ2U8l
         AzvuYL1Q7vC5aUnZbQGEJxZrBn+iwUA6eLrO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwtGYb9YHCx4h4jXgYjhXbO6fFxaqPkkeiruetWCfJc=;
        b=2g5N9PBX5nDeWyxxK/fvEnWn/orxYyEjc42A1S9u0dDUu541iE7uCUmzLKynxuh6XL
         fqRwgYHG7mvFar8A41e4DYQ1kVg0UuDlEHrzpVkPcuHQyLWgo/ObAsxLbskRm7BEdiVN
         fHx/Su8AxbofvmxJSm8GUcuDsrncCRKTumqZl8tBkGYf7FgoK+XGI7za+wgZvrypTlcC
         6gZF1e7DvtbnC9sJ6QPNpHsSq79CsgReULZ9I8n2o+60l7/+ulN7RCwiX+OVKbYGCNs+
         HnYlTRxiWonUKu1QhM8GsLcE4GgIgwjJjLzZWWveAoE/y3cY0lRSNCaGPynhr56yuZX+
         detg==
X-Gm-Message-State: AO0yUKVXvi2NheqmchBr8xGcGxXErlRM/XhQ2FTJkmaFIrKsZIP4vJkj
	2vzuBx1jqciGWrO4vLvLG/a9W1koEfl967bg
X-Google-Smtp-Source: AK7set8FSF4Nm2/nfShzDE6iI+0Gio6uLRcGjrR4WDQEbmTpAdnJCHgUAw0Tn700nolKhtUuTJqGMA==
X-Received: by 2002:a17:902:e807:b0:199:642:1c27 with SMTP id u7-20020a170902e80700b0019906421c27mr12950837plg.12.1675953435188;
        Thu, 09 Feb 2023 06:37:15 -0800 (PST)
Received: from localhost.localdomain ([157.32.2.75])
        by smtp.gmail.com with ESMTPSA id p3-20020a170902780300b001888cadf8f6sm1555698pll.49.2023.02.09.06.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 06:37:14 -0800 (PST)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [langdale][PATCH-v2] Upgrade OpenSSL 3.0.7 -> 3.0.8
Date: Thu,  9 Feb 2023 20:07:08 +0530
Message-Id: <20230209143708.20705-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 14:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176955

From: Siddharth Doshi <sdoshi@mvista.com>

OpenSSL 3.0.8 fixes 1 HIGH level security vulnerability and 7 MODERATE level security vulnerability [1].

Upgrade the recipe to point to 3.0.8.

CVE-2022-3996 is reported fixed in 3.0.8, so drop the patch for that as
well.

[1] https://www.openssl.org/news/vulnerabilities.html

CVEs Fixed:
https://www.openssl.org/news/secadv/20230207.txt

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../openssl/openssl/CVE-2022-3996.patch       | 43 -------------------
 .../{openssl_3.0.7.bb => openssl_3.0.8.bb}    |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.7.bb => openssl_3.0.8.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
deleted file mode 100644
index 6d70b323d1..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 7725e7bfe6f2ce8146b6552b44e0d226be7638e7 Mon Sep 17 00:00:00 2001
-From: Pauli <pauli@openssl.org>
-Date: Fri, 11 Nov 2022 09:40:19 +1100
-Subject: [PATCH] x509: fix double locking problem
-
-This reverts commit 9aa4be691f5c73eb3c68606d824c104550c053f7 and removed the
-redundant flag setting.
-
-Fixes #19643
-
-Fixes LOW CVE-2022-3996
-
-Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/19652)
-
-(cherry picked from commit 4d0340a6d2f327700a059f0b8f954d6160f8eef5)
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/7725e7bfe6f2ce8146b6552b44e0d226be7638e7]
-CVE: CVE-2022-3996
-Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
----
- crypto/x509/pcy_map.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/crypto/x509/pcy_map.c b/crypto/x509/pcy_map.c
-index 05406c6493..60dfd1e320 100644
---- a/crypto/x509/pcy_map.c
-+++ b/crypto/x509/pcy_map.c
-@@ -73,10 +73,6 @@ int ossl_policy_cache_set_mapping(X509 *x, POLICY_MAPPINGS *maps)
- 
-     ret = 1;
-  bad_mapping:
--    if (ret == -1 && CRYPTO_THREAD_write_lock(x->lock)) {
--        x->ex_flags |= EXFLAG_INVALID_POLICY;
--        CRYPTO_THREAD_unlock(x->lock);
--    }
-     sk_POLICY_MAPPING_pop_free(maps, POLICY_MAPPING_free);
-     return ret;
- 
--- 
-2.30.2
-
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.0.7.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.8.bb
index 1842148592..8771884dda 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
@@ -12,14 +12,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://CVE-2022-3996.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "83049d042a260e696f62406ac5c08bf706fd84383f945cf21bd61e9ed95c396e"
+SRC_URI[sha256sum] = "6c13d2bf38fdf31eac3ce2a347073673f5d63263398f1f69d0df4a41253e4b3e"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


