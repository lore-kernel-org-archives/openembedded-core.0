Return-Path: <Rui.Wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6047D3D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 03:20:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x473KZwc007124
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 May 2019 20:20:35 -0700 (PDT)
Received: from pek-lpd-ccm2.wrs.com (128.224.179.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 6 May 2019 20:20:34 -0700
From: Rui Wang <rui.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 May 2019 11:06:15 +0800
Message-ID: <1557198375-4569-1-git-send-email-rui.wang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] dhcp: Revert "dhcp: enable gentle shutdown" and reset handler
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
X-List-Received-Date: Tue, 07 May 2019 03:20:34 -0000
Content-Type: text/plain

This reverts commit 4653fdd4b4cf13543e32fbcf09e50f60c1719a34

This patch is used to solve the problem in which dhcpd can not
be killed by SIGINT and SIGTERM. But it seems not good to rely
on ENABLE_GENTLE_SHUTDOWN, which is an "undesireable feature"
and will release its address after receive both signal, accoring
to the comment in "includes/site.h". Then there is no difference
between "dhclient -x" and "dhclient -r". We can find following
call trace from source code:

main() -> dhcp_context_create() -> isc_app_ctxstart()
-> isc__app_ctxstart()

The root cause is that exit_action() is registered as the signal
handler for SIGTERM and SIGINT, which do-nothing as the comment says.

To fix this problem, we could simply set the default action for
these two signals if ENABLE_GENTLE_SHUTDOWN is not set.

Signed-off-by: Rui Wang <rui.wang@windriver.com>
---
 ...et-default-handler-for-SIGTERM-and-SIGINT.patch | 63 ++++++++++++++++++++++
 .../dhcp/0006-site.h-enable-gentle-shutdown.patch  | 27 ----------
 meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb       |  2 +-
 3 files changed, 64 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-dhcp-set-default-handler-for-SIGTERM-and-SIGINT.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-dhcp-set-default-handler-for-SIGTERM-and-SIGINT.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-dhcp-set-default-handler-for-SIGTERM-and-SIGINT.patch
new file mode 100644
index 0000000..d5c9e34
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-dhcp-set-default-handler-for-SIGTERM-and-SIGINT.patch
@@ -0,0 +1,63 @@
+From eaa74a4fd8ebcc031c63a8a39d20cd1ffe0eaf4f Mon Sep 17 00:00:00 2001
+From: Rui Wang <rui.wang@windriver.com>
+Date: Tue, 7 May 2019 10:41:20 +0800
+Subject: [PATCH] dhcp: set default handler for SIGTERM and SIGINT
+
+dhcp uses function in bind to init it's state, which will block
+signal SIGTERM and SIGINT by default. This causes dhclient not
+able to be killed by those two signals if gentle-shutdown is
+disabled. So reset their signal handler to default in such
+situation.
+
+Signed-off-by: Rui Wang <rui.wang@windriver.com>
+---
+ client/dhclient.c | 3 +++
+ relay/dhcrelay.c  | 3 +++
+ server/dhcpd.c    | 3 +++
+ 3 files changed, 9 insertions(+)
+
+diff --git a/client/dhclient.c b/client/dhclient.c
+index 825ab00..159cf39 100644
+--- a/client/dhclient.c
++++ b/client/dhclient.c
+@@ -971,6 +971,9 @@ main(int argc, char **argv) {
+         /* install signal handlers */
+ 	signal(SIGINT, dhcp_signal_handler);   /* control-c */
+ 	signal(SIGTERM, dhcp_signal_handler);  /* kill */
++#else
++        signal(SIGINT, SIG_DFL);
++        signal(SIGTERM, SIG_DFL);
+ #endif
+ 
+ 	/* If we're not supposed to wait before getting the address,
+diff --git a/relay/dhcrelay.c b/relay/dhcrelay.c
+index d8caaaf..ec22385 100644
+--- a/relay/dhcrelay.c
++++ b/relay/dhcrelay.c
+@@ -814,6 +814,9 @@ main(int argc, char **argv) {
+         /* install signal handlers */
+ 	signal(SIGINT, dhcp_signal_handler);   /* control-c */
+ 	signal(SIGTERM, dhcp_signal_handler);  /* kill */
++#else
++        signal(SIGINT, SIG_DFL);
++        signal(SIGTERM, SIG_DFL);
+ #endif
+ 
+ 	/* Start dispatching packets and timeouts... */
+diff --git a/server/dhcpd.c b/server/dhcpd.c
+index 55ffae7..f5aced3 100644
+--- a/server/dhcpd.c
++++ b/server/dhcpd.c
+@@ -1052,6 +1052,9 @@ main(int argc, char **argv) {
+         /* install signal handlers */
+ 	signal(SIGINT, dhcp_signal_handler);   /* control-c */
+ 	signal(SIGTERM, dhcp_signal_handler);  /* kill */
++#else
++        signal(SIGINT, SIG_DFL);
++        signal(SIGTERM, SIG_DFL);
+ #endif
+ 
+ 	/* Log that we are about to start working */
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch b/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
deleted file mode 100644
index 6ef70cc..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 01641d146e4e6bea954e4a4ee1f6230b822665b4 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 15 Aug 2017 15:37:49 +0800
-Subject: [PATCH 06/11] site.h: enable gentle shutdown
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Rebase to 4.3.6
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- includes/site.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: dhcp-4.4.1/includes/site.h
-===================================================================
---- dhcp-4.4.1.orig/includes/site.h
-+++ dhcp-4.4.1/includes/site.h
-@@ -295,7 +295,7 @@
-    situations.  We plan to revisit this feature and may
-    make non-backwards compatible changes including the
-    removal of this define.  Use at your own risk.  */
--/* #define ENABLE_GENTLE_SHUTDOWN */
-+#define ENABLE_GENTLE_SHUTDOWN
- 
- /* Include old error codes.  This is provided in case you
-    are building an external program similar to omshell for
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
index e8cc731..da1eeed 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
@@ -5,12 +5,12 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0003-link-with-lcrypto.patch \
             file://0004-Fix-out-of-tree-builds.patch \
             file://0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch \
-            file://0006-site.h-enable-gentle-shutdown.patch \
             file://0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch \
             file://0009-remove-dhclient-script-bash-dependency.patch \
             file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
             file://0013-fixup_use_libbind.patch \
             file://0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch \
+            file://0001-dhcp-set-default-handler-for-SIGTERM-and-SIGINT.patch \
 "
 
 SRC_URI[md5sum] = "18c7f4dcbb0a63df25098216d47b1ede"
-- 
1.8.3.1


