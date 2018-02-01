Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id DC5D978733
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465181"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:19 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:01:58 +0200
Message-Id: <20180201180210.21652-8-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/20] libnl: 3.2.29 -> 3.4.0
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:19 -0000

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

1) Upgrade libnl from 3.2.29 to 3.4.0.
2) Add one patch "0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch", for musl compile.
3) Delete one patch "fix-pktloc_syntax_h-race.patch", since upstream has refactored the makefiles, and the problematic code is now absent.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ATCH-fix-libnl-3.4.0-musl-compile-problem.patch | 38 ++++++++++++++++++++++
 .../libnl/libnl/fix-pktloc_syntax_h-race.patch     | 36 --------------------
 .../libnl/{libnl_3.2.29.bb => libnl_3.4.0.bb}      |  7 ++--
 3 files changed, 42 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-support/libnl/libnl/0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch
 delete mode 100644 meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
 rename meta/recipes-support/libnl/{libnl_3.2.29.bb => libnl_3.4.0.bb} (87%)

diff --git a/meta/recipes-support/libnl/libnl/0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch b/meta/recipes-support/libnl/libnl/0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch
new file mode 100644
index 00000000000..b20a2996234
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch
@@ -0,0 +1,38 @@
+Subject: [PATCH] fix libnl-3.4.0 musl compile problem  
+Avoid in6_addr redefinition
+
+Upstream-Status: Pending
+
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+---
+ include/linux-private/linux/if_bridge.h | 1 -
+ include/linux-private/linux/ipv6.h      | 1 -
+ 2 files changed, 2 deletions(-)
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
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
deleted file mode 100644
index 79aa0bdf115..00000000000
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
diff --git a/meta/recipes-support/libnl/libnl_3.2.29.bb b/meta/recipes-support/libnl/libnl_3.4.0.bb
similarity index 87%
rename from meta/recipes-support/libnl/libnl_3.2.29.bb
rename to meta/recipes-support/libnl/libnl_3.4.0.bb
index 7d4839ba506..90dc644be4a 100644
--- a/meta/recipes-support/libnl/libnl_3.2.29.bb
+++ b/meta/recipes-support/libnl/libnl_3.4.0.bb
@@ -10,13 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
-           file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
+           file://0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch \
 "
+
 UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
 
-SRC_URI[md5sum] = "a8ba62a5c4f883f4e493a46d1f3733fe"
-SRC_URI[sha256sum] = "0beb593dc6abfffa18a5c787b27884979c1b7e7f1fd468c801e3cc938a685922"
+SRC_URI[md5sum] = "8f71910c03db363b41e2ea62057a4311"
+SRC_URI[sha256sum] = "b7287637ae71c6db6f89e1422c995f0407ff2fe50cecd61a312b6a9b0921f5bf"
 
 inherit autotools pkgconfig
 
-- 
2.15.1


