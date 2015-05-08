Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3E06017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 20:41:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 08 May 2015 13:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,393,1427785200"; d="scan'208";a="491228620"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by FMSMGA003.fm.intel.com with ESMTP; 08 May 2015 13:41:29 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 May 2015 20:41:28 +0000
Message-Id: <10d547a57a42a0dc69240f35bb22fd3112d17d0e.1431117450.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1431117450.git.anibal.limon@linux.intel.com>
References: <cover.1431117450.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1431117450.git.anibal.limon@linux.intel.com>
References: <cover.1431117450.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 1/5] license_class: Reimplemented manifest creation in python
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 May 2015 20:41:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reimplemented license_manifest_create from shell to python for
INCOMPATIBLE_LICENSE handle using oe.license module.

Optimizations are made to avoid license copy now uses a hardlink
and symbolic link this helps to save space during build.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 163 ++++++++++++++++++++++---------------------
 1 file changed, 82 insertions(+), 81 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index d9409a9..975867d 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -25,87 +25,88 @@ python write_package_manifest() {
         'w+').write(image_list_installed_packages(d))
 }
 
-license_create_manifest() {
-        # Test if BUILD_IMAGES_FROM_FEEDS is defined in env
-        if [ -n "${BUILD_IMAGES_FROM_FEEDS}" ]; then
-          exit 0
-        fi
-
-	INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
-	LICENSE_MANIFEST="${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest"
-	# remove existing license.manifest file
-	if [ -f ${LICENSE_MANIFEST} ]; then
-		rm ${LICENSE_MANIFEST}
-	fi
-	touch ${LICENSE_MANIFEST}
-	for pkg in ${INSTALLED_PKGS}; do
-		filename=`ls ${PKGDATA_DIR}/runtime-reverse/${pkg}| head -1`
-		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
-
-		# check to see if the package name exists in the manifest. if so, bail.
-		if grep -q "^PACKAGE NAME: ${pkg}" ${LICENSE_MANIFEST}; then
-			continue
-		fi
-
-		pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
-		pkged_name="$(basename $(readlink ${filename}))"
-		pkged_lic="$(sed -n "/^LICENSE_${pkged_name}: /{ s/^LICENSE_${pkged_name}: //; p }" ${filename})"
-		pkged_size="$(sed -n "/^PKGSIZE_${pkged_name}: /{ s/^PKGSIZE_${pkged_name}: //; p }" ${filename})"
-		if [ -z "${pkged_lic}" ]; then
-			# fallback checking value of LICENSE
-			pkged_lic="$(sed -n "/^LICENSE: /{ s/^LICENSE: //; p }" ${filename})"
-		fi
-
-		echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_MANIFEST}
-		echo "PACKAGE VERSION:" ${pkged_pv} >> ${LICENSE_MANIFEST}
-		echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_MANIFEST}
-		echo "LICENSE:" ${pkged_lic} >> ${LICENSE_MANIFEST}
-		echo "" >> ${LICENSE_MANIFEST}
-
-		# If the package doesn't contain any file, that is, its size is 0, the license
-		# isn't relevant as far as the final image is concerned. So doing license check
-		# doesn't make much sense, skip it.
-		if [ "$pkged_size" = "0" ]; then
-			continue
-		fi
-
-		lics="$(echo ${pkged_lic} | sed "s/[|&()*]/ /g" | sed "s/  */ /g" )"
-		for lic in ${lics}; do
-			# to reference a license file trim trailing + symbol
-			if ! [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic%+}" ]; then
-				bbwarn "The license listed ${lic} was not in the licenses collected for ${pkged_pn}"
-			fi
-		done
-	done
-
-	# Two options here:
-	# - Just copy the manifest
-	# - Copy the manifest and the license directories
-	# With both options set we see a .5 M increase in core-image-minimal
-	if [ "${COPY_LIC_MANIFEST}" = "1" ]; then
-		mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/
-		cp ${LICENSE_MANIFEST} ${IMAGE_ROOTFS}/usr/share/common-licenses/license.manifest
-		if [ "${COPY_LIC_DIRS}" = "1" ]; then
-			for pkg in ${INSTALLED_PKGS}; do
-				mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
-				pkged_pn="$(oe-pkgdata-util -p ${PKGDATA_DIR} lookup-recipe ${pkg})"
-				for lic in `ls ${LICENSE_DIRECTORY}/${pkged_pn}`; do
-					# Really don't need to copy the generics as they're 
-					# represented in the manifest and in the actual pkg licenses
-					# Doing so would make your image quite a bit larger
-					if [ "${lic#generic_}" = "${lic}" ]; then
-						cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
-					else
-						if [ ! -f ${IMAGE_ROOTFS}/usr/share/common-licenses/${lic} ]; then
-							cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/
-						fi
-						ln -sf ../${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
-					fi
-				done
-			done
-		fi
-	fi
-
+python license_create_manifest() {
+    import re
+    import oe.packagedata
+
+    build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS', True)
+    if build_images_from_feeds == "1":
+        return 0
+
+    pkg_dic = {}
+    package_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
+                        d.getVar('IMAGE_NAME', True), 'package.manifest')
+    with open(package_manifest, "r") as package_file:
+        pkg_list = package_file.read().split()
+        for pkg in pkg_list:
+            pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
+                                    'runtime-reverse', pkg)
+            pkg_name = os.path.basename(os.readlink(pkg_info))
+
+            pkg_dic[pkg_name] = oe.packagedata.read_pkgdatafile(pkg_info)
+            if not "LICENSE" in pkg_dic[pkg_name].keys():
+                pkg_lic_name = "LICENSE_" + pkg_name
+                pkg_dic[pkg_name]["LICENSE"] = pkg_dic[pkg_name][pkg_lic_name]
+
+    license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
+                        d.getVar('IMAGE_NAME', True), 'license.manifest')
+    with open(license_manifest, "w") as license_file:
+        for pkg in sorted(pkg_dic):
+            license_file.write("PACKAGE NAME: %s\n" % pkg)
+            license_file.write("PACKAGE VERSION: %s\n" % pkg_dic[pkg]["PV"])
+            license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
+            license_file.write("LICENSE: %s\n\n" % pkg_dic[pkg]["LICENSE"])
+
+            # If the package doesn't contain any file, that is, its size is 0, the license
+            # isn't relevant as far as the final image is concerned. So doing license check
+            # doesn't make much sense, skip it.
+            if pkg_dic[pkg]["PKGSIZE_%s" % pkg] == "0":
+                continue
+
+            licenses = re.sub('[|&()*]', '', pkg_dic[pkg]["LICENSE"])
+            licenses = re.sub('  *', ' ', licenses)
+            for lic in licenses.split():
+                lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
+                                        pkg_dic[pkg]["PN"], "generic_%s" % 
+                                        re.sub('\+', '', lic))
+                if not os.path.exists(lic_file):
+                   bb.warn("The license listed %s was not in the "\ 
+                            "licenses collected for recipe %s" 
+                            % (lic, pkg_dic[pkg]["PN"]))
+
+    # Two options here:
+    # - Just copy the manifest
+    # - Copy the manifest and the license directories
+    # With both options set we see a .5 M increase in core-image-minimal
+    copy_lic_manifest = d.getVar('COPY_LIC_MANIFEST', True)
+    copy_lic_dirs = d.getVar('COPY_LIC_DIRS', True)
+    if copy_lic_manifest == "1":
+        rootfs_license_dir = os.path.join(d.getVar('IMAGE_ROOTFS', 'True'), 
+                                'usr', 'share', 'common-licenses')
+        os.makedirs(rootfs_license_dir)
+        rootfs_license_manifest = os.path.join(rootfs_license_dir,
+                                                'license.manifest')
+        os.link(license_manifest, rootfs_license_manifest)
+
+        if copy_lic_dirs == "1":
+            for pkg in sorted(pkg_dic):
+                pkg_rootfs_license_dir = os.path.join(rootfs_license_dir, pkg)
+                os.makedirs(pkg_rootfs_license_dir)
+                pkg_license_dir = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
+                                            pkg_dic[pkg]["PN"]) 
+                licenses = os.listdir(pkg_license_dir)
+                for lic in licenses:
+                    rootfs_license = os.path.join(rootfs_license_dir, lic)
+                    pkg_license = os.path.join(pkg_license_dir, lic)
+                    pkg_rootfs_license = os.path.join(pkg_rootfs_license_dir, lic)
+
+                    if re.match("^generic_.*$", lic):
+                        if not os.path.exists(rootfs_license):
+                            os.link(pkg_license, rootfs_license)
+
+                        os.symlink(os.path.join('..', lic), pkg_rootfs_license)
+                    else:
+                        os.link(pkg_license, pkg_rootfs_license)
 }
 
 python do_populate_lic() {
-- 
1.8.4.5


