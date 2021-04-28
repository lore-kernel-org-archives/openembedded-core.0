Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.1310.1619637465336531761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 12:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qOkK2Fj1;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: petr.vorel@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id q9so10110643wrs.6
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 12:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IOdk5xffspENqnMnA2/+cSF/D1ReAeNwK5wVLNcnzFc=;
        b=qOkK2Fj1nHSE64yQ1ZP+qjwce2+/3mwW8rOLYVOEZSmMutaHptBHAWT9AYV87YkIES
         qAFdIN+xdOCnBLGQOk99XnMc3N5SI7EsgL3GbbebHctJCAIbLlV/KJDGFJWZas5jLW3b
         ar1m2dshKbNU8Pre8q41eZ/M1OepnuxrBImOfFIoxtwiz44qZNB31EeVu+pNVKUSefPC
         Qvi9uyGLd64OWl7IDEmXCfc2xRrLDRLA4hbUZnGpyFVOj3OLJcT7eVLuJ1X5VdN4p+3T
         49/S7PBCaNyZ1p/R5dQS1jIHwIYuP73MWcJT/E0HDK9HEi7LKQQSixabgrPBurNoDD+B
         DZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IOdk5xffspENqnMnA2/+cSF/D1ReAeNwK5wVLNcnzFc=;
        b=MgmMMI1R7JEWRH8cQ2ErnPheoTTZwtLwhXvOOsWCgrKDXx4mvwCsULkW/Wtm2BBxOD
         cQyaSGD8N3yTn7LD9NjFAO5Y53EwCpGHPplDeTMaMUbmP01bKRvWxPMrchCM321e9eJx
         p8zMK1nX6sUwach8j5tet5m+wk7RsdoYjLALieUS8zpf6bhGVql1kBL7rNa7SGFkdQUh
         T8zuQ/TziKJTROAMd9oeZYIF5e+MQmw6wHvrn8KoRFD/M19MdP+4t9WQA64c5Kmi8s1f
         f5gCLpFq6K1CF8HlgxGqB/TlM1uJcZ3cAvrFj+1gg1A8X25nM2E4SEdukVK0D2o3FNj0
         X/7g==
X-Gm-Message-State: AOAM531kmujiD7dFveqzTsNStbuIyFc9O6E6MZcqj2WPwE2vDPUzyJRY
	H2ZfMtVQWco5/n7W2twCA3L+ZtFlPexp2Q==
X-Google-Smtp-Source: ABdhPJxYObTNMznjD8lAD3JX6XwOTWkp3BF0WMT/ktw47KYgQ9TA0k6iTdLqz4ze6acZSQ6/XE+v/g==
X-Received: by 2002:a5d:4b52:: with SMTP id w18mr12599282wrs.41.1619637463831;
        Wed, 28 Apr 2021 12:17:43 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from dell5510.suse.de ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id q5sm7847130wmj.20.2021.04.28.12.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 12:17:43 -0700 (PDT)
From: "Petr Vorel" <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Yi Zhao <yi.zhao@windriver.com>,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>,
	Andre McCurdy <armccurdy@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/1] ltp: Replace musl patches with do_patch[postfuncs]
Date: Wed, 28 Apr 2021 21:17:36 +0200
Message-Id: <20210428191736.26963-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MUSL related build fixes are not going to be upstreamed.  They just not
compile broken files, thus replace them with upstream solution for CI:
just deleting files for musl (easier to maintain).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .../ltp/0001-Add-more-musl-exclusions.patch   | 32 --------
 ...option-to-select-libc-implementation.patch | 81 -------------------
 meta/recipes-extended/ltp/ltp_20210121.bb     | 24 +++++-
 3 files changed, 21 insertions(+), 116 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch b/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
