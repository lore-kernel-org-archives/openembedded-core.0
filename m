Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SKAkP-0002cS-9d
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 17:55:17 +0200
Received: by mail-yx0-f175.google.com with SMTP id m3so3178107yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=EzrODmmoxhSeyZq2KC0wUTJihG7pk1+LC+EgEFIK6ek=;
	b=KYDUPsVo+z8UVvbdZnfNbAXI2OGlPxXiSDvvDjym1sAWGTgaNbcTwLM5huHn5eTgWu
	Ga5PIoNZkaZA0BV2wAe1HMkPTC3yQlTmOwwuHCa3TPECSivsvKZi95cgsiON+giUfaLG
	tY96ZhbOQuVDaR5MHRn2FvYdGnHLqJx07x7LgIM3HVK3VlW8gkzaKp5wm2xVciFEwpb+
	Qq6Ort4eKjv9P8K1rNWkemEhQvHLI3Hb8KABsgcUfX1owDf9JnUqjfI6fi+J3xUW/oM+
	an1D3Bv7OdmpJhwUosPmo38hg/7uMZT0XG5rmJTM/917l6HM/eiDvc/Wxfmi10o8yFRT
	7zeQ==
Received: by 10.60.12.162 with SMTP id z2mr21829603oeb.47.1334677552733;
	Tue, 17 Apr 2012 08:45:52 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id w4sm18810371oeg.12.2012.04.17.08.45.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 08:45:50 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 10:45:16 -0500
Message-Id: <1ef21b78b654fd660ef180a1f2b7fa451d688615.1334677440.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
Subject: [PATCH 6/6] external-csl-toolchain: cleanup, simplify, use base_libdir
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
X-List-Received-Date: Tue, 17 Apr 2012 15:55:18 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |   55 +++++++++++-----------
 1 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index fb553ab..ba04106 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -24,36 +24,40 @@ PROVIDES += "\
 	virtual/linux-libc-headers \
 "
 PV = "${CSL_VER_MAIN}"
-PR = "r3"
+PR = "r5"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
 
 SRC_URI = "file://SUPPORTED"
 
 do_install() {
-	install -d ${D}${sysconfdir} ${D}${bindir} ${D}${sbindir} ${D}${base_bindir} ${D}${libdir}
-	install -d ${D}${base_libdir} ${D}${base_sbindir} ${D}${datadir} ${D}/usr
+	# Use optimized files if available
+	sysroot="${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc"
+	if [ -d $sysroot/${CSL_TARGET_CORE} ]; then
+		sysroot="$sysroot/${CSL_TARGET_CORE}"
+	fi
+
+	cp -a $sysroot${base_libdir}/. ${D}${base_libdir}
+	cp -a $sysroot/etc/. ${D}${sysconfdir}
+	cp -a $sysroot/sbin/. ${D}${base_sbindir}
 
-	if [ -d ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE} ]; then
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/lib/.  ${D}${base_libdir}
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/etc/.  ${D}${sysconfdir}
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/sbin/. ${D}${base_sbindir}
-		if [ ! -e ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/include ]; then
-			cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/usr/include  ${D}/usr/
+	install -d ${D}/usr
+	for usr_element in bin include libexec sbin share ${base_libdir}; do
+		usr_path=$sysroot/usr/$usr_element
+		cp -a $usr_path ${D}/usr/
+	done
+	for datadir_element in man info; do
+		datadir_path=$sysroot/usr/$datadir_element
+		if [ -e $datadir_path ]; then
+			cp -a $datadir_path ${D}${datadir}/
 		fi
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/.  ${D}/usr/
-	else
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/lib/.  ${D}${base_libdir}
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/etc/.  ${D}${sysconfdir}
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/sbin/. ${D}${base_sbindir}
-		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/usr/.  ${D}/usr/
-	fi
+	done
 
-	if [ -e ${D}${prefix}/info ]; then
-		mv ${D}${prefix}/info ${D}${infodir}
-	fi
-	if [ -e ${D}${prefix}/man ]; then
-		mv ${D}${prefix}/man ${D}${mandir}
+	# Some toolchains have headers under the core specific area
+	if [ -e $sysroot/usr/include ]; then
+		cp -a $sysroot/usr/include/. ${D}${includedir}
+	else
+		cp -a $sysroot/../usr/include/. ${D}${includedir}
 	fi
 
 	rm ${D}${sysconfdir}/rpc
@@ -61,18 +65,13 @@ do_install() {
 
 	mv ${D}${libdir}/bin/* ${D}${bindir}/
 	if [ -e ${D}${libdir}/bin/.debug ]; then
-		install -d ${D}${bindir}/.debug
 		mv ${D}${libdir}/bin/.debug/* ${D}${bindir}/.debug/
 	fi
 	ln -s ../../bin/gdbserver ${D}${libdir}/bin/sysroot-gdbserver
 
 	sed -i -e 's/__packed/__attribute__ ((packed))/' ${D}${includedir}/mtd/ubi-user.h
-	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
-	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so
-}
-
-do_install_locale_append () {
-	rm -r ${D}${datadir}/locale ${D}${libdir}/locale
+        sed -i -e "s# ${base_libdir}# ../..${base_libdir}#g" -e "s# ${libdir}# .#g" ${D}${libdir}/libc.so
+        sed -i -e "s# ${base_libdir}# ../..${base_libdir}#g" -e "s# ${libdir}# .#g" ${D}${libdir}/libpthread.so
 }
 
 SYSROOT_PREPROCESS_FUNCS += "external_toolchain_sysroot_adjust"
-- 
1.7.7



