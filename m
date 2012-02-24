Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1S13a3-0003WW-Tp
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 23:25:36 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2012 14:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111668405"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2012 14:16:10 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 14:17:39 -0800
Message-Id: <b939dd1faa6821c6e7c220ce14d7f20961d2c92a.1330121220.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <7fb99be3893199165558e9d7bb1638c2d572cff2.1330121220.git.elizabeth.flanagan@intel.com>
References: <7fb99be3893199165558e9d7bb1638c2d572cff2.1330121220.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1330121220.git.elizabeth.flanagan@intel.com>
References: <cover.1330121220.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 3/3] license.bbclass: Symbolic links of generic license
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
X-List-Received-Date: Fri, 24 Feb 2012 22:25:36 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

This is to reduce the size of licenses added to images. With this
commit license.manifest, original license and generic license
adds about .5M to a core-image-minimal image, substantially less
than what is currently occuring when COPY_LIC_MANIFEST and
COPY_LIC_DIRS are set.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 11908d9..cfc9eaf 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -106,22 +106,24 @@ license_create_manifest() {
     # Two options here:
     # - Just copy the manifest
     # - Copy the manifest and the license directories
-    # This will make your image a bit larger, however 
-    # if you are concerned about license compliance 
-    # and delivery this should cover all your bases
-
+    # With both options set we see a .5 M increase in core-image-minimal
     if [ -n "${COPY_LIC_MANIFEST}" ]; then
         mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/
         cp ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest ${IMAGE_ROOTFS}/usr/share/common-licenses/license.manifest
         if [ -n "${COPY_LIC_DIRS}" ]; then
             for pkg in ${INSTALLED_PKGS}; do
                 mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
-                for lic in `ls ${LICENSE_DIRECTORY}/${pkged_pn}`; do
+                for lic in `ls ${LICENSE_DIRECTORY}/${pkg}`; do
                     # Really don't need to copy the generics as they're 
                     # represented in the manifest and in the actual pkg licenses
                     # Doing so would make your image quite a bit larger
-                    if [ ! ${lic} = "generic_*" ]; then
-                        cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
+                    if [[ "${lic}" != "generic_"* ]]; then
+                        cp ${LICENSE_DIRECTORY}/${pkg}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
+                    elif [[ "${lic}" == "generic_"* ]]; then
+                        if [ ! -f ${IMAGE_ROOTFS}/usr/share/common-licenses/${lic} ]; then
+                            cp ${LICENSE_DIRECTORY}/${pkg}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/
+                        fi
+                        ln -s ../${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
                     fi
                 done
             done
-- 
1.7.1



