Return-Path: <ygupt@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA581CC6B18
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 07:32:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10615.1775115168389258812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 00:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HcmmcIHG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: ygupt@qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327640m4009760
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Apr 2026 07:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=C6XdjLVgZWLXrxcvkVsXneDbUyXju5uO4Sf
	6Qvyr2QE=; b=HcmmcIHGOfoQvCDVCeHlL8HY6C0UDlbswUTs46Ac+VbaMVDUPya
	BgZ1+AjfgWgGh8kQ4funnXBjqKt7ZO1zGlqTBZnpXZzQQNW6U4ISaf5jPLyu6qeh
	pc8t3KcrIWPFTG7GZmrLD99jwn+rzCp3ovollfhyPNIxf6cGXefmnGKfDNBCXe+L
	JM9wzSTnUv+YA9nwYFFEMgOWbid81IWAb+2pj4QNie8c1BnMRm+7UliCMPBcyWf2
	i10yVsV8I58Yi5ieo3i2JsIcQZJQiyig+/gUtQgV0Fv1q7MJZq4MbStH1CZYSUFL
	8nwf6njC/EVOJO5lat+noZUR+vMNN6nW6XQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e02ruk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:32:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6327WiYA001175;
	Thu, 2 Apr 2026 07:32:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4d6qj2vknf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:32:44 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6327WihB001091
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Apr 2026 07:32:44 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ygupt-hyd.qualcomm.com [10.213.99.200])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6327WiQ2001023
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 07:32:44 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4729751)
	id 731B95E5; Thu,  2 Apr 2026 13:02:43 +0530 (+0530)
From: Yash Gupta <ygupt@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Yash Gupta <ygupt@qti.qualcomm.com>
Subject: [PATCH] weston-init: add repaint-window=10 to [core] config
Date: Thu,  2 Apr 2026 13:02:43 +0530
Message-Id: <20260402073243.672322-1-ygupt@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce1b9f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=2SeqjlqqyTdYJxvbCdsA:9
X-Proofpoint-ORIG-GUID: gng8ARejfKWyh65Yf8t_j1a406BvaQYU
X-Proofpoint-GUID: gng8ARejfKWyh65Yf8t_j1a406BvaQYU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA2NSBTYWx0ZWRfX0KSIvrSX6CPR
 pYOVemrMULeqGzLVWqC92NN7Ncck31vVrN5BuwqUgt/+eTK52PQfdGFGyfCqPoDnQ9QllQxYS1Y
 K6Yk6Nlosx8IIg1fw/VWNelF4foic8KWj++VAx9olrh8Oh1N0iOTGbYkdv7T4+HKuATi95RMu/7
 waTt2Ap/a1ZlLU+D+pKI9rEe0ooZlJTHymTvMlzCqxy0P7cENhG1zwPRmYem6CIWhbvkT/zka7u
 V1UPoKgt1csorI12H+FJedz5fxlKJR+CrsVgTGL5cLLIY8kFvAoyPZYx3jAH1AyIj6j+GA9fHOQ
 0cnP/V9q/Ldh2fh6FAlL51iJzs5XTn0GM7nYL9vOpLHh5aOeSZW1Qtvh7rEz2kxvhKW9hJF+eYt
 edmigm7MEpASg54LNXj9lypnlef4MaZkltDV5DfWmS0xGPOmLsqwweCqU1/CNMfWe8MrHpCN0nZ
 2wyq3Lc8hA8OaoQCmFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234500

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


