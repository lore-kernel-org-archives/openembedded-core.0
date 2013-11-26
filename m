Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 495F86DC28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 12:10:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2013 04:10:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,774,1378882800"; d="scan'208";a="415081191"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.39])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2013 04:10:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 12:09:52 +0000
Message-Id: <ce9b675b47a05133ed1f862dda6a8c70d9626e44.1385467738.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1385467738.git.paul.eggleton@linux.intel.com>
References: <cover.1385467738.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1385467738.git.paul.eggleton@linux.intel.com>
References: <cover.1385467738.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/image: write image manifest
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
X-List-Received-Date: Tue, 26 Nov 2013 12:10:09 -0000

Write a list of installed packages to a .manifest file next to the
image, so we can find out what went into the image after it has been
constructed without necessarily having to have buildhistory enabled
(although that will provide more detail.) We can make use of this for
example in the testimage class associated code that checks for installed
packages for determining whether or not to run specific tests.

Note: this replaces the previous ipk-specific manifest code with
something that works for ipk, rpm and deb, and instead of a pruned
status file, packages are listed one per line, in the following format:

<packagename> <packagearch> <version>

Tests for all three backends have shown that the performance impact of
this change is negligible (about 1.5s max).

Implements [YOCTO #5410]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass            | 15 +++++++++------
 meta/classes/populate_sdk_deb.bbclass |  2 ++
 meta/classes/populate_sdk_ipk.bbclass |  2 ++
 meta/classes/populate_sdk_rpm.bbclass |  2 ++
 meta/classes/rootfs_ipk.bbclass       | 14 --------------
 scripts/opkg-query-helper.py          |  9 +++++++++
 6 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index bc60f0d..8217fb3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -179,6 +179,9 @@ ROOTFS_POSTPROCESS_COMMAND_prepend = "run_intercept_scriptlets; "
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
 # Enable postinst logging if debug-tweaks is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'
+# Write manifest
+IMAGE_MANIFEST = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
+ROOTFS_POSTPROCESS_COMMAND =+ "write_image_manifest ; "
 # Set default postinst log file
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 
@@ -381,6 +384,11 @@ fakeroot do_rootfs () {
 	${IMAGE_POSTPROCESS_COMMAND}
 	
 	${MACHINE_POSTPROCESS_COMMAND}
+
+	if [ -n "${IMAGE_LINK_NAME}" -a -f "${IMAGE_MANIFEST}" ]; then
+		rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.manifest
+		ln -s ${IMAGE_NAME}.rootfs.manifest ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.manifest
+	fi
 }
 
 insert_feed_uris () {
@@ -602,12 +610,7 @@ make_zimage_symlink_relative () {
 }
 
 write_image_manifest () {
-	rootfs_${IMAGE_PKGTYPE}_write_manifest
-
-	if [ -n "${IMAGE_LINK_NAME}" ]; then
-		rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.manifest
-		ln -s ${IMAGE_NAME}.rootfs.manifest ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.manifest
-	fi
+	list_installed_packages ver | sort > ${IMAGE_MANIFEST}
 }
 
 # Make login manager(s) enable automatic login.
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index ebb842b..a63280d 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -84,6 +84,8 @@ list_installed_packages() {
 				echo "$pkg $fullpath $pkgarch"
 			fi
 		done
+	elif [ "$1" = "ver" ] ; then
+		${DPKG_QUERY_COMMAND} -W -f='${Package} ${PackageArch} ${Version}\n'
 	else
 		${DPKG_QUERY_COMMAND} -W -f='${Package}\n'
 	fi
diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
index 04c71af..fc6ed53 100644
--- a/meta/classes/populate_sdk_ipk.bbclass
+++ b/meta/classes/populate_sdk_ipk.bbclass
@@ -70,6 +70,8 @@ list_installed_packages() {
 				echo "$pkg $fullpath $pkgarch"
 			fi
 		done
+	elif [ "$1" = "ver" ] ; then
+		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -v
 	else
 		opkg-cl ${OPKG_ARGS} list_installed | awk '{ print $1 }'
 	fi
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index b010593..67cccaf 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -162,6 +162,8 @@ list_installed_packages() {
 		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]" | translate_smart_to_oe arch
 	elif [ "$1" = "file" ]; then
 		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{PACKAGEORIGIN}\n]" | translate_smart_to_oe file
+	elif [ "$1" = "ver" ]; then
+		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{VERSION}\n]" | translate_smart_to_oe arch
 	else
 		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]" | translate_smart_to_oe
 	fi
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 6ce3e5d..dbe1c79 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -118,20 +118,6 @@ save_postinsts () {
 	done
 }
 
-rootfs_ipk_write_manifest() {
-	manifest=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest
-	cp ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/status $manifest
-
-	sed '/Depends/d' -i $manifest
-	sed '/Status/d' -i $manifest
-	sed '/Architecture/d' -i $manifest
-	sed '/Installed-Time/d' -i $manifest
-	sed '/Auto-Installed/d' -i $manifest
-	sed '/Recommends/d' -i $manifest
-	sed '/Provides/d' -i $manifest
-	sed '/Conflicts/d' -i $manifest
-}
-
 remove_packaging_data_files() {
 	rm -rf ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg
 	# We need the directory for the package manager lock
diff --git a/scripts/opkg-query-helper.py b/scripts/opkg-query-helper.py
index fa6c44f..2fb1a78 100755
--- a/scripts/opkg-query-helper.py
+++ b/scripts/opkg-query-helper.py
@@ -28,6 +28,7 @@ import re
 
 archmode = False
 filemode = False
+vermode = False
 
 args = []
 for arg in sys.argv[1:]:
@@ -35,6 +36,8 @@ for arg in sys.argv[1:]:
         archmode = True
     elif arg == '-f':
         filemode = True
+    elif arg == '-v':
+        vermode = True
     else:
         args.append(arg)
 
@@ -60,6 +63,12 @@ for line in fileinput.input(args):
                 elif line.startswith("Architecture:"):
                     arch = line.split(": ")[1]
                     print("%s %s_%s_%s.ipk %s" % (pkg,pkg,ver,arch,arch))
+            elif vermode:
+                if line.startswith("Version:"):
+                    ver = line.split(": ")[1]
+                elif line.startswith("Architecture:"):
+                    arch = line.split(": ")[1]
+                    print("%s %s %s" % (pkg,arch,ver))
             else:
                 if line.startswith("Depends:"):
                     depval = line.split(": ")[1]
-- 
1.8.1.2


