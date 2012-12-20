Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1TlffJ-0003nK-UB
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 13:56:00 +0100
Received: by mail-wi0-f177.google.com with SMTP id hm2so1935923wib.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=fUAbMlBvYESYh1udFLcun0xkM4/FkuW8S9i9vKZIAkc=;
	b=XyCSNDpTVw/9HS9GpEKzrYz9X3Djc+lsyO/y0R2nt/xJK3PDu3cwD6Ob9PZw5uy/zo
	TB3GUP24xoEE8ifQ5J2xOrGzuY1Iy7yCaFM1ER5QQnpO6GkSj4w9U6w0PJqK3D6GjyRh
	iYHOFC8JyT/+Td1pRZR0FMG/hGTh7tXXGONI3yS4rLIVy0960O9y4gImkSFsKI2Vtf0b
	APwiDgrAzXbDt8X6yulM6Yff9BykBH5JHlTnOC2eoZKrrHEQ/w2oSx6geCIcWNtCuhwp
	8RkgOxk1YBbgQaDwDp0+pYEDErlq1xTV7wQqk1dNP2j4cRpzcjaTI9TsE0+1nIKl+p/F
	VGEw==
X-Received: by 10.180.78.226 with SMTP id e2mr15241762wix.1.1356007273588;
	Thu, 20 Dec 2012 04:41:13 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id i6sm25040293wix.5.2012.12.20.04.41.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 04:41:12 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 17:40:32 +0500
Message-Id: <1356007232-28314-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>,
	Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH] blktrace: essentially rework the recipe, obey LDFLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 12:56:00 -0000

Signed-off-by: Christopher Larson <chris_larson@mentor.com>

