Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC866C10F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 06:51:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 455bRK70z2z5c
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 08:51:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558162286;
	bh=6rjMfP1QiOeuhiTLud1xhiLIP/E54a//2lTD8b6EVEg=;
	h=From:To:Subject:Date:From;
	b=Fq2RPzWunwwVfoYpAwbewP+WW7dczo5Rxz/1yUdMXyHb3VUaPdzkgisZTwGUN5nry
	cj96/h8HsOl4q5D0k6DOKp5ilWhiRoOHUmWdhezIjTaItwhUYZT21yY5xSjKH365Jz
	zU28ba4P6YFSNbqua29V2jBj5q3jOpoct099nFG6CTglmwD5AklUJTtKyI1zZxeNZR
	d7txjMdcVopW0yEg0oKHB6549Sx5CjL7LEZzXSn1olv2Wc9ZTTHQGtBTfYcpSWhOi8
	bBf1vm1sbV063whaaufdObDzv4bdKKHrGrMo90Zi9nJLa6WzTLPDRwfuxgwSWcGD8K
	Q7uTAW12xwgI+OYVJHb6PFCxIPgTfbvwHdGh351tjOTrX43jGQOmarcmdZ0pvxZC1r
	WuClbqdzfloivSKyph0ybfV2Azv5iS9xPAQ9AqQMy8TS7uOjX+nSBm0B5LK9fXajHY
	xHounNCSS97JPPSG78RAhyvOuGXr88r3ndgnXGQwCaNsK2BbXp6D9noPHFeoGfz6yb
	Lml2jH6GXs7QGuRJQlbx6k39L/5pJtUSsn30Ao84l+zHPVYvb5OCZQraGfThqLkPGo
	5hEk2i38iimaoFUfmOFJ2Sf/xPOw2idLAw1sxu15FYq/4HeETiUGaebhoGesvO4375
	+bVugpVEpptF+pFWeemfVmPc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2019 09:51:24 +0300
Message-Id: <20190518065124.12643-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] systemd: Some upstreamable musl patches have been upstreamed
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
X-List-Received-Date: Sat, 18 May 2019 06:51:26 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...cy-ULONG_LONG_MAX-with-the-C99-ULLON.patch | 50 +++++++++++++++++++
 ...udev-event.c-must-include-sys-wait.h.patch | 35 +++++++++++++
 ...G_LONG_MAX-definition-in-case-of-mus.patch | 27 ----------
 ...-sys-wait.h-to-avoid-compile-failure.patch | 33 ------------
 .../0023-socket-util.h-include-string.h.patch | 20 ++++----
 ...s-utilh-add-missing-sys-stat-include.patch | 16 +++---
 meta/recipes-core/systemd/systemd_242.bb      |  4 +-
 7 files changed, 105 insertions(+), 80 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-src-udev-udev-event.c-must-include-sys-wait.h.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0022-include-sys-wait.h-to-avoid-compile-failure.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch b/meta/recipes-core/systemd/systemd/0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch
