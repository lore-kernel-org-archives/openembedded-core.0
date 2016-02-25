Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA46F772E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 18:18:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1PII8hu016831
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 10:18:08 -0800
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 10:18:07 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Feb 2016 12:18:03 -0600
Message-ID: <a535895e0c98108980d93d50a8ebd837b07c5605.1456423924.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456423924.git.mark.hatle@windriver.com>
References: <cover.1456423924.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head
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
X-List-Received-Date: Thu, 25 Feb 2016 18:18:08 -0000
Content-Type: text/plain

[Note: base64 pieces were omitted from this patch!  Use the version in the
-contrib tree if you are interested in the contents.]

meta/lib/oe/package_manager.py was also updated.  This ensures that any
diagnostic messages are ignored from the output of rpmresolve.

The patches have been split into bug fixes (things that belong upstream)
and local changes that are OE specific.

The following patches are obsolete and have been removed:

rpm-remove-sykcparse-decl.patch
fstack-protector-configure-check.patch
rpm-disable-Wno-override-init.patch
rpm-lua-fix-print.patch
rpm-rpmpgp-fix.patch
verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/lib/oe/package_manager.py                     |   14 +-
 .../rpm/rpm/beecrypt-5.4.15-to-5.4.16.patch.xz     |  Bin 0 -> 26668 bytes
 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |   46 +-
 .../rpm/rpm/fstack-protector-configure-check.patch |   21 -
 .../rpm/rpm/header-include-fix.patch               |   10 +
 .../rpm/rpm/lua-5.4.15-to-5.4.16.patch.xz          |  Bin 0 -> 212864 bytes
 .../rpm/rpm/python-rpm-rpmsense.patch              |   30 +-
 .../rpm/rpm/rpm-5.4.15-to-5.4.16.patch.xz          |  Bin 0 -> 1316188 bytes
 meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |   39 +-
 meta/recipes-devtools/rpm/rpm/rpm-db60.patch       |   56 +
 .../rpm/rpm/rpm-disable-Wno-override-init.patch    |   32 -
 .../rpm/rpm/rpm-disable-auto-stack-protector.patch |   32 +
 .../rpm/rpm/rpm-fix-parseEmbedded.patch            |   27 +
 .../rpm/rpm/rpm-lua-fix-print.patch                |  104 --
 ...rpm-macros.in-disable-external-key-server.patch |   16 +-
 .../rpm/rpm/rpm-mongodb-sasl.patch                 |   69 ++
 .../rpm/rpm/rpm-payload-use-hashed-inode.patch     |   20 -
 .../rpm/rpm/rpm-pkgconfigdeps.patch                |   10 +-
 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch    |   16 +-
 .../rpm/rpm/rpm-python-restore-origin.patch        |   49 +
 .../rpm/rpm/rpm-remove-sykcparse-decl.patch        |   14 -
 .../rpm/rpm/rpm-rpmdb-grammar.patch                |  124 +++
 .../rpm/rpm/rpm-rpmio-headers.patch                |   19 +
 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch |   67 --
 .../rpm/rpm/rpm-scriptletexechelper.patch          |   29 +-
 .../rpm/rpm/rpm-syck-fix-gram.patch                | 1081 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   30 +-
 .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |   27 +-
 .../rpm/rpm/syck-5.4.15-to-5.4.16.patch.xz         |  Bin 0 -> 4524 bytes
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   36 +-
 ...broken-logic-for-ghost-avoidance-Mark-Hat.patch |   38 -
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |  206 +++-
 .../rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb}           |  101 +-
 33 files changed, 1835 insertions(+), 528 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/beecrypt-5.4.15-to-5.4.16.patch.xz
 delete mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/lua-5.4.15-to-5.4.16.patch.xz
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-5.4.15-to-5.4.16.patch.xz
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db60.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-auto-stack-protector.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/syck-5.4.15-to-5.4.16.patch.xz
 delete mode 100644 meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
 rename meta/recipes-devtools/rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb} (94%)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b30a4da..271775e 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -428,11 +428,15 @@ class RpmPkgsList(PkgsList):
 
         # Populate deps dictionary for better manipulation
         for line in dependencies.splitlines():
-            pkg, dep = line.split("|")
-            if not pkg in deps:
-                deps[pkg] = list()
-            if not dep in deps[pkg]:
-                deps[pkg].append(dep)
+            try:
+                pkg, dep = line.split("|")
+                if not pkg in deps:
+                    deps[pkg] = list()
+                if not dep in deps[pkg]:
+                    deps[pkg].append(dep)
+            except:
+                # Ignore any other lines they're debug or errors
+                pass
 
         for line in tmp_output.split('\n'):
             if len(line.strip()) == 0:
diff --git a/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch b/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
index beef5ed..585cf12 100644
--- a/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
+++ b/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
@@ -15,34 +15,36 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.14/tools/debugedit.c
+Index: rpm/tools/debugedit.c
 ===================================================================
---- rpm-5.4.14.orig/tools/debugedit.c
-+++ rpm-5.4.14/tools/debugedit.c
-@@ -1445,21 +1445,24 @@ handle_build_id (DSO *dso, Elf_Data *bui
-     auto inline void process (const void *data, size_t size)
-     {
-       memchunk chunk = { .data = (void *) data, .size = size };
--      hashFunctionContextUpdateMC (&ctx, &chunk);
-+      if (data != NULL && size != 0)
-+        hashFunctionContextUpdateMC (&ctx, &chunk);
-     }
-     union
-     {
+--- rpm.orig/tools/debugedit.c
++++ rpm/tools/debugedit.c
+@@ -1403,7 +1403,8 @@ static inline void process (hashFunction
+ 		const void *data, size_t size)
+ {
+     memchunk chunk = { .data = (void *) data, .size = size };
+-    hashFunctionContextUpdateMC (ctx, &chunk);
++    if (data != NULL && size != 0)
++      hashFunctionContextUpdateMC (ctx, &chunk);
+ }
+ 
+ /* Compute a fresh build ID bit-string from the editted file contents.  */
+@@ -1456,14 +1457,16 @@ handle_build_id (DSO *dso, Elf_Data *bui
        GElf_Ehdr ehdr;
        GElf_Phdr phdr;
        GElf_Shdr shdr;
 -    } u;
 -    Elf_Data x = { .d_version = EV_CURRENT, .d_buf = &u };
-+    } u1, u2;
-+    Elf_Data src  = { .d_version = EV_CURRENT, .d_buf = &u1 };
-+    Elf_Data dest = { .d_version = EV_CURRENT, .d_buf = &u2 };
- 
+-
 -    x.d_type = ELF_T_EHDR;
 -    x.d_size = sizeof u.ehdr;
 -    u.ehdr = dso->ehdr;
 -    u.ehdr.e_phoff = u.ehdr.e_shoff = 0;
 -    if (elf64_xlatetom (&x, &x, dso->ehdr.e_ident[EI_DATA]) == NULL)
++    } u1, u2;
++    Elf_Data src  = { .d_version = EV_CURRENT, .d_buf = &u1 };
++    Elf_Data dest = { .d_version = EV_CURRENT, .d_buf = &u2 };
++
 +    src.d_type = ELF_T_EHDR;
 +    src.d_size = sizeof u1.ehdr;
 +    dest.d_size = sizeof u2.ehdr;
