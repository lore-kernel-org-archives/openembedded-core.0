Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6817E077
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 15:45:40 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h17so6994641pgv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0+24ErjoXy3l/fThLnJ8WLJnRXuzskvWYxP7M39zPMg=;
	b=QCrNxsiHk2/+KXWFWyHqgA3VezUqJD+AGZebpvlM8D19Po6q03LaSN6jrTCBSnO/Od
	Yn7GHl61No6pXbB59jT/BvWFm5eqaim4t5qxWOMnjLblWqTDm1rSuWb9zD3WVg50r5GG
	VVo1wArxX31vQSPWGV6xnIcf63bxgrSL3eUm2HTun6wAN+yDrYau3CEGv5PS9iEHRpye
	LNV+aomen4P69WCnRlD4jBuHuzPyWMZiFPOCpxYvhNMunBKDlAaoebqDAPTjUOYpivZ4
	RyAKXeBmiltin+hmjgYJZ9wg1n5dDVFdthgjxlWammUApuLYqOcceH3opHrr50QVh4SJ
	Dg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0+24ErjoXy3l/fThLnJ8WLJnRXuzskvWYxP7M39zPMg=;
	b=mu7pPtYhhx7yEghkN3QZsIx9SOChg8zZteTkfqPMP5g0gKZTvx0M/GGytLq6didFHB
	JZmI7BiMxRtBd5n9QcL6vnETu/Dff5VgUu1Pr6Exgl7CHBKihElJRM8RpKHzI1RNfFjK
	5DbAJ/NBUxO4pl4C3wNqgt90gDSAR5AdRcXT6l6PsRAqFjcJUyaPRd9S2k+zZgFjlNB3
	lPkT2jFPAjGhSbxHB+BFiihPTQxubejdeAnbQ5bfKWxJZdvkZXstm+84b3X0RkbBvCb+
	ZaZCL1IXd3GTZ7NhSwi8RlORHKsv8glmKo5TyYIztRdL9X53W8/yQA9gMd0S4+tJJ8Br
	ge8Q==
X-Gm-Message-State: APjAAAX0jFZay8YHUvIYv4rfp0NjA1DaNCGrTsWjqn6uXflnnTa0Ts2L
	kY5RfYwHmcDjAdY+Nn2WsA+Yz4nHEVg=
X-Google-Smtp-Source: APXvYqziA387XwvpxnvB1oeOdPLcKa2AKwk6JCZ+DZVcHHU9ogmPNfKudvHCCJsOwn9cFLmSh2x2MQ==
X-Received: by 2002:a65:5347:: with SMTP id w7mr20139385pgr.375.1558367140570; 
	Mon, 20 May 2019 08:45:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::99be])
	by smtp.gmail.com with ESMTPSA id
	j10sm19365196pgk.37.2019.05.20.08.45.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 08:45:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 08:45:34 -0700
Message-Id: <20190520154534.793-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] pam_systemd: Include missing.h for secure_getenv
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
X-List-Received-Date: Mon, 20 May 2019 15:45:40 -0000
Content-Transfer-Encoding: 8bit

'secure_getenv' api is not uniformly implemented across all C libraries
therefore its good to include missing.h so it can use the alternative
implementation where its not awvailable

Fixes
../git/src/login/pam_systemd.c:344:13: error: implicit declaration of function 'secure_getenv' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
        v = secure_getenv(key);

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...missing.h-check-for-missing-strndupa.patch | 71 +++----------------
 1 file changed, 10 insertions(+), 61 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index a2e25a97df..df1043b27d 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -43,8 +43,6 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  src/udev/udev-rules.c                      |  1 +
  29 files changed, 40 insertions(+)
 
-diff --git a/meson.build b/meson.build
-index 79195c9..80d9564 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -572,6 +572,7 @@ foreach ident : [
@@ -55,8 +53,6 @@ index 79195c9..80d9564 100644
  ]
  
          have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
-diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index dfd6805..c2b2ace 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -17,6 +17,7 @@
@@ -67,8 +63,6 @@ index dfd6805..c2b2ace 100644
  
  static int find_pci_or_platform_parent(sd_device *device, sd_device **ret) {
          const char *subsystem, *sysname, *value;
-diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index fd449dc..e2b0722 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -16,6 +16,7 @@
@@ -79,8 +73,6 @@ index fd449dc..e2b0722 100644
  
  #define VALID_CHARS_ENV_NAME                    \
          DIGITS LETTERS                          \
-diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
-index 188a8d4..1e16ec2 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -99,8 +91,6 @@ index 188a8d4..1e16ec2 100644
 +    (char *)memcpy(__new, __old, __len); \
 +  })
 +#endif
-diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index 6b82eab..51c6b78 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -14,6 +14,7 @@
@@ -111,8 +101,6 @@ index 6b82eab..51c6b78 100644
  
  int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid_t gid, MkdirFlags flags, mkdir_func_t _mkdir) {
          struct stat st;
-diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index 87724af..d9c53bc 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
 @@ -19,6 +19,7 @@
@@ -123,8 +111,6 @@ index 87724af..d9c53bc 100644
  
  int parse_boolean(const char *v) {
          if (!v)
-diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
-index 1670001..b51feaa 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -135,8 +121,6 @@ index 1670001..b51feaa 100644
  
  int proc_cmdline(char **ret) {
          const char *e;
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 7aaf95b..42ce53d 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -11,6 +11,7 @@
@@ -147,8 +131,6 @@ index 7aaf95b..42ce53d 100644
  
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
-diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index daf952b..374b97f 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -28,6 +28,7 @@
@@ -159,8 +141,6 @@ index daf952b..374b97f 100644
  
  static clockid_t map_clock_id(clockid_t c) {
  
-diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index 4615aea..bc1364f 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
 @@ -15,6 +15,7 @@
@@ -171,8 +151,6 @@ index 4615aea..bc1364f 100644
  
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_cgroup_device_policy, cgroup_device_policy, CGroupDevicePolicy);
  
-diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
-index f4fbb72..0a1e3b5 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -7,6 +7,7 @@
@@ -183,8 +161,6 @@ index f4fbb72..0a1e3b5 100644
  
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
-diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index a91cfeb..a459610 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -11,6 +11,7 @@
@@ -195,8 +171,6 @@ index a91cfeb..a459610 100644
  
  #if HAVE_KMOD
  #include <libkmod.h>
-diff --git a/src/core/service.c b/src/core/service.c
-index 0289990..0e725b5 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -42,6 +42,7 @@
@@ -207,8 +181,6 @@ index 0289990..0e725b5 100644
  
  static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
          [SERVICE_DEAD] = UNIT_INACTIVE,
-diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index 0048909..0e85eb7 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -67,6 +67,7 @@
@@ -219,8 +191,6 @@ index 0048909..0e85eb7 100644
  
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  
-diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
-index 427d42f..b050568 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -21,6 +21,7 @@
@@ -231,8 +201,6 @@ index 427d42f..b050568 100644
  
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
-diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index d9fc256..e9c6932 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -13,6 +13,7 @@
@@ -243,8 +211,6 @@ index d9fc256..e9c6932 100644
  
  static int node_vtable_get_userdata(
                  sd_bus *bus,
-diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
-index 8de0a85..4fd0a2e 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -14,6 +14,7 @@
@@ -255,8 +221,6 @@ index 8de0a85..4fd0a2e 100644
  
  #define MAX_SIZE (2*1024*1024)
  
-diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
-index b8bd181..fe0cae0 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
 @@ -23,6 +23,7 @@
@@ -267,8 +231,6 @@ index b8bd181..fe0cae0 100644
  
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
-diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index 476cb07..91e28de 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -16,6 +16,7 @@
@@ -279,8 +241,6 @@ index 476cb07..91e28de 100644
  
  Settings *settings_new(void) {
          Settings *s;
-diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
-index 4b31cb3..989ebf3 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -24,6 +24,7 @@
@@ -291,8 +251,6 @@ index 4b31cb3..989ebf3 100644
  
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
-diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
-index 8638cd3..d03774a 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -13,6 +13,7 @@
@@ -303,8 +261,6 @@ index 8638cd3..d03774a 100644
  
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
-diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index 5fb736f..19cb165 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -38,6 +38,7 @@
@@ -315,8 +271,6 @@ index 5fb736f..19cb165 100644
  
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
-diff --git a/src/shared/pager.c b/src/shared/pager.c
-index 2abb0f6..a00c95f 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -25,6 +25,7 @@
@@ -327,8 +281,6 @@ index 2abb0f6..a00c95f 100644
  
  static pid_t pager_pid = 0;
  
-diff --git a/src/shared/path-lookup.c b/src/shared/path-lookup.c
-index 442fde7..0eb1188 100644
 --- a/src/shared/path-lookup.c
 +++ b/src/shared/path-lookup.c
 @@ -20,6 +20,7 @@
@@ -339,8 +291,6 @@ index 442fde7..0eb1188 100644
  
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
-diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
-index 7cb7d8a..8b12b91 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
@@ -351,8 +301,6 @@ index 7cb7d8a..8b12b91 100644
  
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
-diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
-index abbbc9f..6179b58 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -28,6 +28,7 @@
@@ -363,8 +311,6 @@ index abbbc9f..6179b58 100644
  
  #define BUFFER_SIZE (256 * 1024)
  
-diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index 5221742..a05e778 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -6,6 +6,7 @@
@@ -375,8 +321,6 @@ index 5221742..a05e778 100644
  
  static void test_hexchar(void) {
          assert_se(hexchar(0xa) == 'a');
-diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
-index 7ce1c56..cc19b8e 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -23,6 +23,7 @@
@@ -387,8 +331,6 @@ index 7ce1c56..cc19b8e 100644
  
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index ee87d7c..9aced10 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -40,6 +40,7 @@
@@ -399,6 +341,13 @@ index ee87d7c..9aced10 100644
  
  #define PREALLOC_TOKEN          2048
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
--- 
-2.11.0
-
+--- a/src/login/pam_systemd.c
++++ b/src/login/pam_systemd.c
+@@ -27,6 +27,7 @@
+ #include "hostname-util.h"
+ #include "login-util.h"
+ #include "macro.h"
++#include "missing.h"
+ #include "parse-util.h"
+ #include "path-util.h"
+ #include "process-util.h"
-- 
2.21.0


