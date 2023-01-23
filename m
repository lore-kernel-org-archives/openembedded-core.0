Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE009C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 16:34:20 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.46894.1674491652907852643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 08:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=g10rYvDu;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: vkumbhar@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id lp10so8742123pjb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 08:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ322m7RyjHcZosRBfb2/k1+hoDLSK20ayTZAV7Bb6U=;
        b=g10rYvDuMZgJGzE+aZQUNeycqcfxgTkY4QpcQjqqAPv6NwFx62K//ASNTn8FN2nzOH
         xfDE0uqAvAhYGFzPwiQ4CnBlcEd3v+rB9EKdhJnorFypQ1FOPLc7lxi+slOp3b3vIbrM
         m5vbvMLWR8GD+GZM3meeVl8OkhShaY6KTAmFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJ322m7RyjHcZosRBfb2/k1+hoDLSK20ayTZAV7Bb6U=;
        b=1Cr9cXUa4MB3gcRdMM/+8rC10cyKem+646zTSMRWKSfVawI0WNfQ5W6HrSp6BsYNUg
         PEQzptnVsbJVuWNJeVspKlXPgFEyaNUecgvIM3at+Wc6iyaGBz3JV0PF1XjBPlLpuUll
         DjFhEGfDNIWyeFy+UE/jzNXWbd7R9PROr4AIwq0cL2j50z9oMqshO9BA8oM+D36SaraI
         Pr/U0EAAS5CgqJTt2xfNOndu+cQp8lKP6n3ZKBTlurFHBIYtXz3EbNX/BmfE5EUEPH3G
         Es3zKMJB+SUtXh9UYkfKN+rpzFSsZIjk31Z/amFVvlth+2BTkYYtNc5KNhNT6jao7dm4
         bzPw==
X-Gm-Message-State: AFqh2kr0rwBlkPzAoz4kaJMjp9DdNZjHmWUQZULZ8s7T/R86ccjAeEOw
	bOxfKI9NAisiWlV3LD3cxHQDfRWS66fHIKxl
X-Google-Smtp-Source: AMrXdXv7VY8XXn94ShejqTWH3QxlRjBnnWgAulBYa4W/MnE5ei3bX7dCEzQTEOvyd9FA/y+s++MHIw==
X-Received: by 2002:a17:902:e811:b0:194:98ef:a40e with SMTP id u17-20020a170902e81100b0019498efa40emr28671831plg.31.1674491651947;
        Mon, 23 Jan 2023 08:34:11 -0800 (PST)
Received: from localhost.localdomain ([115.96.174.194])
        by smtp.gmail.com with ESMTPSA id a4-20020a170902710400b0018bc4493005sm17969710pll.269.2023.01.23.08.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:34:11 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][langdale][PATCH] openssl: fix CVE-2022-3996 double locking leads to denial of service
Date: Mon, 23 Jan 2023 22:04:04 +0530
Message-Id: <20230123163404.2725145-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 16:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176311

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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
2.30.2


