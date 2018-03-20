Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 1865378A28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 01:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8465220B46;
	Tue, 20 Mar 2018 01:11:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YS24NGh1rNil; Tue, 20 Mar 2018 01:11:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6079120B73;
	Tue, 20 Mar 2018 01:11:19 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id EF11C163377;
	Mon, 19 Mar 2018 21:11:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:11:10 -0400
Message-Id: <bb756080d9125c4a7689a05940309f02463aa36f.1521507765.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521507765.git.denys@ti.com>
References: <cover.1521507765.git.denys@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 3/3] lz4: upgrade 1.7.4 -> 1.8.1.2
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
X-List-Received-Date: Tue, 20 Mar 2018 01:11:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch accepted upstream.

License-Update: rephrased clarification regarding lib/ vs. programs/, tests/ and examples/
https://github.com/lz4/lz4/commit/97df1c9789cbc8a7891cadbd49ea5053574e2f72

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...sts-Makefile-don-t-use-LIBDIR-as-variable.patch | 82 ----------------------
 .../lz4/{lz4_1.7.4.bb => lz4_1.8.1.2.bb}           | 10 +--
 2 files changed, 5 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-support/lz4/files/0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch
 rename meta/recipes-support/lz4/{lz4_1.7.4.bb => lz4_1.8.1.2.bb} (79%)

