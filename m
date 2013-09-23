Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 025E9610D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 20:49:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Sep 2013 13:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,965,1371106800"; d="scan'208";a="382444033"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.196.147])
	by orsmga001.jf.intel.com with ESMTP; 23 Sep 2013 13:49:44 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 13:54:10 -0700
Message-Id: <0e464e9ccc8460aa9734bc09915f57b80141e453.1379969542.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <718a56d2550d5c22a4b35ac8385b1b2a67c2d8e2.1379969542.git.dvhart@linux.intel.com>
References: <718a56d2550d5c22a4b35ac8385b1b2a67c2d8e2.1379969542.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1379969542.git.dvhart@linux.intel.com>
References: <cover.1379969542.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/2] init-install-efi.sh: Remove unnecessary udev rules file to avoid errors
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
X-List-Received-Date: Mon, 23 Sep 2013 20:49:46 -0000

Fixes [YOCTO #5233]

Modeled after Chen Qi's fix to [YOCTO #3924] from oe-core commit:
6b6db7b4fb7aa17b8e29076decc830149b9d35bc
init-install.sh: remove unnecessary udev rules file to avoid error messages

/etc/udev/scripts/mount.sh is removed by init-install-efi.sh, but the
udev rules file which specifies the invocation of this script is not
removed, thus causing the error message during a live install:

/etc/udev/scripts/mount.sh: No such file or directory

The /etc/udev/rules/automount.rules no longer works once the mount.sh
script is removed. Remove it to avoid the error message.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: mihaix.lindner@linux.intel.com
---
 .../initrdscripts/files/init-install-efi.sh        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 574966e..9846637 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -58,6 +58,7 @@ echo "Installing image on /dev/${device}"
 #
 # The udev automounter can cause pain here, kill it
 #
+rm -f /etc/udev/rules.d/automount.rules
 rm -f /etc/udev/scripts/mount*
 
 #
-- 
1.7.9.5


