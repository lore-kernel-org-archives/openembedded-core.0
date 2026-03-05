Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F110EF8FE4
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:22:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36551.1772682107041070853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 19:41:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=c5t4H9fK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: leqi@qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BVob2665086
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 03:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RKRp+3XjoD4TB4B/sH48ynkYt8iSf3lWYu8
	m1KaVdO0=; b=c5t4H9fK97XBssNiSNLrEtk55LehfFrSaRSxyAqTjjHtXljo++D
	B9ZORpknzv5EB+0X2zqszFTL2VigpX/SGuaIdrVpc3ijtQCWElu9yDPL7bLxhgZ1
	OZtY5tEiQCPunduM6AsEqteGjwchyY/DCeAUYdlcXCPTXQBnU8SgVNQUrPqZo6D9
	D1qzJBFwQqQnu1tyFpUwAfLWO/sGRmtOmNsu3O+FY11z3ALGXFRAUHA24sEWoyP4
	joHTU5j4ADzSonpqq7cbfgdYsSDsYJ4ZWkkIAqlYCFGyTOn6xCx0hUo9KSVGOOaJ
	ySOogA/p7fu4keptds6125w/KN9E2Einh6A==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb0ypq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 03:15:25 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6253FMfk014216
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 03:15:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4cksempgf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 03:15:22 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6253FMFo014210
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 03:15:22 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6253FLAX014208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 03:15:22 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 9A1A422BC6; Thu,  5 Mar 2026 11:15:20 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH] alsa-ucm-conf: Remove JackControl from TALOS EVK HiFi config
Date: Thu,  5 Mar 2026 11:15:18 +0800
Message-Id: <20260305031518.4120410-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAyNCBTYWx0ZWRfXyoPb8HgHE3Em
 FOmGmWxQcYN0Rsz7eRfP3AKElhD/afDQNfIIZgoqroZLrJIQ+kNhmDmrDaObKOGygJT9I93fyH9
 PQZs+YiYCQrRay9JtNlEhPjSZwE9KlFxCL9+iYND4LDYI/4dCz1pCLQ9NSNir8pq3Dy4CU9J3Sz
 qsf3t3N/Unm4OHOTXINH8GMwAWPWR+3BE6vpepjUcXxtqFqyg0mnT6NRO04FeRYNhBGDlb6HY2k
 TNaR7rqbElRgPGoGYv4YhfNkWWaN23t06gSSGqBq0doPXVt0mO1PK1n4S0AG6Nywvkw5rD+X2kf
 vCpyE1to1jWaA7lpgcYq/S0L/KlADR/+5eR1Dinmb/320+h+YB2Z5Satb59nmvkoLKnCkJEl+/n
 relpGzc2HHeL2nudxPpoRV4S53K8sb9cK7CNaR2LSJZc5S5LdXThFddOWrtlj4LfgMocYJ/h2tk
 BrP2f50OOu5w2cxD3ZQ==
X-Proofpoint-GUID: 0tp8TwCdQA-2ZZwlzmHzmHum24ZM-Uwf
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a8f54d cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8 a=foHCeV_ZAAAA:8 a=EUspDBNiAAAA:8
 a=gdZPewPyt8z1eiyN7csA:9 a=h8a9FgHX5U4dIE3jaWyr:22
X-Proofpoint-ORIG-GUID: 0tp8TwCdQA-2ZZwlzmHzmHum24ZM-Uwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1011 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050024
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 09:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232467

The EVK board does not support headset or jack detection.
Keeping JackControl entries prevents PipeWire (wpctl) from
exposing sinks and sources correctly.

Remove JackControl from Headphones and Headset devices so
PipeWire can enumerate playback and capture nodes normally.

link: https://github.com/alsa-project/alsa-ucm-conf/pull/704

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 ...Remove-JackControl-from-TALOS-EVK-Hi.patch | 43 +++++++++++++++++++
 .../alsa/alsa-ucm-conf_1.2.15.3.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.patch
new file mode 100644
index 000000000000..ff08ebe6f704
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.patch
@@ -0,0 +1,43 @@
+From 3e414225c90de8a9371076bcdd33693dfe8e54c2 Mon Sep 17 00:00:00 2001
+From: Le Qi <le.qi@oss.qualcomm.com>
+Date: Thu, 12 Feb 2026 15:16:41 +0800
+Subject: [PATCH] Qualcomm: qcs615: Remove JackControl from TALOS EVK HiFi
+ config
+
+The EVK board does not support headset or jack detection.
+Keeping JackControl entries prevents PipeWire (wpctl) from
+exposing sinks and sources correctly.
+
+Remove JackControl from Headphones and Headset devices so
+PipeWire can enumerate playback and capture nodes normally.
+
+Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-ucm-conf/commit/e513b19d223f1559f43579e881ba86c618c142a9]
+---
+ ucm2/Qualcomm/qcs615/HiFi.conf | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/ucm2/Qualcomm/qcs615/HiFi.conf b/ucm2/Qualcomm/qcs615/HiFi.conf
+index 8978b2cb539d..a20fc89fa8f4 100644
+--- a/ucm2/Qualcomm/qcs615/HiFi.conf
++++ b/ucm2/Qualcomm/qcs615/HiFi.conf
+@@ -20,7 +20,6 @@ SectionDevice."Headphones" {
+ 		PlaybackPCM "hw:${CardId},0"
+ 		PlaybackMixer "default:${CardId}"
+ 		PlaybackMixerElem "HP Digital"
+-		JackControl "Headphone Jack"
+ 	}
+ }
+ 
+@@ -33,7 +32,6 @@ SectionDevice."Headset" {
+ 	Value {
+ 		CapturePriority 100
+ 		CapturePCM "hw:${CardId},1"
+-		JackControl "Mic Jack"
+ 		JackHWMute "Mic"
+ 	}
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
index 0ac51b6c5d47..1f27f19aa744 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
@@ -8,6 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI += "file://0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.patch"
 SRC_URI[sha256sum] = "9f79e813c08fc86cfa46dd75c4fcda1a4a51b482db2607e1fcfaafb92f588a31"
 # Something went wrong at upstream tarballing
 
-- 
2.34.1


