Return-Path: <prvs=221486d377=haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id E211E7F38D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 19:54:30 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xA7IoxVK010120; Thu, 7 Nov 2019 12:51:47 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2w41wsm7hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 07 Nov 2019 12:51:47 -0600
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	xA7IpklC019812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2019 12:51:46 -0600
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 12:51:46 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 12:51:46 -0600
Received: from harisdt.amer.corp.natinst.com (172.18.68.32) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Thu, 7 Nov 2019 12:51:46 -0600
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Nov 2019 12:51:42 -0600
Message-ID: <20191107185142.1728269-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-11-07_05:2019-11-07,2019-11-07 signatures=0
X-Proofpoint-Spam-Reason: safe
Cc: haris.okanovic@ni.com, adrian.ratiu@ni.com, ken.sharp@ni.com
Subject: [PATCH] isoimage-isohybrid.py: Parameterize ESP partition size
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
X-List-Received-Date: Thu, 07 Nov 2019 19:54:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add "esp_extra_blocks" plugin parameter so that caller may change
ESP's free space from the default 100 blocks.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 95a54a09d2..11326a274b 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -336,11 +336,13 @@ class IsoImagePlugin(SourcePlugin):
                 (img_iso_dir, isodir)
             exec_cmd(install_cmd)
         else:
+            # Default to 100 blocks of extra space for file system overhead
+            esp_extra_blocks = int(source_params.get('esp_extra_blocks', '100'))
+
             du_cmd = "du -bks %s/EFI" % isodir
             out = exec_cmd(du_cmd)
             blocks = int(out.split()[0])
-            # Add some extra space for file system overhead
-            blocks += 100
+            blocks += esp_extra_blocks
             logger.debug("Added 100 extra blocks to %s to get to %d "
                          "total blocks", part.mountpoint, blocks)
 
-- 
2.24.0


