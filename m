Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1D8CDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:13 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.51159.1697233991420895189
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oTckYzIE;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.49, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-57bab4e9e1aso1470005eaf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697233990; x=1697838790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwNjVicnRTiPVda1+moLlJexpk6+hcFX+PhlKPlFlYA=;
        b=oTckYzIE2TSf/ZlabAgws/sG45ENl2SiPNc+/VB+kNK6Bq4U6WYh+VcMu2qiPacfAJ
         qPuB8cvp1KkCU4OweAWKPGeWwzUfGLR8yD/ooEx+X+AkI7wlQ8qlIZ/zDsTjyF/MW1RN
         QcRo8KfaO1HIk967lzZ2waTx1+egQprfA6WgudHXkVWnSJwfPeynzCQO8SjJU58SMo1G
         lwotbfr4JltvWoNLbtRx5+u7Z8Iu2CUEwXKF/4yme/RpzyvgzrCuJFF+rzYGokGJlrtd
         kucWYZI2Z+4toqQ7TJ47R9yjREKoMVhpqpiltjmQzih1XOswUyy3ogWwzc8E1HlTT2Yo
         sf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697233990; x=1697838790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwNjVicnRTiPVda1+moLlJexpk6+hcFX+PhlKPlFlYA=;
        b=A/CLVhS3HXm3LE3Lq8N4JXWuZDh8LZJJmpeWExaKA8bIxKw5PpQd9EH9agRfBKBKiy
         e13fLiKmQEkmn5qDUYdwzRl5QpWkZeawpm5ST1wi55Z5ceA6XIO7s1riYzFPGNLH+dTO
         3PR4CNNgEH2tCHfY4IhImjNDa6zG4MKwnICh0MO95/csjqat5RYVKjwFOjVgwmtUWnZB
         O45iEv7rF+AGn+h4Fyw+8bnhd2CEhPEwte1CKWaP1ttS0MfC6GvqpG2KU19JJzOYCpy/
         qS4he9SIq+QovA31kjiusiXV9aVV94nnQly6jp+a8V2liNK5Bnd0DTOvzOFFQJ1XWGGe
         MopA==
X-Gm-Message-State: AOJu0Yxcd71E2edCnFYV/KfmKPvbL2m6cVOH5Gl/NSllFYxyZl5aRFSv
	xSl+fdURU2CTDH0usdAFFMurv01dwTn/7J8zmvw=
X-Google-Smtp-Source: AGHT+IGbS8hQ5ZZbH5/k8zOm6wGgPbyJXteq5EflsxyT2iS8gzr7sLhm7cCy9V98VD+kdOYnBjmGnQ==
X-Received: by 2002:a05:6358:6f06:b0:143:5eaf:d6fa with SMTP id r6-20020a0563586f0600b001435eafd6famr26508351rwn.9.1697233989985;
        Fri, 13 Oct 2023 14:53:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/27] curl: fix CVE-2023-38546
