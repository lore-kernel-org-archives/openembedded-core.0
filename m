Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TfyUr-0003sT-8v
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 20:49:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB4JZEuU028768
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 11:35:14 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 11:35:13 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 13:49:55 -0600
Message-ID: <0934734b8ed8a5b597319c498de87bc0e4bd9ef4.1354650148.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354650148.git.mark.hatle@windriver.com>
References: <cover.1354650148.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 6/6] package_rpm.bbclass: Add support for incremental installs
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
X-List-Received-Date: Tue, 04 Dec 2012 19:49:39 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |   48 +++++++++++++++++++++++++++++++++++++-
 1 files changed, 47 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 260110a..9fbdc05 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -321,7 +321,8 @@ EOF
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-noparentdirs=1
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._var=${localstatedir}
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._tmppath=/install/tmp
-		smart --data-dir=${target_rootfs}/var/lib/smart channel --add rpmsys type=rpm-sys -y
+		# Delay this until later...
+		#smart --data-dir=${target_rootfs}/var/lib/smart channel --add rpmsys type=rpm-sys -y
 
 		for arch in $platform_extra ; do
 			arch=${arch//-/_}
@@ -369,6 +370,51 @@ EOF
 	# Determine what to install
 	translate_oe_to_smart ${package_to_install} ${package_linguas}
 
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
1.7.3.4



