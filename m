Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC8CC47DDF
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:48:09 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.9502.1706766486365048478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iG8qbutc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706766486; x=1738302486;
  h=from:to:cc:subject:date:message-id;
  bh=nVMvufF0NbdNY4/hgavjjBNgq/ibJnQ1ctyUAiU9AqM=;
  b=iG8qbutcqe7HSkqhPtNTorbLaOFuAM79kOC7/c+NAeXzosQLnCjeebYE
   vM7Nl0Abh/dog0mNR+ydE6Poh4Dugvp6vu+rqu/u7fex/uYmZCT+B5YY4
   tYuuoBjM5Vn3tHDSH3duvIhr3/1TTYCs/X59QiD++Ko9niXkG7ilEJNXn
   z+GYveej7Z9UopU2pgF9LdV8SJynTE2/ZC2Mozgj0nWHGq3bXalxQJbO6
   +fKJhgnJRkO2t2EXWw4uDK7eRhw2Dn0t8+Cr/GPe8PPvEZNi3tB4bLPsS
   ALofD4Xd65X8B/if8hU/KqXAgc7ySR337vKV3a2R3lrIkzgjXicaIP8cw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="148285110"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="148285110"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:48:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 69DCD37780
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:48:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 99D231A76E0
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:48:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 33191200982EC
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:48:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C39D81A006A;
	Thu,  1 Feb 2024 13:47:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] numactl: upgrade 2.0.16 -> 2.0.17
Date: Thu,  1 Feb 2024 13:45:02 +0800
Message-Id: <1706766302-13014-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--13.307800-10.000000
X-TMASE-MatchedRID: aL9W8lSYQvyjz0nOeth/yUhwlOfYeSqxkdS3kPlaZyWhLh9e7qvSIuOj
	4DfnnaWNT72X2RxngXKYPsTBEa9DWVSYAx1RhJuHA9lly13c/gEJlr1xKkE5uaShvRjfn4cU6+f
	8731wcoUILxoCYZ47qepe9co8GDkGZWMJGq5h2T4ReM8i8p3vgFK6+0HOVoSoNS9A3X1uuODO/T
	5SZgJlwzCokNvqo0GI+xwEFzq+82BTDsByzsbu5gk3qL3jdFBNLBZz7nFdWD6MJxigKCCiSzhbu
	aUQKXpsfr1jt5raS6vcyZKVkU4IwaYFcZuboHd530kDaWZBE1Qz0SQBTPKW4efdksK3etFJhQ6Y
	ZNvnIb8ha/Oaa/N+djBQAMiV/r8BpqOcrgesqg/wlvzzUUaf2Z+Z30eyNnRTReOJg/1Upn3Ql0P
	sgAcI+z2KUeqNaL21r8186pfsJcbSeXWew2NHuJV3j1zTOBYz2ouYuLMUrI60TybP6vL8lCGOnv
	l4tWofF9I3HgybRyEyh2C7EeKtCx8TzIzimOwPC24oEZ6SpSkj80Za3RRg8NZOvr2s/LXTKip2F
	CgwLlYsT7asulpdDRQ50wrcec3CTndonrbftQg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:48:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194574

From: Wang Mingyu <wangmy@fujitsu.com>

0001-configure-Check-for-largefile-support.patch
0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch
removed since they're included in 2.0.17

0001-define-run-test-target.patch
Fix-the-test-output-format.patch
refreshed for 2.0.17

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...onfigure-Check-for-largefile-support.patch | 27 --------
 .../numactl/0001-define-run-test-target.patch | 13 ++--
 ...at64-fstat64-ftruncate64mmap64-with-.patch | 64 -------------------
 .../numactl/Fix-the-test-output-format.patch  | 14 ++--
 .../{numactl_git.bb => numactl_2.0.17.bb}     |  5 +-
 5 files changed, 14 insertions(+), 109 deletions(-)
 delete mode 100644 meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch
 delete mode 100644 meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch
 rename meta/recipes-support/numactl/{numactl_git.bb => numactl_2.0.17.bb} (89%)

