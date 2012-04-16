Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SJsvd-00058O-Ir
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 22:53:42 +0200
Received: by ggcy3 with SMTP id y3so2774010ggc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 13:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Eo9FU3zy3gwXw6zV0Cwec1yz3CDCKaCg6Xv5gTnUkJc=;
	b=Su16vZ+LHqPOaz0FD6W9SNlbyfSFvd3OAMc7Cr0DrDQ196lkZzJXN9wVjxGAuhnv0S
	5Db+Fj9e654hZRsO0I1/4v9m3n0jgK5ZqZJymqE7CVtm/TEB8ArYKotPRSHJ6Z2J1Wx5
	FkxSBhGISQb6aONOPooiQC6XQ18cCKVWpH0FEfaRGkCqLXUkOTNs+7PmTMHb3tIngfxi
	/mPvQlwJp/p/qAh1cuPbQ5P6f6DLqKiaZpnkxu9eeuNS6whotsEDpfzW1WqhAl5rhEw8
	H+W4Ggm2tTutya/kZy4my5k7bl/hDH5hNmLvDpUwEI/+e1y+7LvlFKfRjz1H8v39LGjW
	hfig==
Received: by 10.60.22.234 with SMTP id h10mr17563187oef.54.1334609055782;
	Mon, 16 Apr 2012 13:44:15 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id hh2sm20659762obb.1.2012.04.16.13.44.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 13:44:15 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 15:44:03 -0500
Message-Id: <87ab127c68a272ecdfc7856c16cc490db8e2dd0b.1334608810.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
References: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
In-Reply-To: <cover.1334608810.git.kergoth@gmail.com>
References: <cover.1334608810.git.kergoth@gmail.com>
Subject: [PATCH 6/7] external-csl-toolchain: cleanup, simplify, use base_libdir
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
X-List-Received-Date: Mon, 16 Apr 2012 20:53:44 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |   51 +++++++++++----------
 1 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index fb553ab..8798541 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -24,36 +24,40 @@ PROVIDES += "\
 	virtual/linux-libc-headers \
 "
 PV = "${CSL_VER_MAIN}"
-PR = "r3"
+PR = "r4"
 
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
@@ -61,14 +65,13 @@ do_install() {
 
 	mv ${D}${libdir}/bin/* ${D}${bindir}/
 	if [ -e ${D}${libdir}/bin/.debug ]; then
-		install -d ${D}${bindir}/.debug
 		mv ${D}${libdir}/bin/.debug/* ${D}${bindir}/.debug/
 	fi
 	ln -s ../../bin/gdbserver ${D}${libdir}/bin/sysroot-gdbserver
 
 	sed -i -e 's/__packed/__attribute__ ((packed))/' ${D}${includedir}/mtd/ubi-user.h
-	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
-	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so
+        sed -i -e "s# ${base_libdir}# ../..${base_libdir}#g" -e "s# ${libdir}# .#g" ${D}${libdir}/libc.so
+        sed -i -e "s# ${base_libdir}# ../..${base_libdir}#g" -e "s# ${libdir}# .#g" ${D}${libdir}/libpthread.so
 }
 
 do_install_locale_append () {
-- 
1.7.7



