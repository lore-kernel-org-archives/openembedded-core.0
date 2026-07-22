Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BC7C531CB
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:10 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5524.1784741044530150175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hza50Rqy;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so9235334f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741042; x=1785345842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kxR1yjOH4BwWpQ+AJ+Q+4RErbAd6zOoaJ+wBpt0yIrE=;
        b=hza50RqyKIj62B8sRtAWdXKGyC6cbYSxI6zDj6ydQo2zBfbuuTho5qgLKoF5V9pJRh
         C2JWwRT0m5vex7O61X83rjgKiutRMadePMLXxg/PRcYosltpi1NN6cB6CrP5PE0xg08Y
         cc8CFT7pPpGdoYhVYhMfecLZdby0FQRtYx4ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741042; x=1785345842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kxR1yjOH4BwWpQ+AJ+Q+4RErbAd6zOoaJ+wBpt0yIrE=;
        b=GEmfWV36jmdX63wsF74zQiKe8YmLKNDCVql0ZeyztSeA+t0W2I0l2ZkRArZbdyFcVd
         8LChNnkXmVxIKyuTj0iMGUTRAX/GxCEkOzsYgQaMxILM44v9lH/l7cgj9xb/JciuUH15
         t4MIMAO+nmOZejevy//3AmzPYwM2TSNU1xgMUKjblDEvQgs9SZk9N12mP5u9zlk7Ecoj
         96cICbIjAgYwiy1woNLSDxlZW8MDgbUeRv/6r106vh9wG3TEF35hFekrvOTGbpSRts8z
         q9Ms+5JCv3sa9XLXXLZRGaELL3jTxTxo5+figCcRBRGNkPpB6MjA5R84W0NYE+6BpSvO
         bA0w==
X-Gm-Message-State: AOJu0YzxjC45N4S6XGsHwxT08XsdzC9MuU0iBnlCkXYp/UMOg9799iBU
	abGef+CpN2KlrwxODoGonBX226vqxyB79pcIaDwvw3VSbPhJWYz6+vkMNKlGM0mgXf9AgjjCje5
	UjXUtuFI=
X-Gm-Gg: AR+sD12z4RkzxDZ87WUIyQ5CjeqT37GGPfgXOIXT4bqJZNcfKX/1KZVjuw7zDwRPCKK
	W+QYiAOESNdJ+RCz+4wrXbTozyYE0qrb8YClN2e0UE4KssWALnMJEYhqBalw7DpL2hzW6EXcBVs
	G//95y5tNsXdarRmtFXe227F0b+eWGegq0v0LdNe4zBibvlpB/ROcURnFoEkLG1Ac8LR3sobo0T
	VDMBA9Ssib+oK1vKHD1z2JW48SwHpZ34IEeDQMhCsgqJcAFGPJi/VIUue75i5u4sNHIUHu+Vb2P
	qnr7pFvPzQraqBV7KBLZz7npXcVmrETsfe4S/VAru0cJiKx8oNgZT5L02rF+lu1iPzDAs1DXmvW
	idOr8XLLz2ZeQnfGyZKauiHwUBBOCdkJNptW9ZNvrnaVBF4S/7C3V+mFC+ajZR8WsyOPyyAt5Cg
	HgwyA1IeYg6sZdfCGhXZkAqcOTJ2+3PDK9WwQvnyS7judAinMcwSip2c2CJZpK87Ib6pPFvy0Nk
	JZxGjmv5oiH
X-Received: by 2002:a05:600c:1989:b0:495:52db:7e8 with SMTP id 5b1f17b1804b1-49552db09bfmr216421915e9.19.1784741042452;
        Wed, 22 Jul 2026 10:24:02 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/27] expat: fix CVE-2026-56407
Date: Wed, 22 Jul 2026 19:23:22 +0200
Message-ID: <db50faf7734afd0584cc299fdb92e4bf35823cbc.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241719

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56407

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-56407.patch          | 44 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56407.patch b/meta/recipes-core/expat/expat/CVE-2026-56407.patch
new file mode 100644
index 00000000000..5a2a22e0172
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56407.patch
@@ -0,0 +1,44 @@
+From 7216b3584bcfb2d415026d16b8902ee7eacad5ca Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Tue, 2 Jun 2026 11:59:01 +0530
+Subject: [PATCH] cap entity textLen against signed integer overflow
+
+CVE: CVE-2026-56407
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13]
+
+(cherry picked from commit 30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 71fe2c79..8e90fea8 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -5684,6 +5684,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             parser, enc, s + enc->minBytesPerChar, next - enc->minBytesPerChar,
+             XML_ACCOUNT_NONE);
+         if (parser->m_declEntity) {
++          /* Detect and prevent signed integer overflow */
++          if ((size_t)poolLength(&dtd->entityValuePool) > (size_t)INT_MAX) {
++            return XML_ERROR_NO_MEMORY;
++          }
+           parser->m_declEntity->textPtr = poolStart(&dtd->entityValuePool);
+           parser->m_declEntity->textLen
+               = (int)(poolLength(&dtd->entityValuePool));
+@@ -7099,6 +7103,11 @@ storeSelfEntityValue(XML_Parser parser, ENTITY *entity) {
+     return XML_ERROR_NO_MEMORY;
+   }
+ 
++  /* Detect and prevent signed integer overflow */
++  if ((size_t)poolLength(pool) > (size_t)INT_MAX) {
++    poolDiscard(pool);
++    return XML_ERROR_NO_MEMORY;
++  }
+   entity->textPtr = poolStart(pool);
+   entity->textLen = (int)(poolLength(pool));
+   poolFinish(pool);
+-- 
+2.43.7
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index bd6656c6e06..9f519b482ec 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -30,6 +30,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56406.patch;striplevel=2 \
            file://CVE-2026-56409.patch;striplevel=2 \
            file://CVE-2026-56411.patch;striplevel=2 \
+           file://CVE-2026-56407.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

