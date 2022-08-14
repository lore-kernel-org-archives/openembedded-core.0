Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AB0C25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 23:43:17 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.10846.1660520588853363813
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 16:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=StVm//zL;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id ha11so5637490pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 16:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=hrGid/oQChLiEpmvWsSNgi2nKUVZOsIbNRVcOlkJ88w=;
        b=StVm//zLSrVLLRBvfuwRl9lWE95SsIpNLpnB4v/ZoJN4UjTta9BIrog71H2/K160uS
         lOi5+lhijA4evfh2TiOUP0f1PRSioSsGjNLheGIsG7G5JskBmKtymm9c3XHjAemY6j+k
         ay1xHq9u/MbXKp+2+ptGWnxi94EYZeTvT2AnuS/vl2EpYWdUP7DONEHi8YU1RvOXNmuD
         5E5FvFdqrqijY7vTaU1JPaRECOfIKVNJlQXsFhFz6pqa9w83MS+wO0e7fKq5f6tpC8aG
         heJ8VXew35RtpjfbAR+eICl3N6qn2kk/uqq4VrBBWCfTHma1yDquByTQDmn1wU8hIBBY
         J5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=hrGid/oQChLiEpmvWsSNgi2nKUVZOsIbNRVcOlkJ88w=;
        b=sLLMlP3XYfQf61xsHayH5n6jAgqvbFCORQJrInP4BB7E1On9OFvF+078lHojh9+abv
         GB92Ew3SJRvew8HOr1nPv8H+Yed7qU+ya14WegkFyX8l7ljfu7UImbHW4Xrw11xpoYRC
         NAW6V2Mqg+xAezizvM2W6mf3rRLAzIHk23UbwpyDk9zSJQATFkJV5WxbuYc6sR9bSV2U
         wTe2xMls5w/awZl+PW2gH06ETQ+SWSbb8X3pCpIxe0E5qunjZFc3Kn3BAYaA7jjm7HEn
         mFheHJgvcctPe1SEr2szjtn7egOwun1PNddOgB0aeVS5Sz95mvJ7ZFtieYypwN4wDsc7
         S5eg==
X-Gm-Message-State: ACgBeo2DNjkh/9qw2DF23n8HDnrDvMrl+Ze8AsDsW+FgOXn25lzPd3Au
	4verofRHCN8KpEAk11LFVKXJgEPnY6CZvg==
X-Google-Smtp-Source: 
 AA6agR5usisS/xk06mNd7+E2OVqcdBzFw6M1PQpfjXiKk8YDxKcvohJ4J+MhfADiedR+q37Kj+VLQg==
X-Received: by 2002:a17:902:ec90:b0:16e:d8d8:c2db with SMTP id
 x16-20020a170902ec9000b0016ed8d8c2dbmr13948539plg.69.1660520587694;
        Sun, 14 Aug 2022 16:43:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 q16-20020aa79610000000b00528669a770esm5722589pfg.90.2022.08.14.16.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 16:43:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 4/8] connman: Backports for security fixes
Date: Sun, 14 Aug 2022 16:43:04 -0700
Message-Id: <20220814234304.1345328-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 23:43:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169338

Fixes
CVE: CVE-2022-32292, CVE-2022-32293

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix the order of patch apply

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
index 00000000000..182c5ca29c2
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
index 00000000000..b2802035943
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
index 00000000000..56f8fc82de9
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
index 736b78eaebb..79542b2175d 100644
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
2.37.2


