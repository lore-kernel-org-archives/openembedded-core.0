Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F35CDB482
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 20:55:54 +0000 (UTC)
Received: from smarthost01c.ixn.mail.zen.net.uk (smarthost01c.ixn.mail.zen.net.uk [212.23.1.22])
 by mx.groups.io with SMTP id smtpd.web11.23991.1697144144485915100
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 13:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=ITKci5+N;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.22, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01c.ixn.mail.zen.net.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <mac@mcrowe.com>)
	id 1qr2ic-0006Um-PH
	for openembedded-core@lists.openembedded.org; Thu, 12 Oct 2023 20:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description; bh=OI9Idcovwb5mV35EJQOhbawGAtrA2pqKBwvjUMBvb8o=; b=ITKci
	5+N93MUOKYXPL1f5pECfuPjWx8VqyQbwWvfs6Dtold+y2Txgq/tdK5/Bqz9IgKJGxtOT74s3Xj/ez
	g5oVkw6ySWcY0MYk+srHB2foSm2ZMQW/vI39vE2if+y8w6PSZ9+LbMDBuPuh3y8ROx+e5mMYKWyG2
	KeurI2w7C2CdZQoeERYXkunFmsbp7frjt6Gouz1+ntFuyAHD75fl+izjD40wiWGfi5rUhWkLOoGGI
	SxiveGwKqvJqfKyMMfEGr5A92cI5Ex58s7HreRyDwdN1C03wF5oEgXzQ/sVC3l4iQo+F/lcprI49n
	JuOVPU/AKxu0bnoBznAQY4szMb/QQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1qr2iL-00CNlU-0b;
	Thu, 12 Oct 2023 21:55:25 +0100
From: mac@mcrowe.com
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [dunfell][PATCH v2 2/2] curl: Backport fix for CVE-2023-38546
Date: Thu, 12 Oct 2023 21:55:20 +0100
Message-Id: <20231012205520.2886275-2-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012205520.2886275-1-mac@mcrowe.com>
References: <20231012205520.2886275-1-mac@mcrowe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01c-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 20:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189026

From: Mike Crowe <mac@mcrowe.com>

Take patch from Debian 7.64.0-4+deb10u7.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
CVE: CVE-2023-38546
---
 .../curl/curl/CVE-2023-38546.patch            | 132 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38546.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-38546.patch b/meta/recipes-support/curl/curl/CVE-2023-38546.patch
