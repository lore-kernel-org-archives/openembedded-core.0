Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DD2A17E89F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 07:29:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45QC1M65Dhz4q
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 09:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560497400;
	bh=zZesbxrHjG80r3yAlezjZGDrSFi1397UC9D6qgt/sL0=;
	h=From:To:Subject:Date:From;
	b=gT4qlJmQ7h1+rWezgmFk9262EX19AaPwpryT1hSE9OnXEwtEyXtBDyLZA7MIf242K
	hN9FLR0QCxQFpE8bIdCNnG5bwW218SUyOOhAs/vk/jpLaHQAWh9IE3l4TFjp3Azutv
	PPj8PRju+yTXned2RQJK8CTaUanwweuOEVPat1C1q4eRxaArAflsRSrXn5DaUHCs2N
	p2LoKei0Y5DX/VN0Ws1g5zsSjdS1HaP7rLqGTTf/2pAlPbHAMnw2Fyhk3tcdPUiXp4
	PqU/IiBTVFRzYkHAkGW5anFsmLk9mg9VyKGfVycE+XMCCX7okotHNCrGS6lmjUWti2
	krr/Gc41Qa8XoOH4CQ9+GNsujlr9dR3Y1jg8K8cNMt1prLSrdAXUIAi8508t+TznDZ
	fD/TyDS8fDoLlk4xt518SBsrIpkot/DnRB+ygcSTI1F9EL20mY9ZbFMPBolxJri+hM
	zuFwykMU2cyYV/cK17o8XZMV95Y9ZIjO1/eSHbH3coh0jsIGUiJWNd3BNjCyWJQkHw
	X8vIfcRm6GPRbEHr3Xz/NWcWhpwrveZd9ceoGNCUQu95YKYtMY/MpJczN7HjMNVoBe
	Akz0k9NeQolt7ZCN6A/dmqs4eU75u5x+aLZdFLB9FWdxegJc5JdVvG+mpPFoQlJg+Q
	BYPnYYVBfglz05UJ22jthuCE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2019 10:29:56 +0300
Message-Id: <20190614072956.13672-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [RFC][PATCH] systemd: Remove clearly incorrect musl patches
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
X-List-Received-Date: Fri, 14 Jun 2019 07:30:00 -0000

This removes clearly incorrect musl patches and marks
systemd as incompatible with musl until these issues
are fixed.

The previous status quo where systemd was made compiling
with patches that are known to introduce bugs and security
vulnerabilities silently delivered a sub-standard package
to users, this change makes it clear where work is needed
to be done by people interested in systemd on musl.

Patches that are merely questionable or not upstreamable
are not touched.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...en-secure-versions-are-not-available.patch |  32 ----
 ...002-don-t-use-glibc-specific-qsort_r.patch | 163 ------------------
 ...LOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch | 155 -----------------
 ...008-add-missing-FTW_-macros-for-musl.patch |  47 -----
 meta/recipes-core/systemd/systemd_242.bb      |   8 +-
 5 files changed, 4 insertions(+), 401 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
