Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C3F9660D40
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 07:11:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,408,1574092800"; d="scan'208";a="82948579"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Feb 2020 15:01:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 38CEB50A998F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 14:51:59 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 6 Feb 2020 15:01:23 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Feb 2020 15:01:32 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Feb 2020 06:53:22 -0800
Message-ID: <1581000802-43030-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 38CEB50A998F.A6BC8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] dhcp: upgrade 4.4.1 -> 4.4.2
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
X-List-Received-Date: Thu, 06 Feb 2020 07:11:17 -0000
Content-Type: text/plain

0001-Fix-a-NSUPDATE-compiling-issue.patch
0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch
Removed since they are included in 4.4.2.

refresh the following patch:
0004-Fix-out-of-tree-builds.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../0001-Fix-a-NSUPDATE-compiling-issue.patch | 68 ----------------
 ...ludes-of-new-BIND9-compatibility-hea.patch | 79 -------------------
 .../dhcp/0004-Fix-out-of-tree-builds.patch    |  6 +-
 .../dhcp/{dhcp_4.4.1.bb => dhcp_4.4.2.bb}     |  6 +-
 4 files changed, 6 insertions(+), 153 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-Fix-a-NSUPDATE-compiling-issue.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch
 rename meta/recipes-connectivity/dhcp/{dhcp_4.4.1.bb => dhcp_4.4.2.bb} (74%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-Fix-a-NSUPDATE-compiling-issue.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-Fix-a-NSUPDATE-compiling-issue.patch
deleted file mode 100644
index f12a112fcf..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0001-Fix-a-NSUPDATE-compiling-issue.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From a59cb98a473caa2afd64d7ae368480b6e9f91b3f Mon Sep 17 00:00:00 2001
-From: Ming Liu <liu.ming50@gmail.com>
-Date: Tue, 14 May 2019 11:07:15 +0200
-Subject: [PATCH] Fix a NSUPDATE compiling issue
-
-Upstream-Status: Pending [Patch sent to: https://gitlab.isc.org/isc-projects/dhcp/issues/16]
-
-A following error was observed when NSUPDATE is not defined:
-| omapip/isclib.c: In function 'dns_client_init':
-| omapip/isclib.c:356:18: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'dnsclient'
-|   if (dhcp_gbl_ctx.dnsclient == NULL) {
-|                   ^
-| omapip/isclib.c:363:24: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'dnsclient'
-|            &dhcp_gbl_ctx.dnsclient,
-|                         ^
-| omapip/isclib.c:364:24: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'use_local4'
-|            (dhcp_gbl_ctx.use_local4 ?
-|                         ^
-| omapip/isclib.c:365:25: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'local4_sockaddr'
-|             &dhcp_gbl_ctx.local4_sockaddr
-|                          ^
-| omapip/isclib.c:367:24: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'use_local6'
-|            (dhcp_gbl_ctx.use_local6 ?
-|                         ^
-| omapip/isclib.c:368:25: error: 'dhcp_context_t {aka struct dhcp_context}' has no member named 'local6_sockaddr'
-|             &dhcp_gbl_ctx.local6_sockaddr
-
-Fix it by adding NSUPDATE conditional checking.
-
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
----
- includes/omapip/isclib.h | 2 ++
- omapip/isclib.c          | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/includes/omapip/isclib.h b/includes/omapip/isclib.h
-index 538b927..6c20584 100644
---- a/includes/omapip/isclib.h
-+++ b/includes/omapip/isclib.h
-@@ -141,6 +141,8 @@ void isclib_cleanup(void);
- void dhcp_signal_handler(int signal);
- extern int shutdown_signal;
- 
-+#if defined (NSUPDATE)
- isc_result_t dns_client_init();
-+#endif
- 
- #endif /* ISCLIB_H */
-diff --git a/omapip/isclib.c b/omapip/isclib.c
-index db3b895..ce4b4a1 100644
---- a/omapip/isclib.c
-+++ b/omapip/isclib.c
-@@ -351,6 +351,7 @@ void dhcp_signal_handler(int signal) {
- 	}
- }
- 
-+#if defined (NSUPDATE)
- isc_result_t dns_client_init() {
- 	isc_result_t result;
- 	if (dhcp_gbl_ctx.dnsclient == NULL) {
-@@ -387,3 +388,4 @@ isc_result_t dns_client_init() {
- 
- 	return ISC_R_SUCCESS;
- }
-+#endif
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch
deleted file mode 100644
index 1bc1422475..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 8194daabfd590f17825f0c61e9534bee5c99cc86 Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Fri, 14 Sep 2018 13:41:41 -0400
-Subject: [master] Added includes of new BIND9 compatibility headers
-
-    Merges in rt48072.
-
-Upstream-Status: Backport
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
-
-diff --git a/includes/omapip/isclib.h b/includes/omapip/isclib.h
-index 75a87ff6..538b927f 100644
---- a/includes/omapip/isclib.h
-+++ b/includes/omapip/isclib.h
-@@ -48,6 +48,9 @@
- #include <string.h>
- #include <netdb.h>
- 
-+#include <isc/boolean.h>
-+#include <isc/int.h>
-+
- #include <isc/buffer.h>
- #include <isc/lex.h>
- #include <isc/lib.h>
-diff --git a/includes/omapip/result.h b/includes/omapip/result.h
-index 91243e1b..860298f6 100644
---- a/includes/omapip/result.h
-+++ b/includes/omapip/result.h
-@@ -26,6 +26,7 @@
- #ifndef DHCP_RESULT_H
- #define DHCP_RESULT_H 1
- 
-+#include <isc/boolean.h>
- #include <isc/lang.h>
- #include <isc/resultclass.h>
- #include <isc/types.h>
-diff --git a/server/dhcpv6.c b/server/dhcpv6.c
-index a7110f98..cde4f617 100644
---- a/server/dhcpv6.c
-+++ b/server/dhcpv6.c
-@@ -1034,7 +1034,8 @@ void check_pool6_threshold(struct reply_state *reply,
- 				  shared_name,
- 				  inet_ntop(AF_INET6, &lease->addr,
- 					    tmp_addr, sizeof(tmp_addr)),
--				  used, count);
-+				  (long long unsigned)(used),
-+				  (long long unsigned)(count));
- 		}
- 		return;
- 	}
-@@ -1066,7 +1067,8 @@ void check_pool6_threshold(struct reply_state *reply,
- 		  "address: %s; high threshold %d%% %llu/%llu.",
- 		  shared_name,
- 		  inet_ntop(AF_INET6, &lease->addr, tmp_addr, sizeof(tmp_addr)),
--		  poolhigh, used, count);
-+		  poolhigh, (long long unsigned)(used),
-+		  (long long unsigned)(count));
- 
- 	/* handle the low threshold now, if we don't
- 	 * have one we default to 0. */
-@@ -1436,12 +1438,15 @@ pick_v6_address(struct reply_state *reply)
- 		log_debug("Unable to pick client address: "
- 			  "no addresses available  - shared network %s: "
- 			  " 2^64-1 < total, %llu active,  %llu abandoned",
--			  shared_name, active - abandoned, abandoned);
-+			  shared_name, (long long unsigned)(active - abandoned),
-+			  (long long unsigned)(abandoned));
- 	} else {
- 		log_debug("Unable to pick client address: "
- 			  "no addresses available  - shared network %s: "
- 			  "%llu total, %llu active,  %llu abandoned",
--			  shared_name, total, active - abandoned, abandoned);
-+			  shared_name, (long long unsigned)(total),
-+			  (long long unsigned)(active - abandoned),
-+		          (long long unsigned)(abandoned));
- 	}
- 
- 	return ISC_R_NORESOURCES;
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch b/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
index b71c93dd6d..7b57730ffb 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
@@ -85,9 +85,11 @@ Index: dhcp-4.4.1/relay/Makefile.am
 ===================================================================
 --- dhcp-4.4.1.orig/relay/Makefile.am
 +++ dhcp-4.4.1/relay/Makefile.am
-@@ -1,4 +1,4 @@
+@@ -1,6 +1,6 @@
+ SUBDIRS = . tests
+
 -AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
 +AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
- 
+
  sbin_PROGRAMS = dhcrelay
  dhcrelay_SOURCES = dhcrelay.c
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
similarity index 74%
rename from meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
rename to meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
index 020777b8f2..b56a204821 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
@@ -9,13 +9,11 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0009-remove-dhclient-script-bash-dependency.patch \
             file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
             file://0013-fixup_use_libbind.patch \
-            file://0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch \
-            file://0001-Fix-a-NSUPDATE-compiling-issue.patch \
             file://0001-workaround-busybox-limitation-in-linux-dhclient-script.patch \
 "
 
-SRC_URI[md5sum] = "18c7f4dcbb0a63df25098216d47b1ede"
-SRC_URI[sha256sum] = "2a22508922ab367b4af4664a0472dc220cc9603482cf3c16d9aff14f3a76b608"
+SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
+SRC_URI[sha256sum] = "1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521"
 
 LDFLAGS_append = " -pthread"
 
-- 
2.17.1




