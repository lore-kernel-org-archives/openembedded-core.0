Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA6D72505
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 22:12:11 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so5422859wgh.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 14:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qCk05nuvVtcHKYUBFbDyVJ9qhI6JLbwzlvpx5DI0/1c=;
	b=F5KQ8XDTsAjtIr79sj3iz3G5u61SrjQ+hlmGLZK9cYgl23pMl0O7x2r34KOQHbimCJ
	DZ6rdlFdcpsU5w1v9vZOrQHixB8fUG72rNFrY11xMxTD5GTNhtKwxVbN8zgmv+SfQsny
	oF66RRykjqdTxMNLggEg+8LE3rAPvW0EAMoXLOMWaV0UhSNVtdyAnQHllyOT8hPxz82w
	G1xiz19uM+0+PqKckRIQv2//66expYHfG6QZsNI0/aWjnm6e4GqoBYayREYCmiOQilkS
	UFA8is+/NMDHgtKI418gPrLvYnxb7JJRvxVUiOhcXJQz3vEKIrKMyYsTtG0mZieInOXB
	zhog==
X-Received: by 10.180.182.199 with SMTP id eg7mr25334269wic.17.1419199931497; 
	Sun, 21 Dec 2014 14:12:11 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id
	kn5sm21350509wjb.48.2014.12.21.14.12.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Dec 2014 14:12:10 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 22:11:53 +0000
Message-Id: <1419199917-27913-5-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
References: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 4/8] opkg: Merge opkg.inc into recipe and tidy up
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
X-List-Received-Date: Sun, 21 Dec 2014 22:12:11 -0000

There is no benefit to having a separate .inc file when we only support one
version of opkg.

The .inc file had multiple do_install_append functions and several variables
were defined out of the usual order. This arrangement should be better.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg.inc      | 76 -------------------------------
 meta/recipes-devtools/opkg/opkg_0.2.4.bb | 77 +++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg.inc

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
deleted file mode 100644
index 991c114..0000000
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ /dev/null
@@ -1,76 +0,0 @@
-SUMMARY = "Open Package Manager"
-SUMMARY_libopkg = "Open Package Manager library"
-SECTION = "base"
-HOMEPAGE = "http://code.google.com/p/opkg/"
-BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/opkg-cl.c;beginline=1;endline=20;md5=321f658c3f6b6c832e25c8850b5dffba"
-
-PE = "1"
-
-# Werror gives all kinds bounds issuses with gcc 4.3.3
-do_configure_prepend() {
-	sed -i -e s:-Werror::g ${S}/libopkg/Makefile.am
-}
-
-inherit autotools pkgconfig systemd
-
-python () {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN', True)
-        d.setVar('SYSTEMD_SERVICE_%s' % (pn), 'opkg-configure.service')
-}
-
-target_localstatedir := "${localstatedir}"
-OPKGLIBDIR = "${target_localstatedir}/lib"
-
-PACKAGECONFIG ??= ""
-
-PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,gpgme libgpg-error,gnupg"
-PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
-PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
-PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
-PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
-PACKAGECONFIG[pathfinder] = "--enable-pathfinder,--disable-pathfinder,pathfinder"
-
-EXTRA_OECONF = "\
-  --with-opkglibdir=${OPKGLIBDIR} \
-"
-
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config run-postinsts"
-RDEPENDS_${PN}_class-native = ""
-RDEPENDS_${PN}_class-nativesdk = ""
-RREPLACES_${PN} = "opkg-nogpg"
-
-PACKAGES =+ "libopkg-dev libopkg-staticdev libopkg"
-
-FILES_libopkg-dev = "${libdir}/*.la ${libdir}/*.so ${includedir}/libopkg"
-FILES_libopkg-staticdev = "${libdir}/*.a"
-FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
-FILES_${PN} += "${systemd_unitdir}/system/"
-
-do_install_append() {
-	# We need to create the lock directory
-	install -d ${D}${OPKGLIBDIR}/opkg
-
-	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
-		install -d ${D}${systemd_unitdir}/system
-		install -m 0644 ${WORKDIR}/opkg-configure.service ${D}${systemd_unitdir}/system/
-		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-			-e 's,@BINDIR@,${bindir},g' \
-			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
-			${D}${systemd_unitdir}/system/opkg-configure.service
-	fi
-
-	# The installed binary is 'opkg-cl' but people and scripts often expect
-	# it to just be 'opkg'
-	ln -sf opkg-cl ${D}${bindir}/opkg
-}
-
-do_install_append() {
-	rm ${D}${bindir}/update-alternatives
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
index 2cca63c..573195a 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
@@ -1,13 +1,86 @@
-require opkg.inc
+SUMMARY = "Open Package Manager"
+SUMMARY_libopkg = "Open Package Manager library"
+SECTION = "base"
+HOMEPAGE = "http://code.google.com/p/opkg/"
+BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://src/opkg-cl.c;beginline=1;endline=20;md5=321f658c3f6b6c832e25c8850b5dffba"
+
+PE = "1"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://no-install-recommends.patch \
            file://add-exclude.patch \
-           file://opkg-configure.service \
            file://libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch \
+           file://opkg-configure.service \
 "
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
 SRC_URI[md5sum] = "40ed2aee15abc8d550539449630091bd"
 SRC_URI[sha256sum] = "0f40c7e457d81edf9aedc07c778f4697111ab163a38ef95999faece015453086"
+
+inherit autotools pkgconfig systemd
+
+python () {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        pn = d.getVar('PN', True)
+        d.setVar('SYSTEMD_SERVICE_%s' % (pn), 'opkg-configure.service')
+}
+
+target_localstatedir := "${localstatedir}"
+OPKGLIBDIR = "${target_localstatedir}/lib"
+
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,gpgme libgpg-error,gnupg"
+PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
+PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
+PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
+PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
+PACKAGECONFIG[pathfinder] = "--enable-pathfinder,--disable-pathfinder,pathfinder"
+
+EXTRA_OECONF = "\
+  --with-opkglibdir=${OPKGLIBDIR} \
+"
+
+# Werror gives all kinds bounds issuses with gcc 4.3.3
+do_configure_prepend() {
+	sed -i -e s:-Werror::g ${S}/libopkg/Makefile.am
+}
+
+do_install_append () {
+	# We need to create the lock directory
+	install -d ${D}${OPKGLIBDIR}/opkg
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
+		install -d ${D}${systemd_unitdir}/system
+		install -m 0644 ${WORKDIR}/opkg-configure.service ${D}${systemd_unitdir}/system/
+		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
+			-e 's,@BINDIR@,${bindir},g' \
+			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
+			${D}${systemd_unitdir}/system/opkg-configure.service
+	fi
+
+	# The installed binary is 'opkg-cl' but people and scripts often expect
+	# it to just be 'opkg'
+	ln -sf opkg-cl ${D}${bindir}/opkg
+
+	rm ${D}${bindir}/update-alternatives
+}
+
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config run-postinsts"
+RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-nativesdk = ""
+RREPLACES_${PN} = "opkg-nogpg"
+
+PACKAGES =+ "libopkg-dev libopkg-staticdev libopkg"
+
+FILES_libopkg-dev = "${libdir}/*.la ${libdir}/*.so ${includedir}/libopkg"
+FILES_libopkg-staticdev = "${libdir}/*.a"
+FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
+FILES_${PN} += "${systemd_unitdir}/system/"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


