Return-Path: <mihaly.varga@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id DC6777653B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 17:06:10 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t76H6Aq3017461; Thu, 6 Aug 2015 12:06:10 -0500
Received: from mihaly-ro-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015080612060969-1046606 ;
	Thu, 6 Aug 2015 12:06:09 -0500 
From: Mihaly Varga <mihaly.varga@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 6 Aug 2015 20:04:52 +0300
Message-Id: <1438880692-35724-4-git-send-email-mihaly.varga@ni.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438880692-35724-1-git-send-email-mihaly.varga@ni.com>
References: <1438880692-35724-1-git-send-email-mihaly.varga@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/06/2015 12:06:09 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/06/2015 12:06:09 PM,
	Serialize complete at 08/06/2015 12:06:09 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-08-06_09:, , signatures=0
Cc: Mihaly Varga <mihaly.varga@ni.com>
Subject: [PATCH 3/3] wic: Test creation of iso image
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
X-List-Received-Date: Thu, 06 Aug 2015 17:06:12 -0000

Added new wic testcase, for testing the creation of the hybrid iso
image with isoimage-isohybrid plugin.

Signed-off-by: Mihaly Varga <mihaly.varga@ni.com>
---
 meta/lib/oeqa/selftest/wic.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 0c503ef..117bd9d 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -160,3 +160,11 @@ class Wic(oeSelfTest):
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + \
                                      "%(wks)s-*.direct" % vars)))
+
+    def test18_iso_image(self):
+        """Test creation of hybrid iso imagewith legacy and EFI boot"""
+        self.assertEqual(0, runCmd("wic create mkhybridiso "
+                                   "--image-name core-image-minimal").status)
+        self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
+
-- 
1.9.1


