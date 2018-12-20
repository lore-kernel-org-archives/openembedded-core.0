Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4577E7BDCF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 00:15:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so21332131wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 16:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RsV7dEBncMQofBM5iA3xJL/X19HawQE5dW+16mEBEXM=;
	b=WeeoyBYRzdjVaMMA/vugvP5em4jgn36bv5K5jRcLYBLJVL7GbN5W8GIaceH8ZYNHrn
	2ZWlBe50xK9fpY7t+73lUeSXhnP61zxUweemaA2axOqoBR4X8GcN9Caktlz48t4i9oxX
	BJNFtpiKpHQmCYkXURvMBOJ40BdumjeyE4Bp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RsV7dEBncMQofBM5iA3xJL/X19HawQE5dW+16mEBEXM=;
	b=Lq61W2rvOGnVx+1xbpi5+SX8taFWdxGL24RVzikxFDd3frO9zECNczc/PkJ1O2b9ti
	/cgZOCclqKZA+7HNdt7CQGKs/z1hSDrZHPcid1xPcUo2VLsC7eMLtb/++VZBQoVjm5n8
	zyzl+7WokitVor4+KuY9bQkxOtBlOdom0immaEu3klU282RjL6k9TZW1F/uQLOkpqu7y
	IXzRW60Cf2CPwflxYo3pkjzMqiydY+s+Z1lF2iWwydhIOPM5Dr1US/RVq/sc9mGyuKTF
	XD9OuAXKf9gOVEJbE/oujES/DDVTzq9gHOGc8IbVlJg8yEE+pKismv7xWMNZC9q4QWkq
	rfRg==
X-Gm-Message-State: AA+aEWbpDbNeL1BLIf9eieaP3YMGumME8Pzza5HRiDRzYfI/5dEMqpPq
	Tu5F+hSb+T0MOeI6tV0zV1czJKAz+xlWLw==
X-Google-Smtp-Source: AFSGD/VI2IILO1rypswBKoXNFSXK7xUhuSJ7S4hB/jSwN6gUMVVQA713EWX17AEE397MeRMCTNeizw==
X-Received: by 2002:a5d:5443:: with SMTP id w3mr18961331wrv.4.1545264948680;
	Wed, 19 Dec 2018 16:15:48 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o81sm10175581wmd.10.2018.12.19.16.15.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 16:15:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 00:15:43 +0000
Message-Id: <20181220001545.12618-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
References: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/4] gcc: Drop gcc-cross-initial and use gcc-cross instead
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
X-List-Received-Date: Thu, 20 Dec 2018 00:15:48 -0000
Content-Transfer-Encoding: 8bit

We need a libgcc to build glibc. Tranditionally we therefore build
a non-threaded and non-shared compiler (gcc-cross-initial), then use
that to build libgcc-initial which is used to build glibc which we can
then build gcc-cross and libgcc against.

Firstly, we can drop the glibc dependency from gcc-cross, *if* we make
two changes:

a) specify the minimum glibc version to support in a configure option
b) create a dummy limits.h file so that later when glibc creates one,
   the headers structure has support for it. We can do this with a simple
   empty file

Once gcc-cross is libc independent, we can use it to build both
libgcc-initial and then later libgcc.

libgcc-initial is tricky as we need to imitate the non-threaded and
non-shared case. We can do that by hacking the threading mode back to
"single" even if gcc reports "posix" and disable libc presence for the
libgcc-intial build. We have to create the dummy limits.h to avoid
compiler errors from a missing header.

glibc will fail to link with libgcc-initial due to a missing "exception
handler" capable libgcc (libgcc_eh.a). Since we know glibc doesn't need
any exception handler, we can safely symlink to libgcc.a.

With those changes, gcc-cross can be used in all places and we only need
one build of gcc for each architecture.

For some reason ifunc was being disabled on mips prior to these changes
but afterwards became enabled but caused assertion failures. This is
therefore disabled until we can debug that.

The glibc version is a minimum and only used on ppc in the gcc code, it
doesn't need to be rigerously kept exactly up to date.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc.inc             |  5 +-
 .../gcc/gcc-configure-common.inc              |  3 ++
 .../gcc/gcc-cross-canadian.inc                |  2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc       |  8 ++-
 meta/recipes-devtools/gcc/libgcc-initial.inc  | 52 ++++++++++++++++---
 meta/recipes-devtools/gcc/libgcc.inc          |  2 +-
 6 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 43e71337eef..de692fbfd75 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -15,7 +15,7 @@ python () {
         bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN'), opt_effective))
 }
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
 
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES += "virtual/libintl virtual/libiconv"
@@ -33,6 +33,9 @@ CACHED_CONFIGUREVARS += " \
   libc_cv_ssp=no \
 "
 
+# ifunc doesn't appear to work on mips, casuses libbfd assertion failures
+CACHED_CONFIGUREVARS_append_mipsarch = " libc_cv_ld_gnu_indirect_function=no"
+
 GLIBC_EXTRA_OECONF ?= ""
 GLIBC_EXTRA_OECONF_class-nativesdk = ""
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index e2ce234aa14..009ab111683 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -24,6 +24,8 @@ GCCTHREADS ?= "posix"
 
 GCCPIE ??= ""
 
