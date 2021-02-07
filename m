Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.15410.1612662014478724270
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 17:40:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QMNSYZch;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id e9so6705942pjj.0
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 17:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ThZhLr0XjvzzaKfu8IhdJpguhU0MRmV/9iI7Zb4TWc=;
        b=QMNSYZchiXgUNd0AiAEgRxaExxSAEDkSLxTSaRqR+T4Lx8/Of5t+/mlSuEHysxE+36
         BYVbS8kc+jlioukY7Urmc1+/s30680SlH6kj1P0OpdupF6BD5Uv4l4/9sZjVo0U+rYTI
         B6JxWQ1fosB2/Dr6QSv6Y7J+ZE0A9tNlo/M8eHBY+aLGjKiKSMw3qRf1+9iGR53RAF4n
         ARE3ui7i8jPTqmIqDUMWbNtGWAaP+yMttzuEO0IdWMp6tzGLJ9ProL/Sqw9jF14h6Ab7
         8LZNR6l3pa5U3QDKD4bV2pr5u16NjCtTThucoo8JjERr0hRmCdPLRF0EugSs1/ltVJxr
         9h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ThZhLr0XjvzzaKfu8IhdJpguhU0MRmV/9iI7Zb4TWc=;
        b=GO2q3NhgLEarYu+SfXWY9boSCBhqb2nY0rccfs1uinM2oJx1rbyTG+1DXQfNyFNKWJ
         kOWtGTpFsdpMJO6Pe/BNfeAqDKjn2v7hSJnD8VqKJVYvoHChK7PU4lLk4IQlFfSLV4mV
         aZfbJM+t4ugBxNiAtzXZzQqBxf157H6zjWtB7rCsWmJCZLm4W2zguAF5fXlwQr/ziqib
         W44So/AEoGQ6Evym5I/8xRGuxbNIzXBYqTzMO/mTszHjxcjMz+Jzn7n/RRJdHbzhO03I
         /33xKLTkXUGsS0/ZrgwPNmYjb++bMpAFzlZ29S1mVpsmi9l0Stvqws9u8YJZrfrle6WG
         iQSg==
X-Gm-Message-State: AOAM531lsBqVCElP3B7BlbwoY8BuKnoM8X4dreKcCrKCyke1zf9KfrOS
	cYK/IgWrRbj9HkcBUfUhg+0zJfkgLQQwZA==
X-Google-Smtp-Source: ABdhPJxyRDgjYHUROq3iIkjKBCHNoOraBUc6fjqyH5Sf/gFPECV6HiP37ruiEkHY0feTkx0PjZcZXg==
X-Received: by 2002:a17:90a:5410:: with SMTP id z16mr10477485pjh.110.1612662013292;
        Sat, 06 Feb 2021 17:40:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id m4sm7389660pfd.130.2021.02.06.17.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 17:40:12 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Fix build on musl
Date: Sat,  6 Feb 2021 17:40:09 -0800
Message-Id: <20210207014009.3729439-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

include "missing_stdlib.h" is needed for strndupa()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...missing.h-check-for-missing-strndupa.patch | 113 ++----------------
 1 file changed, 10 insertions(+), 103 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 154e57b540..d63e3c0d09 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -70,8 +70,6 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/udev/udev-rules.c                      |  1 +
  50 files changed, 61 insertions(+)
 
-diff --git a/meson.build b/meson.build
-index 6aa47fc755..0d0fa4963c 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -535,6 +535,7 @@ foreach ident : [
@@ -82,8 +80,6 @@ index 6aa47fc755..0d0fa4963c 100644
  ]
  
          have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
-diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index d1b6a81e33..38b7008371 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -19,6 +19,7 @@
@@ -94,8 +90,6 @@ index d1b6a81e33..38b7008371 100644
  
  static int help(void) {
          _cleanup_free_ char *link = NULL;
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index f28bf1866a..bb960f183c 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -38,6 +38,7 @@
@@ -106,8 +100,6 @@ index f28bf1866a..bb960f183c 100644
  
  static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
          _cleanup_free_ char *fs = NULL;
-diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index a84863ff22..d4f5d57231 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -15,6 +15,7 @@
@@ -118,8 +110,6 @@ index a84863ff22..d4f5d57231 100644
  
  /* We follow bash for the character set. Different shells have different rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
-diff --git a/src/basic/log.c b/src/basic/log.c
-index d4054cf46a..b608863e45 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
 @@ -36,6 +36,7 @@
@@ -130,8 +120,6 @@ index d4054cf46a..b608863e45 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
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
-index f91f8f7a08..fb31596216 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -14,6 +14,7 @@
@@ -162,8 +148,6 @@ index f91f8f7a08..fb31596216 100644
  
  int mkdir_safe_internal(
                  const char *path,
-diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index 5d4dafe3a5..70749750d4 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
 @@ -22,6 +22,7 @@
@@ -174,8 +158,6 @@ index 5d4dafe3a5..70749750d4 100644
  
  int parse_boolean(const char *v) {
          if (!v)
-diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
-index 96b82170d0..71342b46af 100644
 --- a/src/basic/path-lookup.c
 +++ b/src/basic/path-lookup.c
 @@ -15,6 +15,7 @@
@@ -186,8 +168,6 @@ index 96b82170d0..71342b46af 100644
  
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
-diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
-index 0b6fb137bd..e8e8c7b270 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -198,8 +178,6 @@ index 0b6fb137bd..e8e8c7b270 100644
  
  int proc_cmdline(char **ret) {
          const char *e;
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index ccab71f7d2..8f9eee8d36 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -11,6 +11,7 @@
@@ -210,8 +188,6 @@ index ccab71f7d2..8f9eee8d36 100644
  
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
-diff --git a/src/basic/selinux-util.c b/src/basic/selinux-util.c
-index 4989f4f37c..ca00bf99d8 100644
 --- a/src/basic/selinux-util.c
 +++ b/src/basic/selinux-util.c
 @@ -27,6 +27,7 @@
@@ -222,8 +198,6 @@ index 4989f4f37c..ca00bf99d8 100644
  
  #if HAVE_SELINUX
  DEFINE_TRIVIAL_CLEANUP_FUNC(context_t, context_free);
-diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index 5318d6378d..23c2f77675 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -27,6 +27,7 @@
@@ -234,8 +208,6 @@ index 5318d6378d..23c2f77675 100644
  
  static clockid_t map_clock_id(clockid_t c) {
  
-diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
-index cd34f88bb9..3a77b6f2ca 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -18,6 +18,7 @@
@@ -246,8 +218,6 @@ index cd34f88bb9..3a77b6f2ca 100644
  
  static char **arg_path = NULL;
  
-diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index 37c581fb22..e02789d689 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
 @@ -16,6 +16,7 @@
@@ -258,8 +228,6 @@ index 37c581fb22..e02789d689 100644
  
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
  
-diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index abe009c395..0451e58d1c 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -41,6 +41,7 @@
@@ -270,8 +238,6 @@ index abe009c395..0451e58d1c 100644
  
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
-diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
-index d6223db305..3654c344ee 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -7,6 +7,7 @@
@@ -282,8 +248,6 @@ index d6223db305..3654c344ee 100644
  
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
-diff --git a/src/core/execute.c b/src/core/execute.c
-index c992b8d5d3..89632e0582 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
 @@ -96,6 +96,7 @@
@@ -294,8 +258,6 @@ index c992b8d5d3..89632e0582 100644
  
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
-diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index a56f12f47f..6b8729ef67 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -11,6 +11,7 @@
@@ -306,8 +268,6 @@ index a56f12f47f..6b8729ef67 100644
  
  #if HAVE_KMOD
  #include "module-util.h"
-diff --git a/src/core/service.c b/src/core/service.c
-index d7bdeb7cca..bfd483b2c0 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -41,6 +41,7 @@
@@ -318,8 +278,6 @@ index d7bdeb7cca..bfd483b2c0 100644
  
  static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
          [SERVICE_DEAD] = UNIT_INACTIVE,
-diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
-index 30c67ffe7c..595bc30726 100644
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
 @@ -16,6 +16,7 @@
@@ -330,8 +288,6 @@ index 30c67ffe7c..595bc30726 100644
  
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
-diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index d2aa1815c2..a851aa203f 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
 @@ -22,6 +22,7 @@
@@ -342,8 +298,6 @@ index d2aa1815c2..a851aa203f 100644
  
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
-diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index bcf2e01d5c..5394d1dc01 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -73,6 +73,7 @@
@@ -354,8 +308,6 @@ index bcf2e01d5c..5394d1dc01 100644
  
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
-diff --git a/src/journal/sd-journal.c b/src/journal/sd-journal.c
-index cb1ab88ca5..7f35759540 100644
 --- a/src/journal/sd-journal.c
 +++ b/src/journal/sd-journal.c
 @@ -40,6 +40,7 @@
@@ -366,8 +318,6 @@ index cb1ab88ca5..7f35759540 100644
  
  #define JOURNAL_FILES_MAX 7168
  
-diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
-index 86ff5bdfa2..3fd053a358 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -21,6 +21,7 @@
@@ -378,8 +328,6 @@ index 86ff5bdfa2..3fd053a358 100644
  
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
-diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index 275c4318a1..5ffee59d17 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -13,6 +13,7 @@
@@ -390,8 +338,6 @@ index 275c4318a1..5ffee59d17 100644
  
  static int node_vtable_get_userdata(
                  sd_bus *bus,
-diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
-index 4881fd0d32..c865f1133b 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
 @@ -28,6 +28,7 @@
@@ -402,8 +348,6 @@ index 4881fd0d32..c865f1133b 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
-diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index b8d4dc8d95..a8bac2665d 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -41,6 +41,7 @@
@@ -414,8 +358,6 @@ index b8d4dc8d95..a8bac2665d 100644
  
  #define log_debug_bus_message(m)                                         \
          do {                                                             \
-diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
-index 8c6711797a..fac178823a 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -14,6 +14,7 @@
@@ -426,8 +368,6 @@ index 8c6711797a..fac178823a 100644
  
  #define MAX_SIZE (2*1024*1024)
  
-diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
-index cb8153f4fe..d52a56019d 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
 @@ -21,6 +21,7 @@
@@ -438,8 +378,6 @@ index cb8153f4fe..d52a56019d 100644
  
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
-diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
-index 8e7a94db55..b5c368c6d1 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
 @@ -31,6 +31,7 @@
@@ -450,8 +388,6 @@ index 8e7a94db55..b5c368c6d1 100644
  #include "pam-util.h"
  #include "parse-util.h"
  #include "path-util.h"
-diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
-index 2fa21a067a..2e9995aa62 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -13,6 +13,7 @@
@@ -462,8 +398,6 @@ index 2fa21a067a..2e9995aa62 100644
  
  /*
    # .network
-diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index 92bb5120ab..eeca905c75 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -16,6 +16,7 @@
@@ -474,8 +408,6 @@ index 92bb5120ab..eeca905c75 100644
  
  Settings *settings_new(void) {
          Settings *s;
-diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
-index 53f0492116..c71941fdd7 100644
 --- a/src/nss-mymachines/nss-mymachines.c
 +++ b/src/nss-mymachines/nss-mymachines.c
 @@ -19,6 +19,7 @@
@@ -486,8 +418,6 @@ index 53f0492116..c71941fdd7 100644
  
  NSS_GETHOSTBYNAME_PROTOTYPES(mymachines);
  NSS_GETPW_PROTOTYPES(mymachines);
-diff --git a/src/portable/portable.c b/src/portable/portable.c
-index ed7eac0291..78986977f8 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
 @@ -31,6 +31,7 @@
@@ -498,8 +428,6 @@ index ed7eac0291..78986977f8 100644
  
  static const char profile_dirs[] = CONF_PATHS_NULSTR("systemd/portable/profile");
  
-diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
-index b479335769..212d0bed20 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
 @@ -37,6 +37,7 @@
@@ -510,8 +438,6 @@ index b479335769..212d0bed20 100644
  
  static int arg_family = AF_UNSPEC;
  static int arg_ifindex = 0;
-diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
-index 32f68d5e6a..bda1e1ef4f 100644
 --- a/src/shared/bus-get-properties.c
 +++ b/src/shared/bus-get-properties.c
 @@ -4,6 +4,7 @@
@@ -522,8 +448,6 @@ index 32f68d5e6a..bda1e1ef4f 100644
  
  int bus_property_get_bool(
                  sd_bus *bus,
-diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
-index 3e97be9671..2b8ca838f7 100644
 --- a/src/shared/bus-unit-procs.c
 +++ b/src/shared/bus-unit-procs.c
 @@ -10,6 +10,7 @@
@@ -534,8 +458,6 @@ index 3e97be9671..2b8ca838f7 100644
  
  struct CGroupInfo {
          char *cgroup_path;
-diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
-index 2bab2299fb..62afdc7973 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
 @@ -44,6 +44,7 @@
@@ -546,8 +468,6 @@ index 2bab2299fb..62afdc7973 100644
  
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
-diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index fbda218b3b..aae0be75c6 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
 @@ -21,6 +21,7 @@
@@ -558,8 +478,6 @@ index fbda218b3b..aae0be75c6 100644
  
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
          sd_event *e = userdata;
-diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
-index 8bd1e3a6ac..f8d6eab9bd 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -17,6 +17,7 @@
@@ -570,8 +488,6 @@ index 8bd1e3a6ac..f8d6eab9bd 100644
  
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
-diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
-index e95b638f4d..a1bf15baa8 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -14,6 +14,7 @@
@@ -582,8 +498,6 @@ index e95b638f4d..a1bf15baa8 100644
  
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
-diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index bf574d32a5..a09c79d2fb 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -41,6 +41,7 @@
@@ -594,8 +508,6 @@ index bf574d32a5..a09c79d2fb 100644
  
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
-diff --git a/src/shared/pager.c b/src/shared/pager.c
-index f689d9f28f..aae3957c2f 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -26,6 +26,7 @@
@@ -606,8 +518,6 @@ index f689d9f28f..aae3957c2f 100644
  
  static pid_t pager_pid = 0;
  
-diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
-index 5d5bf7f21d..f1002ffa6c 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
@@ -618,8 +528,6 @@ index 5d5bf7f21d..f1002ffa6c 100644
  
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
-diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
-index 4391d9f1f5..9b73cd0aeb 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -26,6 +26,7 @@
@@ -630,8 +538,6 @@ index 4391d9f1f5..9b73cd0aeb 100644
  
  #define BUFFER_SIZE (256 * 1024)
  
-diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index f0f9679769..128fc164da 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -6,6 +6,7 @@
@@ -642,8 +548,6 @@ index f0f9679769..128fc164da 100644
  
  static void test_hexchar(void) {
          assert_se(hexchar(0xa) == 'a');
-diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
-index 0da59e2c75..66da3741ee 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -22,6 +22,7 @@
@@ -654,8 +558,6 @@ index 0da59e2c75..66da3741ee 100644
  
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
-diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index 5159d19a38..0ed5b65844 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
 @@ -34,6 +34,7 @@
@@ -666,8 +568,6 @@ index 5159d19a38..0ed5b65844 100644
  
  typedef struct Spawn {
          sd_device *device;
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index ef6a0c112c..422fc19127 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -30,6 +30,7 @@
@@ -678,6 +578,13 @@ index ef6a0c112c..422fc19127 100644
  
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
  
--- 
-2.27.0
-
+--- a/src/basic/mountpoint-util.c
++++ b/src/basic/mountpoint-util.c
+@@ -10,6 +10,7 @@
+ #include "fs-util.h"
+ #include "missing_stat.h"
+ #include "missing_syscall.h"
++#include "missing_stdlib.h"
+ #include "mountpoint-util.h"
+ #include "parse-util.h"
+ #include "path-util.h"
-- 
2.30.0

