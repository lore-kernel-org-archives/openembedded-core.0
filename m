Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pv2Qf-0007vZ-JM
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 07:54:29 +0100
Received: by gxk1 with SMTP id 1so286138gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 22:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ZQy6lfo1BlDWzNQ1v9fSgyp/aTnAyJssxRZQm56lM6E=;
	b=dUng4bdTUojjDRgLv4g1vpyjDm+ESODwvyH4Q+cJ7fp8nTK1RaDxSL1em1TRUOjDlj
	oaYM479pVSUxXyTMz4XrBLbyD+8rFTIQ/JFQEpADFgKNRs7Zndn0LYdnm3Do5jycZGdc
	rJqJ/xnElVVnv6+BMyyFhnY91/F0ORCIPNHPA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=O5ygr7RQ+oLKponINvU6oru48E1msGHPfTPuAGgMpAM6WRvQ/r2F6jI+XHHyPqpZxi
	6pInyPUmTjpi1vH+gFTZuBN7ybzt6OYcd2jL6FdFNsFCCAtDHDKHHYw36Ed3xGEC/3rZ
	smKCxyUD8EcRIPGpxxqsaQT6btukJZmREU95A=
Received: by 10.150.219.15 with SMTP id r15mr1313251ybg.302.1299135179951;
	Wed, 02 Mar 2011 22:52:59 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g27sm595767yhc.8.2011.03.02.22.52.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 22:52:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 22:52:44 -0800
Message-Id: <1299135167-18330-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCHv3 3/6] gcc: Statically link in support libraries e.g. libmpfr libgmp etc.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2011 06:54:30 -0000

