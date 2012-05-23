Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzEj-0007Ob-5j
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:15:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2012 17:05:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="143529245"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2012 17:05:20 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:05:14 -0700
Message-Id: <1de9f1dc9a111526ec113c9f5619c7cbe5e77256.1337731469.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
References: <9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731469.git.nitin.a.kamble@intel.com>
References: <cover.1337731469.git.nitin.a.kamble@intel.com>
Subject: [PATCH 4/9] telepathy-glib: fix build
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
X-List-Received-Date: Wed, 23 May 2012 00:15:33 -0000

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



