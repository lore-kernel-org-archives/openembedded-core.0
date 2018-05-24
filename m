Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 511AF747B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 02:20:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4O2Jqso022816
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 19:20:07 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 23 May 2018 19:19:41 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2018 10:19:40 +0800
Message-ID: <1527128380-337444-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] systemd/pixbufcache/gio-module-cache/fontcache: fix build warning when using qemu usermode
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
X-List-Received-Date: Thu, 24 May 2018 02:20:16 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

udev-hwdb/pixbufcache/gio-module-cache/fontcache uses qemu usermode by default,
but some architecture such as Intel skylake does not support qemu usermode, this can
lead to a build warning as below:
warning: %post(udev-hwdb-1:234-r0.skylake_64) scriptlet failed, exit status
"WARNING: The postinstall intercept hook 'update_pixbufcache' failed".
"WARNING: The postinstall intercept hook 'update_gio_module_cache' failed".
"WARNING: The postinstall intercept hook 'update_font_cache' failed".

Add a judgement of qemu usermode to fix the build warning.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/fontcache.bbclass           | 18 +++++++++++-------
 meta/classes/gio-module-cache.bbclass    | 18 +++++++++++-------
 meta/classes/pixbufcache.bbclass         |  8 ++++++--
 meta/recipes-core/systemd/systemd_237.bb | 10 +++++++---
 4 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index e763311..3eb868f 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -17,13 +17,17 @@ FONTCONFIG_CACHE_PARAMS ?= "-v"
 FONTCONFIG_CACHE_ENV ?= "FC_DEBUG=1"
 fontcache_common() {
 if [ -n "$D" ] ; then
-	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} \
-		'bindir="${bindir}"' \
-		'libdir="${libdir}"' \
-		'base_libdir="${base_libdir}"' \
-		'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
-		'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"' \
-		'fontconfigcacheenv="${FONTCONFIG_CACHE_ENV}"'
+	if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
+		$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} \
+			'bindir="${bindir}"' \
+			'libdir="${libdir}"' \
+			'base_libdir="${base_libdir}"' \
+			'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
+			'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"' \
+			'fontconfigcacheenv="${FONTCONFIG_CACHE_ENV}"'
+	else
+		exit 1
+	fi
 else
 	${FONTCONFIG_CACHE_ENV} fc-cache ${FONTCONFIG_CACHE_PARAMS}
 fi
diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-module-cache.bbclass
index e429bd3..0173823 100644
--- a/meta/classes/gio-module-cache.bbclass
+++ b/meta/classes/gio-module-cache.bbclass
@@ -5,13 +5,17 @@ GIO_MODULE_PACKAGES ??= "${PN}"
 
 gio_module_cache_common() {
 if [ "x$D" != "x" ]; then
-    $INTERCEPT_DIR/postinst_intercept update_gio_module_cache ${PKG} \
-            mlprefix=${MLPREFIX} \
-            binprefix=${MLPREFIX} \
-            libdir=${libdir} \
-            libexecdir=${libexecdir} \
-            base_libdir=${base_libdir} \
-            bindir=${bindir}
+	if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
+	    $INTERCEPT_DIR/postinst_intercept update_gio_module_cache ${PKG} \
+		    mlprefix=${MLPREFIX} \
+		    binprefix=${MLPREFIX} \
+		    libdir=${libdir} \
+		    libexecdir=${libexecdir} \
+		    base_libdir=${base_libdir} \
+		    bindir=${bindir}
+	else
+		exit 1
+	fi
 else
     ${libexecdir}/${MLPREFIX}gio-querymodules ${libdir}/gio/modules/
 fi
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index b3e507f..c7d3e84 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -12,8 +12,12 @@ PACKAGE_WRITE_DEPS += "qemu-native gdk-pixbuf-native"
 
 pixbufcache_common() {
 if [ "x$D" != "x" ]; then
-	$INTERCEPT_DIR/postinst_intercept update_pixbuf_cache ${PKG} mlprefix=${MLPREFIX} libdir=${libdir} \
-		bindir=${bindir} base_libdir=${base_libdir}
+	if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
+		$INTERCEPT_DIR/postinst_intercept update_pixbuf_cache ${PKG} mlprefix=${MLPREFIX} libdir=${libdir} \
+			bindir=${bindir} base_libdir=${base_libdir}
+	else
+		exit 1
+	fi
 else
 
 	# Update the pixbuf loaders in case they haven't been registered yet
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index b7c2113..f4847f8 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -580,9 +580,13 @@ pkg_prerm_${PN} () {
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
-		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
-			--root $D
-		chown root:root $D${sysconfdir}/udev/hwdb.bin
+		if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
+			${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
+				--root $D
+			chown root:root $D${sysconfdir}/udev/hwdb.bin
+		else
+			exit 1
+		fi
 	else
 		udevadm hwdb --update
 	fi
-- 
2.7.4


