Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1R4Y9u-0001Ia-Ne
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 15:08:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Sep 2011 06:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="49141722"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2011 06:03:32 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 21:01:51 +0800
Message-Id: <4d2f36c3f695ed2ad6d38c9f97e30eec306156ba.1316177782.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1316177782.git.lianhao.lu@intel.com>
References: <cover.1316177782.git.lianhao.lu@intel.com>
Subject: [PATCH 1/3] debian/_ipk.bbclass: Added multilib support for package_name_hook()
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
X-List-Received-Date: Fri, 16 Sep 2011 13:08:46 -0000

[YOCTO #1486]
1. Added multilib support for package_name_hook() so MLPREFIX is kept in
the final package name.

2. clean the output of log_check_ipk.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/debian.bbclass      |    4 ++++
 meta/classes/package_ipk.bbclass |    1 +
 meta/classes/rootfs_ipk.bbclass  |    2 +-
 3 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 46a9d08..1880830 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -104,6 +104,10 @@ python debian_package_name_hook () {
 						newpkg = pkgname
 					else:
 						newpkg = pkg.replace(orig_pkg, devname, 1)
+					mlpre=bb.data.getVar('MLPREFIX', d, True)
+					if mlpre:
+						if not newpkg.find(mlpre) == 0:
+							newpkg = mlpre + newpkg
 					if newpkg != pkg:
 						bb.data.setVar('PKG_' + pkg, newpkg, d)
 
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index e83aff8..c0893a6 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -75,6 +75,7 @@ package_tryout_install_multilib_ipk() {
 			fi
 		done
 		if [ ! -z "${selected_pkg}" ]; then
+			rm -f ${target_rootfs}
 			mkdir -p ${target_rootfs}/${opkglibdir}
 			opkg-cl ${ipkg_args} update
 			opkg-cl ${ipkg_args} install ${selected_pkg}
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 695bee0..e02b816 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -114,7 +114,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 			rm -rf ${IMAGE_ROOTFS}${opkglibdir}
 		fi
 	fi
-
+	set +x
 	log_check rootfs 	
 }
 
-- 
1.7.0.4



