Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C097D41D51
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 13:33:48 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.86935.1731418421873835057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 05:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=axNoL2NL;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20caccadbeeso60631505ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 05:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1731418421; x=1732023221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=frpY46l+V56O0iM1/lVEnnBgqj3n397kIHF5ZKTxo9A=;
        b=axNoL2NLg9Vu7WxksXJMyykYAXF/DksoFzMRAYoAUQHgaN7SS89txoK8u0MuGp8Pd1
         +VdmjgdwWFs18uPp7I8sMn/TE2pDpF3NsQ8q3nX3QOddG+Tt64Uy3XD8j00Puk6cHMrI
         OfAWsZ66KhwgUCLTOmlBJROmttQBssV+3TL9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418421; x=1732023221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frpY46l+V56O0iM1/lVEnnBgqj3n397kIHF5ZKTxo9A=;
        b=wgvi/X0xnY6QCofg5W+DrcT6U56KRMQtJHtmI1y0FpnOYV1m/yAskyRtpzCGrMDOQD
         o55/VZMlxnmAp417kNg+Af6oU+Uswe7uyKKk2lptDLk7jTuQA4zjt0B/c5ImBdzWi+L7
         6q/rtpVW6g7FIY3uJyCT6VkjuK0UXEWC7k5ubS8YEa1yjnsGdmdAcCuW3TelR4qXrkiU
         cJ4NneKeYb8LOFWj4WxiNoprRU3mDz7iX06MEzEFfA6LVSqOFhSi7BnzwOaLXWzPwZOf
         PndzkN9Yv7zOEoQoVm8SnEndD2dsdCOXwCDzAmA3EpY4EyfpQUIqwo/Ii4mMLWmLwB+L
         8KRA==
X-Gm-Message-State: AOJu0YxNNkOuZRerQ5kPU+No69jgaf6h/ABeZ5Kd3zUahRFdZivVcdcM
	iEnQwXI3z41uhByqNwerWdrrtTUj0A3AwlBVhANrTb0twhM5QCAjXg+ZlCDZiwIZ8ORXlEdt+BC
	6YU4=
X-Google-Smtp-Source: AGHT+IHtBq1cVxQYdv60vMrYE0UXTFiJN4DrZvRhBvZKkItOq0dlFpF2Or4XOHg1MmnJ5oBAMR3HhA==
X-Received: by 2002:a17:903:2450:b0:207:1675:6709 with SMTP id d9443c01a7336-21183329535mr240134765ad.0.1731418420651;
        Tue, 12 Nov 2024 05:33:40 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:882c:4c21:a1ac:7665:f038:795b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e41717sm91173675ad.122.2024.11.12.05.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 05:33:40 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] curl: Fix for CVE-2024-9681
Date: Tue, 12 Nov 2024 19:03:30 +0530
Message-Id: <20241112133330.2828105-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 13:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207049

From: Vijay Anusuri <vanusuri@mvista.com>

Ref: https://curl.se/docs/CVE-2024-9681.html

Upstream-Commit: https://github.com/curl/curl/commit/a94973805df96269bf3f3bf0a20ccb9887313316

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2024-9681.patch             | 88 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-9681.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-9681.patch b/meta/recipes-support/curl/curl/CVE-2024-9681.patch
new file mode 100644
index 0000000000..1ba373a1c4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-9681.patch
@@ -0,0 +1,88 @@
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
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a94973805df96269bf3f3bf0a20ccb9887313316]
+CVE: CVE-2024-9681
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/hsts.c          | 14 ++++++++++----
+ tests/data/test1660 |  2 +-
+ 2 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/lib/hsts.c b/lib/hsts.c
+index 08e15dc..06d2edf 100644
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
++	     (ntail > blen)) {
++            /* save the tail match with the longest tail */
++            bestsub = sts;
++            blen = ntail;
++	  }
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
+index cbbcf75..662026b 100644
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
+-- 
+2.25.1
+
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
2.25.1


