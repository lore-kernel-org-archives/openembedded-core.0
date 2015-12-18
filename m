Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 12840731C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:40:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 18 Dec 2015 00:39:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,445,1444719600"; d="scan'208";a="843854159"
Received: from lleszczu-mobl.igk.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.252.17.67])
	by orsmga001.jf.intel.com with ESMTP; 18 Dec 2015 00:39:51 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 10:39:44 +0200
Message-Id: <1450427985-12504-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 4/5] cml1.bbclass: copy .config to S if externalsr is in use
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
X-List-Received-Date: Fri, 18 Dec 2015 08:40:19 -0000

This makes it easier to track changes made to config.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/cml1.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 95cf584..a95a2bf 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -28,6 +28,11 @@ python do_menuconfig() {
 
     oe_terminal("${SHELL} -c \"make ${KCONFIG_CONFIG_COMMAND}; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"", '${PN} Configuration', d)
 
+    # Copy .config back to source tree if externalsrc is in use
+    if (d.getVar('EXTERNALSRC', True) and
+            os.path.exists(os.path.join(d.getVar('S', True), '.config'))):
+        shutil.copy2('.config', os.path.join(d.getVar('S', True), '.config'))
+
     # FIXME this check can be removed when the minimum bitbake version has been bumped
     if hasattr(bb.build, 'write_taint'):
         try:
-- 
2.1.4


