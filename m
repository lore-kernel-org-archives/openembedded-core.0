Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 71FDC6D494
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 05:33:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9L5X852009791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 22:33:08 -0700
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 20 Oct 2019 22:33:07 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2019 13:33:05 +0800
Message-ID: <20191021053305.1936-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: fix PKNAME name is NULL when use lsblk [LIN1019-2963]
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
X-List-Received-Date: Mon, 21 Oct 2019 05:33:07 -0000
Content-Type: text/plain

PKNAME is NULL when run "lsblk -o+PKNAME /dev/sda1"
backport an upstream patch to fix it.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 ...-force-to-print-PKNAME-for-partition.patch | 36 +++++++++++++++++++
 .../util-linux/util-linux_2.34.bb             |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch

diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch b/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
new file mode 100644
index 000000000000..5d4c148fb3d1
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
@@ -0,0 +1,36 @@
+From e3bb9bfb76c17b1d05814436ced62c05c4011f48 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 27 Jun 2019 09:22:18 +0200
+Subject: [PATCH] lsblk: force to print PKNAME for partition
+
+PKNAME (parent kernel device name) is based on printed tree according
+to parent -> child relationship. The tree is optional and not printed
+if partition specified (.e.g "lsblk -o+PKNAME /dev/sda1"), but old
+versions print the PKNAME also in this case.
+
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/e3bb9bfb76c17b1d05814436ced62c05c4011f48]
+
+Addresses: https://github.com/karelzak/util-linux/issues/813
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Liwei Song <liwei.song@windriver.com>
+---
+ misc-utils/lsblk.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/misc-utils/lsblk.c b/misc-utils/lsblk.c
+index e95af7af0256..3ce6da730264 100644
+--- a/misc-utils/lsblk.c
++++ b/misc-utils/lsblk.c
+@@ -1019,6 +1019,9 @@ static void device_to_scols(
+ 	DBG(DEV, ul_debugobj(dev, "add '%s' to scols", dev->name));
+ 	ON_DBG(DEV, if (ul_path_isopen_dirfd(dev->sysfs)) ul_debugobj(dev, " %s ---> is open!", dev->name));
+ 
++	if (!parent && dev->wholedisk)
++		parent = dev->wholedisk;
++
+ 	/* Do not print device more than one in --list mode */
+ 	if (!(lsblk->flags & LSBLK_TREE) && dev->is_printed)
+ 		return;
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.34.bb b/meta/recipes-core/util-linux/util-linux_2.34.bb
index 262f4bacb00b..e9c2d80e902b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.34.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.34.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://configure-sbindir.patch \
             file://run-ptest \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
+            file://0001-lsblk-force-to-print-PKNAME-for-partition.patch \
 "
 SRC_URI[md5sum] = "a78cbeaed9c39094b96a48ba8f891d50"
 SRC_URI[sha256sum] = "743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa427bbb4a3e9b9f62b5"
-- 
2.17.1


