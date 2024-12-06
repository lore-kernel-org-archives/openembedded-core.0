Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AB6E7717D
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 13:12:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.36298.1733490716440802753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 05:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=207081cc16=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6BljWY008553
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Dec 2024 05:11:56 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43833q71nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 05:11:55 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 6 Dec 2024 05:11:55 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 6 Dec 2024 05:11:53 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 3/5] ffmpeg: fix CVE-2023-50007
Date: Fri, 6 Dec 2024 13:11:46 +0000
Message-ID: <20241206131148.1870788-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241206131148.1870788-1-archana.polampalli@windriver.com>
References: <20241206131148.1870788-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: o0bkaqOJ3--3lgT63ndxAYepqiTpQtIi
X-Authority-Analysis: v=2.4 cv=bqq2BFai c=1 sm=1 tr=0 ts=6752f81b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=l_vATpeVyQPYvd8r_7cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: o0bkaqOJ3--3lgT63ndxAYepqiTpQtIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_09,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412060099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 13:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208424

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.n6.1-3-g466799d4f5 allows a local
attacker to execute arbitrary code via theav_samples_set_silence function
in the libavutil/samplefmt.c:260:9 component.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-50007.patch        | 78 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
new file mode 100644
index 0000000000..d86e39707e
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
@@ -0,0 +1,78 @@
+From b1942734c7cbcdc9034034373abcc9ecb9644c47 Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Mon, 27 Nov 2023 11:45:34 +0100
+Subject: [PATCH 2/3] avfilter/af_afwtdn: fix crash with EOF handling
+
+CVE: CVE-2023-50007
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/b1942734c7cbcdc9034034373abcc9ecb9644c47]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/af_afwtdn.c | 34 +++++++++++++++++++---------------
+ 1 file changed, 19 insertions(+), 15 deletions(-)
+
+diff --git a/libavfilter/af_afwtdn.c b/libavfilter/af_afwtdn.c
+index 0fcfa77..63b7f5f 100644
+--- a/libavfilter/af_afwtdn.c
++++ b/libavfilter/af_afwtdn.c
+@@ -408,6 +408,7 @@ typedef struct AudioFWTDNContext {
+
+     uint64_t sn;
+     int64_t eof_pts;
++    int eof;
+
+     int wavelet_type;
+     int channels;
+@@ -1069,7 +1070,7 @@ static int filter_frame(AVFilterLink *inlink, AVFrame *in)
+         s->drop_samples = 0;
+     } else {
+         if (s->padd_samples < 0 && eof) {
+-            out->nb_samples += s->padd_samples;
++            out->nb_samples = FFMAX(0, out->nb_samples + s->padd_samples);
+             s->padd_samples = 0;
+         }
+         if (!eof)
+@@ -1208,23 +1209,26 @@ static int activate(AVFilterContext *ctx)
+
+     FF_FILTER_FORWARD_STATUS_BACK(outlink, inlink);
+
+-    ret = ff_inlink_consume_samples(inlink, s->nb_samples, s->nb_samples, &in);
+-    if (ret < 0)
+-        return ret;
+-    if (ret > 0)
+-        return filter_frame(inlink, in);
++    if (!s->eof) {
++        ret = ff_inlink_consume_samples(inlink, s->nb_samples, s->nb_samples, &in);
++        if (ret < 0)
++            return ret;
++        if (ret > 0)
++            return filter_frame(inlink, in);
++    }
+
+     if (ff_inlink_acknowledge_status(inlink, &status, &pts)) {
+-        if (status == AVERROR_EOF) {
+-            while (s->padd_samples != 0) {
+-                ret = filter_frame(inlink, NULL);
+-                if (ret < 0)
+-                    return ret;
+-            }
+-            ff_outlink_set_status(outlink, status, pts);
+-            return ret;
+-        }
++        if (status == AVERROR_EOF)
++            s->eof = 1;
+     }
++
++    if (s->eof && s->padd_samples != 0) {
++        return filter_frame(inlink, NULL);
++    } else if (s->eof) {
++        ff_outlink_set_status(outlink, AVERROR_EOF, s->eof_pts);
++        return 0;
++    }
++
+     FF_FILTER_FORWARD_WANTED(outlink, inlink);
+
+     return FFERROR_NOT_READY;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 9903b86006..cac122f8b9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -34,6 +34,7 @@ SRC_URI = " \
     file://CVE-2024-32230.patch \
     file://CVE-2023-49501.patch \
     file://CVE-2024-28661.patch \
+    file://CVE-2023-50007.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.40.0


