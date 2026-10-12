Return-Path: <tdarote@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF90ACA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:32:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10387.1791801162281057876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=V/ysfd2C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: tdarote@qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KBFH1779284
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dwSx0Y0Uyxh7UX/hZ9X58VIEWbxabD7xgAX
	EYNBu/EI=; b=V/ysfd2C4Q7qdrmjSUEvsNjH894NCQQFxnCn2DNVVWRwE+MW207
	sj7Op2pcpqbQk3jPwWAfk8Fvs4SVxfpzUy9uO6+nBv1dd4e6r7y3xs20xEaGfW+i
	17Il2K5kxYciuQ6hiFn+SuKRusXGp6lAeh5nu6bSMGJDeFZpwUbmrIpVWieM74EN
	q3hfInuTkAZKUfvQ+t2Q+9IZ9IaGhuaRJaxDAGmm7K8MqWAvaXIvuQtVUFu8TX7h
	AyWJQdAHeFu8u7czK/3n3LUjmcEjLUpNla+Gx7hSy/6DRRwWxH8csazKbTT9KESS
	QkxsETRxuA/PLtACw2st2Y40+3BhW8jCwRQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq0rga-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:32:41 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69CAND1A3934210
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:23:13 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-tdarote-hyd.qualcomm.com [10.147.247.89])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 69CANCAF3934202
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 10:23:12 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 4146169)
	id 9862521524; Mon, 12 Oct 2026 15:53:11 +0530 (+0530)
From: Tushar Darote <tdarote@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Shantanu Majumdar <shanmaju@qti.qualcomm.com>,
        Tushar Darote <tdarote@qti.qualcomm.com>
Subject: [WRYNOSE PATCH v1] gstreamer1.0-plugins-bad: use gtk+3 dependency name
Date: Mon, 12 Oct 2026 15:53:08 +0530
Message-ID: <20261012102308.2640411-1-tdarote@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accb749 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Cv24dpK0CmeL2Y3-DUMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MSBTYWx0ZWRfXxayKiWm8A98c
 ueSKKMu02AqfQVrxCYtLHYXOH8Sdm2uqiRgUPSa+/sZ0AmhbV1lH1yFauWO6A/neCJE6oXyEiAJ
 u5xW2WvuUzXhwwU5VjyTkDt4/Wu1oX0=
X-Proofpoint-GUID: X5U8-1bqPC0mbDOeBte52wbm8el-Wc9Q
X-Proofpoint-ORIG-GUID: X5U8-1bqPC0mbDOeBte52wbm8el-Wc9Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MSBTYWx0ZWRfX2JY3HZztQK+G
 04J8T2wQFxUXJ8Cf8OYXD2oqQ0EiGMbNfiuHDlbthh+H4VurGYZ148u3q0c4oYJVOlUMephog+p
 N6M7UNy26nqyI32K6fHkFBbvvdU9eO4136BMeTuDm7i1bvuacHLok9uA6EPDPYwfXF3CCKy1EOs
 7m9Hbq/yQrfUZgcJQu20F58ExK7tdU+hJ2c1A6w1DSwdSVJh9besfQWn9Cj5pBfgvPP+1uBJvx1
 cGSBquJTbCs2uKGUm8uS1hYSjxjoMoGPI7PNFnB8SSstW7WTuqKZelcXaSBrrPAOoP4WB+xnO5i
 hfLx5IFggvW8VfYXKjkbmRNzFTym7Wk+eiV+48fLtmWtfz4ZhOIOgxygkhpecPdDqC+SLLL3mMB
 qFxIlHDULYf0bJiPjYmnDNSUtyHJd1l8Gt3XPV9B07QdhSQE9WYezisa/6EXX13Gif0hxaLiS2R
 /VMNuecbW5GnNrwRU+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247625

From: Shantanu Majumdar <shanmaju@qti.qualcomm.com>

Replace the PACKAGECONFIG gtk3 dependency from gtk3+ to
gtk+3 to match the recipe name used in OE-Core.

Signed-off-by: Shantanu Majumdar <shanmaju@qti.qualcomm.com>
Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
index 7964d5b6de..de143b26a0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
@@ -53,7 +53,7 @@ PACKAGECONFIG[faac]            = "-Dfaac=enabled,-Dfaac=disabled,faac"
 PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
 PACKAGECONFIG[fdkaac]          = "-Dfdkaac=enabled,-Dfdkaac=disabled,fdk-aac"
 PACKAGECONFIG[fluidsynth]      = "-Dfluidsynth=enabled,-Dfluidsynth=disabled,fluidsynth"
-PACKAGECONFIG[gtk3]            = "-Dgtk3=enabled,-Dgtk3=disabled,gtk3+"
+PACKAGECONFIG[gtk3]            = "-Dgtk3=enabled,-Dgtk3=disabled,gtk+3"
 PACKAGECONFIG[hls]             = "-Dhls=enabled,-Dhls=disabled,"
 # Pick atleast one crypto backend below when enabling hls
 PACKAGECONFIG[nettle]          = "-Dhls-crypto=nettle,,nettle"
-- 
2.43.0


