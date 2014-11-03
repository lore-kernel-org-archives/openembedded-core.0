Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6901365D59
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 22:16:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 03 Nov 2014 14:13:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,309,1413270000"; d="scan'208";a="601527937"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.154])
	by orsmga001.jf.intel.com with ESMTP; 03 Nov 2014 14:15:49 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Nov 2014 16:16:25 -0600
Message-Id: <1415052985-1980-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] package_manager: DpkgPM fix populate_sdk
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
X-List-Received-Date: Mon, 03 Nov 2014 22:16:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

DpkgPM change all_arch_list variable set from PACKAGE_ARCHS to passed
archs variable because is different when is executed from rootfs.py
and sdk.py.

Credits to: Ricardo Ribalda <ricardo.ribalda@gmail.com>

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index ffb83b2..e44e28a 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1478,7 +1478,7 @@ class DpkgPM(PackageManager):
 
         self.apt_args = d.getVar("APT_ARGS", True)
 
-        self.all_arch_list = self.d.getVar('PACKAGE_ARCHS', True).split()
+        self.all_arch_list = archs.split()
         all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
         self.all_arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in self.all_arch_list)
 
-- 
1.9.1


