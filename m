Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9FA73447
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:15:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8Fe5w020956
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:15:40 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:15:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:15:34 -0800
Message-ID: <05528c389c4c8d51853bb4702fdd8c6434b42163.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423808841.git.liezhi.yang@windriver.com>
References: <cover.1423808841.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/12] pcmciautils: fix and enable parallel build
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
X-List-Received-Date: Fri, 13 Feb 2015 08:15:40 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../Makefile-fix-for-parallel-build.patch          |   35 ++++++++++++++++++++
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 -
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |    4 ++-
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch
new file mode 100644
index 0000000..e9eaab7
--- /dev/null
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch
@@ -0,0 +1,35 @@
+From 1b8ad348f8c712c8e0c16c49cc1c8e577e4d6d3e Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 5 Feb 2015 01:16:30 -0800
+Subject: [PATCH] Makefile: fix for parallel build
+
+Fixed:
+|   src/lex_config.c:34:25: fatal error: yacc_config.h: No such file or directory
+|
+|    #include "yacc_config.h"
+|                            ^
+|   compilation terminated.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index d45fdc3..de2a5f9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -246,7 +246,7 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/startup.o src/yacc_config.o src/lex_config
+ 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
+ 	$(QUIET) $(STRIPCMD) $@
+ 
+-yacc_config.o lex_config.o: %.o: %.c
++yacc_config.o lex_config.o: %.o: %.c: %.h
+ 	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
+ 
+ debugtools: ccdv $(CBDUMP) $(CISDUMP)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index 04056e3..9d1c55b 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -23,7 +23,6 @@ LD = "${CC}"
 CFLAGS =+ "-I${S}/src"
 CFLAGS =+ "-DPCMCIAUTILS_VERSION=\\"${PV}\\""
 
-PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex'"
 
 do_install () {
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 50629b4..fc76c44 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -1,6 +1,8 @@
 require pcmciautils.inc
 
-SRC_URI += "file://makefile_fix.patch"
+SRC_URI += "file://makefile_fix.patch \
+            file://Makefile-fix-for-parallel-build.patch \
+"
 
 SRC_URI[md5sum] = "5d85669b3440baa4532363da6caaf1b4"
 SRC_URI[sha256sum] = "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d040ec811b0dc8ed5"
-- 
1.7.9.5


