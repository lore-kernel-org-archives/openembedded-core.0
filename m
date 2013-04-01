Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UMZWQ-0005Pl-2B
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 09:51:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Apr 2013 00:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,385,1363158000"; d="scan'208";a="310398600"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 01 Apr 2013 00:34:07 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2013 10:34:45 +0300
Message-Id: <1364801685-7249-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] lsb: distro codename info added
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
X-List-Received-Date: Mon, 01 Apr 2013 07:51:18 -0000

Poky distro codename info added to /etc/lsb-release file.
lsb_release script will not complain anymore about
the incompleteness of /etc/lsb-release file by
returning an error code.
Increases LSB compliance.

Partial fix for [YOCTO #4071].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index 01368b3..59d5bca 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "LSB support for OpenEmbedded"
 SECTION = "console/utils"
 HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
 LICENSE = "GPLv2+"
-PR = "r1"
+PR = "r2"
 
 # lsb_release needs getopt
 RDEPENDS_${PN} += "util-linux"
@@ -41,6 +41,9 @@ do_install(){
 	echo "\"" >> ${D}${sysconfdir}/lsb-release
 	echo "DISTRIB_ID=${DISTRO}" >> ${D}${sysconfdir}/lsb-release
 	echo "DISTRIB_RELEASE=${DISTRO_VERSION}" >> ${D}${sysconfdir}/lsb-release
+	if [ -n "${DISTRO_CODENAME}" ]; then
+		echo "DISTRIB_CODENAME=${DISTRO_CODENAME}" >> ${D}${sysconfdir}/lsb-release
+	fi
 	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}${sysconfdir}/lsb-release
 
 	if [ "${TARGET_ARCH}" = "i586" ];then
-- 
1.7.10.4



