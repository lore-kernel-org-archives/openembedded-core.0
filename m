Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.8440.1622039832709072960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 07:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YzUgoFrv;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so1201132otp.4
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 07:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CXyX98Rid8TedUuQvADDeWUa9Cfg/d2rr/FjoMqOVeI=;
        b=YzUgoFrvFSd/SsYp8ShyfJFT+lOUu+NHqqbkaLMX76hOK6c2ATyqFSLcUX3uYbQk6Y
         HrOb022pRS8smMYnOQB6F5yWt0HGIFLVTYaA/isoWZ5r/T0D5PkU6K3EAq4mN1ff/SR0
         1YmISTR6jMAnQ48T8fBBpvVYxk40OT3wNoiudEf/vcmn6eXYzcS2vr0tCyvRYOLoX5vI
         ay+BHq/bysGYHpzDcoCj8LsfafZqkvsVbeohS48ON5NdRp/5EUx+IP1xuvqRJfDD1F52
         PwUpt+wermZGxYSqRQ2szZGphfyFXPwanRbHzuy83dmc1xkoIPMcym0z7K6OAmIeze/G
         7O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CXyX98Rid8TedUuQvADDeWUa9Cfg/d2rr/FjoMqOVeI=;
        b=iBMQ8RlznkXn/2N40UAkwgkXnOgNWOkGkpC384uw/xSHIS2gi5D/wLmC+f9+nXsBQJ
         tFXVpg9FqLKMPluEG5+UXoGZJ3P7gvNmVUjWoRf2mObvTJMlKvVtEDmp8xQSEV0OfQx9
         bpSIRe8xAAbQhgwQN6EANdyL1TchMJedCYQmk+nO0+UbRCQamKCTNIQb2pN5kga5CO9A
         htOK3R72R0VAjf3JIa799K1YezdNXUKPTfBPoaJadpLVD3m02hsIR3jOOIWeF9CjbbRK
         D3M2C253zkmQ1vUU+wxWhBL8iIuh658NgekmpdaNzEez4ChLLdbmd29MHeh139DBD7LD
         Yt4g==
X-Gm-Message-State: AOAM5300RmU0MAaaI2z7c5LlT8H2jQpKV7C35jT4m6NgIFm1+ltyLOjy
	t1gnAT+K9Hx9vzbYZ3UVQjtVdo7ZiCk=
X-Google-Smtp-Source: ABdhPJzfuLh4rR1qvgkKiUkbd3hJ2FZEfaTiK9kvvbQbrmh9JvlDOWo/5a5BhSqJZt9x4tDoAUxLcw==
X-Received: by 2002:a9d:289:: with SMTP id 9mr2584183otl.10.1622039831563;
        Wed, 26 May 2021 07:37:11 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id t23sm3779859oij.21.2021.05.26.07.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 07:37:10 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] zstd: Add patch to fix MinGW builds
Date: Wed, 26 May 2021 09:37:02 -0500
Message-Id: <20210526143702.9452-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a patch to fix the make files to work correctly when building for
MinGW

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../zstd/zstd/0001-MinGW-Build-Fixes.patch    | 193 ++++++++++++++++++
 meta/recipes-extended/zstd/zstd_1.5.0.bb      |   1 +
 2 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch

