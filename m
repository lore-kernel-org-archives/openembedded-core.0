Return-Path: <seebs@msp-lpggp2.wrs.com>
Received: from msp-lpggp2.wrs.com (unknown [206.144.70.9])
	by mail.openembedded.org (Postfix) with ESMTP id 4F26D6D03D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 20:05:32 +0000 (UTC)
Received: by msp-lpggp2.wrs.com (Postfix, from userid 508)
	id 78DFDA024DD; Thu, 10 Oct 2013 15:06:13 -0500 (CDT)
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Oct 2013 15:06:12 -0500
Message-Id: <39db0404f3ac0a473e7d34ea6b2f548ae4c97b50.1381435139.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1381435139.git.peter.seebach@windriver.com>
References: <cover.1381435139.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1381435139.git.peter.seebach@windriver.com>
References: <cover.1381435139.git.peter.seebach@windriver.com>
Subject: [PATCH 1/2] Use alternatives for the binutils-symlinks package.
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
X-List-Received-Date: Thu, 10 Oct 2013 20:05:32 -0000

The ar and strings utilities are provided as alternatives, but
the rest of binutils is being done with binutils-symlinks. This
has the side effect that if you want "as", and you install
binutils-symlinks to get it, you don't get "ar" from it, because
it's not in the symlinks package.

Solution: Use the same mechanisms for everything, putting
everything in ALTERNATIVES, so installing binutils on a target
produces the expected behavior of having the various utilities in place.

Issues: The "embedspu" and "ld.gold" binaries may or may not exist,
but the determination of whether to list them as alternatives is
being made before the point at which we can easily check for them,
so that can produce warnings.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/binutils/binutils.inc |   69 +++++++++++++++++----------
 1 files changed, 43 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 5e78dc0..1c7ffcf 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -22,31 +22,51 @@ FILES_${PN} = " \
 	${libdir}/lib*-*.so \
 	${prefix}/${TARGET_SYS}/bin/*"
 
+# Use alternatives rather than actual symlinks.
+FILES_${PN}-symlinks = ""
+
+ALLOW_EMPTY_${PN}-symlinks = "1"
+
 FILES_${PN}-dev = " \
 	${includedir} \
 	${libdir}/*.la \
 	${libdir}/libbfd.so \
 	${libdir}/libopcodes.so"
 
-FILES_${PN}-symlinks = " \
-	${bindir}/addr2line \
-	${bindir}/as \
-	${bindir}/c++filt \
-	${bindir}/embedspu \
-	${bindir}/gprof \
-	${bindir}/ld \
-	${bindir}/ld.bfd \
-	${bindir}/ld.gold \
-	${bindir}/nm \
-	${bindir}/objcopy \
-	${bindir}/objdump \
-	${bindir}/ranlib \
-	${bindir}/readelf \
-	${bindir}/elfedit \
-	${bindir}/size \
-	${bindir}/strip"
-
-FILES_${PN}-dbg += "${prefix}/${TARGET_SYS}/bin/.debug"
+# Rather than duplicating multiple entries for these, make one
+# list and reuse it.
+
+USE_ALTERNATIVES_FOR = " \
+	addr2line \
+	ar \
+	as \
+	c++filt \
+	elfedit \
+	embedspu \
+	gprof \
+	ld \
+	ld.bfd \
+	ld.gold \
+	nm \
+	objcopy \
+	objdump \
+	ranlib \
+	readelf \
+	size \
+	strings \
+	strip \
+"
+
+python do_package_prepend() {
+    make_alts = d.getVar("USE_ALTERNATIVES_FOR", True) or ""
+    prefix = d.getVar("TARGET_PREFIX", True)
+    bindir = d.getVar("bindir", True)
+    for alt in make_alts.split():
+        d.setVarFlag('ALTERNATIVE_TARGET', alt, bindir + "/" + prefix + alt)
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt, bindir + "/" + alt)
+}
+
+# FILES_${PN}-dbg = "${prefix}/${TARGET_SYS}/bin/.debug ${prefix}/${libdir}/.debug"
 
 B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
@@ -120,7 +140,9 @@ do_install () {
 		ln -sf $p `echo $p | sed -e s,${TARGET_PREFIX},,`
 	done
 
-	rm -f ${D}${bindir}/ar ${D}${bindir}/strings
+        for alt in ${USE_ALTERNATIVES_FOR}; do
+                rm -f ${D}${bindir}/$alt
+        done
 
 	oe_multilib_header bfd.h
 }
@@ -129,10 +151,5 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_${PN}-symlinks = "ar strings"
-
-ALTERNATIVE_LINK_NAME[ar] = "${bindir}/ar"
-ALTERNATIVE_TARGET[ar] = "${bindir}/${TARGET_PREFIX}ar"
+ALTERNATIVE_${PN}-symlinks = "${USE_ALTERNATIVES_FOR}"
 
-ALTERNATIVE_LINK_NAME[strings] = "${bindir}/strings"
-ALTERNATIVE_TARGET[strings] = "${bindir}/${TARGET_PREFIX}strings"
-- 
1.7.1


