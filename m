Return-Path: <mohammad.rafi.shaik@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552F8EBFD1C
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 08:49:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.267342.1776070149408079060
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 01:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lDGP3/O1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ZnFj3X2f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D51qVj3561692
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 08:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VW4+EJ6OlciLryIhg/VALX3zjnXTtdS8th2
	+3sHLSsY=; b=lDGP3/O1v8ksKNWorx/Bj0e6fYmFRiD5kZzV42xHJF8y88oH8R3
	QY0HN6LRerHCxm45ehJjhRFazZOXNZcL3RjAoww0RQAeZedzksTwd6EVnAaGm71R
	8BU3W9e3EQZhEI+uvV1piMOtocGZ/sSCMhIonHHzAx6LQBVuD2+RzDL1dvVEHQkk
	ZVgo5st2MH9hLxqjF9zvACTy2kbZZJmRvIpnza8P8B8PjQV0ddsfSn5TDQ8bA7uz
	DoLfW98Z0xtrkaQiFNK01CcoEUL06rbC/+6vBJhEXRZUOJ6WOus3WhqpAkKZJHV8
	P8vyfl24gpb8z1TQrWzNpsh6HcPRsMoJfcg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0mff8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 08:49:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e91add2aso12297185ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 01:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776070148; x=1776674948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VW4+EJ6OlciLryIhg/VALX3zjnXTtdS8th2+3sHLSsY=;
        b=ZnFj3X2frcA7zUC4WZ4frw7QN3CAC5YLqF8n9Q5E1q6lofbGGpeFGRwUE4AFBjXUKP
         wGwWnYTjOfJCWOq2vIc4VncggZ7Cw5u/RDCt1LHHkeAH5e4vggWDfFd8WQKGs2KoKKgL
         QJXi8AkcNBu2TsbgSfYJm6NCmZRLet7gKmN7642prXCSdYUp1uhLSq02ue1D9p5ag166
         KNLyxSSARU89vdSqau2jm42qGtgbv3i6GLzSvrAsPYMieXff047w9i9+Lm0yS2XgM8Ja
         P4BAZR9McXKNSTTF1sRaxThsmUBu+GYeASXzs+q6vVvI01GkU0xOjFjKNbzFJ6cyXF0q
         mO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776070148; x=1776674948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VW4+EJ6OlciLryIhg/VALX3zjnXTtdS8th2+3sHLSsY=;
        b=VxdXnnBvYnpVTBCRU/XohpJuka2YXcTe9ADCkN0YukAGRtJbr7C6L3joo1626Kva7/
         Qk0O4JWUpCfQfXGeHVVYUW6HEDHZ/ZMIp/iazJOETeKAP9ncDyoUBWa4k+rUcfk1tLMd
         q2gcKDbUZPXG96bBQ8Q4vypMLCUpyNG0Q8WnT/VhH6KNIuzOniIAHjs0zKSKgVB+1Cpx
         8sP6oFwMZDXN/gADUKsplI/GWn59Zdhpwb1DRR34chqC337CWjWvpFtO2fdW2FeXByxC
         OVItaraiJCaElj1HUExdKH+PPEThUAZsl+wAcbZwU/H6jmYuKiIMe5MGYoqyFTmskPiP
         3h3Q==
X-Gm-Message-State: AOJu0YyfQ6aoGK7oClhTNeXETDshYNlfKtTdUHEHA+lBBr4QR9dRzJR0
	8toe9+2S1I4jUTx1xhkPnsx6SpDWm/brKmU76evRU78izY2nJ8/eeBHht6eTQnPya9TkgOjrtRP
	Jne+nH8UXFSFqmHl4B4s9SNa4w3hCcm5rNH7GD+pcHy+yOTXxhfNZtsRaEJpY4a5mU4SfRdkRGS
	tpkd65BQcwIpbeyGg=
X-Gm-Gg: AeBDieu0RnFcYQJDb97UmapjlKq9wEEbVuCCwRVCdcd2wyFf3ktn+x3jSTXiTT0qc7J
	u+pf0DnJ13tdigbrFHF1nnq/lpjmqQAu+CxAi7xFjqBbW+tha+mmvOIdLOw4zN6HUHq0BFfXuCm
	WIqBwAEnePPcWMZ6h5Rmd8Q7Vf67zNZ0PEEQOxAnb1Y5hLugFufMU+F/OTTQaWbrojmLfDy/56y
	ov0u7rzeF+uEGRaUdXMV98vXcOUyhOwCC48f1Km+97iRCr754tbI+UdAyz20pufkTZ9CZWqwUKt
	ZFlyoNGL9biK/h3I2EYSO45KoMD2IfFOqNBmCynRV1HfFllBIT4xC77ErgzN6atXqKF6AV70Lyl
	e0uzBzJZyn5Vk/dEPjVzHd6X70HuvQxR+wAl5WXwqSxJarxBfPY5iV9FzDw==