new file mode 100644
index 0000000000..30ef2fd038
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-38546.patch
@@ -0,0 +1,132 @@
+From 7b67721f12cbe6ed1a41e7332f3b5a7186a5e23f Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 14 Sep 2023 23:28:32 +0200
+Subject: [PATCH] cookie: remove unnecessary struct fields
+To: libcurl development <curl-library@cool.haxx.se>
+
+Plus: reduce the hash table size from 256 to 63. It seems unlikely to
+make much of a speed difference for most use cases but saves 1.5KB of
+data per instance.
+
+Closes #11862
+
+This patch taken from Debian's 7.64.0-4+deb10u7 package which applied with
+only a little fuzz.
+
+CVE: CVE-2023-38546
+Upstream-Status: Backport [61275672b46d9abb32857404]
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+---
+ lib/cookie.c | 13 +------------
+ lib/cookie.h |  7 ++-----
+ lib/easy.c   |  4 +---
+ 3 files changed, 4 insertions(+), 20 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 68054e1c4..a378f28e1 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -114,7 +114,6 @@ static void freecookie(struct Cookie *co)
+   free(co->name);
+   free(co->value);
+   free(co->maxage);
+-  free(co->version);
+   free(co);
+ }
+ 
+@@ -641,11 +640,7 @@ Curl_cookie_add(struct Curl_easy *data,
+           }
+         }
+         else if(strcasecompare("version", name)) {
+-          strstore(&co->version, whatptr);
+-          if(!co->version) {
+-            badcookie = TRUE;
+-            break;
+-          }
++          /* just ignore */
+         }
+         else if(strcasecompare("max-age", name)) {
+           /* Defined in RFC2109:
+@@ -1042,7 +1037,6 @@ Curl_cookie_add(struct Curl_easy *data,
+         free(clist->path);
+         free(clist->spath);
+         free(clist->expirestr);
+-        free(clist->version);
+         free(clist->maxage);
+ 
+         *clist = *co;  /* then store all the new data */
+@@ -1111,9 +1105,6 @@ struct CookieInfo *Curl_cookie_init(struct Curl_easy *data,
+     c = calloc(1, sizeof(struct CookieInfo));
+     if(!c)
+       return NULL; /* failed to get memory */
+-    c->filename = strdup(file?file:"none"); /* copy the name just in case */
+-    if(!c->filename)
+-      goto fail; /* failed to get memory */
+   }
+   else {
+     /* we got an already existing one, use that */
+@@ -1241,7 +1232,6 @@ static struct Cookie *dup_cookie(struct Cookie *src)
+     CLONE(name);
+     CLONE(value);
+     CLONE(maxage);
+-    CLONE(version);
+     d->expires = src->expires;
+     d->tailmatch = src->tailmatch;
+     d->secure = src->secure;
+@@ -1457,7 +1447,6 @@ void Curl_cookie_cleanup(struct CookieInfo *c)
+ {
+   if(c) {
+     unsigned int i;
+-    free(c->filename);
+     for(i = 0; i < COOKIE_HASH_SIZE; i++)
+       Curl_cookie_freelist(c->cookies[i]);
+     free(c); /* free the base struct as well */
+diff --git a/lib/cookie.h b/lib/cookie.h
+index b3865e601..2e667cda0 100644
+--- a/lib/cookie.h
++++ b/lib/cookie.h
+@@ -36,8 +36,6 @@ struct Cookie {
+   char *expirestr;   /* the plain text version */
+   bool tailmatch;    /* whether we do tail-matching of the domain name */
+ 
+-  /* RFC 2109 keywords. Version=1 means 2109-compliant cookie sending */
+-  char *version;     /* Version = <value> */
+   char *maxage;      /* Max-Age = <value> */
+ 
+   bool secure;       /* whether the 'secure' keyword was used */
+@@ -54,15 +52,14 @@ struct Cookie {
+ #define COOKIE_PREFIX__SECURE (1<<0)
+ #define COOKIE_PREFIX__HOST (1<<1)
+ 
+-#define COOKIE_HASH_SIZE 256
++#define COOKIE_HASH_SIZE 63
+ 
+ struct CookieInfo {
+   /* linked list of cookies we know of */
+   struct Cookie *cookies[COOKIE_HASH_SIZE];
+ 
+-  char *filename;  /* file we read from/write to */
+   bool running;    /* state info, for cookie adding information */
+-  long numcookies; /* number of cookies in the "jar" */
++  int numcookies;  /* number of cookies in the "jar" */
+   bool newsession; /* new session, discard session cookies on load */
+   int lastct;      /* last creation-time used in the jar */
+ };
+diff --git a/lib/easy.c b/lib/easy.c
+index b648e80c1..cdca0fb03 100644
+--- a/lib/easy.c
++++ b/lib/easy.c
+@@ -840,9 +840,7 @@ struct Curl_easy *curl_easy_duphandle(struct Curl_easy *data)
+   if(data->cookies) {
+     /* If cookies are enabled in the parent handle, we enable them
+        in the clone as well! */
+-    outcurl->cookies = Curl_cookie_init(data,
+-                                        data->cookies->filename,
+-                                        outcurl->cookies,
++    outcurl->cookies = Curl_cookie_init(data, NULL, outcurl->cookies,
+                                         data->set.cookiesession);
+     if(!outcurl->cookies)
+       goto fail;
+-- 
+2.39.2
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 4012776613..0141b780ee 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -54,6 +54,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2023-28320-fol1.patch \
            file://CVE-2023-32001.patch \
            file://CVE-2023-38545.patch \
+           file://CVE-2023-38546.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.39.2


