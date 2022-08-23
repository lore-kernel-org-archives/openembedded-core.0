Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B565C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:35:58 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.4503.1661294157325201003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DRzXWToo;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 12so13469504pga.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=MubsxW21W+oaxASKVmIz3bNzQ1USNH1fPmONVFtS7y0=;
        b=DRzXWToojLoXyroVISXfKJv31Nrq9S4A0wNuJvFg7vheBN15v17hfZ7Et4n8UTH7fw
         q152TWohNnE9EVuLrWsApWfDq233QwEOZs6mcsUcDGGSqtaC6AePmNrK+pLF0Swy4iu2
         IfvbzvC4LGZli0tIo8T2QSDLBG9lA82ItOjLn9MnTcwoJcuo3hJEgNcE8Ugl4J5IBifR
         lXY8hxD5nPCaW38YYJ2WvnQ6fWTDhSeRvn9uA6ZlSoVvZkQw8Tm09obm4EwPYT7cfC2J
         bd7+IH5dtSs65vT+6U/ERvJjqV9WKUVoCWTXqVugbszpSUzkl5wuGF9zPCc9XpIQhHei
         8tTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=MubsxW21W+oaxASKVmIz3bNzQ1USNH1fPmONVFtS7y0=;
        b=MH82m+wl7MwoKRCGpXTxeeiiB+DW9MBz6e5z+gkezUw2RtpA24r9aGC/twdET1G6GN
         HyW3gMjOgcTPany4fmDaLAQG5xWyBdH582geDnHEwzW4xMguulPM9T5BYCTfRfdg62sn
         ve7g1jpweO3wF+Zp1GGefcOc5cHc7lwY/ju0kmB+mKPzzD37V81oXmLyVqOXPfp2E+vK
         ycgUvEpUgmWKHLOC+o1XtBafgTt4K+TAQAaoP7txcYCNquh5ZNkHOSwiVgbgOyRSVs0m
         d27HKbzckD6Xp5RRquMeZXv5rFKXdDDfb1MszbYT9ODp9/S6lVJRisuUkb3Vxxtr8Ofh
         DdMA==
X-Gm-Message-State: ACgBeo3e9io8WYh3kl5azK1bx/8nMpd976HTCeKx8ej/rJRCaioY7IaL
	JGi58SnBA2cjqZYhdKCDiC7u3lS1JAZEPNHG
X-Google-Smtp-Source: 
 AA6agR59H1r9+TBIm1ZoDjkCQ/59zhg4CwAVYEIsVhaaazsDzuwSkszxX8YY4Vln27qx7PwabcMiRw==
X-Received: by 2002:a65:57c9:0:b0:42a:ca53:741e with SMTP id
 q9-20020a6557c9000000b0042aca53741emr6759613pgr.168.1661294156091;
        Tue, 23 Aug 2022 15:35:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.35.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:35:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/28] connman: Backports for security fixes
Date: Tue, 23 Aug 2022 12:35:15 -1000
Message-Id: 
 <ea0d6f29d65889adc1d1080c5cd0cff4ae584900.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:35:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169735

From: Khem Raj <raj.khem@gmail.com>

Fixes
CVE: CVE-2022-32292, CVE-2022-32293

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4b3caa1541d69826c14e010ce3ac1a1ca34f3c62)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../connman/connman/CVE-2022-32292.patch      |  37 ++++
 .../connman/connman/CVE-2022-32293_p1.patch   | 141 ++++++++++++++
 .../connman/connman/CVE-2022-32293_p2.patch   | 174 ++++++++++++++++++
 .../connman/connman_1.41.bb                   |   3 +
 4 files changed, 355 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32293_p1.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32293_p2.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
