Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1567D90B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 09:06:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3F95YUb002329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Apr 2019 02:05:44 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 15 Apr 2019 02:05:24 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 15 Apr 2019 17:05:22 +0800
Message-ID: <1555319122-215657-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <21cc3e7248d8e702f49de8818f26e2e53a001ed1.camel@linuxfoundation.org>
References: <21cc3e7248d8e702f49de8818f26e2e53a001ed1.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH v3] nettle: fix ptest failure
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
X-List-Received-Date: Mon, 15 Apr 2019 09:06:11 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Remove dlopen-test.patch which originally used
to fix the test dlopen-test, but actually it
didn't resolve the issue as expected as it hardcodes
the file /usr/lib/libnettle.so.

Update dynamically with the real ${libdir}/libnettle.so
to fix the below dlopen-test failure:
 # cd /usr/lib64/nettle/ptest
 # ./run-ptest
 dlopen failed: ../libnettle.so: cannot open shared object file: No such file or directory
 ./run-ptest: line 8:  7607 Aborted                 "./$f"
 FAIL: dlopen-test

As the test dlopen-test depends on libnettle.so
which belongs to nettle-dev package, so add it
to rdepends of nettle-ptest.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../nettle/nettle-3.4.1/dlopen-test.patch            | 20 --------------------
 meta/recipes-support/nettle/nettle_3.4.1.bb          |  9 +++++----
 2 files changed, 5 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch

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
index dd49c30..d6bdd2a 100644
--- a/meta/recipes-support/nettle/nettle_3.4.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
@@ -16,10 +16,6 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://check-header-files-of-openssl-only-if-enable_.patch \
            "
 
-SRC_URI_append_class-target = "\
-            file://dlopen-test.patch \
-            "
-
 SRC_URI[md5sum] = "9bdebb0e2f638d3b9d91f7fc264b70c1"
 SRC_URI[sha256sum] = "f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad"
 
@@ -33,6 +29,8 @@ EXTRA_OECONF = "--disable-openssl"
 CFLAGS_append = " -std=c99"
 
 do_compile_ptest() {
+        # fix dlopen-test failure as cannot locate libnettle.so
+        sed -i 's;dlopen ("../libnettle.so", RTLD_NOW);dlopen ("${libdir}/libnettle.so", RTLD_NOW);g' ${S}/testsuite/dlopen-test.c
         oe_runmake buildtest
 }
 
@@ -49,4 +47,7 @@ do_install_ptest() {
         install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
 }
 
+RDEPENDS_${PN}-ptest += "${PN}-dev"
+INSANE_SKIP_${PN}-ptest += "dev-deps"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


