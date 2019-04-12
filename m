Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED3687D8CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 03:27:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3C3Rx9G014429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 20:27:59 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 11 Apr 2019 20:27:59 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Apr 2019 11:27:57 +0800
Message-ID: <1555039677-16701-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] nettle: fix ptest failure
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
X-List-Received-Date: Fri, 12 Apr 2019 03:27:59 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Remove dlopen-test.patch which originally used
to fix the test dlopen-test, but autually the
patch didn't resolve the issue as dlopen-test.patch
supposes the file /usr/lib/libnettle.so exists.
Instead deploy ${D}${PTEST_PATH}/libnettle.so to
fix the dlopen-test failure.

Update the initialization for the salt to fix
below Segmentation fault and also nettle-pbkdf2-test
failure.
 # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
 [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip 00007f3332256998 sp 00007fff60d44410 error 4 in libnettle.so.6.5[7f3332244000+1d00]
 [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9 68 ff f
 Segmentation fault

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...kdf2.c-change-the-initialization-for-salt.patch | 39 ++++++++++++++++++++++
 .../nettle/nettle-3.4.1/dlopen-test.patch          | 20 -----------
 meta/recipes-support/nettle/nettle_3.4.1.bb        |  9 ++---
 3 files changed, 44 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-support/nettle/nettle-3.4.1/0001-nettle-pbkdf2.c-change-the-initialization-for-salt.patch
 delete mode 100644 meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch

diff --git a/meta/recipes-support/nettle/nettle-3.4.1/0001-nettle-pbkdf2.c-change-the-initialization-for-salt.patch b/meta/recipes-support/nettle/nettle-3.4.1/0001-nettle-pbkdf2.c-change-the-initialization-for-salt.patch
new file mode 100644
index 0000000..713823e
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.4.1/0001-nettle-pbkdf2.c-change-the-initialization-for-salt.patch
@@ -0,0 +1,39 @@
+From 7510ee2877368464ecce7de515ce056e08c75245 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Fri, 12 Apr 2019 10:30:14 +0800
+Subject: [PATCH] nettle-pbkdf2.c: change the initialization for salt
+
+use malloc and strncpy altogether to replace
+strdup for salt initialization to fix below
+Segmentation fault:
+ # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
+ [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip 00007f3332256998 sp 00007fff60d44410 error 4 in libnettle.so.6.5[7f3332244000+1d00]
+ [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9 68 ff f
+ Segmentation fault
+
+Upstream-Status: Submitted[http://lists.lysator.liu.se/pipermail/nettle-bugs/2019/007467.html]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ tools/nettle-pbkdf2.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tools/nettle-pbkdf2.c b/tools/nettle-pbkdf2.c
+index 1f0a301..000acd3 100644
+--- a/tools/nettle-pbkdf2.c
++++ b/tools/nettle-pbkdf2.c
+@@ -141,7 +141,10 @@ main (int argc, char **argv)
+       return EXIT_FAILURE;
+     }
+ 
+-  salt = strdup (argv[0]);
++  salt = malloc (strlen(argv[0]) + 1);
++  if (! salt)
++     die ("Failed to allocate memory for salt\n");
++  strncpy(salt, argv[0], sizeof(salt) - 1);
+   salt_length = strlen(argv[0]);
+   
+   if (hex_salt)
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
deleted file mode 100644
index c4f0b7e..0000000
--- a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Replace relative path of libnettle.so with absolute path so the test
-program can find it.
-Relative paths are not suitable, as the folder strucure for ptest
-is different from the one expected by the nettle testsuite.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
-
---- a/testsuite/dlopen-test.c	2016-10-01 00:28:38.000000000 -0700
-+++ b/testsuite/dlopen-test.c	2017-10-13 11:08:57.227572860 -0700
-@@ -9,7 +9,7 @@
- main (int argc UNUSED, char **argv UNUSED)
- {
- #if HAVE_LIBDL
--  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
-+  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
-   int (*get_version)(void);
-   if (!handle)
-     {
diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
index dd49c30..612e058 100644
--- a/meta/recipes-support/nettle/nettle_3.4.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
@@ -14,12 +14,9 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://Add-target-to-only-build-tests-not-run-them.patch \
            file://run-ptest \
            file://check-header-files-of-openssl-only-if-enable_.patch \
+           file://0001-nettle-pbkdf2.c-change-the-initialization-for-salt.patch \
            "
 
-SRC_URI_append_class-target = "\
-            file://dlopen-test.patch \
-            "
-
 SRC_URI[md5sum] = "9bdebb0e2f638d3b9d91f7fc264b70c1"
 SRC_URI[sha256sum] = "f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad"
 
@@ -47,6 +44,10 @@ do_install_ptest() {
         # tools can be found in PATH, not in ../tools/
         sed -i -e 's|../tools/||' ${D}${PTEST_PATH}/testsuite/*-test
         install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
+        # libnettle.so is needed for dlopen-test
+        if [ -f ${D}${libdir}/libnettle.so.6.* ]; then
+            cp ${D}${libdir}/libnettle.so.6.* ${D}${PTEST_PATH}/libnettle.so
+        fi
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


