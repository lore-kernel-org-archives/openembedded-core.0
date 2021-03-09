Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.11803.1615308246142667431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 08:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b6JDtfYl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id v15so16972178wrx.4
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 08:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/RdMDoUcrxSG74YgzIxX8l3rdk0Zv/b0yXCbETcdGUo=;
        b=b6JDtfYlxedstGprIiXL4UrKQptmCrumttQbFL4L0U85RsEr54P1xQRmuVB0EvyZwF
         hCFDnmZpVYiSZ7JRa0+GLhWj0Yb23zshl0A2VjR6F0KDJyRDrf4AXun6s8IWCozwDvdP
         V7Vw4Kg2TW/hzk6ITrS5AIQE2MR+djbkpoGMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/RdMDoUcrxSG74YgzIxX8l3rdk0Zv/b0yXCbETcdGUo=;
        b=guQN5iQUnJAGRBZSVc+U55lExl9l32//4pNt93A6XcFQ+1VaJPO3w1NrNT1anySQ32
         E9Iot6Udv7BfcXiMx2zxQNWFKmYfmiKoz1we+srDTBB51ygRCBB2jMFHMpGi7VoPAypo
         P5ssnY2a7KRc4YylaM+5T9eHKA3q79/0UfAICYGydB0m9c73QxmnVWt0S8BS3JqiGZML
         VSNwmIW6ABDq8MBZzbyLJluNvNieFnOpwMWRdF3uWUF0bza/5YJ5HBhtcOScp/9figRS
         4gW+MGqS6YluR+BAH2/PkYkj4rn26GfL9jutF129O/X58v2odWCa5RNsYsWy+In/ASCx
         X9AA==
X-Gm-Message-State: AOAM533y0s199Le9JQ6TNRKIRyCxA1OhgwGpuTa8j/hY38xOE8hFBUnS
	10kPhJj5G1Cm3ZHNCOC6BnNUAgGuayaICw==
X-Google-Smtp-Source: ABdhPJzz//o8FTI5PoypjauiR27TDKZOMROltZTYSBsdMYCkUImPFd0evq25JXhwDa2KCDCEqC9peA==
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr28686395wrc.48.1615308243521;
        Tue, 09 Mar 2021 08:44:03 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e1d9:50e9:2ad6:a226])
        by smtp.gmail.com with ESMTPSA id d16sm24361072wrx.79.2021.03.09.08.44.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:44:03 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] ltp: Fix determinism issue
Date: Tue,  9 Mar 2021 16:44:01 +0000
Message-Id: <20210309164402.2460149-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There was still a remaining issue with reporoducibility based upon the
make version from the host system. Some versions added whitespace for
XXX+=<tab> (e.g. 4.1) and some versions do not (e.g. 4.3).

Replace the determinism patches with those submitted upstream both
for this issue and the previous one.

The LC_ALL setting for sort is dropped as it didn't fix an issue as hoped.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...uite-generate-makefiles.sh-Avoid-inc.patch |  40 +++
 ...le-Avoid-wildcard-determinism-issues.patch | 310 ++++++++++++++++++
 .../ltp/ltp/determinism2.patch                | 291 ----------------
 meta/recipes-extended/ltp/ltp_20210121.bb     |   7 +-
 4 files changed, 354 insertions(+), 294 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0002-Makefile-Avoid-wildcard-determinism-issues.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/determinism2.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch b/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch
