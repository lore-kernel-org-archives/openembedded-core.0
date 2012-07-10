Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Sod5T-0006rk-CH
	for Openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 18:14:55 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2012 09:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120803485"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jul 2012 09:03:40 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 09:02:12 -0700
Message-Id: <9b54d54612bd6f5a2dc672440726ea68491702e9.1341935782.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <b4314c7a2f9fb120c2c4affd52567fe60a96bb5a.1341935782.git.nitin.a.kamble@intel.com>
References: <b4314c7a2f9fb120c2c4affd52567fe60a96bb5a.1341935782.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341935782.git.nitin.a.kamble@intel.com>
References: <cover.1341935782.git.nitin.a.kamble@intel.com>
Subject: [PATCH 12/19] xf86-video-vmware: fix build with automake 1.12.x
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
X-List-Received-Date: Tue, 10 Jul 2012 16:14:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

automake 1.12.x automatically deletes empty directories, so
the additional rmdir from the do_install_append fails.

cleanup the do_install_append for automake 1.12.x

Fixes this build issue:

| rmdir: failed to remove
`/srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/xf86-video-vmware-2_12.0.1-r17.1/image/usr/bin':
No such file or directory
NOTE: package xf86-video-vmware-2_12.0.1-r17.1: task do_install: Failed

No PR bump as no change in the output.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../xorg-driver/xf86-video-vmware_12.0.2.bb        |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
index 71f0339..4468fae 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
@@ -15,8 +15,3 @@ SRC_URI[md5sum] = "0743ec7c479603fba60d118858fd5783"
 SRC_URI[sha256sum] = "c827875fd94805ec9b925fe09aaa973e7e3f9096c7ef311d449c3f134ae75147"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-
-do_install_append () {
-	# Remove useless empty directory
-	rmdir ${D}${bindir}
-}
-- 
1.7.3.4



