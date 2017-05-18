Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id F423977E98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 09:16:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19012815"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 May 2017 17:16:11 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A632547C7C66
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 17:16:06 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 18 May 2017 17:16:07 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 May 2017 17:15:50 +0800
Message-ID: <1495098950-18824-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: A632547C7C66.A8E12
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v4] libnl: 3.2.29 -> 3.3.0
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
X-List-Received-Date: Thu, 18 May 2017 09:16:13 -0000
Content-Type: text/plain

1) Upgrade libnl from 3.2.29 to 3.3.0.
2) Delete patch "fix-pktloc_syntax_h-race.patch", since it is  integrated upstream.
3) Add patch "musl-header-conflict.patch" to fix musl compile error.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../libnl/libnl/fix-pktloc_syntax_h-race.patch     | 36 -------------
 .../libnl/libnl/musl-header-conflict.patch         | 59 ++++++++++++++++++++++
 .../libnl/{libnl_3.2.29.bb => libnl_3.3.0.bb}      |  6 +--
 3 files changed, 62 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
 create mode 100644 meta/recipes-support/libnl/libnl/musl-header-conflict.patch
 rename meta/recipes-support/libnl/{libnl_3.2.29.bb => libnl_3.3.0.bb} (88%)

diff --git a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
deleted file mode 100644
index 79aa0bd..0000000
--- a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-libnl has progressed to 0.3.2 and there does not appear to be any
-"make -j" issues with this build after my limited testing on that
-newer version so we can assume this issue is fixed upstream
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-
-Index: libnl-3.2.25/lib/Makefile.am
-===================================================================
---- libnl-3.2.25.orig/lib/Makefile.am
-+++ libnl-3.2.25/lib/Makefile.am
-@@ -46,9 +46,12 @@ CLEANFILES = \
- 
- # Hack to avoid using ylwrap. It does not function correctly in combination
- # with --header-file=
-+route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
-+route/pktloc_grammar.h: route/pktloc_grammar.c
- route/pktloc_grammar.c: route/pktloc_grammar.l
- 	$(AM_V_GEN) $(MKDIR_P) route; $(FLEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
- 
-+route/pktloc_syntax.h: route/pktloc_syntax.c
- route/pktloc_syntax.c: route/pktloc_syntax.y
- 	$(AM_V_GEN) $(MKDIR_P) route; $(YACC) -d $(YFLAGS) -o $@ $^
- 
-@@ -102,7 +105,9 @@ BUILT_SOURCES = \
- 	route/cls/ematch_grammar.c \
- 	route/cls/ematch_syntax.c \
- 	route/pktloc_grammar.c \
--	route/pktloc_syntax.c
-+   route/pktloc_syntax.c \
-+   route/pktloc_syntax.h \
-+   route/pktloc_grammar.h
- 
- EXTRA_DIST = \
- 	route/pktloc_grammar.l \
diff --git a/meta/recipes-support/libnl/libnl/musl-header-conflict.patch b/meta/recipes-support/libnl/libnl/musl-header-conflict.patch
new file mode 100644
index 0000000..dfe4cb8
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/musl-header-conflict.patch
@@ -0,0 +1,59 @@
+From e1f2827673d9d45fe69ca912628bbb90d4003f49 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Mon, 15 May 2017 02:09:08 +0900
+Subject: [PATCH] Fix musl compile error like:
+
+In file included from ../libnl-3.3.0/include/linux-private/linux/ipv6.h:5:0,
+                 from ../libnl-3.3.0/include/netlink-private/netlink.h:54,
+                 from ../libnl-3.3.0/lib/nl.c:28:
+../libnl-3.3.0/include/linux-private/linux/in6.h:32:8: error:
+redefinition of 'struct in6_addr'
+ struct in6_addr {
+        ^~~~~~~~
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ include/linux-private/linux/if_bridge.h | 1 -
+ include/linux-private/linux/ipv6.h      | 1 -
+ include/netlink-private/netlink.h       | 1 -
+ 3 files changed, 3 deletions(-)
+
+diff --git a/include/linux-private/linux/if_bridge.h b/include/linux-private/linux/if_bridge.h
+index f24050b..8f7490c 100644
+--- a/include/linux-private/linux/if_bridge.h
++++ b/include/linux-private/linux/if_bridge.h
+@@ -15,7 +15,6 @@
+ 
+ #include <linux/types.h>
+ #include <linux/if_ether.h>
+-#include <linux/in6.h>
+ 
+ #define SYSFS_BRIDGE_ATTR	"bridge"
+ #define SYSFS_BRIDGE_FDB	"brforward"
+diff --git a/include/linux-private/linux/ipv6.h b/include/linux-private/linux/ipv6.h
+index e05e684..f16349d 100644
+--- a/include/linux-private/linux/ipv6.h
++++ b/include/linux-private/linux/ipv6.h
+@@ -2,7 +2,6 @@
+ #define _IPV6_H
+ 
+ #include <asm/byteorder.h>
+-#include <linux/in6.h>
+ 
+ /* The latest drafts declared increase in minimal mtu up to 1280. */
+ 
+diff --git a/include/netlink-private/netlink.h b/include/netlink-private/netlink.h
+index 728ca5c..a73115b 100644
+--- a/include/netlink-private/netlink.h
++++ b/include/netlink-private/netlink.h
+@@ -29,7 +29,6 @@
+ #include <limits.h>
+ #include <search.h>
+ 
+-#include <arpa/inet.h>
+ #include <netdb.h>
+ 
+ #include <defs.h>
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/libnl/libnl_3.2.29.bb b/meta/recipes-support/libnl/libnl_3.3.0.bb
similarity index 88%
rename from meta/recipes-support/libnl/libnl_3.2.29.bb
rename to meta/recipes-support/libnl/libnl_3.3.0.bb
index 7d4839b..b070416 100644
--- a/meta/recipes-support/libnl/libnl_3.2.29.bb
+++ b/meta/recipes-support/libnl/libnl_3.3.0.bb
@@ -10,13 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
-           file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
+           file://musl-header-conflict.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
 
-SRC_URI[md5sum] = "a8ba62a5c4f883f4e493a46d1f3733fe"
-SRC_URI[sha256sum] = "0beb593dc6abfffa18a5c787b27884979c1b7e7f1fd468c801e3cc938a685922"
+SRC_URI[md5sum] = "ab3ef137cad95bdda5ff0ffa5175dfa5"
+SRC_URI[sha256sum] = "705468b5ae4cd1eb099d2d1c476d6a3abe519bc2810becf12fb1e32de1e074e4"
 
 inherit autotools pkgconfig
 
-- 
2.7.4




