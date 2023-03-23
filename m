Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B800C7619A
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:02 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.85695.1679605495550870442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FQloD90y;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id ja10so88155plb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDnH5SUoxxrwNL1LFV9/tH+m2uCKuc/mG6wTx5RtV8A=;
        b=FQloD90y2oQZoLUBtFU7IKYep/7fYBWiOCBcPTlJPjCoPJF5G4IxjuIYnLFHzIPhzM
         evuauPFE8nTrCiHipc/TYVmi7Mrel5p5fSSfDkfCNZg/gdWDhn76mDUuDr6RR/mLZOEL
         E4veCJ+L0BBze6SQNQ/MAdhhfEgNVQM6Fm3CoTxzanVpwNXgmGOn5MG1I8kyZWQH/dRa
         5dYUIyQQR/3splq+j5zGsN98tGh3fM3GbVW++m9Ns7serBF3rIS34HMGyrXc+rGU2Dlh
         Bcgn+oJiI6O+Yh6wYAz3s39UEJbVCsi9pmjUnrckz3qoLIQw6R5SYkc3S8XXmp0A2cSj
         at7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDnH5SUoxxrwNL1LFV9/tH+m2uCKuc/mG6wTx5RtV8A=;
        b=x8GIKBy9iInjHsBrWd/oRPp1NuXVeN4I6dcQES6Wcd7iweVDIYC5QM/4pyjIg+1UTG
         9Q8wAmRfPqoYkwhUKsARxLwYa2W89ipFjLYbnwpAk2UVBuED1THA0RgNrBmABTvQw7Ii
         Wd1I5dpKgRWQNbTAharuUtSFe8KgurnXShplAkIWapCLW9+AE5Vz72i5iXwM6MDiL1rg
         jyWBXs6mrfVUXCTayT+jnrfjoPpj09dhqhwfEquv/sWeIbSi6VqZahVL37aam+x+O6ML
         +NqaMlrpJ4qu9Xjq/mOCcCCxiCzDudHWCWCtpnszjF3Ms/DrXJfEJzyiLY5QAXXUIbs4
         LFBw==
X-Gm-Message-State: AAQBX9cq+LzliWs+fkqupBSO5mREkURtz005+eiHBlVlmfiCdPHfpl15
	RViV8Fw5zhQGbSshOpSC8SUzPoRWQLogxU/bUPI=
X-Google-Smtp-Source: AKy350Z1s/XCQmDvpPzU6fFdaTPCjk5AfCRrLOwHCEvci1yJLNJMN+fdRq8T4u2EiXvCjluy9H4hEQ==
X-Received: by 2002:a17:90b:3846:b0:237:24a8:c5e2 with SMTP id nl6-20020a17090b384600b0023724a8c5e2mr248209pjb.40.1679605494230;
        Thu, 23 Mar 2023 14:04:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.04.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:04:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/14] curl: Add fix for CVE-2023-23914, CVE-2023-23915
Date: Thu, 23 Mar 2023 11:04:29 -1000
Message-Id: <c80ede99b60cfbb0e7b339e1a7dc9f082f0da1f3.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178995

From: Pawan Badganchi <badganchipv@gmail.com>

Add below patches to fix CVE-2023-23914 [1], CVE-2023-23915 [2]

CVE-2023-23914_5-1.patch
CVE-2023-23914_5-2.patch
CVE-2023-23914_5-3.patch
CVE-2023-23914_5-4.patch
CVE-2023-23914_5-5.patch

[1] https://curl.se/docs/CVE-2023-23914.html
[2] https://curl.se/docs/CVE-2023-23915.html

Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
Signed-off-by: pawan <badganchipv@gmail.com>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-23914_5-1.patch        | 280 ++++++++++++++++++
 .../curl/curl/CVE-2023-23914_5-2.patch        |  23 ++
 .../curl/curl/CVE-2023-23914_5-3.patch        |  45 +++
 .../curl/curl/CVE-2023-23914_5-4.patch        |  48 +++
 .../curl/curl/CVE-2023-23914_5-5.patch        | 118 ++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   5 +
 6 files changed, 519 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-3.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-4.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-5.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-23914_5-1.patch b/meta/recipes-support/curl/curl/CVE-2023-23914_5-1.patch
