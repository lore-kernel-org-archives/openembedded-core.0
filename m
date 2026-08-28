Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9741FC61DF1
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:34 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2996.1787945913488719261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nZlSkABc;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590dde14so13191235e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945912; x=1788550712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1IlOyFXNUsxuZpQwMW/yxF9pcm6FjABwmbu6M3o/zoI=;
        b=nZlSkABcQZvfSpWo4ffAy4T+JumWk+ag2eE35wnaNRlvoSGUcBCPvDHu2Ix++1ea+n
         CxVA9gJed454jBe251O3HTf/9gGFZjEFwDD0NchCm/eGWSusIlmKndW3IQg71/aj+Bhm
         zzrf10GcDVnJTX+4RNNqfM0DdFWxX5DA8FJNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945912; x=1788550712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1IlOyFXNUsxuZpQwMW/yxF9pcm6FjABwmbu6M3o/zoI=;
        b=rkbBSf2gpCtZbIjEnRRpJynw/3tepJR8mQspO4ZPZ1rOnFAv+/Y34GtOQee3Tr+ONJ
         56GQ1wzZM7/EYNx/uCzxPnF7Adbq9MGJ7/LI4SK5orrwEIkRsBJuuGUS2/j8MyFY6kOE
         0Q6YbRSooWxfZHEAh/cC15tIJ0Vyn4eFOJ0Mi4AbBhWryToZZeKm6l9jW49Im6NUN4Lf
         J7jiF800sGIvSfL7GVL0rCfme6VUjoCV5I13z9M/AqJ+hWkm1IVRl8UD+PK6yWYfdCLL
         hZz8qFnPgbyW2s00/tQ+0SsMp2Xb7JXI/6rOC7nPI7ikYeaOmVpXOEmNDnMaQXcRyA/5
         T9Uw==
X-Gm-Message-State: AFuF++mQd+XX4ZsEfhU9hqw8RjSWHPsAJyXgE3RSMdhvNMhv+BrNjEEn
	KOBwfTkRwdg0lv3DWwFjHsbYSmio5xkVEIY2kYfMpn2jTChYAQQAEuDYt4ScgTyD3nqRn5axZ9n
	9EKEqusg=
X-Gm-Gg: AR+sD10zC6SxPnwp2NWGe4kZsgbq0rRcl7kpiMkQ7aAsbbztwx5SqtmeJRxlyaS5Qjr
	rfYEfvLj60A2vxkcbzCi3mN9sNn3u8GUw4HrfZxnasfGIzPU/n6xvw+rUpu1J62hJ09qLNW+tC9
	jgn67s6iAa5ldYo4s8X1Q0D+U23FqoI3pmU5sQJAgpYLvC3K55W/baQd5f7OuicoB43XsAm3dtJ
	RzS7zncpzY/76938lhSyCoTbYQv9KkFEeaPt86VQCwaehWUHf5yIDCOhsd/xQcChmxVb59y0Qz2
	OmiYm9bpQqcpm6r+I0DyZ4i5I6iGSxJpP9iv4GDiKYDA+Hu5ZtoLjuGJNwPEJuOrd2uYHhFb0az
	ohnkWpOL8kNbXUEFa6PkEG+c93Zekr1Dm7oA/5kRHQDZGq+nDplHVuaTOcKIehBpuQ2BWC8JNt0
	aOePIBM/3n+egOTVHIMkGg9re8M93EbIrPxaQTbX0sl14OK/OYvXVcMIJWfGr/3Qsg9ofKvTSFb
	0Q94vaEnxwzPZtPFX5ayCP3haU0SrYtV5z7S/1IrhSKu6IxWcU0IcGhD8G+/PPK
X-Received: by 2002:a05:600c:1d1d:b0:49a:5b88:f551 with SMTP id 5b1f17b1804b1-49b91c27719mr127188425e9.6.1787945911605;
        Fri, 28 Aug 2026 12:38:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 48/56] curl: fix CVE-2026-8286
Date: Fri, 28 Aug 2026 21:35:58 +0200
Message-ID: <6d16b6a4115010b26fd67571c6c138091074819d.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244609

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream curl security fix backport for
CVE-2026-8286. The upstream fix commit is referenced in [1],
and the public curl advisory is referenced in [2]. The backported
commit link is also recorded in the embedded patch header.