Date: Fri, 13 Oct 2023 11:52:29 -1000
Message-Id: <a6c5931192a1315cfc5f708585d22bc7bed9f7fd.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189082

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the Curl package. This flaw allows an attacker to insert
cookies into a running program using libcurl if the specific series of conditions are met.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-38546.patch            | 137 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38546.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-38546.patch b/meta/recipes-support/curl/curl/CVE-2023-38546.patch
new file mode 100644
index 0000000000..2c97c4d5a5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-38546.patch
@@ -0,0 +1,137 @@
+From 61275672b46d9abb3285740467b882e22ed75da8 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 14 Sep 2023 23:28:32 +0200
+Subject: [PATCH] cookie: remove unnecessary struct fields
+
+Plus: reduce the hash table size from 256 to 63. It seems unlikely to
+make much of a speed difference for most use cases but saves 1.5KB of
+data per instance.
+
+Closes #11862
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/61275672b46d9abb32857404]
+
+CVE: CVE-2023-38546
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/cookie.c | 13 +------------
+ lib/cookie.h | 14 ++++----------
+ lib/easy.c   |  4 +---
+ 3 files changed, 6 insertions(+), 25 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 0c6e0f7..d346203 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -119,7 +119,6 @@ static void freecookie(struct Cookie *co)
+   free(co->name);
+   free(co->value);
+   free(co->maxage);
+-  free(co->version);
+   free(co);
+ }
+
+@@ -726,11 +725,7 @@ Curl_cookie_add(struct Curl_easy *data,
+           }
+         }
+         else if((nlen == 7) && strncasecompare("version", namep, 7)) {
+-          strstore(&co->version, valuep, vlen);
+-          if(!co->version) {
+-            badcookie = TRUE;
+-            break;
+-          }
++          /* just ignore */
+         }
+         else if((nlen == 7) && strncasecompare("max-age", namep, 7)) {
+           /*
+@@ -1174,7 +1169,6 @@ Curl_cookie_add(struct Curl_easy *data,
+     free(clist->path);
+     free(clist->spath);
+     free(clist->expirestr);
+-    free(clist->version);
+     free(clist->maxage);
+
+     *clist = *co;  /* then store all the new data */
+@@ -1238,9 +1232,6 @@ struct CookieInfo *Curl_cookie_init(struct Curl_easy *data,
+     c = calloc(1, sizeof(struct CookieInfo));
+     if(!c)
+       return NULL; /* failed to get memory */
+-    c->filename = strdup(file?file:"none"); /* copy the name just in case */
+-    if(!c->filename)
+-      goto fail; /* failed to get memory */
+     /*
+      * Initialize the next_expiration time to signal that we don't have enough
+      * information yet.
+@@ -1394,7 +1385,6 @@ static struct Cookie *dup_cookie(struct Cookie *src)
+     CLONE(name);
+     CLONE(value);
+     CLONE(maxage);
+-    CLONE(version);
+     d->expires = src->expires;
+     d->tailmatch = src->tailmatch;
+     d->secure = src->secure;
+@@ -1611,7 +1601,6 @@ void Curl_cookie_cleanup(struct CookieInfo *c)
+ {
+   if(c) {
+     unsigned int i;
+-    free(c->filename);
+     for(i = 0; i < COOKIE_HASH_SIZE; i++)
+       Curl_cookie_freelist(c->cookies[i]);
+     free(c); /* free the base struct as well */
+diff --git a/lib/cookie.h b/lib/cookie.h
+index 39bb08b..3a43bbf 100644
+--- a/lib/cookie.h
++++ b/lib/cookie.h
+@@ -36,11 +36,7 @@ struct Cookie {
+   char *domain;      /* domain = <this> */
+   curl_off_t expires;  /* expires = <this> */
+   char *expirestr;   /* the plain text version */
+-
+-  /* RFC 2109 keywords. Version=1 means 2109-compliant cookie sending */
+-  char *version;     /* Version = <value> */
+   char *maxage;      /* Max-Age = <value> */
+-
+   bool tailmatch;    /* whether we do tail-matching of the domain name */
+   bool secure;       /* whether the 'secure' keyword was used */
+   bool livecookie;   /* updated from a server, not a stored file */
+@@ -56,18 +52,16 @@ struct Cookie {
+ #define COOKIE_PREFIX__SECURE (1<<0)
+ #define COOKIE_PREFIX__HOST (1<<1)
+
+-#define COOKIE_HASH_SIZE 256
++#define COOKIE_HASH_SIZE 63
+
+ struct CookieInfo {
+   /* linked list of cookies we know of */
+   struct Cookie *cookies[COOKIE_HASH_SIZE];
+-
+-  char *filename;  /* file we read from/write to */
+-  long numcookies; /* number of cookies in the "jar" */
++  curl_off_t next_expiration; /* the next time at which expiration happens */
++  int numcookies;  /* number of cookies in the "jar" */
++  int lastct;      /* last creation-time used in the jar */
+   bool running;    /* state info, for cookie adding information */
+   bool newsession; /* new session, discard session cookies on load */
+-  int lastct;      /* last creation-time used in the jar */
+-  curl_off_t next_expiration; /* the next time at which expiration happens */
+ };
+
+ /* This is the maximum line length we accept for a cookie line. RFC 2109
+diff --git a/lib/easy.c b/lib/easy.c
+index 27124a7..fddf047 100644
+--- a/lib/easy.c
++++ b/lib/easy.c
+@@ -911,9 +911,7 @@ struct Curl_easy *curl_easy_duphandle(struct Curl_easy *data)
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
+2.40.0
diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-support/curl/curl_8.0.1.bb
index bdffe7be34..375b4d2f93 100644
--- a/meta/recipes-support/curl/curl_8.0.1.bb
+++ b/meta/recipes-support/curl/curl_8.0.1.bb
@@ -20,6 +20,7 @@ SRC_URI = " \
     file://CVE-2023-32001.patch \
     file://CVE-2023-28320-fol1.patch \
     file://CVE-2023-38545.patch \
+    file://CVE-2023-38546.patch \
 "
 SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
 
-- 
2.34.1


