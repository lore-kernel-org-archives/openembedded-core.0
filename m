Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 95A937097A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 22:54:55 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2014 15:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,768,1400050800"; d="scan'208";a="463358295"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.12.249])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2014 15:54:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jul 2014 15:54:49 -0700
Message-Id: <9cf2ca1ce039ce6f50de93dc41c041558ed60c66.1406760824.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1406760824.git.sgw@linux.intel.com>
References: <cover.1406760824.git.sgw@linux.intel.com>
In-Reply-To: <cover.1406760824.git.sgw@linux.intel.com>
References: <cover.1406760824.git.sgw@linux.intel.com>
Subject: [PATCH 4/4] libnl: Upgrade to 3.2.25
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
X-List-Received-Date: Wed, 30 Jul 2014 22:54:56 -0000

Remove one patch and rebase another

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...fix-lib-cache_mngr.c-two-parentheses-bugs.patch | 37 ----------------------
 .../libnl/libnl/fix-pktloc_syntax_h-race.patch     | 14 ++++----
 .../libnl/{libnl_3.2.24.bb => libnl_3.2.25.bb}     |  6 ++--
 3 files changed, 10 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-support/libnl/libnl/fix-lib-cache_mngr.c-two-parentheses-bugs.patch
 rename meta/recipes-support/libnl/{libnl_3.2.24.bb => libnl_3.2.25.bb} (87%)

diff --git a/meta/recipes-support/libnl/libnl/fix-lib-cache_mngr.c-two-parentheses-bugs.patch b/meta/recipes-support/libnl/libnl/fix-lib-cache_mngr.c-two-parentheses-bugs.patch
deleted file mode 100644
index 22b0d88..0000000
--- a/meta/recipes-support/libnl/libnl/fix-lib-cache_mngr.c-two-parentheses-bugs.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 82fdf49c185fd5f3810781af9ef52aa6a52bf2df Mon Sep 17 00:00:00 2001
-From: "Song.Li" <Song.Li@windriver.com>
-Date: Thu, 28 Jun 2012 20:03:17 +0800
-Subject: [PATCH] fix lib/cache_mngr.c two parentheses bugs
-
-there are two parentheses bugs in libnl /lib/cache_mngr.c file.
-The parentheses doesn't make any sense,
-This will cause the variable err get a bool value,
-the correct value of variable err should be the return value
-of the function which can be any integer value.
-
----
- lib/cache_mngr.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Upstream-Status: Pending
-
-diff --git a/lib/cache_mngr.c b/lib/cache_mngr.c
-index dae8768..57cc1f9 100644
---- a/lib/cache_mngr.c
-+++ b/lib/cache_mngr.c
-@@ -150,10 +150,10 @@ int nl_cache_mngr_alloc(struct nl_sock *sk, int protocol, int flags,
- 	/* Required to receive async event notifications */
- 	nl_socket_disable_seq_check(mngr->cm_sock);
- 
--	if ((err = nl_connect(mngr->cm_sock, protocol) < 0))
-+	if ((err = nl_connect(mngr->cm_sock, protocol)) < 0)
- 		goto errout;
- 
--	if ((err = nl_socket_set_nonblocking(mngr->cm_sock) < 0))
-+	if ((err = nl_socket_set_nonblocking(mngr->cm_sock)) < 0)
- 		goto errout;
- 
- 	NL_DBG(1, "Allocated cache manager %p, protocol %d, %d caches\n",
--- 
-1.7.9.5
-
diff --git a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
index b93d97b1..79aa0bd 100644
--- a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
+++ b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
@@ -6,24 +6,24 @@ newer version so we can assume this issue is fixed upstream
 
 Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
 
-Index: libnl-3.2.14/lib/Makefile.am
+Index: libnl-3.2.25/lib/Makefile.am
 ===================================================================
---- libnl-3.2.14.orig/lib/Makefile.am
-+++ libnl-3.2.14/lib/Makefile.am
-@@ -39,9 +39,12 @@ CLEANFILES = \
+--- libnl-3.2.25.orig/lib/Makefile.am
++++ libnl-3.2.25/lib/Makefile.am
+@@ -46,9 +46,12 @@ CLEANFILES = \
  
  # Hack to avoid using ylwrap. It does not function correctly in combination
  # with --header-file=
 +route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
 +route/pktloc_grammar.h: route/pktloc_grammar.c
  route/pktloc_grammar.c: route/pktloc_grammar.l
- 	$(AM_V_GEN) $(FLEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
+ 	$(AM_V_GEN) $(MKDIR_P) route; $(FLEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
  
 +route/pktloc_syntax.h: route/pktloc_syntax.c
  route/pktloc_syntax.c: route/pktloc_syntax.y
- 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
+ 	$(AM_V_GEN) $(MKDIR_P) route; $(YACC) -d $(YFLAGS) -o $@ $^
  
-@@ -89,7 +92,9 @@ BUILT_SOURCES = \
+@@ -102,7 +105,9 @@ BUILT_SOURCES = \
  	route/cls/ematch_grammar.c \
  	route/cls/ematch_syntax.c \
  	route/pktloc_grammar.c \
diff --git a/meta/recipes-support/libnl/libnl_3.2.24.bb b/meta/recipes-support/libnl/libnl_3.2.25.bb
similarity index 87%
rename from meta/recipes-support/libnl/libnl_3.2.24.bb
rename to meta/recipes-support/libnl/libnl_3.2.25.bb
index d34ab74..dcaa85d 100644
--- a/meta/recipes-support/libnl/libnl_3.2.24.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.25.bb
@@ -12,10 +12,10 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
-           file://fix-lib-cache_mngr.c-two-parentheses-bugs.patch \
           "
-SRC_URI[md5sum] = "6e0e7bad0674749d930dd9f285343d55"
-SRC_URI[sha256sum] = "fb8d6e5dc8af5b85bc6d00a71582a68a01e6a3f7d1664d4a646e289a99dd6816"
+
+SRC_URI[md5sum] = "03f74d0cd5037cadc8cdfa313bbd195c"
+SRC_URI[sha256sum] = "8beb7590674957b931de6b7f81c530b85dc7c1ad8fbda015398bc1e8d1ce8ec5"
 
 inherit autotools-brokensep pkgconfig
 
-- 
1.8.3.1


