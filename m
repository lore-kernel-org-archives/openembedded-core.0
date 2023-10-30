Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BACC41535
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 02:21:18 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.140907.1698632476654365631
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 19:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2scP4yvE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-577fff1cae6so2650572a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 19:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698632476; x=1699237276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrGaftOOqY8N0zNOXDwm8ETc11HgZ3LY6PN7GmQPOlg=;
        b=2scP4yvEa+VezYeJAV11iDKLmN8FxI8Ei2/zgDoHnGjgAz6RmscREYueiUUD8fBu+s
         ZnF1Vtev+yH2nglUaHJQdCfBgG8ltlB9QDzSjXLpZPFqHpVa0b0JofBAELDMz3ZTo6ph
         jD6uhU22Sz68Km08YTYpKMR/iM5/Oyb59aWhliyqbod4iafbpNLzon0E+SM+urbLHyQ/
         lrqrL0ul66lLrY/05GOUsxAnsXFmgDEa0/hQHhi+ejSXxPEFIYgFcQvaiHNfOwJCkAAI
         lhh2x4vnneDwjSpxZHCEoTyZrikEnuumu30a/Ib/cfQQA6uPKOoTVkgSOfWmTrBJxTsF
         rkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698632476; x=1699237276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrGaftOOqY8N0zNOXDwm8ETc11HgZ3LY6PN7GmQPOlg=;
        b=XmPeQu2GEh/sQQK00NdxUPOyZC/DyceIzpOVZu0mtFFnP14KUbAPD4oyTT3jH37CrD
         0kKHT6NYAaSOAjPWZbp3UVHSUb+Afe7TroqwNkPyZcoB7fLJxCaFcTPcTky2WLKovWV3
         HH5gvbCEDyjoexRD4jvRig2BO69lnNjWulVCdR9FaNQVXj5Ma0YSMKJSB9/PAXiWx2i+
         LsC/crPyQn+eSH8dGMI14fQ66ykgXiT5bHRPbZ7Q7/tHkZXPPXnA/znY80zqyrECRI8G
         nylJcVqaoqGuwj/6i4k9YdWD+0cgjeTSNGCn/L+Fe0nBSWWv420/jZ4Gkbx1U0cwrsD4
         9B5A==
X-Gm-Message-State: AOJu0YzHAjv4ewZ6zzYhwgHElKk8e+Fm2bGGJ5o8+0iI43rA0NGfFtOp
	qgUJoVpdjyBrL9tfXefUOB8Mnr+gEm4KWaZAlfrQpg==
X-Google-Smtp-Source: AGHT+IECWmX/74y4B6A4YImByGVabdQDR33P6TbFdxV4/fzOkudTs5tjPc/m2mexgTFIs5FMonv9ig==
X-Received: by 2002:a05:6a20:938e:b0:15d:4cf1:212e with SMTP id x14-20020a056a20938e00b0015d4cf1212emr13451231pzh.4.1698632475375;
        Sun, 29 Oct 2023 19:21:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k2-20020a637b42000000b0057412d84d25sm3900046pgn.4.2023.10.29.19.21.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 19:21:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/7] curl: fix CVE-2023-38546
Date: Sun, 29 Oct 2023 16:20:54 -1000
Message-Id: <9c0c09b81594979aafd74511366316419d23046e.1698632320.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698632320.git.steve@sakoman.com>
References: <cover.1698632320.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 02:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189783

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the Curl package. This flaw allows an attacker to insert
cookies into a running program using libcurl if the specific series of conditions are met.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-38546.patch            | 137 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38546.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-38546.patch b/meta/recipes-support/curl/curl/CVE-2023-38546.patch
new file mode 100644
index 0000000000..1b2f1e7a7d
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
+ lib/cookie.h | 13 ++++---------
+ lib/easy.c   |  4 +---
+ 3 files changed, 6 insertions(+), 24 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index e0470a1..38d8d6c 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -115,7 +115,6 @@ static void freecookie(struct Cookie *co)
+   free(co->name);
+   free(co->value);
+   free(co->maxage);
+-  free(co->version);
+   free(co);
+ }
+
+@@ -707,11 +706,7 @@ Curl_cookie_add(struct Curl_easy *data,
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
+           /*
+@@ -1132,7 +1127,6 @@ Curl_cookie_add(struct Curl_easy *data,
+         free(clist->path);
+         free(clist->spath);
+         free(clist->expirestr);
+-        free(clist->version);
+         free(clist->maxage);
+
+         *clist = *co;  /* then store all the new data */
+@@ -1210,9 +1204,6 @@ struct CookieInfo *Curl_cookie_init(struct Curl_easy *data,
+     c = calloc(1, sizeof(struct CookieInfo));
+     if(!c)
+       return NULL; /* failed to get memory */
+-    c->filename = strdup(file?file:"none"); /* copy the name just in case */
+-    if(!c->filename)
+-      goto fail; /* failed to get memory */
+     /*
+      * Initialize the next_expiration time to signal that we don't have enough
+      * information yet.
+@@ -1363,7 +1354,6 @@ static struct Cookie *dup_cookie(struct Cookie *src)
+     CLONE(name);
+     CLONE(value);
+     CLONE(maxage);
+-    CLONE(version);
+     d->expires = src->expires;
+     d->tailmatch = src->tailmatch;
+     d->secure = src->secure;
+@@ -1579,7 +1569,6 @@ void Curl_cookie_cleanup(struct CookieInfo *c)
+ {
+   if(c) {
+     unsigned int i;
+-    free(c->filename);
+     for(i = 0; i < COOKIE_HASH_SIZE; i++)
+       Curl_cookie_freelist(c->cookies[i]);
+     free(c); /* free the base struct as well */
+diff --git a/lib/cookie.h b/lib/cookie.h
+index 7411980..645600a 100644
+--- a/lib/cookie.h
++++ b/lib/cookie.h
+@@ -34,11 +34,7 @@ struct Cookie {
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
+@@ -54,18 +50,17 @@ struct Cookie {
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
+index 0e23561..31abf9e 100644
+--- a/lib/easy.c
++++ b/lib/easy.c
+@@ -841,9 +841,7 @@ struct Curl_easy *curl_easy_duphandle(struct Curl_easy *data)
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
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 86a3a84332..471bc47f34 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -53,6 +53,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-28322-2.patch \
            file://CVE-2023-32001.patch \
            file://CVE-2023-38545.patch \
+           file://CVE-2023-38546.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