[1] https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319ad16
[2] https://curl.se/docs/CVE-2026-8286.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-8286.patch             | 81 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8286.patch b/meta/recipes-support/curl/curl/CVE-2026-8286.patch
new file mode 100644
index 00000000000..6fa42887a1c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8286.patch
@@ -0,0 +1,81 @@
+From 90ff17f6bfe1d358c26fa25ab457bc420a9847b2 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 7 May 2026 10:30:07 +0200
+Subject: [PATCH] url: fix connection reuse for starttls protocols
+
+When a connection is tested for reuse in a transfer that *may* upgrade
+to TLS (commonly via STARTTLS), the SSL configuration must match the
+existing connection.
+
+Reported-by: Andrew Nesbit
+Closes #21522
+
+CVE: CVE-2026-8286
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319ad16]
+
+Backport Changes:
+- Wrynose applies upstream commit [1] before this patch. That commit
+  adds req_tls to struct url_conn_match and initializes it in
+  url_attach_existing().
+- This backport replaces that local req_tls state with the upstream
+  may_tls/require_tls split and updates url_match_ssl_use(),
+  url_match_ssl_config(), and url_attach_existing() to preserve the
+  upstream STARTTLS reuse behavior on the Wrynose 8.19.0 codebase.
+
+[1] https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a66e7d865
+
+(cherry picked from commit a86efdd7ca5433de9231e650f18247de8319ad16)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 4ebff50ef1..6c1375f8e3 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -745,7 +745,11 @@ struct url_conn_match {
+   BIT(want_proxy_ntlm_http);
+   BIT(want_nego_http);
+   BIT(want_proxy_nego_http);
+-  BIT(req_tls); /* require TLS use from a clear-text start */
++  BIT(may_tls); /* May upgrade clear-text connection to TLS, can only reuse
++                 * connections that have matching TLS configuration.
++                 * Always TRUE if `req_tls` is TRUE. */
++  BIT(require_tls); /* Requires TLS use from a clear-text start, can only
++                 * reuse connections that have TLS. */
+   BIT(wait_pipe);
+   BIT(force_reuse);
+   BIT(seen_pending_conn);
+@@ -897,7 +901,7 @@ static bool url_match_ssl_use(struct connectdata *conn,
+        (get_protocol_family(conn->scheme) != m->needle->scheme->protocol))
+       return FALSE;
+   }
+-  else if(m->req_tls)
++  else if(m->require_tls)
+     /* a clear-text STARTTLS protocol with required TLS */
+     return FALSE;
+   return TRUE;
+@@ -1090,8 +1094,8 @@ static bool url_match_destination(struct connectdata *conn,
+ static bool url_match_ssl_config(struct connectdata *conn,
+                                  struct url_conn_match *m)
+ {
+-  /* If talking TLS, conn needs to use the same SSL options. */
+-  if((m->needle->scheme->flags & PROTOPT_SSL) &&
++  /* If talking/upgrading to TLS, conn needs to use the same SSL options. */
++  if(((m->needle->scheme->flags & PROTOPT_SSL) || m->may_tls) &&
+      !Curl_ssl_conn_config_match(m->data, conn, FALSE)) {
+     DEBUGF(infof(m->data, "Connection #%" FMT_OFF_T
+                  " has different SSL parameters, cannot reuse",
+@@ -1364,7 +1368,8 @@ static bool url_attach_existing(struct Curl_easy *data,
+     (needle->scheme->protocol & PROTO_FAMILY_HTTP);
+ #endif
+ #endif
+-  match.req_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
++  match.require_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
++  match.may_tls = data->set.use_ssl > CURLUSESSL_NONE;
+ 
+   /* Find a connection in the pool that matches what "data + needle"
+    * requires. If a suitable candidate is found, it is attached to "data". */
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 5ba881bd762..ae57776eab8 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://CVE-2026-6429.patch \
     file://CVE-2026-7168.patch \
     file://CVE-2026-4873.patch \
+    file://CVE-2026-8286.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

