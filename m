Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABF4D172CC
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 04:36:35 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46122.1770006989030724258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 20:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=L0niA9z/;
 spf=pass (domain: mvista.com, ip: 209.85.214.194, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a7786d7895so29097105ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 20:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1770006988; x=1770611788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NOErQzZEc+6eYwzF84IGnYImbeSvM+KD1p7TmBJrDv4=;
        b=L0niA9z/Kj+10kwGj+PmLzi3C3qx5hW1Rc1Jl03/CTkIa1b2QTJeTWXX7niy8uyPiX
         z/arg9/FSA42yZDYUv4gt164REwwaoFEA52UD9MtuonnJRO8tc8Dr+xTlN+UPkTeEmsT
         B/ydM4iSHtsnazou+I+4gNmPQRGEKsqwbTWJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770006988; x=1770611788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOErQzZEc+6eYwzF84IGnYImbeSvM+KD1p7TmBJrDv4=;
        b=In4UoIKMiD7Be0svwn5QA3yB/v8/D6YkEEd92dEc8+XtyoiI/EcV5ebaej1u0kQ8al
         eDTYEvB3xFjCPwdVYRHp+YgLhcn5wZO4zhbJqMZbCZKSWsMfE6ZRf5RBUl6avaFkg16R
         T7RbMdmNdvgaISUW6aXJ17N6F7Anb5ouBSgeddoi2uNTFDmbgc+3/Z8unBz/vP9hDZMC
         xwV4kr9UUyco1XEHaWaaNkGfN0t8Jynz/Z1zDGqX0c5/Rc14lznW2yWkalYjGUNjTuTW
         nISZFpJgdnz0sJju9hxkvRIzUKHo1s5o3Yii/WPPBS+k5wUFJa46tkJe4yBIPu7XG5R0
         c9Mw==
X-Gm-Message-State: AOJu0YxVMF0eIuUoGDWrxBfSmU0ERCjIVYHf6hExMmcMZkQhewZzNvPT
	Hfsxxm5iD0RJ1SDa5RwdyDe3w8mmgocB09W4Ah87giCaT7zaFvcSDcowMD7/X7uNWEJEP0ff/ZT
	ERlepnZg=
X-Gm-Gg: AZuq6aIUzhPWCQSHokvC4ZOV9PVkN8pkMA51PvJlFRt3VMcrFBhFXnMZhb8f5jikG1O
	aoWFHmS71p7sIhqt29WhRVcnj8Zo/5HZJlc1GED6JaNApkX++lx4w+CPa4KwGdbb7JotBVS8aKy
	eZvJV6gXYXUbBRY4X8JWxyPZdsFFHOcvZ3HL/zfEmk/AgOfhZCdVOXS281YnWGypMe9UIf9jrxw
	6nbUF1jW++wxFUdQOl1mbm3pOVbul1JcERyKWlMjSNWWkJv706RlOIu57ScoGzrCJZHxff1cNXA
	wGRn5QFxgUbaQSQOpu+IB1zUyJYdYoeIGd241oxUfZUEj6P3hdVyyJ1LuILkQkBR8Wfg4sAwnEp
	Df9F/HznYLmFqpQTcYBp8VNYKl6uDqHMZuwIx165vhUh/i2xklRr7Ecn91fXP/09eAle9wBJElJ
	0/+KGLsnQIxftsRP3095d/Q8lX
X-Received: by 2002:a17:903:1112:b0:2a7:6d72:829c with SMTP id d9443c01a7336-2a8d993a81cmr89723195ad.50.1770006988240;
        Sun, 01 Feb 2026 20:36:28 -0800 (PST)
Received: from MVIN00013.mvista.com ([103.250.136.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4110sm125861135ad.84.2026.02.01.20.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 20:36:27 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] openssl: fix CVE-2025-15468
Date: Mon,  2 Feb 2026 10:04:31 +0530
Message-ID: <20260202043432.92025-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 04:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230345

Upstream-Status: Backport from https://github.com/openssl/openssl/commit/1f08e54bad32843044fe8a675948d65e3b4ece65

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openssl/openssl/CVE-2025-15468.patch      | 39 +++++++++++++++++++
 .../openssl/openssl_3.2.6.bb                  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
new file mode 100644
index 0000000000..dcd862bedf
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
@@ -0,0 +1,39 @@
+From 1f08e54bad32843044fe8a675948d65e3b4ece65 Mon Sep 17 00:00:00 2001
+From: Daniel Kubec <kubec@openssl.org>
+Date: Fri, 9 Jan 2026 14:33:24 +0100
+Subject: [PATCH] ossl_quic_get_cipher_by_char(): Add a NULL guard before
+ dereferencing SSL_CIPHER
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes CVE-2025-15468
+
+Reviewed-by: Saša Nedvědický <sashan@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+MergeDate: Mon Jan 26 19:36:04 2026
+(cherry picked from commit 293b55de0c434a99d0e744d0521170ca280606a9)
+
+CVE: CVE-2025-15468
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/1f08e54bad32843044fe8a675948d65e3b4ece65]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ ssl/quic/quic_impl.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ssl/quic/quic_impl.c b/ssl/quic/quic_impl.c
+index 98b6a0a..4abde64 100644
+--- a/ssl/quic/quic_impl.c
++++ b/ssl/quic/quic_impl.c
+@@ -3646,6 +3646,8 @@ const SSL_CIPHER *ossl_quic_get_cipher_by_char(const unsigned char *p)
+ {
+     const SSL_CIPHER *ciph = ssl3_get_cipher_by_char(p);
+ 
++    if (ciph == NULL)
++        return NULL;
+     if ((ciph->algorithm2 & SSL_QUIC) == 0)
+         return NULL;
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
index fac62245d7..4fd13d52fe 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://CVE-2025-15467-01.patch \
            file://CVE-2025-15467-02.patch \
            file://CVE-2025-15467-03.patch \
+           file://CVE-2025-15468.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.50.1


