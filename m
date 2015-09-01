Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 4135 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 01 Sep 2015 15:26:50 UTC
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 6710176B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 15:26:49 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t81EHtcW019426; Tue, 1 Sep 2015 09:17:55 -0500
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015090109175574-1023038 ;
	Tue, 1 Sep 2015 09:17:55 -0500 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 1 Sep 2015 09:17:53 -0500
Message-Id: <1441117073-23911-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/01/2015 09:17:55 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/01/2015 09:17:55 AM,
	Serialize complete at 09/01/2015 09:17:55 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-01_05:, , signatures=0
Subject: [PATCH] opkg: upgrade to v0.3.0
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
X-List-Received-Date: Tue, 01 Sep 2015 15:26:50 -0000

Changes required:
- Rename opkg-cl to opkg
- Add libarchive dependency
- Drop backport patches
- Drop obsolete directory options
- Add patch to handle empty index files

Based on initial work by Paul Barker.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
CC: Paul Barker <paul@paulbarker.me.uk>
---
 meta/lib/oe/package_manager.py                     |   6 +-
 .../installer/adt-installer/adt_installer          |   2 +-
 .../adt-installer/scripts/adt_installer_internal   |   4 +-
 .../opkg/0001-opkg-key-Backport-improvements.patch |  78 ------------
 ...ve-add-support-for-empty-compressed-files.patch |  64 ++++++++++
 meta/recipes-devtools/opkg/opkg/add-exclude.patch  | 131 ---------------------
 .../opkg/opkg/no-install-recommends.patch          |  91 --------------
 .../opkg/opkg/opkg-configure.service               |   2 +-
 .../opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch |  32 -----
 meta/recipes-devtools/opkg/opkg_0.2.4.bb           |  84 -------------
 meta/recipes-devtools/opkg/opkg_0.3.0.bb           |  72 +++++++++++
 .../run-postinsts/run-postinsts/run-postinsts      |   2 +-
 12 files changed, 144 insertions(+), 424 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-improvements.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add-support-for-empty-compressed-files.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/add-exclude.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg_0.2.4.bb
 create mode 100644 meta/recipes-devtools/opkg/opkg_0.3.0.bb

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2ab1d78..4986bf9 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -376,7 +376,7 @@ class OpkgPkgsList(PkgsList):
     def __init__(self, d, rootfs_dir, config_file):
         super(OpkgPkgsList, self).__init__(d, rootfs_dir)
 
-        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg-cl")
+        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
         self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
         self.opkg_args += self.d.getVar("OPKG_ARGS", True)
 
