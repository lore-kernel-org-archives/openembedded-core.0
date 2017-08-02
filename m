Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5AF77CF9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 15:31:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 02 Aug 2017 08:31:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,312,1498546800"; d="scan'208";a="118732732"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 02 Aug 2017 08:31:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Aug 2017 18:27:31 +0300
Message-Id: <20170802152731.15076-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170802152731.15076-1-alexander.kanavin@linux.intel.com>
References: <20170802152731.15076-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] systemd: update to 234
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
X-List-Received-Date: Wed, 02 Aug 2017 15:31:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new version fixes gperf 3.1 issues, so the update is included
in this patchset.

Modified patches are all rebases to the new version.

Deleted patches are backports, except 0016-make-test-dir-configurable.patch
which is obsolete in the new version (TEST_DIR define is no longer used anywhere).
--with-testdir is removed from configure for the same reason.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/systemd/systemd.inc              |   2 +-
 ....c-Change-the-default-device-timeout-to-2.patch |  13 +-
 ...ragment-refuse-units-with-errors-in-certa.patch | 329 ---------------------
 .../systemd/0003-define-exp10-if-missing.patch     |  13 +-
 .../systemd/0012-rules-whitelist-hd-devices.patch  |  13 +-
 ...3-Make-root-s-home-directory-configurable.patch |  59 ++--
 ...-remove-userspace-firmware-loading-suppor.patch |  54 ++--
 .../systemd/0016-make-test-dir-configurable.patch  |  65 ----
 .../0018-check-for-uchar.h-in-configure.patch      |  17 +-
 ...il-don-t-fail-if-libc-doesn-t-support-IDN.patch |  13 +-
 ...use-the-unified-hierarchy-for-the-systemd.patch |  53 ----
 ...heck-for-lz4-in-the-old-and-new-numbering.patch |  51 ----
 ...se-util-Do-not-include-unneeded-xlocale.h.patch |  27 --
 .../systemd/{systemd_232.bb => systemd_234.bb}     |  15 +-
 14 files changed, 101 insertions(+), 623 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-core-load-fragment-refuse-units-with-errors-in-certa.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0016-make-test-dir-configurable.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0021-build-sys-check-for-lz4-in-the-old-and-new-numbering.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0022-parse-util-Do-not-include-unneeded-xlocale.h.patch
 rename meta/recipes-core/systemd/{systemd_232.bb => systemd_234.bb} (97%)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index a4def998841..d99d1506d73 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "a1e2ef7ec912902d8142e7cb5830cbfb47dba86c"
