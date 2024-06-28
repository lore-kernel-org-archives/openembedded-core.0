Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7080AC3064D
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 13:57:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17717.1719583060164336340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jun 2024 06:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7909a800d7=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SBtJYe011091
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 06:57:39 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywsvywy2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 06:57:39 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 06:57:37 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] gstreamer1.0-plugins-base: fix CVE-2024-4453
Date: Fri, 28 Jun 2024 13:57:21 +0000
Message-ID: <20240628135721.2003916-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: mKPPzhR_svcWvnnsA_9lHVFL3TAzZL24
X-Proofpoint-ORIG-GUID: mKPPzhR_svcWvnnsA_9lHVFL3TAzZL24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_09,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406280104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 13:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201222

From: Archana Polampalli <archana.polampalli@windriver.com>

GStreamer EXIF Metadata Parsing Integer Overflow Remote Code Execution Vulnerability.
This vulnerability allows remote attackers to execute arbitrary code on affected
installations of GStreamer. Interaction with this library is required to exploit this
vulnerability but attack vectors may vary depending on the implementation. The specific
flaw exists within the parsing of EXIF metadata. The issue results from the lack of
proper validation of user-supplied data, which can result in an integer overflow before
allocating a buffer. An attacker can leverage this vulnerability to execute code in the
context of the current process. . Was ZDI-CAN-23896.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../CVE-2024-4453.patch                       | 65 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.20.7.bb       |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-4453.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-4453.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-4453.patch
new file mode 100644
index 0000000000..cdc8ab083d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-4453.patch
@@ -0,0 +1,65 @@
+From e33578a3c2b85a68962003bd053abda9409e73a2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 25 Apr 2024 15:21:20 +0300
+Subject: [PATCH] exiftag: Prevent integer overflows and out of bounds reads
+ when handling undefined tags
+
+Fixes ZDI-CAN-23896
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3483
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/6768>
+
+CVE: CVE-2024-4453
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/e33578a3c2b85a68]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst-libs/gst/tag/gstexiftag.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/gst-libs/gst/tag/gstexiftag.c b/gst-libs/gst/tag/gstexiftag.c
+index ed41ccf..3b9a2be 100644
+--- a/gst-libs/gst/tag/gstexiftag.c
++++ b/gst-libs/gst/tag/gstexiftag.c
+@@ -1383,6 +1383,7 @@ parse_exif_undefined_tag (GstExifReader * reader, const GstExifTagMatch * tag,
+
+   if (count > 4) {
+     GstMapInfo info;
++    gsize alloc_size;
+
+     if (offset < reader->base_offset) {
+       GST_WARNING ("Offset is smaller (%u) than base offset (%u)", offset,
+@@ -1404,14 +1405,28 @@ parse_exif_undefined_tag (GstExifReader * reader, const GstExifTagMatch * tag,
+       return;
+     }
+
++    if (info.size - real_offset < count) {
++      GST_WARNING ("Invalid size %u for buffer of size %" G_GSIZE_FORMAT
++          ", not adding tag %s", count, info.size, tag->gst_tag);
++      gst_buffer_unmap (reader->buffer, &info);
++      return;
++    }
++
++    if (!g_size_checked_add (&alloc_size, count, 1)) {
++      GST_WARNING ("Invalid size %u for buffer of size %" G_GSIZE_FORMAT
++          ", not adding tag %s", real_offset, info.size, tag->gst_tag);
++      gst_buffer_unmap (reader->buffer, &info);
++      return;
++    }
++
+     /* +1 because it could be a string without the \0 */
+-    data = malloc (sizeof (guint8) * count + 1);
++    data = malloc (alloc_size);
+     memcpy (data, info.data + real_offset, count);
+     data[count] = 0;
+
+     gst_buffer_unmap (reader->buffer, &info);
+   } else {
+-    data = malloc (sizeof (guint8) * count + 1);
++    data = malloc (count + 1);
+     memcpy (data, (guint8 *) offset_as_data, count);
+     data[count] = 0;
+   }
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
index 8dfa70aea3..368698b58b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch \
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
+           file://CVE-2024-4453.patch \
            "
 SRC_URI[sha256sum] = "fde6696a91875095d82c1012b5777c28ba926047ffce08508e12c1d2c66f0057"
 
-- 
2.40.0


