Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF7EC05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 16:33:40 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.46875.1674491617760787481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 08:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AIFw9Bmz;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id k13so11999779plg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 08:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ322m7RyjHcZosRBfb2/k1+hoDLSK20ayTZAV7Bb6U=;
        b=AIFw9Bmz8bOiRtm6nQ05SNeVNDBTjTjxUi6vZgGzdrt+UNVHCIi88RDEY4K+iov5+/
         8Jmhz/7gdhLmZjSBJB/rbdM8zW+j0AKvX2mh6yC5hJ4HiLJPYPX+01G3ThI8+tf8txBI
         o3VWM8BUDD1ZSVyRcOx0lmdPAt1UY+LXGysEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJ322m7RyjHcZosRBfb2/k1+hoDLSK20ayTZAV7Bb6U=;
        b=ruiLokXM72f0dAVTRZTGBAviv6AXQHBw+Qz/VRgF6eN+x4R18BOLV6i3VOJJIrJGMi
         l9fgJTtlpmNd73yDqOBEXE/CHy0M8byNPWskBdSsv7OAI9JAZBitI80iuCS4NtRTzBGY
         KsjYWm5JEkXrMYfB5bTHrvcoUXYlnQd1oP5Xn3N9KUSqq+TDTLvdLv8b5JAg/maMge1e
         SUtnTvNlMQc2eGEvJababBidRvstM6MKvSaIW8DX3ZY7FXxp49cBxFkIWxfiZdTlfnQi
         BflnSmjEXexXmausTeiBviFqovXuaEaNijnNtsAo5p9HQ+UZOqcOL5djhQ7hR5Z9CDR7
         LjHg==
X-Gm-Message-State: AFqh2koGJ30dZJmbYBGNslnoBc1msIvTbF5Lt/JqUkiZwWUokNYUwbpQ
	nr1YKAozIJOpBGa1IfnD9CtFX3RNUVOZ7lpf
X-Google-Smtp-Source: AMrXdXsGtoHfITSj5fy7duqcjeoGJPEQzUQtCs3f6lYaVZhEXeeSC3PPHMDQEK060Ma6qJJDHKSU2Q==
X-Received: by 2002:a05:6a20:9f90:b0:b6:597f:66a1 with SMTP id mm16-20020a056a209f9000b000b6597f66a1mr26763528pzb.60.1674491616744;
        Mon, 23 Jan 2023 08:33:36 -0800 (PST)
Received: from localhost.localdomain ([115.96.174.194])
        by smtp.gmail.com with ESMTPSA id d8-20020a170903230800b001948107490csm17527084plh.19.2023.01.23.08.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:33:36 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][langdale][PATCH] openssl: fix CVE-2022-3996 double locking leads to denial of service
Date: Mon, 23 Jan 2023 22:03:29 +0530
Message-Id: <20230123163329.2725075-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 16:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176310

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