+SRCREV = "c1edab7ad1e7ccc9be693bedfd464cd1cbffb395"
 
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=git"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
index ee2cd6c4535..7f1bc447fed 100644
--- a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
+++ b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
@@ -1,7 +1,7 @@
-From a544d6d15f5c418084f322349aafe341128d5fca Mon Sep 17 00:00:00 2001
+From f1b5a6f717bda6f80a6b5e3e4d50b450f6cc7b09 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 04:09:19 +0000
-Subject: [PATCH 01/19] core/device.c: Change the default device timeout to 240
+Subject: [PATCH 14/14] core/device.c: Change the default device timeout to 240
  sec.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -11,23 +11,24 @@ Upstream-Status: Inappropriate [Specific case QEMU/AB]
 
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/core/device.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/core/device.c b/src/core/device.c
-index c572a67..f90774e 100644
+index 77601c552..98bf49ba2 100644
 --- a/src/core/device.c
 +++ b/src/core/device.c
 @@ -112,7 +112,7 @@ static void device_init(Unit *u) {
           * indefinitely for plugged in devices, something which cannot
           * happen for the other units since their operations time out
           * anyway. */
--        u->job_timeout = u->manager->default_timeout_start_usec;
-+        u->job_timeout = (240 * USEC_PER_SEC);
+-        u->job_running_timeout = u->manager->default_timeout_start_usec;
++        u->job_running_timeout = (240 * USEC_PER_SEC);
  
          u->ignore_on_isolate = true;
  }
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/systemd/systemd/0001-core-load-fragment-refuse-units-with-errors-in-certa.patch b/meta/recipes-core/systemd/systemd/0001-core-load-fragment-refuse-units-with-errors-in-certa.patch
deleted file mode 100644
index 80948b2ceea..00000000000
--- a/meta/recipes-core/systemd/systemd/0001-core-load-fragment-refuse-units-with-errors-in-certa.patch
+++ /dev/null
@@ -1,329 +0,0 @@
-If a user is created with a strictly-speaking invalid name such as '0day' and a
-unit created to run as that user, systemd rejects the username and runs the unit
-as root.
-
-CVE: CVE-2017-1000082
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From d8e1310e1ed7b6f122bc7eb8ba061fbd088783c0 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Thu, 6 Jul 2017 13:28:19 -0400
-Subject: [PATCH] core/load-fragment: refuse units with errors in certain
- directives
-
-If an error is encountered in any of the Exec* lines, WorkingDirectory,
-SELinuxContext, ApparmorProfile, SmackProcessLabel, Service (in .socket
-units), User, or Group, refuse to load the unit. If the config stanza
-has support, ignore the failure if '-' is present.
-
-For those configuration directives, even if we started the unit, it's
-pretty likely that it'll do something unexpected (like write files
-in a wrong place, or with a wrong context, or run with wrong permissions,
-etc). It seems better to refuse to start the unit and have the admin
-clean up the configuration without giving the service a chance to mess
-up stuff.
-
-Note that all "security" options that restrict what the unit can do
-(Capabilities, AmbientCapabilities, Restrict*, SystemCallFilter, Limit*,
-PrivateDevices, Protect*, etc) are _not_ treated like this. Such options are
-only supplementary, and are not always available depending on the architecture
-and compilation options, so unit authors have to make sure that the service
-runs correctly without them anyway.
-
-Fixes #6237, #6277.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- src/core/load-fragment.c  | 104 ++++++++++++++++++++++++++++------------------
- src/test/test-unit-file.c |  14 +++----
- 2 files changed, 70 insertions(+), 48 deletions(-)
-
-diff --git a/src/core/load-fragment.c b/src/core/load-fragment.c
-index cbc826809..2047974f4 100644
---- a/src/core/load-fragment.c
-+++ b/src/core/load-fragment.c
-@@ -630,20 +630,28 @@ int config_parse_exec(
- 
-                 if (isempty(f)) {
-                         /* First word is either "-" or "@" with no command. */
--                        log_syntax(unit, LOG_ERR, filename, line, 0, "Empty path in command line, ignoring: \"%s\"", rvalue);
--                        return 0;
-+                        log_syntax(unit, LOG_ERR, filename, line, 0,
-+                                   "Empty path in command line%s: \"%s\"",
-+                                   ignore ? ", ignoring" : "", rvalue);
-+                        return ignore ? 0 : -ENOEXEC;
-                 }
-                 if (!string_is_safe(f)) {
--                        log_syntax(unit, LOG_ERR, filename, line, 0, "Executable path contains special characters, ignoring: %s", rvalue);
--                        return 0;
-+                        log_syntax(unit, LOG_ERR, filename, line, 0,
-+                                   "Executable path contains special characters%s: %s",
-+                                   ignore ? ", ignoring" : "", rvalue);
-+                        return ignore ? 0 : -ENOEXEC;
-                 }
-                 if (!path_is_absolute(f)) {
--                        log_syntax(unit, LOG_ERR, filename, line, 0, "Executable path is not absolute, ignoring: %s", rvalue);
--                        return 0;
-+                        log_syntax(unit, LOG_ERR, filename, line, 0,
-+                                   "Executable path is not absolute%s: %s",
-+                                   ignore ? ", ignoring" : "", rvalue);
-+                        return ignore ? 0 : -ENOEXEC;
-                 }
-                 if (endswith(f, "/")) {
--                        log_syntax(unit, LOG_ERR, filename, line, 0, "Executable path specifies a directory, ignoring: %s", rvalue);
--                        return 0;
-+                        log_syntax(unit, LOG_ERR, filename, line, 0,
-+                                   "Executable path specifies a directory%s: %s",
-+                                   ignore ? ", ignoring" : "", rvalue);
-+                        return ignore ? 0 : -ENOEXEC;
-                 }
- 
-                 if (f == firstword) {
-@@ -699,7 +707,7 @@ int config_parse_exec(
-                         if (r == 0)
-                                 break;
-                         else if (r < 0)
--                                return 0;
-+                                return ignore ? 0 : -ENOEXEC;
- 
-                         if (!GREEDY_REALLOC(n, nbufsize, nlen + 2))
-                                 return log_oom();
-@@ -709,8 +717,10 @@ int config_parse_exec(
-                 }
- 
-                 if (!n || !n[0]) {
--                        log_syntax(unit, LOG_ERR, filename, line, 0, "Empty executable name or zeroeth argument, ignoring: %s", rvalue);
--                        return 0;
-+                        log_syntax(unit, LOG_ERR, filename, line, 0,
-+                                   "Empty executable name or zeroeth argument%s: %s",
-+                                   ignore ? ", ignoring" : "", rvalue);
-+                        return ignore ? 0 : -ENOEXEC;
-                 }
- 
-                 nce = new0(ExecCommand, 1);
-@@ -1315,8 +1325,10 @@ int config_parse_exec_selinux_context(
- 
-         r = unit_name_printf(u, rvalue, &k);
-         if (r < 0) {
--                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve specifiers, ignoring: %m");
--                return 0;
-+                log_syntax(unit, LOG_ERR, filename, line, r,
-+                           "Failed to resolve specifiers%s: %m",
-+                           ignore ? ", ignoring" : "");
-+                return ignore ? 0 : -ENOEXEC;
-         }
- 
-         free(c->selinux_context);
-@@ -1363,8 +1375,10 @@ int config_parse_exec_apparmor_profile(
- 
-         r = unit_name_printf(u, rvalue, &k);
-         if (r < 0) {
--                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve specifiers, ignoring: %m");
--                return 0;
-+                log_syntax(unit, LOG_ERR, filename, line, r,
-+                           "Failed to resolve specifiers%s: %m",
-+                           ignore ? ", ignoring" : "");
-+                return ignore ? 0 : -ENOEXEC;
-         }
- 
-         free(c->apparmor_profile);
-@@ -1411,8 +1425,10 @@ int config_parse_exec_smack_process_label(
- 
-         r = unit_name_printf(u, rvalue, &k);
-         if (r < 0) {
--                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve specifiers, ignoring: %m");
--                return 0;
-+                log_syntax(unit, LOG_ERR, filename, line, r,
-+                           "Failed to resolve specifiers%s: %m",
-+                           ignore ? ", ignoring" : "");
-+                return ignore ? 0 : -ENOEXEC;
-         }
- 
-         free(c->smack_process_label);
-@@ -1630,19 +1646,19 @@ int config_parse_socket_service(
- 
-         r = unit_name_printf(UNIT(s), rvalue, &p);
-         if (r < 0) {
--                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve specifiers, ignoring: %s", rvalue);
--                return 0;
-+                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve specifiers: %s", rvalue);
-+                return -ENOEXEC;
-         }
- 
-         if (!endswith(p, ".service")) {
--                log_syntax(unit, LOG_ERR, filename, line, 0, "Unit must be of type service, ignoring: %s", rvalue);
--                return 0;
-+                log_syntax(unit, LOG_ERR, filename, line, 0, "Unit must be of type service: %s", rvalue);
-+                return -ENOEXEC;
-         }
- 
-         r = manager_load_unit(UNIT(s)->manager, p, NULL, &error, &x);
-         if (r < 0) {
--                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to load unit %s, ignoring: %s", rvalue, bus_error_message(&error, r));
--                return 0;
-+                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to load unit %s: %s", rvalue, bus_error_message(&error, r));
-+                return -ENOEXEC;
-         }
- 
-         unit_ref_set(&s->service, x);
-@@ -1893,13 +1909,13 @@ int config_parse_user_group(
- 
-                 r = unit_full_printf(u, rvalue, &k);
-                 if (r < 0) {
--                        log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve unit specifiers in %s, ignoring: %m", rvalue);
--                        return 0;
-+                        log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve unit specifiers in %s: %m", rvalue);
-+                        return -ENOEXEC;
-                 }
- 
-                 if (!valid_user_group_name_or_id(k)) {
--                        log_syntax(unit, LOG_ERR, filename, line, 0, "Invalid user/group name or numeric ID, ignoring: %s", k);
--                        return 0;
-+                        log_syntax(unit, LOG_ERR, filename, line, 0, "Invalid user/group name or numeric ID: %s", k);
-+                        return -ENOEXEC;
-                 }
- 
-                 n = k;
-@@ -1957,19 +1973,19 @@ int config_parse_user_group_strv(
-                 if (r == -ENOMEM)
-                         return log_oom();
-                 if (r < 0) {
--                        log_syntax(unit, LOG_ERR, filename, line, r, "Invalid syntax, ignoring: %s", rvalue);
--                        break;
-+                        log_syntax(unit, LOG_ERR, filename, line, r, "Invalid syntax: %s", rvalue);
-+                        return -ENOEXEC;
-                 }
- 
-                 r = unit_full_printf(u, word, &k);
-                 if (r < 0) {
--                        log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve unit specifiers in %s, ignoring: %m", word);
--                        continue;
-+                        log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve unit specifiers in %s: %m", word);
-+                        return -ENOEXEC;
-                 }
- 
-                 if (!valid_user_group_name_or_id(k)) {
--                        log_syntax(unit, LOG_ERR, filename, line, 0, "Invalid user/group name or numeric ID, ignoring: %s", k);
--                        continue;
-+                        log_syntax(unit, LOG_ERR, filename, line, 0, "Invalid user/group name or numeric ID: %s", k);
-+                        return -ENOEXEC;
-                 }
- 
-                 r = strv_push(users, k);
-@@ -2128,25 +2144,28 @@ int config_parse_working_directory(
- 
-                 r = unit_full_printf(u, rvalue, &k);
-                 if (r < 0) {
--                        log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve unit specifiers in working directory path '%s', ignoring: %m", rvalue);
--                        return 0;
-+                        log_syntax(unit, LOG_ERR, filename, line, r,
-+                                   "Failed to resolve unit specifiers in working directory path '%s'%s: %m",
-+                                   rvalue, missing_ok ? ", ignoring" : "");
-+                        return missing_ok ? 0 : -ENOEXEC;
-                 }
- 
-                 path_kill_slashes(k);
- 
-                 if (!utf8_is_valid(k)) {
-                         log_syntax_invalid_utf8(unit, LOG_ERR, filename, line, rvalue);
--                        return 0;
-+                        return missing_ok ? 0 : -ENOEXEC;
-                 }
- 
-                 if (!path_is_absolute(k)) {
--                        log_syntax(unit, LOG_ERR, filename, line, 0, "Working directory path '%s' is not absolute, ignoring.", rvalue);
--                        return 0;
-+                        log_syntax(unit, LOG_ERR, filename, line, 0,
-+                                   "Working directory path '%s' is not absolute%s.",
-+                                   rvalue, missing_ok ? ", ignoring" : "");
-+                        return missing_ok ? 0 : -ENOEXEC;
-                 }
- 
--                free_and_replace(c->working_directory, k);
--
-                 c->working_directory_home = false;
-+                free_and_replace(c->working_directory, k);
-         }
- 
-         c->working_directory_missing_ok = missing_ok;
-@@ -4228,8 +4247,11 @@ int unit_load_fragment(Unit *u) {
-                         return r;
- 
-                 r = load_from_path(u, k);
--                if (r < 0)
-+                if (r < 0) {
-+                        if (r == -ENOEXEC)
-+                                log_unit_notice(u, "Unit configuration has fatal error, unit will not be started.");
-                         return r;
-+                }
- 
-                 if (u->load_state == UNIT_STUB) {
-                         SET_FOREACH(t, u->names, i) {
-diff --git a/src/test/test-unit-file.c b/src/test/test-unit-file.c
-index 12f48bf43..fd797b587 100644
---- a/src/test/test-unit-file.c
-+++ b/src/test/test-unit-file.c
-@@ -146,7 +146,7 @@ static void test_config_parse_exec(void) {
-         r = config_parse_exec(NULL, "fake", 4, "section", 1,
-                               "LValue", 0, "/RValue/ argv0 r1",
-                               &c, u);
--        assert_se(r == 0);
-+        assert_se(r == -ENOEXEC);
-         assert_se(c1->command_next == NULL);
- 
-         log_info("/* honour_argv0 */");
-@@ -161,7 +161,7 @@ static void test_config_parse_exec(void) {
-         r = config_parse_exec(NULL, "fake", 3, "section", 1,
-                               "LValue", 0, "@/RValue",
-                               &c, u);
--        assert_se(r == 0);
-+        assert_se(r == -ENOEXEC);
-         assert_se(c1->command_next == NULL);
- 
-         log_info("/* no command, whitespace only, reset */");
-@@ -220,7 +220,7 @@ static void test_config_parse_exec(void) {
-                               "-@/RValue argv0 r1 ; ; "
-                               "/goo/goo boo",
-                               &c, u);
--        assert_se(r >= 0);
-+        assert_se(r == -ENOEXEC);
-         c1 = c1->command_next;
-         check_execcommand(c1, "/RValue", "argv0", "r1", NULL, true);
- 
-@@ -374,7 +374,7 @@ static void test_config_parse_exec(void) {
-                 r = config_parse_exec(NULL, "fake", 4, "section", 1,
-                                       "LValue", 0, path,
-                                       &c, u);
--                assert_se(r == 0);
-+                assert_se(r == -ENOEXEC);
-                 assert_se(c1->command_next == NULL);
-         }
- 
-@@ -401,21 +401,21 @@ static void test_config_parse_exec(void) {
-         r = config_parse_exec(NULL, "fake", 4, "section", 1,
-                               "LValue", 0, "/path\\",
-                               &c, u);
--        assert_se(r == 0);
-+        assert_se(r == -ENOEXEC);
-         assert_se(c1->command_next == NULL);
- 
-         log_info("/* missing ending ' */");
-         r = config_parse_exec(NULL, "fake", 4, "section", 1,
-                               "LValue", 0, "/path 'foo",
-                               &c, u);
--        assert_se(r == 0);
-+        assert_se(r == -ENOEXEC);
-         assert_se(c1->command_next == NULL);
- 
-         log_info("/* missing ending ' with trailing backslash */");
-         r = config_parse_exec(NULL, "fake", 4, "section", 1,
-                               "LValue", 0, "/path 'foo\\",
-                               &c, u);
--        assert_se(r == 0);
-+        assert_se(r == -ENOEXEC);
-         assert_se(c1->command_next == NULL);
- 
-         log_info("/* invalid space between modifiers */");
--- 
-2.11.0
diff --git a/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch b/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
index 37c6ac5d104..5ba4b9a3649 100644
--- a/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
+++ b/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
@@ -1,7 +1,7 @@
-From b383c286f58184575216b2bf6f185ba2ad648956 Mon Sep 17 00:00:00 2001
+From 96baee0e1962e559f4ea025024ebc337cb5d50c5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Nov 2016 19:25:45 -0800
-Subject: [PATCH 03/19] define exp10 if missing
+Subject: [PATCH 01/14] define exp10 if missing
 
 Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-fix-build-on-uClibc-exp10.patch
 
@@ -11,16 +11,17 @@ Upstream-Status: Pending
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/basic/missing.h | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 4c013be..4a3fd9c 100644
+index 7830a4f41..177c0eb8a 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -1078,4 +1078,9 @@ typedef int32_t key_serial_t;
- 
+@@ -1227,4 +1227,9 @@ struct ethtool_link_settings {
+ #define AF_VSOCK 40
  #endif
  
 +#ifdef __UCLIBC__
@@ -30,5 +31,5 @@ index 4c013be..4a3fd9c 100644
 +
  #include "missing_syscall.h"
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch b/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
index 8666bdc6520..eb380ce78d8 100644
--- a/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
+++ b/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
@@ -1,7 +1,7 @@
-From 8cc1ae11f54dcc38ee2168b0f99703b835dd3942 Mon Sep 17 00:00:00 2001
+From ab5a27040133f7cdf062ac8cfeb94e081d3567b3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Nov 2016 19:41:13 -0800
-Subject: [PATCH 12/19] rules: whitelist hd* devices
+Subject: [PATCH 07/14] rules: whitelist hd* devices
 
 qemu by default emulates IDE and the linux-yocto kernel(s) use
 CONFIG_IDE instead of the more modern libsata, so disks appear as
@@ -11,23 +11,24 @@ Upstream-Status: Denied [https://github.com/systemd/systemd/pull/1276]
 
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  rules/60-persistent-storage.rules | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/rules/60-persistent-storage.rules b/rules/60-persistent-storage.rules
-index c13d05c..b14fbed 100644
+index d2745f65f..63f472be8 100644
 --- a/rules/60-persistent-storage.rules
 +++ b/rules/60-persistent-storage.rules
 @@ -7,7 +7,7 @@ ACTION=="remove", GOTO="persistent_storage_end"
  ENV{UDEV_DISABLE_PERSISTENT_STORAGE_RULES_FLAG}=="1", GOTO="persistent_storage_end"
  
  SUBSYSTEM!="block", GOTO="persistent_storage_end"
--KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*", GOTO="persistent_storage_end"
-+KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|hd*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*", GOTO="persistent_storage_end"
+-KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*", GOTO="persistent_storage_end"
++KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*|nbd*|hd*", GOTO="persistent_storage_end"
  
  # ignore partitions that span the entire disk
  TEST=="whole_disk", GOTO="persistent_storage_end"
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
index 2b333375bb1..aeebbfb8fed 100644
--- a/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
@@ -1,7 +1,7 @@
-From 79e64a07840e0d97d66e46111f1c086bf83981b7 Mon Sep 17 00:00:00 2001
+From 479e1f4aa2b9f1c911a4d0dd18e222d241a978ea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Nov 2016 20:35:30 -0800
-Subject: [PATCH 13/19] Make root's home directory configurable
+Subject: [PATCH 42/48] Make root's home directory configurable
 
 OpenEmbedded has a configurable home directory for root. Allow
 systemd to be built using its idea of what root's home directory
@@ -14,6 +14,7 @@ https://github.com/systemd/systemd/issues/541
 
 Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  Makefile.am                | 2 ++
  configure.ac               | 7 +++++++
@@ -24,18 +25,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  6 files changed, 17 insertions(+), 8 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 420e0e0..3010b01 100644
+index 1bcd932c2..c2b4a99d2 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -213,6 +213,7 @@ AM_CPPFLAGS = \
+@@ -226,6 +226,7 @@ AM_CPPFLAGS = \
  	-DLIBDIR=\"$(libdir)\" \
  	-DROOTLIBDIR=\"$(rootlibdir)\" \
  	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
 +	-DROOTHOMEDIR=\"$(roothomedir)\" \
- 	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
  	-I $(top_srcdir)/src \
  	-I $(top_builddir)/src/basic \
-@@ -6057,6 +6058,7 @@ substitutions = \
+ 	-I $(top_srcdir)/src/basic \
+@@ -6356,6 +6357,7 @@ substitutions = \
         '|rootlibdir=$(rootlibdir)|' \
         '|rootlibexecdir=$(rootlibexecdir)|' \
         '|rootbindir=$(rootbindir)|' \
@@ -44,10 +45,10 @@ index 420e0e0..3010b01 100644
         '|SYSTEMCTL=$(rootbindir)/systemctl|' \
         '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
 diff --git a/configure.ac b/configure.ac
-index b10c952..dfc0bd3 100644
+index 0354ffe6a..b53ca1f1a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1513,6 +1513,11 @@ AC_ARG_WITH([rootlibdir],
+@@ -1641,6 +1641,11 @@ AC_ARG_WITH([rootlibdir],
          [with_rootlibdir=${libdir}])
  AX_NORMALIZE_PATH([with_rootlibdir])
  
@@ -57,29 +58,29 @@ index b10c952..dfc0bd3 100644
 +        [with_roothomedir=/root])
 +
  AC_ARG_WITH([pamlibdir],
-         AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
+         AS_HELP_STRING([--with-pamlibdir=DIR], [directory for PAM modules]),
          [],
-@@ -1598,6 +1603,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
- AC_SUBST([pamconfdir], [$with_pamconfdir])
+@@ -1733,6 +1738,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
+ AC_SUBST([rpmmacrosdir], [$with_rpmmacrosdir])
  AC_SUBST([rootprefix], [$with_rootprefix])
  AC_SUBST([rootlibdir], [$with_rootlibdir])
 +AC_SUBST([roothomedir], [$with_roothomedir])
  
  AC_CONFIG_FILES([
          Makefile
-@@ -1688,6 +1694,7 @@ AC_MSG_RESULT([
+@@ -1829,6 +1835,7 @@ AC_MSG_RESULT([
          includedir:                        ${includedir}
          lib dir:                           ${libdir}
          rootlib dir:                       ${with_rootlibdir}
 +        root home dir:                     ${with_roothomedir}
          SysV init scripts:                 ${SYSTEM_SYSVINIT_PATH}
          SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
-         Build Python:                      ${PYTHON}
+         build Python:                      ${PYTHON}
 diff --git a/src/basic/user-util.c b/src/basic/user-util.c
-index 938533d..3f9fdc4 100644
+index c619dad52..662682adf 100644
 --- a/src/basic/user-util.c
 +++ b/src/basic/user-util.c
-@@ -127,7 +127,7 @@ int get_user_creds(
+@@ -129,7 +129,7 @@ int get_user_creds(
                          *gid = 0;
  
                  if (home)
@@ -88,7 +89,7 @@ index 938533d..3f9fdc4 100644
  
                  if (shell)
                          *shell = "/bin/sh";
-@@ -387,7 +387,7 @@ int get_home_dir(char **_h) {
+@@ -389,7 +389,7 @@ int get_home_dir(char **_h) {
          /* Hardcode home directory for root to avoid NSS */
          u = getuid();
          if (u == 0) {
@@ -98,10 +99,10 @@ index 938533d..3f9fdc4 100644
                          return -ENOMEM;
  
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 19b47cd..e42bf19 100644
+index 8a5fedd4b..7b01ec078 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2798,7 +2798,7 @@ static int inner_child(
+@@ -2291,7 +2291,7 @@ static int inner_child(
          if (envp[n_env])
                  n_env++;
  
@@ -110,8 +111,8 @@ index 19b47cd..e42bf19 100644
              (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
              (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0))
                  return log_oom();
-@@ -2882,7 +2882,7 @@ static int inner_child(
-         else {
+@@ -2373,7 +2373,7 @@ static int inner_child(
+         } else {
                  if (!arg_chdir)
                          /* If we cannot change the directory, we'll end up in /, that is expected. */
 -                        (void) chdir(home ?: "/root");
@@ -120,7 +121,7 @@ index 19b47cd..e42bf19 100644
                  execle("/bin/bash", "-bash", NULL, env_use);
                  execle("/bin/sh", "-sh", NULL, env_use);
 diff --git a/units/emergency.service.in b/units/emergency.service.in
-index da68eb8..e25f879 100644
+index e9eb238b9..32588e48a 100644
 --- a/units/emergency.service.in
 +++ b/units/emergency.service.in
 @@ -15,8 +15,8 @@ Conflicts=syslog.socket
@@ -131,11 +132,11 @@ index da68eb8..e25f879 100644
 -WorkingDirectory=-/root
 +Environment=HOME=@roothomedir@
 +WorkingDirectory=-@roothomedir@
- ExecStartPre=-/bin/plymouth --wait quit
- ExecStartPre=-/bin/echo -e 'You are in emergency mode. After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\ntry again to boot into default mode.'
- ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail --no-block default"
+ ExecStart=-@rootlibexecdir@/systemd-sulogin-shell emergency
+ Type=idle
+ StandardInput=tty-force
 diff --git a/units/rescue.service.in b/units/rescue.service.in
-index 5feff69..a83439e 100644
+index 4ab66f485..bd9898f2c 100644
 --- a/units/rescue.service.in
 +++ b/units/rescue.service.in
 @@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.service
@@ -146,9 +147,9 @@ index 5feff69..a83439e 100644
 -WorkingDirectory=-/root
 +Environment=HOME=@roothomedir@
 +WorkingDirectory=-@roothomedir@
- ExecStartPre=-/bin/plymouth --wait quit
- ExecStartPre=-/bin/echo -e 'You are in rescue mode. After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
- ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail --no-block default"
+ ExecStart=-@rootlibexecdir@/systemd-sulogin-shell rescue
+ Type=idle
+ StandardInput=tty-force
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch b/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
index f31d211e767..95871bb053b 100644
--- a/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
+++ b/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
@@ -1,7 +1,7 @@
-From 4d28d9a7d8d69fb429955d770e53e7a81640da24 Mon Sep 17 00:00:00 2001
+From 7883985a3a78677e9a1d5d61fe7fa8badf39f565 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Nov 2016 20:45:23 -0800
-Subject: [PATCH 15/19] Revert "udev: remove userspace firmware loading
+Subject: [PATCH 10/14] Revert "udev: remove userspace firmware loading
  support"
 
 This reverts commit be2ea723b1d023b3d385d3b791ee4607cbfb20ca.
@@ -11,23 +11,24 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Jonathan Liu <net147@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  Makefile.am                      |  12 +++
- README                           |   6 +-
+ README                           |   4 +-
  TODO                             |   1 +
  configure.ac                     |  18 +++++
  src/udev/udev-builtin-firmware.c | 154 +++++++++++++++++++++++++++++++++++++++
  src/udev/udev-builtin.c          |   3 +
  src/udev/udev.h                  |   6 ++
  src/udev/udevd.c                 |  13 ++++
- 8 files changed, 210 insertions(+), 3 deletions(-)
+ 8 files changed, 209 insertions(+), 2 deletions(-)
  create mode 100644 src/udev/udev-builtin-firmware.c
 
 diff --git a/Makefile.am b/Makefile.am
-index 3010b01..229492a 100644
+index c2b4a99d2..692d7bb95 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -3791,6 +3791,18 @@ libudev_core_la_LIBADD = \
+@@ -3985,6 +3985,18 @@ libudev_core_la_LIBADD = \
  	$(BLKID_LIBS) \
  	$(KMOD_LIBS)
  
@@ -47,17 +48,10 @@ index 3010b01..229492a 100644
  libudev_core_la_SOURCES += \
  	src/udev/udev-builtin-kmod.c
 diff --git a/README b/README
-index 9f5bc93..f60ae11 100644
+index 60388eebe..e21976393 100644
 --- a/README
 +++ b/README
-@@ -50,14 +50,14 @@ REQUIREMENTS:
-           CONFIG_PROC_FS
-           CONFIG_FHANDLE (libudev, mount and bind mount handling)
- 
--        udev will fail to work with the legacy sysfs layout:
-+        Udev will fail to work with the legacy sysfs layout:
-           CONFIG_SYSFS_DEPRECATED=n
- 
+@@ -61,8 +61,8 @@ REQUIREMENTS:
          Legacy hotplug slows down the system and confuses udev:
            CONFIG_UEVENT_HELPER_PATH=""
  
@@ -69,10 +63,10 @@ index 9f5bc93..f60ae11 100644
  
          Some udev rules and virtualization detection relies on it:
 diff --git a/TODO b/TODO
-index baaac94..1ab1691 100644
+index 61efa5e9f..67ccac224 100644
 --- a/TODO
 +++ b/TODO
-@@ -658,6 +658,7 @@ Features:
+@@ -740,6 +740,7 @@ Features:
  * initialize the hostname from the fs label of /, if /etc/hostname does not exist?
  
  * udev:
@@ -81,11 +75,11 @@ index baaac94..1ab1691 100644
    - kill scsi_id
    - add trigger --subsystem-match=usb/usb_device device
 diff --git a/configure.ac b/configure.ac
-index dfc0bd3..1de0066 100644
+index b53ca1f1a..1150ca50e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1394,6 +1394,23 @@ AM_CONDITIONAL(HAVE_MYHOSTNAME, [test "$have_myhostname" = "yes"])
- AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware database support])],
+@@ -1522,6 +1522,23 @@ AM_CONDITIONAL(HAVE_MYHOSTNAME, [test "$have_myhostname" = "yes"])
+ AC_ARG_ENABLE(hwdb, [AS_HELP_STRING([--disable-hwdb], [disable hardware database support])],
         enable_hwdb=$enableval, enable_hwdb=yes)
  AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb = xyes])
 +AC_ARG_WITH(firmware-path,
@@ -108,17 +102,17 @@ index dfc0bd3..1de0066 100644
  
  # ------------------------------------------------------------------------------
  have_manpages=no
-@@ -1698,6 +1715,7 @@ AC_MSG_RESULT([
+@@ -1839,6 +1856,7 @@ AC_MSG_RESULT([
          SysV init scripts:                 ${SYSTEM_SYSVINIT_PATH}
          SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
-         Build Python:                      ${PYTHON}
+         build Python:                      ${PYTHON}
 +        firmware path:                     ${FIRMWARE_PATH}
          PAM modules dir:                   ${with_pamlibdir}
          PAM configuration dir:             ${with_pamconfdir}
-         D-Bus policy dir:                  ${with_dbuspolicydir}
+         RPM macros dir:                    ${with_rpmmacrosdir}
 diff --git a/src/udev/udev-builtin-firmware.c b/src/udev/udev-builtin-firmware.c
 new file mode 100644
-index 0000000..bd8c2fb
+index 000000000..bd8c2fb96
 --- /dev/null
 +++ b/src/udev/udev-builtin-firmware.c
 @@ -0,0 +1,154 @@
@@ -277,7 +271,7 @@ index 0000000..bd8c2fb
 +        .run_once = true,
 +};
 diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
-index e6b36f1..cd9947e 100644
+index e6b36f124..cd9947e2a 100644
 --- a/src/udev/udev-builtin.c
 +++ b/src/udev/udev-builtin.c
 @@ -31,6 +31,9 @@ static const struct udev_builtin *builtins[] = {
@@ -291,10 +285,10 @@ index e6b36f1..cd9947e 100644
          [UDEV_BUILTIN_INPUT_ID] = &udev_builtin_input_id,
          [UDEV_BUILTIN_KEYBOARD] = &udev_builtin_keyboard,
 diff --git a/src/udev/udev.h b/src/udev/udev.h
-index 8433e8d..d32366d 100644
+index c0cb7eae8..9f0f1cf13 100644
 --- a/src/udev/udev.h
 +++ b/src/udev/udev.h
-@@ -148,6 +148,9 @@ enum udev_builtin_cmd {
+@@ -150,6 +150,9 @@ enum udev_builtin_cmd {
          UDEV_BUILTIN_BLKID,
  #endif
          UDEV_BUILTIN_BTRFS,
@@ -304,7 +298,7 @@ index 8433e8d..d32366d 100644
          UDEV_BUILTIN_HWDB,
          UDEV_BUILTIN_INPUT_ID,
          UDEV_BUILTIN_KEYBOARD,
-@@ -176,6 +179,9 @@ struct udev_builtin {
+@@ -178,6 +181,9 @@ struct udev_builtin {
  extern const struct udev_builtin udev_builtin_blkid;
  #endif
  extern const struct udev_builtin udev_builtin_btrfs;
@@ -315,7 +309,7 @@ index 8433e8d..d32366d 100644
  extern const struct udev_builtin udev_builtin_input_id;
  extern const struct udev_builtin udev_builtin_keyboard;
 diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index d336ee0..81e5dc5 100644
+index acbddd418..20347b402 100644
 --- a/src/udev/udevd.c
 +++ b/src/udev/udevd.c
 @@ -125,6 +125,9 @@ struct event {
@@ -353,5 +347,5 @@ index d336ee0..81e5dc5 100644
                  if (event->devpath[common] == '/') {
                          event->delaying_seqnum = loop_event->seqnum;
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/systemd/systemd/0016-make-test-dir-configurable.patch b/meta/recipes-core/systemd/systemd/0016-make-test-dir-configurable.patch
deleted file mode 100644
index 10d1df5d529..00000000000
--- a/meta/recipes-core/systemd/systemd/0016-make-test-dir-configurable.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 218bbc555a37f9373fbb7f03c744eb65109d3470 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Nov 2016 20:47:37 -0800
-Subject: [PATCH 16/19] make test dir configurable
-
-Upstream-Status: Pending
-
-test maybe be run on target in cross-compile environment, and test dir
-is not the compilation dir, so make it configurable
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am  | 2 +-
- configure.ac | 7 +++++++
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 229492a..e997d82 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -214,7 +214,7 @@ AM_CPPFLAGS = \
- 	-DROOTLIBDIR=\"$(rootlibdir)\" \
- 	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
- 	-DROOTHOMEDIR=\"$(roothomedir)\" \
--	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
-+	-DTEST_DIR=\"$(testdir)/test\" \
- 	-I $(top_srcdir)/src \
- 	-I $(top_builddir)/src/basic \
- 	-I $(top_srcdir)/src/basic \
-diff --git a/configure.ac b/configure.ac
-index 1de0066..b12e320 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1535,6 +1535,11 @@ AC_ARG_WITH([roothomedir],
-         [],
-         [with_roothomedir=/root])
- 
-+AC_ARG_WITH([testdir],
-+        AS_HELP_STRING([--with-testdir=DIR], [test file directory]),
-+        [],
-+        [with_testdir=${abs_top_srcdir}])
-+
- AC_ARG_WITH([pamlibdir],
-         AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
-         [],
-@@ -1621,6 +1626,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
- AC_SUBST([rootprefix], [$with_rootprefix])
- AC_SUBST([rootlibdir], [$with_rootlibdir])
- AC_SUBST([roothomedir], [$with_roothomedir])
-+AC_SUBST([testdir], [$with_testdir])
- 
- AC_CONFIG_FILES([
-         Makefile
-@@ -1712,6 +1718,7 @@ AC_MSG_RESULT([
-         lib dir:                           ${libdir}
-         rootlib dir:                       ${with_rootlibdir}
-         root home dir:                     ${with_roothomedir}
-+        test dir:                          ${with_testdir}
-         SysV init scripts:                 ${SYSTEM_SYSVINIT_PATH}
-         SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
-         Build Python:                      ${PYTHON}
--- 
-2.10.2
-
diff --git a/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch b/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
index 548ffe03e68..067b73ff358 100644
--- a/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
+++ b/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
@@ -1,22 +1,23 @@
-From 7cc0b19d244023c7b3e557765b03b7971e047f29 Mon Sep 17 00:00:00 2001
+From 1355457092b02a15c646fc1c72e68b694a86dd99 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 22 Feb 2016 06:02:38 +0000
-Subject: [PATCH 18/19] check for uchar.h in configure
+Subject: [PATCH 12/14] check for uchar.h in configure
 
 Use ifdef to include uchar.h
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
+
 ---
  configure.ac        | 1 +
  src/basic/missing.h | 2 ++
  2 files changed, 3 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index b12e320..4e6dfdf 100644
+index 1150ca50e..60e7df5ee 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -298,6 +298,7 @@ AM_CONDITIONAL([HAVE_PYTHON], [test "x$have_python" = "xyes"])
+@@ -304,6 +304,7 @@ AM_CONDITIONAL([HAVE_PYTHON], [test "x$have_python" = "xyes"])
  
  # ------------------------------------------------------------------------------
  
@@ -25,12 +26,12 @@ index b12e320..4e6dfdf 100644
  AC_CHECK_HEADERS([linux/btrfs.h], [], [])
  AC_CHECK_HEADERS([linux/memfd.h], [], [])
 diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 4936873..ce79404 100644
+index 25a11f351..d631b7e3e 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -35,7 +35,9 @@
- #include <stdlib.h>
+@@ -37,7 +37,9 @@
  #include <sys/resource.h>
+ #include <sys/socket.h>
  #include <sys/syscall.h>
 +#ifdef HAVE_UCHAR_H
  #include <uchar.h>
@@ -39,5 +40,5 @@ index 4936873..ce79404 100644
  
  #ifdef HAVE_AUDIT
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch b/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
index 66aa4cab842..b6092762011 100644
--- a/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
+++ b/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
@@ -1,18 +1,19 @@
-From 289554d87e4fd96cae08c0fb449bf41d5641cd24 Mon Sep 17 00:00:00 2001
+From b7c6bfe2ec5ae426e586e1d6ecadb52a97128a3f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Nov 2016 20:49:53 -0800
-Subject: [PATCH 19/19] socket-util: don't fail if libc doesn't support IDN
+Subject: [PATCH 13/14] socket-util: don't fail if libc doesn't support IDN
 
 Upstream-Status: Pending
 
 Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/basic/socket-util.c | 9 +++++++++
  1 file changed, 9 insertions(+)
 
 diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
-index 4ebf106..53b9a12 100644
+index 016e64aa0..d4658826e 100644
 --- a/src/basic/socket-util.c
 +++ b/src/basic/socket-util.c
 @@ -47,6 +47,15 @@
@@ -29,8 +30,8 @@ index 4ebf106..53b9a12 100644
 +#define NI_IDN_USE_STD3_ASCII_RULES 0
 +#endif
  
- int socket_address_parse(SocketAddress *a, const char *s) {
-         char *e, *n;
+ #ifdef ENABLE_IDN
+ #  define IDN_FLAGS (NI_IDN|NI_IDN_USE_STD3_ASCII_RULES)
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch b/meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch
deleted file mode 100644
index e96d4d78036..00000000000
--- a/meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-This is a direct backport from systemd-233's stream to fix lxc/docker.
-
-% lxc-start -n container -F
-lxc-start: cgfsng.c: parse_hierarchies: 825 Failed to find current cgroup for controller 'name=systemd'
-lxc-start: cgfsng.c: all_controllers_found: 431 no systemd controller mountpoint found
-lxc-start: start.c: lxc_spawn: 1082 failed initializing cgroup support
-lxc-start: start.c: __lxc_start: 1332 failed to spawn 'container'
-lxc-start: lxc_start.c: main: 344 The container failed to start.
-lxc-start: lxc_start.c: main: 348 Additional information can be obtained by setting the --logfile and --logpriority options.
-
-## begin backport ##
-
-From 843d5baf6aad6c53fc00ea8d95d83209a4f92de1 Mon Sep 17 00:00:00 2001
-From: Martin Pitt <martin.pitt@ubuntu.com>
-Date: Thu, 10 Nov 2016 05:33:13 +0100
-Subject: [PATCH] core: don't use the unified hierarchy for the systemd cgroup
- yet (#4628)
-
-Too many things don't get along with the unified hierarchy yet:
-
- * https://github.com/opencontainers/runc/issues/1175
- * https://github.com/docker/docker/issues/28109
- * https://github.com/lxc/lxc/issues/1280
-
-So revert the default to the legacy hierarchy for now. Developers of the above
-software can opt into the unified hierarchy with
-"systemd.legacy_systemd_cgroup_controller=0".
-
-Upstream-Status: Backport
----
- src/basic/cgroup-util.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 5e73753..dc13025 100644
---- a/src/basic/cgroup-util.c
-+++ b/src/basic/cgroup-util.c
-@@ -2423,10 +2423,10 @@ bool cg_is_unified_systemd_controller_wanted(void) {
- 
-                 r = get_proc_cmdline_key("systemd.legacy_systemd_cgroup_controller=", &value);
-                 if (r < 0)
--                        return true;
-+                        return false;
- 
-                 if (r == 0)
--                        wanted = true;
-+                        wanted = false;
-                 else
-                         wanted = parse_boolean(value) <= 0;
-         }
--- 
-2.10.1
-
diff --git a/meta/recipes-core/systemd/systemd/0021-build-sys-check-for-lz4-in-the-old-and-new-numbering.patch b/meta/recipes-core/systemd/systemd/0021-build-sys-check-for-lz4-in-the-old-and-new-numbering.patch
deleted file mode 100644
index a7d7461bc87..00000000000
--- a/meta/recipes-core/systemd/systemd/0021-build-sys-check-for-lz4-in-the-old-and-new-numbering.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 8200002233bd40acda4bbfb991a31d87f4224fea Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Wed, 23 Nov 2016 10:18:30 -0500
-Subject: [PATCH 21/21] build-sys: check for lz4 in the old and new numbering
- scheme (#4717)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-lz4 upstream decided to switch to an incompatible numbering scheme
-(1.7.3 follows 131, to match the so version).
-PKG_CHECK_MODULES does not allow two version matches for the same package,
-so e.g. lz4 < 10 || lz4 >= 125 cannot be used. Check twice, once for
-"new" numbers (anything below 10 is assume to be new), once for the "old"
-numbers (anything above >= 125). This assumes that the "new" versioning
-will not get to 10 to quickly. I think that's a safe assumption, lz4 is a
-mature project.
-
-Fixed #4690.
-
-Upstream-Status: Backport
-
-Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
----
- configure.ac | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 279ce28..782b5d7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -640,10 +640,13 @@ AM_CONDITIONAL(HAVE_BZIP2, [test "$have_bzip2" = "yes"])
- have_lz4=no
- AC_ARG_ENABLE(lz4, AS_HELP_STRING([--disable-lz4], [Disable optional LZ4 support]))
- AS_IF([test "x$enable_lz4" != "xno"], [
--        PKG_CHECK_MODULES(LZ4, [ liblz4 >= 125 ],
--               [AC_DEFINE(HAVE_LZ4, 1, [Define in LZ4 is available])
-+        PKG_CHECK_MODULES(LZ4, [ liblz4 < 10 ],
-+               [AC_DEFINE(HAVE_LZ4, 1, [Define if LZ4 is available])
-                 have_lz4=yes],
--                have_lz4=no)
-+                [PKG_CHECK_MODULES(LZ4, [ liblz4 >= 125 ],
-+                      [AC_DEFINE(HAVE_LZ4, 1, [Define if LZ4 is available])
-+                      have_lz4=yes],
-+                      have_lz4=no)])
-         AS_IF([test "x$have_lz4" = xno -a "x$enable_lz4" = xyes],
-               [AC_MSG_ERROR([*** LZ4 support requested but libraries not found])])
- ])
--- 
-1.9.1
-
diff --git a/meta/recipes-core/systemd/systemd/0022-parse-util-Do-not-include-unneeded-xlocale.h.patch b/meta/recipes-core/systemd/systemd/0022-parse-util-Do-not-include-unneeded-xlocale.h.patch
deleted file mode 100644
index cad1867a4c9..00000000000
--- a/meta/recipes-core/systemd/systemd/0022-parse-util-Do-not-include-unneeded-xlocale.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 0c50b8332092178378257c2de800fb6b6b4a8706 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 3 Jul 2017 08:45:04 -0700
-Subject: [PATCH] parse-util: Do not include unneeded xlocale.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Backport [ partial https://github.com/systemd/systemd/commit/284d1cd0a12cad96a5ea61d1afb0dd677dbd147e]
-
- src/basic/parse-util.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index c98815b9b..a0eb45805 100644
---- a/src/basic/parse-util.c
-+++ b/src/basic/parse-util.c
-@@ -23,7 +23,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <xlocale.h>
- 
- #include "alloc-util.h"
- #include "extract-word.h"
--- 
-2.13.2
-
diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_234.bb
similarity index 97%
rename from meta/recipes-core/systemd/systemd_232.bb
rename to meta/recipes-core/systemd/systemd_234.bb
index a59ee74092d..ad7fc99b904 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -25,14 +25,9 @@ SRC_URI += " \
            file://0013-Make-root-s-home-directory-configurable.patch \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
-           file://0016-make-test-dir-configurable.patch \
            file://0017-remove-duplicate-include-uchar.h.patch \
            file://0018-check-for-uchar.h-in-configure.patch \
            file://0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
-           file://0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch \
-           file://0021-build-sys-check-for-lz4-in-the-old-and-new-numbering.patch \
-           file://0022-parse-util-Do-not-include-unneeded-xlocale.h.patch \
-           file://0001-core-load-fragment-refuse-units-with-errors-in-certa.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
@@ -151,7 +146,6 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
                  --with-firmware-path=${nonarch_base_libdir}/firmware \
-                 --with-testdir=${PTEST_PATH} \
                "
 # per the systemd README, define VALGRIND=1 to run under valgrind
 CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', '', d)}"
@@ -471,11 +465,20 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/modules-load.d \
                 ${exec_prefix}/lib/sysctl.d \
                 ${exec_prefix}/lib/sysusers.d \
+                ${exec_prefix}/lib/environment.d \
                 ${localstatedir} \
                 ${nonarch_base_libdir}/udev/rules.d/70-uaccess.rules \
                 ${nonarch_base_libdir}/udev/rules.d/71-seat.rules \
                 ${nonarch_base_libdir}/udev/rules.d/73-seat-late.rules \
                 ${nonarch_base_libdir}/udev/rules.d/99-systemd.rules \
+                ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
+                ${datadir}/dbus-1/system.d/org.freedesktop.locale1.conf \
+                ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
+                ${datadir}/dbus-1/system.d/org.freedesktop.resolve1.conf \
+                ${datadir}/dbus-1/system.d/org.freedesktop.systemd1.conf \
+                ${datadir}/dbus-1/system.d/org.freedesktop.machine1.conf \
+                ${datadir}/dbus-1/system.d/org.freedesktop.hostname1.conf \
+                ${datadir}/dbus-1/system.d/org.freedesktop.login1.conf \
                "
 
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
-- 
2.13.2


