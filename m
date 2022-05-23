Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D053EC4332F
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 02:20:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.23310.1653272438143063161
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 19:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=lQA+kam2;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.20, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653272438; x=1684808438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CoRxwj2iA/JYbb+R18NkPPJ8E5WO3lEId/gjnFL9fTc=;
  b=lQA+kam2YWrVW1sfizSzpM/saZil43CaGfqgmvDPaztZ9a2WjTqaNt9y
   ya74D4XiSL4us+snJ+aAlIax7Ns1nXXaQgTkR40X010Mz2y+sLeT+hEou
   jUJGzxft5EhcTBI4K7HE3CCtkIczhEE26czEhtEg7ATjX1UWgTtIKzIRH
   jy71ETxScdhU3G7YvMhR5bsWi8bjPWndDjKT+mY3xSpOJrexCFdHdHnlX
   Ntg3lPu8ZEryFclp3KjzehS/2TV/Lo7Gi07FFHMHQflpjEPeflN/qt5Wh
   Qsz+7AfZbCF7qJuHYu9cxgacaOxzC0CaslzQMRj0UUOdk+YQ9VCJlMw+P
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="260680228"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600";
   d="scan'208";a="260680228"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 19:20:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600";
   d="scan'208";a="600397364"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 19:20:35 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [oe-core] [PATCH v2 3/4] systemd: Drop
 0002-don-t-use-glibc-specific-qsort_r.patch
Date: Mon, 23 May 2022 10:20:13 +0800
Message-Id: <20220523022014.1203675-4-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523022014.1203675-1-jiaqing.zhao@linux.intel.com>
References: <20220523022014.1203675-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 02:20:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165991

musl 1.2.3 implements qsort_r function.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 ...002-don-t-use-glibc-specific-qsort_r.patch | 163 ------------------
 meta/recipes-core/systemd/systemd_250.5.bb    |   1 -
 2 files changed, 164 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch

diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
deleted file mode 100644
index d109860e1a..0000000000
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From c542d2d93cf536e91d4edb8791fdc0de732b0a52 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 13:41:41 +0800
-Subject: [PATCH] don't use glibc-specific qsort_r
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Rebased for v241]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[Rebased for v242]
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-[Rebased for v247]
-Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
-
----
- src/basic/sort-util.h     | 14 --------------
- src/shared/format-table.c | 36 ++++++++++++++++++++++++------------
- src/shared/hwdb-util.c    | 19 ++++++++++++++-----
- 3 files changed, 38 insertions(+), 31 deletions(-)
-
-diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index 02a6784d99..cb448df109 100644
---- a/src/basic/sort-util.h
-+++ b/src/basic/sort-util.h
-@@ -61,18 +61,4 @@ static inline void _qsort_safe(void *base, size_t nmemb, size_t size, comparison
-                 _qsort_safe((p), (n), sizeof((p)[0]), (comparison_fn_t) _func_); \
-         })
- 
--static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, comparison_userdata_fn_t compar, void *userdata) {
--        if (nmemb <= 1)
--                return;
--
--        assert(base);
--        qsort_r(base, nmemb, size, compar, userdata);
--}
--
--#define typesafe_qsort_r(p, n, func, userdata)                          \
--        ({                                                              \
--                int (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) = func; \
--                qsort_r_safe((p), (n), sizeof((p)[0]), (comparison_userdata_fn_t) _func_, userdata); \
--        })
--
- int cmp_int(const int *a, const int *b);
-diff --git a/src/shared/format-table.c b/src/shared/format-table.c
-index b95680b365..5ffa208615 100644
---- a/src/shared/format-table.c
-+++ b/src/shared/format-table.c
-@@ -1324,30 +1324,32 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
-         return CMP(index_a, index_b);
- }
- 
--static int table_data_compare(const size_t *a, const size_t *b, Table *t) {
-+static Table *user_table;
-+static int table_data_compare(const void *x, const void *y) {
-+        const size_t *a = x, *b=y;
-         int r;
- 
--        assert(t);
--        assert(t->sort_map);
-+        assert(user_table);
-+        assert(user_table->sort_map);
- 
-         /* Make sure the header stays at the beginning */
--        if (*a < t->n_columns && *b < t->n_columns)
-+        if (*a < user_table->n_columns && *b < user_table->n_columns)
-                 return 0;
--        if (*a < t->n_columns)
-+        if (*a < user_table->n_columns)
-                 return -1;
--        if (*b < t->n_columns)
-+        if (*b < user_table->n_columns)
-                 return 1;
- 
-         /* Order other lines by the sorting map */
--        for (size_t i = 0; i < t->n_sort_map; i++) {
-+        for (size_t i = 0; i < user_table->n_sort_map; i++) {
-                 TableData *d, *dd;
- 
--                d = t->data[*a + t->sort_map[i]];
--                dd = t->data[*b + t->sort_map[i]];
-+                d = user_table->data[*a + user_table->sort_map[i]];
-+                dd = user_table->data[*b + user_table->sort_map[i]];
- 
-                 r = cell_data_compare(d, *a, dd, *b);
-                 if (r != 0)
--                        return t->reverse_map && t->reverse_map[t->sort_map[i]] ? -r : r;
-+                        return user_table->reverse_map && user_table->reverse_map[user_table->sort_map[i]] ? -r : r;
-         }
- 
-         /* Order identical lines by the order there were originally added in */
-@@ -2009,7 +2011,12 @@ int table_print(Table *t, FILE *f) {
-                 for (size_t i = 0; i < n_rows; i++)
-                         sorted[i] = i * t->n_columns;
- 
--                typesafe_qsort_r(sorted, n_rows, table_data_compare, t);
-+                if (n_rows <= 1)
-+                        return 0;
-+                assert(sorted);
-+                user_table = t;
-+                qsort(sorted, n_rows, sizeof(size_t), table_data_compare);
-+                user_table = NULL;
-         }
- 
-         if (t->display_map)
-@@ -2647,7 +2654,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
-                 for (size_t i = 0; i < n_rows; i++)
-                         sorted[i] = i * t->n_columns;
- 
--                typesafe_qsort_r(sorted, n_rows, table_data_compare, t);
-+                if (n_rows <= 1)
-+                        return 0;
-+                assert(sorted);
-+                user_table = t;
-+                qsort(sorted, n_rows, sizeof(size_t), table_data_compare);
-+                user_table = NULL;
-         }
- 
-         if (t->display_map)
-diff --git a/src/shared/hwdb-util.c b/src/shared/hwdb-util.c
-index fe4785f3e5..827e1639c3 100644
---- a/src/shared/hwdb-util.c
-+++ b/src/shared/hwdb-util.c
-@@ -127,9 +127,13 @@ static struct trie* trie_free(struct trie *trie) {
- 
- DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
- 
--static int trie_values_cmp(const struct trie_value_entry *a, const struct trie_value_entry *b, struct trie *trie) {
--        return strcmp(trie->strings->buf + a->key_off,
--                      trie->strings->buf + b->key_off);
-+static struct trie *trie_node_add_value_trie;
-+static int trie_values_cmp(const void *v1, const void *v2) {
-+        const struct trie_value_entry *a = v1;
-+        const struct trie_value_entry *b = v2;
-+
-+        return strcmp(trie_node_add_value_trie->strings->buf + a->key_off,
-+                      trie_node_add_value_trie->strings->buf + b->key_off);
- }
- 
- static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-@@ -157,7 +161,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-                         .value_off = v,
-                 };
- 
--                val = typesafe_bsearch_r(&search, node->values, node->values_count, trie_values_cmp, trie);
-+                trie_node_add_value_trie = trie;
-+                val = bsearch(&search, node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
-+                trie_node_add_value_trie = NULL;
-+
-                 if (val) {
-                         /* At this point we have 2 identical properties on the same match-string.
-                          * Since we process files in order, we just replace the previous value. */
-@@ -183,7 +190,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-                 .line_number = line_number,
-         };
-         node->values_count++;
--        typesafe_qsort_r(node->values, node->values_count, trie_values_cmp, trie);
-+        trie_node_add_value_trie = trie;
-+        qsort(node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
-+        trie_node_add_value_trie = NULL;
-         return 0;
- }
- 
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 6d6b3f2ded..81fe0c88e0 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -30,7 +30,6 @@ SRC_URI += "file://touchscreen.rules \
 # patches needed by musl
 SRC_URI:append:libc-musl = " ${SRC_URI_MUSL}"
 SRC_URI_MUSL = "\
-               file://0002-don-t-use-glibc-specific-qsort_r.patch \
                file://0003-missing_type.h-add-comparison_fn_t.patch \
                file://0004-add-fallback-parse_printf_format-implementation.patch \
                file://0005-src-basic-missing.h-check-for-missing-strndupa.patch \
-- 
2.34.1


