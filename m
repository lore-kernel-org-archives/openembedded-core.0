Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ0iR-0001nM-6G
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:25:24 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 11:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96065367"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 11:15:26 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:15:18 -0700
Message-Id: <15d46e0a01a07afdc7cf6ef70894e78a3d5db2f5.1336068854.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
References: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336068854.git.nitin.a.kamble@intel.com>
References: <cover.1336068854.git.nitin.a.kamble@intel.com>
Subject: [PATCH 24/28] tar: fix build
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
X-List-Received-Date: Thu, 03 May 2012 18:27:49 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Avoid this error:
| rmdir: failed to remove `/srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/tar-1.26-r1/image/usr/sbin/': No such file or directory
NOTE: package tar-1.26-r1: task do_install: Failed

no PR bump as no change in the output.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-extended/tar/tar.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
index 0533b82..5c2325a 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -18,8 +18,12 @@ do_install () {
 do_install_extra () {
     install -d ${D}${base_bindir}
     mv ${D}${bindir}/tar ${D}${base_bindir}/tar.${PN}
-    rmdir ${D}${bindir}/
-    rmdir ${D}${sbindir}/
+    if [ -d ${D}${bindir}/ ] ; then 
+        rmdir ${D}${bindir}/
+    fi
+    if [ -d ${D}${sbindir}/ ] ; then 
+        rmdir ${D}${sbindir}/
+    fi
     mv ${D}${libexecdir}/rmt ${D}${libexecdir}/rmt.${PN}
 }
 
-- 
1.7.7