@@ -1228,8 +1228,8 @@ class OpkgPM(PackageManager):
 
         self.deploy_dir = self.d.getVar("DEPLOY_DIR_IPK", True)
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
-        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg-cl")
-        self.opkg_args = "-f %s -o %s " % (self.config_file, target_rootfs)
+        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
+        self.opkg_args = "--volatile-cache -f %s -o %s " % (self.config_file, target_rootfs)
         self.opkg_args += self.d.getVar("OPKG_ARGS", True)
 
         opkg_lib_dir = self.d.getVar('OPKGLIBDIR', True)
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 24db247..3172de7 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -156,7 +156,7 @@ validate_config()
 #this installed local opkg
 install_opkg()
 {
-if [ ! -x "$LOCAL_OPKG_LOC/bin/opkg-cl" ]; then
+if [ ! -x "$LOCAL_OPKG_LOC/bin/opkg" ]; then
   echo_info "OPKG is not setup, setting up opkg in local, which is required for installing yocto ADT...\n"
 
   if [ -d $LOCAL_OPKG_LOC ]; then
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 2a8a30c..6f5fb49 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -124,9 +124,9 @@ fi
 
 #first update repository
 if [ "x$SUDO" = "x" ]; then
-    OPKG_CMD="$LOCAL_OPKG_LOC/bin/opkg-cl"
+    OPKG_CMD="$LOCAL_OPKG_LOC/bin/opkg"
 else
-    OPKG_CMD="sudo -E $LOCAL_OPKG_LOC/bin/opkg-cl"
+    OPKG_CMD="sudo -E $LOCAL_OPKG_LOC/bin/opkg"
 fi
 
 echo_info "Updating opkg..."
diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-improvements.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-improvements.patch
deleted file mode 100644
index ae319ce..0000000
--- a/meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-improvements.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 87bec8300a1122829b2ed565db7da5bacfa88919 Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Sun, 12 Oct 2014 09:59:53 +0000
-Subject: [PATCH] opkg-key: Backport improvements
-
-The improvements to opkg-key made for v0.3.0 are backported. The rest of v0.3.0
-needs further testing and bugfixing prior to release, but the improvements to
-opkg-key have been tested and work well.
-
-    1) opkg-key: Add 'reset' option
-
-        This option removes the keyrings used to verify package signatures,
-        effectively resetting opkg to the initial state where it recognises no
-        keys.
-
-    2) opkg-key: Add 'populate' option
-
-        This option causes all keyrings in /usr/share/opkg/keyrings to be
-        imported. Thus distributions may install their keys into this directory
-        and use 'opkg-key populate' to ensure the correct keys are loaded.
-
-    3) opkg-key: Improve usage output
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Upstream-status: Backport
----
- utils/opkg-key | 26 ++++++++++++++++++++++----
- 1 file changed, 22 insertions(+), 4 deletions(-)
-
-diff --git a/utils/opkg-key b/utils/opkg-key
-index 266bb66..085f1e8 100755
---- a/utils/opkg-key
-+++ b/utils/opkg-key
-@@ -10,12 +10,17 @@ usage() {
-     echo
-     echo "Manage opkg's list of trusted keys"
-     echo
--    echo "  opkg-key add <file>          - add the key contained in <file> ('-' for stdin)"
--    echo "  opkg-key del <keyid>         - remove the key <keyid>"
--    echo "  opkg-key list                - list keys"
-+    echo "Commands and arguments:"
-+    echo "  add <file>          - Add the key contained in <file> ('-' for stdin)"
-+    echo "  del <keyid>         - Remove the key <keyid>"
-+    echo "  list                - List keys"
-+    echo "  fingerprint         - List keys with fingerprints"
-+    echo "  reset               - Remove all keys, resetting the keyring"
-+    echo "  populate            - Import keys from /usr/share/opkg/keyrings"
-+    echo "  help                - Print this usage message and exit"
-     echo
-     echo "Options:"
--    echo "  -o <root>  Use <root> as the offline root directory"
-+    echo "  -o <root>           - Use <root> as the offline root directory"
-     echo
- }
- 
-@@ -64,6 +69,19 @@ case "$command" in
-         echo "Executing: $GPG $*"
-         $GPG $*
-         ;;
-+    reset)
-+        rm -f $ROOT/etc/opkg/trusted.gpg $ROOT/etc/opkg/trusted.gpg~
-+        rm -f $ROOT/etc/opkg/secring.gpg $ROOT/etc/opkg/secring.gpg~
-+        rm -f $ROOT/etc/opkg/trustdb.gpg $ROOT/etc/opkg/trustdb.gpg~
-+        echo "OK"
-+        ;;
-+    populate)
-+        for f in $ROOT/usr/share/opkg/keyrings/*.gpg; do
-+            echo "Importing keys from '`basename $f`'..."
-+            $GPG --quiet --batch --import "$f"
-+        done
-+        echo "OK"
-+        ;;
-     help)
-         usage
-         ;;
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add-support-for-empty-compressed-files.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add-support-for-empty-compressed-files.patch
new file mode 100644
index 0000000..dabd196
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add-support-for-empty-compressed-files.patch
@@ -0,0 +1,64 @@
+From bd32bb8646459508bb0b0ce54a14bd6fe0e19b75 Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Thu, 27 Aug 2015 15:52:16 -0500
+Subject: [PATCH] opkg_archive: add support for empty compressed files
+
+Regression from 0.2.x: opkg used to support empty Package.gz files.
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+
+Upstream-Status: Accepted
+---
+ libopkg/opkg_archive.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index be903e4..7e91e48 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -121,6 +121,9 @@ static int copy_to_stream(struct archive *a, FILE * stream)
+     int eof;
+     size_t len = EXTRACT_BUFFER_LEN;
+ 
++    if (archive_format(a) == ARCHIVE_FORMAT_EMPTY)
++        return 0;
++
+     buffer = xmalloc(len);
+ 
+     while (1) {
+@@ -654,6 +657,13 @@ static struct archive *open_compressed_file(const char *filename)
+         goto err_cleanup;
+     }
+ 
++    r = archive_read_support_format_empty(ar);
++    if (r != ARCHIVE_OK) {
++        opkg_msg(ERROR, "Empty format not supported: %s\n",
++                 archive_error_string(ar));
++        goto err_cleanup;
++    }
++
+     /* Open input file and prepare for reading. */
+     r = archive_read_open_filename(ar, filename, EXTRACT_BUFFER_LEN);
+     if (r != ARCHIVE_OK) {
+@@ -723,6 +733,7 @@ struct opkg_ar *ar_open_compressed_file(const char *filename)
+ {
+     struct opkg_ar *ar;
+     struct archive_entry *entry;
++    int eof;
+ 
+     ar = (struct opkg_ar *)xmalloc(sizeof(struct opkg_ar));
+ 
+@@ -737,8 +748,8 @@ struct opkg_ar *ar_open_compressed_file(const char *filename)
+      * header. We skip over this header here so that the caller doesn't need
+      * to know about it.
+      */
+-    entry = read_header(ar->ar, NULL);
+-    if (!entry)
++    entry = read_header(ar->ar, &eof);
++    if (!entry && !eof)
+         goto err_cleanup;
+ 
+     return ar;
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/opkg/opkg/add-exclude.patch b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
deleted file mode 100644
index 48de923..0000000
--- a/meta/recipes-devtools/opkg/opkg/add-exclude.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From 60c3f93e95a3ca54ef0a7eebc5ef29a5d92d3110 Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Fri, 28 Mar 2014 15:20:22 +0000
-Subject: [PATCH 2/2] opkg-0.2.x: add-exclude
-
-Add a way to exclude specific packages from the install
-
-When an excluded package is required by another package an error
-will be generated.  If the excluded package is only recommended,
-no error will be generated.
-
-The lifespan of the exclude_list covers the execution of the process,
-so there is no need to free the data.
-
-v2: Use xmalloc instead of malloc and xrealloc instead of realloc. In opkg,
-these functions are guaranteed not to return NULL.
-
-Upstream-Status: Accepted for v0.3.0 release with modifications
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
----
- libopkg/opkg_conf.c   |  1 +
- libopkg/opkg_conf.h   |  2 ++
- libopkg/pkg_depends.c | 16 ++++++++++++++++
- src/opkg-cl.c         | 15 +++++++++++++++
- 4 files changed, 34 insertions(+)
-
-diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c
-index 4eee37b..1ab63fb 100644
---- a/libopkg/opkg_conf.c
-+++ b/libopkg/opkg_conf.c
-@@ -447,6 +447,7 @@ opkg_conf_init(void)
- 	pkg_dest_list_init(&conf->pkg_dest_list);
- 	pkg_dest_list_init(&conf->tmp_dest_list);
- 	nv_pair_list_init(&conf->arch_list);
-+	conf->exclude_list = NULL;
- 
- 	return 0;
- }
-diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
-index 2f189e0..6d6e613 100644
---- a/libopkg/opkg_conf.h
-+++ b/libopkg/opkg_conf.h
-@@ -51,6 +51,8 @@ struct opkg_conf
-      pkg_dest_list_t pkg_dest_list;
-      pkg_dest_list_t tmp_dest_list;
-      nv_pair_list_t arch_list;
-+     size_t exclude_count;
-+     char ** exclude_list;
- 
-      int restrict_to_default_dest;
-      pkg_dest_t *default_dest;
-diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
-index 41bf206..eb630d1 100644
---- a/libopkg/pkg_depends.c
-+++ b/libopkg/pkg_depends.c
-@@ -204,6 +204,22 @@ pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *unsatisfied,
- 			 continue;
- 		    }
- 
-+		    /* Check for excluded packages */
-+		    if (satisfying_pkg != NULL && conf->exclude_list) {
-+			int i, exclude = 0;
-+			for (i = 0; i < conf->exclude_count; i++) {
-+			    if (!strcmp(satisfying_pkg->name, conf->exclude_list[i])) {
-+				opkg_msg(NOTICE, "%s: exclude required package %s"
-+					"at users request\n",
-+					pkg->name, satisfying_pkg->name);
-+				exclude = 1;
-+				break;
-+			    }
-+			}
-+			if (exclude)
-+			    continue;
-+		    }
-+
- 		    opkg_msg(DEBUG, "satisfying_pkg=%p\n", satisfying_pkg);
- 		    if (satisfying_pkg != NULL) {
- 			 satisfier_entry_pkg = satisfying_pkg;
-diff --git a/src/opkg-cl.c b/src/opkg-cl.c
-index 6378380..f10d10b 100644
---- a/src/opkg-cl.c
-+++ b/src/opkg-cl.c
-@@ -45,6 +45,7 @@ enum {
- 	ARGS_OPT_PREFER_ARCH_TO_VERSION,
- 	ARGS_OPT_ADD_ARCH,
- 	ARGS_OPT_ADD_DEST,
-+	ARGS_OPT_ADD_EXCLUDE,
- 	ARGS_OPT_NOACTION,
- 	ARGS_OPT_DOWNLOAD_ONLY,
- 	ARGS_OPT_NODEPS,
-@@ -97,6 +98,7 @@ static struct option long_options[] = {
- 	{"offline-root", 1, 0, 'o'},
- 	{"add-arch", 1, 0, ARGS_OPT_ADD_ARCH},
- 	{"add-dest", 1, 0, ARGS_OPT_ADD_DEST},
-+	{"add-exclude", 1, 0, ARGS_OPT_ADD_EXCLUDE},
- 	{"test", 0, 0, ARGS_OPT_NOACTION},
- 	{"tmp-dir", 1, 0, 't'},
- 	{"tmp_dir", 1, 0, 't'},
-@@ -200,6 +202,18 @@ args_parse(int argc, char *argv[])
- 			}
- 			free(tuple);
- 			break;
-+		case ARGS_OPT_ADD_EXCLUDE:
-+			tuple = xstrdup(optarg);
-+			if (!conf->exclude_list) {
-+				conf->exclude_count = 1;
-+				conf->exclude_list = xmalloc(sizeof(char *) * conf->exclude_count);
-+				conf->exclude_list[conf->exclude_count - 1] = tuple;
-+			} else {
-+				conf->exclude_count++;
-+				conf->exclude_list = xrealloc(conf->exclude_list, sizeof(char *) * conf->exclude_count);
-+				conf->exclude_list[conf->exclude_count - 1] = tuple;
-+			}
-+			break;
- 		case ARGS_OPT_NOACTION:
- 			conf->noaction = 1;
- 			break;
-@@ -287,6 +301,7 @@ usage()
- 	printf("\t--offline-root <dir>            offline installation of packages.\n");
- 	printf("\t--add-arch <arch>:<prio>        Register architecture with given priority\n");
- 	printf("\t--add-dest <name>:<path>        Register destination with given path\n");
-+	printf("\t--add-exclude <name>		  Register package to be excluded from install\n");
- 	printf("\t--prefer-arch-to-version        Use the architecture priority package rather\n");
- 	printf("\t                                than the higher version one if more\n");
- 	printf("\t                                than one candidate is found.\n");
--- 
-2.1.3
-
diff --git a/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch b/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
deleted file mode 100644
index c2d244d..0000000
--- a/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 2e2ccc7e7fc81a7eee2d004d3644efbc1be1ad73 Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Fri, 28 Mar 2014 15:19:08 +0000
-Subject: [PATCH 1/2] opkg-0.2.x: no-install-recommends
-
-Add the ability to not install ANY recommended packages.
-
-Upstream-Status: Accepted for v0.3.0 release with modifications
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
----
- libopkg/opkg_conf.h   | 1 +
- libopkg/pkg_depends.c | 3 ++-
- src/opkg-cl.c         | 7 +++++++
- 3 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
-index e0e045a..2f189e0 100644
---- a/libopkg/opkg_conf.h
-+++ b/libopkg/opkg_conf.h
-@@ -82,6 +82,7 @@ struct opkg_conf
-      int prefer_arch_to_version;
-      int check_signature;
-      int nodeps; /* do not follow dependencies */
-+     int noinstall_recommends;
-      char *offline_root;
-      char *overlay_root;
-      int query_all;
-diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
-index 8ab6508..41bf206 100644
---- a/libopkg/pkg_depends.c
-+++ b/libopkg/pkg_depends.c
-@@ -21,6 +21,7 @@
- #include <ctype.h>
- 
- #include "pkg.h"
-+#include "opkg_conf.h"
- #include "opkg_utils.h"
- #include "pkg_hash.h"
- #include "opkg_message.h"
-@@ -196,7 +197,7 @@ pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *unsatisfied,
- 		    /* user request overrides package recommendation */
- 		    if (satisfying_pkg != NULL
- 			&& (compound_depend->type == RECOMMEND || compound_depend->type == SUGGEST)
--			&& (satisfying_pkg->state_want == SW_DEINSTALL || satisfying_pkg->state_want == SW_PURGE)) {
-+			&& (satisfying_pkg->state_want == SW_DEINSTALL || satisfying_pkg->state_want == SW_PURGE || conf->noinstall_recommends)) {
- 			 opkg_msg(NOTICE, "%s: ignoring recommendation for "
- 					"%s at user request\n",
- 					pkg->name, satisfying_pkg->name);
-diff --git a/src/opkg-cl.c b/src/opkg-cl.c
-index a1d121f..6378380 100644
---- a/src/opkg-cl.c
-+++ b/src/opkg-cl.c
-@@ -51,6 +51,7 @@ enum {
- 	ARGS_OPT_AUTOREMOVE,
- 	ARGS_OPT_CACHE,
-         ARGS_OPT_COMBINE,
-+	ARGS_OPT_NOINSTALL_RECOMMENDS,
- };
- 
- static struct option long_options[] = {
-@@ -91,6 +92,7 @@ static struct option long_options[] = {
- 	{"noaction", 0, 0, ARGS_OPT_NOACTION},
- 	{"download-only", 0, 0, ARGS_OPT_DOWNLOAD_ONLY},
- 	{"nodeps", 0, 0, ARGS_OPT_NODEPS},
-+	{"no-install-recommends", 0, 0, ARGS_OPT_NOINSTALL_RECOMMENDS},
- 	{"offline", 1, 0, 'o'},
- 	{"offline-root", 1, 0, 'o'},
- 	{"add-arch", 1, 0, ARGS_OPT_ADD_ARCH},
-@@ -201,6 +203,9 @@ args_parse(int argc, char *argv[])
- 		case ARGS_OPT_NOACTION:
- 			conf->noaction = 1;
- 			break;
-+		case ARGS_OPT_NOINSTALL_RECOMMENDS:
-+			conf->noinstall_recommends = 1;
-+			break;
-         case ARGS_OPT_DOWNLOAD_ONLY:
- 			conf->download_only = 1;
- 			break;
-@@ -300,6 +305,8 @@ usage()
- 	printf("\t--noaction                      No action -- test only\n");
- 	printf("\t--download-only                 No action -- download only\n");
- 	printf("\t--nodeps                        Do not follow dependencies\n");
-+	printf("\t--no-install-recommends\n");
-+	printf("\t                                Do not install any recommended packages\n");
- 	printf("\t--force-removal-of-dependent-packages\n");
- 	printf("\t                                Remove package and all dependencies\n");
- 	printf("\t--autoremove                    Remove packages that were installed\n");
--- 
-2.1.3
-
diff --git a/meta/recipes-devtools/opkg/opkg/opkg-configure.service b/meta/recipes-devtools/opkg/opkg/opkg-configure.service
index b18295b..8e74026 100644
--- a/meta/recipes-devtools/opkg/opkg/opkg-configure.service
+++ b/meta/recipes-devtools/opkg/opkg/opkg-configure.service
@@ -7,7 +7,7 @@ Before=sysinit.target
 [Service]
 Type=oneshot
 EnvironmentFile=-@SYSCONFDIR@/default/postinst
-ExecStart=-@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING = '1' ]; then @BINDIR@/opkg-cl configure > $LOGFILE 2>&1; else @BINDIR@/opkg-cl configure; fi"
+ExecStart=-@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING = '1' ]; then @BINDIR@/opkg configure > $LOGFILE 2>&1; else @BINDIR@/opkg configure; fi"
 ExecStartPost=@BASE_BINDIR@/systemctl disable opkg-configure.service
 StandardOutput=syslog
 RemainAfterExit=No
diff --git a/meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch b/meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch
deleted file mode 100644
index 8bde02a..0000000
--- a/meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d480d837ff57e855d1cf0b63054d6b1ad7aaf2ee Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 6 Jan 2015 17:54:43 -0800
-Subject: [PATCH] Makefile.am: remove ACLOCAL_AMFLAGS = -I shave -I m4
-
-Fixed:
-libtoolize:   error: AC_CONFIG_MACRO_DIRS([m4]) conflicts with ACLOCAL_AMFLAGS=-I shave.
-
-They are already included by configure.ac:
-AC_CONFIG_MACRO_DIR([m4])
-AC_CONFIG_MACRO_DIR([shave])
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile.am |    2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 8baa62c..6679f77 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,5 +1,3 @@
--ACLOCAL_AMFLAGS = -I shave -I m4
--
- SUBDIRS = libbb libopkg src tests utils man
- 
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
deleted file mode 100644
index b7574e5..0000000
--- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
+++ /dev/null
@@ -1,84 +0,0 @@
-SUMMARY = "Open Package Manager"
-SUMMARY_libopkg = "Open Package Manager library"
-SECTION = "base"
-HOMEPAGE = "http://code.google.com/p/opkg/"
-BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/opkg-cl.c;beginline=1;endline=20;md5=321f658c3f6b6c832e25c8850b5dffba"
-
-PE = "1"
-
-SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
-           file://no-install-recommends.patch \
-           file://add-exclude.patch \
-           file://remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch \
-           file://opkg-configure.service \
-           file://opkg.conf \
-           file://0001-opkg-key-Backport-improvements.patch \
-"
-
-SRC_URI[md5sum] = "40ed2aee15abc8d550539449630091bd"
-SRC_URI[sha256sum] = "0f40c7e457d81edf9aedc07c778f4697111ab163a38ef95999faece015453086"
-
-inherit autotools pkgconfig systemd
-
-SYSTEMD_SERVICE_${PN} = "opkg-configure.service"
-
-target_localstatedir := "${localstatedir}"
-OPKGLIBDIR = "${target_localstatedir}/lib"
-
-PACKAGECONFIG ??= ""
-
-PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,gpgme libgpg-error,gnupg"
-PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
-PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
-PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
-PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
-PACKAGECONFIG[pathfinder] = "--enable-pathfinder,--disable-pathfinder,pathfinder"
-
-EXTRA_OECONF = "\
-  --with-opkgetcdir=${sysconfdir} \
-  --with-opkglibdir=${OPKGLIBDIR} \
-"
-
-do_install_append () {
-	install -d ${D}${sysconfdir}/opkg
-	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
-	echo "option lists_dir ${OPKGLIBDIR}/opkg/lists" >>${D}${sysconfdir}/opkg/opkg.conf
-
-	# We need to create the lock directory
-	install -d ${D}${OPKGLIBDIR}/opkg
-
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
-		install -d ${D}${systemd_unitdir}/system
-		install -m 0644 ${WORKDIR}/opkg-configure.service ${D}${systemd_unitdir}/system/
-		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-			-e 's,@BINDIR@,${bindir},g' \
-			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
-			${D}${systemd_unitdir}/system/opkg-configure.service
-	fi
-
-	# The installed binary is 'opkg-cl' but people and scripts often expect
-	# it to just be 'opkg'
-	ln -sf opkg-cl ${D}${bindir}/opkg
-
-	rm ${D}${bindir}/update-alternatives
-}
-
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config run-postinsts"
-RDEPENDS_${PN}_class-native = ""
-RDEPENDS_${PN}_class-nativesdk = ""
-RREPLACES_${PN} = "opkg-nogpg opkg-collateral"
-RCONFLICTS_${PN} = "opkg-collateral"
-RPROVIDES_${PN} = "opkg-collateral"
-
-PACKAGES =+ "libopkg"
-
-FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
-FILES_${PN} += "${systemd_unitdir}/system/"
-
-BBCLASSEXTEND = "native nativesdk"
-
-CONFFILES_${PN} = "${sysconfdir}/opkg/opkg.conf"
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.0.bb b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
new file mode 100644
index 0000000..f4dbb2d
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
@@ -0,0 +1,72 @@
+SUMMARY = "Open Package Manager"
+SUMMARY_libopkg = "Open Package Manager library"
+SECTION = "base"
+HOMEPAGE = "http://code.google.com/p/opkg/"
+BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://src/opkg.c;beginline=2;endline=21;md5=90435a519c6ea69ef22e4a88bcc52fa0"
+
+DEPENDS = "libarchive"
+
+PE = "1"
+
+SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
+           file://opkg-configure.service \
+           file://opkg.conf \
+           file://0001-opkg_archive-add-support-for-empty-compressed-files.patch \
+"
+
+SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"
+SRC_URI[sha256sum] = "7f735d1cdb8ef3718fb0f9fba44ca0d9a5c90d3a7f014f37a6d2f9474f54988f"
+
+inherit autotools pkgconfig systemd
+
+SYSTEMD_SERVICE_${PN} = "opkg-configure.service"
+
+target_localstatedir := "${localstatedir}"
+OPKGLIBDIR = "${target_localstatedir}/lib"
+
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,gpgme libgpg-error,gnupg"
+PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
+PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
+PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
+PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
+PACKAGECONFIG[pathfinder] = "--enable-pathfinder,--disable-pathfinder,pathfinder"
+
+do_install_append () {
+	install -d ${D}${sysconfdir}/opkg
+	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
+	echo "option lists_dir ${OPKGLIBDIR}/opkg/lists" >>${D}${sysconfdir}/opkg/opkg.conf
+
+	# We need to create the lock directory
+	install -d ${D}${OPKGLIBDIR}/opkg
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
+		install -d ${D}${systemd_unitdir}/system
+		install -m 0644 ${WORKDIR}/opkg-configure.service ${D}${systemd_unitdir}/system/
+		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
+			-e 's,@BINDIR@,${bindir},g' \
+			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
+			${D}${systemd_unitdir}/system/opkg-configure.service
+	fi
+}
+
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config run-postinsts libarchive"
+RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-nativesdk = ""
+RREPLACES_${PN} = "opkg-nogpg opkg-collateral"
+RCONFLICTS_${PN} = "opkg-collateral"
+RPROVIDES_${PN} = "opkg-collateral"
+
+PACKAGES =+ "libopkg"
+
+FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
+FILES_${PN} += "${systemd_unitdir}/system/"
+
+BBCLASSEXTEND = "native nativesdk"
+
+CONFFILES_${PN} = "${sysconfdir}/opkg/opkg.conf"
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 58ea85e..53a8e1d 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -73,7 +73,7 @@ remove_pi_dir=1
 if $pm_installed; then
 	case $pm in
 		"ipk")
-			eval opkg-cl configure $append_log
+			eval opkg configure $append_log
 			;;
 
 		"deb")
-- 
1.9.1


