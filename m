Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B96D5E367
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 11:43:26 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.15338.1731152596285848175
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Nov 2024 03:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gGOGFSX/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241109114314f23d19d4315c99bfa8-8mrqqd@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241109114314f23d19d4315c99bfa8
        for <openembedded-core@lists.openembedded.org>;
        Sat, 09 Nov 2024 12:43:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=adGUXqu1U1natUGPVpPnrEI9V82gm1dT51YIbnwy4r0=;
 b=gGOGFSX/5DRfo/2ma/vycsKCj39xHg7F9Ueq0vEr1QtHwTjBO+P/AnZGSjTTfeWbzO9DQo
 0DSdP82dlHvYnVHvmklMrf65M4mNW0Jp7fxv0kXR0lGp/DF1KoLFurK8+4pk7MZtwHWxYd9X
 5B9SNFxuBTkzJcdizGg64n+UFifYs3drQyJXB/N91Af09pU2LZ8Io7IdhlHzrNsR81qDICCs
 BDERoLdcubfLI3/Bi/B00HefV2U0VjwWia4bPDJzaacnj2d+UkKO5nB+LhQJ+jPt5t9n8xAh
 jSziKMMowPz9A4xlfN0hGvRDI5qIErfLS6vPApiOFutgrFEDy2e7cPzg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] curl: patch CVE-2024-9681
Date: Sat,  9 Nov 2024 12:42:27 +0100
Message-Id: <20241109114227.3559289-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Nov 2024 11:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206904

From: Peter Marko <peter.marko@siemens.com>

Picked commit [1] per solution described in [2].

[1] https://github.com/curl/curl/commit/a94973805df96269bf
[2] https://curl.se/docs/CVE-2024-9681.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
2.30.2


