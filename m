Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 83ABC71C75
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:06 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 9284BB8736C; Thu,  8 Dec 2016 22:47:57 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:25 +0100
Message-Id: <1481233677-27298-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 01/33] dpkg: implement offline mode for update-alternatives
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:07 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 v2: Make update-alternatives optional. Enable it by default for class-target or if
     PREFERRED_PROVIDER_virtual/update-alternatives-native is set to dpkg-native.
     This should match the behaviour of opkg-utils.

     Added patch header (submitted).

 meta/recipes-devtools/dpkg/dpkg.inc                |  18 +-
 ...tinsts-expect-D-to-be-set-when-running-in.patch |  70 ----
 ...pdate-alternatives-Implement-offline-mode.patch | 401 +++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.18.7.bb          |   2 +-
 4 files changed, 411 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0003-update-alternatives-Implement-offline-mode.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index e8d8a9b..5695a35 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -1,9 +1,10 @@
 SUMMARY = "Package maintenance system from Debian"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
+PROVIDES = "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
 DEPENDS = "zlib bzip2 perl ncurses"
-DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
+DEPENDS_class-native = "bzip2-replacement-native zlib-native gettext-native perl-native"
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts perl"
 RDEPENDS_${PN}_class-native = "xz-native"
 
@@ -23,6 +24,12 @@ PERL_class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 export PERL_LIBDIR = "${libdir}/perl"
 PERL_LIBDIR_class-native = "${libdir}/perl-native/perl"
 
