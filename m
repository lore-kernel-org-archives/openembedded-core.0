Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87913109446A
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 09:47:55 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8248.1774086474436044342
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 02:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=I3jd6uld;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-356337f058aso1502656a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 02:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774086473; x=1774691273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cwf2+AaNN+ZUBUbDEoKYitYLu3g146Y0s9aMZmMgQug=;
        b=I3jd6uldxlV7hpjzN4ZcQXNBg8EJx8Za/I3gQw4c/L9pOkDsjmeMm9uXfvbSylvRE7
         wxZdfLaA63i42FDmNbFi2KkG+Yh1XX33d67vGw3O6cX04rAo+z5JBjcd6UZJSSC93xgx
         9VsciepHQveklt6o+6sBAFj2MXLLnhbTiPtsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774086473; x=1774691273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cwf2+AaNN+ZUBUbDEoKYitYLu3g146Y0s9aMZmMgQug=;
        b=V9mOacXDTlCVl8BAUYYJixyeGBYVMGdrOaAlgsG39CqaeiCHaxMXsf5nLkvhMDJNsx
         B/kuFw790FzJwKLDa+urc1w2FYKeodq4iAvRC3cczGicm/0B9RZbtP9et5+iH1T0zWpc
         0AngSg/DIIqXx3PCFY3FrD8oOiCdGlEg/52wXfIJg7zp5ZyMGEindsHXY09N/3Lr/Oii
         XzVTTB7/6ExvIM65ooiYuxbPw06BFxLDBXeQSrrbmqhOP3ekGE2IJoOniVbVc+bYh07v
         7kNK0v55vNNmUaOS5p8nPgXlH6elrEr9fVWk1uQXC0RhUZJwwULDtMrjzm0rHLcOtRFF
         Xa4g==
X-Gm-Message-State: AOJu0YxU5fpfHO2WFae9pil3yq/9VA8cPLqlnXUZYuLvcI5gbyP61Rsk
	Rate2r5ct5uDIGHCsCjxqc4oChRwO9uCvfaWAPVKp+MxyS3/9l1K0ypZjYftfc7ctZ6NlPe2lw6
	OpvVhwVM=
X-Gm-Gg: ATEYQzwEGwoZgoDxdmKbzkznpEVhU4HEWcRcnIHiHnPdFqVO4sk9G2y31NOp6qr5m7M
	MIXKqjXR5ps8ITGuxqncP0YAW2xhYgnNu4uLo7ZO8+iDcDsmbEdbFvNwYkwX+HxeOKEkVPjCR3V
	ibWXJ4JfsFLZeNZI96fH3wbA5OHb5572hUMq3qS5sQnd5TPBClxDf3No74RTSQzU9QS4wzukuFU
	VlPiJmLsVdmlolKLkHASMQCxVXUVJEegw9LZkyv899LVhCu+RuSBh41PKJDfsy9v+bOKDnoACqm
	PyyoyHpjVChOxTPxhnBiKtFNeOExC3LSnuCMNeulMOPq/wXZYGWGQuyUwAn9y+xJRb2v07mq6DI
	Z9qRoGV7INeFZN5VI6pJctv66wo3lq8KDniVkmBiuJb/MemkTlzhRKsWfQS5ThSwoTLkwlovzd8
	znsge6SztttyGPMissw/gGGjGTl49dmWgcf085
X-Received: by 2002:a17:90b:4ccb:b0:359:f0e1:f8c9 with SMTP id 98e67ed59e1d1-35bd2b97290mr4950370a91.6.1774086473274;
        Sat, 21 Mar 2026 02:47:53 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:e896:2af1:2e77:522f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff704bsm7489501a91.2.2026.03.21.02.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 02:47:52 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2 4/4] curl: patch CVE-2026-3784
Date: Sat, 21 Mar 2026 15:17:23 +0530
Message-Id: <20260321094723.273058-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260321094723.273058-1-vanusuri@mvista.com>
References: <20260321094723.273058-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 09:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233655

From: Vijay Anusuri <vanusuri@mvista.com>

pick patch from ubuntu per [1]

[1] https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
[2] https://ubuntu.com/security/CVE-2026-3784
[3] https://curl.se/docs/CVE-2026-3784.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2026-3784.patch             | 73 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784.patch b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
new file mode 100644
index 0000000000..95784e4763
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
index f50af1d472..a2ee573681 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -75,6 +75,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-1965-2.patch \
            file://CVE-2026-3783-pre1.patch \
            file://CVE-2026-3783.patch \
+           file://CVE-2026-3784.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


