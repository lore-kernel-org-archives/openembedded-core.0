Return-Path: <nicolas.dechesne@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81451CD98EE
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:50:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2349.1781628638026921272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 09:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SZ7VN+he;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=beabnJXb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: nicolas.dechesne@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFemlC014144
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qn8X9CK+f4j
	pHY7IwpkooXNbv4kPKcu6RGRiu5NS208=; b=SZ7VN+he4UKgQfSYKRHKyLR+qFA
	Lr5HxlStCOtoI+jvI5XWKTWPngKTZ2Z2F1/Rym5Im0ge5yIhwrWzl8baxMAZJUkZ
	iX1YvNBGq7blb1EOwmZOBvEjzdVrRJ/i4xzq9iD117QFNQysvZ10sd9Z5uoQ1x0u
	REbCvB/TeJobMTRerS17R9dpbX6HgXtfNGeeUgeYp5IBnFZ9FWlNzfzQVizV+gN/
	phezdTMlehH5KS/EkbRI0Uc/bp7oKhRYFWd/LvUYktjor61mSj0whq+epMwSpTIN
	AtrCWTA4PtRVh45khhsJx6W+6H1J4OoSEFKKsIJ3vMak9iz7/d0OFc91RCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu4dkhvk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:50:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157ae36434so459952585a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781628636; x=1782233436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qn8X9CK+f4jpHY7IwpkooXNbv4kPKcu6RGRiu5NS208=;
        b=beabnJXbbS0yGkY+pejhSEhIzxXnoJgnYq/YlMZuX4YNwI0dVge7XaRwZGaCaAzjuH
         uo/oARDojjETRmIFxkq8lX8Jc2mPuaEdfs6oBgZuQ7/cEdfiSsSBSkPjD1IgaxGVg2fn
         e/uT4UX3LjaGgM2LwF3Qx+nwYZFYXJ8ZWyupAZmsGBbkWWeUPbMxbjwiBhYIqu1Zu3vg
         ViwOsRXBlEGlH40KE0iEoY/2ewW6Ek7OAUHxs5wafxrY0m1xGMPcMvBK4rSXPxh519MI
         C8AVR4O2dOe871Sfh5+vl5AmPcgOQnfM3riprD6xJJlVhqOEdBjA/j0tg2M+U8s8kuEU
         a4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781628636; x=1782233436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qn8X9CK+f4jpHY7IwpkooXNbv4kPKcu6RGRiu5NS208=;
        b=sOPX7e7vKbPgz0ivv4A5fKvWWNElwoQnaF4WUDZGwByFP4zFLsLXA2L5dr4JEUWv8/
         DrsRsQiHGC93ynAzQBMxD2HHmPW7gE5w2k4Dr9DSoz/tX+cJz5UxN0MrR5SgMfc0hu2d
         wdnj/kKVf9pZjWwV1iL3L68O5Nu/JNwKCrcUZxI3qS+COd0tuICKHi3XSxKUPovwujz6
         jcSaJPQDE5qpmVo8wtN7Fw1K5S0fYH3aFbaTBfOI7FGz7rKWwstvLX/QoNCGGZ60ypu/
         EQyDnYbH2bGTzJAnU8CLggSCido6IgCqyFocrW60HCqOx1uVqiWKeFtQmCn7mmzh1lcR
         um7w==
X-Gm-Message-State: AOJu0YzqMvOpooUrHSuLUF6vUp4y+NXo5pnolS6/pJG7nxmDSJsgZuC/
	HDg+8RMYbfbd+h7f0S39ZB2evqHVIotIVr8fxAozFa5L97RwzxOW8EWdD0HuzVpnczTn3Sj5pgX
	XYeeRkz/atECX4er340eAuxFhs3qn+ww0042/JDGqHE0ivwEcTMKQ1BMiRv8SwcRZdZBJNxigCZ
	2IilYTPsJDP/8av/68kA==
