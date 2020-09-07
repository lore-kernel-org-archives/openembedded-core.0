Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.1771.1599498158051626058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KtgmL5mM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id j34so2885044pgi.7
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=S6vb2p94dE+mcDC1B57Wx3vVP2IKkEmKAclThg5ujdQ=;
        b=KtgmL5mME576GYeDxiPUYrCfJx5OAdd6STTrg82wrrCz0GOf+bnSRJj0I9+H29EBYk
         xtZyZQoqkfIPAN7NICO1e9pJZS4OCem4BjSGE1T8U08HAImsKrRRz6olCOkyzNzCnI0g
         iNUoTROp7kFmRkiKUAjHu3HAKrFwsbfOf3ey0vcoL3B/HTeVBTfG4jSMeoLIYI0T+bJ/
         s4mUvD3M2ltd+IZGSKnEWdNFu7nO/EGdu4QgqqEWOJ21iOPTpVzancU/wQ53kfaiYYnb
         1DO0udcFqmKA4R9cjePhU6+cBpSDSz2jpywb8bqdMvM1ZIleyYAwphW0IQw0/IyGOk2T
         Jykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=S6vb2p94dE+mcDC1B57Wx3vVP2IKkEmKAclThg5ujdQ=;
        b=tn0PHbuReY+uQHCMmJgr2n9hCZYsNhMiFQNDspj0pubBdRAw3/xbw9tsWw48ArZqsj
         hejvCYVCSqBtek74uJfR+ozwFNzj9FMs51TXTbRCGrHU2gPIduPeGQ7bEaMBB4UMcj8b
         g16uvhnAoIkJWt/1JmDwO8hX+UpDaW0S4jjWJnrMoCPP9JO64/XKGqBrEPCsK4EB1rzf
         iRrg2BbAbf88DFYo/wk1dN9Hzj6BEb+bTvO+4dO7Jl7wSTWFhAsSH2VuePsMgQ/8TIf9
         7PBjC0wCbXH6khoEomZRqQux0Xqk+hly1fsCBqEOtjTj1WZQHXi9xKXrLtrlky+SK5tZ
         U2RQ==
X-Gm-Message-State: AOAM5308DfS6MZ1E1escyUCFVUfUTzvNwQqZS6UbqLhyZBVD0G5BnIj9
	ar65p9+gvPBm/ElGTYj3AxhFAlOPAor6mMay
X-Google-Smtp-Source: ABdhPJyAoSmPMLLlJl/1YAeG4igzIJhD5u7IhFiA1XQsML20hdFiK52jRVDljkaCDkKRu/SfRrznKw==
X-Received: by 2002:a62:1809:: with SMTP id 9mr21598878pfy.217.1599498156931;
        Mon, 07 Sep 2020 10:02:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/18] json-c: Fix CVE-2020-12762
Date: Mon,  7 Sep 2020 07:02:03 -1000
Message-Id: <d26c5882ee5dbdb41d5c8903b0e470f2291512a5.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../json-c/json-c/CVE-2020-12762.patch        | 231 ++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.13.1.bb |   1 +
 2 files changed, 232 insertions(+)
 create mode 100644 meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch

