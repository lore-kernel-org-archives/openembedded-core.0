Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBEFF3C989
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:23 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21477.1771943593784356537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1HQd75lA;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4837584120eso39312455e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943592; x=1772548392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Czrsdx8cR+HwVRCm9by13O04s+ym64dYYpxtUrr2ze8=;
        b=1HQd75lALYTG2ETTECNYuBkjjtJ1bPk0N0l5XHNl7Una2/pGD5kgVhh54gc8RTMfFv
         Ary9icxXb0tehpQ97CFDX2EiVkfy0iFVUgLuc/oPqXB16PRa15txtIVM2E5gB3DxOgE7
         NgASR7eREfLSEn7YMAnJS73Q+itAZfxSL/M7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943592; x=1772548392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Czrsdx8cR+HwVRCm9by13O04s+ym64dYYpxtUrr2ze8=;
        b=HRNWYzUl17sgL5kodeF6SGDAaUculpl1vlr3yHPH8H/pjX9rsrn0NnATFPrErlscMP
         w+d09/LirqV85ZQDqpcOdjw07qndNJRTpBz0pGl4Thp703dtX2TXhV5pB/kjFpqcUWwn
         6KQkgcR9KtoLYbBJPaORLyVhyOrU5rMbNyVeid7Eqmd0UzxO1wDkuprkyATIc0ggExJ8
         oZIDQ2NX+cMa5G9ohT3No2BdLQwmnwGoZeihxB7+F5V2B6DoOqAM0Ko4/LVKIto2wBWm
         JyJLDOXROuRqdYz/9zhzZ0OYcE5Rci3ykLSbHm9dGXzqi4efI1LqqKS5hzx9Bxh5tC8e
         kAIQ==
X-Gm-Message-State: AOJu0YyaKfDp2YeFmLPpW+z+pLzMIDnSEXNybfWGBm5+MOYkTsVLbTK0
	oyj/fEl1hTiCxbDBITc54+y6iuuQ+ULAY64kXgWPT4QN9Y2TsoLVULQ0g9wl7PGZ0CGwgzRNhmS
	U9IPYSko=
X-Gm-Gg: AZuq6aJ5oo3aEwydmAOTS4O1ljNWywnhiWEW1rvMvcR4b6P0KEmxVZBgD0TZNSpTc5D
	TNC7SwSj7vI6EOZBs2XFHOlb6jbtdBFEG11Eka8tkes4h0l6848OKl3lh2myskdtAkzBw+4pxx6
	a5+EUBCJcan4TKZVopicW9LYZzuTfGNrhZsuDSZvTNbBs5nuIkumFCySvsjjrK7Na4jm6JhDSCb
	2jqi9nU6lK3okaz1UBBDhJj55pPR6JHRyhhja6laqqUKIX3ELyPBehqeNZLXffHdawuUdR6nmeg
	3uBEdDNmfNTee+AIo/WvpeQwb4aXvu01UVMwO2iRHZp9hAkr+jRF9ZvbjmePEYo9wkZ0iJ1Sdn/
	Fw/mM3Xxhpj+IvDGf/MkMv/R6WS405gSKF4n3YaOYuC+hNlodnD/Uup/P1vibHe2py7vFkbhC17
	thXup/QriPfSPzsLZ0CgApgrqdoacVFoASGyf0nmkZvNqr8vIKaLLCLDVLjPQRSphhpB8P1Uh92
	d6+rvb9FDJbjZsVh0lSp51/jfiYPXJ6CA==
X-Received: by 2002:a05:600c:858b:b0:483:badb:618f with SMTP id 5b1f17b1804b1-483badb639amr24827645e9.25.1771943591864;
        Tue, 24 Feb 2026 06:33:11 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:11 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 32/44] openssl: fix CVE-2025-15468
Date: Tue, 24 Feb 2026 15:32:00 +0100
Message-ID: <0a747181eaa1767e7cf00858118a7305cc028197.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231839

From: Hitendra Prajapati <hprajapati@mvista.com>

To fix this issue, Add a NULL guard before dereferencing SSL_CIPHER.

Backport patch from NVD report: https://nvd.nist.gov/vuln/detail/CVE-2025-15468

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssl/openssl/CVE-2025-15468.patch      | 39 +++++++++++++++++++
 .../openssl/openssl_3.2.6.bb                  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
new file mode 100644
index 00000000000..dcd862bedf6
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
index 4756f5aaa65..572a12aae8d 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            file://CVE-2024-41996.patch \
+           file://CVE-2025-15468.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \

