Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1B74D71637
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 20:47:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 05 Mar 2015 12:47:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,348,1422950400"; d="scan'208";a="536725579"
Received: from localhost.jf.intel.com ([10.7.201.37])
	by orsmga003.jf.intel.com with ESMTP; 05 Mar 2015 12:47:39 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2015 12:47:50 -0800
Message-Id: <1425588470-8098-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] systemd: Fix runtime failures in systemd-tmpfiles-setup.service.
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
X-List-Received-Date: Thu, 05 Mar 2015 20:47:50 -0000

There were failures at boot from systemd-tmpfiles-setup.service due to
tmpfiles.d not honoring the ordering of entries in the files.

The patch here fixes the ordering issue which subsequently fixes the
failures on boot.

[Yocto #7393]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 ...files.c-Honor-ordering-within-files-as-th.patch | 187 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_219.bb           |   1 +
 2 files changed, 188 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch

diff --git a/meta/recipes-core/systemd/systemd/0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch b/meta/recipes-core/systemd/systemd/0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch
new file mode 100644
index 0000000..c2b38bd
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch
@@ -0,0 +1,187 @@
+From 2abf886295b979bce6d3f0a240f6f5ecfd70ba37 Mon Sep 17 00:00:00 2001
+From: Randy Witt <randy.e.witt@linux.intel.com>
+Date: Wed, 4 Mar 2015 18:32:40 -0800
+Subject: [PATCH] tmpfiles.c: Honor ordering within files as the docs say.
+
+Previously, globs would always get processed first followed by any other
+items in arbitrary order. This is contrary to the documentation which
+states "Otherwise, the files/directories are processed in the order they
+are listed."
+
+To fix this, remove the separate "globs" hashmap, and instead use only one
+marking each entry as a glob or not. There should be little overhead
+from doing this, considering the only time nested processing will occur
+is for processing of globs which are not of type "X".
+
+Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
+
+Upstream-Status: Submitted systemd-devel@lists.freedesktop.org
+---
+ src/tmpfiles/tmpfiles.c | 53 ++++++++++++++++++++++---------------------------
+ 1 file changed, 24 insertions(+), 29 deletions(-)
+
+diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
+index 917bb3c..0b6d226 100644
+--- a/src/tmpfiles/tmpfiles.c
++++ b/src/tmpfiles/tmpfiles.c
+@@ -116,6 +116,7 @@ typedef struct Item {
+         bool force:1;
+ 
+         bool done:1;
++        bool glob:1;
+ } Item;
+ 
+ typedef struct ItemArray {
+@@ -137,7 +138,7 @@ static const char conf_file_dirs[] = CONF_DIRS_NULSTR("tmpfiles");
+ 
+ #define MAX_DEPTH 256
+ 
+-static Hashmap *items = NULL, *globs = NULL;
++static OrderedHashmap *items = NULL;
+ static Set *unix_sockets = NULL;
+ 
+ static bool needs_glob(ItemType t) {
+@@ -176,17 +177,17 @@ static bool takes_ownership(ItemType t) {
+                       RECURSIVE_REMOVE_PATH);
+ }
+ 
+-static struct Item* find_glob(Hashmap *h, const char *match) {
++static struct Item* find_glob(OrderedHashmap *h, const char *match) {
+         ItemArray *j;
+         Iterator i;
+ 
+-        HASHMAP_FOREACH(j, h, i) {
++        ORDERED_HASHMAP_FOREACH(j, h, i) {
+                 unsigned n;
+ 
+                 for (n = 0; n < j->count; n++) {
+                         Item *item = j->items + n;
+ 
+-                        if (fnmatch(item->path, match, FNM_PATHNAME|FNM_PERIOD) == 0)
++                        if (item->glob && fnmatch(item->path, match, FNM_PATHNAME|FNM_PERIOD) == 0)
+                                 return item;
+                 }
+         }
+@@ -391,12 +392,12 @@ static int dir_cleanup(
+                 }
+ 
+                 /* Is there an item configured for this path? */
+-                if (hashmap_get(items, sub_path)) {
++                if (ordered_hashmap_get(items, sub_path)) {
+                         log_debug("Ignoring \"%s\": a separate entry exists.", sub_path);
+                         continue;
+                 }
+ 
+-                if (find_glob(globs, sub_path)) {
++                if (find_glob(items, sub_path)) {
+                         log_debug("Ignoring \"%s\": a separate glob exists.", sub_path);
+                         continue;
+                 }
+@@ -1378,7 +1379,7 @@ static int process_item(Item *i) {
+         PATH_FOREACH_PREFIX(prefix, i->path) {
+                 ItemArray *j;
+ 
+-                j = hashmap_get(items, prefix);
++                j = ordered_hashmap_get(items, prefix);
+                 if (j) {
+                         int s;
+ 
+@@ -1505,7 +1506,6 @@ static int parse_line(const char *fname, unsigned line, const char *buffer) {
+         _cleanup_free_ char *action = NULL, *mode = NULL, *user = NULL, *group = NULL, *age = NULL, *path = NULL;
+         _cleanup_(item_free_contents) Item i = {};
+         ItemArray *existing;
+-        Hashmap *h;
+         int r, c = -1, pos;
+         bool force = false, boot = false;
+ 
+@@ -1739,9 +1739,9 @@ static int parse_line(const char *fname, unsigned line, const char *buffer) {
+                 i.age_set = true;
+         }
+ 
+-        h = needs_glob(i.type) ? globs : items;
++        i.glob = needs_glob(i.type);
+ 
+-        existing = hashmap_get(h, i.path);
++        existing = ordered_hashmap_get(items, i.path);
+         if (existing) {
+                 unsigned n;
+ 
+@@ -1752,7 +1752,7 @@ static int parse_line(const char *fname, unsigned line, const char *buffer) {
+                 }
+         } else {
+                 existing = new0(ItemArray, 1);
+-                r = hashmap_put(h, i.path, existing);
++                r = ordered_hashmap_put(items, i.path, existing);
+                 if (r < 0)
+                         return log_oom();
+         }
+@@ -1911,14 +1911,20 @@ static int read_config_file(const char *fn, bool ignore_enoent) {
+         }
+ 
+         /* we have to determine age parameter for each entry of type X */
+-        HASHMAP_FOREACH(i, globs, iterator) {
++        ORDERED_HASHMAP_FOREACH(i, items, iterator) {
+                 Iterator iter;
+                 Item *j, *candidate_item = NULL;
++                int number = 0;
+ 
++                if (!i->glob)
++                        continue;
+                 if (i->type != IGNORE_DIRECTORY_PATH)
+                         continue;
+ 
+-                HASHMAP_FOREACH(j, items, iter) {
++                ORDERED_HASHMAP_FOREACH(j, items, iter) {
++                        number++;
++                        if (j == i)
++                                continue;
+                         if (j->type != CREATE_DIRECTORY && j->type != TRUNCATE_DIRECTORY && j->type != CREATE_SUBVOLUME)
+                                 continue;
+ 
+@@ -1964,10 +1970,9 @@ int main(int argc, char *argv[]) {
+ 
+         mac_selinux_init(NULL);
+ 
+-        items = hashmap_new(&string_hash_ops);
+-        globs = hashmap_new(&string_hash_ops);
++        items = ordered_hashmap_new(&string_hash_ops);
+ 
+-        if (!items || !globs) {
++        if (!items) {
+                 r = log_oom();
+                 goto finish;
+         }
+@@ -2000,27 +2005,17 @@ int main(int argc, char *argv[]) {
+                 }
+         }
+ 
+-        HASHMAP_FOREACH(a, globs, iterator) {
+-                k = process_item_array(a);
+-                if (k < 0 && r == 0)
+-                        r = k;
+-        }
+-
+-        HASHMAP_FOREACH(a, items, iterator) {
++        ORDERED_HASHMAP_FOREACH(a, items, iterator) {
+                 k = process_item_array(a);
+                 if (k < 0 && r == 0)
+                         r = k;
+         }
+ 
+ finish:
+-        while ((a = hashmap_steal_first(items)))
+-                item_array_free(a);
+-
+-        while ((a = hashmap_steal_first(globs)))
++        while ((a = ordered_hashmap_steal_first(items)))
+                 item_array_free(a);
+ 
+-        hashmap_free(items);
+-        hashmap_free(globs);
++        ordered_hashmap_free(items);
+ 
+         free(arg_include_prefixes);
+         free(arg_exclude_prefixes);
+-- 
+1.9.3
+
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 9c90c03..3c4b6cf 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -42,6 +42,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0011-systemd-user-avoid-using-system-auth.patch \
            file://0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch \
            file://0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch \
+           file://0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch \
            file://tmpfiles-pam.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
-- 
1.9.3


