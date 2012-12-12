Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TirKV-0003Mk-SO
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 19:46:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2012 10:32:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,267,1355126400"; d="scan'208";a="263101119"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.189])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2012 10:32:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 18:31:31 +0000
Message-Id: <b67528c3e3634f76a1ae148f7ac23bcba18ec3b6.1355337025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 07/13] package_rpm.bbclass: Add additional logging
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
X-List-Received-Date: Wed, 12 Dec 2012 18:46:52 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index fdca2c3..b80b939 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -261,6 +261,7 @@ package_install_internal_rpm () {
 	channel_priority=5
 	if [ "${INSTALL_COMPLEMENTARY_RPM}" != "1" ] ; then
 		# Setup base system configuration
+		echo "Note: configuring RPM platform settings"
 		mkdir -p ${target_rootfs}/etc/rpm/
 		if [ -n "${sdk_mode}" ]; then
 			platform_vendor="${SDK_VENDOR}"
@@ -289,6 +290,7 @@ package_install_internal_rpm () {
 		fi
 
 		# Tell RPM that the "/" directory exist and is available
+		echo "Note: configuring RPM system provides"
 		mkdir -p ${target_rootfs}/etc/rpm/sysinfo
 		echo "/" >${target_rootfs}/etc/rpm/sysinfo/Dirnames
 
@@ -300,6 +302,7 @@ package_install_internal_rpm () {
 		fi
 
 		# Configure RPM... we enforce these settings!
+		echo "Note: configuring RPM DB settings"
 		mkdir -p ${target_rootfs}${rpmlibdir}
 		mkdir -p ${target_rootfs}${rpmlibdir}/log
 		# After change the __db.* cache size, log file will not be generated automatically,
@@ -337,6 +340,7 @@ EOF
 		rpm --root $target_rootfs --dbpath /var/lib/rpm -qa > /dev/null
 
 		# Configure smart
+		echo "Note: configuring Smart settings"
 		rm -rf ${target_rootfs}/var/lib/smart
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-root=${target_rootfs}
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-dbpath=${rpmlibdir}
@@ -349,6 +353,7 @@ EOF
 		platform_extra_fixed=`echo "$platform_extra" | tr - _`
 		for arch in $platform_extra_fixed ; do
 			if [ -d ${DEPLOY_DIR_RPM}/$arch -a ! -e ${target_rootfs}/install/channel.$arch.stamp ] ; then
+				echo "Note: adding Smart channel $arch ($channel_priority)"
 				smart --data-dir=${target_rootfs}/var/lib/smart channel --add $arch type=rpm-md type=rpm-md baseurl=${DEPLOY_DIR_RPM}/$arch -y
 				smart --data-dir=${target_rootfs}/var/lib/smart channel --set $arch priority=$channel_priority
 				touch ${target_rootfs}/install/channel.$arch.stamp
@@ -386,15 +391,19 @@ if [ \$? -ne 0 ]; then
 fi
 EOF
 
+	echo "Note: configuring RPM cross-install scriptlet_wrapper"
 	chmod 0755 ${WORKDIR}/scriptlet_wrapper
 	smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._cross_scriptlet_wrapper=${WORKDIR}/scriptlet_wrapper
 
 	# Determine what to install
 	translate_oe_to_smart ${sdk_mode} ${package_to_install} ${package_linguas}
 
+	echo "Note: to be installed: ${pkgs_to_install}"
 	[ -n "$pkgs_to_install" ] && smart --data-dir=${target_rootfs}/var/lib/smart install -y ${pkgs_to_install}
 
 	if [ -n "${package_attemptonly}" ]; then
+		echo "Note: installing attempt only packages..."
+		echo "Note: see `dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}"
 		translate_oe_to_smart ${sdk_mode} --attemptonly $package_attemptonly
 		echo "Attempting $pkgs_to_install"
 		smart --data-dir=${target_rootfs}/var/lib/smart install -y $pkgs_to_install >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1 || true
-- 
1.7.10.4