+# glibc version is a minimum and doesn't need to track glibc exactly
+# only governs ppc specific features in much older glibc versions
 EXTRA_OECONF = "\
     ${@['--enable-clocale=generic', ''][d.getVar('USE_NLS') != 'no']} \
     --with-gnu-ld \
@@ -38,6 +40,7 @@ EXTRA_OECONF = "\
     --enable-libstdcxx-pch \
     --program-prefix=${TARGET_PREFIX} \
     --without-local-prefix \
+    --with-glibc-version=2.28 \
     ${EXTRA_OECONF_BASE} \
     ${EXTRA_OECONF_GCC_FLOAT} \
     ${EXTRA_OECONF_PATHS} \
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 2f32d3407fb..73f1e054463 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -3,7 +3,7 @@ inherit cross-canadian
 SUMMARY = "GNU cc and gcc C compilers (cross-canadian for ${TARGET_ARCH} target)"
 PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc nativesdk-gettext flex-native"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc nativesdk-gettext flex-native virtual/libc"
 
 GCCMULTILIB = "--enable-multilib"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 89b19684bef..63a196e2e99 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -2,7 +2,7 @@ inherit cross
 
 INHIBIT_DEFAULT_DEPS = "1"
 EXTRADEPENDS = ""
-DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc ${EXTRADEPENDS} ${NATIVEDEPS}"
+DEPENDS = "virtual/${TARGET_PREFIX}binutils ${EXTRADEPENDS} ${NATIVEDEPS}"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 python () {
     if d.getVar("TARGET_OS").startswith("linux"):
@@ -44,6 +44,12 @@ EXTRA_OECONF_PATHS = "\
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
 
+
+do_configure_prepend () {
+	install -d ${RECIPE_SYSROOT}${target_includedir}
+	touch ${RECIPE_SYSROOT}${target_includedir}/limits.h
+}
+
 do_compile () {
 	export CC="${BUILD_CC}"
 	export AR_FOR_TARGET="${TARGET_SYS}-ar"
diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index 950ad861e7e..06bf224f734 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -1,20 +1,58 @@
+#
+# Notes on the way the OE cross toolchain now works
+#
+# We need a libgcc to build glibc. Tranditionally we therefore built
+# a non-threaded and non-shared compiler (gcc-cross-initial), then use
+# that to build libgcc-initial which is used to build glibc which we can
+# then build gcc-cross and libgcc against.
+#
+# We were able to drop the glibc dependency from gcc-cross, with two tweaks:
+
+# a) specify the minimum glibc version to support in a configure option
+# b) create a dummy limits.h file so that later when glibc creates one,
+#    the headers structure has support for it. We can do this with a simple
+#    empty file
+#
+# Once gcc-cross is libc independent, we can use it to build both
+# libgcc-initial and then later libgcc.
+#
+# libgcc-initial is tricky as we need to imitate the non-threaded and
+# non-shared case. We can do that by hacking the threading mode back to
+# "single" even if gcc reports "posix" and disable libc presence for the
+# libgcc-intial build. We have to create the dummy limits.h to avoid
+# compiler errors from a missing header.
+#
+# glibc will fail to link with libgcc-initial due to a missing "exception
+# handler" capable libgcc (libgcc_eh.a). Since we know glibc doesn't need
+# any exception handler, we can safely symlink to libgcc.a.
+#
+
 require libgcc-common.inc
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc"
 
 LICENSE = "GPL-3.0-with-GCC-exception"
 
-STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
-STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
-PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
-
 PACKAGES = ""
 
 EXTRA_OECONF += "--disable-shared"
 
-COMPILERINITIAL = "-initial"
-
 inherit nopackages
 
 # We really only want this built by things that need it, not any recrdeptask
 deltask do_build
+
+do_configure_prepend () {
+	install -d ${STAGING_INCDIR}
+	touch ${STAGING_INCDIR}/limits.h
+	sed -i -e 's#INHIBIT_LIBC_CFLAGS =.*#INHIBIT_LIBC_CFLAGS = -Dinhibit_libc#' ${B}/gcc/libgcc.mvars
+	sed -i -e 's#inhibit_libc = false#inhibit_libc = true#' ${B}/gcc/Makefile
+}
+
+do_configure_append () {
+	sed -i -e 's#thread_header = .*#thread_header = gthr-single.h#' ${B}/${BPN}/Makefile
+}
+
+do_install_append () {
+	ln -s libgcc.a ${D}${libdir}/${TARGET_SYS}/${BINV}/libgcc_eh.a
+}
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 5f1dff609c0..e4e0c480076 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -1,6 +1,6 @@
 require libgcc-common.inc
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ virtual/${MLPREFIX}libc"
 
 do_install_append_class-target () {
 	if [ "${TCLIBC}" != "glibc" ]; then
-- 
2.19.1


