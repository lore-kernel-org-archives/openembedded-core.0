Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 268B27340E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:15:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8FcTM020947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:15:38 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:15:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:15:28 -0800
Message-ID: <a04fcc45b0da1e1ad0abdba64a47474927f1dce8.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423808841.git.liezhi.yang@windriver.com>
References: <cover.1423808841.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/12] at: fix and enable parallel build
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
X-List-Received-Date: Fri, 13 Feb 2015 08:15:37 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../at/at/makefile-fix-parallel.patch              |   35 ++++++++++++++++++++
 meta/recipes-extended/at/at_3.1.16.bb              |    5 +--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/at/at/makefile-fix-parallel.patch

diff --git a/meta/recipes-extended/at/at/makefile-fix-parallel.patch b/meta/recipes-extended/at/at/makefile-fix-parallel.patch
new file mode 100644
index 0000000..932a4c0
--- /dev/null
+++ b/meta/recipes-extended/at/at/makefile-fix-parallel.patch
@@ -0,0 +1,35 @@
+From 150b63a936af71b992a3a7b0fc2d2497e51fc800 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 28 Jan 2015 23:52:00 -0800
+Subject: [PATCH] Makefile: fix for parallel build
+
+Fixed:
+y.tab.c:1001:0: error: unterminated #if
+
+Let "$(YACC) -d parsetime.y" only run once will fix the problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 2a9b918..aa7c04a 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -75,7 +75,9 @@ at: $(ATOBJECTS)
+ atd: $(RUNOBJECTS)
+ 	$(CC) $(LDFLAGS) -o atd $(RUNOBJECTS) $(LIBS) $(PAMLIB)
+ 
+-y.tab.c y.tab.h: parsetime.y
++y.tab.h: y.tab.c
++
++y.tab.c: parsetime.y
+ 	$(YACC) -d parsetime.y
+ 
+ lex.yy.c: parsetime.l
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/at/at_3.1.16.bb b/meta/recipes-extended/at/at_3.1.16.bb
index f16edba..cee9fde 100644
--- a/meta/recipes-extended/at/at_3.1.16.bb
+++ b/meta/recipes-extended/at/at_3.1.16.bb
@@ -22,7 +22,9 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://file_replacement_with_gplv2.patch \
     file://atd.init \
     file://atd.service \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+    file://makefile-fix-parallel.patch \
+    "
 
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
@@ -44,7 +46,6 @@ INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE_${PN} = "atd.service"
 
-PARALLEL_MAKE = ""
 
 do_compile_prepend () {
 	cp -f ${WORKDIR}/posixtm.[ch] ${S}
-- 
1.7.9.5


