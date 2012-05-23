Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzEk-0007Ob-R6
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:15:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2012 17:05:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="143529252"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2012 17:05:21 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:05:18 -0700
Message-Id: <6211a01fc11bc26fb1bf70a85846d5b9700bac41.1337731469.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
References: <9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731469.git.nitin.a.kamble@intel.com>
References: <cover.1337731469.git.nitin.a.kamble@intel.com>
Subject: [PATCH 8/9] libfm: fix a build issue
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
X-List-Received-Date: Wed, 23 May 2012 00:15:35 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Avoids this build issue:
| rmdir: failed to remove `/srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/libfm-0.1.17-r4/image/usr/lib/gio/modules/': No such file or directory
NOTE: package libfm-0.1.17-r4: task do_install: Failed

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/libfm/libfm_0.1.17.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libfm/libfm_0.1.17.bb b/meta/recipes-support/libfm/libfm_0.1.17.bb
index 1bd8850..4df7b25 100644
--- a/meta/recipes-support/libfm/libfm_0.1.17.bb
+++ b/meta/recipes-support/libfm/libfm_0.1.17.bb
@@ -22,8 +22,12 @@ SRC_URI[sha256sum] = "1740681cff4cd4c5a2eaa9805d8898269cfb6a49a0bda0acb242def15b
 inherit autotools pkgconfig
 
 do_install_append () {
-	rmdir ${D}${libdir}/gio/modules/
-	rmdir ${D}${libdir}/gio/
+	if [ -d  ${D}${libdir}/gio/modules/ ] ; then
+		rmdir ${D}${libdir}/gio/modules/
+	fi
+	if [ -d  ${D}${libdir}/gio ] ; then
+		rmdir ${D}${libdir}/gio/
+	fi
 }
 
 PACKAGES += "${PN}-mime"
-- 
1.7.7



