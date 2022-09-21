Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F5DC54EE9
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 02:37:49 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.2089.1663727867871156490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5/8NJ+O2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id iw17so4321689plb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=JWbFVIN0bR6f1k25zNmdGNm+bS+q6EmQLFXH/QpgEVo=;
        b=5/8NJ+O2kOOmVB0JScsLwJNt+pmPh/RytZxN1quBv/JmwghCPBuieDDJxx76+eJcey
         zpGMkEK0HR9H3iG6SzG8BAyf8y3d36Y2QD/pl+lt5/sfMcfiCdDlv3bm9AhhbRTrq66Q
         74sGbTkWEMnl4SW5wyz3GdzC04fD3Tga5okhjpt0dNFrDUOUp7UzIp8q/Olb8jl4QaJd
         KlJ/BaVo1CGKtvAors6xIUcfBAbQ04Nwq2/5+n4qOxP86BBO0Mj3Nvrfearx+Jn2bd4I
         uXHQgpWYorTR51NzJVlGPj8GFcRLcIrLMQN20g4Fj8syVb9u/17PMJa4o2A9WIW4WHmk
         NN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JWbFVIN0bR6f1k25zNmdGNm+bS+q6EmQLFXH/QpgEVo=;
        b=MzDB7lg4CaH6gA7ALwDFcT+LXOcVag8JfPVfhZcY7mCyr2e+e4wFktEWGrbiPSvjEn
         f3i0nDORpunpN3Ks4Vv4xZSeyUYuZkYkywULLqAUS7+oJBGt0KGWKXoVMRk07O+OsWe4
         duCksV/3CHsKdRrwYXfa7w2G93oD6fmDmFbhX4ciIn61uKUC3DYVeyFPQWODmI6QUIiw
         myby7FWd8C/0MOr9cHllti3SBaAW8M+DJ6ySF98AIzuavz0NDe8Bcj2/eeoqgzRak+Vq
         8Drc/Xlr3trPDkGxwbapDKd3WQR3kSb21SuxRJf2fLzVU+RNBI5wU6A6lGpQqv1RkRkF
         q44w==
X-Gm-Message-State: ACrzQf2bjUFAyieNnQhsz6Bi2UOVqopXLYS8OxQXJ3MXAjRERYUo8U6P
	xXjLom7lnWNTVmSkkVoKT7pjouUNDQJoATeK
X-Google-Smtp-Source: 
 AMsMyM7GKE1GdQAeILIPW6p48JmcBa1hl6GzHGAlUK+AR7wY2Gs1kTw1+I49bKEFXl3POIpLxa9VYQ==
X-Received: by 2002:a17:90b:3ec7:b0:202:b984:8436 with SMTP id
 rm7-20020a17090b3ec700b00202b9848436mr7143297pjb.4.1663727866865;
        Tue, 20 Sep 2022 19:37:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 207-20020a6215d8000000b00537a6b81bb7sm670154pfv.148.2022.09.20.19.37.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 19:37:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/6] connman: CVE-2022-32293 man-in-the-middle
 attack against a WISPR HTTP
Date: Tue, 20 Sep 2022 16:37:14 -1000
Message-Id: 
 <86334559e3dcf30e07e2a10a58bbe40a2e8cc887.1663727733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663727733.git.steve@sakoman.com>
References: <cover.1663727733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 02:37:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170923

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://git.kernel.org/pub/scm/network/connman/connman.git/
MR: 120508
Type: Security Fix
Disposition: Backport from https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=72343929836de80727a27d6744c869dff045757c && https://git.kernel.org/pub/scm/network/connman/connman.git/commit/src/wispr.c?id=416bfaff988882c553c672e5bfc2d4f648d29e8a
ChangeID: 1583badc6de6bb8a7f63c06749b90b97caab5cdf
Description:
	 CVE-2022-32293 connman: man-in-the-middle attack against a WISPR HTTP.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../connman/connman/CVE-2022-32293.patch      | 266 ++++++++++++++++++
 .../connman/connman_1.37.bb                   |   1 +
 2 files changed, 267 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32293.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-32293.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-32293.patch
