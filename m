Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B2E176C0B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 07:10:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAG7A55B015353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Nov 2018 23:10:06 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 15 Nov 2018 23:09:59 -0800
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2018 23:09:59 -0800
Message-ID: <20181116070959.96026-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] nspr: improve reproducibility
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
X-List-Received-Date: Fri, 16 Nov 2018 07:10:07 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Remove _BUILD_STRING and _BUILD_TIME in _pl_bld.h
to avoid introducing timestamp in the .so library
such as libnspr4.so as below:
 $ readelf --wide --decompress --hex-dump=.rodata libnspr4.so
 [snip]
  0x00004000 32303138 2d31312d 31352030 353a3439 2018-11-15 05:49
 [snip]

[YOCTO #12639]

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...remove-_BUILD_STRING-and-_BUILD_TIME.patch | 103 ++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.20.bb        |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch

diff --git a/meta/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch b/meta/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
new file mode 100644
index 0000000000..90fe45f34d
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
@@ -0,0 +1,103 @@
+From 8a592e4ead4ed6befe6044da3dd2dc7523c33905 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Fri, 16 Nov 2018 13:52:49 +0800
+Subject: [PATCH] Makefile.in: remove _BUILD_STRING and _BUILD_TIME
+
+Remove _BUILD_STRING and _BUILD_TIME to avoid
+adding timestamp to _pl_bld.h which can result
+in adding timestamp in library file such as
+libnspr4.so.
+ $ readelf --wide --decompress --hex-dump=.rodata libnspr4.so
+ [snip]
+  0x00004000 32303138 2d31312d 31352030 353a3439 2018-11-15 05:49
+ [snip]
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ lib/ds/Makefile.in        | 8 +-------
+ lib/libc/src/Makefile.in  | 8 +-------
+ lib/prstreams/Makefile.in | 8 +-------
+ pr/src/Makefile.in        | 8 +-------
+ 4 files changed, 4 insertions(+), 28 deletions(-)
+
+diff --git a/lib/ds/Makefile.in b/lib/ds/Makefile.in
+index e737791..b578476 100644
+--- a/lib/ds/Makefile.in
++++ b/lib/ds/Makefile.in
+@@ -114,13 +114,7 @@ GARBAGE += $(TINC)
+ 
+ $(TINC):
+ 	@$(MAKE_OBJDIR)
+-	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
+-	@if test ! -z "$(SH_NOW)"; then \
+-	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
+-	else \
+-	    true; \
+-	fi
+-	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
++	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
+ 
+ 
+ $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
+diff --git a/lib/libc/src/Makefile.in b/lib/libc/src/Makefile.in
+index e8a6d9f..978ed28 100644
+--- a/lib/libc/src/Makefile.in
++++ b/lib/libc/src/Makefile.in
+@@ -116,13 +116,7 @@ GARBAGE += $(TINC)
+ 
+ $(TINC):
+ 	@$(MAKE_OBJDIR)
+-	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
+-	@if test ! -z "$(SH_NOW)"; then \
+-	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
+-	else \
+-	    true; \
+-	fi
+-	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
++	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
+ 
+ 
+ $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
+diff --git a/lib/prstreams/Makefile.in b/lib/prstreams/Makefile.in
+index aeb2944..f318097 100644
+--- a/lib/prstreams/Makefile.in
++++ b/lib/prstreams/Makefile.in
+@@ -116,13 +116,7 @@ endif
+ 
+ $(TINC):
+ 	@$(MAKE_OBJDIR)
+-	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
+-	@if test ! -z "$(SH_NOW)"; then \
+-	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
+-	else \
+-	    true; \
+-	fi
+-	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
++	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
+ 
+ 
+ $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
+diff --git a/pr/src/Makefile.in b/pr/src/Makefile.in
+index 19c5a69..b4ac31c 100644
+--- a/pr/src/Makefile.in
++++ b/pr/src/Makefile.in
+@@ -326,13 +326,7 @@ GARBAGE += $(TINC)
+ 
+ $(TINC):
+ 	@$(MAKE_OBJDIR)
+-	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
+-	@if test ! -z "$(SH_NOW)"; then \
+-	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
+-	else \
+-	    true; \
+-	fi
+-	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
++	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
+ 
+ 
+ $(OBJDIR)/prvrsion.$(OBJ_SUFFIX): prvrsion.c $(TINC)
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/nspr/nspr_4.20.bb b/meta/recipes-support/nspr/nspr_4.20.bb
index fe3b4bd2ed..98ca909631 100644
--- a/meta/recipes-support/nspr/nspr_4.20.bb
+++ b/meta/recipes-support/nspr/nspr_4.20.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://0002-Add-nios2-support.patch \
            file://0001-md-Fix-build-with-musl.patch \
            file://0004-Add-ARC-support.patch \
+           file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
            file://nspr.pc.in \
 "
 
-- 
2.17.1


