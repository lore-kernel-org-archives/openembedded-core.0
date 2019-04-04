Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id D7F767D43B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 21:47:55 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 9A0151D3239;
	Thu,  4 Apr 2019 17:47:56 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id WUBqFYulIhyy; Thu,  4 Apr 2019 17:47:56 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 0AAA01D3235;
	Thu,  4 Apr 2019 17:47:56 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 0AAA01D3235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1554414476;
	bh=joUPE1e/0eOr8xoMRC8W+v3etTQWnupfvn/9sUJz4eE=;
	h=From:To:Date:Message-Id;
	b=SfvgWdQxZbeH3jqbhS4TPN/PPrNbPk4UvoklabJ9cMn8pOWNlBLT6KtDFyXDgm0+S
	wESq/U78uFF1Iaw5uoVsEnD5Xsl7jIcBD113BZTaS36Db6poOgamXVCvverQgpJvkG
	rglmRucKDkY5PO2sVUWFaV9cwulFp5HHSrpjZXD7IPXF4Ws6VTzUCU49eANgbXS/R7
	CMOi4Ejv8heJEJ5CUICz3q7Ivj/gKDqTdkPIUMFLQYj8cYTPt1UktT2ZsiNwzAsM6w
	vC6VYLDv7kKedVTn9PXfuKiOJaP5k3r7o3b4Ph9KJ5rT/BGP2VMzOTjW2k029mQ86y
	SD5tMSXSOAsMQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id rrTVQDni0lCy; Thu,  4 Apr 2019 17:47:55 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 523CB1D322D;
	Thu,  4 Apr 2019 17:47:55 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  4 Apr 2019 21:47:41 +0000
Message-Id: <20190404214743.9827-2-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190404214743.9827-1-jonathan.rajotte-julien@efficios.com>
References: <20190404214743.9827-1-jonathan.rajotte-julien@efficios.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] lttng-ust: backport musl workaround
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
X-List-Received-Date: Thu, 04 Apr 2019 21:47:56 -0000

musl implementation for _SC_NPROCESSORS_CONF is a bit fishy.

[1] https://www.openwall.com/lists/musl/2019/03/15/5

Anyway, we implemented a fallback.

This patch should be gone by next recipe update.

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 ...nd-broken-_SC_NPROCESSORS_CONF-on-MU.patch | 109 ++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb |   2 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-compat-work-around-broken-_SC_NPROCESSORS_CONF-on-MU.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-compat-work-around-broken-_SC_NPROCESSORS_CONF-on-MU.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-compat-work-around-broken-_SC_NPROCESSORS_CONF-on-MU.patch
new file mode 100644
index 0000000000..5c4bd36726
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-compat-work-around-broken-_SC_NPROCESSORS_CONF-on-MU.patch
@@ -0,0 +1,109 @@
+From 5de7c318804a7b1edce8562d4891b4c74aac0677 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Wed, 20 Mar 2019 11:07:35 -0400
+Subject: [PATCH] compat: work around broken _SC_NPROCESSORS_CONF on MUSL libc
+
+On MUSL libc the _SC_NPROCESSORS_CONF sysconf will report the number of
+CPUs allocated to the task based on the affinity mask instead of the
+total number of CPUs configured on the system.
+
+Upstream-Status: Accepted [1] [5de7c318804a7b1edce8562d4891b4c74aac0677]
+[1] https://lists.lttng.org/pipermail/lttng-dev/2019-March/028616.html
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ libringbuffer/smp.c | 66 +++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 66 insertions(+)
+
+diff --git a/libringbuffer/smp.c b/libringbuffer/smp.c
+index 9e7114be..656a75da 100644
+--- a/libringbuffer/smp.c
++++ b/libringbuffer/smp.c
+@@ -2,6 +2,7 @@
+  * libringbuffer/smp.c
+  *
+  * Copyright (C) 2011-2012 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
++ * Copyright (C) 2019 Michael Jeanson <mjeanson@efficios.com>
+  *
+  * This library is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+@@ -26,6 +27,7 @@
+ 
+ int __num_possible_cpus;
+ 
++#if (defined(__GLIBC__) || defined( __UCLIBC__))
+ void _get_num_possible_cpus(void)
+ {
+ 	int result;
+@@ -43,3 +45,67 @@ void _get_num_possible_cpus(void)
+ 		return;
+ 	__num_possible_cpus = result;
+ }
++
++#else
++
++/*
++ * The MUSL libc implementation of the _SC_NPROCESSORS_CONF sysconf does not
++ * return the number of configured CPUs in the system but relies on the cpu
++ * affinity mask of the current task.
++ *
++ * So instead we use a strategy similar to GLIBC's, counting the cpu
++ * directories in "/sys/devices/system/cpu" and fallback on the value from
++ * sysconf if it fails.
++ */
++
++#include <dirent.h>
++#include <limits.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/types.h>
++
++#define __max(a,b) ((a)>(b)?(a):(b))
++
++void _get_num_possible_cpus(void)
++{
++	int result, count = 0;
++	DIR *cpudir;
++	struct dirent *entry;
++
++	cpudir = opendir("/sys/devices/system/cpu");
++	if (cpudir == NULL)
++		goto end;
++
++	/*
++	 * Count the number of directories named "cpu" followed by and
++	 * integer. This is the same strategy as glibc uses.
++	 */
++	while ((entry = readdir(cpudir))) {
++		if (entry->d_type == DT_DIR &&
++			strncmp(entry->d_name, "cpu", 3) == 0) {
++
++			char *endptr;
++			unsigned long cpu_num;
++
++			cpu_num = strtoul(entry->d_name + 3, &endptr, 10);
++			if ((cpu_num < ULONG_MAX) && (endptr != entry->d_name + 3)
++					&& (*endptr == '\0')) {
++				count++;
++			}
++		}
++	}
++
++end:
++	/*
++	 * Get the sysconf value as a fallback. Keep the highest number.
++	 */
++	result = __max(sysconf(_SC_NPROCESSORS_CONF), count);
++
++	/*
++	 * If both methods failed, don't store the value.
++	 */
++	if (result < 1)
++		return;
++	__num_possible_cpus = result;
++}
++#endif
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
index c0f408eeec..d546104129 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
@@ -27,7 +27,9 @@ PE = "2"
 
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://lttng-ust-doc-examples-disable.patch \
+	   file://0001-compat-work-around-broken-_SC_NPROCESSORS_CONF-on-MU.patch \
           "
+
 SRC_URI[md5sum] = "ffcfa8c1ba9a52f002d240e936e9afa2"
 SRC_URI[sha256sum] = "9e8420f90d5f963f7aa32bc6d44adc1e491136f687c69ffb7a3075d33b40852b"
 
-- 
2.17.1


