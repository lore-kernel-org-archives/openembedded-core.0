Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E9CA6781FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 20:28:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 13:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,442,1498546800"; d="scan'208";a="123361394"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 28 Aug 2017 13:28:30 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2017 13:28:24 -0700
Message-Id: <1503952106-26310-7-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503952106-26310-1-git-send-email-juro.bystricky@intel.com>
References: <1503952106-26310-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 6/8] eudev_3.2.2: improve reproducibility
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
X-List-Received-Date: Mon, 28 Aug 2017 20:28:29 -0000

Remove all host build references from the eudev-dbg package

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/udev/eudev_3.2.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/udev/eudev_3.2.2.bb b/meta/recipes-core/udev/eudev_3.2.2.bb
index 47d958b..fcadfa3 100644
--- a/meta/recipes-core/udev/eudev_3.2.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.2.bb
@@ -50,6 +50,12 @@ do_install_append() {
 	rm -f ${D}${base_libdir}/udev/hid2hci
 }
 
+do_install_prepend_class-target () {
+	# Remove references to buildmachine
+	sed -i -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+		${B}/src/udev/keyboard-keys-from-name.h
+}
+
 INITSCRIPT_NAME = "udev"
 INITSCRIPT_PARAMS = "start 04 S ."
 
-- 
2.7.4


