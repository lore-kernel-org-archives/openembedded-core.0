Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68009787D9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Dec 2017 16:47:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB9Glk7q003363
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 9 Dec 2017 08:47:46 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sat, 9 Dec 2017 08:47:46 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Dec 2017 08:47:46 -0800
Message-ID: <20171209164746.51117-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] libgfortran: Work around libbacktrace build failures
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
X-List-Received-Date: Sat, 09 Dec 2017 16:47:46 -0000
Content-Type: text/plain

While it is not clear how to depend on the libbacktrace in such a way
that it will be in the sysroot for a build, it is possible to generate
the library and header on the fly which will have the same c linkage
to the shared object as the one provided internally with gcc by asking
it to build at the time libgfortran is building.

The build of libgfortran fails as follows when fortran is enabled in
the local.conf with:

   FORTRAN_forcevariable = ",fortran"

Error text:

  libtool: compile: x86_64-wrs-linux-gcc -m64 -march=core2 -mtune=core2
  -msse3 -mfpmath=sse
  --sysroot=/opt/build/libgfortran/7.2.0-r0/recipe-sysroot
  -DHAVE_CONFIG_H
  -I. -I../../../../../../../../work-shared/gcc-7.2.0-r0/gcc-7.2.0/libgfortran
  -iquote../../../../../../../../work-shared/gcc-7.2.0-r0/gcc-7.2.0/libgfortran/io
  -I../../../../../../../../work-shared/gcc-7.2.0-r0/gcc-7.2.0/libgfortran/../gcc
  -I../../../../../../../../work-shared/gcc-7.2.0-r0/gcc-7.2.0/libgfortran/../gcc/config
  -I/opt/build/libgfortran/7.2.0-r0/gcc-7.2.0/build.x86_64-wrs-linux.x86_64-wrs-linux/x86_64-wrs-linux/libgfortran/../.././gcc
  -I../../../../../../../../work-shared/gcc-7.2.0-r0/gcc-7.2.0/libgfortran/../libgcc
  -I/opt/build/libgfortran/7.2.0-r0/gcc-7.2.0/build.x86_64-wrs-linux.x86_64-wrs-linux/x86_64-wrs-linux/libgfortran/../libgcc
  -I../../../../../../../../work-shared/gcc-7.2.0-r0/gcc-7.2.0/libgfortran/../libbacktrace
  -I/opt/build/libgfortran/7.2.0-r0/gcc-7.2.0/build.x86_64-wrs-linux.x86_64-wrs-linux/x86_64-wrs-linux/libgfortran/../libbacktrace
  -I../libbacktrace -std=gnu11 -Wall -Wstrict-prototypes
  -Wmissing-prototypes -Wold-style-definition -Wextra -Wwrite-strings
  -Werror=implicit-function-declaration -Werror=vla -fcx-fortran-rules
  -ffunction-sections -fdata-sections -std=gnu11 -O2 -pipe -g
  -Wunknown-pragmas -c
  ../../../../../../../../work-shared/gcc-7.2.0-r0/gcc-7.2.0/libgfortran/runtime/backtrace.c
  -fPIC -DPIC -o .libs/backtrace.o
  ../../../../../../../../work-shared/gcc-7.2.0-r0/gcc-7.2.0/libgfortran/runtime/backtrace.c:36:10:
  fatal error: backtrace-supported.h: No such file or directory #include
  "backtrace-supported.h"

This problem was also reported here over a year ago:
https://lists.yoctoproject.org/pipermail/yocto/2016-November/033228.html

Using this patch I was able to build fortan and use it to build a
working version of Atlas on the target system.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 5f5d4af758..2f806e12e0 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -15,6 +15,13 @@ do_configure () {
 	# Easiest way to stop bad RPATHs getting into the library since we have a
 	# broken libtool here
 	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${B}/${TARGET_SYS}/libgfortran/libtool
+	# Setup libbacktrace and build it because it is needed for the compile phase
+	# This is a work around for the proper libbacktrace integration for fortran
+	mkdir -p ${B}/${TARGET_SYS}/libbacktrace
+	cd ${B}/${TARGET_SYS}/libbacktrace
+	btrelpath=${@os.path.relpath("${S}/libbacktrace", "${B}/${TARGET_SYS}/libbacktrace")}
+	$btrelpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+	oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/libbacktrace/
 }
 EXTRACONFFUNCS += "extract_stashed_builddir"
 do_configure[depends] += "${COMPILERDEP}"
-- 
2.11.0


