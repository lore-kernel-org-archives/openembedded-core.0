Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SCOMU-0000ea-Os
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 06:50:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Mar 2012 21:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="145997269"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2012 21:41:24 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 12:38:29 +0800
Message-Id: <68f501edc836a42438c8eb49bf8c14cfc706eb9d.1332822880.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1332822880.git.lianhao.lu@intel.com>
References: <cover.1332822880.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] gcc-cross-canadian: Clean non shipped empty directories.
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
X-List-Received-Date: Tue, 27 Mar 2012 04:50:27 -0000

Cleaning up non shipped empty directories.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-devtools/gcc/gcc-package-sdk.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-sdk.inc b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
index 95d6804..ffe9a9e 100644
--- a/meta/recipes-devtools/gcc/gcc-package-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
@@ -47,11 +47,11 @@ do_install () {
 	rm -f ${D}${libdir}/libiberty.a
 
 	# Cleanup empty directories which are not shipped
-	# we use rmdir instead of 'rm -f' to ensure the directories are empty
-	rmdir ${D}${libdir}/../lib
-	rmdir ${D}${prefix}/${TARGET_SYS}/lib
-	rmdir ${D}${prefix}/${TARGET_SYS}
-	rmdir ${D}${includedir}
+	# we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
+	local empty_dirs="${D}${libdir}/../lib ${D}${prefix}/${TARGET_SYS}/lib ${D}${prefix}/${TARGET_SYS} ${D}${includedir}"
+	for i in $empty_dirs; do
+		[ -d $i ] && rmdir --ignore-fail-on-non-empty $i
+	done
 
 	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
 	# found.
-- 
1.7.0.4