new file mode 100644
index 0000000000..182c5ca29c
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
@@ -0,0 +1,37 @@
+From d1a5ede5d255bde8ef707f8441b997563b9312bd Mon Sep 17 00:00:00 2001
+From: Nathan Crandall <ncrandall@tesla.com>
+Date: Tue, 12 Jul 2022 08:56:34 +0200
+Subject: gweb: Fix OOB write in received_data()
+
+There is a mismatch of handling binary vs. C-string data with memchr
+and strlen, resulting in pos, count, and bytes_read to become out of
+sync and result in a heap overflow.  Instead, do not treat the buffer
+as an ASCII C-string. We calculate the count based on the return value
+of memchr, instead of strlen.
+
+Fixes: CVE-2022-32292
+
+CVE: CVE-2022-32292
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d1a5ede5d255bde8ef707f8441b997563b9312bd]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gweb/gweb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gweb/gweb.c b/gweb/gweb.c
+index 12fcb1d8..13c6c5f2 100644
+--- a/gweb/gweb.c
++++ b/gweb/gweb.c
+@@ -918,7 +918,7 @@ static gboolean received_data(GIOChannel *channel, GIOCondition cond,
+ 		}
+ 
+ 		*pos = '\0';
+-		count = strlen((char *) ptr);
++		count = pos - ptr;
+ 		if (count > 0 && ptr[count - 1] == '\r') {
+ 			ptr[--count] = '\0';
+ 			bytes_read--;
+-- 
+cgit 
+
diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p1.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p1.patch
new file mode 100644
index 0000000000..b280203594
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p1.patch
@@ -0,0 +1,141 @@
+From 72343929836de80727a27d6744c869dff045757c Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@monom.org>
+Date: Tue, 5 Jul 2022 08:32:12 +0200
+Subject: wispr: Add reference counter to portal context
+
+Track the connman_wispr_portal_context live time via a
+refcounter. This only adds the infrastructure to do proper reference
+counting.
+
+Fixes: CVE-2022-32293
+CVE: CVE-2022-32293
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=416bfaff988882c553c672e5bfc2d4f648d29e8a]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/wispr.c | 52 ++++++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 42 insertions(+), 10 deletions(-)
+
+diff --git a/src/wispr.c b/src/wispr.c
+index a07896ca..bde7e63b 100644
+--- a/src/wispr.c
++++ b/src/wispr.c
+@@ -56,6 +56,7 @@ struct wispr_route {
+ };
+ 
+ struct connman_wispr_portal_context {
++	int refcount;
+ 	struct connman_service *service;
+ 	enum connman_ipconfig_type type;
+ 	struct connman_wispr_portal *wispr_portal;
+@@ -97,6 +98,11 @@ static char *online_check_ipv4_url = NULL;
+ static char *online_check_ipv6_url = NULL;
+ static bool enable_online_to_ready_transition = false;
+ 
++#define wispr_portal_context_ref(wp_context) \
++	wispr_portal_context_ref_debug(wp_context, __FILE__, __LINE__, __func__)
++#define wispr_portal_context_unref(wp_context) \
++	wispr_portal_context_unref_debug(wp_context, __FILE__, __LINE__, __func__)
++
+ static void connman_wispr_message_init(struct connman_wispr_message *msg)
+ {
+ 	DBG("");
+@@ -162,9 +168,6 @@ static void free_connman_wispr_portal_context(
+ {
+ 	DBG("context %p", wp_context);
+ 
+-	if (!wp_context)
+-		return;
+-
+ 	if (wp_context->wispr_portal) {
+ 		if (wp_context->wispr_portal->ipv4_context == wp_context)
+ 			wp_context->wispr_portal->ipv4_context = NULL;
+@@ -201,9 +204,38 @@ static void free_connman_wispr_portal_context(
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
+@@ -215,8 +247,8 @@ static void free_connman_wispr_portal(gpointer data)
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
+@@ -452,7 +484,7 @@ static void portal_manage_status(GWebResult *result,
+ 		connman_info("Client-Timezone: %s", str);
+ 
+ 	if (!enable_online_to_ready_transition)
+-		free_connman_wispr_portal_context(wp_context);
++		wispr_portal_context_unref(wp_context);
+ 
+ 	__connman_service_ipconfig_indicate_state(service,
+ 					CONNMAN_SERVICE_STATE_ONLINE, type);
+@@ -616,7 +648,7 @@ static void wispr_portal_request_wispr_login(struct connman_service *service,
+ 				return;
+ 		}
+ 
+-		free_connman_wispr_portal_context(wp_context);
++		wispr_portal_context_unref(wp_context);
+ 		return;
+ 	}
+ 
+@@ -952,7 +984,7 @@ static int wispr_portal_detect(struct connman_wispr_portal_context *wp_context)
+ 
+ 		if (wp_context->token == 0) {
+ 			err = -EINVAL;
+-			free_connman_wispr_portal_context(wp_context);
++			wispr_portal_context_unref(wp_context);
+ 		}
+ 	} else if (wp_context->timeout == 0) {
+ 		wp_context->timeout = g_idle_add(no_proxy_callback, wp_context);
+@@ -1001,7 +1033,7 @@ int __connman_wispr_start(struct connman_service *service,
+ 
+ 	/* If there is already an existing context, we wipe it */
+ 	if (wp_context)
+-		free_connman_wispr_portal_context(wp_context);
++		wispr_portal_context_unref(wp_context);
+ 
+ 	wp_context = create_wispr_portal_context();
+ 	if (!wp_context)
+-- 
+cgit 
+
diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p2.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p2.patch
new file mode 100644
index 0000000000..56f8fc82de
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2022-32293_p2.patch
@@ -0,0 +1,174 @@
+From 416bfaff988882c553c672e5bfc2d4f648d29e8a Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@monom.org>
+Date: Tue, 5 Jul 2022 09:11:09 +0200
+Subject: wispr: Update portal context references
+
+Maintain proper portal context references to avoid UAF.
+
+Fixes: CVE-2022-32293
+CVE: CVE-2022-32293
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=72343929836de80727a27d6744c869dff045757c]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/wispr.c | 34 ++++++++++++++++++++++------------
+ 1 file changed, 22 insertions(+), 12 deletions(-)
+
+diff --git a/src/wispr.c b/src/wispr.c
+index bde7e63b..84bed33f 100644
+--- a/src/wispr.c
++++ b/src/wispr.c
+@@ -105,8 +105,6 @@ static bool enable_online_to_ready_transition = false;
+ 
+ static void connman_wispr_message_init(struct connman_wispr_message *msg)
+ {
+-	DBG("");
+-
+ 	msg->has_error = false;
+ 	msg->current_element = NULL;
+ 
+@@ -166,8 +164,6 @@ static void free_wispr_routes(struct connman_wispr_portal_context *wp_context)
+ static void free_connman_wispr_portal_context(
+ 		struct connman_wispr_portal_context *wp_context)
+ {
+-	DBG("context %p", wp_context);
+-
+ 	if (wp_context->wispr_portal) {
+ 		if (wp_context->wispr_portal->ipv4_context == wp_context)
+ 			wp_context->wispr_portal->ipv4_context = NULL;
+@@ -483,9 +479,6 @@ static void portal_manage_status(GWebResult *result,
+ 				&str))
+ 		connman_info("Client-Timezone: %s", str);
+ 
+-	if (!enable_online_to_ready_transition)
+-		wispr_portal_context_unref(wp_context);
+-
+ 	__connman_service_ipconfig_indicate_state(service,
+ 					CONNMAN_SERVICE_STATE_ONLINE, type);
+ 
+@@ -546,14 +539,17 @@ static void wispr_portal_request_portal(
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
+@@ -618,13 +614,15 @@ static void wispr_portal_browser_reply_cb(struct connman_service *service,
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
+@@ -700,11 +698,13 @@ static bool wispr_manage_message(GWebResult *result,
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
+@@ -753,6 +753,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 		if (length > 0) {
+ 			g_web_parser_feed_data(wp_context->wispr_parser,
+ 								chunk, length);
++			wispr_portal_context_unref(wp_context);
+ 			return true;
+ 		}
+ 
+@@ -770,6 +771,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 
+ 	switch (status) {
+ 	case 000:
++		wispr_portal_context_ref(wp_context);
+ 		__connman_agent_request_browser(wp_context->service,
+ 				wispr_portal_browser_reply_cb,
+ 				wp_context->status_url, wp_context);
+@@ -781,11 +783,14 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
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
+ 	case 300:
+@@ -798,6 +803,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 			!g_web_result_get_header(result, "Location",
+ 							&redirect)) {
+ 
++			wispr_portal_context_ref(wp_context);
+ 			__connman_agent_request_browser(wp_context->service,
+ 					wispr_portal_browser_reply_cb,
+ 					wp_context->status_url, wp_context);
+@@ -808,6 +814,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 
+ 		wp_context->redirect_url = g_strdup(redirect);
+ 
++		wispr_portal_context_ref(wp_context);
+ 		wp_context->request_id = g_web_request_get(wp_context->web,
+ 				redirect, wispr_portal_web_result,
+ 				wispr_route_request, wp_context);
+@@ -820,6 +827,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 
+ 		break;
+ 	case 505:
++		wispr_portal_context_ref(wp_context);
+ 		__connman_agent_request_browser(wp_context->service,
+ 				wispr_portal_browser_reply_cb,
+ 				wp_context->status_url, wp_context);
+@@ -832,6 +840,7 @@ static bool wispr_portal_web_result(GWebResult *result, gpointer user_data)
+ 	wp_context->request_id = 0;
+ done:
+ 	wp_context->wispr_msg.message_type = -1;
++	wispr_portal_context_unref(wp_context);
+ 	return false;
+ }
+ 
+@@ -890,6 +899,7 @@ static void proxy_callback(const char *proxy, void *user_data)
+ 					xml_wispr_parser_callback, wp_context);
+ 
+ 	wispr_portal_request_portal(wp_context);
++	wispr_portal_context_unref(wp_context);
+ }
+ 
+ static gboolean no_proxy_callback(gpointer user_data)
+-- 
+cgit 
+
diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/recipes-connectivity/connman/connman_1.41.bb
index 736b78eaeb..79542b2175 100644
--- a/meta/recipes-connectivity/connman/connman_1.41.bb
+++ b/meta/recipes-connectivity/connman/connman_1.41.bb
@@ -5,6 +5,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
            file://connman \
            file://no-version-scripts.patch \
+           file://CVE-2022-32293_p1.patch \
+           file://CVE-2022-32293_p2.patch \
+           file://CVE-2022-32292.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.25.1


