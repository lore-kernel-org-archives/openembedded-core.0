Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 757A67D40D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 08:05:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3G85Etg004815
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Apr 2019 01:05:39 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 16 Apr 2019 01:05:35 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 16 Apr 2019 16:05:01 +0800
Message-ID: <1555401901-255399-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555401901-255399-1-git-send-email-mingli.yu@windriver.com>
References: <a6d8db1cab09ee762353d355107975a59c74b67e.camel@linuxfoundation.org>
	<1555401901-255399-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] elfutils: fix build failure with musl
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
X-List-Received-Date: Tue, 16 Apr 2019 08:05:59 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Fix below build failure with musl when ptest
enabled.
| In file included from ../../elfutils-0.176/tests/dwfl-proc-attach.c:33:
| ../../elfutils-0.176/lib/system.h:63:35: error: called object 'err' is not a function or function pointer
|  #define error(status, errno, ...) err(status, __VA_ARGS__)
|                                    ^~~
| ../../elfutils-0.176/tests/dwfl-proc-attach.c:92:5: note: in expansion of macro 'error'
|      error (-1, 0, "dwfl_linux_proc_attach pid %d: %s", pid,
|      ^~~~~
| ../../elfutils-0.176/tests/dwfl-proc-attach.c:79:7: note: declared here
|    int err;
|        ^~~

The root cause is because the conflicts between
vairable and function name, so change the variable
name to workaround it.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.176.bb   |  4 +-
 ...1-fix-err-variable-and-function-conflicts.patch | 62 ++++++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-fix-err-variable-and-function-conflicts.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
index 917c296..ae3d961 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
@@ -32,7 +32,9 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://serial-tests.patch \
            "
-SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
+SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch \
+                             file://0001-fix-err-variable-and-function-conflicts.patch \
+"
 
 SRC_URI[md5sum] = "077e4f49320cad82bf17a997068b1db9"
 SRC_URI[sha256sum] = "eb5747c371b0af0f71e86215a5ebb88728533c3a104a43d4231963f308cd1023"
diff --git a/meta/recipes-devtools/elfutils/files/0001-fix-err-variable-and-function-conflicts.patch b/meta/recipes-devtools/elfutils/files/0001-fix-err-variable-and-function-conflicts.patch
new file mode 100644
index 0000000..4cf5400
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-fix-err-variable-and-function-conflicts.patch
@@ -0,0 +1,62 @@
+From 2c50fe7068bd6911958c6d851aef88179e73bb21 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Tue, 16 Apr 2019 15:30:38 +0800
+Subject: [PATCH] fix err variable and function conflicts
+
+There comes below build failure with musl when
+ptest enabled.
+| In file included from ../../elfutils-0.176/tests/dwfl-proc-attach.c:33:
+| ../../elfutils-0.176/lib/system.h:63:35: error: called object 'err' is not a function or function pointer
+|  #define error(status, errno, ...) err(status, __VA_ARGS__)
+|                                    ^~~
+| ../../elfutils-0.176/tests/dwfl-proc-attach.c:92:5: note: in expansion of macro 'error'
+|      error (-1, 0, "dwfl_linux_proc_attach pid %d: %s", pid,
+|      ^~~~~
+| ../../elfutils-0.176/tests/dwfl-proc-attach.c:79:7: note: declared here
+|    int err;
+|        ^~~
+
+It is because there is no error.h in musl and
+the patch 0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
+has updated to use err.h to replace error.h
+and also added macro definiton as below when
+use musl.
+ #define error(status, errno, ...) err(status, __VA_ARGS__)
+
+And in err.h, there is below logic:
+_Noreturn void err(int, const char *, ...);
+
+But when ptest enabled, there comes below error
+as there is both variable and function defined
+to be err in tests/dwfl-proc-attach.c.
+So change the err variable's name to workaround
+the build failure with musl.
+
+Upstream-Status: Inappropriate [workaround in musl]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ tests/dwfl-proc-attach.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tests/dwfl-proc-attach.c b/tests/dwfl-proc-attach.c
+index 102ba18..ad4208e 100644
+--- a/tests/dwfl-proc-attach.c
++++ b/tests/dwfl-proc-attach.c
+@@ -76,10 +76,10 @@ main (int argc __attribute__ ((unused)),
+       char **argv __attribute__ ((unused)))
+ {
+   /* Create two extra threads to iterate through.  */
+-  int err;
+-  if ((err = pthread_create (&thread1, NULL, sleeper, NULL)) != 0)
++  int err1;
++  if ((err1 = pthread_create (&thread1, NULL, sleeper, NULL)) != 0)
+     error (-1, err, "Couldn't create thread1");
+-  if ((err = pthread_create (&thread2, NULL, sleeper, NULL)) != 0)
++  if ((err1 = pthread_create (&thread2, NULL, sleeper, NULL)) != 0)
+     error (-1, err, "Couldn't create thread2");
+ 
+   Dwfl *dwfl = dwfl_begin (&proc_callbacks);
+-- 
+2.7.4
+
-- 
2.7.4


