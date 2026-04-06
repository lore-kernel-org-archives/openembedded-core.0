Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F33BEF4EBB
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:41 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49556.1775456859334075632
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TwsLhWHT;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso15916125e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456857; x=1776061657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnPfSxuNmlH81fbdPnvc6ltVJQ+styhsyLQRmmXMXrU=;
        b=TwsLhWHT8kCOvjpb45E797RxUBgUMX759ltLhAHiLUg6vInd+MTWCShCzez4nAlQgW
         WT88+nBXFGwR1LcorkSW6O2SANuZ8iNfiDp3eYNLYZmIE59rJadySDiehsjfkX3tNBtZ
         KnS6IAjfuwJ0JhyGr1FzcEx+vHhSndiFokhHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456857; x=1776061657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DnPfSxuNmlH81fbdPnvc6ltVJQ+styhsyLQRmmXMXrU=;
        b=FR3lgBSqg4hP+pf1nZbPRTIskp2JxoJ2bQW4cKUNyRDrJgfPgGTLdOtKTUqBlDfgtR
         VW9YVQ1U7nfUxD5YMyYp/U53ttjg/lQeqZ3NQ7u4P0uyrOYfHLkMiqUSkqvAt4fdFH5v
         vK3ZaSBYl8aBlPpZPFur//gHTWZp0jmBtHFPZnIQLVQ+YEZa7SCn3kLbNh+pUETxYMeT
         TNp+OVdSOO5wdLw/8XrWVdoOBHUV3y674ZyOx5tPpe0qC7Bv6avVeCHAb1Qv+osSc9sx
         iHlVV7v45+iR5LbhV+bWingqpFzf1dc5X29k7P4X6tzxvhzkPhhogcLGRgq76xOy7q4d
         OOng==
X-Gm-Message-State: AOJu0YxzCYCp8Zq9tnz4T7b4qhdT98bC6Gf9QE3A4ag/3stI0lDF+8XW
	yP1D9lqQX0Zmp+Ye9eilDX3QRcEhWibBvyqtZ0OFepC4SCEhMJabdqIJxez0vLCzmZ/Vv5N1uYK
	vM18E9mk=
X-Gm-Gg: AeBDieuWM93fGmy+BKcOi7mHBOe5f4n2hwvuKLRepLZK6hyHd9n/YcsIMiz9/n3VmMy
	C3IaNyWwMVWrVQdabDoPgwI0ltKRRtLRPoGeWdKHPWmQ8Bpfbmnd/aqzn4eaiE2SzYVxP0aRy6D
	9y1+rZOK7UUFi+Y01EWoumZZiA3XOHHsfqJguZbu1AXEqbPq3H2NSKae+CPIsdR35CMiwJws3zm
	UXNhf9dIBggk+Zz0T1P+5wYaV0Z66bsL874bWpFlcEptvsLPAeS7GGC64iW0MAIHlOSHNJ2Y+9z
	NKFijpz458hnpfBwxwCCDW3DUjEvvjpz3KEqG4RVUSTv8OxZl3/rsF8vDvuaqRJ4PxijfWo5366
	F7jfb1ARIuJnAd1/sEdZoARhiJMjxAZ5ez5R7IcjnTR2JK2ylBa4GwPCcRz8Pyb9MZGVw3RExS9
	FbnNTVQWybbQ38mdtcq19om48d7/26Fh68zcv63eaJh04v879ryD9/E2Wuyqs4IjCldG5gexm03
	7ulqrjB/hNxBIdOMwmg7A4UVSQ=
X-Received: by 2002:a05:600c:64c7:b0:488:a8f0:35bd with SMTP id 5b1f17b1804b1-488a8f037c4mr96417445e9.8.1775456857381;
        Sun, 05 Apr 2026 23:27:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/18] curl: patch CVE-2025-14524
Date: Mon,  6 Apr 2026 08:26:43 +0200
Message-ID: <f8196fdbb8642e8482f0fed0ee1845790bf02cc0.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234660

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
 

