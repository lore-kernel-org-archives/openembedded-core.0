Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8CECE6E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 09:04:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3L942b7028658
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Apr 2015 02:04:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 21 Apr 2015 02:04:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Apr 2015 02:04:01 -0700
Message-ID: <cbca1475751fa7bcb4bad043e105f3e29a464dab.1429606943.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429606943.git.liezhi.yang@windriver.com>
References: <cover.1429606943.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bison: don't depend on help2man
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
X-List-Received-Date: Tue, 21 Apr 2015 09:04:02 -0000
Content-Type: text/plain

Fix build error when no help2man on the host:
tmp/work/x86_64-linux/bison-native/3.0.4-r0/bison-3.0.4/build-aux/missing: line 81: help2man: command not found

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../bison/dont-depend-on-help2man.patch.patch      |   46 ++++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.0.4.bb         |    1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch

diff --git a/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch b/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch
new file mode 100644
index 0000000..ac16c57
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch.patch
@@ -0,0 +1,46 @@
+From 4c0d7733f30903f8d7c7cd7433f5c8a7505e35f5 Mon Sep 17 00:00:00 2001
+From: Marko Lindqvist <cazfi74@gmail.com>
+Date: Tue, 21 Apr 2015 00:48:45 -0700
+Subject: [PATCH] doc/local.mk: dont-depend-on-help2man.patch
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+Updated for bison 3.0.4
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ doc/local.mk |    9 +--------
+ 1 file changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/doc/local.mk b/doc/local.mk
+index c340452..642f385 100644
+--- a/doc/local.mk
++++ b/doc/local.mk
+@@ -98,10 +98,7 @@ endif ! CROSS_COMPILING
+ ## Man Pages.  ##
+ ## ----------- ##
+ 
+-dist_man_MANS = $(top_srcdir)/doc/bison.1
+-
+-EXTRA_DIST += $(dist_man_MANS:.1=.x)
+-MAINTAINERCLEANFILES += $(dist_man_MANS)
++EXTRA_DIST += bison.x
+ 
+ # Differences to ignore when comparing the man page (the date).
+ remove_time_stamp = \
+@@ -124,10 +121,6 @@ $(top_srcdir)/doc/bison.1: $(MAN_DEPS)
+ 	fi
+ 	$(AM_V_at)rm -f $@*.t
+ 
+-if ENABLE_YACC
+-nodist_man_MANS = doc/yacc.1
+-endif
+-
+ ## ----------------------------- ##
+ ## Graphviz examples generation. ##
+ ## ----------------------------- ##
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/bison/bison_3.0.4.bb b/meta/recipes-devtools/bison/bison_3.0.4.bb
index 5061410..de29506 100644
--- a/meta/recipes-devtools/bison/bison_3.0.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.0.4.bb
@@ -12,6 +12,7 @@ DEPENDS = "bison-native flex-native"
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://m4.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://dont-depend-on-help2man.patch.patch \
 "
 
 # No point in hardcoding path to m4, just use PATH
-- 
1.7.9.5


