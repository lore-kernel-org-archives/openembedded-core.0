Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF67C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 16:09:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.47432.1670861335817432991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 08:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AMSo1Lng;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93453c5864=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCD8klq023881
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 08:08:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=j765Yh/r3ZZZbq7tT/M3Ci+pszkBJYtPC5C+z4q8iNM=;
 b=AMSo1LngOqlPHsP/nnGK6kBrPVrV29u5S9zsO1tXcdpzC0gS4+pw8st2RZLx4XsEF1vF
 ZxqsLMKONDlBUUUqHIADbBNXZ2QUW0X25f9vk6n3jLkAY3ZgaMU8EJF/PMc6jDEez84q
 GUV93eFEBgFj1sTLAeYRyidtM2o2e3DKXQl6tDpXfbu7cErmNxGN0CKNPuuk/jHhnHDB
 1Nm9LLa69f5fkkPyoZerlbW2azoQSSK6YsoyMn14Mu5Q/e2y6IP0IKCEqShvTWbdxXi+
 d/906aHy3kWroUL1b854lHilbN+VABzBOudMoEkJb9pP0qQPTVN8TzRq9fXOAmoxdKP1 EA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mcp95sgfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 08:08:54 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 12 Dec 2022 08:08:35 -0800
Received: from pek-hostel-deb01.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 12 Dec 2022 08:08:34 -0800
From: Soumya <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, Soumya <soumya.sambu@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] pixman: fix CVE-2022-44638
Date: Tue, 13 Dec 2022 00:08:27 +0800
Message-ID: <20221212160827.894775-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -BGQglXEANUBsTzYWxUeopuyeQyx5A-Q
X-Proofpoint-ORIG-GUID: -BGQglXEANUBsTzYWxUeopuyeQyx5A-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=531 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 16:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174498

pixman: In libpixman in Pixman before 0.42.2, there is an out-of-bounds write
(aka heap-based buffer overflow) in rasterize_edges_8 due to an integer
overflow in pixman_sample_floor_y.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-44638

Upstream-Status: Backport [https://gitlab.freedesktop.org/pixman/pixman/-/commit/a1f88e842e0216a5b4df1ab023caebe33c101395]

CVE: CVE-2022-44638

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../xorg-lib/pixman/CVE-2022-44638.patch      | 36 +++++++++++++++++++
 .../xorg-lib/pixman_0.40.0.bb                 |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
new file mode 100644
index 0000000000..5705d8e4e5
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
@@ -0,0 +1,36 @@
+From a1f88e842e0216a5b4df1ab023caebe33c101395 Mon Sep 17 00:00:00 2001
+From: Matt Turner <mattst88@gmail.com>
+Date: Wed, 2 Nov 2022 12:07:32 -0400
+Subject: [PATCH] Avoid integer overflow leading to out-of-bounds write
+
+Thanks to Maddie Stone and Google's Project Zero for discovering this
+issue, providing a proof-of-concept, and a great analysis.
+
+Closes: https://gitlab.freedesktop.org/pixman/pixman/-/issues/63
+
+Upstream-Status: Backport
+CVE: CVE-2022-44638
+
+Reference to upstream patch:
+[https://gitlab.freedesktop.org/pixman/pixman/-/commit/a1f88e842e0216a5b4df1ab023caebe33c101395]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ pixman/pixman-trap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pixman/pixman-trap.c b/pixman/pixman-trap.c
+index 91766fd..7560405 100644
+--- a/pixman/pixman-trap.c
++++ b/pixman/pixman-trap.c
+@@ -74,7 +74,7 @@ pixman_sample_floor_y (pixman_fixed_t y,
+
+     if (f < Y_FRAC_FIRST (n))
+     {
+-	if (pixman_fixed_to_int (i) == 0x8000)
++	if (pixman_fixed_to_int (i) == 0xffff8000)
+	{
+	    f = 0; /* saturate */
+	}
+--
+2.38.1
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index ccfe277746..c56733eefd 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -9,6 +9,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
+           file://CVE-2022-44638.patch \
            "
 SRC_URI[md5sum] = "73858c0862dd9896fb5f62ae267084a4"
 SRC_URI[sha256sum] = "6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b9021f5534db223fc"
-- 
2.25.1


