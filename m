Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7CB71B2F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 22:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491431665; x=1522967665;
	h=from:to:cc:subject:date:message-id;
	bh=0i7xDB0eKSGvtEOLNu0DIX2o4hoPnENIjQ+k2CeT/Lo=;
	b=bb/EhBy6WYDnmyzKWAkyNDNAN4PlSoeG/DPqa2MvIiEe8RDA4vSqnGmG
	px8NLIvW1cfklwQ+r4dl2tezUsLmnw==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2017 15:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,280,1488873600"; d="scan'208";a="69913644"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2017 15:34:23 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 15:34:26 -0700
Message-Id: <20170405223426.14648-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] selftest/wic: skip wic unit tests in case NLS is disable
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
X-List-Received-Date: Wed, 05 Apr 2017 22:34:23 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

WIC test case requires wic-tools which in turn depends on intltool-native and
gettext-native. However, if NLS is disable, the gettext-minimal-native is used instead
of gettext-native causing a failure on intltool-native as seen below:

  checking for msgfmt... no
  checking for gmsgfmt... no
  configure: error: GNU gettext tools not found; required for intltool
  ERROR: Function failed: do_configure (log file is located at /home/lsandov1/poky/build/tmp/work/i586-poky-linux-musl/systemd-boot/232-r0/temp/log.do_configure.7518)
  ERROR: Task (/home/lsandov1/poky/meta/recipes-bsp/systemd-boot/systemd-boot_232.bb:do_configure) failed with exit code '1'
  NOTE: Tasks Summary: Attempted 609 tasks of which 604 didn't need to be rerun and 1 failed.

[YOCTO #10902]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index df5e060..8030c35 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -77,7 +77,10 @@ class Wic(oeSelfTest):
         # clean up which can result in the native tools built earlier in
         # setUpClass being unavailable.
         if not Wic.image_is_ready:
-            bitbake('wic-tools')
+            if get_bb_var('USE_NLS') == 'yes':
+                bitbake('wic-tools')
+            else:
+                self.skipTest('wic-tools cannot be built due its (intltool|gettext)-native dependency and NLS disable')
 
             bitbake('core-image-minimal')
             Wic.image_is_ready = True
-- 
2.10.2


