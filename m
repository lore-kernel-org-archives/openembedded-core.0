Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 01F016E8DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 03:33:03 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id fa1so7110032pad.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 19:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+sUZY+iG2Smz+CFfEwXnD2xrHOi/hEfmqO3rWtgpZpM=;
	b=RGXJLb4ocmkyR5LZ1cdlwdtRGncdXn0XGMN6bUuyb3Gqg+gDrT8h/SKijbabulmXk0
	7QAltyvl/qQxO79GxvoZd+V1/0jRtm8idGA5ipnofy2rGp5fKdMAPdTC/dBxUcr+jHi5
	oubpT28ObEcss732LPD2w8ROEH8sa4KjnB45Cu3TBvq/XVUev+oNhSTospsvwhjJ/Ot4
	x/+CHLZPpQV4otwFMbVWalAjndx5KrwCHzR501v6+t4r2IztAAdntk+Ba5cUNg9IAUo+
	DkS6etIzofKpzy7lu6VciLyUgkWawHxztzfoEo6c4ClZLlsbk/022PteAVn36tmT5Tzj
	0OdA==
X-Received: by 10.66.161.38 with SMTP id xp6mr12892739pab.145.1392089585200;
	Mon, 10 Feb 2014 19:33:05 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	nv7sm47591469pbc.31.2014.02.10.19.33.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Feb 2014 19:33:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Feb 2014 19:33:35 -0800
Message-Id: <d26f2923a8f23a7fed4f22bdc6aaa178d39a5add.1392089446.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1392089446.git.raj.khem@gmail.com>
References: <cover.1392089446.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] systemd: Fix misc journald memory bugs
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
X-List-Received-Date: Tue, 11 Feb 2014 03:33:04 -0000

These set of patches fix journald exhibiting some issues
under load.

One of the prevelant issues is that when appending to journal
it is not able to allocate memory and starts taking 100% cpu
spewing errors like

systemd-journald[2934]: Failed to write entry (19 items, 452 bytes), ignoring: Cannot allocate memory

Other memory issues crept up with time e.g.vacuuming

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ournal-Add-missing-byte-order-conversions.patch |   60 ++++++++++++++
 .../journal-file-protect-against-alloca-0.patch    |   23 ++++++
 ...n-appending-to-journal-file-allocate-larg.patch |   83 ++++++++++++++++++++
 .../systemd/journald-add-missing-error-check.patch |   16 ++++
 .../systemd/journald-fix-minor-memory-leak.patch   |   16 ++++
 meta/recipes-core/systemd/systemd_208.bb           |    5 ++
 6 files changed, 203 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/journal-Add-missing-byte-order-conversions.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journal-file-protect-against-alloca-0.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journal-when-appending-to-journal-file-allocate-larg.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journald-add-missing-error-check.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journald-fix-minor-memory-leak.patch

