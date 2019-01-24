Return-Path: <marcus.cooper@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D82D57C0D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 12:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 95377185B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:44 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id c-rBfUnap9sz
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:43 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id EBB381859B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:42 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D276F1A07B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:42 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD7641A070
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:42 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:42 +0100 (CET)
Received: from lnxmarcusc.se.axis.com (lnxmarcusc.se.axis.com [10.92.157.1])
	by thoth.se.axis.com (Postfix) with ESMTP id B17CE462
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:42 +0100 (CET)
Received: by lnxmarcusc.se.axis.com (Postfix, from userid 11391)
	id A46B9943E6; Thu, 24 Jan 2019 13:43:42 +0100 (CET)
From: Marcus Cooper <marcus.cooper@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2019 13:43:39 +0100
Message-Id: <20190124124341.26815-1-marcusc@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/3] systemd: Security fix CVE-2018-16864
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
X-List-Received-Date: Thu, 24 Jan 2019 12:43:44 -0000

Affects < v240

Signed-off-by: Marcus Cooper <marcusc@axis.com>
---
 ...-not-store-the-iovec-entry-for-process-co.patch | 204 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |   1 +
 2 files changed, 205 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch

diff --git a/meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch b/meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
new file mode 100644
index 0000000000..c3009545b1
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
@@ -0,0 +1,204 @@
+From fe19f5a9d0d8b9977e9507a9b66c3cc66744cd38 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Wed, 5 Dec 2018 18:38:39 +0100
+Subject: [PATCH] journald: do not store the iovec entry for process
+ commandline on stack
+
+This fixes a crash where we would read the commandline, whose length is under
+control of the sending program, and then crash when trying to create a stack
+allocation for it.
+
+CVE-2018-16864
+https://bugzilla.redhat.com/show_bug.cgi?id=1653855
+
+The message actually doesn't get written to disk, because
+journal_file_append_entry() returns -E2BIG.
+
+Patch backported from systemd master at
+084eeb865ca63887098e0945fb4e93c852b91b0f.
+---
+ src/basic/io-util.c           | 10 ++++++++++
+ src/basic/io-util.h           |  2 ++
+ src/coredump/coredump.c       | 31 +++++++++++--------------------
+ src/journal/journald-server.c | 25 +++++++++++++++----------
+ 4 files changed, 38 insertions(+), 30 deletions(-)
+
+diff --git a/src/basic/io-util.c b/src/basic/io-util.c
+index 1f64cc933b..575398fbe6 100644
+--- a/src/basic/io-util.c
++++ b/src/basic/io-util.c
+@@ -8,6 +8,7 @@
+ #include <unistd.h>
+ 
+ #include "io-util.h"
++#include "string-util.h"
+ #include "time-util.h"
+ 
+ int flush_fd(int fd) {
+@@ -252,3 +253,12 @@ ssize_t sparse_write(int fd, const void *p, size_t sz, size_t run_length) {
+ 
+         return q - (const uint8_t*) p;
+ }
++
++char* set_iovec_string_field(struct iovec *iovec, size_t *n_iovec, const char *field, const char *value) {
++        char *x;
++
++        x = strappend(field, value);
++        if (x)
++                iovec[(*n_iovec)++] = IOVEC_MAKE_STRING(x);
++        return x;
++}
+diff --git a/src/basic/io-util.h b/src/basic/io-util.h
+index ed189b5820..792a64ad5e 100644
+--- a/src/basic/io-util.h
++++ b/src/basic/io-util.h
+@@ -71,3 +71,5 @@ static inline bool FILE_SIZE_VALID_OR_INFINITY(uint64_t l) {
+ #define IOVEC_MAKE(base, len) (struct iovec) IOVEC_INIT(base, len)
+ #define IOVEC_INIT_STRING(string) IOVEC_INIT((char*) string, strlen(string))
+ #define IOVEC_MAKE_STRING(string) (struct iovec) IOVEC_INIT_STRING(string)
++
++char* set_iovec_string_field(struct iovec *iovec, size_t *n_iovec, const char *field, const char *value);
+diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
+index 20a1cbdd45..18e4f61d72 100644
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -1053,19 +1053,10 @@ static int send_iovec(const struct iovec iovec[], size_t n_iovec, int input_fd)
+         return 0;
+ }
+ 
+-static char* set_iovec_field(struct iovec *iovec, size_t *n_iovec, const char *field, const char *value) {
+-        char *x;
+-
+-        x = strappend(field, value);
+-        if (x)
+-                iovec[(*n_iovec)++] = IOVEC_MAKE_STRING(x);
+-        return x;
+-}
+-
+ static char* set_iovec_field_free(struct iovec *iovec, size_t *n_iovec, const char *field, char *value) {
+         char *x;
+ 
+-        x = set_iovec_field(iovec, n_iovec, field, value);
++        x = set_iovec_string_field(iovec, n_iovec, field, value);
+         free(value);
+         return x;
+ }
+@@ -1115,36 +1106,36 @@ static int gather_pid_metadata(
+                         disable_coredumps();
+                 }
+ 
+-                set_iovec_field(iovec, n_iovec, "COREDUMP_UNIT=", context[CONTEXT_UNIT]);
++                set_iovec_string_field(iovec, n_iovec, "COREDUMP_UNIT=", context[CONTEXT_UNIT]);
+         }
+ 
+         if (cg_pid_get_user_unit(pid, &t) >= 0)
+                 set_iovec_field_free(iovec, n_iovec, "COREDUMP_USER_UNIT=", t);
+ 
+         /* The next few are mandatory */
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_PID=", context[CONTEXT_PID]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_PID=", context[CONTEXT_PID]))
+                 return log_oom();
+ 
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_UID=", context[CONTEXT_UID]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_UID=", context[CONTEXT_UID]))
+                 return log_oom();
+ 
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_GID=", context[CONTEXT_GID]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_GID=", context[CONTEXT_GID]))
+                 return log_oom();
+ 
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_SIGNAL=", context[CONTEXT_SIGNAL]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_SIGNAL=", context[CONTEXT_SIGNAL]))
+                 return log_oom();
+ 
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_RLIMIT=", context[CONTEXT_RLIMIT]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_RLIMIT=", context[CONTEXT_RLIMIT]))
+                 return log_oom();
+ 
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_HOSTNAME=", context[CONTEXT_HOSTNAME]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_HOSTNAME=", context[CONTEXT_HOSTNAME]))
+                 return log_oom();
+ 
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_COMM=", context[CONTEXT_COMM]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_COMM=", context[CONTEXT_COMM]))
+                 return log_oom();
+ 
+         if (context[CONTEXT_EXE] &&
+-            !set_iovec_field(iovec, n_iovec, "COREDUMP_EXE=", context[CONTEXT_EXE]))
++            !set_iovec_string_field(iovec, n_iovec, "COREDUMP_EXE=", context[CONTEXT_EXE]))
+                 return log_oom();
+ 
+         if (sd_pid_get_session(pid, &t) >= 0)
+@@ -1212,7 +1203,7 @@ static int gather_pid_metadata(
+                 iovec[(*n_iovec)++] = IOVEC_MAKE_STRING(t);
+ 
+         if (safe_atoi(context[CONTEXT_SIGNAL], &signo) >= 0 && SIGNAL_VALID(signo))
+-                set_iovec_field(iovec, n_iovec, "COREDUMP_SIGNAL_NAME=SIG", signal_to_string(signo));
++                set_iovec_string_field(iovec, n_iovec, "COREDUMP_SIGNAL_NAME=SIG", signal_to_string(signo));
+ 
+         return 0; /* we successfully acquired all metadata */
+ }
+diff --git a/src/journal/journald-server.c b/src/journal/journald-server.c
+index 4f1550ec5b..31be085c6b 100644
+--- a/src/journal/journald-server.c
++++ b/src/journal/journald-server.c
+@@ -753,6 +753,7 @@ static void dispatch_message_real(
+                 pid_t object_pid) {
+ 
+         char source_time[sizeof("_SOURCE_REALTIME_TIMESTAMP=") + DECIMAL_STR_MAX(usec_t)];
++        _cleanup_free_ char *cmdline1 = NULL, *cmdline2 = NULL;
+         uid_t journal_uid;
+         ClientContext *o;
+ 
+@@ -769,20 +770,23 @@ static void dispatch_message_real(
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->uid, uid_t, uid_is_valid, UID_FMT, "_UID");
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->gid, gid_t, gid_is_valid, GID_FMT, "_GID");
+ 
+-                IOVEC_ADD_STRING_FIELD(iovec, n, c->comm, "_COMM");
+-                IOVEC_ADD_STRING_FIELD(iovec, n, c->exe, "_EXE");
+-                IOVEC_ADD_STRING_FIELD(iovec, n, c->cmdline, "_CMDLINE");
+-                IOVEC_ADD_STRING_FIELD(iovec, n, c->capeff, "_CAP_EFFECTIVE");
++                IOVEC_ADD_STRING_FIELD(iovec, n, c->comm, "_COMM"); /* At most TASK_COMM_LENGTH (16 bytes) */
++                IOVEC_ADD_STRING_FIELD(iovec, n, c->exe, "_EXE"); /* A path, so at most PATH_MAX (4096 bytes) */
+ 
+-                IOVEC_ADD_SIZED_FIELD(iovec, n, c->label, c->label_size, "_SELINUX_CONTEXT");
++                if (c->cmdline)
++                        /* At most _SC_ARG_MAX (2MB usually), which is too much to put on stack.
++                         * Let's use a heap allocation for this one. */
++                        cmdline1 = set_iovec_string_field(iovec, &n, "_CMDLINE=", c->cmdline);
+ 
++                IOVEC_ADD_STRING_FIELD(iovec, n, c->capeff, "_CAP_EFFECTIVE"); /* Read from /proc/.../status */
++                IOVEC_ADD_SIZED_FIELD(iovec, n, c->label, c->label_size, "_SELINUX_CONTEXT");
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->auditid, uint32_t, audit_session_is_valid, "%" PRIu32, "_AUDIT_SESSION");
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->loginuid, uid_t, uid_is_valid, UID_FMT, "_AUDIT_LOGINUID");
+ 
+-                IOVEC_ADD_STRING_FIELD(iovec, n, c->cgroup, "_SYSTEMD_CGROUP");
++                IOVEC_ADD_STRING_FIELD(iovec, n, c->cgroup, "_SYSTEMD_CGROUP"); /* A path */
+                 IOVEC_ADD_STRING_FIELD(iovec, n, c->session, "_SYSTEMD_SESSION");
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->owner_uid, uid_t, uid_is_valid, UID_FMT, "_SYSTEMD_OWNER_UID");
+-                IOVEC_ADD_STRING_FIELD(iovec, n, c->unit, "_SYSTEMD_UNIT");
++                IOVEC_ADD_STRING_FIELD(iovec, n, c->unit, "_SYSTEMD_UNIT"); /* Unit names are bounded by UNIT_NAME_MAX */
+                 IOVEC_ADD_STRING_FIELD(iovec, n, c->user_unit, "_SYSTEMD_USER_UNIT");
+                 IOVEC_ADD_STRING_FIELD(iovec, n, c->slice, "_SYSTEMD_SLICE");
+                 IOVEC_ADD_STRING_FIELD(iovec, n, c->user_slice, "_SYSTEMD_USER_SLICE");
+@@ -803,13 +807,14 @@ static void dispatch_message_real(
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->uid, uid_t, uid_is_valid, UID_FMT, "OBJECT_UID");
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->gid, gid_t, gid_is_valid, GID_FMT, "OBJECT_GID");
+ 
++                /* See above for size limits, only ->cmdline may be large, so use a heap allocation for it. */
+                 IOVEC_ADD_STRING_FIELD(iovec, n, o->comm, "OBJECT_COMM");
+                 IOVEC_ADD_STRING_FIELD(iovec, n, o->exe, "OBJECT_EXE");
+-                IOVEC_ADD_STRING_FIELD(iovec, n, o->cmdline, "OBJECT_CMDLINE");
+-                IOVEC_ADD_STRING_FIELD(iovec, n, o->capeff, "OBJECT_CAP_EFFECTIVE");
++                if (o->cmdline)
++                        cmdline2 = set_iovec_string_field(iovec, &n, "OBJECT_CMDLINE=", o->cmdline);
+ 
++                IOVEC_ADD_STRING_FIELD(iovec, n, o->capeff, "OBJECT_CAP_EFFECTIVE");
+                 IOVEC_ADD_SIZED_FIELD(iovec, n, o->label, o->label_size, "OBJECT_SELINUX_CONTEXT");
+-
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->auditid, uint32_t, audit_session_is_valid, "%" PRIu32, "OBJECT_AUDIT_SESSION");
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->loginuid, uid_t, uid_is_valid, UID_FMT, "OBJECT_AUDIT_LOGINUID");
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index c146897508..94729a6a39 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -38,6 +38,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch \
            file://0002-core-Fix-use-after-free-case-in-load_from_path.patch \
            file://0001-meson-rename-Ddebug-to-Ddebug-extra.patch \
+           file://0024-journald-do-not-store-the-iovec-entry-for-process-co.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
2.11.0


