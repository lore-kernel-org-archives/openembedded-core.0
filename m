Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D00E71098
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 12:19:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20191.1695385172780264028
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 05:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qiQJXfnx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7629d4b6b2=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38M8dkoW020212
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 05:19:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=zXmo8F3EJH2AF9+lstV1fhhNKKhJpQYwC5in68/WJ8Y=; b=
	qiQJXfnxxUidPK7//KVhvoA+D3lJW7cD5JxdxJVMIAIXuRwEtJOGFHsq3ChdjX6g
	MvygElgJOf6KxVtxOJIB0c8k+Ap6UbCatoc19l3C2+8gsMNOKE4o2HDp9n4uGIlg
	WEyW7zTpko1VFT5/hmu6sRyWUmHd5a3YkwtTkwHuSYZd/RjFHM5elHip0vgL9bLK
	7Wpt5bfaamobQZ9Ze6FDxyv+wEEBbaaZbKUUOp50ZAOyPWPLGFZmnu9gXmZJFo55
	GblgExvmN3EwB+BJ1ukpzpdeKLpdP5jwIlWo5PdeOr1c8QXHGgqMqFLfFyWetMb/
	IuZaTq25GHUEI0J4iUrvPQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tr1rs6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 05:19:32 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 05:19:30 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 3/3] gstreamer1.0-plugins-bad: fix CVE-2023-40476
Date: Fri, 22 Sep 2023 12:19:11 +0000
Message-ID: <20230922121911.2430838-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20230922121911.2430838-1-archana.polampalli@windriver.com>
References: <20230922121911.2430838-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: jWAuM2ZdVgCMiE4390iwWJH6aPVqQpj7
X-Proofpoint-GUID: jWAuM2ZdVgCMiE4390iwWJH6aPVqQpj7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_10,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=905
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309220104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 12:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188099

gst-plugins-bad: h265parser: Fix possible overflow using max_sub_layers_minus1

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../CVE-2023-40476.patch                      | 44 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40476.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40476.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40476.patch
new file mode 100644
index 0000000000..7810e98024
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40476.patch
@@ -0,0 +1,44 @@
+From 1b51467ea640bcc73c97f3186350d72cbfba5cb4 Mon Sep 17 00:00:00 2001
+From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
+Date: Wed, 9 Aug 2023 12:49:19 -0400
+Subject: [PATCH] h265parser: Fix possible overflow using max_sub_layers_minus1
+
+This fixes a possible overflow that can be triggered by an invalid value of
+max_sub_layers_minus1 being set in the bitstream. The bitstream uses 3 bits,
+but the allowed range is 0 to 6 only.
+
+Fixes ZDI-CAN-21768, CVE-2023-40476
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/2895
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5364>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/ff91a3d8d6f7e2412c44663bf30fad5c7fdbc9d9]
+CVE: CVE-2023-40476
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+
+---
+ gst-libs/gst/codecparsers/gsth265parser.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gst-libs/gst/codecparsers/gsth265parser.c b/gst-libs/gst/codecparsers/gsth265parser.c
+index a4e7549..3db1c38 100644
+--- a/gst-libs/gst/codecparsers/gsth265parser.c
++++ b/gst-libs/gst/codecparsers/gsth265parser.c
+@@ -1670,6 +1670,7 @@ gst_h265_parse_vps (GstH265NalUnit * nalu, GstH265VPS * vps)
+
+   READ_UINT8 (&nr, vps->max_layers_minus1, 6);
+   READ_UINT8 (&nr, vps->max_sub_layers_minus1, 3);
++  CHECK_ALLOWED (vps->max_sub_layers_minus1, 0, 6);
+   READ_UINT8 (&nr, vps->temporal_id_nesting_flag, 1);
+
+   /* skip reserved_0xffff_16bits */
+@@ -1849,6 +1850,7 @@ gst_h265_parse_sps (GstH265Parser * parser, GstH265NalUnit * nalu,
+   sps->vps = vps;
+
+   READ_UINT8 (&nr, sps->max_sub_layers_minus1, 3);
++  CHECK_ALLOWED (sps->max_sub_layers_minus1, 0, 6);
+   READ_UINT8 (&nr, sps->temporal_id_nesting_flag, 1);
+
+   if (!gst_h265_parse_profile_tier_level (&sps->profile_tier_level, &nr,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index d5f1e794cd..fbaabda3f9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://CVE-2023-40474.patch \
            file://CVE-2023-40475.patch \
+           file://CVE-2023-40476.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.35.5


