Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1050860125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 08:43:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4J8hEUK025304
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 01:43:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 19 May 2015 01:43:13 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 May 2015 16:38:11 +0800
Message-ID: <1432024691-18328-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] pcmciautils: fix the parallel building issue
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
X-List-Received-Date: Tue, 19 May 2015 08:43:14 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The building failure still display after upstream commit 055a5bbfc[
pcmciautils: fix for parallel build], so refix it.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-fix-a-parallel-building-issue.patch       | 45 ++++++++++++++++++++++
 .../Makefile-fix-for-parallel-build.patch          | 41 --------------------
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |  2 +-
 3 files changed, 46 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch
new file mode 100644
index 0000000..7b01040
--- /dev/null
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch
@@ -0,0 +1,45 @@
+From 5a793a1a9fb3477719aabf7e27ff22ed1acdf559 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Tue, 19 May 2015 15:54:24 +0800
+Subject: [PATCH] fix a parallel building issue
+
+Fixed:
+|   src/lex_config.c:34:25: fatal error: yacc_config.h: No such file or directory
+|
+|    #include "yacc_config.h"
+|                            ^
+|   compilation terminated.
+
+And:
+Compiling lex_config.c.
+  src/lex_config.l:34:25: fatal error: yacc_config.h: No such file or directory
+
+Upstream-Status: Pending
+
+there are two Makefile rules to generate lex_config.o, one is to generate
+lex_config.o other is to generate src/lex_config.o, so we can remove one.
+and add the needed dependence for lex_config.o
+
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d45fdc3..4c53bc2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -246,8 +246,7 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/startup.o src/yacc_config.o src/lex_config
+ 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
+ 	$(QUIET) $(STRIPCMD) $@
+ 
+-yacc_config.o lex_config.o: %.o: %.c
+-	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
++src/lex_config.o:src/yacc_config.h
+ 
+ debugtools: ccdv $(CBDUMP) $(CISDUMP)
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch
deleted file mode 100644
index d0bb3d6..0000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 1b8ad348f8c712c8e0c16c49cc1c8e577e4d6d3e Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 5 Feb 2015 01:16:30 -0800
-Subject: [PATCH] Makefile: fix for parallel build
-
-Fixed:
-|   src/lex_config.c:34:25: fatal error: yacc_config.h: No such file or directory
-|
-|    #include "yacc_config.h"
-|                            ^
-|   compilation terminated.
-
-And:
-Compiling lex_config.c.
-  src/lex_config.l:34:25: fatal error: yacc_config.h: No such file or directory
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index d45fdc3..963453a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -246,7 +246,9 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/startup.o src/yacc_config.o src/lex_config
- 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
- 	$(QUIET) $(STRIPCMD) $@
- 
--yacc_config.o lex_config.o: %.o: %.c
-+lex_config.o: lex_config.c yacc_config.h
-+	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
-+yacc_config.o: yacc_config.c
- 	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
- 
- debugtools: ccdv $(CBDUMP) $(CISDUMP)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
index fc76c44..24ceed8 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -1,7 +1,7 @@
 require pcmciautils.inc
 
 SRC_URI += "file://makefile_fix.patch \
-            file://Makefile-fix-for-parallel-build.patch \
+            file://0001-fix-a-parallel-building-issue.patch \
 "
 
 SRC_URI[md5sum] = "5d85669b3440baa4532363da6caaf1b4"
-- 
1.9.1