diff --git a/meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch b/meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch
new file mode 100644
index 0000000000..50674f0c5c
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch
@@ -0,0 +1,231 @@
+From 865b5a65199973bb63dff8e47a2f57e04fec9736 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
+Date: Thu, 14 May 2020 12:32:30 +0200
+Subject: [PATCH] Fix CVE-2020-12762.
+
+This commit is a squashed backport of the following commits
+on the master branch:
+
+  * 099016b7e8d70a6d5dd814e788bba08d33d48426
+  * 77d935b7ae7871a1940cd827e850e6063044ec45
+  * d07b91014986900a3a75f306d302e13e005e9d67
+  * 519dfe1591d85432986f9762d41d1a883198c157
+  * a59d5acfab4485d5133114df61785b1fc633e0c6
+---
+CVE: CVE-2020-12762
+Upstream-Status: Backport [https://github.com/json-c/json-c/commit/865b5a65199973bb63dff8e47a2f57e04fec9736]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ arraylist.c          |  3 +++
+ linkhash.c           | 21 ++++++++++++++-------
+ printbuf.c           | 38 ++++++++++++++++++++++++++------------
+ tests/test4.c        | 30 +++++++++++++++++++++++++++++-
+ tests/test4.expected |  1 +
+ 5 files changed, 73 insertions(+), 20 deletions(-)
+
+diff --git a/arraylist.c b/arraylist.c
+index ddeb8d4eb4..e737052e32 100644
+--- a/arraylist.c
++++ b/arraylist.c
+@@ -135,6 +135,9 @@ array_list_del_idx( struct array_list *arr, size_t idx, size_t count )
+ {
+ 	size_t i, stop;
+ 
++	/* Avoid overflow in calculation with large indices. */
++	if (idx > SIZE_T_MAX - count)
++		return -1;
+ 	stop = idx + count;
+ 	if ( idx >= arr->length || stop > arr->length ) return -1;
+ 	for ( i = idx; i < stop; ++i ) {
+diff --git a/linkhash.c b/linkhash.c
+index 5497061a8a..6435a154ac 100644
+--- a/linkhash.c
++++ b/linkhash.c
+@@ -12,12 +12,13 @@
+ 
+ #include "config.h"
+ 
+-#include <stdio.h>
+-#include <string.h>
+-#include <stdlib.h>
++#include <assert.h>
++#include <limits.h>
+ #include <stdarg.h>
+ #include <stddef.h>
+-#include <limits.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
+ 
+ #ifdef HAVE_ENDIAN_H
+ # include <endian.h>    /* attempt to define endianness */
+@@ -28,8 +29,8 @@
+ # include <windows.h>   /* Get InterlockedCompareExchange */
+ #endif
+ 
+-#include "random_seed.h"
+ #include "linkhash.h"
++#include "random_seed.h"
+ 
+ /* hash functions */
+ static unsigned long lh_char_hash(const void *k);
+@@ -498,7 +499,9 @@ struct lh_table* lh_table_new(int size,
+ 	int i;
+ 	struct lh_table *t;
+ 
+-	t = (struct lh_table*)calloc(1, sizeof(struct lh_table));
++	/* Allocate space for elements to avoid divisions by zero. */
++	assert(size > 0);
++	t = (struct lh_table *)calloc(1, sizeof(struct lh_table));
+ 	if (!t)
+ 		return NULL;
+ 
+@@ -577,8 +580,12 @@ int lh_table_insert_w_hash(struct lh_table *t, const void *k, const void *v, con
+ 	unsigned long n;
+ 
+ 	if (t->count >= t->size * LH_LOAD_FACTOR)
+-		if (lh_table_resize(t, t->size * 2) != 0)
++	{
++		/* Avoid signed integer overflow with large tables. */
++		int new_size = (t->size > INT_MAX / 2) ? INT_MAX : (t->size * 2);
++		if (t->size == INT_MAX || lh_table_resize(t, new_size) != 0)
+ 			return -1;
++	}
+ 
+ 	n = h % t->size;
+ 
+diff --git a/printbuf.c b/printbuf.c
+index 6c77b5defd..6fc56de455 100644
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
+@@ -64,10 +65,16 @@ static int printbuf_extend(struct printbuf *p, int min_size)
+ 
+ 	if (p->size >= min_size)
+ 		return 0;
+-
+-	new_size = p->size * 2;
+-	if (new_size < min_size + 8)
+-		new_size =  min_size + 8;
++	/* Prevent signed integer overflows with large buffers. */
++	if (min_size > INT_MAX - 8)
++		return -1;
++	if (p->size > INT_MAX / 2)
++		new_size = min_size + 8;
++	else {
++		new_size = p->size * 2;
++		if (new_size < min_size + 8)
++			new_size = min_size + 8;
++	}
+ #ifdef PRINTBUF_DEBUG
+ 	MC_DEBUG("printbuf_memappend: realloc "
+ 	  "bpos=%d min_size=%d old_size=%d new_size=%d\n",
+@@ -82,14 +89,18 @@ static int printbuf_extend(struct printbuf *p, int min_size)
+ 
+ int printbuf_memappend(struct printbuf *p, const char *buf, int size)
+ {
+-  if (p->size <= p->bpos + size + 1) {
+-    if (printbuf_extend(p, p->bpos + size + 1) < 0)
+-      return -1;
+-  }
+-  memcpy(p->buf + p->bpos, buf, size);
+-  p->bpos += size;
+-  p->buf[p->bpos]= '\0';
+-  return size;
++	/* Prevent signed integer overflows with large buffers. */
++	if (size > INT_MAX - p->bpos - 1)
++		return -1;
++	if (p->size <= p->bpos + size + 1)
++	{
++		if (printbuf_extend(p, p->bpos + size + 1) < 0)
++			return -1;
++	}
++	memcpy(p->buf + p->bpos, buf, size);
++	p->bpos += size;
++	p->buf[p->bpos] = '\0';
++	return size;
+ }
+ 
+ int printbuf_memset(struct printbuf *pb, int offset, int charvalue, int len)
+@@ -98,6 +109,9 @@ int printbuf_memset(struct printbuf *pb, int offset, int charvalue, int len)
+ 
+ 	if (offset == -1)
+ 		offset = pb->bpos;
++	/* Prevent signed integer overflows with large buffers. */
++	if (len > INT_MAX - offset)
++		return -1;
+ 	size_needed = offset + len;
+ 	if (pb->size < size_needed)
+ 	{
+diff --git a/tests/test4.c b/tests/test4.c
+index fc8b79dbf4..82d3f494de 100644
+--- a/tests/test4.c
++++ b/tests/test4.c
+@@ -2,9 +2,11 @@
+  * gcc -o utf8 utf8.c -I/home/y/include -L./.libs -ljson
+  */
+ 
++#include "config.h"
++#include <assert.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <string.h>
+-#include "config.h"
+ 
+ #include "json_inttypes.h"
+ #include "json_object.h"
+@@ -24,6 +26,29 @@ void print_hex(const char* s)
+ 	putchar('\n');
+ }
+ 
++static void test_lot_of_adds(void);
++static void test_lot_of_adds()
++{
++	int ii;
++	char key[50];
++	json_object *jobj = json_object_new_object();
++	assert(jobj != NULL);
++	for (ii = 0; ii < 500; ii++)
++	{
++		snprintf(key, sizeof(key), "k%d", ii);
++		json_object *iobj = json_object_new_int(ii);
++		assert(iobj != NULL);
++		if (json_object_object_add(jobj, key, iobj))
++		{
++			fprintf(stderr, "FAILED to add object #%d\n", ii);
++			abort();
++		}
++	}
++	printf("%s\n", json_object_to_json_string(jobj));
++	assert(json_object_object_length(jobj) == 500);
++	json_object_put(jobj);
++}
++
+ int main(void)
+ {
+ 	const char *input = "\"\\ud840\\udd26,\\ud840\\udd27,\\ud800\\udd26,\\ud800\\udd27\"";
+@@ -49,5 +74,8 @@ int main(void)
+ 		retval = 1;
+ 	}
+ 	json_object_put(parse_result);
++
++	test_lot_of_adds();
++
+ 	return retval;
+ }
+diff --git a/tests/test4.expected b/tests/test4.expected
+index 68d4336d90..cb2744012b 100644
+--- a/tests/test4.expected
++++ b/tests/test4.expected
+@@ -1,3 +1,4 @@
+ input: "\ud840\udd26,\ud840\udd27,\ud800\udd26,\ud800\udd27"
+ JSON parse result is correct: 𠄦,𠄧,𐄦,𐄧
+ PASS
++{ "k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4, "k5": 5, "k6": 6, "k7": 7, "k8": 8, "k9": 9, "k10": 10, "k11": 11, "k12": 12, "k13": 13, "k14": 14, "k15": 15, "k16": 16, "k17": 17, "k18": 18, "k19": 19, "k20": 20, "k21": 21, "k22": 22, "k23": 23, "k24": 24, "k25": 25, "k26": 26, "k27": 27, "k28": 28, "k29": 29, "k30": 30, "k31": 31, "k32": 32, "k33": 33, "k34": 34, "k35": 35, "k36": 36, "k37": 37, "k38": 38, "k39": 39, "k40": 40, "k41": 41, "k42": 42, "k43": 43, "k44": 44, "k45": 45, <snip> }
diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 522879f21f..c7c755bb16 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
            file://add-disable-werror-option-to-configure.patch \
+           file://CVE-2020-12762.patch \
            "
 SRC_URI[md5sum] = "04969ad59cc37bddd83741a08b98f350"
 SRC_URI[sha256sum] = "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
-- 
2.17.1

