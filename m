Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC5710ED652
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 10:12:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68924.1774603111159273540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 02:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Xr6jk6Zt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: leqi@qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wutU2846152
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+NlKnHnZgbhVARONLJpToLnJMijWJxuU7g2
	oRvm/WUg=; b=Xr6jk6ZtMmKNa3OOIlcoebFzJx7/HLA8fsdNKvtbAF4Unob9q+H
	Muk4BotG2vXPFdkyQFMT9tfQsEkgZXOxB7rEV2KxnakDCwrp8KB/IXDtbGa+o8My
	J8Iia/ESx3cXfxqYzBeJbbaFzuUr+9qi0yxO5BHjUzfS8gKG8/8rLL/2NHzN+elU
	+AWmWSctTh8O2QgTFqs7JG55bg2tUc/zNg6rW45r9VWYkZkWB+Fd41Rd8V7reMlA
	jAdvcvd9mKt4VSRv4AfHhAOtLnZMe8MRrmzM2IB5u5FZdw0xdEZiOIAQhFaHWKVb
	NZvakKjipp6blyKPpsw6Us649nnZdAChOxg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqm893-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:48:00 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62R8lwgS030628
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:47:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4d1mdnfn8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:47:58 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62R8lwAV030620
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:47:58 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 62R8lvvr030612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 08:47:58 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 7DC24228CD; Fri, 27 Mar 2026 16:47:56 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH] ucm2: da7213: Add ADC switch in HeadphoneMic2 sequences
Date: Fri, 27 Mar 2026 16:47:54 +0800
Message-Id: <20260327084754.431898-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2NCBTYWx0ZWRfX3XenIqeLsGe+
 ZPofB4HhXV1jvPpsvPoEZf8vRGewJ4EVbJC+cP2WsQGiNTqzx4AFONoCFNgWPXgmUXxcUFqJzFA
 1paCDJJ7PHeIdC7VuM0UiAl/B7pPH1l4/NFHqiChXnxiDrbhSXMldsgX8HaHfBAYaGPJTN4dp1e
 BiVr/M37Uw5EszaVSOxtPNrBVie+Et3QC53D3m4mQTZ11P3VngBidX6W3d0XR8aeYN04nq8oNtO
 bpjW5hmdnn/hWcGNwjGJULu5sC537ysfmpRhdVr/YXdBuykYEJrWbJUxc0TLv6/jMlReQoqZyU9
 SnhjT60hfEKfVUjF5NEPdzTIOYuuEXBvf6vJciRsx6tD1AdtHL+yfh/V7xOObrZ54kbENa/ODrk
 BaZ3DuYgTgxrDmleJjZVOKequncGvPMgvYiyFf3IqASkH+B9RbpjHZYv5u/W8mxdCr2bFpgnYlY
 libhTbFCAmmKfjrLQbw==
X-Proofpoint-GUID: uZ3juP5GZUiZtCnpatW6jg6RGoe26Yrh
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c64440 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8 a=foHCeV_ZAAAA:8 a=EUspDBNiAAAA:8
 a=jHkBOX08VDcjz8aLXrkA:9 a=h8a9FgHX5U4dIE3jaWyr:22
X-Proofpoint-ORIG-GUID: uZ3juP5GZUiZtCnpatW6jg6RGoe26Yrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270064
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 10:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234077

Enable and disable the ADC switch in HeadphoneMic2EnableSeq.conf and
HeadphoneMic2DisableSeq.conf to ensure headset microphone audio works
properly on Talos EVK with DA7213 codec.

Without this change, the headset mic path remains muted and capture
does not function.

link: https://github.com/alsa-project/alsa-ucm-conf/commit/8a9581426459e1b423ef87d5ae0fe0a9e21eeaad

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 ...ADC-switch-in-HeadphoneMic2-sequence.patch | 47 +++++++++++++++++++
 .../alsa/alsa-ucm-conf_1.2.15.3.bb            |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch
new file mode 100644
index 000000000000..4ff933cc0c07
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch
@@ -0,0 +1,47 @@
+From 8a9581426459e1b423ef87d5ae0fe0a9e21eeaad Mon Sep 17 00:00:00 2001
+From: Le Qi <le.qi@oss.qualcomm.com>
+Date: Wed, 7 Jan 2026 11:20:54 +0800
+Subject: [PATCH] ucm2: da7213: Add ADC switch in HeadphoneMic2 sequences
+
+Enable and disable the ADC switch in HeadphoneMic2EnableSeq.conf and
+HeadphoneMic2DisableSeq.conf to ensure headset microphone audio works
+properly on Talos EVK with DA7213 codec.
+
+Without this change, the headset mic path remains muted and capture
+does not function.
+
+Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-ucm-conf/commit/8a9581426459e1b423ef87d5ae0fe0a9e21eeaad]
+---
+ ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf | 1 +
+ ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf  | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf b/ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf
+index a42f5f12be93..a9693af90acc 100644
+--- a/ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf
++++ b/ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf
+@@ -3,6 +3,7 @@ DisableSequence [
+ 	cset "name='Mixin Left Mic 2 Switch' off"
+ 	cset "name='Mixin Right Mic 2 Switch' off"
+ 	cset "name='Mixin PGA Switch' off"
++	cset "name='ADC Switch' off"
+ 	cset "name='Headphone Switch' off"
+ 	cset "name='Mixout Left DAC Left Switch' off"
+ 	cset "name='Mixout Right DAC Right Switch' off"
+diff --git a/ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf b/ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf
+index d3a69e0a550c..42bd9e2ba1fd 100644
+--- a/ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf
++++ b/ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf
+@@ -5,6 +5,7 @@ EnableSequence [
+ 	cset "name='Mixin Left Mic 2 Switch' on"
+ 	cset "name='Mixin Right Mic 2 Switch' on"
+ 	cset "name='Mixin PGA Switch' on"
++	cset "name='ADC Switch' on"
+ 	cset "name='DAI Left Source MUX' ADC Left"
+ 	cset "name='DAI Right Source MUX' ADC Right"
+ 	cset "name='Headphone Volume' 85"
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
index a2f7bb3c893b..dbb22b6708dd 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
 SRC_URI += "file://0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.patch"
+SRC_URI += "file://0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch"
 SRC_URI += "file://0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch"
 SRC_URI += "file://0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch"
 SRC_URI[sha256sum] = "9f79e813c08fc86cfa46dd75c4fcda1a4a51b482db2607e1fcfaafb92f588a31"
-- 
2.34.1


