Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42222C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 03:33:06 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.6882.1690947180028962908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 20:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ibRyrY3K;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bbf3da0ea9so28906365ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 20:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690947179; x=1691551979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tTLIorsOCeG406aH2recV1a7a+Q80YKMNcS7vMMdRvA=;
        b=ibRyrY3KO/Ndxp3+uiJS2TNSfVuKEjYGw5k3ZJeF/l2ijWjY31yJ7wgjkj+1xbu/oz
         WiM5EE12cMdtsmT8RrJ/kqYwatPKSUP3JxxCk72axo7xc5+Ur2+2e3/VF1Hw2BX5GkLn
         IfzwAS2ybcLVnzTLHaAs5p7TZPQkkRIHjY3dWEdimVULOS8ARlWX+PCWGbqp7eMTU2uk
         bEigd5CBquzMwf8+5hExTVwm56r+PIf2lwjSPypcZPhXRYpvMnA2WL0H3H0CJDZt8TJW
         SwPeRq7E74OBR38lr12ruWJYwLCkAfvhvCtazCdciTKfqXEHuzib5SYNHL2dv5jUbpO+
         94jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690947179; x=1691551979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tTLIorsOCeG406aH2recV1a7a+Q80YKMNcS7vMMdRvA=;
        b=E5UUKQzJ+1+jq5hwcnZuRcLGtfFBBMqwjD8eFj/RpCRc8W77ljhrDEBgv8krSfXO3I
         8tbeUgguusMNUYpsUT6tsISAnwC2fQuYu3yoGk8OmRyUjlrzRkgxoDDjm1WZs8wUWPX/
         zJywY7z6+yTtwbtwiXACT9zavnr6kNITJHrUhMMwKFxelc51/kBfhOXYgKl0b+aeLKcV
         teDW9l9zXfDD5j9wjGWaRjKyWfNEjAaiZ8YLDd/0uWMStmvTAxN7Oy5pJkRqRlxaiXyH
         HZMRUG/z2Ky/7Gete0637iv58eOchdzN7p3Dsul75/Ii9yzhCh2jLngrcyGxlxU2bb5T
         sdDg==
X-Gm-Message-State: ABy/qLYtE0fzXCmlqepGvRmkY2Q5DG2L1ZjmUGoYGyDDFUkSNbj8c1v2
	CSlmtP0D4goNtXU5Jf0L3BIb5JrNgvcrIQ==
X-Google-Smtp-Source: APBJJlFu1RE4Wg/i59/CuEI/i6u2b0pcCLTLV043vHEYJ7SOYFU13pjGETmbKFnHMU/PwTQSF4db1g==
X-Received: by 2002:a17:902:e803:b0:1b7:e9e9:1004 with SMTP id u3-20020a170902e80300b001b7e9e91004mr14477008plg.30.1690947178783;
        Tue, 01 Aug 2023 20:32:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902eb4500b001ae0a4b1d3fsm11177343pli.153.2023.08.01.20.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 20:32:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Fix build on musl
Date: Tue,  1 Aug 2023 20:32:55 -0700
Message-ID: <20230802033255.3255676-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 03:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185370

Latest upgrade of systemd needs some refreshing of musl patches and drop
0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch since its
already fixed upstream [1]

[1] https://github.com/systemd/systemd-stable/commit/86206af0bf1d6b093967693c8b7610a00e733707

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...missing.h-check-for-missing-strndupa.patch | 117 ++----------------
 ...sable-tests-for-missing-typedefs-in-.patch |  41 ------
 ...-not-disable-buffer-in-writing-files.patch | 101 +++++----------
 meta/recipes-core/systemd/systemd_253.7.bb    |   1 -
 4 files changed, 36 insertions(+), 224 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch

diff --git a/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch
index bd5f6a6190c..1d538dc16da 100644
--- a/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -70,11 +70,9 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/udev/udev-rules.c                      |  1 +
  50 files changed, 61 insertions(+)
 
