Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6C80860B9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 14:48:10 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id x18so3349861lbi.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 06:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GwA50fgLgFuZ91wgYR/uYvE+nJfV9JGN/34fRexdd20=;
	b=dVKUUSL7x/EO4YChLLm8MGxBEpWHZ0eLsHp3wd8uxdW097m2kX5bBfLu0xJvM27Ji8
	JNn2RrQPBF/OuiwmRuCp8RiD1fEBqy21bFQss/k3CfGEt93Z0Y2TDeDpqVrFtTzfKF/A
	V6wz3fbmtBpzbZHfYL7vNqR+2pHRyb/5v3mxpoOlFec+oOJFfsxlL3PTh6SUgUbV9yhu
	LexzyoPIOA2Th22p070qKnk74tzypSYwi8uSr7CS1FP5GwxmFUaM78OFg467ECf9nHiM
	jDg0DsxCUENPFwl/AZMTICVrn1t9DnkDYNkWfuB3XYO7oW3CR/Q7IwKTbRmzH8Q0gaUT
	NrCg==
X-Received: by 10.112.146.134 with SMTP id tc6mr3734866lbb.11.1389365290794;
	Fri, 10 Jan 2014 06:48:10 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id qx1sm3512392lbb.15.2014.01.10.06.48.09
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 Jan 2014 06:48:09 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 3CFB71C64FD; Fri, 10 Jan 2014 15:48:08 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2014 15:48:06 +0100
Message-Id: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Fri, 10 Jan 2014 14:48:10 -0000

The reverted commit seems to introduce some problems for the toolchain tarball
for powerpc.
I see this both in master and on dora.

1. Looks like the relocation scripts fails for environments:

~/tests/poky [master]
$ cat /opt/oel/2014-01-01/environment-setup-ppce500v2-oel-linux | grep "#"
export SDKTARGETSYSROOT=##SDKTARGETSYSROOT##

~/tests/poky [master]
$ cat /opt/oel/2014-01-01/environment-setup-ppce500v2-oel-linux-gnuspe | grep "#"

2. nativeSDK gnuspe compiler does not allow -mabi=spe
ABIEXTENSION is zeroed both for linux-gnuspe and linux

3. Compiler can't create executables.
I think this is due to libgcc_s.so from the SDK target sysroot is in mabi=spe.

4. -mspe is included in CC var for both linux and gnuspe.
cat /opt/oel/2014-01-01/environment-setup-ppce500v2-oel-linux | grep mabi
export CC="powerpc-oel-linux-gcc  -m32 -mcpu=8548 -mabi=spe -mspe ....
export CXX="powerpc-oel-linux-g++  -m32 -mcpu=8548 -mabi=spe -mspe ....
export CPP="powerpc-oel-linux-gcc -E  -m32 -mcpu=8548 -mabi=spe -mspe ....

With the commit reverted, I can successfully build target code with the canadian compiler 
from the SDK tarball. Only the gnuspe environment file is generated.

This reverts commit 11d9127ac57514394f8297f9fdfc7b31e163fcb8.
---
 meta/classes/cross-canadian.bbclass                | 31 ----------------------
 .../binutils/binutils-cross-canadian.inc           |  2 --
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |  5 +---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |  1 -
 4 files changed, 1 insertion(+), 38 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index c974212..7181c60 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -15,30 +15,12 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
 #
 PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
-CANADIANEXTRAOS = ""
 python () {
     archs = d.getVar('PACKAGE_ARCHS', True).split()
     sdkarchs = []
     for arch in archs:
         sdkarchs.append(arch + '-${SDKPKGSUFFIX}')
     d.setVar('PACKAGE_ARCHS', " ".join(sdkarchs))
-
-    # PowerPC can build "linux" and "linux-gnuspe"
-    tarch = d.getVar("TARGET_ARCH", True)
-    if tarch == "powerpc":
-        tos = d.getVar("TARGET_OS", True)
-        if (tos != "linux" and tos != "linux-gnuspe"):
-            bb.fatal("Building cross-candian powerpc for an unknown TARGET_SYS (%s), please update cross-canadian.bbclass" % d.getVar("TARGET_SYS", True))
-        # Have to expand DEPENDS before we change the extensions
-        d.setVar("DEPENDS", d.getVar("DEPENDS", True))
-        d.setVar("STAGING_BINDIR_TOOLCHAIN", d.getVar("STAGING_BINDIR_TOOLCHAIN", True))
-        for prefix in ["AR", "AS", "DLLTOOL", "CC", "CXX", "GCC", "LD", "LIPO", "NM", "OBJDUMP", "RANLIB", "STRIP", "WINDRES"]:
-            n = prefix + "_FOR_TARGET"
-            d.setVar(n, d.getVar(n, True))
-
-        d.setVar("LIBCEXTENSION", "")
-        d.setVar("ABIEXTENSION", "")
-        d.setVar("CANADIANEXTRAOS", "linux-gnuspe")
 }
 MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
@@ -118,16 +100,3 @@ TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
 # points to the wrong place so force it
 SHLIBSDIRS = "${PKGDATA_DIR}/nativesdk-shlibs"
 SHLIBSWORKDIR = "${PKGDATA_DIR}/nativesdk-shlibs"
-
-cross_canadian_bindirlinks () {
-	for i in ${CANADIANEXTRAOS}
-	do
-		d=${D}${bindir}/../${TARGET_ARCH}${TARGET_VENDOR}-$i
-		install -d $d
-		for j in `ls ${D}${bindir}`
-		do
-			p=${TARGET_ARCH}${TARGET_VENDOR}-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
-			ln -s ../${TARGET_SYS}/$j $d/$p
-		done
-       done
-}
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 81349c0..2da9017 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -22,8 +22,6 @@ do_install () {
 	rm -f ${D}${libdir}/libiberty*
 	rm -f ${D}${libdir}/libopcodes*
 	rm -f ${D}${includedir}/*.h
-	
-	cross_canadian_bindirlinks
 }
 
 BBCLASSEXTEND = ""
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 900f1e5..64bb6ba 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -29,7 +29,6 @@ export AS_FOR_TARGET = "${TARGET_PREFIX}as"
 export DLLTOOL_FOR_TARGET = "${TARGET_PREFIX}dlltool"
 export CC_FOR_TARGET = "${TARGET_PREFIX}gcc"
 export CXX_FOR_TARGET = "${TARGET_PREFIX}g++"
-export GCC_FOR_TARGET = "${TARGET_PREFIX}gcc"
 export LD_FOR_TARGET = "${TARGET_PREFIX}ld"
 export LIPO_FOR_TARGET = "${TARGET_PREFIX}lipo"
 export NM_FOR_TARGET = "${TARGET_PREFIX}nm"
@@ -70,7 +69,7 @@ EXCLUDE_FROM_SHLIBS = "1"
 PACKAGES = "${PN} ${PN}-doc"
 
 FILES_${PN} = "\
-    ${exec_prefix}/bin/* \
+    ${bindir}/* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/* \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
@@ -138,8 +137,6 @@ do_install () {
 	done
 
 	chown -R root:root ${D}
-	
-	cross_canadian_bindirlinks
 }
 
 ELFUTILS = "nativesdk-elfutils"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 653f52b..3cb347b 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -31,6 +31,5 @@ EOF
 # right bits installed by binutils.
 do_install_append() {
 	rm -rf ${D}${exec_prefix}/lib
-	cross_canadian_bindirlinks
 }
 
-- 
1.8.3.2


