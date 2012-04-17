Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKGcn-00025J-Ev
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 00:11:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Apr 2012 15:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154859727"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2012 15:02:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 15:02:11 -0700
Message-Id: <b33e50524a3e178cdb74f571f8934661682488e0.1334700068.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334700068.git.sgw@linux.intel.com>
References: <cover.1334700068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334700068.git.sgw@linux.intel.com>
References: <cover.1334700068.git.sgw@linux.intel.com>
Subject: [PATCH 1/3] lsb: Add DISTRO Info to /etc/lsb-release file also add util-linux to DEPENDS
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
X-List-Received-Date: Tue, 17 Apr 2012 22:11:49 -0000

Add the DISTRO* fields to the /etc/lsb-release file so the distro
parsing code can find standard information about the Poky Distro
when using the Self-Hosted Image.

The lsb_release command uses getopt which is provided by util-linux

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/lsb/lsb_1.4.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
index f2f25ba..e414d93 100644
--- a/meta/recipes-extended/lsb/lsb_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb_1.4.bb
@@ -4,6 +4,8 @@ HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
 LICENSE = "GPLv2+"
 PR = "r2"
 
+DEPENDS="util-linux"
+
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/${PV}/lsb-release-${PV}.tar.gz \
@@ -31,6 +33,9 @@ do_install(){
 		echo -n "core-4.1-${TARGET_ARCH}" >>  ${D}/etc/lsb-release
 	fi
 	echo "\"" >> ${D}/etc/lsb-release
+	echo "DISTRIB_ID=${DISTRO}" >> ${D}/etc/lsb-release
+	echo "DISTRIB_RELEASE=${DISTRO_VERSION}" >> ${D}/etc/lsb-release
+	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}/etc/lsb-release
 	
 	if [ "${TARGET_ARCH}" == "i586" ];then
 		mkdir -p ${D}/etc/lsb-release.d
-- 
1.7.7.6