deleted file mode 100644
index f2fc8ee958..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ad8e73306cb8293f7d32841e1599fd9048801f1f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 20 Dec 2019 13:06:05 +0100
-Subject: [PATCH] Add more musl exclusions
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-[ pvorel: rebase for 20200515: enable accept4_01 ]
-[ pvorel: rebase for 20200120: enable fanotify13, fanotify15, setxattr03 ]
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- testcases/kernel/syscalls/timer_create/Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/timer_create/Makefile b/testcases/kernel/syscalls/timer_create/Makefile
-index ada241fe1..d454b01e7 100644
---- a/testcases/kernel/syscalls/timer_create/Makefile
-+++ b/testcases/kernel/syscalls/timer_create/Makefile
-@@ -5,6 +5,10 @@ top_srcdir		?= ../../../..
- 
- include $(top_srcdir)/include/mk/testcases.mk
- 
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_MAKE_TARGETS        := timer_create01 timer_create03
-+endif
-+
- CPPFLAGS		+= -D_GNU_SOURCE -I$(abs_srcdir)/../include
- 
- LDLIBS			+= -lpthread -lrt
--- 
-2.26.2
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
deleted file mode 100644
index 29b2bf7e41..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 74958c3e341de713b596c8cfd35b2391d6c7bc09 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 18:19:03 +0000
-Subject: [PATCH] build: Add option to select libc implementation
-
-There are more than glibc for C library implementation available on
-linux now a days, uclibc cloaked like glibc but musl e.g. is very
-different and does not implement all GNU extensions.
-
-Disable tests specifically not building _yet_ on musl based systems
-
-Upstream-Status: Pending (pvorel: this is not going to be fixed, instead
-each test needs to be fixed)
-
-rt_tgsigqueueinfo fails with:
-rt_tgsigqueueinfo01.c: In function 'sigusr1_handler':
-rt_tgsigqueueinfo01.c:42:22: error: 'siginfo_t' {aka 'struct <anonymous>'} has no member named '_sifields'; did you mean '__si_fields'?
-   42 |  sigval_rcv = uinfo->_sifields._rt.SI_SIGVAL.sival_ptr;
-      |                      ^~~~~~~~~
-      |                      __si_fields
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[ pvorel: rebase for 20200515: enable pty, ioctl ]
-[ pvorel: rebase for 20200120: enable mallopt, profil, rpc016,
-rt_sigsuspend, sbrk_mutex, setdomainname, sethostname, sigsuspend,
-testpi-3, testpi-5, testpi-6, ustat; move rt_tgsigqueueinfo
-from 0006-rt_tgsigqueueinfo-disable-test-on-musl.patch ]
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- Makefile                           | 5 +++++
- testcases/kernel/sched/Makefile    | 4 +++-
- testcases/kernel/syscalls/Makefile | 4 ++++
- 3 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 768ca4606..e9d679a71 100644
---- a/Makefile
-+++ b/Makefile
-@@ -41,6 +41,11 @@ vpath %.mk		$(top_srcdir)/mk:$(top_srcdir)/mk/include
- UCLINUX			?= 0
- export UCLINUX
- 
-+# System C library implementation (glibc,uclibc,musl etc.)
-+# default to glibc if not set
-+LIBC			?= glibc
-+export LIBC
-+
- # CLEAN_TARGETS:	Targets which exist solely in clean.
- # COMMON_TARGETS:	Targets which exist in all, clean, and install.
- # INSTALL_TARGETS:	Targets which exist in clean and install (contains
-diff --git a/testcases/kernel/sched/Makefile b/testcases/kernel/sched/Makefile
-index 6a57d79ee..74bb93370 100644
---- a/testcases/kernel/sched/Makefile
-+++ b/testcases/kernel/sched/Makefile
-@@ -23,5 +23,7 @@
- top_srcdir		?= ../../..
- 
- include $(top_srcdir)/include/mk/env_pre.mk
--
-+ifeq ($(LIBC),musl)
-+	FILTER_OUT_DIRS += process_stress
-+endif
- include $(top_srcdir)/include/mk/generic_trunk_target.mk
-diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/syscalls/Makefile
-index c6dc8d9e7..aa50761ea 100644
---- a/testcases/kernel/syscalls/Makefile
-+++ b/testcases/kernel/syscalls/Makefile
-@@ -15,6 +15,10 @@ FILTER_OUT_DIRS	+= capget capset chmod chown clone fork getcontext llseek \
- 		   mincore mprotect nftw profil remap_file_pages sbrk
- endif
- 
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_DIRS	+= confstr fmtmsg getcontext rt_tgsigqueueinfo
-+endif
-+
- ifeq ($(UCLIBC),1)
- FILTER_OUT_DIRS	+= profil
- endif
--- 
-2.26.2
-
diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-extended/ltp/ltp_20210121.bb
index d98c9fdc25..7c4b56b76c 100644
--- a/meta/recipes-extended/ltp/ltp_20210121.bb
+++ b/meta/recipes-extended/ltp/ltp_20210121.bb
@@ -34,9 +34,7 @@ PR = "r4"
 HASHEQUIV_HASH_VERSION .= ".4"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
-           file://0001-build-Add-option-to-select-libc-implementation.patch \
            file://0007-Fix-test_proc_kill-hanging.patch \
-           file://0001-Add-more-musl-exclusions.patch \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://determinism.patch \
            file://0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch \
@@ -78,7 +76,7 @@ do_install(){
     find ${D}${prefix} -name Makefile | xargs -n 1 sed -i \
          -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
          -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
-         -e 's@[^ ]*--sysroot=[^ "]*@@g' 
+         -e 's@[^ ]*--sysroot=[^ "]*@@g'
 
     # The controllers memcg_stree test seems to cause us hangs and takes 900s
     # (maybe we expect more regular output?), anyhow, skip it
@@ -121,6 +119,26 @@ FILES_${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${pr
 INHIBIT_PACKAGE_STRIP_FILES = "${prefix}/testcases/bin/nm01 ${prefix}/testcases/bin/ldd01"
 INSANE_SKIP_${PN} += "already-stripped staticdev"
 
+remove_broken_musl_sources() {
+	[ "${TCLIBC}" = "musl" ] || return 0
+
+	cd ${S}
+	echo "WARNING: remove unsupported tests (until they're fixed)"
+
+	# sync with upstream
+	# https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh#L33
+	rm -rfv \
+		testcases/kernel/sched/process_stress/process.c \
+		testcases/kernel/syscalls/confstr/confstr01.c \
+		testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
+		testcases/kernel/syscalls/getcontext/getcontext01.c \
+		testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
+		testcases/kernel/syscalls/timer_create/timer_create01.c \
+		testcases/kernel/syscalls/timer_create/timer_create03.c \
+		utils/benchmark/ebizzy-0.3
+}
+do_patch[postfuncs] += "remove_broken_musl_sources"
+
 # Avoid file dependency scans, as LTP checks for things that may or may not
 # exist on the running system.  For instance it has specific checks for
 # csh and ksh which are not typically part of OpenEmbedded systems (but
-- 
2.31.1

