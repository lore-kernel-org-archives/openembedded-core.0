Return-Path: <yash.gupta@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF98F34C5B
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 14:31:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.273336.1776090678490546898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 07:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZWeozBl6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: ygupt@qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DEJNTK3539430
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 14:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/nxj6T2xcb0GLoxOcIYK8kbltzp9zQ4r8cW
	vTmDxuUY=; b=ZWeozBl66mXHhUkZsm1yyriBWOvMqD3YKWmNEYb8gD4c9M69G4f
	tu96zzCRR3ZjNb2N1vvvarhzUzOrctAeQYvBsDosjuiUzpUPXtdB/LmxMPI/FWzB
	4hgM8N1GNwFzxx74JNGcmDuQVs6GGhHk/SkVJm8IZnJ0IbkcVThRBYoUXpAi7LMv
	rlEn3ILKfZ6/OJ5hNRm2QPACJtXeb1D/64TsLgVzxtYw7Jzr87Xyva7FMbVy2RwU
	oIN0gkFHszg8zdMvFd8+/zE+RK7AbYctcroFac18JUbcGppXGZ85ta0vqoWeLKbU
	+Y6MaScLFGN3kwZFYqv2JBc5CdOWRQL7XYg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh258r0yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 14:31:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63DEVEU2026554;
	Mon, 13 Apr 2026 14:31:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4dg5e3wv8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 14:31:14 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63DEVD8x026549
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 14:31:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ygupt-hyd.qualcomm.com [10.213.99.200])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 63DEVDmA026548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 14:31:13 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4729751)
	id 062435FF; Mon, 13 Apr 2026 20:01:13 +0530 (+0530)
From: Yash Gupta <yash.gupta@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: yash.gupta@oss.qualcomm.com, devanshi@qti.qualcomm.com,
        ygupt@qti.qualcomm.com
Subject: [PATCH] weston-init: set require-outputs=none to allow startup without connected display
Date: Mon, 13 Apr 2026 20:01:12 +0530
Message-Id: <20260413143112.126439-1-yash.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 9rbimX-8IRexqjzaOZb6bZ8iLJ5-oioF
X-Authority-Analysis: v=2.4 cv=Vo4Txe2n c=1 sm=1 tr=0 ts=69dcfe35 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=-hqWLWbiqgXCQPGZnwgA:9
X-Proofpoint-ORIG-GUID: 9rbimX-8IRexqjzaOZb6bZ8iLJ5-oioF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE0MyBTYWx0ZWRfX9j7zp/jt1Fd/
 CJPQPqDF8THl8sdn2iTTb4cfIHJ1ZoVtuxnRva9aAgwDJ3AdVxtWJI1LzDIl6Mz0cQLFgKuJvyd
 3EvZjDeEL/aIOE/mrBuBo2R2R1fcBCkQ3GWjk2Wa/IJc5o5E5t8cwugSdOUxlE/Rm3FrbqqsdA8
 JOYV/6Gy+PCid4d31Rgu6IloAVa58guqKFTp5lipug42TiNy4/VqfZ19OZ9d+mDOPNpxZVnpwap
 t+ZxdqFzyElcE0Z4ZJgOPRpyJ9W6QSEh3l8h6W0ZTM43+3V+q6tib9y+MBTJSQAGXu2YIBebu7C
 fNMsaQy3aPdCdgD5jZoL7H4KT3/xtGLsL7UDhuU6h/Sx18E3fQipdGW6WbB6pwak4wWD91zjw/y
 f7XfNjL77svlLrk9n/BQufl8A4oRD6iVNwO6Z1zTgVP9LeSLEIzCubw0WFCF6GKLXVAT/PQ6dpq
 VU/L5MUI9HqwnSZMLvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 14:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235114

By default, Weston exits at startup if no output connector is reported
as connected by the DRM subsystem. On platforms where displays are
connected after boot via HPD (Hot Plug Detect), this causes the weston
service to be killed during early boot and remain down until manually
restarted.

Setting require-outputs=none in the [core] section instructs Weston to
start and remain running even when no connector is active at boot time.
When a display is subsequently hotplugged and HPD is asserted, Weston
automatically picks up the new connector and brings up the output without
requiring a service restart.

Signed-off-by: Yash Gupta <yash.gupta@oss.qualcomm.com>
---
 meta/recipes-graphics/wayland/weston-init/weston.ini | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
index c2f9d19c01..41360bdbbc 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
@@ -6,6 +6,7 @@
 #gbm-format=xrgb2101010
 require-input=false
 repaint-window=10
+require-outputs=none
 
 #[shell]
 #background-image=/usr/share/backgrounds/gnome/Aqua.jpg
-- 
2.34.1


