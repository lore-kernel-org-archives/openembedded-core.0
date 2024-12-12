Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC9CE77182
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:21 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.20316.1734012494992999921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1LDLJG8o;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2161eb95317so5890325ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012494; x=1734617294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJVFHEd4xzi/CI7AMOICg0Ix+TO5iZO5fyR74rOx/N0=;
        b=1LDLJG8oyiDO2Tam10herpNNm7RcnKhruP35StB7hdL9DPFDaa2uJHgmxjmF5J2CqR
         ITS1XCKKYUDdnuk7CDmCHY/gEuKYzFILJ942d4mYAcDejD5PxPeprmtGE1q3RehmqQKZ
         lGo9Zo5mHSPshkc7HNiEIqMhnmC2/EOEmVkk3Kvzqf4tWJNjnjCwEQHwX78p/MGkIiqi
         SCa+viIoM5BIRCeQ+yx6W1v0MtJSSz7MgOjG6z+1VbtAWThkrxyzcLsmdHN9jfr4h7g5
         LCi/xX0gl5uUp8RzNLWZkruX2KCU2IShG9vAfH6+G6mdgy2DYfDuPY6I8WCvYV41BUZO
         FHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012494; x=1734617294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJVFHEd4xzi/CI7AMOICg0Ix+TO5iZO5fyR74rOx/N0=;
        b=S77dkuuGu6baHVd5K/X8GYp2dpdWrZWhyE2Jh4j5EBsWbxeYw/dnxoSsLfpxJBLSD/
         KJReINl/sDMLS0WAsZhFjXm0lKBsyhOSA5/kqI3qjEqksMrUvvcOfqMyYmFxDJPsHveB
         GXLNdB4Ul3Cdix1NDwt9Ms3XkR1m7MO5mCvig6iTK/lYBf8Y4g6GrlysBToi3sw0nw9J
         ixvPJxH05s1++3qr5fXP5786Qxd7Y93cDFyHuifwrSyNVH88tQfHXZrA+tqrayrKnI2d
         jk1Et/+RMctDkcMwq9rmOAGPVUgCAmCW/axX2tsLiuVpXf/hhu8yTiLAx1z0lDLQOGea
         BpXw==
X-Gm-Message-State: AOJu0YyS+0XqH8+o8UNFFJ0SKnmAonz+obealC6CXDTkTuT+Z9qDJg2P
	x+kNUG83G3S+nzfWsOOofd9jVILPhK9hIODIjbqXiz2s2yHDOSslNuZvDdX4exxsIg8iLaSea9E
	M
X-Gm-Gg: ASbGncuBnRlDhwTt1AQA5oEUZ+rwY6wlqr9RYo7AJBIJDN6qC4SWugKJbEeO9h2VhgM
	rQHwoNCT58aDMF4grOvYNUVHsTKEnuG917tF6d7O3cdUj2f0PGe5KxFryyvdjFFEd3Quwt77w6I
	Zz0T9ol8rUADr91/xOtDpcw5m2JFjot168A//D08y6lvDdu64tZ9fQpkN4QvgyCadjL5NHAqowL
	qmGWrPwpOmQCBO4qRrswyrVfghXVnZ5wMd6n0otPtCXUw==
X-Google-Smtp-Source: AGHT+IH6NgnuaFOni1bWiiXmznhCMvVnIltCo/2IoLvdkZVgl2e6jezcUAwxYmK2I2VtYOSbSHrXcA==
X-Received: by 2002:a17:903:1c2:b0:216:1ad2:1d5 with SMTP id d9443c01a7336-21778549cf8mr102363845ad.41.1734012494095;
        Thu, 12 Dec 2024 06:08:14 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 06/12] curl: patch CVE-2024-9681
Date: Thu, 12 Dec 2024 06:07:52 -0800
Message-Id: <c8282f5f79a38be0672c68c9e8f11bc072b77b56.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734012352.git.steve@sakoman.com>
References: <cover.1734012352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208640

From: Peter Marko <peter.marko@siemens.com>

Picked commit [1] per solution described in [2].

[1] https://github.com/curl/curl/commit/a94973805df96269bf
[2] https://curl.se/docs/CVE-2024-9681.html

(From OE-Core rev: 19663c559b72a0d14ddd0792be325284a6e16edc)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2024-9681.patch             | 85 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.9.1.bb       |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-9681.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-9681.patch b/meta/recipes-support/curl/curl/CVE-2024-9681.patch
new file mode 100644
index 0000000000..56a631d834
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
+@@ -249,12 +249,14 @@ CURLcode Curl_hsts_parse(struct hsts *h, const char *hostname,
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
+@@ -279,15 +281,19 @@ struct stsentry *Curl_hsts(struct hsts *h, const char *hostname,
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
+@@ -439,7 +445,7 @@ static CURLcode hsts_add(struct hsts *h, char *line)
+     e = Curl_hsts(h, p, subdomain);
+     if(!e)
+       result = hsts_create(h, p, subdomain, expires);
+-    else {
++    else if(strcasecompare(p, e->host)) {
+       /* the same hostname, use the largest expire time */
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
diff --git a/meta/recipes-support/curl/curl_8.9.1.bb b/meta/recipes-support/curl/curl_8.9.1.bb
index 745224929b..174608b561 100644
--- a/meta/recipes-support/curl/curl_8.9.1.bb
+++ b/meta/recipes-support/curl/curl_8.9.1.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
     file://0001-sigpipe-init-the-struct-so-that-first-apply-ignores.patch \
+    file://CVE-2024-9681.patch \
 "
 SRC_URI[sha256sum] = "f292f6cc051d5bbabf725ef85d432dfeacc8711dd717ea97612ae590643801e5"
 
-- 
2.34.1


