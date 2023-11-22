Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88C4C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 11:50:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17531.1700653811070044780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 03:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EXscyxEo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9690644334=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AMBj2c9017505
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 11:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=mSonq
	q6O47cdFk10PSDo31YPW3TiA7dLeTUDZj/lF4c=; b=EXscyxEohbqdlWRfko/FU
	CcfMcFrfrkibV1TTiC9yUdiKV+qM1cT6SO3O+qKQc3s5Fm2kuZcZrATjUnYNo2Sx
	fAqWsme7LbczJTl4FDd7eORfn774keufho5EWi2bu06AS2XluZIFAUVoV3wifVE1
	VWMSPZm81PnBwWZBzalWRBdesMok4v1iuiOvPqw2nBRh3JlXftFhAxt6s7jAOOrO
	R/845EBjd5Wnnxwk0t7GJD8fZkXdgFfR+XEZ/UDQKDf8dBa4fJzmOek0ycSUaF4L
	219OuSTOcZDckHf80be/aBI1YcJvt4KEUiXFcZ4Vh/t1yzdoaEHnmiIhdxgZ/99M
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uf41saxf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 11:50:10 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 03:50:13 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] gstreamer1.0-plugins-bad: fix CVE-2023-44429
Date: Wed, 22 Nov 2023 11:49:50 +0000
Message-ID: <20231122114950.2095666-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 9tcgOhBIJVDti7mrwisiVUTu0Y-w9kAV
X-Proofpoint-GUID: 9tcgOhBIJVDti7mrwisiVUTu0Y-w9kAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=683 adultscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311220083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 11:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191069

From: Archana Polampalli <archana.polampalli@windriver.com>

AV1 codec parser buffer overflow

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../CVE-2023-44429.patch                      | 38 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44429.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44429.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44429.patch
new file mode 100644
index 0000000000..5070d6b865
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44429.patch
@@ -0,0 +1,38 @@
+From 1db83d3f745332cbda6adf954b2c53a10caa205e Mon Sep 17 00:00:00 2001
+From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
+Date: Wed, 4 Oct 2023 11:14:38 +0200
+Subject: [PATCH] codecparsers: av1: Clip max tile rows and cols values
+
+Clip tile rows and cols to 64 as describe in AV1 specification.
+
+Fixes ZDI-CAN-22226 / CVE-2023-44429
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3015
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5634>
+
+CVE: CVE-2023-44429
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1db83d3f745332cbda6adf954b2c53a10caa205e]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst-libs/gst/codecparsers/gstav1parser.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gst-libs/gst/codecparsers/gstav1parser.c b/gst-libs/gst/codecparsers/gstav1parser.c
+index 7b9378c..68f8a76 100644
+--- a/gst-libs/gst/codecparsers/gstav1parser.c
++++ b/gst-libs/gst/codecparsers/gstav1parser.c
+@@ -2219,6 +2219,8 @@ gst_av1_parse_tile_info (GstAV1Parser * parser, GstBitReader * br,
+       ((parser->state.mi_cols + 31) >> 5) : ((parser->state.mi_cols + 15) >> 4);
+   sb_rows = seq_header->use_128x128_superblock ? ((parser->state.mi_rows +
+           31) >> 5) : ((parser->state.mi_rows + 15) >> 4);
++  sb_cols = MIN (GST_AV1_MAX_TILE_COLS, sb_cols);
++  sb_rows = MIN (GST_AV1_MAX_TILE_ROWS, sb_rows);
+   sb_shift = seq_header->use_128x128_superblock ? 5 : 4;
+   sb_size = sb_shift + 2;
+   max_tile_width_sb = GST_AV1_MAX_TILE_WIDTH >> sb_size;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index fbaabda3f9..504cfce1fd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://CVE-2023-40474.patch \
            file://CVE-2023-40475.patch \
            file://CVE-2023-40476.patch \
+           file://CVE-2023-44429.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.40.0


