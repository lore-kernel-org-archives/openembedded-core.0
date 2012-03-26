Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SC4FP-0004wj-L5
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 09:21:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Mar 2012 00:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="81567200"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Mar 2012 00:12:48 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2012 15:10:03 +0800
Message-Id: <69175f6050af8983d9ab9781c01fe4bb29168a3b.1332745722.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1332745722.git.lianhao.lu@intel.com>
References: <cover.1332745722.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] gcc-cross-canadian: Fixed packaging warnings.
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
X-List-Received-Date: Mon, 26 Mar 2012 07:21:47 -0000

Removed non-shipped empty directories:
 -${prefix}/${TARGET_SYS}
 -${libdir}/../lib
 -${prefix}/include

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-devtools/gcc/gcc-package-sdk.inc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-sdk.inc b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
index e2095e3..95d6804 100644
--- a/meta/recipes-devtools/gcc/gcc-package-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
@@ -46,6 +46,13 @@ do_install () {
 	rm -f ${D}${libdir}/../lib/libiberty.a
 	rm -f ${D}${libdir}/libiberty.a
 
+	# Cleanup empty directories which are not shipped
+	# we use rmdir instead of 'rm -f' to ensure the directories are empty
+	rmdir ${D}${libdir}/../lib
+	rmdir ${D}${prefix}/${TARGET_SYS}/lib
+	rmdir ${D}${prefix}/${TARGET_SYS}
+	rmdir ${D}${includedir}
+
 	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
 	# found.
 	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
-- 
1.7.0.4



