Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 913EC729DC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 22:12:12 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id y19so5369313wgg.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 14:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YbZq77PiIYsJWLkOt5PWOKG3yBnFMe41p7cPY8EDm58=;
	b=jb60qkCj38CLk40gziJxWqqyDWrhQjWwcEaHhhlUQEYgI/kT5Mj4ZFyrQe1jSB0aW4
	9jE9NrG403LGA4oWFP/fi4DBBgZBXfgaRkx7ogcuANOzIxi13aorDbVrLnjKSjLJtytZ
	yH/1BcrxljPBZ+355gz1U+EyV6nMH5zKpxV3nPbz30yX7zHp+Uv1Maw3IyVvvwJ6AJvQ
	Ko51Qg3ZZuA0p/CXSZG0SiD5jlEq0TEgWVDouTZeNxIX2BraL6vb3YJBXll5apQqVk4q
	RnjDkt618StKqMKhI9Hn5VeVPOqucaW/W2YVkVEas+RJOoWXaoc+GdlFpqp7fiRWKE19
	3Qiw==
X-Received: by 10.194.62.76 with SMTP id w12mr35893608wjr.5.1419199932639;
	Sun, 21 Dec 2014 14:12:12 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id
	kn5sm21350509wjb.48.2014.12.21.14.12.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Dec 2014 14:12:11 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 22:11:54 +0000
Message-Id: <1419199917-27913-6-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
References: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 5/8] opkg: Merge in opkg-collateral
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
X-List-Received-Date: Sun, 21 Dec 2014 22:12:12 -0000

All non-arch-specific and non-distro-specific configuration is now kept in the
main 'opkg' recipe and package.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/classes/rootfs_ipk.bbclass                       |  2 +-
 meta/recipes-devtools/opkg/opkg-collateral.bb         | 19 -------------------
 .../opkg/{opkg-collateral => opkg}/opkg.conf          |  0
 meta/recipes-devtools/opkg/opkg_0.2.4.bb              | 12 +++++++++++-
 4 files changed, 12 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg-collateral.bb
 rename meta/recipes-devtools/opkg/{opkg-collateral => opkg}/opkg.conf (100%)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 6139cc7..dd144e4 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -6,7 +6,7 @@
 #
 
 EXTRAOPKGCONFIG ?= ""
-ROOTFS_PKGMANAGE = "opkg opkg-collateral ${EXTRAOPKGCONFIG}"
+ROOTFS_PKGMANAGE = "opkg ${EXTRAOPKGCONFIG}"
 ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
diff --git a/meta/recipes-devtools/opkg/opkg-collateral.bb b/meta/recipes-devtools/opkg/opkg-collateral.bb
deleted file mode 100644
index b16579c..0000000
--- a/meta/recipes-devtools/opkg/opkg-collateral.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Constructs the main configuration file for opkg"
-SECTION = "base"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r2"
-
-SRC_URI = "file://opkg.conf"
-
-OPKGLIBDIR = "${localstatedir}/lib"
-do_compile () {
-	echo "option lists_dir ${OPKGLIBDIR}/opkg" >>${WORKDIR}/opkg.conf
-}
-
-do_install () {
-	install -d ${D}${sysconfdir}/opkg
-	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
-}
-
-CONFFILES_${PN} = "${sysconfdir}/opkg/opkg.conf"
diff --git a/meta/recipes-devtools/opkg/opkg-collateral/opkg.conf b/meta/recipes-devtools/opkg/opkg/opkg.conf
similarity index 100%
rename from meta/recipes-devtools/opkg/opkg-collateral/opkg.conf
rename to meta/recipes-devtools/opkg/opkg/opkg.conf
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
index 573195a..6cb89e9 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://add-exclude.patch \
            file://libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch \
            file://opkg-configure.service \
+           file://opkg.conf \
 "
 
 S = "${WORKDIR}/${BPN}-${PV}"
@@ -50,7 +51,14 @@ do_configure_prepend() {
 	sed -i -e s:-Werror::g ${S}/libopkg/Makefile.am
 }
 
+do_compile_append () {
+	echo "option lists_dir ${OPKGLIBDIR}/opkg" >>${WORKDIR}/opkg.conf
+}
+
 do_install_append () {
+	install -d ${D}${sysconfdir}/opkg
+	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
+
 	# We need to create the lock directory
 	install -d ${D}${OPKGLIBDIR}/opkg
 
@@ -74,7 +82,7 @@ do_install_append () {
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config run-postinsts"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
-RREPLACES_${PN} = "opkg-nogpg"
+RREPLACES_${PN} = "opkg-nogpg opkg-collateral"
 
 PACKAGES =+ "libopkg-dev libopkg-staticdev libopkg"
 
@@ -84,3 +92,5 @@ FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
 FILES_${PN} += "${systemd_unitdir}/system/"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CONFFILES_${PN} = "${sysconfdir}/opkg/opkg.conf"
-- 
1.9.1