new file mode 100644
index 0000000000..83a013981c
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2022-32293.patch
@@ -0,0 +1,266 @@
+From 358a44b1442fae0f82846e10da0708b5c4e1ce27 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Tue, 20 Sep 2022 17:58:19 +0530
+Subject: [PATCH] CVE-2022-32293
+
+CVE: CVE-2022-32293
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=72343929836de80727a27d6744c869dff045757c && https://git.kernel.org/pub/scm/network/connman/connman.git/commit/src/wispr.c?id=416bfaff988882c553c672e5bfc2d4f648d29e8a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/wispr.c | 83 ++++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 63 insertions(+), 20 deletions(-)
+
+diff --git a/src/wispr.c b/src/wispr.c
+index 473c0e0..97e0242 100644
+--- a/src/wispr.c
++++ b/src/wispr.c
+@@ -59,6 +59,7 @@ struct wispr_route {
+ };
+ 
+ struct connman_wispr_portal_context {
++	int refcount;
+ 	struct connman_service *service;
+ 	enum connman_ipconfig_type type;
+ 	struct connman_wispr_portal *wispr_portal;
+@@ -96,10 +97,13 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data);
+ 
+ static GHashTable *wispr_portal_list = NULL;
+ 
++#define wispr_portal_context_ref(wp_context) \
++	wispr_portal_context_ref_debug(wp_context, __FILE__, __LINE__, __func__)
++#define wispr_portal_context_unref(wp_context) \
++	wispr_portal_context_unref_debug(wp_context, __FILE__, __LINE__, __func__)
++
+ static void connman_wispr_message_init(struct connman_wispr_message *msg)
+ {
+-	DBG("");
+-
+ 	msg->has_error = false;
+ 	msg->current_element = NULL;
+ 
+@@ -159,11 +163,6 @@ static void free_wispr_routes(struct connman_wispr_portal_context *wp_context)
+ static void free_connman_wispr_portal_context(
+ 		struct connman_wispr_portal_context *wp_context)
+ {
+-	DBG("context %p", wp_context);
+-
+-	if (!wp_context)
+-		return;
+-
+ 	if (wp_context->wispr_portal) {
+ 		if (wp_context->wispr_portal->ipv4_context == wp_context)
+ 			wp_context->wispr_portal->ipv4_context = NULL;
+@@ -200,9 +199,38 @@ static void free_connman_wispr_portal_context(
+ 	g_free(wp_context);
+ }
+ 
++static struct connman_wispr_portal_context *
++wispr_portal_context_ref_debug(struct connman_wispr_portal_context *wp_context,
++			const char *file, int line, const char *caller)
++{
++	DBG("%p ref %d by %s:%d:%s()", wp_context,
++		wp_context->refcount + 1, file, line, caller);
++
++	__sync_fetch_and_add(&wp_context->refcount, 1);
++
++	return wp_context;
++}
++
++static void wispr_portal_context_unref_debug(
++		struct connman_wispr_portal_context *wp_context,
++		const char *file, int line, const char *caller)
++{
++	if (!wp_context)
++		return;
++
++	DBG("%p ref %d by %s:%d:%s()", wp_context,
++		wp_context->refcount - 1, file, line, caller);
++
++	if (__sync_fetch_and_sub(&wp_context->refcount, 1) != 1)
++		return;
++
++	free_connman_wispr_portal_context(wp_context);
++}
++
+ static struct connman_wispr_portal_context *create_wispr_portal_context(void)
+ {
+-	return g_try_new0(struct connman_wispr_portal_context, 1);
++	return wispr_portal_context_ref(
++		g_new0(struct connman_wispr_portal_context, 1));
+ }
+ 
+ static void free_connman_wispr_portal(gpointer data)
+@@ -214,8 +242,8 @@ static void free_connman_wispr_portal(gpointer data)
+ 	if (!wispr_portal)
+ 		return;
+ 
+-	free_connman_wispr_portal_context(wispr_portal->ipv4_context);
+-	free_connman_wispr_portal_context(wispr_portal->ipv6_context);
++	wispr_portal_context_unref(wispr_portal->ipv4_context);
++	wispr_portal_context_unref(wispr_portal->ipv6_context);
+ 
+ 	g_free(wispr_portal);
+ }
+@@ -450,8 +478,6 @@ static void portal_manage_status(GWebResult *result,
+ 				&str))
+ 		connman_info("Client-Timezone: %s", str);
+ 
+-	free_connman_wispr_portal_context(wp_context);
+-
+ 	__connman_service_ipconfig_indicate_state(service,
+ 					CONNMAN_SERVICE_STATE_ONLINE, type);
+ }
+@@ -509,14 +535,17 @@ static void wispr_portal_request_portal(
+ {
+ 	DBG("");
+ 
++	wispr_portal_context_ref(wp_context);
+ 	wp_context->request_id = g_web_request_get(wp_context->web,
+ 					wp_context->status_url,
+ 					wispr_portal_web_result,
+ 					wispr_route_request,
+ 					wp_context);
+ 
+-	if (wp_context->request_id == 0)
++	if (wp_context->request_id == 0) {
+ 		wispr_portal_error(wp_context);
++		wispr_portal_context_unref(wp_context);
++	}
+ }
+ 
+ static bool wispr_input(const guint8 **data, gsize *length,
+@@ -562,13 +591,15 @@ static void wispr_portal_browser_reply_cb(struct connman_service *service,
+ 		return;
+ 
+ 	if (!authentication_done) {
+-		wispr_portal_error(wp_context);
+ 		free_wispr_routes(wp_context);
++		wispr_portal_error(wp_context);
++		wispr_portal_context_unref(wp_context);
+ 		return;
+ 	}
+ 
+ 	/* Restarting the test */
+ 	__connman_service_wispr_start(service, wp_context->type);
++	wispr_portal_context_unref(wp_context);
+ }
+ 
+ static void wispr_portal_request_wispr_login(struct connman_service *service,
+@@ -592,7 +623,7 @@ static void wispr_portal_request_wispr_login(struct connman_service *service,
+ 				return;
+ 		}
+ 
+-		free_connman_wispr_portal_context(wp_context);
++		wispr_portal_context_unref(wp_context);
+ 		return;
+ 	}
+ 
+@@ -644,11 +675,13 @@ static bool wispr_manage_message(GWebResult *result,
+ 
+ 		wp_context->wispr_result = CONNMAN_WISPR_RESULT_LOGIN;
+ 
++		wispr_portal_context_ref(wp_context);
+ 		if (__connman_agent_request_login_input(wp_context->service,
+ 					wispr_portal_request_wispr_login,
+-					wp_context) != -EINPROGRESS)
++					wp_context) != -EINPROGRESS) {
+ 			wispr_portal_error(wp_context);
+-		else
++			wispr_portal_context_unref(wp_context);
++		} else
+ 			return true;
+ 
+ 		break;
+@@ -697,6 +730,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 		if (length > 0) {
+ 			g_web_parser_feed_data(wp_context->wispr_parser,
+ 								chunk, length);
++			wispr_portal_context_unref(wp_context);
+ 			return true;
+ 		}
+ 
+@@ -714,6 +748,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 
+ 	switch (status) {
+ 	case 000:
++		wispr_portal_context_ref(wp_context);
+ 		__connman_agent_request_browser(wp_context->service,
+ 				wispr_portal_browser_reply_cb,
+ 				wp_context->status_url, wp_context);
+@@ -725,11 +760,14 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 		if (g_web_result_get_header(result, "X-ConnMan-Status",
+ 						&str)) {
+ 			portal_manage_status(result, wp_context);
++			wispr_portal_context_unref(wp_context);
+ 			return false;
+-		} else
++		} else {
++			wispr_portal_context_ref(wp_context);
+ 			__connman_agent_request_browser(wp_context->service,
+ 					wispr_portal_browser_reply_cb,
+ 					wp_context->redirect_url, wp_context);
++		}
+ 
+ 		break;
+ 	case 302:
+@@ -737,6 +775,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 			!g_web_result_get_header(result, "Location",
+ 							&redirect)) {
+ 
++			wispr_portal_context_ref(wp_context);
+ 			__connman_agent_request_browser(wp_context->service,
+ 					wispr_portal_browser_reply_cb,
+ 					wp_context->status_url, wp_context);
+@@ -747,6 +786,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 
+ 		wp_context->redirect_url = g_strdup(redirect);
+ 
++		wispr_portal_context_ref(wp_context);
+ 		wp_context->request_id = g_web_request_get(wp_context->web,
+ 				redirect, wispr_portal_web_result,
+ 				wispr_route_request, wp_context);
+@@ -763,6 +803,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 
+ 		break;
+ 	case 505:
++		wispr_portal_context_ref(wp_context);
+ 		__connman_agent_request_browser(wp_context->service,
+ 				wispr_portal_browser_reply_cb,
+ 				wp_context->status_url, wp_context);
+@@ -775,6 +816,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 	wp_context->request_id = 0;
+ done:
+ 	wp_context->wispr_msg.message_type = -1;
++	wispr_portal_context_unref(wp_context);
+ 	return false;
+ }
+ 
+@@ -809,6 +851,7 @@ static void proxy_callback(const char *proxy, void *user_data)
+ 					xml_wispr_parser_callback, wp_context);
+ 
+ 	wispr_portal_request_portal(wp_context);
++	wispr_portal_context_unref(wp_context);
+ }
+ 
+ static gboolean no_proxy_callback(gpointer user_data)
+@@ -903,7 +946,7 @@ static int wispr_portal_detect(struct connman_wispr_portal_context *wp_context)
+ 
+ 		if (wp_context->token == 0) {
+ 			err = -EINVAL;
+-			free_connman_wispr_portal_context(wp_context);
++			wispr_portal_context_unref(wp_context);
+ 		}
+ 	} else if (wp_context->timeout == 0) {
+ 		wp_context->timeout = g_idle_add(no_proxy_callback, wp_context);
+@@ -952,7 +995,7 @@ int __connman_wispr_start(struct connman_service *service,
+ 
+ 	/* If there is already an existing context, we wipe it */
+ 	if (wp_context)
+-		free_connman_wispr_portal_context(wp_context);
++		wispr_portal_context_unref(wp_context);
+ 
+ 	wp_context = create_wispr_portal_context();
+ 	if (!wp_context)
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
index 4f22c7ad49..73d7f7527e 100644
--- a/meta/recipes-connectivity/connman/connman_1.37.bb
+++ b/meta/recipes-connectivity/connman/connman_1.37.bb
@@ -13,6 +13,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://CVE-2022-23096-7.patch \
             file://CVE-2022-23098.patch \
             file://CVE-2022-32292.patch \
+	     file://CVE-2022-32293.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.25.1


