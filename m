Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RqpUb-0005Wb-8d
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:21:41 +0100
Received: by mail-gy0-f175.google.com with SMTP id g19so802214ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Lbwi4IxbHySI3opNntJEb2jMbhDnogdGGzVNeTsQ200=;
	b=F/iLaM4MWMfKOmwEK1+lKDIG8VhtVkSyRHvRmkKv2bICmd+j8vdZo8yMdxUkR77ewn
	TLU+cd9xwZbOsrqwB+fcGHVPKMAohF/kbv9rrvN8dp54kOtb7x+EQx2ZyuuMTNOlugry
	sYJ5+stJSHF16JkpnAcK2nn5axKozd367/bOs=
Received: by 10.236.181.198 with SMTP id l46mr12075737yhm.40.1327684434209;
	Fri, 27 Jan 2012 09:13:54 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id f47sm14547996yhh.8.2012.01.27.09.13.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 09:13:53 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 11:13:43 -0600
Message-Id: <cf7c96acbb3c42e14b5330fccfc2af223443fe75.1327684024.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 05/10] external-csl-toolchain: fixes for metadata changes
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
X-List-Received-Date: Fri, 27 Jan 2012 17:21:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

These allow the recipe to build again:

- add compilerlibs, g++, libgcc to the provides
- add linux-libc-headers-dev to the packages
- in libc-package, only sed the ldd.bash.in file if it exists, as the external
  toolchain is using that class as well
- shift the inherit location of the libc classes, as they were overriding the
  recipe's do_install
- use ?= for EXTERNAL_TOOLCHAIN, so the user can set it

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/libc-package.bbclass                  |    4 +++-
 .../distro/include/tcmode-external-csl2008q3.inc   |    7 ++++++-
 .../meta/external-csl-toolchain_2008q3-72.bb       |   16 +++++++++-------
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 440218f..4acf91a 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -40,7 +40,9 @@ python __anonymous () {
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 
 do_configure_prepend() {
-        sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
+        if [ -e ${S}/elf/ldd.bash.in ]; then
+                sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
+        fi
 }
 
 
diff --git a/meta/conf/distro/include/tcmode-external-csl2008q3.inc b/meta/conf/distro/include/tcmode-external-csl2008q3.inc
index 1586365..31055dc 100644
--- a/meta/conf/distro/include/tcmode-external-csl2008q3.inc
+++ b/meta/conf/distro/include/tcmode-external-csl2008q3.inc
@@ -4,22 +4,27 @@
 
 TARGET_VENDOR = "-none"
 
-EXTERNAL_TOOLCHAIN = "/usr/local/csl/arm-2008q3"
+EXTERNAL_TOOLCHAIN ?= "/usr/local/csl/arm-2008q3"
 
 PATH =. "${EXTERNAL_TOOLCHAIN}/bin:"
 
 PREFERRED_PROVIDER_linux-libc-headers = "external-csl-toolchain"
+PREFERRED_PROVIDER_linux-libc-headers-dev = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-gcc = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-gcc-initial = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-gcc-intermediate = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-g++ = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-binutils = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-libc-for-gcc = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-compilerlibs = "external-csl-toolchain"
+PREFERRED_PROVIDER_libgcc = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/libc = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/libintl = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/libiconv = "external-csl-toolchain"
 PREFERRED_PROVIDER_glibc-thread-db = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-csl-toolchain"
 
+
 PREFERRED_VERSION_external-csl-toolchain = "2008q3-72"
 
 TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/include "
diff --git a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
index a874c8b..b5a3607 100644
--- a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
@@ -1,7 +1,12 @@
+inherit libc-common
+inherit libc-package
+
 INHIBIT_DEFAULT_DEPS = "1"
 
 # License applies to this recipe code, not the toolchain itself
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PROVIDES = "\
 	linux-libc-headers \
@@ -11,21 +16,22 @@ PROVIDES = "\
 	virtual/arm-none-linux-gnueabi-gcc-intermediate \
 	virtual/arm-none-linux-gnueabi-binutils \
 	virtual/arm-none-linux-gnueabi-libc-for-gcc \
+	virtual/arm-none-linux-gnueabi-compilerlibs \
 	virtual/libc \
 	virtual/libintl \
 	virtual/libiconv \
 	glibc-thread-db \
+	libgcc \
 	virtual/linux-libc-headers "
 RPROVIDES = "glibc-utils libsegfault glibc-thread-db"
 PACKAGES_DYNAMIC = "glibc-gconv-*"
-PR = "r1"
+PR = "r2"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-${PV}-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
 
 SRC_URI = "file://SUPPORTED"
 
 do_install() {
-	echo "EXTERNAL_TOOLCHAIN is ${EXTERNAL_TOOLCHAIN}"
 	install -d ${D}${sysconfdir} ${D}${bindir} ${D}${sbindir} ${D}${base_bindir} ${D}${libdir}
 	install -d ${D}${base_libdir} ${D}${base_sbindir} ${D}${datadir}
 
@@ -40,10 +46,7 @@ do_install() {
 
 GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
 
-inherit libc-common
-inherit libc-package
-
-PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers"
+PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers linux-libc-headers-dev"
 FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
 FILES_libgcc-dev = "${base_libdir}/libgcc_s.so"
 FILES_libstdc++ = "${libdir}/libstdc++.so.*"
@@ -61,4 +64,3 @@ FILES_linux-libc-headers = "${includedir}/asm* \
 	${includedir}/sound \
 	${includedir}/video \
 "
-
-- 
1.7.8.rc4



