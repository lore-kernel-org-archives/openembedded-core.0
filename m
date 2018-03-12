Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58B1878879
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 08:39:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2C8cgNY009967
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 01:38:58 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 12 Mar 2018 01:37:52 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Mar 2018 16:38:51 +0800
Message-ID: <e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1520841539.git.Qi.Chen@windriver.com>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] systemd: upgrade to 237
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
X-List-Received-Date: Mon, 12 Mar 2018 08:39:07 -0000
Content-Type: text/plain

Upgrade systemd to 237.

Note that this version has dropped autotools support.

The following patches are rebased:
0004-Use-getenv-when-secure-versions-are-not-available.patch
0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
0018-check-for-uchar.h-in-configure.patch
0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
0001-add-fallback-parse_printf_format-implementation.patch
0002-src-basic-missing.h-check-for-missing-strndupa.patch
0007-check-for-missing-canonicalize_file_name.patch
0008-Do-not-enable-nss-tests.patch
0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch

The following backported patches are dropped:
0001-core-evaluate-presets-after-generators-have-run-6526.patch
0001-main-skip-many-initialization-steps-when-running-in-.patch
0001-meson-update-header-file-to-detect-memfd_create.patch
0003-fileio-include-sys-mman.h.patch

The following patch is dropped as autotools support is dropped:
0002-configure.ac-Check-if-memfd_create-is-already-define.patch

The following patches are newly added to fix problems:
0027-remove-nobody-user-group-checking.patch
0028-add-missing-FTW_-macros-for-musl.patch
0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch

Other changes are mostly autotools/meson related.

