Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B9EE975C83
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 09:07:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5U97i7D016316
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 02:07:48 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 30 Jun 2015 02:07:44 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Jun 2015 17:02:45 +0800
Message-ID: <1435654965-23039-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] ltp: vma03 fix the alginment of page size
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
X-List-Received-Date: Tue, 30 Jun 2015 09:07:49 -0000
Content-Type: text/plain

From: Chuang Dong <Chuang.Dong@windriver.com>

the offset the param of mmap2() doesn't align the page size, but,
this param allow must be a multiple of the page size as returned
by sysconf(_SC_PAGE_SIZE).meanwhile offset * 4096 must be a
multiple of the system page size, so modify the input param of offset
pgoff = (ULONG_MAX - 1)&(~((pgsz-1)>>12));

Signed-off-by: Chuang Dong <Chuang.Dong@windriver.com>
---
 ...-ltp-vma03-fix-the-alginment-of-page-size.patch | 34 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20150420.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-ltp-vma03-fix-the-alginment-of-page-size.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-vma03-fix-the-alginment-of-page-size.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-vma03-fix-the-alginment-of-page-size.patch
new file mode 100644
index 0000000..905eafb
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-ltp-vma03-fix-the-alginment-of-page-size.patch
@@ -0,0 +1,34 @@
+From 243881d71d2d49027c3dc15fe27ebe7f4ee68700 Mon Sep 17 00:00:00 2001
+From: Chuang Dong <Chuang.Dong@windriver.com>
+Date: Wed, 10 Jun 2015 09:51:09 +0800
+Subject: [PATCH] ltp: vma03 fix the alginment of page size
+
+the offset the param of mmap2() doesn't align the page size, but,
+this param allow must be a multiple of the page size as returned
+by sysconf(_SC_PAGE_SIZE).meanwhile offset * 4096 must be a
+multiple of the system page size, so modify the input param of offset
+pgoff = (ULONG_MAX - 1)&(~((pgsz-1)>>12));
+
+Upstream-Status: Submitted
+
+Signed-off-by: Chuang Dong <Chuang.Dong@windriver.com>
+---
+ testcases/kernel/mem/vma/vma03.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/mem/vma/vma03.c b/testcases/kernel/mem/vma/vma03.c
+index 6af9960..b86d7ce 100644
+--- a/testcases/kernel/mem/vma/vma03.c
++++ b/testcases/kernel/mem/vma/vma03.c
+@@ -89,7 +89,7 @@ int main(int argc, char *argv[])
+ 		if (fd == -1)
+ 			tst_brkm(TBROK | TERRNO, NULL, "open %s", TESTFILE);
+ 
+-		pgoff = ULONG_MAX - 1;
++		pgoff = (ULONG_MAX - 1)&(~((pgsz-1)>>12));
+ 		map = mmap2(NULL, pgsz, PROT_READ | PROT_WRITE, MAP_PRIVATE,
+ 			    fd, pgoff);
+ 		if (map == MAP_FAILED)
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-extended/ltp/ltp_20150420.bb b/meta/recipes-extended/ltp/ltp_20150420.bb
index b4fc223..2554f52 100644
--- a/meta/recipes-extended/ltp/ltp_20150420.bb
+++ b/meta/recipes-extended/ltp/ltp_20150420.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://make-setregid02-work.patch \
     file://add-knob-for-numa.patch \
     file://add-knob-for-tirpc.patch \
+    file://0001-ltp-vma03-fix-the-alginment-of-page-size.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


