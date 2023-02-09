Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5B0C05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 11:16:21 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.11924.1675941373131469047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 03:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Os4aD7Cm;
 spf=pass (domain: mvista.com, ip: 209.85.216.46, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id d13-20020a17090ad3cd00b0023127b2d602so2009358pjw.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 03:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4mLpj/GmLOEAL9vX/pM84YEbZ3bjrv73sjecuF4ufk=;
        b=Os4aD7CmowYj/OIxiHrVs/JBoIM1u8bO/dcYTLEzl7hc73mjia3Vqk0boKTx23WcaX
         IsUeaLA0u9EsVuf36QJ2wXwZqImxlJakQgWqyT79kSKSJe3b4ZBnrBAVOCQi0tjQwgvB
         YnpC9Y5J7zaqB4FYYhYKIgdkeTnI6lLVdUjds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4mLpj/GmLOEAL9vX/pM84YEbZ3bjrv73sjecuF4ufk=;
        b=TZWYtNsK5swD50AgprqGm7UX5GGpCAD/80f+4voo+dlm74J3zu4TgYBa4G2sJ3d4Xk
         Gvtgx4jB+MxF88oZFnJBB5V88INLkvXbvFu8r70UW4bLDxzAE8ao8+4jx7ix7KCbCy9a
         HKgr+qGFH/p4FiMuZUdCsElxa5M4PdbTLHg2VQ+MZUBH8PsP6Pgo58rw5SI84CeiQDza
         C+5zt8gvItei+fh4RBKz56Ie17GP3yBdNVYyunSpsDc54q9O9F3EuBaOYNkxm31cm8VM
         Fn9dnpmw78n/bdxSsr8g0SLYA5giA34d0HwuowDshfsuv36C/SVQRswW7UH95ZlJ6Sj4
         I9vQ==
X-Gm-Message-State: AO0yUKVn9GYbNgAoJiAcc1TGlrOdub82jSPLPAco43c/6iGDai4DI+1u
	wX/Ld2HqKe4Z3dd7aEB3FBh/+xPx0ry/daTV
X-Google-Smtp-Source: AK7set9De2grZyv1iM3rL+XoU6ZL/kKKrcN3mFh9XV3CAAvLyXarWz66QyzAaeHGnZx6l4xJSMTiRA==
X-Received: by 2002:a17:902:e311:b0:198:f6fe:f1ed with SMTP id q17-20020a170902e31100b00198f6fef1edmr9355907plc.42.1675941371906;
        Thu, 09 Feb 2023 03:16:11 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:e01:2267:bcf1:b3aa:a58f:1e0])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c10600b0019945535973sm1233440pli.63.2023.02.09.03.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 03:16:11 -0800 (PST)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [[master][PATCH]] Upgrade OpenSSL 3.0.7 -> 3.0.8
Date: Thu,  9 Feb 2023 16:46:05 +0530
Message-Id: <20230209111605.153112-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 11:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176945

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
 .../{openssl_3.0.7.bb => openssl_3.0.8.bb}    |  2 +-
 2 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.7.bb => openssl_3.0.8.bb} (99%)

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
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.7.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.8.bb
index 1842148592..c80df7b2ae 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "83049d042a260e696f62406ac5c08bf706fd84383f945cf21bd61e9ed95c396e"
+SRC_URI[sha256sum] = "6c13d2bf38fdf31eac3ce2a347073673f5d63263398f1f69d0df4a41253e4b3e"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


