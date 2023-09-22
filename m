Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEB5E70719
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 12:19:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20189.1695385171255540793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 05:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=joz3ZSuL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7629d4b6b2=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38MBrpmT022120
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 05:19:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=Uj9GfHiY4V4KiFvi0TwQEK53PPrXbcMmwJBI/GQpMv4=; b=
	joz3ZSuLv1/vdFHRNdowJ2C7DM8W9A6eVl7JjgakoqN+OxSYscna6GLEbcGrXdsI
	Hz5cUUsVf2v3P++XUEeTlr5/1nPw/3q84iqTSiePaBJS3kJ3HoZDEY4Zbgn+e5Ns
	V4UphZ/vvItJEgZRqeS9yawFXkYZutJZ5XHILs/5yNmXPqbf/ylMtCYP7L4YIatD
	+Dp/MOYxXIJ3d/12I4w1TLsIMF//pEAfoJIc6Lpr3wS/NaPIjG7RLYlkq312CnuU
	PE+imOPBNJkX5lBSe2XliQF0dWT9b7MX8jaPPZd6MYlW5+rWBBZlwHsmvoMFRKLR
	Qs1F5rYd4yuuVzKz+iLd7Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tr1rs6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 05:19:30 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 05:19:28 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 2/3] gstreamer1.0-plugins-bad: fix CVE-2023-40475
Date: Fri, 22 Sep 2023 12:19:10 +0000
Message-ID: <20230922121911.2430838-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20230922121911.2430838-1-archana.polampalli@windriver.com>
References: <20230922121911.2430838-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: EP3aSg8L_4rGijRa6A0GUT2YYGg6qS4r
X-Proofpoint-GUID: EP3aSg8L_4rGijRa6A0GUT2YYGg6qS4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_10,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=241
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309220104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 12:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188098

gst-plugins-bad: Integer overflow leading to heap overwrite in MXF file handling with AES3 audio

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../CVE-2023-40475.patch                      | 49 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40475.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40475.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40475.patch
new file mode 100644
index 0000000000..ab9ac7afaa
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40475.patch
@@ -0,0 +1,49 @@
+From 72742dee30cce7bf909639f82de119871566ce39 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 10 Aug 2023 15:47:03 +0300
+Subject: [PATCH] mxfdemux: Check number of channels for AES3 audio
+
+Only up to 8 channels are allowed and using a higher number would cause
+integer overflows when copying the data, and lead to out of bound
+writes.
+
+Also check that each buffer is at least 4 bytes long to avoid another
+overflow.
+
+Fixes ZDI-CAN-21661, CVE-2023-40475
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/2897
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5362>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/72742dee30cce7bf909639f82de119871566ce39]
+CVE: CVE-2023-40475
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst/mxf/mxfd10.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gst/mxf/mxfd10.c b/gst/mxf/mxfd10.c
+index 03854d9303..0ad0d2d283 100644
+--- a/gst/mxf/mxfd10.c
++++ b/gst/mxf/mxfd10.c
+@@ -101,7 +101,7 @@ mxf_d10_sound_handle_essence_element (const MXFUL * key, GstBuffer * buffer,
+   gst_buffer_map (buffer, &map, GST_MAP_READ);
+
+   /* Now transform raw AES3 into raw audio, see SMPTE 331M */
+-  if ((map.size - 4) % 32 != 0) {
++  if (map.size < 4 || (map.size - 4) % 32 != 0) {
+     gst_buffer_unmap (buffer, &map);
+     GST_ERROR ("Invalid D10 sound essence buffer size");
+     return GST_FLOW_ERROR;
+@@ -201,6 +201,7 @@ mxf_d10_create_caps (MXFMetadataTimelineTrack * track, GstTagList ** tags,
+     GstAudioFormat audio_format;
+
+     if (s->channel_count == 0 ||
++        s->channel_count > 8 ||
+         s->quantization_bits == 0 ||
+         s->audio_sampling_rate.n == 0 || s->audio_sampling_rate.d == 0) {
+       GST_ERROR ("Invalid descriptor");
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index 52acb30d74..d5f1e794cd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://CVE-2023-40474.patch \
+           file://CVE-2023-40475.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.35.5


