Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6F89179404
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 16:52:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7MGqlaa028770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:52:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 22 Aug 2018 09:52:46 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 00:52:45 +0800
Message-ID: <1534956765-283844-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ltp: Fix ftest06 too small file path string
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
X-List-Received-Date: Wed, 22 Aug 2018 16:52:49 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

The name string is too small to contain normal full path names and causes
the following failure.

"ftest06     2  TFAIL  :  ftest06.c:223: Can't chdir(): errno=ENOENT(2): No such file or directory"

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...est06.c-Fix-too-small-name-string-and-rel.patch | 34 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch

diff --git a/meta/recipes-extended/ltp/ltp/0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch b/meta/recipes-extended/ltp/ltp/0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch
new file mode 100644
index 0000000..407d98e
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch
@@ -0,0 +1,34 @@
+From baeef026f80e19a634a4096e97286419aca1cf68 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Thu, 23 Aug 2018 00:22:04 +0800
+Subject: [PATCH] fs/ftest/ftest06.c: Fix too small name string and related
+ failure
+
+The name string is too small to contain normal full path names and causes
+the following failure.
+
+"ftest06     2  TFAIL  :  ftest06.c:223: Can't chdir(): errno=ENOENT(2): No such file or directory"
+
+Upstream-Status: Submitted [ltp-list@lists.sourceforge.net]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ testcases/kernel/fs/ftest/ftest06.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/fs/ftest/ftest06.c b/testcases/kernel/fs/ftest/ftest06.c
+index 2ca7c88..b434067 100644
+--- a/testcases/kernel/fs/ftest/ftest06.c
++++ b/testcases/kernel/fs/ftest/ftest06.c
+@@ -100,7 +100,7 @@ static char *fstyp;
+ int main(int ac, char *av[])
+ {
+ 	int pid, child, status, count, k, j;
+-	char name[3];
++	char name[MAXPATHLEN];
+ 
+ 	int lc;
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
index 8f64d7b..978d3cd 100644
--- a/meta/recipes-extended/ltp/ltp_20180515.bb
+++ b/meta/recipes-extended/ltp/ltp_20180515.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
            file://0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch \
            file://0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch \
+           file://0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


