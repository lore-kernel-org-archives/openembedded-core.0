Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E69E77040
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:54:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1J5sqBr018673
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Feb 2016 21:54:52 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Feb 2016 21:54:51 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 19 Feb 2016 00:54:40 -0500
Message-ID: <25bc47f01e96536a72c1995fce27bab1845f7331.1455860789.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455860789.git.hongxu.jia@windriver.com>
References: <cover.1455860789.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] gcc: use relative path for configure script
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
X-List-Received-Date: Fri, 19 Feb 2016 05:54:53 -0000
Content-Type: text/plain

The absolute path (/path/to/configure) caused __FILE__ to be
an absolute path.

If 'assert' invoked, it uses __FILE__, and build path would be in elf files.
In assert.h
...
.# define assert(expr)                                                   \
  ((expr)                                                               \
   ? __ASSERT_VOID_CAST (0)                                             \
   : __assert_fail (__STRING(expr), __FILE__, __LINE__, __ASSERT_FUNCTION))
...

Which triggered buildpaths QA issue:
...
| libgcc-5.3.0: File work/core2-64-poky-linux/libgcc/5.3.0-r0/packages-split/
libgcc-dev/usr/lib64/x86_64-poky-linux/5.3.0/libgcc.a in package contained
reference to tmpdir [buildpaths]
...

Use relative path to run configure can fix the problem.

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc    | 3 ++-
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 3 ++-
 meta/recipes-devtools/gcc/libgcc-common.inc  | 3 ++-
 meta/recipes-devtools/gcc/libgfortran.inc    | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index f20d298..844149f 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -29,7 +29,8 @@ do_configure () {
 		mkdir -p ${B}/$target/$d/
 		cd ${B}/$target/$d/
 		chmod a+x ${S}/$d/configure
-		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+		relpath=${@os.path.relpath("${S}/$d", "${B}/$target/$d")}
+		$relpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
 	done
 }
 
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 03627ff..6091a0b 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -23,7 +23,8 @@ do_configure () {
     mkdir -p ${B}/$target/libsanitizer/
     cd ${B}/$target/libsanitizer/
     chmod a+x ${S}/libsanitizer/configure
-    ${S}/libsanitizer/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+    relpath=${@os.path.relpath("${S}/libsanitizer", "${B}/$target/libsanitizer")}
+    $relpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
     # Easiest way to stop bad RPATHs getting into the library since we have a
     # broken libtool here
     sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${B}/$target/libsanitizer/libtool
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index b09ea65..dae07e9 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -12,7 +12,8 @@ do_configure () {
 	mkdir -p ${B}/$target/${BPN}/
 	cd ${B}/${BPN}
 	chmod a+x ${S}/${BPN}/configure
-	${S}/${BPN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+	relpath=${@os.path.relpath("${S}/${BPN}", "${B}/${BPN}")}
+	$relpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
 }
 
 do_compile () {
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index e42843d..58ceb2e 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -15,7 +15,8 @@ do_configure () {
 	mkdir -p ${B}/$target/libgfortran/
 	cd ${B}/$target/libgfortran/
 	chmod a+x ${S}/libgfortran/configure
-	${S}/libgfortran/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+	relpath=${@os.path.relpath("${S}/libgfortran", "${B}/$target/libgfortran")}
+	$relpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
 	# Easiest way to stop bad RPATHs getting into the library since we have a
 	# broken libtool here
 	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${B}/$target/libgfortran/libtool
-- 
1.9.1


