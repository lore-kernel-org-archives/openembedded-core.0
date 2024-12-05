Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E9BE77173
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 23:42:36 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.25987.1733442153551497638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 15:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WwkNL/ar;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2024120523423064f1dafd74f55f91b9-gkjttc@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2024120523423064f1dafd74f55f91b9
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Dec 2024 00:42:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WTRyyh+BmBtoFzT0qP+8H2aLyGqfyh7Y4rfBHHH8Jiw=;
 b=WwkNL/ar2hXdBZasfBWrllhIL+DogxFa+0NYgZrc5qLt4dCNRHUb+FD2EwHAKGAHvaHsB6
 6YPnnGDfY2YfoxHfn2WAtq+MhMB/7M8HpB/Mc5avw6v48LLbzASkj6kan9SqjZ3UqqpqaBwq
 T4G071uhp04wQusquZ4e3r6AJelBDQNEHS9kihhww529gLPhUnLB62PF7ySuq4PAjSRrd84O
 MwRc2u/GRqt1py0I9xdvXdi8mUvPpOKvj13GdFdyAqRiGdx977ubIJmVUF5T0QLLArdXZrH6
 XTEJmwKaUM5e9eX7KJYYvecQAMoPxfzsfVkG80IymxTcbx6dsvjCCYXg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][styhead][PATCH 6/7] curl: patch CVE-2024-9681
Date: Fri,  6 Dec 2024 00:41:43 +0100
Message-Id: <20241205234144.7933-7-peter.marko@siemens.com>
In-Reply-To: <20241205234144.7933-1-peter.marko@siemens.com>
References: <20241205234144.7933-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 23:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208395

From: Peter Marko <peter.marko@siemens.com>

Picked commit [1] per solution described in [2].

[1] https://github.com/curl/curl/commit/a94973805df96269bf
[2] https://curl.se/docs/CVE-2024-9681.html

(From OE-Core rev: 19663c559b72a0d14ddd0792be325284a6e16edc)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
2.30.2


