Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qn90R-0001dz-Eq
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 14:51:03 +0200
Received: by wyg30 with SMTP id 30so770611wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 05:46:45 -0700 (PDT)
Received: by 10.227.27.216 with SMTP id j24mr3390644wbc.97.1312030005586;
	Sat, 30 Jul 2011 05:46:45 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o19sm2553850wbh.9.2011.07.30.05.46.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Jul 2011 05:46:44 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jul 2011 14:46:40 +0200
Message-Id: <1312030000-7961-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] package_{deb, rpm, ipk}.bbclass: fix 'lingusa' typo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Jul 2011 12:51:03 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/package_deb.bbclass |    6 +++---
 meta/classes/package_ipk.bbclass |    6 +++---
 meta/classes/package_rpm.bbclass |    6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index fb502cb..8e363f8 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -116,7 +116,7 @@ package_install_internal_deb () {
 	local archs="${INSTALL_ARCHS_DEB}"
 	local package_to_install="${INSTALL_PACKAGES_NORMAL_DEB}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_DEB}"
-	local package_lingusa="${INSTALL_PACKAGES_LINGUAS_DEB}"
+	local package_linguas="${INSTALL_PACKAGES_LINGUAS_DEB}"
 	local task="${INSTALL_TASK_DEB}"
 
 	rm -f ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev
@@ -155,12 +155,12 @@ package_install_internal_deb () {
 
 	# Uclibc builds don't provide this stuff..
 	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
-		if [ ! -z "${package_lingusa}" ]; then
+		if [ ! -z "${package_linguas}" ]; then
 			apt-get install glibc-localedata-i18n --force-yes --allow-unauthenticated
 			if [ $? -ne 0 ]; then
 				exit 1
 			fi
-			for i in ${package_lingusa}; do
+			for i in ${package_linguas}; do
 				apt-get install $i --force-yes --allow-unauthenticated
 				if [ $? -ne 0 ]; then
 					exit 1
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index b7afa83..16574e9 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -99,7 +99,7 @@ package_install_internal_ipk() {
 	local conffile="${INSTALL_CONF_IPK}"
 	local package_to_install="${INSTALL_PACKAGES_NORMAL_IPK}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_IPK}"
-	local package_lingusa="${INSTALL_PACKAGES_LINGUAS_IPK}"
+	local package_linguas="${INSTALL_PACKAGES_LINGUAS_IPK}"
 	local package_multilib="${INSTALL_PACKAGES_MULTILIB_IPK}"
 	local task="${INSTALL_TASK_IPK}"
 
@@ -111,8 +111,8 @@ package_install_internal_ipk() {
 
 	# Uclibc builds don't provide this stuff...
 	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
-		if [ ! -z "${package_lingusa}" ]; then
-			for i in ${package_lingusa}; do
+		if [ ! -z "${package_linguas}" ]; then
+			for i in ${package_linguas}; do
 				opkg-cl ${ipkg_args} install $i
 			done
 		fi
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 0377100..2cc0584 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -194,7 +194,7 @@ package_install_internal_rpm () {
 	local confbase="${INSTALL_CONFBASE_RPM}"
 	local package_to_install="${INSTALL_PACKAGES_NORMAL_RPM}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_RPM}"
-	local package_lingusa="${INSTALL_PACKAGES_LINGUAS_RPM}"
+	local package_linguas="${INSTALL_PACKAGES_LINGUAS_RPM}"
 	local providename="${INSTALL_PROVIDENAME_RPM}"
 	local task="${INSTALL_TASK_RPM}"
 
@@ -223,8 +223,8 @@ package_install_internal_rpm () {
 
 	# Uclibc builds don't provide this stuff...
 	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
-		if [ ! -z "${package_lingusa}" ]; then
-			for pkg in ${package_lingusa}; do
+		if [ ! -z "${package_linguas}" ]; then
+			for pkg in ${package_linguas}; do
 				echo "Processing $pkg..."
 
 				archvar=base_package_archs
-- 
1.6.6.1



