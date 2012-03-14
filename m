Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7cLI-0006nj-3V
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 01:45:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Mar 2012 17:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77188082"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.185])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 17:36:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 00:36:32 +0000
Message-Id: <9583d660052617740b61feeb6739263f06e5a64f.1331685330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331685330.git.paul.eggleton@linux.intel.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331685330.git.paul.eggleton@linux.intel.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] linux-yocto-tiny: add dependency on xz-native
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
X-List-Received-Date: Wed, 14 Mar 2012 00:45:28 -0000

The kernel configuration requires lzma to compress the kernel image
(CONFIG_KERNEL_LZMA=y), so add a dependency on xz-native which provides
it.

Fixes [YOCTO #1728].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
index 5cad513..a3a6167 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
@@ -1,6 +1,9 @@
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
 
+# We need lzma (as CONFIG_KERNEL_LZMA=y)
+DEPENDS += "xz-native"
+
 #KMACHINE = "yocto/standard/tiny/base"
 KMACHINE = "yocto/standard/base"
 KBRANCH = "${KMACHINE}"
@@ -10,7 +13,7 @@ LINUX_VERSION ?= "3.0.23"
 SRCREV_machine ?= "8fd24b3570ab995848e4123ef13bac64e2c924be"
 SRCREV_meta ?= "e559129b4a6f39f68b75141096b2d516cf7a7f35"
 
-PR = "r2"
+PR = "r3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta \
-- 
1.7.5.4



