Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 53A4078259
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 11:53:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBJBr5jH009649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 19 Dec 2017 11:53:06 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eRGSH-0004I6-PI; Tue, 19 Dec 2017 11:53:05 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 11:53:02 +0000
Message-Id: <1513684384-16452-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/3] libgfortran: Fix breakage from libbacktrace dependency
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
X-List-Received-Date: Tue, 19 Dec 2017 11:53:07 -0000

In 6.x and 7.x gcc, libgfortran now needs libbacktrace. Enable building of this
so that libgfortran builds correctly.

[YOCTO #12394]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 5f5d4af..99c192a 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -6,22 +6,28 @@ EXTRA_OECONF_PATHS = "\
 "
 
 do_configure () {
-	rm -rf ${B}/${TARGET_SYS}/libgfortran/
-	mkdir -p ${B}/${TARGET_SYS}/libgfortran/
-	cd ${B}/${TARGET_SYS}/libgfortran/
-	chmod a+x ${S}/libgfortran/configure
-	relpath=${@os.path.relpath("${S}/libgfortran", "${B}/${TARGET_SYS}/libgfortran")}
-	$relpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
-	# Easiest way to stop bad RPATHs getting into the library since we have a
-	# broken libtool here
-	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${B}/${TARGET_SYS}/libgfortran/libtool
+	for target in libbacktrace libgfortran
+	do
+		rm -rf ${B}/${TARGET_SYS}/$target/
+		mkdir -p ${B}/${TARGET_SYS}/$target/
+		cd ${B}/${TARGET_SYS}/$target/
+		chmod a+x ${S}/$target/configure
+		relpath=${@os.path.relpath("${S}", "${B}/${TARGET_SYS}")}
+		../$relpath/$target/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+		# Easiest way to stop bad RPATHs getting into the library since we have a
+		# broken libtool here
+		sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${B}/${TARGET_SYS}/$target/libtool
+	done
 }
 EXTRACONFFUNCS += "extract_stashed_builddir"
 do_configure[depends] += "${COMPILERDEP}"
 
 do_compile () {
-	cd ${B}/${TARGET_SYS}/libgfortran/
-	oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/libgfortran/
+	for target in libbacktrace libgfortran
+	do
+		cd ${B}/${TARGET_SYS}/$target/
+		oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/$target/
+	done
 }
 
 do_install () {
-- 
2.7.4


