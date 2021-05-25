Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.3897.1621906445264477890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 18:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GoeK2UYc;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id n6-20020a17090ac686b029015d2f7aeea8so12307389pjt.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 18:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1t8j2R6Xfki7RlAQzrRMdv/DOEjBoeJPPdpNoOHuGRU=;
        b=GoeK2UYcd3L1u2NOmIUTRwr+Qpd2zorG5ngR3TlzpLo21KkDa+chrwP5sI9pyAu/E7
         dlXAlK3zANS/o0taYcWPietqZB91YeU5lOUS7o326Q1tWSWbLYStOouoXeg7HVpw0kcj
         RNPsmEPCa7p2H2kwLZdq1NsduMNJjBHInn0JoT2cuYasTSyfyivKaGUCD1D9DCnOqSjw
         eb7AKTQQBql313r/PD49FcQXFLbsozqGCeM2p9JHw+mrv7csaBUGspG4p2SkO6kWN8Iv
         cgrdD/KU12JbsbSZQZ9vWqd61ggI5/vU6gN2jf+Xl5dco898euqrbRiuZ72qWwLLPTbK
         NNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1t8j2R6Xfki7RlAQzrRMdv/DOEjBoeJPPdpNoOHuGRU=;
        b=VZk0L2VnposMmjGiqsYLLhLKqPTRBuHGbgORKyiztIBhA7i8TPXa//NPHgO9fMa70W
         ecj9re8/Cc96QBLCtbTR+eI+Ot2S1jpYLHvdbHU907WNiHvZLCVV/lD0Q5FGHQAMoEyI
         6c9uDV6U0b2cqfNM3/zOqsm2eSlnPnPNEWdmOHdicge6FZc+VPyihkPQZCrLYfGU4Lyy
         72qJOiCY9sxwQQVQmObeoYVv0kU0xSc+judi+ISdxrxBX/6BtkMp2IgedZGIvakC0h0r
         VqfMjMSfaPT/nqtNz0V0qu2vBfj1dQGcb8zwJCGZLTNDJPP3VXGyuj4u/JRPZU1a1Fa5
         sCvw==
X-Gm-Message-State: AOAM533a1fQv4hna1V3ZF0LkDm4ELBZd1Wp2zutDUuLLQ9EKj4Vyl/c/
	qHBBGTfwX+EcdP1OawhM+gAVX2j/EW6oWA==
X-Google-Smtp-Source: ABdhPJxhtBHnq2iqy9kngO5UWQPEWCnvJ98zt6TTBCnSnfoYa2UZMfgzYvgVzw6LXHs5xc38LV+KHg==
X-Received: by 2002:a17:90b:1944:: with SMTP id nk4mr27672061pjb.182.1621906444034;
        Mon, 24 May 2021 18:34:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e64f])
        by smtp.gmail.com with ESMTPSA id o6sm12498961pfb.126.2021.05.24.18.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 18:34:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Fix 248.3 on musl
Date: Mon, 24 May 2021 18:34:00 -0700
Message-Id: <20210525013400.3763344-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...test-parse-argument-Include-signal.h.patch |  29 +++++
 ...missing.h-check-for-missing-strndupa.patch | 112 ++----------------
 meta/recipes-core/systemd/systemd_248.3.bb    |   1 +
 3 files changed, 40 insertions(+), 102 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch b/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