-diff --git a/meson.build b/meson.build
-index fb96143c37..739b2f7f72 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -574,6 +574,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
+@@ -576,6 +576,7 @@ foreach ident : ['secure_getenv', '__sec
  endforeach
  
  foreach ident : [
@@ -82,8 +80,6 @@ index fb96143c37..739b2f7f72 100644
          ['memfd_create',      '''#include <sys/mman.h>'''],
          ['gettid',            '''#include <sys/types.h>
                                   #include <unistd.h>'''],
-diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index e66477f328..2613d1e3f9 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -19,6 +19,7 @@
@@ -94,11 +90,9 @@ index e66477f328..2613d1e3f9 100644
  
  #define PCI_CLASS_GRAPHICS_CARD 0x30000
  
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index feda596939..11b4375ed5 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -37,6 +37,7 @@
+@@ -38,6 +38,7 @@
  #include "unit-name.h"
  #include "user-util.h"
  #include "xattr-util.h"
@@ -106,8 +100,6 @@ index feda596939..11b4375ed5 100644
  
  static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
          _cleanup_free_ char *fs = NULL;
-diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index 55ac11a512..7ccb1d7887 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -19,6 +19,7 @@
@@ -118,11 +110,9 @@ index 55ac11a512..7ccb1d7887 100644
  
  /* We follow bash for the character set. Different shells have different rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
-diff --git a/src/basic/log.c b/src/basic/log.c
-index fc5793139e..515218fca8 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
-@@ -39,6 +39,7 @@
+@@ -40,6 +40,7 @@
  #include "terminal-util.h"
  #include "time-util.h"
  #include "utf8.h"
@@ -130,8 +120,6 @@ index fc5793139e..515218fca8 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  #define IOVEC_MAX 128U
-diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
-index 8c76f93eb2..9068bfb4f0 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -150,8 +138,6 @@ index 8c76f93eb2..9068bfb4f0 100644
 +    (char *)memcpy(__new, __old, __len); \
 +  })
 +#endif
-diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index 7ad19ee33b..cc1d5e1e5b 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -15,6 +15,7 @@
@@ -162,8 +148,6 @@ index 7ad19ee33b..cc1d5e1e5b 100644
  
  int mkdirat_safe_internal(
                  int dir_fd,
-diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
-index bc74fbef8f..cdb609bb84 100644
 --- a/src/basic/mountpoint-util.c
 +++ b/src/basic/mountpoint-util.c
 @@ -13,6 +13,7 @@
@@ -174,8 +158,6 @@ index bc74fbef8f..cdb609bb84 100644
  #include "mountpoint-util.h"
  #include "nulstr-util.h"
  #include "parse-util.h"
-diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index 3445d31307..d82b4415d9 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
 @@ -18,6 +18,7 @@
@@ -186,8 +168,6 @@ index 3445d31307..d82b4415d9 100644
  
  int parse_boolean(const char *v) {
          if (!v)
-diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
-index c99e9d8786..71a917a0b0 100644
 --- a/src/basic/path-lookup.c
 +++ b/src/basic/path-lookup.c
 @@ -16,6 +16,7 @@
@@ -198,8 +178,6 @@ index c99e9d8786..71a917a0b0 100644
  
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
-diff --git a/src/basic/percent-util.c b/src/basic/percent-util.c
-index cab9d0eaea..5f6ca258e9 100644
 --- a/src/basic/percent-util.c
 +++ b/src/basic/percent-util.c
 @@ -3,6 +3,7 @@
@@ -210,8 +188,6 @@ index cab9d0eaea..5f6ca258e9 100644
  
  static int parse_parts_value_whole(const char *p, const char *symbol) {
          const char *pc, *n;
-diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
-index eea70d8606..ae3abd8402 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -222,8 +198,6 @@ index eea70d8606..ae3abd8402 100644
  
  int proc_cmdline(char **ret) {
          const char *e;
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index bcba5a5208..64a95dd866 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -12,6 +12,7 @@
@@ -234,11 +208,9 @@ index bcba5a5208..64a95dd866 100644
  
  int procfs_get_pid_max(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
-diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index b700f364ef..48a26bcec9 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
-@@ -26,6 +26,7 @@
+@@ -27,6 +27,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "time-util.h"
@@ -246,8 +218,6 @@ index b700f364ef..48a26bcec9 100644
  
  static clockid_t map_clock_id(clockid_t c) {
  
-diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
-index 59f02b761a..7496646350 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -22,6 +22,7 @@
@@ -258,8 +228,6 @@ index 59f02b761a..7496646350 100644
  
  static char **arg_path = NULL;
  
-diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index b5484eda78..54ed62c790 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
 @@ -21,6 +21,7 @@
@@ -270,8 +238,6 @@ index b5484eda78..54ed62c790 100644
  #include "socket-util.h"
  
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
-diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index f514b8fd12..4febd0d496 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -45,6 +45,7 @@
@@ -282,8 +248,6 @@ index f514b8fd12..4febd0d496 100644
  
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
-diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
-index edfa0eb69a..6fd2ec9062 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -9,6 +9,7 @@
@@ -294,8 +258,6 @@ index edfa0eb69a..6fd2ec9062 100644
  
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
-diff --git a/src/core/execute.c b/src/core/execute.c
-index 853e87450f..8ef76de9ab 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
 @@ -105,6 +105,7 @@
@@ -306,20 +268,16 @@ index 853e87450f..8ef76de9ab 100644
  
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
-diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index e843743777..e149807492 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
-@@ -12,6 +12,7 @@
- #include "recurse-dir.h"
+@@ -13,6 +13,7 @@
  #include "string-util.h"
+ #include "strv.h"
  #include "virt.h"
 +#include "missing_stdlib.h"
  
  #if HAVE_KMOD
  #include "module-util.h"
-diff --git a/src/core/service.c b/src/core/service.c
-index 9ad3c3d995..b112d64919 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -42,6 +42,7 @@
@@ -330,8 +288,6 @@ index 9ad3c3d995..b112d64919 100644
  
  #define service_spawn(...) service_spawn_internal(__func__, __VA_ARGS__)
  
-diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
-index c6e201ecf2..ab034475e2 100644
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
 @@ -17,6 +17,7 @@
@@ -342,8 +298,6 @@ index c6e201ecf2..ab034475e2 100644
  
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
-diff --git a/src/fstab-generator/fstab-generator.c b/src/fstab-generator/fstab-generator.c
-index efc553b698..acea922311 100644
 --- a/src/fstab-generator/fstab-generator.c
 +++ b/src/fstab-generator/fstab-generator.c
 @@ -33,6 +33,7 @@
@@ -354,8 +308,6 @@ index efc553b698..acea922311 100644
  
  typedef enum MountPointFlags {
          MOUNT_NOAUTO    = 1 << 0,
-diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index 7df264fb53..9463a0e9fb 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
 @@ -25,6 +25,7 @@
@@ -366,8 +318,6 @@ index 7df264fb53..9463a0e9fb 100644
  
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
-diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index da0fac548e..c1c043e0e0 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -72,6 +72,7 @@
@@ -378,8 +328,6 @@ index da0fac548e..c1c043e0e0 100644
  
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
-diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
-index 9719f97c02..75decd9834 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -19,6 +19,7 @@
@@ -390,8 +338,6 @@ index 9719f97c02..75decd9834 100644
  
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  static int message_parse_fields(sd_bus_message *m);
-diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index 2ad7a9993d..bba72f99f4 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -11,6 +11,7 @@
@@ -402,8 +348,6 @@ index 2ad7a9993d..bba72f99f4 100644
  
  static int node_vtable_get_userdata(
                  sd_bus *bus,
-diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
-index 64037e4fe0..9b9ce0aaa9 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
 @@ -27,6 +27,7 @@
@@ -414,11 +358,9 @@ index 64037e4fe0..9b9ce0aaa9 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
-diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index f6a5e4aa06..b36faa79a3 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
-@@ -44,6 +44,7 @@
+@@ -45,6 +45,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "user-util.h"
@@ -426,8 +368,6 @@ index f6a5e4aa06..b36faa79a3 100644
  
  #define log_debug_bus_message(m)                                         \
          do {                                                             \
-diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
-index 1eb6edd329..d434a3c178 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -13,6 +13,7 @@
@@ -438,8 +378,6 @@ index 1eb6edd329..d434a3c178 100644
  
  #define MAX_SIZE (2*1024*1024)
  
-diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
-index 9947947ef2..8dc6f93159 100644
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
 @@ -41,6 +41,7 @@
@@ -450,8 +388,6 @@ index 9947947ef2..8dc6f93159 100644
  
  #define JOURNAL_FILES_RECHECK_USEC (2 * USEC_PER_SEC)
  
-diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
-index ba2fca32c6..e1f9caa13b 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
 @@ -32,6 +32,7 @@
@@ -462,8 +398,6 @@ index ba2fca32c6..e1f9caa13b 100644
  #include "pam-util.h"
  #include "parse-util.h"
  #include "path-util.h"
-diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
-index 1090934bfc..69a77f66e2 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -13,6 +13,7 @@
@@ -474,8 +408,6 @@ index 1090934bfc..69a77f66e2 100644
  
  /*
    # .network
-diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index 05bde1c756..aa29587868 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -16,6 +16,7 @@
@@ -486,8 +418,6 @@ index 05bde1c756..aa29587868 100644
  
  Settings *settings_new(void) {
          Settings *s;
-diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
-index c64e79bdff..eda26b0b9a 100644
 --- a/src/nss-mymachines/nss-mymachines.c
 +++ b/src/nss-mymachines/nss-mymachines.c
 @@ -21,6 +21,7 @@
@@ -498,8 +428,6 @@ index c64e79bdff..eda26b0b9a 100644
  
  static void setup_logging_once(void) {
          static pthread_once_t once = PTHREAD_ONCE_INIT;
-diff --git a/src/portable/portable.c b/src/portable/portable.c
-index 7811833fac..c6414da91c 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
 @@ -39,6 +39,7 @@
@@ -510,8 +438,6 @@ index 7811833fac..c6414da91c 100644
  
  /* Markers used in the first line of our 20-portable.conf unit file drop-in to determine, that a) the unit file was
   * dropped there by the portable service logic and b) for which image it was dropped there. */
-diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
-index 2638e985fb..82c903fd66 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
 @@ -48,6 +48,7 @@
@@ -522,8 +448,6 @@ index 2638e985fb..82c903fd66 100644
  
  static int arg_family = AF_UNSPEC;
  static int arg_ifindex = 0;
-diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
-index 8b4f66b22e..5926e4c61b 100644
 --- a/src/shared/bus-get-properties.c
 +++ b/src/shared/bus-get-properties.c
 @@ -4,6 +4,7 @@
@@ -534,8 +458,6 @@ index 8b4f66b22e..5926e4c61b 100644
  
  int bus_property_get_bool(
                  sd_bus *bus,
-diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
-index 8b462b5627..183ce1c18e 100644
 --- a/src/shared/bus-unit-procs.c
 +++ b/src/shared/bus-unit-procs.c
 @@ -11,6 +11,7 @@
@@ -546,8 +468,6 @@ index 8b462b5627..183ce1c18e 100644
  
  struct CGroupInfo {
          char *cgroup_path;
-diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
-index 1e95e36678..640ee031d5 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
 @@ -50,6 +50,7 @@
@@ -558,8 +478,6 @@ index 1e95e36678..640ee031d5 100644
  
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
-diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index d09ec5148d..f38a8f7cc1 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
 @@ -21,6 +21,7 @@
@@ -570,8 +488,6 @@ index d09ec5148d..f38a8f7cc1 100644
  
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
          sd_event *e = ASSERT_PTR(userdata);
-diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
-index 620b156563..5ee5b09186 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -18,6 +18,7 @@
@@ -582,8 +498,6 @@ index 620b156563..5ee5b09186 100644
  
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
-diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
-index d9eabec886..534c6cf7e3 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -15,6 +15,7 @@
@@ -594,8 +508,6 @@ index d9eabec886..534c6cf7e3 100644
  
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
-diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index b72e516c8d..6e832b74c3 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -41,6 +41,7 @@
@@ -606,8 +518,6 @@ index b72e516c8d..6e832b74c3 100644
  
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
-diff --git a/src/shared/pager.c b/src/shared/pager.c
-index 6ed35a3ca9..99d9d36140 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -25,6 +25,7 @@
@@ -618,8 +528,6 @@ index 6ed35a3ca9..99d9d36140 100644
  
  static pid_t pager_pid = 0;
  
-diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
-index 821049e667..08a5bdae3d 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -26,6 +26,7 @@
@@ -630,8 +538,6 @@ index 821049e667..08a5bdae3d 100644
  
  #define BUFFER_SIZE (256 * 1024)
  
-diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index 9d71db6ae1..a9938c1e6e 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -7,6 +7,7 @@
@@ -642,8 +548,6 @@ index 9d71db6ae1..a9938c1e6e 100644
  #include "tests.h"
  
  TEST(hexchar) {
-diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
-index 8e4d57ee72..6b4555b4d5 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -22,6 +22,7 @@
@@ -654,8 +558,6 @@ index 8e4d57ee72..6b4555b4d5 100644
  
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
-diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index ec4ad30824..bc40303a46 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
 @@ -34,6 +34,7 @@
@@ -666,8 +568,6 @@ index ec4ad30824..bc40303a46 100644
  
  typedef struct Spawn {
          sd_device *device;
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 5bd09a64d1..0ce79f815c 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -34,6 +34,7 @@
@@ -678,6 +578,3 @@ index 5bd09a64d1..0ce79f815c 100644
  
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
  
--- 
-2.39.2
-
diff --git a/meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
deleted file mode 100644
index afc80b9511a..00000000000
--- a/meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 96088895149746dd2ee8e8c2e4b97972ccf44696 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 28 Feb 2018 21:25:22 -0800
-Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/test/test-sizeof.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index 55bd81e22f..6cf92bffde 100644
---- a/src/test/test-sizeof.c
-+++ b/src/test/test-sizeof.c
-@@ -55,8 +55,10 @@ int main(void) {
-         info(unsigned);
-         info(unsigned long);
-         info(unsigned long long);
-+#ifdef __GLIBC__
-         info(__syscall_ulong_t);
-         info(__syscall_slong_t);
-+#endif
-         info(intmax_t);
-         info(uintmax_t);
- 
-@@ -76,7 +78,9 @@ int main(void) {
-         info(ssize_t);
-         info(time_t);
-         info(usec_t);
-+#ifdef __GLIBC__
-         info(__time_t);
-+#endif
-         info(pid_t);
-         info(uid_t);
-         info(gid_t);
--- 
-2.39.2
-
diff --git a/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch
index 46267a5ada9..5da67f945c6 100644
--- a/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch
@@ -41,11 +41,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/vconsole/vconsole-setup.c           |  2 +-
  20 files changed, 37 insertions(+), 38 deletions(-)
 
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 11b4375ed5..7d81a6007f 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -399,7 +399,7 @@ int cg_kill_kernel_sigkill(const char *controller, const char *path) {
+@@ -400,7 +400,7 @@ int cg_kill_kernel_sigkill(const char *c
          if (r < 0)
                  return r;
  
@@ -54,7 +52,7 @@ index 11b4375ed5..7d81a6007f 100644
          if (r < 0)
                  return r;
  
-@@ -805,7 +805,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -806,7 +806,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -63,7 +61,7 @@ index 11b4375ed5..7d81a6007f 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -823,7 +823,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -824,7 +824,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -72,7 +70,7 @@ index 11b4375ed5..7d81a6007f 100644
                  if (r < 0)
                          return r;
  
-@@ -850,7 +850,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -851,7 +851,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -81,7 +79,7 @@ index 11b4375ed5..7d81a6007f 100644
          if (r < 0)
                  return r;
  
-@@ -860,7 +860,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -861,7 +861,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -90,7 +88,7 @@ index 11b4375ed5..7d81a6007f 100644
          if (r < 0)
                  return r;
  
-@@ -1752,7 +1752,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -1753,7 +1753,7 @@ int cg_set_attribute(const char *control
          if (r < 0)
                  return r;
  
@@ -99,11 +97,9 @@ index 11b4375ed5..7d81a6007f 100644
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
-diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
-index f5c0e04cec..272b920022 100644
 --- a/src/basic/namespace-util.c
 +++ b/src/basic/namespace-util.c
-@@ -220,12 +220,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
+@@ -220,12 +220,12 @@ int userns_acquire(const char *uid_map,
                  freeze();
  
          xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
@@ -118,11 +114,9 @@ index f5c0e04cec..272b920022 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 64a95dd866..12cd16db1c 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limi
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -138,11 +132,9 @@ index 64a95dd866..12cd16db1c 100644
          if (r < 0) {
                  uint64_t threads_max;
  
-diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
-index b66a6622ae..8d1c93008a 100644
 --- a/src/basic/sysctl-util.c
 +++ b/src/basic/sysctl-util.c
-@@ -58,7 +58,7 @@ int sysctl_write(const char *property, const char *value) {
+@@ -58,7 +58,7 @@ int sysctl_write(const char *property, c
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -151,8 +143,6 @@ index b66a6622ae..8d1c93008a 100644
  }
  
  int sysctl_writef(const char *property, const char *format, ...) {
-diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index e1ddf97914..df6e156f19 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
 @@ -30,7 +30,7 @@ static bool arg_unregister = false;
@@ -164,7 +154,7 @@ index e1ddf97914..df6e156f19 100644
  }
  
  static int apply_rule(const char *filename, unsigned line, const char *rule) {
-@@ -58,7 +58,7 @@ static int apply_rule(const char *filename, unsigned line, const char *rule) {
+@@ -58,7 +58,7 @@ static int apply_rule(const char *filena
          if (r >= 0)
                  log_debug("%s:%u: Rule '%s' deleted.", filename, line, rulename);
  
@@ -182,11 +172,9 @@ index e1ddf97914..df6e156f19 100644
                  if (r < 0)
                          log_warning_errno(r, "Failed to flush binfmt_misc rules, ignoring: %m");
                  else
-diff --git a/src/core/cgroup.c b/src/core/cgroup.c
-index 4cac3f6a89..bebe2cd120 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
-@@ -4267,7 +4267,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
+@@ -4267,7 +4267,7 @@ int unit_cgroup_freezer_action(Unit *u,
                          u->freezer_state = FREEZER_THAWING;
          }
  
@@ -195,11 +183,9 @@ index 4cac3f6a89..bebe2cd120 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/core/main.c b/src/core/main.c
-index c0b8126d96..fe676320ba 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1716,7 +1716,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1721,7 +1721,7 @@ static void initialize_core_pattern(bool
          if (getpid_cached() != 1)
                  return;
  
@@ -208,11 +194,9 @@ index c0b8126d96..fe676320ba 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m",
                                    arg_early_core_pattern);
-diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index bcaa237c8d..4032bde19e 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -319,17 +319,17 @@ int mac_smack_setup(bool *loaded_policy) {
+@@ -319,17 +319,17 @@ int mac_smack_setup(bool *loaded_policy)
          }
  
  #if HAVE_SMACK_RUN_LABEL
@@ -234,8 +218,6 @@ index bcaa237c8d..4032bde19e 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
-diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
-index 9a9df5d22f..75ddec881a 100644
 --- a/src/hibernate-resume/hibernate-resume.c
 +++ b/src/hibernate-resume/hibernate-resume.c
 @@ -40,7 +40,7 @@ int main(int argc, char *argv[]) {
@@ -247,8 +229,6 @@ index 9a9df5d22f..75ddec881a 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to write '" DEVNUM_FORMAT_STR "' to /sys/power/resume: %m", DEVNUM_FORMAT_VAL(st.st_rdev));
                  return EXIT_FAILURE;
-diff --git a/src/home/homework.c b/src/home/homework.c
-index 28907386a4..f9e45349a7 100644
 --- a/src/home/homework.c
 +++ b/src/home/homework.c
 @@ -278,7 +278,7 @@ static void drop_caches_now(void) {
@@ -260,11 +240,9 @@ index 28907386a4..f9e45349a7 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to drop caches, ignoring: %m");
          else
-diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index 8c65ee3469..153edab081 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2481,7 +2481,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -2481,7 +2481,7 @@ _public_ int sd_device_set_sysattr_value
          if (!value)
                  return -ENOMEM;
  
@@ -273,11 +251,9 @@ index 8c65ee3469..153edab081 100644
          if (r < 0) {
                  /* On failure, clear cache entry, as we do not know how it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
-diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index 0deb4ebb30..bae8eead9e 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -122,7 +122,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+@@ -122,7 +122,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -286,11 +262,9 @@ index 0deb4ebb30..bae8eead9e 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 36d336dfc8..8c5c69596b 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2771,7 +2771,7 @@ static int reset_audit_loginuid(void) {
+@@ -2774,7 +2774,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -299,7 +273,7 @@ index 36d336dfc8..8c5c69596b 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -4211,7 +4211,7 @@ static int setup_uid_map(
+@@ -4215,7 +4215,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
@@ -308,7 +282,7 @@ index 36d336dfc8..8c5c69596b 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m");
  
-@@ -4221,7 +4221,7 @@ static int setup_uid_map(
+@@ -4225,7 +4225,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
@@ -317,8 +291,6 @@ index 36d336dfc8..8c5c69596b 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/shared/binfmt-util.c b/src/shared/binfmt-util.c
-index a26175474b..1413a9c72c 100644
 --- a/src/shared/binfmt-util.c
 +++ b/src/shared/binfmt-util.c
 @@ -46,7 +46,7 @@ int disable_binfmt(void) {
@@ -330,11 +302,9 @@ index a26175474b..1413a9c72c 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to unregister binfmt_misc entries: %m");
  
-diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
-index 2ea83f05d3..8626bb184c 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -350,7 +350,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+@@ -351,7 +351,7 @@ int cg_attach(const char *controller, co
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -343,7 +313,7 @@ index 2ea83f05d3..8626bb184c 100644
          if (r == -EOPNOTSUPP && cg_is_threaded(controller, path) > 0)
                  /* When the threaded mode is used, we cannot read/write the file. Let's return recognizable error. */
                  return -EUCLEAN;
-@@ -887,7 +887,7 @@ int cg_enable_everywhere(
+@@ -888,7 +888,7 @@ int cg_enable_everywhere(
                                          return log_debug_errno(errno, "Failed to open cgroup.subtree_control file of %s: %m", p);
                          }
  
@@ -352,12 +322,10 @@ index 2ea83f05d3..8626bb184c 100644
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
-diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
-index 3d2f179049..c1b6c170ac 100644
 --- a/src/shared/coredump-util.c
 +++ b/src/shared/coredump-util.c
-@@ -71,7 +71,7 @@ int set_coredump_filter(uint64_t value) {
-         sprintf(t, "0x%"PRIx64, value);
+@@ -71,7 +71,7 @@ int set_coredump_filter(uint64_t value)
+         xsprintf(t, "0x%"PRIx64, value);
  
          return write_string_file("/proc/self/coredump_filter", t,
 -                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|WRITE_STRING_FILE_DISABLE_BUFFER);
@@ -365,11 +333,9 @@ index 3d2f179049..c1b6c170ac 100644
  }
  
  /* Turn off core dumps but only if we're running outside of a container. */
-diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
-index b3b5c905ad..bbfa1973fd 100644
 --- a/src/shared/smack-util.c
 +++ b/src/shared/smack-util.c
-@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
+@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const
                  return 0;
  
          p = procfs_file_alloca(pid, "attr/current");
@@ -378,11 +344,9 @@ index b3b5c905ad..bbfa1973fd 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 765dd4974f..cd6afb001b 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -50,7 +50,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+@@ -52,7 +52,7 @@ static int write_hibernate_location_info
          assert(hibernate_location->swap);
  
          xsprintf(resume_str, "%u:%u", major(hibernate_location->devno), minor(hibernate_location->devno));
@@ -391,7 +355,7 @@ index 765dd4974f..cd6afb001b 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write partition device to /sys/power/resume for '%s': '%s': %m",
                                         hibernate_location->swap->device, resume_str);
-@@ -77,7 +77,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+@@ -79,7 +79,7 @@ static int write_hibernate_location_info
          }
  
          xsprintf(offset_str, "%" PRIu64, hibernate_location->offset);
@@ -400,7 +364,7 @@ index 765dd4974f..cd6afb001b 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write swap file offset to /sys/power/resume_offset for '%s': '%s': %m",
                                         hibernate_location->swap->device, offset_str);
-@@ -93,7 +93,7 @@ static int write_mode(char **modes) {
+@@ -95,7 +95,7 @@ static int write_mode(char **modes) {
          STRV_FOREACH(mode, modes) {
                  int k;
  
@@ -409,7 +373,7 @@ index 765dd4974f..cd6afb001b 100644
                  if (k >= 0)
                          return 0;
  
-@@ -114,7 +114,7 @@ static int write_state(FILE **f, char **states) {
+@@ -116,7 +116,7 @@ static int write_state(FILE **f, char **
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -418,11 +382,9 @@ index 765dd4974f..cd6afb001b 100644
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 0ce79f815c..28aab475d0 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -2357,7 +2357,6 @@ static int udev_rule_apply_token_to_event(
+@@ -2355,7 +2355,6 @@ static int udev_rule_apply_token_to_even
                  log_rule_debug(dev, rules, "ATTR '%s' writing '%s'", buf, value);
                  r = write_string_file(buf, value,
                                        WRITE_STRING_FILE_VERIFY_ON_FAILURE |
@@ -430,11 +392,9 @@ index 0ce79f815c..28aab475d0 100644
                                        WRITE_STRING_FILE_AVOID_NEWLINE |
                                        WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
                  if (r < 0)
-diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index 7d3e9db73f..2d4a0c4c9d 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
+@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *na
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
@@ -443,6 +403,3 @@ index 7d3e9db73f..2d4a0c4c9d 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
  
--- 
-2.39.2
-
diff --git a/meta/recipes-core/systemd/systemd_253.7.bb b/meta/recipes-core/systemd/systemd_253.7.bb
index 1fd4556afd0..531128ed59e 100644
--- a/meta/recipes-core/systemd/systemd_253.7.bb
+++ b/meta/recipes-core/systemd/systemd_253.7.bb
@@ -39,7 +39,6 @@ SRC_URI_MUSL = "\
                file://0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
                file://0013-add-missing-FTW_-macros-for-musl.patch \
                file://0014-Use-uintmax_t-for-handling-rlim_t.patch \
-               file://0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
                file://0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
                file://0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
                file://0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
-- 
2.41.0