diff --git a/meta/recipes-support/lz4/files/0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch b/meta/recipes-support/lz4/files/0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch
deleted file mode 100644
index 00494e8..0000000
--- a/meta/recipes-support/lz4/files/0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From d4768d9e29b805096a86aa13c0d30ee8215af4df Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 26 Jun 2017 12:07:09 +0300
-Subject: [PATCH] tests/Makefile: don't use LIBDIR as variable
-
-LIBDIR may be overriden with a environment variable: In this case make
-clean breaks. Use another variable name.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Backport
----
- tests/Makefile | 26 +++++++++++++-------------
- 1 file changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/tests/Makefile b/tests/Makefile
-index 97fa782..51dd038 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -32,7 +32,7 @@ DESTDIR ?=
- PREFIX  ?= /usr/local
- BINDIR  := $(PREFIX)/bin
- MANDIR  := $(PREFIX)/share/man/man1
--LIBDIR  := ../lib
-+LZ4DIR  := ../lib
- PRGDIR  := ../programs
- VOID    := /dev/null
- TESTDIR := versionsTest
-@@ -43,7 +43,7 @@ CFLAGS  += -g -Wall -Wextra -Wundef -Wcast-qual -Wcast-align -Wshadow -Wswitch-e
-            -Wdeclaration-after-statement -Wstrict-prototypes \
-            -Wpointer-arith -Wstrict-aliasing=1
- CFLAGS  += $(MOREFLAGS)
--CPPFLAGS:= -I$(LIBDIR) -I$(PRGDIR) -DXXH_NAMESPACE=LZ4_
-+CPPFLAGS:= -I$(LZ4DIR) -I$(PRGDIR) -DXXH_NAMESPACE=LZ4_
- FLAGS    = $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
- 
- 
-@@ -79,31 +79,31 @@ lz4c32:   # create a 32-bits version for 32/64 interop tests
- 	$(MAKE) -C $(PRGDIR) clean $@ CFLAGS="-m32 $(CFLAGS)"
- 	cp $(LZ4) $(LZ4)c32
- 
--fullbench  : $(LIBDIR)/lz4.o $(LIBDIR)/lz4hc.o $(LIBDIR)/lz4frame.o $(LIBDIR)/xxhash.o fullbench.c
-+fullbench  : $(LZ4DIR)/lz4.o $(LZ4DIR)/lz4hc.o $(LZ4DIR)/lz4frame.o $(LZ4DIR)/xxhash.o fullbench.c
- 	$(CC) $(FLAGS) $^ -o $@$(EXT)
- 
--fullbench-lib: fullbench.c $(LIBDIR)/xxhash.c
--	$(MAKE) -C $(LIBDIR) liblz4.a
--	$(CC) $(FLAGS) $^ -o $@$(EXT) $(LIBDIR)/liblz4.a
-+fullbench-lib: fullbench.c $(LZ4DIR)/xxhash.c
-+	$(MAKE) -C $(LZ4DIR) liblz4.a
-+	$(CC) $(FLAGS) $^ -o $@$(EXT) $(LZ4DIR)/liblz4.a
- 
--fullbench-dll: fullbench.c $(LIBDIR)/xxhash.c
--	$(MAKE) -C $(LIBDIR) liblz4
--	$(CC) $(FLAGS) $^ -o $@$(EXT) -DLZ4_DLL_IMPORT=1 $(LIBDIR)/dll/liblz4.dll
-+fullbench-dll: fullbench.c $(LZ4DIR)/xxhash.c
-+	$(MAKE) -C $(LZ4DIR) liblz4
-+	$(CC) $(FLAGS) $^ -o $@$(EXT) -DLZ4_DLL_IMPORT=1 $(LZ4DIR)/dll/liblz4.dll
- 
--fuzzer  : $(LIBDIR)/lz4.o $(LIBDIR)/lz4hc.o $(LIBDIR)/xxhash.o fuzzer.c
-+fuzzer  : $(LZ4DIR)/lz4.o $(LZ4DIR)/lz4hc.o $(LZ4DIR)/xxhash.o fuzzer.c
- 	$(CC) $(FLAGS) $^ -o $@$(EXT)
- 
--frametest: $(LIBDIR)/lz4frame.o $(LIBDIR)/lz4.o $(LIBDIR)/lz4hc.o $(LIBDIR)/xxhash.o frametest.c
-+frametest: $(LZ4DIR)/lz4frame.o $(LZ4DIR)/lz4.o $(LZ4DIR)/lz4hc.o $(LZ4DIR)/xxhash.o frametest.c
- 	$(CC) $(FLAGS) $^ -o $@$(EXT)
- 
--fasttest: $(LIBDIR)/lz4.o fasttest.c
-+fasttest: $(LZ4DIR)/lz4.o fasttest.c
- 	$(CC) $(FLAGS) $^ -o $@$(EXT)
- 
- datagen : $(PRGDIR)/datagen.c datagencli.c
- 	$(CC) $(FLAGS) -I$(PRGDIR) $^ -o $@$(EXT)
- 
- clean:
--	@$(MAKE) -C $(LIBDIR) $@ > $(VOID)
-+	@$(MAKE) -C $(LZ4DIR) $@ > $(VOID)
- 	@$(MAKE) -C $(PRGDIR) $@ > $(VOID)
- 	@$(RM) core *.o *.test tmp* \
-         fullbench-dll$(EXT) fullbench-lib$(EXT) \
--- 
-2.1.4
-
diff --git a/meta/recipes-support/lz4/lz4_1.7.4.bb b/meta/recipes-support/lz4/lz4_1.8.1.2.bb
similarity index 79%
rename from meta/recipes-support/lz4/lz4_1.7.4.bb
rename to meta/recipes-support/lz4/lz4_1.8.1.2.bb
index 86a1ab9..03017b3 100644
--- a/meta/recipes-support/lz4/lz4_1.7.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.8.1.2.bb
@@ -2,18 +2,18 @@ SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 
 LICENSE = "BSD | BSD-2-Clause | GPL-2.0"
-LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc\
+LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
                     file://programs/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LICENSE;md5=7f2857d58beff6d04137bf9b09e5ffb6"
+                    file://LICENSE;md5=d57c0d21cb917fb4e0af2454aa48b956 \
+                    "
 
 PE = "1"
 
-SRCREV = "7bb64ff2b69a9f8367de9ab483cdadf42b4c1b65"
+SRCREV = "dfed9fa1d77f0434306d377c4da1f7191d3ba08a"
 
 SRC_URI = "git://github.com/lz4/lz4.git \
-           file://0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch \
            file://run-ptest \
-"
+           "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


