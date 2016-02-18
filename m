Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 68C2D731D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 17:18:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2016 09:18:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,466,1449561600"; d="scan'208";a="915924522"
Received: from bitbang.jf.intel.com ([10.7.199.151])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2016 09:18:02 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 09:17:53 -0800
Message-Id: <2eb2e622593e42ac5789fa97520054e463812a1c.1455815778.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455815778.git.randy.e.witt@linux.intel.com>
References: <cover.1455815778.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1455815778.git.randy.e.witt@linux.intel.com>
References: <cover.1455815778.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 1/3] populate_sdk_ext: Don't ignore SDK_TARGETS value
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
X-List-Received-Date: Thu, 18 Feb 2016 17:18:27 -0000

This fixes a problem where SDK_INSTALL_TARGETS wouldn't pick up the
value in SDK_TARGETS. It also removes the inline python to make the
code more readable.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 6e36642..7c95301 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -32,7 +32,18 @@ SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
 SDK_UPDATE_URL ?= ""
 
 SDK_TARGETS ?= "${PN}"
-SDK_INSTALL_TARGETS = "${@SDK_TARGETS if d.getVar('SDK_EXT_TYPE', True) != 'minimal' else ''} ${@'meta-world-pkgdata:do_allpackagedata' if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1' else ''}"
+
+def get_sdk_install_targets(d):
+    sdk_install_targets = ''
+    if d.getVar('SDK_EXT_TYPE', True) != 'minimal':
+        sdk_install_targets = d.getVar('SDK_TARGETS', True)
+
+    if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1':
+        sdk_install_targets += ' meta-world-pkgdata:do_allpackagedata'
+
+    return sdk_install_targets
+
+SDK_INSTALL_TARGETS = "${@get_sdk_install_targets(d)}"
 OE_INIT_ENV_SCRIPT ?= "oe-init-build-env"
 
 # The files from COREBASE that you want preserved in the COREBASE copied
-- 
2.5.0


