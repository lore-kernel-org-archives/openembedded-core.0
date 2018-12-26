Return-Path: <zhe.he@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 812D86B79B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 01:45:45 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id wBQ1ji3b015924;
	Tue, 25 Dec 2018 17:45:44 -0800 (PST)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Tue, 25 Dec 2018 17:45:44 -0800
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Dec 2018 17:45:44 -0800
Message-Id: <20181226014544.1991-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
Cc: bruce.ashfield@windriver.com
Subject: [PATCH] linux-libc-headers: Fix build failure with fixed input and output files instead of pipe
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
X-List-Received-Date: Wed, 26 Dec 2018 01:45:45 -0000

This is an amendment for
2322dc4 "linux-libc-headers: Fix build failure by using fixed temporary file instead of pipe"
which moves just the temporary input file from /tmp to build directory. But the
build directory may not in the same file system with the output file,
/dev/null, either and thus make it possible to trigger that bug, 67f846b, in
binutil v2.31.

This patch puts both the input and output files into build directory for good.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...fixed-input-and-output-files-instead-of-.patch} | 22 ++++++++++------------
 .../linux-libc-headers/linux-libc-headers_4.18.bb  |  2 +-
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/linux-libc-headers/{0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch => 0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch} (83%)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
similarity index 83%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
index 0d8fa80939..9ba1c076e8 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
@@ -1,7 +1,7 @@
-From 3bbea65e11918f8753e8006a2198b999cdb0af58 Mon Sep 17 00:00:00 2001
+From 694eba7bb974f6b8bd308804cb24350150108b2b Mon Sep 17 00:00:00 2001
 From: He Zhe <zhe.he@windriver.com>
 Date: Wed, 21 Nov 2018 15:12:43 +0800
-Subject: [PATCH] scripts: Use fixed temporary file instead of pipe for
+Subject: [PATCH] scripts: Use fixed input and output files instead of pipe for
  here-doc
 
 There was a bug of "as" in binutils that when it checks if the input file and
@@ -40,31 +40,29 @@ Upstream-Status: Inappropriate [A work around for binutils v2.31]
 
 Signed-off-by: He Zhe <zhe.he@windriver.com>
 ---
- scripts/gcc-goto.sh | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
+ scripts/gcc-goto.sh | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/scripts/gcc-goto.sh b/scripts/gcc-goto.sh
-index 083c526..0aaf1b4 100755
+index 083c526..8dfac55 100755
 --- a/scripts/gcc-goto.sh
 +++ b/scripts/gcc-goto.sh
-@@ -3,7 +3,9 @@
+@@ -3,7 +3,7 @@
  # Test for gcc 'asm goto' support
  # Copyright (C) 2010, Jason Baron <jbaron@redhat.com>
  
 -cat << "END" | $@ -x c - -c -o /dev/null >/dev/null 2>&1 && echo "y"
-+TMPFILE=`mktemp -p .`
-+
-+cat << "END" > ${TMPFILE}
++cat << "END" > ./input
  int main(void)
  {
  #if defined(__arm__) || defined(__aarch64__)
-@@ -20,3 +22,6 @@ entry:
+@@ -20,3 +20,6 @@ entry:
  	return 0;
  }
  END
 +
-+$@ -x c ${TMPFILE} -c -o /dev/null && echo "y"
-+rm ${TMPFILE}
++$@ -x c ./input -c -o ./output && echo "y"
++rm ./input ./output
 -- 
 2.7.4
 
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
index 00420aa6f7..229a0027d7 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
@@ -10,7 +10,7 @@ SRC_URI_append_libc-musl = "\
    "
 
 SRC_URI_append = "\
-    file://0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch \
+    file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch \
 "
 
 SRC_URI[md5sum] = "bee5fe53ee1c3142b8f0c12c0d3348f9"
-- 
2.11.0


