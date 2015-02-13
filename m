Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD7EF7345D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:15:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8FeQu022789
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:15:40 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:15:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:15:33 -0800
Message-ID: <e1bb4ceea29e7936f020f728b3e07ff93ce06cb3.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423808841.git.liezhi.yang@windriver.com>
References: <cover.1423808841.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/12] ghostscript: fix and enable parallel build
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
X-List-Received-Date: Fri, 13 Feb 2015 08:15:39 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../ghostscript-9.15-parallel-make.patch           |   40 ++++++++++++++++++++
 .../ghostscript/ghostscript_9.15.bb                |    6 +--
 2 files changed, 41 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
new file mode 100644
index 0000000..797b894
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
@@ -0,0 +1,40 @@
+From be1e1b33191afdcfe3c2ecc4ff3e361a5859e9c6 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 30 Jan 2015 00:40:22 -0800
+Subject: [PATCH] contrib.mak: fix for parallel build
+
+Fixed:
+rm: cannot remove `/usr/share/ghostscript/9.15/lib': Is a directory
+
+Create lib before install to fix the race issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ contrib/contrib.mak |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/contrib/contrib.mak b/contrib/contrib.mak
+index 08a80d1..de2e20d 100644
+--- a/contrib/contrib.mak
++++ b/contrib/contrib.mak
+@@ -947,6 +947,7 @@ $(DEVOBJ)dviprlib.$(OBJ) : $(JAPSRC)dviprlib.c $(JAPSRC)dviprlib.h
+ 	$(DEVCC) $(O_)$@ $(C_) $(JAPSRC)dviprlib.c
+ 
+ extra-dmprt-install:
++	mkdir -p $(DESTDIR)$(gsdatadir)$(D)lib
+ 	$(INSTALL_DATA) $(JAPSRC)dmp_init.ps $(DESTDIR)$(gsdatadir)$(D)lib || exit 1
+ 	$(INSTALL_DATA) $(JAPSRC)dmp_site.ps $(DESTDIR)$(gsdatadir)$(D)lib || exit 1
+ 	$(INSTALL_DATA) $(JAPSRC)escp_24.src $(DESTDIR)$(gsdatadir)$(D)lib || exit 1
+@@ -1088,6 +1089,7 @@ $(DEVOBJ)gdevalps.$(OBJ) : $(JAPSRC)gdevalps.c $(PDEVH)
+ ### ----------------- Additional .upp files ---------------- ###
+ 
+ extra-upp-install:
++	mkdir -p $(DESTDIR)$(gsdatadir)$(D)lib
+ 	for f in $(CONTRIBSRC)uniprint$(D)*.upp; do \
+ 	    $(INSTALL_DATA) $$f $(DESTDIR)$(gsdatadir)$(D)lib || exit 1; \
+ 	done
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.15.bb b/meta/recipes-extended/ghostscript/ghostscript_9.15.bb
index 850ed81..5788837 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.15.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.15.bb
@@ -24,6 +24,7 @@ SRC_URI = "${SRC_URI_BASE} \
            file://objarch.h \
            file://ghostscript-9.02-parallel-make.patch \
            file://cups-no-gcrypt.patch \
+           file://ghostscript-9.15-parallel-make.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
@@ -101,8 +102,3 @@ do_install_class-native () {
 }
 
 BBCLASSEXTEND = "native"
-
-# Ghostscript install tool 'instcopy' tries to remove already created
-# directories during install and parallel make causes problems.
-PARALLEL_MAKEINST=""
-
-- 
1.7.9.5


