Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461FFEE57E2
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:23:37 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.35225.1726097016966944363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1GR7kMNZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6bce380eb96so261897a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097016; x=1726701816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cqKYuY3pz0XZANms1uxX+eIH+2izrPoEbFQXOk4oHDo=;
        b=1GR7kMNZ6UJTJofw9zt/8+ytORCpKioWg625bQnUfhSQVaeFhGhF8Jy45JWL7tXzuG
         2voP0uEDZTVynQEPK9vCjSmPwqfYZTQbmgByAxgYHGjXbB5MEyNawsFTLlsKXTdEvnXY
         a3d+IeWrs9p6w6w3EKYlzYHd0TCTsZ9X0V843WAw5zTYjGRlvjC2kkVLm0Hf47TgthRX
         +uNZhDwj+QcIFpf/OsRgP6L5NgpW29VjroBIqd7hMn087he+2TBA3X4+sJZbl4AdJ0T4
         TG7pWc0qHIoCkYfvpg6rOq5YRn/p7bnBlkkt6V9MDv1B9hexJGG8dziyow9GVoi3PM+q
         M0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097016; x=1726701816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqKYuY3pz0XZANms1uxX+eIH+2izrPoEbFQXOk4oHDo=;
        b=YPdaovhQJh9RkrCUi9jHPOqakTPnPkY3tn20J+UWkjYuoE2Tp4EpD5m0cOwB2CG8v1
         7HPAdgEYxRzSWpONFMA1kIyDfb1J+gqk7wDg41clkBGARVp+FWkxUO3vbYPHGCMewwNG
         zuK/eWyjWGfrJ43TWI+Ar14P96ddYdQt9rxRghWZhf+oMZD7oCLXpcCkAxjUz1Y66r34
         Akot2GErjjxmAk7/G5YJ+Lua0oz/1XeXuiyL/5BgvJc8zNNPe9qxl1x0BbXFyP3/jXPZ
         AZ6X8FNjBWfGZDkAogqben3E2kqGJuvlj0xyDn7oLmsD+NJCjxSY0M5N8EQUJdnYX2WP
         nB0w==
X-Gm-Message-State: AOJu0Yz8zYK4Kqok+hCT1XcnGcfDBRCh2AP6/ZxvB4en9OlEcK32UG+/
	JO8q5bm7Ciy/8wpa9K39BPXdZSUfgbBXBTsVs6ysWKJAhZNIdHQ/cJlZofhGBV4jVPhKBZUw8Rq
	5
X-Google-Smtp-Source: AGHT+IH7RXyKJtzcz/ZxuZ5C3iQMu4s3fZ1qE+wPjpya+9hCi/U9CmRO1CamcuwlchvpE+rVzQ2H/g==
X-Received: by 2002:a05:6a21:4a4b:b0:1cf:3723:be38 with SMTP id adf61e73a8af0-1cf75eaeadbmr1059710637.17.1726097016198;
        Wed, 11 Sep 2024 16:23:36 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/22] expat: fix CVE-2024-45492
Date: Wed, 11 Sep 2024 16:23:03 -0700
Message-Id: <5b31e7f46ab05aca48f4fb11c558ff990e772c9e.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204400

From: Archana Polampalli <archana.polampalli@windriver.com>

An issue was discovered in libexpat before 2.6.3. nextScaffoldPart in xmlparse.c can have
an integer overflow for m_groupSize on 32-bit platforms (where UINT_MAX equals SIZE_MAX).

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2024-45492.patch          | 38 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45492.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2024-45492.patch b/meta/recipes-core/expat/expat/CVE-2024-45492.patch
new file mode 100644
index 0000000000..a569f18067
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-45492.patch
@@ -0,0 +1,38 @@
+From 9b0615959a4df00b4719c5beae286eb52fd32fe0 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 19 Aug 2024 22:37:16 +0200
+Subject: [PATCH] lib: Detect integer overflow in function nextScaffoldPart
+
+Reported by TaiYou
+
+CVE: CVE-2024-45492
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/892/commits/9bf0f2c16ee86f64]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/xmlparse.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index adb27e3..6d7e92f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7465,6 +7465,15 @@ nextScaffoldPart(XML_Parser parser) {
+   int next;
+
+   if (! dtd->scaffIndex) {
++    /* Detect and prevent integer overflow.
++     * The preprocessor guard addresses the "always false" warning
++     * from -Wtype-limits on platforms where
++     * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++    if (parser->m_groupSize > ((size_t)(-1) / sizeof(int))) {
++      return -1;
++    }
++#endif
+     dtd->scaffIndex = (int *)MALLOC(parser, parser->m_groupSize * sizeof(int));
+     if (! dtd->scaffIndex)
+       return -1;
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.5.0.bb
index f670f94685..26190383e3 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 	   file://CVE-2024-45490-0003.patch \
 	   file://CVE-2024-45490-0004.patch \
 	   file://CVE-2024-45491.patch \
+	   file://CVE-2024-45492.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.34.1


