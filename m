Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 39EE371DA5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 20:59:06 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2017 13:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,401,1488873600"; d="scan'208";a="94327306"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga005.jf.intel.com with ESMTP; 01 May 2017 13:59:06 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 13:59:01 -0700
Message-Id: <1493672344-21965-4-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
References: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2 3/6] image-prelink.bbclass: support binary reproducibility
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
X-List-Received-Date: Mon, 01 May 2017 20:59:06 -0000

Conditionally support binary reproducibility in built images.
If BUILD_REPRODUCIBLE_BINARIES = 1 then:

1. Do not randomize library addresses
2. Set/export PRELINK_TIMESTAMP to a reproducible value.
   If REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK is specified, then the value will
   be used. Otherwise the timestamp will be derived from the top git commit.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/image-prelink.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index 4157df0..046660e 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -36,7 +36,17 @@ prelink_image () {
 	dynamic_loader=$(linuxloader)
 
 	# prelink!
-	${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
+	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+		bbnote " prelink: BUILD_REPRODUCIBLE_BINARIES..."
+		if [ "$REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK" = "" ]; then
+			export PRELINK_TIMESTAMP=`git log -1 --pretty=%ct `
+		else
+			export PRELINK_TIMESTAMP=$REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK
+		fi
+		${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -am -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
+	else
+		${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
+	fi
 
 	# Remove the prelink.conf if we had to add it.
 	if [ "$dummy_prelink_conf" = "true" ]; then
-- 
2.7.4


