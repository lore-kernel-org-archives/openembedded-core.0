Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658FFC25B5C
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 11:43:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10514.1714736614968000299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 04:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dBDDVHxX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5853a5d84a=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4435qpm2010399
	for <openembedded-core@lists.openembedded.org>; Fri, 3 May 2024 11:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=sBL+XXP0V4lK7RkKIaEhV6JsxTTgOr3/7xSAgdhiowo=; b=
	dBDDVHxX+i73p09YGHtTZI4B+P8EXu61E6lq6MCE3BmCt92cziqW+kOhTT4+2wFG
	yiJ1u4vmcsZVGHnPSQwFd1NdNyJBYNAvAdnyYfI0R/FnexhU9ODzMbzIAdB6EF8j
	hul3l1xGddpkdDYm/a7dIn0LMPVIyPv7iCLV0VdFhL+i+8o4/qg3Turaj0oRFRup
	fr2Nry4JPL+N1UNecW13acoczZKr88zXWSjtaRamymE4qHTw6ITfdhcOdn6xB4ln
	hmcTOfuTDDx8KO1BwYc15afrhHRRBRd3Ydf4KFTiyVlaTVi9iIakaZCrmqjwaLR8
	03wHK0ZDN447SNhWy8G0HA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xrrb6eg1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 11:43:34 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 3 May 2024 04:43:31 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 3/4] gstreamer1.0-plugins-bad: fix CVE-2024-0444
Date: Fri, 3 May 2024 11:41:54 +0000
Message-ID: <20240503114155.449802-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240503114155.449802-1-archana.polampalli@windriver.com>
References: <20240503114155.449802-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: WCadmsbxjSXR1vWcjtB89U0P6TaBmoJf
X-Proofpoint-GUID: WCadmsbxjSXR1vWcjtB89U0P6TaBmoJf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_07,2024-05-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405030084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 11:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198979

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../CVE-2024-0444.patch                       | 42 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2024-0444.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2024-0444.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2024-0444.patch
new file mode 100644
index 0000000000..6265f4293e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2024-0444.patch
@@ -0,0 +1,42 @@
+From 394d5066f8a7b728df02fe9084e955b2f7d7f6fe Mon Sep 17 00:00:00 2001
+From: Seungha Yang <seungha@centricular.com>
+Date: Wed, 10 Jan 2024 03:33:59 +0900
+Subject: [PATCH] av1parser: Fix potential stack overflow during tile list
+ parsing
+
+The tile_count_minus_1 must be less than or equal to 511 as specified
+in spec "6.11.1 General tile list OBU semantics"
+
+Fixes #3214 / CVE-2024-0444 / ZDI-CAN-22873
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5971>
+
+CVE: CVE-2024-0444
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/394d5066f8a7b728]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst-libs/gst/codecparsers/gstav1parser.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/gst-libs/gst/codecparsers/gstav1parser.c b/gst-libs/gst/codecparsers/gstav1parser.c
+index 68f8a76..bab404e 100644
+--- a/gst-libs/gst/codecparsers/gstav1parser.c
++++ b/gst-libs/gst/codecparsers/gstav1parser.c
+@@ -4352,6 +4352,13 @@ gst_av1_parser_parse_tile_list_obu (GstAV1Parser * parser,
+   tile_list->output_frame_width_in_tiles_minus_1 = AV1_READ_BITS (br, 8);
+   tile_list->output_frame_height_in_tiles_minus_1 = AV1_READ_BITS (br, 8);
+   tile_list->tile_count_minus_1 = AV1_READ_BITS (br, 16);
++  if (tile_list->tile_count_minus_1 + 1 > GST_AV1_MAX_TILE_COUNT) {
++    GST_WARNING ("Invalid tile_count_minus_1 %d",
++        tile_list->tile_count_minus_1);
++    retval = GST_AV1_PARSER_BITSTREAM_ERROR;
++    goto error;
++  }
++
+   for (tile = 0; tile <= tile_list->tile_count_minus_1; tile++) {
+     if (AV1_REMAINING_BITS (br) < 8 + 8 + 8 + 16) {
+       retval = GST_AV1_PARSER_NO_MORE_DATA;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index 504cfce1fd..219ebe4fa7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://CVE-2023-40475.patch \
            file://CVE-2023-40476.patch \
            file://CVE-2023-44429.patch \
+           file://CVE-2024-0444.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.40.0


