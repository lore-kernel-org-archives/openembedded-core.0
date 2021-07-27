Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.7034.1627416810202018781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 13:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QIN4XT02;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id m2-20020a17090a71c2b0290175cf22899cso910783pjs.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 13:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bjO0qAUcXcuAFEtUN1EXTkiygbVQcjUqQ5YUHVRHHJI=;
        b=QIN4XT02gRGg5o1fQLKSOsOOhxkV43x2RvaW0vJ/tCucU0XdFjw3heI6+3YNjxnT5c
         D2zFwGrJCEZqcZZ6VbcStfvW3AR9rcRrzYEMBCCvVvC1b8Kr0cFDunnJc+hAqjNYUPYO
         LF+1NGesrkAkoeCOoVkjlEaeoF2SRZHgOjOC/VkpaOCGFz02gwfQ7pRwqHVAvT9giJWv
         FAHcfjkNxFDlK85dDm3o0cIfUdaio8sFfWvC+Ua6u0wJZT3QHm875Uo/TcGJtMJXpsz8
         KDzh2CZdiW6jWbEvJ6OWrR8W3VqIfYa8IyLtXdUf7PsqH7rX1oAKGglJNzbALJ+nCm66
         DB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bjO0qAUcXcuAFEtUN1EXTkiygbVQcjUqQ5YUHVRHHJI=;
        b=nEqYcM2wpvD4n+QzlG0yY7WU0oIvBPM6iw8jv5XkkmcNpOTvTdPvfU//Gv4+NM+KOb
         1TiTcnSONqII1pNWfcA68E6nHzjgczAVJzlmp4FyBPMiKi0wr+riNTHubeBfG14ro5PV
         bwI/zW8ycEWr4prxcw+wnyolqGLC5fYYkj5sqNbRKA2oge284FxPsmVodfv9RAemRdGn
         Jvl4QbBQrNPynPM8LpoYWHj5nQ7fzMnrxMhTx6XNjI585oIFe9yBNeAthOQzbk0H+9un
         yQrS64uR6WMJ7DbLCFbT5g/ObV9q8RYnFZgO0J4W6ex5t19UwQPQ0fyR3f4Jhl/WDPyf
         qJiA==
X-Gm-Message-State: AOAM530n6ru9K+Cj/YSluQ9ebnE6HUOzGDCH/wov6STvQ9mm2N7tMp2N
	s3SU9yUt4URXhhk6wTvSv3NvihTuRIpcJA==
X-Google-Smtp-Source: ABdhPJxdWT5fwyI694GC/3omQX6zu0C0ALGDp4/jMA6CV+8n9MI0i+nz1zHSP3m22DAP8iEXM/07aA==
X-Received: by 2002:a62:1a47:0:b029:328:cbf8:6d42 with SMTP id a68-20020a621a470000b0290328cbf86d42mr24361367pfa.37.1627416808573;
        Tue, 27 Jul 2021 13:13:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id k1sm5184863pga.70.2021.07.27.13.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 13:13:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Luca Boccassi <luca.boccassi@microsoft.com>
Subject: [PATCH] systemd: Fix build on musl
Date: Tue, 27 Jul 2021 13:13:25 -0700
Message-Id: <20210727201325.2215487-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Latest upgrade to 249 broke a working build on musl, this is incremental
fix to exisiting patches adapted to 249 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Luca Boccassi <luca.boccassi@microsoft.com>
---
 ...002-don-t-use-glibc-specific-qsort_r.patch |  24 +--
 ...missing.h-check-for-missing-strndupa.patch | 173 +++++++++---------
 .../0006-Include-netinet-if_ether.h.patch     | 147 ++++++++-------
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  20 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  14 +-
 ...-not-disable-buffer-in-writing-files.patch | 143 ++++++---------
 .../systemd/0026-Handle-missing-gshadow.patch |  18 +-
 7 files changed, 247 insertions(+), 292 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index 4cdf66e767..9db22cd9d2 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -19,11 +19,9 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/shared/format-table.c          | 36 ++++++++++++++++++++----------
  3 files changed, 38 insertions(+), 31 deletions(-)
 
-diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index 49586a4a24..d92a5ab0ed 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
-@@ -55,18 +55,4 @@ static inline void _qsort_safe(void *base, size_t nmemb, size_t size, __compar_f
+@@ -56,18 +56,4 @@ static inline void _qsort_safe(void *bas
                  _qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
          })
  
@@ -42,11 +40,9 @@ index 49586a4a24..d92a5ab0ed 100644
 -        })
 -
  int cmp_int(const int *a, const int *b);
-diff --git a/src/libsystemd/sd-hwdb/hwdb-util.c b/src/libsystemd/sd-hwdb/hwdb-util.c
-index fd45ff0f54..ac4b63c49b 100644
---- a/src/libsystemd/sd-hwdb/hwdb-util.c
-+++ b/src/libsystemd/sd-hwdb/hwdb-util.c
-@@ -126,9 +126,13 @@ static struct trie* trie_free(struct trie *trie) {
+--- a/src/shared/hwdb-util.c
++++ b/src/shared/hwdb-util.c
+@@ -127,9 +127,13 @@ static struct trie* trie_free(struct tri
  
  DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
  
@@ -63,7 +59,7 @@ index fd45ff0f54..ac4b63c49b 100644
  }
  
  static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-@@ -156,7 +160,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -157,7 +161,10 @@ static int trie_node_add_value(struct tr
                          .value_off = v,
                  };
  
@@ -75,7 +71,7 @@ index fd45ff0f54..ac4b63c49b 100644
                  if (val) {
                          /* At this point we have 2 identical properties on the same match-string.
                           * Since we process files in order, we just replace the previous value. */
-@@ -182,7 +189,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -183,7 +190,9 @@ static int trie_node_add_value(struct tr
                  .line_number = line_number,
          };
          node->values_count++;
@@ -86,11 +82,9 @@ index fd45ff0f54..ac4b63c49b 100644
          return 0;
  }
  
-diff --git a/src/shared/format-table.c b/src/shared/format-table.c
-index dccb796b26..c3ab8ac296 100644
 --- a/src/shared/format-table.c
 +++ b/src/shared/format-table.c
-@@ -1290,30 +1290,32 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
+@@ -1282,30 +1282,32 @@ static int cell_data_compare(TableData *
          return CMP(index_a, index_b);
  }
  
@@ -133,7 +127,7 @@ index dccb796b26..c3ab8ac296 100644
          }
  
          /* Order identical lines by the order there were originally added in */
