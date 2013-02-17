Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U6uAg-0005vT-2D
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 03:40:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1H2NwQl021438
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 18:23:58 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Sat, 16 Feb 2013 18:23:57 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 16 Feb 2013 20:23:52 -0600
Message-ID: <1361067834-23267-2-git-send-email-peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361067834-23267-1-git-send-email-peter.seebach@windriver.com>
References: <1361067834-23267-1-git-send-email-peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] Use in-memory database for files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Feb 2013 02:40:24 -0000
Content-Type: text/plain

It turns out that file databases don't get very large, and that
sqlite3 can be quite fast with an in-memory database. It also turns
out that dumping the database to disk on exit (or during idle times)
is pretty cheap compared to constant updates.

So: We add "--enable-memory-db", which defaults to on if you have
sqlite 3.7 or later, and off for 3.6 (because 3.6 has horrible
performance with in-memory db on some hosts we tried).
---
 ChangeLog.txt   |    5 +++
 Makefile.in     |    5 ++-
 configure       |   32 +++++++++++++++
 pseudo_db.c     |  119 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 pseudo_db.h     |    1 +
 pseudo_server.c |    2 +
 6 files changed, 159 insertions(+), 5 deletions(-)

diff --git a/ChangeLog.txt b/ChangeLog.txt
index 8f52cc9..ed9e5fa 100644
--- a/ChangeLog.txt
+++ b/ChangeLog.txt
@@ -1,3 +1,8 @@
+2013-02-15:
+	* (seebs) Add support for in-memory DB. This, plus upcoming
+	  fsync-related changes, are expected to be big enough to justify
+	  calling this 1.5.
+
 2013-02-13:
         * (seebs) calling link while chrooted could in some cases result
           in the root path not being prepended at all. One more try!
diff --git a/Makefile.in b/Makefile.in
index e0cd7a9..094deba 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -23,11 +23,12 @@ LIBDIR=@LIBDIR@
 SUFFIX=@SUFFIX@
 SQLITE=@SQLITE@
 SQLITE_LIB=@SQLITE_LIB@
+SQLITE_MEMORY=@SQLITE_MEMORY@
 BITS=@BITS@
 ARCH_FLAGS=@ARCH_FLAGS@
 MARK64=@MARK64@
 RPATH=@RPATH@
-VERSION=1.4.5
+VERSION=1.5
 
 LIB=@LIB@
 BIN=bin
@@ -37,7 +38,7 @@ LOCALSTATEDIR=$(PREFIX)/$(LOCALSTATE)
 
 CFLAGS_BASE=-pipe -std=gnu99 -Wall -W -Wextra
 CFLAGS_CODE=-fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE $(ARCH_FLAGS)
-CFLAGS_DEFS=-DPSEUDO_PREFIX='"$(PREFIX)"' -DPSEUDO_SUFFIX='"$(SUFFIX)"' -DPSEUDO_BINDIR='"$(BIN)"' -DPSEUDO_LIBDIR='"$(LIB)"' -DPSEUDO_LOCALSTATEDIR='"$(LOCALSTATE)"' -DPSEUDO_VERSION='"$(VERSION)"'
+CFLAGS_DEFS=-DPSEUDO_PREFIX='"$(PREFIX)"' -DPSEUDO_SUFFIX='"$(SUFFIX)"' -DPSEUDO_BINDIR='"$(BIN)"' -DPSEUDO_LIBDIR='"$(LIB)"' -DPSEUDO_LOCALSTATEDIR='"$(LOCALSTATE)"' -DPSEUDO_VERSION='"$(VERSION)"' $(SQLITE_MEMORY)
 CFLAGS_DEBUG=-O2 -g
 CFLAGS_SQL=-L$(SQLITE)/$(SQLITE_LIB) -I$(SQLITE)/include $(RPATH)
 CFLAGS_PSEUDO=$(CFLAGS_BASE) $(CFLAGS_CODE) $(CFLAGS_DEFS) \
diff --git a/configure b/configure
index 9cb7804..44bee74 100755
--- a/configure
+++ b/configure
@@ -25,6 +25,7 @@ opt_arch=x86
 opt_bits=
 opt_sqlite=/usr
 opt_rpath=
+opt_memory=
 
 compile_x86_32=-m32
 compile_x86_64=-m64
@@ -35,6 +36,7 @@ usage()
     echo >&2 "  configure --prefix=..."
     echo >&2 "           [--libdir=...]"
     echo >&2 "           [--suffix=...]"
+    echo >&2 "           [--enable-memory-db]"
     echo >&2 "           [--with-sqlite=...]"
     echo >&2 "           [--with-sqlite-lib=...]"
     echo >&2 "           [--enable-static-sqlite]"
