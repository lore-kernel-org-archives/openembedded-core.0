Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id DB73771C8A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 16:27:05 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id m85so24039294wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Aug 2017 09:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=iDpwvNtIcKSo0kXZloh+2Rvf1jF+zETNeFXSoRQQxnE=;
	b=UVPsIzuK6DcORfg15F+aTpZY4+b8bDXITOOniiPszBA9i3M/+FOm+8Kl3kq9vzqFkr
	eqaw0WiFel4e2nwRTTA+zn8GK2moAHHcCoHaeTxxrAocGCM7fbLIZhTcnZ3lfqK/qOIy
	sn3E3A3uDUbvx9vpaUg1kxjixEIUNAhpCL5NFpIYqqBTYpU78bkVzxh10YHNuXb1uL+L
	8qMSdCt6DIVqSsME10elqCY0hJRbztZd86mgzuMW3PE4Ox8i7VejLfbo9qY75VIkw/yW
	9g0Xj9rme1h8KPV2ELcpkstlUfJsPCHNIsbi4EWPKXBbyVaGLl6lbX559GesTNT45TGR
	+6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iDpwvNtIcKSo0kXZloh+2Rvf1jF+zETNeFXSoRQQxnE=;
	b=H65pSGQ2PcWOR1YmigvrV54aQ677hn1Fqsj8WQS6eS28vT0b5BkeC2Nb3wxZc3vtCl
	FI7bAvUwV/C3k4GGOrkQM7cZmvFupeBd3RD5SKn5Oy/DaaiPBz21FcVgW37wZE7888jL
	XHX60EPsx/fLb5f85dFkhsjNir6zFF/cdt2Frmno6TByXpVJGTqMkG5ylVx4l9iUmqsY
	IsTWgaNnVc5EOEs1T72TWcJG6vQDQTgfGl49YIE5SOL5ODCdgucPwRH7JPIzgPLNnavd
	hbFwEGNBUSDlxbQyrCafUbXtlfB/GUm3D4xSGFq0bmKhPvgADD5y0X36nb6oTscyMeBP
	ukxA==
X-Gm-Message-State: AHYfb5i0kWPG5d+6F3oY/lEZ6S5yMlrUpZ+sPIZjwr1qr1jE3eJ9vXUc
	LaaomIejmzrYqQ61gUk=
X-Received: by 10.28.20.67 with SMTP id 64mr2065668wmu.60.1501864025984;
	Fri, 04 Aug 2017 09:27:05 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f80sm1275946wmh.16.2017.08.04.09.27.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 09:27:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 17:27:00 +0100
Message-Id: <20170804162700.11765-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170804162700.11765-1-ross.burton@intel.com>
References: <20170804162700.11765-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH][morty 3/3] systemd: refuse to load units with errors (CVE-2017-1000082)
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
X-List-Received-Date: Fri, 04 Aug 2017 16:27:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If a unit has a statement such as User=0day where the username exists but is
strictly speaking invalid, the unit will be started as the root user instead.

Backport a patch from upstream to mitigate this by refusing to start units such
as this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../systemd/systemd/validate-user.patch            | 856 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_230.bb           |   1 +
 2 files changed, 857 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/validate-user.patch

