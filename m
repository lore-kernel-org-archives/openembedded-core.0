Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3774573196
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 04:53:55 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w11so1002561plp.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 21:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MDnMVDBOuXtk47AyqdRpbObJks3nLrEWKrurS6A5P1M=;
	b=ry3HOvZKzs4KSXytLV7DQAI5OCoE7pWheCUZExOHxI/jfpkuImaOFtlaJYIcxK8Gkh
	3fzT6kOX46bfmGzPKAKujTA3ehjeZaT/CTcA5mJdoolhRwuMgFIoEMikdnZ9MZpFzooL
	Q8mWF6Y+pKn9ETxESpaczgWdI71soiJIR2LHyJHbXGYWdI39RfGTQ5axhjGUQuCK+cQq
	YyAKSrr+42RHQfo8AuNMZPqd2TBUtJOF3EU61Fx4SfhgqdaMo/8KgFkk1w/9+3LtLP3R
	OkIQjSawQAJ5/e0TzGhgwYuWlqPi0sltX63ha9yeev1Nl+iuNsaNE2Q2rJYGfes99GZp
	hC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MDnMVDBOuXtk47AyqdRpbObJks3nLrEWKrurS6A5P1M=;
	b=E2V13P/sFfooiZ42AZxdPXfTRtprqigyHYB0m+c7wecfhkpFaruxyml/F3vlUppxSO
	/9Aw2+EriydTwZi2PrxdwflutfUVNV/+OOtarHAC3cz9R9zOQdq2l0X53PKCxZqPt2PS
	/g07rkZn4ezjlZ/poxsZ9SW8A6fDHEO9X+sAaTwH+oejb0/Vuv8+o9Di9TfPzmqajgbx
	oP4UQPt4P4jU5hWOpuoUTCdzhjsGLU7xz0ViNeymMkKaohJeycWs0ONwgElKHXIxeKNT
	O9c57kf6MZlwgZQrgV7LqW2OyD/TMQN9cfIq3QK4Az9RZ6VGOLFzk7/k1QRPWsLs1S+W
	cBDQ==
X-Gm-Message-State: APjAAAWwvzp5thJzii2eo/FkhEZAwWXTR3rHCujQgl6Fm+mQKmZP0xNG
	dIbA4j3+XF75I0rQKRGme+wBIz75t7w=
X-Google-Smtp-Source: APXvYqzgkVKdy9SwOTFq07E2Gu94VpcYE/AY1TbbN34yW7lu9idRWW17dZ7Ek2YY/4GiTEA3CYin9w==
X-Received: by 2002:a17:902:b590:: with SMTP id
	a16mr7966369pls.190.1567054435659; 
	Wed, 28 Aug 2019 21:53:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id l7sm1147918pff.35.2019.08.28.21.53.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 21:53:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 21:53:47 -0700
Message-Id: <20190829045347.8144-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] linux-yocto_5.2.bb: Fix build races in kernel-selftests
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
X-List-Received-Date: Thu, 29 Aug 2019 04:53:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...x-test_verifier-test_maps-make-depen.patch | 58 +++++++++++++
 ...ructure-test_-progs-maps-verifier-te.patch | 86 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  |  3 +
 3 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-selftests-bpf-fix-test_verifier-test_maps-make-depen.patch
 create mode 100644 meta/recipes-kernel/linux/files/0002-selftests-bpf-structure-test_-progs-maps-verifier-te.patch

