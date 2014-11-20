Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B9E2765C78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 20:36:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2014 12:34:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="489262737"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.154])
	by orsmga003.jf.intel.com with ESMTP; 20 Nov 2014 12:34:12 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Nov 2014 14:37:38 -0600
Message-Id: <1416515858-7836-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][dizzy] package_manager: DpkgPM fix populate_sdk
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
X-List-Received-Date: Thu, 20 Nov 2014 20:36:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

DpkgPM change all_arch_list variable set from PACKAGE_ARCHS to passed
archs variable because is different when is executed from rootfs.py
and sdk.py.

Credits to: Ricardo Ribalda <ricardo.ribalda@gmail.com>

(From OE-Core rev: f6fb8c16f49fd9a2b124ad55f5c4fed82d7e6dca)

[YOCTO #6976]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 27fdf26..19895e5 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1477,7 +1477,7 @@ class DpkgPM(PackageManager):
 
         self.apt_args = d.getVar("APT_ARGS", True)
 
-        self.all_arch_list = self.d.getVar('PACKAGE_ARCHS', True).split()
+        self.all_arch_list = archs.split()
         all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
         self.all_arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in self.all_arch_list)
 
-- 
1.9.1