diff --git a/meta/recipes-core/systemd/systemd/validate-user.patch b/meta/recipes-core/systemd/systemd/validate-user.patch
new file mode 100644
index 00000000000..8e0e0c1b9af
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/validate-user.patch
@@ -0,0 +1,856 @@
+If a user is created with a strictly-speaking invalid name such as '0day' and a
+unit created to run as that user, systemd rejects the username and runs the unit
+as root.
+
+CVE: CVE-2017-1000082
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From e0c4eb1435d50cb3797cf94100d4886dc2022bce Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Thu, 14 Jul 2016 12:23:39 +0200
+Subject: [PATCH 1/3] sysusers: move various user credential validity checks to
+ src/basic/
+
+This way we can reuse them for validating User=/Group= settings in unit files
+(to be added in a later commit).
+
+Also, add some tests for them.
+---
+ src/basic/user-util.c     | 93 +++++++++++++++++++++++++++++++++++++++++++++++
+ src/basic/user-util.h     |  5 +++
+ src/sysusers/sysusers.c   | 75 --------------------------------------
+ src/test/test-user-util.c | 87 ++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 185 insertions(+), 75 deletions(-)
+
+diff --git a/src/basic/user-util.c b/src/basic/user-util.c
+index f65ca3eda..c85b5c6a8 100644
+--- a/src/basic/user-util.c
++++ b/src/basic/user-util.c
+@@ -29,6 +29,7 @@
+ #include <string.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
++#include <utmp.h>
+ 
+ #include "missing.h"
+ #include "alloc-util.h"
+@@ -39,6 +40,7 @@
+ #include "path-util.h"
+ #include "string-util.h"
+ #include "user-util.h"
++#include "utf8.h"
+ 
+ bool uid_is_valid(uid_t uid) {
+ 
+@@ -479,3 +481,94 @@ int take_etc_passwd_lock(const char *root) {
+ 
+         return fd;
+ }
++
++bool valid_user_group_name(const char *u) {
++        const char *i;
++        long sz;
++
++        /* Checks if the specified name is a valid user/group name. */
++
++        if (isempty(u))
++                return false;
++
++        if (!(u[0] >= 'a' && u[0] <= 'z') &&
++            !(u[0] >= 'A' && u[0] <= 'Z') &&
++            u[0] != '_')
++                return false;
++
++        for (i = u+1; *i; i++) {
++                if (!(*i >= 'a' && *i <= 'z') &&
++                    !(*i >= 'A' && *i <= 'Z') &&
++                    !(*i >= '0' && *i <= '9') &&
++                    *i != '_' &&
++                    *i != '-')
++                        return false;
++        }
++
++        sz = sysconf(_SC_LOGIN_NAME_MAX);
++        assert_se(sz > 0);
++
++        if ((size_t) (i-u) > (size_t) sz)
++                return false;
++
++        if ((size_t) (i-u) > UT_NAMESIZE - 1)
++                return false;
++
++        return true;
++}
++
++bool valid_user_group_name_or_id(const char *u) {
++
++        /* Similar as above, but is also fine with numeric UID/GID specifications, as long as they are in the right
++         * range, and not the invalid user ids. */
++
++        if (isempty(u))
++                return false;
++
++        if (valid_user_group_name(u))
++                return true;
++
++        return parse_uid(u, NULL) >= 0;
++}
++
++bool valid_gecos(const char *d) {
++
++        if (!d)
++                return false;
++
++        if (!utf8_is_valid(d))
++                return false;
++
++        if (string_has_cc(d, NULL))
++                return false;
++
++        /* Colons are used as field separators, and hence not OK */
++        if (strchr(d, ':'))
++                return false;
++
++        return true;
++}
++
++bool valid_home(const char *p) {
++
++        if (isempty(p))
++                return false;
++
++        if (!utf8_is_valid(p))
++                return false;
++
++        if (string_has_cc(p, NULL))
++                return false;
++
++        if (!path_is_absolute(p))
++                return false;
++
++        if (!path_is_safe(p))
++                return false;
++
++        /* Colons are used as field separators, and hence not OK */
++        if (strchr(p, ':'))
++                return false;
++
++        return true;
++}
+diff --git a/src/basic/user-util.h b/src/basic/user-util.h
+index 8026eca3f..36f71fb00 100644
+--- a/src/basic/user-util.h
++++ b/src/basic/user-util.h
+@@ -68,3 +68,8 @@ int take_etc_passwd_lock(const char *root);
+ static inline bool userns_supported(void) {
+         return access("/proc/self/uid_map", F_OK) >= 0;
+ }
++
++bool valid_user_group_name(const char *u);
++bool valid_user_group_name_or_id(const char *u);
++bool valid_gecos(const char *d);
++bool valid_home(const char *p);
+diff --git a/src/sysusers/sysusers.c b/src/sysusers/sysusers.c
+index 4377f1b91..df3b7de30 100644
+--- a/src/sysusers/sysusers.c
++++ b/src/sysusers/sysusers.c
+@@ -1299,81 +1299,6 @@ static bool item_equal(Item *a, Item *b) {
+         return true;
+ }
+ 
+-static bool valid_user_group_name(const char *u) {
+-        const char *i;
+-        long sz;
+-
+-        if (isempty(u))
+-                return false;
+-
+-        if (!(u[0] >= 'a' && u[0] <= 'z') &&
+-            !(u[0] >= 'A' && u[0] <= 'Z') &&
+-            u[0] != '_')
+-                return false;
+-
+-        for (i = u+1; *i; i++) {
+-                if (!(*i >= 'a' && *i <= 'z') &&
+-                    !(*i >= 'A' && *i <= 'Z') &&
+-                    !(*i >= '0' && *i <= '9') &&
+-                    *i != '_' &&
+-                    *i != '-')
+-                        return false;
+-        }
+-
+-        sz = sysconf(_SC_LOGIN_NAME_MAX);
+-        assert_se(sz > 0);
+-
+-        if ((size_t) (i-u) > (size_t) sz)
+-                return false;
+-
+-        if ((size_t) (i-u) > UT_NAMESIZE - 1)
+-                return false;
+-
+-        return true;
+-}
+-
+-static bool valid_gecos(const char *d) {
+-
+-        if (!d)
+-                return false;
+-
+-        if (!utf8_is_valid(d))
+-                return false;
+-
+-        if (string_has_cc(d, NULL))
+-                return false;
+-
+-        /* Colons are used as field separators, and hence not OK */
+-        if (strchr(d, ':'))
+-                return false;
+-
+-        return true;
+-}
+-
+-static bool valid_home(const char *p) {
+-
+-        if (isempty(p))
+-                return false;
+-
+-        if (!utf8_is_valid(p))
+-                return false;
+-
+-        if (string_has_cc(p, NULL))
+-                return false;
+-
+-        if (!path_is_absolute(p))
+-                return false;
+-
+-        if (!path_is_safe(p))
+-                return false;
+-
+-        /* Colons are used as field separators, and hence not OK */
+-        if (strchr(p, ':'))
+-                return false;
+-
+-        return true;
+-}
+-
+ static int parse_line(const char *fname, unsigned line, const char *buffer) {
+ 
+         static const Specifier specifier_table[] = {
+diff --git a/src/test/test-user-util.c b/src/test/test-user-util.c
+index 8d1ec19f1..2a344a9f9 100644
+--- a/src/test/test-user-util.c
++++ b/src/test/test-user-util.c
+@@ -61,6 +61,88 @@ static void test_uid_ptr(void) {
+         assert_se(PTR_TO_UID(UID_TO_PTR(1000)) == 1000);
+ }
+ 
++static void test_valid_user_group_name(void) {
++        assert_se(!valid_user_group_name(NULL));
++        assert_se(!valid_user_group_name(""));
++        assert_se(!valid_user_group_name("1"));
++        assert_se(!valid_user_group_name("65535"));
++        assert_se(!valid_user_group_name("-1"));
++        assert_se(!valid_user_group_name("-kkk"));
++        assert_se(!valid_user_group_name("rööt"));
++        assert_se(!valid_user_group_name("."));
++        assert_se(!valid_user_group_name("eff.eff"));
++        assert_se(!valid_user_group_name("foo\nbar"));
++        assert_se(!valid_user_group_name("0123456789012345678901234567890123456789"));
++        assert_se(!valid_user_group_name_or_id("aaa:bbb"));
++
++        assert_se(valid_user_group_name("root"));
++        assert_se(valid_user_group_name("lennart"));
++        assert_se(valid_user_group_name("LENNART"));
++        assert_se(valid_user_group_name("_kkk"));
++        assert_se(valid_user_group_name("kkk-"));
++        assert_se(valid_user_group_name("kk-k"));
++
++        assert_se(valid_user_group_name("some5"));
++        assert_se(!valid_user_group_name("5some"));
++        assert_se(valid_user_group_name("INNER5NUMBER"));
++}
++
++static void test_valid_user_group_name_or_id(void) {
++        assert_se(!valid_user_group_name_or_id(NULL));
++        assert_se(!valid_user_group_name_or_id(""));
++        assert_se(valid_user_group_name_or_id("0"));
++        assert_se(valid_user_group_name_or_id("1"));
++        assert_se(valid_user_group_name_or_id("65534"));
++        assert_se(!valid_user_group_name_or_id("65535"));
++        assert_se(valid_user_group_name_or_id("65536"));
++        assert_se(!valid_user_group_name_or_id("-1"));
++        assert_se(!valid_user_group_name_or_id("-kkk"));
++        assert_se(!valid_user_group_name_or_id("rööt"));
++        assert_se(!valid_user_group_name_or_id("."));
++        assert_se(!valid_user_group_name_or_id("eff.eff"));
++        assert_se(!valid_user_group_name_or_id("foo\nbar"));
++        assert_se(!valid_user_group_name_or_id("0123456789012345678901234567890123456789"));
++        assert_se(!valid_user_group_name_or_id("aaa:bbb"));
++
++        assert_se(valid_user_group_name_or_id("root"));
++        assert_se(valid_user_group_name_or_id("lennart"));
++        assert_se(valid_user_group_name_or_id("LENNART"));
++        assert_se(valid_user_group_name_or_id("_kkk"));
++        assert_se(valid_user_group_name_or_id("kkk-"));
++        assert_se(valid_user_group_name_or_id("kk-k"));
++
++        assert_se(valid_user_group_name_or_id("some5"));
++        assert_se(!valid_user_group_name_or_id("5some"));
++        assert_se(valid_user_group_name_or_id("INNER5NUMBER"));
++}
++
++static void test_valid_gecos(void) {
++
++        assert_se(!valid_gecos(NULL));
++        assert_se(valid_gecos(""));
++        assert_se(valid_gecos("test"));
++        assert_se(valid_gecos("Ümläüt"));
++        assert_se(!valid_gecos("In\nvalid"));
++        assert_se(!valid_gecos("In:valid"));
++}
++
++static void test_valid_home(void) {
++
++        assert_se(!valid_home(NULL));
++        assert_se(!valid_home(""));
++        assert_se(!valid_home("."));
++        assert_se(!valid_home("/home/.."));
++        assert_se(!valid_home("/home/../"));
++        assert_se(!valid_home("/home\n/foo"));
++        assert_se(!valid_home("./piep"));
++        assert_se(!valid_home("piep"));
++        assert_se(!valid_home("/home/user:lennart"));
++
++        assert_se(valid_home("/"));
++        assert_se(valid_home("/home"));
++        assert_se(valid_home("/home/foo"));
++}
++
+ int main(int argc, char*argv[]) {
+ 
+         test_uid_to_name_one(0, "root");
+@@ -75,5 +157,10 @@ int main(int argc, char*argv[]) {
+         test_parse_uid();
+         test_uid_ptr();
+ 
++        test_valid_user_group_name();
++        test_valid_user_group_name_or_id();
++        test_valid_gecos();
++        test_valid_home();
++
+         return 0;
+ }
+-- 
+2.11.0
+
+
+From 1affacaaf6eff93e53563a644567cc5c3930cb28 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Thu, 14 Jul 2016 12:28:06 +0200
+Subject: [PATCH 2/3] core: be stricter when parsing User=/Group= fields
+
+Let's verify the validity of the syntax of the user/group names set.
+---
+ src/core/load-fragment-gperf.gperf.m4 |  10 +--
+ src/core/load-fragment.c              | 118 ++++++++++++++++++++++++++++++++++
+ src/core/load-fragment.h              |   2 +
+ 3 files changed, 125 insertions(+), 5 deletions(-)
+
+diff --git a/src/core/load-fragment-gperf.gperf.m4 b/src/core/load-fragment-gperf.gperf.m4
+index 819341898..110089696 100644
+--- a/src/core/load-fragment-gperf.gperf.m4
++++ b/src/core/load-fragment-gperf.gperf.m4
+@@ -19,9 +19,9 @@ m4_dnl Define the context options only once
+ m4_define(`EXEC_CONTEXT_CONFIG_ITEMS',
+ `$1.WorkingDirectory,            config_parse_working_directory,     0,                             offsetof($1, exec_context)
+ $1.RootDirectory,                config_parse_unit_path_printf,      0,                             offsetof($1, exec_context.root_directory)
+-$1.User,                         config_parse_unit_string_printf,    0,                             offsetof($1, exec_context.user)
+-$1.Group,                        config_parse_unit_string_printf,    0,                             offsetof($1, exec_context.group)
+-$1.SupplementaryGroups,          config_parse_strv,                  0,                             offsetof($1, exec_context.supplementary_groups)
++$1.User,                         config_parse_user_group,            0,                             offsetof($1, exec_context.user)
++$1.Group,                        config_parse_user_group,            0,                             offsetof($1, exec_context.group)
++$1.SupplementaryGroups,          config_parse_user_group_strv,       0,                             offsetof($1, exec_context.supplementary_groups)
+ $1.Nice,                         config_parse_exec_nice,             0,                             offsetof($1, exec_context)
+ $1.OOMScoreAdjust,               config_parse_exec_oom_score_adjust, 0,                             offsetof($1, exec_context)
+ $1.IOSchedulingClass,            config_parse_exec_io_class,         0,                             offsetof($1, exec_context)
+@@ -275,8 +275,8 @@ Socket.ExecStartPost,            config_parse_exec,                  SOCKET_EXEC
+ Socket.ExecStopPre,              config_parse_exec,                  SOCKET_EXEC_STOP_PRE,          offsetof(Socket, exec_command)
+ Socket.ExecStopPost,             config_parse_exec,                  SOCKET_EXEC_STOP_POST,         offsetof(Socket, exec_command)
+ Socket.TimeoutSec,               config_parse_sec,                   0,                             offsetof(Socket, timeout_usec)
+-Socket.SocketUser,               config_parse_unit_string_printf,    0,                             offsetof(Socket, user)
+-Socket.SocketGroup,              config_parse_unit_string_printf,    0,                             offsetof(Socket, group)
++Socket.SocketUser,               config_parse_user_group,            0,                             offsetof(Socket, user)
++Socket.SocketGroup,              config_parse_user_group,            0,                             offsetof(Socket, group)
+ Socket.SocketMode,               config_parse_mode,                  0,                             offsetof(Socket, socket_mode)
+ Socket.DirectoryMode,            config_parse_mode,                  0,                             offsetof(Socket, directory_mode)
+ Socket.Accept,                   config_parse_bool,                  0,                             offsetof(Socket, accept)
+diff --git a/src/core/load-fragment.c b/src/core/load-fragment.c
+index 86b4fb071..f43781803 100644
+--- a/src/core/load-fragment.c
++++ b/src/core/load-fragment.c
+@@ -64,6 +64,7 @@
+ #include "unit-name.h"
+ #include "unit-printf.h"
+ #include "unit.h"
++#include "user-util.h"
+ #include "utf8.h"
+ #include "web-util.h"
+ 
+@@ -1758,6 +1759,123 @@ int config_parse_sec_fix_0(
+         return 0;
+ }
+ 
++int config_parse_user_group(
++                const char *unit,
++                const char *filename,
++                unsigned line,
++                const char *section,
++                unsigned section_line,
++                const char *lvalue,
++                int ltype,
++                const char *rvalue,
++                void *data,
++                void *userdata) {
++
++        char **user = data, *n;
++        Unit *u = userdata;
++        int r;
++
++        assert(filename);
++        assert(lvalue);
++        assert(rvalue);
++        assert(u);
++
++        if (isempty(rvalue))
++                n = NULL;
++        else {
++                _cleanup_free_ char *k = NULL;
++
++                r = unit_full_printf(u, rvalue, &k);
++                if (r < 0) {
++                        log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve unit specifiers in %s, ignoring: %m", rvalue);
++                        return 0;
++                }
++
++                if (!valid_user_group_name_or_id(k)) {
++                        log_syntax(unit, LOG_ERR, filename, line, 0, "Invalid user/group name or numeric ID, ignoring: %s", k);
++                        return 0;
++                }
++
++                n = k;
++                k = NULL;
++        }
++
++        free(*user);
++        *user = n;
++
++        return 0;
++}
++
++int config_parse_user_group_strv(
++                const char *unit,
++                const char *filename,
++                unsigned line,
++                const char *section,
++                unsigned section_line,
++                const char *lvalue,
++                int ltype,
++                const char *rvalue,
++                void *data,
++                void *userdata) {
++
++        char ***users = data;
++        Unit *u = userdata;
++        const char *p;
++        int r;
++
++        assert(filename);
++        assert(lvalue);
++        assert(rvalue);
++        assert(u);
++
++        if (isempty(rvalue)) {
++                char **empty;
++
++                empty = new0(char*, 1);
++                if (!empty)
++                        return log_oom();
++
++                strv_free(*users);
++                *users = empty;
++
++                return 0;
++        }
++
++        p = rvalue;
++        for (;;) {
++                _cleanup_free_ char *word = NULL, *k = NULL;
++
++                r = extract_first_word(&p, &word, WHITESPACE, 0);
++                if (r == 0)
++                        break;
++                if (r == -ENOMEM)
++                        return log_oom();
++                if (r < 0) {
++                        log_syntax(unit, LOG_ERR, filename, line, r, "Invalid syntax, ignoring: %s", rvalue);
++                        break;
++                }
++
++                r = unit_full_printf(u, word, &k);
++                if (r < 0) {
++                        log_syntax(unit, LOG_ERR, filename, line, r, "Failed to resolve unit specifiers in %s, ignoring: %m", word);
++                        continue;
++                }
++
++                if (!valid_user_group_name_or_id(k)) {
++                        log_syntax(unit, LOG_ERR, filename, line, 0, "Invalid user/group name or numeric ID, ignoring: %s", k);
++                        continue;
++                }
++
++                r = strv_push(users, k);
++                if (r < 0)
++                        return log_oom();
++
++                k = NULL;
++        }
++
++        return 0;
++}
++
+ int config_parse_busname_service(
+                 const char *unit,
+                 const char *filename,
+diff --git a/src/core/load-fragment.h b/src/core/load-fragment.h
+index b36a2e3a0..213bce55a 100644
+--- a/src/core/load-fragment.h
++++ b/src/core/load-fragment.h
+@@ -111,6 +111,8 @@ int config_parse_exec_utmp_mode(const char *unit, const char *filename, unsigned
+ int config_parse_working_directory(const char *unit, const char *filename, unsigned line, const char *section, unsigned section_line, const char *lvalue, int ltype, const char *rvalue, void *data, void *userdata);
+ int config_parse_fdname(const char *unit, const char *filename, unsigned line, const char *section, unsigned section_line, const char *lvalue, int ltype, const char *rvalue, void *data, void *userdata);
+ int config_parse_sec_fix_0(const char *unit, const char *filename, unsigned line, const char *section, unsigned section_line, const char *lvalue, int ltype, const char *rvalue, void *data, void *userdata);
++int config_parse_user_group(const char *unit, const char *filename, unsigned line, const char *section, unsigned section_line, const char *lvalue, int ltype, const char *rvalue, void *data, void *userdata);
++int config_parse_user_group_strv(const char *unit, const char *filename, unsigned line, const char *section, unsigned section_line, const char *lvalue, int ltype, const char *rvalue, void *data, void *userdata);
+ 
+ /* gperf prototypes */
+ const struct ConfigPerfItem* load_fragment_gperf_lookup(const char *key, unsigned length);
+-- 
+2.11.0
+
+
+From 97e0456384ed5c930394062d340237ea6130ece0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Thu, 6 Jul 2017 13:28:19 -0400
+Subject: [PATCH 3/3] core/load-fragment: refuse units with errors in certain
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
+ src/core/load-fragment.c  | 101 ++++++++++++++++++++++++++++------------------
+ src/test/test-unit-file.c |  14 +++----
+ 2 files changed, 69 insertions(+), 46 deletions(-)
+
+diff --git a/src/core/load-fragment.c b/src/core/load-fragment.c
+index f43781803..b1fb1d407 100644
+--- a/src/core/load-fragment.c
++++ b/src/core/load-fragment.c
+@@ -626,20 +626,28 @@ int config_parse_exec(
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
+@@ -695,7 +703,7 @@ int config_parse_exec(
+                         if (r == 0)
+                                 break;
+                         else if (r < 0)
+-                                return 0;
++                                return ignore ? 0 : -ENOEXEC;
+ 
+                         if (!GREEDY_REALLOC(n, nbufsize, nlen + 2))
+                                 return log_oom();
+@@ -705,8 +713,10 @@ int config_parse_exec(
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
+@@ -1214,8 +1224,10 @@ int config_parse_exec_selinux_context(
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
+@@ -1262,8 +1274,10 @@ int config_parse_exec_apparmor_profile(
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
+@@ -1310,8 +1324,10 @@ int config_parse_exec_smack_process_label(
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
+@@ -1520,19 +1536,19 @@ int config_parse_socket_service(
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
+@@ -1787,13 +1803,13 @@ int config_parse_user_group(
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
+@@ -1851,19 +1867,19 @@ int config_parse_user_group_strv(
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
+@@ -2022,20 +2038,24 @@ int config_parse_working_directory(
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
+                 free(c->working_directory);
+@@ -4043,8 +4063,11 @@ int unit_load_fragment(Unit *u) {
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
+index ade0ff2a6..fe1969570 100644
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
+
diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index 702e3772642..40f1428340d 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -36,6 +36,7 @@ SRC_URI += " \
            file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
            file://udev-re-enable-mount-propagation-for-udevd.patch \
            file://CVE-2016-7795.patch \
+           file://validate-user.patch \
 "
 SRC_URI_append_libc-uclibc = "\
            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
-- 
2.11.0


