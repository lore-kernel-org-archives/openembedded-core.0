Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ0iS-0001oE-NA
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:25:25 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 11:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96065379"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 11:15:27 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:15:22 -0700
Message-Id: <b36664cca05ac4538859c6dca00fbf84b0fee050.1336068854.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
References: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336068854.git.nitin.a.kamble@intel.com>
References: <cover.1336068854.git.nitin.a.kamble@intel.com>
Subject: [PATCH 28/28] xf86-video-vmware: fix build issue
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
X-List-Received-Date: Thu, 03 May 2012 18:25:25 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Fixes this build issue:

| rmdir: failed to remove
`/srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/xf86-video-vmware-2_12.0.1-r17.1/image/usr/bin':
No such file or directory
NOTE: package xf86-video-vmware-2_12.0.1-r17.1: task do_install: Failed

No PR bump as no change in the output.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../xorg-driver/xf86-video-vmware_12.0.1.bb        |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb
index a5655fc..87336e3 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb
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



