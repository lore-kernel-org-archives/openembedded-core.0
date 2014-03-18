Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 20F056F8D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 07:49:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2I7nMhU007513
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 00:49:22 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 18 Mar 2014 00:49:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Mar 2014 15:54:34 +0800
Message-ID: <e82250b0c31517abf6644cc4a8039c0832635443.1395126712.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395126712.git.liezhi.yang@windriver.com>
References: <cover.1395126712.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sgml-common-native: fix the generation of sgml-docbook.cat
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
X-List-Received-Date: Tue, 18 Mar 2014 07:49:22 -0000
Content-Type: text/plain

There would be build errors if multiple builds use the same SSTATE_DIR,
and the builds use the different versions' docbook-sgml-dtd-native, the
problems are: we have multiple versions docbook-sgml-dtd-native:

docbook-sgml-dtd-3.1-native
docbook-sgml-dtd-4.1-native
docbook-sgml-dtd-4.5-native

And they depend on sgml-common-native which installs the file
sysroot/etc/sgml/sgml-docbook.cat, this file is also included in the
sstate cache file (.tar.gz), but both the 3 versions
docbook-sgml-dtd-native may update the
sysroot/ect/sgml/sgml-docbook.cat, and it is a hardlink to
SYSROOT_DESTDIR/etc/sgml/sgml-docbook.cat, so the sgml-docbook.cat in
the sstate cache file may contain the
docbook-sgml-dtd-<version>-native's info, and there would be errors when
we mirror the sstate-cache to another build which uses a different
version.

Now we exclude the sgml-docbook.cat from the ${D}, and generate
sysroot/ect/sgml/sgml-docbook.cat dynamically will fix the problem, both
the sgml-common-native and docbook-sgml-dtd-<version>-native can update
it it correctly.

The similar to docbook-dsssl-stylesheets-native and openjade-native.