new file mode 100644
index 0000000000..3af1daac9c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
@@ -0,0 +1,29 @@
+From 1adde6721ead386ccee6efe48038d6944b96319a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 24 May 2021 18:26:27 -0700
+Subject: [PATCH] test-parse-argument: Include signal.h
+
+Fixes
+src/test/test-parse-argument.c:49:29: error: use of undeclared identifier 'SIGABRT'
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/19718]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/test/test-parse-argument.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/test/test-parse-argument.c b/src/test/test-parse-argument.c
+index 4081a9f25a..820d69f092 100644
+--- a/src/test/test-parse-argument.c
++++ b/src/test/test-parse-argument.c
+@@ -3,6 +3,7 @@
+ #include "parse-argument.h"
+ #include "stdio-util.h"
+ #include "tests.h"
++#include <signal.h>
+ 
+ static void test_parse_json_argument(void) {
+         log_info("/* %s */", __func__);
+-- 
+2.31.1
+
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index a0d757b3f3..814c28f5b9 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -72,8 +72,6 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/udev/udev-rules.c                      |  1 +
  51 files changed, 62 insertions(+)
 
-diff --git a/meson.build b/meson.build
-index 2abb7b3188..c97f09062b 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -550,6 +550,7 @@ foreach ident : [
@@ -84,8 +82,6 @@ index 2abb7b3188..c97f09062b 100644
  ]
  
          have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
-diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index 86927be62e..a34be158a0 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -19,6 +19,7 @@
@@ -96,8 +92,6 @@ index 86927be62e..a34be158a0 100644
  
  static int help(void) {
          _cleanup_free_ char *link = NULL;
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 8dd3f8cd95..50c1ae1b2b 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -38,6 +38,7 @@
@@ -108,8 +102,6 @@ index 8dd3f8cd95..50c1ae1b2b 100644
  
  static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
          _cleanup_free_ char *fs = NULL;
-diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index c110a750a5..e1f091b01e 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -18,6 +18,7 @@
@@ -120,8 +112,6 @@ index c110a750a5..e1f091b01e 100644
  
  /* We follow bash for the character set. Different shells have different rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
-diff --git a/src/basic/log.c b/src/basic/log.c
-index 595db0c395..daff8eb68a 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
 @@ -36,6 +36,7 @@
@@ -132,8 +122,6 @@ index 595db0c395..daff8eb68a 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
-diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
-index 8c76f93eb2..9068bfb4f0 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -152,8 +140,6 @@ index 8c76f93eb2..9068bfb4f0 100644
 +    (char *)memcpy(__new, __old, __len); \
 +  })
 +#endif
-diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index f91f8f7a08..fb31596216 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -14,6 +14,7 @@
@@ -164,8 +150,6 @@ index f91f8f7a08..fb31596216 100644
  
  int mkdir_safe_internal(
                  const char *path,
-diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
-index 1d617e87b2..346f9a47d7 100644
 --- a/src/basic/mountpoint-util.c
 +++ b/src/basic/mountpoint-util.c
 @@ -12,6 +12,7 @@
@@ -176,8 +160,6 @@ index 1d617e87b2..346f9a47d7 100644
  #include "mountpoint-util.h"
  #include "parse-util.h"
  #include "path-util.h"
-diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index b79c885dfd..6dabda5691 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
 @@ -19,6 +19,7 @@
@@ -188,8 +170,6 @@ index b79c885dfd..6dabda5691 100644
  
  int parse_boolean(const char *v) {
          if (!v)
-diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
-index e53c2302b1..ca1d40ccbe 100644
 --- a/src/basic/path-lookup.c
 +++ b/src/basic/path-lookup.c
 @@ -15,6 +15,7 @@
@@ -200,8 +180,6 @@ index e53c2302b1..ca1d40ccbe 100644
  
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
-diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
-index 410b8a3eb5..f2c4355609 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -212,8 +190,6 @@ index 410b8a3eb5..f2c4355609 100644
  
  int proc_cmdline(char **ret) {
          const char *e;
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index ccab71f7d2..8f9eee8d36 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -11,6 +11,7 @@
@@ -224,8 +200,6 @@ index ccab71f7d2..8f9eee8d36 100644
  
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
-diff --git a/src/basic/selinux-util.c b/src/basic/selinux-util.c
-index ee9e34ed47..96c1e9362d 100644
 --- a/src/basic/selinux-util.c
 +++ b/src/basic/selinux-util.c
 @@ -27,6 +27,7 @@
@@ -236,8 +210,6 @@ index ee9e34ed47..96c1e9362d 100644
  
  #if HAVE_SELINUX
  DEFINE_TRIVIAL_CLEANUP_FUNC_FULL(context_t, context_free, NULL);
-diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index 78d0390a00..47c38ca691 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -27,6 +27,7 @@
@@ -248,8 +220,6 @@ index 78d0390a00..47c38ca691 100644
  
  static clockid_t map_clock_id(clockid_t c) {
  
-diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
-index 97ad1e0cb5..9d60f3cc79 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -18,6 +18,7 @@
@@ -260,8 +230,6 @@ index 97ad1e0cb5..9d60f3cc79 100644
  
  static char **arg_path = NULL;
  
-diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index 04d2ba34f3..651ca9412e 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
 @@ -17,6 +17,7 @@
@@ -272,8 +240,6 @@ index 04d2ba34f3..651ca9412e 100644
  
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
  
-diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index 5239c41d67..0f604efe98 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -41,6 +41,7 @@
@@ -284,8 +250,6 @@ index 5239c41d67..0f604efe98 100644
  
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
-diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
-index 44a2ccfca0..3926ccfa4a 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -9,6 +9,7 @@
@@ -296,8 +260,6 @@ index 44a2ccfca0..3926ccfa4a 100644
  
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
-diff --git a/src/core/execute.c b/src/core/execute.c
-index 922913e7af..f82fc294c0 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
 @@ -96,6 +96,7 @@
@@ -308,8 +270,6 @@ index 922913e7af..f82fc294c0 100644
  
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
-diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index a56f12f47f..6b8729ef67 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -11,6 +11,7 @@
@@ -320,8 +280,6 @@ index a56f12f47f..6b8729ef67 100644
  
  #if HAVE_KMOD
  #include "module-util.h"
-diff --git a/src/core/service.c b/src/core/service.c
-index 4c5bfb17fb..8c05f36119 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -41,6 +41,7 @@
@@ -332,8 +290,6 @@ index 4c5bfb17fb..8c05f36119 100644
  
  static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
          [SERVICE_DEAD] = UNIT_INACTIVE,
-diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
-index 95c3fca661..d4a9f27b08 100644
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
 @@ -16,6 +16,7 @@
@@ -344,8 +300,6 @@ index 95c3fca661..d4a9f27b08 100644
  
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
-diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index ae1d43756a..24de98c9f3 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
 @@ -24,6 +24,7 @@
@@ -356,8 +310,6 @@ index ae1d43756a..24de98c9f3 100644
  
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
-diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index 76d05c1eee..0beb77b2e5 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -72,6 +72,7 @@
@@ -368,8 +320,6 @@ index 76d05c1eee..0beb77b2e5 100644
  
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
-diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
-index b25064b672..b3bbe63a91 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -20,6 +20,7 @@
@@ -380,8 +330,6 @@ index b25064b672..b3bbe63a91 100644
  
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
-diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index bfd42aea7d..daefc56e3e 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -12,6 +12,7 @@
@@ -392,8 +340,6 @@ index bfd42aea7d..daefc56e3e 100644
  
  static int node_vtable_get_userdata(
                  sd_bus *bus,
-diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
-index 832526cc1b..7bff701806 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
 @@ -28,6 +28,7 @@
@@ -404,8 +350,6 @@ index 832526cc1b..7bff701806 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
-diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index e719c74370..ac2a605680 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -41,6 +41,7 @@
@@ -416,8 +360,6 @@ index e719c74370..ac2a605680 100644
  
  #define log_debug_bus_message(m)                                         \
          do {                                                             \
-diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
-index 13c08fe295..9aae83486e 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -14,6 +14,7 @@
@@ -428,8 +370,6 @@ index 13c08fe295..9aae83486e 100644
  
  #define MAX_SIZE (2*1024*1024)
  
-diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
-index c90b4c926e..0efdccff5d 100644
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
 @@ -40,6 +40,7 @@
@@ -440,8 +380,6 @@ index c90b4c926e..0efdccff5d 100644
  
  #define JOURNAL_FILES_MAX 7168
  
-diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
-index d2f0566dbc..3b7746557e 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
 @@ -24,6 +24,7 @@
@@ -452,8 +390,6 @@ index d2f0566dbc..3b7746557e 100644
  
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
-diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
-index 2021c31bd5..58eb09808d 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
 @@ -31,6 +31,7 @@
@@ -464,8 +400,6 @@ index 2021c31bd5..58eb09808d 100644
  #include "pam-util.h"
  #include "parse-util.h"
  #include "path-util.h"
-diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
-index ae673ddf5b..a79e5114ca 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -13,6 +13,7 @@
@@ -476,8 +410,6 @@ index ae673ddf5b..a79e5114ca 100644
  
  /*
    # .network
-diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index d4619bead5..0e832fd994 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -16,6 +16,7 @@
@@ -488,8 +420,6 @@ index d4619bead5..0e832fd994 100644
  
  Settings *settings_new(void) {
          Settings *s;
-diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
-index 44715bb3e5..bc1e688b5e 100644
 --- a/src/nss-mymachines/nss-mymachines.c
 +++ b/src/nss-mymachines/nss-mymachines.c
 @@ -21,6 +21,7 @@
@@ -500,8 +430,6 @@ index 44715bb3e5..bc1e688b5e 100644
  
  static void setup_logging(void) {
          /* We need a dummy function because log_parse_environment is a macro. */
-diff --git a/src/portable/portable.c b/src/portable/portable.c
-index f201f52531..c78ad0f471 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
 @@ -32,6 +32,7 @@
@@ -512,8 +440,6 @@ index f201f52531..c78ad0f471 100644
  
  static const char profile_dirs[] = CONF_PATHS_NULSTR("systemd/portable/profile");
  
-diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
-index 52bbae3293..4ccbae09c4 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
 @@ -41,6 +41,7 @@
@@ -524,8 +450,6 @@ index 52bbae3293..4ccbae09c4 100644
  
  static int arg_family = AF_UNSPEC;
  static int arg_ifindex = 0;
-diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
-index feb6d3807f..eb11d29e50 100644
 --- a/src/shared/bus-get-properties.c
 +++ b/src/shared/bus-get-properties.c
 @@ -4,6 +4,7 @@
@@ -536,8 +460,6 @@ index feb6d3807f..eb11d29e50 100644
  
  int bus_property_get_bool(
                  sd_bus *bus,
-diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
-index b76125e551..2e0892242f 100644
 --- a/src/shared/bus-unit-procs.c
 +++ b/src/shared/bus-unit-procs.c
 @@ -10,6 +10,7 @@
@@ -548,8 +470,6 @@ index b76125e551..2e0892242f 100644
  
  struct CGroupInfo {
          char *cgroup_path;
-diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
-index a75178068b..3de06e2bd5 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
 @@ -45,6 +45,7 @@
@@ -560,8 +480,6 @@ index a75178068b..3de06e2bd5 100644
  
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
-diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index 64ca67993c..31e3d148ea 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
 @@ -21,6 +21,7 @@
@@ -572,8 +490,6 @@ index 64ca67993c..31e3d148ea 100644
  
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
          sd_event *e = userdata;
-diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
-index e43aa12882..cec9b413c1 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -17,6 +17,7 @@
@@ -584,8 +500,6 @@ index e43aa12882..cec9b413c1 100644
  
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
-diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
-index b2785f0552..5f00902882 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -14,6 +14,7 @@
@@ -596,8 +510,6 @@ index b2785f0552..5f00902882 100644
  
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
-diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index e63c59bd94..dd9773c009 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -41,6 +41,7 @@
@@ -608,8 +520,6 @@ index e63c59bd94..dd9773c009 100644
  
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
-diff --git a/src/shared/pager.c b/src/shared/pager.c
-index 4bbad7e37b..eefcdd068c 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -26,6 +26,7 @@
@@ -620,8 +530,6 @@ index 4bbad7e37b..eefcdd068c 100644
  
  static pid_t pager_pid = 0;
  
-diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
-index 5d5bf7f21d..f1002ffa6c 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
@@ -632,8 +540,6 @@ index 5d5bf7f21d..f1002ffa6c 100644
  
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
-diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
-index 6e3ee0d76b..7727e33d95 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -26,6 +26,7 @@
@@ -644,8 +550,6 @@ index 6e3ee0d76b..7727e33d95 100644
  
  #define BUFFER_SIZE (256 * 1024)
  
-diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index c9d318b8d1..fcb8d40805 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -6,6 +6,7 @@
@@ -656,8 +560,6 @@ index c9d318b8d1..fcb8d40805 100644
  
  static void test_hexchar(void) {
          assert_se(hexchar(0xa) == 'a');
-diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
-index 09cc1c3bd8..8a7d3152a7 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -22,6 +22,7 @@
@@ -668,8 +570,6 @@ index 09cc1c3bd8..8a7d3152a7 100644
  
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
-diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index 12597194a9..208b2458b5 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
 @@ -33,6 +33,7 @@
@@ -680,8 +580,6 @@ index 12597194a9..208b2458b5 100644
  
  typedef struct Spawn {
          sd_device *device;
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 57ede6a197..dc59857765 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -31,6 +31,7 @@
@@ -692,3 +590,13 @@ index 57ede6a197..dc59857765 100644
  
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
  
+--- a/src/basic/percent-util.c
++++ b/src/basic/percent-util.c
+@@ -3,6 +3,7 @@
+ #include "percent-util.h"
+ #include "string-util.h"
+ #include "parse-util.h"
++#include "missing_stdlib.h"
+ 
+ static int parse_parts_value_whole(const char *p, const char *symbol) {
+         const char *pc, *n;
diff --git a/meta/recipes-core/systemd/systemd_248.3.bb b/meta/recipes-core/systemd/systemd_248.3.bb
index b241330d96..4e65656494 100644
--- a/meta/recipes-core/systemd/systemd_248.3.bb
+++ b/meta/recipes-core/systemd/systemd_248.3.bb
@@ -25,6 +25,7 @@ SRC_URI += " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
+           file://0001-test-parse-argument-Include-signal.h.patch \
            "
 
 # patches needed by musl
-- 
2.31.1

