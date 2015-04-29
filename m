Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1B957169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 05:29:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T5T828012663
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:29:08 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 28 Apr 2015 22:29:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 22:29:06 -0700
Message-ID: <d7ce93b5f8af7a4b66e235edcaa1f88cb3715254.1430285314.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1430285314.git.liezhi.yang@windriver.com>
References: <cover.1430285314.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] bison: fix parallel issue
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
X-List-Received-Date: Wed, 29 Apr 2015 05:29:10 -0000
Content-Type: text/plain

Fixed:
rm -f src/yacc src/yacc.tmp
echo '#! /bin/sh' >src/yacc.tmp
/bin/bash: src/yacc.tmp: No such file or directory
Makefile:6670: recipe for target 'src/yacc' failed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-src-local.mk-fix-parallel-issue.patch     |   33 ++++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.0.4.bb         |    1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch

diff --git a/meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch b/meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch
new file mode 100644
index 0000000..9543a56
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch
@@ -0,0 +1,33 @@
+From 3a15f7c9ace6c0294edc313a1848cafcc31b2a92 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 24 Apr 2015 00:38:32 -0700
+Subject: [PATCH] src/local.mk: fix parallel issue
+
+Fixed:
+rm -f src/yacc src/yacc.tmp
+echo '#! /bin/sh' >src/yacc.tmp
+/bin/bash: src/yacc.tmp: No such file or directory
+Makefile:6670: recipe for target 'src/yacc' failed
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/local.mk |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/local.mk b/src/local.mk
+index 573ad00..28bfae4 100644
+--- a/src/local.mk
++++ b/src/local.mk
+@@ -119,6 +119,7 @@ MOSTLYCLEANFILES += src/yacc
+ 
+ src/yacc:
+ 	$(AM_V_GEN)rm -f $@ $@.tmp
++	$(AM_V_at)$(MKDIR_P) src
+ 	$(AM_V_at)echo '#! /bin/sh' >$@.tmp
+ 	$(AM_V_at)echo "exec '$(bindir)/bison' -y "'"$$@"' >>$@.tmp
+ 	$(AM_V_at)chmod a+x $@.tmp
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/bison/bison_3.0.4.bb b/meta/recipes-devtools/bison/bison_3.0.4.bb
index de29506..708e9a3 100644
--- a/meta/recipes-devtools/bison/bison_3.0.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.0.4.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://m4.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://dont-depend-on-help2man.patch.patch \
+           file://0001-src-local.mk-fix-parallel-issue.patch \
 "
 
 # No point in hardcoding path to m4, just use PATH
-- 
1.7.9.5