@@ -69,6 +71,12 @@ do
         sqlite_ldarg='$(SQLITE)/$(SQLITE_LIB)/libsqlite3.a'
         use_maybe_rpath=false
         ;;
+    --enable-memory-db=no)
+        opt_memory=false
+        ;;
+    --enable-memory-db=yes | --enable-memory-db)
+        opt_memory=true
+	;;
     --with-sqlite=*)
         opt_sqlite=${arg#--with-sqlite=}
         # assign new value if unset
@@ -170,6 +178,29 @@ if [ "${SQLITE3_VERSION}" -lt "03006000" ]; then
     exit 1
 fi
 
+if [ -z "$opt_memory" ]; then
+    if [ "${SQLITE3_VERSION}" -lt "03007000" ]; then
+        echo "Disabling in-memory database by default (sqlite too old)."
+	opt_memory=false
+    else
+        echo "Enabling in-memory database by default."
+	opt_memory=true
+    fi
+fi
+
+if $opt_memory; then
+    if [ "${SQLITE3_VERSION}" -lt "03007000" ]; then
+	cat >&2 <<EOF
+WARNING: sqlite prior to 3.7 has been known to perform exceedingly poorly
+with the in-memory database option. You asked for it, you get it, but if
+you get horrible performance, try turning it off.
+EOF
+    fi
+    SQLITE_MEMORY="-DUSE_MEMORY_DB"
+else
+    SQLITE_MEMORY=""
+fi
+
 sed -e '
   s,@PREFIX@,'"$opt_prefix"',g
   s,@LIBDIR@,'"$opt_libdir"',g
@@ -179,6 +210,7 @@ sed -e '
   s,@ARCH_FLAGS@,'"$arch_flags"',g
   s,@SQLITE_LDARG@,'"$sqlite_ldarg"',g
   s,@SQLITE_LIB@,'"$opt_sqlite_lib"',g
+  s,@SQLITE_MEMORY@,'"$SQLITE_MEMORY"',g
   s!@RPATH@!'"$opt_rpath"'!g
   s,@MARK64@,'"$opt_mark64"',g
   s,@ARCH@,'"$opt_arch"',g
diff --git a/pseudo_db.c b/pseudo_db.c
index 540a3c2..21f2f53 100644
--- a/pseudo_db.c
+++ b/pseudo_db.c
@@ -1,7 +1,7 @@
 /*
  * pseudo_db.c, sqlite3 interface
  * 
- * Copyright (c) 2008-2010 Wind River Systems, Inc.
+ * Copyright (c) 2008-2010,2013 Wind River Systems, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the Lesser GNU General Public License version 2.1 as
@@ -50,6 +50,10 @@ struct pdb_file_list {
 	sqlite3_stmt *stmt;
 };
 
+static int file_db_dirty = 0;
+#ifdef USE_MEMORY_DB
+static sqlite3 *real_file_db = 0;
+#endif
 static sqlite3 *file_db = 0;
 static sqlite3 *log_db = 0;
 
@@ -118,6 +122,10 @@ static struct sql_index {
 static char *file_pragmas[] = {
 	"PRAGMA legacy_file_format = OFF;",
 	"PRAGMA journal_mode = OFF;",
+	/* the default page size produces painfully bad behavior
+	 * for memory databases with some versions of sqlite.
+	 */
+	"PRAGMA page_size = 8192;",
 	"PRAGMA locking_mode = EXCLUSIVE;",
 	/* Setting this to NORMAL makes pseudo noticably slower
 	 * than fakeroot, but is perhaps more secure.  However,
@@ -139,7 +147,6 @@ static char *log_pragmas[] = {
 	NULL
 };
 
-
 /* table migrations: */
 /* If there is no migration table, we assume "version -1" -- the
  * version shipped with wrlinux 3.0, which had no version
@@ -239,6 +246,17 @@ static struct database_info db_infos[] = {
 		file_migrations,
 		file_pragmas,
 		file_setups,
+#ifdef USE_MEMORY_DB
+		&real_file_db
+	},
+	{
+		":memory:",
+		file_indexes,
+		file_tables,
+		file_migrations,
+		file_pragmas,
+		file_setups,
+#endif
 		&file_db
 	},
 	{ 0, 0, 0, 0, 0, 0, 0 }
@@ -263,6 +281,67 @@ dberr(sqlite3 *db, char *fmt, ...) {
 	}
 }
 
+#ifdef USE_MEMORY_DB
+
+static void
+pdb_backup() {
+        sqlite3_backup *pBackup;
+        /* no point in doing this if we don't have a database to back up,
+	 * or nothing's changed.
+	 */
+        if (!file_db || !real_file_db || !file_db_dirty)
+                return;
+
+	pBackup = sqlite3_backup_init(real_file_db, "main", file_db, "main");
+	if (pBackup) {
+		int rc;
+		(void)sqlite3_backup_step(pBackup, -1);
+		rc = sqlite3_backup_finish(pBackup);
+		if (rc != SQLITE_OK) {
+			dberr(real_file_db, "error during flush to disk");
+		}
+	}
+	file_db_dirty = 0;
+}
+
+static void
+pdb_restore() {
+        sqlite3_backup *pBackup;
+        /* no point in doing this if we don't have a database to back up */
+        if (!file_db || !real_file_db)
+                return;
+
+	pBackup = sqlite3_backup_init(file_db, "main", real_file_db, "main");
+	if (pBackup) {
+		int rc;
+		(void)sqlite3_backup_step(pBackup, -1);
+		rc = sqlite3_backup_finish(pBackup);
+		if (rc != SQLITE_OK) {
+			dberr(file_db, "error during load from disk");
+		}
+	}
+	file_db_dirty = 0;
+}
+
+int
+pdb_maybe_backup(void) {
+        static int occasional = 0;
+        if (file_db && real_file_db) {
+                occasional = (occasional + 1) % 10;
+                if (occasional == 0) {
+                        pdb_backup();
+                        return 1;
+                }
+        }
+        return 0;
+}
+#else /* USE_MEMORY_DB */
+int
+pdb_maybe_backup(void) {
+	return 0;
+}
+#endif
+
 /* those who enjoy children, sausages, and databases, should not watch
  * them being made.
  */
