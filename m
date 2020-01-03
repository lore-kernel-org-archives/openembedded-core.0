Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7D52C7FC83
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 08:32:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,390,1571673600"; d="scan'208";a="81266743"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 16:32:41 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 9652C49E931C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 16:23:43 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 16:32:39 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020 16:32:41 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jan 2020 05:01:18 -0800
Message-ID: <1578056478-94580-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578056478-94580-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578056478-94580-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 9652C49E931C.A2A3F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] sysstat: 12.2.0 -> 12.2.1
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
X-List-Received-Date: Fri, 03 Jan 2020 08:32:41 -0000
Content-Type: text/plain

0001-Include-needed-headers-explicitly.patch and CVE-2019-19725.patch
Removed since they are included in 12.2.1

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...01-Include-needed-headers-explicitly.patch | 59 -------------------
 .../sysstat/sysstat/CVE-2019-19725.patch      | 28 ---------
 .../sysstat/sysstat_12.2.0.bb                 | 11 ----
 .../sysstat/sysstat_12.2.1.bb                 |  8 +++
 4 files changed, 8 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch
 delete mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_12.2.0.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat_12.2.1.bb

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch b/meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch
deleted file mode 100644
index 1b63299aae..0000000000
--- a/meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 42325faa88d64cce799977d611b2792beb154643 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 14 Sep 2015 08:36:59 +0000
-Subject: [PATCH] Include needed headers explicitly
-
-on glibc these headers get pulled in indirectly via other .h files
-but right fix is to include them directly when used
-
-fixes
-
-error: use of undeclared identifier 'PATH_MAX'
-error: called object type 'unsigned int' is not a function or function pointer
-dm_major = major(aux.st_rdev);
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- common.c    | 1 +
- ioconf.c    | 1 +
- sa_common.c | 1 +
- 3 files changed, 3 insertions(+)
-
-Index: sysstat-11.7.1/common.c
-===================================================================
---- sysstat-11.7.1.orig/common.c
-+++ sysstat-11.7.1/common.c
-@@ -20,6 +20,7 @@
-  */
- 
- #include <stdio.h>
-+#include <limits.h>
- #include <string.h>
- #include <stdlib.h>
- #include <stdarg.h>
-Index: sysstat-11.7.1/ioconf.c
-===================================================================
---- sysstat-11.7.1.orig/ioconf.c
-+++ sysstat-11.7.1/ioconf.c
-@@ -27,6 +27,7 @@
- #include <errno.h>
- #include <dirent.h>
- #include <sys/stat.h>
-+#include <sys/types.h>
- 
- #include "ioconf.h"
- #include "common.h"
-Index: sysstat-11.7.1/sa_common.c
-===================================================================
---- sysstat-11.7.1.orig/sa_common.c
-+++ sysstat-11.7.1/sa_common.c
-@@ -20,6 +20,7 @@
-  */
- 
- #include <stdio.h>
-+#include <limits.h>
- #include <string.h>
- #include <stdlib.h>
- #include <stdint.h>
diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch
deleted file mode 100644
index 2aa12724f8..0000000000
--- a/meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a5c8abd4a481ee6e27a3acf00e6d9b0f023e20ed Mon Sep 17 00:00:00 2001
-From: Sebastien GODARD <sysstat@users.noreply.github.com>
-Date: Mon, 9 Dec 2019 17:54:07 +0100
-Subject: [PATCH] Fix #242: Double free in check_file_actlst()
-
-Avoid freeing buffer() twice.
-
-Signed-off-by: Sebastien GODARD <sysstat@users.noreply.github.com>
-
-Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/a5c8abd4a481ee6e27a3acf00e6d9b0f023e20ed]
-CVE: CVE-2019-19725
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- sa_common.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/sa_common.c b/sa_common.c
-index cf52aefe..856a3715 100644
---- a/sa_common.c
-+++ b/sa_common.c
-@@ -2153,6 +2153,7 @@ void check_file_actlst(int *ifd, char *dfile, struct activity *act[], uint64_t f
- 	}
- 
- 	free(buffer);
-+	buffer = NULL;
- 
- 	/* Check that at least one activity selected by the user is available in file */
- 	for (i = 0; i < NR_ACT; i++) {
diff --git a/meta/recipes-extended/sysstat/sysstat_12.2.0.bb b/meta/recipes-extended/sysstat/sysstat_12.2.0.bb
deleted file mode 100644
index f7a1a35975..0000000000
--- a/meta/recipes-extended/sysstat/sysstat_12.2.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require sysstat.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
-
-SRC_URI += "file://0001-Include-needed-headers-explicitly.patch \
-            file://0001-configure.in-remove-check-for-chkconfig.patch \
-            file://CVE-2019-19725.patch \
-"
-
-SRC_URI[md5sum] = "7deffb18e7f32a0b74ab81f1f75de9ee"
-SRC_URI[sha256sum] = "61aa98eb8b38542eb97defcc2472adee1a24df8252f41b96e20d64c6064a8375"
diff --git a/meta/recipes-extended/sysstat/sysstat_12.2.1.bb b/meta/recipes-extended/sysstat/sysstat_12.2.1.bb
new file mode 100644
index 0000000000..2a90f89d25
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat_12.2.1.bb
@@ -0,0 +1,8 @@
+require sysstat.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
+
+SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
+
+SRC_URI[md5sum] = "9dfff5fac24e35bd92fb7896debf2ffb"
+SRC_URI[sha256sum] = "8edb0e19b514ac560a098a02933a4735b881296d61014db89bf80f05dd7a4732"
-- 
2.17.1




