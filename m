Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.444.1615227180394828172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 10:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZFQoh5xA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso4367857wmi.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 10:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8jgvMoaolDZwyO5we90ldcwd55+agK0RpmUBAA65zZ4=;
        b=ZFQoh5xA/ebK3JIEEXo0aZnZOUkk3DUfXk92002plEi5xavnx7JYQq5cQf465NvDi0
         oI9D88p7UTdTyqmU5YTLxmyfuvxPMQJpPmlRWvj4pi53dhU6DotttFA9YQOOtv3zcLOS
         SigFELQTbIepXupUFa5WFSpWPBJWeaoDMTTF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8jgvMoaolDZwyO5we90ldcwd55+agK0RpmUBAA65zZ4=;
        b=WDIq2Up1vn8MzZ0vs5xqAodgE5P77v+JtP2R0wKHEwxOXpyKvXsFXYxj9g9wXX5kgy
         oL/ex2IcaM0qEEciS+oYrKEIKDNE1wWJ25/mLHdt7oz7qwMjuInQBHPDpPdaZLcgQcOy
         SvguYaOKO6Mb6Xg82RkzQ4B4BnY8XvSTH+BCi0AHSELCXpcnhRlsT0WGVDvUeE95dfty
         AhuqTgE7omaUj+fzWrqc2qlr0F1tOV2C3J04POJTZMPP6eiwyqByW1jAFQ6eaEPlIkaL
         NIiImD4/nxb1ttapBW/FQunaWLGZNTakDtXQWIonAZjM7UqrYbu06AKxu2NrziT+oeqw
         ts9A==
X-Gm-Message-State: AOAM532TEFBCRhhHpp0ktOCGb3Up7DO/oGKFijYficoIW3CFLy1ve0+H
	6LLS7qmfOU5yge29sHdulpCqUDIu7MyfoA==
X-Google-Smtp-Source: ABdhPJwW6owpQVIVZ40rL4pr7z2gAYwXLlcd0nElFuT+krz744om27ZuZUX60Uo2M3sSjA98nQhjBw==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr95010wmi.34.1615227178414;
        Mon, 08 Mar 2021 10:12:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3242:e265:217d:9509])
        by smtp.gmail.com with ESMTPSA id m14sm152899wmi.27.2021.03.08.10.12.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:12:58 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ltp: Further extend reproducibility patch
Date: Mon,  8 Mar 2021 18:12:57 +0000
Message-Id: <20210308181257.2420972-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Further issues were highlighted by autobuilder testing, extend the second patch
to cover them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ltp/ltp/determinism2.patch                | 267 ++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20210121.bb     |   4 +-
 2 files changed, 269 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp/determinism2.patch b/meta/recipes-extended/ltp/ltp/determinism2.patch
index ab08e8e5172..d786f4c2f9c 100644
--- a/meta/recipes-extended/ltp/ltp/determinism2.patch
+++ b/meta/recipes-extended/ltp/ltp/determinism2.patch
@@ -22,3 +22,270 @@ Index: git/testcases/kernel/io/disktest/Makefile
  
  disktest-$(VER):
  	mkdir -p "$@"
