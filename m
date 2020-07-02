Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.2468.1593679910997554599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 01:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: YJX4JHH+0p3KlzHCBlKbzvGWGycwY/YHRhBOiHiv/Ch4DxrJTxLC1UtIrAHYOVvKCIhGZ4O12B
 ZOKmY56SebbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="208351083"
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; 
   d="scan'208";a="208351083"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2020 01:51:45 -0700
IronPort-SDR: Up3dblnu4FpgnVofvr23nuNSzIOF8GJFNMGv7fXiFwdClQ9N2upVJqjoA4k3QjfpM4KNIVeVOp
 CFc9pG6A7Ecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; 
   d="scan'208";a="356391930"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga001.jf.intel.com with ESMTP; 02 Jul 2020 01:51:44 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] json-c: fix CVE-2020-12762
Date: Thu,  2 Jul 2020 16:51:43 +0800
Message-Id: <1593679904-49603-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../json-c/json-c/CVE-2020-12762.patch             | 160 +++++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.14.bb        |   5 +-
 2 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch

diff --git a/meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch b/meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch
new file mode 100644
index 0000000..a45cfb6
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch
@@ -0,0 +1,160 @@
+From 099016b7e8d70a6d5dd814e788bba08d33d48426 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Mon, 4 May 2020 19:41:16 +0200
+Subject: [PATCH 1/3] Protect array_list_del_idx against size_t overflow.
+
+If the assignment of stop overflows due to idx and count being
+larger than SIZE_T_MAX in sum, out of boundary access could happen.
+
+It takes invalid usage of this function for this to happen, but
+I decided to add this check so array_list_del_idx is as safe against
+bad usage as the other arraylist functions.
+
+Upstream-Status: Backport [https://github.com/json-c/json-c/commit/31243e4d1204ef78be34b0fcae73221eee6b83be]
+CVE: CVE-2020-12762
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ arraylist.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/arraylist.c b/arraylist.c
+index 12ad8af6d3..e5524aca75 100644
+--- a/arraylist.c
++++ b/arraylist.c
+@@ -136,6 +136,9 @@ int array_list_del_idx(struct array_list *arr, size_t idx, size_t count)
+ {
+ 	size_t i, stop;
+ 
++	/* Avoid overflow in calculation with large indices. */
++	if (idx > SIZE_T_MAX - count)
++		return -1;
+ 	stop = idx + count;
+ 	if (idx >= arr->length || stop > arr->length)
+ 		return -1;
+
+From 77d935b7ae7871a1940cd827e850e6063044ec45 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Mon, 4 May 2020 19:46:45 +0200
+Subject: [PATCH 2/3] Prevent division by zero in linkhash.
+
+If a linkhash with a size of zero is created, then modulo operations
+are prone to division by zero operations.
+
+Purely protective measure against bad usage.
+---
+ linkhash.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/linkhash.c b/linkhash.c
+index 7ea58c0abf..f05cc38030 100644
+--- a/linkhash.c
++++ b/linkhash.c
+@@ -12,6 +12,7 @@
+ 
+ #include "config.h"
+ 
++#include <assert.h>
+ #include <limits.h>
+ #include <stdarg.h>
+ #include <stddef.h>
+@@ -499,6 +500,8 @@ struct lh_table *lh_table_new(int size, lh_entry_free_fn *free_fn, lh_hash_fn *h
+ 	int i;
+ 	struct lh_table *t;
+ 
++	/* Allocate space for elements to avoid divisions by zero. */
++	assert(size > 0);
+ 	t = (struct lh_table *)calloc(1, sizeof(struct lh_table));
+ 	if (!t)
+ 		return NULL;
+
+From d07b91014986900a3a75f306d302e13e005e9d67 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Mon, 4 May 2020 19:47:25 +0200
+Subject: [PATCH 3/3] Fix integer overflows.
+
+The data structures linkhash and printbuf are limited to 2 GB in size
+due to a signed integer being used to track their current size.
+
+If too much data is added, then size variable can overflow, which is
+an undefined behaviour in C programming language.
+
+Assuming that a signed int overflow just leads to a negative value,
+like it happens on many sytems (Linux i686/amd64 with gcc), then
+printbuf is vulnerable to an out of boundary write on 64 bit systems.
+---
+ linkhash.c |  7 +++++--
+ printbuf.c | 19 ++++++++++++++++---
+ 2 files changed, 21 insertions(+), 5 deletions(-)
+
+diff --git a/linkhash.c b/linkhash.c
+index f05cc38030..51e90b13a2 100644
+--- a/linkhash.c
++++ b/linkhash.c
+@@ -580,9 +580,12 @@ int lh_table_insert_w_hash(struct lh_table *t, const void *k, const void *v, con
+ {
+ 	unsigned long n;
+ 
+-	if (t->count >= t->size * LH_LOAD_FACTOR)
+-		if (lh_table_resize(t, t->size * 2) != 0)
++	if (t->count >= t->size * LH_LOAD_FACTOR) {
++		/* Avoid signed integer overflow with large tables. */
++		int new_size = INT_MAX / 2 < t->size ? t->size * 2 : INT_MAX;
++		if (t->size == INT_MAX || lh_table_resize(t, new_size) != 0)
+ 			return -1;
++	}
+ 
+ 	n = h % t->size;
+ 
+diff --git a/printbuf.c b/printbuf.c
+index 976c12dde5..00822fac4f 100644
+--- a/printbuf.c
++++ b/printbuf.c
+@@ -15,6 +15,7 @@
+ 
+ #include "config.h"
+ 
++#include <limits.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -65,10 +66,16 @@ static int printbuf_extend(struct printbuf *p, int min_size)
+ 
+ 	if (p->size >= min_size)
+ 		return 0;
+-
+-	new_size = p->size * 2;
+-	if (new_size < min_size + 8)
++	/* Prevent signed integer overflows with large buffers. */
++	if (min_size > INT_MAX - 8)
++		return -1;
++	if (p->size > INT_MAX / 2)
+ 		new_size = min_size + 8;
++	else {
++		new_size = p->size * 2;
++		if (new_size < min_size + 8)
++			new_size = min_size + 8;
++	}
+ #ifdef PRINTBUF_DEBUG
+ 	MC_DEBUG("printbuf_memappend: realloc "
+ 	         "bpos=%d min_size=%d old_size=%d new_size=%d\n",
+@@ -83,6 +90,9 @@ static int printbuf_extend(struct printbuf *p, int min_size)
+ 
+ int printbuf_memappend(struct printbuf *p, const char *buf, int size)
+ {
++	/* Prevent signed integer overflows with large buffers. */
++	if (size > INT_MAX - p->bpos - 1)
++		return -1;
+ 	if (p->size <= p->bpos + size + 1)
+ 	{
+ 		if (printbuf_extend(p, p->bpos + size + 1) < 0)
+@@ -100,6 +110,9 @@ int printbuf_memset(struct printbuf *pb, int offset, int charvalue, int len)
+ 
+ 	if (offset == -1)
+ 		offset = pb->bpos;
++	/* Prevent signed integer overflows with large buffers. */
++	if (len > INT_MAX - offset)
++		return -1;
+ 	size_needed = offset + len;
+ 	if (pb->size < size_needed)
+ 	{
diff --git a/meta/recipes-devtools/json-c/json-c_0.14.bb b/meta/recipes-devtools/json-c/json-c_0.14.bb
index 99fde87..1d501d1 100644
--- a/meta/recipes-devtools/json-c/json-c_0.14.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.14.bb
@@ -4,7 +4,10 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
-SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+           file://CVE-2020-12762.patch \
+"
+
 SRC_URI[sha256sum] = "b377de08c9b23ca3b37d9a9828107dff1de5ce208ff4ebb35005a794f30c6870"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
-- 
2.7.4

