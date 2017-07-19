Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6573F7823B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 12:34:49 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id g127so14646259wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 05:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=EnIDyplRG85hXRhqWezjgDtPvNtDSyxwEPJyCQegEIE=;
	b=fmomZ/98mWFrd6AHd54oF5oaYwFO4W0zYvzuTXMm9dIHcp8lg+zqCdnqoWznIemvlU
	rEoYhqOSrvAKJlVI9kjaMmLSEaorAEkzyUzhdz47wCISXk5cMX4aqyR5xWwcxqr59A9x
	NfkMinH+/hfJF2pACOWR/ZlsaeZCOp6Ib6QJlSxao99+6E40aXAwd1vm7atb5lrAL4XK
	yEtjt24HxKC6iy8Zy4uBc/NhUJfuRM/uPPWxdgb1Yf9mJaMgLfT8cU/U/G16unoaeE9T
	2CpAbOPOoe5K0Io9O+oxNlQE4AfM6Zu3ssajsdGi29egq4aLAfnXzE57vYpBsXxw4BxJ
	LKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EnIDyplRG85hXRhqWezjgDtPvNtDSyxwEPJyCQegEIE=;
	b=WY40cf12eVpB5nh4KaS+eflNTnTnCcccuhGF1jHRNdTOkHymYcArHwVxbB6cvzbqmG
	MGIh/isFMSjSnBZC1fhZ8Sgz+97rEinex9e9DajoDykapUwTDAm5SkHxdqWKdo32ZVGn
	W11/9+YAwVp/bHgJFfS1S6d4gkihSupbXBnuRve/VWxPsINwncf6LDGa31YD4yXhWriC
	WuePu8nzaLBrHN5pVZLekmTXwJfObSiiHf/FRcmJ3kvL0LQCdebx60qT+/7pfZvRfjVb
	0TUQ02mNZsvlYx+hdx01ZY0TFUPBAwDEODogJDYK0p0z4K+wCEIsC+zQdQ3I7skjo6rn
	tAeQ==
X-Gm-Message-State: AIVw1113b2WFiC1CWSf3Zt13UEj4Y5U8gsTXkk2tmbmDjvhaOL7//4NP
	B2IGuDxj5Toc1WNGwe8=
X-Received: by 10.28.216.21 with SMTP id p21mr4787579wmg.24.1500467690444;
	Wed, 19 Jul 2017 05:34:50 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id h79sm273462wmd.44.2017.07.19.05.34.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jul 2017 05:34:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 13:34:44 +0100
Message-Id: <20170719123444.5550-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][pyro] systemd: refuse to load units with errors (CVE-2017-1000082)
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
X-List-Received-Date: Wed, 19 Jul 2017 12:34:50 -0000

If a unit has a statement such as User=0day where the username exists but is
strictly speaking invalid, the unit will be started as the root user instead.

Backport a patch from upstream to mitigate this by refusing to start units such
as this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ragment-refuse-units-with-errors-in-certa.patch | 329 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_232.bb           |   1 +
 2 files changed, 330 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-load-fragment-refuse-units-with-errors-in-certa.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-core-load-fragment-refuse-units-with-errors-in-certa.patch b/meta/recipes-core/systemd/systemd/0001-core-load-fragment-refuse-units-with-errors-in-certa.patch
