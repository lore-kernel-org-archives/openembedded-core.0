X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Andrei Gherzan" <andrei@gherzan.com>
Subject: [PATCH] gcc: Fix tm.h plugin header
Date: Thu,  9 Dec 2021 16:40:06 +0100
Message-Id: <20211209154006.2323679-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com, Andrei Gherzan <andrei.gherzan@huawei.com>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bernhard.rosenkraenzer.ext@huawei.com>

From: Andrei Gherzan <andrei.gherzan@huawei.com>

On x86-64, tm.h (needed to build gcc plugins) tries to include
config/i386/linux64.h, which isn't installed. Fortunately it also isn't
used, so simply removing the include statement is an ok fix.

Signed-off-by: Bernhard Rosenkränzer <bernhard.rosenkraenzer.ext@huawei.com>
Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 3 +++
 meta/recipes-devtools/gcc/gcc-cross.inc          | 3 +++
 meta/recipes-devtools/gcc/gcc-target.inc         | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 495dd9070b..a64fcc50ce 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -139,6 +139,9 @@ do_install () {
 	cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 	cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 
+	# Fix a plugin header including a nonexistant (and unnecessary) header
+	sed -i -e '/config\/i386\/linux64\.h/d' ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/tm.h
+
 	# install LTO linker plugins where binutils tools can find it
 	install -d ${D}${libdir}/bfd-plugins
 	ln -sf ${LIBRELPATH}/liblto_plugin.so ${D}${libdir}/bfd-plugins/liblto_plugin.so
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 3ffa1f0c46..ac34d5116a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -119,6 +119,9 @@ do_install () {
 	cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 	cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 
+	# Fix a plugin header including a nonexistant (and unnecessary) header
+	sed -i -e '/config\/i386\/linux64\.h/d' ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/tm.h
+
 	find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
 
 	# install LTO linker plugins where binutils tools can find it
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index bf55e692e6..4d087c5183 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -187,6 +187,9 @@ do_install () {
 	rm -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/auto-build.h
 	rm -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/bconfig.h
 
+	# Fix a plugin header including a nonexistant (and unnecessary) header
+	sed -i -e '/config\/i386\/linux64\.h/d' ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/tm.h
+
 	cd ${D}${bindir}
 
 	# We care about g++ not c++
-- 
2.25.1

