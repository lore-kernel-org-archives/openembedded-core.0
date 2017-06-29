Return-Path: <sgw@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6E84978203
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 20:46:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 29 Jun 2017 13:46:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,282,1496127600"; d="scan'208";a="1166327800"
Received: from swold-mobl2.jf.intel.com ([10.24.10.21])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2017 13:46:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu, 29 Jun 2017 13:46:18 -0700
Message-Id: <1498769178-28026-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH] mkefidsk: fix bash/dash shell quoting problem
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
X-List-Received-Date: Thu, 29 Jun 2017 20:46:27 -0000

mkefidsk currently writes a startup.nsh with embedded control characters.
This happens because \b etc are control sequences to the shell echo
command when using dash. The resulting startup.nsh causes the bootup
to fail, and the user is dropped into the EFI shell to manually run
startup.nsh.

Patch originally provided by Troy D. Hanson <troy.hanson@jhuapl.edu>

[YOCTO #9665]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
Tested with both bash and dash

 scripts/contrib/mkefidisk.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 800733f..ac4ec9c 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -444,7 +444,7 @@ if [ -d $ROOTFS_MNT/etc/udev/ ] ; then
 fi
 
 # Add startup.nsh script for automated boot
-echo "fs0:\EFI\BOOT\bootx64.efi" > $BOOTFS_MNT/startup.nsh
+printf "fs0:\%s\BOOT\%s\n" "EFI" "bootx64.efi" > $BOOTFS_MNT/startup.nsh
 
 
 # Call cleanup to unmount devices and images and remove the TMPDIR
-- 
2.7.5


