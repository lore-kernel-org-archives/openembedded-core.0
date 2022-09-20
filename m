Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B61FECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 13:03:28 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.11598.1663679000418401368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 06:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EUzZc9tJ;
 spf=pass (domain: mvista.com, ip: 209.85.214.180,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id b21so2287212plz.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 06:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=v1YX5dg7TSVafBp0WqZ13N1BKnGGpuK4Gh9VHbDQ5v8=;
        b=EUzZc9tJi6klfgJBmQhjhc3m5T4bgTTMlr17VWtTekWeMTie2HblcnBqFuYWyjr0gQ
         ILiTWBZfKuxf7KhIzpACYqlqubCbYRH/Bv1mkm997lTFzPwAeDUtAY1ihImS5ir3QuCG
         KywDJx0MpypMaXRETa+/b3846AvdJ/VuEpd2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=v1YX5dg7TSVafBp0WqZ13N1BKnGGpuK4Gh9VHbDQ5v8=;
        b=N9qFICB6HB1N+jaL7mwgaZGXPeiHO77NKWtztt6FZFj1pr/XWKweYfv2CXt3gM6JtP
         z/ZPVmKBIF9eV6f5/0ioBh6EhIYQqO3CkWC5LK64VjdqdDXT/pOdD25lJrNYC9e8TRpn
         Jnf2hKROlfmLUTXjgGl+v6oKXEy202P9/+d9p3U2tBKgweNCpuTrgfFalthp2a9rzlM5
         aIcmU6Z8dY6ln7Qq5s++zcRuB8QVm54P36mfQCL6n/x9QMFRuTlBXJbBNTcHowF8hQ9J
         kcNQLzgYIwHiR3mjM+yk4luTfTMlzCl20ixQMHaxTIaayFx5caUb2HwITMp4IGjcn9Mh
         /nCA==
X-Gm-Message-State: ACrzQf3vuNdupeaf+AfutAENcvV7FeQa4Kr2RMbokUnR2SUrSbiz/MvL
	cZrfPpnFfsqQckIUD8MkKoqq0c3IU1mlCQ==
X-Google-Smtp-Source: 
 AMsMyM4iyTVssOFr5YZ5HII4pqNCxA+dKKYt5+1okzIqiv8oQpMMJ8bhWXL8N+V7L/R4ORwzMvSD3g==
X-Received: by 2002:a17:90b:38ca:b0:202:fb75:7dc3 with SMTP id
 nn10-20020a17090b38ca00b00202fb757dc3mr3861007pjb.192.1663678998758;
        Tue, 20 Sep 2022 06:03:18 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.136])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a17090a7e9000b002006f8e7688sm1380754pjl.32.2022.09.20.06.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 06:03:17 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Tue, 20 Sep 2022 18:33:11 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] connman: CVE-2022-32293 man-in-the-middle attack
 against a WISPR HTTP
Date: Tue, 20 Sep 2022 18:33:10 +0530
Message-Id: <20220920130310.32104-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 13:03:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170900

Source: https://git.kernel.org/pub/scm/network/connman/connman.git/
MR: 120508
Type: Security Fix
Disposition: Backport from https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=72343929836de80727a27d6744c869dff045757c && https://git.kernel.org/pub/scm/network/connman/connman.git/commit/src/wispr.c?id=416bfaff988882c553c672e5bfc2d4f648d29e8a
ChangeID: 1583badc6de6bb8a7f63c06749b90b97caab5cdf
Description:
	 CVE-2022-32293 connman: man-in-the-middle attack against a WISPR HTTP.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


