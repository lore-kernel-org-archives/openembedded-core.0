Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzEj-0007Op-VT
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:15:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2012 17:05:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="143529246"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2012 17:05:20 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:05:15 -0700
Message-Id: <c50dbc1b05d1be26358825b79f994026d4e5efd4.1337731469.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
References: <9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731469.git.nitin.a.kamble@intel.com>
References: <cover.1337731469.git.nitin.a.kamble@intel.com>
Subject: [PATCH 5/9] xf86-video-vmware: fix build issue
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
X-List-Received-Date: Wed, 23 May 2012 00:15:34 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Fixes this build issue:

| rmdir: failed to remove
`/srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/xf86-video-vmware-2_12.0.1-r17.1/image/usr/bin':
No such file or directory
NOTE: package xf86-video-vmware-2_12.0.1-r17.1: task do_install: Failed

No PR bump as no change in the output.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../xorg-driver/xf86-video-vmware_12.0.2.bb        |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
index 71f0339..5c89ccf 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
@@ -18,5 +18,7 @@ COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
 do_install_append () {
 	# Remove useless empty directory
-	rmdir ${D}${bindir}
+	if [ -d ${D}${bindir} ]; then
+		rmdir ${D}${bindir}
+	fi
 }
-- 
1.7.7



