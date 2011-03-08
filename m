Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PwkpP-0002M8-Ki
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 01:31:07 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Mar 2011 16:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,280,1297065600"; d="scan'208";a="399048515"
Received: from unknown (HELO localhost) ([10.255.12.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Mar 2011 16:29:35 -0800
Message-Id: <0c04b8bd89465d186d0ccb6912e7c08aae506541.1299544029.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299544029.git.sgw@linux.intel.com>
References: <cover.1299544029.git.sgw@linux.intel.com>
Old-Date: Mon, 7 Mar 2011 16:47:20 +0800
Date: Mon, 07 Mar 2011 16:29:34 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Tue, 08 Mar 2011 08:18:44 +0100
Cc: Koen Kooi <koen@dominion.thruhere.net>, Liping Ke <liping.ke@intel.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 6/8] util-macros: fix DEPENDS in the case of native/nativesdk
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
X-List-Received-Date: Tue, 08 Mar 2011 00:31:07 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

This fixes [YOCTO #814]

Without the line fixing nativesdk, bitbake meta-toolchain-gmae would
get the following:

Missing or unbuildable dependency chain was: ['meta-toolchain-gmae', 'task-sdk-host', 'qemu-nativesdk', 'libsdl-nativesdk', 'libx11-nativesdk', 'util-macros-nativesdk', 'libgpg-error-nativesdk']
ERROR: Nothing PROVIDES 'libgpg-error-nativesdk'

[sgw: inherit gettext]
Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-util/util-macros_1.11.0.bb                |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
index 2bfe514..10de96c 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
@@ -11,12 +11,13 @@ PE = "1"
 PR = "r0"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-DEPENDS = "gettext libgpg-error"
-DEPENDS_virtclass-native = "gettext"
+DEPENDS = "libgpg-error"
 
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
 
+inherit gettext
+
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "8580021f3a9e242ab09d23d62e475d53"
-- 
1.7.1.1



