Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCC5C74A5B
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:02 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.85119.1679605497680833124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ynw8xM82;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so3196921pjp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKOYVmXw/JGq3M8N0eZu81tq2tfW52lGlerirc2OMyQ=;
        b=ynw8xM82cWEIPB4z5OFdOP/VtWwY5CbAxzjjMMX9uBvwo2IdAmP29eyCjQiqmmE4Ya
         hNS2oB4nFMDClOzjiqi8UyVJ+Il/zkwRsMm+rsT3x3nS1KTYQqMr4Zvz3ABrklbof2lU
         dU57e5Snbd6NNaux4+w6ltachL94NxeurIAkqG4I4NACkuCMAETRnLUYu8HoGaNYG/Z7
         4tEZi4Z9DNU9hevAkl9RSyL2rq83vsdKUeDVDn1QJAwXKR02NAaE+nI1Tu4ZzVJC2bEY
         pj/iCu0p0BaTskAh+HOYUhiBCCsQSMeufoTaP4wnBNbmPaz1sCSfgTmmLaY+6DQeMWZQ
         Hypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKOYVmXw/JGq3M8N0eZu81tq2tfW52lGlerirc2OMyQ=;
        b=Sx/pHA5rmIKJCo3EJ1Fb8eV3TTiCyW+Z9BVIvYu4el5swLQBvX4wGVPtfNer1I+FfE
         QjsAon6VXLdzBrASE2yv/BGVVS47QvAetf6SFtkdTvXuRIQqwYCB22hbzwQnTPtaSzHT
         nb0cYa3USa1ikMxVh3hcn6E0EO04ERBGuYk1PT0EOWslm5zrLPKfzVWgWHtXTiVnix3X
         RqvEfIZTsZTiC54Xlcwp/ZCYp6bDUs0M/2jqkddPq6P5Sw3gy6xvFy/c9xX/6a9ijoHv
         cfiwniqR6hIHMN1T7MdwLstY4UhDVirGYFeopTQ3BmUeVHNO+mXpC6ki/2f87HMx0Xua
         dy5A==
X-Gm-Message-State: AAQBX9fB22HSYyY+CBjV14hS0c1Hqootges3eQO4Rj7+UFXMmOfRZTvg
	juYAOHsbzYi6Hztwcf5ohUZ59cb60ZhJUTbxSgU=
X-Google-Smtp-Source: AKy350Zq1eKDv2dVQOWvAfFDzMXjN4jJeTi35wBWtxjQvqZOR/MYz0t0Vk/7R9y7jy/gBq2FVRtDYQ==
X-Received: by 2002:a17:90b:1e08:b0:23d:1118:4e98 with SMTP id pg8-20020a17090b1e0800b0023d11184e98mr275421pjb.23.1679605496018;
        Thu, 23 Mar 2023 14:04:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.04.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:04:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/14] systemd: fix CVE-2022-4415
Date: Thu, 23 Mar 2023 11:04:30 -1000
Message-Id: <2e502df0610cd65c7e2897458ee8a25359614f1a.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178996

From: Peter Marko <peter.marko@siemens.com>

Backport from v250-stable branch (v250.9)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/systemd/CVE-2022-4415-1.patch     | 109 +++++
 .../systemd/systemd/CVE-2022-4415-2.patch     | 391 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   2 +
 3 files changed, 502 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-4415-1.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-4415-2.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2022-4415-1.patch b/meta/recipes-core/systemd/systemd/CVE-2022-4415-1.patch
