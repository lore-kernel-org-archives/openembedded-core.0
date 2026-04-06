Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61790EF4EAA
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49608.1775456861062086700
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SODdkyGE;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a29e6110so15833295e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456859; x=1776061659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImvltFtUT4cB6LZ4Yhh3fO4WvYNXpQvW2K3n+YAiVQk=;
        b=SODdkyGEAgnvcA4BWFmlUQFpKiBrxvw3uNpqesmXLjooqRycCejk1qBwlzZYIcbgnn
         0MPri0Toy0EjC4IhCA207SUZJzNcoDryCleDx7Jt9uTt9SjjV+tyHq2MFJ6Bxdtk5IQD
         ZUqUKOldsW97+Sqnh1IG8tE5n9xjESwqXxGas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456859; x=1776061659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ImvltFtUT4cB6LZ4Yhh3fO4WvYNXpQvW2K3n+YAiVQk=;
        b=ZO6ZB7JPCIo1YZFITy80h7BqiGFEIcA4kbDwzB4MKX6Cv9ZrsCTzygSxyu05BtW73g
         tMHlurcbvB5OlVC3yRpHIpY3r5a4OQ+EhGV1sRkpvubFCRXpKCPSx7U1QQGgCOmrZLZh
         70SjfKvHIq6xQ+tzSYis3dVuptMRF3EaDdEF1cgfNAtKUlLbfI5vamPNRVvPg3bIa2TA
         gmfyVde4nJ7bGjHnyGkqBg9jwbUXqVDLJYsSFPvSjVYa1rXia4/Mww1tvxAD9SgVaxvx
         7PrXkq2PXIDnqG8WzN4LIQKfttgnnNZbzk4Hf2aQjBv3LJf7CpwyygwfUivWxa02gqMF
         tLIQ==
X-Gm-Message-State: AOJu0YyGZC6xZHLYgelIGDYFI0h11eRJkp39PAFud3GLJZhmQzMlgljf
	JAkLQ0DJ69ZNoLIxDJqXUMczLV2ZjAGPisDhMF3kzXyAO7MWYDnFwKPimlbk7wH3D/cJmTR7HLE
	aYW+SkKw=
X-Gm-Gg: AeBDietOOUHBmeWMR7xN50PnAcMBxNZgCRvCx5xcAJwnQear0mZNOGXB2zcKi9ADYB2
	q3XFXTn38LP3xurq0tUcPICki9wmfHrq5TK+6n0QFF4JNlevs4uM94ZRIQ3eUykn9uNfT3ZCqzo
	q0W+wA3tdVCRfb6+FN5Z3C9ZlBEwO/UIY5/YY0BaYeOpUcyFvltCyCR4PYw7N5s3R6BsJZG/eC9
	ZXGKrZktmQmKqjOsjA8l6z6TxyoF06R7NoU1chNQ3MfiSyIr2CGVUVimOya3FG3grK0zpIhy47w
	66/+Mtr4BxIUjNrFFKMLKR72cC8yOJE8hGQmKJHC0YbFeCQY6NV0SE6J2gyVECXT8rrflz426UR
	sGeiGoUJKCLl7NiMegle119e9edgq029faLVLyWeAjSz0JAJKKrNfYuoz/u9mQWOsm3B6CHVZey
	h2pPZ9vmzb/l3jMDixgf5OB5hAkDfQbQmL9VGaHUBg0YK/10KldHkrJyL1cTE/FFH2GsyLGazv9
	UDM6/164r+c6a78sxnmfCUHL/GtfjmhbN2Xxw==
X-Received: by 2002:a05:600c:3f0a:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-488996a206dmr182387605e9.1.1775456859164;
        Sun, 05 Apr 2026 23:27:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/18] curl: patch CVE-2026-3784
Date: Mon,  6 Apr 2026 08:26:46 +0200
Message-ID: <c9fcf20e03d48840535384f5151a591edba26770.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234663

From: Vijay Anusuri <vanusuri@mvista.com>

pick patch from ubuntu per [1]

[1] https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
[2] https://ubuntu.com/security/CVE-2026-3784
[3] https://curl.se/docs/CVE-2026-3784.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-3784.patch             | 73 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784.patch b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
new file mode 100644
index 00000000000..95784e47637
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
@@ -0,0 +1,73 @@
+From 5f13a7645e565c5c1a06f3ef86e97afb856fb364 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 6 Mar 2026 14:54:09 +0100
+Subject: [PATCH] proxy-auth: additional tests
+
+Also eliminate the special handling for socks proxy match.
+
+Closes #20837
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3]
+Backported by Ubuntu team https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
+
+CVE: CVE-2026-3784
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/url.c                        | 28 +++++++---------------------
+ tests/http/test_13_proxy_auth.py | 20 ++++++++++++++++++++
+ tests/http/testenv/curl.py       | 18 +++++++++++++++---
+ 3 files changed, 42 insertions(+), 24 deletions(-)
+
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -930,33 +930,15 @@ proxy_info_matches(const struct proxy_in
+ {
+   if((data->proxytype == needle->proxytype) &&
+      (data->port == needle->port) &&
+-     Curl_safe_strcasecompare(data->host.name, needle->host.name))
+-    return TRUE;
++     curl_strequal(data->host.name, needle->host.name)) {
+ 
++    if(Curl_timestrcmp(data->user, needle->user) ||
++       Curl_timestrcmp(data->passwd, needle->passwd))
++      return FALSE;
++    return TRUE;
++  }
+   return FALSE;
+ }
+-
+-static bool
+-socks_proxy_info_matches(const struct proxy_info *data,
+-                         const struct proxy_info *needle)
+-{
+-  if(!proxy_info_matches(data, needle))
+-    return FALSE;
+-
+-  /* the user information is case-sensitive
+-     or at least it is not defined as case-insensitive
+-     see https://datatracker.ietf.org/doc/html/rfc3986#section-3.2.1 */
+-
+-  /* curl_strequal does a case insentive comparison, so do not use it here! */
+-  if(Curl_timestrcmp(data->user, needle->user) ||
+-     Curl_timestrcmp(data->passwd, needle->passwd))
+-    return FALSE;
+-  return TRUE;
+-}
+-#else
+-/* disabled, won't get called */
+-#define proxy_info_matches(x,y) FALSE
+-#define socks_proxy_info_matches(x,y) FALSE
+ #endif
+ 
+ /* A connection has to have been idle for a shorter time than 'maxage_conn'
+@@ -1282,8 +1264,8 @@ ConnectionExists(struct Curl_easy *data,
+         continue;
+ 
+       if(needle->bits.socksproxy &&
+-        !socks_proxy_info_matches(&needle->socks_proxy,
+-                                  &check->socks_proxy))
++        !proxy_info_matches(&needle->socks_proxy,
++                            &check->socks_proxy))
+         continue;
+ #endif
+       if(needle->bits.conn_to_host != check->bits.conn_to_host)
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index f50af1d4722..a2ee5736810 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -75,6 +75,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-1965-2.patch \
            file://CVE-2026-3783-pre1.patch \
            file://CVE-2026-3783.patch \
+           file://CVE-2026-3784.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 

