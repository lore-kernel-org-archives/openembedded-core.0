Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57119C43219
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:11 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.9635.1633945270301899566
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OtS+1CB/;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id g25so7624947wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JlIQ89Vsu8eL4T4wxKE298s8RsIUyPbWaHlFmvlr/Fk=;
        b=OtS+1CB/xInkjwniBwsncgK6WL58EOFWenzRGjV+QGhPGWdXqEmJb4FUWPQgNnBgeX
         P6jLiT4uWKl7ghlmfn431AS2k4DIKpAGCkLDHoBACrUmUe7y2ZfblpykDdRW1LD1Yesr
         XiUtmlZ7k0snhBKQB0+RUrpi7urS7ASEnhhYeq1dmR3NJ7ZLQkaH9WOFTvImu/45jp/U
         bm4wryAj79lBUlmpQ9HHDgzvLyAY14+ep35XiI03mGe8+cpiCT2i/4uvuPHx3RBDxvhi
         zItggNG2Di2M+KgOHCUWfoQijMC9Z/FmZA0zV6vOrxvn7G6u61q86kSsfm5hAJCcRyF6
         d2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JlIQ89Vsu8eL4T4wxKE298s8RsIUyPbWaHlFmvlr/Fk=;
        b=Ul58uLUuvv2yr3FAhHy/MfqvGGPmFQ5UTQGtmcm73AbvkAphZiqClGTB1GEyeJWsYA
         RIpMaOoOQnkqjOYSxwMkqUpIA8CUXJ3eY9Z+/EhJ2NcmAumBR4gPGLLgElQfF01i52SG
         dpwbDK6ipY99eOCGZDvRU6p9ahb4XuAg7cxYOuVH8T1IW3SV6J0qEJnwHzlxcaeY7z0D
         2V0e4uTbmSbWALDrLWq/MRuM3dyYE657qUggqM0zG/aJgDYrtvu7AVFqmcMGRebfkJnF
         gattFTTUqQyEoZTTYYtuyg9eDIe3Oz6agc3nKGvtA9g/1B5R8qxXSKe2ANhyXGK/bDfr
         fWxg==
X-Gm-Message-State: AOAM532dLIROHEQPyxpHmscB0u96WxtzOC/Hoey0qPLT7fvHcMdX27/3
	54lGphvKhs5Tdu8cuOGeRhRTY/491JM=
X-Google-Smtp-Source: 
 ABdhPJzmQaOQlcMGFrJgIApmRf2ENMGrIMNJcpWTajKMmJBLN2ouUS+Yc3wAz1f6rTNtv6Zzl1agEw==
X-Received: by 2002:a05:600c:33a6:: with SMTP id
 o38mr7232940wmp.58.1633945268910;
        Mon, 11 Oct 2021 02:41:08 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/25] serf: add a openssl 3 compatibility fix
Date: Mon, 11 Oct 2021 11:40:43 +0200
Message-Id: <20211011094059.4184654-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156822

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...sl_buckets.c-do-not-use-ERR_GET_FUNC.patch | 28 +++++++++++++++++++
 meta/recipes-support/serf/serf_1.3.9.bb       |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch

diff --git a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
new file mode 100644
index 00000000000..e6172ef5aaa
--- /dev/null
+++ b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
@@ -0,0 +1,28 @@
+From 2f45711a66ff99886b6e4a5708e2db01a63e5af4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 10 Sep 2021 11:05:10 +0200
+Subject: [PATCH] buckets/ssl_buckets.c: do not use ERR_GET_FUNC
+
+Upstream removed it in
+https://github.com/openssl/openssl/pull/16004
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ buckets/ssl_buckets.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/buckets/ssl_buckets.c b/buckets/ssl_buckets.c
+index b01e535..9801f87 100644
+--- a/buckets/ssl_buckets.c
++++ b/buckets/ssl_buckets.c
+@@ -1325,8 +1325,7 @@ static int ssl_need_client_cert(SSL *ssl, X509 **cert, EVP_PKEY **pkey)
+                 return 0;
+             }
+             else {
+-                printf("OpenSSL cert error: %d %d %d\n", ERR_GET_LIB(err),
+-                       ERR_GET_FUNC(err),
++                printf("OpenSSL cert error: %d %d\n", ERR_GET_LIB(err),
+                        ERR_GET_REASON(err));
+                 PKCS12_free(p12);
+                 bio_meth_free(biom);
diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
index 21515866a90..669f42b8e7c 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -12,6 +12,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0003-gen_def.patch \
            file://0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch \
            file://SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch \
+           file://0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch \
            "
 
 SRC_URI[md5sum] = "370a6340ff20366ab088012cd13f2b57"
-- 
2.20.1


