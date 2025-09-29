Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DADCAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 05:14:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.46944.1759122880801306743
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 22:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XhLCy0fN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNIHT9017582
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 05:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=htMZGJPPu6mwihHm+fjcm4bmecO2t7kCyAS
	rHB35xDM=; b=XhLCy0fN2P7JF33pnTKxCJKDg6SMn5QPA3tNsQocsprgQSZPicH
	AzGBJQEvyYRaNd3XkzOJ7mGmp70VxuIxA9w1ZI3xINAseBYvf+zBdxT7aUWo/oNB
	3xvYy+qDAUUjyqS4SPhp15veBvIRWRWfWTukleulMQCINDsNIKV7XVW2d8dwt7wK
	r6yzLL1Y4Vy5/sIBV9u4jjDLxwIaySdec6I9gbRKfdnirvUWrNyOjnIxgtXN2buj
	+z/5PquCNdPhOsaejEN9/kMrmurM7DxSQla2ZgXvm+OppEgvzqWslZl5DVs94yuJ
	/qtN+2vMo5gu0WnBxAtdCNp4Uog4xNuTDxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e78fv0ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 05:14:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de53348322so102767991cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 22:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759122878; x=1759727678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htMZGJPPu6mwihHm+fjcm4bmecO2t7kCyASrHB35xDM=;
        b=Ip+Zs4JM8v/wxVfW2fbEGvvAFxTYHUtOeNoZxW/wn0MBP7ZyGtYsCT8qW/1Ugz5ezx
         Y/R5V7cvPuIek9JU4f1aPYv6QEI/vdyYBMAm8Vz5uhXWWoj8B+txMWGU29iH8f7cvoA9
         Hd6uLs5tCLfHzgkH0Kq0k2Z8pA2P0W8vim0O4WcYV7bpf/J8iUg0E7qvuoB4WqD7q2Le
         wHAQkAUEzyz8OdjYvqgXYTxp6XXC77sG61tvCNzN2ZvAgyXNmK2bi0EhSAFqw6q4TRDx
         v/ezeNP3vR37lL1dL9ydVS76sHucVksdFpGXReF+am1LoaKPML6Ot4kBR11MxVtgGz95
         GIKQ==
X-Gm-Message-State: AOJu0Yx7UjnuXaapqxUraTP6opqPMqC2dxVsc2LW2auDT71F2wOUUQr/
	W6yL0mKmKcp9/qdMUjm76r0uaJ4WH3OCc4mQpShj8p5WU9Gd2wlGN+jb9+yuBZsUQqxIQIVmvs3
	RAocJGDprD237nqv5FER2i3ldvptjoUl+0EpJLGk7e4omvFSqXBQhuOszqtC9Y/1zRPSHsYZbyM
	1uUw76wzgoJ8lD9Gewy2TW
X-Gm-Gg: ASbGnctQkRUIF4muxkD5efVo5yx6SyMRbAsdJIdjsEpAGotSmXvjtrfMOpQB8vVDb79
	2yoVTnR1GWTKBxOPAZc8vxkzCL3/0Lufysh5FWavsgWGPC0OmQv1PR2TIJfdJbftRwC71Ohqg/H
	ReomA5u97/IXCf5QMU5lSxW+4mIXXGxHOJ+rGoLrtlQsXO/ToreM4MFWnT4IY9bN63Vrk4BIHLg
	oZY3/RBVv4MbccED54KAiHt146G8AZUd+FXH3sJjl/KJkxRFQGSlR2K+S7Szp6shl5GYXwJ9Wie
	Tq4Jh+fZoH9/jpaodfL1bokkWsJKJeW8pOBXuOIigTM7ywBA6sHEo0lxpRH3XJ8XgkC1B/6vq1u
	B/B4rbdNBFm+nqeq58tmnKnFEj34IA0F5fjt2aJn1Tb1NsnDrDxr5
X-Received: by 2002:ac8:5852:0:b0:4b5:ebe7:ac11 with SMTP id d75a77b69052e-4da4cd4a256mr186808621cf.67.1759122878448;
        Sun, 28 Sep 2025 22:14:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd7O5lpJFSBzerTdsUEWezPQulnCn79yLsStTMj5QO/EVOvS24KWmq9B0yK2E07RtXuo0U4w==
X-Received: by 2002:ac8:5852:0:b0:4b5:ebe7:ac11 with SMTP id d75a77b69052e-4da4cd4a256mr186808471cf.67.1759122877946;
        Sun, 28 Sep 2025 22:14:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7fe6b29sm26093671fa.63.2025.09.28.22.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 22:14:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Puar <vpuar@qti.qualcomm.com>
