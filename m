Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC656D9A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:33:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2013 06:29:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,693,1378882800"; d="scan'208";a="426920160"
Received: from junemccl-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.116])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2013 06:33:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 14:32:44 +0000
Message-Id: <77ca5bc6af846acebf8f0cf28af9724b39de99a5.1384353075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/11] classes/license: use "1" to set boolean variables
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
X-List-Received-Date: Wed, 13 Nov 2013 14:33:02 -0000

The expected usage of COPY_LIC_MANIFEST and COPY_LIC_DIRS appears to be
to set them to "1" to enable; however the test here is just testing
whether they have a value at all, so setting them to "0" would also
enable them which is somewhat disingenuous. Actually check if they are
set to "1" instead in order to fix this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/license.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 1c1b679..419105b 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -62,10 +62,10 @@ license_create_manifest() {
 	# - Just copy the manifest
 	# - Copy the manifest and the license directories
 	# With both options set we see a .5 M increase in core-image-minimal
-	if [ -n "${COPY_LIC_MANIFEST}" ]; then
+	if [ "${COPY_LIC_MANIFEST}" = "1" ]; then
 		mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/
 		cp ${LICENSE_MANIFEST} ${IMAGE_ROOTFS}/usr/share/common-licenses/license.manifest
-		if [ -n "${COPY_LIC_DIRS}" ]; then
+		if [ "${COPY_LIC_DIRS}" = "1" ]; then
 			for pkg in ${INSTALLED_PKGS}; do
 				mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
 				for lic in `ls ${LICENSE_DIRECTORY}/${pkg}`; do
-- 
1.8.1.2


