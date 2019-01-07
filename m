Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C52B67BE08
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 14:34:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x07EY0mY001491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Jan 2019 06:34:21 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 7 Jan 2019 06:34:16 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 7 Jan 2019 09:33:45 -0500
Message-ID: <b78ad3364e9d55250b6a8028a5de46e8f59c50de.1546871336.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1546871336.git.bruce.ashfield@windriver.com>
References: <cover.1546871336.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-libc-headers: Fix build failure with fixed input and output files instead of pipe
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
X-List-Received-Date: Mon, 07 Jan 2019 14:34:40 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

This is an amendment for
2322dc4 "linux-libc-headers: Fix build failure by using fixed temporary file instead of pipe"
which moves just the temporary input file from /tmp to build directory. But the
build directory may not in the same file system with the output file,
/dev/null, either and thus make it possible to trigger that bug, 67f846b, in
binutil v2.31.

This patch puts both the input and output files into build directory for good.

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...fixed-input-and-output-files-instead-of-.patch} | 22 ++++++++++------------
 .../linux-libc-headers/linux-libc-headers_4.18.bb  |  2 +-
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/linux-libc-headers/{0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch => 0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch} (83%)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
similarity index 83%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
index 0d8fa80939f9..9ba1c076e8d7 100644
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
index 00420aa6f7a0..229a0027d716 100644
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
2.5.0


