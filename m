Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RqpUh-0005Xi-Rm
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:21:48 +0100
Received: by mail-yx0-f175.google.com with SMTP id r5so841853yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5GNCfSBRE32Ek/18RVRXji6LSLKJA/uvIIiKPaadEHE=;
	b=uOMPdp/qcCC8IR3ZZAh2l/w93S5+MZwDB0CygfUXdBj/6+WbtX8u3Xp+qiS9TYFSGT
	X2qL+uEc6hQ96FBcdYQKDYpbP7295uuj7VZIrDkC502ooHoLgJuM4qSb2x+13zyqyBQz
	LCoDHmNYWDFvoQfZxxBjo4GYT+TbTTwZZQphg=
Received: by 10.236.123.47 with SMTP id u35mr11632294yhh.115.1327684440672;
	Fri, 27 Jan 2012 09:14:00 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id f47sm14547996yhh.8.2012.01.27.09.13.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 09:13:59 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 11:13:47 -0600
Message-Id: <f1a2ee16dad51f938f38600808011569d7c2ac40.1327684024.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 09/10] external-csl-toolchain: leverage eglibc's packaging for more granular output
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
X-List-Received-Date: Fri, 27 Jan 2012 17:21:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |   43 ++++++++++++++++++----
 1 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index a866e3e..8cf73da 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -1,5 +1,4 @@
-inherit libc-common
-inherit libc-package
+require recipes-core/eglibc/eglibc-package.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -8,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PROVIDES = "\
+PROVIDES += "\
 	linux-libc-headers \
 	virtual/${TARGET_PREFIX}gcc \
 	virtual/${TARGET_PREFIX}g++ \
@@ -22,9 +21,8 @@ PROVIDES = "\
 	virtual/libiconv \
 	glibc-thread-db \
 	libgcc \
-	virtual/linux-libc-headers "
-RPROVIDES = "glibc-utils libsegfault glibc-thread-db"
-PACKAGES_DYNAMIC = "glibc-gconv-*"
+	virtual/linux-libc-headers \
+"
 PR = "r3"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
@@ -50,10 +48,25 @@ do_install() {
 		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/usr/.  ${D}/usr/
 	fi
 
+	if [ -e ${D}${prefix}/info ]; then
+		mv ${D}${prefix}/info ${D}${infodir}
+	fi
+	if [ -e ${D}${prefix}/man ]; then
+		mv ${D}${prefix}/man ${D}${mandir}
+	fi
+
+	rm ${D}${sysconfdir}/rpc
+	rm -r ${D}${datadir}/zoneinfo
+	rm -r ${D}${libdir}/bin
+
 	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
 	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so
 }
 
+do_install_locale_append () {
+	rm -r ${D}${datadir}/locale ${D}${libdir}/locale
+}
+
 SYSROOT_PREPROCESS_FUNCS += "external_toolchain_sysroot_adjust"
 external_toolchain_sysroot_adjust() {
        if [ -n "${CSL_TARGET_CORE}" ]; then
@@ -67,9 +80,23 @@ external_toolchain_sysroot_adjust() {
        fi
 }
 
-GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
+PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers linux-libc-headers-dev"
+
+INSANE_SKIP_libgcc = "1"
+INSANE_SKIP_libstdc++ = "1"
+INSANE_SKIP_gdbserver = "1"
+
+PKG_${PN} = "eglibc"
+PKG_${PN}-dev = "eglibc-dev"
+PKG_${PN}-doc = "eglibc-doc"
+PKG_${PN}-dbg = "eglibc-dbg"
+PKG_${PN}-pic = "eglibc-pic"
+PKG_${PN}-utils = "eglibc-utils"
+PKG_${PN}-gconv = "eglibc-gconv"
+PKG_${PN}-extra-nss = "eglibc-extra-nss"
+PKG_${PN}-thread-db = "eglibc-thread-db"
+PKG_${PN}-pcprofile = "eglibc-pcprofile"
 
-PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers linux-libc-headers-dev"
 FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
 FILES_libgcc-dev = "${base_libdir}/libgcc_s.so"
 FILES_libstdc++ = "${libdir}/libstdc++.so.*"
-- 
1.7.8.rc4



