Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 67BD56FAF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:20:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2PAKltS017950
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Mar 2014 03:20:48 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 25 Mar 2014 03:20:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Mar 2014 18:20:36 +0800
Message-ID: <fb6ef6a95146e42915ca1432b6ff1bccf89e53e1.1395739247.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395739247.git.hongxu.jia@windriver.com>
References: <cover.1395739247.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [dora][PATCH 1/1] license.bbclass: fix copying license directories failed
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
X-List-Received-Date: Tue, 25 Mar 2014 10:20:47 -0000
Content-Type: text/plain

For each recipe, it populated license files to ${LICENSE_DIRECTORY}/${PN},
such as kernel's license dir was ${LICENSE_DIRECTORY}/kernel-3.10.17-yocto-standard;

In do_rootfs task, it copied license directories from ${LICENSE_DIRECTORY}/
${pkg}, and ${pkg} was listed in ${INSTALLED_PKGS};

We got ${INSTALLED_PKGS} by rpm query, such as the kernel were 'kernel-*',
but the kernel's PN was linux-yocto, so searching ${LICENSE_DIRECTORY}/
kernel-* failed.

Copied license directories from ${LICENSE_DIRECTORY}/${PN} fixed this
issue.

[YOCTO #5572]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/license.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index b00ebb1..99cb195 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -68,15 +68,18 @@ license_create_manifest() {
 		if [ -n "${COPY_LIC_DIRS}" ]; then
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
 					if [ "${lic#generic_}" = "${lic}" ]; then
-						cp ${LICENSE_DIRECTORY}/${pkg}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
+						cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
 					else
 						if [ ! -f ${IMAGE_ROOTFS}/usr/share/common-licenses/${lic} ]; then
-							cp ${LICENSE_DIRECTORY}/${pkg}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/
+							cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/
 						fi
 						ln -s ../${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
 					fi
-- 
1.8.1.2


