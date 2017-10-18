Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 14BA37834C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 01:27:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="29327812"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Oct 2017 09:27:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7EF9248029C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 09:27:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 18 Oct 2017 09:27:03 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Oct 2017 09:27:02 +0800
Message-ID: <1508290022-12654-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 7EF9248029C3.A56DD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libnl: 3.2.29 -> 3.4.0
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
X-List-Received-Date: Wed, 18 Oct 2017 01:27:07 -0000
Content-Type: text/plain

1) Upgrade libnl from 3.2.29 to 3.4.0.
2) Delete one patch "fix-pktloc_syntax_h-race.patch", for it is inappropriate.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../libnl/libnl/fix-pktloc_syntax_h-race.patch     | 36 ----------------------
 .../libnl/{libnl_3.2.29.bb => libnl_3.4.0.bb}      |  5 ++-
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
 rename meta/recipes-support/libnl/{libnl_3.2.29.bb => libnl_3.4.0.bb} (88%)

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
diff --git a/meta/recipes-support/libnl/libnl_3.2.29.bb b/meta/recipes-support/libnl/libnl_3.4.0.bb
similarity index 88%
rename from meta/recipes-support/libnl/libnl_3.2.29.bb
rename to meta/recipes-support/libnl/libnl_3.4.0.bb
index 7d4839b..411ad28 100644
--- a/meta/recipes-support/libnl/libnl_3.2.29.bb
+++ b/meta/recipes-support/libnl/libnl_3.4.0.bb
@@ -10,13 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
-           file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
 
-SRC_URI[md5sum] = "a8ba62a5c4f883f4e493a46d1f3733fe"
-SRC_URI[sha256sum] = "0beb593dc6abfffa18a5c787b27884979c1b7e7f1fd468c801e3cc938a685922"
+SRC_URI[md5sum] = "8f71910c03db363b41e2ea62057a4311"
+SRC_URI[sha256sum] = "b7287637ae71c6db6f89e1422c995f0407ff2fe50cecd61a312b6a9b0921f5bf"
 
 inherit autotools pkgconfig
 
-- 
2.7.4