@@ -448,6 +527,12 @@ make_tables(sqlite3 *db,
 static void
 cleanup_db(void) {
 	pseudo_debug(1, "server exiting\n");
+#ifdef USE_MEMORY_DB
+        if (real_file_db) {
+                pdb_backup();
+                sqlite3_close(real_file_db);
+	}
+#endif
 	if (file_db)
 		sqlite3_close(file_db);
 	if (log_db)
@@ -478,7 +563,12 @@ get_db(struct database_info *dbinfo) {
 		return 0;
 
 	dbfile = pseudo_localstatedir_path(dbinfo->pathname);
-	rc = sqlite3_open(dbfile, &db);
+#ifdef USE_MEMORY_DB
+        if (!strcmp(dbinfo->pathname, ":memory:")) {
+                rc = sqlite3_open(dbinfo->pathname, &db);
+        } else
+#endif
+                rc = sqlite3_open(dbfile, &db);
 	free(dbfile);
 	if (rc) {
 		pseudo_diag("Failed: %s\n", sqlite3_errmsg(db));
@@ -528,6 +618,11 @@ static int
 get_dbs(void) {
 	int err = 0;
 	int i;
+#ifdef USE_MEMORY_DB
+        int already_loaded = 0;
+        if (file_db)
+                already_loaded = 1;
+#endif
 	for (i = 0; db_infos[i].db; ++i) {
 		if (get_db(&db_infos[i])) {
 			pseudo_diag("Error getting '%s' database.\n",
@@ -535,6 +630,10 @@ get_dbs(void) {
 			err = 1;
 		}
 	}
+#ifdef USE_MEMORY_DB
+        if (!already_loaded && file_db)
+                pdb_restore();
+#endif
 	return err;
 }
 
@@ -1082,6 +1181,7 @@ pdb_delete(pseudo_query_t *traits, unsigned long fields) {
 
 	/* no need to return it, so... */
 	if (stmt) {
+		file_db_dirty = 1;
 		int rc = sqlite3_step(stmt);
 		if (rc != SQLITE_DONE) {
 			dberr(log_db, "deletion failed");
@@ -1292,6 +1392,7 @@ pdb_link_file(pseudo_msg_t *msg) {
 		(msg->pathlen ? msg->path : "<nil> (as NAMELESS FILE)"),
 		(unsigned long long) msg->dev, (unsigned long long) msg->ino,
 		(int) msg->mode, msg->uid);
+	file_db_dirty = 1;
 	rc = sqlite3_step(insert);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "insert may have failed (rc %d)", rc);
@@ -1324,6 +1425,7 @@ pdb_unlink_file_dev(pseudo_msg_t *msg) {
 	}
 	sqlite3_bind_int(sql_delete, 1, msg->dev);
 	sqlite3_bind_int(sql_delete, 2, msg->ino);
+	file_db_dirty = 1;
 	rc = sqlite3_step(sql_delete);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "delete by inode may have failed");
@@ -1359,6 +1461,7 @@ pdb_update_file_path(pseudo_msg_t *msg) {
 	sqlite3_bind_text(update, 1, msg->path, -1, SQLITE_STATIC);
 	sqlite3_bind_int(update, 2, msg->dev);
 	sqlite3_bind_int(update, 3, msg->ino);
+	file_db_dirty = 1;
 	rc = sqlite3_step(update);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "update path by inode may have failed");
@@ -1396,6 +1499,7 @@ pdb_may_unlink_file(pseudo_msg_t *msg, int deleting) {
 		pseudo_debug(1, "cannot mark a file for pending deletion without a path.");
 		return 1;
 	}
+	file_db_dirty = 1;
 	rc = sqlite3_step(mark_file);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "mark for deletion may have failed");
@@ -1439,6 +1543,7 @@ pdb_cancel_unlink_file(pseudo_msg_t *msg) {
 		pseudo_debug(1, "cannot unmark a file for pending deletion without a path.");
 		return 1;
 	}
+	file_db_dirty = 1;
 	rc = sqlite3_step(mark_file);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "unmark for deletion may have failed");
@@ -1475,6 +1580,7 @@ pdb_did_unlink_files(int deleting) {
 		return 0;
 	}
 	sqlite3_bind_int(delete_exact, 1, deleting);
+	file_db_dirty = 1;
 	rc = sqlite3_step(delete_exact);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "cleanup of files marked for deletion may have failed");
@@ -1510,6 +1616,7 @@ pdb_did_unlink_file(char *path, int deleting) {
 	}
 	sqlite3_bind_text(delete_exact, 1, path, -1, SQLITE_STATIC);
 	sqlite3_bind_int(delete_exact, 2, deleting);
+	file_db_dirty = 1;
 	rc = sqlite3_step(delete_exact);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "cleanup of file marked for deletion may have failed");
@@ -1548,6 +1655,7 @@ pdb_unlink_file(pseudo_msg_t *msg) {
 		pseudo_debug(1, "cannot unlink a file without a path.");
 		return 1;
 	}
+	file_db_dirty = 1;
 	rc = sqlite3_step(delete_exact);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "delete exact by path may have failed");
@@ -1595,6 +1703,7 @@ pdb_unlink_contents(pseudo_msg_t *msg) {
 		pseudo_debug(1, "cannot unlink a file without a path.");
 		return 1;
 	}
+	file_db_dirty = 1;
 	rc = sqlite3_step(delete_sub);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "delete sub by path may have failed");
@@ -1662,6 +1771,7 @@ pdb_rename_file(const char *oldpath, pseudo_msg_t *msg) {
 
 	rc = sqlite3_exec(file_db, "BEGIN;", NULL, NULL, NULL);
 
+	file_db_dirty = 1;
 	rc = sqlite3_step(update_exact);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "update exact may have failed: rc %d", rc);
@@ -1712,6 +1822,7 @@ pdb_renumber_all(dev_t from, dev_t to) {
 		dberr(file_db, "error binding device numbers to update");
 	}
 
+	file_db_dirty = 1;
 	rc = sqlite3_step(update);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "update may have failed: rc %d", rc);
