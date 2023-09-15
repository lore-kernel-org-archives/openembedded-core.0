Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E93AEE642E
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 07:31:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15771.1694763103213765424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 00:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jjZOLlTB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76224675e8=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38F5fFF2032486
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 00:31:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=v2FA9
	SWdCCQ2kA150E3ia4lv5zpjEHe1WXIp9uslgHA=; b=jjZOLlTBwDmQx4vkgfNOj
	5GapppOHr9e/S/W/NX/xebxb5QFrk5BHCaEmPhMfFbpToVgIeSTfmY9Shyso7fE8
	rfbMr8zvFUCWQnIbeDHYriauJO8NvsOPobsyt1ilhrP8B4dRYKMqSSL1XTIFw2zk
	bUj+SmnzD/9CUWRUmDuBprsXaZHpBOQZ75OeQJC383GOlatLdndGZ0MWFhXKfdTZ
	lXErm0BWZDXb22sZAdR5Dajij1OBOshlpf2mTyhwCKb7g+BnE1CaiH0EN5aIyt9K
	4V6uCGuyeatN5oHgRv1ZXvJ4SQY4QCoqaUGRbIL44vQuubU4iAcZcuddqBRksW5d
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y82amkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 00:31:42 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 00:31:39 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/2] tiff: fix CVE-2023-40745
Date: Fri, 15 Sep 2023 07:31:11 +0000
Message-ID: <20230915073112.2934720-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 7uPQ-4JdA4WyBJZ-GdSWy07000NfpfPC
X-Proofpoint-ORIG-GUID: 7uPQ-4JdA4WyBJZ-GdSWy07000NfpfPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_05,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=559 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309150065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 07:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187655

From: Yogita Urade <yogita.urade@windriver.com>

libtiff: integer overflow in tiffcp.c

References:
https://security-tracker.debian.org/tracker/CVE-2023-40745
https://gitlab.com/libtiff/libtiff/-/issues/591
https://bugzilla.redhat.com/show_bug.cgi?id=2235265

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libtiff/files/CVE-2023-40745.patch        | 35 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.5.1.bb |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
new file mode 100644
index 0000000000..a88a01c5a8
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
@@ -0,0 +1,35 @@
+From 4fc16f649fa2875d5c388cf2edc295510a247ee5 Mon Sep 17 00:00:00 2001
+From: Arie Haenel <arie.haenel@jct.ac.il>
+Date: Wed, 13 Sep 2023 11:07:05 +0000
+Subject: [PATCH] tiffcp: fix memory corruption (overflow) on hostile images
+ (fixes #591)
+
+CVE: CVE-2023-40745
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/4fc16f649fa2875d5c388cf2edc295510a247ee5]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiffcp.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 3b2d1dd..80b3982 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -1754,6 +1754,13 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+                   "Width * Samples/Pixel)");
+         return 0;
+     }
++
++    if ( (imagew - tilew * spp) > INT_MAX ){
++        TIFFError(TIFFFileName(in),
++                  "Error, image raster scan line size is too large");
++        return 0;
++    }
++
+     iskew = imagew - tilew * spp;
+     tilebuf = limitMalloc(tilesize);
+     if (tilebuf == 0)
+--
+2.35.5
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
index 5af3f84265..9279a19431 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
 
 CVE_PRODUCT = "libtiff"
 
-SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
+SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+           file://CVE-2023-40745.patch \
+          "
 
 SRC_URI[sha256sum] = "d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b"
 
-- 
2.35.5


