Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06490D637B9
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 20:42:44 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.22179.1731530553985967803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 12:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xkUSpobI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-210e5369b7dso77723155ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731530553; x=1732135353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSVJXduf/mZ7mt0WPWQjDsr2IXKlkVRiaBwoKrj3aFU=;
        b=xkUSpobIRYMqYRFo/J+H8hqxFo8Ff5weLd6TkjZM5vUafkOC0Rfx9XwgMmFbgVH1On
         BIZNQDu4EoXExEj4ndaNSQMyqUJl+Y0VU04f3CPDo6NgbgGWrnSP6yTuTFOB+M4ortgb
         nivxmxWzI2qlqTU8bhI1KqSEv3T/vBqay96D5s3vHKhCzoSzaQtLUazHtYeg4igbwv2F
         9I5IVaa/5vtlmGXHTJggnoblhKKABHwu58kT2AzjUIV2h+vVlR76gxL1TJGW76M3e3ea
         wnK5YfLWBp7cucRFMWlL0qhRhe4JWTFUPgmQ3/cBw7DXQaGVEA2TCLSAgbVxF6RuQqP4
         wvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530553; x=1732135353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSVJXduf/mZ7mt0WPWQjDsr2IXKlkVRiaBwoKrj3aFU=;
        b=tIo2RPDiNp+mTKv5QLDx+MKiipRZgPXzkunAdSX7ppyYS0NrG1M0I6SXVgXsejX5w5
         Pjz5JoAK+xAQLU6DszabtIjbq/tMr2qOfPA7YOimguYkAH1ybqh6HTRUcId9uDxHQj23
         Xwu9+DvV6WBMOQnynqlWooKFiZEBmWHm0O4ENsy/URzl775lB3w8GU2VYIs+w9eBDAer
         f1YHVZGZgzr+7W5ss7oOT+PmfM8fqk3mbVk/y9Y2o9yU8bP5DH4YIn2kg0ze6hXZ77IC
         y3mYBOZ/Vksp96icm9uR9erZlMJzmkw6GbJDrkQxbH0iuNv3Y+MELpjPT08QGer0QpCU
         NXIw==
X-Gm-Message-State: AOJu0YzwINEnH8sfVNS5aipf2Q4CpabkNEeOCkAasCeYQEhq3fq6r+gN
	EDgob6YrdAJsw0oGMhzENySBT3B0WMgu8exHfW33vCPCQJNN9G/5e1OaChesqv5Fqwx0/1JlrCM
	8
X-Google-Smtp-Source: AGHT+IHz1zOYv/YXiNdPoTqNuWSOV9F/n5MtBfxwD5VmFVIr9fE9TLaN3I/uLkykKarYXZXbUxB82w==
X-Received: by 2002:a17:902:cec1:b0:20c:8763:b3f7 with SMTP id d9443c01a7336-21183ca7259mr304081805ad.17.1731530553024;
        Wed, 13 Nov 2024 12:42:33 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e84ee2sm114545595ad.274.2024.11.13.12.42.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:42:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/9] curl: patch CVE-2024-9681
Date: Wed, 13 Nov 2024 12:42:17 -0800
Message-Id: <19663c559b72a0d14ddd0792be325284a6e16edc.1731530398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731530398.git.steve@sakoman.com>
References: <cover.1731530398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 20:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207126

From: Peter Marko <peter.marko@siemens.com>

Picked commit [1] per solution described in [2].

[1] https://github.com/curl/curl/commit/a94973805df96269bf
[2] https://curl.se/docs/CVE-2024-9681.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2024-9681.patch             | 85 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-9681.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-9681.patch b/meta/recipes-support/curl/curl/CVE-2024-9681.patch
new file mode 100644
index 0000000000..d9131228fc
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
+@@ -254,12 +254,14 @@ CURLcode Curl_hsts_parse(struct hsts *h, const char *hostname,
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
+@@ -284,15 +286,19 @@ struct stsentry *Curl_hsts(struct hsts *h, const char *hostname,
+         if(ntail < hlen) {
+           size_t offs = hlen - ntail;
+           if((hostname[offs-1] == '.') &&
+-             strncasecompare(&hostname[offs], sts->host, ntail))
+-            return sts;
++             strncasecompare(&hostname[offs], sts->host, ntail) &&
++             (ntail > blen)) {
++            /* save the tail match with the longest tail */
++            bestsub = sts;
++            blen = ntail;
++          }
+         }
+       }
+       if(strcasecompare(hostname, sts->host))
+         return sts;
+     }
+   }
+-  return NULL; /* no match */
++  return bestsub;
+ }
+ 
+ /*
+@@ -444,7 +450,7 @@ static CURLcode hsts_add(struct hsts *h, char *line)
+     e = Curl_hsts(h, p, subdomain);
+     if(!e)
+       result = hsts_create(h, p, subdomain, expires);
+-    else {
++    else if(strcasecompare(p, e->host)) {
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
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index d094604ea1..439fcb7881 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://CVE-2024-7264-1.patch \
     file://CVE-2024-7264-2.patch \
     file://CVE-2024-8096.patch \
+    file://CVE-2024-9681.patch \
 "
 SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd"
 
-- 
2.34.1


