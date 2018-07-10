Return-Path: <prvs=6729c1d494=haris.okanovic@ni.com>
X-Greylist: delayed 1982 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Jul 2018 18:30:08 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED3275529
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 18:30:08 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6AHuQn4000811; Tue, 10 Jul 2018 12:57:06 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2k2u1phu80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 10 Jul 2018 12:57:06 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w6AHv57o006904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 10 Jul 2018 12:57:05 -0500
Received: from us-aus-exch7.ni.corp.natinst.com (130.164.68.17) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 10 Jul 2018 12:57:05 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch7.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 10 Jul 2018 12:57:05 -0500
Received: from harisdt.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Tue, 10 Jul 2018 12:57:05 -0500
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2018 12:57:00 -0500
Message-ID: <20180710175700.16659-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-10_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Cc: haris.okanovic@ni.com, ken.sharp@ni.com
Subject: [PATCH] populate_sdk_base/check_sdk_sysroots(): Normalize os.path.commonprefix()
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
X-List-Received-Date: Tue, 10 Jul 2018 18:30:09 -0000
Content-Type: text/plain

Normalize path (norm_path()) returned by os.path.commonprefix()
to strip trailing slash and prevent false negatives.

Add bb.note() on error to indicate which paths failed.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta/classes/populate_sdk_base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index aae6786e58..7bfaa33ac5 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -195,7 +195,9 @@ python check_sdk_sysroots() {
             targetPath = os.path.join(linkDirPath, targetPath)
         targetPath = norm_path(targetPath)
 
-        if SCAN_ROOT != os.path.commonprefix( [SCAN_ROOT, targetPath] ):
+        targetCommonPrefix = norm_path(os.path.commonprefix( [SCAN_ROOT, targetPath] ))
+        if SCAN_ROOT != targetCommonPrefix:
+            bb.note("'{0!s}' != '{1!s}'".format(SCAN_ROOT, targetCommonPrefix))
             bb.error("Escaping symlink {0!s} --> {1!s}".format(linkPath, targetPath))
             return
 
-- 
2.17.1


