Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE8273063
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 14:41:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 06:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,198,1484035200"; d="scan'208";a="827650204"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2017 06:41:11 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D28276A4004
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 06:41:09 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 16:33:49 +0200
Message-Id: <d80201cf277f8299b66b46aa1da7c9a31dac155b.1487860017.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487860017.git.ed.bartosh@linux.intel.com>
References: <cover.1487860017.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/2] wic: add more targets to directdisk syslinux config
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
X-List-Received-Date: Thu, 23 Feb 2017 14:41:10 -0000

Added 3 new targets to directdisk-bootloader-config.cfg to
match hddimg syslinux config.

This is a preparation for dropping hddimg in favor of wic.

[YOCTO #11044]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../canned-wks/directdisk-bootloader-config.cfg    | 28 +++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg b/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
index a16bd6a..d5a07d2 100644
--- a/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
+++ b/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
@@ -1,11 +1,27 @@
 # This is an example configuration file for syslinux.
-PROMPT 0
-TIMEOUT 10
-
+TIMEOUT 50
 ALLOWOPTIONS 1
 SERIAL 0 115200
+PROMPT 0
+
+UI vesamenu.c32
+menu title Select boot options
+menu tabmsg Press [Tab] to edit, [Return] to select
+
+DEFAULT Graphics console boot
+
+LABEL Graphics console boot
+KERNEL /vmlinuz
+APPEND label=boot root=/dev/sda2 rootwait
+
+LABEL Serial console boot
+KERNEL /vmlinuz
+APPEND label=boot root=/dev/sda2 rootwait console=ttyS0,115200
+
+LABEL Graphics console install
+KERNEL /vmlinuz
+APPEND label=install root=/dev/sda2 rootwait
 
-DEFAULT boot
-LABEL boot
+LABEL Serial console install
 KERNEL /vmlinuz
-APPEND label=boot root=/dev/sda2 rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0
+APPEND label=install root=/dev/sda2 rootwait console=ttyS0,115200
-- 
2.1.4


