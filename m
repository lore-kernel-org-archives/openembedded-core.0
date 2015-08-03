Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 312B873D13
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 23:12:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2015 16:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,604,1432623600"; d="scan'208";a="535420021"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2015 16:06:44 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Aug 2015 15:01:04 +0000
Message-Id: <1438614064-10290-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] init-install-efi.sh: Avoid /mnt/mtab creation if already present
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Aug 2015 23:12:41 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The base-files recipe installs /mnt/mtab (it is a softlink of /proc/mounts),
so if an image includes the latter, there is no new to created it again inside
the install-efi.sh script, otherwise an error may occur as indicated on the
bug's site.

[YOCTO #7971]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index f339b30..665d04a 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -109,7 +109,11 @@ rm -f /etc/udev/scripts/mount*
 umount ${device}* 2> /dev/null || /bin/true
 
 mkdir -p /tmp
-cat /proc/mounts > /etc/mtab
+
+# Create /etc/mtab if not present
+if [ ! -e /etc/mtab ]; then
+    cat /proc/mounts > /etc/mtab
+fi
 
 disk_size=$(parted ${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
-- 
1.8.4.5