new file mode 100644
index 00000000000..80948b2ceea
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-core-load-fragment-refuse-units-with-errors-in-certa.patch
@@ -0,0 +1,329 @@
+If a user is created with a strictly-speaking invalid name such as '0day' and a
+unit created to run as that user, systemd rejects the username and runs the unit
+as root.
+
+CVE: CVE-2017-1000082
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From d8e1310e1ed7b6f122bc7eb8ba061fbd088783c0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Thu, 6 Jul 2017 13:28:19 -0400
+Subject: [PATCH] core/load-fragment: refuse units with errors in certain
+ directives
+
+If an error is encountered in any of the Exec* lines, WorkingDirectory,
+SELinuxContext, ApparmorProfile, SmackProcessLabel, Service (in .socket
+units), User, or Group, refuse to load the unit. If the config stanza
+has support, ignore the failure if '-' is present.
+
+For those configuration directives, even if we started the unit, it's
+pretty likely that it'll do something unexpected (like write files
+in a wrong place, or with a wrong context, or run with wrong permissions,
+etc). It seems better to refuse to start the unit and have the admin
+clean up the configuration without giving the service a chance to mess
+up stuff.
+
+Note that all "security" options that restrict what the unit can do
+(Capabilities, AmbientCapabilities, Restrict*, SystemCallFilter, Limit*,
+PrivateDevices, Protect*, etc) are _not_ treated like this. Such options are
+only supplementary, and are not always available depending on the architecture
+and compilation options, so unit authors have to make sure that the service
+runs correctly without them anyway.
+
+Fixes #6237, #6277.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ src/core/load-fragment.c  | 104 ++++++++++++++++++++++++++++------------------
+ src/test/test-unit-file.c |  14 +++----
+ 2 files changed, 70 insertions(+), 48 deletions(-)
+
+diff --git a/src/core/load-fragment.c b/src/core/load-fragment.c
+index cbc826809..2047974f4 100644
+--- a/src/core/load-fragment.c
++++ b/src/core/load-fragment.c
+@@ -630,20 +630,28 @@ int config_parse_exec(
+ 
+                 if (isempty(f)) {
+                         /* First word is either "-" or "@" with no command. */
+-                        log_syntax(unit, LOG_ERR, filename, line, 0, "Empty path in command line, ignoring: \"%s\"", rvalue);
+-                        return 0;
++                        log_syntax(unit, LOG_ERR, filename, line, 0,
++                                   "Empty path in command line%s: \"%s\"",
++                                   ignore ? ", ignoring" : "", rvalue);
++                        return ignore ? 0 : -ENOEXEC;
+                 }
+                 if (!string_is_safe(f)) {
+-                        log_syntax(unit, LOG_ERR, filename, line, 0, "Executable path contains special characters, ignoring: %s", rvalue);
+-                        return 0;
++                        log_syntax(unit, LOG_ERR, filename, line, 0,
++                                   "Executable path contains special characters%s: %s",
++                                   ignore ? ", ignoring" : "", rvalue);
++                        return ignore ? 0 : -ENOEXEC;
+                 }
+                 if (!path_is_absolute(f)) {
+-                        log_syntax(unit, LOG_ERR, filename, line, 0, "Executable path is not absolute, ignoring: %s", rvalue);
+-                        return 0;
++                        log_syntax(unit, LOG_ERR, filename, line, 0,
++                                   "Executable path is not absolute%s: %s",
++                                   ignore ? ", ignoring" : "", rvalue);
++                        return ignore ? 0 : -ENOEXEC;
+                 }
+                 if (endswith(f, "/")) {
+-                        log_syntax(unit, LOG_ERR, filename, line, 0, "Executable path specifies a directory, ignoring: %s", rvalue);
+-                        return 0;
++                        log_syntax(unit, LOG_ERR, filename, line, 0,
++                                   "Executable path specifies a directory%s: %s",
++                                   ignore ? ", ignoring" : "", rvalue);
++                        return ignore ? 0 : -ENOEXEC;
+                 }
+ 
+                 if (f == firstword) {
+@@ -699,7 +707,7 @@ int config_parse_exec(
+                         if (r == 0)
+                                 break;
+                         else if (r < 0)
+-                                return 0;
++                                return ignore ? 0 : -ENOEXEC;
+ 
+                         if (!GREEDY_REALLOC(n, nbufsize, nlen + 2))
+                                 return log_oom();
+@@ -709,8 +717,10 @@ int config_parse_exec(
+                 }
+ 
+                 if (!n || !n[0]) {
+-                        log_syntax(unit, LOG_ERR, filename, line, 0, "Empty executable name or zeroeth argument, ignoring: %s", rvalue);
+-                        return 0;
++                        log_syntax(unit, LOG_ERR, filename, line, 0,
++                                   "Empty executable name or zeroeth argument%s: %s",
++                                   ignore ? ", ignoring" : "", rvalue);
++                        return ignore ? 0 : -ENOEXEC;
+                 }
+ 
+                 nce = new0(ExecCommand, 1);
+@@ -1315,8 +1325,10 @@ int config_parse_exec_selinux_context(
+ 
+         r = unit_name_printf(u, rvalue, &k);
+         if (r < 0) {
+-                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve specifiers, ignoring: %m");
+-                return 0;
++                log_syntax(unit, LOG_ERR, filename, line, r,
++                           "Failed to resolve specifiers%s: %m",
++                           ignore ? ", ignoring" : "");
++                return ignore ? 0 : -ENOEXEC;
+         }
+ 
+         free(c->selinux_context);
+@@ -1363,8 +1375,10 @@ int config_parse_exec_apparmor_profile(
+ 
+         r = unit_name_printf(u, rvalue, &k);
+         if (r < 0) {
+-                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve specifiers, ignoring: %m");
+-                return 0;
++                log_syntax(unit, LOG_ERR, filename, line, r,
++                           "Failed to resolve specifiers%s: %m",
++                           ignore ? ", ignoring" : "");
++                return ignore ? 0 : -ENOEXEC;
+         }
+ 
+         free(c->apparmor_profile);
+@@ -1411,8 +1425,10 @@ int config_parse_exec_smack_process_label(
+ 
+         r = unit_name_printf(u, rvalue, &k);
+         if (r < 0) {
+-                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve specifiers, ignoring: %m");
+-                return 0;
++                log_syntax(unit, LOG_ERR, filename, line, r,
++                           "Failed to resolve specifiers%s: %m",
++                           ignore ? ", ignoring" : "");
++                return ignore ? 0 : -ENOEXEC;
+         }
+ 
+         free(c->smack_process_label);
+@@ -1630,19 +1646,19 @@ int config_parse_socket_service(
+ 
+         r = unit_name_printf(UNIT(s), rvalue, &p);
+         if (r < 0) {
+-                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve specifiers, ignoring: %s", rvalue);
+-                return 0;
++                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve specifiers: %s", rvalue);
++                return -ENOEXEC;
+         }
+ 
+         if (!endswith(p, ".service")) {
+-                log_syntax(unit, LOG_ERR, filename, line, 0, "Unit must be of type service, ignoring: %s", rvalue);
+-                return 0;
++                log_syntax(unit, LOG_ERR, filename, line, 0, "Unit must be of type service: %s", rvalue);
++                return -ENOEXEC;
+         }
+ 
+         r = manager_load_unit(UNIT(s)->manager, p, NULL, &error, &x);
+         if (r < 0) {
+-                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to load unit %s, ignoring: %s", rvalue, bus_error_message(&error, r));
+-                return 0;
++                log_syntax(unit, LOG_ERR, filename, line, r, "Failed to load unit %s: %s", rvalue, bus_error_message(&error, r));
++                return -ENOEXEC;
+         }
+ 
+         unit_ref_set(&s->service, x);
+@@ -1893,13 +1909,13 @@ int config_parse_user_group(
+ 
+                 r = unit_full_printf(u, rvalue, &k);
+                 if (r < 0) {
+-                        log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve unit specifiers in %s, ignoring: %m", rvalue);
+-                        return 0;
++                        log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve unit specifiers in %s: %m", rvalue);
++                        return -ENOEXEC;
+                 }
+ 
+                 if (!valid_user_group_name_or_id(k)) {
+-                        log_syntax(unit, LOG_ERR, filename, line, 0, "Invalid user/group name or numeric ID, ignoring: %s", k);
+-                        return 0;
++                        log_syntax(unit, LOG_ERR, filename, line, 0, "Invalid user/group name or numeric ID: %s", k);
++                        return -ENOEXEC;
+                 }
+ 
+                 n = k;
+@@ -1957,19 +1973,19 @@ int config_parse_user_group_strv(
+                 if (r == -ENOMEM)
+                         return log_oom();
+                 if (r < 0) {
+-                        log_syntax(unit, LOG_ERR, filename, line, r, "Invalid syntax, ignoring: %s", rvalue);
+-                        break;
++                        log_syntax(unit, LOG_ERR, filename, line, r, "Invalid syntax: %s", rvalue);
++                        return -ENOEXEC;
+                 }
+ 
+                 r = unit_full_printf(u, word, &k);
+                 if (r < 0) {
+-                        log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve unit specifiers in %s, ignoring: %m", word);
+-                        continue;
++                        log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve unit specifiers in %s: %m", word);
++                        return -ENOEXEC;
+                 }
+ 
+                 if (!valid_user_group_name_or_id(k)) {
+-                        log_syntax(unit, LOG_ERR, filename, line, 0, "Invalid user/group name or numeric ID, ignoring: %s", k);
+-                        continue;
++                        log_syntax(unit, LOG_ERR, filename, line, 0, "Invalid user/group name or numeric ID: %s", k);
++                        return -ENOEXEC;
+                 }
+ 
+                 r = strv_push(users, k);
+@@ -2128,25 +2144,28 @@ int config_parse_working_directory(
+ 
+                 r = unit_full_printf(u, rvalue, &k);
+                 if (r < 0) {
+-                        log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve unit specifiers in working directory path '%s', ignoring: %m", rvalue);
+-                        return 0;
++                        log_syntax(unit, LOG_ERR, filename, line, r,
++                                   "Failed to resolve unit specifiers in working directory path '%s'%s: %m",
++                                   rvalue, missing_ok ? ", ignoring" : "");
++                        return missing_ok ? 0 : -ENOEXEC;
+                 }
+ 
+                 path_kill_slashes(k);
+ 
+                 if (!utf8_is_valid(k)) {
+                         log_syntax_invalid_utf8(unit, LOG_ERR, filename, line, rvalue);
+-                        return 0;
++                        return missing_ok ? 0 : -ENOEXEC;
+                 }
+ 
+                 if (!path_is_absolute(k)) {
+-                        log_syntax(unit, LOG_ERR, filename, line, 0, "Working directory path '%s' is not absolute, ignoring.", rvalue);
+-                        return 0;
++                        log_syntax(unit, LOG_ERR, filename, line, 0,
++                                   "Working directory path '%s' is not absolute%s.",
++                                   rvalue, missing_ok ? ", ignoring" : "");
++                        return missing_ok ? 0 : -ENOEXEC;
+                 }
+ 
+-                free_and_replace(c->working_directory, k);
+-
+                 c->working_directory_home = false;
++                free_and_replace(c->working_directory, k);
+         }
+ 
+         c->working_directory_missing_ok = missing_ok;
+@@ -4228,8 +4247,11 @@ int unit_load_fragment(Unit *u) {
+                         return r;
+ 
+                 r = load_from_path(u, k);
+-                if (r < 0)
++                if (r < 0) {
++                        if (r == -ENOEXEC)
++                                log_unit_notice(u, "Unit configuration has fatal error, unit will not be started.");
+                         return r;
++                }
+ 
+                 if (u->load_state == UNIT_STUB) {
+                         SET_FOREACH(t, u->names, i) {
+diff --git a/src/test/test-unit-file.c b/src/test/test-unit-file.c
+index 12f48bf43..fd797b587 100644
+--- a/src/test/test-unit-file.c
++++ b/src/test/test-unit-file.c
+@@ -146,7 +146,7 @@ static void test_config_parse_exec(void) {
+         r = config_parse_exec(NULL, "fake", 4, "section", 1,
+                               "LValue", 0, "/RValue/ argv0 r1",
+                               &c, u);
+-        assert_se(r == 0);
++        assert_se(r == -ENOEXEC);
+         assert_se(c1->command_next == NULL);
+ 
+         log_info("/* honour_argv0 */");
+@@ -161,7 +161,7 @@ static void test_config_parse_exec(void) {
+         r = config_parse_exec(NULL, "fake", 3, "section", 1,
+                               "LValue", 0, "@/RValue",
+                               &c, u);
+-        assert_se(r == 0);
++        assert_se(r == -ENOEXEC);
+         assert_se(c1->command_next == NULL);
+ 
+         log_info("/* no command, whitespace only, reset */");
+@@ -220,7 +220,7 @@ static void test_config_parse_exec(void) {
+                               "-@/RValue argv0 r1 ; ; "
+                               "/goo/goo boo",
+                               &c, u);
+-        assert_se(r >= 0);
++        assert_se(r == -ENOEXEC);
+         c1 = c1->command_next;
+         check_execcommand(c1, "/RValue", "argv0", "r1", NULL, true);
+ 
+@@ -374,7 +374,7 @@ static void test_config_parse_exec(void) {
+                 r = config_parse_exec(NULL, "fake", 4, "section", 1,
+                                       "LValue", 0, path,
+                                       &c, u);
+-                assert_se(r == 0);
++                assert_se(r == -ENOEXEC);
+                 assert_se(c1->command_next == NULL);
+         }
+ 
+@@ -401,21 +401,21 @@ static void test_config_parse_exec(void) {
+         r = config_parse_exec(NULL, "fake", 4, "section", 1,
+                               "LValue", 0, "/path\\",
+                               &c, u);
+-        assert_se(r == 0);
++        assert_se(r == -ENOEXEC);
+         assert_se(c1->command_next == NULL);
+ 
+         log_info("/* missing ending ' */");
+         r = config_parse_exec(NULL, "fake", 4, "section", 1,
+                               "LValue", 0, "/path 'foo",
+                               &c, u);
+-        assert_se(r == 0);
++        assert_se(r == -ENOEXEC);
+         assert_se(c1->command_next == NULL);
+ 
+         log_info("/* missing ending ' with trailing backslash */");
+         r = config_parse_exec(NULL, "fake", 4, "section", 1,
+                               "LValue", 0, "/path 'foo\\",
+                               &c, u);
+-        assert_se(r == 0);
++        assert_se(r == -ENOEXEC);
+         assert_se(c1->command_next == NULL);
+ 
+         log_info("/* invalid space between modifiers */");
+-- 
+2.11.0
diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index 398cb46f0d8..e54c723d7f1 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -33,6 +33,7 @@ SRC_URI += " \
            file://0018-check-for-uchar.h-in-configure.patch \
            file://0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
            file://0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch \
+           file://0001-core-load-fragment-refuse-units-with-errors-in-certa.patch \
 "
 SRC_URI_append_libc-uclibc = "\
            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
-- 
2.11.0