new file mode 100644
index 0000000000..d357cee76c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-23914_5-1.patch
@@ -0,0 +1,280 @@
+From 076a2f629119222aeeb50f5a03bf9f9052fabb9a Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 27 Dec 2022 11:50:20 +0100
+Subject: [PATCH] share: add sharing of HSTS cache among handles
+
+Closes #10138
+
+CVE: CVE-2023-23914 CVE-2023-23915
+Upstream-Status: Backport [https://github.com/curl/curl/commit/076a2f629119222aeeb50f5a03bf9f9052fabb9a]
+Comment: Refreshed hunk from hsts.c and urldata.h
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ include/curl/curl.h                 |  1 +
+ lib/hsts.c                          | 15 +++++++++
+ lib/hsts.h                          |  2 ++
+ lib/setopt.c                        | 48 ++++++++++++++++++++++++-----
+ lib/share.c                         | 32 +++++++++++++++++--
+ lib/share.h                         |  6 +++-
+ lib/transfer.c                      |  3 ++
+ lib/url.c                           |  6 +++-
+ lib/urldata.h                       |  2 ++
+ 9 files changed, 109 insertions(+), 11 deletions(-)
+
+--- a/include/curl/curl.h
++++ b/include/curl/curl.h
+@@ -2953,6 +2953,7 @@ typedef enum {
+   CURL_LOCK_DATA_SSL_SESSION,
+   CURL_LOCK_DATA_CONNECT,
+   CURL_LOCK_DATA_PSL,
++  CURL_LOCK_DATA_HSTS,
+   CURL_LOCK_DATA_LAST
+ } curl_lock_data;
+
+--- a/lib/hsts.c
++++ b/lib/hsts.c
+@@ -37,6 +37,7 @@
+ #include "parsedate.h"
+ #include "rand.h"
+ #include "rename.h"
++#include "share.h"
+ #include "strtoofft.h"
+
+ /* The last 3 #include files should be in this order */
+@@ -561,4 +562,18 @@
+   return CURLE_OK;
+ }
+
++void Curl_hsts_loadfiles(struct Curl_easy *data)
++{
++  struct curl_slist *l = data->set.hstslist;
++  if(l) {
++    Curl_share_lock(data, CURL_LOCK_DATA_HSTS, CURL_LOCK_ACCESS_SINGLE);
++
++    while(l) {
++      (void)Curl_hsts_loadfile(data, data->hsts, l->data);
++      l = l->next;
++    }
++    Curl_share_unlock(data, CURL_LOCK_DATA_HSTS);
++  }
++}
++
+ #endif /* CURL_DISABLE_HTTP || CURL_DISABLE_HSTS */
+--- a/lib/hsts.h
++++ b/lib/hsts.h
+@@ -59,9 +59,11 @@ CURLcode Curl_hsts_loadfile(struct Curl_
+                             struct hsts *h, const char *file);
+ CURLcode Curl_hsts_loadcb(struct Curl_easy *data,
+                           struct hsts *h);
++void Curl_hsts_loadfiles(struct Curl_easy *data);
+ #else
+ #define Curl_hsts_cleanup(x)
+ #define Curl_hsts_loadcb(x,y) CURLE_OK
+ #define Curl_hsts_save(x,y,z)
++#define Curl_hsts_loadfiles(x)
+ #endif /* CURL_DISABLE_HTTP || CURL_DISABLE_HSTS */
+ #endif /* HEADER_CURL_HSTS_H */
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -2260,9 +2260,14 @@ CURLcode Curl_vsetopt(struct Curl_easy *
+         data->cookies = NULL;
+ #endif
+
++#ifndef CURL_DISABLE_HSTS
++      if(data->share->hsts == data->hsts)
++        data->hsts = NULL;
++#endif
++#ifdef USE_SSL
+       if(data->share->sslsession == data->state.session)
+         data->state.session = NULL;
+-
++#endif
+ #ifdef USE_LIBPSL
+       if(data->psl == &data->share->psl)
+         data->psl = data->multi? &data->multi->psl: NULL;
+@@ -2296,10 +2301,19 @@ CURLcode Curl_vsetopt(struct Curl_easy *
+         data->cookies = data->share->cookies;
+       }
+ #endif   /* CURL_DISABLE_HTTP */
++#ifndef CURL_DISABLE_HSTS
++      if(data->share->hsts) {
++        /* first free the private one if any */
++        Curl_hsts_cleanup(&data->hsts);
++        data->hsts = data->share->hsts;
++      }
++#endif   /* CURL_DISABLE_HTTP */
++#ifdef USE_SSL
+       if(data->share->sslsession) {
+         data->set.general_ssl.max_ssl_sessions = data->share->max_ssl_sessions;
+         data->state.session = data->share->sslsession;
+       }
++#endif
+ #ifdef USE_LIBPSL
+       if(data->share->specifier & (1 << CURL_LOCK_DATA_PSL))
+         data->psl = &data->share->psl;
+@@ -3049,19 +3063,39 @@ CURLcode Curl_vsetopt(struct Curl_easy *
+   case CURLOPT_HSTSWRITEDATA:
+     data->set.hsts_write_userp = va_arg(param, void *);
+     break;
+-  case CURLOPT_HSTS:
++  case CURLOPT_HSTS: {
++    struct curl_slist *h;
+     if(!data->hsts) {
+       data->hsts = Curl_hsts_init();
+       if(!data->hsts)
+         return CURLE_OUT_OF_MEMORY;
+     }
+     argptr = va_arg(param, char *);
+-    result = Curl_setstropt(&data->set.str[STRING_HSTS], argptr);
+-    if(result)
+-      return result;
+-    if(argptr)
+-      (void)Curl_hsts_loadfile(data, data->hsts, argptr);
++    if(argptr) {
++      result = Curl_setstropt(&data->set.str[STRING_HSTS], argptr);
++      if(result)
++        return result;
++      /* this needs to build a list of file names to read from, so that it can
++         read them later, as we might get a shared HSTS handle to load them
++         into */
++      h = curl_slist_append(data->set.hstslist, argptr);
++      if(!h) {
++        curl_slist_free_all(data->set.hstslist);
++        data->set.hstslist = NULL;
++        return CURLE_OUT_OF_MEMORY;
++      }
++      data->set.hstslist = h; /* store the list for later use */
++    }
++    else {
++      /* clear the list of HSTS files */
++      curl_slist_free_all(data->set.hstslist);
++      data->set.hstslist = NULL;
++      if(!data->share || !data->share->hsts)
++        /* throw away the HSTS cache unless shared */
++        Curl_hsts_cleanup(&data->hsts);
++    }
+     break;
++  }
+   case CURLOPT_HSTS_CTRL:
+     arg = va_arg(param, long);
+     if(arg & CURLHSTS_ENABLE) {
+--- a/lib/share.c
++++ b/lib/share.c
+@@ -29,9 +29,11 @@
+ #include "share.h"
+ #include "psl.h"
+ #include "vtls/vtls.h"
+-#include "curl_memory.h"
++#include "hsts.h"
+
+-/* The last #include file should be: */
++/* The last 3 #include files should be in this order */
++#include "curl_printf.h"
++#include "curl_memory.h"
+ #include "memdebug.h"
+
+ struct Curl_share *
+@@ -89,6 +91,18 @@ curl_share_setopt(struct Curl_share *sha
+ #endif
+       break;
+
++    case CURL_LOCK_DATA_HSTS:
++#ifndef CURL_DISABLE_HSTS
++      if(!share->hsts) {
++        share->hsts = Curl_hsts_init();
++        if(!share->hsts)
++          res = CURLSHE_NOMEM;
++      }
++#else   /* CURL_DISABLE_HSTS */
++      res = CURLSHE_NOT_BUILT_IN;
++#endif
++      break;
++
+     case CURL_LOCK_DATA_SSL_SESSION:
+ #ifdef USE_SSL
+       if(!share->sslsession) {
+@@ -141,6 +155,16 @@ curl_share_setopt(struct Curl_share *sha
+ #endif
+       break;
+
++    case CURL_LOCK_DATA_HSTS:
++#ifndef CURL_DISABLE_HSTS
++      if(share->hsts) {
++        Curl_hsts_cleanup(&share->hsts);
++      }
++#else   /* CURL_DISABLE_HSTS */
++      res = CURLSHE_NOT_BUILT_IN;
++#endif
++      break;
++
+     case CURL_LOCK_DATA_SSL_SESSION:
+ #ifdef USE_SSL
+       Curl_safefree(share->sslsession);
+@@ -207,6 +231,10 @@ curl_share_cleanup(struct Curl_share *sh
+   Curl_cookie_cleanup(share->cookies);
+ #endif
+
++#ifndef CURL_DISABLE_HSTS
++  Curl_hsts_cleanup(&share->hsts);
++#endif
++
+ #ifdef USE_SSL
+   if(share->sslsession) {
+     size_t i;
+--- a/lib/share.h
++++ b/lib/share.h
+@@ -59,10 +59,14 @@ struct Curl_share {
+ #ifdef USE_LIBPSL
+   struct PslCache psl;
+ #endif
+-
++#ifndef CURL_DISABLE_HSTS
++  struct hsts *hsts;
++#endif
++#ifdef USE_SSL
+   struct Curl_ssl_session *sslsession;
+   size_t max_ssl_sessions;
+   long sessionage;
++#endif
+ };
+
+ CURLSHcode Curl_share_lock(struct Curl_easy *, curl_lock_data,
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -1398,6 +1398,9 @@ CURLcode Curl_pretransfer(struct Curl_ea
+   if(data->state.resolve)
+     result = Curl_loadhostpairs(data);
+
++  /* If there is a list of hsts files to read */
++  Curl_hsts_loadfiles(data);
++
+   if(!result) {
+     /* Allow data->set.use_port to set which port to use. This needs to be
+      * disabled for example when we follow Location: headers to URLs using
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -434,7 +434,11 @@ CURLcode Curl_close(struct Curl_easy **d
+   Curl_altsvc_save(data, data->asi, data->set.str[STRING_ALTSVC]);
+   Curl_altsvc_cleanup(&data->asi);
+   Curl_hsts_save(data, data->hsts, data->set.str[STRING_HSTS]);
+-  Curl_hsts_cleanup(&data->hsts);
++#ifndef CURL_DISABLE_HSTS
++  if(!data->share || !data->share->hsts)
++    Curl_hsts_cleanup(&data->hsts);
++  curl_slist_free_all(data->set.hstslist); /* clean up list */
++#endif
+ #if !defined(CURL_DISABLE_HTTP) && !defined(CURL_DISABLE_CRYPTO_AUTH)
+   Curl_http_auth_cleanup_digest(data);
+ #endif
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1670,6 +1670,8 @@
+
+   void *seek_client;    /* pointer to pass to the seek callback */
+ #ifndef CURL_DISABLE_HSTS
++  struct curl_slist *hstslist; /* list of HSTS files set by
++                                  curl_easy_setopt(HSTS) calls */
+   curl_hstsread_callback hsts_read;
+   void *hsts_read_userp;
+   curl_hstswrite_callback hsts_write;
diff --git a/meta/recipes-support/curl/curl/CVE-2023-23914_5-2.patch b/meta/recipes-support/curl/curl/CVE-2023-23914_5-2.patch
new file mode 100644
index 0000000000..668972cb3f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-23914_5-2.patch
@@ -0,0 +1,23 @@
+From 0bf8b796a0ea98395b390c7807187982215f5c11 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 27 Dec 2022 11:50:23 +0100
+Subject: [PATCH] tool_operate: share HSTS between handles
+
+CVE: CVE-2023-23914 CVE-2023-23915
+Upstream-Status: Backport [https://github.com/curl/curl/pull/10138/commits/ca17cfed2df001356cfe2841f166569bac0f5e8c]
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/tool_operate.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/src/tool_operate.c
++++ b/src/tool_operate.c
+@@ -2722,6 +2722,7 @@ CURLcode operate(struct GlobalConfig *gl
+         curl_share_setopt(share, CURLSHOPT_SHARE, CURL_LOCK_DATA_SSL_SESSION);
+         curl_share_setopt(share, CURLSHOPT_SHARE, CURL_LOCK_DATA_CONNECT);
+         curl_share_setopt(share, CURLSHOPT_SHARE, CURL_LOCK_DATA_PSL);
++        curl_share_setopt(share, CURLSHOPT_SHARE, CURL_LOCK_DATA_HSTS);
+
+         /* Get the required arguments for each operation */
+         do {
diff --git a/meta/recipes-support/curl/curl/CVE-2023-23914_5-3.patch b/meta/recipes-support/curl/curl/CVE-2023-23914_5-3.patch
new file mode 100644
index 0000000000..4422b26834
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-23914_5-3.patch
@@ -0,0 +1,45 @@
+From ca02a77f05bd5cef20618c8f741aa48b7be0a648 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 27 Dec 2022 11:50:23 +0100
+Subject: [PATCH] hsts: handle adding the same host name again
+
+It will then use the largest expire time of the two entries.
+
+CVE: CVE-2023-23914 CVE-2023-23915
+Upstream-Status: Backport [https://github.com/curl/curl/pull/10138/commits/e077b30a42272d964d76e5b815a0af7dc65d8360]
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/hsts.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/lib/hsts.c b/lib/hsts.c
+index 339237be1c621..8d6723ee587d2 100644
+--- a/lib/hsts.c
++++ b/lib/hsts.c
+@@ -426,14 +426,23 @@ static CURLcode hsts_add(struct hsts *h, char *line)
+   if(2 == rc) {
+     time_t expires = strcmp(date, UNLIMITED) ? Curl_getdate_capped(date) :
+       TIME_T_MAX;
+-    CURLcode result;
++    CURLcode result = CURLE_OK;
+     char *p = host;
+     bool subdomain = FALSE;
++    struct stsentry *e;
+     if(p[0] == '.') {
+       p++;
+       subdomain = TRUE;
+     }
+-    result = hsts_create(h, p, subdomain, expires);
++    /* only add it if not already present */
++    e = Curl_hsts(h, p, subdomain);
++    if(!e)
++      result = hsts_create(h, p, subdomain, expires);
++    else {
++      /* the same host name, use the largest expire time */
++      if(expires > e->expires)
++        e->expires = expires;
++    }
+     if(result)
+       return result;
+   }
diff --git a/meta/recipes-support/curl/curl/CVE-2023-23914_5-4.patch b/meta/recipes-support/curl/curl/CVE-2023-23914_5-4.patch
new file mode 100644
index 0000000000..865b3f93a5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-23914_5-4.patch
@@ -0,0 +1,48 @@
+From dc0725244a3163f1e2d5f51165db3a1a430f3ba0 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 27 Dec 2022 11:50:23 +0100
+Subject: [PATCH] runtests: support crlf="yes" for verify/proxy
+
+CVE: CVE-2023-23914 CVE-2023-23915
+Upstream-Status: Backport [https://github.com/curl/curl/pull/10138/commits/fd7e1a557e414dd803c9225e37a2ca84e1df2269]
+Comment: Refreshed hunk from FILEFORMAT.md
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/FILEFORMAT.md | 4 ++--
+ tests/runtests.pl   | 5 +++++
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+--- a/tests/FILEFORMAT.md
++++ b/tests/FILEFORMAT.md
+@@ -540,14 +540,14 @@
+ One perl op per line that operates on the protocol dump. This is pretty
+ advanced. Example: `s/^EPRT .*/EPRT stripped/`.
+
+-### `<protocol [nonewline="yes"]>`
++### `<protocol [nonewline="yes"][crlf="yes"]>`
+
+ the protocol dump curl should transmit, if 'nonewline' is set, we will cut off
+ the trailing newline of this given data before comparing with the one actually
+ sent by the client The `<strip>` and `<strippart>` rules are applied before
+ comparisons are made.
+
+-### `<proxy [nonewline="yes"]>`
++### `<proxy [nonewline="yes"][crlf="yes"]>`
+
+ The protocol dump curl should transmit to a HTTP proxy (when the http-proxy
+ server is used), if 'nonewline' is set, we will cut off the trailing newline
+--- a/tests/runtests.pl
++++ b/tests/runtests.pl
+@@ -4744,6 +4744,11 @@ sub singletest {
+             }
+         }
+
++        if($hash{'crlf'} ||
++           ($has_hyper && ($keywords{"HTTP"} || $keywords{"HTTPS"}))) {
++            map subNewlines(0, \$_), @protstrip;
++        }
++
+         $res = compare($testnum, $testname, "proxy", \@out, \@protstrip);
+         if($res) {
+             return $errorreturncode;
diff --git a/meta/recipes-support/curl/curl/CVE-2023-23914_5-5.patch b/meta/recipes-support/curl/curl/CVE-2023-23914_5-5.patch
new file mode 100644
index 0000000000..1a363f0b4b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-23914_5-5.patch
@@ -0,0 +1,118 @@
+From ea5aaaa5ede53819f8bc7ae767fc2d13d3704d37 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 27 Dec 2022 11:50:23 +0100
+Subject: [PATCH] test446: verify hsts with two URLs
+
+CVE: CVE-2023-23914 CVE-2023-23915
+Upstream-Status: Backport [https://github.com/curl/curl/pull/10138/commits/7e89dfd463597701dd1defcad7be54f7d3c9d55d]
+Comment: Refreshed hunk from Makefile.inc
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test446      | 84 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 85 insertions(+), 1 deletion(-)
+ create mode 100644 tests/data/test446
+
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 3a6356bd122bc..fe1bb1c74c2ab 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -72,6 +72,7 @@
+ \
+ test430 test431 test432 test433 test434 test435 test436 \
+ \
++test446 \
+ test490 test491 test492 test493 test494 \
+ \
+ test500 test501 test502 test503 test504 test505 test506 test507 test508 \
+diff --git a/tests/data/test446 b/tests/data/test446
+new file mode 100644
+index 0000000000000..0e2dfdcfe33b6
+--- /dev/null
++++ b/tests/data/test446
+@@ -0,0 +1,84 @@
++<?xml version="1.0" encoding="ISO-8859-1"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP proxy
++HSTS
++trailing-dot
++</keywords>
++</info>
++
++<reply>
++
++# we use this as response to a CONNECT
++<connect nocheck="yes">
++HTTP/1.1 200 OK
++
++</connect>
++<data crlf="yes">
++HTTP/1.1 200 OK
++Content-Length: 6
++Strict-Transport-Security: max-age=604800
++
++-foo-
++</data>
++<data2 crlf="yes">
++HTTP/1.1 200 OK
++Content-Length: 6
++Strict-Transport-Security: max-age=6048000
++
++-baa-
++</data2>
++</reply>
++
++<client>
++<server>
++https
++http-proxy
++</server>
++<features>
++HSTS
++proxy
++https
++debug
++</features>
++<setenv>
++CURL_HSTS_HTTP=yes
++CURL_TIME=2000000000
++</setenv>
++
++<name>
++HSTS with two URLs
++</name>
++<command>
++-x http://%HOSTIP:%PROXYPORT --hsts log/hsts%TESTNUMBER http://this.hsts.example./%TESTNUMBER http://another.example.com/%TESTNUMBER0002
++</command>
++</client>
++
++<verify>
++# we let it CONNECT to the server to confirm HSTS but deny from there
++<proxy crlf="yes">
++GET http://this.hsts.example./%TESTNUMBER HTTP/1.1
++Host: this.hsts.example.
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://another.example.com/%TESTNUMBER0002 HTTP/1.1
++Host: another.example.com
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</proxy>
++
++<file name="log/hsts%TESTNUMBER" mode="text">
++# Your HSTS cache. https://curl.se/docs/hsts.html
++# This file was generated by libcurl! Edit at your own risk.
++this.hsts.example "20330525 03:33:20"
++another.example.com "20330727 03:33:20"
++</file>
++
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index b08af29059..b583060889 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -34,6 +34,11 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2022-42915.patch \
            file://CVE-2022-43551.patch \
            file://CVE-2022-43552.patch \
+           file://CVE-2023-23914_5-1.patch \
+           file://CVE-2023-23914_5-2.patch \
+           file://CVE-2023-23914_5-3.patch \
+           file://CVE-2023-23914_5-4.patch \
+           file://CVE-2023-23914_5-5.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


