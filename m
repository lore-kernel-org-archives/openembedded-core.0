Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C116CEDB7C8
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75684.1775546033516870632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Fn9k8+IZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-482f454be5bso59009085e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546031; x=1776150831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnPfSxuNmlH81fbdPnvc6ltVJQ+styhsyLQRmmXMXrU=;
        b=Fn9k8+IZ2/tOHO5J0mi0gyjQ+1PT1Ph58Z2+0VzbKNFMe0SPzY8ZbIm+BlU8MPuZLB
         KjCSCr+2KA5rdmFlFUvBHPdWn4N3XthOtmd8br5k/RtKvO51TXxQngHcDRtQOITpMom0
         1244xCp36np5RsqLknUItSCXvxLxHiEE3rjyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546031; x=1776150831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DnPfSxuNmlH81fbdPnvc6ltVJQ+styhsyLQRmmXMXrU=;
        b=lZ2AeK7eNhb4slY8/g6CEbQFOyqlKabN24GB8rqKyYZwo2owoksybli1g+g0d3IdmE
         muMSKLAuxEy1ETMUaESH47y4jMAMQSoj09410Xzo2695IUvfAubtxYstGosbE19wILiD
         3vAd5IOobzuhZyUfpGGw3epyjDY6r/OFRMTrJ/EGKxE5eJ1X1P19cf5UOPAR42nAt7y6
         974S+iR9pnfdIpAIRlDO2bN9PLpkyrAfPsjNFjT/cG+1hZsnMns24K1IMeT8EJm58wPf
         eEBXpbZCI54XQ8Jb2zqan2q/o5lDiiewGkvFl9gCo19Y5RvYUsppjeEjqMAJcB5ehVjr
         LUag==
X-Gm-Message-State: AOJu0Yww6Gx7FtvDpAvU2WtEMn/+QeO+GHD4h5kTfznguCSapebL/nKw
	CdzD3+ubY5q2TV3vbrdj9fXojM+s7fw2i5978M/r2a1m1cxvi+TnJBggUm0zNiAje+Nado12BAL
	JDae2s0o=
X-Gm-Gg: AeBDietQBIg4xf5Qh6iX6PEPMtQbBDZRWwqVr9eatUjzuL2DHRAYXDtXwyx9MtpEbpu
	KvXoF5w/iwjKL2t/fVmTotR83katX0R5OyipDoe7VoRg9fbiikWDuoOMwGn5gnH1J4JE6sHPIG4
	5Fq8Jy8M875b4DkAG02ZgMD/9WsqJLvuPw7JQeUxz9pI+mjInyh2cbt9VjGmMIiKASmYEgNCrwC
	t55j/qqgronGHPppm2/se0DLBLDojslchj68dDGLKXH//FEOCX9uWc16Whx30c6XW1aZ0NR0ghr
	hjAd0CxdgN+gRlj3OLkno8kzU5kTzgWwJ8vx9ly8CFAw59qctY9aSDnpbRNuZYzhxq374w9jLxe
	RxOKjfsaY91rjButT1BgzKbIBaATf43ZzZNbpqZyYS4aXf3R74CtDe/V0olYoiAdPzDz/2netzK
	8uYM+sjgKEOktQNT6MuK8iq0ksvwhb23IilqNazN4Dw06YzgtMnGJiOuax0+lPun1TvHegoQTyK
	VWVXQSHFU/X3JmLf13LR6bUB+KkwqgQpVMF/w==
X-Received: by 2002:a05:600c:45cf:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-4889945f8c3mr185236135e9.3.1775546031449;
        Tue, 07 Apr 2026 00:13:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 14/18] curl: patch CVE-2025-14524
Date: Tue,  7 Apr 2026 09:13:22 +0200
Message-ID: <69b98b1f2bd0717b0ab7adcb5d8aa9b84ae2f48b.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234718

From: Vijay Anusuri <vanusuri@mvista.com>

Pick commit per [1].

[1] https://curl.se/docs/CVE-2025-14524.html
[2] https://security-tracker.debian.org/tracker/CVE-2025-14524

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
[YC: cherry-picked from scarthgap commit 951113a6e8185969444b5e28292f23434dba1f6c]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2025-14524.patch            | 42 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14524.patch b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
new file mode 100644
index 00000000000..0ab77ade9d5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
@@ -0,0 +1,42 @@
+From b3e2318ff3cbe4a9babe5b6875916a429bd584be Mon Sep 17 00:00:00 2001
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
+
+---
+ lib/curl_sasl.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/curl_sasl.c b/lib/curl_sasl.c
+index 7e28c92..f0b0341 100644
+--- a/lib/curl_sasl.c
++++ b/lib/curl_sasl.c
+@@ -345,7 +345,9 @@ CURLcode Curl_sasl_start(struct SASL *sasl, struct Curl_easy *data,
+     data->set.str[STRING_SERVICE_NAME] :
+     sasl->params->service;
+ #endif
+-  const char *oauth_bearer = data->set.str[STRING_BEARER];
++  const char *oauth_bearer =
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts) ?
++    data->set.str[STRING_BEARER] : NULL;
+   struct bufref nullmsg;
+ 
+   Curl_bufref_init(&nullmsg);
+@@ -531,7 +533,9 @@ CURLcode Curl_sasl_continue(struct SASL *sasl, struct Curl_easy *data,
+     data->set.str[STRING_SERVICE_NAME] :
+     sasl->params->service;
+ #endif
+-  const char *oauth_bearer = data->set.str[STRING_BEARER];
++  const char *oauth_bearer =
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts) ?
++    data->set.str[STRING_BEARER] : NULL;
+   struct bufref serverdata;
+ 
+   Curl_bufref_init(&serverdata);
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 72bd1a20881..b8fa8b5266a 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -70,6 +70,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2025-14017.patch \
            file://CVE-2025-15079.patch \
            file://CVE-2025-15224.patch \
+           file://CVE-2025-14524.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 

