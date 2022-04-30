Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Subject: [PATCH] strace: fix ptest failure in landlock
Date: Sat, 30 Apr 2022 17:33:54 -0400
Message-Id: <20220430213354.7213-2-bruce.ashfield@gmail.com>
In-Reply-To: <20220430213354.7213-1-bruce.ashfield@gmail.com>
References: <20220430213354.7213-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Kernel commit:

  commit 3d4b396a616d0d67bf95d6823ad1197f6247292e
  Author: Christian Brauner <christian.brauner@ubuntu.com>
  Date:   Mon Oct 11 15:37:04 2021 +0200

      landlock: Use square brackets around "landlock-ruleset"

      commit aea0b9f2486da8497f35c7114b764bf55e17c7ea upstream.

      Make the name of the anon inode fd "[landlock-ruleset]" instead of
      "landlock-ruleset". This is minor but most anon inode fds already
      carry square brackets around their name:

          [eventfd]
          [eventpoll]
          [fanotify]
          [fscontext]
          [io_uring]
          [pidfd]
          [signalfd]
          [timerfd]
          [userfaultfd]

      For the sake of consistency lets do the same for the landlock-ruleset anon
      inode fd that comes with landlock. We did the same in
      1cdc415f1083 ("uapi, fsopen: use square brackets around "fscontext" [ver #2]")
      for the new mount api.

      Cc: linux-security-module@vger.kernel.org
      Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
      Link: https://lore.kernel.org/r/20211011133704.1704369-1-brauner@kernel.org
      Cc: stable@vger.kernel.org
      Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>
      Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Changed the format of the landlock tracing. We need to update the strace
expected string to match.

Upstream-Status: Submitted [https://lists.strace.io/pipermail/strace-devel/2022-April/011064.html]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...0001-landlock-update-expected-string.patch | 67 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_5.17.bb   |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-landlock-update-expected-string.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-landlock-update-expected-string.patch b/meta/recipes-devtools/strace/strace/0001-landlock-update-expected-string.patch
new file mode 100644
index 0000000000..9d67d68331
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-landlock-update-expected-string.patch
@@ -0,0 +1,67 @@
+From d0dae2fb30b907bc9bf70382f37c9e00207ae036 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Sat, 30 Apr 2022 01:09:42 -0400
+Subject: [PATCH] landlock: update expected string
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Kernel commit:
+
+  commit 3d4b396a616d0d67bf95d6823ad1197f6247292e
+  Author: Christian Brauner <christian.brauner@ubuntu.com>
+  Date:   Mon Oct 11 15:37:04 2021 +0200
+
+      landlock: Use square brackets around "landlock-ruleset"
+
+      commit aea0b9f2486da8497f35c7114b764bf55e17c7ea upstream.
+
+      Make the name of the anon inode fd "[landlock-ruleset]" instead of
+      "landlock-ruleset". This is minor but most anon inode fds already
+      carry square brackets around their name:
+
+          [eventfd]
+          [eventpoll]
+          [fanotify]
+          [fscontext]
+          [io_uring]
+          [pidfd]
+          [signalfd]
+          [timerfd]
+          [userfaultfd]
+
+      For the sake of consistency lets do the same for the landlock-ruleset anon
+      inode fd that comes with landlock. We did the same in
+      1cdc415f1083 ("uapi, fsopen: use square brackets around "fscontext" [ver #2]")
+      for the new mount api.
+
+      Cc: linux-security-module@vger.kernel.org
+      Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
+      Link: https://lore.kernel.org/r/20211011133704.1704369-1-brauner@kernel.org
+      Cc: stable@vger.kernel.org
+      Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>
+      Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+Changed the format of the landlock tracing. We need to update the strace
+expected string to match.
+
+Upstream-Status: Submitted [https://lists.strace.io/pipermail/strace-devel/2022-April/011064.html]
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ tests/landlock_create_ruleset-y.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/landlock_create_ruleset-y.c b/tests/landlock_create_ruleset-y.c
+index a30966b..50e19c2 100644
+--- a/tests/landlock_create_ruleset-y.c
++++ b/tests/landlock_create_ruleset-y.c
+@@ -1,4 +1,4 @@
+-#define FD_PATH "<anon_inode:landlock-ruleset>"
++#define FD_PATH "<anon_inode:[landlock-ruleset]>"
+ #define SKIP_IF_PROC_IS_UNAVAILABLE skip_if_unavailable("/proc/self/fd/")
+ 
+ #include "landlock_create_ruleset.c"
+-- 
+2.19.1
+
diff --git a/meta/recipes-devtools/strace/strace_5.17.bb b/meta/recipes-devtools/strace/strace_5.17.bb
index 129db87af8..c7fd9edf40 100644
--- a/meta/recipes-devtools/strace/strace_5.17.bb
+++ b/meta/recipes-devtools/strace/strace_5.17.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
+           file://0001-landlock-update-expected-string.patch \
            "
 SRC_URI[sha256sum] = "5fb298dbd1331fd1e1bc94c5c32395860d376101b87c6cd3d1ba9f9aa15c161f"
 
-- 
2.19.1

