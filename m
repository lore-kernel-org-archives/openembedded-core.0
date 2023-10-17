Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E926CCDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:42:50 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.238369.1697568161736356258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vJ7qSJvB;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.49, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-57bc2c2f13dso3432531eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 11:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697568160; x=1698172960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZxPlnYMFOwLhNSS6Y8Qyvn7nMGDkERZeee/0xVQyq4=;
        b=vJ7qSJvBGI9Uns4wb3VbRVCQG754+R1aL8afydICAdmfZ/I0aIZmW/ABsZNWbAyFCP
         ljA74hlBQ7z+ildJky5j5n5SyX6wa6mZjOttJMFrJkioJ0Hpo1evllKww+ZN3h+zoGIS
         wZK1N51sHGd+mcH/plfImxrovuO2T2WNZfYdoIKUOPIPOVIzhDRD9LhrSbilUs0D8qyK
         nvM9l1olGCUhQfk7QHoBECiBtk3f0eAw49Mr5i8O8bNFWbxfCw5AdU0gKNrCd04HoHV4
         XdWTGh/bcjXcueMnbsp+jeGlTms2vLNQH97R8HqwIhRSZWUGjmAzWv7XhivOLka80CvU
         toyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697568160; x=1698172960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZxPlnYMFOwLhNSS6Y8Qyvn7nMGDkERZeee/0xVQyq4=;
        b=Gr919Bcj8BLHqSHfYj1h8SnMl0hb8Lp0winHN8whQOrgtZyxWvDhbUfTP7T9b61fNi
         oKaoVIqkQy4IZx0nVtdX/6Ttad4Z6yoJCqV0S1p2aSGCEHb+HFAVpFWgNdeVmdytlUYC
         tkGs0w7NWRUZNTqH4lEo40LmxlEP5gm5QF1g1JWkBvYV+T4Vk/udFQwkIgPKS7yqmo1Y
         oGRdiLYw5KM3xefUMtbJCKX89UisWEA4DPOeDoI8gDQEahocLUx1MDADcrmkZaue4w00
         5VrAU9pdvD/7KLjnhTg331GwqWxZepyhD1+iMuQ9/wKaHRjt8OOKCQTGYp2jw385O0Up
         abmA==
X-Gm-Message-State: AOJu0YyZqehZjKkpS0CvWJapSXdeEHTAB4ZFcXdE/a+8u2ig1rz7nYIz
	vSVgbherG0okqGQnGvSXjExel9KykjgTGDKhM6s=
X-Google-Smtp-Source: AGHT+IH3s+fBTus1GOenBXBEDO+49DGyaGahplwh6vOkUn0/0yo2d6fZnci9jvI68moZPaxUr0Nixw==
X-Received: by 2002:a05:6359:21f:b0:139:4783:5140 with SMTP id ej31-20020a056359021f00b0013947835140mr3482208rwb.16.1697568160190;
        Tue, 17 Oct 2023 11:42:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id w123-20020a626281000000b0066a31111cc5sm1838715pfb.152.2023.10.17.11.42.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:42:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/10] curl: Backport fix for CVE-2023-38546
Date: Tue, 17 Oct 2023 08:42:23 -1000
Message-Id: <364a9e46f167c2501785cd55a71cf9a614e64710.1697567211.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697567211.git.steve@sakoman.com>
References: <cover.1697567211.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 18:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189354

From: Mike Crowe <mac@mcrowe.com>

Take patch from Debian 7.64.0-4+deb10u7.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
CVE: CVE-2023-38546
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


