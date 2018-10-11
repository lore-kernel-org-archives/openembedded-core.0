Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70BEF7920B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 07:13:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9B7D12Z018821
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 00:13:01 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 11 Oct 2018 00:13:00 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Oct 2018 00:13:00 -0700
Message-ID: <20181011071300.42273-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] ltp: modify mmap_24-2 testcase
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
X-List-Received-Date: Thu, 11 Oct 2018 07:13:00 -0000
Content-Type: text/plain

Mips will return EINVAL instead of ENOMEM as expected
if the range [addr + len) exceeds TASK_SIZE.

Linux kernel code: arch/mips/mm/mmap.c
if (flags & MAP_FIXED) {
    /* Even MAP_FIXED mappings must reside within TASK_SIZE */
    if (TASK_SIZE - len < addr)
       return -EINVAL;

Relax the condition and accept both ENOMEM and EINVAL
as expected outcome.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ..._testsuite-mmap24-2-Relax-condition-a-bit.patch | 68 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch b/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
new file mode 100644
index 0000000000..4d771c0b9c
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
@@ -0,0 +1,68 @@
+From 85c972f730e8efe891a06ea3a2dfb5cbbdfbfbf4 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Wed, 10 Oct 2018 22:07:05 -0400
+Subject: [PATCH] open_posix_testsuite/mmap24-2: Relax condition a bit
+
+Mips will return EINVAL instead of ENOMEM as expected
+if the range [addr + len) exceeds TASK_SIZE.
+
+Linux kernel code: arch/mips/mm/mmap.c
+if (flags & MAP_FIXED) {
+    /* Even MAP_FIXED mappings must reside within TASK_SIZE */
+    if (TASK_SIZE - len < addr)
+        return -EINVAL;
+
+Relax the condition and accept both ENOMEM and EINVAL
+as expected outcome.
+
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2018-October/009624.html]
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ .../open_posix_testsuite/conformance/interfaces/mmap/24-2.c    | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c b/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c
+index de51d43..810e5c8 100644
+--- a/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c
++++ b/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c
+@@ -7,7 +7,7 @@
+  * source tree.
+  *
+  * The mmap() function shall fail if:
+- * [ENOMEM] MAP_FIXED was specified,
++ * [ENOMEM or EINVAL] MAP_FIXED was specified,
+  * and the range [addr,addr+len) exceeds that allowed
+  * for the address space of a process; or, if MAP_FIXED was not specified and
+  * there is insufficient room in the address space to effect the mapping.
+@@ -15,7 +15,7 @@
+  * Test Step:
+  * 1. Map a shared memory object, with size exceeding the value get from
+  *    rlim_cur of resource RLIMIT_AS, setting MAP_FIXED;
+- * 3. Should get ENOMEM.
++ * 3. Should get ENOMEM or EINVAL.
+  */
+ 
+ #define _XOPEN_SOURCE 600
+@@ -93,8 +93,8 @@ int main(void)
+ 	       (unsigned long)len);
+ 	pa = mmap(addr, len, PROT_READ | PROT_WRITE, MAP_FIXED | MAP_SHARED, fd,
+ 		  0);
+-	if (pa == MAP_FAILED && errno == ENOMEM) {
+-		printf("Got ENOMEM: %s\nTest PASSED\n", strerror(errno));
++	if (pa == MAP_FAILED && (errno == ENOMEM || errno == EINVAL)) {
++		printf("Got ENOMEM or EINVAL: %s\nTest PASSED\n", strerror(errno));
+ 		exit(PTS_PASS);
+ 	}
+ 
+@@ -103,6 +103,6 @@ int main(void)
+ 	else
+ 		munmap(pa, len);
+ 	close(fd);
+-	printf("Test Fail: Did not get ENOMEM as expected\n");
++	printf("Test Failed: Did not get ENOMEM or EINVAL as expected\n");
+ 	return PTS_FAIL;
+ }
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
index ba0e6a60b4..1bd36c0495 100644
--- a/meta/recipes-extended/ltp/ltp_20180515.bb
+++ b/meta/recipes-extended/ltp/ltp_20180515.bb
@@ -54,6 +54,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch \
            file://0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch \
            file://0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch \
+           file://0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.11.0