* This is helpful to get consistent behaviour with gcc on different
  hosts and linking the libraries in for cross gcc recipes should not
  be increasing the binary size alarmingly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    7 +++++++
 meta/recipes-devtools/gcc/gcc-configure-cross.inc  |   10 ++++++++++
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc    |    8 ++++++++
 .../gcc/gcc-cross-canadian_4.3.3.bb                |    2 +-
 .../gcc/gcc-cross-canadian_4.5.1.bb                |    2 +-
 .../gcc/gcc-cross-initial_4.3.3.bb                 |    2 +-
 .../gcc/gcc-cross-initial_4.5.1.bb                 |    2 +-
 .../gcc/gcc-cross-intermediate_4.3.3.bb            |    2 +-
 .../gcc/gcc-cross-intermediate_4.5.1.bb            |    2 +-
 .../gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb   |    2 +-
 meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb       |    2 +-
 meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb       |    2 +-
 .../gcc/gcc-cross_csl-arm-2008q1.bb                |    2 +-
 .../gcc/gcc-crosssdk-initial_4.3.3.bb              |    2 +-
 .../gcc/gcc-crosssdk-initial_4.5.1.bb              |    2 +-
 .../gcc/gcc-crosssdk-intermediate_4.3.3.bb         |    2 +-
 .../gcc/gcc-crosssdk-intermediate_4.5.1.bb         |    2 +-
 meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb    |    2 +-
 meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb     |    2 +-
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb     |    2 +-
 meta/recipes-devtools/gcc/gcc_4.3.3.bb             |    2 +-
 meta/recipes-devtools/gcc/gcc_4.5.1.bb             |    2 +-
 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb    |    2 +-
 meta/recipes-devtools/gcc/libgcc_4.5.1.bb          |    2 +-
 24 files changed, 46 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 4393777..cdb69fb 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -85,6 +85,11 @@ do_configure () {
 	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
 	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
 	export ARCH_FLAGS_FOR_TARGET="${ARCH_FLAGS_FOR_TARGET}"
+
+        # Make sure LDFLAGS are honored.
+        sed -i 's/^LDFLAGS = $/LDFLAGS = @LDFLAGS@/' ${S}/Makefile.in
+        sed -i 's/^LDFLAGS = $/LDFLAGS = @LDFLAGS@/' ${S}/Makefile.tpl
+
 	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
 	
 	# teach gcc to find correct target includedir when checking libc ssp support
@@ -108,5 +113,7 @@ do_configure () {
 	echo "#endif /* ! GCC_DEFAULTS_H */" >> ${S}/gcc/defaults.h.new
 	mv ${S}/gcc/defaults.h.new ${S}/gcc/defaults.h
 	oe_runconf
+        # make sure that no @LDFLAG@ is left in the generated Makefile
+        sed -i "s/@LDFLAGS@//g" ${B}/Makefile
 }
 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
index 346d164..200cbe2 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
@@ -16,6 +16,16 @@ do_compile_prepend () {
 	export LD_FOR_TARGET="${TARGET_SYS}-ld"
 	export NM_FOR_TARGET="${TARGET_SYS}-nm"
 	export CC_FOR_TARGET="${CCACHE} ${TARGET_SYS}-gcc ${TARGET_CC_ARCH}"
+	export OBJDUMP_FOR_TARGET="${TARGET_SYS}-objdump"
+	export OBJCOPY_FOR_TARGET="${TARGET_SYS}-objcopy"
+	export STRIP_FOR_TARGET="${TARGET_SYS}-strip"
+	# Make sure we use GMP/MPFR statically
+	sed -i 's/^\(HOST_GMPLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
+	sed -i 's/^\(HOST_GMPLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
+	sed -i 's/^\(HOST_PPLLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
+	sed -i 's/^\(HOST_PPLLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
+	sed -i 's/^\(HOST_LIBELFLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
+	sed -i 's/^\(HOST_LIBELFLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
 }
 
 LIBGCCS_VAR = "-lgcc_s"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
index 756e74e..3eb8992 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
@@ -39,6 +39,14 @@ do_configure () {
 	export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
 	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
 	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
+	export CC_FOR_TARGET="${CCACHE} ${TARGET_SYS}-gcc ${TARGET_CC_ARCH}"
+	# Make sure we use GMP/MPFR statically 
+	sed -i 's/^\(HOST_GMPLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
+	sed -i 's/^\(HOST_GMPLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
+	sed -i 's/^\(HOST_PPLLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl 
+	sed -i 's/^\(HOST_PPLLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
+	sed -i 's/^\(HOST_LIBELFLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
+	sed -i 's/^\(HOST_LIBELFLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
 	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
 	oe_runconf
 }
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb
index d420f80..8bf07d7 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb
@@ -5,7 +5,7 @@ require gcc-cross-canadian.inc
 require gcc-configure-sdk.inc
 require gcc-package-sdk.inc
 
-PR = "r20"
+PR = "r21"
 
 DEPENDS += "gmp-nativesdk mpfr-nativesdk"
 RDEPENDS_${PN} += "mpfr-nativesdk"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb
index 3eea4bc..92708d4 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb
@@ -5,7 +5,7 @@ require gcc-cross-canadian.inc
 require gcc-configure-sdk.inc
 require gcc-package-sdk.inc
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS += "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
 RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb
index 28ac1ab..ef52845 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb
@@ -1,5 +1,5 @@
 require gcc-cross_${PV}.bb
 require gcc-cross-initial.inc
 
-PR = "r5"
+PR = "r6"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb
index b2c257d..38e0964 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb
@@ -1,5 +1,5 @@
 require gcc-cross_${PV}.bb
 require gcc-cross-initial.inc
 
-PR = "r2"
+PR = "r3"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb
index a8473b0..deeee37 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb
@@ -1,4 +1,4 @@
 require gcc-cross_${PV}.bb
 require gcc-cross-intermediate.inc
-PR = "r5"
+PR = "r6"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb
index e65d5df..9a30cb5 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb
@@ -1,4 +1,4 @@
 require gcc-cross_${PV}.bb
 require gcc-cross-intermediate.inc
-PR = "r3"
+PR = "r4"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb b/meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb
index 88e3842..462104f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb
@@ -9,7 +9,7 @@ require gcc-cross-kernel.inc
 
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI += "file://gcc-3.4.4-makefile-fix.patch;patch=1"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb b/meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb
index 5eaac5f..1a982f5 100644
--- a/meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb
@@ -1,4 +1,4 @@
-PR = "r17"
+PR = "r18"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
diff --git a/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb
index 399cdf9..78bb05a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb
@@ -1,4 +1,4 @@
-PR = "r2"
+PR = "r3"
 
 require gcc-${PV}.inc
 require gcc-cross4.inc
diff --git a/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb b/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
index 89534f1..0e7a1ee 100644
--- a/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
@@ -1,4 +1,4 @@
-PR = "r5"
+PR = "r6"
 
 require gcc-csl-arm-2008q1.inc
 require gcc-cross4.inc
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb
index b42de47..d3ddcb1 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb
@@ -1,3 +1,3 @@
 require gcc-cross-initial_${PV}.bb
 require gcc-crosssdk-initial.inc
-PR = "r6"
+PR = "r7"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb
index 240caf5..fec53b9 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb
@@ -1,4 +1,4 @@
 require gcc-cross-initial_${PV}.bb
 require gcc-crosssdk-initial.inc
 
-PR = "r2"
+PR = "r3"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb
index cd1f966..2be05f1 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb
@@ -1,3 +1,3 @@
 require gcc-cross-intermediate_${PV}.bb
 require gcc-crosssdk-intermediate.inc
-PR = "r8"
+PR = "r9"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb
index a6653dd..161d870 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb
@@ -1,4 +1,4 @@
 require gcc-cross-intermediate_${PV}.bb
 require gcc-crosssdk-intermediate.inc
 
-PR = "r2"
+PR = "r3"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb
index 129e8d3..7069088 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb
@@ -1,4 +1,4 @@
 require gcc-cross_${PV}.bb
 require gcc-crosssdk.inc
 
-PR = "r2"
+PR = "r3"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb
index 99f927a..2f5cfb5 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb
@@ -1,4 +1,4 @@
-PR = "r18"
+PR = "r19"
 
 require gcc-${PV}.inc
 require gcc-configure-runtime.inc
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
index 093f9bf..c1e680d 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
@@ -1,4 +1,4 @@
-PR = "r2"
+PR = "r3"
 
 require gcc-${PV}.inc
 require gcc-configure-runtime.inc
diff --git a/meta/recipes-devtools/gcc/gcc_4.3.3.bb b/meta/recipes-devtools/gcc/gcc_4.3.3.bb
index f0471d4..ba6e7b2 100644
--- a/meta/recipes-devtools/gcc/gcc_4.3.3.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.3.3.bb
@@ -1,4 +1,4 @@
-PR = "r11"
+PR = "r12"
 
 require gcc-${PV}.inc
 require gcc-configure-target.inc
diff --git a/meta/recipes-devtools/gcc/gcc_4.5.1.bb b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
index 919d4b0..25e455c 100644
--- a/meta/recipes-devtools/gcc/gcc_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
@@ -1,4 +1,4 @@
-PR = "r2"
+PR = "r3"
 require gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
diff --git a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
index cc7540a..2df12ef 100644
--- a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
+++ b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
@@ -1,4 +1,4 @@
-PR = "r3"
+PR = "r4"
 
 require gcc-${PV}.inc
 require gcc-configure-target.inc
diff --git a/meta/recipes-devtools/gcc/libgcc_4.5.1.bb b/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
index b6cf268..3f7ce0a 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
@@ -1,6 +1,6 @@
 require gcc-${PV}.inc
 
-PR = "r0"
+PR = "r1"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
-- 
1.7.4.1



