Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 390507E950
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 09:47:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x619llNp012411
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jul 2019 02:47:47 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 02:47:46 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Jul 2019 02:47:46 -0700
Message-ID: <20190701094746.89325-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] ltp: diotest4: Let kernel pick an address when calling mmap
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
X-List-Received-Date: Mon, 01 Jul 2019 09:47:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Error:
diotest4 10 TBROK : diotest4.c:368: can't mmap file: Invalid argument
diotest4 11 TBROK : diotest4.c:368: Remaining cases broken

This is because the manually specified addr from mmap is invalid.
We should let kernel itself pick an addrress.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ...nel-pick-an-address-when-calling-mma.patch | 50 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190115.bb     |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch b/meta/recipes-extended/ltp/ltp/0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch
new file mode 100644
index 0000000000..109c8ea80c
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch
@@ -0,0 +1,50 @@
+From 785809201ad7dea2872d493efbfd65bb215710d6 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Sun, 30 Jun 2019 21:56:16 -0400
+Subject: [PATCH] diotest4: Let kernel pick an address when calling mmap
+
+Error:
+diotest4 10 TBROK : diotest4.c:368: can't mmap file: Invalid argument
+diotest4 11 TBROK : diotest4.c:368: Remaining cases broken
+
+This is because the specified addr from mmap is invalid.
+We should let kernel itself pick an addrress.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+
+Upstream-Status: Submitted
+[https://lists.linux.it/pipermail/ltp/2019-June/012570.html]
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ testcases/kernel/io/direct_io/diotest4.c | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/testcases/kernel/io/direct_io/diotest4.c b/testcases/kernel/io/direct_io/diotest4.c
+index e4616e4..d88c431 100644
+--- a/testcases/kernel/io/direct_io/diotest4.c
++++ b/testcases/kernel/io/direct_io/diotest4.c
+@@ -352,18 +352,14 @@ int main(int argc, char *argv[])
+ 	total++;
+ 
+ 	/* Test-10: read, write to a mmaped file */
+-	shm_base = (char *)(((long)sbrk(0) + (shmsz - 1)) & ~(shmsz - 1));
+-	if (shm_base == NULL) {
+-		tst_brkm(TBROK, cleanup, "sbrk failed: %s", strerror(errno));
+-	}
+ 	offset = 4096;
+ 	count = bufsize;
+ 	if ((fd = open(filename, O_DIRECT | O_RDWR)) < 0) {
+ 		tst_brkm(TBROK, cleanup, "can't open %s: %s",
+ 			 filename, strerror(errno));
+ 	}
+-	shm_base = mmap(shm_base, 0x100000, PROT_READ | PROT_WRITE,
+-			MAP_SHARED | MAP_FIXED, fd, 0);
++	shm_base = mmap(NULL, 0x100000, PROT_READ | PROT_WRITE,
++			MAP_SHARED, fd, 0);
+ 	if (shm_base == (caddr_t) - 1) {
+ 		tst_brkm(TBROK, cleanup, "can't mmap file: %s",
+ 			 strerror(errno));
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20190115.bb b/meta/recipes-extended/ltp/ltp_20190115.bb
index e91dea2f19..b8a7e673d3 100644
--- a/meta/recipes-extended/ltp/ltp_20190115.bb
+++ b/meta/recipes-extended/ltp/ltp_20190115.bb
@@ -50,7 +50,8 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://define-sigrtmin-and-sigrtmax-for-musl.patch \
            file://setregid01-security-string-formatting.patch \
            file://0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch \
-		   file://0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch \
+           file://0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch \
+           file://0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch\
            "
 
 S = "${WORKDIR}/git"
-- 
2.21.0


