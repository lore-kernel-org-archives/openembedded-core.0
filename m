Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id CCF79760A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 14:31:42 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u31EVgnF020681 for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Apr 2016 09:31:43 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016040109314340-464340 ;
	Fri, 1 Apr 2016 09:31:43 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 1 Apr 2016 17:31:19 +0300
Message-Id: <18546c4acf904968012b1861fac052bc72e55e09.1459520938.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/01/2016 09:31:43 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/01/2016 09:31:43 AM,
	Serialize complete at 04/01/2016 09:31:43 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-01_06:, , signatures=0
Subject: [PATCH 1/2] isoimage-isohybrid.py: use glob to find initramfs location
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
X-List-Received-Date: Fri, 01 Apr 2016 14:31:45 -0000

Some filenames can omit 'initramfs', or use other names. This makes
detection more flexible by using only the image name, machine arch and
image type in a glob wildcard.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 31dc9b6..de99ad8 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -23,6 +23,7 @@
 import os
 import re
 import shutil
+import glob
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
@@ -150,8 +151,7 @@ class IsoImagePlugin(SourcePlugin):
             if not machine_arch:
                 msger.error("Couldn't find MACHINE_ARCH, exiting.\n")
 
-            initrd = "%s/%s-initramfs-%s.%s" \
-                    % (initrd_dir, image_name, machine_arch, image_type)
+            initrd = glob.glob('%s/%s*%s.%s' % (initrd_dir, image_name, machine_arch, image_type))[0]
 
         if not os.path.exists(initrd):
             # Create initrd from rootfs directory
-- 
2.7.4


