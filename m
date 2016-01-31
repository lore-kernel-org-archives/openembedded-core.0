Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6A7B3771ED
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0VDP1PA015853 for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:25:01 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zDU7ctjGmt2H
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:25:01 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0VDOuvY015848
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 13:24:57 GMT
Message-ID: <1454246696.27087.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 31 Jan 2016 13:24:56 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] pcmciautils: Fix makefile race
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
X-List-Received-Date: Sun, 31 Jan 2016 13:25:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The existing patch wasn't fixing one issue it claimed to and seemed
incorrect in relation to the other.

This patch correctly addresses the parallel make issue, as seen on
our autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch
deleted file mode 100644
index 3125df4..0000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5a793a1a9fb3477719aabf7e27ff22ed1acdf559 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Tue, 19 May 2015 15:54:24 +0800
-Subject: [PATCH] fix a parallel building issue
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
-there are two Makefile rules to generate lex_config.o, one is to generate
-lex_config.o other is to generate src/lex_config.o, so we can remove one.
-and add the needed dependence for lex_config.o
-
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- Makefile | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-Index: pcmciautils-018/Makefile
-===================================================================
---- pcmciautils-018.orig/Makefile
-+++ pcmciautils-018/Makefile
-@@ -246,7 +246,7 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/st
- 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
- 	$(QUIET) $(STRIPCMD) $@
- 
--yacc_config.o lex_config.o: %.o: %.c
-+yacc_config.o lex_config.o: %.o: %.c src/yacc_config.h
- 	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
- 
- debugtools: ccdv $(CBDUMP) $(CISDUMP)
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_race.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_race.patch
new file mode 100644
index 0000000..f5a518f
--- /dev/null
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_race.patch
@@ -0,0 +1,43 @@
+"make src/lex_config.o"
+
+results in:
+
+src/lex_config.l:35:25: fatal error: yacc_config.h: No such file or directory
+
+so add missing dependency through a missing rule. Also remove a rule which
+doesn't appear to do anything.
+
+RP
+2016/1/31
+
+Upstream-Status: Pending
+
+Index: pcmciautils-018/Makefile
+===================================================================
+--- pcmciautils-018.orig/Makefile
++++ pcmciautils-018/Makefile
+@@ -249,6 +249,9 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/st
+ yacc_config.o lex_config.o: %.o: %.c src/yacc_config.h
+ 	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
+ 
++src/lex_config.o : src/lex_config.c src/yacc_config.h
++	$(QUIET) $(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
++
+ debugtools: ccdv $(CBDUMP) $(CISDUMP)
+ 
+ $(CBDUMP): $(LIBC) debug/cbdump.o
+Index: pcmciautils-018/Makefile
+===================================================================
+--- pcmciautils-018.orig/Makefile
++++ pcmciautils-018/Makefile
+@@ -246,8 +246,8 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/st
+ 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
+ 	$(QUIET) $(STRIPCMD) $@
+ 
+-yacc_config.o lex_config.o: %.o: %.c
+-	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
++src/lex_config.o : src/lex_config.c src/yacc_config.h ccdv
++	$(QUIET) $(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
+ 
+ debugtools: ccdv $(CBDUMP) $(CISDUMP)
+ 
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 5c34081..d3dde7e 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -1,7 +1,7 @@
 require pcmciautils.inc
 
 SRC_URI += "file://makefile_fix.patch \
-            file://0001-fix-a-parallel-building-issue.patch \
+            file://makefile_race.patch \
             file://lex_sys_types.patch \
 "
 



