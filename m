Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309C0C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 10:00:27 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.18719.1702548016909020979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 02:00:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ucg7b0+o;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: ppjadhav456@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6d9d307a732so6074802a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 02:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702548016; x=1703152816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0x1oMYgPHkORFiH9VcajSPmdrzv9Jdi57djb5WFPRLg=;
        b=Ucg7b0+o6ViuhLIuN9b6k8AkfTI1XHBVJVutxn6a7BR1WeIa2b4WxNjg87FtOMipb5
         Lwz7/zExZcU3uMTdJirKpQEk4sZ+znG//IruQ85jkvyp17mSv4yC4W1kgxAZFnOUN3Px
         7SQZi7kV0q9+6x3keTSgxJZj/CBvW5Z5tse0O28agp2JYEVwsxjepsL5vqu+JhH2ZnUZ
         O2rfEdWf+OeINI1g1G225phx1RTmnQyKfOwsHLw5eUA9X59Ax0lcr0+LxCRxll2hyQmQ
         e69PofaZd/2WZ3m5Tj/ak+9thh8yBAPqZlY7MLYPp29w6vBGI37wtDEURP3NcYABl6RS
         4JPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548016; x=1703152816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0x1oMYgPHkORFiH9VcajSPmdrzv9Jdi57djb5WFPRLg=;
        b=KMV1yaDZDE+3cEbAh7hEgb8+zhMy6V+cF4rr+aBF3aLtSGNECbyU5wlUZWIcrCZ4gx
         LgS2sjgS8V36P46ZoEJDj2GvYg2VMi9G1brD6t7LZoouLp20GyE2TrB5ES28aKBLDEGB
         6nm9zMYzfeXnREVe7Wx3VkutCzqMuH+9xnOnwW34Db+ygsYgTikgGyGM/guT8hiBjPs+
         xcD5HZXHjMo12jSSed29gVi8WGDUNhvTWW8BBQDQ3noiyLF0FQwnG6/t0AmDu6an0Ff2
         StByMpC+pQe2wPV9grgokyvK7ryh+zeV3Gitr0ojkauT+bi5sG3kYMiRJwYyndG9W5Qc
         cPJQ==
X-Gm-Message-State: AOJu0YxvhTznUEvEz3jbwQad70xGNxD8PRGkMhhWIbOjDmKgs681HEY9
	7JyNKxN/hRuLG6yfkeo0mpBGWQC5YUi7Kg==
X-Google-Smtp-Source: AGHT+IEN7Ww82hokjsZPldSDeNNmtPW7NX39Wl/tA2/6Jg++AHbcML4BjvEiWNhu+AbcJTVKg9AMxw==
X-Received: by 2002:a05:6808:2e99:b0:3b9:f8f6:4bf9 with SMTP id gt25-20020a0568082e9900b003b9f8f64bf9mr13314310oib.12.1702548015880;
        Thu, 14 Dec 2023 02:00:15 -0800 (PST)
Received: from localhost.localdomain ([43.231.237.196])
        by smtp.gmail.com with ESMTPSA id pa8-20020a17090b264800b0027df6ff00eesm12687150pjb.19.2023.12.14.02.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:00:15 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
X-Google-Original-From: Poonam Jadhav <poonam.jadhav@kpit.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] curl: Fix CVE-2023-46218
Date: Thu, 14 Dec 2023 15:30:07 +0530
Message-Id: <20231214100007.60006-1-poonam.jadhav@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192344

Add patch to fix CVE-2023-46218

Link: https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.88.1-8ubuntu2.4/curl_7.88.1-8ubuntu2.4.debian.tar.xz
      https://github.com/curl/curl/commit/2b0994c29a721c91c57

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 .../curl/curl/CVE-2023-46218.patch            | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46218.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-46218.patch b/meta/recipes-support/curl/curl/CVE-2023-46218.patch
new file mode 100644
index 0000000000..d7d7908ea0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46218.patch
@@ -0,0 +1,52 @@
+Backport of:
+
+From 2b0994c29a721c91c572cff7808c572a24d251eb Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 23 Nov 2023 08:15:47 +0100
+Subject: [PATCH] cookie: lowercase the domain names before PSL checks
+
+Reported-by: Harry Sintonen
+
+Closes #12387
+
+CVE: CVE-2023-46218
+Upstream-Status: Backport [https://github.com/curl/curl/commit/2b0994c29a721c91c57]
+Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
+---
+ lib/cookie.c | 24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -1044,15 +1044,23 @@ Curl_cookie_add(struct Curl_easy *data,
+    * dereference it.
+    */
+   if(data && (domain && co->domain && !Curl_host_is_ipnum(co->domain))) {
+-    const psl_ctx_t *psl = Curl_psl_use(data);
+-    int acceptable;
+-
+-    if(psl) {
+-      acceptable = psl_is_cookie_domain_acceptable(psl, domain, co->domain);
+-      Curl_psl_release(data);
++    bool acceptable = FALSE;
++    char lcase[256];
++    char lcookie[256];
++    size_t dlen = strlen(domain);
++    size_t clen = strlen(co->domain);
++    if((dlen < sizeof(lcase)) && (clen < sizeof(lcookie))) {
++      const psl_ctx_t *psl = Curl_psl_use(data);
++      if(psl) {
++        /* the PSL check requires lowercase domain name and pattern */
++        Curl_strntolower(lcase, domain, dlen + 1);
++        Curl_strntolower(lcookie, co->domain, clen + 1);
++        acceptable = psl_is_cookie_domain_acceptable(psl, lcase, lcookie);
++        Curl_psl_release(data);
++      }
++      else
++        acceptable = !bad_domain(domain);
+     }
+-    else
+-      acceptable = !bad_domain(domain);
+ 
+     if(!acceptable) {
+       infof(data, "cookie '%s' dropped, domain '%s' must not "
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 471bc47f34..a36d03f668 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -54,6 +54,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-32001.patch \
            file://CVE-2023-38545.patch \
            file://CVE-2023-38546.patch \
+           file://CVE-2023-46218.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


