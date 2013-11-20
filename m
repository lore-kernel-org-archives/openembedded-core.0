Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5D56C73F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 10:39:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAKAdCNn029997
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Nov 2013 02:39:12 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 20 Nov 2013 02:39:11 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Nov 2013 18:39:02 +0800
Message-ID: <e3569e31c54d36354b5c702b7b95ecda26884a18.1384943898.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384943898.git.hongxu.jia@windriver.com>
References: <cover.1384943898.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] license.bbclass: fix copying license directories failed
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
X-List-Received-Date: Wed, 20 Nov 2013 10:39:11 -0000
Content-Type: text/plain

For each recipe, it populated license files to ${LICENSE_DIRECTORY}/${PN},
such as kernel's license dir was ${LICENSE_DIRECTORY}/kernel-3.10.17-yocto-standard;

In do_rootfs task, it copied license directories from ${LICENSE_DIRECTORY}/
${pkg}, and ${pkg} was listed in ${INSTALLED_PKGS};

We got ${INSTALLED_PKGS} by rpm query, such as the kernel were 'kernel-*',
but the kernel's PN was linux-yocto, so searching ${LICENSE_DIRECTORY}/
kernel-* failed.

Copied license directories from ${LICENSE_DIRECTORY}/${PN} fixed this issue.

[YOCTO #5572]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/license.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 6d7ee94..32605ff 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -68,15 +68,18 @@ license_create_manifest() {
 		if [ "${COPY_LIC_DIRS}" = "1" ]; then
 			for pkg in ${INSTALLED_PKGS}; do
 				mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
-				for lic in `ls ${LICENSE_DIRECTORY}/${pkg}`; do
+				pkged_pn="$(sed -n "/^PACKAGE NAME: ${pkg}$/,/^$/ \
+                                           {s/^RECIPE NAME: //; /^PACKAGE NAME:/d; /^PACKAGE VERSION:/d; /^LICENSE:/d; p}" \
+                                           ${LICENSE_MANIFEST})"
+				for lic in `ls ${LICENSE_DIRECTORY}/${pkged_pn}`; do
 					# Really don't need to copy the generics as they're 
 					# represented in the manifest and in the actual pkg licenses
 					# Doing so would make your image quite a bit larger
 					if [[ "${lic}" != "generic_"* ]]; then
-						cp ${LICENSE_DIRECTORY}/${pkg}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
+						cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
 					elif [[ "${lic}" == "generic_"* ]]; then
 						if [ ! -f ${IMAGE_ROOTFS}/usr/share/common-licenses/${lic} ]; then
-							cp ${LICENSE_DIRECTORY}/${pkg}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/
+							cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/
 						fi
 						ln -s ../${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
 					fi
-- 
1.8.1.2


