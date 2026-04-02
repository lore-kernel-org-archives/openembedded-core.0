Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E20ECC6B1B
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 07:43:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10310.1775113405285708314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 00:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bh39GZgt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: ygupt@qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M46Ak1964806
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Apr 2026 06:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=C6XdjLVgZWLXrxcvkVsXneDbUyXju5uO4Sf
	6Qvyr2QE=; b=bh39GZgtRD9/9iPtkIyIzToj0fx3RJkx+z4ct0ChBNX8osBvMHl
	580hKmc+RQoehbWaUpvbJMkINbJpyPHlt/gI3xtnkAwMdkE5GmE7ubooohNrVD0c
	mwkdi+6c9GjA/y5YbsSHnB/8Ez09x+uqp/THEgvf+fIOp9KDhjNLbA/64YOCoV2P
	amqumyK973JE9JDRBovr7FgW8NM3uWeDixUYs6GStSs/osroH9TPPbCMG2fAu3/5
	X7VUYKT4/BATfFi3c/gwCHY3fyuLgb8IHN/Kae2Iq4kTKONkz1T1pqrXVUg/VeIQ
	he/W7owvF1hyWxgxBYyEYhQtl/ssKPr4vUw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h1hvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 06:26:39 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6326QZwo023862;
	Thu, 2 Apr 2026 06:26:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4d6qj2v5t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 06:26:35 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6326QZwi023855
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Apr 2026 06:26:35 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ygupt-hyd.qualcomm.com [10.213.99.200])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6326QZ4K023854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 06:26:35 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4729751)
	id DCBD05E5; Thu,  2 Apr 2026 11:56:34 +0530 (+0530)
From: Yash Gupta <ygupt@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Yash Gupta <ygupt@qti.qualcomm.com>
Subject: [PATCH] weston-init: add repaint-window=10 to [core] config
Date: Thu,  2 Apr 2026 11:56:34 +0530
Message-Id: <20260402062634.296082-1-ygupt@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce0c1f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=2SeqjlqqyTdYJxvbCdsA:9
X-Proofpoint-ORIG-GUID: 7u4g1CsuZnWhv60JvVsexEOKxPi_tuhF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1NSBTYWx0ZWRfX44eIm8gN+59F
 Ljulmd0siXJqO6XD27TrQv4S4WHn1z3XN4ay3eiobra+s44FJxyQQhcuFZ4QgWLON00A75JtcVx
 uUtq0pZiMOBLakkfKfMGPvk5+J8rO+JtUuRe3Ej+jOwwWrwEbZ2fZVZG5GNjAMxiBNHLDHmeyg/
 D1lE44UUVzk/IhcUCTraYzk5vHPCuIrP6kw+Ud91bM3VOuYKQVVdUpTD+ALpBFCh3rCL5Uo43gU
 MN5Byg41aVO9OHvdewf9oEbaiOUiJ4Pq1ganAqgDSHA8/2+wD0xvH97Twcy5cPDeFf2RR8BOx4w
 3hGz5ZseDCcTvbTsyCnpDMKgWWe+RYwsmCzbpPQprVdFe1bOmVEPinPLHwTFDy0E/qU72DKtvy4
 GH2aa2fRb2S+BOQmbrRB90pt0bWLIoIKvfFYg9wHmjdUVuRK2H684mRGbUsW/IpxBLoL04yjPjK
 u68z2OLrEyiRBKtN2DQ==
X-Proofpoint-GUID: 7u4g1CsuZnWhv60JvVsexEOKxPi_tuhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020055
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234502

Weston's default repaint-window is 7ms. At 60 fps the vsync interval is
~16ms. Under load (multi-surface composition or 4K fullscreen
weston-simple-egl), the compositor cannot complete repaints within this
window, causing up to 50% FPS drops.

Changing repaint-window to 10ms gives the compositor sufficient time to
complete repaints before vblank while retaining a 6ms buffer acquisition
window, improving frame delivery consistency without introducing additional
frame latency.

Signed-off-by: Yash Gupta <ygupt@qti.qualcomm.com>
---
 meta/recipes-graphics/wayland/weston-init/weston.ini | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
index 0ec70c3ef3..c2f9d19c01 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
@@ -5,6 +5,7 @@
 #shell=desktop-shell.so
 #gbm-format=xrgb2101010
 require-input=false
+repaint-window=10
 
 #[shell]
 #background-image=/usr/share/backgrounds/gnome/Aqua.jpg
-- 
2.34.1


