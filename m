Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3098C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:45 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.26279.1643278845121066675
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J9Gb9kaB;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id w11so3829689wra.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SPEfF5/hPDQ8oVxy+ltUs0IEDEzELZivw3RQbR1h7X0=;
        b=J9Gb9kaBFen4Su5v6KfBAQrVNwsh7IXFQdGc2bTa/yulKptOVoLbVg6ACamXSR6m/f
         9Emi7cuiV8+ZvNP17/PrtNhokTMH/f1AiRdYewcOXRiHicbrDC1K0C4nZlwBxLDTyMO8
         cuoYzFicS2pM6rcguFSDeriEnpn4KnGNBixVFTSB8R9r7GoBTMyWmXy+yQhRqw5mCsnv
         UX5yZOHwLTmLwkm1ahl1pBfqYkuOfk+mvmuuwRr7j8UqhUYcTOFhcZ9yMV5lTeoBsgyC
         xEzwgTlx1bZ/R/eK9Ni4T+WUFvn0OBMClg5Tl6vLxW7H76H4pXKeStXhAfOvCIvNKMzf
         keSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SPEfF5/hPDQ8oVxy+ltUs0IEDEzELZivw3RQbR1h7X0=;
        b=gcuAxCjeNqS97Etc5Akwhuu1A5YM0rjw8BcopOhFLiDQohJM0bzo7cHUYF/xwdZUTI
         vmsUCK+77ApFOK9YO2e3vcSt8yTC4r8PCV4YAmbhG9K2mr605j+aKexRNoMZZqftjNSQ
         nDGwGZGkFNXqb8ND/8or46NtiH7j/oi2XUhltgPjYDrsK1ERuFKvtiLBa7xLpKymkcgU
         62OYYlgmLRYO9xF8u7aWF+4LyBcMkn5KyGhAbZjbDZyuwF3MI6KmuGTai41SH68aJ45i
         d8cL6G2p2NhIvfjFohsm4m3wuVnzTWUzIoUXCn9H3u3xJyw+3ewYqNoyWsT7ij0JLW27
         Zl1g==
X-Gm-Message-State: AOAM531kXQMINmnF+tvwVVfKwi4ZBegFnrOJLSsX4jNyBMmo9tN+UMAC
	dDl7dMLbS01E0lsr2i144iZHfZtM+dw=
X-Google-Smtp-Source: 
 ABdhPJwF92L4XEJmMQHuWFCa4SzELMBA1RX0YkRJSz5Bae3sLj2l2kGzcr9eBQMYEZ5VKluo1Stffw==
X-Received: by 2002:a5d:604a:: with SMTP id j10mr2359444wrt.547.1643278843633;
        Thu, 27 Jan 2022 02:20:43 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH 11/17] zstd: update 1.5.0 -> 1.5.2
Date: Thu, 27 Jan 2022 11:19:59 +0100
Message-Id: <20220127102005.3050843-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161033

Drop patches merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rt-all-wildcard-file-list-expansions.patch |  81 --------
 .../zstd/zstd/0001-MinGW-Build-Fixes.patch    | 193 ------------------
 .../zstd/{zstd_1.5.0.bb => zstd_1.5.2.bb}     |   7 +-
 3 files changed, 2 insertions(+), 279 deletions(-)
 delete mode 100644 meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
 delete mode 100644 meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch
 rename meta/recipes-extended/zstd/{zstd_1.5.0.bb => zstd_1.5.2.bb} (86%)