@@ -52,7 +54,7 @@ Index: rpm-5.4.14/tools/debugedit.c
        {
        bad:
  	fprintf (stderr, "Failed to compute header checksum: %s\n",
-@@ -1467,29 +1470,31 @@ handle_build_id (DSO *dso, Elf_Data *bui
+@@ -1471,29 +1474,31 @@ handle_build_id (DSO *dso, Elf_Data *bui
  	exit (1);
        }
  
@@ -69,8 +71,8 @@ Index: rpm-5.4.14/tools/debugedit.c
 -	if (elf64_xlatetom (&x, &x, dso->ehdr.e_ident[EI_DATA]) == NULL)
 +	if (elf64_xlatetom (&dest, &src, dso->ehdr.e_ident[EI_DATA]) == NULL)
  	  goto bad;
--	process (x.d_buf, x.d_size);
-+	process (dest.d_buf, dest.d_size);
+-	process (&ctx, x.d_buf, x.d_size);
++	process (&ctx, dest.d_buf, dest.d_size);
        }
  
 -    x.d_type = ELF_T_SHDR;
@@ -88,8 +90,8 @@ Index: rpm-5.4.14/tools/debugedit.c
 +	  u1.shdr.sh_offset = 0;
 +	  if (elf64_xlatetom (&dest, &src, dso->ehdr.e_ident[EI_DATA]) == NULL)
  	    goto bad;
--	  process (x.d_buf, x.d_size);
-+	  process (dest.d_buf, dest.d_size);
+-	  process (&ctx, x.d_buf, x.d_size);
++	  process (&ctx, dest.d_buf, dest.d_size);
  
 -	  if (u.shdr.sh_type != SHT_NOBITS)
 +	  if (u1.shdr.sh_type != SHT_NOBITS)
diff --git a/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
deleted file mode 100644
index 976af48..0000000
--- a/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Some options checked in this loop are needing linking to find out
-if the option can be used or not e.g. -fstack-protector which needs
-libssp to be staged and available for compiler to link against
-Therefore we change the compile only check to compile and link check
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: rpm-5.4.14/configure.ac
-===================================================================
---- rpm-5.4.14.orig/configure.ac
-+++ rpm-5.4.14/configure.ac
-@@ -201,7 +201,7 @@ dnl # GNU GCC (usually "gcc")
-  my_save_cflags="$CFLAGS"
-  CFLAGS=$c
-  AC_MSG_CHECKING([whether GCC supports $c])
-- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([])],
-+ AC_LINK_IFELSE([AC_LANG_PROGRAM([])],
-     [AC_MSG_RESULT([yes])]
-     [my_cflags=$c],
-     [AC_MSG_RESULT([no])]
diff --git a/meta/recipes-devtools/rpm/rpm/header-include-fix.patch b/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
index 5ffb187..576ff00 100644
--- a/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
@@ -1,5 +1,15 @@
+Update two rpm headers to include other headers.
+
+Using rpmdb.h w/o including errno.h may result in a warning.
+
+Using rpmtag.h w/o also adding stdint.h will result in numerous failures
+about unknown types on modern compilers.
+
 Upstream-Status: Pending
 
+Signed-off-by: Qing He <qing.he@intel.com>
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
 Index: rpm-5.4.14/rpmdb/rpmdb.h
 ===================================================================
 --- rpm-5.4.14.orig/rpmdb/rpmdb.h
diff --git a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
index a538a60..471e6ea 100644
--- a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
+++ b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
@@ -8,26 +8,24 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.14/python/rpmmodule.c
+Index: rpm/python/rpmmodule.c
 ===================================================================
---- rpm-5.4.14.orig/python/rpmmodule.c
-+++ rpm-5.4.14/python/rpmmodule.c
-@@ -494,12 +494,16 @@ void init_rpm(void)
-     REGISTER_ENUM(RPMSENSE_EQUAL);
-     REGISTER_ENUM(RPMSENSE_NOTEQUAL);
-     REGISTER_ENUM(RPMSENSE_FIND_REQUIRES);
--#if defined(RPM_VENDOR_MANDRIVA)
-+#if defined(RPM_VENDOR_MANDRIVA) || defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_OE)
+--- rpm.orig/python/rpmmodule.c
++++ rpm/python/rpmmodule.c
+@@ -525,12 +525,15 @@ static int initModule(PyObject *m)
      REGISTER_ENUM(RPMSENSE_PREREQ);
+     REGISTER_ENUM(RPMSENSE_PRETRANS);
+     REGISTER_ENUM(RPMSENSE_INTERP);
++#else
++ #if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_OE)
      REGISTER_ENUM(RPMSENSE_SCRIPT_PRE);
      REGISTER_ENUM(RPMSENSE_SCRIPT_POST);
      REGISTER_ENUM(RPMSENSE_SCRIPT_PREUN);
--    REGISTER_ENUM(RPMSENSE_SCRIPT_POSTUN)
-+    REGISTER_ENUM(RPMSENSE_SCRIPT_POSTUN);
-+#endif
-+
-+#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_OE)
+     REGISTER_ENUM(RPMSENSE_SCRIPT_POSTUN);
+     REGISTER_ENUM(RPMSENSE_SCRIPT_VERIFY);
+-#else
 +    REGISTER_ENUM(RPMSENSE_MISSINGOK);
++ #endif
+     REGISTER_ENUM(RPMSENSE_NOTEQUAL);
  #endif
- 
-     REGISTER_ENUM(RPMDEPS_FLAG_NOUPGRADE);
+     REGISTER_ENUM(RPMSENSE_FIND_REQUIRES);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch b/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
index a5fab41..11e0d9e 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
@@ -10,20 +10,20 @@ Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
  configure.ac | 103 ++++++++++++++++++++++++++++++++++++++++++++++-------------
  1 file changed, 81 insertions(+), 22 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 02716a0..889a425 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -547,8 +547,6 @@ else
+Index: rpm/configure.ac
+===================================================================
+--- rpm.orig/configure.ac
++++ rpm/configure.ac
+@@ -871,8 +871,6 @@ else
      MYPATH=$PATH
  fi
  
--DBXY=db60
+-DBXY=db61
 -
  AC_PATH_PROG(__BASH, bash, %{_bindir}/bash, $MYPATH)
  AC_PATH_PROG(__BZIP2, bzip2, %{_bindir}/bzip2, $MYPATH)
  AC_PATH_PROG(__CAT, cat, /bin/cat, $MYPATH)
-@@ -560,22 +558,6 @@ AC_PATH_PROG(__CMAKE, cmake, %{_bindir}/cmake, $MYPATH)
+@@ -884,22 +882,6 @@ AC_PATH_PROG(__CMAKE, cmake, %{_bindir}/
  AC_PATH_PROG(__CPIO, cpio, /bin/cpio, $MYPATH)
  AC_PATH_PROG(__CURL, curl, %{_bindir}/curl, $MYPATH)
  AC_PATH_PROG(__CVS, cvs, %{_bindir}/cvs, $MYPATH)
@@ -46,7 +46,7 @@ index 02716a0..889a425 100644
  AC_PATH_PROG(__DIFF, diff, /bin/diff, $MYPATH)
  AC_PATH_PROG(__DITTO, ditto, %{_bindir}/ditto, $MYPATH)
  AC_PATH_PROG(__FILE, file, %{_bindir}/file, $MYPATH)
-@@ -1598,13 +1580,46 @@ RPM_CHECK_LIB(
+@@ -2050,13 +2032,46 @@ RPM_CHECK_LIB(
  
  dnl # Berkeley-DB & SQLite
  DBLIBSRCS=""
@@ -69,11 +69,11 @@ index 02716a0..889a425 100644
 +]])],
 +[RPM_CHECK_LIB(
      [Berkeley-DB], [db],
-     [db-6.0], [db_create], [db.h],
+     [db-6.1], [db_create], [db.h],
 -    [yes,external], [db3],
 +    [yes,external], [db6],
      [ DBLIBSRCS="$DBLIBSRCS db3.c"
-+      DBXY=db60
++      DBXY=db61
 +      AM_CONDITIONAL(WITH_DB, [ true ])
 +      AM_CONDITIONAL(WITH_DB_INTERNAL, [ test ".$RPM_CHECK_LIB_LOCATION" = .internal ])
 +      if test ".$RPM_CHECK_LIB_LOCATION" = .internal; then
@@ -96,32 +96,32 @@ index 02716a0..889a425 100644
        AM_CONDITIONAL(WITH_DB, [ true ])
        AM_CONDITIONAL(WITH_DB_INTERNAL, [ test ".$RPM_CHECK_LIB_LOCATION" = .internal ])
        if test ".$RPM_CHECK_LIB_LOCATION" = .internal; then
-@@ -1616,6 +1631,11 @@ RPM_CHECK_LIB(
+@@ -2068,6 +2083,11 @@ RPM_CHECK_LIB(
      [ AM_CONDITIONAL(WITH_DB, [ false ])
        AM_CONDITIONAL(WITH_DB_INTERNAL, [ false ])
      ])
 +])
 +
-+if test ".$ac_cv_lib_db_6_0_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
++if test ".$ac_cv_lib_db_6_1_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
 +    CPPFLAGS="${CPPFLAGS_save}"
 +fi
  
  dnl # Sqlite external
  RPM_CHECK_LIB(
-@@ -1627,10 +1647,11 @@ RPM_CHECK_LIB(
+@@ -2078,10 +2098,11 @@ RPM_CHECK_LIB(
+     [])
  
- dnl # Sqlite 3.7.0.1 from db-5.1.19
- dnl XXX error: `db3' is already registered with AC_CONFIG_SUBDIRS.
-+if test ".$ac_cv_lib_db_6_0_db_create" = .yes; then
+ dnl # Sqlite 3.8.3.1 from db-6.1.19
++if test ".$ac_cv_lib_db_6_1_db_create" = .yes; then
  RPM_CHECK_LIB(
      [Berkeley-DB (+SQLite3)], [dbsql],
-     [db_sql-6.0], [sqlite3_open], [dbsql.h],
+     [db_sql-6.1], [sqlite3_open], [dbsql.h],
 -    [yes,external], [db3/sql],
 +    [yes,external], [db6/sql],
      [
        AM_CONDITIONAL(WITH_DBSQL, [ true ])
        AC_DEFINE(WITH_SQLITE, 1, [Define as 1 if building with SQLite library])
-@@ -1644,12 +1665,50 @@ RPM_CHECK_LIB(
+@@ -2095,12 +2116,50 @@ RPM_CHECK_LIB(
      ], [
        AM_CONDITIONAL(WITH_DBSQL, [ false ])
      ])
@@ -172,6 +172,3 @@ index 02716a0..889a425 100644
  AC_ARG_WITH(db-largefile, AS_HELP_STRING([--with-db-largefile], [build Berkeley-DB with LARGEFILE support]))
  AC_ARG_WITH(db-mutex,     AS_HELP_STRING([--with-db-mutex=ARG], [build Berkeley-DB with MUTEX type ARG]))
  
--- 
-2.6.2
-
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db60.patch b/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
new file mode 100644
index 0000000..b4df8b7
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
@@ -0,0 +1,56 @@
+Set the DB 6 version to match oe-core db 6.0.30
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm/configure.ac
+===================================================================
+--- rpm.orig/configure.ac
++++ rpm/configure.ac
+@@ -2049,10 +2049,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ ]])],
+ [RPM_CHECK_LIB(
+     [Berkeley-DB], [db],
+-    [db-6.1], [db_create], [db.h],
++    [db-6.0], [db_create], [db.h],
+     [yes,external], [db6],
+     [ DBLIBSRCS="$DBLIBSRCS db3.c"
+-      DBXY=db61
++      DBXY=db60
+       AM_CONDITIONAL(WITH_DB, [ true ])
+       AM_CONDITIONAL(WITH_DB_INTERNAL, [ test ".$RPM_CHECK_LIB_LOCATION" = .internal ])
+       if test ".$RPM_CHECK_LIB_LOCATION" = .internal; then
+@@ -2085,7 +2085,7 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+     ])
+ ])
+ 
+-if test ".$ac_cv_lib_db_6_1_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
++if test ".$ac_cv_lib_db_6_0_db_create" != .yes -a ".$ac_cv_lib_db_5_3_db_create" != .yes; then
+     CPPFLAGS="${CPPFLAGS_save}"
+ fi
+ 
+@@ -2097,11 +2097,11 @@ RPM_CHECK_LIB(
+     [ DBLIBSRCS="$DBLIBSRCS sqlite.c" ],
+     [])
+ 
+-dnl # Sqlite 3.8.3.1 from db-6.1.19
+-if test ".$ac_cv_lib_db_6_1_db_create" = .yes; then
++dnl # Sqlite 3.8.3.1 from db-6.0.30
++if test ".$ac_cv_lib_db_6_0_db_create" = .yes; then
+ RPM_CHECK_LIB(
+     [Berkeley-DB (+SQLite3)], [dbsql],
+-    [db_sql-6.1], [sqlite3_open], [dbsql.h],
++    [db_sql-6.0], [sqlite3_open], [dbsql.h],
+     [yes,external], [db6/sql],
+     [
+       AM_CONDITIONAL(WITH_DBSQL, [ true ])
+@@ -2253,7 +2253,7 @@ AC_SUBST(WITH_RUBY_CPPFLAGS)
+ AC_SUBST(WITH_RUBY_SUBDIR)
+ AC_SUBST(WITH_RUBY_VENDORARCHDIR)
+ 
+-dnl # Java prerequisites (swiped from db-6.1.19/dist/aclocal_java et al)
++dnl # Java prerequisites (swiped from db-6.0.30/dist/aclocal_java et al)
+ WITH_JAVA=no
+ AC_ARG_WITH([java],
+     AS_HELP_STRING([--with-java], [build RPM with java support]),
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch b/meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch
deleted file mode 100644
index 8b5f8d6..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 70d881873b443c9bad502db9665595455d4f0ac9 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 8 Jul 2014 07:41:10 +0800
-Subject: [PATCH] configure.ac: disable -Wno-override-init
-
-Fixed rpm-native.do_configure error on CentOS 5.x:
-
-cc1: error: unrecognized command line option "-Wno-override-init"
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index adeffe0..6746b4c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -163,7 +163,7 @@ AC_ARG_ENABLE(build-warnings,
- # XXX gcc-4.2 on Mac OS X hasn't
- #            CFLAGS="$CFLAGS -Wno-unused-but-set-variable"
- # XXX rpmio/set.c needs this
--            CFLAGS="$CFLAGS -Wno-override-init"
-+#            CFLAGS="$CFLAGS -Wno-override-init"
-         elif test ".`$CC -V 2>&1 | grep 'Sun C'`" != .; then
-             dnl # Sun Studio (usually "cc")
-             CFLAGS="$CFLAGS -v"
---
-1.8.2.1
-
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-disable-auto-stack-protector.patch b/meta/recipes-devtools/rpm/rpm/rpm-disable-auto-stack-protector.patch
new file mode 100644
index 0000000..3716a28
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-disable-auto-stack-protector.patch
@@ -0,0 +1,32 @@
+Make security switches manual settings
+
+RPM checks for the availability of the stack protector switch and
+transactional-memory support.  If supported it unconditionally
+enables the compiler options which can cause errors if the support has
+not been built into the compiler.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm/configure.ac
+===================================================================
+--- rpm.orig/configure.ac
++++ rpm/configure.ac
+@@ -425,12 +425,12 @@ dnl #  rpm_CFLAGS_ADD([-fstack-arrays],[
+ dnl # build RPM instrumented for extra optimization/security (GCC only)
+ dnl # --- other optimizations
+   rpm_CFLAGS_ADD([-fexceptions], [RPM_CFLAGS])
+-  rpm_CFLAGS_ADD([-D_FORTIFY_SOURCE=2 -fstack-protector], [RPM_CFLAGS])
++dnl  rpm_CFLAGS_ADD([-D_FORTIFY_SOURCE=2 -fstack-protector], [RPM_CFLAGS])
+ dnl #  rpm_CFLAGS_ADD([-fstack-protector-all],[RPM_CFLAGS])
+ 
+-     if test \( ".`$CC --version 2>&1 | grep 'GCC'`" != . \); then
+-         rpm_CFLAGS_ADD([-fgnu-tm], [RPM_CFLAGS])
+-     fi
++dnl     if test \( ".`$CC --version 2>&1 | grep 'GCC'`" != . \); then
++dnl         rpm_CFLAGS_ADD([-fgnu-tm], [RPM_CFLAGS])
++dnl     fi
+ 
+ dnl # --- options below are added to RPM_CFLAGS but _NOT_ added to CFLAGS
+             CPPFLAGS="$CPPFLAGS $RPM_CPPFLAGS"
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch b/meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
new file mode 100644
index 0000000..a6003ba
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
@@ -0,0 +1,27 @@
+Fix an issue where parseEmbedded is not defined, but is still used.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm/rpmio/macro.c
+===================================================================
+--- rpm.orig/rpmio/macro.c
++++ rpm/rpmio/macro.c
+@@ -1616,8 +1616,6 @@ exit:
+  * @retval *avp		invocation args
+  * @return		script string
+  */
+-#if defined(WITH_AUGEAS) || defined(WITH_FICL) || defined(WITH_MOZJS) || defined(WITH_JNIEMBED) || defined(WITH_PERLEMBED) || defined(WITH_PYTHONEMBED) || defined(WITH_RUBYEMBED) || defined(WITH_MRUBY_EMBED) || defined(WITH_SQLITE) || defined(WITH_SQUIRREL) || defined(WITH_TCL)
+-
+ static char _FIXME_embedded_interpreter_eval_returned_null[] =
+     "FIXME: embedded interpreter eval returned null.";
+ 
+@@ -1668,7 +1666,6 @@ bingo:
+     script[nb] = '\0';
+     return script;
+ }
+-#endif
+ 
+ /**
+  * The main macro recursion loop.
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch b/meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
deleted file mode 100644
index 7ab49e9..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-Lua 'print' statement is not working properly inside of RPM 5
-
-The print statement should capture the output and send it to the script
-processing engine, and not display it directly to the screen.
-
-This patch is from: http://rpm5.org/cvs/patchset?cn=17671
-
-Upstream-Status: backport (patchset 17671 from rpm5.org)
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/CHANGES
-===================================================================
---- rpm-5.4.14.orig/CHANGES
-+++ rpm-5.4.14/CHANGES
-@@ -1,3 +1,4 @@
-+    - jbj: lua: fix: resurrect output capture with lua-5.2.
-     - jbj: verify: fix: broken logic for %ghost avoidance (Mark Hatle).
- 
- 5.4.13 -> 5.4.14:
-Index: rpm-5.4.14/rpmio/rpmlua.c
-===================================================================
---- rpm-5.4.14.orig/rpmio/rpmlua.c
-+++ rpm-5.4.14/rpmio/rpmlua.c
-@@ -175,7 +175,7 @@ rpmlua rpmluaNew(void)
-     };
-     /*@=readonlytrans =nullassign @*/
-     /*@observer@*/ /*@unchecked@*/
--    const luaL_Reg *lib = lualibs;
-+    const luaL_Reg *lib;
-     char *path_buf;
-     char *path_next;
-     char *path;
-@@ -190,31 +190,34 @@ rpmlua rpmluaNew(void)
- 
-     luaL_openlibs(L);
- 
--    for (; lib->name; lib++) {
-+    for (lib = lualibs; lib->name; lib++) {
- 	luaL_requiref(L, lib->name, lib->func, 1);
-+	lua_pop(L, 1);
-     }
- 
-     {	const char * _lua_path = rpmGetPath(rpmluaPath, NULL);
-  	if (_lua_path != NULL) {
-+#if defined(LUA_GLOBALSINDEX)
- 	    lua_pushliteral(L, "LUA_PATH");
- 	    lua_pushstring(L, _lua_path);
-+	    lua_rawset(L, LUA_GLOBALSINDEX);
-+#else
-+	    lua_pushstring(L, _lua_path);
-+	    lua_setglobal(L, "LUA_PATH");
-+#endif
- 	    _lua_path = _free(_lua_path);
- 	}
-     }
- 
- #if defined(LUA_GLOBALSINDEX)
--    lua_rawset(L, LUA_GLOBALSINDEX);
--#else
--    lua_pushglobaltable(L);
--#endif
-     lua_pushliteral(L, "print");
-     lua_pushcfunction(L, rpm_print);
--
--#if defined(LUA_GLOBALSINDEX)
-     lua_rawset(L, LUA_GLOBALSINDEX);
- #else
--    lua_pushglobaltable(L);
-+    lua_pushcfunction(L, rpm_print);
-+    lua_setglobal(L, "print");
- #endif
-+
-     rpmluaSetData(lua, "lua", lua);
- 
-     /* load all standard RPM Lua script files */
-@@ -351,6 +354,9 @@ void rpmluaSetVar(rpmlua _lua, rpmluav v
- #if defined(LUA_GLOBALSINDEX)
- 	if (lua->pushsize == 0)
- 	    lua_pushvalue(L, LUA_GLOBALSINDEX);
-+#else
-+	if (lua->pushsize == 0)
-+	    lua_pushglobaltable(L);
- #endif
- 	if (pushvar(L, var->keyType, &var->key) != -1) {
- 	    if (pushvar(L, var->valueType, &var->value) != -1)
-@@ -1039,14 +1045,15 @@ static int rpm_print (lua_State *L)
-     lua_getglobal(L, "tostring");
-     for (i = 1; i <= n; i++) {
- 	const char *s;
-+	size_t l;
- 	lua_pushvalue(L, -1);  /* function to be called */
- 	lua_pushvalue(L, i);   /* value to print */
- 	lua_call(L, 1, 1);
--	s = lua_tostring(L, -1);  /* get result */
-+	s = lua_tolstring(L, -1, &l);  /* get result */
- 	if (s == NULL)
- 	    return luaL_error(L, "`tostring' must return a string to `print'");
- 	if (lua->storeprint) {
--	    size_t sl = lua_rawlen(L, -1);
-+	    size_t sl = l;
- 	    if ((size_t)(lua->printbufused+sl+1) > lua->printbufsize) {
- 		lua->printbufsize += sl+512;
- 		lua->printbuf = (char *) xrealloc(lua->printbuf, lua->printbufsize);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch b/meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch
index 07a0cfa..a08412a 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch
@@ -12,16 +12,20 @@ it's easy enough to do by enabling the necessary macros.
 
 Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---- a/macros/macros.in
-+++ b/macros/macros.in
-@@ -546,8 +546,8 @@ $_arbitrary_tags_tests	Foo:Bar
+Index: rpm/macros/macros.in
+===================================================================
+--- rpm.orig/macros/macros.in
++++ rpm/macros/macros.in
+@@ -563,10 +563,10 @@ $_arbitrary_tags_tests	Foo:Bar
+ 
  # Horowitz Key Protocol server configuration
  #
+-%_hkp_keyserver         hkp://keys.rpm5.org
++#%_hkp_keyserver         hkp://keys.rpm5.org
  #%_hkp_keyserver         hkp://keys.n3npq.net
--%_hkp_keyserver         hkp://pool.sks-keyservers.net
+ #%_hkp_keyserver         hkp://pool.sks-keyservers.net
 -%_hkp_keyserver_query   %{_hkp_keyserver}/pks/lookup?op=get&search=
-+#%_hkp_keyserver         hkp://pool.sks-keyservers.net
 +#%_hkp_keyserver_query   %{_hkp_keyserver}/pks/lookup?op=get&search=
  
  
- %_nssdb_path	/etc/pki/nssdb
+ # NSS_InitContext() parameter configuration
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch b/meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
new file mode 100644
index 0000000..9e324e5
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
@@ -0,0 +1,69 @@
+Fix errors when building with sasl2 disabled
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm/rpmio/mongoc.c
+===================================================================
+--- rpm.orig/rpmio/mongoc.c
++++ rpm/rpmio/mongoc.c
+@@ -39,8 +39,10 @@
+ # include <winerror.h>
+ #endif
+ 
++#ifdef HAVE_LIBSASL2
+ #include <sasl/sasl.h>
+ #include <sasl/saslutil.h>
++#endif
+ 
+ #include <openssl/bio.h>
+ #include <openssl/ssl.h>
+@@ -14228,6 +14230,7 @@ mongoc_read_prefs_copy (const mongoc_rea
+    return ret;
+ }
+ 
++#ifdef MONGOC_ENABLE_SASL
+ /*==============================================================*/
+ /* --- mongoc-sasl.c */
+ 
+@@ -14555,6 +14558,7 @@ _mongoc_sasl_step (mongoc_sasl_t *sasl,
+ 
+    return true;
+ }
++#endif
+ 
+ /*==============================================================*/
+ /* --- mongoc-socket.c */
+Index: rpm/rpmio/mongoc.h
+===================================================================
+--- rpm.orig/rpmio/mongoc.h
++++ rpm/rpmio/mongoc.h
+@@ -38,8 +38,10 @@
+ # include <sys/un.h>
+ #endif
+ 
++#ifdef HAVE_LIBSASL2
+ #include <sasl/sasl.h>
+ #include <sasl/saslutil.h>
++#endif
+ 
+ #include <openssl/bio.h>
+ #include <openssl/ssl.h>
+@@ -2455,6 +2457,8 @@ BSON_END_DECLS
+ /*==============================================================*/
+ /* --- mongoc-sasl-private.h */
+ 
++#ifdef MONGOC_ENABLE_SASL
++
+ BSON_BEGIN_DECLS
+ 
+ 
+@@ -2498,6 +2502,7 @@ bool _mongoc_sasl_step             (mong
+ 
+ 
+ BSON_END_DECLS
++#endif
+ 
+ /*==============================================================*/
+ /* --- mongoc-ssl-private.h */
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch b/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
index 9cd02a0..47470d2 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
@@ -124,23 +124,3 @@ Index: rpm-5.4.14/build/files.c
      }
  
      ui32 = fl->totalFileSize;
-Index: rpm-5.4.14/lib/fsm.c
-===================================================================
---- rpm-5.4.14.orig/lib/fsm.c
-+++ rpm-5.4.14/lib/fsm.c
-@@ -904,6 +904,7 @@ int fsmMapAttrs(IOSM_t fsm)
- 
-     if (fi && i >= 0 && i < (int) fi->fc) {
- 	mode_t perms = (S_ISDIR(st->st_mode) ? fi->dperms : fi->fperms);
-+	ino_t finalInode = (fi->finodes ? (ino_t)fi->finodes[i] : 0);
- 	mode_t finalMode = (fi->fmodes ? (mode_t)fi->fmodes[i] : perms);
- 	dev_t finalRdev = (dev_t)(fi->frdevs ? fi->frdevs[i] : 0);
- 	rpmuint32_t finalMtime = (fi->fmtimes ? fi->fmtimes[i] : 0);
-@@ -943,6 +944,7 @@ int fsmMapAttrs(IOSM_t fsm)
- 	    if ((S_ISCHR(st->st_mode) || S_ISBLK(st->st_mode))
- 	    && st->st_nlink == 0)
- 		st->st_nlink = 1;
-+	    st->st_ino = finalInode;
- 	    st->st_rdev = finalRdev;
- 	    st->st_mtime = finalMtime;
- 	}
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch b/meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch
index 5d182ad..656de86 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch
@@ -9,14 +9,14 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.14/scripts/pkgconfigdeps.sh
+Index: rpm/scripts/pkgconfigdeps.sh
 ===================================================================
---- rpm-5.4.14.orig/scripts/pkgconfigdeps.sh
-+++ rpm-5.4.14/scripts/pkgconfigdeps.sh
+--- rpm.orig/scripts/pkgconfigdeps.sh
++++ rpm/scripts/pkgconfigdeps.sh
 @@ -18,8 +18,8 @@ case $1 in
      *.pc)
  	# Query the dependencies of the package.
- 	DIR=`dirname ${filename}`
+ 	DIR=$(dirname ${filename})
 -	PKG_CONFIG_PATH="$DIR:$DIR/../../share/pkgconfig"
 -	export PKG_CONFIG_PATH
 +	PKG_CONFIG_LIBDIR="$DIR:$DIR/../../share/pkgconfig"
@@ -27,7 +27,7 @@ Index: rpm-5.4.14/scripts/pkgconfigdeps.sh
 @@ -42,8 +42,8 @@ case $1 in
  	[ -n "$oneshot" ] && echo "$oneshot"; oneshot=""
  	# Query the dependencies of the package.
- 	DIR=`dirname ${filename}`
+ 	DIR=$(dirname ${filename})
 -	PKG_CONFIG_PATH="$DIR:$DIR/../../share/pkgconfig"
 -	export PKG_CONFIG_PATH
 +	PKG_CONFIG_LIBDIR="$DIR:$DIR/../../share/pkgconfig"
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch b/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
index 07d407d..92ef1dc 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
@@ -11,15 +11,17 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.14/python/rpmmodule.c
+Index: rpm/python/rpmmodule.c
 ===================================================================
---- rpm-5.4.14.orig/python/rpmmodule.c
-+++ rpm-5.4.14/python/rpmmodule.c
-@@ -392,7 +392,8 @@ void init_rpm(void)
-     if (Py_AtExit(rpm_exithook) == -1)
- 	return;
+--- rpm.orig/python/rpmmodule.c
++++ rpm/python/rpmmodule.c
+@@ -382,9 +382,8 @@ static int initModule(PyObject *m)
+     /* XXX add --noparentdirs --nolinktos to rpmtsCheck() */
+     global_depFlags = (RPMDEPS_FLAG_NOPARENTDIRS | RPMDEPS_FLAG_NOLINKTOS);
  
--    rpmReadConfigFiles(NULL, NULL);
+-    /* failure to initialize rpm (crypto and all) is rather fatal too... */
+-    if (rpmReadConfigFiles(NULL, NULL) == -1)
+-	return 0;
 +    const char *argv[1] = {"rpmmodule", 0};
 +    rpmcliInit(1, argv, NULL);
  
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch b/meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
new file mode 100644
index 0000000..e6aff52
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
@@ -0,0 +1,49 @@
+Fix an issue where the PACKAGEORIGIN is not properly stored.
+
+Restore the rpmtsCallback fdSetOpen call and related code.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm/python/rpmts-py.c
+===================================================================
+--- rpm.orig/python/rpmts-py.c
++++ rpm/python/rpmts-py.c
+@@ -672,6 +672,8 @@ rpmtsCallback(const void * hd, const rpm
+     Header h = (Header) hd;
+     struct rpmtsCallbackType_s * cbInfo = data;
+     PyObject * pkgObj = (PyObject *) pkgKey;
++    PyObject * oh = NULL;
++    const char * origin = NULL;
+     PyObject * args, * result;
+     static FD_t fd;
+ 
+@@ -693,8 +695,16 @@ rpmtsCallback(const void * hd, const rpm
+ 	    pkgObj = Py_None;
+ 	    Py_INCREF(pkgObj);
+ 	}
+-    } else
++    } else {
+ 	Py_INCREF(pkgObj);
++	/* XXX yum has (h, rpmloc) tuple as pkgKey. Extract the path. */
++	if (!(PyTuple_Check(pkgObj) && PyArg_ParseTuple(pkgObj, "|Os", &oh, &origin)))
++	    origin = NULL;
++	/* XXX clean up the path, yum paths start "//..." */
++	if (origin && origin[0] == '/' && origin[1] == '/')
++	    origin++;
++    }
++
+ 
+     PyEval_RestoreThread(cbInfo->_save);
+ 
+@@ -723,6 +733,9 @@ SPEW((stderr, "\t%p = fdDup(%d)\n", fd,
+ 
+ 	fcntl(Fileno(fd), F_SETFD, FD_CLOEXEC);
+ 
++	if (origin != NULL)
++	    (void) fdSetOpen(fd, origin, 0, 0);
++
+ 	return fd;
+     } else
+     if (what == RPMCALLBACK_INST_CLOSE_FILE) {
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch b/meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
deleted file mode 100644
index 769016b..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: rpm-5.4.14/syck/lib/syck.h
-===================================================================
---- rpm-5.4.14.orig/syck/lib/syck.h
-+++ rpm-5.4.14/syck/lib/syck.h
-@@ -621,9 +621,6 @@ long syck_seq_count( SyckNode *seq )
-  */
- void syckerror( char *msg )
- 	/*@*/;
--int syckparse( void * )
--	/*@globals fileSystem @*/
--	/*@modifies fileSystem @*/;
- /* XXX union YYSTYPE *sycklval has issues on Mac OS X. */
- int sycklex( void *_sycklval, SyckParser *parser )
- 	/*@modifies _sycklval, parser @*/;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch b/meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
new file mode 100644
index 0000000..71dae49
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
@@ -0,0 +1,124 @@
+Disable various items that do not cross compile well.
+
+Upstream-Status: Inappropriate [Configuration]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm/rpmdb/Makefile.am
+===================================================================
+--- rpm.orig/rpmdb/Makefile.am
++++ rpm/rpmdb/Makefile.am
+@@ -34,10 +34,10 @@ EXTRA_DIST = \
+ 	db3.c sqlite.c db_emu.h librpmdb.vers bdb.sql libsqldb.c \
+ 	logio.awk logio.src logio_recover_template logio_template logio.c \
+ 	logio_rec.c logio_auto.c logio_autop.c logio_auto.h \
+-	qf.l qf.y qf.inp tqf.l tqf.y tqf.inp grammar.y scanner.l json1.js
++	tqf.l tqf.y tqf.inp grammar.y scanner.l json1.js
+ 
+-EXTRA_PROGRAMS = qfcalc qfgraph logio tjfn tqf # tbdb
+-noinst_PROGRAMS = json
++EXTRA_PROGRAMS = qfcalc qfgraph logio # tjfn tqf tbdb
++noinst_PROGRAMS = # json
+ 
+ RPMMISC_LDADD_COMMON = \
+ 	$(top_builddir)/misc/librpmmisc.la \
+@@ -321,54 +321,39 @@ BUILT_SOURCES += .syntastic_c_config
+ .syntastic_c_config: Makefile
+ 	@echo $(COMPILE) | tr ' ' '\n' | sed -e '1d' > $@
+ 
+-tjfn_SOURCES = tjfn.c
+-tjfn_LDADD = $(mylibs)
+-
+-LEX =	flex
+-LFLAGS=	-d -T -v -8 -b --yylineno --reentrant --bison-bridge --perf-report
+-YACC =	bison
+-YFLAGS=	-Dapi.pure -t -d -v --report=all
+-
+-BUILT_SOURCES += Jgrammar.c Jgrammar.h Jscanner.c
+-Jgrammar.c: grammar.y
+-	$(YACC) $(YFLAGS) -o $@ $<
+-Jscanner.c: scanner.l
+-	$(LEX) -R -o $@ $<
+-json_SOURCES = Jgrammar.c Jscanner.c json.c
+-
+-testjson: json1.js json
+-	./json json1.js
+-
+-BUILT_SOURCES += Qgrammar.c Qgrammar.h Qscanner.c
+-Qgrammar.c: qf.y
+-	$(YACC) $(YFLAGS) -o $@ $<
+-Qscanner.c: qf.l
+-	$(LEX) -R -o $@ $<
+-qfcalc_SOURCES = Qgrammar.c Qscanner.c interpreter.c
+-qfgraph_SOURCES = Qgrammar.c Qscanner.c graph.c
+-
+-testqf: qfcalc qfgraph
+-	./qfcalc < qf.inp
+-	./qfgraph < qf.inp
+-
+-BUILT_SOURCES += Tgrammar.c Tgrammar.h Tscanner.c
+-Tgrammar.c Tgrammar.h: tqf.y
+-	$(YACC) $(YFLAGS) -o $@ $<
+-Tscanner.c Tscanner.h: tqf.l
+-	$(LEX) --prefix="Tyy" $(LFLAGS) -o $@ $<
+-tqf_SOURCES =	Tgrammar.c Tscanner.c tgraph.c
+-tqf_CFLAGS =	$(CFLAGS) -fsanitize=address # -DTSCANNER_MAIN
+-tqf_LDADD =	../lib/librpm.la \
+-		./librpmdb.la \
+-		../popt/libpopt.la
+-
+-testdir =	$(abs_top_builddir)/tests
+-foo: tqf
+-	-../libtool --mode=execute \
+-	    ./tqf \
+-		--dbpath=$(testdir) \
+-		-r $(testdir)/fodder/*.rpm \
+-		   $(testdir)/fodder/fmtmod.qf
++#tjfn_SOURCES = tjfn.c
++#tjfn_LDADD = $(mylibs)
++#
++#LFLAGS=	-d -T -v -8 -b --yylineno --reentrant --bison-bridge --perf-report
++#
++#BUILT_SOURCES += Jgrammar.c Jgrammar.h Jscanner.c
++#Jgrammar.c Jgrammar.h: grammar.y
++#	$(YACC) $(YFLAGS) -t -d -v -o $@ $<
++#Jscanner.c: scanner.l
++#	$(LEX) -R -o $@ $<
++#json_SOURCES = Jgrammar.c Jscanner.c json.c
++#
++#testjson: json1.js json
++#	./json json1.js
++#
++#BUILT_SOURCES += Tgrammar.c Tgrammar.h Tscanner.c
++#Tgrammar.c Tgrammar.h: tqf.y
++#	$(YACC) $(YFLAGS) -t -d -v -o $@ $<
++#Tscanner.c Tscanner.h: tqf.l
++#	$(LEX) --prefix="Tyy" $(LFLAGS) -o $@ $<
++#tqf_SOURCES =	Tgrammar.c Tscanner.c tgraph.c
++#tqf_CFLAGS =	$(CFLAGS) -fsanitize=address # -DTSCANNER_MAIN
++#tqf_LDADD =	../lib/librpm.la \
++#		./librpmdb.la \
++#		../popt/libpopt.la
++
++#testdir =	$(abs_top_builddir)/tests
++#foo: tqf
++#	-../libtool --mode=execute \
++#	    ./tqf \
++#		--dbpath=$(testdir) \
++#		-r $(testdir)/fodder/*.rpm \
++#		   $(testdir)/fodder/fmtmod.qf
+ 
+ #tbdb_SOURCES = tbdb.c bdb.c
+ #tbdb_LDADD = $(mylibs)
+Index: rpm/configure.ac
+===================================================================
+--- rpm.orig/configure.ac
++++ rpm/configure.ac
+@@ -119,6 +119,7 @@ AC_PROG_MAKE_SET
+ AC_PROG_LIBTOOL
+ AC_PROG_RANLIB
+ AC_PROG_YACC
++AM_PROG_LEX
+ 
+ AC_PATH_PROG(AS, as, as)
+ 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch b/meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
new file mode 100644
index 0000000..49cdfca
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
@@ -0,0 +1,19 @@
+Fix a typo in the rpmio Makefile.am
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm/rpmio/Makefile.am
+===================================================================
+--- rpm.orig/rpmio/Makefile.am
++++ rpm/rpmio/Makefile.am
+@@ -121,7 +121,7 @@ luaLPATHdir =	${pkgsharedir)/lua
+ 
+ pkgincdir = $(pkgincludedir)$(WITH_PATH_VERSIONED_SUFFIX)
+ pkginc_HEADERS = argv.h mire.h rpmzlog.h yarn.h \
+-	rpmbf.h rpmcb.h rpmio.h rpmlog.h rpmiotypes.h rpmmacro.h
++	rpmbf.h rpmcb.h rpmio.h rpmlog.h rpmiotypes.h rpmmacro.h \
+ 	rpmpgp.h rpmsw.h rpmutil.h
+ noinst_HEADERS = \
+ 	ar.h bcon.h bson.h cpio.h crc.h envvar.h fnmatch.h fts.h glob.h iosm.h \
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
deleted file mode 100644
index d8feed7..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-rpmpgp.c: Add missing if defs around crypto implementations
-
-Without these, the system will error trying to find the correct crypto 
-library to use.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm/rpmio/rpmpgp.c
-===================================================================
---- rpm.orig/rpmio/rpmpgp.c
-+++ rpm/rpmio/rpmpgp.c
-@@ -1339,16 +1339,26 @@ int pgpExportPubkey(pgpDig dig)
- {
-     int rc = 0;		/* assume failure */
- 
-+#if defined(WITH_BEECRYPT)
-     if (pgpImplVecs == &rpmbcImplVecs)
- 	rc = rpmbcExportPubkey(dig);
-+#endif
-+#if defined(WITH_SSL)
-     if (pgpImplVecs == &rpmsslImplVecs)
- 	rc = rpmsslExportPubkey(dig);
-+#endif
-+#if defined(WITH_NSS)
-     if (pgpImplVecs == &rpmnssImplVecs)
- 	rc = rpmnssExportPubkey(dig);
-+#endif
-+#if defined(WITH_GCRYPT)
-     if (pgpImplVecs == &rpmgcImplVecs)
- 	rc = rpmgcExportPubkey(dig);
-+#endif
-+#if defined(WITH_TOMCRYPT)
-     if (pgpImplVecs == &rpmltcImplVecs)
- 	rc = rpmltcExportPubkey(dig);
-+#endif
-     return rc;
- }
- 
-@@ -1356,16 +1366,26 @@ int pgpExportSignature(pgpDig dig, DIGES
- {
-     int rc = 0;		/* assume failure */
- 
-+#if defined(WITH_BEECRYPT)
-     if (pgpImplVecs == &rpmbcImplVecs)
- 	rc = rpmbcExportSignature(dig, ctx);
-+#endif
-+#if defined(WITH_SSL)
-     if (pgpImplVecs == &rpmsslImplVecs)
- 	rc = rpmsslExportSignature(dig, ctx);
-+#endif
-+#if defined(WITH_NSS)
-     if (pgpImplVecs == &rpmnssImplVecs)
- 	rc = rpmnssExportSignature(dig, ctx);
-+#endif
-+#if defined(WITH_GCRYPT)
-     if (pgpImplVecs == &rpmgcImplVecs)
- 	rc = rpmgcExportSignature(dig, ctx);
-+#endif
-+#if defined(WITH_TOMCRYPT)
-     if (pgpImplVecs == &rpmltcImplVecs)
- 	rc = rpmltcExportSignature(dig, ctx);
-+#endif
-     return rc;
- }
- 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
index f825372..b55fe22 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
@@ -12,22 +12,21 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.14/lib/psm.c
+Index: rpm/lib/psm.c
 ===================================================================
---- rpm-5.4.14.orig/lib/psm.c
-+++ rpm-5.4.14/lib/psm.c
-@@ -806,6 +806,10 @@ static rpmRC runScript(rpmpsm psm, Heade
+--- rpm.orig/lib/psm.c
++++ rpm/lib/psm.c
+@@ -846,6 +846,9 @@ static rpmRC runScript(rpmpsm psm, Heade
+     pid_t pid;
      int xx;
      int i;
- 
 +#ifdef RPM_VENDOR_OE
 +    const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
 +#endif
-+    
-     if (psm->sstates != NULL && ix >= 0 && ix < RPMSCRIPT_MAX)
- 	ssp = psm->sstates + ix;
-     if (ssp != NULL)
-@@ -872,14 +876,29 @@ assert(he->p.str != NULL);
+ 
+ #ifdef	__clang__
+ #pragma clang diagnostic push
+@@ -923,14 +926,29 @@ assert(he->p.str != NULL);
  		(F_ISSET(psm, UNORDERED) ? "a" : ""));
  
      if (Phe->p.argv == NULL) {
@@ -63,7 +62,7 @@ Index: rpm-5.4.14/lib/psm.c
  	ldconfig_done = (ldconfig_path && !strcmp(argv[0], ldconfig_path)
  		? 1 : 0);
      }
-@@ -930,7 +949,12 @@ assert(he->p.str != NULL);
+@@ -981,7 +999,12 @@ assert(he->p.str != NULL);
  	    goto exit;
  
  	if (rpmIsDebug() &&
@@ -77,7 +76,7 @@ Index: rpm-5.4.14/lib/psm.c
  	{
  	    static const char set_x[] = "set -x\n";
  	    nw = Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
-@@ -1065,12 +1089,22 @@ assert(he->p.str != NULL);
+@@ -1116,12 +1139,22 @@ assert(he->p.str != NULL);
  
  	{   const char * rootDir = rpmtsRootDir(ts);
  	    if (!rpmtsChrootDone(ts) && rootDir != NULL &&
@@ -100,7 +99,7 @@ Index: rpm-5.4.14/lib/psm.c
  	    xx = Chdir("/");
  	    rpmlog(RPMLOG_DEBUG, D_("%s: %s(%s)\texecv(%s) pid %d\n"),
  			psm->stepName, sln, NVRA,
-@@ -2985,6 +3019,13 @@ assert(psm->te != NULL);
+@@ -3052,6 +3085,13 @@ assert(psm->te != NULL);
      case PSM_SCRIPT:	/* Run current package scriptlets. */
  	/* XXX running %verifyscript/%sanitycheck doesn't have psm->te */
      {	rpmtxn _parent = (psm && psm->te ? psm->te->txn : NULL);
@@ -114,7 +113,7 @@ Index: rpm-5.4.14/lib/psm.c
  	xx = rpmtxnBegin(rpmtsGetRdb(ts), _parent, NULL);
  	rc = runInstScript(psm);
  	if (rc)
-@@ -2992,11 +3033,24 @@ assert(psm->te != NULL);
+@@ -3059,11 +3099,24 @@ assert(psm->te != NULL);
  	else
  	     xx = rpmtxnCommit(rpmtsGetRdb(ts)->db_txn);
  	rpmtsGetRdb(ts)->db_txn = NULL;
@@ -139,7 +138,7 @@ Index: rpm-5.4.14/lib/psm.c
  	break;
      case PSM_IMMED_TRIGGERS:
  	/* Run triggers in this package other package(s) set off. */
-@@ -3006,7 +3060,18 @@ assert(psm->te != NULL);
+@@ -3073,7 +3126,18 @@ assert(psm->te != NULL);
  	    F_SET(psm, GOTTRIGGERS);
  	}
  	if (psm->triggers != NULL)
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch b/meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
new file mode 100644
index 0000000..d6493c1
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
@@ -0,0 +1,1081 @@
+Fix the syck/lib/gram.y
+
+This resolves a problem during compilation:
+
+../../../rpm/syck/lib/gram.y:66:27: error: 'parser' undeclared (first use in this function)
+            ((SyckParser *)parser)->root = syck_hdlr_add_node( (SyckParser *)parser, $1 );
+                           ^
+../../../rpm/syck/lib/gram.y:66:27: note: each undeclared identifier is reported only once for each function it appears in
+../../../rpm/syck/lib/syck.c: In function 'syck_parse':
+../../../rpm/syck/lib/syck.c:516:5: warning: implicit declaration of function 'syckparse' [-Wimplicit-function-declaration]
+     syckparse( p );
+     ^
+
+This patch was generated by reverting the grammer back to a previous
+version.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm/syck/lib/gram.y
+===================================================================
+--- rpm.orig/syck/lib/gram.y
++++ rpm/syck/lib/gram.y
+@@ -9,18 +9,10 @@
+ 
+ %start doc
+ %pure-parser
+-%parse-param {void* parser}
+-%lex-param {void* parser}
+ 
+ 
+ %{
+ 
+-#define YYDEBUG 1
+-#define YYERROR_VERBOSE 1
+-#ifndef YYSTACK_USE_ALLOCA
+-#define YYSTACK_USE_ALLOCA 0
+-#endif
+-
+ #include "system.h"
+ #include "syck.h"
+ #include "debug.h"
+@@ -28,6 +20,9 @@
+ void apply_seq_in_map( SyckParser *parser, SyckNode *n )
+ 	/*@*/;
+ 
++#define YYPARSE_PARAM   parser
++#define YYLEX_PARAM     parser
++
+ #define NULL_NODE(parser, node) \
+         SyckNode *node = syck_new_str( "", scalar_plain ); \
+         if ( ((SyckParser *)parser)->taguri_expansion == 1 ) \
+Index: rpm/syck/lib/Makefile.am
+===================================================================
+--- rpm.orig/syck/lib/Makefile.am
++++ rpm/syck/lib/Makefile.am
+@@ -49,25 +49,25 @@ SYCK_SPLINT_SRCS = \
+ 	token.c \
+ 	implicit.c
+ 
+-#gram.c:	gram.y
+-#	$(YACC) -d -t -v -p syck -o $@ $<
+-#	-@if test -f gram.c; then \
+-#	{ echo "/*@-globs -mods -modnomods -moduncon -modunconnomods @*/";\
+-#	  echo "/*@-noeffect -noeffectuncon @*/";\
+-#	  echo "/*@-nullassign @*/";\
+-#	  echo "/*@-readonlytrans @*/";\
+-#	  echo "/*@-uniondef @*/";\
+-#	  echo "/*@-warnlintcomments @*/";\
+-#	  cat gram.c;\
+-#	  echo "/*@=warnlintcomments @*/";\
+-#	  echo "/*@=uniondef @*/";\
+-#	  echo "/*@=readonlytrans @*/";\
+-#	  echo "/*@=nullassign @*/";\
+-#	  echo "/*@=noeffect =noeffectuncon @*/";\
+-#	  echo "/*@=globs =mods =modnomods =moduncon =modunconnomods @*/";\
+-#	} > _gram.c ;\
+-#	  mv -f _gram.c gram.c; \
+-#	fi
++gram.c:	gram.y
++	$(YACC) -d -t -v -p syck -o $@ $<
++	-@if test -f gram.c; then \
++	{ echo "/*@-globs -mods -modnomods -moduncon -modunconnomods @*/";\
++	  echo "/*@-noeffect -noeffectuncon @*/";\
++	  echo "/*@-nullassign @*/";\
++	  echo "/*@-readonlytrans @*/";\
++	  echo "/*@-uniondef @*/";\
++	  echo "/*@-warnlintcomments @*/";\
++	  cat gram.c;\
++	  echo "/*@=warnlintcomments @*/";\
++	  echo "/*@=uniondef @*/";\
++	  echo "/*@=readonlytrans @*/";\
++	  echo "/*@=nullassign @*/";\
++	  echo "/*@=noeffect =noeffectuncon @*/";\
++	  echo "/*@=globs =mods =modnomods =moduncon =modunconnomods @*/";\
++	} > _gram.c ;\
++	  mv -f _gram.c gram.c; \
++	fi
+ 
+ BUILT_SOURCES = gram.c gram.h
+ 
+Index: rpm/syck/lib/implicit.c
+===================================================================
+--- rpm.orig/syck/lib/implicit.c
++++ rpm/syck/lib/implicit.c
+@@ -19,11 +19,6 @@
+ #define YYLIMIT     limit
+ #define YYFILL(n)
+ 
+-#ifdef  __clang__
+-#pragma clang diagnostic push
+-#pragma clang diagnostic ignored "-Wempty-body"
+-#endif
+-
+ void
+ try_tag_implicit( SyckNode *n, int taguri )
+ {
+@@ -3000,8 +2995,4 @@ yy270:	++YYCURSOR;
+ 
+ }
+ 
+-#ifdef  __clang__
+-#pragma clang diagnostic pop
+-#endif
+-
+ /*@=noret@*/
+Index: rpm/syck/lib/syck.c
+===================================================================
+--- rpm.orig/syck/lib/syck.c
++++ rpm/syck/lib/syck.c
+@@ -519,7 +519,7 @@ syck_parse( SyckParser *p )
+ }
+ 
+ void
+-syck_default_error_handler( SyckParser *p, const char *msg )
++syck_default_error_handler( SyckParser *p, char *msg )
+ {
+     printf( "Error at [Line %d, Col %ld]: %s\n", 
+         p->linect,
+Index: rpm/syck/lib/syck.h
+===================================================================
+--- rpm.orig/syck/lib/syck.h
++++ rpm/syck/lib/syck.h
+@@ -175,7 +175,7 @@ typedef struct _syck_str SyckIoStr;
+ typedef struct _syck_level SyckLevel;
+ 
+ typedef SYMID (*SyckNodeHandler)(SyckParser *p, SyckNode *n);
+-typedef void (*SyckErrorHandler)(SyckParser *p, const char *);
++typedef void (*SyckErrorHandler)(SyckParser *p, char *);
+ typedef SyckNode * (*SyckBadAnchorHandler)(SyckParser *p, char *);
+ typedef long (*SyckIoFileRead)(char *, SyckIoFile *, long, long); 
+ typedef long (*SyckIoStrRead)(char *, SyckIoStr *, long, long);
+@@ -546,7 +546,7 @@ long syck_parser_readlen( SyckParser *p,
+ SYMID syck_parse( SyckParser *p )
+ 	/*@globals fileSystem @*/
+ 	/*@modifies p, fileSystem @*/;
+-void syck_default_error_handler( SyckParser *p, const char * )
++void syck_default_error_handler( SyckParser *p, char * )
+ 	/*@globals fileSystem @*/
+ 	/*@modifies p, fileSystem @*/;
+ SYMID syck_yaml2byte_handler( SyckParser *p, SyckNode *n )
+@@ -619,7 +619,7 @@ long syck_seq_count( SyckNode *seq )
+ /*
+  * Lexer prototypes
+  */
+-void syckerror( void *, const char *msg )
++void syckerror( char *msg )
+ 	/*@*/;
+ /* XXX union YYSTYPE *sycklval has issues on Mac OS X. */
+ int sycklex( void *_sycklval, SyckParser *parser )
+Index: rpm/syck/lib/token.c
+===================================================================
+--- rpm.orig/syck/lib/token.c
++++ rpm/syck/lib/token.c
+@@ -270,11 +270,11 @@ sycklex( void * _sycklval, SyckParser *p
+         return sycklex_yaml_utf8( sycklval, parser );
+ 
+         case syck_yaml_utf16:
+-            syckerror( parser, "UTF-16 is not currently supported in Syck.\nPlease contribute code to help this happen!" );
++            syckerror( "UTF-16 is not currently supported in Syck.\nPlease contribute code to help this happen!" );
+         break;
+ 
+         case syck_yaml_utf32:
+-            syckerror( parser, "UTF-32 is not currently supported in Syck.\nPlease contribute code to help this happen!" );
++            syckerror( "UTF-32 is not currently supported in Syck.\nPlease contribute code to help this happen!" );
+         break;
+ 
+         case syck_bytecode_utf8:
+@@ -2739,15 +2739,14 @@ syckwrap(void)
+ }
+ 
+ void 
+-syckerror( void *p, const char *msg )
++syckerror( char *msg )
+ {
+-    SyckParser * parser = (SyckParser *)p;
+ /*@-mods@*/
+-    if ( parser->error_handler == NULL )
+-        parser->error_handler = syck_default_error_handler;
++    if ( syck_parser_ptr->error_handler == NULL )
++        syck_parser_ptr->error_handler = syck_default_error_handler;
+ 
+-    parser->root = parser->root_on_error;
++    syck_parser_ptr->root = syck_parser_ptr->root_on_error;
+ /*@=mods@*/
+-    (parser->error_handler)(parser, msg);
++    (syck_parser_ptr->error_handler)(syck_parser_ptr, msg);
+ }
+ 
+Index: rpm/syck/lib/bytecode.c
+===================================================================
+--- rpm.orig/syck/lib/bytecode.c
++++ rpm/syck/lib/bytecode.c
+@@ -1,10 +1,10 @@
+-/* Generated by re2c 0.9.12 on Tue Mar 14 00:14:53 2006 */
++/* Generated by re2c 0.13.5 on Tue Feb 23 12:04:00 2016 */
+ #line 1 "bytecode.re"
+ /*
+  * bytecode.re
+  *
+  * $Author: why $
+- * $Date: 2005-09-20 08:21:06 +0300 (Tue, 20 Sep 2005) $
++ * $Date: 2005/09/20 05:21:06 $
+  *
+  * Copyright (C) 2003 why the lucky stiff
+  */
+@@ -27,14 +27,11 @@
+ #define YYLINEPTR   parser->lineptr
+ #define YYLINECTPTR parser->linectptr
+ #define YYLINE      parser->linect
+-#define YYFILL(n)   (void) syck_parser_read(parser)
++#define YYFILL(n)   syck_parser_read(parser)
+ 
+-/*@unchecked@*/ /*@null@*/
+ extern SyckParser *syck_parser_ptr;
+ 
+-/*@null@*/
+-char *get_inline( SyckParser *parser )
+-	/*@modifies parser @*/;
++char *get_inline( SyckParser *parser );
+ 
+ /*
+  * Repositions the cursor at `n' offset from the token start.
+@@ -137,14 +134,12 @@ char *get_inline( SyckParser *parser )
+  */
+ int
+ sycklex_bytecode_utf8( YYSTYPE *sycklval, SyckParser *parser )
+-	/*@globals syck_parser_ptr @*/
+-	/*@modifies sycklval, parser, syck_parser_ptr @*/
+ {
+     SyckLevel *lvl;
+     syck_parser_ptr = parser;
+     if ( YYCURSOR == NULL ) 
+     {
+-        (void) syck_parser_read( parser );
++        syck_parser_read( parser );
+     }
+ 
+     if ( parser->force_token != 0 )
+@@ -171,42 +166,37 @@ sycklex_bytecode_utf8( YYSTYPE *sycklval
+ #line 165 "<stdout>"
+ {
+ 	YYCTYPE yych;
+-	unsigned int yyaccept = 0;
+-	goto yy0;
+-	/*@notreached@*/
+-	++YYCURSOR;
+-yy0:
+-	if((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
++
++	if ((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
+ 	yych = *YYCURSOR;
+-	switch(yych){
++	switch (yych) {
+ 	case 0x00:	goto yy2;
+ 	case 'D':	goto yy3;
+ 	default:	goto yy5;
+ 	}
+-yy2:	YYCURSOR = YYMARKER;
+-	switch(yyaccept){
+-	case 0:	goto yy4;
+-	}
+-yy3:	yyaccept = 0;
++yy2:
++	YYCURSOR = YYMARKER;
++	goto yy4;
++yy3:
+ 	yych = *(YYMARKER = ++YYCURSOR);
+-	switch(yych){
+-	case 0x0A:	goto yy6;
+-	case 0x0D:	goto yy8;
++	switch (yych) {
++	case '\n':	goto yy6;
++	case '\r':	goto yy8;
+ 	default:	goto yy4;
+ 	}
+ yy4:
+ #line 199 "bytecode.re"
+-{   YYPOS(0);
++	{   YYPOS(0);
+             goto Document;
+         }
+-#line 195 "<stdout>"
+-yy5:	yych = *++YYCURSOR;
++#line 191 "<stdout>"
++yy5:
++	yych = *++YYCURSOR;
+ 	goto yy4;
+-yy6:	++YYCURSOR;
+-	goto yy7;
+-yy7:
++yy6:
++	++YYCURSOR;
+ #line 186 "bytecode.re"
+-{   if ( lvl->status == syck_lvl_header )
++	{   if ( lvl->status == syck_lvl_header )
+             {
+                 CHK_NL(YYCURSOR);
+                 goto Directive;
+@@ -218,10 +208,11 @@ yy7:
+                 return 0;
+             }
+         }
+-#line 214 "<stdout>"
+-yy8:	++YYCURSOR;
+-	switch((yych = *YYCURSOR)) {
+-	case 0x0A:	goto yy6;
++#line 210 "<stdout>"
++yy8:
++	++YYCURSOR;
++	switch ((yych = *YYCURSOR)) {
++	case '\n':	goto yy6;
+ 	default:	goto yy2;
+ 	}
+ }
+@@ -239,19 +230,15 @@ Document:
+         YYTOKEN = YYCURSOR;
+ 
+ 
+-#line 235 "<stdout>"
++#line 232 "<stdout>"
+ {
+ 	YYCTYPE yych;
+-	goto yy9;
+-	/*@notreached@*/
+-	++YYCURSOR;
+-yy9:
+-	if((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
++	if ((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
+ 	yych = *YYCURSOR;
+-	switch(yych){
++	switch (yych) {
+ 	case 0x00:	goto yy30;
+-	case 0x0A:	goto yy27;
+-	case 0x0D:	goto yy29;
++	case '\n':	goto yy27;
++	case '\r':	goto yy29;
+ 	case 'A':	goto yy19;
+ 	case 'D':	goto yy12;
+ 	case 'E':	goto yy16;
+@@ -264,71 +251,73 @@ yy9:
+ 	case 'c':	goto yy25;
+ 	default:	goto yy11;
+ 	}
+-yy11:yy12:	yych = *++YYCURSOR;
+-	switch(yych){
+-	case 0x0A:	goto yy41;
+-	case 0x0D:	goto yy44;
++yy11:
++yy12:
++	yych = *++YYCURSOR;
++	switch (yych) {
++	case '\n':	goto yy41;
++	case '\r':	goto yy44;
+ 	default:	goto yy11;
+ 	}
+-yy13:	yych = *++YYCURSOR;
+-	switch(yych){
+-	case 0x0A:	goto yy41;
+-	case 0x0D:	goto yy43;
++yy13:
++	yych = *++YYCURSOR;
++	switch (yych) {
++	case '\n':	goto yy41;
++	case '\r':	goto yy43;
+ 	default:	goto yy11;
+ 	}
+-yy14:	yych = *++YYCURSOR;
+-	switch(yych){
+-	case 0x0A:	goto yy38;
+-	case 0x0D:	goto yy40;
++yy14:
++	yych = *++YYCURSOR;
++	switch (yych) {
++	case '\n':	goto yy38;
++	case '\r':	goto yy40;
+ 	default:	goto yy11;
+ 	}
+-yy15:	yych = *++YYCURSOR;
+-	switch(yych){
+-	case 0x0A:	goto yy35;
+-	case 0x0D:	goto yy37;
++yy15:
++	yych = *++YYCURSOR;
++	switch (yych) {
++	case '\n':	goto yy35;
++	case '\r':	goto yy37;
+ 	default:	goto yy11;
+ 	}
+-yy16:	yych = *++YYCURSOR;
+-	switch(yych){
+-	case 0x0A:	goto yy32;
+-	case 0x0D:	goto yy34;
++yy16:
++	yych = *++YYCURSOR;
++	switch (yych) {
++	case '\n':	goto yy32;
++	case '\r':	goto yy34;
+ 	default:	goto yy11;
+ 	}
+-yy17:	++YYCURSOR;
+-	goto yy18;
+-yy18:
++yy17:
++	++YYCURSOR;
+ #line 288 "bytecode.re"
+-{   ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_str); 
++	{   ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_str); 
+             goto Scalar;
+         }
+-#line 296 "<stdout>"
+-yy19:	++YYCURSOR;
+-	goto yy20;
+-yy20:
++#line 295 "<stdout>"
++yy19:
++	++YYCURSOR;
+ #line 292 "bytecode.re"
+-{   ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_open);
++	{   ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_open);
+             sycklval->name = get_inline( parser );
+             syck_hdlr_remove_anchor( parser, sycklval->name );
+             CHK_NL(YYCURSOR);
+             return YAML_ANCHOR;
+         }
+-#line 307 "<stdout>"
+-yy21:	++YYCURSOR;
+-	goto yy22;
+-yy22:
++#line 305 "<stdout>"
++yy21:
++	++YYCURSOR;
+ #line 299 "bytecode.re"
+-{   ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_str);
++	{   ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_str);
+             sycklval->name = get_inline( parser );
+             POP_LEVEL();
+             if ( *( YYCURSOR - 1 ) == '\n' ) YYCURSOR--;
+             return YAML_ALIAS;
+         }
+-#line 318 "<stdout>"
+-yy23:	++YYCURSOR;
+-	goto yy24;
+-yy24:
++#line 315 "<stdout>"
++yy23:
++	++YYCURSOR;
+ #line 306 "bytecode.re"
+-{   char *qstr;
++	{   char *qstr;
+             ADD_BYTE_LEVEL(lvl, lvl->spaces + 1, syck_lvl_open);
+             qstr = get_inline( parser );
+             CHK_NL(YYCURSOR);
+@@ -387,18 +376,16 @@ yy24:
+             sycklval->name = qstr;
+             return YAML_TAGURI;
+         }
+-#line 382 "<stdout>"
+-yy25:	++YYCURSOR;
+-	goto yy26;
+-yy26:
++#line 378 "<stdout>"
++yy25:
++	++YYCURSOR;
+ #line 366 "bytecode.re"
+-{   goto Comment; }
+-#line 388 "<stdout>"
+-yy27:	++YYCURSOR;
+-	goto yy28;
+-yy28:
++	{   goto Comment; }
++#line 383 "<stdout>"
++yy27:
++	++YYCURSOR;
+ #line 368 "bytecode.re"
+-{   CHK_NL(YYCURSOR);
++	{   CHK_NL(YYCURSOR);
+             if ( lvl->status == syck_lvl_seq )
+             {
+                 return YAML_INDENT; 
+@@ -410,26 +397,25 @@ yy28:
+             }
+             goto Document;
+         }
+-#line 405 "<stdout>"
+-yy29:	yych = *++YYCURSOR;
+-	switch(yych){
+-	case 0x0A:	goto yy27;
++#line 399 "<stdout>"
++yy29:
++	yych = *++YYCURSOR;
++	switch (yych) {
++	case '\n':	goto yy27;
+ 	default:	goto yy11;
+ 	}
+-yy30:	++YYCURSOR;
+-	goto yy31;
+-yy31:
++yy30:
++	++YYCURSOR;
+ #line 381 "bytecode.re"
+-{   ENSURE_YAML_IEND(lvl, -1);
++	{   ENSURE_YAML_IEND(lvl, -1);
+             YYPOS(0);
+             return 0;
+         }
+-#line 419 "<stdout>"
+-yy32:	++YYCURSOR;
+-	goto yy33;
+-yy33:
++#line 413 "<stdout>"
++yy32:
++	++YYCURSOR;
+ #line 252 "bytecode.re"
+-{   if ( lvl->status == syck_lvl_seq && lvl->ncount == 0 )
++	{   if ( lvl->status == syck_lvl_seq && lvl->ncount == 0 )
+             {
+                 lvl->ncount++;
+                 YYPOS(0);
+@@ -464,17 +450,17 @@ yy33:
+             CHK_NL(YYCURSOR);
+             return YAML_IEND;
+         }
+-#line 459 "<stdout>"
+-yy34:	yych = *++YYCURSOR;
+-	switch(yych){
+-	case 0x0A:	goto yy32;
++#line 452 "<stdout>"
++yy34:
++	yych = *++YYCURSOR;
++	switch (yych) {
++	case '\n':	goto yy32;
+ 	default:	goto yy11;
+ 	}
+-yy35:	++YYCURSOR;
+-	goto yy36;
+-yy36:
++yy35:
++	++YYCURSOR;
+ #line 237 "bytecode.re"
+-{   int complex = 0;
++	{   int complex = 0;
+             if ( lvl->ncount % 2 == 0 && ( lvl->status == syck_lvl_map || lvl->status == syck_lvl_seq ) )
+             {
+                 complex = 1;
+@@ -488,17 +474,17 @@ yy36:
+             }
+             return YAML_IOPEN;
+         }
+-#line 483 "<stdout>"
+-yy37:	yych = *++YYCURSOR;
+-	switch(yych){
+-	case 0x0A:	goto yy35;
++#line 476 "<stdout>"
++yy37:
++	yych = *++YYCURSOR;
++	switch (yych) {
++	case '\n':	goto yy35;
+ 	default:	goto yy11;
+ 	}
+-yy38:	++YYCURSOR;
+-	goto yy39;
+-yy39:
++yy38:
++	++YYCURSOR;
+ #line 222 "bytecode.re"
+-{   int complex = 0;
++	{   int complex = 0;
+             if ( lvl->ncount % 2 == 0 && ( lvl->status == syck_lvl_map || lvl->status == syck_lvl_seq ) )
+             {
+                 complex = 1;
+@@ -512,29 +498,31 @@ yy39:
+             }
+             return YAML_IOPEN;
+         }
+-#line 507 "<stdout>"
+-yy40:	yych = *++YYCURSOR;
+-	switch(yych){
+-	case 0x0A:	goto yy38;
++#line 500 "<stdout>"
++yy40:
++	yych = *++YYCURSOR;
++	switch (yych) {
++	case '\n':	goto yy38;
+ 	default:	goto yy11;
+ 	}
+-yy41:	++YYCURSOR;
+-	goto yy42;
+-yy42:
++yy41:
++	++YYCURSOR;
+ #line 217 "bytecode.re"
+-{   ENSURE_YAML_IEND(lvl, -1);
++	{   ENSURE_YAML_IEND(lvl, -1);
+                 YYPOS(0);
+                 return 0;
+             }
+-#line 521 "<stdout>"
+-yy43:	yych = *++YYCURSOR;
+-	switch(yych){
+-	case 0x0A:	goto yy41;
++#line 514 "<stdout>"
++yy43:
++	yych = *++YYCURSOR;
++	switch (yych) {
++	case '\n':	goto yy41;
+ 	default:	goto yy11;
+ 	}
+-yy44:	++YYCURSOR;
+-	switch((yych = *YYCURSOR)) {
+-	case 0x0A:	goto yy41;
++yy44:
++	++YYCURSOR;
++	switch ((yych = *YYCURSOR)) {
++	case '\n':	goto yy41;
+ 	default:	goto yy11;
+ 	}
+ }
+@@ -548,28 +536,22 @@ Directive:
+         YYTOKEN = YYCURSOR;
+ 
+ 
+-#line 543 "<stdout>"
++#line 538 "<stdout>"
+ {
+ 	YYCTYPE yych;
+-	unsigned int yyaccept = 0;
+-	goto yy45;
+-	/*@notreached@*/
+-	++YYCURSOR;
+-yy45:
+-	if((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
++	if ((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
+ 	yych = *YYCURSOR;
+-	switch(yych){
++	switch (yych) {
+ 	case 0x00:	goto yy47;
+ 	case 'V':	goto yy48;
+ 	default:	goto yy50;
+ 	}
+-yy47:	YYCURSOR = YYMARKER;
+-	switch(yyaccept){
+-	case 0:	goto yy49;
+-	}
+-yy48:	yyaccept = 0;
++yy47:
++	YYCURSOR = YYMARKER;
++	goto yy49;
++yy48:
+ 	yych = *(YYMARKER = ++YYCURSOR);
+-	switch(yych){
++	switch (yych) {
+ 	case '.':
+ 	case '/':
+ 	case '0':
+@@ -619,7 +601,8 @@ yy48:	yyaccept = 0;
+ 	case '\\':
+ 	case ']':
+ 	case '^':
+-	case '_':	case 'a':
++	case '_':
++	case 'a':
+ 	case 'b':
+ 	case 'c':
+ 	case 'd':
+@@ -649,17 +632,18 @@ yy48:	yyaccept = 0;
+ 	}
+ yy49:
+ #line 399 "bytecode.re"
+-{   YYCURSOR = YYTOKEN;
++	{   YYCURSOR = YYTOKEN;
+                return YAML_DOCSEP;
+            }
+-#line 646 "<stdout>"
+-yy50:	yych = *++YYCURSOR;
++#line 637 "<stdout>"
++yy50:
++	yych = *++YYCURSOR;
+ 	goto yy49;
+-yy51:	++YYCURSOR;
+-	if((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
++yy51:
++	++YYCURSOR;
++	if ((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
+ 	yych = *YYCURSOR;
+-	goto yy52;
+-yy52:	switch(yych){
++	switch (yych) {
+ 	case '.':
+ 	case '/':
+ 	case '0':
+@@ -671,7 +655,8 @@ yy52:	switch(yych){
+ 	case '6':
+ 	case '7':
+ 	case '8':
+-	case '9':	case ';':
++	case '9':
++	case ';':
+ 	case '<':
+ 	case '=':
+ 	case '>':
+@@ -707,7 +692,8 @@ yy52:	switch(yych){
+ 	case '\\':
+ 	case ']':
+ 	case '^':
+-	case '_':	case 'a':
++	case '_':
++	case 'a':
+ 	case 'b':
+ 	case 'c':
+ 	case 'd':
+@@ -736,8 +722,9 @@ yy52:	switch(yych){
+ 	case ':':	goto yy53;
+ 	default:	goto yy47;
+ 	}
+-yy53:	yych = *++YYCURSOR;
+-	switch(yych){
++yy53:
++	yych = *++YYCURSOR;
++	switch (yych) {
+ 	case '.':
+ 	case '/':
+ 	case '0':
+@@ -787,7 +774,8 @@ yy53:	yych = *++YYCURSOR;
+ 	case '\\':
+ 	case ']':
+ 	case '^':
+-	case '_':	case 'a':
++	case '_':
++	case 'a':
+ 	case 'b':
+ 	case 'c':
+ 	case 'd':
+@@ -815,13 +803,13 @@ yy53:	yych = *++YYCURSOR;
+ 	case 'z':	goto yy54;
+ 	default:	goto yy47;
+ 	}
+-yy54:	++YYCURSOR;
+-	if((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
++yy54:
++	++YYCURSOR;
++	if ((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
+ 	yych = *YYCURSOR;
+-	goto yy55;
+-yy55:	switch(yych){
+-	case 0x0A:	goto yy56;
+-	case 0x0D:	goto yy58;
++	switch (yych) {
++	case '\n':	goto yy56;
++	case '\r':	goto yy58;
+ 	case '.':
+ 	case '/':
+ 	case '0':
+@@ -871,7 +859,8 @@ yy55:	switch(yych){
+ 	case '\\':
+ 	case ']':
+ 	case '^':
+-	case '_':	case 'a':
++	case '_':
++	case 'a':
+ 	case 'b':
+ 	case 'c':
+ 	case 'd':
+@@ -899,16 +888,16 @@ yy55:	switch(yych){
+ 	case 'z':	goto yy54;
+ 	default:	goto yy47;
+ 	}
+-yy56:	++YYCURSOR;
+-	goto yy57;
+-yy57:
++yy56:
++	++YYCURSOR;
+ #line 396 "bytecode.re"
+-{   CHK_NL(YYCURSOR);
++	{   CHK_NL(YYCURSOR);
+                goto Directive; }
+-#line 899 "<stdout>"
+-yy58:	++YYCURSOR;
+-	switch((yych = *YYCURSOR)) {
+-	case 0x0A:	goto yy56;
++#line 895 "<stdout>"
++yy58:
++	++YYCURSOR;
++	switch ((yych = *YYCURSOR)) {
++	case '\n':	goto yy56;
+ 	default:	goto yy47;
+ 	}
+ }
+@@ -922,40 +911,40 @@ Comment:
+         YYTOKEN = YYCURSOR;
+ 
+ 
+-#line 916 "<stdout>"
++#line 913 "<stdout>"
+ {
+ 	YYCTYPE yych;
+-	goto yy59;
+-	/*@notreached@*/
+-	++YYCURSOR;
+-yy59:
+-	if((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
++	if ((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
+ 	yych = *YYCURSOR;
+-	switch(yych){
++	switch (yych) {
+ 	case 0x00:	goto yy61;
+-	case 0x0A:	goto yy62;
+-	case 0x0D:	goto yy64;
++	case '\n':	goto yy62;
++	case '\r':	goto yy64;
+ 	default:	goto yy66;
+ 	}
+-yy61:yy62:	++YYCURSOR;
+-	goto yy63;
++yy61:
++yy62:
++	++YYCURSOR;
+ yy63:
+ #line 412 "bytecode.re"
+-{   CHK_NL(YYCURSOR);
++	{   CHK_NL(YYCURSOR);
+                 goto Document; }
+-#line 936 "<stdout>"
+-yy64:	++YYCURSOR;
+-	switch((yych = *YYCURSOR)) {
+-	case 0x0A:	goto yy67;
++#line 931 "<stdout>"
++yy64:
++	++YYCURSOR;
++	switch ((yych = *YYCURSOR)) {
++	case '\n':	goto yy67;
+ 	default:	goto yy65;
+ 	}
+ yy65:
+ #line 415 "bytecode.re"
+-{   goto Comment; }
+-#line 945 "<stdout>"
+-yy66:	yych = *++YYCURSOR;
++	{   goto Comment; }
++#line 941 "<stdout>"
++yy66:
++	yych = *++YYCURSOR;
+ 	goto yy65;
+-yy67:	++YYCURSOR;
++yy67:
++	++YYCURSOR;
+ 	yych = *YYCURSOR;
+ 	goto yy63;
+ }
+@@ -977,23 +966,20 @@ Scalar2:
+     tok = YYCURSOR;
+ 
+ 
+-#line 970 "<stdout>"
++#line 968 "<stdout>"
+ {
+ 	YYCTYPE yych;
+-	goto yy68;
+-	/*@notreached@*/
+-	++YYCURSOR;
+-yy68:
+-	if((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
++	if ((YYLIMIT - YYCURSOR) < 3) YYFILL(3);
+ 	yych = *YYCURSOR;
+-	switch(yych){
++	switch (yych) {
+ 	case 0x00:	goto yy74;
+-	case 0x0A:	goto yy70;
+-	case 0x0D:	goto yy72;
++	case '\n':	goto yy70;
++	case '\r':	goto yy72;
+ 	default:	goto yy76;
+ 	}
+-yy70:	++YYCURSOR;
+-	switch((yych = *YYCURSOR)) {
++yy70:
++	++YYCURSOR;
++	switch ((yych = *YYCURSOR)) {
+ 	case 'C':	goto yy78;
+ 	case 'N':	goto yy80;
+ 	case 'Z':	goto yy83;
+@@ -1001,50 +987,51 @@ yy70:	++YYCURSOR;
+ 	}
+ yy71:
+ #line 461 "bytecode.re"
+-{   YYCURSOR = tok;
++	{   YYCURSOR = tok;
+             goto ScalarEnd; 
+         }
+-#line 996 "<stdout>"
+-yy72:	++YYCURSOR;
+-	switch((yych = *YYCURSOR)) {
+-	case 0x0A:	goto yy77;
++#line 992 "<stdout>"
++yy72:
++	++YYCURSOR;
++	switch ((yych = *YYCURSOR)) {
++	case '\n':	goto yy77;
+ 	default:	goto yy73;
+ 	}
+ yy73:
+ #line 469 "bytecode.re"
+-{   CAT(str, cap, idx, tok[0]);
++	{   CAT(str, cap, idx, tok[0]);
+             goto Scalar2; 
+         }
+-#line 1007 "<stdout>"
+-yy74:	++YYCURSOR;
+-	goto yy75;
+-yy75:
++#line 1004 "<stdout>"
++yy74:
++	++YYCURSOR;
+ #line 465 "bytecode.re"
+-{   YYCURSOR = tok;
++	{   YYCURSOR = tok;
+             goto ScalarEnd;
+         }
+-#line 1015 "<stdout>"
+-yy76:	yych = *++YYCURSOR;
++#line 1011 "<stdout>"
++yy76:
++	yych = *++YYCURSOR;
+ 	goto yy73;
+-yy77:	yych = *++YYCURSOR;
+-	switch(yych){
++yy77:
++	yych = *++YYCURSOR;
++	switch (yych) {
+ 	case 'C':	goto yy78;
+ 	case 'N':	goto yy80;
+ 	case 'Z':	goto yy83;
+ 	default:	goto yy71;
+ 	}
+-yy78:	++YYCURSOR;
+-	goto yy79;
+-yy79:
++yy78:
++	++YYCURSOR;
+ #line 435 "bytecode.re"
+-{   CHK_NL(tok+1);
++	{   CHK_NL(tok+1);
+             goto Scalar2; }
+-#line 1031 "<stdout>"
+-yy80:	++YYCURSOR;
+-	if(YYLIMIT == YYCURSOR) YYFILL(1);
++#line 1028 "<stdout>"
++yy80:
++	++YYCURSOR;
++	if (YYLIMIT <= YYCURSOR) YYFILL(1);
+ 	yych = *YYCURSOR;
+-	goto yy81;
+-yy81:	switch(yych){
++	switch (yych) {
+ 	case '0':
+ 	case '1':
+ 	case '2':
+@@ -1059,7 +1046,7 @@ yy81:	switch(yych){
+ 	}
+ yy82:
+ #line 438 "bytecode.re"
+-{   CHK_NL(tok+1);
++	{   CHK_NL(tok+1);
+             if ( tok + 2 < YYCURSOR )
+             {
+                 char *count = tok + 2;
+@@ -1076,16 +1063,15 @@ yy82:
+             }
+             goto Scalar2;
+         }
+-#line 1068 "<stdout>"
+-yy83:	++YYCURSOR;
+-	goto yy84;
+-yy84:
++#line 1065 "<stdout>"
++yy83:
++	++YYCURSOR;
+ #line 456 "bytecode.re"
+-{   CHK_NL(tok+1);
++	{   CHK_NL(tok+1);
+             CAT(str, cap, idx, '\0');
+             goto Scalar2; 
+         }
+-#line 1077 "<stdout>"
++#line 1073 "<stdout>"
+ }
+ #line 473 "bytecode.re"
+ 
+@@ -1122,50 +1108,48 @@ Inline:
+         tok = YYCURSOR;
+ 
+ 
+-#line 1114 "<stdout>"
++#line 1110 "<stdout>"
+ {
+ 	YYCTYPE yych;
+-	goto yy85;
+-	/*@notreached@*/
+-	++YYCURSOR;
+-yy85:
+-	if((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
++	if ((YYLIMIT - YYCURSOR) < 2) YYFILL(2);
+ 	yych = *YYCURSOR;
+-	switch(yych){
++	switch (yych) {
+ 	case 0x00:	goto yy91;
+-	case 0x0A:	goto yy87;
+-	case 0x0D:	goto yy89;
++	case '\n':	goto yy87;
++	case '\r':	goto yy89;
+ 	default:	goto yy93;
+ 	}
+-yy87:	++YYCURSOR;
+-	goto yy88;
++yy87:
++	++YYCURSOR;
+ yy88:
+ #line 508 "bytecode.re"
+-{   CHK_NL(YYCURSOR);
++	{   CHK_NL(YYCURSOR);
+                 return str; }
+-#line 1134 "<stdout>"
+-yy89:	++YYCURSOR;
+-	switch((yych = *YYCURSOR)) {
+-	case 0x0A:	goto yy94;
++#line 1127 "<stdout>"
++yy89:
++	++YYCURSOR;
++	switch ((yych = *YYCURSOR)) {
++	case '\n':	goto yy94;
+ 	default:	goto yy90;
+ 	}
+ yy90:
+ #line 515 "bytecode.re"
+-{   CAT(str, cap, idx, tok[0]);
++	{   CAT(str, cap, idx, tok[0]);
+                 goto Inline; 
+             }
+-#line 1145 "<stdout>"
+-yy91:	++YYCURSOR;
+-	goto yy92;
+-yy92:
++#line 1139 "<stdout>"
++yy91:
++	++YYCURSOR;
+ #line 511 "bytecode.re"
+-{   YYCURSOR = tok;
++	{   YYCURSOR = tok;
+                 return str;
+             }
+-#line 1153 "<stdout>"
+-yy93:	yych = *++YYCURSOR;
++#line 1146 "<stdout>"
++yy93:
++	yych = *++YYCURSOR;
+ 	goto yy90;
+-yy94:	++YYCURSOR;
++yy94:
++	++YYCURSOR;
+ 	yych = *YYCURSOR;
+ 	goto yy88;
+ }
diff --git a/meta/recipes-devtools/rpm/rpm/rpmatch.patch b/meta/recipes-devtools/rpm/rpm/rpmatch.patch
index 20d13aa..2ededda 100644
--- a/meta/recipes-devtools/rpm/rpm/rpmatch.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpmatch.patch
@@ -1,5 +1,6 @@
-Add configure check for rpmatch() and 
-creates a compatable macro if it is not provided by the C library.
+Create a compatable macro if rpmatch() is not provided by the C library.
+
+This uses an existing configure check.
 
 This is needed for uclibc since it does not have the above function
 implemented.
@@ -8,24 +9,15 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: rpm-5.4.14/configure.ac
-===================================================================
---- rpm-5.4.14.orig/configure.ac
-+++ rpm-5.4.14/configure.ac
-@@ -943,7 +943,7 @@ AC_CHECK_FUNCS([dnl
-     ftok getaddrinfo getattrlist getcwd getdelim getline getmode getnameinfo dnl
-     getpassphrase getxattr getwd iconv inet_aton lchflags lchmod lchown dnl
-     lgetxattr lsetxattr lutimes madvise mempcpy mkdtemp mkstemp mtrace dnl
--    posix_fadvise posix_fallocate putenv realpath regcomp secure_getenv __secure_getenv dnl
-+    posix_fadvise posix_fallocate putenv realpath regcomp rpmatch secure_getenv __secure_getenv dnl
-     setattrlist setenv setlocale setmode setxattr dnl
-     sigaddset sigdelset sigemptyset sighold sigrelse sigpause dnl
-     sigprocmask sigsuspend sigaction dnl
-Index: rpm-5.4.14/system.h
+Updated to rpm 5.4.15+.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm/system.h
 ===================================================================
---- rpm-5.4.14.orig/system.h
-+++ rpm-5.4.14/system.h
-@@ -353,6 +353,14 @@ extern int _tolower(int) __THROW	/*@*/;
+--- rpm.orig/system.h
++++ rpm/system.h
+@@ -358,6 +358,14 @@ extern int _tolower(int) __THROW	/*@*/;
  #include <libgen.h>
  #endif
  
diff --git a/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch b/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
index f08bd68..b3c14fd 100644
--- a/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
@@ -12,21 +12,26 @@ Upstream-Status: Inappropriate [other]
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -127,13 +127,13 @@ rpm_SOURCES =		build.c
- rpm_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAGS)
+Index: rpm/Makefile.am
+===================================================================
+--- rpm.orig/Makefile.am
++++ rpm/Makefile.am
+@@ -202,14 +202,16 @@ rpm_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAG
  rpm_LDADD =		rpm.o $(myLDADD)
  rpm.o:	$(top_srcdir)/rpmqv.c
--	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c $(top_srcdir)/rpmqv.cc
-+	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c $(top_srcdir)/rpmqv.c
+ 	ln -sf $< rpmqv.cc
++	ln -sf $< rpmqv.c
+-	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c rpmqv.cc
++	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c rpmqv.c
  
  rpmbuild_SOURCES =	build.c
  rpmbuild_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
  rpmbuild_LDADD =	rpmbuild.o $(myLDADD)
- rpmbuild.o: $(top_srcdir)/rpmqv.c
--	$(COMPILE) -DIAM_RPMBT -o $@ -c $(top_srcdir)/rpmqv.cc
-+	$(COMPILE) -DIAM_RPMBT -o $@ -c $(top_srcdir)/rpmqv.c
+ rpmbuild.o:	$(top_srcdir)/rpmqv.c
+ 	ln -sf $< rpmqv.cc
++	ln -sf $< rpmqv.c
+-	$(COMPILE) -DIAM_RPMBT -o $@ -c rpmqv.cc
++	$(COMPILE) -DIAM_RPMBT -o $@ -c rpmqv.c
  
- .PHONY:	splint
- splint:
+ .syntastic_c_config: Makefile
+ 	@echo $(COMPILE) | tr ' ' '\n' | sed -e '1d' > $@
diff --git a/meta/recipes-devtools/rpm/rpm/uclibc-support.patch b/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
index 8870adb..3b4b924 100644
--- a/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
+++ b/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
@@ -4,10 +4,10 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: rpm-5.4.14/rpmio/rpmio.h
+Index: rpm/rpmio/rpmio.h
 ===================================================================
---- rpm-5.4.14.orig/rpmio/rpmio.h
-+++ rpm-5.4.14/rpmio/rpmio.h
+--- rpm.orig/rpmio/rpmio.h
++++ rpm/rpmio/rpmio.h
 @@ -23,7 +23,8 @@
   */
  /*@{*/
@@ -18,11 +18,11 @@ Index: rpm-5.4.14/rpmio/rpmio.h
  #define USE_COOKIE_SEEK_POINTER 1
  typedef _IO_off64_t 	_libio_off_t;
  typedef _libio_off_t *	_libio_pos_t;
-Index: rpm-5.4.14/system.h
+Index: rpm/system.h
 ===================================================================
---- rpm-5.4.14.orig/system.h
-+++ rpm-5.4.14/system.h
-@@ -481,7 +481,7 @@ extern void muntrace (void)
+--- rpm.orig/system.h
++++ rpm/system.h
+@@ -489,7 +489,7 @@ extern void muntrace (void)
  #endif /* defined(__LCLINT__) */
  
  /* Memory allocation via macro defs to get meaningful locations from mtrace() */
@@ -31,11 +31,11 @@ Index: rpm-5.4.14/system.h
  #define	xmalloc(_size) 		(malloc(_size) ? : vmefail(_size))
  #define	xcalloc(_nmemb, _size)	(calloc((_nmemb), (_size)) ? : vmefail(_size))
  #define	xrealloc(_ptr, _size)	(realloc((_ptr), (_size)) ? : vmefail(_size))
-Index: rpm-5.4.14/lib/librpm.vers
+Index: rpm/lib/librpm.vers
 ===================================================================
---- rpm-5.4.14.orig/lib/librpm.vers
-+++ rpm-5.4.14/lib/librpm.vers
-@@ -405,6 +405,10 @@ LIBRPM_0
+--- rpm.orig/lib/librpm.vers
++++ rpm/lib/librpm.vers
+@@ -406,6 +406,10 @@ LIBRPM_0
      specedit;
      strict_erasures;
      XrpmtsiInit;
@@ -46,14 +46,14 @@ Index: rpm-5.4.14/lib/librpm.vers
    local:
      *;
  };
-Index: rpm-5.4.14/rpmio/librpmio.vers
+Index: rpm/rpmio/librpmio.vers
 ===================================================================
---- rpm-5.4.14.orig/rpmio/librpmio.vers
-+++ rpm-5.4.14/rpmio/librpmio.vers
-@@ -1056,6 +1056,10 @@ LIBRPMIO_0
-     mongo_write_concern_set_mode;
-     mongo_write_concern_set_w;
-     mongo_write_concern_set_wtimeout;
+--- rpm.orig/rpmio/librpmio.vers
++++ rpm/rpmio/librpmio.vers
+@@ -1455,6 +1455,10 @@ LIBRPMIO_0
+     _mongoc_write_result_init;
+     _mongoc_write_result_merge;
+     _mongoc_write_result_merge_legacy;
 +    xmalloc;
 +    xrealloc;
 +    xcalloc;
diff --git a/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch b/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
deleted file mode 100644
index 71045ae..0000000
--- a/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9e7b72ee0c994609975981e135fc18d0387aefb6 Mon Sep 17 00:00:00 2001
-From: jbj <jbj>
-Date: Wed, 14 May 2014 21:19:41 +0000
-Subject: [PATCH] - verify: fix: broken logic for %ghost avoidance (Mark
- Hatle).
-
-Upstream-Status: Backport
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
----
- CHANGES      | 1 +
- lib/verify.c | 3 +--
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: rpm-5.4.14/CHANGES
-===================================================================
---- rpm-5.4.14.orig/CHANGES
-+++ rpm-5.4.14/CHANGES
-@@ -1,3 +1,5 @@
-+    - jbj: verify: fix: broken logic for %ghost avoidance (Mark Hatle).
-+
- 5.4.13 -> 5.4.14:
-     - mooney: use __sun instead of __sun__ in #define (lp#1243472).
-     - mooney: rpmconstant: ensure linkage w Oracle Studio 12.3 (lp#1243469).
-Index: rpm-5.4.14/lib/verify.c
-===================================================================
---- rpm-5.4.14.orig/lib/verify.c
-+++ rpm-5.4.14/lib/verify.c
-@@ -588,8 +588,7 @@ uint32_t fc = rpmfiFC(fi);
- 	    continue;
- 
- 	/* If not verifying %ghost, skip ghost files. */
--	/* XXX the broken!!! logic disables %ghost queries always. */
--	if (!(FF_ISSET(qva->qva_fflags, GHOST) && FF_ISSET(fflags, GHOST)))
-+	if (!FF_ISSET(qva->qva_fflags, GHOST) && FF_ISSET(fflags, GHOST))
- 	    continue;
- 
- 	/* Gather per-file data into a carrier. */
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 660e9df..c6cc036 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -34,24 +34,21 @@ DESCRIPTION_perl-modules-rpm = "The perl-modules-rpm package contains a module t
 written in the Perl programming language to use the interface \
 supplied by the RPM Package Manager libraries."
 
-SUMMARY_perl-module-rpm-dev = "Development components for perl bindings"
-DESCRIPTION_perl-modules-rpm-dev = "Development items such as man pages for use with the Perl \
-language bindings."
-
 HOMEPAGE = "http://rpm5.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-DEPENDS = "libpcre attr acl popt ossp-uuid file byacc-native"
+# We must have gettext-native, we need gettextize, which may not be provided
+DEPENDS = "libpcre attr acl popt ossp-uuid file byacc-native gettext-native"
 DEPENDS_append_class-native = " file-replacement-native"
 
-S = "${WORKDIR}/rpm"
-
 # Apply various fixups that are unique to the CVS environment
 do_fixup_unpack () {
-	ln -sf ../syck ${S}/syck || :
-	ln -sf ../lua ${S}/lua || :
-	ln ${S}/rpmqv.c ${S}/rpmqv.cc || :
+	# 'ln' isn't reliable, and 'mv' could break later builds
+	rm -rf ${S}/syck ; cp -r ${WORKDIR}/syck ${S}/.
+	rm -rf ${S}/lua ; cp -r ${WORKDIR}/lua ${S}/.
+	rm -rf ${S}/popt ; cp -r ${WORKDIR}/popt ${S}/.
+	rm -rf ${S}/beecrypt ; cp -r ${WORKDIR}/beecrypt ${S}/.
 }
 
 addtask fixup_unpack after do_unpack before do_patch
@@ -60,45 +57,34 @@ addtask fixup_unpack after do_unpack before do_patch
 # community work in progress.
 DEFAULT_PREFERENCE = "-1"
 
+S = "${WORKDIR}/rpm"
+
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
 SRC_URI = "cvs://anonymous@rpm5.org/cvs;tag=rpm-5_4;module=rpm \
 	   cvs://anonymous@rpm5.org/cvs;tag=rpm-5_4;module=syck \
 	   cvs://anonymous@rpm5.org/cvs;tag=rpm-5_4;module=lua \
-	   file://rpm-log-auto-rm.patch \
-	   file://rpm-db-reduce.patch \
+	   cvs://anonymous@rpm5.org/cvs;tag=rpm-5_4;module=popt \
+	   cvs://anonymous@rpm5.org/cvs;tag=rpm-5_4;module=beecrypt \
 	   file://perfile_rpmdeps.sh \
-	   file://rpm-autogen.patch \
-	   file://rpm-libsql-fix.patch \
+	   file://pythondeps.sh \
+"
+
+# Bug fixes
+SRC_URI += " \
 	   file://header-include-fix.patch \
+	   file://rpm-libsql-fix.patch \
 	   file://rpm-platform.patch \
-	   file://rpm-showrc.patch \
+	   file://rpm-platform2.patch \
 	   file://rpm-tools-mtree-LDFLAGS.patch \
-	   file://rpm-fileclass.patch \
 	   file://rpm-canonarch.patch \
 	   file://rpm-no-loopmsg.patch \
-	   file://rpm-scriptletexechelper.patch \
-	   file://pythondeps.sh \
-	   file://rpmdeps-oecore.patch \
 	   file://rpm-resolvedep.patch \
-	   file://rpm-no-perl-urpm.patch \
-	   file://rpm-macros.patch \
-	   file://rpm-lua.patch \
-	   file://rpm-ossp-uuid.patch \
 	   file://rpm-packageorigin.patch \
-	   file://rpm-pkgconfigdeps.patch \
 	   file://uclibc-support.patch \
 	   file://rpmatch.patch \
-	   file://fstack-protector-configure-check.patch \
-	   file://dbconvert.patch \
-	   file://rpm-uuid-include.patch \
 	   file://makefile-am-exec-hook.patch \
-	   file://rpm-db_buffer_small.patch \
-	   file://rpm-py-init.patch \
 	   file://python-rpm-rpmsense.patch \
-	   file://rpm-reloc-macros.patch \
-	   file://rpm-platform2.patch \
-	   file://rpm-remove-sykcparse-decl.patch \
 	   file://debugedit-segv.patch \
 	   file://debugedit-valid-file-to-fix-segment-fault.patch \
 	   file://rpm-platform-file-fix.patch \
@@ -107,13 +93,52 @@ SRC_URI = "cvs://anonymous@rpm5.org/cvs;tag=rpm-5_4;module=rpm \
 	   file://rpm-hardlink-segfault-fix.patch \
 	   file://rpm-payload-use-hashed-inode.patch \
 	   file://rpm-fix-logio-cp.patch \
+	   file://0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch \
+	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
+	   file://0001-define-EM_AARCH64.patch \
+	   file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
+	   file://rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch \
+	   file://rpm-mongodb-sasl.patch \
+	   file://rpm-fix-parseEmbedded.patch \
+	   file://rpm-rpmio-headers.patch \
+	   file://rpm-python-restore-origin.patch \
+"
+
+# OE specific changes
+SRC_URI += " \
+	   file://rpm-log-auto-rm.patch \
+	   file://rpm-db-reduce.patch \
+	   file://rpm-autogen.patch \
+	   file://rpm-showrc.patch \
+	   file://rpm-fileclass.patch \
+	   file://rpm-scriptletexechelper.patch \
+	   file://rpmdeps-oecore.patch \
+	   file://rpm-no-perl-urpm.patch \
+	   file://rpm-macros.patch \
+	   file://rpm-lua.patch \
+	   file://rpm-ossp-uuid.patch \
+	   file://rpm-uuid-include.patch \
+	   file://rpm-pkgconfigdeps.patch \
+	   file://no-ldflags-in-pkgconfig.patch \
+	   file://dbconvert.patch \
+	   file://rpm-db_buffer_small.patch \
+	   file://rpm-py-init.patch \
+	   file://rpm-reloc-macros.patch \
 	   file://rpm-db5-or-db6.patch \
-	   file://rpm-rpmpgp-fix.patch \
-	   file://rpm-disable-Wno-override-init.patch \
+	   file://rpm-db60.patch \
+	   file://rpmqv_cc_b_gone.patch \
 	   file://rpm-realpath.patch \
-	   file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
-	  "
-
+	   file://rpm-check-rootpath-reasonableness.patch \
+	   file://rpm-macros.in-disable-external-key-server.patch \
+	   file://configure.ac-check-for-both-gpg2-and-gpg.patch \
+	   file://rpm-disable-auto-stack-protector.patch \
+	   file://rpm-syck-fix-gram.patch \
+	   file://rpm-rpmdb-grammar.patch \
+"
+
+SRC_URI_append_libc-musl = "\
+           file://0001-rpm-Fix-build-on-musl.patch \
+"
 # Uncomment the following line to enable platform score debugging
 # This is useful when identifying issues with Smart being unable
 # to process certain package feeds.
@@ -123,16 +148,19 @@ inherit autotools gettext
 
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
+# The local distribution macro directory
+distromacrodir = "${libdir}/rpm/poky"
+
 # Specify the default rpm macros in terms of adjustable variables
-rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
-rpm_macros_class-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
-rpm_macros_class-nativesdk = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
+rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macros:%{_usrlibrpm}/${DISTRO}/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
+rpm_macros_class-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macros:%{_usrlibrpm}/${DISTRO}/%{_target}/macros:~/.oerpmmacros"
+rpm_macros_class-nativesdk = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macros:%{_usrlibrpm}/${DISTRO}/%{_target}/macros:~/.oerpmmacros"
 
 # sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux
 
 # Note: perl and sqlite w/o db specified does not currently work.
 #       tcl, augeas, nss, gcrypt, xar and keyutils support is untested.
-PACKAGECONFIG ??= "db bzip2 zlib beecrypt openssl libelf python"
+PACKAGECONFIG ??= "db bzip2 zlib openssl libelf python"
 
 PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2,"
 PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz,"
@@ -193,7 +221,7 @@ EXTRA_OECONF += "--verbose \
 		--with-uuid \
 		--with-attr \
 		--with-acl \
-		--with-popt=external \
+		--with-popt=internal \
 		--with-pthreads \
 		--without-cudf \
 		--without-ficl \
@@ -205,6 +233,7 @@ EXTRA_OECONF += "--verbose \
 		--without-gpsee \
 		--without-ruby \
 		--without-squirrel \
+		--without-sasl2 \
 		--with-build-extlibdep \
 		--with-build-maxextlibdep \
 		--without-valgrind \
@@ -224,7 +253,7 @@ CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
 
 LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm perl-module-rpm ${PN}-locale"
 
 SOLIBS = "5.4.so"
 
@@ -342,6 +371,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 		${libdir}/rpm/vpkg-provides.sh \
 		${libdir}/rpm/vpkg-provides2.sh \
 		${libdir}/rpm/perfile_rpmdeps.sh \
+		${distromacrodir} \
 		"
 RDEPENDS_${PN} = "base-files run-postinsts"
 RDEPENDS_${PN}_class-native = ""
@@ -350,16 +380,12 @@ RDEPENDS_${PN}-build = "file bash perl"
 
 RDEPENDS_python-rpm = "${PN}"
 
-FILES_python-rpm-dev = "${libdir}/python*/site-packages/rpm/*.la"
-FILES_python-rpm-staticdev = "${libdir}/python*/site-packages/rpm/*.a"
 FILES_python-rpm = "${libdir}/python*/site-packages/rpm"
+PROVIDES += "python-rpm"
 
 FILES_perl-module-rpm = "${libdir}/perl/*/* \
 		"
 
-FILES_perl-module-rpm-dev = "${prefix}/share/man/man3/RPM* \
-		"
-
 RDEPENDS_${PN}-dev += "bash"
 
 FILES_${PN}-dev = "${includedir}/rpm \
@@ -388,6 +414,7 @@ FILES_${PN}-staticdev = " \
 		${libdir}/librpmmisc.a \
 		${libdir}/librpmbuild.a \
 		${libdir}/rpm/lib/liblua.a \
+		${libdir}/python*/site-packages/rpm/*.a \
 		"
 
 do_configure() {
@@ -408,12 +435,18 @@ do_configure() {
 }
 
 do_install_append() {
+	# Preserve the previous default of DSA self-signed pkgs
+	sed -i -e 's,%_build_sign.*,%_build_sign DSA,' ${D}/${libdir}/rpm/macros.rpmbuild
+
 	sed -i -e 's,%__scriptlet_requires,#%%__scriptlet_requires,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,%__perl_provides,#%%__perl_provides,' ${D}/${libdir}/rpm/macros ${D}/${libdir}/rpm/macros.d/*
 	sed -i -e 's,%__perl_requires,#%%__perl_requires,' ${D}/${libdir}/rpm/macros ${D}/${libdir}/rpm/macros.d/*
 	sed -i -e 's,%_repackage_all_erasures[^_].*,%_repackage_all_erasures 0,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,^#%_openall_before_chroot.*,%_openall_before_chroot\t1,' ${D}/${libdir}/rpm/macros
 
+	# Enable MIPS64 N32 transactions.  (This is a no-op on non-MIPS targets.)
+	sed -i -e 's,%_transaction_color[^_].*,%_transaction_color 7,' ${D}/${libdir}/rpm/macros
+
 	# Enable Debian style arbitrary tags...
 	sed -i -e 's,%_arbitrary_tags[^_].*,%_arbitrary_tags %{_arbitrary_tags_debian},' ${D}/${libdir}/rpm/macros
 
@@ -485,6 +518,83 @@ do_install_append() {
 
 }
 
+do_install_append_class-target() {
+	# Create and install distribution specific macros
+	mkdir -p ${D}/${distromacrodir}
+	cat << EOF > ${D}/${distromacrodir}/macros
+%_defaultdocdir		${docdir}
+
+%_prefix                ${prefix}
+%_exec_prefix           ${exec_prefix}
+%_datarootdir           ${datadir}
+%_bindir                ${bindir}
+%_sbindir               ${sbindir}
+%_libexecdir            %{_libdir}/%{name}
+%_datadir               ${datadir}
+%_sysconfdir            ${sysconfdir}
+%_sharedstatedir        ${sharedstatedir}
+%_localstatedir         ${localstatedir}
+%_lib                   lib
+%_libdir                %{_exec_prefix}/%{_lib}
+%_includedir            ${includedir}
+%_oldincludedir         ${oldincludedir}
+%_infodir               ${infodir}
+%_mandir                ${mandir}
+%_localedir             %{_libdir}/locale
+EOF
+
+	# Create and install multilib specific macros
+	${@multilib_rpmmacros(d)}
+}
+
+def multilib_rpmmacros(d):
+    localdata = d.createCopy()
+    # We need to clear the TOOLCHAIN_OPTIONS (--sysroot)
+    localdata.delVar('TOOLCHAIN_OPTIONS')
+
+    # Set 'localdata' values to be consistent with 'd' values.
+    localdata.setVar('distromacrodir', d.getVar('distromacrodir', True))
+    localdata.setVar('WORKDIR', d.getVar('WORKDIR', True))
+
+    ret = gen_arch_macro(localdata)
+
+    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    for item in variants.split():
+        # Load overrides from 'd' to avoid having to reset the value...
+        localdata = d.createCopy()
+        overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+        localdata.setVar("OVERRIDES", overrides)
+        localdata.setVar("MLPREFIX", item + "-")
+        bb.data.update_data(localdata)
+        ret += gen_arch_macro(localdata)
+    return ret
+
+def gen_arch_macro(d):
+    # Generate shell script to produce the file as part of do_install
+    val  = "mkdir -p ${D}/${distromacrodir}/${TARGET_ARCH}-${TARGET_OS}\n"
+    val += "cat << EOF > ${D}/${distromacrodir}/${TARGET_ARCH}-${TARGET_OS}/macros\n"
+    val += "%_lib               ${baselib}\n"
+    val += "%_libdir            ${libdir}\n"
+    val += "%_localedir         ${localedir}\n"
+    val += "\n"
+    val += "# Toolchain configuration\n"
+    val += "%TOOLCHAIN_OPTIONS  %{nil}\n"
+    val += "%__ar               ${@d.getVar('AR', True).replace('$','%')}\n"
+    val += "%__as               ${@d.getVar('AS', True).replace('$','%')}\n"
+    val += "%__cc               ${@d.getVar('CC', True).replace('$','%')}\n"
+    val += "%__cpp              ${@d.getVar('CPP', True).replace('$','%')}\n"
+    val += "%__cxx              ${@d.getVar('CXX', True).replace('$','%')}\n"
+    val += "%__ld               ${@d.getVar('LD', True).replace('$','%')}\n"
+    val += "%__nm               ${@d.getVar('NM', True).replace('$','%')}\n"
+    val += "%__objcopy          ${@d.getVar('OBJCOPY', True).replace('$','%')}\n"
+    val += "%__objdump          ${@d.getVar('OBJDUMP', True).replace('$','%')}\n"
+    val += "%__ranlib           ${@d.getVar('RANLIB', True).replace('$','%')}\n"
+    val += "%__strip            ${@d.getVar('STRIP', True).replace('$','%')}\n"
+    val += "EOF\n"
+    val += "\n"
+    return d.expand(val)
+
+
 add_native_wrapper() {
         create_wrapper ${D}/${bindir}/rpm \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
similarity index 94%
rename from meta/recipes-devtools/rpm/rpm_5.4.14.bb
rename to meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 90c4a35..8a96a54 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -5,8 +5,6 @@ verifying, querying, and updating software packages. Each software \
 package consists of an archive of files along with information about \
 the package like its version, a description, etc."
 
-RECIPE_NO_UPDATE_REASON = "5.4.15 has a package database issue: http://lists.openembedded.org/pipermail/openembedded-core/2015-August/109187.html"
-
 SUMMARY_${PN}-libs = "Libraries for manipulating RPM packages"
 DESCRIPTION_${PN}-libs = "This package contains the RPM shared libraries."
 
@@ -40,69 +38,90 @@ HOMEPAGE = "http://rpm5.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-DEPENDS = "libpcre attr acl popt ossp-uuid file byacc-native"
+# We must have gettext-native, we need gettextize, which may not be provided
+DEPENDS = "libpcre attr acl popt ossp-uuid file byacc-native gettext-native"
 DEPENDS_append_class-native = " file-replacement-native"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
-SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;extract=rpm-5.4.14.tar.gz \
-	   file://rpm-log-auto-rm.patch \
-	   file://rpm-db-reduce.patch \
+
+# There is no official 5.4.16 release yet, so start w/ 5.4.15 and patch it
+# based on CVS
+S = "${WORKDIR}/rpm-5.4.15"
+
+SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.15-0.20140824.src.rpm;extract=rpm-5.4.15.tar.gz \
+	   file://rpm-5.4.15-to-5.4.16.patch.xz \
+	   file://syck-5.4.15-to-5.4.16.patch.xz \
+	   file://beecrypt-5.4.15-to-5.4.16.patch.xz \
+	   file://lua-5.4.15-to-5.4.16.patch.xz \
 	   file://perfile_rpmdeps.sh \
-	   file://rpm-autogen.patch \
-	   file://rpm-libsql-fix.patch \
+	   file://pythondeps.sh \
+"
+
+# Bug fixes
+SRC_URI += " \
 	   file://header-include-fix.patch \
+	   file://rpm-libsql-fix.patch \
 	   file://rpm-platform.patch \
-	   file://rpm-showrc.patch \
+	   file://rpm-platform2.patch \
 	   file://rpm-tools-mtree-LDFLAGS.patch \
-	   file://rpm-fileclass.patch \
 	   file://rpm-canonarch.patch \
 	   file://rpm-no-loopmsg.patch \
-	   file://rpm-scriptletexechelper.patch \
-	   file://pythondeps.sh \
-	   file://rpmdeps-oecore.patch \
 	   file://rpm-resolvedep.patch \
-	   file://rpm-no-perl-urpm.patch \
-	   file://rpm-macros.patch \
-	   file://rpm-lua.patch \
-	   file://rpm-ossp-uuid.patch \
 	   file://rpm-packageorigin.patch \
-	   file://rpm-pkgconfigdeps.patch \
 	   file://uclibc-support.patch \
 	   file://rpmatch.patch \
-	   file://fstack-protector-configure-check.patch \
-	   file://dbconvert.patch \
-	   file://rpm-uuid-include.patch \
 	   file://makefile-am-exec-hook.patch \
-	   file://rpm-db_buffer_small.patch \
-	   file://rpm-py-init.patch \
 	   file://python-rpm-rpmsense.patch \
-	   file://rpm-reloc-macros.patch \
-	   file://rpm-platform2.patch \
-	   file://rpm-remove-sykcparse-decl.patch \
 	   file://debugedit-segv.patch \
 	   file://debugedit-valid-file-to-fix-segment-fault.patch \
 	   file://rpm-platform-file-fix.patch \
 	   file://rpm-lsb-compatibility.patch \
 	   file://rpm-tag-generate-endian-conversion-fix.patch \
-	   file://verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch \
 	   file://rpm-hardlink-segfault-fix.patch \
 	   file://rpm-payload-use-hashed-inode.patch \
 	   file://rpm-fix-logio-cp.patch \
+	   file://0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch \
+	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
+	   file://0001-define-EM_AARCH64.patch \
+	   file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
+	   file://rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch \
+	   file://rpm-mongodb-sasl.patch \
+	   file://rpm-fix-parseEmbedded.patch \
+	   file://rpm-rpmio-headers.patch \
+	   file://rpm-python-restore-origin.patch \
+"
+
+# OE specific changes
+SRC_URI += " \
+	   file://rpm-log-auto-rm.patch \
+	   file://rpm-db-reduce.patch \
+	   file://rpm-autogen.patch \
+	   file://rpm-showrc.patch \
+	   file://rpm-fileclass.patch \
+	   file://rpm-scriptletexechelper.patch \
+	   file://rpmdeps-oecore.patch \
+	   file://rpm-no-perl-urpm.patch \
+	   file://rpm-macros.patch \
+	   file://rpm-lua.patch \
+	   file://rpm-ossp-uuid.patch \
+	   file://rpm-uuid-include.patch \
+	   file://rpm-pkgconfigdeps.patch \
+	   file://no-ldflags-in-pkgconfig.patch \
+	   file://dbconvert.patch \
+	   file://rpm-db_buffer_small.patch \
+	   file://rpm-py-init.patch \
+	   file://rpm-reloc-macros.patch \
 	   file://rpm-db5-or-db6.patch \
-	   file://rpm-disable-Wno-override-init.patch \
+	   file://rpm-db60.patch \
 	   file://rpmqv_cc_b_gone.patch \
 	   file://rpm-realpath.patch \
-	   file://0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch \
-	   file://no-ldflags-in-pkgconfig.patch \
-	   file://rpm-lua-fix-print.patch \
 	   file://rpm-check-rootpath-reasonableness.patch \
 	   file://rpm-macros.in-disable-external-key-server.patch \
-	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
 	   file://configure.ac-check-for-both-gpg2-and-gpg.patch \
-	   file://0001-define-EM_AARCH64.patch \
-	   file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
-	   file://rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch \
+	   file://rpm-disable-auto-stack-protector.patch \
+	   file://rpm-syck-fix-gram.patch \
+	   file://rpm-rpmdb-grammar.patch \
 "
 
 SRC_URI_append_libc-musl = "\
@@ -113,8 +132,8 @@ SRC_URI_append_libc-musl = "\
 # to process certain package feeds.
 #SRC_URI += "file://rpm-debug-platform.patch"
 
-SRC_URI[md5sum] = "25093d399a0b5d1342d24900a91b347d"
-SRC_URI[sha256sum] = "676e3ab41f72e3b504e04109cfb565a300742f56a7da084f202013b30eeae467"
+SRC_URI[md5sum] = "d53782842ac11b3100a43fb2958c9bc0"
+SRC_URI[sha256sum] = "d4ae5e9ed5df8ab9931b660f491418d20ab5c4d72eb17ed9055b80b71ef6c4ee"
 
 UPSTREAM_CHECK_REGEX = "rpm-(?P<pver>(\d+[\.\-_]*)+)-.*$"
 
@@ -134,7 +153,7 @@ rpm_macros_class-nativesdk = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macro
 
 # Note: perl and sqlite w/o db specified does not currently work.
 #       tcl, augeas, nss, gcrypt, xar and keyutils support is untested.
-PACKAGECONFIG ??= "db bzip2 zlib beecrypt openssl libelf python"
+PACKAGECONFIG ??= "db bzip2 zlib openssl libelf python"
 
 PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2,"
 PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz,"
@@ -195,7 +214,7 @@ EXTRA_OECONF += "--verbose \
 		--with-uuid \
 		--with-attr \
 		--with-acl \
-		--with-popt=external \
+		--with-popt=internal \
 		--with-pthreads \
 		--without-cudf \
 		--without-ficl \
@@ -207,6 +226,7 @@ EXTRA_OECONF += "--verbose \
 		--without-gpsee \
 		--without-ruby \
 		--without-squirrel \
+		--without-sasl2 \
 		--with-build-extlibdep \
 		--with-build-maxextlibdep \
 		--without-valgrind \
@@ -408,6 +428,9 @@ do_configure() {
 }
 
 do_install_append() {
+	# Preserve the previous default of DSA self-signed pkgs
+	sed -i -e 's,%_build_sign.*,%_build_sign DSA,' ${D}/${libdir}/rpm/macros.rpmbuild
+
 	sed -i -e 's,%__scriptlet_requires,#%%__scriptlet_requires,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,%__perl_provides,#%%__perl_provides,' ${D}/${libdir}/rpm/macros ${D}/${libdir}/rpm/macros.d/*
 	sed -i -e 's,%__perl_requires,#%%__perl_requires,' ${D}/${libdir}/rpm/macros ${D}/${libdir}/rpm/macros.d/*
-- 
2.5.0


