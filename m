Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A83DC6379F
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 14:38:18 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.16730.1675953488786387690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 06:38:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=M9FRGsB9;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id x31so1689674pgl.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 06:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6/DbOzTye7YGuQNDgCVVhT85JnR0ovROmP26RV9GHjc=;
        b=M9FRGsB9wldP1utMURHIKsgHMKvh1CyXrOUx8cqkzBPxR5NF04yfmROGIKpXqT16HA
         gFV7SavhfB+dSoC7o98u4ad/Xbe6IZ+oYvV3QcgE6PV2+ps6qz3fYtz5HNF0npUBaE21
         GjIbfVHnUgxOUOLonfhCiChY0mF1oGlZoi/u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/DbOzTye7YGuQNDgCVVhT85JnR0ovROmP26RV9GHjc=;
        b=lJFQcLrzEAnahm7nME3XuvHsTGMSfPJ1IREkLyaz3V7akZThb9dc21PqjE2XzbBwhs
         8hVDWsyQeNw/yooY0PfzjFxcuHBBaDFHShkGkFUJqL/7NJq2zlm6S7dFZbXH2KUMSjhx
         3JY+xnj5w+ykoIEF631AgV+enSZ2f42tPhO9DMrgvJhpQ754xWfdrXpwMtKL+sr8DUw1
         aP/Tb3ZHFJ8CEj13uKbHJFI5OI6jnviPqiORZbqqJ5tq8rHHCqnJzSqWZ+H/OafTIOzQ
         ivQi6o24dMuMRhMmQpcaugfqWEajVNArc3rtpKv/DsAmhEyqmXp6bR/A4GO1rMZQG3sY
         nELA==
X-Gm-Message-State: AO0yUKVoAOAbIuW0wMgDm1JpgiKTU5Pp21txgJQQf61AZS9mPgn9hxzT
	MyaCqycADB40rQvhrAaY8eIRXDrJNxHxt2k/
X-Google-Smtp-Source: AK7set+pxepMA1/lnHP7Y6LTlwN8XCZwmS3kVW2LqT+zmxARRo9+BVi16eyYYBWaXUGaT9ne6Xa0ew==
X-Received: by 2002:a62:502:0:b0:5a8:499f:8689 with SMTP id 2-20020a620502000000b005a8499f8689mr4184935pff.23.1675953487781;
        Thu, 09 Feb 2023 06:38:07 -0800 (PST)
Received: from localhost.localdomain ([157.32.2.75])
        by smtp.gmail.com with ESMTPSA id j10-20020aa7800a000000b005893f281d43sm1512769pfi.27.2023.02.09.06.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 06:38:07 -0800 (PST)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [kirkstone][PATCH-v2] Upgrade OpenSSL 3.0.7 -> 3.0.8
Date: Thu,  9 Feb 2023 20:08:00 +0530
Message-Id: <20230209143800.21458-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 14:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176956

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
index 5156586661..75f9e44748 100644
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


