Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzEg-0007Ob-Na
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:15:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2012 17:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="143529240"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2012 17:05:20 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:05:11 -0700
Message-Id: <9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1337731469.git.nitin.a.kamble@intel.com>
References: <cover.1337731469.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/9] tar: fix build
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
X-List-Received-Date: Wed, 23 May 2012 00:15:30 -0000

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



