Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5B07E784E0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 19:27:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB6JRPX2010135
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Dec 2017 11:27:25 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Dec 2017 11:27:18 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Dec 2017 11:27:18 -0800
Message-ID: <20171206192718.242138-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: fix segfault when terminating systemd --test
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
X-List-Received-Date: Wed, 06 Dec 2017 19:27:25 -0000
Content-Type: text/plain

Currently, if "systemd --test" is not allowed to complete
sending output, it will segfault.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 ...te-presets-after-generators-have-run-6526.patch |  69 +++++++++
 ...any-initialization-steps-when-running-in-.patch | 163 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_234.bb           |   2 +
 3 files changed, 234 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch b/meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
new file mode 100644
index 0000000..df100e5
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
@@ -0,0 +1,69 @@
+From 28dd66ecfce743b1ea9046c7bb501e0fcaeff724 Mon Sep 17 00:00:00 2001
+From: Luca Bruno <luca.bruno@coreos.com>
+Date: Sun, 6 Aug 2017 13:24:24 +0000
+Subject: [PATCH] core: evaluate presets after generators have run (#6526)
+
+This commit moves the first-boot system preset-settings evaluation out
+of main and into the manager startup logic itself. Notably, it reverses
+the order between generators and presets evaluation, so that any changes
+performed by first-boot generators are taken into the account by presets
+logic.
+
+After this change, units created by a generator can be enabled as part
+of a preset.
+
+Upstream-Status: Backport
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/core/main.c    | 12 ++----------
+ src/core/manager.c |  8 ++++++++
+ 2 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/src/core/main.c b/src/core/main.c
+index dfedc3d..11ac9cf 100644
+--- a/src/core/main.c
++++ b/src/core/main.c
+@@ -1809,18 +1809,10 @@ int main(int argc, char *argv[]) {
+                 if (prctl(PR_SET_CHILD_SUBREAPER, 1) < 0)
+                         log_warning_errno(errno, "Failed to make us a subreaper: %m");
+ 
+-        if (arg_system) {
++        if (arg_system)
++                /* Bump up RLIMIT_NOFILE for systemd itself */
+                 (void) bump_rlimit_nofile(&saved_rlimit_nofile);
+ 
+-                if (empty_etc) {
+-                        r = unit_file_preset_all(UNIT_FILE_SYSTEM, 0, NULL, UNIT_FILE_PRESET_ENABLE_ONLY, NULL, 0);
+-                        if (r < 0)
+-                                log_full_errno(r == -EEXIST ? LOG_NOTICE : LOG_WARNING, r, "Failed to populate /etc with preset unit settings, ignoring: %m");
+-                        else
+-                                log_info("Populated /etc with preset unit settings.");
+-                }
+-        }
+-
+         r = manager_new(arg_system ? UNIT_FILE_SYSTEM : UNIT_FILE_USER, arg_action == ACTION_TEST, &m);
+         if (r < 0) {
+                 log_emergency_errno(r, "Failed to allocate manager object: %m");
+diff --git a/src/core/manager.c b/src/core/manager.c
+index 1aadb70..fb5e2b5 100644
+--- a/src/core/manager.c
++++ b/src/core/manager.c
+@@ -1328,6 +1328,14 @@ int manager_startup(Manager *m, FILE *serialization, FDSet *fds) {
+         if (r < 0)
+                 return r;
+ 
++        if (m->first_boot && m->unit_file_scope == UNIT_FILE_SYSTEM) {
++                q = unit_file_preset_all(UNIT_FILE_SYSTEM, 0, NULL, UNIT_FILE_PRESET_ENABLE_ONLY, NULL, 0);
++                if (q < 0)
++                        log_full_errno(q == -EEXIST ? LOG_NOTICE : LOG_WARNING, q, "Failed to populate /etc with preset unit settings, ignoring: %m");
++                else
++                        log_info("Populated /etc with preset unit settings.");
++        }
++
+         lookup_paths_reduce(&m->lookup_paths);
+         manager_build_unit_path_cache(m);
+ 
+-- 
+2.10.2
+
diff --git a/meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch b/meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
new file mode 100644
index 0000000..a033b04
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
@@ -0,0 +1,163 @@
+From dea374e898a749a0474b72b2015cca9009b1432b Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Wed, 13 Sep 2017 10:31:40 +0200
+Subject: [PATCH] main: skip many initialization steps when running in --test
+ mode
+
+Most importantly, don't collect open socket activation fds when in
+--test mode. This specifically created a problem because we invoke
+pager_open() beforehand (which these days makes copies of the original
+stdout/stderr in order to be able to restore them when the pager goes
+away) and we might mistakenly the fd copies it creates as socket
+activation fds.
+
+Fixes: #6383
+
+Upstream-Status: Backport
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/core/main.c | 108 +++++++++++++++++++++++++++++---------------------------
+ 1 file changed, 56 insertions(+), 52 deletions(-)
+
+diff --git a/src/core/main.c b/src/core/main.c
+index 11ac9cf..d1a53a5 100644
+--- a/src/core/main.c
++++ b/src/core/main.c
+@@ -1679,20 +1679,22 @@ int main(int argc, char *argv[]) {
+         log_close();
+ 
+         /* Remember open file descriptors for later deserialization */
+-        r = fdset_new_fill(&fds);
+-        if (r < 0) {
+-                log_emergency_errno(r, "Failed to allocate fd set: %m");
+-                error_message = "Failed to allocate fd set";
+-                goto finish;
+-        } else
+-                fdset_cloexec(fds, true);
++        if (arg_action == ACTION_RUN) {
++                r = fdset_new_fill(&fds);
++                if (r < 0) {
++                        log_emergency_errno(r, "Failed to allocate fd set: %m");
++                        error_message = "Failed to allocate fd set";
++                        goto finish;
++                } else
++                        fdset_cloexec(fds, true);
+ 
+-        if (arg_serialization)
+-                assert_se(fdset_remove(fds, fileno(arg_serialization)) >= 0);
++                if (arg_serialization)
++                        assert_se(fdset_remove(fds, fileno(arg_serialization)) >= 0);
+ 
+-        if (arg_system)
+-                /* Become a session leader if we aren't one yet. */
+-                setsid();
++                if (arg_system)
++                        /* Become a session leader if we aren't one yet. */
++                        setsid();
++        }
+ 
+         /* Move out of the way, so that we won't block unmounts */
+         assert_se(chdir("/") == 0);
+@@ -1762,56 +1764,58 @@ int main(int argc, char *argv[]) {
+                           arg_action == ACTION_TEST ? " test" : "", getuid(), t);
+         }
+ 
+-        if (arg_system && !skip_setup) {
+-                if (arg_show_status > 0)
+-                        status_welcome();
++        if (arg_action == ACTION_RUN) {
++                if (arg_system && !skip_setup) {
++                        if (arg_show_status > 0)
++                                status_welcome();
+ 
+-                hostname_setup();
+-                machine_id_setup(NULL, arg_machine_id, NULL);
+-                loopback_setup();
+-                bump_unix_max_dgram_qlen();
++                        hostname_setup();
++                        machine_id_setup(NULL, arg_machine_id, NULL);
++                        loopback_setup();
++                        bump_unix_max_dgram_qlen();
+ 
+-                test_usr();
+-        }
++                        test_usr();
++                }
+ 
+-        if (arg_system && arg_runtime_watchdog > 0 && arg_runtime_watchdog != USEC_INFINITY)
+-                watchdog_set_timeout(&arg_runtime_watchdog);
++                if (arg_system && arg_runtime_watchdog > 0 && arg_runtime_watchdog != USEC_INFINITY)
++                        watchdog_set_timeout(&arg_runtime_watchdog);
+ 
+-        if (arg_timer_slack_nsec != NSEC_INFINITY)
+-                if (prctl(PR_SET_TIMERSLACK, arg_timer_slack_nsec) < 0)
+-                        log_error_errno(errno, "Failed to adjust timer slack: %m");
++                if (arg_timer_slack_nsec != NSEC_INFINITY)
++                        if (prctl(PR_SET_TIMERSLACK, arg_timer_slack_nsec) < 0)
++                                log_error_errno(errno, "Failed to adjust timer slack: %m");
+ 
+-        if (arg_system && !cap_test_all(arg_capability_bounding_set)) {
+-                r = capability_bounding_set_drop_usermode(arg_capability_bounding_set);
+-                if (r < 0) {
+-                        log_emergency_errno(r, "Failed to drop capability bounding set of usermode helpers: %m");
+-                        error_message = "Failed to drop capability bounding set of usermode helpers";
+-                        goto finish;
+-                }
+-                r = capability_bounding_set_drop(arg_capability_bounding_set, true);
+-                if (r < 0) {
+-                        log_emergency_errno(r, "Failed to drop capability bounding set: %m");
+-                        error_message = "Failed to drop capability bounding set";
+-                        goto finish;
++                if (arg_system && !cap_test_all(arg_capability_bounding_set)) {
++                        r = capability_bounding_set_drop_usermode(arg_capability_bounding_set);
++                        if (r < 0) {
++                                log_emergency_errno(r, "Failed to drop capability bounding set of usermode helpers: %m");
++                                error_message = "Failed to drop capability bounding set of usermode helpers";
++                                goto finish;
++                        }
++                        r = capability_bounding_set_drop(arg_capability_bounding_set, true);
++                        if (r < 0) {
++                                log_emergency_errno(r, "Failed to drop capability bounding set: %m");
++                                error_message = "Failed to drop capability bounding set";
++                                goto finish;
++                        }
+                 }
+-        }
+ 
+-        if (arg_syscall_archs) {
+-                r = enforce_syscall_archs(arg_syscall_archs);
+-                if (r < 0) {
+-                        error_message = "Failed to set syscall architectures";
+-                        goto finish;
++                if (arg_syscall_archs) {
++                        r = enforce_syscall_archs(arg_syscall_archs);
++                        if (r < 0) {
++                                error_message = "Failed to set syscall architectures";
++                                goto finish;
++                        }
+                 }
+-        }
+ 
+-        if (!arg_system)
+-                /* Become reaper of our children */
+-                if (prctl(PR_SET_CHILD_SUBREAPER, 1) < 0)
+-                        log_warning_errno(errno, "Failed to make us a subreaper: %m");
++                if (!arg_system)
++                        /* Become reaper of our children */
++                        if (prctl(PR_SET_CHILD_SUBREAPER, 1) < 0)
++                                log_warning_errno(errno, "Failed to make us a subreaper: %m");
+ 
+-        if (arg_system)
+-                /* Bump up RLIMIT_NOFILE for systemd itself */
+-                (void) bump_rlimit_nofile(&saved_rlimit_nofile);
++                if (arg_system)
++                        /* Bump up RLIMIT_NOFILE for systemd itself */
++                        (void) bump_rlimit_nofile(&saved_rlimit_nofile);
++        }
+ 
+         r = manager_new(arg_system ? UNIT_FILE_SYSTEM : UNIT_FILE_USER, arg_action == ACTION_TEST, &m);
+         if (r < 0) {
+-- 
+2.10.2
+
diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 765daf2..778b868 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -42,6 +42,8 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
            file://0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch \
            file://0001-Use-uintmax_t-for-handling-rlim_t.patch \
+           file://0001-core-evaluate-presets-after-generators-have-run-6526.patch \
+           file://0001-main-skip-many-initialization-steps-when-running-in-.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.7.4


