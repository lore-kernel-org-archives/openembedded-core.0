Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FB7F51419
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:15:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64077.1772778438588524694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 22:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nea3nKlh;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=VS1M/u/O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264ab2Z2797538
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Mar 2026 06:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4yOnlRXY949mG9YCmtv3eMfeGJwxqlG2T3C
	8phsrbxU=; b=nea3nKlhf1c8/V5ANZmsgvDUzK5KWr4bs4b/6VJCB7MBJ6zMrDd
	UClZg9cnLTdxu/Uw+Q6u3AsWfOJt4pnlLY/bzN4L7H3sPiPpwjK4aNcPglC3Gzc6
	BE8TA27ECT24psflVZK+nl7lCYez7liQtulLVBJ68Lw3RhdSOHQlciDxxDLZNoMq
	JMIkGiNVlDka/BWY4ft5j2Jla0SYnLn0oh/b9fkQUNARp2WC9n671s4pNfD32egp
	VRlrfHmmE018vjQr+dnrJpcj4zQY5FV7TUMJ6p6HPiGqaqeXetKkZzO8JusTHIBM
	A//oJSVR20sqnCSfjeASem7+D968pMaR3vA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srk72a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:27:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so42090448a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 22:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772778436; x=1773383236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4yOnlRXY949mG9YCmtv3eMfeGJwxqlG2T3C8phsrbxU=;
        b=VS1M/u/ONychhyz+/3/LDPiYPt/OHwj7HqIWC9ug8r4oZnsul3mhtXKLMScnoSp426
         yrey85K38nSl0RPyg/a6CBeWBYTY3peucNA19y557wjvD8/8nWn/2PEke1ak2BtSTHMJ
         NrJYcYDSTcs8Q1HsRp+Wp5an+Fk8fXZZj8ukYvEBDIGtnXlCrm/YfLpzbVmyqIZCEBBB
         fui5vThem9ty6MWMPD+KKZ/UxJNE1AZdFy62bhyHNsW6PuTZ0GLdb9cJbbm8Di6bWxJk
         mZQdxwlRUqqyDPPSB7rwc39WwvoUIt4OJS2uIuXJbcOV659pqK1BTqk+DgvO4yz3/QbB
         y2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772778436; x=1773383236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yOnlRXY949mG9YCmtv3eMfeGJwxqlG2T3C8phsrbxU=;
        b=ZNEcjqcOE/Mjxmm9HlMkdl20GZXG9nWehxVAlSYEBBHV+hGC6z7PHZmhlP3Eou4s/n
         dsveXFHepHAv6mlqhCGcH8KUNpm3nFMOjOCqPNVQrAOhowJDs7dDhfvDZ/NplRnbSMRD
         X53irXAGO/Qalyuo3DdnUgqGj2p5CHs6neoyWo1vI0ToH28GJyT3qrvrtdpHw9XqaHnz
         g/JAx+16WNQTD2ATs9cA2Cv1pfn/h80Cl/fq1fWnXJXTPsNJhXk6c2xEsS8Hmf/2eRM0
         It58IzejHCb1bU5DgIwNmbUvzw2nFpWW5BJj7lMxfdV7lLIy51v6EKinUoyYvFr/uZx2
         fNFA==
X-Gm-Message-State: AOJu0YxzJVJEIJg6RoPXbpRDVzIHRv+ExkgxmGBhIqmoSx0CHEHahDuj
	sS+ZVFaLKriUXWowgh8ge9yVKOGhEpg6MdqrDw6FEyGxI0vuOL9mHbcG7g1R8LLaf0EeckLYtab
	FzjH9IcQNOuoBreyBIpQzdXqxoIZ0PvqB7+V/ieHtEuAxD3Ba6YE/fxp3yBxWbaS+sfxB8AD394
	HWH9GyVPoPj7tV3x4=
X-Gm-Gg: ATEYQzy9QqPZTGS3BWK6/zMGHMFKJ28ocHarZDaHPleedek5g5eGP8aAUb9aleMpGDb
	WXBteITXAwDICD3jjG8RLYFTCRSMWYyq3CkzIxJ8X+MqJyZTEkN1FyjBfU9ORLuu9uG52V+H0Aq
	BbLmqWGqzxP7Vyq1Azqe3Xx+ZPDhcD87dAgGxm8bXwgu117fkVyw1n17GfzWhmS5JUVTLqoQMj0
	ySifxmSulVs8CBZngriGwWBm3x3JOk9oRF2YRS4TlxQ8A/S4UpD0dYEs6/PeTOVOkE6qNZPNVvs
	kuT136armkGwppFcx+2kDiuK96sechUg2CxaKdZgjVwmCMbBN66YmC6Y3li+8zG7NReBhotsgJk
	DY81i4s8KRlPZYPJBcZFnnEpM7J1DpGp+UVm4LIp3aaJkowxAI5QvPJnQog==
X-Received: by 2002:a17:90b:1e4d:b0:359:8230:abcc with SMTP id 98e67ed59e1d1-359be275fdemr1085643a91.8.1772778436021;
        Thu, 05 Mar 2026 22:27:16 -0800 (PST)
