Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TirKW-0003Mk-Hb
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 19:46:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2012 10:32:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,267,1355126400"; d="scan'208";a="263101131"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.189])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2012 10:32:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 18:31:32 +0000
Message-Id: <4cbc6e97f9fb0e744e771508a2ab0917f2355569.1355337025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 08/13] package_rpm.bbclass: Add support for incremental installs
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
 meta/classes/package_rpm.bbclass |   48 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b80b939..cb8e0f4 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -348,7 +348,8 @@ EOF
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-noparentdirs=1
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._var=${localstatedir}
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._tmppath=/install/tmp
-		smart --data-dir=${target_rootfs}/var/lib/smart channel --add rpmsys type=rpm-sys -y
+		# Delay this until later...
+		#smart --data-dir=${target_rootfs}/var/lib/smart channel --add rpmsys type=rpm-sys -y
 
 		platform_extra_fixed=`echo "$platform_extra" | tr - _`
 		for arch in $platform_extra_fixed ; do
@@ -398,6 +399,51 @@ EOF
 	# Determine what to install
 	translate_oe_to_smart ${sdk_mode} ${package_to_install} ${package_linguas}
 
+	# If incremental install, we need to determine what we've got,
+	# what we need to add, and what to remove...
+	if [ "${INC_RPM_IMAGE_GEN}" = "1" -a "${INSTALL_COMPLEMENTARY_RPM}" != "1" ]; then
+		# Dump the new solution
+		echo "Note: creating install solution for incremental install"
+		smart --data-dir=${target_rootfs}/var/lib/smart install -y --dump ${pkgs_to_install} 2> ${target_rootfs}/../solution.manifest
+	fi
+
+	if [ "${INSTALL_COMPLEMENTARY_RPM}" != "1" ]; then
+		echo "Note: adding Smart RPM DB channel"
+		smart --data-dir=${target_rootfs}/var/lib/smart channel --add rpmsys type=rpm-sys -y
+	fi
+
+	# If incremental install, we need to determine what we've got,
+	# what we need to add, and what to remove...
+	if [ "${INC_RPM_IMAGE_GEN}" = "1" -a "${INSTALL_COMPLEMENTARY_RPM}" != "1" ]; then
+		# First upgrade everything that was previously installed to the latest version
+		echo "Note: incremental update -- upgrade packages in place"
+		smart --data-dir=${target_rootfs}/var/lib/smart upgrade
+
+		# Dump what is already installed
+		echo "Note: dump installed packages for incremental update"
+		smart --data-dir=${target_rootfs}/var/lib/smart query --installed --output ${target_rootfs}/../installed.manifest
+
+		sort ${target_rootfs}/../installed.manifest > ${target_rootfs}/../installed.manifest.sorted
+		sort ${target_rootfs}/../solution.manifest > ${target_rootfs}/../solution.manifest.sorted
+		
+		comm -1 -3 ${target_rootfs}/../solution.manifest.sorted ${target_rootfs}/../installed.manifest.sorted \
+			> ${target_rootfs}/../remove.list
+		comm -2 -3 ${target_rootfs}/../solution.manifest.sorted ${target_rootfs}/../installed.manifest.sorted \
+			> ${target_rootfs}/../install.list
+		
+		pkgs_to_remove=`cat ${target_rootfs}/../remove.list | xargs echo`
+		pkgs_to_install=`cat ${target_rootfs}/../install.list | xargs echo`
+		
+		echo "Note: to be removed: ${pkgs_to_remove}"
+
+		for pkg in ${pkgs_to_remove}; do
+			echo "Debug: What required: $pkg"
+			smart --data-dir=${target_rootfs}/var/lib/smart query $pkg --show-requiredby
+		done
+
+		[ -n "$pkgs_to_remove" ] && smart --data-dir=${target_rootfs}/var/lib/smart remove -y ${pkgs_to_remove}
+	fi
+
 	echo "Note: to be installed: ${pkgs_to_install}"
 	[ -n "$pkgs_to_install" ] && smart --data-dir=${target_rootfs}/var/lib/smart install -y ${pkgs_to_install}
 
-- 
1.7.10.4



