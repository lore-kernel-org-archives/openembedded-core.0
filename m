Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 713BB77DCA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 15:14:21 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 08:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="123825948"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.80.236])
	by orsmga005.jf.intel.com with ESMTP; 11 Jul 2017 08:14:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 11 Jul 2017 08:14:16 -0700
Message-Id: <1499786056-32624-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH][pyro] mkefidsk: fix bash/dash shell quoting problem
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
X-List-Received-Date: Tue, 11 Jul 2017 15:14:22 -0000

mkefidsk currently writes a startup.nsh with embedded control characters.
This happens because \b etc are control sequences to the shell echo
command when using dash. The resulting startup.nsh causes the bootup
to fail, and the user is dropped into the EFI shell to manually run
startup.nsh.

Patch originally provided by Troy D. Hanson <troy.hanson@jhuapl.edu>

[YOCTO #9665]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 008d6cb5bb4969f53a228893c502be8c9420ecb0)
---
Backport REQUEST

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


