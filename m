Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 52C8B6DA62
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 02:32:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAF2W2Lj006559
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Nov 2013 18:32:02 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 14 Nov 2013 18:32:02 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Nov 2013 10:31:56 +0800
Message-ID: <727d20f857088be71c71895bd0a287191d23a098.1384482610.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384482610.git.hongxu.jia@windriver.com>
References: <cover.1384482610.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] xorg-driver: fix qa issue while multilib enabled - contains Xorg driver but no xorg-abi
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
X-List-Received-Date: Fri, 15 Nov 2013 02:32:05 -0000
Content-Type: text/plain

...
WARNING: QA Issue: Package lib32-xf86-video-vesa contains Xorg driver (vesa_drv.so) but no xorg-abi- dependencies
WARNING: QA Issue: Package lib32-xf86-video-intel contains Xorg driver (intel_drv.so) but no xorg-abi- dependencies
WARNING: QA Issue: Package lib32-xf86-video-omap contains Xorg driver (omap_drv.so) but no xorg-abi- dependencies
WARNING: QA Issue: Package lib32-xf86-video-vmware contains Xorg driver (vmware_drv.so) but no xorg-abi- dependencies
WARNING: QA Issue: Package lib32-xf86-video-fbdev contains Xorg driver (fbdev_drv.so) but no xorg-abi- dependencies
WARNING: QA Issue: Package lib32-xf86-video-modesetting contains Xorg driver (modesetting_drv.so) but no xorg-abi- dependencies
...

In oe-core 87be2314fe0e67a616b4f713106b4ae46931f5cb, it fixed add_abi_depends
issue while enable multilib.

We did the same thing for qa check: package_qa_check_xorg_driver_abi.

[YOCTO #5545]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3558dee..0205534 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -558,8 +558,9 @@ def package_qa_check_xorg_driver_abi(path, name, d, elf, messages):
 
     driverdir = d.expand("${libdir}/xorg/modules/drivers/")
     if driverdir in path and path.endswith(".so"):
+        mlprefix = d.getVar('MLPREFIX', True) or ''
         for rdep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + name, True) or ""):
-            if rdep.startswith("xorg-abi-"):
+            if rdep.startswith("%sxorg-abi-" % mlprefix):
                 return
         messages.append("Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path)))
 
-- 
1.8.1.2


