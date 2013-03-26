Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1UKXMd-0006z7-A4
	for Openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:08:51 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Mar 2013 09:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,913,1355126400"; d="scan'208";a="276214731"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by azsmga001.ch.intel.com with ESMTP; 26 Mar 2013 09:51:46 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 09:51:45 -0700
Message-Id: <cfbc9b44fbaff5d2ad0b74d0b78924ff9d14d5b0.1364316538.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1364316538.git.nitin.a.kamble@intel.com>
References: <cover.1364316538.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] grub-efi-native_2.00.bb: fix a build issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 17:09:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Due to recent change in the oecore layer grub-efi recipe uses separate
builddir and the paths used in the do_deply need to change accordingly.

This change avoids this build issue:
install: cannot stat `/build-fri2/tmp/work/x86_64-linux/grub-efi-i586-native/2.00-r1/grub-2.00/bootia32.efi': No such file or directory
ERROR: Function failed: do_deploy (see /build-fri2/tmp/work/x86_64-linux/grub-efi-i586-native/2.00-r1/temp/log.do_deploy.5875 for further information)

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
index 14ab9ea..6f8ba8e 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
@@ -71,7 +71,7 @@ do_mkimage() {
 addtask mkimage after do_compile before do_install
 
 do_deploy() {
-	install -m 644 ${S}/${GRUB_IMAGE} ${DEPLOYDIR}
+	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
 }
 addtask deploy after do_install before do_build
 
-- 
1.7.3.4