diff --git a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
deleted file mode 100644
index 3d23648f5b..0000000000
--- a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 77c7963c7a0f1c455f20520d5c7b1ec9b17a44fb Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 23 Dec 2020 19:14:32 +0100
-Subject: [PATCH] Makefile: sort all wildcard file list expansions
-
-Otherwise the order is non-deterministic and breaks
-reproducible builds.
-
-Upstream-Status: Submitted [https://github.com/facebook/zstd/pull/2895]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- programs/Makefile   | 10 +++++-----
- tests/Makefile      |  4 ++--
- tests/fuzz/Makefile |  2 +-
- 3 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/programs/Makefile b/programs/Makefile
-index 599fb02f..2c416467 100644
---- a/programs/Makefile
-+++ b/programs/Makefile
-@@ -74,11 +74,11 @@ ZSTDLEGACY_DIR := $(ZSTDDIR)/legacy
- 
- vpath %.c $(ZSTDLIB_COMMON) $(ZSTDLIB_COMPRESS) $(ZSTDLIB_DECOMPRESS) $(ZDICT_DIR) $(ZSTDLEGACY_DIR)
- 
--ZSTDLIB_COMMON_C := $(wildcard $(ZSTDLIB_COMMON)/*.c)
--ZSTDLIB_COMPRESS_C := $(wildcard $(ZSTDLIB_COMPRESS)/*.c)
--ZSTDLIB_DECOMPRESS_C := $(wildcard $(ZSTDLIB_DECOMPRESS)/*.c)
-+ZSTDLIB_COMMON_C := $(sort $(wildcard $(ZSTDLIB_COMMON)/*.c))
-+ZSTDLIB_COMPRESS_C := $(sort $(wildcard $(ZSTDLIB_COMPRESS)/*.c))
-+ZSTDLIB_DECOMPRESS_C := $(sort $(wildcard $(ZSTDLIB_DECOMPRESS)/*.c))
- ZSTDLIB_CORE_SRC := $(ZSTDLIB_DECOMPRESS_C) $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C)
--ZDICT_SRC := $(wildcard $(ZDICT_DIR)/*.c)
-+ZDICT_SRC := $(sort $(wildcard $(ZDICT_DIR)/*.c))
- 
- ZSTD_LEGACY_SUPPORT ?= 5
- ZSTDLEGACY_SRC :=
-@@ -93,7 +93,7 @@ ZSTDLIB_FULL_SRC = $(sort $(ZSTDLIB_CORE_SRC) $(ZSTDLEGACY_SRC) $(ZDICT_SRC))
- ZSTDLIB_LOCAL_SRC = $(notdir $(ZSTDLIB_FULL_SRC))
- ZSTDLIB_LOCAL_OBJ := $(ZSTDLIB_LOCAL_SRC:.c=.o)
- 
--ZSTD_CLI_SRC := $(wildcard *.c)
-+ZSTD_CLI_SRC := $(sort $(wildcard *.c))
- ZSTD_CLI_OBJ := $(ZSTD_CLI_SRC:.c=.o)
- 
- ZSTD_ALL_SRC = $(ZSTDLIB_LOCAL_SRC) $(ZSTD_CLI_SRC)
-diff --git a/tests/Makefile b/tests/Makefile
-index 85553007..b71cdba8 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -49,7 +49,7 @@ ZSTDDECOMP_FILES := $(ZSTDDIR)/decompress/*.c
- ZSTD_FILES  := $(ZSTDDECOMP_FILES) $(ZSTDCOMMON_FILES) $(ZSTDCOMP_FILES)
- ZDICT_FILES := $(ZSTDDIR)/dictBuilder/*.c
- 
--ZSTD_F1 := $(wildcard $(ZSTD_FILES))
-+ZSTD_F1 := $(sort $(wildcard $(ZSTD_FILES)))
- ZSTD_OBJ1 := $(subst $(ZSTDDIR)/common/,zstdm_,$(ZSTD_F1))
- ZSTD_OBJ2 := $(subst $(ZSTDDIR)/compress/,zstdc_,$(ZSTD_OBJ1))
- ZSTD_OBJ3 := $(subst $(ZSTDDIR)/decompress/,zstdd_,$(ZSTD_OBJ2))
-@@ -202,7 +202,7 @@ bigdict: $(ZSTDMT_OBJECTS) $(PRGDIR)/datagen.c bigdict.c
- invalidDictionaries : $(ZSTD_OBJECTS) invalidDictionaries.c
- 
- legacy : CPPFLAGS += -I$(ZSTDDIR)/legacy -DZSTD_LEGACY_SUPPORT=4
--legacy : $(ZSTD_FILES) $(wildcard $(ZSTDDIR)/legacy/*.c) legacy.c
-+legacy : $(ZSTD_FILES) $(sort $(wildcard $(ZSTDDIR)/legacy/*.c)) legacy.c
- 
- decodecorpus : LDLIBS += -lm
- decodecorpus : $(filter-out zstdc_zstd_compress.o, $(ZSTD_OBJECTS)) $(ZDICT_FILES) $(PRGDIR)/util.c $(PRGDIR)/timefn.c decodecorpus.c
-diff --git a/tests/fuzz/Makefile b/tests/fuzz/Makefile
-index ccb574b7..b1cb2935 100644
---- a/tests/fuzz/Makefile
-+++ b/tests/fuzz/Makefile
-@@ -62,7 +62,7 @@ FUZZ_SRC       := \
- 	$(ZSTDCOMP_SRC) \
- 	$(ZSTDDICT_SRC) \
- 	$(ZSTDLEGACY_SRC)
--FUZZ_SRC := $(wildcard $(FUZZ_SRC))
-+FUZZ_SRC := $(sort $(wildcard $(FUZZ_SRC)))
- 
- FUZZ_D_OBJ1 := $(subst $(ZSTDDIR)/common/,d_lib_common_,$(FUZZ_SRC))
- FUZZ_D_OBJ2 := $(subst $(ZSTDDIR)/compress/,d_lib_compress_,$(FUZZ_D_OBJ1))
diff --git a/meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch b/meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch
deleted file mode 100644
index a0e00dca03..0000000000
--- a/meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-From ab9a34c92eec815ef214470c927ddbe2e950e7e5 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Wed, 26 May 2021 09:15:40 -0500
-Subject: [PATCH] MinGW Build Fixes
-
-Fixes building on MinGW by
- 1) Exporting the OS variable so that it is visible to sub-make
-    invocations
- 2) Fixing the extension handling so that make correctly identifies when
-    targets need to be rebuilt. Without the correct handling, make would
-    rebuild the executable targets when running `make install` because
-    it couldn't find them with the correct extension.
-
-Upstream-Status: Submitted [https://github.com/facebook/zstd/pull/2685]
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- Makefile          |  1 +
- programs/Makefile | 74 +++++++++++++++++++++++------------------------
- 2 files changed, 38 insertions(+), 37 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index c1908f0a..f9ce9504 100644
---- a/Makefile
-+++ b/Makefile
-@@ -29,6 +29,7 @@ VOID = /dev/null
- # fail on other tested distros (ubuntu, debian) even
- # without manually specifying the TARGET_SYSTEM.
- TARGET_SYSTEM ?= $(OS)
-+export OS
- 
- ifneq (,$(filter Windows%,$(TARGET_SYSTEM)))
-   EXT =.exe
-diff --git a/programs/Makefile b/programs/Makefile
-index 599fb02f..79b45c83 100644
---- a/programs/Makefile
-+++ b/programs/Makefile
-@@ -209,37 +209,37 @@ SET_CACHE_DIRECTORY = \
- 
- 
- .PHONY: all
--all: zstd
-+all: zstd$(EXT)
- 
- .PHONY: allVariants
--allVariants: zstd zstd-compress zstd-decompress zstd-small zstd-nolegacy zstd-dictBuilder
-+allVariants: zstd$(EXT) zstd-compress$(EXT) zstd-decompress$(EXT) zstd-small$(EXT) zstd-nolegacy$(EXT) zstd-dictBuilder$(EXT)
- 
- .PHONY: zstd  # must always be run
--zstd : CPPFLAGS += $(THREAD_CPP) $(ZLIBCPP) $(LZMACPP) $(LZ4CPP)
--zstd : LDFLAGS += $(THREAD_LD) $(DEBUGFLAGS_LD)
--zstd : LDLIBS += $(ZLIBLD) $(LZMALD) $(LZ4LD)
--zstd : CPPFLAGS += -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
-+zstd$(EXT) : CPPFLAGS += $(THREAD_CPP) $(ZLIBCPP) $(LZMACPP) $(LZ4CPP)
-+zstd$(EXT) : LDFLAGS += $(THREAD_LD) $(DEBUGFLAGS_LD)
-+zstd$(EXT) : LDLIBS += $(ZLIBLD) $(LZMALD) $(LZ4LD)
-+zstd$(EXT) : CPPFLAGS += -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
- ifneq (,$(filter Windows%,$(OS)))
--zstd : $(RES_FILE)
-+zstd$(EXT) : $(RES_FILE)
- endif
- 
- ifndef BUILD_DIR
- # generate BUILD_DIR from flags
- 
--zstd:
-+zstd$(EXT):
- 	$(SET_CACHE_DIRECTORY)
- 
- else
- # BUILD_DIR is defined
- 
- ZSTD_OBJ := $(addprefix $(BUILD_DIR)/, $(ZSTD_ALL_OBJ))
--$(BUILD_DIR)/zstd : $(ZSTD_OBJ)
-+$(BUILD_DIR)/zstd$(EXT) : $(ZSTD_OBJ)
- 	@echo "$(THREAD_MSG)"
- 	@echo "$(ZLIB_MSG)"
- 	@echo "$(LZMA_MSG)"
- 	@echo "$(LZ4_MSG)"
- 	@echo LINK $@
--	$(CC) $(FLAGS) $^ $(LDLIBS) -o $@$(EXT)
-+	$(CC) $(FLAGS) $^ $(LDLIBS) -o $@
- 
- ifeq ($(HAVE_HASH),1)
- SRCBIN_HASH = $(shell cat $(BUILD_DIR)/zstd 2> $(VOID) | $(HASH) | cut -f 1 -d " ")
-@@ -249,7 +249,7 @@ else
- BIN_ISDIFFERENT = 1
- endif
- 
--zstd : $(BUILD_DIR)/zstd
-+zstd$(EXT) : $(BUILD_DIR)/zstd$(EXT)
- 	if [ $(BIN_ISDIFFERENT) -eq 1 ]; then \
- 		cp -f $< $@; \
- 		echo zstd build completed; \
-@@ -263,46 +263,46 @@ endif  # BUILD_DIR
- .PHONY: zstd-release
- zstd-release: DEBUGFLAGS := -DBACKTRACE_ENABLE=0
- zstd-release: DEBUGFLAGS_LD :=
--zstd-release: zstd
-+zstd-release: zstd$(EXT)
- 
--zstd32 : CPPFLAGS += $(THREAD_CPP)
--zstd32 : LDFLAGS  += $(THREAD_LD)
--zstd32 : CPPFLAGS += -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
-+zstd32$(EXT) : CPPFLAGS += $(THREAD_CPP)
-+zstd32$(EXT) : LDFLAGS  += $(THREAD_LD)
-+zstd32$(EXT) : CPPFLAGS += -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
- ifneq (,$(filter Windows%,$(OS)))
--zstd32 : $(RES32_FILE)
-+zstd32$(EXT) : $(RES32_FILE)
- endif
--zstd32 : $(ZSTDLIB_FULL_SRC) $(ZSTD_CLI_SRC)
--	$(CC) -m32 $(FLAGS) $^ -o $@$(EXT)
-+zstd32$(EXT) : $(ZSTDLIB_FULL_SRC) $(ZSTD_CLI_SRC)
-+	$(CC) -m32 $(FLAGS) $^ -o $@
- 
- ## zstd-nolegacy: same scope as zstd, with just support of legacy formats removed
--zstd-nolegacy : LDFLAGS += $(THREAD_LD) $(ZLIBLD) $(LZMALD) $(LZ4LD) $(DEBUGFLAGS_LD)
--zstd-nolegacy : $(ZSTDLIB_CORE_SRC) $(ZDICT_SRC) $(ZSTD_CLI_OBJ)
--	$(CC) $(FLAGS) $^ -o $@$(EXT) $(LDFLAGS)
-+zstd-nolegacy$(EXT) : LDFLAGS += $(THREAD_LD) $(ZLIBLD) $(LZMALD) $(LZ4LD) $(DEBUGFLAGS_LD)
-+zstd-nolegacy$(EXT) : $(ZSTDLIB_CORE_SRC) $(ZDICT_SRC) $(ZSTD_CLI_OBJ)
-+	$(CC) $(FLAGS) $^ -o $@ $(LDFLAGS)
- 
- .PHONY: zstd-nomt
- zstd-nomt : THREAD_CPP :=
- zstd-nomt : THREAD_LD  :=
- zstd-nomt : THREAD_MSG := - multi-threading disabled
--zstd-nomt : zstd
-+zstd-nomt : zstd$(EXT)
- 
- .PHONY: zstd-nogz
- zstd-nogz : ZLIBCPP :=
- zstd-nogz : ZLIBLD  :=
- zstd-nogz : ZLIB_MSG := - gzip support is disabled
--zstd-nogz : zstd
-+zstd-nogz : zstd$(EXT)
- 
- .PHONY: zstd-noxz
- zstd-noxz : LZMACPP :=
- zstd-noxz : LZMALD  :=
- zstd-noxz : LZMA_MSG := - xz/lzma support is disabled
--zstd-noxz : zstd
-+zstd-noxz : zstd$(EXT)
- 
- ## zstd-dll: zstd executable linked to dynamic library libzstd (must have same version)
- .PHONY: zstd-dll
- zstd-dll : LDFLAGS+= -L$(ZSTDDIR)
- zstd-dll : LDLIBS += -lzstd
- zstd-dll : ZSTDLIB_LOCAL_SRC = xxhash.c
--zstd-dll : zstd
-+zstd-dll : zstd$(EXT)
- 
- 
- ## zstd-pgo: zstd executable optimized with PGO.
-@@ -321,23 +321,23 @@ zstd-pgo :
- 	$(MAKE) zstd MOREFLAGS=-fprofile-use
- 
- ## zstd-small: minimal target, supporting only zstd compression and decompression. no bench. no legacy. no other format.
--zstd-small: CFLAGS = -Os -s
--zstd-frugal zstd-small: $(ZSTDLIB_CORE_SRC) zstdcli.c util.c timefn.c fileio.c
--	$(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NOTRACE $^ -o $@$(EXT)
-+zstd-small$(EXT): CFLAGS = -Os -s
-+zstd-frugal$(EXT) zstd-small$(EXT): $(ZSTDLIB_CORE_SRC) zstdcli.c util.c timefn.c fileio.c
-+	$(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NOTRACE $^ -o $@
- 
--zstd-decompress: $(ZSTDLIB_COMMON_C) $(ZSTDLIB_DECOMPRESS_C) zstdcli.c util.c timefn.c fileio.c
--	$(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NOCOMPRESS -DZSTD_NOTRACE $^ -o $@$(EXT)
-+zstd-decompress$(EXT): $(ZSTDLIB_COMMON_C) $(ZSTDLIB_DECOMPRESS_C) zstdcli.c util.c timefn.c fileio.c
-+	$(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NOCOMPRESS -DZSTD_NOTRACE $^ -o $@
- 
--zstd-compress: $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) zstdcli.c util.c timefn.c fileio.c
--	$(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NODECOMPRESS -DZSTD_NOTRACE $^ -o $@$(EXT)
-+zstd-compress$(EXT): $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) zstdcli.c util.c timefn.c fileio.c
-+	$(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NODECOMPRESS -DZSTD_NOTRACE $^ -o $@
- 
- ## zstd-dictBuilder: executable supporting dictionary creation and compression (only)
--zstd-dictBuilder: CPPFLAGS += -DZSTD_NOBENCH -DZSTD_NODECOMPRESS -DZSTD_NOTRACE
--zstd-dictBuilder: $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) $(ZDICT_SRC) zstdcli.c util.c timefn.c fileio.c dibio.c
--	$(CC) $(FLAGS) $^ -o $@$(EXT)
-+zstd-dictBuilder$(EXT): CPPFLAGS += -DZSTD_NOBENCH -DZSTD_NODECOMPRESS -DZSTD_NOTRACE
-+zstd-dictBuilder$(EXT): $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) $(ZDICT_SRC) zstdcli.c util.c timefn.c fileio.c dibio.c
-+	$(CC) $(FLAGS) $^ -o $@
- 
--zstdmt: zstd
--	ln -sf zstd zstdmt
-+zstdmt$(EXT): zstd$(EXT)
-+	ln -sf zstd$(EXT) zstdmt$(EXT)
- 
- .PHONY: generate_res
- generate_res: $(RES64_FILE) $(RES32_FILE)
--- 
-2.31.1
-
diff --git a/meta/recipes-extended/zstd/zstd_1.5.0.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
similarity index 86%
rename from meta/recipes-extended/zstd/zstd_1.5.0.bb
rename to meta/recipes-extended/zstd/zstd_1.5.2.bb
index 51305d0562..71f439ef57 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.0.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
@@ -9,12 +9,9 @@ LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https \
-           file://0001-Makefile-sort-all-wildcard-file-list-expansions.patch \
-           file://0001-MinGW-Build-Fixes.patch \
-           "
+SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https"
 
-SRCREV = "a488ba114ec17ea1054b9057c26a046fc122b3b6"
+SRCREV = "e47e674cd09583ff0503f0f6defd6d23d8b718d3"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
-- 
2.20.1


