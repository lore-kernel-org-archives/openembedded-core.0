Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 878EE6B1ED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 17:18:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Aug 2013 10:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,795,1367996400"; d="scan'208";a="379626495"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.169])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2013 10:18:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 18:17:59 +0100
Message-Id: <1375377479-8630-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] grub: disable floating ncurses dependency for GPLv2 version
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
X-List-Received-Date: Thu, 01 Aug 2013 17:18:13 -0000

A dependency was being added on ncurses conditionally upon whether it
had been built first. Explicitly disable this dependency to stop this
from happening.

Note that grub 2.x does not need this same fix because ncurses is only
used when building grub-emu, which is only built when the specified
target platform is "emu" which we do not use.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/grub/grub_0.97.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub_0.97.bb b/meta/recipes-bsp/grub/grub_0.97.bb
index 6971193..38f3912 100644
--- a/meta/recipes-bsp/grub/grub_0.97.bb
+++ b/meta/recipes-bsp/grub/grub_0.97.bb
@@ -26,6 +26,8 @@ inherit autotools
 
 COMPATIBLE_HOST = "i.86.*-linux"
 
+EXTRA_OECONF = "--without-curses"
+
 do_install_append_vmware() {
 	mkdir -p ${D}/boot/
 	ln -sf ../usr/lib/grub/{$TARGET_ARCH}{$TARGET_VENDOR}/ ${D}/boot/grub
-- 
1.8.1.2


