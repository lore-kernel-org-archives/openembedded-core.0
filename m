Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98FBC05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 08:26:40 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.9522.1675931192098619640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 00:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IeuF+98q;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so1606097pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 00:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4mLpj/GmLOEAL9vX/pM84YEbZ3bjrv73sjecuF4ufk=;
        b=IeuF+98qRlIQ6okdyF0QknxIpRy92iibdTuXBUamO885B+WRPTE3YlGW//7O0c/Eod
         JH1hosHPfwsSQgdZ0LxKTUmS5NbD6R9QmiFBuwAO690n2OF5RZYMOfKYo9JxffqH3VLC
         pahlQ+Ai4a1eOLIYfScXb2rysDgFFHRcn0J3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4mLpj/GmLOEAL9vX/pM84YEbZ3bjrv73sjecuF4ufk=;
        b=E4J0Eq7zNyL8NRWlX2H8u9VCUWGHExmrZHED7h3LoszL9QY/DZfoe+8MYdH+RB+ZUr
         DldSaaomATexii02SiYmzUmzglLAvotJs0ebQSQpY48fRlnnZf6oOlmcwRzNwrR6cK9w
         fWjHafBYUdSHTc5gl8CsG2PzqAL/qbyQG2SvjMLXUcCyIEUSAue/wqkdwN2MD/XqEieo
         Bj4FslQm+H0nP70Vq3vXJwHFacHnapHNfTEfN3BBHauxk2wZjGu+TYOF1EchV8HQJRaO
         Y8YYJZNWzCFhrOlVpNmh3+hHe92PNooEm+9c48pDDTTO4iCqt9Mt13GSNvMCRlEd70xx
         0QJw==
X-Gm-Message-State: AO0yUKUNYaQrKPcIKdjaJCvg0OX3aXp+XOZqK/zxQw1WfK28q9nZfIZY
	v3WwHDgw6ntWfGolABA1MZ/uyAl+WHtLJYgG
X-Google-Smtp-Source: AK7set9H9ooKBsbSZvIu4nglv9on9XA185t9gHqCj1SkrztjtlDwrsNZM1AgZrQzV5wXHSN6eR2u7Q==
X-Received: by 2002:a17:902:e5cb:b0:199:2353:1ef6 with SMTP id u11-20020a170902e5cb00b0019923531ef6mr12431740plf.28.1675931190999;
        Thu, 09 Feb 2023 00:26:30 -0800 (PST)
Received: from localhost.localdomain ([157.32.237.118])
        by smtp.gmail.com with ESMTPSA id k18-20020a170902761200b001932a9e4f2csm817071pll.255.2023.02.09.00.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 00:26:30 -0800 (PST)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [[langdale][PATCH]] Upgrade OpenSSL 3.0.7 -> 3.0.8
Date: Thu,  9 Feb 2023 13:56:15 +0530
Message-Id: <20230209082615.148916-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 08:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176928

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