[YOCTO #5994]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../docbook-dsssl-stylesheets-native_1.79.bb            |  9 +++++++++
 .../docbook-sgml-dtd/docbook-sgml-dtd-native.inc        | 10 ++++------
 meta/recipes-devtools/openjade/openjade-native_1.3.2.bb |  9 +++++++++
 .../sgml-common/sgml-common-native_0.6.3.bb             | 17 ++++++++++++-----
 4 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
index d5f5381..461b48f 100644
--- a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
+++ b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
@@ -19,6 +19,7 @@ inherit native
 
 SSTATEPOSTINSTFUNCS += "docbook_dsssl_stylesheets_sstate_postinst"
 SYSROOT_PREPROCESS_FUNCS += "docbook_dsssl_sysroot_preprocess"
+CLEANFUNCS += "docbook_dsssl_stylesheets_sstate_clean"
 
 
 do_install () {
@@ -57,3 +58,11 @@ docbook_dsssl_sysroot_preprocess () {
     install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-dsssl
 }
 
+docbook_dsssl_stylesheets_sstate_clean () {
+	# Ensure that the catalog file sgml-docbook.cat is properly
+	# updated when the package is removed from sstate cache.
+	files="${sysconfdir}/sgml/sgml-docbook.bak ${sysconfdir}/sgml/sgml-docbook.cat"
+	for f in $files; do
+		[ ! -f $f ] || sed -i '/\/sgml\/dsssl-docbook-stylesheets.cat/d' $f
+	done
+}
diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
index b2381bd..af50987 100644
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
+++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
@@ -63,10 +63,8 @@ CLEANFUNCS += "docbook_sgml_dtd_sstate_clean"
 docbook_sgml_dtd_sstate_clean () {
 	# Ensure that the catalog file sgml-docbook.cat is properly
 	# updated when the package is removed from sstate cache.
-	if [ -f ${sysconfdir}/sgml/sgml-docbook.bak ]; then
-		sed -i '/'"\/sgml\/sgml-docbook-dtd-${DTD_VERSION}.cat"'/d' \
-			${sysconfdir}/sgml/sgml-docbook.bak
-		sed -i '/'"\/sgml\/sgml-docbook-dtd-${DTD_VERSION}.cat"'/d' \
-			${sysconfdir}/sgml/sgml-docbook.cat
-	fi
+	files="${sysconfdir}/sgml/sgml-docbook.bak ${sysconfdir}/sgml/sgml-docbook.cat"
+	for f in $files; do
+		[ ! -f $f ] || sed -i '/\/sgml\/sgml-docbook-dtd-${DTD_VERSION}.cat/d' $f
+	done
 }
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index ccce421..fa7aa62 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -40,6 +40,7 @@ CFLAGS =+ "-I${S}/include"
 
 SSTATEPOSTINSTFUNCS += "openjade_sstate_postinst"
 SYSROOT_PREPROCESS_FUNCS += "openjade_sysroot_preprocess"
+CLEANFUNCS += "openjade_sstate_clean"
 
 # configure.in needs to be reloacted to trigger reautoconf
 do_extraunpack () {
@@ -97,3 +98,11 @@ openjade_sysroot_preprocess () {
     install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-openjade
 }
 
+openjade_sstate_clean () {
+	# Ensure that the catalog file sgml-docbook.cat is properly
+	# updated when the package is removed from sstate cache.
+	files="${sysconfdir}/sgml/sgml-docbook.bak ${sysconfdir}/sgml/sgml-docbook.cat"
+	for f in $files; do
+		[ ! -f $f ] || sed -i '/\/sgml\/openjade-${PV}.cat/d' $f
+	done
+}
diff --git a/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb b/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
index af7e104..5975365 100644
--- a/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
+++ b/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
@@ -22,6 +22,7 @@ S = "${WORKDIR}/sgml-common-${PV}"
 
 SYSROOT_PREPROCESS_FUNCS += "sgml_common_native_mangle"
 SSTATEPOSTINSTFUNCS += "sgml_common_sstate_postinst"
+CLEANFUNCS += "sgml_common_sstate_clean"
 
 
 do_install_append() {
@@ -33,9 +34,8 @@ do_install_append() {
 		--add ${D}${sysconfdir}/sgml/sgml-ent.cat \
 		${D}${datadir}/sgml/sgml-iso-entities-8879.1986/catalog
 
-	${D}${bindir}/install-catalog \
-		--add ${D}${sysconfdir}/sgml/sgml-docbook.cat \
-		${D}${sysconfdir}/sgml/sgml-ent.cat
+	# The sgml-docbook.cat will be regenerated by sstate_postinst
+	rm -f ${D}${sysconfdir}/sgml/sgml-docbook.cat
 }
 
 sgml_common_native_mangle () {
@@ -43,8 +43,6 @@ sgml_common_native_mangle () {
 	sed -i -e "s|${D}${sysconfdir}/sgml|${sysconfdir}/sgml|g" ${SYSROOT_DESTDIR}${STAGING_BINDIR}/install-catalog
 	# Change path from ${D}${datadir}/sgml/sgml-iso-entities-8879.1986/catalog to ${datadir}/sgml/sgml-iso-entities-8879.1986/catalog in sgml-ent.cat
 	sed -i -e "s|${D}${datadir}/sgml/sgml-iso-entities-8879.1986/catalog|${datadir}/sgml/sgml-iso-entities-8879.1986/catalog|g" ${SYSROOT_DESTDIR}${sysconfdir}/sgml/sgml-ent.cat
-	# Change path from ${D}${sysconfdir}/sgml/sgml-ent.cat|${sysconfdir}/sgml/sgml-ent.cat to ${sysconfdir}/sgml/sgml-ent.cat in sgml-ent.cat
-	sed -i -e "s|${D}${sysconfdir}/sgml/sgml-ent.cat|${sysconfdir}/sgml/sgml-ent.cat|g" ${SYSROOT_DESTDIR}${sysconfdir}/sgml/sgml-docbook.cat
 	# Remove ${D} path from catalog file created by install-catalog script
 	sed -i -e "s|${D}||g" ${SYSROOT_DESTDIR}${sysconfdir}/sgml/catalog
 }
@@ -52,6 +50,7 @@ sgml_common_native_mangle () {
 sgml_common_sstate_postinst() {
 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
 	then
+		${bindir}/install-catalog --add ${sysconfdir}/sgml/sgml-docbook.cat ${sysconfdir}/sgml/sgml-ent.cat
 		if [ -e ${sysconfdir}/sgml/sgml-docbook.bak ]; then
 			for catalog in `awk '{print $2}' ${sysconfdir}/sgml/sgml-docbook.bak`; do
 				if [ ! `grep $catalog ${sysconfdir}/sgml/sgml-docbook.cat 1> /dev/null 2>&1` ]; then
@@ -62,3 +61,11 @@ sgml_common_sstate_postinst() {
 		fi
 	fi
 }
+
+sgml_common_sstate_clean () {
+	# Ensure that the catalog file sgml-docbook.cat is properly
+	# updated when the package is removed from sstate cache.
+	if [ -f ${sysconfdir}/sgml/sgml-docbook.cat ]; then
+		sed -i '/\/sgml\/sgml-ent.cat/d' ${sysconfdir}/sgml/sgml-docbook.cat
+	fi
+}
-- 
1.8.3.1


