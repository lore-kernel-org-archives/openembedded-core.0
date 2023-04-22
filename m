Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C60C77B76
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:58:19 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.10372.1682179096790113273
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ulMTmhMy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1a50cb65c92so26684705ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682179096; x=1684771096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txU+LwmnP4XS0zKNBO+V4ulUoStpBrzGNVArd7M5mik=;
        b=ulMTmhMysMYI4rs61cDaVAPecw5c88mWoNzManZ1PnJ7w065iX4579IZAyR0nuPx1T
         HI2zYDVEveG/aJyn/4fAlWA7l7VUrU7JH7jmRMaIcRz+UX7Vh+qFOOWFnbjSxGElbIEr
         SGJ4GU49z5YpLzkTXGLHeXndu75ux7LmjN2ay8KEyoQY5dn8FJZAKbGn593GeX0BMCjy
         qhOOw/C12uDjhE/lD7USMY9+tOBAjZ03YWVGgth13EQqe+kx2Uwqh3ti2wCweWTibwqk
         gW/sjr3wQ6QdjC2I5+F5Jguvn3D7qcUVvHxDOGlSR2NV2GN504umz+5fZy83CXEzfzpz
         a9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179096; x=1684771096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txU+LwmnP4XS0zKNBO+V4ulUoStpBrzGNVArd7M5mik=;
        b=l74FZJ+xw/amdlVhJDhw43YyTqzRfuR/i/EkxrYHYvzTHq/w+f5yhCQYNaWra6xeRF
         urtF0D7SEFHbNl3u61JSJaqvSAra0N0CgBxquP+uGlX+tqEq9tLIOoZQ9stRtZhcg1LF
         LhMlojO3MaUFDT4Qn7ksTQifwawWdrReVdFxob5cJTzHXvzI0WvYPypDfKmKy+mRvmTJ
         orYcpy7CBUYrrjhZY3Th8wc99G+PTuoq500uFQ+6CIAj5ACbz/PcjePJdMnPui2N2gay
         fM+iNhHdPVeNugru8nKwTCGPBLoo6AOaKL/1TjntBbpVh1IMrDKusNXKS0cXYw2gG1xs
         PvoQ==
X-Gm-Message-State: AAQBX9dBVVMAwr7sdQadC48757Au9jl2icdmu8U6a1ED83CeYJmR2F/R
	TjcRmZT55E6la/YfTrbegn2+7AseA28feQCi/jc=
X-Google-Smtp-Source: AKy350ZjUrp9eYzng8XsulsK2uMtxkhQVEYFiak2TG5GAbKdaO3rxAW8ajiFHgmlLo2qnOkMf2nW+w==
X-Received: by 2002:a17:902:704a:b0:1a6:dd9a:62c5 with SMTP id h10-20020a170902704a00b001a6dd9a62c5mr7316260plt.10.1682179095302;
        Sat, 22 Apr 2023 08:58:15 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709028c8d00b001a4fe00a8d4sm4189412plo.90.2023.04.22.08.58.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:58:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] systemd: Fix CVE-2023-26604
Date: Sat, 22 Apr 2023 05:58:00 -1000
Message-Id: <7880eb801dcee44a9e8920d249057492d1de6b12.1682178944.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178944.git.steve@sakoman.com>
References: <cover.1682178944.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180314

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


