Return-Path: <Chuang.Dong@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E94DF75762
	for <Openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 08:06:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t53865eP020006
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 3 Jun 2015 01:06:05 -0700 (PDT)
Received: from [128.224.163.151] (128.224.163.151) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 3 Jun 2015 01:06:04 -0700
Message-ID: <556EB568.30901@windriver.com>
Date: Wed, 3 Jun 2015 16:06:00 +0800
From: cdong <chuang.dong@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <Openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.163.151]
Subject: ltp: vma03 fix the alginment of page size
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
X-List-Received-Date: Wed, 03 Jun 2015 08:06:08 -0000
X-Groupsio-MsgNum: 66230
Content-Type: multipart/mixed; boundary="------------080902020809080100010802"

--------------080902020809080100010802
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
     This patch fix a vma03 bug,the info below detail it:

     the offset which is parameter of mmap2() function doesn't align the
     page size,but,this parameter is allowed multiple of the page size
     as returned by sysconf(_SC_PAGE_SIZE),meanwhile offset * 4096 must be
     a multiple of the system page size,so modify the input parameter
     pgoff = (ULONG_MAX - 1)&(~((pgsz-1)>>12));

     Regards
     Chuang

--------------080902020809080100010802
Content-Type: text/x-patch;
	name="0001-ltp-vma03-fix-the-alginment-of-page-size.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-ltp-vma03-fix-the-alginment-of-page-size.patch"

From 1685976a18cf9b4d255434731336a820578c7647 Mon Sep 17 00:00:00 2001
From: Chuang Dong <chuang.dong@windriver.com>
Date: Wed, 3 Jun 2015 15:53:30 +0800
Subject: [PATCH] ltp: vma03 fix the alginment of page size

the offset which is parameter of mmap2() function doesn't align the
page size,but,this parameter is allowed multiple of the page size
as returned by sysconf(_SC_PAGE_SIZE),meanwhile offset * 4096 must be
a multiple of the system page size,so modify the input parameter
pgoff = (ULONG_MAX - 1)&(~((pgsz-1)>>12));

Upstream-Status: Submitted

Signed-off-by: Chuang Dong <chuang.dong@windriver.com>
---
 ...-ltp-vma03-fix-the-alginment-of-page-size.patch | 32 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20150119.bb          |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-ltp-vma03-fix-the-alginment-of-page-size.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-vma03-fix-the-alginment-of-page-size.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-vma03-fix-the-alginment-of-page-size.patch
new file mode 100644
index 0000000..0e5678d
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-ltp-vma03-fix-the-alginment-of-page-size.patch
@@ -0,0 +1,32 @@
+From dd53725b162707bd09db0dce5ae141c997042fa6 Mon Sep 17 00:00:00 2001
+From: Chuang Dong <chuang.dong@windriver.com>
+Date: Wed, 3 Jun 2015 15:44:35 +0800
+Subject: [PATCH] ltp: vma03 fix the alginment of page size
+
+the offset which is parameter of mmap2() function doesn't align the
+page size,but,this parameter is allowed multiple of the page size
+as returned by sysconf(_SC_PAGE_SIZE),meanwhile offset * 4096 must be
+a multiple of the system page size,so modify the input parameter
+pgoff = (ULONG_MAX - 1)&(~((pgsz-1)>>12));
+
+Signed-off-by: Chuang Dong <chuang.dong@windriver.com>
+---
+ testcases/kernel/mem/vma/vma03.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/mem/vma/vma03.c b/testcases/kernel/mem/vma/vma03.c
+index 270097b..72ac470 100644
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
+1.9.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20150119.bb b/meta/recipes-extended/ltp/ltp_20150119.bb
index 90c5973..9c5c762 100644
--- a/meta/recipes-extended/ltp/ltp_20150119.bb
+++ b/meta/recipes-extended/ltp/ltp_20150119.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://make-setregid02-work.patch \
     file://add-knob-for-numa.patch \
     file://add-knob-for-tirpc.patch \
+    file://0001-ltp-vma03-fix-the-alginment-of-page-size.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


--------------080902020809080100010802--
