Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB9E75772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 02:39:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8I2dI0N002960
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 19:39:18 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Thu, 17 Sep 2015 19:39:15 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Sep 2015 10:39:05 +0800
Message-ID: <1442543945-4219-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] lttng-tools: sessiond: disable: match app event by name
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
X-List-Received-Date: Fri, 18 Sep 2015 02:39:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Get upstream patch from lttng-tools github:
<https://github.com/lttng/lttng-tools>
<commit:700c5a9d4dc7b552926b8ddcbba91cc13312aba0>,
for solving the filtered tracepoint disabling error.

The use of a simple lookup and match on event name is insufficient
to identify the corresponding ust app event.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...-sessiond-disable-match-app-event-by-name.patch |   58 ++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |    1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch
new file mode 100644
index 0000000..15b629f
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch
@@ -0,0 +1,58 @@
+From 700c5a9d4dc7b552926b8ddcbba91cc13312aba0 Mon Sep 17 00:00:00 2001
+From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
+Date: Wed, 9 Sep 2015 17:08:20 -0400
+Subject: [PATCH] Fix: sessiond: disable: match app event by name
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The use of a simple lookup and match on event name is insufficient
+to identify the corresponding ust app event.
+
+Fixes #914
+
+Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
+Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ src/bin/lttng-sessiond/ust-app.c |   10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/bin/lttng-sessiond/ust-app.c b/src/bin/lttng-sessiond/ust-app.c
+index 4066b06..53a6f93 100644
+--- a/src/bin/lttng-sessiond/ust-app.c
++++ b/src/bin/lttng-sessiond/ust-app.c
+@@ -3873,7 +3873,7 @@ int ust_app_disable_event_glb(struct ltt_ust_session *usess,
+ {
+ 	int ret = 0;
+ 	struct lttng_ht_iter iter, uiter;
+-	struct lttng_ht_node_str *ua_chan_node, *ua_event_node;
++	struct lttng_ht_node_str *ua_chan_node;
+ 	struct ust_app *app;
+ 	struct ust_app_session *ua_sess;
+ 	struct ust_app_channel *ua_chan;
+@@ -3910,14 +3910,14 @@ int ust_app_disable_event_glb(struct ltt_ust_session *usess,
+ 		}
+ 		ua_chan = caa_container_of(ua_chan_node, struct ust_app_channel, node);
+ 
+-		lttng_ht_lookup(ua_chan->events, (void *)uevent->attr.name, &uiter);
+-		ua_event_node = lttng_ht_iter_get_node_str(&uiter);
+-		if (ua_event_node == NULL) {
++		ua_event = find_ust_app_event(ua_chan->events, uevent->attr.name,
++				uevent->filter, uevent->attr.loglevel,
++				uevent->exclusion);
++		if (ua_event == NULL) {
+ 			DBG2("Event %s not found in channel %s for app pid %d."
+ 					"Skipping", uevent->attr.name, uchan->name, app->pid);
+ 			continue;
+ 		}
+-		ua_event = caa_container_of(ua_event_node, struct ust_app_event, node);
+ 
+ 		ret = disable_ust_app_event(ua_sess, ua_event, app);
+ 		if (ret < 0) {
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
index 6397a98..9ecc2ab 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.6 \
            file://extern-decls.patch \
            file://run-ptest \
            file://lttng-tools-Fix-live-timer-calculation-error.patch \
+           file://0001-Fix-sessiond-disable-match-app-event-by-name.patch \
 	  "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


