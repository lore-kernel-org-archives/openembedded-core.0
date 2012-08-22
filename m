Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4ILT-00058H-ES
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 23:20:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2012 14:08:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,296,1344236400"; d="scan'208";a="208828074"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.21])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2012 14:08:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2012 14:07:56 -0700
Message-Id: <66d6cf58434798cfb593c5477b3ecdbff5531fa1.1345669569.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <f8b5bec5e5eaeabf68a4f71513a5d8d48d69c680.1345669569.git.sgw@linux.intel.com>
References: <f8b5bec5e5eaeabf68a4f71513a5d8d48d69c680.1345669569.git.sgw@linux.intel.com>
In-Reply-To: <cover.1345669569.git.sgw@linux.intel.com>
References: <cover.1345669569.git.sgw@linux.intel.com>
Subject: [PATCH 2/2] external-python-tarball: Blacklist recipe if ipk is not in the PACKAGE_CLASSES list
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
X-List-Received-Date: Wed, 22 Aug 2012 21:20:11 -0000

This is needed because ipk tools and variables (specically
IPKGCONF_TARGET and IPKGCONF_SDK) are used from the rootfs_ipk.bbclass

I tried to inherit directly but it still fails to expand those.

[YOCTO #2814]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/meta/external-python-tarball.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/meta/external-python-tarball.bb b/meta/recipes-core/meta/external-python-tarball.bb
index 6bc837b..e317ba3 100644
--- a/meta/recipes-core/meta/external-python-tarball.bb
+++ b/meta/recipes-core/meta/external-python-tarball.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 DEPENDS = "opkg-native opkg-utils-native virtual/fakeroot-native sed-native"
 
+PR = "r1"
+
 inherit meta
 
 SDK_DIR = "${WORKDIR}/sdk"
@@ -91,3 +93,6 @@ do_populate_sdk[nostamp] = "1"
 do_populate_sdk[recrdeptask] = "do_package_write"
 addtask populate_sdk before do_build after do_install
 
+inherit blacklist
+
+PNBLACKLIST[external-python-tarball] = "${@base_contains('PACKAGE_CLASSES', 'package_ipk', '', 'This recipe requires \'package_ipk\' support to be enabled in PACKAGE_CLASSES.', d)}"
-- 
1.7.7.6