new file mode 100644
index 0000000000..5cf0fe284e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2022-4415-1.patch
@@ -0,0 +1,109 @@
+From 45d323fc889a55fae400a5b08a56273d5724ef4a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 29 Nov 2022 09:00:16 +0100
+Subject: [PATCH 1/2] coredump: adjust whitespace
+
+(cherry picked from commit 510a146634f3e095b34e2a26023b1b1f99dcb8c0)
+(cherry picked from commit cc2eb7a9b5fd6d9dd8ea35fb045ce6e5e16e1187)
+(cherry picked from commit cb044d734c44cd3c05a6e438b5b995b2a9cfa73c)
+
+Preparation to avoid conflicts when applying CVE CVE-2022-4415
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/45d323fc889a55fae400a5b08a56273d5724ef4a]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/coredump/coredump.c | 56 ++++++++++++++++++++---------------------
+ 1 file changed, 28 insertions(+), 28 deletions(-)
+
+diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
+index eaea63f682..8295b03ac7 100644
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -103,16 +103,16 @@ enum {
+ };
+ 
+ static const char * const meta_field_names[_META_MAX] = {
+-        [META_ARGV_PID]          = "COREDUMP_PID=",
+-        [META_ARGV_UID]          = "COREDUMP_UID=",
+-        [META_ARGV_GID]          = "COREDUMP_GID=",
+-        [META_ARGV_SIGNAL]       = "COREDUMP_SIGNAL=",
+-        [META_ARGV_TIMESTAMP]    = "COREDUMP_TIMESTAMP=",
+-        [META_ARGV_RLIMIT]       = "COREDUMP_RLIMIT=",
+-        [META_ARGV_HOSTNAME]     = "COREDUMP_HOSTNAME=",
+-        [META_COMM]              = "COREDUMP_COMM=",
+-        [META_EXE]               = "COREDUMP_EXE=",
+-        [META_UNIT]              = "COREDUMP_UNIT=",
++        [META_ARGV_PID]       = "COREDUMP_PID=",
++        [META_ARGV_UID]       = "COREDUMP_UID=",
++        [META_ARGV_GID]       = "COREDUMP_GID=",
++        [META_ARGV_SIGNAL]    = "COREDUMP_SIGNAL=",
++        [META_ARGV_TIMESTAMP] = "COREDUMP_TIMESTAMP=",
++        [META_ARGV_RLIMIT]    = "COREDUMP_RLIMIT=",
++        [META_ARGV_HOSTNAME]  = "COREDUMP_HOSTNAME=",
++        [META_COMM]           = "COREDUMP_COMM=",
++        [META_EXE]            = "COREDUMP_EXE=",
++        [META_UNIT]           = "COREDUMP_UNIT=",
+ };
+ 
+ typedef struct Context {
+@@ -131,9 +131,9 @@ typedef enum CoredumpStorage {
+ } CoredumpStorage;
+ 
+ static const char* const coredump_storage_table[_COREDUMP_STORAGE_MAX] = {
+-        [COREDUMP_STORAGE_NONE] = "none",
++        [COREDUMP_STORAGE_NONE]     = "none",
+         [COREDUMP_STORAGE_EXTERNAL] = "external",
+-        [COREDUMP_STORAGE_JOURNAL] = "journal",
++        [COREDUMP_STORAGE_JOURNAL]  = "journal",
+ };
+ 
+ DEFINE_PRIVATE_STRING_TABLE_LOOKUP(coredump_storage, CoredumpStorage);
+@@ -149,13 +149,13 @@ static uint64_t arg_max_use = UINT64_MAX;
+ 
+ static int parse_config(void) {
+         static const ConfigTableItem items[] = {
+-                { "Coredump", "Storage",          config_parse_coredump_storage,           0, &arg_storage           },
+-                { "Coredump", "Compress",         config_parse_bool,                       0, &arg_compress          },
+-                { "Coredump", "ProcessSizeMax",   config_parse_iec_uint64,                 0, &arg_process_size_max  },
+-                { "Coredump", "ExternalSizeMax",  config_parse_iec_uint64_infinity,        0, &arg_external_size_max },
+-                { "Coredump", "JournalSizeMax",   config_parse_iec_size,                   0, &arg_journal_size_max  },
+-                { "Coredump", "KeepFree",         config_parse_iec_uint64,                 0, &arg_keep_free         },
+-                { "Coredump", "MaxUse",           config_parse_iec_uint64,                 0, &arg_max_use           },
++                { "Coredump", "Storage",          config_parse_coredump_storage,     0, &arg_storage           },
++                { "Coredump", "Compress",         config_parse_bool,                 0, &arg_compress          },
++                { "Coredump", "ProcessSizeMax",   config_parse_iec_uint64,           0, &arg_process_size_max  },
++                { "Coredump", "ExternalSizeMax",  config_parse_iec_uint64_infinity,  0, &arg_external_size_max },
++                { "Coredump", "JournalSizeMax",   config_parse_iec_size,             0, &arg_journal_size_max  },
++                { "Coredump", "KeepFree",         config_parse_iec_uint64,           0, &arg_keep_free         },
++                { "Coredump", "MaxUse",           config_parse_iec_uint64,           0, &arg_max_use           },
+                 {}
+         };
+ 
+@@ -201,15 +201,15 @@ static int fix_acl(int fd, uid_t uid) {
+ static int fix_xattr(int fd, const Context *context) {
+ 
+         static const char * const xattrs[_META_MAX] = {
+-                [META_ARGV_PID]          = "user.coredump.pid",
+-                [META_ARGV_UID]          = "user.coredump.uid",
+-                [META_ARGV_GID]          = "user.coredump.gid",
+-                [META_ARGV_SIGNAL]       = "user.coredump.signal",
+-                [META_ARGV_TIMESTAMP]    = "user.coredump.timestamp",
+-                [META_ARGV_RLIMIT]       = "user.coredump.rlimit",
+-                [META_ARGV_HOSTNAME]     = "user.coredump.hostname",
+-                [META_COMM]              = "user.coredump.comm",
+-                [META_EXE]               = "user.coredump.exe",
++                [META_ARGV_PID]       = "user.coredump.pid",
++                [META_ARGV_UID]       = "user.coredump.uid",
++                [META_ARGV_GID]       = "user.coredump.gid",
++                [META_ARGV_SIGNAL]    = "user.coredump.signal",
++                [META_ARGV_TIMESTAMP] = "user.coredump.timestamp",
++                [META_ARGV_RLIMIT]    = "user.coredump.rlimit",
++                [META_ARGV_HOSTNAME]  = "user.coredump.hostname",
++                [META_COMM]           = "user.coredump.comm",
++                [META_EXE]            = "user.coredump.exe",
+         };
+ 
+         int r = 0;
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2022-4415-2.patch b/meta/recipes-core/systemd/systemd/CVE-2022-4415-2.patch
new file mode 100644
index 0000000000..8389ee8cd6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2022-4415-2.patch
@@ -0,0 +1,391 @@
+From 1d5e0e9910500f3c3584485f77bfc35e601036e3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Mon, 28 Nov 2022 12:12:55 +0100
+Subject: [PATCH 2/2] coredump: do not allow user to access coredumps with
+ changed uid/gid/capabilities
+
+When the user starts a program which elevates its permissions via setuid,
+setgid, or capabilities set on the file, it may access additional information
+which would then be visible in the coredump. We shouldn't make the the coredump
+visible to the user in such cases.
+
+Reported-by: Matthias Gerstner <mgerstner@suse.de>
+
+This reads the /proc/<pid>/auxv file and attaches it to the process metadata as
+PROC_AUXV. Before the coredump is submitted, it is parsed and if either
+at_secure was set (which the kernel will do for processes that are setuid,
+setgid, or setcap), or if the effective uid/gid don't match uid/gid, the file
+is not made accessible to the user. If we can't access this data, we assume the
+file should not be made accessible either. In principle we could also access
+the auxv data from a note in the core file, but that is much more complex and
+it seems better to use the stand-alone file that is provided by the kernel.
+
+Attaching auxv is both convient for this patch (because this way it's passed
+between the stages along with other fields), but I think it makes sense to save
+it in general.
+
+We use the information early in the core file to figure out if the program was
+32-bit or 64-bit and its endianness. This way we don't need heuristics to guess
+whether the format of the auxv structure. This test might reject some cases on
+fringe architecutes. But the impact would be limited: we just won't grant the
+user permissions to view the coredump file. If people report that we're missing
+some cases, we can always enhance this to support more architectures.
+
+I tested auxv parsing on amd64, 32-bit program on amd64, arm64, arm32, and
+ppc64el, but not the whole coredump handling.
+
+(cherry picked from commit 3e4d0f6cf99f8677edd6a237382a65bfe758de03)
+(cherry picked from commit 9b75a3d0502d6741c8ecb7175794345f8eb3827c)
+(cherry picked from commit efca5283dc791a07171f80eef84e14fdb58fad57)
+
+CVE: CVE-2022-4415
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/1d5e0e9910500f3c3584485f77bfc35e601036e3]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/basic/io-util.h     |   9 ++
+ src/coredump/coredump.c | 196 +++++++++++++++++++++++++++++++++++++---
+ 2 files changed, 192 insertions(+), 13 deletions(-)
+
+diff --git a/src/basic/io-util.h b/src/basic/io-util.h
+index 39728e06bc..3afb134266 100644
+--- a/src/basic/io-util.h
++++ b/src/basic/io-util.h
+@@ -91,7 +91,16 @@ struct iovec_wrapper *iovw_new(void);
+ struct iovec_wrapper *iovw_free(struct iovec_wrapper *iovw);
+ struct iovec_wrapper *iovw_free_free(struct iovec_wrapper *iovw);
+ void iovw_free_contents(struct iovec_wrapper *iovw, bool free_vectors);
++
+ int iovw_put(struct iovec_wrapper *iovw, void *data, size_t len);
++static inline int iovw_consume(struct iovec_wrapper *iovw, void *data, size_t len) {
++        /* Move data into iovw or free on error */
++        int r = iovw_put(iovw, data, len);
++        if (r < 0)
++                free(data);
++        return r;
++}
++
+ int iovw_put_string_field(struct iovec_wrapper *iovw, const char *field, const char *value);
+ int iovw_put_string_field_free(struct iovec_wrapper *iovw, const char *field, char *value);
+ void iovw_rebase(struct iovec_wrapper *iovw, char *old, char *new);
+diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
+index 8295b03ac7..79280ab986 100644
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -4,6 +4,7 @@
+ #include <stdio.h>
+ #include <sys/prctl.h>
+ #include <sys/statvfs.h>
++#include <sys/auxv.h>
+ #include <sys/xattr.h>
+ #include <unistd.h>
+ 
+@@ -99,6 +100,7 @@ enum {
+ 
+         META_EXE = _META_MANDATORY_MAX,
+         META_UNIT,
++        META_PROC_AUXV,
+         _META_MAX
+ };
+ 
+@@ -113,10 +115,12 @@ static const char * const meta_field_names[_META_MAX] = {
+         [META_COMM]           = "COREDUMP_COMM=",
+         [META_EXE]            = "COREDUMP_EXE=",
+         [META_UNIT]           = "COREDUMP_UNIT=",
++        [META_PROC_AUXV]      = "COREDUMP_PROC_AUXV=",
+ };
+ 
+ typedef struct Context {
+         const char *meta[_META_MAX];
++        size_t meta_size[_META_MAX];
+         pid_t pid;
+         bool is_pid1;
+         bool is_journald;
+@@ -178,13 +182,16 @@ static uint64_t storage_size_max(void) {
+         return 0;
+ }
+ 
+-static int fix_acl(int fd, uid_t uid) {
++static int fix_acl(int fd, uid_t uid, bool allow_user) {
++        assert(fd >= 0);
++        assert(uid_is_valid(uid));
+ 
+ #if HAVE_ACL
+         int r;
+ 
+-        assert(fd >= 0);
+-        assert(uid_is_valid(uid));
++        /* We don't allow users to read coredumps if the uid or capabilities were changed. */
++        if (!allow_user)
++                return 0;
+ 
+         if (uid_is_system(uid) || uid_is_dynamic(uid) || uid == UID_NOBODY)
+                 return 0;
+@@ -244,7 +251,8 @@ static int fix_permissions(
+                 const char *filename,
+                 const char *target,
+                 const Context *context,
+-                uid_t uid) {
++                uid_t uid,
++                bool allow_user) {
+ 
+         int r;
+ 
+@@ -254,7 +262,7 @@ static int fix_permissions(
+ 
+         /* Ignore errors on these */
+         (void) fchmod(fd, 0640);
+-        (void) fix_acl(fd, uid);
++        (void) fix_acl(fd, uid, allow_user);
+         (void) fix_xattr(fd, context);
+ 
+         r = fsync_full(fd);
+@@ -324,6 +332,153 @@ static int make_filename(const Context *context, char **ret) {
+         return 0;
+ }
+ 
++static int parse_auxv64(
++                const uint64_t *auxv,
++                size_t size_bytes,
++                int *at_secure,
++                uid_t *uid,
++                uid_t *euid,
++                gid_t *gid,
++                gid_t *egid) {
++
++        assert(auxv || size_bytes == 0);
++
++        if (size_bytes % (2 * sizeof(uint64_t)) != 0)
++                return log_warning_errno(SYNTHETIC_ERRNO(EIO), "Incomplete auxv structure (%zu bytes).", size_bytes);
++
++        size_t words = size_bytes / sizeof(uint64_t);
++
++        /* Note that we set output variables even on error. */
++
++        for (size_t i = 0; i + 1 < words; i += 2)
++                switch (auxv[i]) {
++                case AT_SECURE:
++                        *at_secure = auxv[i + 1] != 0;
++                        break;
++                case AT_UID:
++                        *uid = auxv[i + 1];
++                        break;
++                case AT_EUID:
++                        *euid = auxv[i + 1];
++                        break;
++                case AT_GID:
++                        *gid = auxv[i + 1];
++                        break;
++                case AT_EGID:
++                        *egid = auxv[i + 1];
++                        break;
++                case AT_NULL:
++                        if (auxv[i + 1] != 0)
++                                goto error;
++                        return 0;
++                }
++ error:
++        return log_warning_errno(SYNTHETIC_ERRNO(ENODATA),
++                                 "AT_NULL terminator not found, cannot parse auxv structure.");
++}
++
++static int parse_auxv32(
++                const uint32_t *auxv,
++                size_t size_bytes,
++                int *at_secure,
++                uid_t *uid,
++                uid_t *euid,
++                gid_t *gid,
++                gid_t *egid) {
++
++        assert(auxv || size_bytes == 0);
++
++        size_t words = size_bytes / sizeof(uint32_t);
++
++        if (size_bytes % (2 * sizeof(uint32_t)) != 0)
++                return log_warning_errno(SYNTHETIC_ERRNO(EIO), "Incomplete auxv structure (%zu bytes).", size_bytes);
++
++        /* Note that we set output variables even on error. */
++
++        for (size_t i = 0; i + 1 < words; i += 2)
++                switch (auxv[i]) {
++                case AT_SECURE:
++                        *at_secure = auxv[i + 1] != 0;
++                        break;
++                case AT_UID:
++                        *uid = auxv[i + 1];
++                        break;
++                case AT_EUID:
++                        *euid = auxv[i + 1];
++                        break;
++                case AT_GID:
++                        *gid = auxv[i + 1];
++                        break;
++                case AT_EGID:
++                        *egid = auxv[i + 1];
++                        break;
++                case AT_NULL:
++                        if (auxv[i + 1] != 0)
++                                goto error;
++                        return 0;
++                }
++ error:
++        return log_warning_errno(SYNTHETIC_ERRNO(ENODATA),
++                                 "AT_NULL terminator not found, cannot parse auxv structure.");
++}
++
++static int grant_user_access(int core_fd, const Context *context) {
++        int at_secure = -1;
++        uid_t uid = UID_INVALID, euid = UID_INVALID;
++        uid_t gid = GID_INVALID, egid = GID_INVALID;
++        int r;
++
++        assert(core_fd >= 0);
++        assert(context);
++
++        if (!context->meta[META_PROC_AUXV])
++                return log_warning_errno(SYNTHETIC_ERRNO(ENODATA), "No auxv data, not adjusting permissions.");
++
++        uint8_t elf[EI_NIDENT];
++        errno = 0;
++        if (pread(core_fd, &elf, sizeof(elf), 0) != sizeof(elf))
++                return log_warning_errno(errno_or_else(EIO),
++                                         "Failed to pread from coredump fd: %s", errno != 0 ? strerror_safe(errno) : "Unexpected EOF");
++
++        if (elf[EI_MAG0] != ELFMAG0 ||
++            elf[EI_MAG1] != ELFMAG1 ||
++            elf[EI_MAG2] != ELFMAG2 ||
++            elf[EI_MAG3] != ELFMAG3 ||
++            elf[EI_VERSION] != EV_CURRENT)
++                return log_info_errno(SYNTHETIC_ERRNO(EUCLEAN),
++                                      "Core file does not have ELF header, not adjusting permissions.");
++        if (!IN_SET(elf[EI_CLASS], ELFCLASS32, ELFCLASS64) ||
++            !IN_SET(elf[EI_DATA], ELFDATA2LSB, ELFDATA2MSB))
++                return log_info_errno(SYNTHETIC_ERRNO(EUCLEAN),
++                                      "Core file has strange ELF class, not adjusting permissions.");
++
++        if ((elf[EI_DATA] == ELFDATA2LSB) != (__BYTE_ORDER == __LITTLE_ENDIAN))
++                return log_info_errno(SYNTHETIC_ERRNO(EUCLEAN),
++                                      "Core file has non-native endianness, not adjusting permissions.");
++
++        if (elf[EI_CLASS] == ELFCLASS64)
++                r = parse_auxv64((const uint64_t*) context->meta[META_PROC_AUXV],
++                                 context->meta_size[META_PROC_AUXV],
++                                 &at_secure, &uid, &euid, &gid, &egid);
++        else
++                r = parse_auxv32((const uint32_t*) context->meta[META_PROC_AUXV],
++                                 context->meta_size[META_PROC_AUXV],
++                                 &at_secure, &uid, &euid, &gid, &egid);
++        if (r < 0)
++                return r;
++
++        /* We allow access if we got all the data and at_secure is not set and
++         * the uid/gid matches euid/egid. */
++        bool ret =
++                at_secure == 0 &&
++                uid != UID_INVALID && euid != UID_INVALID && uid == euid &&
++                gid != GID_INVALID && egid != GID_INVALID && gid == egid;
++        log_debug("Will %s access (uid="UID_FMT " euid="UID_FMT " gid="GID_FMT " egid="GID_FMT " at_secure=%s)",
++                  ret ? "permit" : "restrict",
++                  uid, euid, gid, egid, yes_no(at_secure));
++        return ret;
++}
++
+ static int save_external_coredump(
+                 const Context *context,
+                 int input_fd,
+@@ -446,6 +601,8 @@ static int save_external_coredump(
+                                 context->meta[META_ARGV_PID], context->meta[META_COMM]);
+         truncated = r == 1;
+ 
++        bool allow_user = grant_user_access(fd, context) > 0;
++
+ #if HAVE_COMPRESSION
+         if (arg_compress) {
+                 _cleanup_(unlink_and_freep) char *tmp_compressed = NULL;
+@@ -483,7 +640,7 @@ static int save_external_coredump(
+                         uncompressed_size += partial_uncompressed_size;
+                 }
+ 
+-                r = fix_permissions(fd_compressed, tmp_compressed, fn_compressed, context, uid);
++                r = fix_permissions(fd_compressed, tmp_compressed, fn_compressed, context, uid, allow_user);
+                 if (r < 0)
+                         return r;
+ 
+@@ -510,7 +667,7 @@ static int save_external_coredump(
+                            "SIZE_LIMIT=%zu", max_size,
+                            "MESSAGE_ID=" SD_MESSAGE_TRUNCATED_CORE_STR);
+ 
+-        r = fix_permissions(fd, tmp, fn, context, uid);
++        r = fix_permissions(fd, tmp, fn, context, uid, allow_user);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to fix permissions and finalize coredump %s into %s: %m", coredump_tmpfile_name(tmp), fn);
+ 
+@@ -758,7 +915,7 @@ static int change_uid_gid(const Context *context) {
+ }
+ 
+ static int submit_coredump(
+-                Context *context,
++                const Context *context,
+                 struct iovec_wrapper *iovw,
+                 int input_fd) {
+ 
+@@ -919,16 +1076,15 @@ static int save_context(Context *context, const struct iovec_wrapper *iovw) {
+                 struct iovec *iovec = iovw->iovec + n;
+ 
+                 for (size_t i = 0; i < ELEMENTSOF(meta_field_names); i++) {
+-                        char *p;
+-
+                         /* Note that these strings are NUL terminated, because we made sure that a
+                          * trailing NUL byte is in the buffer, though not included in the iov_len
+                          * count (see process_socket() and gather_pid_metadata_*()) */
+                         assert(((char*) iovec->iov_base)[iovec->iov_len] == 0);
+ 
+-                        p = startswith(iovec->iov_base, meta_field_names[i]);
++                        const char *p = startswith(iovec->iov_base, meta_field_names[i]);
+                         if (p) {
+                                 context->meta[i] = p;
++                                context->meta_size[i] = iovec->iov_len - strlen(meta_field_names[i]);
+                                 count++;
+                                 break;
+                         }
+@@ -1170,6 +1326,7 @@ static int gather_pid_metadata(struct iovec_wrapper *iovw, Context *context) {
+         uid_t owner_uid;
+         pid_t pid;
+         char *t;
++        size_t size;
+         const char *p;
+         int r;
+ 
+@@ -1234,13 +1391,26 @@ static int gather_pid_metadata(struct iovec_wrapper *iovw, Context *context) {
+                 (void) iovw_put_string_field_free(iovw, "COREDUMP_PROC_LIMITS=", t);
+ 
+         p = procfs_file_alloca(pid, "cgroup");
+-        if (read_full_virtual_file(p, &t, NULL) >=0)
++        if (read_full_virtual_file(p, &t, NULL) >= 0)
+                 (void) iovw_put_string_field_free(iovw, "COREDUMP_PROC_CGROUP=", t);
+ 
+         p = procfs_file_alloca(pid, "mountinfo");
+-        if (read_full_virtual_file(p, &t, NULL) >=0)
++        if (read_full_virtual_file(p, &t, NULL) >= 0)
+                 (void) iovw_put_string_field_free(iovw, "COREDUMP_PROC_MOUNTINFO=", t);
+ 
++        /* We attach /proc/auxv here. ELF coredumps also contain a note for this (NT_AUXV), see elf(5). */
++        p = procfs_file_alloca(pid, "auxv");
++        if (read_full_virtual_file(p, &t, &size) >= 0) {
++                char *buf = malloc(strlen("COREDUMP_PROC_AUXV=") + size + 1);
++                if (buf) {
++                        /* Add a dummy terminator to make save_context() happy. */
++                        *((uint8_t*) mempcpy(stpcpy(buf, "COREDUMP_PROC_AUXV="), t, size)) = '\0';
++                        (void) iovw_consume(iovw, buf, size + strlen("COREDUMP_PROC_AUXV="));
++                }
++
++                free(t);
++        }
++
+         if (get_process_cwd(pid, &t) >= 0)
+                 (void) iovw_put_string_field_free(iovw, "COREDUMP_CWD=", t);
+ 
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index ef524e0e3d..5405e4b6b3 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -28,6 +28,8 @@ SRC_URI += "file://touchscreen.rules \
            file://CVE-2022-3821.patch \
            file://CVE-2022-45873.patch \
            file://0001-shared-json-allow-json_variant_dump-to-return-an-err.patch \
+           file://CVE-2022-4415-1.patch \
+           file://CVE-2022-4415-2.patch \
            "
 
 # patches needed by musl
-- 
2.34.1


