Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TGE62-0006yx-BZ
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 21:13:34 +0200
Received: by padfa11 with SMTP id fa11so870706pad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 12:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0AbonkH+zh+hhvTu5z1HJ5V84hDV+i5Him8EXhgNlEY=;
	b=S8f6uWtcakBAdjV0qLXBe/OsMCj7hHTLLfrPqkstVbUl1QKrNUeQL/B4ZRuH2zmH9y
	p/U5nrnGvQpBRAmKXk0zO8NXzNzqxV612qFgDlWJqwMe6JqX7se+p4doDIfIpuqJ7vrH
	PIImxgkCgBo3Q2S695TOYEjkY+55tA01VbK8WMQU2nqukU157aivP9fSgFoG6lrA0k0R
	yneaIQ0qHFSXgTCRxvFeYHw2+u+cKdpa4XiMDtyzHKRs58ev2lLFRtECU6GxJ3mRSwHw
	F3usdiD2apRDxnTLuOC2O578apjzQdNOoMQsL8Muv/fF57QOyl7l/pwCccdYQKA4s/KB
	plcA==
Received: by 10.68.134.97 with SMTP id pj1mr39191157pbb.55.1348513245437;
	Mon, 24 Sep 2012 12:00:45 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id qb2sm10032951pbb.15.2012.09.24.12.00.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 12:00:44 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 12:00:41 -0700
Message-Id: <1348513241-18271-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] Add and use 'localedir' variable
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
X-List-Received-Date: Mon, 24 Sep 2012 19:13:34 -0000

From: Christopher Larson <chris_larson@mentor.com>

This avoids the hardcoding of ${libdir}/locale which is all over the place,
and will facilitate use of ${exec_prefix}/lib/locale instead of
${libdir}/locale.

This doesn't actually change any output at this time. Verified this with
buildhistory against the packages produced from core-image-base.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/libc-common.bbclass            |    2 +-
 meta/classes/libc-package.bbclass           |   27 ++++++++++++++-------------
 meta/conf/bitbake.conf                      |    1 +
 meta/recipes-core/eglibc/eglibc-locale.inc  |    6 +++---
 meta/recipes-core/eglibc/eglibc-package.inc |   11 ++++++++---
 meta/recipes-core/eglibc/eglibc.inc         |    1 +
 6 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index 06d5201..0f49936 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -5,7 +5,7 @@ do_install() {
 		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${D}/${includedir}/rpcsvc/
 	done
 	install -m 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/
-	install -d ${D}${libdir}/locale
+	install -d ${D}${localedir}
 	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
 	# get rid of some broken files...
 	for i in ${GLIBC_BROKEN_LOCALES}; do
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 70490ef..80d7124 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -65,12 +65,12 @@ fi
 
 rm -rf ${TMP_LOCALE}
 mkdir -p ${TMP_LOCALE}
-if [ -f ${libdir}/locale/locale-archive ]; then
-        cp ${libdir}/locale/locale-archive ${TMP_LOCALE}/
+if [ -f ${localedir}/locale-archive ]; then
+        cp ${localedir}/locale-archive ${TMP_LOCALE}/
 fi
 localedef --inputfile=${datadir}/i18n/locales/%s --charmap=%s --prefix=/tmp/locale %s
-mkdir -p ${libdir}/locale/
-mv ${TMP_LOCALE}/locale-archive ${libdir}/locale/
+mkdir -p ${localedir}/
+mv ${TMP_LOCALE}/locale-archive ${localedir}/
 rm -rf ${TMP_LOCALE}
 }
 
@@ -80,22 +80,22 @@ locale_base_postrm() {
 
 rm -rf ${TMP_LOCALE}
 mkdir -p ${TMP_LOCALE}
-if [ -f ${libdir}/locale/locale-archive ]; then
-	cp ${libdir}/locale/locale-archive ${TMP_LOCALE}/
+if [ -f ${localedir}/locale-archive ]; then
+	cp ${localedir}/locale-archive ${TMP_LOCALE}/
 fi
 localedef --delete-from-archive --inputfile=${datadir}/locales/%s --charmap=%s --prefix=/tmp/locale %s
-mv ${TMP_LOCALE}/locale-archive ${libdir}/locale/
+mv ${TMP_LOCALE}/locale-archive ${localedir}/
 rm -rf ${TMP_LOCALE}
 }
 
 
