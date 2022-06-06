Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDCBCCA481
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:39:15 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.32825.1654526348076625761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CxMAE09i;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id f65so2864131pgc.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=thSoOnSZhfC02GllMr107rI4G5cT2o/mkGL6dGRsCVs=;
        b=CxMAE09iZr3JXSpDNFukU+C0vzRImh7d097m9Y5o5LZ9Idl15//s9DTz7x3PHO1gT8
         hWOoHXzGrTEWcJrD/3dQQvK7GmmARDlkqLMZH74tzKxNAlpdwhLGVRAxTh4fwpYtI4v5
         +6RJKlsHpK4C82I9SjvKDlmTIk8yazqqB2mSGjC8fanEFaSold1xznU7nOQk/ODweqE2
         5m3jD5Cu3xHoFPEY/7plYSRR4SaVUqYBVPQ6fAnksui3QUpml07LRNHfIz/bkT5IGNsM
         GmYj9CpPxIGILxsvbzqAUCvvPX+S2Vpnyemq9dfWbBgnYelz+ErYx7hkt73zjXyMuRln
         2pUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=thSoOnSZhfC02GllMr107rI4G5cT2o/mkGL6dGRsCVs=;
        b=CW3F3CRL1yspMsig+SQhuFecnO0GPRpIIhhL8KNLTbO/ZZH4rpAlMZYiPL75f9Geje
         7Bl+lGu+ridqnuADjobmT4UY1tcy6H8jyEssBblaN4V4naUUg3M0ziDNQ0P5X24EAN/o
         ivROVFpYybpJfBPUMgxZas9XvJ+Iq0487VLKRr4DXrJTCY9EJYGfBGms9owoK5hxPUtV
         QeY80uinS8zDEOeC27A+Scc0JFQfx5va8VShO+WISa5/i2KsEITJ+ba1xdbKZ7Ldh5oq
         MBPUmVLT6I8xh+YFLg06x/N0mwuKj0/Pt7+HQiCv8F+LoscD44HLnlWiFSWQOJhI+/Ao
         LlVg==
X-Gm-Message-State: AOAM531Xqd/aqDnXuZryHvVAtBvCLaWH9nTRFr8TmOraGnfrGvf5F8Yg
	jbhLiBWSPEgcBpWnloXKxwVuWm+OtCdrfqIz
X-Google-Smtp-Source: 
 ABdhPJzYnuM4oVx+fhzulo8IWUouZBNiJgLKR9iw509t5eClPIWWDSS+wLwlkHd92Js00I3tX0dG5g==
X-Received: by 2002:a63:8449:0:b0:3fc:85a5:5b69 with SMTP id
 k70-20020a638449000000b003fc85a55b69mr21157457pgd.261.1654526346814;
        Mon, 06 Jun 2022 07:39:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.39.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:39:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/13] systemd: Drop
 0002-don-t-use-glibc-specific-qsort_r.patch
Date: Mon,  6 Jun 2022 04:38:25 -1000
Message-Id: 
 <80980314ec2181e0716964b66867e8bb8a873214.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654526060.git.steve@sakoman.com>
References: <cover.1654526060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:39:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166640

From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>

musl 1.2.3 implements qsort_r function.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 0c2bbf66c7a00268457ac10fed4bef3714da8651)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


