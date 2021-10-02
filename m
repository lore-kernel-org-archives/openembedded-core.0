Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Petr Vorel" <petr.vorel@gmail.com>
Subject: [PATCH v3 1/1] ltp: Update to 20210927
Date: Sat,  2 Oct 2021 19:25:55 +0200
Message-Id: <20211002172555.22829-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Anders Roxell <anders.roxell@linaro.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>

New patches to fix functionality:
* 0002-lib-fix-MemAvailable-parsing.patch
* 0003-lapi-rtnetlink.h-Fix-include-guards.patch
* 0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
* 0005-lapi-if_addr.h-Define-IFA_FLAGS.patch

Removed patch from this release
* 0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch

Rebased patch
* 0001-Remove-OOM-tests-from-runtest-mm.patch

* Updated copying (reduced files in 5eff445d4 ("Reduce LICENCE/COPYING files"))

* Updated removed musl incompatible files in
  remove_broken_musl_sources() (process.c was removed in 926d3b906
  ("sched: Remove process.c")), also update link to CI file.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Warning: untested, please test it.

Changes v2->v3:
* Correct commit message title to reflect commit message, which is going
to be merged, see report in:
https://lore.kernel.org/ltp/YViVpZZG4VvSd7Nc@pevik/T/#m58a27e2c294d546031a2703535234071fe21131a

I hope to merge upstream patches next week.

