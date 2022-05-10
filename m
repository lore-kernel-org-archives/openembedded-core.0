Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 27/40] strace: fix ptest failure in landlock
Date: Tue, 10 May 2022 04:37:06 -1000
Message-Id: <0268bc1ed04212acdb5b08e57334ed367042c1a2.1652192957.git.steve@sakoman.com>
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf7d885aef06f6208533dd5fab45ee8e92d6d6d7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...0001-landlock-update-expected-string.patch | 67 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_5.16.bb   |  1 +
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
diff --git a/meta/recipes-devtools/strace/strace_5.16.bb b/meta/recipes-devtools/strace/strace_5.16.bb
index 4bde14f939..ae19318c20 100644
--- a/meta/recipes-devtools/strace/strace_5.16.bb
+++ b/meta/recipes-devtools/strace/strace_5.16.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
+           file://0001-landlock-update-expected-string.patch \
            "
 SRC_URI[sha256sum] = "dc7db230ff3e57c249830ba94acab2b862da1fcaac55417e9b85041a833ca285"
 
-- 
2.25.1

