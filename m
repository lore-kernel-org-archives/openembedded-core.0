Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B6DDA7751C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 13:15:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jun 2017 06:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,395,1493708400"; d="scan'208";a="871808909"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jun 2017 06:15:57 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 27C5858069C;
	Mon, 26 Jun 2017 06:15:56 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 16:14:24 +0300
Message-Id: <1498482864-20026-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] lz4: Add patch to fix re-builds
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
X-List-Received-Date: Mon, 26 Jun 2017 13:15:59 -0000

Configure fails when rebuilding lz4 as LIBDIR is used in two different
places for two different things and we override it with a environment
variable.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...sts-Makefile-don-t-use-LIBDIR-as-variable.patch | 82 ++++++++++++++++++++++
 meta/recipes-support/lz4/lz4_1.7.4.bb              |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-support/lz4/files/0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch

diff --git a/meta/recipes-support/lz4/files/0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch b/meta/recipes-support/lz4/files/0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch
new file mode 100644
index 0000000..00494e8
--- /dev/null
+++ b/meta/recipes-support/lz4/files/0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch
@@ -0,0 +1,82 @@
+From d4768d9e29b805096a86aa13c0d30ee8215af4df Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 26 Jun 2017 12:07:09 +0300
+Subject: [PATCH] tests/Makefile: don't use LIBDIR as variable
+
+LIBDIR may be overriden with a environment variable: In this case make
+clean breaks. Use another variable name.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Backport
+---
+ tests/Makefile | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/tests/Makefile b/tests/Makefile
+index 97fa782..51dd038 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -32,7 +32,7 @@ DESTDIR ?=
+ PREFIX  ?= /usr/local
+ BINDIR  := $(PREFIX)/bin
+ MANDIR  := $(PREFIX)/share/man/man1
+-LIBDIR  := ../lib
++LZ4DIR  := ../lib
+ PRGDIR  := ../programs
+ VOID    := /dev/null
+ TESTDIR := versionsTest
+@@ -43,7 +43,7 @@ CFLAGS  += -g -Wall -Wextra -Wundef -Wcast-qual -Wcast-align -Wshadow -Wswitch-e
+            -Wdeclaration-after-statement -Wstrict-prototypes \
+            -Wpointer-arith -Wstrict-aliasing=1
+ CFLAGS  += $(MOREFLAGS)
+-CPPFLAGS:= -I$(LIBDIR) -I$(PRGDIR) -DXXH_NAMESPACE=LZ4_
++CPPFLAGS:= -I$(LZ4DIR) -I$(PRGDIR) -DXXH_NAMESPACE=LZ4_
+ FLAGS    = $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
+ 
+ 
+@@ -79,31 +79,31 @@ lz4c32:   # create a 32-bits version for 32/64 interop tests
+ 	$(MAKE) -C $(PRGDIR) clean $@ CFLAGS="-m32 $(CFLAGS)"
+ 	cp $(LZ4) $(LZ4)c32
+ 
+-fullbench  : $(LIBDIR)/lz4.o $(LIBDIR)/lz4hc.o $(LIBDIR)/lz4frame.o $(LIBDIR)/xxhash.o fullbench.c
++fullbench  : $(LZ4DIR)/lz4.o $(LZ4DIR)/lz4hc.o $(LZ4DIR)/lz4frame.o $(LZ4DIR)/xxhash.o fullbench.c
+ 	$(CC) $(FLAGS) $^ -o $@$(EXT)
+ 
+-fullbench-lib: fullbench.c $(LIBDIR)/xxhash.c
+-	$(MAKE) -C $(LIBDIR) liblz4.a
+-	$(CC) $(FLAGS) $^ -o $@$(EXT) $(LIBDIR)/liblz4.a
++fullbench-lib: fullbench.c $(LZ4DIR)/xxhash.c
++	$(MAKE) -C $(LZ4DIR) liblz4.a
++	$(CC) $(FLAGS) $^ -o $@$(EXT) $(LZ4DIR)/liblz4.a
+ 
+-fullbench-dll: fullbench.c $(LIBDIR)/xxhash.c
+-	$(MAKE) -C $(LIBDIR) liblz4
+-	$(CC) $(FLAGS) $^ -o $@$(EXT) -DLZ4_DLL_IMPORT=1 $(LIBDIR)/dll/liblz4.dll
++fullbench-dll: fullbench.c $(LZ4DIR)/xxhash.c
++	$(MAKE) -C $(LZ4DIR) liblz4
++	$(CC) $(FLAGS) $^ -o $@$(EXT) -DLZ4_DLL_IMPORT=1 $(LZ4DIR)/dll/liblz4.dll
+ 
+-fuzzer  : $(LIBDIR)/lz4.o $(LIBDIR)/lz4hc.o $(LIBDIR)/xxhash.o fuzzer.c
++fuzzer  : $(LZ4DIR)/lz4.o $(LZ4DIR)/lz4hc.o $(LZ4DIR)/xxhash.o fuzzer.c
+ 	$(CC) $(FLAGS) $^ -o $@$(EXT)
+ 
+-frametest: $(LIBDIR)/lz4frame.o $(LIBDIR)/lz4.o $(LIBDIR)/lz4hc.o $(LIBDIR)/xxhash.o frametest.c
++frametest: $(LZ4DIR)/lz4frame.o $(LZ4DIR)/lz4.o $(LZ4DIR)/lz4hc.o $(LZ4DIR)/xxhash.o frametest.c
+ 	$(CC) $(FLAGS) $^ -o $@$(EXT)
+ 
+-fasttest: $(LIBDIR)/lz4.o fasttest.c
++fasttest: $(LZ4DIR)/lz4.o fasttest.c
+ 	$(CC) $(FLAGS) $^ -o $@$(EXT)
+ 
+ datagen : $(PRGDIR)/datagen.c datagencli.c
+ 	$(CC) $(FLAGS) -I$(PRGDIR) $^ -o $@$(EXT)
+ 
+ clean:
+-	@$(MAKE) -C $(LIBDIR) $@ > $(VOID)
++	@$(MAKE) -C $(LZ4DIR) $@ > $(VOID)
+ 	@$(MAKE) -C $(PRGDIR) $@ > $(VOID)
+ 	@$(RM) core *.o *.test tmp* \
+         fullbench-dll$(EXT) fullbench-lib$(EXT) \
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/lz4/lz4_1.7.4.bb b/meta/recipes-support/lz4/lz4_1.7.4.bb
index 5ddffd5..1e98c1b 100644
--- a/meta/recipes-support/lz4/lz4_1.7.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.7.4.bb
@@ -11,6 +11,7 @@ PE = "1"
 SRCREV = "7bb64ff2b69a9f8367de9ab483cdadf42b4c1b65"
 
 SRC_URI = "git://github.com/lz4/lz4.git \
+           file://0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch \
            file://run-ptest \
 "
 
-- 
2.1.4