the patch was imported from meta-mentor layer on yoctoproject git server
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor as of commit id
aed463414e2e2bf8ca44ba54ee5973e7ed599e57

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 .../blktrace/blktrace/blktrace-makefile.patch      |   55 ------------
 .../recipes-kernel/blktrace/blktrace/ldflags.patch |   89 ++++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb       |   18 ++--
 3 files changed, 97 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/blktrace-makefile.patch
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/ldflags.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/blktrace-makefile.patch b/meta/recipes-kernel/blktrace/blktrace/blktrace-makefile.patch
deleted file mode 100644
index c0f5fb0..0000000
--- a/meta/recipes-kernel/blktrace/blktrace/blktrace-makefile.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile	2010-11-22 11:20:14.303472770 -0600
-+++ git/Makefile	2010-11-22 14:11:19.152635423 -0600
-@@ -1,5 +1,3 @@
--CC	= gcc
--CFLAGS	= -Wall -O2 -g -W
- ALL_CFLAGS = $(CFLAGS) -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
- PROGS	= blkparse blktrace verify_blkparse blkrawverify blkiomon
- LIBS	= -lpthread
-@@ -11,13 +9,13 @@
- all: $(ALL)
- 
- btt/btt:
--	$(MAKE) -C btt
-+	CC="${CC}" CFLAGS="${CFLAGS}" $(MAKE) -C btt CC="${CC}" CFLAGS="${CFLAGS}"
- 
- btreplay/btrecord:
--	$(MAKE) -C btreplay
-+	CC="${CC}" CFLAGS="${CFLAGS}" $(MAKE) -C btreplay CC="${CC}" CFLAGS="${CFLAGS}" btrecord
- 
- btreplay/btreplay:
--	$(MAKE) -C btreplay
-+	CC="${CC}" CFLAGS="${CFLAGS}" $(MAKE) -C btreplay CC="${CC}" CFLAGS="${CFLAGS}" btreplay
- 
- %.o: %.c
- 	$(CC) -o $*.o -c $(ALL_CFLAGS) $<
-Index: git/btreplay/Makefile
-===================================================================
---- git.orig/btreplay/Makefile	2010-11-22 11:21:12.972679035 -0600
-+++ git/btreplay/Makefile	2010-11-22 14:07:01.492839945 -0600
-@@ -5,8 +5,6 @@
- # 	NDEBUG		- Defined: no asserts, Undefined: asserts
- #
- 
--CC	= gcc
--CFLAGS	= -Wall -W -O2 -g
- INCS	= -I. -I.. -I../btt
- OCFLAGS	= -UCOUNT_IOS -UDEBUG -DNDEBUG
- XCFLAGS	= -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-Index: git/btt/Makefile
-===================================================================
---- git.orig/btt/Makefile	2010-11-22 11:21:01.833758370 -0600
-+++ git/btt/Makefile	2010-11-22 14:07:15.783258253 -0600
-@@ -5,8 +5,6 @@
- # 	NDEBUG		- Defined: no asserts, Undefined: asserts
- #
- 
--CC	= gcc
--CFLAGS	= -Wall -W -O2 -g
- INCS	= -I. -I..
- XCFLAGS	= -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
- override CFLAGS += $(INCS) $(XCFLAGS)
diff --git a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
new file mode 100644
index 0000000..b9c7c20
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
@@ -0,0 +1,89 @@
+blktrace: obey LDFLAGS
+
+Upstream-Status: Pending
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+the patch was imported from meta-mentor layer on yoctoproject git server
+http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor as of commit id
+aed463414e2e2bf8ca44ba54ee5973e7ed599e57
+
+Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
+---
+ Makefile          |   11 ++++++-----
+ btreplay/Makefile |    3 ++-
+ btt/Makefile      |    3 ++-
+ 3 files changed, 10 insertions(+), 7 deletions(-)
+
+--- git.orig/Makefile
++++ git/Makefile
+@@ -1,5 +1,6 @@
+ CC	= gcc
+ CFLAGS	= -Wall -O2 -g -W
++LDFLAGS =
+ ALL_CFLAGS = $(CFLAGS) -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
+ PROGS	= blkparse blktrace verify_blkparse blkrawverify blkiomon
+ LIBS	= -lpthread
+@@ -23,19 +24,19 @@ btreplay/btreplay:
+ 	$(CC) -o $*.o -c $(ALL_CFLAGS) $<
+ 
+ blkparse: blkparse.o blkparse_fmt.o rbtree.o act_mask.o
+-	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^)
++	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
+ 
+ blktrace: blktrace.o act_mask.o
+-	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LIBS)
++	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LIBS) $(LDFLAGS)
+ 
+ verify_blkparse: verify_blkparse.o
+-	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^)
++	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
+ 
+ blkrawverify: blkrawverify.o
+-	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^)
++	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
+ 
+ blkiomon: blkiomon.o rbtree.o
+-	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LIBS) -lrt
++	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LIBS) -lrt $(LDFLAGS)
+ 
+ $(PROGS): | depend
+ 
+--- git.orig/btreplay/Makefile
++++ git/btreplay/Makefile
+@@ -7,6 +7,7 @@
+ 
+ CC	= gcc
+ CFLAGS	= -Wall -W -O2 -g
++LDFLAGS =
+ INCS	= -I. -I.. -I../btt
+ OCFLAGS	= -UCOUNT_IOS -UDEBUG -DNDEBUG
+ XCFLAGS	= -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
+@@ -35,7 +36,7 @@ btrecord: btrecord.o
+ 	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
+ 
+ btreplay: btreplay.o
+-	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LIBS)
++	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LIBS) $(LDFLAGS)
+ 
+ depend:
+ 	@$(CC) -MM $(CFLAGS) *.c 1> .depend
+--- git.orig/btt/Makefile
++++ git/btt/Makefile
+@@ -7,6 +7,7 @@
+ 
+ CC	= gcc
+ CFLAGS	= -Wall -W -O2 -g
++LDFLAGS =
+ INCS	= -I. -I..
+ XCFLAGS	= -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
+ override CFLAGS += $(INCS) $(XCFLAGS)
+@@ -38,7 +39,7 @@ clean: docsclean
+ 	$(CC) $(CFLAGS) -c -o $*.o $<
+ 
+ btt: $(OBJS)
+-	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LIBS)
++	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LIBS) $(LDFLAGS)
+ 
+ ifneq ($(wildcard .depend),)
+ include .depend
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index dbc07c5..80cb14c 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -6,19 +6,17 @@ DEPENDS = "libaio"
 
 SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"
 
-PR = "r4"
+PR = "r5"
 PV = "1.0.5+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git;protocol=git \
-           file://blktrace-makefile.patch"
+           file://ldflags.patch"
 
 S = "${WORKDIR}/git"
 
-do_compile() { 
-	oe_runmake ARCH="${ARCH}" CC="${CC}" LD="${LD}" prefix=${prefix}
-}
-
-do_install() {
-	oe_runmake ARCH="${ARCH}" CC="${CC}" LD="${LD}" \
-                   prefix=${prefix} DESTDIR=${D} install
-}
+EXTRA_OEMAKE = "\
+    'CC=${CC}' \
+    'CFLAGS=${CFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+"
+PARALLEL_MAKE = ""
-- 
1.7.9.5



