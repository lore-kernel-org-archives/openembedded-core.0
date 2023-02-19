Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7041C61DA4
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 18:36:39 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.2779.1676831799269931588
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 10:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fMq+UAoc;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id c65so3856138edf.11
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 10:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f3uPHtMpkSA4Hto1ChnM35Bp6d9XXfQMvd8bd9eE2ho=;
        b=fMq+UAociXQplDoSDstobQi3WNzVv04F1RmS/miq00c1mZjlqTWjdUfHWQzbIlmLvf
         SuA0NoTsgxktpCAPJJOavlxvzCHN9alXbO83buw0toDB2z7Y8Ss8jCvKpushUC1eSCAV
         iIFp8aqCzfrLQkKWvfqUEeKHq9WN0c5ULTRetdYDKPAnyEQdujhDLQTCriPDvFnQruC/
         hO42/j3UsxJaA6GdDIxBkL7mYVxO/lGXicd4Mp5I8kJvztFSuXRirXbCRoNkMMS92+1u
         G7mocGfWV8ADQ+pkkS+xV5uDBqNpnSgM6LKYb0WHA8n3MATAlOSlH5i9lL0S5KpVs04o
         arRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3uPHtMpkSA4Hto1ChnM35Bp6d9XXfQMvd8bd9eE2ho=;
        b=VjPz8OOB/4PHDfd4vktEoB+Hqp1AkAQHhZTEW8uM8cxE6VWEjsLZcfgM9DN2utPe7O
         j2gZtRGL4TiRzB4qHoHECt422M4z3xFxJogecWia++ch4g/XkwUIcqLqJRwP57LtVsWa
         QWBjVytkNlKSUycARSPeYmi5YR/VMExfO3ycKjHVp5AXKru/weU5cLLKGvDK4P08uJXo
         +FeNZdq/5HUths3vUbAVQBm2+Csjz84W+2Tn2O/v8a+xkB0QF9vuui0h54LCX7i4wLFn
         897vbXrVwUCzZdCmRI+/gpS0Hzzx0T1KemVIcv2bNetwO296FLc9mg1u0ReU4iOsuQ45
         NkCw==
X-Gm-Message-State: AO0yUKVMo06Qpf9L09jabDnZRmV+nCwVJt4juWrxAA5SfRgvJmfAVzZD
	5mboXnvL7JrJTG3RTRjPG/ei3uqwcgQ=
X-Google-Smtp-Source: AK7set8/sxGxZ8yj6U0tln5xakc3a0OfJKEnV2U9N1mOtDVPKBuiO4SulTsmDsUoTLMb/lOa0S5TNg==
X-Received: by 2002:a17:907:98bc:b0:8b1:7b10:61d5 with SMTP id ju28-20020a17090798bc00b008b17b1061d5mr9863686ejc.33.1676831797488;
        Sun, 19 Feb 2023 10:36:37 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y23-20020a17090614d700b008b155de0984sm4757631ejc.170.2023.02.19.10.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 10:36:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv3] openssl: Upgrade 3.0.7 -> 3.0.8
Date: Sun, 19 Feb 2023 19:36:30 +0100
Message-Id: <20230219183630.2394-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 18:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177339

From: Siddharth Doshi <sdoshi@mvista.com>

OpenSSL 3.0.8 fixes 1 HIGH level security vulnerability and 7 MODERATE level security vulnerability [1].

Upgrade the recipe to point to 3.0.8.

CVE-2022-3996 is reported fixed in 3.0.8, so drop the patch for that as
well.

[1] https://www.openssl.org/news/vulnerabilities.html

CVEs Fixed:
https://www.openssl.org/news/secadv/20230207.txt

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
2.39.2