deleted file mode 100644
index 37979755d0..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b8055a61b5df6b43b8d3117936587b874b0a339b Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 11:01:18 +0800
-Subject: [PATCH 01/24] Use getenv when secure versions are not available
-
-musl doesnt implement secure version, so we default
-to it if configure does not detect a secure implementation
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Denied
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/missing_stdlib.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
-index 188a8d4..c0ffe86 100644
---- a/src/basic/missing_stdlib.h
-+++ b/src/basic/missing_stdlib.h
-@@ -8,6 +8,6 @@
- #  if HAVE___SECURE_GETENV
- #    define secure_getenv __secure_getenv
- #  else
--#    error "neither secure_getenv nor __secure_getenv are available"
-+#    define secure_getenv getenv
- #  endif
- #endif
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
deleted file mode 100644
index c6213ab88e..0000000000
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 1eb84534dea05d41afed1d898cba212ad7d310dd Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 13:41:41 +0800
-Subject: [PATCH 02/24] don't use glibc-specific qsort_r
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Rebased for v241]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[Rebased for v242]
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
----
- src/basic/sort-util.h              | 14 --------------
- src/libsystemd/sd-hwdb/hwdb-util.c | 19 ++++++++++++++-----
- src/shared/format-table.c          | 36 ++++++++++++++++++++++++------------
- 3 files changed, 38 insertions(+), 31 deletions(-)
-
-diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index e029f8646e..27d68b341c 100644
---- a/src/basic/sort-util.h
-+++ b/src/basic/sort-util.h
-@@ -54,17 +54,3 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, __compar_fn
-                 int (*_func_)(const typeof(p[0])*, const typeof(p[0])*) = func; \
-                 qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
-         })
--
--static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, __compar_d_fn_t compar, void *userdata) {
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
--                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
--        })
-diff --git a/src/libsystemd/sd-hwdb/hwdb-util.c b/src/libsystemd/sd-hwdb/hwdb-util.c
-index c83575c7c8..72f8f3a050 100644
---- a/src/libsystemd/sd-hwdb/hwdb-util.c
-+++ b/src/libsystemd/sd-hwdb/hwdb-util.c
-@@ -128,9 +128,13 @@ static void trie_free(struct trie *trie) {
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
-@@ -158,7 +162,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
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
-@@ -184,7 +191,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
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
-diff --git a/src/shared/format-table.c b/src/shared/format-table.c
-index a5c0a99b08..d595cbe372 100644
---- a/src/shared/format-table.c
-+++ b/src/shared/format-table.c
-@@ -850,31 +850,33 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
-         return CMP(index_a, index_b);
- }
- 
--static int table_data_compare(const size_t *a, const size_t *b, Table *t) {
-+static Table *user_table;
-+static int table_data_compare(const void *x, const void *y) {
-+        const size_t *a = x, *b=y;
-         size_t i;
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
--        for (i = 0; i < t->n_sort_map; i++) {
-+        for (i = 0; i < user_table->n_sort_map; i++) {
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
-@@ -1107,7 +1109,12 @@ int table_print(Table *t, FILE *f) {
-                 for (i = 0; i < n_rows; i++)
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
-@@ -1534,7 +1541,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
-                 for (i = 0; i < n_rows; i++)
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
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
deleted file mode 100644
index aa2b4cbcf1..0000000000
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From f8a239b182158ca0a537ba053cb0e6bad9c3a2fb Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 14:56:21 +0800
-Subject: [PATCH 07/24] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not 
- defined
-
-If the standard library doesn't provide brace
-expansion users just won't get it.
-
-Dont use GNU GLOB extentions on non-glibc systems
-
-Conditionalize use of GLOB_ALTDIRFUNC
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/glob-util.c     | 13 ++++++++++++-
- src/test/test-glob-util.c | 16 ++++++++++++++++
- src/tmpfiles/tmpfiles.c   | 10 ++++++++++
- 3 files changed, 38 insertions(+), 1 deletion(-)
-
-diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index 32c53f8..ae358d9 100644
---- a/src/basic/glob-util.c
-+++ b/src/basic/glob-util.c
-@@ -13,6 +13,12 @@
- #include "path-util.h"
- #include "strv.h"
- 
-+/* Don't fail if the standard library
-+ * doesn't provide brace expansion */
-+#ifndef GLOB_BRACE
-+#define GLOB_BRACE 0
-+#endif
-+
- static void closedir_wrapper(void* v) {
-         (void) closedir(v);
- }
-@@ -20,6 +26,7 @@ static void closedir_wrapper(void* v) {
- int safe_glob(const char *path, int flags, glob_t *pglob) {
-         int k;
- 
-+#ifdef GLOB_ALTDIRFUNC
-         /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
-         assert(!(flags & GLOB_ALTDIRFUNC));
- 
-@@ -33,10 +40,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
-                 pglob->gl_lstat = lstat;
-         if (!pglob->gl_stat)
-                 pglob->gl_stat = stat;
-+#endif
- 
-         errno = 0;
-+#ifdef GLOB_ALTDIRFUNC
-         k = glob(path, flags | GLOB_ALTDIRFUNC, NULL, pglob);
--
-+#else
-+        k = glob(path, flags, NULL, pglob);
-+#endif
-         if (k == GLOB_NOMATCH)
-                 return -ENOENT;
-         if (k == GLOB_NOSPACE)
-diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index b4f4144..f0d474e 100644
---- a/src/test/test-glob-util.c
-+++ b/src/test/test-glob-util.c
-@@ -13,6 +13,12 @@
- #include "rm-rf.h"
- #include "tmpfile-util.h"
- 
-+/* Don't fail if the standard library
-+ * doesn't provide brace expansion */
-+#ifndef GLOB_BRACE
-+#define GLOB_BRACE 0
-+#endif
-+
- static void test_glob_exists(void) {
-         char name[] = "/tmp/test-glob_exists.XXXXXX";
-         int fd = -1;
-@@ -40,11 +46,13 @@ static void test_glob_no_dot(void) {
-         const char *fn;
- 
-         _cleanup_globfree_ glob_t g = {
-+#ifdef GLOB_ALTDIRFUNC
-                 .gl_closedir = closedir_wrapper,
-                 .gl_readdir = (struct dirent *(*)(void *)) readdir_no_dot,
-                 .gl_opendir = (void *(*)(const char *)) opendir,
-                 .gl_lstat = lstat,
-                 .gl_stat = stat,
-+#endif
-         };
- 
-         int r;
-@@ -52,11 +60,19 @@ static void test_glob_no_dot(void) {
-         assert_se(mkdtemp(template));
- 
-         fn = strjoina(template, "/*");
-+#ifdef GLOB_ALTDIRFUNC
-         r = glob(fn, GLOB_NOSORT|GLOB_BRACE|GLOB_ALTDIRFUNC, NULL, &g);
-+#else
-+        r = glob(fn, GLOB_NOSORT|GLOB_BRACE, NULL, &g);
-+#endif
-         assert_se(r == GLOB_NOMATCH);
- 
-         fn = strjoina(template, "/.*");
-+#ifdef GLOB_ALTDIRFUNC
-         r = glob(fn, GLOB_NOSORT|GLOB_BRACE|GLOB_ALTDIRFUNC, NULL, &g);
-+#else
-+        r = glob(fn, GLOB_NOSORT|GLOB_BRACE, NULL, &g);
-+#endif
-         assert_se(r == GLOB_NOMATCH);
- 
-         (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
-diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index d9d1cc1..477d1e3 100644
---- a/src/tmpfiles/tmpfiles.c
-+++ b/src/tmpfiles/tmpfiles.c
-@@ -63,6 +63,12 @@
- #include "umask-util.h"
- #include "user-util.h"
- 
-+/* Don't fail if the standard library
-+ * doesn't provide brace expansion */
-+#ifndef GLOB_BRACE
-+#define GLOB_BRACE 0
-+#endif
-+
- /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
-  * them in the file system. This is intended to be used to create
-  * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1839,7 +1845,9 @@ finish:
- 
- static int glob_item(Item *i, action_t action) {
-         _cleanup_globfree_ glob_t g = {
-+#ifdef GLOB_ALTDIRFUNC
-                 .gl_opendir = (void *(*)(const char *)) opendir_nomod,
-+#endif
-         };
-         int r = 0, k;
-         char **fn;
-@@ -1859,7 +1867,9 @@ static int glob_item(Item *i, action_t action) {
- 
- static int glob_item_recursively(Item *i, fdaction_t action) {
-         _cleanup_globfree_ glob_t g = {
-+#ifdef GLOB_ALTDIRFUNC
-                 .gl_opendir = (void *(*)(const char *)) opendir_nomod,
-+#endif
-         };
-         int r = 0, k;
-         char **fn;
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
deleted file mode 100644
index d5f2349f2b..0000000000
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 6cd17c753d2c0a90fc791f69bbc694cbc8556a4f Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 15:00:06 +0800
-Subject: [PATCH 08/24] add missing FTW_ macros for musl
-
-This is to avoid build failures like below for musl.
-
-  locale-util.c:296:24: error: 'FTW_STOP' undeclared
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/missing_type.h | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index c487e65..23602eb 100644
---- a/src/basic/missing_type.h
-+++ b/src/basic/missing_type.h
-@@ -19,3 +19,23 @@ typedef int (*comparison_fn_t)(const void *, const void *);
- #define __COMPAR_FN_T
- typedef int (*__compar_fn_t)(const void *, const void *);
- #endif
-+
-+#ifndef FTW_ACTIONRETVAL
-+#define FTW_ACTIONRETVAL 16
-+#endif
-+
-+#ifndef FTW_CONTINUE
-+#define FTW_CONTINUE 0
-+#endif
-+
-+#ifndef FTW_STOP
-+#define FTW_STOP 1
-+#endif
-+
-+#ifndef FTW_SKIP_SUBTREE
-+#define FTW_SKIP_SUBTREE 2
-+#endif
-+
-+#ifndef FTW_SKIP_SIBLINGS
-+#define FTW_SKIP_SIBLINGS 3
-+#endif
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 90f235be3d..1667e3ead5 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -28,14 +28,11 @@ SRC_URI += "file://touchscreen.rules \
 
 # patches needed by musl
 SRC_URI_append_libc-musl = " ${SRC_URI_MUSL}"
-SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.patch \
-               file://0002-don-t-use-glibc-specific-qsort_r.patch \
+SRC_URI_MUSL = " \
                file://0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch \
                file://0004-add-fallback-parse_printf_format-implementation.patch \
                file://0005-src-basic-missing.h-check-for-missing-strndupa.patch \
                file://0006-Include-netinet-if_ether.h.patch \
-               file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch \
-               file://0008-add-missing-FTW_-macros-for-musl.patch \
                file://0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
                file://0011-Use-uintmax_t-for-handling-rlim_t.patch \
                file://0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch \
@@ -54,6 +51,9 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
                file://0001-do-not-disable-buffer-in-writing-files.patch \
                "
 
+# Several musl problems do not yet have a correct fix
+COMPATIBLE_HOST_libc-musl = "null"
+
 PAM_PLUGINS = " \
     pam-plugin-unix \
     pam-plugin-loginuid \
-- 
2.17.1


