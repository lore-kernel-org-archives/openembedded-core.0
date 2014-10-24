Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5792860233
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 14:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9OE9s3R027001 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:09:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 10mGa8ZUts7n
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:09:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9OE9on6026994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:09:51 +0100
Message-ID: <1414159825.30118.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Oct 2014 15:10:25 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] gcc: poison default sysroot path
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
X-List-Received-Date: Fri, 24 Oct 2014 14:10:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Various pieces of the code assume that the --sysroot option gets passed
into the compiler tools. By having a "sane" default, we don't always
spot when this occurs and this can later show up as breakage in sstate,
or in usage of the external toolchain.

We've long since talked about poisoning the default such that it will
break unless the correct option is specified. This patch does just that.

If this patch causes something to fail to build, it most likely means
the various compiler flags and commands are not correctly being passed
through to the underlying piece of software and that there is a real
problem that needs fixing, its not the fault of this patch. 

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 25778bd..d3be8d4 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -121,8 +121,8 @@ EXTRA_OECONF_INTERMEDIATE = "\
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
 
 EXTRA_OECONF_PATHS = "\ 
-    --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++/${BINV} \ 
-    --with-sysroot=${STAGING_DIR_TARGET} \ 
+    --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \ 
+    --with-sysroot=/not/exist \ 
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 0b1f37b..1a63f82 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -10,9 +10,9 @@ GCCMULTILIB = "--enable-multilib"
 require gcc-configure-common.inc
 
 EXTRA_OECONF_PATHS = "\
-    --with-gxx-include-dir=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_includedir}/c++/${BINV} \
+    --with-gxx-include-dir=/not/exist${target_includedir}/c++/${BINV} \
     --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
-    --with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
+    --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 # We have to point gcc at a sysroot but we don't need to rebuild if this changes
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 6e2f25b..7197447 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -21,7 +21,7 @@ EXTRA_OECONF = "\
     --enable-languages=c \
     ${OPTSPACE} \
     --program-prefix=${TARGET_PREFIX} \
-    --with-sysroot=${STAGING_DIR_TARGET} \
+    --with-sysroot=/not/exist \
     --with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
     ${EXTRA_OECONF_INITIAL} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 4cdb55f..9147acd 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -25,8 +25,8 @@ EXTRA_OECONF += "\
 "
 
 EXTRA_OECONF_PATHS = "\
-    --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++/${BINV} \
-    --with-sysroot=${STAGING_DIR_TARGET} \
+    --with-gxx-include-dir=/not/exist${target_includedir}/c++/${BINV} \
+    --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 167869e..0348bc4 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -4,7 +4,7 @@ CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
 
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
-    --with-sysroot=${STAGING_DIR_TARGET} \
+    --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index cf7942f..e42843d 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -1,7 +1,7 @@
 require gcc-configure-common.inc
 
 EXTRA_OECONF_PATHS = "\
-    --with-sysroot=${STAGING_DIR_TARGET} \
+    --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 



