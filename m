Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4DF3D6CD0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 11:22:45 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9HBMfQb009635 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 12:22:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rNSZdaytFBXA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 12:22:41 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9HBMdG4009612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 12:22:40 +0100
Message-ID: <1382008955.29912.521.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Oct 2013 12:22:35 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] cross-canadian: Handle powerpc linux verses linux-gnuspe
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
X-List-Received-Date: Thu, 17 Oct 2013 11:22:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

PowerPC toolchains can use the OS "linux" or "linux-gnuspe". This
patch links them together so the one cross-canadian toolchain can support
both.

GCC_FOR_TARGET is set for the GCC recipe as otherwise configure
can pick up an incorrect value.

[YOCTO #5354]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 7181c60..c974212 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -15,12 +15,30 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
 #
 PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
+CANADIANEXTRAOS = ""
 python () {
     archs = d.getVar('PACKAGE_ARCHS', True).split()
     sdkarchs = []
     for arch in archs:
         sdkarchs.append(arch + '-${SDKPKGSUFFIX}')
     d.setVar('PACKAGE_ARCHS', " ".join(sdkarchs))
+
+    # PowerPC can build "linux" and "linux-gnuspe"
+    tarch = d.getVar("TARGET_ARCH", True)
+    if tarch == "powerpc":
+        tos = d.getVar("TARGET_OS", True)
+        if (tos != "linux" and tos != "linux-gnuspe"):
+            bb.fatal("Building cross-candian powerpc for an unknown TARGET_SYS (%s), please update cross-canadian.bbclass" % d.getVar("TARGET_SYS", True))
+        # Have to expand DEPENDS before we change the extensions
+        d.setVar("DEPENDS", d.getVar("DEPENDS", True))
+        d.setVar("STAGING_BINDIR_TOOLCHAIN", d.getVar("STAGING_BINDIR_TOOLCHAIN", True))
+        for prefix in ["AR", "AS", "DLLTOOL", "CC", "CXX", "GCC", "LD", "LIPO", "NM", "OBJDUMP", "RANLIB", "STRIP", "WINDRES"]:
+            n = prefix + "_FOR_TARGET"
+            d.setVar(n, d.getVar(n, True))
+
+        d.setVar("LIBCEXTENSION", "")
+        d.setVar("ABIEXTENSION", "")
+        d.setVar("CANADIANEXTRAOS", "linux-gnuspe")
 }
 MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
@@ -100,3 +118,16 @@ TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
 # points to the wrong place so force it
 SHLIBSDIRS = "${PKGDATA_DIR}/nativesdk-shlibs"
 SHLIBSWORKDIR = "${PKGDATA_DIR}/nativesdk-shlibs"
+
+cross_canadian_bindirlinks () {
+	for i in ${CANADIANEXTRAOS}
+	do
+		d=${D}${bindir}/../${TARGET_ARCH}${TARGET_VENDOR}-$i
+		install -d $d
+		for j in `ls ${D}${bindir}`
+		do
+			p=${TARGET_ARCH}${TARGET_VENDOR}-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
+			ln -s ../${TARGET_SYS}/$j $d/$p
+		done
+       done
+}
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 2da9017..81349c0 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -22,6 +22,8 @@ do_install () {
 	rm -f ${D}${libdir}/libiberty*
 	rm -f ${D}${libdir}/libopcodes*
 	rm -f ${D}${includedir}/*.h
+	
+	cross_canadian_bindirlinks
 }
 
 BBCLASSEXTEND = ""
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 9718ecd..136f267 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -29,6 +29,7 @@ export AS_FOR_TARGET = "${TARGET_PREFIX}as"
 export DLLTOOL_FOR_TARGET = "${TARGET_PREFIX}dlltool"
 export CC_FOR_TARGET = "${TARGET_PREFIX}gcc"
 export CXX_FOR_TARGET = "${TARGET_PREFIX}g++"
+export GCC_FOR_TARGET = "${TARGET_PREFIX}gcc"
 export LD_FOR_TARGET = "${TARGET_PREFIX}ld"
 export LIPO_FOR_TARGET = "${TARGET_PREFIX}lipo"
 export NM_FOR_TARGET = "${TARGET_PREFIX}nm"
@@ -69,7 +70,7 @@ EXCLUDE_FROM_SHLIBS = "1"
 PACKAGES = "${PN} ${PN}-doc"
 
 FILES_${PN} = "\
-    ${bindir}/* \
+    ${exec_prefix}/bin/* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/* \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
@@ -138,6 +139,8 @@ do_install () {
 	done
 
 	chown -R root:root ${D}
+	
+	cross_canadian_bindirlinks
 }
 
 ELFUTILS = "nativesdk-elfutils"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 3cb347b..653f52b 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -31,5 +31,6 @@ EOF
 # right bits installed by binutils.
 do_install_append() {
 	rm -rf ${D}${exec_prefix}/lib
+	cross_canadian_bindirlinks
 }
 