new file mode 100644
index 00000000000..c2a70dcb679
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch
@@ -0,0 +1,40 @@
+From 2d1d6350af1db28ec520e26d0069a0518950b0a1 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 9 Mar 2021 15:21:11 +0000
+Subject: [PATCH 1/3] open_posix_testsuite/generate-makefiles.sh: Avoid
+ inconsistencies with make version
+
+With make 4.1, INSTALL_TARGETS+=<tab> will add a space to the variable whereas
+with make 4.3, it will not. This leads to differing run.sh files in installed
+in packages which is undesireable. If tests is empty we don't have to add
+the line to the makefiles at all which seems like the easiest way to
+avoid the differences in make behaviour.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2021-March/021386.html]
+
+---
+ .../open_posix_testsuite/scripts/generate-makefiles.sh      | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/testcases/open_posix_testsuite/scripts/generate-makefiles.sh b/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
+index 200a631db..4b3aaa4a0 100755
+--- a/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
++++ b/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
+@@ -148,8 +148,12 @@ EOF
+ 
+ 	fi
+ 
+-	cat >> "$makefile.2" <<EOF
++	if [ ! -z "${tests}" ]; then
++		cat >> "$makefile.2" <<EOF
+ INSTALL_TARGETS+=	${tests}
++EOF
++	fi
++	cat >> "$makefile.2" <<EOF
+ MAKE_TARGETS+=		${targets}
+ 
+ EOF
+-- 
+2.27.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0002-Makefile-Avoid-wildcard-determinism-issues.patch b/meta/recipes-extended/ltp/ltp/0002-Makefile-Avoid-wildcard-determinism-issues.patch
new file mode 100644
index 00000000000..4859c3eaeda
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0002-Makefile-Avoid-wildcard-determinism-issues.patch
@@ -0,0 +1,310 @@
+From 4030e28f2c2296ba138cb5e2495202f8aec7ba32 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 9 Mar 2021 15:21:36 +0000
+Subject: [PATCH 2/3] Makefile: Avoid wildcard determinism issues
+
+wildcard used in Makefiles preserves the order of the files on disk
+which leads to differences in the order the binaries are linked.
+
+This patch tweaks the usage of wildcard to also have a sort, making
+the binaries reproducible. A previous patch massively improved
+the situation but wider testing showed that these other changes can
+have an effect on some binaries, this patch avoids those issues as
+exposed by our wider testing.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2021-March/021388.html]
+
+---
+ include/mk/env_post.mk                                     | 2 +-
+ include/mk/module.mk                                       | 2 +-
+ runtest/Makefile                                           | 2 +-
+ scenario_groups/Makefile                                   | 2 +-
+ testcases/commands/ldd/datafiles/Makefile                  | 2 +-
+ testcases/kernel/hotplug/memory_hotplug/Makefile           | 3 ++-
+ testcases/kernel/io/disktest/Makefile                      | 2 +-
+ testcases/kernel/io/disktest/Makefile.linux                | 4 ++--
+ testcases/kernel/sched/hyperthreading/ht_affinity/Makefile | 2 +-
+ testcases/kernel/sched/hyperthreading/ht_enabled/Makefile  | 2 +-
+ testcases/kernel/sched/sched_stress/Makefile               | 2 +-
+ testcases/kernel/syscalls/lchown/Makefile                  | 2 +-
+ testcases/kernel/syscalls/migrate_pages/Makefile           | 2 +-
+ testcases/kernel/syscalls/move_pages/Makefile              | 2 +-
+ testcases/kernel/syscalls/utils/compat_16.mk               | 2 +-
+ testcases/kernel/syscalls/utils/newer_64.mk                | 2 +-
+ testcases/misc/math/float/Makefile                         | 2 +-
+ testcases/network/nfs/nfs_stress/nfs05_make_tree.c         | 4 ++--
+ testcases/network/nfsv4/locks/Makefile                     | 2 +-
+ utils/sctp/func_tests/Makefile                             | 2 +-
+ 20 files changed, 23 insertions(+), 22 deletions(-)
+
+diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
+index d52ad9f0b..1d22f9c53 100644
+--- a/include/mk/env_post.mk
++++ b/include/mk/env_post.mk
+@@ -47,7 +47,7 @@ LDFLAGS				+= -L$(top_builddir)/lib/android_libpthread
+ LDFLAGS				+= -L$(top_builddir)/lib/android_librt
+ endif
+ 
+-MAKE_TARGETS			?= $(notdir $(patsubst %.c,%,$(wildcard $(abs_srcdir)/*.c)))
++MAKE_TARGETS			?= $(notdir $(patsubst %.c,%,$(sort $(wildcard $(abs_srcdir)/*.c))))
+ MAKE_TARGETS			:= $(filter-out $(FILTER_OUT_MAKE_TARGETS),$(MAKE_TARGETS))
+ 
+ # with only *.dwo, .[0-9]+.dwo can not be cleaned
+diff --git a/include/mk/module.mk b/include/mk/module.mk
+index 95fb8336a..6c8814b96 100644
+--- a/include/mk/module.mk
++++ b/include/mk/module.mk
+@@ -42,7 +42,7 @@ endif
+ 
+ ifneq ($(filter install clean,$(MAKECMDGOALS)),)
+ MAKE_TARGETS := $(filter-out %.ko, $(MAKE_TARGETS))
+-MAKE_TARGETS += $(wildcard *.ko)
++MAKE_TARGETS += $(sort $(wildcard *.ko))
+ endif
+ 
+ CLEAN_TARGETS += .dep_modules *.mod built-in.a
+diff --git a/runtest/Makefile b/runtest/Makefile
+index b7caaee06..6a1565b6a 100644
+--- a/runtest/Makefile
++++ b/runtest/Makefile
+@@ -36,7 +36,7 @@ ifneq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
+ UNWANTED_FILES		+= power_management_tests
+ endif
+ 
+-INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(wildcard $(abs_srcdir)/*))))
++INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(sort $(wildcard $(abs_srcdir)/*)))))
+ 
+ MAKE_TARGETS		:=
+ 
+diff --git a/scenario_groups/Makefile b/scenario_groups/Makefile
+index 2978675d9..fcbc92708 100644
+--- a/scenario_groups/Makefile
++++ b/scenario_groups/Makefile
+@@ -31,7 +31,7 @@ UNWANTED_FILES		:= Makefile
+ 
+ INSTALL_MODE		:= 00644
+ 
+-INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(wildcard $(abs_srcdir)/*))))
++INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(sort $(wildcard $(abs_srcdir)/*)))))
+ 
+ MAKE_TARGETS		:=
+ 
+diff --git a/testcases/commands/ldd/datafiles/Makefile b/testcases/commands/ldd/datafiles/Makefile
+index d8bcf5c06..01c352052 100644
+--- a/testcases/commands/ldd/datafiles/Makefile
++++ b/testcases/commands/ldd/datafiles/Makefile
+@@ -21,7 +21,7 @@ CPPFLAGS		+= -fpic
+ 
+ INSTALL_TARGETS		:= ldd*.so lddfile.out
+ 
+-LDD_C_FILES		:= $(wildcard $(abs_srcdir)/lddfile*.c)
++LDD_C_FILES		:= $(sort $(wildcard $(abs_srcdir)/lddfile*.c))
+ LDD_SO_FILES		:= $(patsubst $(abs_srcdir)/%.c,%.obj.so,$(LDD_C_FILES))
+ MAKE_TARGETS		:= lddfile.out
+ CLEAN_TARGETS		+= *.obj $(LDD_SO_FILES)
+diff --git a/testcases/kernel/hotplug/memory_hotplug/Makefile b/testcases/kernel/hotplug/memory_hotplug/Makefile
+index d1ba65e65..38a77a2ba 100644
+--- a/testcases/kernel/hotplug/memory_hotplug/Makefile
++++ b/testcases/kernel/hotplug/memory_hotplug/Makefile
+@@ -31,6 +31,7 @@ LDLIBS		:= $(filter-out -lltp,$(LDLIBS))
+ 
+ MAKE_TARGETS	:= memtoy
+ 
+-memtoy: $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
++memtoy: $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
++
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+diff --git a/testcases/kernel/io/disktest/Makefile b/testcases/kernel/io/disktest/Makefile
+index d10d98434..3a3a9cbf0 100644
+--- a/testcases/kernel/io/disktest/Makefile
++++ b/testcases/kernel/io/disktest/Makefile
+@@ -209,7 +209,7 @@ LDLIBS		+= -lpthread
+ 
+ MAKE_TARGETS	:= disktest
+ 
+-OBJS		:= $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
++OBJS		:= $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
+ 
+ disktest-$(VER):
+ 	mkdir -p "$@"
+diff --git a/testcases/kernel/io/disktest/Makefile.linux b/testcases/kernel/io/disktest/Makefile.linux
+index ea45b5a57..0f3aab622 100644
+--- a/testcases/kernel/io/disktest/Makefile.linux
++++ b/testcases/kernel/io/disktest/Makefile.linux
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
+diff --git a/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile b/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
+index 10fec96dc..6b64bd261 100644
+--- a/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
++++ b/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
+@@ -28,6 +28,6 @@ INSTALL_TARGETS		:= smt_smp_affinity.sh
+ 
+ MAKE_TARGETS		:= ht_affinity
+ 
+-$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
++$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+diff --git a/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile b/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
+index 9c1e139d6..585ff1383 100644
+--- a/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
++++ b/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
+@@ -28,6 +28,6 @@ INSTALL_TARGETS		:= smt_smp_enabled.sh
+ 
+ MAKE_TARGETS		:= ht_enabled
+ 
+-$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
++$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+diff --git a/testcases/kernel/sched/sched_stress/Makefile b/testcases/kernel/sched/sched_stress/Makefile
+index b76126c73..4dbbf3477 100644
+--- a/testcases/kernel/sched/sched_stress/Makefile
++++ b/testcases/kernel/sched/sched_stress/Makefile
+@@ -10,7 +10,7 @@ INSTALL_TARGETS		:= sched_stress.sh
+ 
+ LDLIBS			+= -lpthread
+ 
+-MAKE_TARGETS		:= $(filter-out sched,$(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*.c)))
++MAKE_TARGETS		:= $(filter-out sched,$(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*.c))))
+ 
+ RM			+= -r
+ 
+diff --git a/testcases/kernel/syscalls/lchown/Makefile b/testcases/kernel/syscalls/lchown/Makefile
+index 13d39cb81..305fee281 100644
+--- a/testcases/kernel/syscalls/lchown/Makefile
++++ b/testcases/kernel/syscalls/lchown/Makefile
+@@ -5,7 +5,7 @@ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
+-SRCS			:= $(wildcard $(abs_srcdir)/lchown*.c)
++SRCS			:= $(sort $(wildcard $(abs_srcdir)/lchown*.c))
+ 
+ include $(abs_srcdir)/../utils/compat_16.mk
+ 
+diff --git a/testcases/kernel/syscalls/migrate_pages/Makefile b/testcases/kernel/syscalls/migrate_pages/Makefile
+index 46912b025..9cf3ce526 100644
+--- a/testcases/kernel/syscalls/migrate_pages/Makefile
++++ b/testcases/kernel/syscalls/migrate_pages/Makefile
+@@ -5,7 +5,7 @@ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
+-MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
++MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*[0-9].c)))
+ $(MAKE_TARGETS): %: migrate_pages_common.o
+ 
+ CPPFLAGS		+= -I$(abs_srcdir)/../utils/
+diff --git a/testcases/kernel/syscalls/move_pages/Makefile b/testcases/kernel/syscalls/move_pages/Makefile
+index cd7ff6349..4b22160ed 100644
+--- a/testcases/kernel/syscalls/move_pages/Makefile
++++ b/testcases/kernel/syscalls/move_pages/Makefile
+@@ -7,7 +7,7 @@ include $(top_srcdir)/include/mk/testcases.mk
+ 
+ CPPFLAGS		+= -I$(abs_srcdir)/../utils
+ 
+-MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
++MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*[0-9].c)))
+ 
+ $(MAKE_TARGETS): %: move_pages_support.o
+ 
+diff --git a/testcases/kernel/syscalls/utils/compat_16.mk b/testcases/kernel/syscalls/utils/compat_16.mk
+index a0ff8f558..e81a00c40 100644
+--- a/testcases/kernel/syscalls/utils/compat_16.mk
++++ b/testcases/kernel/syscalls/utils/compat_16.mk
+@@ -50,7 +50,7 @@
+ 
+ CPPFLAGS		+= -I$(abs_srcdir) -I$(abs_srcdir)/../utils
+ 
+-SRCS			?= $(wildcard $(abs_srcdir)/*.c)
++SRCS			?= $(sort $(wildcard $(abs_srcdir)/*.c))
+ 
+ MAKE_TARGETS		:= $(notdir $(patsubst %.c,%,$(SRCS)))
+ MAKE_TARGETS_OBJS_WO_COMPAT_16	:= $(addsuffix .o,$(MAKE_TARGETS))
+diff --git a/testcases/kernel/syscalls/utils/newer_64.mk b/testcases/kernel/syscalls/utils/newer_64.mk
+index 8cd7e03c8..5e798057a 100644
+--- a/testcases/kernel/syscalls/utils/newer_64.mk
++++ b/testcases/kernel/syscalls/utils/newer_64.mk
+@@ -25,7 +25,7 @@
+ 
+ CPPFLAGS		+= -I$(abs_srcdir) -I$(abs_srcdir)/../utils
+ 
+-SRCS			?= $(wildcard $(abs_srcdir)/*.c)
++SRCS			?= $(sort $(wildcard $(abs_srcdir)/*.c))
+ 
+ MAKE_TARGETS		:= $(notdir $(patsubst %.c,%,$(SRCS)))
+ 
+diff --git a/testcases/misc/math/float/Makefile b/testcases/misc/math/float/Makefile
+index 79dda35d6..5f4cb0f6c 100644
+--- a/testcases/misc/math/float/Makefile
++++ b/testcases/misc/math/float/Makefile
+@@ -27,6 +27,6 @@ include $(top_srcdir)/include/mk/testcases.mk
+ LDLIBS		+= -lpthread -lm
+ 
+ # main.c doesn't compile...
+-MAKE_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/float*.c))
++MAKE_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/float*.c)))
+ 
+ include $(top_srcdir)/include/mk/generic_trunk_target.mk
+diff --git a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
+index 12c86799d..23c520d9d 100644
+--- a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
++++ b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
+@@ -104,7 +104,7 @@ static void *thread_fn(LTP_ATTRIBUTE_UNUSED void *args)
+ 				"\treturn 0;\n}\n";
+ 
+ 	const char make_buf_n[] = "CFLAGS := -O -w -g\n"
+-				  "SRCS=$(wildcard *.c)\n"
++				  "SRCS=$(sort $(wildcard *.c))\n"
+ 				  "TARGETS=$(SRCS:.c=)\n"
+ 				  "all: $(TARGETS)\n"
+ 				  "$(TARGETS): %: %.c\n"
+@@ -114,7 +114,7 @@ static void *thread_fn(LTP_ATTRIBUTE_UNUSED void *args)
+ 
+ 	const char make_buf[] = "CFLAGS := -O -w -g\n"
+ 				"SUBDIR = dir\n"
+-				"SRCS=$(wildcard *.c)\n"
++				"SRCS=$(sort $(wildcard *.c))\n"
+ 				"TARGETS=$(SRCS:.c=)\n"
+ 				"all: $(SUBDIR) $(TARGETS)\n"
+ 				"$(TARGETS): %: %.c\n"
+diff --git a/testcases/network/nfsv4/locks/Makefile b/testcases/network/nfsv4/locks/Makefile
+index 5812dea3a..05941c892 100644
+--- a/testcases/network/nfsv4/locks/Makefile
++++ b/testcases/network/nfsv4/locks/Makefile
+@@ -28,6 +28,6 @@ MAKE_TARGETS		:= locktests
+ 
+ LDLIBS			+= -lpthread
+ 
+-$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
++$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+diff --git a/utils/sctp/func_tests/Makefile b/utils/sctp/func_tests/Makefile
+index d296c652a..a17107853 100644
+--- a/utils/sctp/func_tests/Makefile
++++ b/utils/sctp/func_tests/Makefile
+@@ -30,7 +30,7 @@ LDFLAGS		+= $(addprefix -L$(abs_builddir)/../,lib testlib)
+ 
+ LDLIBS		+= -lsctputil -lsctp -lpthread
+ 
+-V4_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*.c))
++V4_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*.c)))
+ 
+ V6_TARGETS	:= test_basic_v6 test_fragments_v6 test_getname_v6 \
+ 		   test_inaddr_any_v6 test_peeloff_v6 \
+-- 
+2.27.0
+
diff --git a/meta/recipes-extended/ltp/ltp/determinism2.patch b/meta/recipes-extended/ltp/ltp/determinism2.patch
deleted file mode 100644
index d786f4c2f9c..00000000000
--- a/meta/recipes-extended/ltp/ltp/determinism2.patch
+++ /dev/null
@@ -1,291 +0,0 @@
-testcases/kernel/io/disktest: Fix determinism issue
-
-The order of the objects linked into the test varies depending on the
-order of the files found on disk. This results in the disktest binary
-differing depending on that order.
-
-Sort the wildcard expansion of *.c which leads to reproducible binaries.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-
-Index: git/testcases/kernel/io/disktest/Makefile
-===================================================================
---- git.orig/testcases/kernel/io/disktest/Makefile
-+++ git/testcases/kernel/io/disktest/Makefile
-@@ -209,7 +209,7 @@ LDLIBS		+= -lpthread
- 
- MAKE_TARGETS	:= disktest
- 
--OBJS		:= $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
-+OBJS		:= $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
- 
- disktest-$(VER):
- 	mkdir -p "$@"
-Index: git/testcases/commands/ldd/datafiles/Makefile
-===================================================================
---- git.orig/testcases/commands/ldd/datafiles/Makefile
-+++ git/testcases/commands/ldd/datafiles/Makefile
-@@ -21,7 +21,7 @@ CPPFLAGS		+= -fpic
- 
- INSTALL_TARGETS		:= ldd*.so lddfile.out
- 
--LDD_C_FILES		:= $(wildcard $(abs_srcdir)/lddfile*.c)
-+LDD_C_FILES		:= $(sort $(wildcard $(abs_srcdir)/lddfile*.c))
- LDD_SO_FILES		:= $(patsubst $(abs_srcdir)/%.c,%.obj.so,$(LDD_C_FILES))
- MAKE_TARGETS		:= lddfile.out
- CLEAN_TARGETS		+= *.obj $(LDD_SO_FILES)
-Index: git/testcases/kernel/hotplug/memory_hotplug/Makefile
-===================================================================
---- git.orig/testcases/kernel/hotplug/memory_hotplug/Makefile
-+++ git/testcases/kernel/hotplug/memory_hotplug/Makefile
-@@ -31,6 +31,7 @@ LDLIBS		:= $(filter-out -lltp,$(LDLIBS))
- 
- MAKE_TARGETS	:= memtoy
- 
--memtoy: $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
-+memtoy: $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
-+
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-Index: git/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
-===================================================================
---- git.orig/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
-+++ git/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
-@@ -24,7 +24,7 @@ generate_locate_test_makefile() {
- 
- 	echo "Generating $maketype Makefiles"
- 
--	locate-test --$maketype | sed -e 's,^./,,g' | sort > make-gen.$maketype
-+	locate-test --$maketype | sed -e 's,^./,,g' | LC_ALL=C sort > make-gen.$maketype
- 
- 	generate_makefiles make-gen.$maketype $*
- 
-Index: git/testcases/kernel/syscalls/lchown/Makefile
-===================================================================
---- git.orig/testcases/kernel/syscalls/lchown/Makefile
-+++ git/testcases/kernel/syscalls/lchown/Makefile
-@@ -5,7 +5,7 @@ top_srcdir		?= ../../../..
- 
- include $(top_srcdir)/include/mk/testcases.mk
- 
--SRCS			:= $(wildcard $(abs_srcdir)/lchown*.c)
-+SRCS			:= $(sort $(wildcard $(abs_srcdir)/lchown*.c))
- 
- include $(abs_srcdir)/../utils/compat_16.mk
- 
-Index: git/testcases/kernel/syscalls/migrate_pages/Makefile
-===================================================================
---- git.orig/testcases/kernel/syscalls/migrate_pages/Makefile
-+++ git/testcases/kernel/syscalls/migrate_pages/Makefile
-@@ -5,7 +5,7 @@ top_srcdir		?= ../../../..
- 
- include $(top_srcdir)/include/mk/testcases.mk
- 
--MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
-+MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*[0-9].c)))
- $(MAKE_TARGETS): %: migrate_pages_common.o
- 
- CPPFLAGS		+= -I$(abs_srcdir)/../utils/
-Index: git/testcases/kernel/syscalls/utils/compat_16.mk
-===================================================================
---- git.orig/testcases/kernel/syscalls/utils/compat_16.mk
-+++ git/testcases/kernel/syscalls/utils/compat_16.mk
-@@ -50,7 +50,7 @@
- 
- CPPFLAGS		+= -I$(abs_srcdir) -I$(abs_srcdir)/../utils
- 
--SRCS			?= $(wildcard $(abs_srcdir)/*.c)
-+SRCS			?= $(sort $(wildcard $(abs_srcdir)/*.c))
- 
- MAKE_TARGETS		:= $(notdir $(patsubst %.c,%,$(SRCS)))
- MAKE_TARGETS_OBJS_WO_COMPAT_16	:= $(addsuffix .o,$(MAKE_TARGETS))
-Index: git/testcases/kernel/syscalls/utils/newer_64.mk
-===================================================================
---- git.orig/testcases/kernel/syscalls/utils/newer_64.mk
-+++ git/testcases/kernel/syscalls/utils/newer_64.mk
-@@ -25,7 +25,7 @@
- 
- CPPFLAGS		+= -I$(abs_srcdir) -I$(abs_srcdir)/../utils
- 
--SRCS			?= $(wildcard $(abs_srcdir)/*.c)
-+SRCS			?= $(sort $(wildcard $(abs_srcdir)/*.c))
- 
- MAKE_TARGETS		:= $(notdir $(patsubst %.c,%,$(SRCS)))
- 
-Index: git/include/mk/env_post.mk
-===================================================================
---- git.orig/include/mk/env_post.mk
-+++ git/include/mk/env_post.mk
-@@ -47,7 +47,7 @@ LDFLAGS				+= -L$(top_builddir)/lib/andr
- LDFLAGS				+= -L$(top_builddir)/lib/android_librt
- endif
- 
--MAKE_TARGETS			?= $(notdir $(patsubst %.c,%,$(wildcard $(abs_srcdir)/*.c)))
-+MAKE_TARGETS			?= $(notdir $(patsubst %.c,%,$(sort $(wildcard $(abs_srcdir)/*.c))))
- MAKE_TARGETS			:= $(filter-out $(FILTER_OUT_MAKE_TARGETS),$(MAKE_TARGETS))
- 
- # with only *.dwo, .[0-9]+.dwo can not be cleaned
-Index: git/include/mk/module.mk
-===================================================================
---- git.orig/include/mk/module.mk
-+++ git/include/mk/module.mk
-@@ -42,7 +42,7 @@ endif
- 
- ifneq ($(filter install clean,$(MAKECMDGOALS)),)
- MAKE_TARGETS := $(filter-out %.ko, $(MAKE_TARGETS))
--MAKE_TARGETS += $(wildcard *.ko)
-+MAKE_TARGETS += $(sort $(wildcard *.ko))
- endif
- 
- CLEAN_TARGETS += .dep_modules *.mod built-in.a
-Index: git/runtest/Makefile
-===================================================================
---- git.orig/runtest/Makefile
-+++ git/runtest/Makefile
-@@ -36,7 +36,7 @@ ifneq ($(WITH_POWER_MANAGEMENT_TESTSUITE
- UNWANTED_FILES		+= power_management_tests
- endif
- 
--INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(wildcard $(abs_srcdir)/*))))
-+INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(sort $(wildcard $(abs_srcdir)/*)))))
- 
- MAKE_TARGETS		:=
- 
-Index: git/scenario_groups/Makefile
-===================================================================
---- git.orig/scenario_groups/Makefile
-+++ git/scenario_groups/Makefile
-@@ -31,7 +31,7 @@ UNWANTED_FILES		:= Makefile
- 
- INSTALL_MODE		:= 00644
- 
--INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(wildcard $(abs_srcdir)/*))))
-+INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(sort $(wildcard $(abs_srcdir)/*)))))
- 
- MAKE_TARGETS		:=
- 
-Index: git/testcases/kernel/io/disktest/Makefile.linux
-===================================================================
---- git.orig/testcases/kernel/io/disktest/Makefile.linux
-+++ git/testcases/kernel/io/disktest/Makefile.linux
-@@ -167,8 +167,8 @@ mandir=/usr/share/man
- 
- VER=`grep VER_STR main.h | awk -F\" '{print $$2}'`
- GBLHDRS=main.h globals.h defs.h
--ALLHDRS=$(wildcard *.h)
--SRCS=$(wildcard *.c)
-+ALLHDRS=$(sort $(wildcard *.h))
-+SRCS=$(sort $(wildcard *.c))
- OBJS=$(SRCS:.c=.o)
- 
- CFLAGS += -g -Wall -O -D"LINUX" -D"_THREAD_SAFE" -D"_GNU_SOURCE" -D"_LARGE_FILES" -D"_LARGEFILE64_SOURCE" -D"_FILE_OFFSET_BITS=64" $(RPM_OPT_FLAGS)
-Index: git/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
-===================================================================
---- git.orig/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
-+++ git/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
-@@ -28,6 +28,6 @@ INSTALL_TARGETS		:= smt_smp_affinity.sh
- 
- MAKE_TARGETS		:= ht_affinity
- 
--$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
-+$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-Index: git/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
-===================================================================
---- git.orig/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
-+++ git/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
-@@ -28,6 +28,6 @@ INSTALL_TARGETS		:= smt_smp_enabled.sh
- 
- MAKE_TARGETS		:= ht_enabled
- 
--$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
-+$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-Index: git/testcases/kernel/sched/sched_stress/Makefile
-===================================================================
---- git.orig/testcases/kernel/sched/sched_stress/Makefile
-+++ git/testcases/kernel/sched/sched_stress/Makefile
-@@ -10,7 +10,7 @@ INSTALL_TARGETS		:= sched_stress.sh
- 
- LDLIBS			+= -lpthread
- 
--MAKE_TARGETS		:= $(filter-out sched,$(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*.c)))
-+MAKE_TARGETS		:= $(filter-out sched,$(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*.c))))
- 
- RM			+= -r
- 
-Index: git/testcases/kernel/syscalls/move_pages/Makefile
-===================================================================
---- git.orig/testcases/kernel/syscalls/move_pages/Makefile
-+++ git/testcases/kernel/syscalls/move_pages/Makefile
-@@ -7,7 +7,7 @@ include $(top_srcdir)/include/mk/testcas
- 
- CPPFLAGS		+= -I$(abs_srcdir)/../utils
- 
--MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
-+MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*[0-9].c)))
- 
- $(MAKE_TARGETS): %: move_pages_support.o
- 
-Index: git/testcases/misc/math/float/Makefile
-===================================================================
---- git.orig/testcases/misc/math/float/Makefile
-+++ git/testcases/misc/math/float/Makefile
-@@ -27,6 +27,6 @@ include $(top_srcdir)/include/mk/testcas
- LDLIBS		+= -lpthread -lm
- 
- # main.c doesn't compile...
--MAKE_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/float*.c))
-+MAKE_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/float*.c)))
- 
- include $(top_srcdir)/include/mk/generic_trunk_target.mk
-Index: git/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
-===================================================================
---- git.orig/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
-+++ git/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
-@@ -104,7 +104,7 @@ static void *thread_fn(LTP_ATTRIBUTE_UNU
- 				"\treturn 0;\n}\n";
- 
- 	const char make_buf_n[] = "CFLAGS := -O -w -g\n"
--				  "SRCS=$(wildcard *.c)\n"
-+				  "SRCS=$(sort $(wildcard *.c))\n"
- 				  "TARGETS=$(SRCS:.c=)\n"
- 				  "all: $(TARGETS)\n"
- 				  "$(TARGETS): %: %.c\n"
-@@ -114,7 +114,7 @@ static void *thread_fn(LTP_ATTRIBUTE_UNU
- 
- 	const char make_buf[] = "CFLAGS := -O -w -g\n"
- 				"SUBDIR = dir\n"
--				"SRCS=$(wildcard *.c)\n"
-+				"SRCS=$(sort $(wildcard *.c))\n"
- 				"TARGETS=$(SRCS:.c=)\n"
- 				"all: $(SUBDIR) $(TARGETS)\n"
- 				"$(TARGETS): %: %.c\n"
-Index: git/testcases/network/nfsv4/locks/Makefile
-===================================================================
---- git.orig/testcases/network/nfsv4/locks/Makefile
-+++ git/testcases/network/nfsv4/locks/Makefile
-@@ -28,6 +28,6 @@ MAKE_TARGETS		:= locktests
- 
- LDLIBS			+= -lpthread
- 
--$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
-+$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-Index: git/utils/sctp/func_tests/Makefile
-===================================================================
---- git.orig/utils/sctp/func_tests/Makefile
-+++ git/utils/sctp/func_tests/Makefile
-@@ -30,7 +30,7 @@ LDFLAGS		+= $(addprefix -L$(abs_builddir
- 
- LDLIBS		+= -lsctputil -lsctp -lpthread
- 
--V4_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*.c))
-+V4_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*.c)))
- 
- V6_TARGETS	:= test_basic_v6 test_fragments_v6 test_getname_v6 \
- 		   test_inaddr_any_v6 test_peeloff_v6 \
diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-extended/ltp/ltp_20210121.bb
index 737c8b3ca17..5fe1a4f012d 100644
--- a/meta/recipes-extended/ltp/ltp_20210121.bb
+++ b/meta/recipes-extended/ltp/ltp_20210121.bb
@@ -30,8 +30,8 @@ CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "4d005621edd109d119627eb9210b224a63bf22cb"
 
 # remove at next version upgrade or when output changes
-PR = "r3"
-HASHEQUIV_HASH_VERSION .= ".3"
+PR = "r4"
+HASHEQUIV_HASH_VERSION .= ".4"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-build-Add-option-to-select-libc-implementation.patch \
@@ -39,7 +39,8 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-Add-more-musl-exclusions.patch \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://determinism.patch \
-           file://determinism2.patch \
+           file://0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch \
+           file://0002-Makefile-Avoid-wildcard-determinism-issues.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.27.0