Subject: [PATCH] linux-firmware: backport the topology rename patch
Date: Mon, 29 Sep 2025 08:14:34 +0300
Message-ID: <20250929051434.2323514-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DZAaa/tW c=1 sm=1 tr=0 ts=68da15bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=p0WdMEafAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=GJFxg2uu5FJILhYF5qsA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22
 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyMiBTYWx0ZWRfX8aJpyqr4Uq28
 MShpgBWlIC3jbTghM61DBc8XfcONlKFt/JLaV8QjIZMw8ZRBt6ixLYWxLqI49rGWzj0KtM7P3Hz
 VOXIoNteVhmwMxUMzAvii/o/VYExSQ03+KgRthBOD6E9mZFVbbgZbG+KkDsNUV74Zl2Ku19yOjA
 Dc4dXN8AY2evLmAq9oVdawxG+VXDF/iSabcGsVonPuBWNZik1RXKh6t4DpxeYxYQJ+b76OJ034b
 6LGbj7QO01DCM2nAyHUO2ce8rhZISYkggl65Z16QhFhQ80QsrbjmzPd9GbRRfDmw+LWzfEaA17h
 akiPZdhGli+fr56LpUild40W9HxshT82QUaOndAqQ7C+v+LkqUXaPeJtQm8lJYiKy933Gb4j/L1
 BMokeDvt56lRPO2AKf78zkm5SzNshw==
X-Proofpoint-GUID: scpz2gimDbusOWNia9c406BJZ82bGJh3
X-Proofpoint-ORIG-GUID: scpz2gimDbusOWNia9c406BJZ82bGJh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 05:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224114

Backport the patch from the trunk, renaming topology file for one of
Qualcomm boards in order to reduce possible compatibility issues.

Cc: Vivek Puar <vpuar@qti.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...ANS-EVK-firmware-to-correct-location.patch | 39 +++++++++++++++++++
 .../linux-firmware/linux-firmware_20250917.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch
new file mode 100644
index 000000000000..01e555cbebc7
--- /dev/null
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch
@@ -0,0 +1,39 @@
+From 6625e563d600eba34cf2c71df7572ad1c421c6fd Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Thu, 18 Sep 2025 05:37:13 +0300
+Subject: [PATCH] qcom: move LEMANS EVK firmware to correct location
+
+All firmware for the Lemans platform is located under qcom/sa8775p/
+subdir. Move audio topology for Lemans EVK to the same location and
+provide (ugh) backwards-compatible symlink.
+
+Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Backport [https://gitlab.com/kernel-firmware/linux-firmware/-/commit/6625e563d600eba34cf2c71df7572ad1c421c6fd]
+---
+ WHENCE                                        |   3 ++-
+ qcom/{qcs9100 => sa8775p}/LEMANS-EVK-tplg.bin | Bin
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+ rename qcom/{qcs9100 => sa8775p}/LEMANS-EVK-tplg.bin (100%)
+
+diff --git a/WHENCE b/WHENCE
+index a93effa5008b..e22d8218959f 100644
+--- a/WHENCE
++++ b/WHENCE
+@@ -8469,7 +8469,8 @@ Originates from https://github.com/linux-msm/audioreach-topology.git
+ --------------------------------------------------------------------------
+ 
+ Driver: qcom-qcs9100 - Qualcomm ASoC topology
+-File: qcom/qcs9100/LEMANS-EVK-tplg.bin
++File: qcom/sa8775p/LEMANS-EVK-tplg.bin
++Link: qcom/qcs9100/LEMANS-EVK-tplg.bin -> ../sa8775p/LEMANS-EVK-tplg.bin
+ Version: v0.1.0
+ 
+ Licence: Redistributable. See LICENCE.linaro for details
+diff --git a/qcom/qcs9100/LEMANS-EVK-tplg.bin b/qcom/sa8775p/LEMANS-EVK-tplg.bin
+similarity index 100%
+rename from qcom/qcs9100/LEMANS-EVK-tplg.bin
+rename to qcom/sa8775p/LEMANS-EVK-tplg.bin
+-- 
+2.51.0
+
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
index 5d5a5c8caeef..7608464a32b1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
@@ -372,6 +372,7 @@ PE = "1"
 
 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
+  file://0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch \
 "
 
 BBCLASSEXTEND = "devupstream:target"
-- 
2.47.3


