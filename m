Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 619B76B7AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:29:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7EKTQKC021926
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 13:29:26 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 14 Aug 2013 13:29:25 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 15:30:05 -0500
Message-ID: <1376512209-11622-8-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 07/11] package_deb: Add support for NO_RECOMMENDATIONS and PACKAGE_EXCLUDE
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
X-List-Received-Date: Wed, 14 Aug 2013 20:29:24 -0000
Content-Type: text/plain

Add support for NO_RECOMMENDATIONS and PACKAGE_EXCLUDE.  Also add a
warning that ensures users know that BAD_RECOMMENDATIONS support is
not implemented in the debian package/rootfs classes.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_deb.bbclass | 17 +++++++++++++----
 meta/classes/rootfs_deb.bbclass  |  8 +++++++-
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 4980555..068c11a 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -12,6 +12,8 @@ PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
 
 APTCONF_TARGET = "${WORKDIR}"
 
+APT_ARGS = "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS", True) == "1"]}"
+
 #
 # Update the Packages index files in ${DEPLOY_DIR_DEB}
 #
@@ -83,6 +85,13 @@ package_install_internal_deb () {
 		priority=$(expr $priority + 5)
 	done
 
+	for pkg in ${PACKAGE_EXCLUDE}; do
+		(echo "Package: $pkg"
+		echo "Pin: release *"
+		echo "Pin-Priority: -1"
+		echo) >> ${APTCONF_TARGET}/apt/preferences
+	done
+
 	tac ${APTCONF_TARGET}/apt/sources.list.rev > ${APTCONF_TARGET}/apt/sources.list
 
 	# The params in deb package control don't allow character `_', so
@@ -105,7 +114,7 @@ package_install_internal_deb () {
 
 	if [ ! -z "${package_linguas}" ]; then
 		for i in ${package_linguas}; do
-			apt-get install $i --force-yes --allow-unauthenticated
+			apt-get ${APT_ARGS} install $i --force-yes --allow-unauthenticated
 			if [ $? -ne 0 ]; then
 				exit 1
 			fi
@@ -114,13 +123,13 @@ package_install_internal_deb () {
 
 	# normal install
 	if [ ! -z "${package_to_install}" ]; then
-		apt-get install ${package_to_install} --force-yes --allow-unauthenticated
+		apt-get ${APT_ARGS} install ${package_to_install} --force-yes --allow-unauthenticated
 		if [ $? -ne 0 ]; then
 			exit 1
 		fi
 
 		# Attempt to correct the probable broken dependencies in place.
-		apt-get -f install
+		apt-get ${APT_ARGS} -f install
 		if [ $? -ne 0 ]; then
 			exit 1
 		fi
@@ -129,7 +138,7 @@ package_install_internal_deb () {
 	rm -f `dirname ${BB_LOGFILE}`/log.do_${task}-attemptonly.${PID}
 	if [ ! -z "${package_attemptonly}" ]; then
 		for i in ${package_attemptonly}; do
-			apt-get install $i --force-yes --allow-unauthenticated >> `dirname ${BB_LOGFILE}`/log.do_${task}-attemptonly.${PID} 2>&1 || true
+			apt-get ${APT_ARGS} install $i --force-yes --allow-unauthenticated >> `dirname ${BB_LOGFILE}`/log.do_${task}-attemptonly.${PID} 2>&1 || true
 		done
 	fi
 
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index edd1037..dcfe786 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -11,6 +11,12 @@ rootfs_deb_do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
+python rootfs_deb_bad_recommendations() {
+    if d.getVar("BAD_RECOMMENDATIONS", True):
+	bb.warn("Debian package install does not support BAD_RECOMMENDATIONS")
+}
+do_rootfs[prefuncs] += "rootfs_deb_bad_recommendations"
+
 DEB_POSTPROCESS_COMMANDS = ""
 
 opkglibdir = "${localstatedir}/lib/opkg"
@@ -113,7 +119,7 @@ remove_packaging_data_files() {
 }
 
 rootfs_install_packages() {
-	${STAGING_BINDIR_NATIVE}/apt-get install `cat $1` --force-yes --allow-unauthenticated
+	${STAGING_BINDIR_NATIVE}/apt-get ${APT_ARGS} install `cat $1` --force-yes --allow-unauthenticated
 
 	# Mark all packages installed
 	sed -i -e "s/Status: install ok unpacked/Status: install ok installed/;" $INSTALL_ROOTFS_DEB/var/lib/dpkg/status
-- 
1.8.1.2.545.g2f19ada


