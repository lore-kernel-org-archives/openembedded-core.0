Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CD9237327F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 10:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8FAmixN014945 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 11:48:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hJVihtWwExtk
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 11:48:44 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8FAmdNa014940
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 11:48:40 +0100
Message-ID: <1473936519.7207.83.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Sep 2016 11:48:39 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] openjade/sgml-common: Add sstate postrm commands
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
X-List-Received-Date: Thu, 15 Sep 2016 10:48:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

If you bump the PR of sgml-common and openjade-native but not sgml-
common-native, you will see a failure as files were removed from the
sysroot but still referenced by the sgml docbook catalog.

To properly handle this, the clean function needs to run at sstate
removal time, the problem is that this sstate removal can happen when
the metadata isn't present, so the correct removal commands are
unknown.

To avoid this, we need to write the commands into a "postrm" script
when we install the files, this can then be executed at sstate removal
time.

[YOCTO #8273]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index afcb8ca..d922db9 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -48,7 +48,6 @@ CXXFLAGS += "-fno-tree-dse"
 
 SSTATEPOSTINSTFUNCS += "openjade_sstate_postinst"
 SYSROOT_PREPROCESS_FUNCS += "openjade_sysroot_preprocess"
-CLEANFUNCS += "openjade_sstate_clean"
 
 # configure.in needs to be reloacted to trigger reautoconf
 do_extraunpack () {
@@ -104,19 +103,19 @@ openjade_sstate_postinst() {
 		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-openjade \
 			--add ${sysconfdir}/sgml/sgml-docbook.cat \
 			${sysconfdir}/sgml/openjade-${PV}.cat
+		cat << EOF > ${SSTATE_INST_POSTRM}
+#!/bin/sh
+# Ensure that the catalog file sgml-docbook.cat is properly
+# updated when the package is removed from sstate cache.
+files="${sysconfdir}/sgml/sgml-docbook.bak ${sysconfdir}/sgml/sgml-docbook.cat"
+for f in \$files; do
+	[ ! -f \$f ] || sed -i '/\/sgml\/openjade-${PV}.cat/d' \$f
+done
+EOF
 	fi
 }
 
 openjade_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
     install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-openjade
-}
-
-openjade_sstate_clean () {
-	# Ensure that the catalog file sgml-docbook.cat is properly
-	# updated when the package is removed from sstate cache.
-	files="${sysconfdir}/sgml/sgml-docbook.bak ${sysconfdir}/sgml/sgml-docbook.cat"
-	for f in $files; do
-		[ ! -f $f ] || sed -i '/\/sgml\/openjade-${PV}.cat/d' $f
-	done
-}
+}
diff --git a/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb b/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
index 5975365..97b308a 100644
--- a/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
+++ b/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
@@ -22,8 +22,6 @@ S = "${WORKDIR}/sgml-common-${PV}"
 
 SYSROOT_PREPROCESS_FUNCS += "sgml_common_native_mangle"
 SSTATEPOSTINSTFUNCS += "sgml_common_sstate_postinst"
-CLEANFUNCS += "sgml_common_sstate_clean"
-
 
 do_install_append() {
 	# install-catalog script contains hard-coded references to
@@ -59,13 +57,14 @@ sgml_common_sstate_postinst() {
 				fi
 			done
 		fi
-	fi
-}
+		cat << EOF > ${SSTATE_INST_POSTRM}
+#!/bin/sh
 
-sgml_common_sstate_clean () {
-	# Ensure that the catalog file sgml-docbook.cat is properly
-	# updated when the package is removed from sstate cache.
-	if [ -f ${sysconfdir}/sgml/sgml-docbook.cat ]; then
-		sed -i '/\/sgml\/sgml-ent.cat/d' ${sysconfdir}/sgml/sgml-docbook.cat
+# Ensure that the catalog file sgml-docbook.cat is properly
+# updated when the package is removed from sstate cache.
+if [ -f ${sysconfdir}/sgml/sgml-docbook.cat ]; then
+	sed -i '/\/sgml\/sgml-ent.cat/d' ${sysconfdir}/sgml/sgml-docbook.cat
+fi
+EOF
 	fi
 }