-TMP_LOCALE="/tmp/locale${libdir}/locale"
+TMP_LOCALE="/tmp/locale${localedir}"
 LOCALETREESRC ?= "${PKGD}"
 
 do_prep_locale_tree() {
 	treedir=${WORKDIR}/locale-tree
 	rm -rf $treedir
-	mkdir -p $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${datadir} $treedir/${libdir}/locale
+	mkdir -p $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${datadir} $treedir/${localedir}
 	tar -cf - -C ${LOCALETREESRC}${datadir} -ps i18n | tar -xf - -C $treedir/${datadir}
 	# unzip to avoid parsing errors
 	for i in $treedir/${datadir}/i18n/charmaps/*gz; do 
@@ -111,8 +111,9 @@ do_prep_locale_tree() {
 do_collect_bins_from_locale_tree() {
 	treedir=${WORKDIR}/locale-tree
 
-	mkdir -p ${PKGD}${libdir}
-	tar -cf - -C $treedir/${libdir} -ps locale | tar -xf - -C ${PKGD}${libdir}
+	parent=$(dirname ${localedir})
+	mkdir -p ${PKGD}/$parent
+	tar -cf - -C $treedir/$parent -ps $(basename ${localedir}) | tar -xf - -C ${PKGD}$parent
 }
 
 inherit qemu
@@ -141,7 +142,7 @@ python package_do_split_gconvs () {
     gconv_libdir = base_path_join(libdir, "gconv")
     charmap_dir = base_path_join(datadir, "i18n", "charmaps")
     locales_dir = base_path_join(datadir, "i18n", "locales")
-    binary_locales_dir = base_path_join(libdir, "locale")
+    binary_locales_dir = d.getVar('localedir', True)
 
     def calc_gconv_deps(fn, pkg, file_regex, output_pattern, group):
         deps = []
@@ -259,7 +260,7 @@ python package_do_split_gconvs () {
         path = d.getVar("PATH", True)
         i18npath = base_path_join(treedir, datadir, "i18n")
         gconvpath = base_path_join(treedir, "iconvdata")
-        outputpath = base_path_join(treedir, libdir, "locale")
+        outputpath = base_path_join(treedir, binary_locales_dir)
 
         use_cross_localedef = d.getVar("LOCALE_GENERATION_WITH_CROSS-LOCALEDEF", True) or "0"
         if use_cross_localedef == "1":
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9b41749..3496d2b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -40,6 +40,7 @@ export libdir = "${exec_prefix}/${baselib}"
 export includedir = "${exec_prefix}/include"
 export oldincludedir = "${exec_prefix}/include"
 export systemd_unitdir = "${base_libdir}/systemd"
+localedir = "${libdir}/locale"
 
 # Linkage between native/cross/nativesdk layouts
 base_bindir_native = "/bin"
diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 296afde..105cf2e 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -69,12 +69,12 @@ FILES_localedef = "${bindir}/localedef"
 LOCALETREESRC = "${STAGING_INCDIR}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}"
 
 do_install () {
-	mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir}
+	mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir} ${D}${localedir}
 	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
 		cp -fpPR ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
 	fi
-	if [ -e ${LOCALETREESRC}/${libdir}/locale ]; then
-		cp -fpPR ${LOCALETREESRC}/${libdir}/locale ${D}${libdir}
+	if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
+		cp -fpPR ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
 	fi
 	if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
 		cp -fpPR ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index ab7540a..0059bcf 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -98,7 +98,9 @@ do_install_locale () {
 	if [ -e ${D}${libdir}/gconv ]; then
 		mv -f ${D}${libdir}/gconv ${dest}${libdir}
 	fi
-	cp -fpPR ${D}${libdir}/* ${dest}${libdir}
+	if [ -e ${D}${exec_prefix}/lib ]; then
+		cp -fpPR ${D}${exec_prefix}/lib ${dest}${exec_prefix}
+	fi
 	if [ -e ${D}${datadir}/i18n ]; then
 		mv ${D}${datadir}/i18n ${dest}${datadir}
 	fi
@@ -113,6 +115,9 @@ PACKAGE_PREPROCESS_FUNCS += "eglibc_package_preprocess"
 
 eglibc_package_preprocess () {
 	rm -rf ${PKGD}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
-	rm -rf ${PKGD}/${libdir}/locale
+	rm -rf ${PKGD}/${localedir}
+	if [ "${libdir}" != "${exec_prefix}/lib" ]; then
+		# This dir only exists to hold locales
+		rm -rf ${PKGD}${exec_prefix}/lib
+	fi
 }
-
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 29e303f..cae955d 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -34,6 +34,7 @@ LEAD_SONAME = "libc.so"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KSH=${base_bindir}/bash \
                        ac_cv_path_BASH_SHELL=${base_bindir}/bash \
+                       libc_cv_localedir=${localedir} \
 		       libc_cv_ssp=no \
 		       "
 
-- 
1.7.9.5