+Index: git/testcases/commands/ldd/datafiles/Makefile
+===================================================================
+--- git.orig/testcases/commands/ldd/datafiles/Makefile
++++ git/testcases/commands/ldd/datafiles/Makefile
+@@ -21,7 +21,7 @@ CPPFLAGS		+= -fpic
+ 
+ INSTALL_TARGETS		:= ldd*.so lddfile.out
+ 
+-LDD_C_FILES		:= $(wildcard $(abs_srcdir)/lddfile*.c)
++LDD_C_FILES		:= $(sort $(wildcard $(abs_srcdir)/lddfile*.c))
+ LDD_SO_FILES		:= $(patsubst $(abs_srcdir)/%.c,%.obj.so,$(LDD_C_FILES))
+ MAKE_TARGETS		:= lddfile.out
+ CLEAN_TARGETS		+= *.obj $(LDD_SO_FILES)
+Index: git/testcases/kernel/hotplug/memory_hotplug/Makefile
+===================================================================
+--- git.orig/testcases/kernel/hotplug/memory_hotplug/Makefile
++++ git/testcases/kernel/hotplug/memory_hotplug/Makefile
+@@ -31,6 +31,7 @@ LDLIBS		:= $(filter-out -lltp,$(LDLIBS))
+ 
+ MAKE_TARGETS	:= memtoy
+ 
+-memtoy: $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
++memtoy: $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
++
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+Index: git/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
+===================================================================
+--- git.orig/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
++++ git/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
+@@ -24,7 +24,7 @@ generate_locate_test_makefile() {
+ 
+ 	echo "Generating $maketype Makefiles"
+ 
+-	locate-test --$maketype | sed -e 's,^./,,g' | sort > make-gen.$maketype
++	locate-test --$maketype | sed -e 's,^./,,g' | LC_ALL=C sort > make-gen.$maketype
+ 
+ 	generate_makefiles make-gen.$maketype $*
+ 
+Index: git/testcases/kernel/syscalls/lchown/Makefile
+===================================================================
+--- git.orig/testcases/kernel/syscalls/lchown/Makefile
++++ git/testcases/kernel/syscalls/lchown/Makefile
+@@ -5,7 +5,7 @@ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
+-SRCS			:= $(wildcard $(abs_srcdir)/lchown*.c)
++SRCS			:= $(sort $(wildcard $(abs_srcdir)/lchown*.c))
+ 
+ include $(abs_srcdir)/../utils/compat_16.mk
+ 
+Index: git/testcases/kernel/syscalls/migrate_pages/Makefile
+===================================================================
+--- git.orig/testcases/kernel/syscalls/migrate_pages/Makefile
++++ git/testcases/kernel/syscalls/migrate_pages/Makefile
+@@ -5,7 +5,7 @@ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
+-MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
++MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*[0-9].c)))
+ $(MAKE_TARGETS): %: migrate_pages_common.o
+ 
+ CPPFLAGS		+= -I$(abs_srcdir)/../utils/
+Index: git/testcases/kernel/syscalls/utils/compat_16.mk
+===================================================================
+--- git.orig/testcases/kernel/syscalls/utils/compat_16.mk
++++ git/testcases/kernel/syscalls/utils/compat_16.mk
+@@ -50,7 +50,7 @@
+ 
+ CPPFLAGS		+= -I$(abs_srcdir) -I$(abs_srcdir)/../utils
+ 
+-SRCS			?= $(wildcard $(abs_srcdir)/*.c)
++SRCS			?= $(sort $(wildcard $(abs_srcdir)/*.c))
+ 
+ MAKE_TARGETS		:= $(notdir $(patsubst %.c,%,$(SRCS)))
+ MAKE_TARGETS_OBJS_WO_COMPAT_16	:= $(addsuffix .o,$(MAKE_TARGETS))
+Index: git/testcases/kernel/syscalls/utils/newer_64.mk
+===================================================================
+--- git.orig/testcases/kernel/syscalls/utils/newer_64.mk
++++ git/testcases/kernel/syscalls/utils/newer_64.mk
+@@ -25,7 +25,7 @@
+ 
+ CPPFLAGS		+= -I$(abs_srcdir) -I$(abs_srcdir)/../utils
+ 
+-SRCS			?= $(wildcard $(abs_srcdir)/*.c)
++SRCS			?= $(sort $(wildcard $(abs_srcdir)/*.c))
+ 
+ MAKE_TARGETS		:= $(notdir $(patsubst %.c,%,$(SRCS)))
+ 
+Index: git/include/mk/env_post.mk
+===================================================================
+--- git.orig/include/mk/env_post.mk
++++ git/include/mk/env_post.mk
+@@ -47,7 +47,7 @@ LDFLAGS				+= -L$(top_builddir)/lib/andr
+ LDFLAGS				+= -L$(top_builddir)/lib/android_librt
+ endif
+ 
+-MAKE_TARGETS			?= $(notdir $(patsubst %.c,%,$(wildcard $(abs_srcdir)/*.c)))
++MAKE_TARGETS			?= $(notdir $(patsubst %.c,%,$(sort $(wildcard $(abs_srcdir)/*.c))))
+ MAKE_TARGETS			:= $(filter-out $(FILTER_OUT_MAKE_TARGETS),$(MAKE_TARGETS))
+ 
+ # with only *.dwo, .[0-9]+.dwo can not be cleaned
+Index: git/include/mk/module.mk
+===================================================================
+--- git.orig/include/mk/module.mk
++++ git/include/mk/module.mk
+@@ -42,7 +42,7 @@ endif
+ 
+ ifneq ($(filter install clean,$(MAKECMDGOALS)),)
+ MAKE_TARGETS := $(filter-out %.ko, $(MAKE_TARGETS))
+-MAKE_TARGETS += $(wildcard *.ko)
++MAKE_TARGETS += $(sort $(wildcard *.ko))
+ endif
+ 
+ CLEAN_TARGETS += .dep_modules *.mod built-in.a
+Index: git/runtest/Makefile
+===================================================================
+--- git.orig/runtest/Makefile
++++ git/runtest/Makefile
+@@ -36,7 +36,7 @@ ifneq ($(WITH_POWER_MANAGEMENT_TESTSUITE
+ UNWANTED_FILES		+= power_management_tests
+ endif
+ 
+-INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(wildcard $(abs_srcdir)/*))))
++INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(sort $(wildcard $(abs_srcdir)/*)))))
+ 
+ MAKE_TARGETS		:=
+ 
+Index: git/scenario_groups/Makefile
+===================================================================
+--- git.orig/scenario_groups/Makefile
++++ git/scenario_groups/Makefile
+@@ -31,7 +31,7 @@ UNWANTED_FILES		:= Makefile
+ 
+ INSTALL_MODE		:= 00644
+ 
+-INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(wildcard $(abs_srcdir)/*))))
++INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(sort $(wildcard $(abs_srcdir)/*)))))
+ 
+ MAKE_TARGETS		:=
+ 
+Index: git/testcases/kernel/io/disktest/Makefile.linux
+===================================================================
+--- git.orig/testcases/kernel/io/disktest/Makefile.linux
++++ git/testcases/kernel/io/disktest/Makefile.linux
+@@ -167,8 +167,8 @@ mandir=/usr/share/man
+ 
+ VER=`grep VER_STR main.h | awk -F\" '{print $$2}'`
+ GBLHDRS=main.h globals.h defs.h
+-ALLHDRS=$(wildcard *.h)
+-SRCS=$(wildcard *.c)
++ALLHDRS=$(sort $(wildcard *.h))
++SRCS=$(sort $(wildcard *.c))
+ OBJS=$(SRCS:.c=.o)
+ 
+ CFLAGS += -g -Wall -O -D"LINUX" -D"_THREAD_SAFE" -D"_GNU_SOURCE" -D"_LARGE_FILES" -D"_LARGEFILE64_SOURCE" -D"_FILE_OFFSET_BITS=64" $(RPM_OPT_FLAGS)
+Index: git/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
+===================================================================
+--- git.orig/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
++++ git/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
+@@ -28,6 +28,6 @@ INSTALL_TARGETS		:= smt_smp_affinity.sh
+ 
+ MAKE_TARGETS		:= ht_affinity
+ 
+-$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
++$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+Index: git/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
+===================================================================
+--- git.orig/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
++++ git/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
+@@ -28,6 +28,6 @@ INSTALL_TARGETS		:= smt_smp_enabled.sh
+ 
+ MAKE_TARGETS		:= ht_enabled
+ 
+-$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
++$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+Index: git/testcases/kernel/sched/sched_stress/Makefile
+===================================================================
+--- git.orig/testcases/kernel/sched/sched_stress/Makefile
++++ git/testcases/kernel/sched/sched_stress/Makefile
+@@ -10,7 +10,7 @@ INSTALL_TARGETS		:= sched_stress.sh
+ 
+ LDLIBS			+= -lpthread
+ 
+-MAKE_TARGETS		:= $(filter-out sched,$(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*.c)))
++MAKE_TARGETS		:= $(filter-out sched,$(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*.c))))
+ 
+ RM			+= -r
+ 
+Index: git/testcases/kernel/syscalls/move_pages/Makefile
+===================================================================
+--- git.orig/testcases/kernel/syscalls/move_pages/Makefile
++++ git/testcases/kernel/syscalls/move_pages/Makefile
+@@ -7,7 +7,7 @@ include $(top_srcdir)/include/mk/testcas
+ 
+ CPPFLAGS		+= -I$(abs_srcdir)/../utils
+ 
+-MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
++MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*[0-9].c)))
+ 
+ $(MAKE_TARGETS): %: move_pages_support.o
+ 
+Index: git/testcases/misc/math/float/Makefile
+===================================================================
+--- git.orig/testcases/misc/math/float/Makefile
++++ git/testcases/misc/math/float/Makefile
+@@ -27,6 +27,6 @@ include $(top_srcdir)/include/mk/testcas
+ LDLIBS		+= -lpthread -lm
+ 
+ # main.c doesn't compile...
+-MAKE_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/float*.c))
++MAKE_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/float*.c)))
+ 
+ include $(top_srcdir)/include/mk/generic_trunk_target.mk
+Index: git/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
+===================================================================
+--- git.orig/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
++++ git/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
+@@ -104,7 +104,7 @@ static void *thread_fn(LTP_ATTRIBUTE_UNU
+ 				"\treturn 0;\n}\n";
+ 
+ 	const char make_buf_n[] = "CFLAGS := -O -w -g\n"
+-				  "SRCS=$(wildcard *.c)\n"
++				  "SRCS=$(sort $(wildcard *.c))\n"
+ 				  "TARGETS=$(SRCS:.c=)\n"
+ 				  "all: $(TARGETS)\n"
+ 				  "$(TARGETS): %: %.c\n"
+@@ -114,7 +114,7 @@ static void *thread_fn(LTP_ATTRIBUTE_UNU
+ 
+ 	const char make_buf[] = "CFLAGS := -O -w -g\n"
+ 				"SUBDIR = dir\n"
+-				"SRCS=$(wildcard *.c)\n"
++				"SRCS=$(sort $(wildcard *.c))\n"
+ 				"TARGETS=$(SRCS:.c=)\n"
+ 				"all: $(SUBDIR) $(TARGETS)\n"
+ 				"$(TARGETS): %: %.c\n"
+Index: git/testcases/network/nfsv4/locks/Makefile
+===================================================================
+--- git.orig/testcases/network/nfsv4/locks/Makefile
++++ git/testcases/network/nfsv4/locks/Makefile
+@@ -28,6 +28,6 @@ MAKE_TARGETS		:= locktests
+ 
+ LDLIBS			+= -lpthread
+ 
+-$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
++$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+Index: git/utils/sctp/func_tests/Makefile
+===================================================================
+--- git.orig/utils/sctp/func_tests/Makefile
++++ git/utils/sctp/func_tests/Makefile
+@@ -30,7 +30,7 @@ LDFLAGS		+= $(addprefix -L$(abs_builddir
+ 
+ LDLIBS		+= -lsctputil -lsctp -lpthread
+ 
+-V4_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*.c))
++V4_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*.c)))
+ 
+ V6_TARGETS	:= test_basic_v6 test_fragments_v6 test_getname_v6 \
+ 		   test_inaddr_any_v6 test_peeloff_v6 \
diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-extended/ltp/ltp_20210121.bb
index 325574a50e9..737c8b3ca17 100644
--- a/meta/recipes-extended/ltp/ltp_20210121.bb
+++ b/meta/recipes-extended/ltp/ltp_20210121.bb
@@ -30,8 +30,8 @@ CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "4d005621edd109d119627eb9210b224a63bf22cb"
 
 # remove at next version upgrade or when output changes
-PR = "r2"
-HASHEQUIV_HASH_VERSION .= ".2"
+PR = "r3"
+HASHEQUIV_HASH_VERSION .= ".3"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-build-Add-option-to-select-libc-implementation.patch \
-- 
2.27.0

