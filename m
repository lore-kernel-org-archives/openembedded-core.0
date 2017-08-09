Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 28C4B77D52
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 17:49:03 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2017 10:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,348,1498546800"; d="scan'208";a="117337356"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 09 Aug 2017 10:48:35 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 10:48:24 -0700
Message-Id: <1502300913-40295-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v3 02/11] image-prelink.bbclass: support binary reproducibility
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
X-List-Received-Date: Wed, 09 Aug 2017 17:49:03 -0000

Conditionally support binary reproducibility in built images.
If BUILD_REPRODUCIBLE_BINARIES = 1 then:

1. Do not randomize library addresses
2. Set/export PRELINK_TIMESTAMP to a reproducible value.
   If REPRODUCIBLE_TIMESTAMP_ROOTFS is specified, then the value will
   be used. Otherwise the timestamp will be derived from the top git commit.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/image-prelink.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index 4157df0..e833d47 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -36,7 +36,17 @@ prelink_image () {
 	dynamic_loader=$(linuxloader)
 
 	# prelink!
-	${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
+	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+		bbnote " prelink: BUILD_REPRODUCIBLE_BINARIES..."
+		if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
+			export PRELINK_TIMESTAMP=`git log -1 --pretty=%ct `
+		else
+			export PRELINK_TIMESTAMP=$REPRODUCIBLE_TIMESTAMP_ROOTFS
+		fi
+		${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -am -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
+	else
+		${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
+	fi
 
 	# Remove the prelink.conf if we had to add it.
 	if [ "$dummy_prelink_conf" = "true" ]; then
-- 
2.7.4


