Return-Path: <mihaly.varga@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id B21207713D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 10:35:40 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u13AZfak018322 for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Feb 2016 04:35:41 -0600
Received: from mihaly-ro-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020304354124-595696 ;
	Wed, 3 Feb 2016 04:35:41 -0600 
From: Mihaly Varga <mihaly.varga@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 3 Feb 2016 12:35:06 +0200
Message-Id: <1454495706-32082-1-git-send-email-mihaly.varga@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/03/2016 04:35:41 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/03/2016 04:35:41 AM,
	Serialize complete at 02/03/2016 04:35:41 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-03_04:, , signatures=0
Cc: Mihaly Varga <mihaly.varga@ni.com>
Subject: [meta-oe][PATCH] wic: isoimage-isohybrid: check for syslinux-native
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
X-List-Received-Date: Wed, 03 Feb 2016 10:35:40 -0000

.iso image creation fails if during the image creation syslinux
is baked and syslinux-native is not.

Added new check to verify if both syslinux and syslinux-native
are baked and bake them if these are not installed.

Signed-off-by: Mihaly Varga <mihaly.varga@ni.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index c1e2a5d..62385a2 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -208,11 +208,14 @@ class IsoImagePlugin(SourcePlugin):
         if not os.path.exists("%s/syslinux" % syslinux_dir):
             msger.info("Building syslinux...\n")
             exec_cmd("bitbake syslinux")
-            msger.info("Building syslinux-native...\n")
-            exec_cmd("bitbake syslinux-native")
         if not os.path.exists("%s/syslinux" % syslinux_dir):
             msger.error("Please build syslinux first\n")
 
+        # Make sure syslinux is available in native sysroot
+        if not os.path.exists("%s/usr/bin/syslinux" % native_sysroot):
+            msger.info("Building syslinux-native...\n")
+            exec_cmd("bitbake syslinux-native")
+
         #Make sure mkisofs is available in native sysroot
         if not os.path.isfile("%s/usr/bin/mkisofs" % native_sysroot):
             msger.info("Building cdrtools-native...\n")
-- 
1.9.1


