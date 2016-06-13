Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 050B66FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:16:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5D9Go7l004400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Jun 2016 02:16:50 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 13 Jun 2016 02:16:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 05:16:32 -0400
Message-ID: <9a9556850084b86785dbcd0efc066412cf64cc3f.1465808701.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465808701.git.hongxu.jia@windriver.com>
References: <cover.1465808701.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] libxml2: upgrade to 2.9.4
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
X-List-Received-Date: Mon, 13 Jun 2016 09:16:52 -0000
Content-Type: text/plain

- Drop configure.ac-fix-cross-compiling-warning.patch,
  libxml2 2.9.4 has fixed it

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../configure.ac-fix-cross-compiling-warning.patch | 45 ----------------------
 .../libxml/{libxml2_2.9.3.bb => libxml2_2.9.4.bb}  |  5 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/configure.ac-fix-cross-compiling-warning.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.3.bb => libxml2_2.9.4.bb} (93%)

diff --git a/meta/recipes-core/libxml/libxml2/configure.ac-fix-cross-compiling-warning.patch b/meta/recipes-core/libxml/libxml2/configure.ac-fix-cross-compiling-warning.patch
deleted file mode 100644
index 2f8079b..0000000
--- a/meta/recipes-core/libxml/libxml2/configure.ac-fix-cross-compiling-warning.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-configure.ac: fix cross compiling warning
-
-There is a warning while cross compiling which triggered a
-failure by do_qa_configure
-...
-|configure:12652: checking for gzread in -lz
-|configure:12677: mips-poky-linux-gcc  -meb -mabi=32 -mhard-float
- -L/lib conftest.c -lz   >&5
-|ld: warning: library search path "/lib" is unsafe for cross-compilation
-...
-
-While do the lib checking, do not add '-L${Z_DIR}/lib' to LDFLAGS could fix it.
-
-Upstream-Status: Inappropriate [oe specific]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9a90600..0bac8a4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -391,8 +391,6 @@ if test "$with_zlib" = "no"; then
-     echo "Disabling compression support"
- else
-     AC_CHECK_HEADERS(zlib.h,
--        [SAVE_LDFLAGS="${LDFLAGS}"
--	 LDFLAGS="-L${Z_DIR}/lib"
- 	AC_CHECK_LIB(z, gzread,[
- 	    AC_DEFINE([HAVE_LIBZ], [1], [Have compression library])
- 	    WITH_ZLIB=1
-@@ -406,8 +404,7 @@ else
- 		esac]
- 	    else
- 		Z_LIBS="-lz"
--	    fi])
--	 LDFLAGS="${SAVE_LDFLAGS}"])
-+	    fi]))
- fi
- 
- AC_SUBST(Z_CFLAGS)
--- 
-1.9.1
-
diff --git a/meta/recipes-core/libxml/libxml2_2.9.3.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
similarity index 93%
rename from meta/recipes-core/libxml/libxml2_2.9.3.bb
rename to meta/recipes-core/libxml/libxml2_2.9.4.bb
index ae65159..5ff508a 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -19,11 +19,10 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://run-ptest \
            file://python-sitepackages-dir.patch \
            file://libxml-m4-use-pkgconfig.patch \
-           file://configure.ac-fix-cross-compiling-warning.patch \
           "
 
-SRC_URI[libtar.md5sum] = "daece17e045f1c107610e137ab50c179"
-SRC_URI[libtar.sha256sum] = "4de9e31f46b44d34871c22f54bfc54398ef124d6f7cafb1f4a5958fbcd3ba12d"
+SRC_URI[libtar.md5sum] = "ae249165c173b1ff386ee8ad676815f5"
+SRC_URI[libtar.sha256sum] = "ffb911191e509b966deb55de705387f14156e1a56b21824357cdf0053233633c"
 SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
-- 
2.8.1


