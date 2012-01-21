Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RoUVg-0003rF-S7
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 07:33:09 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Jan 2012 22:25:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98235462"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 20 Jan 2012 22:25:26 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 22:25:21 -0800
Message-Id: <ffc4c2baa9ed5116336b1d5c2d6110f7e4163c27.1327127051.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1327127051.git.nitin.a.kamble@intel.com>
References: <cover.1327127051.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/4] ltp: disable elf binary stripping
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
X-List-Received-Date: Sat, 21 Jan 2012 06:33:09 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Otherwise the ltp tests ldd01 & nm01 fail due to missing stripped
information.

This Fixes these bugs:
[YOCTO #1922]
[YOCTO #1923]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-extended/ltp/ltp_20110915.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20110915.bb b/meta/recipes-extended/ltp/ltp_20110915.bb
index dabc0f0..fd0510e 100644
--- a/meta/recipes-extended/ltp/ltp_20110915.bb
+++ b/meta/recipes-extended/ltp/ltp_20110915.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, an
 HOMEPAGE = "http://ltp.sourceforge.net"
 SECTION = "console/utils"
 
-PR = "r0"
+PR = "r1"
 
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
@@ -66,3 +66,7 @@ do_install(){
 	# We will add expect for enhancement in future
 	find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
 }
+
+# Avoid geenrated binaries stripping. Otherwise some of the ltp tests such as ldd01 & nm fails
+INHIBIT_PACKAGE_STRIP = "1"
+
-- 
1.7.6.4



