Return-Path: <prvs=707896d6ab=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id F3D637E06E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 19:27:09 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x5OJKvAe017569 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 14:27:10 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2t9gbyfmfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 14:27:10 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x5OJRAXH011781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 14:27:10 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 24 Jun 2019 14:27:09 -0500
Received: from delcastillo3.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Mon, 24 Jun 2019 14:27:09 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2019 14:27:06 -0500
Message-ID: <20190624192706.16817-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <31526320140c91a4d7fde587a5e475e2071c00e0.camel@linuxfoundation.org>
References: <31526320140c91a4d7fde587a5e475e2071c00e0.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-24_13:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH v2] opkg: upgrade to version 0.4.1
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
X-List-Received-Date: Mon, 24 Jun 2019 19:27:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Drop 0001-libopkg-add-add-ignore-recommends-option.patch
- Drop 0001-opkg-add-target-for-testsuite-installation.patch
- Drop 0001-regress-issue72.py-resolve-paths-before-comparision.patch
- Remove test binaries tests\libopkg_test, leftovers from make dist
process

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...pkg-add-add-ignore-recommends-option.patch | 259 ------------------
 ...dd-target-for-testsuite-installation.patch |  43 ---
 ....py-resolve-paths-before-comparision.patch |  31 ---
 .../opkg/{opkg_0.4.0.bb => opkg_0.4.1.bb}     |  17 +-
 4 files changed, 12 insertions(+), 338 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends-option.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-installation.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch
 rename meta/recipes-devtools/opkg/{opkg_0.4.0.bb => opkg_0.4.1.bb} (84%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends-option.patch b/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends-option.patch
deleted file mode 100644
index 47d1b3c37e..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends-option.patch
+++ /dev/null
@@ -1,259 +0,0 @@
-From 64aa98646a17c299bf37af2975b98daf5d7d30b4 Mon Sep 17 00:00:00 2001
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Date: Thu, 31 Jan 2019 18:16:08 -0600
-Subject: [PATCH] libopkg: add --add-ignore-recommends option
-
-Add option to ignore specific recommended packages. On the libsolv
-backed, this feature will only work on libsolv version > 0.7.2 [1].
-
-[1] https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_openSUSE_libsolv_issues_254&d=DwIBaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=wNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&m=GObNHzFJpWpf_PripIrf-K2RhsktYdAUEieAJexXOKw&s=3G-meChUqClFggFPqsrAxIZBfLnRKIHm62Uuy1X6nQQ&e=
-
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-
-Upstream-Status: Accepted
----
- libopkg/opkg_conf.c                           |  2 +
- libopkg/opkg_conf.h                           |  1 +
- .../solvers/internal/pkg_depends_internal.c   |  3 +-
- libopkg/solvers/libsolv/opkg_solver_libsolv.c | 21 ++++++-
- man/opkg.1.in                                 |  3 +
- src/opkg.c                                    |  6 ++
- tests/Makefile                                |  1 +
- tests/core/43_add_ignore_recommends.py        | 62 +++++++++++++++++++
- 8 files changed, 97 insertions(+), 2 deletions(-)
- create mode 100755 tests/core/43_add_ignore_recommends.py
-
-diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c
-index 06880a1..f2330cd 100644
---- a/libopkg/opkg_conf.c
-+++ b/libopkg/opkg_conf.c
-@@ -597,6 +597,7 @@ int opkg_conf_init(void)
-     pkg_dest_list_init(&opkg_config->tmp_dest_list);
-     nv_pair_list_init(&opkg_config->arch_list);
-     str_list_init(&opkg_config->exclude_list);
-+    str_list_init(&opkg_config->ignore_recommends_list);
- 
-     return 0;
- }
-@@ -938,6 +939,7 @@ void opkg_conf_deinit(void)
-     pkg_dest_list_deinit(&opkg_config->pkg_dest_list);
-     nv_pair_list_deinit(&opkg_config->arch_list);
-     str_list_deinit(&opkg_config->exclude_list);
-+    str_list_deinit(&opkg_config->ignore_recommends_list);
- 
-     if (opkg_config->verbosity >= DEBUG) {
-         hash_print_stats(&opkg_config->pkg_hash);
-diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
-index eb56a29..316c500 100644
---- a/libopkg/opkg_conf.h
-+++ b/libopkg/opkg_conf.h
-@@ -61,6 +61,7 @@ typedef struct opkg_conf {
-     pkg_dest_list_t tmp_dest_list;
-     nv_pair_list_t arch_list;
-     str_list_t exclude_list;
-+    str_list_t ignore_recommends_list;
- 
-     int restrict_to_default_dest;
-     pkg_dest_t *default_dest;
-diff --git a/libopkg/solvers/internal/pkg_depends_internal.c b/libopkg/solvers/internal/pkg_depends_internal.c
-index cd56d84..5deee70 100644
---- a/libopkg/solvers/internal/pkg_depends_internal.c
-+++ b/libopkg/solvers/internal/pkg_depends_internal.c
-@@ -228,7 +228,8 @@ int pkg_hash_fetch_unsatisfied_dependencies(pkg_t *pkg,
-                             || compound_depend->type == SUGGEST)
-                         && (satisfying_pkg->state_want == SW_DEINSTALL
-                             || satisfying_pkg->state_want == SW_PURGE
--                            || opkg_config->no_install_recommends);
-+                            || opkg_config->no_install_recommends
-+                            || str_list_contains(&opkg_config->ignore_recommends_list, satisfying_pkg->name));
-                 if (ignore) {
-                     opkg_msg(NOTICE,
-                              "%s: ignoring recommendation for "
-diff --git a/libopkg/solvers/libsolv/opkg_solver_libsolv.c b/libopkg/solvers/libsolv/opkg_solver_libsolv.c
-index 2b27e3a..403e07b 100644
---- a/libopkg/solvers/libsolv/opkg_solver_libsolv.c
-+++ b/libopkg/solvers/libsolv/opkg_solver_libsolv.c
-@@ -484,6 +484,7 @@ static void pkg2solvable(pkg_t *pkg, Solvable *solvable_out)
- static void populate_installed_repo(libsolv_solver_t *libsolv_solver)
- {
-     int i;
-+    Id what;
- 
-     pkg_vec_t *installed_pkgs = pkg_vec_alloc();
- 
-@@ -507,6 +508,15 @@ static void populate_installed_repo(libsolv_solver_t *libsolv_solver)
-         /* set solvable attributes */
-         pkg2solvable(pkg, solvable);
- 
-+        /* if the package is in ignore-recommends-list, disfavor installation */
-+        if (str_list_contains(&opkg_config->ignore_recommends_list, pkg->name)) {
-+            opkg_message(NOTICE, "Disfavor package: %s\n",
-+                         pkg->name);
-+            what = pool_str2id(libsolv_solver->pool, pkg->name, 1);
-+            queue_push2(&libsolv_solver->solver_jobs, SOLVER_SOLVABLE_NAME
-+                        | SOLVER_DISFAVOR, what);
-+        }
-+
-         /* if the package is not autoinstalled, mark it as user installed */
-         if (!pkg->auto_installed)
-             queue_push2(&libsolv_solver->solver_jobs, SOLVER_SOLVABLE
-@@ -539,7 +549,7 @@ static void populate_available_repos(libsolv_solver_t *libsolv_solver)
- {
-     int i;
-     Solvable *solvable;
--    Id solvable_id;
-+    Id solvable_id, what;
- 
-     pkg_vec_t *available_pkgs = pkg_vec_alloc();
- 
-@@ -608,6 +618,15 @@ static void populate_available_repos(libsolv_solver_t *libsolv_solver)
-         solvable = pool_id2solvable(libsolv_solver->pool, solvable_id);
-         pkg2solvable(pkg, solvable);
- 
-+        /* if the package is in ignore-recommends-list, disfavor installation */
-+        if (str_list_contains(&opkg_config->ignore_recommends_list, pkg->name)) {
-+            opkg_message(NOTICE, "Disfavor package: %s\n",
-+                         pkg->name);
-+            what = pool_str2id(libsolv_solver->pool, pkg->name, 1);
-+            queue_push2(&libsolv_solver->solver_jobs, SOLVER_SOLVABLE_NAME
-+                        | SOLVER_DISFAVOR, what);
-+        }
-+
-         /* if the --force-depends option is specified make dependencies weak */
-         if (opkg_config->force_depends)
-             queue_push2(&libsolv_solver->solver_jobs, SOLVER_SOLVABLE
-diff --git a/man/opkg.1.in b/man/opkg.1.in
-index 27fa9c1..f192c3b 100644
---- a/man/opkg.1.in
-+++ b/man/opkg.1.in
-@@ -162,6 +162,9 @@ priority \fIprio\fP. Lower priorities take precedence.
- \fB\--add-exclude <\fIname\fP>\fR
- Register package to be excluded from install
- .TP
-+\fB\--add-ignore-recommends <\fIname\fP>\fR
-+Register package to be ignored as a recomendee
-+.TP
- \fB\--prefer-arch-to-version\fR
- Use the architecture priority package rather than the higher version
- one if more than one candidate is found.
-diff --git a/src/opkg.c b/src/opkg.c
-index 650e278..3c93a3b 100644
---- a/src/opkg.c
-+++ b/src/opkg.c
-@@ -51,6 +51,7 @@ enum {
-     ARGS_OPT_ADD_DEST,
-     ARGS_OPT_SIZE,
-     ARGS_OPT_ADD_EXCLUDE,
-+    ARGS_OPT_ADD_IGNORE_RECOMMENDS,
-     ARGS_OPT_NOACTION,
-     ARGS_OPT_DOWNLOAD_ONLY,
-     ARGS_OPT_NODEPS,
-@@ -112,6 +113,7 @@ static struct option long_options[] = {
-     {"add-dest", 1, 0, ARGS_OPT_ADD_DEST},
-     {"size", 0, 0, ARGS_OPT_SIZE},
-     {"add-exclude", 1, 0, ARGS_OPT_ADD_EXCLUDE},
-+    {"add-ignore-recommends", 1, 0, ARGS_OPT_ADD_IGNORE_RECOMMENDS},
-     {"test", 0, 0, ARGS_OPT_NOACTION},
-     {"tmp-dir", 1, 0, 't'},
-     {"tmp_dir", 1, 0, 't'},
-@@ -234,6 +236,9 @@ static int args_parse(int argc, char *argv[])
-         case ARGS_OPT_ADD_EXCLUDE:
-             str_list_append(&opkg_config->exclude_list, optarg);
-             break;
-+        case ARGS_OPT_ADD_IGNORE_RECOMMENDS:
-+            str_list_append(&opkg_config->ignore_recommends_list, optarg);
-+            break;
-         case ARGS_OPT_SIZE:
-             opkg_config->size = 1;
-             break;
-@@ -343,6 +348,7 @@ static void usage()
-     printf("\t--add-dest <name>:<path>        Register destination with given path\n");
-     printf("\t--add-arch <arch>:<prio>        Register architecture with given priority\n");
-     printf("\t--add-exclude <name>            Register package to be excluded from install\n");
-+    printf("\t--add-ignore-recommends <name>  Register package to be ignored as a recomendee\n");
-     printf("\t--prefer-arch-to-version        Use the architecture priority package rather\n");
-     printf("\t                                than the higher version one if more\n");
-     printf("\t                                than one candidate is found.\n");
-diff --git a/tests/Makefile b/tests/Makefile
-index 8e5be08..799816d 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -42,6 +42,7 @@ REGRESSION_TESTS := core/01_install.py \
- 		    core/40_arch.py \
- 		    core/41_info_fields.py \
- 		    core/42_info_description.py \
-+		    core/43_add_ignore_recommends.py \
- 		    regress/issue26.py \
- 		    regress/issue31.py \
- 		    regress/issue32.py \
-diff --git a/tests/core/43_add_ignore_recommends.py b/tests/core/43_add_ignore_recommends.py
-new file mode 100755
-index 0000000..7da0096
---- /dev/null
-+++ b/tests/core/43_add_ignore_recommends.py
-@@ -0,0 +1,62 @@
-+#! /usr/bin/env python3
-+#
-+# Create package 'a' (1.0) which Recommends 'c'.
-+# Install 'a' with --add-ignore-recommends 'c'.
-+# Check that only 'a' (1.0) is installed.
-+# Create package 'b' which Depends on 'c'.
-+# Install 'a' & 'b', with --add-ignore-recommends 'c'.
-+# Verify that 'a','b' & 'c' are installed.
-+# Uninstall 'b' & 'c'.
-+# Create package 'a' (2.0), which Recommends 'c'.
-+# Upgrade 'a' with --add-ignore-recommends 'c'
-+# Verify that only 'a' (2.0) is installed
-+#
-+
-+import os
-+import opk, cfg, opkgcl
-+
-+opk.regress_init()
-+o = opk.OpkGroup()
-+
-+o.add(Package='a', Recommends='c', Version='1.0')
-+o.add(Package='b', Depends='c')
-+o.add(Package='c')
-+o.write_opk()
-+o.write_list()
-+
-+opkgcl.update()
-+
-+opkgcl.install('a', '--add-ignore-recommends c')
-+
-+if not opkgcl.is_installed('a'):
-+	opk.fail("Package 'a' installed but reports as not installed.")
-+
-+if opkgcl.is_installed('c'):
-+	opk.xfail("[libsolv<0.7.3] Package 'c' should not have been installed since it was in --add-ignore-recommends.")
-+
-+opkgcl.remove('a')
-+opkgcl.install('a b', '--add-ignore-recommends c')
-+
-+if not opkgcl.is_installed('a'):
-+	opk.fail("Package 'a' installed but reports as not installed.")
-+
-+if not opkgcl.is_installed('b'):
-+	opk.fail("Package 'b' installed but reports as not installed.")
-+
-+if not opkgcl.is_installed('c'):
-+	opk.fail("Package 'c' should have been installed since 'b' depends on it.")
-+
-+opkgcl.remove('b c', '--force-depends')
-+o.add(Package='a', Recommends='c', Version='2.0')
-+o.write_opk()
-+o.write_list()
-+
-+opkgcl.update()
-+
-+opkgcl.upgrade('a', '--add-ignore-recommends c')
-+
-+if not opkgcl.is_installed('a', '2.0'):
-+	opk.fail("Package 'a (2.0)' installed but reports as not installed.")
-+
-+if opkgcl.is_installed('c'):
-+	opk.fail("Package 'c' should not have been installed since it was in --add-ignore-recommends.")
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-installation.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-installation.patch
deleted file mode 100644
index 951c186767..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-installation.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 8fb0364bd0e19f35c20616dd1ab10aa00e08fa8f Mon Sep 17 00:00:00 2001
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Date: Wed, 10 Apr 2019 14:49:43 -0500
-Subject: [PATCH] opkg: add target for testsuite installation
-
-- Add target to install testsuite
-- Add override of opkg binary used during test via OPKG_PATH environment
-variable.
-
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
----
-Upstream-Status: Submitted
-
- Makefile.am  | 5 +++++
- tests/cfg.py | 2 +-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 90cfcae..1f6a784 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -18,3 +18,8 @@ run-tests:
- 	$(MAKE) -C tests DATADIR=@datadir@ SYSCONFDIR=@sysconfdir@ VARDIR=@localstatedir@
- 
- check: run-tests
-+
-+install-ptest:
-+	cp -r $(srcdir)/tests $(DESTDIR)
-+	cp Makefile $(DESTDIR)
-+	sed -e 's/^Makefile/_Makefile/' < Makefile > $(DESTDIR)/Makefile
-diff --git a/tests/cfg.py b/tests/cfg.py
-index 4efaff6..ca59d03 100644
---- a/tests/cfg.py
-+++ b/tests/cfg.py
-@@ -2,4 +2,4 @@ import os
- 
- opkdir = "/tmp/opk"
- offline_root = "/tmp/opkg"
--opkgcl = os.path.realpath("../src/opkg")
-+opkgcl = os.getenv('OPKG_PATH', os.path.realpath("../src/opkg"))
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch b/meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch
deleted file mode 100644
index 75ecb5fb42..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5f005830eea7d03c02107a3a3fc58907b0a037bf Mon Sep 17 00:00:00 2001
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Date: Mon, 8 Apr 2019 11:14:56 -0500
-Subject: [PATCH] regress/issue72.py: resolve paths before comparision
-
-In systems that have a volatile /tmp, the test incorrectly fails since
-it doesn't resolve the real path in all cases.
-
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
----
-Upstream-Status: Submitted
-
- tests/regress/issue72.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/regress/issue72.py b/tests/regress/issue72.py
-index 1626877..2f24dec 100755
---- a/tests/regress/issue72.py
-+++ b/tests/regress/issue72.py
-@@ -56,7 +56,7 @@ if not os.path.lexists("{}/{}".format(cfg.offline_root, long_filename2)):
- 				"not created.")
- 
- linky = os.path.realpath("{}/{}".format(cfg.offline_root, long_filename2))
--linky_dst = "{}/{}".format(cfg.offline_root, long_filename)
-+linky_dst = os.path.realpath("{}/{}".format(cfg.offline_root, long_filename))
- if linky != linky_dst:
- 	opk.fail("symlink path truncated.")
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.0.bb b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
similarity index 84%
rename from meta/recipes-devtools/opkg/opkg_0.4.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.4.1.bb
index e2305d096a..8c48d3097c 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
@@ -14,14 +14,11 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
-           file://0001-libopkg-add-add-ignore-recommends-option.patch \
-           file://0001-regress-issue72.py-resolve-paths-before-comparision.patch \
-           file://0001-opkg-add-target-for-testsuite-installation.patch \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "ae51d95fee599bb4dce08453529158f5"
-SRC_URI[sha256sum] = "f6c00515d8a2ad8f6742a8e73830315d1983ed0459cba77c4d656cfc9e7fe6fe"
+SRC_URI[md5sum] = "ba0c21305fc93b26e844981ef100dc85"
+SRC_URI[sha256sum] = "45ac1e037d3877f635d883f8a555e172883a25d3eeb7986c75890fdd31250a43"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
@@ -45,6 +42,16 @@ PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
 
 EXTRA_OECONF_class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
 
+# Release tarball has unused binaries on the tests folder, automatically created by automake.
+# For now, delete them to avoid packaging errors (wrong architecture)
+do_unpack_append () {
+    bb.build.exec_func('remove_test_binaries', d)
+}
+
+remove_test_binaries () {
+	rm ${WORKDIR}/opkg-${PV}/tests/libopkg_test*
+}
+
 do_install_append () {
 	install -d ${D}${sysconfdir}/opkg
 	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
-- 
2.21.0