This new version has dropped ptest support, as there's no easy
way to do this in the framework of meson.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd.inc              |   2 +-
 ...v-when-secure-versions-are-not-available.patch} |  21 +-
 ...te-presets-after-generators-have-run-6526.patch |  69 ------
 ...any-initialization-steps-when-running-in-.patch | 163 -------------
 ...update-header-file-to-detect-memfd_create.patch |  28 ---
 ...t-install-dependency-links-at-install-tim.patch |  81 +++++++
 ...c-Check-if-memfd_create-is-already-define.patch |  27 ---
 .../systemd/0003-fileio-include-sys-mman.h.patch   |  26 --
 ...pper-instead-of-looking-for-relative-opti.patch |  64 +++++
 ...004-implment-systemd-sysv-install-for-OE.patch} |   8 +-
 ...t-install-dependency-links-at-install-tim.patch |  74 ------
 ...patch => 0005-rules-whitelist-hd-devices.patch} |   9 +-
 ...6-Make-root-s-home-directory-configurable.patch |  78 ++++++
 ...vert-rules-remove-firmware-loading-rules.patch} |   8 +-
 ...-check-for-missing-canonicalize_file_name.patch |  63 -----
 ...pper-instead-of-looking-for-relative-opti.patch |  40 ----
 .../systemd/0008-Do-not-enable-nss-tests.patch     |  35 ---
 ...remove-userspace-firmware-loading-suppor.patch} | 204 +++++++++-------
 ...=> 0009-remove-duplicate-include-uchar.h.patch} |  14 +-
 .../0010-check-for-uchar.h-in-meson.build.patch    |  45 ++++
 ...nes-Build-conditionally-when-HAVE_MYHOSTN.patch |  38 ---
 ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} |  26 +-
 ...es-watch-metadata-changes-in-ide-devices.patch} |   8 +-
 ...3-Make-root-s-home-directory-configurable.patch | 155 ------------
 ...lback-parse_printf_format-implementation.patch} |  86 ++++---
 ...sic-missing.h-check-for-missing-strndupa.patch} |  96 ++++----
 ...f-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  30 +--
 ...ssing.h-check-for-missing-__compar_fn_t-.patch} |  18 +-
 ...patch => 0017-Include-netinet-if_ether.h.patch} |  55 +++--
 ...-check-for-missing-canonicalize_file_name.patch |  47 ++++
 .../0018-check-for-uchar.h-in-configure.patch      |  44 ----
 ...le-nss-tests-if-nss-systemd-is-not-enable.patch |  29 +++
 ...xdecoct.c-Include-missing.h-for-strndupa.patch} |  15 +-
 ...c-Disable-tests-for-missing-typedefs-in-.patch} |  39 ++-
 ...=> 0022-don-t-use-glibc-specific-qsort_r.patch} |  26 +-
 ...ss-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  22 +-
 ...n_t-is-glibc-specific-use-raw-signature-.patch} |  14 +-
 ...ATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch} |  16 +-
 ...> 0026-Use-uintmax_t-for-handling-rlim_t.patch} |  22 +-
 .../0027-remove-nobody-user-group-checking.patch   |  63 +++++
 .../0028-add-missing-FTW_-macros-for-musl.patch    |  50 ++++
 ...nes-Build-conditionally-when-ENABLE_MYHOS.patch |  43 ++++
 ...-of-__register_atfork-for-non-glibc-build.patch |  45 ++++
 ...-ULONG_LONG_MAX-definition-in-case-of-mus.patch |  30 +++
 meta/recipes-core/systemd/systemd/run-ptest        |   6 -
 .../systemd/{systemd_234.bb => systemd_237.bb}     | 266 ++++++++-------------
 46 files changed, 1066 insertions(+), 1282 deletions(-)
 rename meta/recipes-core/systemd/systemd/{0004-Use-getenv-when-secure-versions-are-not-available.patch => 0001-Use-getenv-when-secure-versions-are-not-available.patch} (53%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
 rename meta/recipes-core/systemd/systemd/{0010-implment-systemd-sysv-install-for-OE.patch => 0004-implment-systemd-sysv-install-for-OE.patch} (89%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
 rename meta/recipes-core/systemd/systemd/{0012-rules-whitelist-hd-devices.patch => 0005-rules-whitelist-hd-devices.patch} (89%)
 create mode 100644 meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch
 rename meta/recipes-core/systemd/systemd/{0014-Revert-rules-remove-firmware-loading-rules.patch => 0007-Revert-rules-remove-firmware-loading-rules.patch} (81%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
 rename meta/recipes-core/systemd/systemd/{0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch => 0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch} (63%)
 rename meta/recipes-core/systemd/systemd/{0017-remove-duplicate-include-uchar.h.patch => 0009-remove-duplicate-include-uchar.h.patch} (78%)
 create mode 100644 meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
 rename meta/recipes-core/systemd/systemd/{0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch => 0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch} (58%)
 rename meta/recipes-core/systemd/systemd/{0020-rules-watch-metadata-changes-in-ide-devices.patch => 0012-rules-watch-metadata-changes-in-ide-devices.patch} (90%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
 rename meta/recipes-core/systemd/systemd/{0001-add-fallback-parse_printf_format-implementation.patch => 0013-add-fallback-parse_printf_format-implementation.patch} (88%)
 rename meta/recipes-core/systemd/systemd/{0002-src-basic-missing.h-check-for-missing-strndupa.patch => 0014-src-basic-missing.h-check-for-missing-strndupa.patch} (47%)
 rename meta/recipes-core/systemd/systemd/{0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch => 0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} (88%)
 rename meta/recipes-core/systemd/systemd/{0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch => 0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch} (77%)
 rename meta/recipes-core/systemd/systemd/{0006-Include-netinet-if_ether.h.patch => 0017-Include-netinet-if_ether.h.patch} (67%)
 create mode 100644 meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
 rename meta/recipes-core/systemd/systemd/{0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch => 0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch} (68%)
 rename meta/recipes-core/systemd/systemd/{0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch => 0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch} (49%)
 rename meta/recipes-core/systemd/systemd/{0011-don-t-use-glibc-specific-qsort_r.patch => 0022-don-t-use-glibc-specific-qsort_r.patch} (88%)
 rename meta/recipes-core/systemd/systemd/{0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch => 0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} (90%)
 rename meta/recipes-core/systemd/systemd/{0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch => 0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch} (77%)
 rename meta/recipes-core/systemd/systemd/{0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch => 0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch} (80%)
 rename meta/recipes-core/systemd/systemd/{0001-Use-uintmax_t-for-handling-rlim_t.patch => 0026-Use-uintmax_t-for-handling-rlim_t.patch} (89%)
 create mode 100644 meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-checking.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-macros-for-musl.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/run-ptest
 rename meta/recipes-core/systemd/{systemd_234.bb => systemd_237.bb} (71%)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index d99d150..5fa48e7a 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "c1edab7ad1e7ccc9be693bedfd464cd1cbffb395"
+SRCREV = "46659f7deb962f55c728e70597e37c2a3ab6326d"
 
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=git"
 
diff --git a/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
similarity index 53%
rename from meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
rename to meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
index ab2cbe0..f4c15e1 100644
--- a/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
@@ -1,23 +1,26 @@
-From 5765cda4f7243e240b1e8723dc536fb20503d544 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Nov 2016 19:28:32 -0800
-Subject: [PATCH 04/19] Use getenv when secure versions are not available
+From b1192a6e171413291d9d64fafc04773c6bbc9cab Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Fri, 23 Feb 2018 10:04:48 +0800
+Subject: [PATCH 01/31] Use getenv when secure versions are not available
 
 musl doesnt implement secure version, so we default
-to it if configure does not detect a secure imeplementation
+to it if configure does not detect a secure implementation
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 Upstream-Status: Denied
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  src/basic/missing.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 4a3fd9c..4936873 100644
+index 1280e6c41..39c1fb700 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -529,7 +529,7 @@ struct btrfs_ioctl_quota_ctl_args {
- #  ifdef HAVE___SECURE_GETENV
+@@ -605,7 +605,7 @@ struct btrfs_ioctl_quota_ctl_args {
+ #  if HAVE___SECURE_GETENV
  #    define secure_getenv __secure_getenv
  #  else
 -#    error "neither secure_getenv nor __secure_getenv are available"
@@ -26,5 +29,5 @@ index 4a3fd9c..4936873 100644
  #endif
  
 -- 
-2.10.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch b/meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
deleted file mode 100644
index df100e5..0000000
--- a/meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 28dd66ecfce743b1ea9046c7bb501e0fcaeff724 Mon Sep 17 00:00:00 2001
-From: Luca Bruno <luca.bruno@coreos.com>
-Date: Sun, 6 Aug 2017 13:24:24 +0000
-Subject: [PATCH] core: evaluate presets after generators have run (#6526)
-
-This commit moves the first-boot system preset-settings evaluation out
-of main and into the manager startup logic itself. Notably, it reverses
-the order between generators and presets evaluation, so that any changes
-performed by first-boot generators are taken into the account by presets
-logic.
-
-After this change, units created by a generator can be enabled as part
-of a preset.
-
-Upstream-Status: Backport
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- src/core/main.c    | 12 ++----------
- src/core/manager.c |  8 ++++++++
- 2 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/src/core/main.c b/src/core/main.c
-index dfedc3d..11ac9cf 100644
---- a/src/core/main.c
-+++ b/src/core/main.c
-@@ -1809,18 +1809,10 @@ int main(int argc, char *argv[]) {
-                 if (prctl(PR_SET_CHILD_SUBREAPER, 1) < 0)
-                         log_warning_errno(errno, "Failed to make us a subreaper: %m");
- 
--        if (arg_system) {
-+        if (arg_system)
-+                /* Bump up RLIMIT_NOFILE for systemd itself */
-                 (void) bump_rlimit_nofile(&saved_rlimit_nofile);
- 
--                if (empty_etc) {
--                        r = unit_file_preset_all(UNIT_FILE_SYSTEM, 0, NULL, UNIT_FILE_PRESET_ENABLE_ONLY, NULL, 0);
--                        if (r < 0)
--                                log_full_errno(r == -EEXIST ? LOG_NOTICE : LOG_WARNING, r, "Failed to populate /etc with preset unit settings, ignoring: %m");
--                        else
--                                log_info("Populated /etc with preset unit settings.");
--                }
--        }
--
-         r = manager_new(arg_system ? UNIT_FILE_SYSTEM : UNIT_FILE_USER, arg_action == ACTION_TEST, &m);
-         if (r < 0) {
-                 log_emergency_errno(r, "Failed to allocate manager object: %m");
-diff --git a/src/core/manager.c b/src/core/manager.c
-index 1aadb70..fb5e2b5 100644
---- a/src/core/manager.c
-+++ b/src/core/manager.c
-@@ -1328,6 +1328,14 @@ int manager_startup(Manager *m, FILE *serialization, FDSet *fds) {
-         if (r < 0)
-                 return r;
- 
-+        if (m->first_boot && m->unit_file_scope == UNIT_FILE_SYSTEM) {
-+                q = unit_file_preset_all(UNIT_FILE_SYSTEM, 0, NULL, UNIT_FILE_PRESET_ENABLE_ONLY, NULL, 0);
-+                if (q < 0)
-+                        log_full_errno(q == -EEXIST ? LOG_NOTICE : LOG_WARNING, q, "Failed to populate /etc with preset unit settings, ignoring: %m");
-+                else
-+                        log_info("Populated /etc with preset unit settings.");
-+        }
-+
-         lookup_paths_reduce(&m->lookup_paths);
-         manager_build_unit_path_cache(m);
- 
--- 
-2.10.2
-
diff --git a/meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch b/meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
deleted file mode 100644
index a033b04..0000000
--- a/meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From dea374e898a749a0474b72b2015cca9009b1432b Mon Sep 17 00:00:00 2001
-From: Lennart Poettering <lennart@poettering.net>
-Date: Wed, 13 Sep 2017 10:31:40 +0200
-Subject: [PATCH] main: skip many initialization steps when running in --test
- mode
-
-Most importantly, don't collect open socket activation fds when in
---test mode. This specifically created a problem because we invoke
-pager_open() beforehand (which these days makes copies of the original
-stdout/stderr in order to be able to restore them when the pager goes
-away) and we might mistakenly the fd copies it creates as socket
-activation fds.
-
-Fixes: #6383
-
-Upstream-Status: Backport
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- src/core/main.c | 108 +++++++++++++++++++++++++++++---------------------------
- 1 file changed, 56 insertions(+), 52 deletions(-)
-
-diff --git a/src/core/main.c b/src/core/main.c
-index 11ac9cf..d1a53a5 100644
---- a/src/core/main.c
-+++ b/src/core/main.c
-@@ -1679,20 +1679,22 @@ int main(int argc, char *argv[]) {
-         log_close();
- 
-         /* Remember open file descriptors for later deserialization */
--        r = fdset_new_fill(&fds);
--        if (r < 0) {
--                log_emergency_errno(r, "Failed to allocate fd set: %m");
--                error_message = "Failed to allocate fd set";
--                goto finish;
--        } else
--                fdset_cloexec(fds, true);
-+        if (arg_action == ACTION_RUN) {
-+                r = fdset_new_fill(&fds);
-+                if (r < 0) {
-+                        log_emergency_errno(r, "Failed to allocate fd set: %m");
-+                        error_message = "Failed to allocate fd set";
-+                        goto finish;
-+                } else
-+                        fdset_cloexec(fds, true);
- 
--        if (arg_serialization)
--                assert_se(fdset_remove(fds, fileno(arg_serialization)) >= 0);
-+                if (arg_serialization)
-+                        assert_se(fdset_remove(fds, fileno(arg_serialization)) >= 0);
- 
--        if (arg_system)
--                /* Become a session leader if we aren't one yet. */
--                setsid();
-+                if (arg_system)
-+                        /* Become a session leader if we aren't one yet. */
-+                        setsid();
-+        }
- 
-         /* Move out of the way, so that we won't block unmounts */
-         assert_se(chdir("/") == 0);
-@@ -1762,56 +1764,58 @@ int main(int argc, char *argv[]) {
-                           arg_action == ACTION_TEST ? " test" : "", getuid(), t);
-         }
- 
--        if (arg_system && !skip_setup) {
--                if (arg_show_status > 0)
--                        status_welcome();
-+        if (arg_action == ACTION_RUN) {
-+                if (arg_system && !skip_setup) {
-+                        if (arg_show_status > 0)
-+                                status_welcome();
- 
--                hostname_setup();
--                machine_id_setup(NULL, arg_machine_id, NULL);
--                loopback_setup();
--                bump_unix_max_dgram_qlen();
-+                        hostname_setup();
-+                        machine_id_setup(NULL, arg_machine_id, NULL);
-+                        loopback_setup();
-+                        bump_unix_max_dgram_qlen();
- 
--                test_usr();
--        }
-+                        test_usr();
-+                }
- 
--        if (arg_system && arg_runtime_watchdog > 0 && arg_runtime_watchdog != USEC_INFINITY)
--                watchdog_set_timeout(&arg_runtime_watchdog);
-+                if (arg_system && arg_runtime_watchdog > 0 && arg_runtime_watchdog != USEC_INFINITY)
-+                        watchdog_set_timeout(&arg_runtime_watchdog);
- 
--        if (arg_timer_slack_nsec != NSEC_INFINITY)
--                if (prctl(PR_SET_TIMERSLACK, arg_timer_slack_nsec) < 0)
--                        log_error_errno(errno, "Failed to adjust timer slack: %m");
-+                if (arg_timer_slack_nsec != NSEC_INFINITY)
-+                        if (prctl(PR_SET_TIMERSLACK, arg_timer_slack_nsec) < 0)
-+                                log_error_errno(errno, "Failed to adjust timer slack: %m");
- 
--        if (arg_system && !cap_test_all(arg_capability_bounding_set)) {
--                r = capability_bounding_set_drop_usermode(arg_capability_bounding_set);
--                if (r < 0) {
--                        log_emergency_errno(r, "Failed to drop capability bounding set of usermode helpers: %m");
--                        error_message = "Failed to drop capability bounding set of usermode helpers";
--                        goto finish;
--                }
--                r = capability_bounding_set_drop(arg_capability_bounding_set, true);
--                if (r < 0) {
--                        log_emergency_errno(r, "Failed to drop capability bounding set: %m");
--                        error_message = "Failed to drop capability bounding set";
--                        goto finish;
-+                if (arg_system && !cap_test_all(arg_capability_bounding_set)) {
-+                        r = capability_bounding_set_drop_usermode(arg_capability_bounding_set);
-+                        if (r < 0) {
-+                                log_emergency_errno(r, "Failed to drop capability bounding set of usermode helpers: %m");
-+                                error_message = "Failed to drop capability bounding set of usermode helpers";
-+                                goto finish;
-+                        }
-+                        r = capability_bounding_set_drop(arg_capability_bounding_set, true);
-+                        if (r < 0) {
-+                                log_emergency_errno(r, "Failed to drop capability bounding set: %m");
-+                                error_message = "Failed to drop capability bounding set";
-+                                goto finish;
-+                        }
-                 }
--        }
- 
--        if (arg_syscall_archs) {
--                r = enforce_syscall_archs(arg_syscall_archs);
--                if (r < 0) {
--                        error_message = "Failed to set syscall architectures";
--                        goto finish;
-+                if (arg_syscall_archs) {
-+                        r = enforce_syscall_archs(arg_syscall_archs);
-+                        if (r < 0) {
-+                                error_message = "Failed to set syscall architectures";
-+                                goto finish;
-+                        }
-                 }
--        }
- 
--        if (!arg_system)
--                /* Become reaper of our children */
--                if (prctl(PR_SET_CHILD_SUBREAPER, 1) < 0)
--                        log_warning_errno(errno, "Failed to make us a subreaper: %m");
-+                if (!arg_system)
-+                        /* Become reaper of our children */
-+                        if (prctl(PR_SET_CHILD_SUBREAPER, 1) < 0)
-+                                log_warning_errno(errno, "Failed to make us a subreaper: %m");
- 
--        if (arg_system)
--                /* Bump up RLIMIT_NOFILE for systemd itself */
--                (void) bump_rlimit_nofile(&saved_rlimit_nofile);
-+                if (arg_system)
-+                        /* Bump up RLIMIT_NOFILE for systemd itself */
-+                        (void) bump_rlimit_nofile(&saved_rlimit_nofile);
-+        }
- 
-         r = manager_new(arg_system ? UNIT_FILE_SYSTEM : UNIT_FILE_USER, arg_action == ACTION_TEST, &m);
-         if (r < 0) {
--- 
-2.10.2
-
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch b/meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
deleted file mode 100644
index c643120..0000000
--- a/meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 2207e1ffe4f7e2dcc5e745dadb48738aa1048d63 Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Sun, 26 Nov 2017 02:17:06 +0900
-Subject: [PATCH 1/3] meson: update header file to detect memfd_create()
-
----
-Upstream-Status: Backport
-
- meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 20b27c860..550dd4ad8 100644
---- a/meson.build
-+++ b/meson.build
-@@ -414,7 +414,8 @@ foreach ident : ['secure_getenv', '__secure_getenv']
- endforeach
- 
- foreach ident : [
--        ['memfd_create',      '''#include <sys/memfd.h>'''],
-+        ['memfd_create',      '''#define _GNU_SOURCE
-+                                 #include <sys/mman.h>'''],
-         ['gettid',            '''#include <sys/types.h>'''],
-         ['pivot_root',        '''#include <stdlib.h>'''],     # no known header declares pivot_root
-         ['name_to_handle_at', '''#define _GNU_SOURCE
--- 
-2.16.1
-
diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
new file mode 100644
index 0000000..c3f4b39
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -0,0 +1,81 @@
+From c93eb6cdec03f5e243e59e95dc49273fcb90e7c1 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Fri, 23 Feb 2018 10:23:40 +0800
+Subject: [PATCH 02/31] binfmt: Don't install dependency links at install time
+ for the binfmt services
+
+use [Install] blocks so that they get created when the service is enabled
+like a traditional service.
+
+The [Install] blocks were rejected upstream as they don't have a way to
+"enable" it on install without static symlinks which can't be disabled,
+only masked. We however can do that in a postinst.
+
+Upstream-Status: Denied
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ units/meson.build                       | 6 ++----
+ units/proc-sys-fs-binfmt_misc.automount | 3 +++
+ units/systemd-binfmt.service.in         | 4 ++++
+ 3 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/units/meson.build b/units/meson.build
+index 814ee7885..49ace0d0f 100644
+--- a/units/meson.build
++++ b/units/meson.build
+@@ -60,8 +60,7 @@ units = [
+         ['poweroff.target',                     '',
+          'runlevel0.target'],
+         ['printer.target',                      ''],
+-        ['proc-sys-fs-binfmt_misc.automount',   'ENABLE_BINFMT',
+-         'sysinit.target.wants/'],
++        ['proc-sys-fs-binfmt_misc.automount',   'ENABLE_BINFMT'],
+         ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
+         ['reboot.target',                       '',
+          'runlevel6.target ctrl-alt-del.target'],
+@@ -144,8 +143,7 @@ in_units = [
+         ['systemd-ask-password-console.service', ''],
+         ['systemd-ask-password-wall.service',    ''],
+         ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
+-        ['systemd-binfmt.service',               'ENABLE_BINFMT',
+-         'sysinit.target.wants/'],
++        ['systemd-binfmt.service',               'ENABLE_BINFMT'],
+         ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
+         ['systemd-exit.service',                 ''],
+         ['systemd-firstboot.service',            'ENABLE_FIRSTBOOT',
+diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
+index 30a6bc991..4231f3b70 100644
+--- a/units/proc-sys-fs-binfmt_misc.automount
++++ b/units/proc-sys-fs-binfmt_misc.automount
+@@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/proc/sys/
+ 
+ [Automount]
+ Where=/proc/sys/fs/binfmt_misc
++
++[Install]
++WantedBy=sysinit.target
+diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
+index df9396d89..0687f4648 100644
+--- a/units/systemd-binfmt.service.in
++++ b/units/systemd-binfmt.service.in
+@@ -13,6 +13,7 @@ Documentation=man:systemd-binfmt.service(8) man:binfmt.d(5)
+ Documentation=https://www.kernel.org/doc/Documentation/binfmt_misc.txt
+ DefaultDependencies=no
+ Conflicts=shutdown.target
++Wants=proc-sys-fs-binfmt_misc.automount
+ After=proc-sys-fs-binfmt_misc.automount
+ Before=sysinit.target shutdown.target
+ ConditionPathIsReadWrite=/proc/sys/
+@@ -27,3 +28,6 @@ Type=oneshot
+ RemainAfterExit=yes
+ ExecStart=@rootlibexecdir@/systemd-binfmt
+ TimeoutSec=90s
++
++[Install]
++WantedBy=sysinit.target
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch b/meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
deleted file mode 100644
index da798a7..0000000
--- a/meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 025408c87869962f511de044dd41a1f4b1d80165 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jan 2018 11:53:38 -0800
-Subject: [PATCH 2/3] configure.ac: Check if memfd_create is already defined
-
-Upstream-Status: Inappropriate [upstream systemd uses meson]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 3674190fb..c7a184d72 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -340,6 +340,7 @@ AC_CHECK_DECLS([
-         [], [], [[
- #include <sys/types.h>
- #include <unistd.h>
-+#include <sys/mman.h>
- #include <sys/mount.h>
- #include <fcntl.h>
- #include <sched.h>
--- 
-2.16.1
-
diff --git a/meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch b/meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
deleted file mode 100644
index c466d0d..0000000
--- a/meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 52e922343faaa87b9efb8aa9ea578399ccc9bec9 Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Sun, 26 Nov 2017 02:40:23 +0900
-Subject: [PATCH 3/3] fileio: include sys/mman.h
-
----
-Upstream-Status: Backport
-
- src/basic/fileio.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/basic/fileio.c b/src/basic/fileio.c
-index 9a185e3e6..1015afd29 100644
---- a/src/basic/fileio.c
-+++ b/src/basic/fileio.c
-@@ -24,6 +24,7 @@
- #include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <sys/mman.h>
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <unistd.h>
--- 
-2.16.1
-
diff --git a/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
new file mode 100644
index 0000000..28f1b21
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
@@ -0,0 +1,64 @@
+From 8b9d194e956848e0d1fb35ef2fba714b2691ebe6 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 28 Feb 2018 20:47:49 -0800
+Subject: [PATCH 03/31] use lnr wrapper instead of looking for --relative
+ option for ln
+
+Remove file manually to avoid the 'File Exists' error when creating
+symlink. This is because the original 'ln' command uses '-f' option.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build                 | 4 ----
+ tools/meson-make-symlink.sh | 3 ++-
+ units/meson-add-wants.sh    | 7 ++++++-
+ 3 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 36a62d280..7347ea880 100644
+--- a/meson.build
++++ b/meson.build
+@@ -570,10 +570,6 @@ endforeach
+ 
+ conf.set_quoted('TELINIT', get_option('telinit-path'))
+ 
+-if run_command('ln', '--relative', '--help').returncode() != 0
+-        error('ln does not support --relative')
+-endif
+-
+ ############################################################
+ 
+ gperf = find_program('gperf')
+diff --git a/tools/meson-make-symlink.sh b/tools/meson-make-symlink.sh
+index 501cd43d4..f4e4ac9ac 100755
+--- a/tools/meson-make-symlink.sh
++++ b/tools/meson-make-symlink.sh
+@@ -8,5 +8,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"
+ if [ "$(dirname $1)" = . ]; then
+         ln -vfs -T "$1" "${DESTDIR:-}$2"
+ else
+-        ln -vfs -T --relative "${DESTDIR:-}$1" "${DESTDIR:-}$2"
++        rm -f "${DESTDIR:-}$2"
++        lnr "${DESTDIR:-}$1" "${DESTDIR:-}$2"
+ fi
+diff --git a/units/meson-add-wants.sh b/units/meson-add-wants.sh
+index 70f7172ae..a42666aac 100755
+--- a/units/meson-add-wants.sh
++++ b/units/meson-add-wants.sh
+@@ -25,4 +25,9 @@ case "$target" in
+                 ;;
+ esac
+ 
+-ln -vfs --relative "$unitpath" "$dir"
++if [ -d "$dir" ]; then
++        rm -f "$dir/$unit"
++        lnr "$unitpath" "$dir/$unit"
++else
++        lnr "$unitpath" "$dir"
++fi
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0004-implment-systemd-sysv-install-for-OE.patch
similarity index 89%
rename from meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
rename to meta/recipes-core/systemd/systemd/0004-implment-systemd-sysv-install-for-OE.patch
index 8828d6e..83fdb53 100644
--- a/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0004-implment-systemd-sysv-install-for-OE.patch
@@ -1,7 +1,7 @@
-From 52726be92e2b841f744a96c378cc872ae0033a2b Mon Sep 17 00:00:00 2001
+From 70d456fb21de2a80697fa364f08475339d6396c1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
-Subject: [PATCH 10/19] implment systemd-sysv-install for OE
+Subject: [PATCH 04/31] implment systemd-sysv-install for OE
 
 Use update-rc.d for enabling/disabling and status command
 to check the status of the sysv service
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemctl/systemd-sysv-install.SKELETON
-index a53a3e6..5d877b0 100755
+index a53a3e622..5d877b06e 100755
 --- a/src/systemctl/systemd-sysv-install.SKELETON
 +++ b/src/systemctl/systemd-sysv-install.SKELETON
 @@ -30,17 +30,17 @@ case "$1" in
@@ -39,5 +39,5 @@ index a53a3e6..5d877b0 100755
      *)
          usage ;;
 -- 
-2.10.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
deleted file mode 100644
index 7016e98..0000000
--- a/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 74450f0dbad2f8478c26eeaa46d4e4a987858f45 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 05:03:44 +0000
-Subject: [PATCH 05/19] binfmt: Don't install dependency links at install time
- for the binfmt services
-
-use [Install] blocks so that they get created when the service is enabled
-like a traditional service.
-
-The [Install] blocks were rejected upstream as they don't have a way to
-"enable"
-it on install without static symlinks which can't be disabled, only
-masked.  We
-however can do that in a postinst.
-
-Upstream-Status: Denied
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am                             | 4 ----
- units/proc-sys-fs-binfmt_misc.automount | 3 +++
- units/systemd-binfmt.service.in         | 5 +++++
- 3 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 50da458..29ed1dd 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -4635,10 +4635,6 @@ INSTALL_DIRS += \
- 	$(prefix)/lib/binfmt.d \
- 	$(sysconfdir)/binfmt.d
- 
--SYSINIT_TARGET_WANTS += \
--	systemd-binfmt.service \
--	proc-sys-fs-binfmt_misc.automount
--
- endif
- 
- EXTRA_DIST += \
-diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
-index 6be3893..709adef 100644
---- a/units/proc-sys-fs-binfmt_misc.automount
-+++ b/units/proc-sys-fs-binfmt_misc.automount
-@@ -16,3 +16,6 @@ ConditionPathIsReadWrite=/proc/sys/
- 
- [Automount]
- Where=/proc/sys/fs/binfmt_misc
-+
-+[Install]
-+WantedBy=sysinit.target
-diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
-index d53073e..8c57ee0 100644
---- a/units/systemd-binfmt.service.in
-+++ b/units/systemd-binfmt.service.in
-@@ -11,6 +11,8 @@ Documentation=man:systemd-binfmt.service(8) man:binfmt.d(5)
- Documentation=https://www.kernel.org/doc/Documentation/binfmt_misc.txt
- DefaultDependencies=no
- Conflicts=shutdown.target
-+Wants=proc-sys-fs-binfmt_misc.automount
-+
- After=proc-sys-fs-binfmt_misc.automount
- Before=sysinit.target shutdown.target
- ConditionPathIsReadWrite=/proc/sys/
-@@ -25,3 +27,6 @@ Type=oneshot
- RemainAfterExit=yes
- ExecStart=@rootlibexecdir@/systemd-binfmt
- TimeoutSec=90s
-+
-+[Install]
-+WantedBy=sysinit.target
--- 
-2.10.2
-
diff --git a/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch b/meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-devices.patch
similarity index 89%
rename from meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
rename to meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-devices.patch
index eb380ce..e4421c8 100644
--- a/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
+++ b/meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-devices.patch
@@ -1,7 +1,7 @@
-From ab5a27040133f7cdf062ac8cfeb94e081d3567b3 Mon Sep 17 00:00:00 2001
+From 7b5b34993002b4418ba8a3c2ae661a7337fd8ed0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Nov 2016 19:41:13 -0800
-Subject: [PATCH 07/14] rules: whitelist hd* devices
+Subject: [PATCH 05/31] rules: whitelist hd* devices
 
 qemu by default emulates IDE and the linux-yocto kernel(s) use
 CONFIG_IDE instead of the more modern libsata, so disks appear as
@@ -11,13 +11,12 @@ Upstream-Status: Denied [https://github.com/systemd/systemd/pull/1276]
 
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  rules/60-persistent-storage.rules | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/rules/60-persistent-storage.rules b/rules/60-persistent-storage.rules
-index d2745f65f..63f472be8 100644
+index 0de8cf3a1..d3f58f153 100644
 --- a/rules/60-persistent-storage.rules
 +++ b/rules/60-persistent-storage.rules
 @@ -7,7 +7,7 @@ ACTION=="remove", GOTO="persistent_storage_end"
@@ -30,5 +29,5 @@ index d2745f65f..63f472be8 100644
  # ignore partitions that span the entire disk
  TEST=="whole_disk", GOTO="persistent_storage_end"
 -- 
-2.13.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch
new file mode 100644
index 0000000..5ba9661
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch
@@ -0,0 +1,78 @@
+From 9d63227420f0c4f093c1c2066eafe2b6152070cf Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Fri, 23 Feb 2018 13:47:37 +0800
+Subject: [PATCH 06/31] Make root's home directory configurable
+
+OpenEmbedded has a configurable home directory for root. Allow
+systemd to be built using its idea of what root's home directory
+should be.
+
+Upstream-Status: Denied
+Upstream wants to have a unified hierarchy where everyone is
+using the same root folder.
+https://github.com/systemd/systemd/issues/541
+
+Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build       | 8 ++++++++
+ meson_options.txt | 2 ++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 7347ea880..918101d6b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -94,6 +94,11 @@ if rootlibdir == ''
+         rootlibdir = join_paths(rootprefixdir, libdir.split('/')[-1])
+ endif
+ 
++roothomedir = get_option('roothomedir')
++if roothomedir == ''
++        roothomedir = '/root'
++endif
++
+ # Dirs of external packages
+ pkgconfigdatadir = join_paths(datadir, 'pkgconfig')
+ pkgconfiglibdir = join_paths(libdir, 'pkgconfig')
+@@ -205,6 +210,7 @@ conf.set_quoted('UDEVLIBEXECDIR',                             udevlibexecdir)
+ conf.set_quoted('POLKIT_AGENT_BINARY_PATH',                   join_paths(bindir, 'pkttyagent'))
+ conf.set_quoted('LIBDIR',                                     libdir)
+ conf.set_quoted('ROOTLIBDIR',                                 rootlibdir)
++conf.set_quoted('ROOTHOMEDIR',                                roothomedir)
+ conf.set_quoted('ROOTLIBEXECDIR',                             rootlibexecdir)
+ conf.set_quoted('BOOTLIBDIR',                                 bootlibdir)
+ conf.set_quoted('SYSTEMD_PULL_PATH',                          join_paths(rootlibexecdir, 'systemd-pull'))
+@@ -221,6 +227,7 @@ substs.set('prefix',                                          prefixdir)
+ substs.set('exec_prefix',                                     prefixdir)
+ substs.set('libdir',                                          libdir)
+ substs.set('rootlibdir',                                      rootlibdir)
++substs.set('roothomedir',                                     roothomedir)
+ substs.set('includedir',                                      includedir)
+ substs.set('pkgsysconfdir',                                   pkgsysconfdir)
+ substs.set('bindir',                                          bindir)
+@@ -2705,6 +2712,7 @@ status = [
+         'include directory:                 @0@'.format(includedir),
+         'lib directory:                     @0@'.format(libdir),
+         'rootlib directory:                 @0@'.format(rootlibdir),
++        'roothome directory:                @0@'.format(roothomedir),
+         'SysV init scripts:                 @0@'.format(sysvinit_path),
+         'SysV rc?.d directories:            @0@'.format(sysvrcnd_path),
+         'PAM modules directory:             @0@'.format(pamlibdir),
+diff --git a/meson_options.txt b/meson_options.txt
+index 39822d6cd..0b24f0e0f 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -22,6 +22,8 @@ option('rootlibdir', type : 'string',
+        description : '''[/usr]/lib/x86_64-linux-gnu or such''')
+ option('rootprefix', type : 'string',
+        description : '''override the root prefix''')
++option('roothomedir', type : 'string',
++       description : '''override the root home directory''')
+ option('link-udev-shared', type : 'boolean',
+        description : 'link systemd-udev and its helpers to libsystemd-shared.so')
+ 
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd/0014-Revert-rules-remove-firmware-loading-rules.patch b/meta/recipes-core/systemd/systemd/0007-Revert-rules-remove-firmware-loading-rules.patch
similarity index 81%
rename from meta/recipes-core/systemd/systemd/0014-Revert-rules-remove-firmware-loading-rules.patch
rename to meta/recipes-core/systemd/systemd/0007-Revert-rules-remove-firmware-loading-rules.patch
index ed7c68f..bb12d30 100644
--- a/meta/recipes-core/systemd/systemd/0014-Revert-rules-remove-firmware-loading-rules.patch
+++ b/meta/recipes-core/systemd/systemd/0007-Revert-rules-remove-firmware-loading-rules.patch
@@ -1,7 +1,7 @@
-From 0f47cfcb16e8e40a90a9221f9995f8cd8a915c22 Mon Sep 17 00:00:00 2001
+From 35d6d384e83ac38077603611bb791969ef95fe68 Mon Sep 17 00:00:00 2001
 From: Jonathan Liu <net147@gmail.com>
 Date: Thu, 19 Mar 2015 15:01:29 +1100
-Subject: [PATCH 14/19] Revert "rules: remove firmware loading rules"
+Subject: [PATCH 07/31] Revert "rules: remove firmware loading rules"
 
 This reverts commit 70e7d754ddb356fb1a2942b262f8cee9650e2a19.
 Userspace firmware loading support is needed for Linux < 3.7.
@@ -16,7 +16,7 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
 
 diff --git a/rules/50-firmware.rules b/rules/50-firmware.rules
 new file mode 100644
-index 0000000..f0ae684
+index 000000000..f0ae68451
 --- /dev/null
 +++ b/rules/50-firmware.rules
 @@ -0,0 +1,3 @@
@@ -24,5 +24,5 @@ index 0000000..f0ae684
 +
 +SUBSYSTEM=="firmware", ACTION=="add", RUN{builtin}="firmware"
 -- 
-2.10.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch b/meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
deleted file mode 100644
index 5234c59..0000000
--- a/meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 05dffe67919ffc72be5c017bc6cf82f164b2e8f9 Mon Sep 17 00:00:00 2001
-From: Emil Renner Berthing <systemd@esmil.dk>
-Date: Mon, 23 Oct 2017 11:42:03 -0700
-Subject: [PATCH 07/12] check for missing canonicalize_file_name
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac                | 2 ++
- src/basic/missing.h         | 1 +
- src/basic/missing_syscall.h | 6 ++++++
- 3 files changed, 9 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index cd035a971..3674190fb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -333,6 +333,7 @@ AC_CHECK_DECLS([
-         renameat2,
-         kcmp,
-         keyctl,
-+        canonicalize_file_name,
-         LO_FLAGS_PARTSCAN,
-         copy_file_range,
-         explicit_bzero],
-@@ -343,6 +344,7 @@ AC_CHECK_DECLS([
- #include <fcntl.h>
- #include <sched.h>
- #include <string.h>
-+#include <stdlib.h>
- #include <linux/loop.h>
- ]])
- 
-diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 671f341c6..8ae4964e1 100644
---- a/src/basic/missing.h
-+++ b/src/basic/missing.h
-@@ -1246,3 +1246,4 @@ struct ethtool_link_settings {
- #endif
- 
- #include "missing_syscall.h"
-+
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 898116c7b..4d44ee4fa 100644
---- a/src/basic/missing_syscall.h
-+++ b/src/basic/missing_syscall.h
-@@ -28,6 +28,12 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
- }
- #endif
- 
-+#if !HAVE_DECL_CANONICALIZE_FILE_NAME
-+static inline char *canonicalize_file_name(const char *path) {
-+        return realpath(path, NULL);
-+}
-+#endif
-+
- /* ======================================================================= */
- 
- #if !HAVE_DECL_MEMFD_CREATE
--- 
-2.14.2
-
diff --git a/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
deleted file mode 100644
index bc92db7..0000000
--- a/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a3482c91642cf568b3ac27fa6c0cb3c6b30669b7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Nov 2016 19:32:14 -0800
-Subject: [PATCH 07/19] use lnr wrapper instead of looking for --relative
- option for ln
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am  | 2 +-
- configure.ac | 2 --
- 2 files changed, 1 insertion(+), 3 deletions(-)
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -320,7 +320,7 @@ define install-relative-aliases
- 	while [ -n "$$1" ]; do \
- 		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
- 		rm -f $(DESTDIR)$$dir/$$2 && \
--		$(LN_S) --relative $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
-+		lnr $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
- 		shift 2 || exit $$?; \
- 	done
- endef
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr
- AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
- AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
- 
--AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
--
- M4_DEFINES=
- 
- AC_CHECK_TOOL(OBJCOPY, objcopy)
diff --git a/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch b/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
deleted file mode 100644
index 67a4f8e..0000000
--- a/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 48e7c0f5b2f5d777a16ac5584dc4f50f1dfa832c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Oct 2017 12:27:53 -0700
-Subject: [PATCH 08/12] Do not enable nss tests
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 3cc8f3451..df20a9a11 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -5290,6 +5290,7 @@ EXTRA_DIST += \
- 	src/timesync/timesyncd.conf.in
- 
- # ------------------------------------------------------------------------------
-+if ENABLE_NSS_SYSTEMD
- test_nss_SOURCES = \
- 	src/test/test-nss.c
- 
-@@ -5302,7 +5303,6 @@ manual_tests += \
- 	test-nss
- 
- # ------------------------------------------------------------------------------
--if ENABLE_NSS_SYSTEMD
- libnss_systemd_la_SOURCES = \
- 	src/nss-systemd/nss-systemd.sym \
- 	src/nss-systemd/nss-systemd.c
--- 
-2.14.2
-
diff --git a/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch b/meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
similarity index 63%
rename from meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
rename to meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
index 95871bb..15d7e02 100644
--- a/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
+++ b/meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
@@ -1,7 +1,7 @@
-From 7883985a3a78677e9a1d5d61fe7fa8badf39f565 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Nov 2016 20:45:23 -0800
-Subject: [PATCH 10/14] Revert "udev: remove userspace firmware loading
+From 5cce7626f33e92f624ac06b613125813fb47d445 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 28 Feb 2018 21:05:39 -0800
+Subject: [PATCH 08/31] Revert "udev: remove userspace firmware loading
  support"
 
 This reverts commit be2ea723b1d023b3d385d3b791ee4607cbfb20ca.
@@ -11,47 +11,26 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Jonathan Liu <net147@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- Makefile.am                      |  12 +++
  README                           |   4 +-
  TODO                             |   1 +
- configure.ac                     |  18 +++++
+ meson.build                      |   9 +++
+ meson_options.txt                |   2 +
+ rules/meson.build                |   4 +
+ src/udev/meson.build             |   4 +
  src/udev/udev-builtin-firmware.c | 154 +++++++++++++++++++++++++++++++++++++++
  src/udev/udev-builtin.c          |   3 +
  src/udev/udev.h                  |   6 ++
- src/udev/udevd.c                 |  13 ++++
- 8 files changed, 209 insertions(+), 2 deletions(-)
+ src/udev/udevd.c                 |  12 +++
+ 10 files changed, 197 insertions(+), 2 deletions(-)
  create mode 100644 src/udev/udev-builtin-firmware.c
 
-diff --git a/Makefile.am b/Makefile.am
-index c2b4a99d2..692d7bb95 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3985,6 +3985,18 @@ libudev_core_la_LIBADD = \
- 	$(BLKID_LIBS) \
- 	$(KMOD_LIBS)
- 
-+libudev_core_la_CPPFLAGS = \
-+	$(AM_CPPFLAGS) \
-+	-DFIRMWARE_PATH="$(FIRMWARE_PATH)"
-+
-+if ENABLE_FIRMWARE
-+libudev_core_la_SOURCES += \
-+	src/udev/udev-builtin-firmware.c
-+
-+dist_udevrules_DATA += \
-+	rules/50-firmware.rules
-+endif
-+
- if HAVE_KMOD
- libudev_core_la_SOURCES += \
- 	src/udev/udev-builtin-kmod.c
 diff --git a/README b/README
-index 60388eebe..e21976393 100644
+index 8807e5cfe..bfd7a35de 100644
 --- a/README
 +++ b/README
-@@ -61,8 +61,8 @@ REQUIREMENTS:
+@@ -58,8 +58,8 @@ REQUIREMENTS:
          Legacy hotplug slows down the system and confuses udev:
            CONFIG_UEVENT_HELPER_PATH=""
  
@@ -63,10 +42,10 @@ index 60388eebe..e21976393 100644
  
          Some udev rules and virtualization detection relies on it:
 diff --git a/TODO b/TODO
-index 61efa5e9f..67ccac224 100644
+index a77028c7b..39e72d7ec 100644
 --- a/TODO
 +++ b/TODO
-@@ -740,6 +740,7 @@ Features:
+@@ -783,6 +783,7 @@ Features:
  * initialize the hostname from the fs label of /, if /etc/hostname does not exist?
  
  * udev:
@@ -74,42 +53,90 @@ index 61efa5e9f..67ccac224 100644
    - move to LGPL
    - kill scsi_id
    - add trigger --subsystem-match=usb/usb_device device
-diff --git a/configure.ac b/configure.ac
-index b53ca1f1a..1150ca50e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1522,6 +1522,23 @@ AM_CONDITIONAL(HAVE_MYHOSTNAME, [test "$have_myhostname" = "yes"])
- AC_ARG_ENABLE(hwdb, [AS_HELP_STRING([--disable-hwdb], [disable hardware database support])],
-        enable_hwdb=$enableval, enable_hwdb=yes)
- AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb = xyes])
-+AC_ARG_WITH(firmware-path,
-+       AS_HELP_STRING([--with-firmware-path=DIR[[[:DIR[...]]]]],
-+          [Firmware search path (default="")]),
-+       [], [with_firmware_path=""])
-+OLD_IFS=$IFS
-+IFS=:
-+for i in $with_firmware_path; do
-+       if test "x${FIRMWARE_PATH}" = "x"; then
-+              FIRMWARE_PATH="\\\"${i}/\\\""
-+       else
-+              FIRMWARE_PATH="${FIRMWARE_PATH}, \\\"${i}/\\\""
-+       fi
-+done
-+IFS=$OLD_IFS
-+AC_SUBST(FIRMWARE_PATH)
-+AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1, [Define if FIRMWARE is available]) ])
-+AM_CONDITIONAL(ENABLE_FIRMWARE, [test "x${FIRMWARE_PATH}" != "x"])
+diff --git a/meson.build b/meson.build
+index 918101d6b..9c25022a4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -72,6 +72,12 @@ conf.set10('HAVE_SYSV_COMPAT', have,
+            description : 'SysV init scripts and rcN.d links are supported')
+ m4_defines += have ? ['-DHAVE_SYSV_COMPAT'] : []
+ 
++firmware_path = get_option('firmware-path')
++have = firmware_path != ''
++conf.set10('HAVE_FIRMWARE', have,
++           description : 'Userspace firmware loading is supported')
++m4_defines += have ? ['-DHAVE_FIRMWARE'] : []
++
+ # join_paths ignore the preceding arguments if an absolute component is
+ # encountered, so this should canonicalize various paths when they are
+ # absolute or relative.
+@@ -178,6 +184,7 @@ conf.set_quoted('SYSTEM_CONFIG_UNIT_PATH',                    join_paths(pkgsysc
+ conf.set_quoted('SYSTEM_DATA_UNIT_PATH',                      systemunitdir)
+ conf.set_quoted('SYSTEM_SYSVINIT_PATH',                       sysvinit_path)
+ conf.set_quoted('SYSTEM_SYSVRCND_PATH',                       sysvrcnd_path)
++conf.set_quoted('FIRMWARE_PATH',                              firmware_path)
+ conf.set_quoted('RC_LOCAL_SCRIPT_PATH_START',                 get_option('rc-local'))
+ conf.set_quoted('RC_LOCAL_SCRIPT_PATH_STOP',                  get_option('halt-local'))
+ conf.set_quoted('USER_CONFIG_UNIT_PATH',                      join_paths(pkgsysconfdir, 'user'))
+@@ -258,6 +265,7 @@ substs.set('SYSTEMCTL',                                       join_paths(rootbin
+ substs.set('RANDOM_SEED',                                     join_paths(randomseeddir, 'random-seed'))
+ substs.set('SYSTEM_SYSVINIT_PATH',                            sysvinit_path)
+ substs.set('SYSTEM_SYSVRCND_PATH',                            sysvrcnd_path)
++substs.set('FIRMWARE_PATH',                                   firmware_path)
+ substs.set('RC_LOCAL_SCRIPT_PATH_START',                      get_option('rc-local'))
+ substs.set('RC_LOCAL_SCRIPT_PATH_STOP',                       get_option('halt-local'))
+ 
+@@ -2715,6 +2723,7 @@ status = [
+         'roothome directory:                @0@'.format(roothomedir),
+         'SysV init scripts:                 @0@'.format(sysvinit_path),
+         'SysV rc?.d directories:            @0@'.format(sysvrcnd_path),
++        'firmware path:                     @0@'.format(firmware_path),
+         'PAM modules directory:             @0@'.format(pamlibdir),
+         'PAM configuration directory:       @0@'.format(pamconfdir),
+         'RPM macros directory:              @0@'.format(rpmmacrosdir),
+diff --git a/meson_options.txt b/meson_options.txt
+index 0b24f0e0f..92d25fa35 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -108,6 +108,8 @@ option('tmpfiles', type : 'boolean',
+        description : 'support for tmpfiles.d')
+ option('importd', type : 'combo', choices : ['auto', 'true', 'false'],
+        description : 'install the systemd-importd daemon')
++option('firmware-path', type : 'string', value : '',
++       description : 'Firmware search path')
+ option('hwdb', type : 'boolean',
+        description : 'support for the hardware database')
+ option('rfkill', type : 'boolean',
+diff --git a/rules/meson.build b/rules/meson.build
+index e253b9f59..5eee5fbca 100644
+--- a/rules/meson.build
++++ b/rules/meson.build
+@@ -41,6 +41,10 @@ rules = files('''
+ install_data(rules,
+              install_dir : udevrulesdir)
  
- # ------------------------------------------------------------------------------
- have_manpages=no
-@@ -1839,6 +1856,7 @@ AC_MSG_RESULT([
-         SysV init scripts:                 ${SYSTEM_SYSVINIT_PATH}
-         SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
-         build Python:                      ${PYTHON}
-+        firmware path:                     ${FIRMWARE_PATH}
-         PAM modules dir:                   ${with_pamlibdir}
-         PAM configuration dir:             ${with_pamconfdir}
-         RPM macros dir:                    ${with_rpmmacrosdir}
++if conf.get('HAVE_FIRMWARE') == 1
++        install_data('50-firmware.rules', install_dir : udevrulesdir)
++endif
++
+ all_rules = rules
+ 
+ rules_in = '''
+diff --git a/src/udev/meson.build b/src/udev/meson.build
+index de2fd2d9c..b6b0ca006 100644
+--- a/src/udev/meson.build
++++ b/src/udev/meson.build
+@@ -67,6 +67,10 @@ if conf.get('HAVE_ACL') == 1
+                                  sd_login_c]
+ endif
+ 
++if conf.get('HAVE_FIRMWARE') == 1
++        libudev_core_sources += ['udev-builtin-firmware.c']
++endif
++
+ ############################################################
+ 
+ generate_keyboard_keys_list = find_program('generate-keyboard-keys-list.sh')
 diff --git a/src/udev/udev-builtin-firmware.c b/src/udev/udev-builtin-firmware.c
 new file mode 100644
 index 000000000..bd8c2fb96
@@ -271,81 +298,80 @@ index 000000000..bd8c2fb96
 +        .run_once = true,
 +};
 diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
-index e6b36f124..cd9947e2a 100644
+index db2b6874f..ccd88638c 100644
 --- a/src/udev/udev-builtin.c
 +++ b/src/udev/udev-builtin.c
-@@ -31,6 +31,9 @@ static const struct udev_builtin *builtins[] = {
+@@ -32,6 +32,9 @@ static const struct udev_builtin *builtins[] = {
          [UDEV_BUILTIN_BLKID] = &udev_builtin_blkid,
  #endif
          [UDEV_BUILTIN_BTRFS] = &udev_builtin_btrfs,
-+#ifdef HAVE_FIRMWARE
++#if HAVE_FIRMWARE
 +        [UDEV_BUILTIN_FIRMWARE] = &udev_builtin_firmware,
 +#endif
          [UDEV_BUILTIN_HWDB] = &udev_builtin_hwdb,
          [UDEV_BUILTIN_INPUT_ID] = &udev_builtin_input_id,
          [UDEV_BUILTIN_KEYBOARD] = &udev_builtin_keyboard,
 diff --git a/src/udev/udev.h b/src/udev/udev.h
-index c0cb7eae8..9f0f1cf13 100644
+index ea11c2d29..c47dd3d88 100644
 --- a/src/udev/udev.h
 +++ b/src/udev/udev.h
-@@ -150,6 +150,9 @@ enum udev_builtin_cmd {
+@@ -151,6 +151,9 @@ enum udev_builtin_cmd {
          UDEV_BUILTIN_BLKID,
  #endif
          UDEV_BUILTIN_BTRFS,
-+#ifdef HAVE_FIRMWARE
++#if HAVE_FIRMWARE
 +        UDEV_BUILTIN_FIRMWARE,
 +#endif
          UDEV_BUILTIN_HWDB,
          UDEV_BUILTIN_INPUT_ID,
          UDEV_BUILTIN_KEYBOARD,
-@@ -178,6 +181,9 @@ struct udev_builtin {
+@@ -179,6 +182,9 @@ struct udev_builtin {
  extern const struct udev_builtin udev_builtin_blkid;
  #endif
  extern const struct udev_builtin udev_builtin_btrfs;
-+#ifdef HAVE_FIRMWARE
++#if HAVE_FIRMWARE
 +extern const struct udev_builtin udev_builtin_firmware;
 +#endif
  extern const struct udev_builtin udev_builtin_hwdb;
  extern const struct udev_builtin udev_builtin_input_id;
  extern const struct udev_builtin udev_builtin_keyboard;
 diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index acbddd418..20347b402 100644
+index 5c757d513..2f3313007 100644
 --- a/src/udev/udevd.c
 +++ b/src/udev/udevd.c
-@@ -125,6 +125,9 @@ struct event {
+@@ -127,6 +127,9 @@ struct event {
          bool is_block;
          sd_event_source *timeout_warning;
          sd_event_source *timeout;
-+#ifdef HAVE_FIRMWARE
++#if HAVE_FIRMWARE
 +        bool nodelay;
 +#endif
  };
  
- static inline struct event *node_to_event(struct udev_list_node *node) {
-@@ -613,6 +616,10 @@ static int event_queue_insert(Manager *manager, struct udev_device *dev) {
+ static void event_queue_cleanup(Manager *manager, enum event_state type);
+@@ -609,6 +612,10 @@ static int event_queue_insert(Manager *manager, struct udev_device *dev) {
          event->devnum = udev_device_get_devnum(dev);
          event->is_block = streq("block", udev_device_get_subsystem(dev));
          event->ifindex = udev_device_get_ifindex(dev);
-+#ifdef HAVE_FIRMWARE
++#if HAVE_FIRMWARE
 +        if (streq(udev_device_get_subsystem(dev), "firmware"))
 +                event->nodelay = true;
 +#endif
  
          log_debug("seq %llu queued, '%s' '%s'", udev_device_get_seqnum(dev),
               udev_device_get_action(dev), udev_device_get_subsystem(dev));
-@@ -698,6 +705,12 @@ static bool is_devpath_busy(Manager *manager, struct event *event) {
+@@ -692,6 +699,11 @@ static bool is_devpath_busy(Manager *manager, struct event *event) {
                          return true;
                  }
  
-+#ifdef HAVE_FIRMWARE
++#if HAVE_FIRMWARE
 +                /* allow to bypass the dependency tracking */
 +                if (event->nodelay)
 +                        continue;
 +#endif
-+
                  /* parent device event found */
                  if (event->devpath[common] == '/') {
                          event->delaying_seqnum = loop_event->seqnum;
 -- 
-2.13.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch b/meta/recipes-core/systemd/systemd/0009-remove-duplicate-include-uchar.h.patch
similarity index 78%
rename from meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch
rename to meta/recipes-core/systemd/systemd/0009-remove-duplicate-include-uchar.h.patch
index d200635..1b14369 100644
--- a/meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch
+++ b/meta/recipes-core/systemd/systemd/0009-remove-duplicate-include-uchar.h.patch
@@ -1,7 +1,7 @@
-From e78af874fc9f3d3af49498b8207109993d93a596 Mon Sep 17 00:00:00 2001
+From ffdf9cb6ba0d932b81933d824f23a878c313a8d4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 22 Feb 2016 05:59:01 +0000
-Subject: [PATCH 17/19] remove duplicate include uchar.h
+Subject: [PATCH 09/31] remove duplicate include uchar.h
 
 missing.h already includes it
 
@@ -13,10 +13,10 @@ Upstream-Status: Pending
  2 files changed, 2 deletions(-)
 
 diff --git a/src/basic/escape.h b/src/basic/escape.h
-index deaa4de..36d437c 100644
+index de89f43a8..9921ccbbd 100644
 --- a/src/basic/escape.h
 +++ b/src/basic/escape.h
-@@ -23,7 +23,6 @@
+@@ -24,7 +24,6 @@
  #include <stddef.h>
  #include <stdint.h>
  #include <sys/types.h>
@@ -25,10 +25,10 @@ index deaa4de..36d437c 100644
  #include "string-util.h"
  #include "missing.h"
 diff --git a/src/basic/utf8.h b/src/basic/utf8.h
-index f9b9c94..6ac9a3c 100644
+index b0a7485ae..fa06d2906 100644
 --- a/src/basic/utf8.h
 +++ b/src/basic/utf8.h
-@@ -22,7 +22,6 @@
+@@ -23,7 +23,6 @@
  #include <stdbool.h>
  #include <stddef.h>
  #include <stdint.h>
@@ -37,5 +37,5 @@ index f9b9c94..6ac9a3c 100644
  #include "macro.h"
  #include "missing.h"
 -- 
-2.10.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch b/meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
new file mode 100644
index 0000000..9a44b54
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
@@ -0,0 +1,45 @@
+From ea4caaa1c6a6dc682bb04548ab05c5c73d0b45d6 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 26 Feb 2018 15:34:52 +0800
+Subject: [PATCH 10/31] check for uchar.h in meson.build
+
+Use #if HAVE_UCHAR_H to include uchar.h conditionally.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build         | 1 +
+ src/basic/missing.h | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 9c25022a4..94a16712b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -623,6 +623,7 @@ foreach header : ['crypt.h',
+                   'sys/auxv.h',
+                   'valgrind/memcheck.h',
+                   'valgrind/valgrind.h',
++                  'uchar.h',
+                  ]
+ 
+         conf.set10('HAVE_' + header.underscorify().to_upper(),
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index 39c1fb700..84d6d9167 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -38,7 +38,9 @@
+ #include <sys/resource.h>
+ #include <sys/socket.h>
+ #include <sys/syscall.h>
++#if HAVE_UCHAR_H
+ #include <uchar.h>
++#endif
+ #include <unistd.h>
+ 
+ #if HAVE_AUDIT
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch b/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
deleted file mode 100644
index b01ae97..0000000
--- a/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 3f6f45578b828e414f50c6822375073e7174236a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 14 Dec 2015 00:50:01 +0000
-Subject: [PATCH 11/19] nss-mymachines: Build conditionally when
- HAVE_MYHOSTNAME is set
-
-Fixes build failures when building with --disable-myhostname
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 02f4017..420e0e0 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -5146,6 +5146,7 @@ SYSTEM_UNIT_ALIASES += \
- BUSNAMES_TARGET_WANTS += \
- 	org.freedesktop.machine1.busname
- 
-+if HAVE_MYHOSTNAME
- libnss_mymachines_la_SOURCES = \
- 	src/nss-mymachines/nss-mymachines.sym \
- 	src/nss-mymachines/nss-mymachines.c
-@@ -5167,6 +5168,7 @@ rootlib_LTLIBRARIES += \
- 	libnss_mymachines.la
- 
- endif
-+endif
- 
- polkitpolicy_in_files += \
- 	src/machine/org.freedesktop.machine1.policy.in
--- 
-2.10.2
-
diff --git a/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch b/meta/recipes-core/systemd/systemd/0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
similarity index 58%
rename from meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
rename to meta/recipes-core/systemd/systemd/0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
index b609276..b0923d1 100644
--- a/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
+++ b/meta/recipes-core/systemd/systemd/0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
@@ -1,25 +1,26 @@
-From b7c6bfe2ec5ae426e586e1d6ecadb52a97128a3f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Nov 2016 20:49:53 -0800
-Subject: [PATCH 13/14] socket-util: don't fail if libc doesn't support IDN
+From 60dd411e9756fc2b14c0e061ad803782b4aee874 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 26 Feb 2018 15:46:05 +0800
+Subject: [PATCH 11/31] socket-util: don't fail if libc doesn't support IDN
 
 Upstream-Status: Pending
 
 Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- src/basic/socket-util.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
+ src/basic/socket-util.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
 
 diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
-index 016e64aa0..d4658826e 100644
+index 2c70cade1..67aedadd4 100644
 --- a/src/basic/socket-util.c
 +++ b/src/basic/socket-util.c
-@@ -47,6 +47,15 @@
- #include "user-util.h"
+@@ -50,6 +50,16 @@
  #include "utf8.h"
  #include "util.h"
+ 
 +/* Don't fail if the standard library
 + * doesn't support IDN */
 +#ifndef NI_IDN
@@ -29,9 +30,10 @@ index 016e64aa0..d4658826e 100644
 +#ifndef NI_IDN_USE_STD3_ASCII_RULES
 +#define NI_IDN_USE_STD3_ASCII_RULES 0
 +#endif
- 
- #ifdef ENABLE_IDN
++
+ #if ENABLE_IDN
  #  define IDN_FLAGS (NI_IDN|NI_IDN_USE_STD3_ASCII_RULES)
+ #else
 -- 
-2.13.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0020-rules-watch-metadata-changes-in-ide-devices.patch b/meta/recipes-core/systemd/systemd/0012-rules-watch-metadata-changes-in-ide-devices.patch
similarity index 90%
rename from meta/recipes-core/systemd/systemd/0020-rules-watch-metadata-changes-in-ide-devices.patch
rename to meta/recipes-core/systemd/systemd/0012-rules-watch-metadata-changes-in-ide-devices.patch
index 17d698a..7207863 100644
--- a/meta/recipes-core/systemd/systemd/0020-rules-watch-metadata-changes-in-ide-devices.patch
+++ b/meta/recipes-core/systemd/systemd/0012-rules-watch-metadata-changes-in-ide-devices.patch
@@ -1,7 +1,7 @@
-From 8207d645582e96c56950674e104653d0cd552d60 Mon Sep 17 00:00:00 2001
+From 406a4c8692316e8c7e14c78f9a802689be304a95 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 17 Nov 2017 09:46:00 +0800
-Subject: [PATCH] rules: watch metadata changes in ide devices
+Subject: [PATCH 12/31] rules: watch metadata changes in ide devices
 
 Formatting IDE storage does not trigger "change" uevents. As a result
 clients using udev API don't get any updates afterwards and get outdated
@@ -29,7 +29,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/rules/60-block.rules b/rules/60-block.rules
-index 343fc06..b5237da 100644
+index 343fc06f8..b5237dac4 100644
 --- a/rules/60-block.rules
 +++ b/rules/60-block.rules
 @@ -8,4 +8,4 @@ ACTION=="add", SUBSYSTEM=="module", KERNEL=="block", ATTR{parameters/events_dfl_
@@ -39,5 +39,5 @@ index 343fc06..b5237da 100644
 -ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*", OPTIONS+="watch"
 +ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|hd*", OPTIONS+="watch"
 -- 
-1.8.3.1
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
deleted file mode 100644
index aeebbfb..0000000
--- a/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From 479e1f4aa2b9f1c911a4d0dd18e222d241a978ea Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Nov 2016 20:35:30 -0800
-Subject: [PATCH 42/48] Make root's home directory configurable
-
-OpenEmbedded has a configurable home directory for root. Allow
-systemd to be built using its idea of what root's home directory
-should be.
-
-Upstream-Status: Denied
-Upstream wants to have a unified hierarchy where everyone is
-using the same root folder.
-https://github.com/systemd/systemd/issues/541
-
-Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- Makefile.am                | 2 ++
- configure.ac               | 7 +++++++
- src/basic/user-util.c      | 4 ++--
- src/nspawn/nspawn.c        | 4 ++--
- units/emergency.service.in | 4 ++--
- units/rescue.service.in    | 4 ++--
- 6 files changed, 17 insertions(+), 8 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 1bcd932c2..c2b4a99d2 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -226,6 +226,7 @@ AM_CPPFLAGS = \
- 	-DLIBDIR=\"$(libdir)\" \
- 	-DROOTLIBDIR=\"$(rootlibdir)\" \
- 	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
-+	-DROOTHOMEDIR=\"$(roothomedir)\" \
- 	-I $(top_srcdir)/src \
- 	-I $(top_builddir)/src/basic \
- 	-I $(top_srcdir)/src/basic \
-@@ -6356,6 +6357,7 @@ substitutions = \
-        '|rootlibdir=$(rootlibdir)|' \
-        '|rootlibexecdir=$(rootlibexecdir)|' \
-        '|rootbindir=$(rootbindir)|' \
-+       '|roothomedir=$(roothomedir)|' \
-        '|bindir=$(bindir)|' \
-        '|SYSTEMCTL=$(rootbindir)/systemctl|' \
-        '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
-diff --git a/configure.ac b/configure.ac
-index 0354ffe6a..b53ca1f1a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1641,6 +1641,11 @@ AC_ARG_WITH([rootlibdir],
-         [with_rootlibdir=${libdir}])
- AX_NORMALIZE_PATH([with_rootlibdir])
- 
-+AC_ARG_WITH([roothomedir],
-+        AS_HELP_STRING([--with-roothomedir=DIR], [Home directory for the root user]),
-+        [],
-+        [with_roothomedir=/root])
-+
- AC_ARG_WITH([pamlibdir],
-         AS_HELP_STRING([--with-pamlibdir=DIR], [directory for PAM modules]),
-         [],
-@@ -1733,6 +1738,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
- AC_SUBST([rpmmacrosdir], [$with_rpmmacrosdir])
- AC_SUBST([rootprefix], [$with_rootprefix])
- AC_SUBST([rootlibdir], [$with_rootlibdir])
-+AC_SUBST([roothomedir], [$with_roothomedir])
- 
- AC_CONFIG_FILES([
-         Makefile
-@@ -1829,6 +1835,7 @@ AC_MSG_RESULT([
-         includedir:                        ${includedir}
-         lib dir:                           ${libdir}
-         rootlib dir:                       ${with_rootlibdir}
-+        root home dir:                     ${with_roothomedir}
-         SysV init scripts:                 ${SYSTEM_SYSVINIT_PATH}
-         SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
-         build Python:                      ${PYTHON}
-diff --git a/src/basic/user-util.c b/src/basic/user-util.c
-index c619dad52..662682adf 100644
---- a/src/basic/user-util.c
-+++ b/src/basic/user-util.c
-@@ -129,7 +129,7 @@ int get_user_creds(
-                         *gid = 0;
- 
-                 if (home)
--                        *home = "/root";
-+                        *home = ROOTHOMEDIR;
- 
-                 if (shell)
-                         *shell = "/bin/sh";
-@@ -389,7 +389,7 @@ int get_home_dir(char **_h) {
-         /* Hardcode home directory for root to avoid NSS */
-         u = getuid();
-         if (u == 0) {
--                h = strdup("/root");
-+                h = strdup(ROOTHOMEDIR);
-                 if (!h)
-                         return -ENOMEM;
- 
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 8a5fedd4b..7b01ec078 100644
---- a/src/nspawn/nspawn.c
-+++ b/src/nspawn/nspawn.c
-@@ -2291,7 +2291,7 @@ static int inner_child(
-         if (envp[n_env])
-                 n_env++;
- 
--        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: "/root") < 0) ||
-+        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: ROOTHOMEDIR) < 0) ||
-             (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
-             (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0))
-                 return log_oom();
-@@ -2373,7 +2373,7 @@ static int inner_child(
-         } else {
-                 if (!arg_chdir)
-                         /* If we cannot change the directory, we'll end up in /, that is expected. */
--                        (void) chdir(home ?: "/root");
-+                        (void) chdir(home ?: ROOTHOMEDIR);
- 
-                 execle("/bin/bash", "-bash", NULL, env_use);
-                 execle("/bin/sh", "-sh", NULL, env_use);
-diff --git a/units/emergency.service.in b/units/emergency.service.in
-index e9eb238b9..32588e48a 100644
---- a/units/emergency.service.in
-+++ b/units/emergency.service.in
-@@ -15,8 +15,8 @@ Conflicts=syslog.socket
- Before=shutdown.target
- 
- [Service]
--Environment=HOME=/root
--WorkingDirectory=-/root
-+Environment=HOME=@roothomedir@
-+WorkingDirectory=-@roothomedir@
- ExecStart=-@rootlibexecdir@/systemd-sulogin-shell emergency
- Type=idle
- StandardInput=tty-force
-diff --git a/units/rescue.service.in b/units/rescue.service.in
-index 4ab66f485..bd9898f2c 100644
---- a/units/rescue.service.in
-+++ b/units/rescue.service.in
-@@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.service
- Before=shutdown.target
- 
- [Service]
--Environment=HOME=/root
--WorkingDirectory=-/root
-+Environment=HOME=@roothomedir@
-+WorkingDirectory=-@roothomedir@
- ExecStart=-@rootlibexecdir@/systemd-sulogin-shell rescue
- Type=idle
- StandardInput=tty-force
--- 
-2.13.2
-
diff --git a/meta/recipes-core/systemd/systemd/0001-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0013-add-fallback-parse_printf_format-implementation.patch
similarity index 88%
rename from meta/recipes-core/systemd/systemd/0001-add-fallback-parse_printf_format-implementation.patch
rename to meta/recipes-core/systemd/systemd/0013-add-fallback-parse_printf_format-implementation.patch
index e2f7458..9c9278d 100644
--- a/meta/recipes-core/systemd/systemd/0001-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0013-add-fallback-parse_printf_format-implementation.patch
@@ -1,53 +1,51 @@
-From 0933ca6251808f856b92b0ce8da8696d5febc333 Mon Sep 17 00:00:00 2001
-From: Emil Renner Berthing <systemd@esmil.dk>
-Date: Mon, 23 Oct 2017 10:41:39 -0700
-Subject: [PATCH 01/12] add fallback parse_printf_format implementation
+From 580d23cf0b32e36a8fb96710336ffef432b3c7ce Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 28 Feb 2018 21:10:58 -0800
+Subject: [PATCH] add fallback parse_printf_format implementation
+
+Upstream-Status: Pending
 
 Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
-Upstream-Status: Pending
-
- Makefile.am                     |   4 +
- configure.ac                    |   2 +
+ meson.build                     |   1 +
+ src/basic/meson.build           |   4 +
  src/basic/parse-printf-format.c | 273 ++++++++++++++++++++++++++++++++++++++++
  src/basic/parse-printf-format.h |  57 +++++++++
  src/basic/stdio-util.h          |   2 +-
  src/journal/journal-send.c      |   2 +-
- 6 files changed, 338 insertions(+), 2 deletions(-)
+ 6 files changed, 337 insertions(+), 2 deletions(-)
  create mode 100644 src/basic/parse-printf-format.c
  create mode 100644 src/basic/parse-printf-format.h
 
-diff --git a/Makefile.am b/Makefile.am
-index 692d7bb95..3cc8f3451 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -997,6 +997,10 @@ libbasic_la_SOURCES = \
- 	src/basic/journal-importer.h \
- 	src/basic/journal-importer.c
+diff --git a/meson.build b/meson.build
+index 94a16712b..4eabaafe8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -620,6 +620,7 @@ foreach header : ['crypt.h',
+                   'linux/btrfs.h',
+                   'linux/memfd.h',
+                   'linux/vm_sockets.h',
++                  'printf.h',
+                   'sys/auxv.h',
+                   'valgrind/memcheck.h',
+                   'valgrind/valgrind.h',
+diff --git a/src/basic/meson.build b/src/basic/meson.build
+index 44cd31ecb..435c6ee02 100644
+--- a/src/basic/meson.build
++++ b/src/basic/meson.build
+@@ -310,6 +310,10 @@ endforeach
  
-+if !HAVE_PRINTF_H
-+libbasic_la_SOURCES += src/basic/parse-printf-format.c
+ basic_sources += [missing_h] + generated_gperf_headers
+ 
++if conf.get('HAVE_PRINTF_H') != 1
++        basic_sources += [files('parse-printf-format.c')]
 +endif
 +
- nodist_libbasic_la_SOURCES = \
- 	src/basic/errno-from-name.h \
- 	src/basic/errno-to-name.h \
-diff --git a/configure.ac b/configure.ac
-index 60e7df5ee..efcdc6c16 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -308,8 +308,10 @@ AC_CHECK_HEADERS([uchar.h], [], [])
- AC_CHECK_HEADERS([sys/capability.h], [], [AC_MSG_ERROR([*** POSIX caps headers not found])])
- AC_CHECK_HEADERS([linux/btrfs.h], [], [])
- AC_CHECK_HEADERS([linux/memfd.h], [], [])
-+AC_CHECK_HEADERS([printf.h], [], [])
- AC_CHECK_HEADERS([linux/vm_sockets.h], [], [], [#include <sys/socket.h>])
- 
-+AM_CONDITIONAL(HAVE_PRINTF_H, [test "x$ac_cv_header_printf_h" = xyes])
- # unconditionally pull-in librt with old glibc versions
- AC_SEARCH_LIBS([clock_gettime], [rt], [], [])
- 
+ libbasic = static_library(
+         'basic',
+         basic_sources,
 diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
 new file mode 100644
 index 000000000..49437e544
@@ -329,7 +327,7 @@ index 000000000..49437e544
 +}
 diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-format.h
 new file mode 100644
-index 000000000..4371177b0
+index 000000000..47be7522d
 --- /dev/null
 +++ b/src/basic/parse-printf-format.h
 @@ -0,0 +1,57 @@
@@ -361,7 +359,7 @@ index 000000000..4371177b0
 +
 +#include "config.h"
 +
-+#ifdef HAVE_PRINTF_H
++#if HAVE_PRINTF_H
 +#include <printf.h>
 +#else
 +
@@ -391,10 +389,10 @@ index 000000000..4371177b0
 +
 +#endif /* HAVE_PRINTF_H */
 diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
-index bd1144b4c..c9c95eb54 100644
+index dbfafba26..8038380d6 100644
 --- a/src/basic/stdio-util.h
 +++ b/src/basic/stdio-util.h
-@@ -19,12 +19,12 @@
+@@ -20,12 +20,12 @@
    along with systemd; If not, see <http://www.gnu.org/licenses/>.
  ***/
  
@@ -409,10 +407,10 @@ index bd1144b4c..c9c95eb54 100644
  #define xsprintf(buf, fmt, ...) \
          assert_message_se((size_t) snprintf(buf, ELEMENTSOF(buf), fmt, __VA_ARGS__) < ELEMENTSOF(buf), "xsprintf: " #buf "[] must be big enough")
 diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
-index 440fba67c..0236c43c4 100644
+index 73329ba02..70bb9e0e8 100644
 --- a/src/journal/journal-send.c
 +++ b/src/journal/journal-send.c
-@@ -19,7 +19,6 @@
+@@ -20,7 +20,6 @@
  
  #include <errno.h>
  #include <fcntl.h>
@@ -420,7 +418,7 @@ index 440fba67c..0236c43c4 100644
  #include <stddef.h>
  #include <sys/socket.h>
  #include <sys/un.h>
-@@ -38,6 +37,7 @@
+@@ -39,6 +38,7 @@
  #include "stdio-util.h"
  #include "string-util.h"
  #include "util.h"
@@ -429,5 +427,5 @@ index 440fba67c..0236c43c4 100644
  #define SNDBUF_SIZE (8*1024*1024)
  
 -- 
-2.14.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0002-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-check-for-missing-strndupa.patch
similarity index 47%
rename from meta/recipes-core/systemd/systemd/0002-src-basic-missing.h-check-for-missing-strndupa.patch
rename to meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-check-for-missing-strndupa.patch
index 94c136b..9f62cbb 100644
--- a/meta/recipes-core/systemd/systemd/0002-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,43 +1,45 @@
-From 585abd891a56409915314304101cac26b42c076b Mon Sep 17 00:00:00 2001
-From: Emil Renner Berthing <systemd@esmil.dk>
-Date: Mon, 23 Oct 2017 10:45:46 -0700
-Subject: [PATCH 02/12] src/basic/missing.h: check for missing strndupa
+From 33be9052315cc4ec8e929fa238e1f0cc0161ad07 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 28 Feb 2018 21:15:28 -0800
+Subject: [PATCH] src/basic/missing.h: check for missing strndupa
 
 include missing.h  for definition of strndupa
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
- configure.ac           |  1 +
- src/basic/missing.h    | 11 +++++++++++
- src/basic/mkdir.c      |  1 +
- src/basic/parse-util.c |  1 +
- src/shared/pager.c     |  1 +
- src/shared/uid-range.c |  1 +
- 6 files changed, 16 insertions(+)
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build             |  1 +
+ src/basic/missing.h     | 11 +++++++++++
+ src/basic/mkdir.c       |  1 +
+ src/basic/parse-util.c  |  1 +
+ src/basic/procfs-util.c |  1 +
+ src/shared/pager.c      |  1 +
+ src/shared/uid-range.c  |  1 +
+ 7 files changed, 17 insertions(+)
 
-diff --git a/configure.ac b/configure.ac
-index efcdc6c16..cd035a971 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -329,6 +329,7 @@ AC_CHECK_DECLS([
-         pivot_root,
-         name_to_handle_at,
-         setns,
-+        strndupa,
-         renameat2,
-         kcmp,
-         keyctl,
+diff --git a/meson.build b/meson.build
+index 4eabaafe8..12811b3f3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -525,6 +525,7 @@ foreach ident : [
+         ['bpf',               '''#include <sys/syscall.h>
+                                  #include <unistd.h>'''],
+         ['explicit_bzero' ,   '''#include <string.h>'''],
++        ['strndupa' ,         '''#include <string.h>'''],
+ ]
+ 
+         have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
 diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 04912bf52..8009888ad 100644
+index 84d6d9167..07a8c8364 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -1104,6 +1104,17 @@ typedef int32_t key_serial_t;
- #define KEYCTL_DESCRIBE 6
+@@ -1187,6 +1187,17 @@ struct input_mask {
+ typedef int32_t key_serial_t;
  #endif
  
-+#if !HAVE_DECL_STRNDUPA
++#if ! HAVE_STRNDUPA
 +#define strndupa(s, n) \
 +  ({ \
 +    const char *__old = (s); \
@@ -48,26 +50,26 @@ index 04912bf52..8009888ad 100644
 +  })
 +#endif
 +
- #ifndef KEYCTL_READ
- #define KEYCTL_READ 11
+ #ifndef KEYCTL_JOIN_SESSION_KEYRING
+ #define KEYCTL_JOIN_SESSION_KEYRING 1
  #endif
 diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index 6b1a98402..d1388df48 100644
+index de4746c86..d51518a5a 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
-@@ -28,6 +28,7 @@
+@@ -30,6 +30,7 @@
  #include "path-util.h"
  #include "stat-util.h"
  #include "user-util.h"
 +#include "missing.h"
  
- int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid_t gid, mkdir_func_t _mkdir) {
+ int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid_t gid, bool follow_symlink, mkdir_func_t _mkdir) {
          struct stat st;
 diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index 4532f222c..7a30a0e06 100644
+index 2c22753de..97533721d 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
-@@ -30,6 +30,7 @@
+@@ -33,6 +33,7 @@
  #include "parse-util.h"
  #include "process-util.h"
  #include "string-util.h"
@@ -75,11 +77,23 @@ index 4532f222c..7a30a0e06 100644
  
  int parse_boolean(const char *v) {
          assert(v);
+diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
+index 9bb42cc7b..23bbd9e67 100644
+--- a/src/basic/procfs-util.c
++++ b/src/basic/procfs-util.c
+@@ -9,6 +9,7 @@
+ #include "procfs-util.h"
+ #include "stdio-util.h"
+ #include "string-util.h"
++#include "missing.h"
+ 
+ int procfs_tasks_get_limit(uint64_t *ret) {
+         _cleanup_free_ char *value = NULL;
 diff --git a/src/shared/pager.c b/src/shared/pager.c
-index 4d7b02c63..854efc0c9 100644
+index 75db3c985..84f06bf7d 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
-@@ -38,6 +38,7 @@
+@@ -39,6 +39,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "terminal-util.h"
@@ -88,10 +102,10 @@ index 4d7b02c63..854efc0c9 100644
  static pid_t pager_pid = 0;
  
 diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
-index b6ec47439..91ce9fb7f 100644
+index c38b7cc98..8ec6bf08d 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
-@@ -24,6 +24,7 @@
+@@ -25,6 +25,7 @@
  #include "macro.h"
  #include "uid-range.h"
  #include "user-util.h"
@@ -100,5 +114,5 @@ index b6ec47439..91ce9fb7f 100644
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
 -- 
-2.14.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
similarity index 88%
rename from meta/recipes-core/systemd/systemd/0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
rename to meta/recipes-core/systemd/systemd/0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 9a2d2c8..4509476 100644
--- a/meta/recipes-core/systemd/systemd/0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,7 +1,7 @@
-From 5bbbc2a08a3b4283ec04af0e77e25fb205aa8b82 Mon Sep 17 00:00:00 2001
+From b45cf4923c7e1f1165925e9b4d7db2108faf2eae Mon Sep 17 00:00:00 2001
 From: Emil Renner Berthing <systemd@esmil.dk>
 Date: Mon, 23 Oct 2017 10:50:14 -0700
-Subject: [PATCH 03/12] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not
+Subject: [PATCH 15/31] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not
  defined
 
 If the standard library doesn't provide brace
@@ -11,20 +11,20 @@ Dont use GNU GLOB extentions on non-glibc systems
 
 Conditionalize use of GLOB_ALTDIRFUNC
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  src/basic/glob-util.c     | 20 +++++++++++++++++---
  src/test/test-glob-util.c | 17 +++++++++++++++--
  src/tmpfiles/tmpfiles.c   |  8 ++++++++
  3 files changed, 40 insertions(+), 5 deletions(-)
 
 diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index f611c42e4..ad6e2be8d 100644
+index 6e80a1e23..312bb3fd1 100644
 --- a/src/basic/glob-util.c
 +++ b/src/basic/glob-util.c
-@@ -27,13 +27,18 @@
+@@ -28,13 +28,18 @@
  #include "macro.h"
  #include "path-util.h"
  #include "strv.h"
@@ -44,7 +44,7 @@ index f611c42e4..ad6e2be8d 100644
          if (!pglob->gl_closedir)
                  pglob->gl_closedir = (void (*)(void *)) closedir;
          if (!pglob->gl_readdir)
-@@ -44,10 +49,13 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
+@@ -45,10 +50,13 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
                  pglob->gl_lstat = lstat;
          if (!pglob->gl_stat)
                  pglob->gl_stat = stat;
@@ -60,7 +60,7 @@ index f611c42e4..ad6e2be8d 100644
          if (k == GLOB_NOMATCH)
                  return -ENOENT;
          if (k == GLOB_NOSPACE)
-@@ -60,6 +68,12 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
+@@ -61,6 +69,12 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
          return 0;
  }
  
@@ -74,10 +74,10 @@ index f611c42e4..ad6e2be8d 100644
          _cleanup_globfree_ glob_t g = {};
          int k;
 diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index af866e004..3afa09ada 100644
+index bd2f8fcfd..a10c77427 100644
 --- a/src/test/test-glob-util.c
 +++ b/src/test/test-glob-util.c
-@@ -29,6 +29,11 @@
+@@ -30,6 +30,11 @@
  #include "glob-util.h"
  #include "macro.h"
  #include "rm-rf.h"
@@ -89,7 +89,7 @@ index af866e004..3afa09ada 100644
  
  static void test_glob_exists(void) {
          char name[] = "/tmp/test-glob_exists.XXXXXX";
-@@ -51,25 +56,33 @@ static void test_glob_exists(void) {
+@@ -52,25 +57,33 @@ static void test_glob_exists(void) {
  static void test_glob_no_dot(void) {
          char template[] = "/tmp/test-glob-util.XXXXXXX";
          const char *fn;
@@ -126,10 +126,10 @@ index af866e004..3afa09ada 100644
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 9419c99e2..07027a765 100644
+index 38cbb739c..88cc543f0 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
-@@ -71,6 +71,12 @@
+@@ -76,6 +76,12 @@
  #include "umask-util.h"
  #include "user-util.h"
  #include "util.h"
@@ -142,7 +142,7 @@ index 9419c99e2..07027a765 100644
  
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
-@@ -1092,7 +1098,9 @@ static int item_do_children(Item *i, const char *path, action_t action) {
+@@ -1288,7 +1294,9 @@ static int item_do_children(Item *i, const char *path, action_t action) {
  
  static int glob_item(Item *i, action_t action, bool recursive) {
          _cleanup_globfree_ glob_t g = {
@@ -153,5 +153,5 @@ index 9419c99e2..07027a765 100644
          int r = 0, k;
          char **fn;
 -- 
-2.14.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch b/meta/recipes-core/systemd/systemd/0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
similarity index 77%
rename from meta/recipes-core/systemd/systemd/0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
rename to meta/recipes-core/systemd/systemd/0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
index cb5ae99..53037ea 100644
--- a/meta/recipes-core/systemd/systemd/0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
+++ b/meta/recipes-core/systemd/systemd/0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
@@ -1,24 +1,24 @@
-From c850b654e71677e0d6292f1345207b9b5acffc33 Mon Sep 17 00:00:00 2001
+From efc57856f961c1f3bf016c511c53d990db8abdff Mon Sep 17 00:00:00 2001
 From: Emil Renner Berthing <systemd@esmil.dk>
 Date: Mon, 23 Oct 2017 11:31:03 -0700
-Subject: [PATCH 04/12] src/basic/missing.h: check for missing __compar_fn_t
+Subject: [PATCH 16/31] src/basic/missing.h: check for missing __compar_fn_t
  typedef
 
 include missing.h for missing __compar_fn_t
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  src/basic/missing.h | 5 +++++
  src/basic/strbuf.c  | 1 +
  2 files changed, 6 insertions(+)
 
 diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 8009888ad..671f341c6 100644
+index 07a8c8364..1aee3346a 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -1063,6 +1063,11 @@ struct input_mask {
+@@ -1162,6 +1162,11 @@ struct input_mask {
  #define RENAME_NOREPLACE (1 << 0)
  #endif
  
@@ -31,10 +31,10 @@ index 8009888ad..671f341c6 100644
  #define KCMP_FILE 0
  #endif
 diff --git a/src/basic/strbuf.c b/src/basic/strbuf.c
-index 00aaf9e62..9dc4a584a 100644
+index 8befffa66..bcb860f95 100644
 --- a/src/basic/strbuf.c
 +++ b/src/basic/strbuf.c
-@@ -23,6 +23,7 @@
+@@ -24,6 +24,7 @@
  
  #include "alloc-util.h"
  #include "strbuf.h"
@@ -43,5 +43,5 @@ index 00aaf9e62..9dc4a584a 100644
  /*
   * Strbuf stores given strings in a single continuous allocated memory
 -- 
-2.14.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0017-Include-netinet-if_ether.h.patch
similarity index 67%
rename from meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
rename to meta/recipes-core/systemd/systemd/0017-Include-netinet-if_ether.h.patch
index 55887ee..a09cfdd 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Include-netinet-if_ether.h.patch
@@ -1,53 +1,54 @@
-From 21080b6a40d0a4ddd2db8f0fa37686f6fa885d1c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Oct 2017 11:38:33 -0700
-Subject: [PATCH 06/12] Include netinet/if_ether.h
+From f2b0173cd9807864db1ef3b102abaa76ef37e506 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 28 Feb 2018 21:19:12 -0800
+Subject: [PATCH 17/31] Include netinet/if_ether.h
 
 Fixes
-/mnt/a/oe/build/tmp/work/mips32r2-bec-linux-musl/systemd/1_234-r0/recipe-sysroot/usr/include/netinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
+/path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
  struct ethhdr {
         ^~~~~~
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
  src/libsystemd/sd-netlink/netlink-types.c | 1 +
  src/network/netdev/tuntap.c               | 1 +
  src/network/networkd-brvlan.c             | 1 +
- src/udev/net/ethtool-util.c               | 2 +-
- src/udev/udev-builtin-net_setup_link.c    | 2 +-
- 5 files changed, 5 insertions(+), 2 deletions(-)
+ src/udev/net/ethtool-util.c               | 1 +
+ src/udev/udev-builtin-net_setup_link.c    | 1 +
+ 5 files changed, 5 insertions(+)
 
 diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
-index 923f7dd10..b95b1e4b2 100644
+index 0ee7d6f0d..ef75893a6 100644
 --- a/src/libsystemd/sd-netlink/netlink-types.c
 +++ b/src/libsystemd/sd-netlink/netlink-types.c
-@@ -19,6 +19,7 @@
- 
+@@ -21,6 +21,7 @@
+ #include <netinet/in.h>
  #include <stdint.h>
  #include <sys/socket.h>
 +#include <netinet/if_ether.h>
  #include <linux/netlink.h>
  #include <linux/rtnetlink.h>
- #include <linux/can/netlink.h>
+ #include <linux/genetlink.h>
 diff --git a/src/network/netdev/tuntap.c b/src/network/netdev/tuntap.c
-index 3d6280884..40e58c38f 100644
+index 4fc9b610a..628c61c57 100644
 --- a/src/network/netdev/tuntap.c
 +++ b/src/network/netdev/tuntap.c
-@@ -18,6 +18,7 @@
- ***/
+@@ -20,6 +20,7 @@
  
+ #include <errno.h>
  #include <fcntl.h>
 +#include <netinet/if_ether.h>
  #include <linux/if_tun.h>
  #include <net/if.h>
  #include <netinet/if_ether.h>
 diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvlan.c
-index fa5d3ee7f..e0828962a 100644
+index 99dd41629..90407c9d8 100644
 --- a/src/network/networkd-brvlan.c
 +++ b/src/network/networkd-brvlan.c
-@@ -18,6 +18,7 @@
+@@ -19,6 +19,7 @@
  ***/
  
  #include <netinet/in.h>
@@ -56,31 +57,29 @@ index fa5d3ee7f..e0828962a 100644
  #include <stdbool.h>
  
 diff --git a/src/udev/net/ethtool-util.c b/src/udev/net/ethtool-util.c
-index 201fc2343..5f7cc2a0a 100644
+index 9bdaef8d9..948f89cf8 100644
 --- a/src/udev/net/ethtool-util.c
 +++ b/src/udev/net/ethtool-util.c
-@@ -16,7 +16,7 @@
-   You should have received a copy of the GNU Lesser General Public License
+@@ -18,6 +18,7 @@
    along with systemd; If not, see <http://www.gnu.org/licenses/>.
  ***/
--
+ 
 +#include <netinet/if_ether.h>
  #include <net/if.h>
  #include <sys/ioctl.h>
  #include <linux/ethtool.h>
 diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
-index 8e4777513..d01fff2a4 100644
+index 40158e0af..b24b3fce8 100644
 --- a/src/udev/udev-builtin-net_setup_link.c
 +++ b/src/udev/udev-builtin-net_setup_link.c
-@@ -16,7 +16,7 @@
-   You should have received a copy of the GNU Lesser General Public License
+@@ -18,6 +18,7 @@
    along with systemd; If not, see <http://www.gnu.org/licenses/>.
  ***/
--
+ 
 +#include <netinet/if_ether.h>
  #include "alloc-util.h"
  #include "link-config.h"
  #include "log.h"
 -- 
-2.14.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch b/meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch
new file mode 100644
index 0000000..ab7edf5
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch
@@ -0,0 +1,47 @@
+From 690eeef9590c7ef1d9d2c31d8c1d5d8071da8c4c Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 26 Feb 2018 17:21:11 +0800
+Subject: [PATCH 18/31] check for missing canonicalize_file_name
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build                 | 2 ++
+ src/basic/missing_syscall.h | 6 ++++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 12811b3f3..f6515e97c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -520,6 +520,8 @@ foreach ident : [
+         ['kcmp',              '''#include <linux/kcmp.h>'''],
+         ['keyctl',            '''#include <sys/types.h>
+                                  #include <keyutils.h>'''],
++        ['canonicalize_file_name', '''#define _GNU_SOURCE
++                                      #include <stdlib.h>'''],
+         ['copy_file_range',   '''#include <sys/syscall.h>
+                                  #include <unistd.h>'''],
+         ['bpf',               '''#include <sys/syscall.h>
+diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
+index c938d0d97..308b9472b 100644
+--- a/src/basic/missing_syscall.h
++++ b/src/basic/missing_syscall.h
+@@ -31,6 +31,12 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
+ }
+ #endif
+ 
++#if !HAVE_CANONICALIZE_FILE_NAME
++static inline char *canonicalize_file_name(const char *path) {
++        return realpath(path, NULL);
++}
++#endif
++
+ /* ======================================================================= */
+ 
+ #if !HAVE_MEMFD_CREATE
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch b/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
deleted file mode 100644
index 067b73f..0000000
--- a/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1355457092b02a15c646fc1c72e68b694a86dd99 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 22 Feb 2016 06:02:38 +0000
-Subject: [PATCH 12/14] check for uchar.h in configure
-
-Use ifdef to include uchar.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
----
- configure.ac        | 1 +
- src/basic/missing.h | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 1150ca50e..60e7df5ee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -304,6 +304,7 @@ AM_CONDITIONAL([HAVE_PYTHON], [test "x$have_python" = "xyes"])
- 
- # ------------------------------------------------------------------------------
- 
-+AC_CHECK_HEADERS([uchar.h], [], [])
- AC_CHECK_HEADERS([sys/capability.h], [], [AC_MSG_ERROR([*** POSIX caps headers not found])])
- AC_CHECK_HEADERS([linux/btrfs.h], [], [])
- AC_CHECK_HEADERS([linux/memfd.h], [], [])
-diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 25a11f351..d631b7e3e 100644
---- a/src/basic/missing.h
-+++ b/src/basic/missing.h
-@@ -37,7 +37,9 @@
- #include <sys/resource.h>
- #include <sys/socket.h>
- #include <sys/syscall.h>
-+#ifdef HAVE_UCHAR_H
- #include <uchar.h>
-+#endif
- #include <unistd.h>
- 
- #ifdef HAVE_AUDIT
--- 
-2.13.2
-
diff --git a/meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch b/meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
new file mode 100644
index 0000000..16b21a0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
@@ -0,0 +1,29 @@
+From f5f313915d78bc43eb96e2aafb8ce3cda304c277 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 26 Feb 2018 17:27:56 +0800
+Subject: [PATCH 19/31] Do not enable nss tests if nss-systemd is not enabled
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/test/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/test/meson.build b/src/test/meson.build
+index 1db8aa107..df3a1f5c5 100644
+--- a/src/test/meson.build
++++ b/src/test/meson.build
+@@ -646,7 +646,7 @@ tests += [
+         [['src/test/test-nss.c'],
+          [],
+          [libdl],
+-         '', 'manual'],
++         'ENABLE_NSS_SYSTEMD', 'manual'],
+ ]
+ 
+ ############################################################
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd/0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch b/meta/recipes-core/systemd/systemd/0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
similarity index 68%
rename from meta/recipes-core/systemd/systemd/0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch
rename to meta/recipes-core/systemd/systemd/0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
index d3694dc..ad49cfe 100644
--- a/meta/recipes-core/systemd/systemd/0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
@@ -1,20 +1,21 @@
-From 75f4e7f167de533a160ee1af2a03fba4c5a5ffc6 Mon Sep 17 00:00:00 2001
+From d63d2fedcd80e58ee53655aeaf2836d4b0a14652 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 23 Oct 2017 12:33:22 -0700
-Subject: [PATCH 09/12] test-hexdecoct.c: Include missing.h form strndupa
+Subject: [PATCH 20/31] test-hexdecoct.c: Include missing.h for strndupa
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
  src/test/test-hexdecoct.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index fcae427e7..5eb5e2ed7 100644
+index 3e25a0bac..ab3e508f1 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
-@@ -21,6 +21,7 @@
+@@ -24,6 +24,7 @@
  #include "hexdecoct.h"
  #include "macro.h"
  #include "string-util.h"
@@ -23,5 +24,5 @@ index fcae427e7..5eb5e2ed7 100644
  static void test_hexchar(void) {
          assert_se(hexchar(0xa) == 'a');
 -- 
-2.14.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
similarity index 49%
rename from meta/recipes-core/systemd/systemd/0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
rename to meta/recipes-core/systemd/systemd/0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index 808c83a..9c8aeca 100644
--- a/meta/recipes-core/systemd/systemd/0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,29 +1,22 @@
-From 6e9d2bcaa6f886b2384c1c35a04e4ebc148aea68 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Oct 2017 12:40:25 -0700
-Subject: [PATCH 10/12] test-sizeof.c: Disable tests for missing typedefs in
+From dfea4b98844795a0cd14fdaf40c67df389dbd27e Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 28 Feb 2018 21:25:22 -0800
+Subject: [PATCH 21/31] test-sizeof.c: Disable tests for missing typedefs in
  musl
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
- src/test/test-sizeof.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/test/test-sizeof.c | 4 ++++
+ 1 file changed, 4 insertions(+)
 
 diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index 269adfd18..ba7855dff 100644
+index aed6db842..0de6fa63c 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
-@@ -18,7 +18,6 @@
- ***/
- 
- #include <stdio.h>
--
- #include "time-util.h"
- 
- /* Print information about various types. Useful when diagnosing
-@@ -48,8 +47,10 @@ int main(void) {
+@@ -50,8 +50,10 @@ int main(void) {
          info(unsigned);
          info(long unsigned);
          info(long long unsigned);
@@ -34,16 +27,16 @@ index 269adfd18..ba7855dff 100644
  
          info(float);
          info(double);
-@@ -59,7 +60,9 @@ int main(void) {
+@@ -61,7 +63,9 @@ int main(void) {
          info(ssize_t);
          info(time_t);
          info(usec_t);
 +#ifdef __GLIBC__
          info(__time_t);
 +#endif
- 
-         info(enum Enum);
-         info(enum BigEnum);
+         info(pid_t);
+         info(uid_t);
+         info(gid_t);
 -- 
-2.14.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0011-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0022-don-t-use-glibc-specific-qsort_r.patch
similarity index 88%
rename from meta/recipes-core/systemd/systemd/0011-don-t-use-glibc-specific-qsort_r.patch
rename to meta/recipes-core/systemd/systemd/0022-don-t-use-glibc-specific-qsort_r.patch
index 7cfe829..a5f7442 100644
--- a/meta/recipes-core/systemd/systemd/0011-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0022-don-t-use-glibc-specific-qsort_r.patch
@@ -1,21 +1,21 @@
-From 2eb45f5a0a8bfb8bdca084587ad28e5001f3cc4b Mon Sep 17 00:00:00 2001
+From d343757d629402c70ca8e5eaa551deaf175c96f3 Mon Sep 17 00:00:00 2001
 From: Emil Renner Berthing <systemd@esmil.dk>
 Date: Thu, 18 Sep 2014 15:24:56 +0200
-Subject: [PATCH 11/12] don't use glibc-specific qsort_r
+Subject: [PATCH 22/31] don't use glibc-specific qsort_r
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  src/hwdb/hwdb.c         | 18 +++++++++++-------
  src/udev/udevadm-hwdb.c | 16 ++++++++++------
  2 files changed, 21 insertions(+), 13 deletions(-)
 
 diff --git a/src/hwdb/hwdb.c b/src/hwdb/hwdb.c
-index 793398ca6..669b00818 100644
+index 4540260f9..81aca7a9b 100644
 --- a/src/hwdb/hwdb.c
 +++ b/src/hwdb/hwdb.c
-@@ -151,13 +151,12 @@ static void trie_free(struct trie *trie) {
+@@ -152,13 +152,12 @@ static void trie_free(struct trie *trie) {
  
  DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
  
@@ -33,7 +33,7 @@ index 793398ca6..669b00818 100644
  }
  
  static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-@@ -182,7 +181,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -183,7 +182,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
                          .value_off = v,
                  };
  
@@ -45,7 +45,7 @@ index 793398ca6..669b00818 100644
                  if (val) {
                          /* At this point we have 2 identical properties on the same match-string.
                           * Since we process files in order, we just replace the previous value.
-@@ -207,7 +209,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -208,7 +210,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
          node->values[node->values_count].file_priority = file_priority;
          node->values[node->values_count].line_number = line_number;
          node->values_count++;
@@ -57,10 +57,10 @@ index 793398ca6..669b00818 100644
  }
  
 diff --git a/src/udev/udevadm-hwdb.c b/src/udev/udevadm-hwdb.c
-index 69b0b9025..fbd213300 100644
+index ab5dc7ab6..c777e30ab 100644
 --- a/src/udev/udevadm-hwdb.c
 +++ b/src/udev/udevadm-hwdb.c
-@@ -128,13 +128,13 @@ static void trie_node_cleanup(struct trie_node *node) {
+@@ -130,13 +130,13 @@ static void trie_node_cleanup(struct trie_node *node) {
          free(node);
  }
  
@@ -78,7 +78,7 @@ index 69b0b9025..fbd213300 100644
  }
  
  static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-@@ -155,7 +155,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -157,7 +157,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
                          .value_off = v,
                  };
  
@@ -89,7 +89,7 @@ index 69b0b9025..fbd213300 100644
                  if (val) {
                          /* replace existing earlier key with new value */
                          val->value_off = v;
-@@ -172,7 +174,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -174,7 +176,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
          node->values[node->values_count].key_off = k;
          node->values[node->values_count].value_off = v;
          node->values_count++;
@@ -101,5 +101,5 @@ index 69b0b9025..fbd213300 100644
  }
  
 -- 
-2.14.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
similarity index 90%
rename from meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
rename to meta/recipes-core/systemd/systemd/0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 1a6db65..09c2b5c 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,7 +1,7 @@
-From 9621618c701a2d5eb3e26f40c68354d4dfb8f872 Mon Sep 17 00:00:00 2001
+From 7b802ada1207ed00ed3867b9804dd0f316641b9b Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
-Subject: [PATCH 12/12] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
+Subject: [PATCH 23/31] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
 
 Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
 thing to do and it's not portable (not supported by musl). See:
@@ -22,19 +22,19 @@ The laccess() macros was added to systemd some time ago and it's not
 clear if or why it needs to return success for broken symlinks. Maybe
 just historical and not actually necessary or desired behaviour?
 
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
  src/basic/fs-util.h          | 22 +++++++++++++++++++++-
  src/shared/base-filesystem.c |  6 +++---
  2 files changed, 24 insertions(+), 4 deletions(-)
 
 diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 094acf179..cdbc0ae72 100644
+index 4dba1ea56..9c4b02ecc 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
-@@ -48,7 +48,27 @@ int fchmod_umask(int fd, mode_t mode);
+@@ -50,7 +50,27 @@ int fchmod_umask(int fd, mode_t mode);
  
  int fd_warn_permissions(const char *path, int fd);
  
@@ -64,10 +64,10 @@ index 094acf179..cdbc0ae72 100644
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
  int touch(const char *path);
 diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 903a18786..2f6052ee7 100644
+index 3c25aa534..574ca71c7 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
-@@ -70,7 +70,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -71,7 +71,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
                  return log_error_errno(errno, "Failed to open root file system: %m");
  
          for (i = 0; i < ELEMENTSOF(table); i ++) {
@@ -76,7 +76,7 @@ index 903a18786..2f6052ee7 100644
                          continue;
  
                  if (table[i].target) {
-@@ -78,7 +78,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -79,7 +79,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
  
                          /* check if one of the targets exists */
                          NULSTR_FOREACH(s, table[i].target) {
@@ -85,7 +85,7 @@ index 903a18786..2f6052ee7 100644
                                          continue;
  
                                  /* check if a specific file exists at the target path */
-@@ -89,7 +89,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -90,7 +90,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
                                          if (!p)
                                                  return log_oom();
  
@@ -95,5 +95,5 @@ index 903a18786..2f6052ee7 100644
                                  }
  
 -- 
-2.14.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch b/meta/recipes-core/systemd/systemd/0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
similarity index 77%
rename from meta/recipes-core/systemd/systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
rename to meta/recipes-core/systemd/systemd/0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
index e219981..fe7e623 100644
--- a/meta/recipes-core/systemd/systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
+++ b/meta/recipes-core/systemd/systemd/0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
@@ -1,23 +1,23 @@
-From 4b6733544beb662a0f77310302fae1fb7b76d167 Mon Sep 17 00:00:00 2001
+From 76c71aa889155f29be1d5d2b74a2c4faa5909c8c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Sep 2015 18:53:31 +0000
-Subject: [PATCH 13/13] comparison_fn_t is glibc specific, use raw signature in
+Subject: [PATCH 24/31] comparison_fn_t is glibc specific, use raw signature in
  function pointer
 
 make it work with musl where comparison_fn_t is not provided
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  src/basic/util.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/util.h b/src/basic/util.h
-index c7da6c39b..87f62b891 100644
+index 9d1b10756..12db53a93 100644
 --- a/src/basic/util.h
 +++ b/src/basic/util.h
-@@ -98,7 +98,7 @@ void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
+@@ -95,7 +95,7 @@ void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
   * Normal qsort requires base to be nonnull. Here were require
   * that only if nmemb > 0.
   */
@@ -27,5 +27,5 @@ index c7da6c39b..87f62b891 100644
                  return;
  
 -- 
-2.14.2
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch b/meta/recipes-core/systemd/systemd/0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
similarity index 80%
rename from meta/recipes-core/systemd/systemd/0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
rename to meta/recipes-core/systemd/systemd/0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
index 35599d4..9376a8f 100644
--- a/meta/recipes-core/systemd/systemd/0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
+++ b/meta/recipes-core/systemd/systemd/0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
@@ -1,22 +1,22 @@
-From 3ca5326485cb19e775af6de615c17be66e44e472 Mon Sep 17 00:00:00 2001
+From a0b1496322f4d7ce83f4fbfd2a90b91d0721f643 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 24 Oct 2017 23:08:24 -0700
-Subject: [PATCH] Define _PATH_WTMPX and _PATH_UTMPX if not defined
+Subject: [PATCH 25/31] Define _PATH_WTMPX and _PATH_UTMPX if not defined
 
 Musl needs these defines
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  src/shared/utmp-wtmp.c | 8 ++++++++
  1 file changed, 8 insertions(+)
 
 diff --git a/src/shared/utmp-wtmp.c b/src/shared/utmp-wtmp.c
-index 9750dcd81..bd55d74a1 100644
+index cab1cd6a2..f5eedac18 100644
 --- a/src/shared/utmp-wtmp.c
 +++ b/src/shared/utmp-wtmp.c
-@@ -27,6 +27,7 @@
+@@ -28,6 +28,7 @@
  #include <sys/time.h>
  #include <sys/utsname.h>
  #include <unistd.h>
@@ -24,7 +24,7 @@ index 9750dcd81..bd55d74a1 100644
  #include <utmpx.h>
  
  #include "alloc-util.h"
-@@ -41,6 +42,13 @@
+@@ -42,6 +43,13 @@
  #include "util.h"
  #include "utmp-wtmp.h"
  
@@ -39,5 +39,5 @@ index 9750dcd81..bd55d74a1 100644
          struct utmpx *found, lookup = { .ut_type = RUN_LVL };
          int r;
 -- 
-2.14.3
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0001-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0026-Use-uintmax_t-for-handling-rlim_t.patch
similarity index 89%
rename from meta/recipes-core/systemd/systemd/0001-Use-uintmax_t-for-handling-rlim_t.patch
rename to meta/recipes-core/systemd/systemd/0026-Use-uintmax_t-for-handling-rlim_t.patch
index 779dc78..46d75ad 100644
--- a/meta/recipes-core/systemd/systemd/0001-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0026-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,7 +1,7 @@
-From b2d4171c6e521cf1e70331fb769234d63a4a6d44 Mon Sep 17 00:00:00 2001
+From 88c48ea84db6fda19dfaeb64545fccf8fa0525ec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 27 Oct 2017 13:00:41 -0700
-Subject: [PATCH] Use uintmax_t for handling rlim_t
+Subject: [PATCH 26/31] Use uintmax_t for handling rlim_t
 
 PRIu{32,64} is not right format to represent rlim_t type
 therefore use %ju and typecast the rlim_t variables to
@@ -15,20 +15,20 @@ execute.c:3446:36: error: format '%lu' expects argument of type 'long unsigned i
 |                                  prefix, rlimit_to_string(i), c->rlimit[i]->rlim_max);
 |                                                               ~~~~~~~~~~~~~~~~~~~~~~
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/7199]
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  src/basic/format-util.h | 8 --------
  src/basic/rlimit-util.c | 8 ++++----
  src/core/execute.c      | 8 ++++----
  3 files changed, 8 insertions(+), 16 deletions(-)
 
 diff --git a/src/basic/format-util.h b/src/basic/format-util.h
-index ae42a8f89..144249cd6 100644
+index d9a78f781..9a1bc21d7 100644
 --- a/src/basic/format-util.h
 +++ b/src/basic/format-util.h
-@@ -60,14 +60,6 @@
+@@ -61,14 +61,6 @@
  #  define PRI_TIMEX "li"
  #endif
  
@@ -44,10 +44,10 @@ index ae42a8f89..144249cd6 100644
  #  define DEV_FMT "%" PRIu64
  #elif SIZEOF_DEV_T == 4
 diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
-index ca834df62..41fcebb74 100644
+index 00648211d..df3d9ecc1 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
-@@ -284,13 +284,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
+@@ -286,13 +286,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
          if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
                  s = strdup("infinity");
          else if (rl->rlim_cur >= RLIM_INFINITY)
@@ -66,10 +66,10 @@ index ca834df62..41fcebb74 100644
          if (!s)
                  return -ENOMEM;
 diff --git a/src/core/execute.c b/src/core/execute.c
-index d72e5bf08..d38946002 100644
+index 0df3971df..aabdddb68 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -3443,10 +3443,10 @@ void exec_context_dump(ExecContext *c, FILE* f, const char *prefix) {
+@@ -3991,10 +3991,10 @@ void exec_context_dump(ExecContext *c, FILE* f, const char *prefix) {
  
          for (i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
@@ -85,5 +85,5 @@ index d72e5bf08..d38946002 100644
  
          if (c->ioprio_set) {
 -- 
-2.14.3
+2.13.0
 
diff --git a/meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-checking.patch b/meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-checking.patch
new file mode 100644
index 0000000..42f59b0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-checking.patch
@@ -0,0 +1,63 @@
+From 5354eb767d1eba2ec41eb273f6b657f4a630ca8a Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 9 Jan 2018 14:45:46 +0800
+Subject: [PATCH 27/31] remove nobody user/group checking
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build | 37 -------------------------------------
+ 1 file changed, 37 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index f6515e97c..1b947adac 100644
+--- a/meson.build
++++ b/meson.build
+@@ -700,43 +700,6 @@ substs.set('containeruidbasemax', container_uid_base_max)
+ nobody_user = get_option('nobody-user')
+ nobody_group = get_option('nobody-group')
+ 
+-getent_result = run_command('getent', 'passwd', '65534')
+-if getent_result.returncode() == 0
+-        name = getent_result.stdout().split(':')[0]
+-        if name != nobody_user
+-                message('WARNING:\n' +
+-                        '        The local user with the UID 65534 does not match the configured user name "@0@" of the nobody user (its name is @1@).\n'.format(nobody_user, name) +
+-                        '        Your build will result in an user table setup that is incompatible with the local system.')
+-        endif
+-endif
+-id_result = run_command('id', '-u', nobody_user)
+-if id_result.returncode() == 0
+-        id = id_result.stdout().to_int()
+-        if id != 65534
+-                message('WARNING:\n' +
+-                        '        The local user with the configured user name "@0@" of the nobody user does not have UID 65534 (it has @1@).\n'.format(nobody_user, id) +
+-                        '        Your build will result in an user table setup that is incompatible with the local system.')
+-        endif
+-endif
+-
+-getent_result = run_command('getent', 'group', '65534')
+-if getent_result.returncode() == 0
+-        name = getent_result.stdout().split(':')[0]
+-        if name != nobody_group
+-                message('WARNING:\n' +
+-                        '        The local group with the GID 65534 does not match the configured group name "@0@" of the nobody group (its name is @1@).\n'.format(nobody_group, name) +
+-                        '        Your build will result in an group table setup that is incompatible with the local system.')
+-        endif
+-endif
+-id_result = run_command('id', '-g', nobody_group)
+-if id_result.returncode() == 0
+-        id = id_result.stdout().to_int()
+-        if id != 65534
+-                message('WARNING:\n' +
+-                        '        The local group with the configured group name "@0@" of the nobody group does not have UID 65534 (it has @1@).\n'.format(nobody_group, id) +
+-                        '        Your build will result in an group table setup that is incompatible with the local system.')
+-        endif
+-endif
+ if nobody_user != nobody_group and not (nobody_user == 'nobody' and nobody_group == 'nogroup')
+         message('WARNING:\n' +
+                 '        The configured user name "@0@" and group name "@0@" of the nobody user/group are not equivalent.\n'.format(nobody_user, nobody_group) +
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-macros-for-musl.patch
new file mode 100644
index 0000000..9ec3137
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-macros-for-musl.patch
@@ -0,0 +1,50 @@
+From 03cdd33be62db4c72a7fcf21b61d0d056c23c6a9 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 28 Feb 2018 21:36:32 -0800
+Subject: [PATCH 28/31] add missing FTW_ macros for musl
+
+This is to avoid build failures like below for musl.
+
+  locale-util.c:296:24: error: 'FTW_STOP' undeclared
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/missing.h | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index 1aee3346a..5b9fde692 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -207,6 +207,26 @@ struct sockaddr_vm {
+ #define BTRFS_QGROUP_LEVEL_SHIFT 48
+ #endif
+ 
++#ifndef FTW_ACTIONRETVAL
++#define FTW_ACTIONRETVAL 16
++#endif
++
++#ifndef FTW_CONTINUE
++#define FTW_CONTINUE 0
++#endif
++
++#ifndef FTW_STOP
++#define FTW_STOP 1
++#endif
++
++#ifndef FTW_SKIP_SUBTREE
++#define FTW_SKIP_SUBTREE 2
++#endif
++
++#ifndef FTW_SKIP_SIBLINGS
++#define FTW_SKIP_SIBLINGS 3
++#endif
++
+ #if ! HAVE_LINUX_BTRFS_H
+ #define BTRFS_IOC_QGROUP_ASSIGN _IOW(BTRFS_IOCTL_MAGIC, 41, \
+                                struct btrfs_ioctl_qgroup_assign_args)
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd/0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch b/meta/recipes-core/systemd/systemd/0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
new file mode 100644
index 0000000..517249f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
@@ -0,0 +1,43 @@
+From 5845c82d1016a3e3f2696180d5ac91b46950540a Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 27 Feb 2018 12:56:21 +0800
+Subject: [PATCH 29/31] nss-mymachines: Build conditionally when
+ ENABLE_MYHOSTNAME is set
+
+Fixes build failures when building with --disable-myhostname
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 1b947adac..1ed4dde72 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1351,12 +1351,15 @@ test_dlopen = executable(
+         link_with : [libbasic],
+         dependencies : [libdl])
+ 
+-foreach tuple : [['myhostname', 'ENABLE_MYHOSTNAME'],
+-                 ['systemd',    'ENABLE_NSS_SYSTEMD'],
+-                 ['mymachines', 'ENABLE_MACHINED'],
+-                 ['resolve',    'ENABLE_RESOLVE']]
++foreach tuple : [['myhostname', 'ENABLE_MYHOSTNAME',  ''],
++                 ['systemd',    'ENABLE_NSS_SYSTEMD', ''],
++                 ['mymachines', 'ENABLE_MACHINED',    'ENABLE_MYHOSTNAME'],
++                 ['resolve',    'ENABLE_RESOLVE',     '']]
+ 
+         condition = tuple[1] == '' or conf.get(tuple[1]) == 1
++        if tuple[2] != '' and condition
++                condition = conf.get(tuple[2]) == 1
++        endif
+         if condition
+                 module = tuple[0]
+ 
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd/0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
new file mode 100644
index 0000000..7f0b4bf
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -0,0 +1,45 @@
+From b7eacdf0388f930fc5271bdecfa46612c71dd65c Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 27 Feb 2018 13:27:47 +0800
+Subject: [PATCH 30/31] fix missing of __register_atfork for non-glibc builds
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/process-util.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/basic/process-util.c b/src/basic/process-util.c
+index dc7c9ef9e..85ce8a0cc 100644
+--- a/src/basic/process-util.c
++++ b/src/basic/process-util.c
+@@ -39,6 +39,9 @@
+ #if HAVE_VALGRIND_VALGRIND_H
+ #include <valgrind/valgrind.h>
+ #endif
++#ifndef __GLIBC__
++#include <pthread.h>
++#endif
+ 
+ #include "alloc-util.h"
+ #include "architecture.h"
+@@ -1112,11 +1115,15 @@ void reset_cached_pid(void) {
+         cached_pid = CACHED_PID_UNSET;
+ }
+ 
++#ifdef __GLIBC__
+ /* We use glibc __register_atfork() + __dso_handle directly here, as they are not included in the glibc
+  * headers. __register_atfork() is mostly equivalent to pthread_atfork(), but doesn't require us to link against
+  * libpthread, as it is part of glibc anyway. */
+ extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void * __dso_handle);
+ extern void* __dso_handle __attribute__ ((__weak__));
++#else
++#define __register_atfork(prepare,parent,child,dso) pthread_atfork(prepare,parent,child)
++#endif
+ 
+ pid_t getpid_cached(void) {
+         pid_t current_value;
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch b/meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
new file mode 100644
index 0000000..319c4b6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
@@ -0,0 +1,30 @@
+From adcd7e426fcd80e754274a730221d1a1f49dbc21 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 27 Feb 2018 14:01:30 +0800
+Subject: [PATCH 31/31] fix missing ULONG_LONG_MAX definition in case of musl
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/missing.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index 5b9fde692..a922f1346 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -72,6 +72,10 @@ struct sockaddr_vm {
+ };
+ #endif /* !HAVE_LINUX_VM_SOCKETS_H */
+ 
++#ifndef ULONG_LONG_MAX
++#define ULONG_LONG_MAX ULLONG_MAX
++#endif
++
+ #ifndef RLIMIT_RTTIME
+ #define RLIMIT_RTTIME 15
+ #endif
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd/run-ptest b/meta/recipes-core/systemd/systemd/run-ptest
deleted file mode 100644
index 2ae76ff..0000000
--- a/meta/recipes-core/systemd/systemd/run-ptest
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-cd tests
-tar -C test -xJf test/sys.tar.xz
-make check-TESTS
-cd ..
diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_237.bb
similarity index 71%
rename from meta/recipes-core/systemd/systemd_234.bb
rename to meta/recipes-core/systemd/systemd_237.bb
index b15e5a4..ae6e455 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -8,7 +8,7 @@ DEPENDS = "kmod intltool-native gperf-native acl readline libcap libcgroup util-
 
 SECTION = "base/shell"
 
-inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext bash-completion manpages distro_features_check
+inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages distro_features_check
 
 # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
 # that we don't build both udev and systemd in world builds.
@@ -18,40 +18,38 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
-           file://run-ptest \
-           file://0004-Use-getenv-when-secure-versions-are-not-available.patch \
-           file://0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
-           file://0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
-           file://0010-implment-systemd-sysv-install-for-OE.patch \
-           file://0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch \
-           file://0012-rules-whitelist-hd-devices.patch \
-           file://0013-Make-root-s-home-directory-configurable.patch \
-           file://0014-Revert-rules-remove-firmware-loading-rules.patch \
-           file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
-           file://0017-remove-duplicate-include-uchar.h.patch \
-           file://0018-check-for-uchar.h-in-configure.patch \
-           file://0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
-           file://0020-rules-watch-metadata-changes-in-ide-devices.patch \
-           file://0001-add-fallback-parse_printf_format-implementation.patch \
-           file://0002-src-basic-missing.h-check-for-missing-strndupa.patch \
-           file://0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
-           file://0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch \
-           file://0006-Include-netinet-if_ether.h.patch \
-           file://0007-check-for-missing-canonicalize_file_name.patch \
-           file://0008-Do-not-enable-nss-tests.patch \
-           file://0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch \
-           file://0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
-           file://0011-don-t-use-glibc-specific-qsort_r.patch \
-           file://0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
-           file://0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
-           file://0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch \
-           file://0001-Use-uintmax_t-for-handling-rlim_t.patch \
-           file://0001-core-evaluate-presets-after-generators-have-run-6526.patch \
-           file://0001-main-skip-many-initialization-steps-when-running-in-.patch \
-           file://0001-meson-update-header-file-to-detect-memfd_create.patch \
-           file://0002-configure.ac-Check-if-memfd_create-is-already-define.patch \
-           file://0003-fileio-include-sys-mman.h.patch \
            file://0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
+           file://0001-Use-getenv-when-secure-versions-are-not-available.patch \
+           file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
+           file://0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
+           file://0004-implment-systemd-sysv-install-for-OE.patch \
+           file://0005-rules-whitelist-hd-devices.patch \
+           file://0006-Make-root-s-home-directory-configurable.patch \
+           file://0007-Revert-rules-remove-firmware-loading-rules.patch \
+           file://0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
+           file://0009-remove-duplicate-include-uchar.h.patch \
+           file://0010-check-for-uchar.h-in-meson.build.patch \
+           file://0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
+           file://0012-rules-watch-metadata-changes-in-ide-devices.patch \
+           file://0013-add-fallback-parse_printf_format-implementation.patch \
+           file://0014-src-basic-missing.h-check-for-missing-strndupa.patch \
+           file://0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
+           file://0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch \
+           file://0017-Include-netinet-if_ether.h.patch \
+           file://0018-check-for-missing-canonicalize_file_name.patch \
+           file://0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch \
+           file://0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch \
+           file://0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
+           file://0022-don-t-use-glibc-specific-qsort_r.patch \
+           file://0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
+           file://0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
+           file://0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch \
+           file://0026-Use-uintmax_t-for-handling-rlim_t.patch \
+           file://0027-remove-nobody-user-group-checking.patch \
+           file://0028-add-missing-FTW_-macros-for-musl.patch \
+           file://0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch \
+           file://0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
+           file://0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
@@ -80,7 +78,7 @@ PACKAGECONFIG ??= " \
     polkit \
     quotacheck \
     randomseed \
-    resolved \
+    resolve \
     smack \
     sysusers \
     timedated \
@@ -94,7 +92,7 @@ PACKAGECONFIG_remove_libc-musl = " \
     localed \
     myhostname \
     nss \
-    resolved \
+    resolve \
     selinux \
     smack \
     sysusers \
@@ -106,72 +104,59 @@ PACKAGECONFIG_remove_libc-musl = " \
 # systemd-serialgetty.bb - not enabled by default.
 PACKAGECONFIG[serial-getty-generator] = ""
 
-PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
-PACKAGECONFIG[backlight] = "--enable-backlight,--disable-backlight"
-PACKAGECONFIG[binfmt] = "--enable-binfmt,--disable-binfmt"
-PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
-PACKAGECONFIG[coredump] = "--enable-coredump,--disable-coredump"
-PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
-PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
-PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
-PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
-PACKAGECONFIG[firstboot] = "--enable-firstboot,--disable-firstboot"
+PACKAGECONFIG[audit] = "-Daudit=true,-Daudit=false,audit"
+PACKAGECONFIG[backlight] = "-Dbacklight=true,-Dbacklight=false"
+PACKAGECONFIG[binfmt] = "-Dbinfmt=true,-Dbinfmt=false"
+PACKAGECONFIG[bzip2] = "-Dbzip2=true,-Dbzip2=false,bzip2"
+PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
+PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup"
+PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
+PACKAGECONFIG[efi] = "-Defi=true,-Defi=false"
+PACKAGECONFIG[elfutils] = "-Delfutils=true,-Delfutils=false,elfutils"
+PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 # Sign the journal for anti-tampering
-PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
-PACKAGECONFIG[hibernate] = "--enable-hibernate,--disable-hibernate"
-PACKAGECONFIG[hostnamed] = "--enable-hostnamed,--disable-hostnamed"
-PACKAGECONFIG[ima] = "--enable-ima,--disable-ima"
+PACKAGECONFIG[gcrypt] = "-Dgcrypt=true,-Dgcrypt=false,libgcrypt"
+PACKAGECONFIG[hibernate] = "-Dhibernate=true,-Dhibernate=false"
+PACKAGECONFIG[hostnamed] = "-Dhostnamed=true,-Dhostnamed=false"
+PACKAGECONFIG[ima] = "-Dima=true,-Dima=false"
 # importd requires curl/xz/zlib/bzip2/gcrypt
-PACKAGECONFIG[importd] = "--enable-importd,--disable-importd"
+PACKAGECONFIG[importd] = "-Dimportd=true,-Dimportd=false"
 # Update NAT firewall rules
-PACKAGECONFIG[iptc] = "--enable-libiptc,--disable-libiptc,iptables"
-PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
-PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig"
-PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
-PACKAGECONFIG[localed] = "--enable-localed,--disable-localed"
-PACKAGECONFIG[logind] = "--enable-logind,--disable-logind"
-PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
-PACKAGECONFIG[machined] = "--enable-machined,--disable-machined"
-PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
-PACKAGECONFIG[myhostname] = "--enable-myhostname,--disable-myhostname"
-PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
-PACKAGECONFIG[nss] = "--enable-nss-systemd,--disable-nss-systemd"
-PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
-PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit"
-PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
-PACKAGECONFIG[quotacheck] = "--enable-quotacheck,--disable-quotacheck"
-PACKAGECONFIG[randomseed] = "--enable-randomseed,--disable-randomseed"
-PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
-PACKAGECONFIG[rfkill] = "--enable-rfkill,--disable-rfkill"
+PACKAGECONFIG[iptc] = "-Dlibiptc=true,-Dlibiptc=false,iptables"
+PACKAGECONFIG[journal-upload] = "-Dlibcurl=true,-Dlibcurl=false,curl"
+PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false"
+PACKAGECONFIG[libidn] = "-Dlibidn=true,-Dlibidn=false,libidn"
+PACKAGECONFIG[localed] = "-Dlocaled=true,-Dlocaled=false"
+PACKAGECONFIG[logind] = "-Dlogind=true,-Dlogind=false"
+PACKAGECONFIG[lz4] = "-Dlz4=true,-Dlz4=false,lz4"
+PACKAGECONFIG[machined] = "-Dmachined=true,-Dmachined=false"
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[microhttpd] = "-Dmicrohttpd=true,-Dmicrohttpd=false,libmicrohttpd"
+PACKAGECONFIG[myhostname] = "-Dmyhostname=true,-Dmyhostname=false"
+PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
+PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
+PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
+PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
+PACKAGECONFIG[qrencode] = "-Dqrencode=true,-Dqrencode=false,qrencode"
+PACKAGECONFIG[quotacheck] = "-Dquotacheck=true,-Dquotacheck=false"
+PACKAGECONFIG[randomseed] = "-Drandomseed=true,-Drandomseed=false"
+PACKAGECONFIG[resolve] = "-Dresolve=true,-Dresolve=false"
+PACKAGECONFIG[rfkill] = "-Drfkill=true,-Drfkill=false"
 # libseccomp is found in meta-security
-PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,initscripts-sushell"
-PACKAGECONFIG[smack] = "--enable-smack,--disable-smack"
-PACKAGECONFIG[sysusers] = "--enable-sysusers,--disable-sysusers"
-PACKAGECONFIG[timedated] = "--enable-timedated,--disable-timedated"
-PACKAGECONFIG[timesyncd] = "--enable-timesyncd,--disable-timesyncd"
-PACKAGECONFIG[usrmerge] = "--disable-split-usr,--enable-split-usr"
-PACKAGECONFIG[utmp] = "--enable-utmp,--disable-utmp"
-PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no,valgrind"
-PACKAGECONFIG[vconsole] = "--enable-vconsole,--disable-vconsole,,${PN}-vconsole-setup"
+PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp"
+PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,initscripts-sushell"
+PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
+PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
+PACKAGECONFIG[timedated] = "-Dtimedated=true,-Dtimedated=false"
+PACKAGECONFIG[timesyncd] = "-Dtimesyncd=true,-Dtimesyncd=false"
+PACKAGECONFIG[usrmerge] = "-Dsplit-usr=false,-Dsplit-usr=true"
+PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
+PACKAGECONFIG[valgrind] = "-DVALGRIND=1,,valgrind"
+PACKAGECONFIG[vconsole] = "-Dvconsole=true,-Dvconsole=false,,${PN}-vconsole-setup"
 # Verify keymaps on locale change
-PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
-PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
-PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
-
-# Hardcode target binary paths to avoid AC_PROG_PATH in the systemd
-# configure script detecting and setting paths from sysroot or host.
-CACHED_CONFIGUREVARS_class-target = " \
-    ac_cv_path_KEXEC=${sbindir}/kexec \
-    ac_cv_path_KILL=${base_bindir}/kill \
-    ac_cv_path_KMOD=${base_bindir}/kmod \
-    ac_cv_path_MOUNT_PATH=${base_bindir}/mount \
-    ac_cv_path_QUOTACHECK=${sbindir}/quotacheck \
-    ac_cv_path_QUOTAON=${sbindir}/quotaon \
-    ac_cv_path_SULOGIN=${base_sbindir}/sulogin \
-    ac_cv_path_UMOUNT_PATH=${base_bindir}/umount \
-"
+PACKAGECONFIG[xkbcommon] = "-Dxkbcommon=true,-Dxkbcommon=false,libxkbcommon"
+PACKAGECONFIG[xz] = "-Dxz=true,-Dxz=false,xz"
+PACKAGECONFIG[zlib] = "-Dzlib=true,-Dzlib=false,zlib"
 
 # Helper variables to clarify locations.  This mirrors the logic in systemd's
 # build system.
@@ -179,38 +164,27 @@ rootprefix ?= "${root_prefix}"
 rootlibdir ?= "${base_libdir}"
 rootlibexecdir = "${rootprefix}/lib"
 
-EXTRA_OECONF = " \
-    --without-python \
-    --with-roothomedir=${ROOT_HOME} \
-    --with-rootlibdir=${rootlibdir} \
-    --with-rootprefix=${rootprefix} \
-    --with-sysvrcnd-path=${sysconfdir} \
-    --with-firmware-path=${nonarch_base_libdir}/firmware \
-"
-
-# per the systemd README, define VALGRIND=1 to run under valgrind
-CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', '', d)}"
-
-COMPILER_NM ?= "${HOST_PREFIX}gcc-nm"
-COMPILER_AR ?= "${HOST_PREFIX}gcc-ar"
-COMPILER_RANLIB ?= "${HOST_PREFIX}gcc-ranlib"
-
-do_configure_prepend() {
-	export NM="${COMPILER_NM}"
-	export AR="${COMPILER_AR}"
-	export RANLIB="${COMPILER_RANLIB}"
-	export KMOD="${base_bindir}/kmod"
-	if [ -d ${S}/units.pre_sed ] ; then
-		cp -r ${S}/units.pre_sed ${S}/units
-	else
-		cp -r ${S}/units ${S}/units.pre_sed
-	fi
-	sed -i -e 's:-DTEST_DIR=\\\".*\\\":-DTEST_DIR=\\\"${PTEST_PATH}/tests/test\\\":' ${S}/Makefile.am
-	sed -i -e 's:-DCATALOG_DIR=\\\".*\\\":-DCATALOG_DIR=\\\"${PTEST_PATH}/tests/catalog\\\":' ${S}/Makefile.am
-}
+EXTRA_OEMESON += "-Dnobody-user=nobody \
+                  -Dnobody-group=nobody \
+                  -Droothomedir=${ROOTHOME} \
+                  -Drootlibdir=${rootlibdir} \
+                  -Drootprefix=${rootprefix} \
+                  -Dsysvrcnd-path=${sysconfdir} \
+                  -Dfirmware-path=${nonarch_base_libdir}/firmware \
+                  "
+
+# Hardcode target binary paths to avoid using paths from sysroot
+EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
+                  -Dkill-path=${base_bindir}/kill \
+                  -Dkmod-path=${base_bindir}/kmod \
+                  -Dmount-path=${base_bindir}/mount \
+                  -Dquotacheck-path=${sbindir}/quotacheck \
+                  -Dquotaon-path=${sbindir}/quotaon \
+                  -Dsulogin-path={base_sbindir}/sulogin \
+                  -Dumount-path=${base_bindir}/umount"
 
 do_install() {
-	autotools_do_install
+	meson_do_install
 	install -d ${D}/${base_sbindir}
 	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
 		# Provided by a separate recipe
@@ -269,7 +243,7 @@ do_install() {
 	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
 		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
 	fi
-	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
+	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolve', 'true', 'false', d)}; then
 		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		echo 'd /run/systemd/resolve 0755 root root -' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
 		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
@@ -289,31 +263,6 @@ do_install() {
 	fi
 }
 
-do_install_ptest () {
-	# install data files needed for tests
-	install -d ${D}${PTEST_PATH}/tests/test
-	cp -rfL ${S}/test/* ${D}${PTEST_PATH}/tests/test
-	# python is disabled for systemd, thus removing these python testing scripts
-	rm ${D}${PTEST_PATH}/tests/test/*.py
-	sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/tests/test/udev-test.pl
-
-	install -d ${D}${PTEST_PATH}/tests/catalog
-	install ${S}/catalog/* ${D}${PTEST_PATH}/tests/catalog/
-
-	install -D ${S}/build-aux/test-driver ${D}${PTEST_PATH}/tests/build-aux/test-driver
-
-	install -d ${D}${PTEST_PATH}/tests/rules
-	install ${B}/rules/* ${D}${PTEST_PATH}/tests/rules/
-
-	# This directory needs to be there for udev-test.pl to work.
-	install -d ${D}${libdir}/udev/rules.d
-
-	# install actual test binaries
-	install -m 0755 ${B}/test-* ${D}${PTEST_PATH}/tests/
-	install -m 0755 ${B}/.libs/test-* ${D}${PTEST_PATH}/tests/
-
-	install ${B}/Makefile ${D}${PTEST_PATH}/tests/
-}
 
 python populate_packages_prepend (){
     systemdlibdir = d.getVar("rootlibdir")
@@ -348,7 +297,7 @@ USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'journal-upload',
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolve', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
 USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy;"
@@ -358,14 +307,6 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
-RDEPENDS_${PN}-ptest += "gawk make perl bash xz \
-                         tzdata tzdata-americas tzdata-asia \
-                         tzdata-europe tzdata-africa tzdata-antarctica \
-                         tzdata-arctic tzdata-atlantic tzdata-australia \
-                         tzdata-pacific tzdata-posix"
-
-FILES_${PN}-ptest += "${libdir}/udev/rules.d"
-
 FILES_${PN}-gui = "${bindir}/systemadm"
 
 FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
@@ -514,6 +455,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${nonarch_base_libdir}/udev/rules.d/71-seat.rules \
                 ${nonarch_base_libdir}/udev/rules.d/73-seat-late.rules \
                 ${nonarch_base_libdir}/udev/rules.d/99-systemd.rules \
+                ${nonarch_base_libdir}/modprobe.d/systemd.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.locale1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
-- 
1.9.1


