Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E04F6FBCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 09:05:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4S95g3r006006
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 May 2014 02:05:42 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 28 May 2014 02:05:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 May 2014 17:05:32 +0800
Message-ID: <bf82873db79aba78e0ecb8b744d30fc6839c9f99.1401267658.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401267658.git.hongxu.jia@windriver.com>
References: <cover.1401267658.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/3] apr: fix cross compiling failed
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
X-List-Received-Date: Wed, 28 May 2014 09:05:43 -0000
Content-Type: text/plain

The do_compile failed:
| tools/gen_test_char > include/private/apr_escape_test_char.h
| /bin/sh: tools/gen_test_char: No such file or directory
| make[1]: *** [include/private/apr_escape_test_char.h] Error 127

The tools/gen_test_char was invoked at build time, and it didn't
work for the cross compiling, so we used the native one to instead.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../apr/apr/fix-cross-compiling-failed.patch       | 46 ++++++++++++++++++++++
 meta/recipes-support/apr/apr_1.5.1.bb              |  8 ++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/fix-cross-compiling-failed.patch

diff --git a/meta/recipes-support/apr/apr/fix-cross-compiling-failed.patch b/meta/recipes-support/apr/apr/fix-cross-compiling-failed.patch
new file mode 100644
index 0000000..cd430b3
--- /dev/null
+++ b/meta/recipes-support/apr/apr/fix-cross-compiling-failed.patch
@@ -0,0 +1,46 @@
+Makefile.in: fix cross compiling failed
+
+The tools/gen_test_char was invoked at build time,
+and it didn't work for the cross compiling, so we
+used the native one to instead.
+
+Upstream-Status: inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in | 12 +++---------
+ 1 file changed, 3 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -45,8 +45,7 @@ LT_VERSION = @LT_VERSION@
+ @INCLUDE_OUTPUTS@
+ 
+ CLEAN_TARGETS = apr-config.out apr.exp exports.c export_vars.c .make.dirs \
+-	build/apr_rules.out tools/gen_test_char@EXEEXT@ \
+-	tools/gen_test_char.o tools/gen_test_char.lo \
++	build/apr_rules.out  \
+ 	include/private/apr_escape_test_char.h
+ DISTCLEAN_TARGETS = config.cache config.log config.status \
+ 	include/apr.h include/arch/unix/apr_private.h \
+@@ -132,14 +131,9 @@ etags:
+ make_tools_dir:
+ 	$(APR_MKDIR) tools
+ 
+-OBJECTS_gen_test_char = tools/gen_test_char.lo $(LOCAL_LIBS)
+-tools/gen_test_char.lo: make_tools_dir
+-tools/gen_test_char@EXEEXT@: $(OBJECTS_gen_test_char)
+-	$(LINK_PROG) $(OBJECTS_gen_test_char) $(ALL_LIBS)
+-
+-include/private/apr_escape_test_char.h: tools/gen_test_char@EXEEXT@
++include/private/apr_escape_test_char.h:
+ 	$(APR_MKDIR) include/private
+-	tools/gen_test_char@EXEEXT@ > $@
++	gen_test_char@EXEEXT@ > $@
+ 
+ LINK_PROG = $(LIBTOOL) $(LTFLAGS) --mode=link $(COMPILE) $(LT_LDFLAGS) \
+ 	    @LT_NO_INSTALL@ $(ALL_LDFLAGS) -o $@
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-support/apr/apr_1.5.1.bb b/meta/recipes-support/apr/apr_1.5.1.bb
index 7f2d2ca..80af749 100644
--- a/meta/recipes-support/apr/apr_1.5.1.bb
+++ b/meta/recipes-support/apr/apr_1.5.1.bb
@@ -2,6 +2,7 @@ SUMMARY = "Apache Portable Runtime (APR) library"
 HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
 DEPENDS = "util-linux"
+DEPENDS_class-target = "apr-native"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
@@ -16,6 +17,9 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
 "
 
+SRC_URI_append_class-target = " \
+           file://fix-cross-compiling-failed.patch \
+"
 SRC_URI[md5sum] = "5486180ec5a23efb5cae6d4292b300ab"
 SRC_URI[sha256sum] = "e94abe431d4da48425fcccdb27b469bd0f8151488f82e5630a56f26590e198ac"
 
@@ -50,6 +54,10 @@ do_install_append() {
 	cp ${S}/${HOST_SYS}-libtool ${D}${datadir}/build-1/libtool
 }
 
+do_install_append_class-native() {
+    install -m 0755 ${S}/tools/gen_test_char ${D}/${bindir}
+}
+
 SSTATE_SCAN_FILES += "apr_rules.mk libtool"
 
 SYSROOT_PREPROCESS_FUNCS += "apr_sysroot_preprocess"
-- 
1.8.1.2


