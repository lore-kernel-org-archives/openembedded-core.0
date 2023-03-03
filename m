Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC37C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:57 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.27599.1677860257650685133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Da39JkV8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id y11so3215747plg.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tdPuxLZwPepHbPeprYAtw+LM9IspLqWHc1kQv1HuWA=;
        b=Da39JkV8UuV1Ihu6QjG0WvGdiyG0pR+gvsLdrm0aDnJeJXQhdoYQCb8pD3WMkGG/cV
         L+a5Tg1NnbghOo27c6GDm+gA/Dnui6CxgbrCXjL95e7eVK81iKZ0IkC30h4Y4EOJ6yOd
         AvR7D3zRzMWvyFeQ7oUViDnNvnGesFvCFmM1OCdZiIxO7bFGWMsuuLjRLDppDYbvC4X4
         swLjLPKY41I4wvxjM9B2q9mae/slkYldbr5pnwLXNFZ/40i532rF2vHeA96YhZODrP59
         4TARb6LjR6sauSfGthUbb+cc0oVNW8tYxXyIcWR97NY3uDRR697an61o2Dd3eI3wxrvI
         oWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tdPuxLZwPepHbPeprYAtw+LM9IspLqWHc1kQv1HuWA=;
        b=e2BH7aKDlwXmzy7CRk3si+p7DmtchRx0e3CkjkhhHvoxnNOaVsGoFDlBJ0dOEflg7E
         /BUSkP1W1udx3t1haqehxD3p9i8gXoko6PE3d5D5G8czLNC0FVyzgETpjpeBzRgXo5Kp
         0yLdYVQ933/lADcnxmT2QFkVrHgny0n7O4+q2FJx35l1K7JJvmlku7IlF5XfXzjoNcTp
         aYfEXncMO40R/Yf3BcM0Bl1rH0iJ2jmsT3GbxwxaRIxaBinh0oiabJqOnkEckYivAMQl
         O4ymwoZlo3wfZpujhhvGLp009ljKbdEpayvhidW4qU0i+C3LZQfun0wkX4WGOIz1rJQ1
         vN6w==
X-Gm-Message-State: AO0yUKX5gIA+44hKkuG/qQ3XLYmwM533ljaXGHNaBXKWiuPhlOBCyaO4
	H2cMJX+FFKuv27vE5zlo48OC4QzG6OoJSU+nuaw=
X-Google-Smtp-Source: AK7set+e4C0gnlJaSUv9PBhrpupU4mXiZm8HM3ghmi19RU6VpRdGcPb9CdrcI9l6G+qouI14NcYB+A==
X-Received: by 2002:a17:902:f548:b0:19c:947c:8819 with SMTP id h8-20020a170902f54800b0019c947c8819mr3018556plf.59.1677860270854;
        Fri, 03 Mar 2023 08:17:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/29] openssl: Upgrade 3.0.7 -> 3.0.8
Date: Fri,  3 Mar 2023 06:17:09 -1000
Message-Id: <006cdd236505803a72719fa2856432c7feb59082.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178000

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8461466f63200a0b1c9c247b70fdf5819651544c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit f5dce7274bfd65c05df932f36a5e43cfc884fd41)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


