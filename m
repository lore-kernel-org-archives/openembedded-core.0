Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TgrBK-0003HK-S1
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 07:13:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB75weQf025257
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 21:58:40 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 6 Dec 2012 21:58:39 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Dec 2012 13:58:34 +0800
Message-ID: <6bbc3f492de2885c6895ac09756ae9dce4cb5a93.1354840928.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354840928.git.hongxu.jia@windriver.com>
References: <cover.1354840928.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] mkelfimage-native:make failed if libz not in host
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2012 06:13:14 -0000
Content-Type: text/plain

mkelfimage-native finds libz from host dir, not
from the staging directories.

Modify confiugre.ac to let makefile find libz
and zlib.h by CFLAGS and LDFLAGS.

[YOCTO #3547]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../mkelfimage/fix-makefile-to-find-libz.patch     |   30 ++++++++++++++++++++
 meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb |    3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch b/meta/recipes-devtools/mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch
new file mode 100644
index 0000000..756a65c
--- /dev/null
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch
@@ -0,0 +1,30 @@
+Let makefile find libz and zlib.h by CFLAGS and LDFLAGS.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: Pending
+---
+diff --git a/configure.ac b/configure.ac
+index d1acc36..6f865b0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -62,7 +62,7 @@ AC_CHECK_PROG([RPM],   rpm,   rpm,   [], [$PATH])
+ AC_CHECK_PROG([SED],   sed,   sed,   [], [$PATH])
+ AC_CHECK_PROG([FIND],  find,  find,  [], [$PATH])
+ 
+-AC_CHECK_HEADER(zlib.h, AC_CHECK_LIB(z, inflateInit_, [AC_DEFINE(HAVE_ZLIB_H, 1) LIBS="$LIBS -lz"]))
++AC_CHECK_HEADER(zlib.h, AC_CHECK_LIB(z, inflateInit_, [AC_DEFINE(HAVE_ZLIB_H, 1) LIBS="$LIBS $LDFLAGS -lz"]))
+ 
+ dnl Find the default programs
+ if test "with_default" != no ; then
+@@ -175,7 +175,7 @@ fi
+ 
+ dnl ---Output variables...
+ 
+-HOST_CFLAGS="$HOST_CFLAGS -O2 -Wall \$(HOST_CPPFLAGS)"
++HOST_CFLAGS="$HOST_CFLAGS -O2 -Wall \$(HOST_CPPFLAGS) $CFLAGS"
+ 
+ dnl TODO: figure out how to set these appropriately for compilers other than gcc
+ I386_CFLAGS="$I386_CFLAGS -Os -ffreestanding -Wall -W -Wno-format \$(I386_CPPFLAGS)"
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
index ca145ff..b53f7a7 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
@@ -6,12 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
 
 SRCREV = "6637"
 PV = "1.0.0+svn${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "zlib"
 
 SRC_URI = "svn://coreboot.org/coreboot/trunk/util;module=mkelfImage;protocol=svn \
            file://cross-compile.patch \
+           file://fix-makefile-to-find-libz.patch \
           "
 
 S = "${WORKDIR}/mkelfImage"
-- 
1.7.10.4