X-Gm-Gg: Acq92OFqPHhfuct4XUKcksctuP/MDgN/VBkUH0D7LFDy6i0+3Z18PA83nBhNvs4BAVA
	1lafvz2uDzo+UMUPKMMdhs+lzngXn4MlIzgJIuRiO5qunJ3qxNW0P/FWZSnP6jICzP41nFpTx8h
	X7yJuGdSwWXui6kTyLCEBVMFg5ToqZPzlclnBvEmy3B2IO4jntdHclC9CFU9k88NS5Jg6fmAL4/
	6YF3MKZWC79RFUowMRSa4zV8J0WiEHAB26kgIOcTYQ7+VOm+7W6gcyz2TghZHs5fMxE9Blt3MM6
	a38F8T9drjFOuQHKMlqiUTScZ5m7djgjv80VeklorzrOuKh+WzBtSq2x1GgwJ3fmekESsKSTxiu
	QoXFruX5GDPL1NknEflMPmlOhpIEo0rR6Ru0S5XMGI6J8SPVP/t7Gpztf4A==
X-Received: by 2002:a05:620a:19a8:b0:915:9a39:1d68 with SMTP id af79cd13be357-91d8acd4823mr80635885a.5.1781628635652;
        Tue, 16 Jun 2026 09:50:35 -0700 (PDT)
X-Received: by 2002:a05:620a:19a8:b0:915:9a39:1d68 with SMTP id af79cd13be357-91d8acd4823mr80628985a.5.1781628635061;
        Tue, 16 Jun 2026 09:50:35 -0700 (PDT)
Received: from hu-ndechesn-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b54asm5456495a12.3.2026.06.16.09.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:50:33 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
Subject: [OE-core][PATCH 1/2] alsa-ucm-conf: upgrade 1.2.15.3 -> 1.2.16.1
Date: Tue, 16 Jun 2026 18:49:58 +0200
Message-Id: <20260616164959.3399737-2-nicolas.dechesne@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616164959.3399737-1-nicolas.dechesne@oss.qualcomm.com>
References: <20260616164959.3399737-1-nicolas.dechesne@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OqzhTg4MD0FwLIuwZexAyLj53R39t1M1
X-Proofpoint-ORIG-GUID: OqzhTg4MD0FwLIuwZexAyLj53R39t1M1
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a317edc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=foHCeV_ZAAAA:8
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=LuafLewIWRnmZOqp51kA:9
 a=_PE9Q_0Z8bzuyU0-:21 a=bTQJ7kPSJx9SKPbeHEYW:22 a=h8a9FgHX5U4dIE3jaWyr:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfX90UruwixRd1o
 0S58jaw117KsZ2Awe4f056IwfZcffn0TcRTOCrCadsDuxKeGUzBYtkdJzXxtifwUW71D7o4qg8z
 UBjmdW8g7685lYqLwIuQropM6uh/ctqhLqAfY5qAwjugmp9s6UCvyKX7SpcjjAT7O3jBH8mekhL
 +29n6tDG7dJlj1/d6EA5+DVpTJqadcXC3GNROjvXhv8cGSNIsZBISzjyy/qUtcjy88PgFAzYVVF
 sePoUMz/cyCX5BRfSIv/eCRBeeQVXrNGInnK/TZYwBwwLr1IFosYVOBEMAr8JeLDIA/Y9wPs0eP
 MZC3MoTjfw83hztfS+MgeBnZHkgJDZ3yr/m39smeQD9qFphKghU0rRPodBlOZewGsuxbyFSH9VD
 O7qQv8e2zEJRGAASKuv96Z3WH2qcqkHGkJ7nZ7eHqGhtsgpbFn9+t6PWFnjeBqjO8kvSDGOEZr0
 IlAaToHjYw6HoYptgUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfX9UteK8BnwbLT
 u5dRmDct4k8PCyJxpO89bBoaA5UNaI2JakpnncTuXPaMMhxGyQNRA1EQs3cRTKa1yCUppNZ3ENg
 jTVwtfr9wVszkDkmwPCqeGnYfHJyAkY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238920

All local backported patches are now part of this release, so drop them.

