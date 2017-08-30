Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2EBD3605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 05:14:31 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 29 Aug 2017 22:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,447,1498546800"; d="scan'208";a="146130201"
Received: from rebeccas.png.intel.com ([172.30.199.107])
	by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2017 22:14:32 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Aug 2017 13:15:43 +0800
Message-Id: <1504070143-110335-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] bitbake.conf: add definition for BUILDSDK_CXXFLAGS
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
X-List-Received-Date: Wed, 30 Aug 2017 05:14:32 -0000

${BUILDSDK_CXXFLAGS} was introduced since
commit 55c83cb239df5faf5e2143fffca47f2f16931cb3
cross.bbclass: override TARGET_* flags

bitbake.conf has definitions for both ${BUILDSDK_CPPFLAGS} and
${BUILDSDK_CFLAGS} but there is none for ${BUILDSDK_CXXFLAGS}.
This was a regression as in the past, CXXFLAGS is the same as
CFLAGS in SDK environment.

Adding definition for ${BUILDSDK_CXXFLAGS} will resolve CXXFLAGS
being set wrongly in SDK environment.

[YOCTO #11769]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d4ed894..8ce0834 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -546,6 +546,7 @@ export CFLAGS = "${TARGET_CFLAGS}"
 export TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
 
 export BUILD_CXXFLAGS = "${BUILD_CFLAGS}"
+BUILDSDK_CXXFLAGS = "${BUILDSDK_CFLAGS}"
 export CXXFLAGS = "${TARGET_CXXFLAGS}"
 export TARGET_CXXFLAGS = "${TARGET_CFLAGS}"
 
-- 
2.7.4


