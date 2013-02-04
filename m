Received: from mail-ia0-f179.google.com ([209.85.210.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2URA-0002kS-U7
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 23:22:54 +0100
Received: by mail-ia0-f179.google.com with SMTP id x24so8574488iak.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 14:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=mIcJPRKQfeUekKYKDsSomAWJam6KvH1eFhS1MUGTnwg=;
	b=mcXU3j8unJTgIB7Y+YOglgOs4BnddAlWmiDz4JBIqiqFX7Pb1o0XGm/i03TA31yIO0
	UbTCpngeLfsWLEiY5MROnYVKTeSZPOON6J0O3v6956aEaRI13U3Nbhig1+rwJ8g1a2f5
	BYMBWEELcupAudZ+5JZKuqi6c31zvcwWaaR3Wd7yT/hrpxmBt303NkjNiqPlWmHnK2RI
	4uiRObstR/CAEHkflmIOXObnZi3san1CqEpv9fHMHRbe3UgT8G2GCQ+hiXTV686gmvKu
	+HA5PklpP4BpgPlJy2bDT1XrSvgVfFGo3MvKSuWmP3a9m6JpIKoUvfg6gYeZLP8YwfzB
	QjRQ==
X-Received: by 10.50.149.132 with SMTP id ua4mr9210518igb.18.1360015623570;
	Mon, 04 Feb 2013 14:07:03 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id px5sm17834148igc.0.2013.02.04.14.07.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 14:07:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 23:06:52 +0100
Message-Id: <1360015612-4020-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] ipk: use OPKGLIBDIR in all places
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 22:22:59 -0000

* it's not recommended to change this value, because it breaks upgrade path on target
  (all old u-a alternatives are forgot in old OPKGLIBDIR value
* but make it consistent, so if someone really want to change that, then
  setting OPKGLIBDIR_distro in distro.conf would be enough
* without this there were at least 4 places to change:
  rootfs_ipk: opkglibdir variable (notice that I've removed /opkg from it to correspond
              with EXTRA_OECONF option used in opkg recipes
  package_ipk: ${target_rootfs}${localstatedir}/lib/opkg/ hardcoded in
               package_install_internal_ipk
  opkg-collateral: value in lists file
  opkg: EXTRA_OECONF for all 3 classes, FILES_libopkg, do_install
* validated with buildhistory that without OPKGLIBDIR explicitly set the
  output is the same and that after setting
  OPKGLIBDIR_forcevariable := "${libdir}"
  everything including empty directory from package_ipk is moved to
  libdir

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package_ipk.bbclass                 |  4 +++-
 meta/classes/rootfs_ipk.bbclass                  | 16 +++++++--------
 meta/recipes-devtools/opkg/opkg-collateral.bb    |  6 +++---
 meta/recipes-devtools/opkg/opkg-collateral/lists |  2 --
 meta/recipes-devtools/opkg/opkg.inc              | 25 +++++++++++++-----------
 5 files changed, 28 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg-collateral/lists

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 433d0bb..e46a52a 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -12,6 +12,8 @@ OPKGBUILDCMD ??= "opkg-build"
 
 OPKG_ARGS = "-f $INSTALL_CONF_IPK -o $INSTALL_ROOTFS_IPK --force_postinstall --prefer-arch-to-version"
 
+OPKGLIBDIR = "${localstatedir}/lib"
+
 python package_ipk_fn () {
     d.setVar('PKGFN', d.getVar('PKG'))
 }
@@ -138,7 +140,7 @@ package_install_internal_ipk() {
 	local package_to_install="${INSTALL_PACKAGES_NORMAL_IPK}"
 	local package_multilib="${INSTALL_PACKAGES_MULTILIB_IPK}"
 
-	mkdir -p ${target_rootfs}${localstatedir}/lib/opkg/
+	mkdir -p ${target_rootfs}${OPKGLIBDIR}/opkg
 
 	local ipkg_args="${OPKG_ARGS}"
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 0e2fa12..b73ff4b 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -19,11 +19,11 @@ OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf
 
 OPKG_POSTPROCESS_COMMANDS = "ipk_insert_feed_uris; "
 
-opkglibdir = "${localstatedir}/lib/opkg"
+OPKGLIBDIR = "${localstatedir}/lib"
 
 # Which packages to not install on the basis of a recommendation
 BAD_RECOMMENDATIONS ?= ""
-MULTILIBRE_ALLOW_REP = "${opkglibdir}"
+MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg"
 
 fakeroot rootfs_ipk_do_rootfs () {
 	set -x
@@ -37,8 +37,8 @@ fakeroot rootfs_ipk_do_rootfs () {
  
 	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
 	export INSTALL_ROOTFS_IPK="${IMAGE_ROOTFS}"
-	STATUS=${IMAGE_ROOTFS}${opkglibdir}/status
-	mkdir -p ${IMAGE_ROOTFS}${opkglibdir}
+	STATUS=${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/status
+	mkdir -p ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg
 
 	opkg-cl ${OPKG_ARGS} update
 
@@ -93,7 +93,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 
 	${ROOTFS_POSTPROCESS_COMMAND}
 	
-	rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
+	rm -f ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/lists/*
 	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
 		if ! grep Status:.install.ok.unpacked ${STATUS}; then
 			# All packages were successfully configured.
@@ -120,7 +120,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 
 rootfs_ipk_write_manifest() {
 	manifest=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest
-	cp ${IMAGE_ROOTFS}${opkglibdir}/status $manifest
+	cp ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/status $manifest
 
 	sed '/Depends/d' -i $manifest
 	sed '/Status/d' -i $manifest
@@ -133,9 +133,9 @@ rootfs_ipk_write_manifest() {
 }
 
 remove_packaging_data_files() {
-	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
+	rm -rf ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg
 	# We need the directory for the package manager lock
-	mkdir ${IMAGE_ROOTFS}${opkglibdir}
+	mkdir ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg
 }
 
 list_installed_packages() {
diff --git a/meta/recipes-devtools/opkg/opkg-collateral.bb b/meta/recipes-devtools/opkg/opkg-collateral.bb
index 251c535..cacd880 100644
--- a/meta/recipes-devtools/opkg/opkg-collateral.bb
+++ b/meta/recipes-devtools/opkg/opkg-collateral.bb
@@ -2,18 +2,18 @@ DESCRIPTION = "opkg configuration files"
 SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "file://opkg.conf.comments \
-	   file://lists \
 	   file://dest \
 	   file://src "
 
+OPKGLIBDIR = "${localstatedir}/lib"
 do_compile () {
 	cat ${WORKDIR}/opkg.conf.comments >${WORKDIR}/opkg.conf
 	cat ${WORKDIR}/src	>>${WORKDIR}/opkg.conf
 	cat ${WORKDIR}/dest	>>${WORKDIR}/opkg.conf
-	cat ${WORKDIR}/lists	>>${WORKDIR}/opkg.conf
+	echo "lists_dir ext ${OPKGLIBDIR}/opkg" >>${WORKDIR}/opkg.conf
 }
 
 do_install () {
diff --git a/meta/recipes-devtools/opkg/opkg-collateral/lists b/meta/recipes-devtools/opkg/opkg-collateral/lists
deleted file mode 100644
index f8aecd8..0000000
--- a/meta/recipes-devtools/opkg/opkg-collateral/lists
+++ /dev/null
@@ -1,2 +0,0 @@
-lists_dir ext /var/lib/opkg
-
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 47458ff..8d48006 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/opkg-cl.c;beginline=1;endline=20;md5=321f658c3f6b6c832e25c8850b5dffba"
 
 PE = "1"
-INC_PR = "r12"
+INC_PR = "r13"
 
 # Werror gives all kinds bounds issuses with gcc 4.3.3
 do_configure_prepend() {
@@ -17,16 +17,19 @@ do_configure_prepend() {
 }
 
 inherit autotools pkgconfig
-EXTRA_OECONF += " --disable-gpg \
-                  --disable-openssl \
-                  --disable-ssl-curl \
-                  --disable-curl \
-                  --disable-sha256"
 
 target_localstatedir := "${localstatedir}"
-EXTRA_OECONF += "--with-opkglibdir=${localstatedir}/lib"
-EXTRA_OECONF_class-native = "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg --disable-curl --disable-openssl"
-EXTRA_OECONF_class-nativesdk = "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg --disable-curl --disable-openssl"
+OPKGLIBDIR = "${target_localstatedir}/lib"
+
+SHARED_EXTRA_OECONF = "\
+  --with-opkglibdir=${OPKGLIBDIR} \
+  --disable-gpg \
+  --disable-curl \
+  --disable-openssl \
+"
+EXTRA_OECONF_class-target = "${SHARED_EXTRA_OECONF} --disable-ssl-curl --disable-sha256"
+EXTRA_OECONF_class-native = "${SHARED_EXTRA_OECONF}"
+EXTRA_OECONF_class-nativesdk = "${SHARED_EXTRA_OECONF}"
 
 PROVIDES += "virtual/update-alternatives"
 RPROVIDES_update-alternatives-cworth += "update-alternatives"
@@ -41,11 +44,11 @@ PACKAGES =+ "libopkg-dev libopkg-staticdev libopkg update-alternatives-cworth"
 FILES_update-alternatives-cworth = "${bindir}/update-alternatives"
 FILES_libopkg-dev = "${libdir}/*.la ${libdir}/*.so"
 FILES_libopkg-staticdev = "${libdir}/*.a"
-FILES_libopkg = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
+FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
 
 do_install_append() {
 	# We need to create the lock directory
-	install -d ${D}${localstatedir}/lib/opkg
+	install -d ${D}${OPKGLIBDIR}/opkg
 }
 
 do_install_append_class-native() {
-- 
1.8.1.2