+UA = "update-alternatives"
+UA_native = "${@['', 'update-alternatives'][d.getVar('PREFERRED_PROVIDER_virtual/update-alternatives-native', True) == 'dpkg-native']}"
+
+PACKAGECONFIG ??= "${UA}"
+PACKAGECONFIG[update-alternatives] = "--enable-update-alternatives,--disable-update-alternatives"
+
 EXTRA_OECONF = "\
 		--disable-dselect \
 		--enable-start-stop-daemon \
@@ -43,8 +50,6 @@ do_configure () {
 
 do_install_append () {
 	if [ "${PN}" = "dpkg-native" ]; then
-		# update-alternatives doesn't have an offline mode
-		rm ${D}${bindir}/update-alternatives
 		sed -i -e 's|^#!.*${bindir}/perl-native.*/perl|#!/usr/bin/env nativeperl|' ${D}${bindir}/dpkg-*
 	else
 		sed -i -e 's|^#!.*${bindir}/perl-native.*/perl|#!/usr/bin/env perl|' ${D}${bindir}/dpkg-*
@@ -61,14 +66,9 @@ do_install_append () {
 	fi
 }
 
-PROV = "virtual/update-alternatives"
-PROV_class-native = ""
-
-PROVIDES += "${PROV}"
-
 PACKAGES =+ "update-alternatives-dpkg"
 FILES_update-alternatives-dpkg = "${bindir}/update-alternatives ${localstatedir}/lib/dpkg/alternatives ${sysconfdir}/alternatives"
-RPROVIDES_update-alternatives-dpkg += "update-alternatives"
+RPROVIDES_update-alternatives-dpkg = "update-alternatives"
 
 PACKAGES += "${PN}-perl"
 FILES_${PN}-perl = "${libdir}/perl"
diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
deleted file mode 100644
index 80504ce..0000000
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 24229971492515b64c81e8c6392e5dfbdc22b44c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 26 Aug 2015 16:25:45 +0300
-Subject: [PATCH 3/5] Our pre/postinsts expect $D to be set when running in a
- sysroot and don't expect a chroot. This matches up our system expectations
- with what dpkg does.
-
-Upstream-Status: Inappropriate [OE Specific]
-
-RP 2011/12/07
-ALIMON 2016/05/26
-
----
- src/script.c | 39 +++------------------------------------
- 1 file changed, 3 insertions(+), 36 deletions(-)
-
-diff --git a/src/script.c b/src/script.c
-index 3c88be8..ce66a86 100644
---- a/src/script.c
-+++ b/src/script.c
-@@ -97,43 +97,10 @@ setexecute(const char *path, struct stat *stab)
- static const char *
- maintscript_pre_exec(struct command *cmd)
- {
--	const char *admindir = dpkg_db_get_dir();
--	const char *changedir = fc_script_chrootless ? instdir : "/";
--	size_t instdirl = strlen(instdir);
--
--	if (*instdir && !fc_script_chrootless) {
--		if (strncmp(admindir, instdir, instdirl) != 0)
--			ohshit(_("admindir must be inside instdir for dpkg to work properly"));
--		if (setenv("DPKG_ADMINDIR", admindir + instdirl, 1) < 0)
--			ohshite(_("unable to setenv for subprocesses"));
--		if (setenv("DPKG_ROOT", "", 1) < 0)
--			ohshite(_("unable to setenv for subprocesses"));
--
--		if (chroot(instdir))
--			ohshite(_("failed to chroot to '%.250s'"), instdir);
-+	if (*instdir) {
-+		setenv("D", instdir, 1);
- 	}
--	/* Switch to a known good directory to give the maintainer script
--	 * a saner environment, also needed after the chroot(). */
--	if (chdir(changedir))
--		ohshite(_("failed to chdir to '%.255s'"), changedir);
--	if (debug_has_flag(dbg_scripts)) {
--		struct varbuf args = VARBUF_INIT;
--		const char **argv = cmd->argv;
--
--		while (*++argv) {
--			varbuf_add_char(&args, ' ');
--			varbuf_add_str(&args, *argv);
--		}
--		varbuf_end_str(&args);
--		debug(dbg_scripts, "fork/exec %s (%s )", cmd->filename,
--		      args.buf);
--		varbuf_destroy(&args);
--	}
--	if (!instdirl || fc_script_chrootless)
--		return cmd->filename;
--
--	assert(strlen(cmd->filename) >= instdirl);
--	return cmd->filename + instdirl;
-+	return cmd->filename;
- }
- 
- /**
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-update-alternatives-Implement-offline-mode.patch b/meta/recipes-devtools/dpkg/dpkg/0003-update-alternatives-Implement-offline-mode.patch
new file mode 100644
index 0000000..ef14c18
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-update-alternatives-Implement-offline-mode.patch
@@ -0,0 +1,401 @@
+Upstream-Status: Submitted [debian-dpkg@lists.debian.org (Wed, 7 Dec 2016 01:09:19 +0100)]
+
+From b4f0f6ced469095a2b21ddddb01b59c7aded057e Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Thu, 28 Aug 2014 05:20:21 +0200
+Subject: [PATCH] update-alternatives: Implement offline mode
+
+Lets update-alternatives manage symlinks inside a cross-arch root
+filesystem in a directory specified by DPKG_ROOT.
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+---
+ utils/Makefile.am           |   1 +
+ utils/update-alternatives.c | 175 ++++++++++++++++++++++++++++----------------
+ 2 files changed, 114 insertions(+), 62 deletions(-)
+
+diff --git a/utils/Makefile.am b/utils/Makefile.am
+index 83378ad..1f821c5 100644
+--- a/utils/Makefile.am
++++ b/utils/Makefile.am
+@@ -27,6 +27,7 @@ update_alternatives_SOURCES = \
+ update_alternatives_CPPFLAGS = \
+ 	-DALT_TMP_EXT=\".dpkg-tmp\" \
+ 	-DADMINDIR_ENVVAR=\"DPKG_ADMINDIR\" \
++	-DINSTDIR_ENVVAR=\"DPKG_ROOT\" \
+ 	$(AM_CPPFLAGS)
+ 
+ update_alternatives_LDADD = \
+diff --git a/utils/update-alternatives.c b/utils/update-alternatives.c
+index 5dc3213..2b49819 100644
+--- a/utils/update-alternatives.c
++++ b/utils/update-alternatives.c
+@@ -51,6 +51,7 @@
+ #define PROGNAME "update-alternatives"
+ 
+ static const char *altdir = SYSCONFDIR "/alternatives";
++static const char *instdir;
+ static const char *admdir;
+ 
+ static const char *prog_path = "update-alternatives";
+@@ -64,6 +65,27 @@ static int opt_verbose = 0;
+ static int opt_force = 0;
+ 
+ /*
++ * Types.
++ */
++
++enum alternative_path_status {
++	ALT_PATH_SYMLINK,
++	ALT_PATH_MISSING,
++	ALT_PATH_OTHER,
++};
++
++
++/*
++ * Predeclarations.
++ */
++
++static char * DPKG_ATTR_PRINTF(1)
++xasprintf(const char *fmt, ...);
++
++static enum alternative_path_status
++alternative_path_classify(const char *linkname);
++
++/*
+  * Functions.
+  */
+ 
+@@ -270,7 +292,7 @@ xstrdup(const char *str)
+ }
+ 
+ static char *
+-areadlink(const char *linkname)
++_areadlink(const char *linkname)
+ {
+ 	struct stat st;
+ 	char *buf;
+@@ -303,6 +325,19 @@ areadlink(const char *linkname)
+ }
+ 
+ static char *
++areadlink(const char *linkname)
++{
++	char *instdir_linkname;
++	char *ret;
++
++	instdir_linkname = xasprintf("%s%s", instdir, linkname);
++	ret = _areadlink(instdir_linkname);
++	free(instdir_linkname);
++
++	return ret;
++}
++
++static char *
+ xreadlink(const char *linkname)
+ {
+ 	char *buf;
+@@ -348,9 +383,22 @@ set_action(const char *new_action)
+ }
+ 
+ static const char *
++instdir_init(void)
++{
++	const char *dpkg_instdir;
++
++	dpkg_instdir = getenv(INSTDIR_ENVVAR);
++	if (dpkg_instdir)
++		return dpkg_instdir;
++
++	return "";
++}
++
++static const char *
+ admindir_init(void)
+ {
+ 	const char *basedir, *basedir_env;
++	size_t length;
+ 
+ 	/* Try to get the admindir from an environment variable, usually set
+ 	 * by the system package manager. */
+@@ -360,6 +408,12 @@ admindir_init(void)
+ 	else
+ 		basedir = ADMINDIR;
+ 
++	/* If instdir is set and admindir is below instdir, treat admindir
++	 * as relative. */
++	length = strlen(instdir);
++	if (strncmp(basedir, instdir, length) == 0)
++		basedir += length;
++
+ 	return xasprintf("%s/%s", basedir, "alternatives");
+ }
+ 
+@@ -432,25 +486,43 @@ rename_mv(const char *src, const char *dst)
+ static void
+ checked_symlink(const char *filename, const char *linkname)
+ {
+-	if (symlink(filename, linkname))
++	char *instdir_linkname;
++
++	instdir_linkname = xasprintf("%s%s", instdir, linkname);
++
++	if (symlink(filename, instdir_linkname))
+ 		syserr(_("error creating symbolic link '%.255s'"), linkname);
++
++	free(instdir_linkname);
+ }
+ 
+ static void
+ checked_mv(const char *src, const char *dst)
+ {
+-	if (!rename_mv(src, dst))
++	char *instdir_src;
++	char *instdir_dst;
++
++	instdir_src = xasprintf("%s%s", instdir, src);
++	instdir_dst = xasprintf("%s%s", instdir, dst);
++
++	if (!rename_mv(instdir_src, instdir_dst))
+ 		syserr(_("unable to install '%.250s' as '%.250s'"), src, dst);
++
++	free(instdir_src);
++	free(instdir_dst);
+ }
+ 
+ static void
+ checked_rm(const char *f)
+ {
+-	if (!unlink(f))
+-		return;
++	char *instdir_f;
+ 
+-	if (errno != ENOENT)
++	instdir_f = xasprintf("%s%s", instdir, f);
++
++	if (unlink(instdir_f) && errno != ENOENT)
+ 		syserr(_("unable to remove '%s'"), f);
++
++	free(instdir_f);
+ }
+ 
+ static void DPKG_ATTR_PRINTF(1)
+@@ -567,16 +639,11 @@ fileset_has_slave(struct fileset *fs, const char *name)
+ static bool
+ fileset_can_install_slave(struct fileset *fs, const char *slave_name)
+ {
+-	struct stat st;
+-
+ 	/* Decide whether the slave alternative must be setup */
+ 	if (fileset_has_slave(fs, slave_name)) {
+ 		const char *slave = fileset_get_slave(fs, slave_name);
+ 
+-		errno = 0;
+-		if (stat(slave, &st) == -1 && errno != ENOENT)
+-			syserr(_("cannot stat file '%s'"), slave);
+-		if (errno == 0)
++		if (alternative_path_classify(slave) != ALT_PATH_MISSING)
+ 			return true;
+ 	}
+ 
+@@ -1039,10 +1106,15 @@ static int
+ altdb_get_namelist(struct dirent ***table)
+ {
+ 	int count;
++	char *instdir_admdir;
+ 
+-	count = scandir(admdir, table, altdb_filter_namelist, alphasort);
++	instdir_admdir = xasprintf("%s%s", instdir, admdir);
++
++	count = scandir(instdir_admdir, table, altdb_filter_namelist, alphasort);
+ 	if (count < 0)
+-		syserr(_("cannot scan directory '%.255s'"), admdir);
++		syserr(_("cannot scan directory '%.255s'"), instdir_admdir);
++
++	free(instdir_admdir);
+ 
+ 	return count;
+ }
+@@ -1167,7 +1239,6 @@ alternative_parse_fileset(struct alternative *a, struct altdb_context *ctx)
+ {
+ 	struct fileset *fs;
+ 	struct slave_link *sl;
+-	struct stat st;
+ 	char *master_file;
+ 
+ 	master_file = altdb_get_line(ctx, _("master file"));
+@@ -1180,12 +1251,9 @@ alternative_parse_fileset(struct alternative *a, struct altdb_context *ctx)
+ 	if (fs)
+ 		ctx->bad_format(ctx, _("duplicate path %s"), master_file);
+ 
+-	if (stat(master_file, &st)) {
++	if (alternative_path_classify(master_file) == ALT_PATH_MISSING) {
+ 		char *junk;
+ 
+-		if (errno != ENOENT)
+-			syserr(_("cannot stat file '%s'"), master_file);
+-
+ 		/* File not found - remove. */
+ 		if (ctx->flags & ALTDB_WARN_PARSER)
+ 			warning(_("alternative %s (part of link group %s) "
+@@ -1248,7 +1316,7 @@ alternative_load(struct alternative *a, enum altdb_flags flags)
+ 		ctx.bad_format = altdb_parse_stop;
+ 	else
+ 		ctx.bad_format = altdb_parse_error;
+-	ctx.filename = xasprintf("%s/%s", admdir, a->master_name);
++	ctx.filename = xasprintf("%s%s/%s", instdir, admdir, a->master_name);
+ 
+ 	/* Open the alternative file. */
+ 	ctx.fh = fopen(ctx.filename, "r");
+@@ -1340,7 +1408,7 @@ alternative_save(struct alternative *a)
+ 	file = xasprintf("%s/%s", admdir, a->master_name);
+ 	filenew = xasprintf("%s" ALT_TMP_EXT, file);
+ 
+-	ctx.filename = filenew;
++	ctx.filename = xasprintf("%s%s", instdir, filenew);
+ 	ctx.fh = fopen(ctx.filename, "w");
+ 	if (ctx.fh == NULL)
+ 		syserr(_("unable to create file '%s'"), ctx.filename);
+@@ -1379,6 +1447,7 @@ alternative_save(struct alternative *a)
+ 		syserr(_("unable to sync file '%s'"), ctx.filename);
+ 	if (fclose(ctx.fh))
+ 		syserr(_("unable to close file '%s'"), ctx.filename);
++	free(ctx.filename);
+ 
+ 	/* Put in place atomically. */
+ 	checked_mv(filenew, file);
+@@ -1399,7 +1468,6 @@ alternative_set_current(struct alternative *a, char *new_choice)
+ static const char *
+ alternative_get_current(struct alternative *a)
+ {
+-	struct stat st;
+ 	char *curlink;
+ 	char *file;
+ 
+@@ -1407,12 +1475,9 @@ alternative_get_current(struct alternative *a)
+ 		return a->current;
+ 
+ 	curlink = xasprintf("%s/%s", altdir, a->master_name);
+-	if (lstat(curlink, &st)) {
+-		if (errno == ENOENT) {
+-			free(curlink);
+-			return alternative_set_current(a, NULL);
+-		}
+-		syserr(_("cannot stat file '%s'"), curlink);
++	if (alternative_path_classify(curlink) == ALT_PATH_MISSING) {
++		free(curlink);
++		return alternative_set_current(a, NULL);
+ 	}
+ 
+ 	file = xreadlink(curlink);
+@@ -1674,14 +1739,8 @@ alternative_commit(struct alternative *a)
+ 	alternative_commit_operations_free(a);
+ }
+ 
+-enum alternative_path_status {
+-	ALT_PATH_SYMLINK,
+-	ALT_PATH_MISSING,
+-	ALT_PATH_OTHER,
+-};
+-
+ static enum alternative_path_status
+-alternative_path_classify(const char *linkname)
++_alternative_path_classify(const char *linkname)
+ {
+ 	struct stat st;
+ 
+@@ -1697,6 +1756,19 @@ alternative_path_classify(const char *linkname)
+ 	}
+ }
+ 
++static enum alternative_path_status
++alternative_path_classify(const char *linkname)
++{
++	enum alternative_path_status ret;
++	char *instdir_linkname;
++
++	instdir_linkname = xasprintf("%s%s", instdir, linkname);
++	ret = _alternative_path_classify(instdir_linkname);
++	free(instdir_linkname);
++
++	return ret;
++}
++
+ static bool
+ alternative_path_can_remove(const char *linkname)
+ {
+@@ -2120,13 +2192,7 @@ alternative_select_mode(struct alternative *a, const char *current_choice)
+ 	if (current_choice) {
+ 		/* Detect manually modified alternative, switch to manual. */
+ 		if (!alternative_has_choice(a, current_choice)) {
+-			struct stat st;
+-
+-			errno = 0;
+-			if (stat(current_choice, &st) == -1 && errno != ENOENT)
+-				syserr(_("cannot stat file '%s'"), current_choice);
+-
+-			if (errno == ENOENT) {
++			if (alternative_path_classify(current_choice) == ALT_PATH_MISSING) {
+ 				warning(_("%s/%s is dangling; it will be updated "
+ 				          "with best choice"), altdir, a->master_name);
+ 				alternative_set_status(a, ALT_ST_AUTO);
+@@ -2150,7 +2216,6 @@ alternative_evolve_slave(struct alternative *a, const char *cur_choice,
+                          struct slave_link *sl, struct fileset *fs)
+ {
+ 	struct slave_link *sl_old;
+-	struct stat st;
+ 	char *new_file = NULL;
+ 	const char *old, *new;
+ 
+@@ -2174,17 +2239,7 @@ alternative_evolve_slave(struct alternative *a, const char *cur_choice,
+ 	}
+ 	if (strcmp(old, new) != 0 &&
+ 	    alternative_path_classify(old) == ALT_PATH_SYMLINK) {
+-		bool rename_link = false;
+-
+-		if (new_file) {
+-			errno = 0;
+-			if (stat(new_file, &st) == -1 && errno != ENOENT)
+-				syserr(_("cannot stat file '%s'"),
+-				       new_file);
+-			rename_link = (errno == 0);
+-		}
+-
+-		if (rename_link) {
++		if (new_file && alternative_path_classify(new_file) != ALT_PATH_MISSING) {
+ 			info(_("renaming %s slave link from %s to %s"),
+ 			     sl->name, old, new);
+ 			checked_mv(old, new);
+@@ -2474,7 +2529,6 @@ alternative_check_install_args(struct alternative *inst_alt,
+ 	struct alternative_map *alt_map_links, *alt_map_parent;
+ 	struct alternative *found;
+ 	struct slave_link *sl;
+-	struct stat st;
+ 
+ 	alternative_check_name(inst_alt->master_name);
+ 	alternative_check_link(inst_alt->master_link);
+@@ -2499,13 +2553,9 @@ alternative_check_install_args(struct alternative *inst_alt,
+ 		      inst_alt->master_link, found->master_name);
+ 	}
+ 
+-	if (stat(fileset->master_file, &st) == -1) {
+-		if (errno == ENOENT)
+-			error(_("alternative path %s doesn't exist"),
+-			      fileset->master_file);
+-		else
+-			syserr(_("cannot stat file '%s'"), fileset->master_file);
+-	}
++	if (alternative_path_classify(fileset->master_file) == ALT_PATH_MISSING)
++		error(_("alternative path %s doesn't exist"),
++		      fileset->master_file);
+ 
+ 	for (sl = inst_alt->slaves; sl; sl = sl->next) {
+ 		const char *file = fileset_get_slave(fileset, sl->name);
+@@ -2580,6 +2630,7 @@ main(int argc, char **argv)
+ 	bindtextdomain(PACKAGE, LOCALEDIR);
+ 	textdomain(PACKAGE);
+ 
++	instdir = instdir_init();
+ 	admdir = admindir_init();
+ 
+ 	if (setvbuf(stdout, NULL, _IONBF, 0))
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
index 28fdc13..65a9bb6 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/
            file://dpkg-configure.service \
            file://add_armeb_triplet_entry.patch \
            file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
-           file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
+           file://0003-update-alternatives-Implement-offline-mode.patch \
            file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
            file://0005-dpkg-compiler.m4-remove-Wvla.patch \
            file://0006-add-musleabi-to-known-target-tripets.patch \
-- 
2.7.4


