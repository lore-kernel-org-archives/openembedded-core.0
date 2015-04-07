Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 620FC73D15
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:24:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t37BOXQM025061
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 04:24:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 04:24:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 04:24:27 -0700
Message-ID: <b1d1f8a5b950d1e9cec429e31e6c4d6c82ab58ae.1428405830.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428405830.git.liezhi.yang@windriver.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] socat: 1.7.2.4 -> 1.7.3.0
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
X-List-Received-Date: Tue, 07 Apr 2015 11:24:32 -0000
Content-Type: text/plain

Removed fix-cross-compiling-failed.patch and
socat-1.7.2.4-linux-3.17.patch since upstream has fixed them.

Updated README's LIC_FILES_CHKSUM, there is a word changed (GPL ->
GPLv2, it should be GPLv2 as COPYING shows), its license is already
"GPL-2.0+-with-OpenSSL-exception", so we just update the md5 is OK.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../socat/socat/fix-cross-compiling-failed.patch   |   36 --------------------
 .../socat/socat/socat-1.7.2.4-linux-3.17.patch     |   29 ----------------
 .../socat/{socat_1.7.2.4.bb => socat_1.7.3.0.bb}   |    8 ++---
 3 files changed, 3 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
 delete mode 100644 meta/recipes-connectivity/socat/socat/socat-1.7.2.4-linux-3.17.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.2.4.bb => socat_1.7.3.0.bb} (78%)

diff --git a/meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch b/meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
deleted file mode 100644
index b9d3ca3..0000000
--- a/meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fix build during cross-compilation as it fails to detect that our prefixed
-compiler is gcc, and falls back to executing code to determine type sizes:
-
-| configure: using code run method to find basic types
-| checking for equivalent simple type of size_t...
-| configure: error: in `/data/poky-master/tmp/work/core2-32-poky-linux/socat/1.7.2.4-r0/build':
-| configure: error: cannot run test program while cross compiling
-
-This is caused by configure.in assuming that $CC can be literally compared with
-"gcc" to determine if the compiler is GCC.  Our gcc is host-prefixed so this
-test fails, however autoconf provides $GCC for this purpose (which was used up
-to 1.7.2.3).
-
-Upstream-Status: Submitted (via email)
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
---- a/configure.in
-+++ b/configure.in
-@@ -41,7 +41,7 @@ AC_CHECK_PROG(AR, ar, ar, gar)
- # fail
- AC_LANG_COMPILER_REQUIRE()
- 
--if test "$CC" = "gcc"; then
-+if test "$GCC" = yes; then
-    CFLAGS="$CFLAGS -D_GNU_SOURCE -Wall -Wno-parentheses"
-    ERRONWARN="-Werror -O0"
- elif test "$CC" = "clang"; then
--- 
-1.8.1.2
-
diff --git a/meta/recipes-connectivity/socat/socat/socat-1.7.2.4-linux-3.17.patch b/meta/recipes-connectivity/socat/socat/socat-1.7.2.4-linux-3.17.patch
deleted file mode 100644
index 9152df5..0000000
--- a/meta/recipes-connectivity/socat/socat/socat-1.7.2.4-linux-3.17.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-socat: fix compile erorr against 3.17+ kernel headers
-
-With the linux 3.17 kernel socat's configure detects the wrong include for errqueue.h
-which results in a compilation error.
-
-By backporting the gentoo patch from:
-
-  http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-misc/socat/files/socat-1.7.2.4-linux-3.17.patch
-
-Fixes the build issue
-
-Upstream-status: backport
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
---- a/configure.in
-+++ b/configure.in
-@@ -80,7 +80,10 @@
- AC_CHECK_HEADERS(termios.h linux/if_tun.h)
- AC_CHECK_HEADERS(net/if_dl.h)
- AC_CHECK_HEADERS(linux/types.h)
--AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H), [], [#include <linux/types.h>])
-+AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H), [], [AC_INCLUDES_DEFAULT
-+	#if HAVE_LINUX_TYPES_H
-+	#include <linux/types.h>
-+	#endif])
- AC_CHECK_HEADERS(sys/utsname.h sys/select.h sys/file.h)
- AC_CHECK_HEADERS(util.h bsd/libutil.h libutil.h sys/stropts.h regex.h)
- AC_CHECK_HEADERS(linux/fs.h linux/ext2_fs.h)
diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb b/meta/recipes-connectivity/socat/socat_1.7.3.0.bb
similarity index 78%
rename from meta/recipes-connectivity/socat/socat_1.7.2.4.bb
rename to meta/recipes-connectivity/socat/socat_1.7.3.0.bb
index 9e43e16..8923f41 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.0.bb
@@ -9,16 +9,14 @@ DEPENDS = "openssl readline"
 
 LICENSE = "GPL-2.0+-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=257;endline=287;md5=79246f11a1db0b6ccec54d1fb711c01e"
+                    file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
 
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
-           file://fix-cross-compiling-failed.patch \
-           file://socat-1.7.2.4-linux-3.17.patch \
 "
 
-SRC_URI[md5sum] = "69b8155dd442a6f24e28ef5407d868eb"
-SRC_URI[sha256sum] = "4b7739901c6fad1e460f3e5b1868fb4c2a1427febbba7a510cd2e42fd4941e09"
+SRC_URI[md5sum] = "b607edb65bc6c57f4a43f06247504274"
+SRC_URI[sha256sum] = "0767e850c0329b9fdf711c6cd468565cbbb28786ba1a8a1cbd5531d4016b3e04"
 
 inherit autotools
 
-- 
1.7.9.5


