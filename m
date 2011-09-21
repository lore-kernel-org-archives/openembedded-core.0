Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R6Bbc-0000PI-T2
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 03:28:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8L1Mo3f016805
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 18:22:50 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 20 Sep 2011 18:22:49 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 20:24:53 -0500
Message-ID: <66f977cb010655b5a19143993f5f643fee7c9154.1316568118.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1316568118.git.mark.hatle@windriver.com>
References: <cover.1316568118.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/7] multilib: install MULTILIB_IMAGE_INSTALL [v2]
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
X-List-Received-Date: Wed, 21 Sep 2011 01:28:09 -0000
Content-Type: text/plain

From: Dongxiao Xu <dongxiao.xu@intel.com>

If user set MULTILIB_IMAGE_INSTALL, we need to install those multitlib
packages into the final image.

Also fix the logic in handling multilib prefix. For certain case like a
normal image contains several multilib libraries, the image recipe isn't
extended with MLPREFIX, therefore we need to enumerate the possible
multilib prefixes and compare them with package prefixes.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |   42 +++++++++++++++++++++++++------------
 meta/classes/rootfs_rpm.bbclass  |    4 +++
 2 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9ef1acd..4605ec8 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -166,7 +166,7 @@ package_install_internal_rpm () {
 	local platform="${INSTALL_PLATFORM_RPM}"
 	local platform_extra="${INSTALL_PLATFORM_EXTRA_RPM}"
 	local confbase="${INSTALL_CONFBASE_RPM}"
-	local package_to_install="${INSTALL_PACKAGES_NORMAL_RPM}"
+	local package_to_install="${INSTALL_PACKAGES_NORMAL_RPM} ${INSTALL_PACKAGES_MULTILIB_RPM}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_RPM}"
 	local package_linguas="${INSTALL_PACKAGES_LINGUAS_RPM}"
 	local providename="${INSTALL_PROVIDENAME_RPM}"
@@ -210,10 +210,15 @@ package_install_internal_rpm () {
 				echo "Processing $pkg..."
 
 				archvar=base_archs
-				ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
-				if [ "${ml_pkg}" != "${pkg}" ]; then
-					archvar=ml_archs
-				fi
+				ml_prefix=`echo ${pkg} | cut -d'-' -f1`
+				ml_pkg=$pkg
+				for i in ${MULTILIB_PREFIX_LIST} ; do
+					if [ ${ml_prefix} == ${i} ]; then
+						ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
+						archvar=ml_archs
+						break
+					fi
+				done
 
 				pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
 				if [ -z "$pkg_name" ]; then
@@ -224,16 +229,20 @@ package_install_internal_rpm () {
 			done
 		fi
 	fi
-
 	if [ ! -z "${package_to_install}" ]; then
 		for pkg in ${package_to_install} ; do
 			echo "Processing $pkg..."
 
 			archvar=base_archs
-			ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
-			if [ "${ml_pkg}" != "${pkg}" ]; then
-				archvar=ml_archs
-			fi
+			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
+			ml_pkg=$pkg
+			for i in ${MULTILIB_PREFIX_LIST} ; do
+				if [ ${ml_prefix} == ${i} ]; then
+					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
+					archvar=ml_archs
+					break
+				fi
+			done
 
 			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
 			if [ -z "$pkg_name" ]; then
@@ -258,10 +267,15 @@ package_install_internal_rpm () {
 		for pkg in ${package_attemptonly} ; do
 			echo "Processing $pkg..."
 			archvar=base_archs
-			ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
-			if [ "${ml_pkg}" != "${pkg}" ]; then
-				archvar=ml_archs
-			fi
+			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
+			ml_pkg=$pkg
+			for i in ${MULTILIB_PREFIX_LIST} ; do
+				if [ ${ml_prefix} == ${i} ]; then
+					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
+					archvar=ml_archs
+					break
+				fi
+			done
 
 			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
 			if [ -z "$pkg_name" ]; then
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 7936d77..5ac6bca 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -58,6 +58,7 @@ fakeroot rootfs_rpm_do_rootfs () {
 	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
 	export INSTALL_PACKAGES_NORMAL_RPM="${PACKAGE_INSTALL}"
+	export INSTALL_PACKAGES_MULTILIB_RPM="${MULTILIB_PACKAGE_INSTALL}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${PACKAGE_INSTALL_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM="${LINGUAS_INSTALL}"
 	export INSTALL_PROVIDENAME_RPM=""
@@ -210,6 +211,7 @@ python () {
         bb.data.setVar('RPM_POSTPROCESS_COMMANDS', '', d)
 
     ml_package_archs = ""
+    ml_prefix_list = ""
     multilibs = d.getVar('MULTILIBS', True) or ""
     for ext in multilibs.split():
         eext = ext.split(':')
@@ -221,6 +223,8 @@ python () {
             localdata.setVar("MACHINE_ARCH", eext[1] + "_" + localdata.getVar("MACHINE_ARCH", False))
             package_archs = localdata.getVar("PACKAGE_ARCHS", True) or ""
             ml_package_archs += " " + package_archs
+            ml_prefix_list += " " + eext[1]
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
     bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
+    bb.data.setVar('MULTILIB_PREFIX_LIST', ml_prefix_list, d)
 }
-- 
1.7.3.4