diff --git a/meta/recipes-kernel/linux/files/0001-selftests-bpf-fix-test_verifier-test_maps-make-depen.patch b/meta/recipes-kernel/linux/files/0001-selftests-bpf-fix-test_verifier-test_maps-make-depen.patch
new file mode 100644
index 0000000000..e397b10cb4
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-selftests-bpf-fix-test_verifier-test_maps-make-depen.patch
@@ -0,0 +1,58 @@
+From 08a2303803397c98e0f279bb6fb22afc673786a3 Mon Sep 17 00:00:00 2001
+From: Andrii Nakryiko <andriin@fb.com>
+Date: Tue, 16 Jul 2019 12:38:36 -0700
+Subject: [PATCH 1/2] selftests/bpf: fix test_verifier/test_maps make
+ dependencies
+
+e46fc22e60a4 ("selftests/bpf: make directory prerequisites order-only")
+exposed existing problem in Makefile for test_verifier and test_maps tests:
+their dependency on auto-generated header file with a list of all tests wasn't
+recorded explicitly. This patch fixes these issues.
+
+Fixes: 51a0e301a563 ("bpf: Add BPF_MAP_TYPE_SK_STORAGE test to test_maps")
+Fixes: 6b7b6995c43e ("selftests: bpf: tests.h should depend on .c files, not the output")
+Cc: Ilya Leoshkevich <iii@linux.ibm.com>
+Cc: Stanislav Fomichev <sdf@google.com>
+Cc: Martin KaFai Lau <kafai@fb.com>
+Signed-off-by: Andrii Nakryiko <andriin@fb.com>
+Signed-off-by: Alexei Starovoitov <ast@kernel.org>
+---
+ tools/testing/selftests/bpf/Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
+index b9e88ccc289b..cd12bf414056 100644
+--- a/tools/testing/selftests/bpf/Makefile
++++ b/tools/testing/selftests/bpf/Makefile
+@@ -77,8 +77,6 @@ all: $(TEST_CUSTOM_PROGS)
+ $(OUTPUT)/urandom_read: $(OUTPUT)/%: %.c
+ 	$(CC) -o $@ $< -Wl,--build-id
+ 
+-$(OUTPUT)/test_maps: map_tests/*.c
+-
+ BPFOBJ := $(OUTPUT)/libbpf.a
+ 
+ $(TEST_GEN_PROGS): $(BPFOBJ)
+@@ -242,9 +240,10 @@ MAP_TESTS_DIR = $(OUTPUT)/map_tests
+ $(MAP_TESTS_DIR):
+ 	mkdir -p $@
+ MAP_TESTS_H := $(MAP_TESTS_DIR)/tests.h
++MAP_TESTS_FILES := $(wildcard map_tests/*.c)
+ test_maps.c: $(MAP_TESTS_H)
+ $(OUTPUT)/test_maps: CFLAGS += $(TEST_MAPS_CFLAGS)
+-MAP_TESTS_FILES := $(wildcard map_tests/*.c)
++$(OUTPUT)/test_maps: test_maps.c $(MAP_TESTS_H) $(MAP_TESTS_FILES)
+ $(MAP_TESTS_H): $(MAP_TESTS_DIR) $(MAP_TESTS_FILES)
+ 	$(shell ( cd map_tests/; \
+ 		  echo '/* Generated header, do not edit */'; \
+@@ -261,6 +260,7 @@ $(MAP_TESTS_H): $(MAP_TESTS_DIR) $(MAP_TESTS_FILES)
+ VERIFIER_TESTS_H := $(OUTPUT)/verifier/tests.h
+ test_verifier.c: $(VERIFIER_TESTS_H)
+ $(OUTPUT)/test_verifier: CFLAGS += $(TEST_VERIFIER_CFLAGS)
++$(OUTPUT)/test_verifier: test_verifier.c $(VERIFIER_TESTS_H)
+ 
+ VERIFIER_TESTS_DIR = $(OUTPUT)/verifier
+ $(VERIFIER_TESTS_DIR):
+-- 
+2.23.0
+
diff --git a/meta/recipes-kernel/linux/files/0002-selftests-bpf-structure-test_-progs-maps-verifier-te.patch b/meta/recipes-kernel/linux/files/0002-selftests-bpf-structure-test_-progs-maps-verifier-te.patch
new file mode 100644
index 0000000000..36692088b0
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0002-selftests-bpf-structure-test_-progs-maps-verifier-te.patch
@@ -0,0 +1,86 @@
+From 2fd88b60e6255206d46baa543a637aa1e1cc6186 Mon Sep 17 00:00:00 2001
+From: Andrii Nakryiko <andriin@fb.com>
+Date: Tue, 16 Jul 2019 12:38:37 -0700
+Subject: [PATCH 2/2] selftests/bpf: structure test_{progs, maps, verifier}
+ test runners uniformly
+
+It's easier to follow the logic if it's structured the same.
+There is just slight difference between test_progs/test_maps and
+test_verifier. test_verifier's verifier/*.c files are not really compilable
+C files (they are more of include headers), so they can't be specified as
+explicit dependencies of test_verifier.
+
+Cc: Alexei Starovoitov <ast@fb.com>
+Signed-off-by: Andrii Nakryiko <andriin@fb.com>
+Signed-off-by: Alexei Starovoitov <ast@kernel.org>
+---
+ tools/testing/selftests/bpf/Makefile | 24 ++++++++++--------------
+ 1 file changed, 10 insertions(+), 14 deletions(-)
+
+diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
+index cd12bf414056..b76c43eb5d4f 100644
+--- a/tools/testing/selftests/bpf/Makefile
++++ b/tools/testing/selftests/bpf/Makefile
+@@ -161,6 +161,7 @@ endif
+ endif
+ 
+ TEST_PROGS_CFLAGS := -I. -I$(OUTPUT)
++TEST_MAPS_CFLAGS := -I. -I$(OUTPUT)
+ TEST_VERIFIER_CFLAGS := -I. -I$(OUTPUT) -Iverifier
+ 
+ ifneq ($(SUBREG_CODEGEN),)
+@@ -212,16 +213,14 @@ ifeq ($(DWARF2BTF),y)
+ 	$(BTF_PAHOLE) -J $@
+ endif
+ 
+-PROG_TESTS_H := $(OUTPUT)/prog_tests/tests.h
+-test_progs.c: $(PROG_TESTS_H)
+-$(OUTPUT)/test_progs: CFLAGS += $(TEST_PROGS_CFLAGS)
+-$(OUTPUT)/test_progs: prog_tests/*.c
+-
+ PROG_TESTS_DIR = $(OUTPUT)/prog_tests
+ $(PROG_TESTS_DIR):
+ 	mkdir -p $@
+-
++PROG_TESTS_H := $(PROG_TESTS_DIR)/tests.h
+ PROG_TESTS_FILES := $(wildcard prog_tests/*.c)
++test_progs.c: $(PROG_TESTS_H)
++$(OUTPUT)/test_progs: CFLAGS += $(TEST_PROGS_CFLAGS)
++$(OUTPUT)/test_progs: test_progs.c $(PROG_TESTS_H) $(PROG_TESTS_FILES)
+ $(PROG_TESTS_H): $(PROG_TESTS_DIR) $(PROG_TESTS_FILES)
+ 	$(shell ( cd prog_tests/; \
+ 		  echo '/* Generated header, do not edit */'; \
+@@ -235,7 +234,6 @@ $(PROG_TESTS_H): $(PROG_TESTS_DIR) $(PROG_TESTS_FILES)
+ 		  echo '#endif' \
+ 		 ) > $(PROG_TESTS_H))
+ 
+-TEST_MAPS_CFLAGS := -I. -I$(OUTPUT)
+ MAP_TESTS_DIR = $(OUTPUT)/map_tests
+ $(MAP_TESTS_DIR):
+ 	mkdir -p $@
+@@ -257,17 +255,15 @@ $(MAP_TESTS_H): $(MAP_TESTS_DIR) $(MAP_TESTS_FILES)
+ 		  echo '#endif' \
+ 		 ) > $(MAP_TESTS_H))
+ 
+-VERIFIER_TESTS_H := $(OUTPUT)/verifier/tests.h
+-test_verifier.c: $(VERIFIER_TESTS_H)
+-$(OUTPUT)/test_verifier: CFLAGS += $(TEST_VERIFIER_CFLAGS)
+-$(OUTPUT)/test_verifier: test_verifier.c $(VERIFIER_TESTS_H)
+-
+ VERIFIER_TESTS_DIR = $(OUTPUT)/verifier
+ $(VERIFIER_TESTS_DIR):
+ 	mkdir -p $@
+-
++VERIFIER_TESTS_H := $(VERIFIER_TESTS_DIR)/tests.h
+ VERIFIER_TEST_FILES := $(wildcard verifier/*.c)
+-$(OUTPUT)/verifier/tests.h: $(VERIFIER_TESTS_DIR) $(VERIFIER_TEST_FILES)
++test_verifier.c: $(VERIFIER_TESTS_H)
++$(OUTPUT)/test_verifier: CFLAGS += $(TEST_VERIFIER_CFLAGS)
++$(OUTPUT)/test_verifier: test_verifier.c $(VERIFIER_TESTS_H)
++$(VERIFIER_TESTS_H): $(VERIFIER_TEST_FILES) | $(VERIFIER_TESTS_DIR)
+ 	$(shell ( cd verifier/; \
+ 		  echo '/* Generated header, do not edit */'; \
+ 		  echo '#ifdef FILL_ARRAY'; \
+-- 
+2.23.0
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index d873a1f2b3..b3cb51162b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -29,6 +29,9 @@ SRCREV_meta ?= "b53e99257175fd6f41f31e5ebec46c1bd11076b8"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
+SRC_URI += "file://0001-selftests-bpf-fix-test_verifier-test_maps-make-depen.patch \
+            file://0002-selftests-bpf-structure-test_-progs-maps-verifier-te.patch \
+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 LINUX_VERSION ?= "5.2.10"
 
-- 
2.23.0


