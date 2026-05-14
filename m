Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79384CD4851
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 09:40:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6948.1778751480658736840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 02:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SW1cL2a8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=959482834f=jianpeng.chang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E8iZcZ3263352
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 09:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=7G7t966Wz
	4TWrXzWx6zRqKlalAC5X/1GkQiffNFgwCc=; b=SW1cL2a8yZNQOjf4/3D8co+5f
	rWY/vcqLv4zn+AP+TDRncgL2L2y+8BmdHkeA5/ARR9sVMir/E17xlx9eq3Dr33za
	ifGwte4Yrf0KeB2ruFEBf3caNmFEAlAC6v0NHwe8OULTORr8p+ZcOJsfuMWn3Pq9
	5zYnd5sb1Ow75+mLouMmN6wSWmlN2LB8dfWQmhTocIeXBlyDIHzWdFgUSywokuuY
	/T/GoMtCxMw4K+CGSvj0IX146qtuzUhwvM1Jj08Si2pdSvOh0g0pxKkHI5LtSF+q
	qldUFzO7sSlzybgc3GJ85Wnqi0GZVKMUKomiavNPyYQzD8/syMqxSJdq5Motg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ft7a2de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 09:15:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 14 May 2026 02:15:18 -0700
Received: from pek-lpggp9.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 14 May 2026 02:15:17 -0700
From: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
Subject: [OE-core][PATCH] libcamera: fix IPA signature re-signing for lib64 systems
Date: Thu, 14 May 2026 17:15:16 +0800
Message-ID: <20260514091516.905479-1-jianpeng.chang.cn@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: WohegDwkbNXX1oPklm6pzvlEix6iDhYL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MCBTYWx0ZWRfX2KKxY4OjIs0l
 HZbNHKpWRR3gPc4xGneywY1nr1d8NKiS8iu+IhZsmruTRJY6bdW4VG6jRr8ebTJnbSczZgEhX35
 8uEakb14QPfQpvsQVWZnGO/jkjG2Ri8x/bqL/01Vit/6SrQG+WkdWhbJw0sDptG/O5ta1NxDMpZ
 WhoMjsV0DVtyIykMasCWjyLXeFmoejkg3q3gjHf1lWvVTQvuxWDP8RG1XgAkDCKeik7gRHTdDAl
 2Qn8gQN1b/IJH71Wa25m/mrZVe/FUMSUSDvYYocCS7HxjvgjjaMmI4eF2S7ogX9bdkc3m633Dht
 S56S7wFdBEqx3MSzVtlwouoGbUyjhuAyaDp3SA9MkoQdc5BpsSevGWRQ5uUPd+qR5C9JWJE6bvm
 rtHlIGgtDDz5l3DTzku+/VUsyg+l3uGcfiR+g1cHdabiGaCadbEAjYFH5SiG9yVVJiZf+nzfJ3P
 VhpN8yDTyjD3H7qy3Cw==
X-Proofpoint-GUID: WohegDwkbNXX1oPklm6pzvlEix6iDhYL
X-Authority-Analysis: v=2.4 cv=G6As1dk5 c=1 sm=1 tr=0 ts=6a0592a7 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=bXkYHLrV98YSPjn88SAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140090
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 09:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237020

The do_package_recalculate_ipa_signatures function re-signs IPA modules
after stripping to ensure the signature matches the installed binary.
However, it hardcoded the search path as ${PKGD}/usr/lib/libcamera which
misses aarch64 systems where libraries are installed to /usr/lib64/.

This caused IPA signature validation to fail at runtime, forcing the IPA
to run in isolation mode (separate process). The isolated IPA proxy then
crashes with 'A list of V4L2 controls requires a ControlInfoMap' when
used from GStreamer's libcamerasrc, because the proxy receives a V4L2
control list before the ControlInfoMap is established over IPC.

Fix by using a path-based find pattern that works regardless of the
library directory name.

Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
index 74cb910417..60e1cdb621 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
@@ -80,7 +80,7 @@ do_package:append() {
 
 do_package_recalculate_ipa_signatures() {
     local modules
-    for module in $(find ${PKGD}/usr/lib/libcamera -name "*.so.sign"); do
+    for module in $(find ${PKGD}${libdir}/libcamera -name "*.so.sign"); do
         module="${module%.sign}"
         if [ -f "${module}" ] ; then
             modules="${modules} ${module}"
-- 
2.54.0


