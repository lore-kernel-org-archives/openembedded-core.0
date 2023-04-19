Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE39C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 10:35:19 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.34190.1681900515023331110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 03:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=m1d89aCj;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: badganchipv@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-517bb11ca34so2660400a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 03:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681900514; x=1684492514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldd11n01HrdKUPm8uhQ6lB3ZyndMpfkdXTiQ8jJWj7A=;
        b=m1d89aCjO9b5f/ppHCD/LWy2BYUszzjuSCbZcZ1G/Wa8iCz/NqnmYZsyRtouUfGtWe
         w2CV37+tNxa2LlexOdf+UCVZ2trH2o52MIyUHNJWUO0SeRSVBlH2KD7exWyf4rfQVdwP
         rK5BiMHe1u9GWrugtyM1B7TfoTaFvZ3ZM8JqBzHuQ5ggaJm19HFVI3A4t0f2pn+sdzpT
         Bcj/akJpBbCdpK0+mRltOTMaYvOtFNAqWfdaynxZnOokIiXPd/hX1iEPrOJJdbDLO2C4
         sikMbzjjbnu4WJUQjnAeQcpULt8AwP2mv9nJ82eJNEQQ4p8PEW/1nW5o1AoHNtfsRqbi
         WgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681900514; x=1684492514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ldd11n01HrdKUPm8uhQ6lB3ZyndMpfkdXTiQ8jJWj7A=;
        b=LaKGRECNexJb13TK6J80WmmKEytNMUq6NiH4HAVMiWQOEnG1/TxPHUwPY1seNOCG8+
         BLdsCx9IvQlRFRvddQtq8aTzuQFjqSRl4zbVq+HeI0Dk/fSVkh0bFHDRzhgp/IzOr19X
         22hmJvLYxb/wiVcJuF+n3371CR05ekLZPpyssH/LmRS0s/2Vw53MxPWWh4OPSyFpPZ+Q
         oZW9Pj59SNyLyr6VZ6mGzzubtcgscHaFcrxQqAfjD1R0XwJLuBd6JPNkjn0zgaGHBn13
         NjaDnLeWMZ7flPu1oLET8A9uvSPsf3c7p02PZ6aeRFmQZwBrpbpWtM8NadG5Pz6VTnvj
         TgLQ==
X-Gm-Message-State: AAQBX9f86XfQzANqMcdqJuAQqzs/iu+e8XW5uJcf1QkIcC5pv32UgsGw
	fFyt/JKfJzdPn78Rgh6rIhsIdmCFmyo=
X-Google-Smtp-Source: AKy350bj0usnrMOPErGNVKbQGiV7r8zvMkAscZunxvF/q/fFl4mKklWjor5lXA1ZoayTi21dbMFYqA==
X-Received: by 2002:a17:90a:a015:b0:247:af63:483 with SMTP id q21-20020a17090aa01500b00247af630483mr2493763pjp.46.1681900513642;
        Wed, 19 Apr 2023 03:35:13 -0700 (PDT)
Received: from L-10146.. ([2405:204:91a7:483b:f45e:a2d0:f437:74f0])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090ae00100b00246cf1a8d3dsm1141855pjy.17.2023.04.19.03.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 03:35:13 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com,
	semc.2042@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	rajmohan r <rajmohan.r@kpit.com>
Subject: [OE-core][dunfell][PATCH] systemd: Fix CVE-2023-26604
Date: Wed, 19 Apr 2023 16:04:55 +0530
Message-Id: <20230419103455.48163-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 10:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180215

From: rajmohan r <rajmohan.r@kpit.com>

Below patch files to fix CVE-2023-26604
CVE-2023-26604-1.patch, CVE-2023-26604-2.patch and
CVE-2023-26604-3.patch and CVE-2023-26604-4.patch

make pager secure when under euid is changed or explicitly
requested

Reference:
CVE-2023-26604-1.patch:
https://github.com/systemd/systemd/pull/17270/commits/612ebf6c913dd0e4197c44909cb3157f5c51a2f0
CVE-2023-26604-2.patch:
https://github.com/systemd/systemd/pull/17270/commits/1b5b507cd2d1d7a2b053151abb548475ad9c5c3b
CVE-2023-26604-3.patch:
https://github.com/systemd/systemd/pull/17270/commits/0a42426d797406b4b01a0d9c13bb759c2629d108
CVE-2023-26604-4.patch:
https://github.com/systemd/systemd/pull/17359/commits/b8f736b30e20a2b44e7c34bb4e43b0d97ae77e3c

