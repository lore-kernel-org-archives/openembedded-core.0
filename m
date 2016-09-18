Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53E786FF60
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 02:52:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8I2qhlL000353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 19:52:44 -0700
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 17 Sep 2016 19:52:43 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Sep 2016 10:51:49 +0800
Message-ID: <1474167109-6666-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] bash2dash conversion
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
X-List-Received-Date: Sun, 18 Sep 2016 02:52:45 -0000
Content-Type: text/plain

From: "Tim K. Chan" <nirvanatk@gmail.com>

Change bash style to dash style

Signed-off-by: Tim K. Chan <nirvanatk@gmail.com>
[Adjust context]
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/classes/systemd.bbclass                            |  4 ++--
 meta/classes/update-rc.d.bbclass                        |  6 +++---
 meta/classes/useradd_base.bbclass                       |  4 ++--
 meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb |  2 +-
 meta/recipes-core/glibc/glibc-package.inc               |  2 +-
 meta/recipes-devtools/guile/guile_2.0.12.bb             |  6 ++++--
 meta/recipes-devtools/rpm/rpm_5.4.16.bb                 | 13 +++++++++++--
 7 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index db7873f..7370489 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -28,7 +28,7 @@ if [ -n "$D" ]; then
     OPTS="--root=$D"
 fi
 
-if type systemctl >/dev/null 2>/dev/null; then
+if command -p systemctl >/dev/null 2>/dev/null; then
 	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
 
 	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
@@ -44,7 +44,7 @@ if [ -n "$D" ]; then
     OPTS="--root=$D"
 fi
 
-if type systemctl >/dev/null 2>/dev/null; then
+if command -p systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
 		systemctl stop ${SYSTEMD_SERVICE}
 	fi
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 82b8024..dee80c8 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -15,7 +15,7 @@ updatercd_preinst() {
 if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
 	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
 fi
-if type update-rc.d >/dev/null 2>/dev/null; then
+if command -p update-rc.d >/dev/null 2>/dev/null; then
 	if [ -n "$D" ]; then
 		OPT="-f -r $D"
 	else
@@ -26,7 +26,7 @@ fi
 }
 
 updatercd_postinst() {
-if type update-rc.d >/dev/null 2>/dev/null; then
+if command -p update-rc.d >/dev/null 2>/dev/null; then
 	if [ -n "$D" ]; then
 		OPT="-r $D"
 	else
@@ -43,7 +43,7 @@ fi
 }
 
 updatercd_postrm() {
-if type update-rc.d >/dev/null 2>/dev/null; then
+if command -p update-rc.d >/dev/null 2>/dev/null; then
 	if [ -n "$D" ]; then
 		OPT="-f -r $D"
 	else
diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index f4dc713..35d5f06 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -59,10 +59,10 @@ perform_groupmems () {
 		gshadow="no"
 		touch $rootdir${sysconfdir}/gshadow
 	fi
-	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
+	local mem_exists="`grep "^$groupname:[!:]*:[!:]*:\([!,]*,\)*$username\(,[!,]*\)*" $rootdir/etc/group || true`"
 	if test "x$mem_exists" = "x"; then
 		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupmems \$opts\" || true
-		mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
++		mem_exists="`grep "^$groupname:[!:]*:[!:]*:\([!,]*,\)*$username\(,[!,]*\)*" $rootdir/etc/group || true`"
 		if test "x$mem_exists" = "x"; then
 			bbfatal "${PN}: groupmems command did not succeed."
 		fi
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
index 8550177..e415445 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
@@ -56,7 +56,7 @@ do_install () {
 
 pkg_postinst_${PN} () {
 	if [ -z "$D" ]; then
-		if command -v systemd-tmpfiles >/dev/null; then
+		if command -p systemd-tmpfiles >/dev/null; then
 			systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/resolvconf.conf
 		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
 			${sysconfdir}/init.d/populate-volatile.sh update
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 6df8b9e..557f32a 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -206,7 +206,7 @@ glibc_package_preprocess () {
 
 pkg_postinst_nscd () {
 	if [ -z "$D" ]; then
-		if command -v systemd-tmpfiles >/dev/null; then
+		if command -p systemd-tmpfiles >/dev/null; then
 			systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/nscd.conf
 		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
 			${sysconfdir}/init.d/populate-volatile.sh update
diff --git a/meta/recipes-devtools/guile/guile_2.0.12.bb b/meta/recipes-devtools/guile/guile_2.0.12.bb
index d2fe511..3ada0f1 100644
--- a/meta/recipes-devtools/guile/guile_2.0.12.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.12.bb
@@ -91,8 +91,10 @@ guile_cross_config() {
 	then
 	        # Create guile-config returning target values instead of native values
 	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
-        	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
-			> ${B}/guile-config.cross
+		echo -n '#!' > ${B}/guile-config.cross
+		echo -n `which x86_64-linux-guile` >> ${B}/guile-config.cross
+		printf ' \\\n--no-auto-compile -e main -s\n!#\n(define %%guile-build-info ' >> ${B}/guile-config.cross
+		echo "'(" >> ${B}/guile-config.cross
 	        sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
 			-e 's:",[ \t]*": . ":' \
 			-e 's:" *}, *\\:"):' \
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 84adef6..be3b942 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -554,13 +554,22 @@ do_install_append() {
 	install -m 0755 ${WORKDIR}/perfile_rpmdeps.sh ${D}/${libdir}/rpm/perfile_rpmdeps.sh
 
 	# Remove unpackaged files (based on list in rpm.spec)
-	rm -f ${D}/${libdir}/rpm/{Specfile.pm,cpanflute,cpanflute2,rpmdiff,rpmdiff.cgi,sql.prov,sql.req,tcl.req,trpm}
+	rm -f ${D}/${libdir}/rpm/Specfile.pm
+	rm -f ${D}/${libdir}/rpm/cpanflute
+	rm -f ${D}/${libdir}/rpm/cpanflute2
+	rm -f ${D}/${libdir}/rpm/rpmdiff
+	rm -f ${D}/${libdir}/rpm/rpmdiff.cgi
+	rm -f ${D}/${libdir}/rpm/sql.prov
+	rm -f ${D}/${libdir}/rpm/sql.req
+	rm -f ${D}/${libdir}/rpm/tcl.req
+	rm -f ${D}/${libdir}/rpm/trpm
 
 	rm -f ${D}/${mandir}/man8/rpmcache.8*
 	rm -f ${D}/${mandir}/man8/rpmgraph.8*
 	rm -f ${D}/${mandir}/*/man8/rpmcache.8*
 	rm -f ${D}/${mandir}/*/man8/rpmgraph.8*
-	rm -rf ${D}/${mandir}/{fr,ko}
+	rm -rf ${D}/${mandir}/fr
+	rm -rf ${D}/${mandir}/ko
 
 	rm -f ${D}/${includedir}/popt.h
 	rm -f ${D}/${libdir}/libpopt.*
-- 
2.8.1


