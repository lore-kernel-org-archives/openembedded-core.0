Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D20772BEF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jan 2015 13:01:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0HD1VqP011869
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jan 2015 05:01:32 -0800 (PST)
Received: from otp-ovpserver-d1.corp.ad.wrs.com (128.224.124.67) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sat, 17 Jan 2015 05:01:31 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 17 Jan 2015 15:01:29 +0200
Message-ID: <1421499689-4863-1-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [PATCH v2] gcc-runtime: Remove libgfortran data from receipe
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
X-List-Received-Date: Sat, 17 Jan 2015 13:01:40 -0000
Content-Type: text/plain

Remove libgfortran packages from PACKAGES list as long as libgfortran
has separate receipe since commit

5bde5d9b39ea67f19a1a6aedd0c08c6cfedcbe5f
gcc: Allow fortran to build successfully in 4.8

Otherwise, when fortran support will be enabled in the compiler, both
lingfortran and gcc-runtime receipes will create the same files and will
try to install them. This will cause errors:

ERROR: The recipe libgfortran is trying to install files into a shared
area when those files already exist. Those files and their manifest
location are: ...
Please verify which recipe should provide the above files.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 167869e..5c369f4 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -76,9 +76,6 @@ PACKAGES = "\
     libssp \
     libssp-dev \
     libssp-staticdev \
-    libgfortran \
-    libgfortran-dev \
-    libgfortran-staticdev \
     libmudflap \
     libmudflap-dev \
     libmudflap-staticdev \
@@ -131,18 +128,6 @@ FILES_libssp-dev = "\
 "
 FILES_libssp-staticdev = "${libdir}/libssp*.a"
 
-FILES_libgfortran = "${libdir}/libgfortran.so.*"
-FILES_libgfortran-dev = "\
-    ${libdir}/libgfortran*.so \
-    ${libdir}/libgfortran.spec \
-    ${libdir}/libgfortran.la \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
-"
-FILES_libgfortran-staticdev = "${libdir}/libgfortran.a"
-
-INSANE_SKIP_${MLPREFIX}libgfortran-dev = "staticdev"
-
 FILES_libquadmath = "${libdir}/libquadmath*.so.*"
 FILES_libquadmath-dev = "\
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
-- 
1.8.1.4


