Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3A3D597D2
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:28 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.3462.1731467782560488254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l4iCHQre;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-720c2db824eso6934765b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467782; x=1732072582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBYeQ/a8r1S9Mp2whPTlqI34LRsIjMMuEgTRTqscQp0=;
        b=l4iCHQrekcEbLubyuY9HXmiEaal65mPtllCsjXu1H/XIhMqElILjhbGe+JeOjQQh/r
         aAKnr7o17g9PFX7240fET9cVs5+S6ajX4keYNOutSShVpH1dd+YQgn5y57ThO9KrLt6h
         tcyLUiIMxG7DHLzHjKheKEA06PlBExYFJOUMFFdq/OKRF3wcPoaeFLu7s3y+guS9ISLV
         vQYItrA/y/vgh6/VKNdPG3Wc5ty1OGOWsm81vHsSCZuvB/e2q425sR8ZR1AcjZ6Ay3Ou
         etyatua/5QuF7B8Ukl8KhaQ7dUHgD8EV+FU8ExswmLvaYVZiZyf/XX9uisS85BgC/hO6
         gvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467782; x=1732072582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBYeQ/a8r1S9Mp2whPTlqI34LRsIjMMuEgTRTqscQp0=;
        b=ezSkQwPpWaLGY84FMEQcjWdMt/l4RugYFjSeBKB1A+jTD/5Bs7ny6pjHZGNNPJIB5/
         yTHrnju3WhS2kToRCzEoih1ncSGMX4QKqk7p9ciykMiL/IWZrOXLPw0mLROXDE57dQZi
         +A/I7BW+B+Aqhubtu4fhRzFV78l+o4Ndilw2nZLBNemLQ7Fu5Jiabs2ue/uHm5qTgTk5
         hD/tilAH2OWNUpjoamNTB2irZD4/wpOMCsRBQA5wwCVDrJxrVkWIcy9nNdwQLf/sXQ8i
         hb9WC4WXuPD2+QRVZI2HIk9M37HowAIqVt2baXF6d/N70C2fhlENBb0pNeVRJ2kTxg2M
         EJIA==
X-Gm-Message-State: AOJu0YwNZGyDvUOPFnRdzKa/SpZdM8pHMrGHyC8Mp+EpJIuMX7VKb1d4
	sw55Hj7pewsT20XNtAjQD5JYXPeSWoBENm9Yb3x/54W9CJ15v4C3i/vZVzg/3cpiKqyR6iaaYTL
	S
X-Google-Smtp-Source: AGHT+IE0zXtSXba+eN9QrV1y20wQmbJNYR4ImYVpfI4PekGwFbv1CXoRl4SToS2cAwa9Yo7xTXDuNg==
X-Received: by 2002:a05:6a20:3d84:b0:1db:eff0:6ae7 with SMTP id adf61e73a8af0-1dc22b57616mr27871608637.33.1731467781672;
        Tue, 12 Nov 2024 19:16:21 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/19] curl: patch CVE-2024-9681
Date: Tue, 12 Nov 2024 19:15:55 -0800
Message-Id: <fbb8928ea85980bb866febd66e5e18ad843dbef8.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207075

From: Peter Marko <peter.marko@siemens.com>

Picked commit [1] per solution described in [2].

[1] https://github.com/curl/curl/commit/a94973805df96269bf
[2] https://curl.se/docs/CVE-2024-9681.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2024-9681.patch             | 85 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-9681.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-9681.patch b/meta/recipes-support/curl/curl/CVE-2024-9681.patch
new file mode 100644
index 0000000000..e6c8bf7223
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-9681.patch
@@ -0,0 +1,85 @@
+From a94973805df96269bf3f3bf0a20ccb9887313316 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 9 Oct 2024 10:04:35 +0200
+Subject: [PATCH] hsts: improve subdomain handling
+
+- on load, only replace existing HSTS entries if there is a full host
+  match
+
+- on matching, prefer a full host match and secondary the longest tail
+  subdomain match
+
+Closes #15210
+
+CVE: CVE-2024-9681
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a94973805df96269bf3f3bf0a20ccb9887313316]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/hsts.c          | 14 ++++++++++----
+ tests/data/test1660 |  2 +-
+ 2 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/lib/hsts.c b/lib/hsts.c
+index d5e883f51ef0f7..12052ce53c1c5a 100644
+--- a/lib/hsts.c
++++ b/lib/hsts.c
+@@ -247,12 +247,14 @@ CURLcode Curl_hsts_parse(struct hsts *h, const char *hostname,
+ struct stsentry *Curl_hsts(struct hsts *h, const char *hostname,
+                            bool subdomain)
+ {
++  struct stsentry *bestsub = NULL;
+   if(h) {
+     char buffer[MAX_HSTS_HOSTLEN + 1];
+     time_t now = time(NULL);
+     size_t hlen = strlen(hostname);
+     struct Curl_llist_element *e;
+     struct Curl_llist_element *n;
++    size_t blen = 0;
+ 
+     if((hlen > MAX_HSTS_HOSTLEN) || !hlen)
+       return NULL;
+@@ -277,15 +279,19 @@ struct stsentry *Curl_hsts(struct hsts *h, const char *hostname,
+         if(ntail < hlen) {
+           size_t offs = hlen - ntail;
+           if((hostname[offs-1] == '.') &&
+-             Curl_strncasecompare(&hostname[offs], sts->host, ntail))
+-            return sts;
++             Curl_strncasecompare(&hostname[offs], sts->host, ntail) &&
++             (ntail > blen)) {
++            /* save the tail match with the longest tail */
++            bestsub = sts;
++            blen = ntail;
++          }
+         }
+       }
+       if(Curl_strcasecompare(hostname, sts->host))
+         return sts;
+     }
+   }
+-  return NULL; /* no match */
++  return bestsub;
+ }
+ 
+ /*
+@@ -447,7 +453,7 @@ static CURLcode hsts_add(struct hsts *h, char *line)
+     e = Curl_hsts(h, p, subdomain);
+     if(!e)
+       result = hsts_create(h, p, subdomain, expires);
+-    else {
++    else if(Curl_strcasecompare(p, e->host)) {
+       /* the same host name, use the largest expire time */
+       if(expires > e->expires)
+         e->expires = expires;
+diff --git a/tests/data/test1660 b/tests/data/test1660
+index f86126d19cf269..4b6f9615c9d517 100644
+--- a/tests/data/test1660
++++ b/tests/data/test1660
+@@ -52,7 +52,7 @@ this.example [this.example]: 1548400797
+ Input 12: error 43
+ Input 13: error 43
+ Input 14: error 43
+-3.example.com [example.com]: 1569905261 includeSubDomains
++3.example.com [3.example.com]: 1569905261 includeSubDomains
+ 3.example.com [example.com]: 1569905261 includeSubDomains
+ foo.example.com [example.com]: 1569905261 includeSubDomains
+ 'foo.xample.com' is not HSTS
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index ba3abadac9..cda42da4d3 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -62,6 +62,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2024-7264_2.patch \
            file://CVE-2024-8096.patch \
            file://0001-url-free-old-conn-better-on-reuse.patch \
+           file://CVE-2024-9681.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


