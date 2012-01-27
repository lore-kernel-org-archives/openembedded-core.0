Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RqpUf-0005Wb-2I
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:21:45 +0100
Received: by mail-gy0-f175.google.com with SMTP id g19so802214ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FzeyAYUbIOtd68xfvDDoxm+WU+o3ld/wmTYrYFIo0Fc=;
	b=hQc5IRW9nxkhzXxzfvl02Nn9v0atjd5rrie0ARDiJxj7/AVZG0v18DaMBcYHC/ts9v
	suBJ0OXvhT963N5BB+vObHgGp5YLfDBV31UQOhTbDmDU+ckbt72XDNHlo9oxtTODMR6z
	PYjhikmf71g2Wwwyid55+5SLbkwP/y3vIlr/0=
Received: by 10.101.190.14 with SMTP id s14mr3496183anp.50.1327684437956;
	Fri, 27 Jan 2012 09:13:57 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id f47sm14547996yhh.8.2012.01.27.09.13.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 09:13:56 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 11:13:45 -0600
Message-Id: <08cc6aa12fba6bcdb28c68edf3fe2e32dd5f52ca.1327684024.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 07/10] external-csl-toolchain: support mips/ppc/arm
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
X-List-Received-Date: Fri, 27 Jan 2012 17:21:46 -0000

From: Christopher Larson <chris_larson@mentor.com>

- Rather than adjusting TARGET_VENDOR, which results in our TARGET_SYS
  matching the external toolchain, override TARGET_PREFIX to match external,
  and leave TARGET_SYS alone
- Grab the optimized files out of the toolchain if available
- Create a symlink in sysroot to ensure the sysroot layout matches toolchain
  expectations (optimized files in a subdir)

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc |   27 +++++++++++++++++-
 meta/recipes-core/meta/external-csl-toolchain.bb |   32 +++++++++++++++++-----
 2 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 0af3a45..1d82ca1 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -2,12 +2,20 @@
 # Configuration to use external CSL toolchain
 #
 
-TARGET_VENDOR = "-none"
-
 EXTERNAL_TOOLCHAIN ?= "/usr/local/csl/${TARGET_ARCH}"
 
 PATH =. "${EXTERNAL_TOOLCHAIN}/bin:"
 
+CSL_TARGET_SYS_powerpc = "powerpc-linux-gnu"
+CSL_TARGET_SYS_powerpc64 = "powerpc-linux-gnu"
+CSL_TARGET_SYS_arm = "arm-none-linux-gnueabi"
+CSL_TARGET_SYS_mips = "mips-linux-gnu"
+CSL_TARGET_SYS_mipsel = "mips-linux-gnu"
+CSL_TARGET_SYS_mips64 = "mips-linux-gnu"
+CSL_TARGET_SYS = "${TARGET_SYS}"
+
+TARGET_PREFIX = "${CSL_TARGET_SYS}-"
+
 PREFERRED_PROVIDER_linux-libc-headers = "external-csl-toolchain"
 PREFERRED_PROVIDER_linux-libc-headers-dev = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-csl-toolchain"
@@ -28,3 +36,18 @@ TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/include
 TARGET_LDFLAGS_prepend = " -L${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib "
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
+
+# Translate to CodeSourcery's names for their optimized files in the toolchain
+def csl_target_core(d):
+    coredata = {
+        'armv7a-vfp-neon': 'armv7-a-neon',
+        'mips': 'mips32',
+        'mipsel': 'el',
+        'ppce500': 'te500v1',
+        'ppce500mc': 'te500mc',
+        'ppce500v2': 'te500v2',
+        'ppce600': 'te600'
+    }
+    return coredata.get(d.getVar('TUNE_PKGARCH', True), '')
+
+CSL_TARGET_CORE = "${@csl_target_core(d)}"
diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index f1e5332..37ea271 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -25,25 +25,43 @@ PROVIDES = "\
 	virtual/linux-libc-headers "
 RPROVIDES = "glibc-utils libsegfault glibc-thread-db"
 PACKAGES_DYNAMIC = "glibc-gconv-*"
-PR = "r2"
+PR = "r3"
 
-#SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
+#SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
 
 SRC_URI = "file://SUPPORTED"
 
 do_install() {
 	install -d ${D}${sysconfdir} ${D}${bindir} ${D}${sbindir} ${D}${base_bindir} ${D}${libdir}
-	install -d ${D}${base_libdir} ${D}${base_sbindir} ${D}${datadir}
+	install -d ${D}${base_libdir} ${D}${base_sbindir} ${D}${datadir} ${D}/usr
 
-	cp -a ${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/libc/lib/*  ${D}${base_libdir}
-	cp -a ${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/libc/etc/*  ${D}${sysconfdir}
-	cp -a ${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/libc/sbin/* ${D}${base_sbindir}
-	cp -a ${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/libc/usr/*  ${D}/usr
+	if [ -d ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE} ]; then
+		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/lib/.  ${D}${base_libdir}
+		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/etc/.  ${D}${sysconfdir}
+		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/sbin/. ${D}${base_sbindir}
+		if [ ! -e ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/include ]; then
+			cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/usr/include  ${D}/usr/
+		fi
+		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/.  ${D}/usr/
+	else
+		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/lib/.  ${D}${base_libdir}
+		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/etc/.  ${D}${sysconfdir}
+		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/sbin/. ${D}${base_sbindir}
+		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/usr/.  ${D}/usr/
+	fi
 
 	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
 	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so
 }
 
+SYSROOT_PREPROCESS_FUNCS += "external_toolchain_sysroot_adjust"
+external_toolchain_sysroot_adjust() {
+       if [ -n "${CSL_TARGET_CORE}" ]; then
+               rm -f ${SYSROOT_DESTDIR}/${CSL_TARGET_CORE}
+               ln -s . ${SYSROOT_DESTDIR}/${CSL_TARGET_CORE}
+       fi
+}
+
 GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
 
 PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers linux-libc-headers-dev"
-- 
1.7.8.rc4



