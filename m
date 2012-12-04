Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TftFy-0000Sj-7h
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 15:13:54 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Dec 2012 05:59:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,215,1355126400"; d="scan'208";a="226378564"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 04 Dec 2012 05:59:29 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Tue,  4 Dec 2012 15:59:09 +0200
Message-Id: <02baf1072c98ba7c93c92bda589a1500ebbadba6.1354626535.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/5] rootfs generation: export two new variables to postinst scriptlets
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
X-List-Received-Date: Tue, 04 Dec 2012 14:13:54 -0000

In order for the postinst scriptlets to be able to run once we need to
export the location of the intercept scripts and also the location of
native sysrootfs. The gdk-pixbuf binaries will need the latter because
in order to generate the loaders.cache it will need to scan some shared
libraries that must be native. Even though the output is a text file.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/package_rpm.bbclass |    2 ++
 meta/classes/rootfs_deb.bbclass  |    2 ++
 meta/classes/rootfs_ipk.bbclass  |    2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1ff92ce..c7ac07a 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -475,6 +475,8 @@ export D="${target_rootfs}"
 export OFFLINE_ROOT="\$D"
 export IPKG_OFFLINE_ROOT="\$D"
 export OPKG_OFFLINE_ROOT="\$D"
+export INTERCEPT_DIR="${WORKDIR}/intercept_scripts"
+export NATIVE_ROOT=${STAGING_DIR_NATIVE}
 
 \$2 \$1/\$3 \$4
 if [ \$? -ne 0 ]; then
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 881fdbd..955382f 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -48,6 +48,8 @@ fakeroot rootfs_deb_do_rootfs () {
 	export OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export OPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
+	export INTERCEPT_DIR=${WORKDIR}/intercept_scripts
+	export NATIVE_ROOT=${STAGING_DIR_NATIVE}
 
 	# Attempt to run preinsts
 	# Mark packages with preinst failures as unpacked
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index fc69b7e..8766d24 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -69,6 +69,8 @@ fakeroot rootfs_ipk_do_rootfs () {
 	export OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export OPKG_OFFLINE_ROOT=${IPKG_OFFLINE_ROOT}
+	export INTERCEPT_DIR=${WORKDIR}/intercept_scripts
+	export NATIVE_ROOT=${STAGING_DIR_NATIVE}
 
 	package_install_internal_ipk
 
-- 
1.7.9.5