X-Received: by 2002:a17:90b:1e4d:b0:359:8230:abcc with SMTP id 98e67ed59e1d1-359be275fdemr1085629a91.8.1772778435505;
        Thu, 05 Mar 2026 22:27:15 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bc7ef38csm550484a91.2.2026.03.05.22.27.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 22:27:15 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v1] alsa-ucm-conf: Backport the channel fix for lemans and monaco boards
Date: Fri,  6 Mar 2026 11:57:04 +0530
Message-Id: <20260306062704.3647403-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69aa73c5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=foHCeV_ZAAAA:8 a=EUspDBNiAAAA:8 a=F1kXWJdj-w32oN3yrIUA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=h8a9FgHX5U4dIE3jaWyr:22
X-Proofpoint-GUID: 6UOAPH1x50ZoukmBpBEz2z_y34gs9RFc
X-Proofpoint-ORIG-GUID: 6UOAPH1x50ZoukmBpBEz2z_y34gs9RFc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA2MCBTYWx0ZWRfX43wRGqHKlDPT
 nYdqHvatqFhNN9lBGGDvgzEJb50sfFUYsFho7hEyg3z9yVm+Da5DRTJsBzh7oCvIIY6dwZbbjPs
 azp7n9PlVPGUEAvkp+cSEFZaaOu5aPscyApd3/DvNuxcxjUcP5tzBjwdQzFfJIi7L8/uzP5+b1d
 VdHVFNRqndARlHUVvlJSau+kSz0QYOxiszjBXXMVlA9qa9jeqlU1JuVuDb9NILQ9Cv4bYgWpDvy
 MGZzLUKf3Nc/E2gW0Dy3owmPbpFNHPLBWJHU74D7NVryCVi6iGZ6pS8KDIr0tTtEBaRVgpP7iu+
 gQWTXFvMREh1Zfv2tO2FZBXiDcbS7POc/9u/a8rUdlWZtweko5vtqboIquuFWHHhF2+5p5s8erb
 lk1hwx7FcB3BuhwW0o8URgai6I/LiOzw0sOfOUZBHw5ueUs/Nqd/fnrwpklNpf+eQlpP4NXB/y6
 rRk8L497LHgDkiG49ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060060
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232538

Remove Fixed channel setting for Qualcomm lemans and monaco boards to support
stereo capture.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 ...8775p-Remove-Fixed-channel-setting-f.patch | 32 +++++++++++++++++++
 ...s8300-Remove-Fixed-channel-setting-f.patch | 32 +++++++++++++++++++
 .../alsa/alsa-ucm-conf_1.2.15.3.bb            |  2 ++
 3 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
new file mode 100644
index 0000000000..6ebc4f04c2
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
@@ -0,0 +1,32 @@
+From ba4126955f3e145d3a70171b5e8a23aafa157052 Mon Sep 17 00:00:00 2001
+From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
+Date: Fri, 23 Jan 2026 15:26:17 +0530
+Subject: [PATCH 01/02] ucm2: Qualcomm: sa8775p: Remove Fixed channel setting
+ for lemans-evk
+
+Remove Fixed channel setting for lemans-evk to support stereo
+capture.
+
+Upstream-Status: Backport
+[https://github.com/alsa-project/alsa-ucm-conf/commit/ba4126955f3e145d3a70171b5e8a23aafa157052]
+Closes: https://github.com/alsa-project/alsa-ucm-conf/pull/694
+Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+---
+ ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf b/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf
+index 5915d1c..f2be928 100644
+--- a/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf
++++ b/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf
+@@ -25,6 +25,5 @@ SectionDevice."Mic" {
+ 	Value {
+ 		CapturePriority 100
+ 		CapturePCM "hw:${CardId},1"
+-		CaptureChannels 1
+ 	}
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch
new file mode 100644
index 0000000000..db561cdd55
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch
@@ -0,0 +1,32 @@
+From 5c7b40c96b6cefd4d1d545d89b6d030248f0bb1c Mon Sep 17 00:00:00 2001
+From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
+Date: Fri, 23 Jan 2026 15:31:34 +0530
+Subject: [PATCH 02/02] ucm2: Qualcomm: qcs8300: Remove Fixed channel setting
+ for monaco-evk
+
+Remove Fixed channel setting for monaco-evk to support stereo
+capture.
+
+Upstream-Status: Backport
+[https://github.com/alsa-project/alsa-ucm-conf/commit/5c7b40c96b6cefd4d1d545d89b6d030248f0bb1c]
+Closes: https://github.com/alsa-project/alsa-ucm-conf/pull/694
+Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+---
+ ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf b/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf
+index 8345129..b60a310 100644
+--- a/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf
++++ b/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf
+@@ -25,6 +25,5 @@ SectionDevice."Mic" {
+ 	Value {
+ 		CapturePriority 100
+ 		CapturePCM "hw:${CardId},1"
+-		CaptureChannels 1
+ 	}
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
index 0ac51b6c5d..1fbf7b8c03 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
@@ -8,6 +8,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI += "file://0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch"
+SRC_URI += "file://0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch"
 SRC_URI[sha256sum] = "9f79e813c08fc86cfa46dd75c4fcda1a4a51b482db2607e1fcfaafb92f588a31"
 # Something went wrong at upstream tarballing
 
-- 
2.34.1