Changes v1->v2:
* Update licence files in LIC_FILES_CHKSUM (reported by Daniel Díaz)

 ...001-Remove-OOM-tests-from-runtest-mm.patch | 12 ++--
 ...s05.c-ioctl_ns06.c-Fix-too-small-buf.patch | 59 ------------------
 .../0002-lib-fix-MemAvailable-parsing.patch   | 36 +++++++++++
 ...-lapi-rtnetlink.h-Fix-include-guards.patch | 37 ++++++++++++
 ...f_addr.h-and-reuse-it-in-rtnetlink.h.patch | 58 ++++++++++++++++++
 ...0005-lapi-if_addr.h-Define-IFA_FLAGS.patch | 60 +++++++++++++++++++
 .../ltp/{ltp_20210524.bb => ltp_20210927.bb}  | 17 +++---
 7 files changed, 206 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0003-lapi-rtnetlink.h-Fix-include-guards.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
 rename meta/recipes-extended/ltp/{ltp_20210524.bb => ltp_20210927.bb} (86%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index e51950f153..6d945700be 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From 93772c511d954d755cc9128c58ed8968a5af541b Mon Sep 17 00:00:00 2001
+From e87c2ad1e16cdbd62ba71b2ace3270503decaa56 Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
@@ -7,16 +7,17 @@ Disable OOM tests, as they might cause oeqa ssh connection lost
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
-
+[ pvorel: rebased for 20210927 ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  runtest/mm | 6 ------
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index 481d39691..cf207d10e 100644
+index 6537666a9..e5a091a5a 100644
 --- a/runtest/mm
 +++ b/runtest/mm
-@@ -74,12 +74,6 @@ ksm06_2 ksm06 -n 10000
+@@ -73,12 +73,6 @@ ksm06_2 ksm06 -n 8000
  
  cpuset01 cpuset01
  
@@ -29,3 +30,6 @@ index 481d39691..cf207d10e 100644
  swapping01 swapping01 -i 5
  
  thp01 thp01 -I 120
+-- 
+2.33.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch
deleted file mode 100644
index 08b88a38f3..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From af2b6f5ee6b171078b18246dd73f71cf6e350859 Mon Sep 17 00:00:00 2001
-From: Marius Hillenbrand <mhillen@linux.ibm.com>
-Date: Mon, 19 Jul 2021 13:58:35 +0800
-Subject: [PATCH] syscalls/ioctl_ns05.c, ioctl_ns06.c: Fix too small buffer for
- path
-
-commit af2b6f5ee6b171078b18246dd73f71cf6e350859 upstream.
-
-Resize the buffer used for paths into /proc/ to grant enough space
-for long PIDs. While at it, replace sprintf with snprintf to avoid
-buffer overflows if we ever ran out of space again.
-
-Fixes: #847
-Signed-off-by: Marius Hillenbrand <mhillen@linux.ibm.com>
-Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
-Upstream-Status: Backport
-Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
-diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
-index a67ddbe2c66f..52613810c7ce 100644
---- a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
-+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
-@@ -59,10 +59,10 @@ static void run(void)
- 	if (pid == -1)
- 		tst_brk(TBROK | TERRNO, "ltp_clone failed");
- 
--	char child_namespace[20];
-+	char child_namespace[30];
- 	int my_fd, child_fd, parent_fd;
- 
--	sprintf(child_namespace, "/proc/%i/ns/pid", pid);
-+	snprintf(child_namespace, sizeof(child_namespace), "/proc/%i/ns/pid", pid);
- 	my_fd = SAFE_OPEN("/proc/self/ns/pid", O_RDONLY);
- 	child_fd = SAFE_OPEN(child_namespace, O_RDONLY);
- 	parent_fd = ioctl(child_fd, NS_GET_PARENT);
-diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
-index b6ac80208d02..c30f7de91e09 100644
---- a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
-+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
-@@ -51,14 +51,14 @@ static int child(void *arg LTP_ATTRIBUTE_UNUSED)
- 
- static void run(void)
- {
--	char child_namespace[20];
-+	char child_namespace[30];
- 
- 	pid_t pid = ltp_clone(CLONE_NEWUSER | SIGCHLD, &child, 0,
- 		STACK_SIZE, child_stack);
- 	if (pid == -1)
- 		tst_brk(TBROK | TERRNO, "ltp_clone failed");
- 
--	sprintf(child_namespace, "/proc/%i/ns/user", pid);
-+	snprintf(child_namespace, sizeof(child_namespace), "/proc/%i/ns/user", pid);
- 	int my_fd, child_fd, parent_fd;
- 
- 	my_fd = SAFE_OPEN("/proc/self/ns/user", O_RDONLY);
--- 
-2.32.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch b/meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch
new file mode 100644
index 0000000000..4a9a5b2363
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch
@@ -0,0 +1,36 @@
+From 29a096fe2bd356f419bd8a8404d5b652c996b92f Mon Sep 17 00:00:00 2001
+From: Ralph Siemsen <ralph.siemsen@linaro.org>
+Date: Mon, 27 Sep 2021 22:18:50 -0400
+Subject: [PATCH] lib: fix MemAvailable parsing
+
+The amount of available memory was not being returned correctly, which
+resulted in tests being executed when they should have been skipped.
+
+Fixes: 8759f4 ("lib: adjust the tmpfs size according to .dev_min_size and MemAvailable")
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+Signed-off-by: Li Wang <liwang@redhat.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: e42149e28 ("lib: fix MemAvailable parsing") ]
+---
+ lib/tst_memutils.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
+index ae1cad29b..a46de78f5 100644
+--- a/lib/tst_memutils.c
++++ b/lib/tst_memutils.c
+@@ -65,9 +65,9 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
+ 
+ long long tst_available_mem(void)
+ {
+-	long long mem_available;
++	unsigned long long mem_available = 0;
+ 
+-	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %ld",
++	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %llu",
+ 		&mem_available)) {
+ 		mem_available = SAFE_READ_MEMINFO("MemFree:")
+ 			+ SAFE_READ_MEMINFO("Cached:");
+-- 
+2.33.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0003-lapi-rtnetlink.h-Fix-include-guards.patch b/meta/recipes-extended/ltp/ltp/0003-lapi-rtnetlink.h-Fix-include-guards.patch
new file mode 100644
index 0000000000..3c1b1ea486
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0003-lapi-rtnetlink.h-Fix-include-guards.patch
@@ -0,0 +1,37 @@
+From 881709d1e4d1bba5bf8ca365bc058f338bd72dc2 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Wed, 29 Sep 2021 19:38:42 +0200
+Subject: [PATCH] lapi/rtnetlink.h: Fix include guards
+
+Fixes: 5fea0638a ("lapi: Add missing IFA_FLAGS")
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: a2a212cf8 ("lapi/rtnetlink.h: Fix include guards") ]
+---
+ include/lapi/rtnetlink.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
+index 8a1b5385b..04e9ad51a 100644
+--- a/include/lapi/rtnetlink.h
++++ b/include/lapi/rtnetlink.h
+@@ -1,8 +1,8 @@
+ // SPDX-License-Identifier: GPL-2.0-or-later
+ /* Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com> */
+
+-#ifndef LAPI_IF_ADDR_H__
+-# define LAPI_IF_ADDR_H__
++#ifndef LAPI_RTNETLINK_H__
++# define LAPI_RTNETLINK_H__
+
+ #include <linux/rtnetlink.h>
+
+@@ -10,4 +10,4 @@
+ # define IFA_FLAGS 8
+ #endif
+
+-#endif	/* LAPI_IF_ADDR_H__ */
++#endif	/* LAPI_RTNETLINK_H__ */
+--
+2.33.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch b/meta/recipes-extended/ltp/ltp/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
new file mode 100644
index 0000000000..e3108eeeeb
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
@@ -0,0 +1,58 @@
+From b13440627bd4a9f060a33d400a47a40daa2bc12e Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Wed, 29 Sep 2021 19:37:19 +0200
+Subject: [PATCH] lapi: Create if_addr.h and reuse it in rtnetlink.h
+
+There will be fix in next commit for missing IFA_F_NOPREFIXROUTE which
+requires creating lapi/if_addr.h. Thus move IFA_FLAGS to lapi/if_addr.h,
+as it belongs there and reuse lapi/if_addr.h in lapi/rtnetlink.h just
+like <linux/rtnetlink.h> includes <linux/if_addr.h>.
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: https://lore.kernel.org/ltp/20210930183058.5240-3-petr.vorel@gmail.com/T/#u ]
+---
+ include/lapi/if_addr.h   | 16 ++++++++++++++++
+ include/lapi/rtnetlink.h |  5 +----
+ 2 files changed, 17 insertions(+), 4 deletions(-)
+ create mode 100644 include/lapi/if_addr.h
+
+diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
+new file mode 100644
+index 000000000..4e50a0a4e
+--- /dev/null
++++ b/include/lapi/if_addr.h
+@@ -0,0 +1,16 @@
++// SPDX-License-Identifier: GPL-2.0-or-later
++/*
++ * Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com>
++ */
++
++#ifndef LAPI_IF_ADDR_H__
++#define LAPI_IF_ADDR_H__
++
++#include <linux/if_addr.h>
++
++#ifndef IFA_FLAGS
++# define IFA_FLAGS 8
++#endif
++
++
++#endif /* LAPI_IF_ADDR_H__ */
+diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
+index 04e9ad51a..089bf1a0d 100644
+--- a/include/lapi/rtnetlink.h
++++ b/include/lapi/rtnetlink.h
+@@ -5,9 +5,6 @@
+ # define LAPI_RTNETLINK_H__
+
+ #include <linux/rtnetlink.h>
+-
+-#ifndef IFA_FLAGS
+-# define IFA_FLAGS 8
+-#endif
++#include "lapi/if_addr.h"
+
+ #endif	/* LAPI_RTNETLINK_H__ */
+--
+2.33.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch b/meta/recipes-extended/ltp/ltp/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
new file mode 100644
index 0000000000..4a7d204271
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
@@ -0,0 +1,60 @@
+From 9e357fb4fc00ab9c303e314b85b9ae3836141f81 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Wed, 29 Sep 2021 19:56:29 +0200
+Subject: [PATCH] lapi/if_addr.h: Define IFA_F_NOPREFIXROUTE
+
+and use it in icmp_rate_limit01.c.
+
+This fixes error on toolchains with very old kernel headers, e.g.
+Buildroot sourcery-arm:
+
+icmp_rate_limit01.c:82:3: error: 'IFA_F_NOPREFIXROUTE' undeclared (first use in this function)
+   IFA_F_NOPREFIXROUTE);
+
+Fixed because IFA_F_NOPREFIXROUTE was added in 3.14 and the oldest
+system we still support is Cent0S 7 with 3.10 kernel.
+
+NOTE: Cent0S 7 is obviously heavily patched thus it contains
+IFA_F_NOPREFIXROUTE and therefore CI build didn't catch this error.
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: https://lore.kernel.org/ltp/20210930183058.5240-4-petr.vorel@gmail.com/T/#u ]
+---
+ include/lapi/if_addr.h            | 3 +++
+ testcases/cve/icmp_rate_limit01.c | 3 ++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
+index 4e50a0a4e..0f7e44784 100644
+--- a/include/lapi/if_addr.h
++++ b/include/lapi/if_addr.h
+@@ -12,5 +12,8 @@
+ # define IFA_FLAGS 8
+ #endif
+
++#ifndef IFA_F_NOPREFIXROUTE
++# define IFA_F_NOPREFIXROUTE	0x200
++#endif
+
+ #endif /* LAPI_IF_ADDR_H__ */
+diff --git a/testcases/cve/icmp_rate_limit01.c b/testcases/cve/icmp_rate_limit01.c
+index b3a237b30..3ada32675 100644
+--- a/testcases/cve/icmp_rate_limit01.c
++++ b/testcases/cve/icmp_rate_limit01.c
+@@ -27,11 +27,12 @@
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+-#include <linux/if_addr.h>
+ #include <linux/errqueue.h>
+
+ #include <sched.h>
+ #include <limits.h>
++
++#include "lapi/if_addr.h"
+ #include "tst_test.h"
+ #include "tst_netdevice.h"
+
+--
+2.33.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20210524.bb b/meta/recipes-extended/ltp/ltp_20210927.bb
similarity index 86%
rename from meta/recipes-extended/ltp/ltp_20210524.bb
rename to meta/recipes-extended/ltp/ltp_20210927.bb
index 20e2deffa5..359a00132e 100644
--- a/meta/recipes-extended/ltp/ltp_20210524.bb
+++ b/meta/recipes-extended/ltp/ltp_20210927.bb
@@ -5,13 +5,8 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-    file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-    file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
-    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
-    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
     file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