diff --git a/meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch b/meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch
new file mode 100644
index 0000000000..a0e00dca03
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch
@@ -0,0 +1,193 @@
+From ab9a34c92eec815ef214470c927ddbe2e950e7e5 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Wed, 26 May 2021 09:15:40 -0500
+Subject: [PATCH] MinGW Build Fixes
+
+Fixes building on MinGW by
+ 1) Exporting the OS variable so that it is visible to sub-make
+    invocations
+ 2) Fixing the extension handling so that make correctly identifies when
+    targets need to be rebuilt. Without the correct handling, make would
+    rebuild the executable targets when running `make install` because
+    it couldn't find them with the correct extension.
+
+Upstream-Status: Submitted [https://github.com/facebook/zstd/pull/2685]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ Makefile          |  1 +
+ programs/Makefile | 74 +++++++++++++++++++++++------------------------
+ 2 files changed, 38 insertions(+), 37 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index c1908f0a..f9ce9504 100644
+--- a/Makefile
++++ b/Makefile
+@@ -29,6 +29,7 @@ VOID = /dev/null
+ # fail on other tested distros (ubuntu, debian) even
+ # without manually specifying the TARGET_SYSTEM.
+ TARGET_SYSTEM ?= $(OS)
++export OS
+ 
+ ifneq (,$(filter Windows%,$(TARGET_SYSTEM)))
+   EXT =.exe
+diff --git a/programs/Makefile b/programs/Makefile
+index 599fb02f..79b45c83 100644
+--- a/programs/Makefile
++++ b/programs/Makefile
+@@ -209,37 +209,37 @@ SET_CACHE_DIRECTORY = \
+ 
+ 
+ .PHONY: all
+-all: zstd
++all: zstd$(EXT)
+ 
+ .PHONY: allVariants
+-allVariants: zstd zstd-compress zstd-decompress zstd-small zstd-nolegacy zstd-dictBuilder
++allVariants: zstd$(EXT) zstd-compress$(EXT) zstd-decompress$(EXT) zstd-small$(EXT) zstd-nolegacy$(EXT) zstd-dictBuilder$(EXT)
+ 
+ .PHONY: zstd  # must always be run
+-zstd : CPPFLAGS += $(THREAD_CPP) $(ZLIBCPP) $(LZMACPP) $(LZ4CPP)
+-zstd : LDFLAGS += $(THREAD_LD) $(DEBUGFLAGS_LD)
+-zstd : LDLIBS += $(ZLIBLD) $(LZMALD) $(LZ4LD)
+-zstd : CPPFLAGS += -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
++zstd$(EXT) : CPPFLAGS += $(THREAD_CPP) $(ZLIBCPP) $(LZMACPP) $(LZ4CPP)
++zstd$(EXT) : LDFLAGS += $(THREAD_LD) $(DEBUGFLAGS_LD)
++zstd$(EXT) : LDLIBS += $(ZLIBLD) $(LZMALD) $(LZ4LD)
++zstd$(EXT) : CPPFLAGS += -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
+ ifneq (,$(filter Windows%,$(OS)))
+-zstd : $(RES_FILE)
++zstd$(EXT) : $(RES_FILE)
+ endif
+ 
+ ifndef BUILD_DIR
+ # generate BUILD_DIR from flags
+ 
+-zstd:
++zstd$(EXT):
+ 	$(SET_CACHE_DIRECTORY)
+ 
+ else
+ # BUILD_DIR is defined
+ 
+ ZSTD_OBJ := $(addprefix $(BUILD_DIR)/, $(ZSTD_ALL_OBJ))
+-$(BUILD_DIR)/zstd : $(ZSTD_OBJ)
++$(BUILD_DIR)/zstd$(EXT) : $(ZSTD_OBJ)
+ 	@echo "$(THREAD_MSG)"
+ 	@echo "$(ZLIB_MSG)"
+ 	@echo "$(LZMA_MSG)"
+ 	@echo "$(LZ4_MSG)"
+ 	@echo LINK $@
+-	$(CC) $(FLAGS) $^ $(LDLIBS) -o $@$(EXT)
++	$(CC) $(FLAGS) $^ $(LDLIBS) -o $@
+ 
+ ifeq ($(HAVE_HASH),1)
+ SRCBIN_HASH = $(shell cat $(BUILD_DIR)/zstd 2> $(VOID) | $(HASH) | cut -f 1 -d " ")
+@@ -249,7 +249,7 @@ else
+ BIN_ISDIFFERENT = 1
+ endif
+ 
+-zstd : $(BUILD_DIR)/zstd
++zstd$(EXT) : $(BUILD_DIR)/zstd$(EXT)
+ 	if [ $(BIN_ISDIFFERENT) -eq 1 ]; then \
+ 		cp -f $< $@; \
+ 		echo zstd build completed; \
+@@ -263,46 +263,46 @@ endif  # BUILD_DIR
+ .PHONY: zstd-release
+ zstd-release: DEBUGFLAGS := -DBACKTRACE_ENABLE=0
+ zstd-release: DEBUGFLAGS_LD :=
+-zstd-release: zstd
++zstd-release: zstd$(EXT)
+ 
+-zstd32 : CPPFLAGS += $(THREAD_CPP)
+-zstd32 : LDFLAGS  += $(THREAD_LD)
+-zstd32 : CPPFLAGS += -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
++zstd32$(EXT) : CPPFLAGS += $(THREAD_CPP)
++zstd32$(EXT) : LDFLAGS  += $(THREAD_LD)
++zstd32$(EXT) : CPPFLAGS += -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
+ ifneq (,$(filter Windows%,$(OS)))
+-zstd32 : $(RES32_FILE)
++zstd32$(EXT) : $(RES32_FILE)
+ endif
+-zstd32 : $(ZSTDLIB_FULL_SRC) $(ZSTD_CLI_SRC)
+-	$(CC) -m32 $(FLAGS) $^ -o $@$(EXT)
++zstd32$(EXT) : $(ZSTDLIB_FULL_SRC) $(ZSTD_CLI_SRC)
++	$(CC) -m32 $(FLAGS) $^ -o $@
+ 
+ ## zstd-nolegacy: same scope as zstd, with just support of legacy formats removed
+-zstd-nolegacy : LDFLAGS += $(THREAD_LD) $(ZLIBLD) $(LZMALD) $(LZ4LD) $(DEBUGFLAGS_LD)
+-zstd-nolegacy : $(ZSTDLIB_CORE_SRC) $(ZDICT_SRC) $(ZSTD_CLI_OBJ)
+-	$(CC) $(FLAGS) $^ -o $@$(EXT) $(LDFLAGS)
++zstd-nolegacy$(EXT) : LDFLAGS += $(THREAD_LD) $(ZLIBLD) $(LZMALD) $(LZ4LD) $(DEBUGFLAGS_LD)
++zstd-nolegacy$(EXT) : $(ZSTDLIB_CORE_SRC) $(ZDICT_SRC) $(ZSTD_CLI_OBJ)
++	$(CC) $(FLAGS) $^ -o $@ $(LDFLAGS)
+ 
+ .PHONY: zstd-nomt
+ zstd-nomt : THREAD_CPP :=
+ zstd-nomt : THREAD_LD  :=
+ zstd-nomt : THREAD_MSG := - multi-threading disabled
+-zstd-nomt : zstd
++zstd-nomt : zstd$(EXT)
+ 
+ .PHONY: zstd-nogz
+ zstd-nogz : ZLIBCPP :=
+ zstd-nogz : ZLIBLD  :=
+ zstd-nogz : ZLIB_MSG := - gzip support is disabled
+-zstd-nogz : zstd
++zstd-nogz : zstd$(EXT)
+ 
+ .PHONY: zstd-noxz
+ zstd-noxz : LZMACPP :=
+ zstd-noxz : LZMALD  :=
+ zstd-noxz : LZMA_MSG := - xz/lzma support is disabled
+-zstd-noxz : zstd
++zstd-noxz : zstd$(EXT)
+ 
+ ## zstd-dll: zstd executable linked to dynamic library libzstd (must have same version)
+ .PHONY: zstd-dll
+ zstd-dll : LDFLAGS+= -L$(ZSTDDIR)
+ zstd-dll : LDLIBS += -lzstd
+ zstd-dll : ZSTDLIB_LOCAL_SRC = xxhash.c
+-zstd-dll : zstd
++zstd-dll : zstd$(EXT)
+ 
+ 
+ ## zstd-pgo: zstd executable optimized with PGO.
+@@ -321,23 +321,23 @@ zstd-pgo :
+ 	$(MAKE) zstd MOREFLAGS=-fprofile-use
+ 
+ ## zstd-small: minimal target, supporting only zstd compression and decompression. no bench. no legacy. no other format.
+-zstd-small: CFLAGS = -Os -s
+-zstd-frugal zstd-small: $(ZSTDLIB_CORE_SRC) zstdcli.c util.c timefn.c fileio.c
+-	$(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NOTRACE $^ -o $@$(EXT)
++zstd-small$(EXT): CFLAGS = -Os -s
++zstd-frugal$(EXT) zstd-small$(EXT): $(ZSTDLIB_CORE_SRC) zstdcli.c util.c timefn.c fileio.c
++	$(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NOTRACE $^ -o $@
+ 
+-zstd-decompress: $(ZSTDLIB_COMMON_C) $(ZSTDLIB_DECOMPRESS_C) zstdcli.c util.c timefn.c fileio.c
+-	$(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NOCOMPRESS -DZSTD_NOTRACE $^ -o $@$(EXT)
++zstd-decompress$(EXT): $(ZSTDLIB_COMMON_C) $(ZSTDLIB_DECOMPRESS_C) zstdcli.c util.c timefn.c fileio.c
++	$(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NOCOMPRESS -DZSTD_NOTRACE $^ -o $@
+ 
+-zstd-compress: $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) zstdcli.c util.c timefn.c fileio.c
+-	$(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NODECOMPRESS -DZSTD_NOTRACE $^ -o $@$(EXT)
++zstd-compress$(EXT): $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) zstdcli.c util.c timefn.c fileio.c
++	$(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NODECOMPRESS -DZSTD_NOTRACE $^ -o $@
+ 
+ ## zstd-dictBuilder: executable supporting dictionary creation and compression (only)
+-zstd-dictBuilder: CPPFLAGS += -DZSTD_NOBENCH -DZSTD_NODECOMPRESS -DZSTD_NOTRACE
+-zstd-dictBuilder: $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) $(ZDICT_SRC) zstdcli.c util.c timefn.c fileio.c dibio.c
+-	$(CC) $(FLAGS) $^ -o $@$(EXT)
++zstd-dictBuilder$(EXT): CPPFLAGS += -DZSTD_NOBENCH -DZSTD_NODECOMPRESS -DZSTD_NOTRACE
++zstd-dictBuilder$(EXT): $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) $(ZDICT_SRC) zstdcli.c util.c timefn.c fileio.c dibio.c
++	$(CC) $(FLAGS) $^ -o $@
+ 
+-zstdmt: zstd
+-	ln -sf zstd zstdmt
++zstdmt$(EXT): zstd$(EXT)
++	ln -sf zstd$(EXT) zstdmt$(EXT)
+ 
+ .PHONY: generate_res
+ generate_res: $(RES64_FILE) $(RES32_FILE)
+-- 
+2.31.1
+
diff --git a/meta/recipes-extended/zstd/zstd_1.5.0.bb b/meta/recipes-extended/zstd/zstd_1.5.0.bb
index 9c95020743..806edb63c3 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.0.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
 
 SRC_URI = "git://github.com/facebook/zstd.git;branch=release \
            file://0001-Makefile-sort-all-wildcard-file-list-expansions.patch \
+           file://0001-MinGW-Build-Fixes.patch \
            "
 
 SRCREV = "a488ba114ec17ea1054b9057c26a046fc122b3b6"
-- 
2.31.1

