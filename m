Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13614C47422
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 22:59:23 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.8110.1705618760936678578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 14:59:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RS06IYe2;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6d99980b2e0so193878b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 14:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705618760; x=1706223560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KkoTcWLYKqPJPIUHpS+Cgi8n6gPOjvdCPK+TQ/Wq6z4=;
        b=RS06IYe2QtPoT9Zcv/h7RIMZ0VeF8okJxOsedEMbRl/kPgq0IugQkUuBmQ66urihSz
         2B5//BnU65NNgvT3M3pJfa6kz9hBXlLUbRjkF50xKRoXwRRU355ys4FEtvBB7OhIRy6M
         A4Gqf7VYyaawMeIk1Q//YAJz/nw+haOG5cyJG/sZetnKDnmxZQLokyMa7bo9K5BLs/Zg
         i+hMDzb33m4zJgxpnqjnWjWI7SH0vC+WLOICdW2rI7ABhFUXfpm+bpl0FlSsYiDPKLPR
         1OOqbmHeXkWi73+UhHybbJ0gHJdKi8XTuWPgzgIQe1U4CGSjfyDIAgaoWuv/X548WA+z
         P5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705618760; x=1706223560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkoTcWLYKqPJPIUHpS+Cgi8n6gPOjvdCPK+TQ/Wq6z4=;
        b=ariBSYDi8fQ/IAOK5a7sRwArsfG2FgIzf0QMm/CMQN9HC/eHWNlu7BIgp6V3xC36wh
         U54WLJ4GuN9IywstB0hpiyslssUr+lrAWvUt7F+KmReSGs7ITUtOl6w0kZXFYU9VLF7n
         oco9JQjh5TohzwGFQpe0dAEzTsrFB7yMgEWhQKQt76fZu56OGneS0eU5RRrMF2KRXjdF
         KVTzc9JeSN/BeIBpw/gQ9wvyeTK99kM+QALnBsS9f3ybdONAQzpJmwxnrjodbol/KGK5
         vnUEncWsDTS3rEsH2b/BLd9mQGEtBT6X9gLCrEOGFeC7jiR0LCFQG8d2VcTVbnAlGmHQ
         hFtQ==
X-Gm-Message-State: AOJu0YyA3Kp/nWSxRQSJ3A5NymYJpHS+Epv6JNf4PL7+r+YfcsqP2YPt
	L/7CnbiSFwCXPUxW/3tsz5723gH+/l8wr4HEuxEXu6xCqKrILZwKnxqjbGNb8hs=
X-Google-Smtp-Source: AGHT+IF72O1TbX72I0SDHBYQJRzKAkyuh2hFIQWeb7wVzf27jex+ILe7Vwxke0T9itk9Vk3ODt/XgQ==
X-Received: by 2002:a62:d443:0:b0:6d9:dfec:1509 with SMTP id u3-20020a62d443000000b006d9dfec1509mr1335698pfl.31.1705618759868;
        Thu, 18 Jan 2024 14:59:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::b80b])
        by smtp.gmail.com with ESMTPSA id hy6-20020a056a006a0600b006dac8b80102sm3833561pfb.203.2024.01.18.14.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 14:59:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] openssl: Fix build on riscv
Date: Thu, 18 Jan 2024 14:59:17 -0800
Message-ID: <20240118225917.3975942-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 22:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194002

Backport a typo fix RISCV_HAS_ZKND_ZKNE -> RISCV_HAS_ZKND_AND_ZKNE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-mispelling-of-extension-test-macro.patch | 31 +++++++++++++++++++
 .../openssl/openssl_3.2.0.bb                  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-riscv-Fix-mispelling-of-extension-test-macro.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-riscv-Fix-mispelling-of-extension-test-macro.patch b/meta/recipes-connectivity/openssl/openssl/0001-riscv-Fix-mispelling-of-extension-test-macro.patch
new file mode 100644
index 00000000000..1d217bd8e31
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-riscv-Fix-mispelling-of-extension-test-macro.patch
@@ -0,0 +1,31 @@
+From b51031b05f72923ff1cf3b6a4767450dee89d7f4 Mon Sep 17 00:00:00 2001
+From: Grant Nichol <me@grantnichol.com>
+Date: Fri, 22 Dec 2023 23:46:39 -0600
+Subject: [PATCH] riscv: Fix mispelling of extension test macro
+
+When refactoring the riscv extension test macros,
+RISCV_HAS_ZKND_AND_ZKNE was mispelled.
+
+CLA: trivial
+Upstream-Status: Backport [https://github.com/openssl/openssl/pull/23139]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ providers/implementations/ciphers/cipher_aes_xts_hw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/providers/implementations/ciphers/cipher_aes_xts_hw.c b/providers/implementations/ciphers/cipher_aes_xts_hw.c
+index 564d6d6..4cf1361 100644
+--- a/providers/implementations/ciphers/cipher_aes_xts_hw.c
++++ b/providers/implementations/ciphers/cipher_aes_xts_hw.c
+@@ -225,7 +225,7 @@ static const PROV_CIPHER_HW aes_xts_rv32i_zbkb_zknd_zkne = {                   \
+ # define PROV_CIPHER_HW_select_xts()                                           \
+ if (RISCV_HAS_ZBKB_AND_ZKND_AND_ZKNE())                                        \
+     return &aes_xts_rv32i_zbkb_zknd_zkne;                                      \
+-if (RISCV_HAS_ZKND_ZKNE())                                                     \
++if (RISCV_HAS_ZKND_AND_ZKNE())                                                 \
+     return &aes_xts_rv32i_zknd_zkne;
+ # else
+ /* The generic case */
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
index 29680b84ee7..f3d0ac165a3 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            file://aarch64-bti.patch \
+           file://0001-riscv-Fix-mispelling-of-extension-test-macro.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.43.0


