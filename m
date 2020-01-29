Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B4269605F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:34:34 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m10so6479989wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z5ZwM9C4e43dypNPZM05sEdc3iyWB5UaV5JnUrJxLsY=;
	b=R/Wlhry2dG+kRjIdtIKgiMf8zIporpv7tPWxCRTKw5Qs+MdjJ3ssSqgWmD9Gt8TZL1
	EYxljPpqV668NRdAAGYgxwk/nPkG+4+cSFqjlfRoLUMYAzX3TNoTe2iYhTP8GsbOgIMr
	P/V9HrbYc1Iz1JuX0xPwaFS7b2tkQPkKiMMsb+QQPJzpI2b/S2g15ZA2PMG4w3OiP9hU
	V7qQ4OTenxNgMuslm/nWwNsBsEZkwNeZ41cR/w6uXgk4WKKrAx0/MEKIIIvMwEU3EQlr
	UacQqBjibmvp4jEeJKvsvmxYLuLIfpvsZcTvMlT5fN08tCaZNRdwF500SRwaxOcqH4KK
	GVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z5ZwM9C4e43dypNPZM05sEdc3iyWB5UaV5JnUrJxLsY=;
	b=sBVT5Nx4u7tBOztcIHerIWqCZbVv/xHgpJOXszAHoOfYZkJIxFpIVeSkM+Z83OiWXV
	JhvjIZXwFvLe5+nK2BGvNr3L3TfCf37KszBbZQj5RzMxpBn7qRNdjYrcUC6DRl6i7l/d
	wnonmYSbCle1Fpx9dq9uY04lB+0j2c2m+oPgLNx9d1TMPdKjIGm07RwsQRDnyjwu9Dsp
	xS0Hl5l301lqgDVT7uap5mMhQ9859439tBPVuFrPZmagN+khtND3aEYctysSbDeHf87L
	dRvYSq7q/rU7F4DuF6iVQ/jCxPgWudnZDIa+73DVNHVwxKHbA1VGA0KKUOe3erXlfEpy
	QtYQ==
X-Gm-Message-State: APjAAAUW2R2CQ8cDu2xatF2YP+MCzGxgfsKlAgvM4GfZCLmRJSzAQBkj
	QNP8qBmkF21w1z2i9oPRB8tvPlDrOTb+vw==
X-Google-Smtp-Source: APXvYqyvmA8FaeyeWbNiZEoGy9vbrODrIWrFTWDxjPcPdcIg5dFLxE0SMtZnAcLt3SOISEVbHtY4Tw==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr1173841wmi.116.1580332430322; 
	Wed, 29 Jan 2020 13:13:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z10sm3486464wmk.31.2020.01.29.13.13.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 13:13:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 21:13:46 +0000
Message-Id: <20200129211346.8149-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] glibc: merge libc-common.bbclass into glibc.bb
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
X-List-Received-Date: Thu, 30 Jan 2020 13:35:19 -0000
Content-Transfer-Encoding: 8bit

There's only one user of libc-common now that we don't ship both glibc and
eglibc, so copy the contents directly into the recipe.

[ YOCTO #12135 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/libc-common.bbclass          | 37 ---------------------
 meta/recipes-core/glibc/glibc-package.inc | 40 +++++++++++++++++++++--
 2 files changed, 38 insertions(+), 39 deletions(-)
 delete mode 100644 meta/classes/libc-common.bbclass

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
deleted file mode 100644
index 0e351b67464..00000000000
--- a/meta/classes/libc-common.bbclass
+++ /dev/null
@@ -1,37 +0,0 @@
-do_install() {
-	oe_runmake install_root=${D} install
-	install -Dm 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/ld.so.conf
-	install -d ${D}${localedir}
-	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
-	# get rid of some broken files...
-	for i in ${GLIBC_BROKEN_LOCALES}; do
-		sed -i "/$i/d" ${WORKDIR}/SUPPORTED
-	done
-	rm -f ${D}${sysconfdir}/rpc
-	rm -rf ${D}${datadir}/zoneinfo
-	rm -rf ${D}${libexecdir}/getconf
-}
-
-def get_libc_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU') in [ 'soft', 'ppc-efd' ]:
-        return "--without-fp"
-    return ""
-
-python populate_packages_prepend () {
-    if d.getVar('DEBIAN_NAMES'):
-        pkgs = d.getVar('PACKAGES').split()
-        bpn = d.getVar('BPN')
-        prefix = d.getVar('MLPREFIX') or ""
-        # Set the base package...
-        d.setVar('PKG_' + prefix + bpn, prefix + 'libc6')
-        libcprefix = prefix + bpn + '-'
-        for p in pkgs:
-            # And all the subpackages.
-            if p.startswith(libcprefix):
-                renamed = p.replace(bpn, 'libc6', 1)
-                d.setVar('PKG_' + p, renamed)
-        # For backward compatibility with old -dbg package
-        d.appendVar('RPROVIDES_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
-        d.appendVar('RCONFLICTS_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
-        d.appendVar('RREPLACES_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
-}
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index ede9e9b9096..8d3d76bb416 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -65,9 +65,21 @@ DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconv, loc
 DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
 DESCRIPTION_tzcode = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
-inherit libc-common multilib_header
+inherit multilib_header
+
+do_install() {
+	oe_runmake install_root=${D} install
+	install -Dm 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/ld.so.conf
+	install -d ${D}${localedir}
+	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
+	# get rid of some broken files...
+	for i in ${GLIBC_BROKEN_LOCALES}; do
+		sed -i "/$i/d" ${WORKDIR}/SUPPORTED
+	done
+	rm -f ${D}${sysconfdir}/rpc
+	rm -rf ${D}${datadir}/zoneinfo
+	rm -rf ${D}${libexecdir}/getconf
 
-do_install_append () {
 	rm -f ${D}${sysconfdir}/localtime
 
 	# remove empty glibc dir
@@ -108,6 +120,11 @@ do_install_append () {
 	fi
 }
 
+def get_libc_fpu_setting(bb, d):
+    if d.getVar('TARGET_FPU') in [ 'soft', 'ppc-efd' ]:
+        return "--without-fp"
+    return ""
+
 do_install_append_class-target() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/tmpfiles.d
@@ -233,6 +250,25 @@ stash_locale_package_cleanup() {
 	stash_locale_cleanup ${PKGD}
 }
 
+python populate_packages_prepend () {
+    if d.getVar('DEBIAN_NAMES'):
+        pkgs = d.getVar('PACKAGES').split()
+        bpn = d.getVar('BPN')
+        prefix = d.getVar('MLPREFIX') or ""
+        # Set the base package...
+        d.setVar('PKG_' + prefix + bpn, prefix + 'libc6')
+        libcprefix = prefix + bpn + '-'
+        for p in pkgs:
+            # And all the subpackages.
+            if p.startswith(libcprefix):
+                renamed = p.replace(bpn, 'libc6', 1)
+                d.setVar('PKG_' + p, renamed)
+        # For backward compatibility with old -dbg package
+        d.appendVar('RPROVIDES_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
+        d.appendVar('RCONFLICTS_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
+        d.appendVar('RREPLACES_' + libcprefix + 'dbg', ' ' + prefix + 'libc-dbg')
+}
+
 pkg_postinst_nscd () {
 	if [ -z "$D" ]; then
 		if command -v systemd-tmpfiles >/dev/null; then
-- 
2.20.1


