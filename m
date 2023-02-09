Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1C0C05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 14:27:28 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.16424.1675952844575768466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 06:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TxgemlPC;
 spf=pass (domain: mvista.com, ip: 209.85.216.43, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f43.google.com with SMTP id mi9so2238830pjb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 06:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OwtGYb9YHCx4h4jXgYjhXbO6fFxaqPkkeiruetWCfJc=;
        b=TxgemlPCAF4QI4sMoL6rquY1EjW7UqaWyN3uZxTv/pyQwuMzkPUDvSAv8u47/r/Zp9
         tHNuzUbdMJpMSMFgfy2trum4BAARK6hcVOTUom091VCI+YHsYt9/if84HmHDt6Hvl1fI
         Y8exwMXAOnxWeM7MOr6CYpjJSynokPfXFk40w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwtGYb9YHCx4h4jXgYjhXbO6fFxaqPkkeiruetWCfJc=;
        b=wErExsEP7d27luav4s6y4ZS0WBse/A//RTakXOQpPgzHHZ7AR2GKVBa7UxhxqXDXUt
         8YEKJKo20iI5pp2Hy1Ss6Bk72gjVkGeCGAJ2zG6OduNROt4MdgriQd1B1i5hw1G9tnJi
         6WydJ2RAMLPQ7rJPlEWb45cYm4EWOqGtBPBrvW+q6KdkK8kPRjmtSmr6oPCtKiCahmGh
         hcEDRO1LgrznfzYCCsW8x8UU/HiYqKKh2IgdSobqYBFGZTiw5tD2NyBeU0xJl/sUsClS
         e9E+s6a+MIopwy0kNUpcFSyuK2unv/iTdIwzDYrBVuIkIrwVI2XtPDidI7Wy/TNyYZ2b
         AQxw==
X-Gm-Message-State: AO0yUKWZpKTrbcmAUaJgh/l48QbYFBGmJbYdEHuBwKegIVlKLPh3+y7y
	sbvt6AAsU+8Vk1CoklNJCMhJ58q5P19U81aj
X-Google-Smtp-Source: AK7set+QOaQW8QLkpUuMgtUyAvMt13dKg8vvqwx3T0tBv5YGMkpVCM59T2xEP5022B2fWDuNX04xFQ==
X-Received: by 2002:a17:902:ecd0:b0:199:11c3:cc4f with SMTP id a16-20020a170902ecd000b0019911c3cc4fmr12943471plh.44.1675952843574;
        Thu, 09 Feb 2023 06:27:23 -0800 (PST)
Received: from localhost.localdomain ([157.32.2.75])
        by smtp.gmail.com with ESMTPSA id d21-20020a170902729500b001993909eae4sm1522338pll.253.2023.02.09.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 06:27:23 -0800 (PST)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [master][PATCH-v2] Upgrade OpenSSL 3.0.7 -> 3.0.8
Date: Thu,  9 Feb 2023 19:57:17 +0530
Message-Id: <20230209142717.13053-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 14:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176954

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


