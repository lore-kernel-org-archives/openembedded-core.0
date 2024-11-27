Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39001D609C1
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 09:24:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.67970.1732699484264373230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 01:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10610f3413=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR4WRSD011898
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 01:24:44 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433b79c49x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 01:24:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 27 Nov 2024 01:24:43 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 27 Nov 2024 01:24:41 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 2/5] ffmpeg: fix CVE-2023-47342
Date: Wed, 27 Nov 2024 09:24:35 +0000
Message-ID: <20241127092438.760275-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241127092438.760275-1-archana.polampalli@windriver.com>
References: <20241127092438.760275-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=atbgCjZV c=1 sm=1 tr=0 ts=6746e55b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=oTww3epMrcYTMVu1rhoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9dMBwbBHP9AUB7aEbzRzUTGrMSIXjsyK
X-Proofpoint-ORIG-GUID: 9dMBwbBHP9AUB7aEbzRzUTGrMSIXjsyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-27_04,2024-11-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411270077
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AR4WRSD011898
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 09:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207919

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-47342.patch        | 39 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-47342.=
patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-47342.patch b=
/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-47342.patch
new file mode 100644
index 0000000000..39842229c1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-47342.patch
@@ -0,0 +1,39 @@
+From e4d5ac8d7d2a08658b3db7dd821246fe6b35381f Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 19 Oct 2023 22:07:36 +0200
+Subject: [PATCH] avformat/rtsp: Use rtsp_st->stream_index
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: out of array access
+Fixes: rtpdec_h264.c149/poc
+
+Found-by: Hardik Shah of Vehere
+Reviewed-by: Martin Storsj=C3=B6 <martin@martin.st>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-47342
+
+Upstream-Status: Backport [https://github.com/ffmpeg/FFmpeg/commit/e4d5a=
c8d7d2a08658b3db7dd821246fe6b35381f]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/rtsp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/rtsp.c b/libavformat/rtsp.c
+index 70c1894..d435bd0 100644
+--- a/libavformat/rtsp.c
++++ b/libavformat/rtsp.c
+@@ -406,7 +406,7 @@ static void parse_fmtp(AVFormatContext *s, RTSPState=
 *rt,
+         if (rtsp_st->sdp_payload_type =3D=3D payload_type &&
+             rtsp_st->dynamic_handler &&
+             rtsp_st->dynamic_handler->parse_sdp_a_line) {
+-            rtsp_st->dynamic_handler->parse_sdp_a_line(s, i,
++            rtsp_st->dynamic_handler->parse_sdp_a_line(s, rtsp_st->stre=
am_index,
+                 rtsp_st->dynamic_protocol_context, line);
+         }
+     }
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index b8bd77972b..d233ced662 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -36,6 +36,7 @@ SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.=
xz \
            file://CVE-2024-31578.patch \
            file://CVE-2023-51794.patch \
            file://CVE-2023-51798.patch \
+           file://CVE-2023-47342.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3=
fda562c21a93007b"
--=20
2.40.0


