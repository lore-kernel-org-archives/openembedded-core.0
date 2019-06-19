Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 549BA7E801
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 07:13:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,391,1557158400"; d="scan'208";a="68015171"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2019 15:13:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 618D94CDD985
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 15:13:17 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 19 Jun 2019 15:13:20 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2019 15:14:40 +0800
Message-ID: <20190619071440.8435-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 618D94CDD985.AAFEA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] lttng-ust:upgrade 2.10.3 -> 2.10.4
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
X-List-Received-Date: Wed, 19 Jun 2019 07:13:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from lttng-ust_2.10.3.bb to lttng-ust_2.10.4.bb.

-lttng-ust/0001-compat-work-around-broken-_SC_NPROCESSORS_CONF-on-MU.patch
 Removed since this is included in 2.10.4

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...nd-broken-_SC_NPROCESSORS_CONF-on-MU.patch | 109 ------------------
 ...ttng-ust_2.10.3.bb => lttng-ust_2.10.4.bb} |   5 +-
 2 files changed, 2 insertions(+), 112 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-compat-work-around-broken-_SC_NPROCESSORS_CONF-on-MU.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.10.3.bb => lttng-ust_2.10.4.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-compat-work-around-broken-_SC_NPROCESSORS_CONF-on-MU.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-compat-work-around-broken-_SC_NPROCESSORS_CONF-on-MU.patch
deleted file mode 100644
index 5c4bd36726..0000000000
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-compat-work-around-broken-_SC_NPROCESSORS_CONF-on-MU.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 5de7c318804a7b1edce8562d4891b4c74aac0677 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 20 Mar 2019 11:07:35 -0400
-Subject: [PATCH] compat: work around broken _SC_NPROCESSORS_CONF on MUSL libc
-
-On MUSL libc the _SC_NPROCESSORS_CONF sysconf will report the number of
-CPUs allocated to the task based on the affinity mask instead of the
-total number of CPUs configured on the system.
-
-Upstream-Status: Accepted [1] [5de7c318804a7b1edce8562d4891b4c74aac0677]
-[1] https://lists.lttng.org/pipermail/lttng-dev/2019-March/028616.html
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- libringbuffer/smp.c | 66 +++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 66 insertions(+)
-
-diff --git a/libringbuffer/smp.c b/libringbuffer/smp.c
-index 9e7114be..656a75da 100644
---- a/libringbuffer/smp.c
-+++ b/libringbuffer/smp.c
-@@ -2,6 +2,7 @@
-  * libringbuffer/smp.c
-  *
-  * Copyright (C) 2011-2012 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-+ * Copyright (C) 2019 Michael Jeanson <mjeanson@efficios.com>
-  *
-  * This library is free software; you can redistribute it and/or
-  * modify it under the terms of the GNU Lesser General Public
-@@ -26,6 +27,7 @@
- 
- int __num_possible_cpus;
- 
-+#if (defined(__GLIBC__) || defined( __UCLIBC__))
- void _get_num_possible_cpus(void)
- {
- 	int result;
-@@ -43,3 +45,67 @@ void _get_num_possible_cpus(void)
- 		return;
- 	__num_possible_cpus = result;
- }
-+
-+#else
-+
-+/*
-+ * The MUSL libc implementation of the _SC_NPROCESSORS_CONF sysconf does not
-+ * return the number of configured CPUs in the system but relies on the cpu
-+ * affinity mask of the current task.
-+ *
-+ * So instead we use a strategy similar to GLIBC's, counting the cpu
-+ * directories in "/sys/devices/system/cpu" and fallback on the value from
-+ * sysconf if it fails.
-+ */
-+
-+#include <dirent.h>
-+#include <limits.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <sys/types.h>
-+
-+#define __max(a,b) ((a)>(b)?(a):(b))
-+
-+void _get_num_possible_cpus(void)
-+{
-+	int result, count = 0;
-+	DIR *cpudir;
-+	struct dirent *entry;
-+
-+	cpudir = opendir("/sys/devices/system/cpu");
-+	if (cpudir == NULL)
-+		goto end;
-+
-+	/*
-+	 * Count the number of directories named "cpu" followed by and
-+	 * integer. This is the same strategy as glibc uses.
-+	 */
-+	while ((entry = readdir(cpudir))) {
-+		if (entry->d_type == DT_DIR &&
-+			strncmp(entry->d_name, "cpu", 3) == 0) {
-+
-+			char *endptr;
-+			unsigned long cpu_num;
-+
-+			cpu_num = strtoul(entry->d_name + 3, &endptr, 10);
-+			if ((cpu_num < ULONG_MAX) && (endptr != entry->d_name + 3)
-+					&& (*endptr == '\0')) {
-+				count++;
-+			}
-+		}
-+	}
-+
-+end:
-+	/*
-+	 * Get the sysconf value as a fallback. Keep the highest number.
-+	 */
-+	result = __max(sysconf(_SC_NPROCESSORS_CONF), count);
-+
-+	/*
-+	 * If both methods failed, don't store the value.
-+	 */
-+	if (result < 1)
-+		return;
-+	__num_possible_cpus = result;
-+}
-+#endif
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.4.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.10.4.bb
index d546104129..a8eebb223b 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.4.bb
@@ -27,11 +27,10 @@ PE = "2"
 
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://lttng-ust-doc-examples-disable.patch \
-	   file://0001-compat-work-around-broken-_SC_NPROCESSORS_CONF-on-MU.patch \
           "
 
-SRC_URI[md5sum] = "ffcfa8c1ba9a52f002d240e936e9afa2"
-SRC_URI[sha256sum] = "9e8420f90d5f963f7aa32bc6d44adc1e491136f687c69ffb7a3075d33b40852b"
+SRC_URI[md5sum] = "19916ff0dec23c90f985586a8cbd1fd2"
+SRC_URI[sha256sum] = "75d5b4bb205c444a343e1297e14cd3a2503fc645a26710531cbd319c72c1a967"
 
 CVE_PRODUCT = "ust"
 
-- 
2.20.1




