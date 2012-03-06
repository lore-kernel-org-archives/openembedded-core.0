Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S54Ml-000460-Rl
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 01:04:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Mar 2012 15:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="74454813"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.109])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Mar 2012 15:55:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 23:55:37 +0000
Message-Id: <50d2b32b6d5367e5822c396d28a78ea54cb4ea40.1331078069.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331078069.git.paul.eggleton@linux.intel.com>
References: <cover.1331078069.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331078069.git.paul.eggleton@linux.intel.com>
References: <cover.1331078069.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] formfactor: use full path to fbset
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
X-List-Received-Date: Wed, 07 Mar 2012 00:04:28 -0000

When using rootless X, /usr/sbin is not in PATH and thus running "fbset"
will fail; so specify /usr/sbin/fbset instead.

Fixes [YOCTO #1986]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/formfactor/files/config      |    6 +++---
 meta/recipes-bsp/formfactor/formfactor_0.0.bb |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/formfactor/files/config b/meta/recipes-bsp/formfactor/files/config
index e936916..a3f762a 100755
--- a/meta/recipes-bsp/formfactor/files/config
+++ b/meta/recipes-bsp/formfactor/files/config
@@ -29,15 +29,15 @@ if [ -z "$DISPLAY_ORIENTATION" ]; then
 fi
 
 if [ -z "$DISPLAY_WIDTH_PIXELS" ]; then
-    DISPLAY_WIDTH_PIXELS=`fbset | grep geometry | awk '{ print $2 }'`
+    DISPLAY_WIDTH_PIXELS=`/usr/sbin/fbset | grep geometry | awk '{ print $2 }'`
 fi
 
 if [ -z "$DISPLAY_HEIGHT_PIXELS" ]; then
-    DISPLAY_HEIGHT_PIXELS=`fbset | grep geometry | awk '{ print $3 }'`
+    DISPLAY_HEIGHT_PIXELS=`/usr/sbin/fbset | grep geometry | awk '{ print $3 }'`
 fi
 
 if [ -z "$DISPLAY_BPP" ]; then
-    DISPLAY_BPP=`fbset | grep geometry | awk '{ print $6 }'`
+    DISPLAY_BPP=`/usr/sbin/fbset | grep geometry | awk '{ print $6 }'`
 fi
 
 # 
diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index abf20e0..31b4490 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r19"
+PR = "r20"
 
 SRC_URI = "file://config file://machconfig"
 S = "${WORKDIR}"
-- 
1.7.5.4



