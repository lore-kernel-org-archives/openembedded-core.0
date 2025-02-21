Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05E1C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 06:03:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17152.1740117793012513237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 22:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4147565e18=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L55Kd9019003
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:03:12 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kkb78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:03:11 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 20 Feb 2025 22:03:10 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 20 Feb 2025 22:03:09 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/5] gstreamer1.0-rtsp-server: fix CVE-2024-44331
Date: Fri, 21 Feb 2025 06:03:03 +0000
Message-ID: <20250221060307.671892-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: LnlDKpLxGC0RO6IINcy7fAsZZRz9rGZ3
X-Proofpoint-ORIG-GUID: LnlDKpLxGC0RO6IINcy7fAsZZRz9rGZ3
X-Authority-Analysis: v=2.4 cv=BvtnwZX5 c=1 sm=1 tr=0 ts=67b81720 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=Gv6LgfnmAAAA:8 a=F9SKuhKrtmCxqDX-GtwA:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=IPA2cKvQ-hEu6qGqc7iX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=1
 adultscore=0 priorityscore=1501 mlxlogscore=349 bulkscore=1 clxscore=1015
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211788

From: Archana Polampalli <archana.polampalli@windriver.com>

Incorrect Access Control in GStreamer RTSP server 1.25.0 in gst-rtsp-server/rtsp-media.c
allows remote attackers to cause a denial of service via a series of specially crafted
hexstream requests.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../CVE-2024-44331.patch                      | 44 +++++++++++++++++++
 .../gstreamer1.0-rtsp-server_1.20.7.bb        |  4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch
new file mode 100644
index 0000000000..e78fef7b93
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch
@@ -0,0 +1,44 @@
+From aa3e97d67c05d4648ea58c7ff7675e24a81ca72b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 24 Oct 2024 20:12:55 +0300
+Subject: [PATCH] rtsp-server: Remove pointless assertions that can happen if
+ client provides invalid rates
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3731
+Fixes CVE-2024-44331
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7739>
+
+CVE: CVE-2024-44331
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/aa3e97d67c05d4648ea58c7ff7675e24a81ca72b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst/rtsp-server/rtsp-media.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/gst/rtsp-server/rtsp-media.c b/gst/rtsp-server/rtsp-media.c
+index 88bf7a7..e482b44 100644
+--- a/gst/rtsp-server/rtsp-media.c
++++ b/gst/rtsp-server/rtsp-media.c
+@@ -2737,15 +2737,13 @@ gst_rtsp_media_get_rates (GstRTSPMedia * media, gdouble * rate,
+           first_stream = FALSE;
+         } else {
+           if (save_rate != *rate || save_applied_rate != *applied_rate) {
+-            /* diffrent rate or applied_rate, weird */
+-            g_assert (FALSE);
++            /* different rate or applied_rate, weird */
+             result = FALSE;
+             break;
+           }
+         }
+       } else {
+-        /* complete stream withot rate and applied_rate, weird */
+-        g_assert (FALSE);
++        /* complete stream without rate and applied_rate, weird */
+         result = FALSE;
+         break;
+       }
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb
index 2901be69d2..a7d17e3b1e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb
@@ -8,7 +8,9 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
+           file://CVE-2024-44331.patch \
+          "
 
 SRC_URI[sha256sum] = "2c8f46aa9df2245e5b39a2082be8e9d3edc0f61bc34f667803d7a21da1b51987"
 
-- 
2.40.0