X-Received: by 2002:a17:903:1aa7:b0:2b2:d463:b8f5 with SMTP id d9443c01a7336-2b2d5a15f6emr123401665ad.21.1776070147666;
        Mon, 13 Apr 2026 01:49:07 -0700 (PDT)
X-Received: by 2002:a17:903:1aa7:b0:2b2:d463:b8f5 with SMTP id d9443c01a7336-2b2d5a15f6emr123401385ad.21.1776070146848;
        Mon, 13 Apr 2026 01:49:06 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b46151801dsm19293195ad.78.2026.04.13.01.49.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:49:06 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v1] alsa-ucm-conf: Add GLYMUR CRD HiFi config
Date: Mon, 13 Apr 2026 14:18:12 +0530
Message-Id: <20260413084812.327438-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcae04 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=_DtdQlyMknnMjRZqwiEA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4NSBTYWx0ZWRfX/DOqc0sAsORJ
 NnA5iGWWvJE+C9TQpZzhFWyfC6Brpa8HaZ/Brmio9E18ggvtzG/lN7GaB+YlUxX47YjcIDOccab
 sEqh3hbvpW1AnN63JlqUTHr+3AZzMC7iG3kiB0C7AxNlcrp238NFn1w/esY/81dYJT4lbYF9x7m
 f6BF+Pc0j3mNFI1pUhsgLC0OsUpiwyKxeLL/O1/I5OXMwY7FFhkOihoINoXrM6H6Eenq0aw3AqL
 M+UIesBs4f6EXz8E+j2vvUlkll+UKGdXFRujkGFRNQsCCUzs62DWboHDjmyvUFm7SKQ69mWOkiM
 1yXaPxJdY80Ba+zmyW0cNempqenPHgYZFgcnUK3oVNrOSe3c8lmHSv746RLRSK9X2UShD5+eWUx
 dVjMR9lHWou+9dWTSa8Xw0bm+sNhsYcr7XROrvOwFSBvN0IQUaWWnh1b8win9L8Rcd9IJdWF1aM
 IDBj1SCxM5+JwpUn7JA==
X-Proofpoint-ORIG-GUID: tmKlOEVCga3ajTGTUm04sYgCSt0GzsFC
X-Proofpoint-GUID: tmKlOEVCga3ajTGTUm04sYgCSt0GzsFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 08:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235091

Add UCM2 configs for the Qualcomm GLYMUR CRD Board.

Link: https://github.com/alsa-project/alsa-ucm-conf/commit/41cfa5498ab37b67ae474abc88f08c9ef1bf9cc3
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 ...mm-glymur-Add-GLYMUR-CRD-HiFi-config.patch | 104 ++++++++++++++++++
 .../alsa/alsa-ucm-conf_1.2.15.3.bb            |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-glymur-Add-GLYMUR-CRD-HiFi-config.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-glymur-Add-GLYMUR-CRD-HiFi-config.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-glymur-Add-GLYMUR-CRD-HiFi-config.patch
