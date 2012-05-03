Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ0iS-0001nM-Mu
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:25:25 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 11:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96065375"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 11:15:27 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:15:21 -0700
Message-Id: <dcb359ce013cc0aed7ef6f62bb8164366fd2d489.1336068854.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
References: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336068854.git.nitin.a.kamble@intel.com>
References: <cover.1336068854.git.nitin.a.kamble@intel.com>
Subject: [PATCH 27/28] telepathy-glib: fix build
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
X-List-Received-Date: Thu, 03 May 2012 18:27:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

avoid this issue:
| rmdir: failed to remove `/srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/telepathy-glib-0.18.1-r0/image/usr/bin': No such file or directory
NOTE: package telepathy-glib-0.18.1-r0: task do_install: Failed

no PR bump as no change in the output

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../telepathy/telepathy-glib_0.18.1.bb             |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
index 81da5f8..296b978 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
@@ -18,7 +18,13 @@ FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
 
 do_install_append() {
-	rmdir ${D}${bindir}
-	rmdir ${D}${libexecdir}
-	rmdir ${D}${servicedir}
+	if [ -d ${D}${bindir} ] ; then
+		rmdir ${D}${bindir}
+	fi
+	if [ -d ${D}${libexecdir} ] ; then
+		rmdir ${D}${libexecdir}
+	fi
+	if [ -d ${D}${servicedir} ] ; then
+		rmdir ${D}${servicedir}
+	fi
 }
-- 
1.7.7



