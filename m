Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 08388795A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 07:21:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7O7LUw9025987
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 00:21:30 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Fri, 24 Aug 2018 00:21:29 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2018 15:21:27 +0800
Message-ID: <1535095287-25729-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH] blktrace: Security fix CVE-2018-10689
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
X-List-Received-Date: Fri, 24 Aug 2018 07:21:30 -0000
Content-Type: text/plain

CVE-2018-10689: blktrace (aka Block IO Tracing) 1.2.0, as used with the
Linux kernel and Android, has a buffer overflow in the dev_map_read
function in btt/devmap.c because the device and devno arrays are too
small, as demonstrated by an invalid free when using the btt program
with a crafted file.

References:
https://nvd.nist.gov/vuln/detail/CVE-2018-10689

Patch from:
https://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git/commit/?id=d61ff409cb4dda31386373d706ea0cfb1aaac5b7

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../blktrace/blktrace/CVE-2018-10689.patch         | 150 +++++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb       |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/CVE-2018-10689.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/CVE-2018-10689.patch b/meta/recipes-kernel/blktrace/blktrace/CVE-2018-10689.patch
new file mode 100644
index 0000000..7b58568
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/CVE-2018-10689.patch
@@ -0,0 +1,150 @@
+From d61ff409cb4dda31386373d706ea0cfb1aaac5b7 Mon Sep 17 00:00:00 2001
+From: Jens Axboe <axboe@kernel.dk>
+Date: Wed, 2 May 2018 10:24:17 -0600
+Subject: [PATCH] btt: make device/devno use PATH_MAX to avoid overflow
+
+Herbo Zhang reports:
+
+I found a bug in blktrace/btt/devmap.c. The code is just as follows:
+
+https://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git/tree/btt/devmap.c?id=8349ad2f2d19422a6241f94ea84d696b21de4757
+
+       struct devmap {
+
+struct list_head head;
+char device[32], devno[32];    // #1
+};
+
+LIST_HEAD(all_devmaps);
+
+static int dev_map_add(char *line)
+{
+struct devmap *dmp;
+
+if (strstr(line, "Device") != NULL)
+return 1;
+
+dmp = malloc(sizeof(struct devmap));
+if (sscanf(line, "%s %s", dmp->device, dmp->devno) != 2) {  //#2
+free(dmp);
+return 1;
+}
+
+list_add_tail(&dmp->head, &all_devmaps);
+return 0;
+}
+
+int dev_map_read(char *fname)
+{
+char line[256];   // #3
+FILE *fp = my_fopen(fname, "r");
+
+if (!fp) {
+perror(fname);
+return 1;
+}
+
+while (fscanf(fp, "%255[a-zA-Z0-9 :.,/_-]\n", line) == 1) {
+if (dev_map_add(line))
+break;
+}
+
+fclose(fp);
+return 0;
+}
+
+ The line length is 256, but the dmp->device, dmp->devno  max length
+is only 32. We can put strings longer than 32 into dmp->device and
+dmp->devno , and then they will be overflowed.
+
+ we can trigger this bug just as follows:
+
+ $ python -c "print 'A'*256" > ./test
+    $ btt -M ./test
+
+    *** Error in btt': free(): invalid next size (fast): 0x000055ad7349b250 ***
+    ======= Backtrace: =========
+    /lib/x86_64-linux-gnu/libc.so.6(+0x777e5)[0x7f7f158ce7e5]
+    /lib/x86_64-linux-gnu/libc.so.6(+0x7fe0a)[0x7f7f158d6e0a]
+    /lib/x86_64-linux-gnu/libc.so.6(cfree+0x4c)[0x7f7f158da98c]
+    btt(+0x32e0)[0x55ad7306f2e0]
+    btt(+0x2c5f)[0x55ad7306ec5f]
+    btt(+0x251f)[0x55ad7306e51f]
+    /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf0)[0x7f7f15877830]
+    btt(+0x26b9)[0x55ad7306e6b9]
+    ======= Memory map: ========
+    55ad7306c000-55ad7307f000 r-xp 00000000 08:14 3698139
+      /usr/bin/btt
+    55ad7327e000-55ad7327f000 r--p 00012000 08:14 3698139
+      /usr/bin/btt
+    55ad7327f000-55ad73280000 rw-p 00013000 08:14 3698139
+      /usr/bin/btt
+    55ad73280000-55ad73285000 rw-p 00000000 00:00 0
+    55ad7349a000-55ad734bb000 rw-p 00000000 00:00 0
+      [heap]
+    7f7f10000000-7f7f10021000 rw-p 00000000 00:00 0
+    7f7f10021000-7f7f14000000 ---p 00000000 00:00 0
+    7f7f15640000-7f7f15656000 r-xp 00000000 08:14 14942237
+      /lib/x86_64-linux-gnu/libgcc_s.so.1
+    7f7f15656000-7f7f15855000 ---p 00016000 08:14 14942237
+      /lib/x86_64-linux-gnu/libgcc_s.so.1
+    7f7f15855000-7f7f15856000 r--p 00015000 08:14 14942237
+      /lib/x86_64-linux-gnu/libgcc_s.so.1
+    7f7f15856000-7f7f15857000 rw-p 00016000 08:14 14942237
+      /lib/x86_64-linux-gnu/libgcc_s.so.1
+    7f7f15857000-7f7f15a16000 r-xp 00000000 08:14 14948477
+      /lib/x86_64-linux-gnu/libc-2.23.so
+    7f7f15a16000-7f7f15c16000 ---p 001bf000 08:14 14948477
+      /lib/x86_64-linux-gnu/libc-2.23.so
+    7f7f15c16000-7f7f15c1a000 r--p 001bf000 08:14 14948477
+      /lib/x86_64-linux-gnu/libc-2.23.so
+    7f7f15c1a000-7f7f15c1c000 rw-p 001c3000 08:14 14948477
+      /lib/x86_64-linux-gnu/libc-2.23.so
+    7f7f15c1c000-7f7f15c20000 rw-p 00000000 00:00 0
+    7f7f15c20000-7f7f15c46000 r-xp 00000000 08:14 14948478
+      /lib/x86_64-linux-gnu/ld-2.23.so
+    7f7f15e16000-7f7f15e19000 rw-p 00000000 00:00 0
+    7f7f15e42000-7f7f15e45000 rw-p 00000000 00:00 0
+    7f7f15e45000-7f7f15e46000 r--p 00025000 08:14 14948478
+      /lib/x86_64-linux-gnu/ld-2.23.so
+    7f7f15e46000-7f7f15e47000 rw-p 00026000 08:14 14948478
+      /lib/x86_64-linux-gnu/ld-2.23.so
+    7f7f15e47000-7f7f15e48000 rw-p 00000000 00:00 0
+    7ffdebe5c000-7ffdebe7d000 rw-p 00000000 00:00 0
+      [stack]
+    7ffdebebc000-7ffdebebe000 r--p 00000000 00:00 0
+      [vvar]
+    7ffdebebe000-7ffdebec0000 r-xp 00000000 00:00 0
+      [vdso]
+    ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0
+      [vsyscall]
+    [1]    6272 abort      btt -M test
+
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+
+Upstream-Status: Backport
+[https://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git/commit/?id=d61ff409cb4dda31386373d706ea0cfb1aaac5b7]
+
+CVE: CVE-2018-10689
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ btt/devmap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/btt/devmap.c b/btt/devmap.c
+index 0553a9e..5fc1cb2 100644
+--- a/btt/devmap.c
++++ b/btt/devmap.c
+@@ -23,7 +23,7 @@
+ 
+ struct devmap {
+ 	struct list_head head;
+-	char device[32], devno[32];
++	char device[PATH_MAX], devno[PATH_MAX];
+ };
+ 
+ LIST_HEAD(all_devmaps);
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 663de2e..2605ff9 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -11,6 +11,7 @@ PV = "1.2.0+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git \
            file://ldflags.patch \
+           file://CVE-2018-10689.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