Signed-off-by: rajmohan r <rajmohan.r@kpit.com>
---
 .../systemd/systemd/CVE-2023-26604-1.patch    | 115 ++++++++
 .../systemd/systemd/CVE-2023-26604-2.patch    | 264 ++++++++++++++++++
 .../systemd/systemd/CVE-2023-26604-3.patch    | 182 ++++++++++++
 .../systemd/systemd/CVE-2023-26604-4.patch    |  32 +++
 meta/recipes-core/systemd/systemd_244.5.bb    |   4 +
 5 files changed, 597 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-26604-1.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-26604-2.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-26604-3.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-26604-4.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2023-26604-1.patch b/meta/recipes-core/systemd/systemd/CVE-2023-26604-1.patch
new file mode 100644
index 0000000000..39f9480cf8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2023-26604-1.patch
@@ -0,0 +1,115 @@
+From 612ebf6c913dd0e4197c44909cb3157f5c51a2f0 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Mon, 31 Aug 2020 19:37:13 +0200
+Subject: [PATCH] pager: set $LESSSECURE whenver we invoke a pager
+
+Some extra safety when invoked via "sudo". With this we address a
+genuine design flaw of sudo, and we shouldn't need to deal with this.
+But it's still a good idea to disable this surface given how exotic it
+is.
+
+Prompted by #5666
+
+CVE: CVE-2023-26604
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/17270/commits/612ebf6c913dd0e4197c44909cb3157f5c51a2f0]
+Comments: Hunk not refreshed
+Signed-off-by: rajmohan r <rajmohan.r@kpit.com>
+---
+ man/less-variables.xml |  9 +++++++++
+ man/systemctl.xml      |  1 +
+ man/systemd.xml        |  1 +
+ src/shared/pager.c     | 23 +++++++++++++++++++++--
+ 4 files changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/man/less-variables.xml b/man/less-variables.xml
+index 08e513c99f8e..c52511ca8e18 100644
+--- a/man/less-variables.xml
++++ b/man/less-variables.xml
+@@ -64,6 +64,15 @@
+       the invoking terminal is determined to be UTF-8 compatible).</para></listitem>
+     </varlistentry>
+ 
++    <varlistentry id='lesssecure'>
++      <term><varname>$SYSTEMD_LESSSECURE</varname></term>
++
++      <listitem><para>Takes a boolean argument. Overrides the <varname>$LESSSECURE</varname> environment
++      variable when invoking the pager, which controls the "secure" mode of less (which disables commands
++      such as <literal>|</literal> which allow to easily shell out to external command lines). By default
++      less secure mode is enabled, with this setting it may be disabled.</para></listitem>
++    </varlistentry>
++
+     <varlistentry id='colors'>
+       <term><varname>$SYSTEMD_COLORS</varname></term>
+ 
+diff --git a/man/systemctl.xml b/man/systemctl.xml
+index 1c5502883700..a3f0c3041a57 100644
+--- a/man/systemctl.xml
++++ b/man/systemctl.xml
+@@ -2240,6 +2240,7 @@ Jan 12 10:46:45 example.com bluetoothd[8900]: gatt-time-server: Input/output err
+     <xi:include href="less-variables.xml" xpointer="pager"/>
+     <xi:include href="less-variables.xml" xpointer="less"/>
+     <xi:include href="less-variables.xml" xpointer="lesscharset"/>
++    <xi:include href="less-variables.xml" xpointer="lesssecure"/>
+     <xi:include href="less-variables.xml" xpointer="colors"/>
+     <xi:include href="less-variables.xml" xpointer="urlify"/>
+   </refsect1>
+diff --git a/man/systemd.xml b/man/systemd.xml
+index a9040545c2ab..c92cfef77689 100644
+--- a/man/systemd.xml
++++ b/man/systemd.xml
+@@ -692,6 +692,7 @@
+       <xi:include href="less-variables.xml" xpointer="pager"/>
+       <xi:include href="less-variables.xml" xpointer="less"/>
+       <xi:include href="less-variables.xml" xpointer="lesscharset"/>
++      <xi:include href="less-variables.xml" xpointer="lesssecure"/>
+       <xi:include href="less-variables.xml" xpointer="colors"/>
+       <xi:include href="less-variables.xml" xpointer="urlify"/>
+ 
+diff --git a/src/shared/pager.c b/src/shared/pager.c
+index e03be6d23b2d..9c21881241f5 100644
+--- a/src/shared/pager.c
++++ b/src/shared/pager.c
+@@ -9,6 +9,7 @@
+ #include <unistd.h>
+ 
+ #include "copy.h"
++#include "env-util.h"
+ #include "fd-util.h"
+ #include "fileio.h"
+ #include "io-util.h"
+@@ -152,8 +153,7 @@ int pager_open(PagerFlags flags) {
+                         _exit(EXIT_FAILURE);
+                 }
+ 
+-                /* Initialize a good charset for less. This is
+-                 * particularly important if we output UTF-8
++                /* Initialize a good charset for less. This is particularly important if we output UTF-8
+                  * characters. */
+                 less_charset = getenv("SYSTEMD_LESSCHARSET");
+                 if (!less_charset && is_locale_utf8())
+@@ -164,6 +164,25 @@ int pager_open(PagerFlags flags) {
+                         _exit(EXIT_FAILURE);
+                 }
+ 
++                /* People might invoke us from sudo, don't needlessly allow less to be a way to shell out
++                 * privileged stuff. */
++                r = getenv_bool("SYSTEMD_LESSSECURE");
++                if (r == 0) { /* Remove env var if off */
++                        if (unsetenv("LESSSECURE") < 0) {
++                                log_error_errno(errno, "Failed to uset environment variable LESSSECURE: %m");
++                                _exit(EXIT_FAILURE);
++                        }
++                } else {
++                        /* Set env var otherwise */
++                        if (r < 0)
++                                log_warning_errno(r, "Unable to parse $SYSTEMD_LESSSECURE, ignoring: %m");
++
++                        if (setenv("LESSSECURE", "1", 1) < 0) {
++                                log_error_errno(errno, "Failed to set environment variable LESSSECURE: %m");
++                                _exit(EXIT_FAILURE);
++                        }
++                }
++
+                 if (pager_args) {
+                         r = loop_write(exe_name_pipe[1], pager_args[0], strlen(pager_args[0]) + 1, false);
+                         if (r < 0) {
diff --git a/meta/recipes-core/systemd/systemd/CVE-2023-26604-2.patch b/meta/recipes-core/systemd/systemd/CVE-2023-26604-2.patch
new file mode 100644
index 0000000000..95da7cfad6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2023-26604-2.patch
@@ -0,0 +1,264 @@
+From 1b5b507cd2d1d7a2b053151abb548475ad9c5c3b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Mon, 12 Oct 2020 18:57:32 +0200
+Subject: [PATCH] test-login: always test sd_pid_get_owner_uid(), modernize
+
+A long time some function only worked when in a session, and the test
+didn't execute them when sd_pid_get_session() failed. Let's always call
+them to increase coverage.
+
+While at it, let's test for ==0 not >=0 where we don't expect the function
+to return anything except 0 or error.
+
+CVE: CVE-2023-26604
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/17270/commits/1b5b507cd2d1d7a2b053151abb548475ad9c5c3b.patch]
+Comments: Hunk not refreshed
+Signed-off-by: rajmohan r <rajmohan.r@kpit.com>
+---
+ src/libsystemd/sd-login/test-login.c | 131 ++++++++++++++-------------
+ 1 file changed, 70 insertions(+), 61 deletions(-)
+
+diff --git a/src/libsystemd/sd-login/test-login.c b/src/libsystemd/sd-login/test-login.c
+index c0c77e04714b..0494fc77ba18 100644
+--- a/src/libsystemd/sd-login/test-login.c
++++ b/src/libsystemd/sd-login/test-login.c
+@@ -5,21 +5,22 @@
+ #include "sd-login.h"
+ 
+ #include "alloc-util.h"
++#include "errno-list.h"
+ #include "fd-util.h"
+ #include "format-util.h"
+ #include "log.h"
+ #include "string-util.h"
+ #include "strv.h"
+ #include "time-util.h"
+-#include "util.h"
++#include "user-util.h"
+ 
+ static char* format_uids(char **buf, uid_t* uids, int count) {
+-        int pos = 0, k, inc;
++        int pos = 0, inc;
+         size_t size = (DECIMAL_STR_MAX(uid_t) + 1) * count + 1;
+ 
+         assert_se(*buf = malloc(size));
+ 
+-        for (k = 0; k < count; k++) {
++        for (int k = 0; k < count; k++) {
+                 sprintf(*buf + pos, "%s"UID_FMT"%n", k > 0 ? " " : "", uids[k], &inc);
+                 pos += inc;
+         }
+@@ -30,6 +31,10 @@ static char* format_uids(char **buf, uid_t* uids, int count) {
+         return *buf;
+ }
+ 
++static const char *e(int r) {
++        return r == 0 ? "OK" : errno_to_name(r);
++}
++
+ static void test_login(void) {
+         _cleanup_close_pair_ int pair[2] = { -1, -1 };
+         _cleanup_free_ char *pp = NULL, *qq = NULL,
+@@ -39,65 +44,71 @@ static void test_login(void) {
+                 *seat = NULL, *session = NULL,
+                 *unit = NULL, *user_unit = NULL, *slice = NULL;
+         int r;
+-        uid_t u, u2;
+-        char *t, **seats, **sessions;
++        uid_t u, u2 = UID_INVALID;
++        char *t, **seats = NULL, **sessions = NULL;
+ 
+         r = sd_pid_get_unit(0, &unit);
+-        assert_se(r >= 0 || r == -ENODATA);
+-        log_info("sd_pid_get_unit(0, …) → \"%s\"", strna(unit));
++        log_info("sd_pid_get_unit(0, …) → %s / \"%s\"", e(r), strnull(unit));
++        assert_se(IN_SET(r, 0, -ENODATA));
+ 
+         r = sd_pid_get_user_unit(0, &user_unit);
+-        assert_se(r >= 0 || r == -ENODATA);
+-        log_info("sd_pid_get_user_unit(0, …) → \"%s\"", strna(user_unit));
++        log_info("sd_pid_get_user_unit(0, …) → %s / \"%s\"", e(r), strnull(user_unit));
++        assert_se(IN_SET(r, 0, -ENODATA));
+ 
+         r = sd_pid_get_slice(0, &slice);
+-        assert_se(r >= 0 || r == -ENODATA);
+-        log_info("sd_pid_get_slice(0, …) → \"%s\"", strna(slice));
++        log_info("sd_pid_get_slice(0, …) → %s / \"%s\"", e(r), strnull(slice));
++        assert_se(IN_SET(r, 0, -ENODATA));
++
++        r = sd_pid_get_owner_uid(0, &u2);
++        log_info("sd_pid_get_owner_uid(0, …) → %s / "UID_FMT, e(r), u2);
++        assert_se(IN_SET(r, 0, -ENODATA));
+ 
+         r = sd_pid_get_session(0, &session);
+-        if (r < 0) {
+-                log_warning_errno(r, "sd_pid_get_session(0, …): %m");
+-                if (r == -ENODATA)
+-                        log_info("Seems we are not running in a session, skipping some tests.");
+-        } else {
+-                log_info("sd_pid_get_session(0, …) → \"%s\"", session);
+-
+-                assert_se(sd_pid_get_owner_uid(0, &u2) == 0);
+-                log_info("sd_pid_get_owner_uid(0, …) → "UID_FMT, u2);
+-
+-                assert_se(sd_pid_get_cgroup(0, &cgroup) == 0);
+-                log_info("sd_pid_get_cgroup(0, …) → \"%s\"", cgroup);
+-
+-                r = sd_uid_get_display(u2, &display_session);
+-                assert_se(r >= 0 || r == -ENODATA);
+-                log_info("sd_uid_get_display("UID_FMT", …) → \"%s\"",
+-                         u2, strnull(display_session));
+-
+-                assert_se(socketpair(AF_UNIX, SOCK_STREAM, 0, pair) == 0);
+-                sd_peer_get_session(pair[0], &pp);
+-                sd_peer_get_session(pair[1], &qq);
+-                assert_se(streq_ptr(pp, qq));
+-
+-                r = sd_uid_get_sessions(u2, false, &sessions);
++        log_info("sd_pid_get_session(0, …) → %s / \"%s\"", e(r), strnull(session));
++
++        r = sd_pid_get_cgroup(0, &cgroup);
++        log_info("sd_pid_get_cgroup(0, …) → %s / \"%s\"", e(r), strnull(cgroup));
++        assert_se(r == 0);
++
++        r = sd_uid_get_display(u2, &display_session);
++        log_info("sd_uid_get_display("UID_FMT", …) → %s / \"%s\"", u2, e(r), strnull(display_session));
++        if (u2 == UID_INVALID)
++                assert_se(r == -EINVAL);
++        else
++                assert_se(IN_SET(r, 0, -ENODATA));
++
++        assert_se(socketpair(AF_UNIX, SOCK_STREAM, 0, pair) == 0);
++        sd_peer_get_session(pair[0], &pp);
++        sd_peer_get_session(pair[1], &qq);
++        assert_se(streq_ptr(pp, qq));
++
++        r = sd_uid_get_sessions(u2, false, &sessions);
++        assert_se(t = strv_join(sessions, " "));
++        log_info("sd_uid_get_sessions("UID_FMT", …) → %s \"%s\"", u2, e(r), t);
++        if (u2 == UID_INVALID)
++                assert_se(r == -EINVAL);
++        else {
+                 assert_se(r >= 0);
+                 assert_se(r == (int) strv_length(sessions));
+-                assert_se(t = strv_join(sessions, " "));
+-                strv_free(sessions);
+-                log_info("sd_uid_get_sessions("UID_FMT", …) → [%i] \"%s\"", u2, r, t);
+-                free(t);
++        }
++        sessions = strv_free(sessions);
++        free(t);
+ 
+-                assert_se(r == sd_uid_get_sessions(u2, false, NULL));
++        assert_se(r == sd_uid_get_sessions(u2, false, NULL));
+ 
+-                r = sd_uid_get_seats(u2, false, &seats);
++        r = sd_uid_get_seats(u2, false, &seats);
++        assert_se(t = strv_join(seats, " "));
++        log_info("sd_uid_get_seats("UID_FMT", …) → %s \"%s\"", u2, e(r), t);
++        if (u2 == UID_INVALID)
++                assert_se(r == -EINVAL);
++        else {
+                 assert_se(r >= 0);
+                 assert_se(r == (int) strv_length(seats));
+-                assert_se(t = strv_join(seats, " "));
+-                strv_free(seats);
+-                log_info("sd_uid_get_seats("UID_FMT", …) → [%i] \"%s\"", u2, r, t);
+-                free(t);
+-
+-                assert_se(r == sd_uid_get_seats(u2, false, NULL));
+         }
++        seats = strv_free(seats);
++        free(t);
++
++        assert_se(r == sd_uid_get_seats(u2, false, NULL));
+ 
+         if (session) {
+                 r = sd_session_is_active(session);
+@@ -109,7 +120,7 @@ static void test_login(void) {
+                 log_info("sd_session_is_remote(\"%s\") → %s", session, yes_no(r));
+ 
+                 r = sd_session_get_state(session, &state);
+-                assert_se(r >= 0);
++                assert_se(r == 0);
+                 log_info("sd_session_get_state(\"%s\") → \"%s\"", session, state);
+ 
+                 assert_se(sd_session_get_uid(session, &u) >= 0);
+@@ -123,16 +134,16 @@ static void test_login(void) {
+                 log_info("sd_session_get_class(\"%s\") → \"%s\"", session, class);
+ 
+                 r = sd_session_get_display(session, &display);
+-                assert_se(r >= 0 || r == -ENODATA);
++                assert_se(IN_SET(r, 0, -ENODATA));
+                 log_info("sd_session_get_display(\"%s\") → \"%s\"", session, strna(display));
+ 
+                 r = sd_session_get_remote_user(session, &remote_user);
+-                assert_se(r >= 0 || r == -ENODATA);
++                assert_se(IN_SET(r, 0, -ENODATA));
+                 log_info("sd_session_get_remote_user(\"%s\") → \"%s\"",
+                          session, strna(remote_user));
+ 
+                 r = sd_session_get_remote_host(session, &remote_host);
+-                assert_se(r >= 0 || r == -ENODATA);
++                assert_se(IN_SET(r, 0, -ENODATA));
+                 log_info("sd_session_get_remote_host(\"%s\") → \"%s\"",
+                          session, strna(remote_host));
+ 
+@@ -161,7 +172,7 @@ static void test_login(void) {
+                         assert_se(r == -ENODATA);
+                 }
+ 
+-                assert_se(sd_uid_get_state(u, &state2) >= 0);
++                assert_se(sd_uid_get_state(u, &state2) == 0);
+                 log_info("sd_uid_get_state("UID_FMT", …) → %s", u, state2);
+         }
+ 
+@@ -173,11 +184,11 @@ static void test_login(void) {
+                 assert_se(sd_uid_is_on_seat(u, 0, seat) > 0);
+ 
+                 r = sd_seat_get_active(seat, &session2, &u2);
+-                assert_se(r >= 0);
++                assert_se(r == 0);
+                 log_info("sd_seat_get_active(\"%s\", …) → \"%s\", "UID_FMT, seat, session2, u2);
+ 
+                 r = sd_uid_is_on_seat(u, 1, seat);
+-                assert_se(r >= 0);
++                assert_se(IN_SET(r, 0, 1));
+                 assert_se(!!r == streq(session, session2));
+ 
+                 r = sd_seat_get_sessions(seat, &sessions, &uids, &n);
+@@ -185,8 +196,8 @@ static void test_login(void) {
+                 assert_se(r == (int) strv_length(sessions));
+                 assert_se(t = strv_join(sessions, " "));
+                 strv_free(sessions);
+-                log_info("sd_seat_get_sessions(\"%s\", …) → %i, \"%s\", [%i] {%s}",
+-                         seat, r, t, n, format_uids(&buf, uids, n));
++                log_info("sd_seat_get_sessions(\"%s\", …) → %s, \"%s\", [%u] {%s}",
++                         seat, e(r), t, n, format_uids(&buf, uids, n));
+                 free(t);
+ 
+                 assert_se(sd_seat_get_sessions(seat, NULL, NULL, NULL) == r);
+@@ -204,7 +215,7 @@ static void test_login(void) {
+ 
+         r = sd_seat_get_active(NULL, &t, NULL);
+         assert_se(IN_SET(r, 0, -ENODATA));
+-        log_info("sd_seat_get_active(NULL, …) (active session on current seat) → %s", strnull(t));
++        log_info("sd_seat_get_active(NULL, …) (active session on current seat) → %s / \"%s\"", e(r), strnull(t));
+         free(t);
+ 
+         r = sd_get_sessions(&sessions);
+@@ -244,13 +255,11 @@ static void test_login(void) {
+ 
+ static void test_monitor(void) {
+         sd_login_monitor *m = NULL;
+-        unsigned n;
+         int r;
+ 
+-        r = sd_login_monitor_new("session", &m);
+-        assert_se(r >= 0);
++        assert_se(sd_login_monitor_new("session", &m) == 0);
+ 
+-        for (n = 0; n < 5; n++) {
++        for (unsigned n = 0; n < 5; n++) {
+                 struct pollfd pollfd = {};
+                 usec_t timeout, nw;
diff --git a/meta/recipes-core/systemd/systemd/CVE-2023-26604-3.patch b/meta/recipes-core/systemd/systemd/CVE-2023-26604-3.patch
new file mode 100644
index 0000000000..f02f62b772
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2023-26604-3.patch
@@ -0,0 +1,182 @@
+From 0a42426d797406b4b01a0d9c13bb759c2629d108 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Wed, 7 Oct 2020 11:15:05 +0200
+Subject: [PATCH] pager: make pager secure when under euid is changed or
+ explicitly requested
+
+The variable is renamed to SYSTEMD_PAGERSECURE (because it's not just about
+less now), and we automatically enable secure mode in certain cases, but not
+otherwise.
+
+This approach is more nuanced, but should provide a better experience for
+users:
+
+- Previusly we would set LESSSECURE=1 and trust the pager to make use of
+  it. But this has an effect only on less. We need to not start pagers which
+  are insecure when in secure mode. In particular more is like that and is a
+  very popular pager.
+
+- We don't enable secure mode always, which means that those other pagers can
+  reasonably used.
+
+- We do the right thing by default, but the user has ultimate control by
+  setting SYSTEMD_PAGERSECURE.
+
+Fixes #5666.
+
+v2:
+- also check $PKEXEC_UID
+
+v3:
+- use 'sd_pid_get_owner_uid() != geteuid()' as the condition
+
+CVE: CVE-2023-26604
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/17270/commits/0a42426d797406b4b01a0d9c13bb759c2629d108]
+Comments: Hunk refreshed
+Signed-off-by: rajmohan r <rajmohan.r@kpit.com>
+---
+ man/less-variables.xml | 30 +++++++++++++++----
+ src/shared/pager.c     | 63 ++++++++++++++++++++++++++-------------
+ 2 files changed, 66 insertions(+), 27 deletions(-)
+
+diff --git a/man/less-variables.xml b/man/less-variables.xml
+index c52511c..049e9f7 100644
+--- a/man/less-variables.xml
++++ b/man/less-variables.xml
+@@ -65,12 +65,30 @@
+     </varlistentry>
+ 
+     <varlistentry id='lesssecure'>
+-      <term><varname>$SYSTEMD_LESSSECURE</varname></term>
+-
+-      <listitem><para>Takes a boolean argument. Overrides the <varname>$LESSSECURE</varname> environment
+-      variable when invoking the pager, which controls the "secure" mode of less (which disables commands
+-      such as <literal>|</literal> which allow to easily shell out to external command lines). By default
+-      less secure mode is enabled, with this setting it may be disabled.</para></listitem>
++      <term><varname>$SYSTEMD_PAGERSECURE</varname></term>
++
++      <listitem><para>Takes a boolean argument. When true, the "secure" mode of the pager is enabled; if
++      false, disabled. If <varname>$SYSTEMD_PAGERSECURE</varname> is not set at all, secure mode is enabled
++      if the effective UID is not the same as the owner of the login session, see <citerefentry
++      project='man-pages'><refentrytitle>geteuid</refentrytitle><manvolnum>2</manvolnum></citerefentry> and
++      <citerefentry><refentrytitle>sd_pid_get_owner_uid</refentrytitle><manvolnum>3</manvolnum></citerefentry>.
++      In secure mode, <option>LESSSECURE=1</option> will be set when invoking the pager, and the pager shall
++      disable commands that open or create new files or start new subprocesses. When
++      <varname>$SYSTEMD_PAGERSECURE</varname> is not set at all, pagers which are not known to implement
++      secure mode will not be used. (Currently only
++      <citerefentry><refentrytitle>less</refentrytitle><manvolnum>1</manvolnum></citerefentry> implements
++      secure mode.)</para>
++
++      <para>Note: when commands are invoked with elevated privileges, for example under <citerefentry
++      project='man-pages'><refentrytitle>sudo</refentrytitle><manvolnum>8</manvolnum></citerefentry> or
++      <citerefentry
++      project='die-net'><refentrytitle>pkexec</refentrytitle><manvolnum>1</manvolnum></citerefentry>, care
++      must be taken to ensure that unintended interactive features are not enabled. "Secure" mode for the
++      pager may be enabled automatically as describe above. Setting <varname>SYSTEMD_PAGERSECURE=0</varname>
++      or not removing it from the inherited environment allows the user to invoke arbitrary commands. Note
++      that if the <varname>$SYSTEMD_PAGER</varname> or <varname>$PAGER</varname> variables are to be
++      honoured, <varname>$SYSTEMD_PAGERSECURE</varname> must be set too. It might be reasonable to completly
++      disable the pager using <option>--no-pager</option> instead.</para></listitem>
+     </varlistentry>
+ 
+     <varlistentry id='colors'>
+diff --git a/src/shared/pager.c b/src/shared/pager.c
+index a3b6576..a72d9ea 100644
+--- a/src/shared/pager.c
++++ b/src/shared/pager.c
+@@ -8,6 +8,8 @@
+ #include <sys/prctl.h>
+ #include <unistd.h>
+ 
++#include "sd-login.h"
++
+ #include "copy.h"
+ #include "env-util.h"
+ #include "fd-util.h"
+@@ -164,25 +166,42 @@ int pager_open(PagerFlags flags) {
+                 }
+ 
+                 /* People might invoke us from sudo, don't needlessly allow less to be a way to shell out
+-                 * privileged stuff. */
+-                r = getenv_bool("SYSTEMD_LESSSECURE");
+-                if (r == 0) { /* Remove env var if off */
+-                        if (unsetenv("LESSSECURE") < 0) {
+-                                log_error_errno(errno, "Failed to uset environment variable LESSSECURE: %m");
+-                                _exit(EXIT_FAILURE);
+-                        }
+-                } else {
+-                        /* Set env var otherwise */
++                 * privileged stuff. If the user set $SYSTEMD_PAGERSECURE, trust their configuration of the
++                 * pager. If they didn't, use secure mode when under euid is changed. If $SYSTEMD_PAGERSECURE
++                 * wasn't explicitly set, and we autodetect the need for secure mode, only use the pager we
++                 * know to be good. */
++                int use_secure_mode = getenv_bool("SYSTEMD_PAGERSECURE");
++                bool trust_pager = use_secure_mode >= 0;
++                if (use_secure_mode == -ENXIO) {
++                        uid_t uid;
++
++                        r = sd_pid_get_owner_uid(0, &uid);
+                         if (r < 0)
+-                                log_warning_errno(r, "Unable to parse $SYSTEMD_LESSSECURE, ignoring: %m");
++                                log_debug_errno(r, "sd_pid_get_owner_uid() failed, enabling pager secure mode: %m");
+ 
+-                        if (setenv("LESSSECURE", "1", 1) < 0) {
+-                                log_error_errno(errno, "Failed to set environment variable LESSSECURE: %m");
+-                                _exit(EXIT_FAILURE);
+-                        }
++                        use_secure_mode = r < 0 || uid != geteuid();
++
++                } else if (use_secure_mode < 0) {
++                        log_warning_errno(use_secure_mode, "Unable to parse $SYSTEMD_PAGERSECURE, assuming true: %m");
++                        use_secure_mode = true;
+                 }
+ 
+-                if (pager_args) {
++                /* We generally always set variables used by less, even if we end up using a different pager.
++                 * They shouldn't hurt in any case, and ideally other pagers would look at them too. */
++                if (use_secure_mode)
++                        r = setenv("LESSSECURE", "1", 1);
++                else
++                        r = unsetenv("LESSSECURE");
++                if (r < 0) {
++                        log_error_errno(errno, "Failed to adjust environment variable LESSSECURE: %m");
++                        _exit(EXIT_FAILURE);
++                }
++
++                if (trust_pager && pager_args) { /* The pager config might be set globally, and we cannot
++                                                  * know if the user adjusted it to be appropriate for the
++                                                  * secure mode. Thus, start the pager specified through
++                                                  * envvars only when $SYSTEMD_PAGERSECURE was explicitly set
++                                                  * as well. */
+                         r = loop_write(exe_name_pipe[1], pager_args[0], strlen(pager_args[0]) + 1, false);
+                         if (r < 0) {
+                                 log_error_errno(r, "Failed to write pager name to socket: %m");
+@@ -194,13 +213,14 @@ int pager_open(PagerFlags flags) {
+                                        "Failed to execute '%s', using fallback pagers: %m", pager_args[0]);
+                 }
+ 
+-                /* Debian's alternatives command for pagers is
+-                 * called 'pager'. Note that we do not call
+-                 * sensible-pagers here, since that is just a
+-                 * shell script that implements a logic that
+-                 * is similar to this one anyway, but is
+-                 * Debian-specific. */
++                /* Debian's alternatives command for pagers is called 'pager'. Note that we do not call
++                 * sensible-pagers here, since that is just a shell script that implements a logic that is
++                 * similar to this one anyway, but is Debian-specific. */
+                 FOREACH_STRING(exe, "pager", "less", "more") {
++                        /* Only less implements secure mode right now. */
++                        if (use_secure_mode && !streq(exe, "less"))
++                                continue;
++
+                         r = loop_write(exe_name_pipe[1], exe, strlen(exe) + 1, false);
+                         if (r  < 0) {
+                                 log_error_errno(r, "Failed to write pager name to socket: %m");
+@@ -211,6 +231,7 @@ int pager_open(PagerFlags flags) {
+                                        "Failed to execute '%s', using next fallback pager: %m", exe);
+                 }
+ 
++                /* Our builtin is also very secure. */
+                 r = loop_write(exe_name_pipe[1], "(built-in)", strlen("(built-in)") + 1, false);
+                 if (r < 0) {
+                         log_error_errno(r, "Failed to write pager name to socket: %m");
diff --git a/meta/recipes-core/systemd/systemd/CVE-2023-26604-4.patch b/meta/recipes-core/systemd/systemd/CVE-2023-26604-4.patch
new file mode 100644
index 0000000000..bc6b0a91c2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2023-26604-4.patch
@@ -0,0 +1,32 @@
+From b8f736b30e20a2b44e7c34bb4e43b0d97ae77e3c Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Thu, 15 Oct 2020 10:54:48 +0200
+Subject: [PATCH] pager: lets check SYSTEMD_PAGERSECURE with secure_getenv()
+
+I can't think of any real vulnerability about this, but it still feels
+better to check a variable with "secure" in its name with
+secure_getenv() rather than plain getenv().
+
+Paranoia FTW!
+
+CVE: CVE-2023-26604
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/17359/commits/b8f736b30e20a2b44e7c34bb4e43b0d97ae77e3c]
+Comments: Hunk refreshed
+Signed-off-by: rajmohan r <rajmohan.r@kpit.com>
+---
+ src/shared/pager.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/shared/pager.c b/src/shared/pager.c
+index a72d9ea..250519c 100644
+--- a/src/shared/pager.c
++++ b/src/shared/pager.c
+@@ -170,7 +170,7 @@ int pager_open(PagerFlags flags) {
+                  * pager. If they didn't, use secure mode when under euid is changed. If $SYSTEMD_PAGERSECURE
+                  * wasn't explicitly set, and we autodetect the need for secure mode, only use the pager we
+                  * know to be good. */
+-                int use_secure_mode = getenv_bool("SYSTEMD_PAGERSECURE");
++                int use_secure_mode = getenv_bool_secure("SYSTEMD_PAGERSECURE");
+                 bool trust_pager = use_secure_mode >= 0;
+                 if (use_secure_mode == -ENXIO) {
+                         uid_t uid;
diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index 8dd59f7636..bd66d82932 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -35,6 +35,10 @@ SRC_URI += "file://touchscreen.rules \
            file://CVE-2021-3997-2.patch \
            file://CVE-2021-3997-3.patch \
            file://CVE-2022-3821.patch \
+           file://CVE-2023-26604-1.patch \
+           file://CVE-2023-26604-2.patch \
+           file://CVE-2023-26604-3.patch \
+           file://CVE-2023-26604-4.patch \
            "
 
 # patches needed by musl
-- 
2.38.1