-@@ -1952,7 +1954,12 @@ int table_print(Table *t, FILE *f) {
+@@ -1944,7 +1946,12 @@ int table_print(Table *t, FILE *f) {
                  for (size_t i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -147,7 +141,7 @@ index dccb796b26..c3ab8ac296 100644
          }
  
          if (t->display_map)
-@@ -2580,7 +2587,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
+@@ -2572,7 +2579,12 @@ int table_to_json(Table *t, JsonVariant
                  for (size_t i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 814c28f5b9..c863fc995c 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -74,14 +74,14 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 
 --- a/meson.build
 +++ b/meson.build
-@@ -550,6 +550,7 @@ foreach ident : [
-         ['execveat',          '''#include <unistd.h>'''],
-         ['close_range',       '''#include <unistd.h>'''],
-         ['epoll_pwait2',      '''#include <sys/epoll.h>'''],
+@@ -480,6 +480,7 @@ foreach ident : ['secure_getenv', '__sec
+ endforeach
+
+ foreach ident : [
 +        ['strndupa' ,         '''#include <string.h>'''],
- ]
- 
-         have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
+         ['memfd_create',      '''#include <sys/mman.h>'''],
+         ['gettid',            '''#include <sys/types.h>
+                                  #include <unistd.h>'''],
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -19,6 +19,7 @@
@@ -89,7 +89,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "strv.h"
  #include "util.h"
 +#include "missing_stdlib.h"
- 
+
  static int help(void) {
          _cleanup_free_ char *link = NULL;
 --- a/src/basic/cgroup-util.c
@@ -99,7 +99,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "user-util.h"
  #include "xattr-util.h"
 +#include "missing_stdlib.h"
- 
+
  static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
          _cleanup_free_ char *fs = NULL;
 --- a/src/basic/env-util.c
@@ -109,7 +109,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "strv.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
- 
+
  /* We follow bash for the character set. Different shells have different rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
 --- a/src/basic/log.c
@@ -119,9 +119,9 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "time-util.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
- 
+
  #define SNDBUF_SIZE (8*1024*1024)
- 
+
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -147,12 +147,12 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "stdio-util.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
- 
+
  int mkdir_safe_internal(
                  const char *path,
 --- a/src/basic/mountpoint-util.c
 +++ b/src/basic/mountpoint-util.c
-@@ -12,6 +12,7 @@
+@@ -11,6 +11,7 @@
  #include "missing_stat.h"
  #include "missing_syscall.h"
  #include "mkdir.h"
@@ -167,7 +167,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "strv.h"
 +#include "missing_stdlib.h"
- 
+
  int parse_boolean(const char *v) {
          if (!v)
 --- a/src/basic/path-lookup.c
@@ -177,7 +177,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "tmpfile-util.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
- 
+
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
 --- a/src/basic/proc-cmdline.c
@@ -187,7 +187,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "util.h"
  #include "virt.h"
 +#include "missing_stdlib.h"
- 
+
  int proc_cmdline(char **ret) {
          const char *e;
 --- a/src/basic/procfs-util.c
@@ -197,29 +197,19 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "stdio-util.h"
  #include "string-util.h"
 +#include "missing_stdlib.h"
- 
+
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
---- a/src/basic/selinux-util.c
-+++ b/src/basic/selinux-util.c
-@@ -27,6 +27,7 @@
- #include "selinux-util.h"
- #include "stdio-util.h"
- #include "time-util.h"
-+#include "missing_stdlib.h"
- 
- #if HAVE_SELINUX
- DEFINE_TRIVIAL_CLEANUP_FUNC_FULL(context_t, context_free, NULL);
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
-@@ -27,6 +27,7 @@
+@@ -26,6 +26,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "time-util.h"
 +#include "missing_stdlib.h"
- 
+
  static clockid_t map_clock_id(clockid_t c) {
- 
+
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -18,6 +18,7 @@
@@ -227,27 +217,27 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "verbs.h"
  #include "virt.h"
 +#include "missing_stdlib.h"
- 
+
  static char **arg_path = NULL;
- 
+
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
-@@ -17,6 +17,7 @@
- #include "limits-util.h"
+@@ -20,6 +20,7 @@
+ #include "parse-util.h"
  #include "path-util.h"
  #include "percent-util.h"
 +#include "missing_stdlib.h"
- 
+
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
- 
+
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
-@@ -41,6 +41,7 @@
+@@ -42,6 +42,7 @@
  #include "unit-printf.h"
  #include "user-util.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
- 
+
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
 --- a/src/core/dbus-util.c
@@ -257,17 +247,17 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "user-util.h"
  #include "unit.h"
 +#include "missing_stdlib.h"
- 
+
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -96,6 +96,7 @@
+@@ -98,6 +98,7 @@
  #include "unit-serialize.h"
  #include "user-util.h"
  #include "utmp-wtmp.h"
 +#include "missing_stdlib.h"
- 
+
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
 --- a/src/core/kmod-setup.c
@@ -277,7 +267,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "missing_type.h"
 +#include "missing_stdlib.h"
- 
+
  #if HAVE_KMOD
  #include "module-util.h"
 --- a/src/core/service.c
@@ -287,7 +277,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "utf8.h"
  #include "util.h"
 +#include "missing_stdlib.h"
- 
+
  static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
          [SERVICE_DEAD] = UNIT_INACTIVE,
 --- a/src/coredump/coredump-vacuum.c
@@ -297,7 +287,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "time-util.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
- 
+
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
 --- a/src/journal-remote/journal-remote-main.c
@@ -307,7 +297,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-table.h"
  #include "strv.h"
 +#include "missing_stdlib.h"
- 
+
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
 --- a/src/journal/journalctl.c
@@ -317,7 +307,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "user-util.h"
  #include "varlink.h"
 +#include "missing_stdlib.h"
- 
+
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
 --- a/src/libsystemd/sd-bus/bus-message.c
@@ -327,9 +317,9 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "time-util.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
- 
+
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
- 
+
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -12,6 +12,7 @@
@@ -337,27 +327,27 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "strv.h"
 +#include "missing_stdlib.h"
- 
+
  static int node_vtable_get_userdata(
                  sd_bus *bus,
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
-@@ -28,6 +28,7 @@
+@@ -27,6 +27,7 @@
  #include "string-util.h"
  #include "user-util.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
- 
+
  #define SNDBUF_SIZE (8*1024*1024)
- 
+
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
-@@ -41,6 +41,7 @@
+@@ -42,6 +42,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
- 
+
  #define log_debug_bus_message(m)                                         \
          do {                                                             \
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
@@ -367,9 +357,9 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "time-util.h"
  #include "util.h"
 +#include "missing_stdlib.h"
- 
+
  #define MAX_SIZE (2*1024*1024)
- 
+
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
 @@ -40,6 +40,7 @@
@@ -377,9 +367,9 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "strv.h"
  #include "syslog-util.h"
 +#include "missing_stdlib.h"
- 
+
  #define JOURNAL_FILES_MAX 7168
- 
+
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
 @@ -24,6 +24,7 @@
@@ -387,7 +377,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "strv.h"
  #include "tmpfile-util.h"
 +#include "missing_stdlib.h"
- 
+
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
 --- a/src/login/pam_systemd.c
@@ -407,17 +397,17 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "strv.h"
 +#include "missing_stdlib.h"
- 
+
  /*
    # .network
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
-@@ -16,6 +16,7 @@
+@@ -17,6 +17,7 @@
  #include "strv.h"
  #include "user-util.h"
  #include "util.h"
 +#include "missing_stdlib.h"
- 
+
  Settings *settings_new(void) {
          Settings *s;
 --- a/src/nss-mymachines/nss-mymachines.c
@@ -427,19 +417,19 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "signal-util.h"
  #include "string-util.h"
 +#include "missing_stdlib.h"
- 
+
  static void setup_logging(void) {
          /* We need a dummy function because log_parse_environment is a macro. */
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
-@@ -32,6 +32,7 @@
+@@ -34,6 +34,7 @@
  #include "strv.h"
  #include "tmpfile-util.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
- 
+
  static const char profile_dirs[] = CONF_PATHS_NULSTR("systemd/portable/profile");
- 
+
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
 @@ -41,6 +41,7 @@
@@ -447,7 +437,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "utf8.h"
  #include "verbs.h"
 +#include "missing_stdlib.h"
- 
+
  static int arg_family = AF_UNSPEC;
  static int arg_ifindex = 0;
 --- a/src/shared/bus-get-properties.c
@@ -457,7 +447,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "stdio-util.h"
  #include "string-util.h"
 +#include "missing_stdlib.h"
- 
+
  int bus_property_get_bool(
                  sd_bus *bus,
 --- a/src/shared/bus-unit-procs.c
@@ -467,17 +457,17 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "terminal-util.h"
 +#include "missing_stdlib.h"
- 
+
  struct CGroupInfo {
          char *cgroup_path;
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
-@@ -45,6 +45,7 @@
+@@ -47,6 +47,7 @@
  #include "unit-def.h"
  #include "user-util.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
- 
+
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
 --- a/src/shared/bus-util.c
@@ -487,7 +477,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "socket-util.h"
  #include "stdio-util.h"
 +#include "missing_stdlib.h"
- 
+
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
          sd_event *e = userdata;
 --- a/src/shared/dns-domain.c
@@ -497,17 +487,17 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "strv.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
- 
+
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
-@@ -14,6 +14,7 @@
+@@ -15,6 +15,7 @@
  #include "parse-util.h"
  #include "string-util.h"
  #include "unaligned.h"
 +#include "missing_stdlib.h"
- 
+
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
 --- a/src/shared/logs-show.c
@@ -517,7 +507,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "util.h"
  #include "web-util.h"
 +#include "missing_stdlib.h"
- 
+
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
 --- a/src/shared/pager.c
@@ -527,9 +517,9 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "terminal-util.h"
  #include "util.h"
 +#include "missing_stdlib.h"
- 
+
  static pid_t pager_pid = 0;
- 
+
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
@@ -537,7 +527,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "uid-range.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
- 
+
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
 --- a/src/socket-proxy/socket-proxyd.c
@@ -547,9 +537,9 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "util.h"
 +#include "missing_stdlib.h"
- 
+
  #define BUFFER_SIZE (256 * 1024)
- 
+
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -6,6 +6,7 @@
@@ -557,7 +547,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "macro.h"
  #include "string-util.h"
 +#include "missing_stdlib.h"
- 
+
  static void test_hexchar(void) {
          assert_se(hexchar(0xa) == 'a');
 --- a/src/udev/udev-builtin-path_id.c
@@ -567,29 +557,29 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "udev-builtin.h"
  #include "udev-util.h"
 +#include "missing_stdlib.h"
- 
+
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
-@@ -33,6 +33,7 @@
+@@ -34,6 +34,7 @@
  #include "udev-util.h"
  #include "udev-watch.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
- 
+
  typedef struct Spawn {
          sd_device *device;
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -31,6 +31,7 @@
- #include "udev-rules.h"
+@@ -33,6 +33,7 @@
+ #include "udev-util.h"
  #include "user-util.h"
  #include "virt.h"
 +#include "missing_stdlib.h"
- 
+
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
- 
+
 --- a/src/basic/percent-util.c
 +++ b/src/basic/percent-util.c
 @@ -3,6 +3,7 @@
@@ -597,6 +587,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "parse-util.h"
 +#include "missing_stdlib.h"
- 
+
  static int parse_parts_value_whole(const char *p, const char *symbol) {
          const char *pc, *n;
+
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index 54d714266e..2dfc7a3cfb 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -56,8 +56,6 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/udev/udev-builtin-net_setup_link.c    | 1 +
  21 files changed, 26 insertions(+), 8 deletions(-)
 
-diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index 410bfda10e..e70ed8be92 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,6 @@
@@ -68,8 +66,6 @@ index 410bfda10e..e70ed8be92 100644
  #include <linux/if_infiniband.h>
  
  #include "sd-dhcp6-client.h"
-diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
-index ed7b9a8cd1..112c0b09e4 100644
 --- a/src/libsystemd/sd-netlink/netlink-types.c
 +++ b/src/libsystemd/sd-netlink/netlink-types.c
 @@ -3,6 +3,7 @@
@@ -80,8 +76,6 @@ index ed7b9a8cd1..112c0b09e4 100644
  #include <linux/can/vxcan.h>
  #include <linux/netlink.h>
  #include <linux/rtnetlink.h>
-diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index e7c4ed3c7c..3a1e4f9072 100644
 --- a/src/machine/machine-dbus.c
 +++ b/src/machine/machine-dbus.c
 @@ -3,6 +3,7 @@
@@ -92,8 +86,6 @@ index e7c4ed3c7c..3a1e4f9072 100644
  
  /* When we include libgen.h because we need dirname() we immediately
   * undefine basename() since libgen.h defines it as a macro to the POSIX
-diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
-index cf7ca88d6f..34ab468191 100644
 --- a/src/network/netdev/bond.c
 +++ b/src/network/netdev/bond.c
 @@ -1,5 +1,6 @@
@@ -103,8 +95,6 @@ index cf7ca88d6f..34ab468191 100644
  #include "alloc-util.h"
  #include "bond.h"
  #include "bond-util.h"
-diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
-index 38432f1578..79ccfe578e 100644
 --- a/src/network/netdev/bridge.c
 +++ b/src/network/netdev/bridge.c
 @@ -1,5 +1,6 @@
@@ -114,8 +104,6 @@ index 38432f1578..79ccfe578e 100644
  #include <net/if.h>
  
  #include "bridge.h"
-diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index 77c5f8c4e7..04be1b4ab2 100644
 --- a/src/network/netdev/macsec.c
 +++ b/src/network/netdev/macsec.c
 @@ -1,5 +1,6 @@
@@ -125,8 +113,6 @@ index 77c5f8c4e7..04be1b4ab2 100644
  #include <netinet/in.h>
  #include <linux/if_ether.h>
  #include <linux/if_macsec.h>
-diff --git a/src/network/netdev/netdev-gperf.gperf b/src/network/netdev/netdev-gperf.gperf
-index 8abe044890..3c54c58928 100644
 --- a/src/network/netdev/netdev-gperf.gperf
 +++ b/src/network/netdev/netdev-gperf.gperf
 @@ -3,6 +3,7 @@
@@ -137,8 +123,6 @@ index 8abe044890..3c54c58928 100644
  #include <stddef.h>
  #include "bareudp.h"
  #include "batadv.h"
-diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index b31f0fa81a..c80e1ff537 100644
 --- a/src/network/netdev/netdev.c
 +++ b/src/network/netdev/netdev.c
 @@ -1,5 +1,6 @@
@@ -148,20 +132,6 @@ index b31f0fa81a..c80e1ff537 100644
  #include <net/if.h>
  #include <netinet/in.h>
  #include <unistd.h>
-diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvlan.c
-index 2847b336c9..4d6af8c642 100644
---- a/src/network/networkd-brvlan.c
-+++ b/src/network/networkd-brvlan.c
-@@ -4,6 +4,7 @@
- ***/
- 
- #include <netinet/in.h>
-+#include <netinet/if_ether.h>
- #include <linux/if_bridge.h>
- #include <stdbool.h>
- 
-diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
-index 00d055cf8d..65821c1d31 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -1,7 +1,8 @@
@@ -173,8 +143,8 @@ index 00d055cf8d..65821c1d31 100644
 +#include <net/if.h>
  
  #include "bus-error.h"
- #include "dhcp-internal.h"
-@@ -11,6 +12,7 @@
+ #include "dhcp-identifier.h"
+@@ -13,6 +14,7 @@
  #include "networkd-dhcp-common.h"
  #include "networkd-link.h"
  #include "networkd-manager.h"
@@ -182,8 +152,6 @@ index 00d055cf8d..65821c1d31 100644
  #include "networkd-network.h"
  #include "parse-util.h"
  #include "socket-util.h"
-diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-dhcp-server.c
-index 5cdf432c27..93cffb9863 100644
 --- a/src/network/networkd-dhcp-server.c
 +++ b/src/network/networkd-dhcp-server.c
 @@ -1,8 +1,8 @@
@@ -197,8 +165,6 @@ index 5cdf432c27..93cffb9863 100644
  
  #include "sd-dhcp-server.h"
  
-diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index 23dc3a45db..7ae6c2467a 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -1,9 +1,9 @@
@@ -212,8 +178,6 @@ index 23dc3a45db..7ae6c2467a 100644
  
  #include "escape.h"
  #include "alloc-util.h"
-diff --git a/src/network/networkd-dhcp6.c b/src/network/networkd-dhcp6.c
-index aa077d6219..4f6ce22059 100644
 --- a/src/network/networkd-dhcp6.c
 +++ b/src/network/networkd-dhcp6.c
 @@ -3,9 +3,9 @@
@@ -227,11 +191,9 @@ index aa077d6219..4f6ce22059 100644
  
  #include "sd-dhcp6-client.h"
  
-diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 8219d95b0d..c92230453b 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
-@@ -1,8 +1,8 @@
+@@ -1,9 +1,10 @@
  /* SPDX-License-Identifier: LGPL-2.1-or-later */
  
 +#include <netinet/if_ether.h>
@@ -239,10 +201,10 @@ index 8219d95b0d..c92230453b 100644
  #include <linux/if.h>
 -#include <linux/if_arp.h>
  #include <linux/if_link.h>
++#include <linux/netdevice.h>
+ #include <sys/socket.h>
  #include <unistd.h>
  
-diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
-index e5ffd35b6f..871ebb32c6 100644
 --- a/src/network/networkd-network.c
 +++ b/src/network/networkd-network.c
 @@ -1,5 +1,6 @@
@@ -252,24 +214,6 @@ index e5ffd35b6f..871ebb32c6 100644
  #include <net/if.h>
  #include <netinet/in.h>
  #include <linux/netdevice.h>
-diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index a74541a6c9..a10549b336 100644
---- a/src/network/networkd-route.c
-+++ b/src/network/networkd-route.c
-@@ -1,7 +1,10 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
- #include <linux/icmpv6.h>
--#include <linux/ipv6_route.h>
-+/* linux/ipv6_route.h conflicts with netinet/in.h so define manually */
-+#ifndef IP6_RT_PRIO_USER
-+#define IP6_RT_PRIO_USER       1024
-+#endif
- 
- #include "alloc-util.h"
- #include "netlink-util.h"
-diff --git a/src/network/test-network-tables.c b/src/network/test-network-tables.c
-index ce34449554..0b5dc01182 100644
 --- a/src/network/test-network-tables.c
 +++ b/src/network/test-network-tables.c
 @@ -1,5 +1,6 @@
@@ -279,8 +223,6 @@ index ce34449554..0b5dc01182 100644
  #include "bond.h"
  #include "dhcp6-internal.h"
  #include "dhcp6-protocol.h"
-diff --git a/src/shared/ethtool-util.c b/src/shared/ethtool-util.c
-index 654d36a83a..f4ed42d543 100644
 --- a/src/shared/ethtool-util.c
 +++ b/src/shared/ethtool-util.c
 @@ -1,5 +1,6 @@
@@ -290,8 +232,6 @@ index 654d36a83a..f4ed42d543 100644
  #include <net/if.h>
  #include <sys/ioctl.h>
  #include <linux/ethtool.h>
-diff --git a/src/shared/ethtool-util.h b/src/shared/ethtool-util.h
-index 11e2906681..a171df0737 100644
 --- a/src/shared/ethtool-util.h
 +++ b/src/shared/ethtool-util.h
 @@ -3,6 +3,7 @@
@@ -302,8 +242,6 @@ index 11e2906681..a171df0737 100644
  #include <linux/ethtool.h>
  
  #include "conf-parser.h"
-diff --git a/src/udev/net/link-config.c b/src/udev/net/link-config.c
-index 31e5d0cd67..f25f821364 100644
 --- a/src/udev/net/link-config.c
 +++ b/src/udev/net/link-config.c
 @@ -1,5 +1,6 @@
@@ -313,8 +251,6 @@ index 31e5d0cd67..f25f821364 100644
  #include <linux/netdevice.h>
  #include <netinet/ether.h>
  #include <unistd.h>
-diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
-index 87e1fb133e..13876029d0 100644
 --- a/src/udev/udev-builtin-net_setup_link.c
 +++ b/src/udev/udev-builtin-net_setup_link.c
 @@ -1,5 +1,6 @@
@@ -324,3 +260,76 @@ index 87e1fb133e..13876029d0 100644
  #include "alloc-util.h"
  #include "device-util.h"
  #include "errno-util.h"
+--- a/src/network/networkd-bridge-vlan.c
++++ b/src/network/networkd-bridge-vlan.c
+@@ -4,6 +4,7 @@
+ ***/
+ 
+ #include <netinet/in.h>
++#include <netinet/if_ether.h>
+ #include <linux/if_bridge.h>
+ #include <stdbool.h>
+ 
+--- a/src/basic/linux/in6.h
++++ b/src/basic/linux/in6.h
+@@ -1,10 +1,10 @@
+ /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+ /*
+- *	Types and definitions for AF_INET6 
+- *	Linux INET6 implementation 
++ *	Types and definitions for AF_INET6
++ *	Linux INET6 implementation
+  *
+  *	Authors:
+- *	Pedro Roque		<roque@di.fc.ul.pt>	
++ *	Pedro Roque		<roque@di.fc.ul.pt>
+  *
+  *	Sources:
+  *	IPv6 Program Interfaces for BSD Systems
+@@ -19,8 +19,8 @@
+  *      2 of the License, or (at your option) any later version.
+  */
+ 
+-#ifndef _UAPI_LINUX_IN6_H
+-#define _UAPI_LINUX_IN6_H
++#ifndef _LINUX_IN6_H
++#define _LINUX_IN6_H
+ 
+ #include <linux/types.h>
+ #include <linux/libc-compat.h>
+@@ -97,7 +97,7 @@ struct in6_flowlabel_req {
+ 
+ 
+ /*
+- *	Bitmask constant declarations to help applications select out the 
++ *	Bitmask constant declarations to help applications select out the
+  *	flow label and priority fields.
+  *
+  *	Note that this are in host byte order while the flowinfo field of
+@@ -298,4 +298,4 @@ struct in6_flowlabel_req {
+  * ...
+  * MRT6_MAX
+  */
+-#endif /* _UAPI_LINUX_IN6_H */
++#endif /* _LINUX_IN6_H */
+--- a/src/network/networkd-route.c
++++ b/src/network/networkd-route.c
+@@ -1,5 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
++#include <netinet/in.h>
+ #include <linux/icmpv6.h>
+ #include <linux/ipv6_route.h>
+ #include <linux/nexthop.h>
+--- a/src/network/networkd-setlink.c
++++ b/src/network/networkd-setlink.c
+@@ -1,8 +1,8 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+ #include <netinet/in.h>
++#include <net/if_arp.h>
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
+ 
+ #include "missing_network.h"
+ #include "netlink-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 2ff08c7fae..4a60ee32ef 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -23,8 +23,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/tmpfiles/tmpfiles.c   | 10 ++++++++++
  3 files changed, 38 insertions(+)
 
-diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index bc0278e57f..c973f82e54 100644
 --- a/src/basic/glob-util.c
 +++ b/src/basic/glob-util.c
 @@ -12,6 +12,12 @@
@@ -48,7 +46,7 @@ index bc0278e57f..c973f82e54 100644
          /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
          assert(!(flags & GLOB_ALTDIRFUNC));
  
-@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
+@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flag
                  pglob->gl_lstat = lstat;
          if (!pglob->gl_stat)
                  pglob->gl_stat = stat;
@@ -63,8 +61,6 @@ index bc0278e57f..c973f82e54 100644
          if (k == GLOB_NOMATCH)
                  return -ENOENT;
          if (k == GLOB_NOSPACE)
-diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index df6444c433..79a692046e 100644
 --- a/src/test/test-glob-util.c
 +++ b/src/test/test-glob-util.c
 @@ -12,6 +12,12 @@
@@ -78,9 +74,9 @@ index df6444c433..79a692046e 100644
 +#endif
 +
  static void test_glob_exists(void) {
-         char name[] = "/tmp/test-glob_exists.XXXXXX";
-         int fd = -1;
-@@ -39,11 +45,13 @@ static void test_glob_no_dot(void) {
+         log_info("/* %s */", __func__);
+ 
+@@ -41,11 +47,13 @@ static void test_glob_no_dot(void) {
          const char *fn;
  
          _cleanup_globfree_ glob_t g = {
@@ -94,7 +90,7 @@ index df6444c433..79a692046e 100644
          };
  
          int r;
-@@ -51,11 +59,19 @@ static void test_glob_no_dot(void) {
+@@ -55,11 +63,19 @@ static void test_glob_no_dot(void) {
          assert_se(mkdtemp(template));
  
          fn = strjoina(template, "/*");
@@ -114,8 +110,6 @@ index df6444c433..79a692046e 100644
          assert_se(r == GLOB_NOMATCH);
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
-diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 6b73d1e6d5..26b3b74275 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
 @@ -66,6 +66,12 @@
@@ -131,7 +125,7 @@ index 6b73d1e6d5..26b3b74275 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1947,7 +1953,9 @@ finish:
+@@ -1990,7 +1996,9 @@ finish:
  
  static int glob_item(Item *i, action_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -141,7 +135,7 @@ index 6b73d1e6d5..26b3b74275 100644
          };
          int r = 0, k;
          char **fn;
-@@ -1967,7 +1975,9 @@ static int glob_item(Item *i, action_t action) {
+@@ -2010,7 +2018,9 @@ static int glob_item(Item *i, action_t a
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 5f2178734d..cf06572b82 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -31,11 +31,9 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  src/shared/base-filesystem.c |  6 +++---
  2 files changed, 24 insertions(+), 5 deletions(-)
 
-diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 027037f7a7..16eb379caf 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
-@@ -44,8 +44,27 @@ int futimens_opath(int fd, const struct timespec ts[2]);
+@@ -47,8 +47,27 @@ int futimens_opath(int fd, const struct
  int fd_warn_permissions(const char *path, int fd);
  int stat_warn_permissions(const char *path, const struct stat *st);
  
@@ -65,20 +63,18 @@ index 027037f7a7..16eb379caf 100644
  
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
  int touch(const char *path);
-diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 1d05409086..1ed06c31ab 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
-@@ -54,7 +54,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -53,7 +53,7 @@ int base_filesystem_create(const char *r
                  return log_error_errno(errno, "Failed to open root file system: %m");
  
-         for (i = 0; i < ELEMENTSOF(table); i ++) {
+         for (size_t i = 0; i < ELEMENTSOF(table); i++) {
 -                if (faccessat(fd, table[i].dir, F_OK, AT_SYMLINK_NOFOLLOW) >= 0)
 +                if (faccessat(fd, table[i].dir, F_OK, 0) >= 0)
                          continue;
  
                  if (table[i].target) {
-@@ -62,7 +62,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -61,7 +61,7 @@ int base_filesystem_create(const char *r
  
                          /* check if one of the targets exists */
                          NULSTR_FOREACH(s, table[i].target) {
@@ -87,7 +83,7 @@ index 1d05409086..1ed06c31ab 100644
                                          continue;
  
                                  /* check if a specific file exists at the target path */
-@@ -73,7 +73,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -72,7 +72,7 @@ int base_filesystem_create(const char *r
                                          if (!p)
                                                  return log_oom();
  
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index bd627c51e9..44c3ff0532 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -38,11 +38,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/vconsole/vconsole-setup.c           |  2 +-
  16 files changed, 33 insertions(+), 33 deletions(-)
 
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 50c1ae1b2b..5b40e92163 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -765,7 +765,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -766,7 +766,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -51,7 +49,7 @@ index 50c1ae1b2b..5b40e92163 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -783,7 +783,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -784,7 +784,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -60,7 +58,7 @@ index 50c1ae1b2b..5b40e92163 100644
                  if (r < 0)
                          return r;
  
-@@ -810,7 +810,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -811,7 +811,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -69,7 +67,7 @@ index 50c1ae1b2b..5b40e92163 100644
          if (r < 0)
                  return r;
  
-@@ -820,7 +820,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -821,7 +821,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -78,7 +76,7 @@ index 50c1ae1b2b..5b40e92163 100644
          if (r < 0)
                  return r;
  
-@@ -1650,7 +1650,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -1651,7 +1651,7 @@ int cg_set_attribute(const char *control
          if (r < 0)
                  return r;
  
@@ -87,11 +85,9 @@ index 50c1ae1b2b..5b40e92163 100644
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 8f9eee8d36..480f8cc0b4 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limi
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -107,24 +103,9 @@ index 8f9eee8d36..480f8cc0b4 100644
          if (r < 0) {
                  uint64_t threads_max;
  
-diff --git a/src/basic/smack-util.c b/src/basic/smack-util.c
-index 3362ee3924..80c0f2a52e 100644
---- a/src/basic/smack-util.c
-+++ b/src/basic/smack-util.c
-@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
-                 return 0;
- 
-         p = procfs_file_alloca(pid, "attr/current");
--        r = write_string_file(p, label, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(p, label, 0);
-         if (r < 0)
-                 return r;
- 
-diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
-index c96b5cd77f..d2476d9665 100644
 --- a/src/basic/sysctl-util.c
 +++ b/src/basic/sysctl-util.c
-@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
+@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, con
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -133,8 +114,6 @@ index c96b5cd77f..d2476d9665 100644
  }
  
  int sysctl_read(const char *property, char **ret) {
-diff --git a/src/basic/util.c b/src/basic/util.c
-index 955b18bd2a..6d89c90176 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
 @@ -234,7 +234,7 @@ void disable_coredumps(void) {
@@ -146,11 +125,9 @@ index 955b18bd2a..6d89c90176 100644
          if (r < 0)
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
-diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index f6b72e0bae..e9fd4d06be 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
-@@ -48,7 +48,7 @@ static int delete_rule(const char *rule) {
+@@ -48,7 +48,7 @@ static int delete_rule(const char *rule)
          if (!fn)
                  return log_oom();
  
@@ -159,7 +136,7 @@ index f6b72e0bae..e9fd4d06be 100644
  }
  
  static int apply_rule(const char *rule) {
-@@ -56,7 +56,7 @@ static int apply_rule(const char *rule) {
+@@ -56,7 +56,7 @@ static int apply_rule(const char *rule)
  
          (void) delete_rule(rule);
  
@@ -168,7 +145,7 @@ index f6b72e0bae..e9fd4d06be 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to add binary format: %m");
  
-@@ -222,7 +222,7 @@ static int run(int argc, char *argv[]) {
+@@ -223,7 +223,7 @@ static int run(int argc, char *argv[]) {
                  }
  
                  /* Flush out all rules */
@@ -177,11 +154,9 @@ index f6b72e0bae..e9fd4d06be 100644
  
                  STRV_FOREACH(f, files) {
                          k = apply_file(*f, true);
-diff --git a/src/core/main.c b/src/core/main.c
-index 3ee8d0a869..ec36e3e80f 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1401,7 +1401,7 @@ static int bump_unix_max_dgram_qlen(void) {
+@@ -1402,7 +1402,7 @@ static int bump_unix_max_dgram_qlen(void
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -190,7 +165,7 @@ index 3ee8d0a869..ec36e3e80f 100644
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
                                        "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
-@@ -1678,7 +1678,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1679,7 +1679,7 @@ static void initialize_core_pattern(bool
          if (getpid_cached() != 1)
                  return;
  
@@ -199,11 +174,9 @@ index 3ee8d0a869..ec36e3e80f 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
  }
-diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index 8cc1696a4f..ab7b4ba2c3 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -325,17 +325,17 @@ int mac_smack_setup(bool *loaded_policy) {
+@@ -323,17 +323,17 @@ int mac_smack_setup(bool *loaded_policy)
          }
  
  #ifdef SMACK_RUN_LABEL
@@ -225,8 +198,6 @@ index 8cc1696a4f..ab7b4ba2c3 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
-diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
-index 58e35e403e..1d0beb4008 100644
 --- a/src/hibernate-resume/hibernate-resume.c
 +++ b/src/hibernate-resume/hibernate-resume.c
 @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
@@ -238,11 +209,9 @@ index 58e35e403e..1d0beb4008 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
-diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index d82f01a164..b8fd63346c 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -1987,7 +1987,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -2096,7 +2096,7 @@ _public_ int sd_device_set_sysattr_value
          if (!value)
                  return -ENOMEM;
  
@@ -251,24 +220,9 @@ index d82f01a164..b8fd63346c 100644
          if (r < 0) {
                  /* On failure, clear cache entry, as we do not know how it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
-diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
-index 3bc424b83b..5f5eef0843 100644
---- a/src/login/logind-dbus.c
-+++ b/src/login/logind-dbus.c
-@@ -1330,7 +1330,7 @@ static int trigger_device(Manager *m, sd_device *d) {
-                 if (!t)
-                         return -ENOMEM;
- 
--                (void) write_string_file(t, "change", WRITE_STRING_FILE_DISABLE_BUFFER);
-+                (void) write_string_file(t, "change", 0);
-         }
- 
-         return 0;
-diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index cb01b25bc6..e92051268b 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -277,11 +231,9 @@ index cb01b25bc6..e92051268b 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 0c41a48d4b..9c893b18e4 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2695,7 +2695,7 @@ static int reset_audit_loginuid(void) {
+@@ -2751,7 +2751,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -290,27 +242,27 @@ index 0c41a48d4b..9c893b18e4 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -3948,13 +3948,13 @@ static int setup_uid_map(pid_t pid) {
+@@ -4148,7 +4148,7 @@ static int setup_uid_map(
+                 return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
-         xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, arg_uid_shift, arg_uid_range);
--        r = write_string_file(uid_map, line, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(uid_map, line, 0);
+-        r = write_string_file(uid_map, s, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(uid_map, s, 0);
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m");
  
-         /* We always assign the same UID and GID ranges */
+@@ -4158,7 +4158,7 @@ static int setup_uid_map(
+                 return log_oom();
+ 
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
--        r = write_string_file(uid_map, line, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(uid_map, line, 0);
+-        r = write_string_file(uid_map, s, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(uid_map, s, 0);
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
-index f197f715c7..077f893177 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -267,7 +267,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+@@ -267,7 +267,7 @@ int cg_attach(const char *controller, co
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -328,11 +280,9 @@ index f197f715c7..077f893177 100644
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
-diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 262d4cea66..0523e8dc9b 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -48,7 +48,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+@@ -46,7 +46,7 @@ static int write_hibernate_location_info
          assert(hibernate_location->swap);
  
          xsprintf(resume_str, "%u:%u", major(hibernate_location->devno), minor(hibernate_location->devno));
@@ -341,7 +291,7 @@ index 262d4cea66..0523e8dc9b 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write partition device to /sys/power/resume for '%s': '%s': %m",
                                         hibernate_location->swap->device, resume_str);
-@@ -75,7 +75,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+@@ -73,7 +73,7 @@ static int write_hibernate_location_info
          }
  
          xsprintf(offset_str, "%" PRIu64, hibernate_location->offset);
@@ -350,7 +300,7 @@ index 262d4cea66..0523e8dc9b 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write swap file offset to /sys/power/resume_offset for '%s': '%s': %m",
                                         hibernate_location->swap->device, offset_str);
-@@ -92,7 +92,7 @@ static int write_mode(char **modes) {
+@@ -90,7 +90,7 @@ static int write_mode(char **modes) {
          STRV_FOREACH(mode, modes) {
                  int k;
  
@@ -359,7 +309,7 @@ index 262d4cea66..0523e8dc9b 100644
                  if (k >= 0)
                          return 0;
  
-@@ -114,7 +114,7 @@ static int write_state(FILE **f, char **states) {
+@@ -112,7 +112,7 @@ static int write_state(FILE **f, char **
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -368,11 +318,9 @@ index 262d4cea66..0523e8dc9b 100644
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
-diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index d1c3febdd5..1cc68694d1 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
+@@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *na
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
@@ -381,3 +329,32 @@ index d1c3febdd5..1cc68694d1 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
  
+--- a/src/shared/mount-util.c
++++ b/src/shared/mount-util.c
+@@ -1019,13 +1019,13 @@ static int make_userns(uid_t uid_shift,
+         xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, uid_shift, uid_range);
+ 
+         xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
+-        r = write_string_file(uid_map, line, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(uid_map, line, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write UID map: %m");
+ 
+         /* We always assign the same UID and GID ranges */
+         xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
+-        r = write_string_file(uid_map, line, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(uid_map, line, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write GID map: %m");
+ 
+--- a/src/shared/smack-util.c
++++ b/src/shared/smack-util.c
+@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const
+                 return 0;
+ 
+         p = procfs_file_alloca(pid, "attr/current");
+-        r = write_string_file(p, label, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(p, label, 0);
+         if (r < 0)
+                 return r;
+ 
diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
index 068600fa44..9394eeb450 100644
--- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
@@ -17,8 +17,6 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/shared/userdb.c          |  6 ++++++
  3 files changed, 30 insertions(+)
 
-diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
-index 88b8fc2f8f..a819d41bac 100644
 --- a/src/shared/user-record-nss.c
 +++ b/src/shared/user-record-nss.c
 @@ -331,8 +331,10 @@ int nss_group_to_group_record(
@@ -48,7 +46,7 @@ index 88b8fc2f8f..a819d41bac 100644
  
          r = json_build(&g->json, JSON_BUILD_OBJECT(
                                         JSON_BUILD_PAIR("groupName", JSON_BUILD_STRING(g->group_name)),
-@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
+@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct grou
          assert(ret_sgrp);
          assert(ret_buffer);
  
@@ -56,7 +54,7 @@ index 88b8fc2f8f..a819d41bac 100644
          for (;;) {
                  _cleanup_free_ char *buf = NULL;
                  struct sgrp sgrp, *result;
-@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
+@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct grou
                  buflen *= 2;
                  buf = mfree(buf);
          }
@@ -122,8 +120,6 @@ index 88b8fc2f8f..a819d41bac 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/shared/user-record-nss.h b/src/shared/user-record-nss.h
-index 22ab04d6ee..4e52e7a911 100644
 --- a/src/shared/user-record-nss.h
 +++ b/src/shared/user-record-nss.h
 @@ -2,7 +2,11 @@
@@ -138,28 +134,26 @@ index 22ab04d6ee..4e52e7a911 100644
  #include <pwd.h>
  #include <shadow.h>
  
-diff --git a/src/shared/userdb.c b/src/shared/userdb.c
-index 613350bd46..5c821d28cd 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
-@@ -938,13 +938,16 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -1047,13 +1047,15 @@ int groupdb_iterator_get(UserDBIterator
                  if (gr) {
                          _cleanup_free_ char *buffer = NULL;
                          bool incomplete = false;
 +#if ENABLE_GSHADOW
                          struct sgrp sgrp;
+-
 +#endif
- 
                          if (streq_ptr(gr->gr_name, "root"))
                                  iterator->synthesize_root = false;
                          if (gr->gr_gid == GID_NOBODY)
                                  iterator->synthesize_nobody = false;
  
 +#if ENABLE_GSHADOW
-                         if (!FLAGS_SET(iterator->flags, USERDB_AVOID_SHADOW)) {
+                         if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS_SHADOW)) {
                                  r = nss_sgrp_for_group(gr, &sgrp, &buffer);
                                  if (r < 0) {
-@@ -957,6 +960,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -1066,6 +1068,9 @@ int groupdb_iterator_get(UserDBIterator
                          }
  
                          r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
-- 
2.32.0