@@ -1762,6 +1873,7 @@ pdb_update_inode(pseudo_msg_t *msg) {
 		dberr(file_db, "error binding %s to select", msg->path);
 	}
 
+	file_db_dirty = 1;
 	rc = sqlite3_step(update);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "update may have failed: rc %d", rc);
@@ -1806,6 +1918,7 @@ pdb_update_file(pseudo_msg_t *msg) {
 	sqlite3_bind_int(update, 5, msg->dev);
 	sqlite3_bind_int(update, 6, msg->ino);
 
+	file_db_dirty = 1;
 	rc = sqlite3_step(update);
 	if (rc != SQLITE_DONE) {
 		dberr(file_db, "update may have failed: rc %d", rc);
diff --git a/pseudo_db.h b/pseudo_db.h
index fe2fb12..9e0382a 100644
--- a/pseudo_db.h
+++ b/pseudo_db.h
@@ -37,6 +37,7 @@ typedef struct {
 	char *program;
 } log_entry;
 
+extern int pdb_maybe_backup(void);
 extern int pdb_cancel_unlink_file(pseudo_msg_t *msg);
 extern int pdb_did_unlink_file(char *path, int deleting);
 extern int pdb_did_unlink_files(int deleting);
diff --git a/pseudo_server.c b/pseudo_server.c
index f241242..4af5265 100644
--- a/pseudo_server.c
+++ b/pseudo_server.c
@@ -416,6 +416,8 @@ pseudo_server_loop(void) {
 			 */
 			if (active_clients == 1) {
 				loop_timeout -= LOOP_DELAY;
+                                /* maybe flush database to disk */
+                                pdb_maybe_backup();
 				if (loop_timeout <= 0) {
 					pseudo_debug(1, "no more clients, got bored.\n");
 					die_peacefully = 1;
-- 
1.7.9.5



