Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA16CE79A8
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 12:19:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20187.1695385169718785729
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 05:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QSVtCV38;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7629d4b6b2=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38MApKDM018346
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 05:19:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=9XlyX
	X8LVn+yZ5ROBXE4NuQY6sXukJAHNYvsP0a8SdA=; b=QSVtCV38Ity7L7lrwzuDe
	T/1IrraGu/YkxKrFWRBTVA+BDsi/EGjSiR+oWVFV0QIuA35UOe4P3C73bkvJvV9L
	o9etdoMwwQ/c0mT+m4mWYXZScBe0zfQK1SbGPslwZBoh3Luw1Loa6hbQJamBKtwR
	BtfsI2exudwuqL7kXJ+EzWrRe9/Js7UCOhjrYEeybO127oHlJz3HQDaOu6xXGSWs
	Ni1jFfQQdopjC65DdQmhklJ2y/2kWn3YbzkO/hT2zhYg5gl5We/3420IZx8rro55
	RKxHUArCKaNhISuqJ1PMff/05Qp5L6lv7DClNFKmFuKCdpEKlPkzUMFu9C29NQGC
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tr5rsax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 05:19:29 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 05:19:26 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/3] gstreamer1.0-plugins-bad: fix CVE-2023-40474
Date: Fri, 22 Sep 2023 12:19:09 +0000
Message-ID: <20230922121911.2430838-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: uLaeAEEYeTRSB2fbHEkHKr02V8yaSR6w
X-Proofpoint-GUID: uLaeAEEYeTRSB2fbHEkHKr02V8yaSR6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_10,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2 impostorscore=0 adultscore=0
 spamscore=2 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=160
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=2
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2309180000
 definitions=main-2309220104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 12:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188097

gst-plugins-bad: Heap-based buffer overflow in the MXF file demuxer when handling
malformed files with uncompressed video in GStreamer versions before 1.22.6

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../CVE-2023-40474.patch                      | 118 ++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40474.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40474.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40474.patch
new file mode 100644
index 0000000000..dd5886863d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40474.patch
@@ -0,0 +1,118 @@
+From ce17e968e4cf900d28ca5b46f6e095febc42b4f0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 10 Aug 2023 15:45:01 +0300
+Subject: [PATCH] mxfdemux: Fix integer overflow causing out of bounds writes
+ when handling invalid uncompressed video
+
+Check ahead of time when parsing the track information whether
+width, height and bpp are valid and usable without overflows.
+
+Fixes ZDI-CAN-21660, CVE-2023-40474
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/2896
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5362>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/ce17e968e4cf900d28ca5b46f6e095febc42b4f0]
+CVE: CVE-2023-40474
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst/mxf/mxfup.c | 51 +++++++++++++++++----
+ 1 file changed, 43 insertions(+), 8 deletions(-)
+
+diff --git a/gst/mxf/mxfup.c b/gst/mxf/mxfup.c
+index d72ed22cb7..0c0178c1c9 100644
+--- a/gst/mxf/mxfup.c
++++ b/gst/mxf/mxfup.c
+@@ -118,6 +118,8 @@ mxf_up_handle_essence_element (const MXFUL * key, GstBuffer * buffer,
+     gpointer mapping_data, GstBuffer ** outbuf)
+ {
+   MXFUPMappingData *data = mapping_data;
++  gsize expected_in_stride = 0, out_stride = 0;
++  gsize expected_in_size = 0, out_size = 0;
+
+   /* SMPTE 384M 7.1 */
+   if (key->u[12] != 0x15 || (key->u[14] != 0x01 && key->u[14] != 0x02
+@@ -146,22 +148,25 @@ mxf_up_handle_essence_element (const MXFUL * key, GstBuffer * buffer,
+     }
+   }
+
+-  if (gst_buffer_get_size (buffer) != data->bpp * data->width * data->height) {
++  // Checked for overflows when parsing the descriptor
++  expected_in_stride = data->bpp * data->width;
++  out_stride = GST_ROUND_UP_4 (expected_in_stride);
++  expected_in_size = expected_in_stride * data->height;
++  out_size = out_stride * data->height;
++
++  if (gst_buffer_get_size (buffer) != expected_in_size) {
+     GST_ERROR ("Invalid buffer size");
+     gst_buffer_unref (buffer);
+     return GST_FLOW_ERROR;
+   }
+
+-  if (data->bpp != 4
+-      || GST_ROUND_UP_4 (data->width * data->bpp) != data->width * data->bpp) {
++  if (data->bpp != 4 || out_stride != expected_in_stride) {
+     guint y;
+     GstBuffer *ret;
+     GstMapInfo inmap, outmap;
+     guint8 *indata, *outdata;
+
+-    ret =
+-        gst_buffer_new_and_alloc (GST_ROUND_UP_4 (data->width * data->bpp) *
+-        data->height);
++    ret = gst_buffer_new_and_alloc (out_size);
+     gst_buffer_map (buffer, &inmap, GST_MAP_READ);
+     gst_buffer_map (ret, &outmap, GST_MAP_WRITE);
+     indata = inmap.data;
+@@ -169,8 +174,8 @@ mxf_up_handle_essence_element (const MXFUL * key, GstBuffer * buffer,
+
+     for (y = 0; y < data->height; y++) {
+       memcpy (outdata, indata, data->width * data->bpp);
+-      outdata += GST_ROUND_UP_4 (data->width * data->bpp);
+-      indata += data->width * data->bpp;
++      outdata += out_stride;
++      indata += expected_in_stride;
+     }
+
+     gst_buffer_unmap (buffer, &inmap);
+@@ -378,6 +383,36 @@ mxf_up_create_caps (MXFMetadataTimelineTrack * track, GstTagList ** tags,
+     return NULL;
+   }
+
++  if (caps) {
++    MXFUPMappingData *data = *mapping_data;
++    gsize expected_in_stride = 0, out_stride = 0;
++    gsize expected_in_size = 0, out_size = 0;
++
++    // Do some checking of the parameters to see if they're valid and
++    // we can actually work with them.
++    if (data->image_start_offset > data->image_end_offset) {
++      GST_WARNING ("Invalid image start/end offset");
++      g_free (data);
++      *mapping_data = NULL;
++      gst_clear_caps (&caps);
++
++      return NULL;
++    }
++
++    if (!g_size_checked_mul (&expected_in_stride, data->bpp, data->width) ||
++        (out_stride = GST_ROUND_UP_4 (expected_in_stride)) < expected_in_stride
++        || !g_size_checked_mul (&expected_in_size, expected_in_stride,
++            data->height)
++        || !g_size_checked_mul (&out_size, out_stride, data->height)) {
++      GST_ERROR ("Invalid resolution or bit depth");
++      g_free (data);
++      *mapping_data = NULL;
++      gst_clear_caps (&caps);
++
++      return NULL;
++    }
++  }
++
+   return caps;
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index 86b5301d8e..52acb30d74 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
+           file://CVE-2023-40474.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.35.5


