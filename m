Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TfyUq-0003sS-MH
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 20:49:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4JZDeK005832
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 11:35:13 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 11:35:12 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 13:49:54 -0600
Message-ID: <c6d0d04f49cc516ba7cbea28fcca515c3066cc3d.1354650148.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354650148.git.mark.hatle@windriver.com>
References: <cover.1354650148.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 5/6] package_rpm.bbclass: Add additional logging
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
X-List-Received-Date: Tue, 04 Dec 2012 19:49:37 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 41c32f4..260110a 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -244,6 +244,7 @@ package_install_internal_rpm () {
 	channel_priority=5
 	if [ "${INSTALL_COMPLEMENTARY_RPM}" != "1" ] ; then
 		# Setup base system configuration
+		echo "Note: configuring RPM platform settings"
 		mkdir -p ${target_rootfs}/etc/rpm/
 		echo "${platform}${TARGET_VENDOR}-${TARGET_OS}" > ${target_rootfs}/etc/rpm/platform
 		if [ ! -z "$platform_extra" ]; then
@@ -262,6 +263,7 @@ package_install_internal_rpm () {
 		fi
 
 		# Tell RPM that the "/" directory exist and is available
+		echo "Note: configuring RPM system provides"
 		mkdir -p ${target_rootfs}/etc/rpm/sysinfo
 		echo "/" >${target_rootfs}/etc/rpm/sysinfo/Dirnames
 
@@ -273,6 +275,7 @@ package_install_internal_rpm () {
 		fi
 
 		# Configure RPM... we enforce these settings!
+		echo "Note: configuring RPM DB settings"
 		mkdir -p ${target_rootfs}${rpmlibdir}
 		mkdir -p ${target_rootfs}${rpmlibdir}/log
 		# After change the __db.* cache size, log file will not be generated automatically,
@@ -310,6 +313,7 @@ EOF
 		rpm --root $target_rootfs --dbpath /var/lib/rpm -qa > /dev/null
 
 		# Configure smart
+		echo "Note: configuring Smart settings"
 		rm -rf ${target_rootfs}/var/lib/smart
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-root=${target_rootfs}
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-dbpath=${rpmlibdir}
@@ -322,6 +326,7 @@ EOF
 		for arch in $platform_extra ; do
 			arch=${arch//-/_}
 			if [ -d ${DEPLOY_DIR_RPM}/$arch -a ! -e ${target_rootfs}/install/channel.$arch.stamp ] ; then
+				echo "Note: adding Smart channel $arch ($channel_priority)"
 				smart --data-dir=${target_rootfs}/var/lib/smart channel --add $arch type=rpm-md type=rpm-md baseurl=${DEPLOY_DIR_RPM}/$arch -y
 				smart --data-dir=${target_rootfs}/var/lib/smart channel --set $arch priority=$channel_priority
 				touch ${target_rootfs}/install/channel.$arch.stamp
@@ -357,15 +362,19 @@ if [ \$? -ne 0 ]; then
 fi
 EOF
 
+	echo "Note: configuring RPM cross-install scriptlet_wrapper"
 	chmod 0755 ${WORKDIR}/scriptlet_wrapper
 	smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._cross_scriptlet_wrapper=${WORKDIR}/scriptlet_wrapper
 
 	# Determine what to install
 	translate_oe_to_smart ${package_to_install} ${package_linguas}
 
+	echo "Note: to be installed: ${pkgs_to_install}"
 	[ -n "$pkgs_to_install" ] && smart --data-dir=${target_rootfs}/var/lib/smart install -y ${pkgs_to_install}
 
 	if [ -n "${package_attemptonly}" ]; then
+		echo "Note: installing attempt only packages..."
+		echo "Note: see `dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}"
 		translate_oe_to_smart --attemptonly $package_attemptonly
 		echo "Attempting $pkgs_to_install"
 		smart --data-dir=${target_rootfs}/var/lib/smart install -y $pkgs_to_install >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1 || true
-- 
1.7.3.4