new file mode 100644
index 0000000000..6f192a2ad2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch
@@ -0,0 +1,50 @@
+From f491dfdc88ddbba36a24a75b2063aff027461b83 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@stusta.de>
+Date: Thu, 16 May 2019 22:20:07 +0300
+Subject: Replace the legacy ULONG_LONG_MAX with the C99 ULLONG_MAX
+
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ src/journal-remote/journal-remote-main.c | 4 ++--
+ src/shutdown/shutdown.c                  | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
+index 2321a91e7b..d32c51c3ce 100644
+--- a/src/journal-remote/journal-remote-main.c
++++ b/src/journal-remote/journal-remote-main.c
+@@ -528,7 +528,7 @@ static int dispatch_http_event(sd_event_source *event,
+                                void *userdata) {
+         MHDDaemonWrapper *d = userdata;
+         int r;
+-        MHD_UNSIGNED_LONG_LONG timeout = ULONG_LONG_MAX;
++        MHD_UNSIGNED_LONG_LONG timeout = ULLONG_MAX;
+ 
+         assert(d);
+ 
+@@ -538,7 +538,7 @@ static int dispatch_http_event(sd_event_source *event,
+                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL),
+                                        "MHD_run failed!");
+         if (MHD_get_timeout(d->daemon, &timeout) == MHD_NO)
+-                timeout = ULONG_LONG_MAX;
++                timeout = ULLONG_MAX;
+ 
+         r = sd_event_source_set_time(d->timer_event, timeout);
+         if (r < 0) {
+diff --git a/src/shutdown/shutdown.c b/src/shutdown/shutdown.c
+index 35b2c2aa46..9623fe9ea2 100644
+--- a/src/shutdown/shutdown.c
++++ b/src/shutdown/shutdown.c
+@@ -212,7 +212,7 @@ static int sync_making_progress(unsigned long long *prev_dirty) {
+ }
+ 
+ static void sync_with_progress(void) {
+-        unsigned long long dirty = ULONG_LONG_MAX;
++        unsigned long long dirty = ULLONG_MAX;
+         unsigned checks;
+         pid_t pid;
+         int r;
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/systemd/systemd/0001-src-udev-udev-event.c-must-include-sys-wait.h.patch b/meta/recipes-core/systemd/systemd/0001-src-udev-udev-event.c-must-include-sys-wait.h.patch
new file mode 100644
index 0000000000..565deba1d0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-src-udev-udev-event.c-must-include-sys-wait.h.patch
@@ -0,0 +1,35 @@
+From 010f917cf222d2c7205584056fe0e4c581a2e1b1 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@stusta.de>
+Date: Thu, 16 May 2019 22:09:46 +0300
+Subject: src/udev/udev-event.c must #include <sys/wait.h>
+
+Fixes the following build failure with musl:
+../git/src/udev/udev-event.c: In function 'spawn_wait':
+../git/src/udev/udev-event.c:600:53: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
+         r = sd_event_add_child(e, NULL, spawn->pid, WEXITED, on_spawn_sigchld, spawn);
+                                                     ^~~~~~~
+
+This looks like a bug in udev-event.c that could also have broken
+the compilation after some future glibc header reshuffle.
+
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ src/udev/udev-event.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
+index cab1b5ac0c..a0a7ac0f9e 100644
+--- a/src/udev/udev-event.c
++++ b/src/udev/udev-event.c
+@@ -7,6 +7,7 @@
+ #include <stddef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <sys/wait.h>
+ #include <unistd.h>
+ 
+ #include "sd-event.h"
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/systemd/systemd/0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch b/meta/recipes-core/systemd/systemd/0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
deleted file mode 100644
index dbaae4f398..0000000000
--- a/meta/recipes-core/systemd/systemd/0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From aa6cd19ae428769a38fe7d95f98db0a9c19ae90a Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 15:14:49 +0800
-Subject: [PATCH 12/24] fix missing ULONG_LONG_MAX definition in case of musl
-
-Upstream-Status: Inappropriate [musl]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/missing_type.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index 23602eb..7d7c1e4 100644
---- a/src/basic/missing_type.h
-+++ b/src/basic/missing_type.h
-@@ -39,3 +39,7 @@ typedef int (*__compar_fn_t)(const void *, const void *);
- #ifndef FTW_SKIP_SIBLINGS
- #define FTW_SKIP_SIBLINGS 3
- #endif
-+
-+#ifndef ULONG_LONG_MAX
-+#define ULONG_LONG_MAX ULLONG_MAX
-+#endif
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0022-include-sys-wait.h-to-avoid-compile-failure.patch b/meta/recipes-core/systemd/systemd/0022-include-sys-wait.h-to-avoid-compile-failure.patch
deleted file mode 100644
index 47212bc3c1..0000000000
--- a/meta/recipes-core/systemd/systemd/0022-include-sys-wait.h-to-avoid-compile-failure.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6c5364736f5afd1106ac240f03806af53979cc60 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 15:56:50 +0800
-Subject: [PATCH 22/24] include sys/wait.h to avoid compile failure
-
-Fix the following error:
-src/udev/udev-event.c:581:53: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/udev/udev-event.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index 07b7365..e532bb7 100644
---- a/src/udev/udev-event.c
-+++ b/src/udev/udev-event.c
-@@ -8,7 +8,9 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
--
-+#ifndef __GLIBC__
-+#include <sys/wait.h>
-+#endif
- #include "sd-event.h"
- 
- #include "alloc-util.h"
--- 
-2.7.4
-
diff --git a/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch b/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch
index 22186b8a7e..37987b57f6 100644
--- a/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch
+++ b/meta/recipes-core/systemd/systemd/0023-socket-util.h-include-string.h.patch
@@ -1,12 +1,12 @@
-From 93e6b81b721d9eb966a257bfdf7df6e8280b885c Mon Sep 17 00:00:00 2001
+From 56fb30d93e96d7f983af0cb4dff9155da91dd671 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 16:37:19 +0800
-Subject: [PATCH 23/24] socket-util.h: include string.h
+Subject: socket-util.h: include string.h
 
 Fix the following compile error:
 src/basic/socket-util.h:187:30: error: implicit declaration of function 'strnlen'; did you mean 'strlen'? [-Werror=implicit-function-declaration]
 
-Upstream-Status: Pending
+Upstream-Status: Accepted
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
@@ -14,17 +14,17 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/basic/socket-util.h b/src/basic/socket-util.h
-index 574d2b7..097aa4d 100644
+index 6920fd99ba..36ec422f2c 100644
 --- a/src/basic/socket-util.h
 +++ b/src/basic/socket-util.h
-@@ -12,6 +12,7 @@
+@@ -9,6 +9,7 @@
+ #include <netinet/in.h>
+ #include <stdbool.h>
+ #include <stddef.h>
++#include <string.h>
  #include <sys/socket.h>
  #include <sys/types.h>
  #include <sys/un.h>
-+#include <string.h>
- 
- #include "macro.h"
- #include "missing_socket.h"
 -- 
-2.7.4
+2.20.1
 
diff --git a/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch b/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
index bae9d3eaad..ada404b053 100644
--- a/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
+++ b/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
@@ -1,30 +1,30 @@
-From 2560a6b7b9adc5bd5dec0f87c2e3025ced8a2af2 Mon Sep 17 00:00:00 2001
+From 56e3c9581e2c9b7435d5fcbd74b47c7ccf6b3891 Mon Sep 17 00:00:00 2001
 From: Andrej Valek <andrej.valek@siemens.com>
 Date: Thu, 18 Apr 2019 10:47:11 +0200
-Subject: [PATCH] fs-utilh: add missing sys/stat include
+Subject: fs-util.h: add missing sys/stat include
 
 fix error:
 | error: passing argument 5 of 'chase_symlinks_and_stat' from incompatible pointer type [-Werror=incompatible-pointer-types]
 
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 
-Upstream-Status: Pending
+Upstream-Status: Accepted
 ---
  src/basic/fs-util.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index b965120..e2fdfff 100644
+index b9651205e6..c153bc4448 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
-@@ -8,6 +8,7 @@
+@@ -7,6 +7,7 @@
+ #include <stdbool.h>
  #include <stdint.h>
  #include <sys/inotify.h>
- #include <sys/types.h>
 +#include <sys/stat.h>
+ #include <sys/types.h>
  #include <unistd.h>
  
- #include "errno-util.h"
 -- 
-2.11.0
+2.20.1
 
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 20714fc70a..2dda0d0b95 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -38,7 +38,7 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
                file://0008-add-missing-FTW_-macros-for-musl.patch \
                file://0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
                file://0011-Use-uintmax_t-for-handling-rlim_t.patch \
-               file://0012-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch \
+               file://0001-Replace-the-legacy-ULONG_LONG_MAX-with-the-C99-ULLON.patch \
                file://0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
                file://0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
                file://0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
@@ -47,7 +47,7 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
                file://0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
                file://0020-missing_type.h-add-__compar_d_fn_t-definition.patch \
                file://0021-avoid-redefinition-of-prctl_mm_map-structure.patch \
-               file://0022-include-sys-wait.h-to-avoid-compile-failure.patch \
+               file://0001-src-udev-udev-event.c-must-include-sys-wait.h.patch \
                file://0023-socket-util.h-include-string.h.patch \
                file://0024-test-json.c-define-M_PIl.patch \
                file://0025-fs-utilh-add-missing-sys-stat-include.patch \
-- 
2.17.1