new file mode 100644
index 0000000000..33b82f1316
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-glymur-Add-GLYMUR-CRD-HiFi-config.patch
@@ -0,0 +1,104 @@
+From 41cfa5498ab37b67ae474abc88f08c9ef1bf9cc3 Mon Sep 17 00:00:00 2001
+From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
+Date: Wed, 4 Mar 2026 15:09:06 +0530
+Subject: [PATCH] Qualcomm: glymur: Add GLYMUR CRD HiFi config
+
+Add UCM2 configs for the Qualcomm GLYMUR CRD Board.
+
+Upstream-Status: Backport
+[https://github.com/alsa-project/alsa-ucm-conf/commit/41cfa5498ab37b67ae474abc88f08c9ef1bf9cc3]
+Closes: https://github.com/alsa-project/alsa-ucm-conf/pull/713
+Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+---
+ ucm2/Qualcomm/glymur/GLYMUR-CRD.conf | 11 +++++++
+ ucm2/Qualcomm/glymur/HiFi.conf       | 49 ++++++++++++++++++++++++++++
+ ucm2/conf.d/glymur/GLYMUR-CRD.conf   |  1 +
+ 3 files changed, 61 insertions(+)
+ create mode 100755 ucm2/Qualcomm/glymur/GLYMUR-CRD.conf
+ create mode 100755 ucm2/Qualcomm/glymur/HiFi.conf
+ create mode 120000 ucm2/conf.d/glymur/GLYMUR-CRD.conf
+
+diff --git a/ucm2/Qualcomm/glymur/GLYMUR-CRD.conf b/ucm2/Qualcomm/glymur/GLYMUR-CRD.conf
+new file mode 100755
+index 0000000..15deae9
+--- /dev/null
++++ b/ucm2/Qualcomm/glymur/GLYMUR-CRD.conf
+@@ -0,0 +1,11 @@
++Syntax 4
++
++SectionUseCase."HiFi" {
++	File "/Qualcomm/glymur/HiFi.conf"
++	Comment "HiFi quality Music."
++}
++
++Include.card-init.File "/lib/card-init.conf"
++Include.ctl-remap.File "/lib/ctl-remap.conf"
++Include.wsa-init.File "/codecs/wsa884x/four-speakers/init.conf"
++Include.wsam-init.File "/codecs/qcom-lpass/wsa-macro/four-speakers/init.conf"
+diff --git a/ucm2/Qualcomm/glymur/HiFi.conf b/ucm2/Qualcomm/glymur/HiFi.conf
+new file mode 100755
+index 0000000..7419c1e
+--- /dev/null
++++ b/ucm2/Qualcomm/glymur/HiFi.conf
+@@ -0,0 +1,49 @@
++# Use case configuration for X1E80100.
++# Author: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
++
++SectionVerb {
++	EnableSequence [
++		cset "name='WSA_CODEC_DMA_RX_0 Audio Mixer MultiMedia1' 1"
++		cset "name='MultiMedia2 Mixer VA_CODEC_DMA_TX_0' 1"
++	]
++
++	Include.wsae.File "/codecs/wsa884x/four-speakers/DefaultEnableSeq.conf"
++	Include.wsm1e.File "/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerEnableSeq.conf"
++	Include.wsm2e.File "/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerEnableSeq.conf"
++
++	Value {
++		TQ "HiFi"
++	}
++}
++
++SectionDevice."Speaker" {
++	Comment "Speaker playback"
++
++	Include.wsmspk1e.File "/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerEnableSeq.conf"
++	Include.wsmspk2e.File "/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerEnableSeq.conf"
++	Include.wsmspk1d.File "/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerDisableSeq.conf"
++	Include.wsmspk2d.File "/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerDisableSeq.conf"
++	Include.wsaspk.File "/codecs/wsa884x/four-speakers/SpeakerSeq.conf"
++
++	Value {
++		PlaybackChannels 4
++		PlaybackPriority 100
++		PlaybackPCM "hw:${CardId},0"
++		PlaybackMixer "default:${CardId}"
++		PlaybackMixerElem "Speakers"
++	}
++}
++
++SectionDevice."Mic" {
++	Comment "Internal microphones"
++
++	Include.vadm0e.File "/codecs/qcom-lpass/va-macro/DMIC0EnableSeq.conf"
++	Include.vadm0d.File "/codecs/qcom-lpass/va-macro/DMIC0DisableSeq.conf"
++	Include.vadm1e.File "/codecs/qcom-lpass/va-macro/DMIC1EnableSeq.conf"
++	Include.vadm1d.File "/codecs/qcom-lpass/va-macro/DMIC1DisableSeq.conf"
++
++	Value {
++		CapturePriority 100
++		CapturePCM "hw:${CardId},1"
++	}
++}
+diff --git a/ucm2/conf.d/glymur/GLYMUR-CRD.conf b/ucm2/conf.d/glymur/GLYMUR-CRD.conf
+new file mode 120000
+index 0000000..f90f419
+--- /dev/null
++++ b/ucm2/conf.d/glymur/GLYMUR-CRD.conf
+@@ -0,0 +1 @@
++../../Qualcomm/glymur/GLYMUR-CRD.conf
+\ No newline at end of file
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
index dbb22b6708..0a6f884e5e 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.pat
 SRC_URI += "file://0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch"
 SRC_URI += "file://0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch"
 SRC_URI += "file://0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch"
+SRC_URI += "file://0001-Qualcomm-glymur-Add-GLYMUR-CRD-HiFi-config.patch"
 SRC_URI[sha256sum] = "9f79e813c08fc86cfa46dd75c4fcda1a4a51b482db2607e1fcfaafb92f588a31"
 # Something went wrong at upstream tarballing
 
-- 
2.34.1