-    file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+    file://testcases/network/can/filter-tests/COPYING;md5=5b155ea7d7f86eae8e8832955d8b70bc \
 "
 
 DEPENDS = "attr libaio libcap acl openssl zip-native"
@@ -27,11 +22,14 @@ CFLAGS:append:x86-64 = " -fomit-frame-pointer"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "0fb171f2beddaf64bd27597577c206c0f892b3cd"
+SRCREV = "12beeda351b5d758a729aaf695b836ccc9eb5304"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch \
+           file://0002-lib-fix-MemAvailable-parsing.patch \
+           file://0003-lapi-rtnetlink.h-Fix-include-guards.patch \
+           file://0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch \
+           file://0005-lapi-if_addr.h-Define-IFA_FLAGS.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -119,9 +117,8 @@ remove_broken_musl_sources() {
 	echo "WARNING: remove unsupported tests (until they're fixed)"
 
 	# sync with upstream
-	# https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh#L33
+	# https://github.com/linux-test-project/ltp/blob/master/ci/alpine.sh#L33
 	rm -rfv \
-		testcases/kernel/sched/process_stress/process.c \
 		testcases/kernel/syscalls/confstr/confstr01.c \
 		testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
 		testcases/kernel/syscalls/getcontext/getcontext01.c \
-- 
2.33.0