diff --git a/meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch b/meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch
deleted file mode 100644
index 152eb2807b..0000000000
--- a/meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 61f910f5d12d6f6a66223b5af6d74e30ace3a2e1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Dec 2022 12:10:37 -0800
-Subject: [PATCH] configure: Check for largefile support
-
-This helps in using 64bit versions of off_t related functions
-
-Upstream-Status: Backport [https://github.com/numactl/numactl/pull/159]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 8510fc5..d74bc6e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -14,6 +14,9 @@ LT_INIT
- 
- AC_PROG_CC
- 
-+# Check for enabling LFS support
-+AC_SYS_LARGEFILE
-+
- # Override CFLAGS so that we can specify custom CFLAGS for numademo.
- AX_AM_OVERRIDE_VAR([CFLAGS])
- 
diff --git a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
index 9e65a45133..24947c6097 100644
--- a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
+++ b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
@@ -1,4 +1,7 @@
-rename test target as run-test
+From bb86379afbe6c94514aa0920b428ea77c2d1531f Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Mon, 19 Oct 2020 14:42:11 -0700
+Subject: [PATCH] rename test target as run-test
 
 Upstream-Status: Pending
 
@@ -8,15 +11,16 @@ not suitable for cross-compile environment, so rename it as run-test.
 and define test target to compile the test files.
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
  Makefile.am | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index b6db339..de176c4 100644
+index e84b21e..94a8bff 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -124,7 +124,9 @@ regress2: $(check_PROGRAMS)
+@@ -126,7 +126,9 @@ regress2: $(check_PROGRAMS)
  test_numademo: numademo
  	./numademo -t -e 10M
  
@@ -27,6 +31,3 @@ index b6db339..de176c4 100644
  
  TESTS_ENVIRONMENT = builddir='$(builddir)'; export builddir;
  
--- 
-1.9.1
-
diff --git a/meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch b/meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch
deleted file mode 100644
index 03b98e0a2c..0000000000
--- a/meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 8a08d3583d77bebeb1763fb9b378899201ce5afa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Dec 2022 12:11:13 -0800
-Subject: [PATCH] shm.c: Replace stat64/fstat64/ftruncate64mmap64 with normal functions
-
-These functions were needed when _FILE_OFFSET_BITS was not 64, using
-AC_SYS_LARGEFILE will detect it correctly and make the normal variants
-of these functions behave same as their *64 counterparts.
-
-Upstream-Status: Backport [https://github.com/numactl/numactl/pull/159]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- shm.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/shm.c b/shm.c
-index 20537d9..5d0d1ab 100644
---- a/shm.c
-+++ b/shm.c
-@@ -24,8 +24,8 @@
- #include <sys/mman.h>
- #include <sys/ipc.h>
- #include <sys/shm.h>
--#include <sys/fcntl.h>
- #include <sys/stat.h>
-+#include <fcntl.h>
- #include <stdarg.h>
- #include <errno.h>
- #include <unistd.h>
-@@ -135,7 +135,7 @@ void attach_sysvshm(char *name, char *opt)
- /* Attach a shared memory file. */
- void attach_shared(char *name, char *opt)
- {
--	struct stat64 st;
-+	struct stat st;
- 
- 	shmfd = open(name, O_RDWR);
- 	if (shmfd < 0) {
-@@ -146,14 +146,14 @@ void attach_shared(char *name, char *opt)
- 		if (shmfd < 0)
- 			nerror("cannot create file %s", name);
- 	}
--	if (fstat64(shmfd, &st) < 0)
-+	if (fstat(shmfd, &st) < 0)
- 		err("shm stat");
- 	/* the file size must be larger than mmap shmlen + shmoffset, otherwise SIGBUS
- 	 * will be caused when we access memory, because mmaped memory is no longer in
- 	 * the range of the file laster.
- 	 */
- 	if ((shmlen + shmoffset) > st.st_size) {
--		if (ftruncate64(shmfd, shmlen + shmoffset) < 0) {
-+		if (ftruncate(shmfd, shmlen + shmoffset) < 0) {
- 			/* XXX: we could do it by hand, but it would it
- 			   would be impossible to apply policy then.
- 			   need to fix that in the kernel. */
-@@ -168,7 +168,7 @@ void attach_shared(char *name, char *opt)
- 
- 	/* RED-PEN For shmlen > address space may need to map in pieces.
- 	   Left for some poor 32bit soul. */
--	shmptr = mmap64(NULL, shmlen, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, shmoffset);
-+	shmptr = mmap(NULL, shmlen, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, shmoffset);
- 	if (shmptr == (char*)-1)
- 		err("shm mmap");
- }
diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
index a7bc8d322e..6db3d4e303 100644
--- a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
+++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From 59fd750a84bbe5874dec936d2bee9ef11a1b6505 Mon Sep 17 00:00:00 2001
+From ed5502958bcc857c2cb3dba91e0689020a19afed Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Tue, 21 Jul 2015 02:01:22 +0900
 Subject: [PATCH] Fix the test output format
@@ -8,24 +8,25 @@ Upstream-Status: Pending
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+
 ---
  test/regress  |  6 +++---
  test/regress2 | 11 +++++------
  2 files changed, 8 insertions(+), 9 deletions(-)
 
 diff --git a/test/regress b/test/regress
-index 2ce1705..d086a47 100755
+index f06b22f..2fdfacb 100755
 --- a/test/regress
 +++ b/test/regress
-@@ -74,6 +74,7 @@ probe_hardware()
+@@ -78,6 +78,7 @@ probe_hardware()
  	if [ $numnodes -lt 2 ] ; then
  	    echo "need at least two nodes with at least $NEEDPAGES each of"
  	    echo "free memory for mempolicy regression tests"
 +	    echo "SKIP: numa regress"
-	    exit 77  # Skip test
+ 	    exit 77  # Skip test
  	fi
  }
-@@ -207,10 +208,9 @@ main()
+@@ -209,10 +210,9 @@ main()
  	rm A B
  
  	if [ "$EXIT" = 0 ] ; then
@@ -60,6 +61,3 @@ index aa6ea41..450c510 100755
  }
  
  # still broken
--- 
-1.8.4.2
-
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_2.0.17.bb
similarity index 89%
rename from meta/recipes-support/numactl/numactl_git.bb
rename to meta/recipes-support/numactl/numactl_2.0.17.bb
index 0f71258bc3..5c8b63bc27 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_2.0.17.bb
@@ -10,16 +10,13 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=9f34c3af4ed6f3f5df0da5f3c0835a43"
 
-SRCREV = "10285f1a1bad49306839b2c463936460b604e3ea"
-PV = "2.0.16"
+SRCREV = "c1165896572b74e971d817909bf652066ddf801a"
 
 SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
            file://Makefile \
            file://run-ptest \
            file://0001-define-run-test-target.patch \
-           file://0001-configure-Check-for-largefile-support.patch \
-           file://0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


