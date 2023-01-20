Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBEDC004D4
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 02:57:05 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.65922.1674183417979554518
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 18:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BHzJgUfG;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id i1so3016486pfk.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 18:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AjmrsCGlOnV8c0F53tZOB8hbVux0L6rtgnBtY0af5Do=;
        b=BHzJgUfG0uvZ7LwCspUxFf8nWdCls6hvOAKavyOmdBw1nEd1T4NGBYGd54HJD1DSlg
         oEZjFSXclIH/zykBzmNK/vTn2zFM3lvR6wso8FFRF/RcZrYc3R93imrZU5bqJTMmRx8r
         6XcISRwS6RtroyhCl4bJN7k8SqHs9RXECbVEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjmrsCGlOnV8c0F53tZOB8hbVux0L6rtgnBtY0af5Do=;
        b=Ri9FQ0/c5G7sIABy/6JFPVKYVvW8YJexh5AGWr8uaOIJvvRoU35CJn56V/zkuk8ugu
         CvslyPSC/7XywgbvTRoP6bnTIGJa+RYqIoXB/xTd9kw4UVI3Ti4pS2tr0+eY93WE/BMf
         ZO175o0Bv/138nI3PAHYl6BbuSGL4Sea+sqfPBqYTKgaMrg1QDIy5BK+UlA5ydRjj810
         UAR67JoHrXZo8T2Bm+TNzzPPtFZkrDkEV9k/OiFkDXKgpkxF6RBmd0eESnz0HvlyQ8BI
         mQ1+MmU8A89PhiRNNVIF5k5dU32KdNLRfuA1aewaWK2PtVX1gCWbF1HlloM0RUOEkoTO
         yucA==
X-Gm-Message-State: AFqh2kqwbQ43dH+iIwDa4rbFgc2sxH7CoOJuFyh0Eulx8iah3PLIQ+sd
	x4U1pFctm2VsURvz60yKZPr9C5v6/qaXqQIQ
X-Google-Smtp-Source: AMrXdXv+GHq7GXpqNVMXVBBIp8g2snD0MPIVbgY6Ii4ZjEQI2IZwBK3wB3eLjlC+eMz9Xv35co26YQ==
X-Received: by 2002:a62:f210:0:b0:58d:bbf:8bb1 with SMTP id m16-20020a62f210000000b0058d0bbf8bb1mr12643572pfh.14.1674183416983;
        Thu, 19 Jan 2023 18:56:56 -0800 (PST)
Received: from localhost.localdomain ([115.96.167.27])
        by smtp.gmail.com with ESMTPSA id e30-20020a056a0000de00b0058d54960eccsm10013874pfj.151.2023.01.19.18.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 18:56:56 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] openssl: fix CVE-2022-3996 double locking leads to denial of service
Date: Fri, 20 Jan 2023 08:26:49 +0530
Message-Id: <20230120025649.105430-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 02:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176179

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
index 9ed5f11df0..5156586661 100644
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


