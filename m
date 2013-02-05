Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2fB9-0006Tm-3n
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 10:51:05 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 01:35:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="281086894"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 01:35:10 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 11:34:58 +0200
Message-Id: <4aafa2f81939b6b38184a5413ff6323b1a777f52.1360055640.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/8] image.bbclass: add a proper error message if hook script fails
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
X-List-Received-Date: Tue, 05 Feb 2013 09:51:13 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/image.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9b4dec8..5cbf73a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -10,6 +10,7 @@ inherit gzipnative
 
 LICENSE = "MIT"
 PACKAGES = ""
+DEPENDS += "qemuwrapper-cross"
 RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${NORMAL_FEATURE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}"
 RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
 
@@ -197,6 +198,9 @@ run_intercept_scriptlets () {
 			echo "> Executing $script"
 			chmod +x $script
 			./$script
+			if [ $? -ne 0 ]; then
+				echo "ERROR: intercept script \"$script\" failed!"
+			fi
 		done
 	fi
 }
-- 
1.7.9.5



