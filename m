Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E496EC61DA4
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 18:37:29 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.2795.1676831840419557371
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 10:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SoqSYBU4;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id et7so4199382edb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 10:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f3uPHtMpkSA4Hto1ChnM35Bp6d9XXfQMvd8bd9eE2ho=;
        b=SoqSYBU4Raq7FbZ+BoN4AdphX9B9OEmFUIMYIAUOzDJC8yaXYFQnq+LJtCHRjTc56o
         D/X88nUGoq6AOhjTJAQJWWHpTpvUNN49Ra2FYwTHRpzxdBsxeWhYX6JQOjoTgEd10c+X
         rvEKGWmH2glRK8E/JHqCTyz43mdtC1ZDToETDcUsvhfhPjFdh8smfdy48e32EWnHqeLw
         ZWBrgJLiapzTU7T9mMc0id5zN0WiLqUVNEjLGPvsVTgfulh28Zhe9fbmWI3MO9NlyCZ0
         4eRfEiRMRgdzAl/kMhgYXoQqrXHnOaYQt3Ssrvbc5dELaA4ltub1V4q6aMKGUguIJDj5
         oWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3uPHtMpkSA4Hto1ChnM35Bp6d9XXfQMvd8bd9eE2ho=;
        b=CBRWUDZNSWNU1BTIslv0a84dzZx3Txt9Bi/2j9sFzZJ+M1+fDqGtISHCw8Xmr8KyCk
         P90rTFEYvLaWQ/pCVqg6v2f4fZyG09jzlLfb88Rky6qOgNBecRDVYMhlrSE+Ys3EdlBT
         7mKqeG8jurvyuVvtrtNNHKOTquWvxkL8QVPPQirQMAK7NxX0qp5dGaxpNtrlTWwieXqa
         VthwK4d/FyBOSlMyW0ozHF1jKRj8ZhlKOIYQhxz3uQuYF4gEEz5NlRxhb2xsg3D65opG
         +Mhn37v8ucjkHjT7oyBXgS7K5TdbrJIIzkdoyq3mKcJ1dayNxCNrpSbzuLIRWfqOW8TW
         OagA==
X-Gm-Message-State: AO0yUKXathsMHT+5Fg15X7cAdmxwlkm8o5EDwud5PkuDwPhKfvBiVZ71
	Fy7F0ISJrmAVCmOzvs98Fm447+rqSMA=
X-Google-Smtp-Source: AK7set9TEZKzrgPdAxVG0akjxa0ktkVcEIFMJUU/MDn1yQKieQOLYr/cqUkve35KxnSXwxS54qbyPg==
X-Received: by 2002:aa7:c498:0:b0:4ac:c12b:8ef1 with SMTP id m24-20020aa7c498000000b004acc12b8ef1mr2549773edq.17.1676831838631;
        Sun, 19 Feb 2023 10:37:18 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t14-20020a50d70e000000b004acb890553fsm5013660edi.26.2023.02.19.10.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 10:37:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Siddharth Doshi <sdoshi@mvista.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv3][langdale] openssl: Upgrade 3.0.7 -> 3.0.8
Date: Sun, 19 Feb 2023 19:37:12 +0100
Message-Id: <20230219183712.2452-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 18:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177340

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


