Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RZ4S5-0002gL-Iz
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 18:41:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2011 09:34:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94433748"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.20])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2011 09:34:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 17:34:42 +0000
Message-Id: <2d2d1743ef68945a58a377e5787b955b3e0e1a84.1323451977.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1323451977.git.paul.eggleton@linux.intel.com>
References: <cover.1323451977.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1323451977.git.paul.eggleton@linux.intel.com>
References: <cover.1323451977.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/rootfs_deb: implement query functions for buildhistory
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
X-List-Received-Date: Fri, 09 Dec 2011 17:41:41 -0000

Implement the functions required for buildhistory to be able to query
installed packages, get dependencies etc. for deb-based images.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/rootfs_deb.bbclass |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index bab8e1e..bef055c 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -81,3 +81,26 @@ remove_packaging_data_files() {
 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
 	rm -rf ${IMAGE_ROOTFS}/usr/dpkg/
 }
+
+DPKG_QUERY_COMMAND = "${STAGING_BINDIR_NATIVE}/dpkg --admindir=${IMAGE_ROOTFS}/var/lib/dpkg"
+
+list_installed_packages() {
+	${DPKG_QUERY_COMMAND} -l | grep ^ii | awk '{ print $2 }'
+}
+
+get_package_filename() {
+	fullname=`find ${DEPLOY_DIR_DEB} -name "$1_*.deb" || true`
+	if [ "$fullname" = "" ] ; then
+		echo $name
+	else
+		echo $fullname
+	fi
+}
+
+list_package_depends() {
+	${DPKG_QUERY_COMMAND} -s $1 | grep ^Depends | sed -e 's/^Depends: //' -e 's/,//g' -e 's:([=<>]* [0-9a-zA-Z.~\-]*)::g'
+}
+
+list_package_recommends() {
+	${DPKG_QUERY_COMMAND} -s $1 | grep ^Recommends | sed -e 's/^Recommends: //' -e 's/,//g' -e 's:([=<>]* [0-9a-zA-Z.~\-]*)::g'
+}
-- 
1.7.5.4



