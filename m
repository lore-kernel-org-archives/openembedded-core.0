Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F2908605BB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 23:13:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB4NDGxk016099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Dec 2015 15:13:17 -0800
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 4 Dec 2015 15:13:15 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <randy.macleod@windriver.com>
Date: Fri, 4 Dec 2015 15:13:15 -0800
Message-ID: <1449270795-16057-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] ghostscript: add dependency for pnglibconf.h
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
X-List-Received-Date: Fri, 04 Dec 2015 23:13:18 -0000
Content-Type: text/plain

When using parallel make jobs, we need to be sure that
pnglibconf.h is created before we try to reference it,
so add a rule to png.mak.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../ghostscript/ghostscript/png_mak.patch          |   21 ++++++++++++++++++++
 .../ghostscript/ghostscript_9.16.bb                |    1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/png_mak.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/png_mak.patch b/meta/recipes-extended/ghostscript/ghostscript/png_mak.patch
new file mode 100644
index 0000000..da900ea
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/png_mak.patch
@@ -0,0 +1,21 @@
+ghostscript: add dependency for pnglibconf.h
+    
+When using parallel make jobs, we need to be sure that
+pnglibconf.h is created before we try to reference it,
+so add a rule to png.mak.
+
+Upstream-Status: Pending
+    
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+--- a/base/png.mak
++++ b/base/png.mak
+@@ -81,6 +81,8 @@ png.config-clean :
+ $(pnglibconf_h) : $(PNGSRC)scripts$(D)pnglibconf.h.prebuilt
+ 	$(CP_)  $(PNGSRC)scripts$(D)pnglibconf.h.prebuilt $(pnglibconf_h)
+ 
++$(MAKEDIRS) : $(pnglibconf_h)
++
+ PDEP=$(AK) $(pnglibconf_h) $(MAKEDIRS)
+ 
+ png_1=$(PNGOBJ)png.$(OBJ) $(PNGOBJ)pngmem.$(OBJ) $(PNGOBJ)pngerror.$(OBJ) $(PNGOBJ)pngset.$(OBJ)
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.16.bb b/meta/recipes-extended/ghostscript/ghostscript_9.16.bb
index ec4acc6..d584c49 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.16.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.16.bb
@@ -19,6 +19,7 @@ DEPENDS_class-native = ""
 SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.gz \
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
+                file://png_mak.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
1.7.9.5


