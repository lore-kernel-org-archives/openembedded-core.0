Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFEO6-0007Yi-RT
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 02:47:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Apr 2012 17:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="137320006"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.141])
	by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2012 17:38:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2012 17:38:39 -0700
Message-Id: <1333499919-11883-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Cc: paul.eggelton@intel.com
Subject: [PATCH] self-hosted-image: Increase space for build and allow builder user sudo access
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
X-List-Received-Date: Wed, 04 Apr 2012 00:47:51 -0000

We need to have about 40G to do a full sato build even with rm_work enabled
Add sudo priveleges inorder to allow the builder user to setup the tap/tun
devices needed by runqemu

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index 39f0fc4..46dcc5f 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -12,11 +12,8 @@ CORE_IMAGE_EXTRA_INSTALL = "\
 
 IMAGE_FEATURES += "x11-mini package-management"
 
-# Ensure there's enough space to do a core-image-minimal build, with rm_work enabled
-IMAGE_ROOTFS_EXTRA_SPACE = "1048576"
-#IMAGE_ROOTFS_EXTRA_SPACE = "2621440"
-#IMAGE_ROOTFS_EXTRA_SPACE = "20971520"
-#IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
+# Ensure there's enough space to do a core-image-sato build, with rm_work enabled
+IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 
 # Do a quiet boot with limited console messages
 APPEND += "quiet"
@@ -54,6 +51,9 @@ fakeroot do_populate_poky_src () {
 	chown builder.builder ${IMAGE_ROOTFS}/home/builder/pseudo
 
 	chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky
+
+	# Allow builder to use sudo to setup tap/tun
+	echo "builder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
 }
 
 IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
-- 
1.7.7.6



