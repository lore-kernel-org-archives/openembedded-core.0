Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.45.1610733771863383736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 10:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pzqLSJ2X;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id c13so5942897pfi.12
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 10:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Dz4Ty2HXoQ51v7QJhASR70sghR7iVDK0DYQpSsE5ltc=;
        b=pzqLSJ2X0S5y7KkOWYA98gRt9aIFiE2cl0d8TjKidTfCyyLHkasaIbobeUorSkaJ2Q
         dbhygDp41sZEeyYfmeVvXjTQ0rCp+GNIQ1Z/sGjR+3BOQC7N3wSOoH/Q/6P91lVE8Tuy
         MCuwoB672Dk0MuftNO9mh4uLpZG4vQK3cKwI35CxJQPbLVYbltGjgNk9ake6stCZ0CBp
         hlQ44nHawRjGF0iwQetcaQRyjm7U65ZelX/VP7FGV8x8TRdUbTWjYCPF5cFM7En0J2ct
         +JcGJ8VID7C6MRdflgVYgbIqgHi2+5W+oTBaMnporjisOBcpOUJbljIQIkwymulY2OTv
         4fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Dz4Ty2HXoQ51v7QJhASR70sghR7iVDK0DYQpSsE5ltc=;
        b=JEkYiVpBeAmvCW9kvsT7f7mjSysmffnMjs7jfk0OKu+mZFixoh+dxNgOoMO8TY39hv
         RyTVUp5t9isiIjzS2GUUcgvsvwXIgUnIQ2Ku6+gJEi0sdm9thHr1HwDN2J5rVJ+kIiC5
         lxpXIwLz1W9J9rNqccrx9CqxKGsb2P3h4Dh2DKTmxuSj6e7C4vX6XIattGT+h3hpVtTO
         Xl7qXg7wwb+OSw2STWFxpKttzewaCFckt7PTmvUcnLNMUCs2ytVuOx7FCpSzz0YB+ctM
         cy/LAT5XNY3g8SQ22rQXBWSuiwFTjVadi8wk+lohIdzseoivV98pjbj/X1NaFcqNIjGO
         Pv2Q==
X-Gm-Message-State: AOAM533ZUGcy2sHxSalKVO13GcKjanRgiUSJU+5drjBdx98+9dY0kSuP
	hymHM30PziKauRcG1XovFC77OFHp9U+zSg==
X-Google-Smtp-Source: ABdhPJxMJjbk2xjYXvCn1HBbqxCRy5rr2kPNBd+uDswDME9g61BEhAJ2gX958dQMQFuoX+2nOdtHAg==
X-Received: by 2002:a05:6a00:7c7:b029:19d:bab0:bc90 with SMTP id n7-20020a056a0007c7b029019dbab0bc90mr14211287pfu.62.1610733771167;
        Fri, 15 Jan 2021 10:02:51 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:19ce:8609:7a34:860])
        by smtp.gmail.com with ESMTPSA id v9sm8463722pff.102.2021.01.15.10.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 10:02:50 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH 2/2] curl: Security fix for CVE-2020-8231
Date: Fri, 15 Jan 2021 10:02:46 -0800
Message-Id: <20210115180246.503-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115180246.503-1-akuster808@gmail.com>
References: <20210115180246.503-1-akuster808@gmail.com>

From: Armin Kuster <akuster@mvista.com>

Source: https://curl.se/
MR: 105190
Type: Security Fix
Disposition: Backport from https://github.com/curl/curl/commit/3c9e021f86872baae412a427e807fbfa2f3e8
ChangeID: 7cb4278f48b0da2009b5b7cf2b2383b12a5660ab
Description:

Fixes CVE-2020-8231
Affects 7.29.0 to 7.71.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../curl/curl/CVE-2020-8231.patch             | 143 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8231.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2020-8231.patch b/meta/recipes-support/curl/curl/CVE-2020-8231.patch
new file mode 100644
index 00000000000..f01e225e754
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2020-8231.patch
@@ -0,0 +1,143 @@
+From 3c9e021f86872baae412a427e807fbfa2f3e8a22 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 16 Aug 2020 11:34:35 +0200
+Subject: [PATCH] Curl_easy: remember last connection by id, not by pointer
+
+CVE-2020-8231
+
+Bug: https://curl.haxx.se/docs/CVE-2020-8231.html
+
+Reported-by: Marc Aldorasi
+Closes #5824
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3c9e021f86872baae412a427e807fbfa2f3e8]
+CVE: CVE-2020-8231
+Affects: 7.20.0 to 7.71.1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/connect.c | 19 ++++++++++---------
+ lib/easy.c    |  3 +--
+ lib/multi.c   |  9 +++++----
+ lib/url.c     |  2 +-
+ lib/urldata.h |  2 +-
+ 5 files changed, 18 insertions(+), 17 deletions(-)
+
+Index: curl-7.69.1/lib/connect.c
+===================================================================
+--- curl-7.69.1.orig/lib/connect.c
++++ curl-7.69.1/lib/connect.c
+@@ -1356,15 +1356,15 @@ CURLcode Curl_connecthost(struct connect
+ }
+ 
+ struct connfind {
+-  struct connectdata *tofind;
+-  bool found;
++  long id_tofind;
++  struct connectdata *found;
+ };
+ 
+ static int conn_is_conn(struct connectdata *conn, void *param)
+ {
+   struct connfind *f = (struct connfind *)param;
+-  if(conn == f->tofind) {
+-    f->found = TRUE;
++  if(conn->connection_id == f->id_tofind) {
++    f->found = conn;
+     return 1;
+   }
+   return 0;
+@@ -1386,21 +1386,22 @@ curl_socket_t Curl_getconnectinfo(struct
+    * - that is associated with a multi handle, and whose connection
+    *   was detached with CURLOPT_CONNECT_ONLY
+    */
+-  if(data->state.lastconnect && (data->multi_easy || data->multi)) {
+-    struct connectdata *c = data->state.lastconnect;
++  if((data->state.lastconnect_id != -1) && (data->multi_easy || data->multi)) {
++    struct connectdata *c;
+     struct connfind find;
+-    find.tofind = data->state.lastconnect;
+-    find.found = FALSE;
++    find.id_tofind = data->state.lastconnect_id;
++    find.found = NULL;
+ 
+     Curl_conncache_foreach(data, data->multi_easy?
+                            &data->multi_easy->conn_cache:
+                            &data->multi->conn_cache, &find, conn_is_conn);
+ 
+     if(!find.found) {
+-      data->state.lastconnect = NULL;
++      data->state.lastconnect_id = -1;
+       return CURL_SOCKET_BAD;
+     }
+ 
++    c = find.found;
+     if(connp) {
+       /* only store this if the caller cares for it */
+       *connp = c;
+Index: curl-7.69.1/lib/easy.c
+===================================================================
+--- curl-7.69.1.orig/lib/easy.c
++++ curl-7.69.1/lib/easy.c
+@@ -831,8 +831,7 @@ struct Curl_easy *curl_easy_duphandle(st
+ 
+   /* the connection cache is setup on demand */
+   outcurl->state.conn_cache = NULL;
+-
+-  outcurl->state.lastconnect = NULL;
++  outcurl->state.lastconnect_id = -1;
+ 
+   outcurl->progress.flags    = data->progress.flags;
+   outcurl->progress.callback = data->progress.callback;
+Index: curl-7.69.1/lib/multi.c
+===================================================================
+--- curl-7.69.1.orig/lib/multi.c
++++ curl-7.69.1/lib/multi.c
+@@ -454,6 +454,7 @@ CURLMcode curl_multi_add_handle(struct C
+     data->state.conn_cache = &data->share->conn_cache;
+   else
+     data->state.conn_cache = &multi->conn_cache;
++  data->state.lastconnect_id = -1;
+ 
+ #ifdef USE_LIBPSL
+   /* Do the same for PSL. */
+@@ -669,11 +670,11 @@ static CURLcode multi_done(struct Curl_e
+     CONN_UNLOCK(data);
+     if(Curl_conncache_return_conn(data, conn)) {
+       /* remember the most recently used connection */
+-      data->state.lastconnect = conn;
++      data->state.lastconnect_id = conn->connection_id;
+       infof(data, "%s\n", buffer);
+     }
+     else
+-      data->state.lastconnect = NULL;
++      data->state.lastconnect_id = -1;
+   }
+ 
+   Curl_free_request_state(data);
+Index: curl-7.69.1/lib/url.c
+===================================================================
+--- curl-7.69.1.orig/lib/url.c
++++ curl-7.69.1/lib/url.c
+@@ -618,7 +618,7 @@ CURLcode Curl_open(struct Curl_easy **cu
+       Curl_initinfo(data);
+ 
+       /* most recent connection is not yet defined */
+-      data->state.lastconnect = NULL;
++      data->state.lastconnect_id = -1;
+ 
+       data->progress.flags |= PGRS_HIDE;
+       data->state.current_speed = -1; /* init to negative == impossible */
+Index: curl-7.69.1/lib/urldata.h
+===================================================================
+--- curl-7.69.1.orig/lib/urldata.h
++++ curl-7.69.1/lib/urldata.h
+@@ -1332,7 +1332,7 @@ struct UrlState {
+   /* buffers to store authentication data in, as parsed from input options */
+   struct curltime keeps_speed; /* for the progress meter really */
+ 
+-  struct connectdata *lastconnect; /* The last connection, NULL if undefined */
++  long lastconnect_id; /* The last connection, -1 if undefined */
+ 
+   char *headerbuff; /* allocated buffer to store headers in */
+   size_t headersize;   /* size of the allocation */
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index c0db01ac5d0..6dc2e4132e4 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2020-8284.patch \
            file://CVE-2020-8285.patch \
            file://CVE-2020-8286.patch \
+           file://CVE-2020-8231.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.17.1

