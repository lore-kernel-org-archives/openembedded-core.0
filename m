Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F174277E8D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 08:11:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v518BQ0u031196
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Jun 2017 01:11:30 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 01:11:25 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Jun 2017 04:11:21 -0400
Message-ID: <948bda0dfcbabaefc3ebe3ff7c8db1dd8d031966.1496304334.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1496304334.git.dengke.du@windriver.com>
References: <cover.1496304334.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ltp: upgrade to 20170516
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
X-List-Received-Date: Thu, 01 Jun 2017 08:11:30 -0000
Content-Type: text/plain

1. rebase patch 0034-periodic_output.patch

    This patch can't apply, because in memcg_stress_test.sh, it used a
    different value for RUN_TIME: 15*60, we can check it here:

        https://github.com/linux-test-project/ltp/blob/20170516/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh#L40

    Previous is 60*60, we can check it here:

        https://github.com/linux-test-project/ltp/blob/20170116/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh#L40

2. delete patch 0039-fcntl-fix-the-time-def-to-use-time_t.patch

    This patch didn't need any more, because the upstream has remove the
    unneeded time() declaration. We can check it here:

        https://github.com/linux-test-project/ltp/commit/f8c96804e5e89d360707c9670b18221b11cf3858

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../ltp/ltp/0034-periodic_output.patch             | 32 +++++++++++++++-------
 ...0039-fcntl-fix-the-time-def-to-use-time_t.patch | 29 --------------------
 .../ltp/{ltp_20170116.bb => ltp_20170516.bb}       |  5 ++--
 3 files changed, 24 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-def-to-use-time_t.patch
 rename meta/recipes-extended/ltp/{ltp_20170116.bb => ltp_20170516.bb} (96%)

diff --git a/meta/recipes-extended/ltp/ltp/0034-periodic_output.patch b/meta/recipes-extended/ltp/ltp/0034-periodic_output.patch
index 59caefe..c2ef899 100644
--- a/meta/recipes-extended/ltp/ltp/0034-periodic_output.patch
+++ b/meta/recipes-extended/ltp/ltp/0034-periodic_output.patch
@@ -1,4 +1,7 @@
-Add periodic output for long time test.
+From 5a77e2bdc083f4f842a8ba7c2db1a7ac6e5f0664 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Wed, 31 May 2017 21:26:05 -0400
+Subject: [PATCH] Add periodic output for long time test.
 
 This is needed in context of having scripts running ltp tests and
 waiting with a timeout for the output of the tests.
@@ -6,20 +9,26 @@ waiting with a timeout for the output of the tests.
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
 
-diff -ruN a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
---- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh	2013-11-08 15:54:09.515049081 +0100
-+++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh	2013-11-08 22:32:15.587370406 +0100
-@@ -37,7 +37,8 @@
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ .../kernel/controllers/memcg/stress/memcg_stress_test.sh      | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
+index af1a708..084e628 100755
+--- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
++++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
+@@ -37,7 +37,8 @@ if [ "x$(grep -w memory /proc/cgroups | cut -f4)" != "x1" ]; then
          exit 0
  fi
  
--RUN_TIME=$(( 60 * 60 ))
+-RUN_TIME=$(( 15 * 60 ))
 +ONE_MINUTE=60
-+RUN_TIME=60
++RUN_TIME=15
  
  cleanup()
  {
-@@ -62,7 +63,7 @@
+@@ -62,7 +63,7 @@ do_mount()
  # $1 - Number of cgroups
  # $2 - Allocated how much memory in one process? in MB
  # $3 - The interval to touch memory in a process
@@ -28,16 +37,19 @@ diff -ruN a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh b/tes
  run_stress()
  {
  	do_mount;
-@@ -81,7 +82,11 @@
+@@ -81,7 +82,11 @@ run_stress()
  		eval /bin/kill -s SIGUSR1 \$pid$i 2> /dev/null
  	done
  
 -	sleep $4
 +	for i in $(seq 0 $(($4-1)))
 +	do
-+		eval echo "Started $i min ago. Still alive... " 
++		eval echo "Started $i min ago. Still alive... "
 +		sleep $ONE_MINUTE
 +	done
  
  	for i in $(seq 0 $(($1-1)))
  	do
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-def-to-use-time_t.patch b/meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-def-to-use-time_t.patch
deleted file mode 100644
index c0c1dad..0000000
--- a/meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-def-to-use-time_t.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7bce3d223494803cb32897cabe66119076e53d89 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 8 Feb 2017 16:23:51 +0800
-Subject: [PATCH 5/5] fcntl: fix the time() def to use time_t
-
-This fixes the build on X32, where long is 32-bit rather than 64-bit.
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- testcases/kernel/syscalls/fcntl/fcntl14.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/fcntl/fcntl14.c b/testcases/kernel/syscalls/fcntl/fcntl14.c
-index c61eb24..99e3867 100644
---- a/testcases/kernel/syscalls/fcntl/fcntl14.c
-+++ b/testcases/kernel/syscalls/fcntl/fcntl14.c
-@@ -775,7 +775,7 @@ void dochild(void)
- 
- void run_test(int file_flag, int file_mode, int seek, int start, int end)
- {
--	extern long time();
-+	extern time_t time();
- 
- 	fail = 0;
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp_20170116.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
similarity index 96%
rename from meta/recipes-extended/ltp/ltp_20170116.bb
rename to meta/recipes-extended/ltp/ltp_20170516.bb
index a5494bc..012c43d 100644
--- a/meta/recipes-extended/ltp/ltp_20170116.bb
+++ b/meta/recipes-extended/ltp/ltp_20170516.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
     file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
     file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
     file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
-    file://testcases/open_posix_testsuite/COPYING;md5=216e43b72efbe4ed9017cc19c4c68b01 \
+    file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
     file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
     file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
     file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
@@ -21,7 +21,7 @@ DEPENDS_append_libc-musl = " fts "
 EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "2c8457b0769fc026e4e1772f4c2a6da0be63a631"
+SRCREV = "6c6c6ca40afb3611e52486f670085762ff451e91"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
@@ -50,7 +50,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0034-periodic_output.patch \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
-           file://0039-fcntl-fix-the-time-def-to-use-time_t.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.8.1