diff --git a/meta/recipes-core/systemd/systemd/journal-Add-missing-byte-order-conversions.patch b/meta/recipes-core/systemd/systemd/journal-Add-missing-byte-order-conversions.patch
new file mode 100644
index 0000000..21ea0f9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/journal-Add-missing-byte-order-conversions.patch
@@ -0,0 +1,60 @@
+From 43539d6b60ef0db3e98d00bef0024614c8c1807a Mon Sep 17 00:00:00 2001
+From: George McCollister <george.mccollister@gmail.com>
+Date: Tue, 31 Dec 2013 14:37:32 -0600
+Subject: [PATCH] journal: Add missing byte order conversions
+
+Convert entry_array.items[0] to host byte order prior to passing it to
+chain_cache_put().
+
+[zj: also use le64toh in journal-verify.c]
+
+https://bugs.freedesktop.org/show_bug.cgi?id=73194
+
+Upstream-Status: Backport [Fedora]
+---
+ src/journal/journal-file.c   | 4 ++--
+ src/journal/journal-verify.c | 6 +++---
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+Index: systemd-208/src/journal/journal-file.c
+===================================================================
+--- systemd-208.orig/src/journal/journal-file.c	2014-02-07 22:51:44.000000000 -0800
++++ systemd-208/src/journal/journal-file.c	2014-02-07 22:58:40.665062951 -0800
+@@ -1447,7 +1447,7 @@
+ 
+ found:
+         /* Let's cache this item for the next invocation */
+-        chain_cache_put(f->chain_cache, ci, first, a, o->entry_array.items[0], t);
++        chain_cache_put(f->chain_cache, ci, first, a, le64toh(o->entry_array.items[0]), t);
+ 
+         r = journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -1624,7 +1624,7 @@
+                 return 0;
+ 
+         /* Let's cache this item for the next invocation */
+-        chain_cache_put(f->chain_cache, ci, first, a, array->entry_array.items[0], t);
++        chain_cache_put(f->chain_cache, ci, first, a, le64toh(array->entry_array.items[0]), t);
+ 
+         if (subtract_one && i == 0)
+                 p = last_p;
+Index: systemd-208/src/journal/journal-verify.c
+===================================================================
+--- systemd-208.orig/src/journal/journal-verify.c	2013-08-13 13:02:46.000000000 -0700
++++ systemd-208/src/journal/journal-verify.c	2014-02-07 22:57:14.849308409 -0800
+@@ -249,12 +249,12 @@
+                 }
+ 
+                 for (i = 0; i < journal_file_entry_array_n_items(o); i++)
+-                        if (o->entry_array.items[i] != 0 &&
+-                            !VALID64(o->entry_array.items[i])) {
++                        if (le64toh(o->entry_array.items[i]) != 0 &&
++                            !VALID64(le64toh(o->entry_array.items[i]))) {
+                                 log_error(OFSfmt": invalid object entry array item (%"PRIu64"/%"PRIu64"): "OFSfmt,
+                                           offset,
+                                           i, journal_file_entry_array_n_items(o),
+-                                          o->entry_array.items[i]);
++                                          le64toh(o->entry_array.items[i]));
+                                 return -EBADMSG;
+                         }
+ 
diff --git a/meta/recipes-core/systemd/systemd/journal-file-protect-against-alloca-0.patch b/meta/recipes-core/systemd/systemd/journal-file-protect-against-alloca-0.patch
new file mode 100644
index 0000000..953373e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/journal-file-protect-against-alloca-0.patch
@@ -0,0 +1,23 @@
+From a25fd0d4bd3cf652e55c24e7dc873fe530fa111a Mon Sep 17 00:00:00 2001
+From: Thomas Hindoe Paaboel Andersen <phomes@gmail.com>
+Date: Mon, 16 Dec 2013 23:35:30 +0100
+Subject: [PATCH] journal-file: protect against alloca(0)
+
+---
+ src/journal/journal-file.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
+index 090cf97..8ea258b 100644
+--- a/src/journal/journal-file.c
++++ b/src/journal/journal-file.c
+@@ -2737,7 +2737,8 @@ int journal_file_copy_entry(JournalFile *from, JournalFile *to, Object *o, uint6
+         ts.realtime = le64toh(o->entry.realtime);
+ 
+         n = journal_file_entry_n_items(o);
+-        items = alloca(sizeof(EntryItem) * n);
++        /* alloca() can't take 0, hence let's allocate at least one */
++        items = alloca(sizeof(EntryItem) * MAX(1u, n));
+ 
+         for (i = 0; i < n; i++) {
+                 uint64_t l, h;
diff --git a/meta/recipes-core/systemd/systemd/journal-when-appending-to-journal-file-allocate-larg.patch b/meta/recipes-core/systemd/systemd/journal-when-appending-to-journal-file-allocate-larg.patch
new file mode 100644
index 0000000..89573bb
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/journal-when-appending-to-journal-file-allocate-larg.patch
@@ -0,0 +1,83 @@
+From c0658e1948c301177b1527227be0c18932cd7cce Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Tue, 26 Nov 2013 18:39:42 +0100
+Subject: [PATCH] journal: when appending to journal file, allocate larger
+ blocks at once
+
+(cherry picked from commit a676e66535e12458ea6d366a653f8dd60f982504)
+
+Conflicts:
+	src/journal/journal-file.c
+---
+ src/journal/journal-file.c | 26 +++++++++++++++++---------
+ 1 file changed, 17 insertions(+), 9 deletions(-)
+
+Upstream-Status: Backport
+
+Index: systemd-208/src/journal/journal-file.c
+===================================================================
+--- systemd-208.orig/src/journal/journal-file.c	2014-02-07 22:37:06.013722798 -0800
++++ systemd-208/src/journal/journal-file.c	2014-02-07 22:44:51.563341090 -0800
+@@ -68,6 +68,9 @@
+ /* How many entries to keep in the entry array chain cache at max */
+ #define CHAIN_CACHE_MAX 20
+ 
++/* How much to increase the journal file size at once each time we allocate something new. */
++#define FILE_SIZE_INCREASE (8ULL*1024ULL*1024ULL)              /* 8MB */
++
+ int journal_file_set_online(JournalFile *f) {
+         assert(f);
+ 
+@@ -218,8 +221,7 @@
+         journal_file_set_online(f);
+ 
+         /* Sync the online state to disk */
+-        msync(f->header, PAGE_ALIGN(sizeof(Header)), MS_SYNC);
+-        fdatasync(f->fd);
++        fsync(f->fd);
+ 
+         return 0;
+ }
+@@ -313,7 +315,7 @@
+ }
+ 
+ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
+-        uint64_t old_size, new_size;
++        uint64_t old_size, new_size, file_size;
+         int r;
+ 
+         assert(f);
+@@ -333,12 +335,10 @@
+         if (new_size <= old_size)
+                 return 0;
+ 
+-        if (f->metrics.max_size > 0 &&
+-            new_size > f->metrics.max_size)
++        if (f->metrics.max_size > 0 && new_size > f->metrics.max_size)
+                 return -E2BIG;
+ 
+-        if (new_size > f->metrics.min_size &&
+-            f->metrics.keep_free > 0) {
++        if (new_size > f->metrics.min_size && f->metrics.keep_free > 0) {
+                 struct statvfs svfs;
+ 
+                 if (fstatvfs(f->fd, &svfs) >= 0) {
+@@ -363,8 +363,16 @@
+         if (r != 0)
+                 return -r;
+ 
+-        if (fstat(f->fd, &f->last_stat) < 0)
+-                return -errno;
++        /* Increase the file size a bit further than this, so that we
++         * we can create larger memory maps to cache */
++        file_size = ((new_size+FILE_SIZE_INCREASE-1) / FILE_SIZE_INCREASE) * FILE_SIZE_INCREASE;
++        if (file_size > (uint64_t) f->last_stat.st_size) {
++                if (file_size > new_size)
++                        ftruncate(f->fd, file_size);
++
++                if (fstat(f->fd, &f->last_stat) < 0)
++                        return -errno;
++        }
+ 
+         f->header->arena_size = htole64(new_size - le64toh(f->header->header_size));
+ 
diff --git a/meta/recipes-core/systemd/systemd/journald-add-missing-error-check.patch b/meta/recipes-core/systemd/systemd/journald-add-missing-error-check.patch
new file mode 100644
index 0000000..10590e1
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/journald-add-missing-error-check.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Backport [Fedora]
+
+Index: systemd-208/src/journal/journal-file.c
+===================================================================
+--- systemd-208.orig/src/journal/journal-file.c	2013-08-13 13:02:46.397707086 -0700
++++ systemd-208/src/journal/journal-file.c	2014-02-07 22:29:01.398794277 -0800
+@@ -907,7 +907,8 @@
+ 
+         osize = offsetof(Object, field.payload) + size;
+         r = journal_file_append_object(f, OBJECT_FIELD, osize, &o, &p);
+-
++	if (r < 0)
++		return r;
+         o->field.hash = htole64(hash);
+         memcpy(o->field.payload, field, size);
+ 
diff --git a/meta/recipes-core/systemd/systemd/journald-fix-minor-memory-leak.patch b/meta/recipes-core/systemd/systemd/journald-fix-minor-memory-leak.patch
new file mode 100644
index 0000000..9b90ed2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/journald-fix-minor-memory-leak.patch
@@ -0,0 +1,16 @@
+Fix minor memory leak
+
+Upstream-Status: Backport [Fedora]
+
+Index: systemd-208/src/journal/journal-vacuum.c
+===================================================================
+--- systemd-208.orig/src/journal/journal-vacuum.c	2013-09-12 05:51:57.258256643 -0700
++++ systemd-208/src/journal/journal-vacuum.c	2014-02-07 22:35:55.695747001 -0800
+@@ -277,6 +277,7 @@
+                                 freed += size;
+                         } else if (errno != ENOENT)
+                                 log_warning("Failed to delete %s/%s: %m", directory, p);
++			free(p);
+ 
+                         continue;
+                 }
diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index 5ed31c3..f94ce56 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -20,6 +20,11 @@ inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-altern
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch \
            file://binfmt-install.patch \
+           file://journald-add-missing-error-check.patch \
+           file://journald-fix-minor-memory-leak.patch \
+           file://journal-when-appending-to-journal-file-allocate-larg.patch \
+           file://journal-file-protect-against-alloca-0.patch \
+           file://journal-Add-missing-byte-order-conversions.patch \
            file://touchscreen.rules \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
-- 
1.7.10.4


