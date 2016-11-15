Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.34])
	by mail.openembedded.org (Postfix) with ESMTP id A022C719E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:08:24 +0000 (UTC)
Received: from 1c6Zj7-000886-U1 by out10d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c6Zj7-00089M-UZ
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2016 01:08:25 -0800
Received: by emcmailer; Tue, 15 Nov 2016 01:08:25 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c6Zj7-000886-U1
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2016 01:08:25 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 15 Nov 2016 10:08:25 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2016 10:08:18 +0100
Message-ID: <1479200900-39007-9-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1479200900-39007-1-git-send-email-sona.sarmadi@enea.com>
References: <1479200900-39007-1-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Cc: sona@enea.se
Subject: [PATCHv5][krogoth 09/11] curl: CVE-2016-8623
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Nov 2016 09:08:24 -0000
Content-Type: text/plain

Use-after-free via shared cookies

Affected versions: curl 7.10.7 to and including 7.50.3
Reference:
https://curl.haxx.se/docs/adv_20161102I.html

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2016-8623.patch | 209 +++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |   1 +
 2 files changed, 210 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8623.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-8623.patch b/meta/recipes-support/curl/curl/CVE-2016-8623.patch
new file mode 100644
index 0000000..d9ddef6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8623.patch
@@ -0,0 +1,209 @@
+From d9d57fe0da6f25d05570fd583520ecd321ed9c3f Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 4 Oct 2016 23:26:13 +0200
+Subject: [PATCH] cookies: getlist() now holds deep copies of all cookies
+
+Previously it only held references to them, which was reckless as the
+thread lock was released so the cookies could get modified by other
+handles that share the same cookie jar over the share interface.
+
+CVE: CVE-2016-8623
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102I.html
+Reported-by: Cure53
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/cookie.c | 61 +++++++++++++++++++++++++++++++++++++++---------------------
+ lib/cookie.h |  4 ++--
+ lib/http.c   |  2 +-
+ 3 files changed, 43 insertions(+), 24 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 0f05da2..8607ce3 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -1022,10 +1022,44 @@ static int cookie_sort(const void *p1, const void *p2)
+ 
+   /* sorry, can't be more deterministic */
+   return 0;
+ }
+ 
++#define CLONE(field)                     \
++  do {                                   \
++    if(src->field) {                     \
++      dup->field = strdup(src->field);   \
++      if(!dup->field)                    \
++        goto fail;                       \
++    }                                    \
++  } while(0)
++
++static struct Cookie *dup_cookie(struct Cookie *src)
++{
++  struct Cookie *dup = calloc(sizeof(struct Cookie), 1);
++  if(dup) {
++    CLONE(expirestr);
++    CLONE(domain);
++    CLONE(path);
++    CLONE(spath);
++    CLONE(name);
++    CLONE(value);
++    CLONE(maxage);
++    CLONE(version);
++    dup->expires = src->expires;
++    dup->tailmatch = src->tailmatch;
++    dup->secure = src->secure;
++    dup->livecookie = src->livecookie;
++    dup->httponly = src->httponly;
++  }
++  return dup;
++
++  fail:
++  freecookie(dup);
++  return NULL;
++}
++
+ /*****************************************************************************
+  *
+  * Curl_cookie_getlist()
+  *
+  * For a given host and path, return a linked list of cookies that the
+@@ -1077,15 +1111,12 @@ struct Cookie *Curl_cookie_getlist(struct CookieInfo *c,
+         if(!co->spath || pathmatch(co->spath, path) ) {
+ 
+           /* and now, we know this is a match and we should create an
+              entry for the return-linked-list */
+ 
+-          newco = malloc(sizeof(struct Cookie));
++          newco = dup_cookie(co);
+           if(newco) {
+-            /* first, copy the whole source cookie: */
+-            memcpy(newco, co, sizeof(struct Cookie));
+-
+             /* then modify our next */
+             newco->next = mainco;
+ 
+             /* point the main to us */
+             mainco = newco;
+@@ -1093,16 +1124,11 @@ struct Cookie *Curl_cookie_getlist(struct CookieInfo *c,
+             matches++;
+           }
+           else {
+             fail:
+             /* failure, clear up the allocated chain and return NULL */
+-            while(mainco) {
+-              co = mainco->next;
+-              free(mainco);
+-              mainco = co;
+-            }
+-
++            Curl_cookie_freelist(mainco);
+             return NULL;
+           }
+         }
+       }
+     }
+@@ -1150,11 +1176,11 @@ struct Cookie *Curl_cookie_getlist(struct CookieInfo *c,
+  *
+  ****************************************************************************/
+ void Curl_cookie_clearall(struct CookieInfo *cookies)
+ {
+   if(cookies) {
+-    Curl_cookie_freelist(cookies->cookies, TRUE);
++    Curl_cookie_freelist(cookies->cookies);
+     cookies->cookies = NULL;
+     cookies->numcookies = 0;
+   }
+ }
+ 
+@@ -1162,25 +1188,18 @@ void Curl_cookie_clearall(struct CookieInfo *cookies)
+  *
+  * Curl_cookie_freelist()
+  *
+  * Free a list of cookies previously returned by Curl_cookie_getlist();
+  *
+- * The 'cookiestoo' argument tells this function whether to just free the
+- * list or actually also free all cookies within the list as well.
+- *
+  ****************************************************************************/
+ 
+-void Curl_cookie_freelist(struct Cookie *co, bool cookiestoo)
++void Curl_cookie_freelist(struct Cookie *co)
+ {
+   struct Cookie *next;
+   while(co) {
+     next = co->next;
+-    if(cookiestoo)
+-      freecookie(co);
+-    else
+-      free(co); /* we only free the struct since the "members" are all just
+-                   pointed out in the main cookie list! */
++    freecookie(co);
+     co = next;
+   }
+ }
+ 
+ 
+@@ -1231,11 +1250,11 @@ void Curl_cookie_clearsess(struct CookieInfo *cookies)
+  ****************************************************************************/
+ void Curl_cookie_cleanup(struct CookieInfo *c)
+ {
+   if(c) {
+     free(c->filename);
+-    Curl_cookie_freelist(c->cookies, TRUE);
++    Curl_cookie_freelist(c->cookies);
+     free(c); /* free the base struct as well */
+   }
+ }
+ 
+ /* get_netscape_format()
+diff --git a/lib/cookie.h b/lib/cookie.h
+index cd7c54a..a9a4578 100644
+--- a/lib/cookie.h
++++ b/lib/cookie.h
+@@ -5,11 +5,11 @@
+  *  Project                     ___| | | |  _ \| |
+  *                             / __| | | | |_) | |
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2011, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+  * are also available at https://curl.haxx.se/docs/copyright.html.
+  *
+@@ -80,11 +80,11 @@ struct Cookie *Curl_cookie_add(struct Curl_easy *data,
+                                struct CookieInfo *, bool header, char *lineptr,
+                                const char *domain, const char *path);
+ 
+ struct Cookie *Curl_cookie_getlist(struct CookieInfo *, const char *,
+                                    const char *, bool);
+-void Curl_cookie_freelist(struct Cookie *cookies, bool cookiestoo);
++void Curl_cookie_freelist(struct Cookie *cookies);
+ void Curl_cookie_clearall(struct CookieInfo *cookies);
+ void Curl_cookie_clearsess(struct CookieInfo *cookies);
+ 
+ #if defined(CURL_DISABLE_HTTP) || defined(CURL_DISABLE_COOKIES)
+ #define Curl_cookie_list(x) NULL
+diff --git a/lib/http.c b/lib/http.c
+index 65c145a..e6e7d37 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -2382,11 +2382,11 @@ CURLcode Curl_http(struct connectdata *conn, bool *done)
+             break;
+           count++;
+         }
+         co = co->next; /* next cookie please */
+       }
+-      Curl_cookie_freelist(store, FALSE); /* free the cookie list */
++      Curl_cookie_freelist(store);
+     }
+     if(addcookies && !result) {
+       if(!count)
+         result = Curl_add_bufferf(req_buffer, "Cookie: ");
+       if(!result) {
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 4bff34e..0f8fa3a 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -23,6 +23,7 @@ SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-8620.patch \
              file://CVE-2016-8621.patch \
              file://CVE-2016-8622.patch \
+             file://CVE-2016-8623.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
1.9.1