Changelog: https://www.alsa-project.org/wiki/Changes_v1.2.15.3_v1.2.16
Changelog: https://www.alsa-project.org/wiki/Changes_v1.2.16_v1.2.16.1

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
---
 ...mm-glymur-Add-GLYMUR-CRD-HiFi-config.patch | 104 ------------------
 ...Remove-JackControl-from-TALOS-EVK-Hi.patch |  43 --------
 ...8775p-Remove-Fixed-channel-setting-f.patch |  32 ------
 ...ADC-switch-in-HeadphoneMic2-sequence.patch |  47 --------
 ...s8300-Remove-Fixed-channel-setting-f.patch |  32 ------
 ..._1.2.15.3.bb => alsa-ucm-conf_1.2.16.1.bb} |   7 +-
 6 files changed, 1 insertion(+), 264 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-glymur-Add-GLYMUR-CRD-HiFi-config.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.15.3.bb => alsa-ucm-conf_1.2.16.1.bb} (60%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-glymur-Add-GLYMUR-CRD-HiFi-config.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-glymur-Add-GLYMUR-CRD-HiFi-config.patch
deleted file mode 100644
index 33b82f1316..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-glymur-Add-GLYMUR-CRD-HiFi-config.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 41cfa5498ab37b67ae474abc88f08c9ef1bf9cc3 Mon Sep 17 00:00:00 2001
-From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
-Date: Wed, 4 Mar 2026 15:09:06 +0530
-Subject: [PATCH] Qualcomm: glymur: Add GLYMUR CRD HiFi config
-
-Add UCM2 configs for the Qualcomm GLYMUR CRD Board.
-
-Upstream-Status: Backport
-[https://github.com/alsa-project/alsa-ucm-conf/commit/41cfa5498ab37b67ae474abc88f08c9ef1bf9cc3]
-Closes: https://github.com/alsa-project/alsa-ucm-conf/pull/713
-Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
----
- ucm2/Qualcomm/glymur/GLYMUR-CRD.conf | 11 +++++++
- ucm2/Qualcomm/glymur/HiFi.conf       | 49 ++++++++++++++++++++++++++++
- ucm2/conf.d/glymur/GLYMUR-CRD.conf   |  1 +
- 3 files changed, 61 insertions(+)
- create mode 100755 ucm2/Qualcomm/glymur/GLYMUR-CRD.conf
- create mode 100755 ucm2/Qualcomm/glymur/HiFi.conf
- create mode 120000 ucm2/conf.d/glymur/GLYMUR-CRD.conf
-
-diff --git a/ucm2/Qualcomm/glymur/GLYMUR-CRD.conf b/ucm2/Qualcomm/glymur/GLYMUR-CRD.conf
-new file mode 100755
-index 0000000..15deae9
---- /dev/null
-+++ b/ucm2/Qualcomm/glymur/GLYMUR-CRD.conf
-@@ -0,0 +1,11 @@
-+Syntax 4
-+
-+SectionUseCase."HiFi" {
-+	File "/Qualcomm/glymur/HiFi.conf"
-+	Comment "HiFi quality Music."
-+}
-+
-+Include.card-init.File "/lib/card-init.conf"
-+Include.ctl-remap.File "/lib/ctl-remap.conf"
-+Include.wsa-init.File "/codecs/wsa884x/four-speakers/init.conf"
-+Include.wsam-init.File "/codecs/qcom-lpass/wsa-macro/four-speakers/init.conf"
-diff --git a/ucm2/Qualcomm/glymur/HiFi.conf b/ucm2/Qualcomm/glymur/HiFi.conf
-new file mode 100755
-index 0000000..7419c1e
---- /dev/null
-+++ b/ucm2/Qualcomm/glymur/HiFi.conf
-@@ -0,0 +1,49 @@
-+# Use case configuration for X1E80100.
-+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
-+
-+SectionVerb {
-+	EnableSequence [
-+		cset "name='WSA_CODEC_DMA_RX_0 Audio Mixer MultiMedia1' 1"
-+		cset "name='MultiMedia2 Mixer VA_CODEC_DMA_TX_0' 1"
-+	]
-+
-+	Include.wsae.File "/codecs/wsa884x/four-speakers/DefaultEnableSeq.conf"
-+	Include.wsm1e.File "/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerEnableSeq.conf"
-+	Include.wsm2e.File "/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerEnableSeq.conf"
-+
-+	Value {
-+		TQ "HiFi"
-+	}
-+}
-+
-+SectionDevice."Speaker" {
-+	Comment "Speaker playback"
-+
-+	Include.wsmspk1e.File "/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerEnableSeq.conf"
-+	Include.wsmspk2e.File "/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerEnableSeq.conf"
-+	Include.wsmspk1d.File "/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerDisableSeq.conf"
-+	Include.wsmspk2d.File "/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerDisableSeq.conf"
-+	Include.wsaspk.File "/codecs/wsa884x/four-speakers/SpeakerSeq.conf"
-+
-+	Value {
-+		PlaybackChannels 4
-+		PlaybackPriority 100
-+		PlaybackPCM "hw:${CardId},0"
-+		PlaybackMixer "default:${CardId}"
-+		PlaybackMixerElem "Speakers"
-+	}
-+}
-+
-+SectionDevice."Mic" {
-+	Comment "Internal microphones"
-+
-+	Include.vadm0e.File "/codecs/qcom-lpass/va-macro/DMIC0EnableSeq.conf"
-+	Include.vadm0d.File "/codecs/qcom-lpass/va-macro/DMIC0DisableSeq.conf"
-+	Include.vadm1e.File "/codecs/qcom-lpass/va-macro/DMIC1EnableSeq.conf"
-+	Include.vadm1d.File "/codecs/qcom-lpass/va-macro/DMIC1DisableSeq.conf"
-+
-+	Value {
-+		CapturePriority 100
-+		CapturePCM "hw:${CardId},1"
-+	}
-+}
-diff --git a/ucm2/conf.d/glymur/GLYMUR-CRD.conf b/ucm2/conf.d/glymur/GLYMUR-CRD.conf
-new file mode 120000
-index 0000000..f90f419
---- /dev/null
-+++ b/ucm2/conf.d/glymur/GLYMUR-CRD.conf
-@@ -0,0 +1 @@
-+../../Qualcomm/glymur/GLYMUR-CRD.conf
-\ No newline at end of file
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.patch
deleted file mode 100644
index ff08ebe6f7..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3e414225c90de8a9371076bcdd33693dfe8e54c2 Mon Sep 17 00:00:00 2001
-From: Le Qi <le.qi@oss.qualcomm.com>
-Date: Thu, 12 Feb 2026 15:16:41 +0800
-Subject: [PATCH] Qualcomm: qcs615: Remove JackControl from TALOS EVK HiFi
- config
-
-The EVK board does not support headset or jack detection.
-Keeping JackControl entries prevents PipeWire (wpctl) from
-exposing sinks and sources correctly.
-
-Remove JackControl from Headphones and Headset devices so
-PipeWire can enumerate playback and capture nodes normally.
-
-Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-ucm-conf/commit/e513b19d223f1559f43579e881ba86c618c142a9]
----
- ucm2/Qualcomm/qcs615/HiFi.conf | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/ucm2/Qualcomm/qcs615/HiFi.conf b/ucm2/Qualcomm/qcs615/HiFi.conf
-index 8978b2cb539d..a20fc89fa8f4 100644
---- a/ucm2/Qualcomm/qcs615/HiFi.conf
-+++ b/ucm2/Qualcomm/qcs615/HiFi.conf
-@@ -20,7 +20,6 @@ SectionDevice."Headphones" {
- 		PlaybackPCM "hw:${CardId},0"
- 		PlaybackMixer "default:${CardId}"
- 		PlaybackMixerElem "HP Digital"
--		JackControl "Headphone Jack"
- 	}
- }
- 
-@@ -33,7 +32,6 @@ SectionDevice."Headset" {
- 	Value {
- 		CapturePriority 100
- 		CapturePCM "hw:${CardId},1"
--		JackControl "Mic Jack"
- 		JackHWMute "Mic"
- 	}
- }
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
deleted file mode 100644
index 6ebc4f04c2..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ba4126955f3e145d3a70171b5e8a23aafa157052 Mon Sep 17 00:00:00 2001
-From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
-Date: Fri, 23 Jan 2026 15:26:17 +0530
-Subject: [PATCH 01/02] ucm2: Qualcomm: sa8775p: Remove Fixed channel setting
- for lemans-evk
-
-Remove Fixed channel setting for lemans-evk to support stereo
-capture.
-
-Upstream-Status: Backport
-[https://github.com/alsa-project/alsa-ucm-conf/commit/ba4126955f3e145d3a70171b5e8a23aafa157052]
-Closes: https://github.com/alsa-project/alsa-ucm-conf/pull/694
-Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
----
- ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf b/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf
-index 5915d1c..f2be928 100644
---- a/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf
-+++ b/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf
-@@ -25,6 +25,5 @@ SectionDevice."Mic" {
- 	Value {
- 		CapturePriority 100
- 		CapturePCM "hw:${CardId},1"
--		CaptureChannels 1
- 	}
- }
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch
deleted file mode 100644
index 4ff933cc0c..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 8a9581426459e1b423ef87d5ae0fe0a9e21eeaad Mon Sep 17 00:00:00 2001
-From: Le Qi <le.qi@oss.qualcomm.com>
-Date: Wed, 7 Jan 2026 11:20:54 +0800
-Subject: [PATCH] ucm2: da7213: Add ADC switch in HeadphoneMic2 sequences
-
-Enable and disable the ADC switch in HeadphoneMic2EnableSeq.conf and
-HeadphoneMic2DisableSeq.conf to ensure headset microphone audio works
-properly on Talos EVK with DA7213 codec.
-
-Without this change, the headset mic path remains muted and capture
-does not function.
-
-Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-ucm-conf/commit/8a9581426459e1b423ef87d5ae0fe0a9e21eeaad]
----
- ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf | 1 +
- ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf  | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf b/ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf
-index a42f5f12be93..a9693af90acc 100644
---- a/ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf
-+++ b/ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf
-@@ -3,6 +3,7 @@ DisableSequence [
- 	cset "name='Mixin Left Mic 2 Switch' off"
- 	cset "name='Mixin Right Mic 2 Switch' off"
- 	cset "name='Mixin PGA Switch' off"
-+	cset "name='ADC Switch' off"
- 	cset "name='Headphone Switch' off"
- 	cset "name='Mixout Left DAC Left Switch' off"
- 	cset "name='Mixout Right DAC Right Switch' off"
-diff --git a/ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf b/ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf
-index d3a69e0a550c..42bd9e2ba1fd 100644
---- a/ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf
-+++ b/ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf
-@@ -5,6 +5,7 @@ EnableSequence [
- 	cset "name='Mixin Left Mic 2 Switch' on"
- 	cset "name='Mixin Right Mic 2 Switch' on"
- 	cset "name='Mixin PGA Switch' on"
-+	cset "name='ADC Switch' on"
- 	cset "name='DAI Left Source MUX' ADC Left"
- 	cset "name='DAI Right Source MUX' ADC Right"
- 	cset "name='Headphone Volume' 85"
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch
deleted file mode 100644
index db561cdd55..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5c7b40c96b6cefd4d1d545d89b6d030248f0bb1c Mon Sep 17 00:00:00 2001
-From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
-Date: Fri, 23 Jan 2026 15:31:34 +0530
-Subject: [PATCH 02/02] ucm2: Qualcomm: qcs8300: Remove Fixed channel setting
- for monaco-evk
-
-Remove Fixed channel setting for monaco-evk to support stereo
-capture.
-
-Upstream-Status: Backport
-[https://github.com/alsa-project/alsa-ucm-conf/commit/5c7b40c96b6cefd4d1d545d89b6d030248f0bb1c]
-Closes: https://github.com/alsa-project/alsa-ucm-conf/pull/694
-Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
----
- ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf b/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf
-index 8345129..b60a310 100644
---- a/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf
-+++ b/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf
-@@ -25,6 +25,5 @@ SectionDevice."Mic" {
- 	Value {
- 		CapturePriority 100
- 		CapturePCM "hw:${CardId},1"
--		CaptureChannels 1
- 	}
- }
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.16.1.bb
similarity index 60%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.16.1.bb
index 0a6f884e5e..095deca908 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.16.1.bb
@@ -8,12 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI += "file://0001-Qualcomm-qcs615-Remove-JackControl-from-TALOS-EVK-Hi.patch"
-SRC_URI += "file://0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch"
-SRC_URI += "file://0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch"
-SRC_URI += "file://0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch"
-SRC_URI += "file://0001-Qualcomm-glymur-Add-GLYMUR-CRD-HiFi-config.patch"
-SRC_URI[sha256sum] = "9f79e813c08fc86cfa46dd75c4fcda1a4a51b482db2607e1fcfaafb92f588a31"
+SRC_URI[sha256sum] = "cf3d1c07e089a83c4ece2c20f05dd6a8aab7fcd108768c38811386880575492b"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.34.1


