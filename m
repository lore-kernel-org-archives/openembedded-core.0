Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D950DE78D7D
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:26 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43983.1770629360752566694
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=11BXBMVE;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48069a48629so39016525e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629359; x=1771234159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csG5LxkEcKuUeQ68xfuxITgYqpTe8q6RTbU7hVrBC4Q=;
        b=11BXBMVEvi6/ShBtyUIjlOBq9SAM14W+WrCNC6TxiyTJZYMK24ZVvQNWy82+XtYUuU
         z+lLeCO8kWum+wPV7jBkSQ43mMIstTKxL7uAXByPcfezyIAdOVBREZ8nyDvCY0l8ZsqB
         gd0J18jxOqgxedvEW1BeNCZzpHzaFu3WlD7sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629359; x=1771234159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=csG5LxkEcKuUeQ68xfuxITgYqpTe8q6RTbU7hVrBC4Q=;
        b=U4zXWwFHiMQ7h5nagPrzuei0oWZyu1++rjmjcN/AflKS4F6dBQNGLjh/aDlxAmxQlp
         HbiWlqzS6dAqhtRQzQr2lP723A0jRLakcJdVl2lcmACuNMTLgoSMFs+ekYMUdxD3mNL3
         2928g/iaRxnUWiTUw5SEbxXgUTlNg8uQ8qbdjupFxs4Rqb0mUvUjz5idAuXFG8AvrV2T
         OA604ZFhOZingYee3Bw+uvsxkCjP7/ERN8t+N/WsxgNMgkr0/wgrP3EK/K6uq46KMsmV
         TRpDC1qIb5frJT1FckTDD2fwKixBnmWgeaR6VxWLz5h5qEglb258eoa+j/ef9ElXtJrs
         Y78g==
X-Gm-Message-State: AOJu0YwyW4kBQa23Jgp7FyaMBUr/qtwGPgejglbuJjfvAp6ZDo7/vwI9
	MiSZ6o2utBvped9o/7LBq6Ly9RkK6cyfX7k17GEe5ZIXclR4fd/QvLDQKwARJ/FZKEhSc6Zhg7y
	w6cGm9LU=
X-Gm-Gg: AZuq6aKcZskcmhi7AmGFC3ITiiZV4/dYYIBrMVDdZhbkI7yb+IUY0SIn8LR99CNCCyt
	F4bLn9HMvpdAJVxTIUKu+urEtR9DKcrdIBswx4ahA4kq6fQ4QDpnCC7sNa7SmtsTDMLdFivr/au
	BLrp2eeAFyX5/yY0X+oUtxNY++SrbJ7sI5+ixuwhYJTNeO/CQVBRzf/6U+Ew+WeOSWDnORySQTj
	RA7vQCWAOJFl1PYO1w1mXvDO100HdyGjnDvKwivc6kTTHFLXZbMRCJyTrmCegReehECtu5BpBf+
	mBZNG6NWUa5/eJxkEMdYMKwyj5ApBvYr/TfmQgSKApf+Q9rlbctXqRuskTNkcuLVi8nAUTuvdyI
	Q6KGLHGp4Uy+ET2uSt5+W9v0bnHtzxRiW1DQoEI0Lg55fTHm3UuoW5rPKq1qAEeM8e5rdPzunPy
	AtwsGc58PdC6kAYTjD/N6jC8LVr4U5tzBtBLx2zfqFiGJjMUsDU3DcfQOAvkW3m824hJouSiMgb
	pqtZVJSmpr/Xr7lctDIVq7Pgw==
X-Received: by 2002:a05:600c:34c7:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-483201dc3ebmr149041585e9.3.1770629358746;
        Mon, 09 Feb 2026 01:29:18 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/25] curl: patch CVE-2025-14524
Date: Mon,  9 Feb 2026 10:28:45 +0100
Message-ID: <1a71732df03fda94d0a7f170da3e7f34df7aa780.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230753

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2025-14524.patch            | 44 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14524.patch b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
new file mode 100644
index 00000000000..7692130f6e9
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
@@ -0,0 +1,44 @@
+From 0bccd8d29c89d70120444088d3893af59f3772bf Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 10 Dec 2025 11:40:47 +0100
+Subject: [PATCH] curl_sasl: if redirected, require permission to use bearer
+
+Closes #19933
+
+CVE: CVE-2025-14524
+Upstream-Status: Backport [https://github.com/curl/curl/commit/1a822275d333dc6da6043497160fd04c8fa48640]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ lib/curl_sasl.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/curl_sasl.c b/lib/curl_sasl.c
+index 66639cbacc..fe646548a8 100644
+--- a/lib/curl_sasl.c
++++ b/lib/curl_sasl.c
+@@ -357,7 +357,9 @@ CURLcode Curl_sasl_start(struct SASL *sasl, struct Curl_easy *data,
+     data->set.str[STRING_SERVICE_NAME] :
+     sasl->params->service;
+ #endif
+-  const char *oauth_bearer = data->set.str[STRING_BEARER];
++  const char *oauth_bearer =
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts) ?
++    data->set.str[STRING_BEARER] : NULL;
+   struct bufref nullmsg;
+ 
+   Curl_conn_get_host(data, FIRSTSOCKET, &hostname, &disp_hostname, &port);
+@@ -544,7 +546,9 @@ CURLcode Curl_sasl_continue(struct SASL *sasl, struct Curl_easy *data,
+     data->set.str[STRING_SERVICE_NAME] :
+     sasl->params->service;
+ #endif
+-  const char *oauth_bearer = data->set.str[STRING_BEARER];
++  const char *oauth_bearer =
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts) ?
++    data->set.str[STRING_BEARER] : NULL;
+   struct bufref serverdata;
+ 
+   Curl_conn_get_host(data, FIRSTSOCKET, &hostname, &disp_hostname, &port);
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 0d7aea0978b..9e37684b2cc 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://CVE-2025-9086.patch \
     file://CVE-2025-10148.patch \
     file://CVE-2025-14017.patch \
+    file://CVE-2025-14524.patch \
     file://0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch \
     file://CVE-2025-14819.patch \
     file://CVE-2025-15079.patch \

