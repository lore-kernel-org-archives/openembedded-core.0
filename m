Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AA7D116F1
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 00:50:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7121.1764636595435147542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 16:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Vmty2gFU;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=kxe7szdP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1KsClO1376059
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Dec 2025 00:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z3lgBfPjouvUsUfnDeV3nbS0j74/+/DZSGp
	QAba9QOc=; b=Vmty2gFUNykqOibwFhyj6owxbquQLb6v1BcfsYzL2VUlqISrJRq
	voNmDhkPgBDD2bD4lx2pLrseqOo6Q4FkEHimI5yYDrp6698LxcFgUKMG41wd+Bw/
	FDhsy0SYPTs9UeWJaA9GCD5p+lMSSdZmN4bVGx0fHX6GEfWhcgvYDPT/M2skC1rJ
	GIrzttECqHmeJkcqL3t3ltVJOYXb3dC4RNTXYMbEc07TTy5pL6SiU+8vx03CZSlC
	e0HY3CUUV6gIDAEx4FdOrzniDTvqPeGWbGVfLBRjzuOmtqBRsHyRY2TSl4lRyAeR
	O+cR9nKD+rQgN16Q463Qr27AQZoK23t3bKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asjf78k7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 00:49:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2f0be2cf0so1424114285a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 16:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764636593; x=1765241393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3lgBfPjouvUsUfnDeV3nbS0j74/+/DZSGpQAba9QOc=;
        b=kxe7szdP/G8rNYVXukv4zcmy0TI4owHu7Q48yCJ1ik3k6EQ+0wpd+dtafhtWp1DSJA
         2b/PnkMeiyrrPmMr/DwUuzk2Rl7OLa1wv9KiStENzn4eWckWWBQBHJvIFMjQsxCKbmX4
         OTRW+Fg8Obwsa3UoHqoK3Sbd+9dQS8LnAemhU0Nnb/R+ZoGXZ0j2ByD4G2u888fUkj8F
         /oV4+IgiKFCFybubMbM1ei01e3yPU5740bvFREkTYpqOuCVRXmVhvFVjCr0k6zHaJTyh
         0QXZeVXfmD+L202LptUaz9ih64ZZxO3f4HwwfQOvw6vr4Gb3/7YoZyg+njxuBd+SZMS9
         29xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764636593; x=1765241393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3lgBfPjouvUsUfnDeV3nbS0j74/+/DZSGpQAba9QOc=;
        b=KOFqo+M/zP1GCDPoSFQya5LMNzZgLdwrofHpGvMkseIuCYHgIE6K1LpkH6QMEmOsyx
         cEj3LzIB6YSxaumDt1TBZrDWB0BtpdS7pDwiw8RoMqFnjwNkGvZx7jjOZ5vg/ADvKJGb
         lRnk1qJTZ3tgzNSej2+cFoOsY/ucmNEY2zfflXzqjfn8T6QSMElfHLcghwPtXNFJR4F4
         bM+KuAAYA6Le3e0ra1DdIpWrSnPJxltbjRYBt3r4eKg8Fp3qkedIPj8c1bhoHLFg8inh
         shi7J3Ba20p7nZ89wdwkL/7tyQ3HaotkHM7z/tG4pquAO6v9iwcsU55zH8dUBK0d+kI8
         fkOg==
X-Gm-Message-State: AOJu0Yx2EQqmpYsfdOxt5dr2gkEuZhV/tXS9Tmv3DpcOXK02EuNgz/Gw
	p18oSKAC6/KMj9rKQ1GYx62SkTT8RehMicaI2R/XKHZpK0ICOMxL5N5MUbJqcONvfxBMsHXqGa7
	FCieUrog6CCqU97jotOrqXYkU462ZSccxFEapaSh4OeuB7tn/IZB82B28yN2QT+1I77Y6nJNm0M
	42ShM06nQVlGDO2xQ=
X-Gm-Gg: ASbGnctAfnn6jHU2LK6SKMzuwaCckoa4qCQyaoXALiSdpwDrgMeimDQ2jlXsAACzqWo
	8mpiZHP0Nj+HNboJOlHkpJdy0h6h2x2/YHj4tl92zG9KzMCOVCarLawIbUfIjvmd8neu6R+U/34
	0zWliQIJGov5Bm/xYaVnrlqf8xjJU16XRsf7LQ24/Rto+Rsf9JcAR4O3QwexeH95gBAgrD748im
	mUEFMkmOWZBOre959IPVVNlRbE1ubMyB4w7sn6VPRoCdURH2ce4IqOcWFgdnbhSaOpAGI3004Kd
	VpfPTyDbUoVODaZWsi3ir9SRqXj7pMgaFD3end3iUkAbsw0/exjWkSyQkDlgxpyCiNkMe3Slwql
	hnEPSBMEoeYRohpMhzpXD5RWCQgzzCCjBs5HG0tEWqNAKIWpkFyKCTBC4B3jMB5G0RdcCE3Lxe3
	xD+Qr9Xk+9niFHVICHUzcqaDQ=
X-Received: by 2002:a05:620a:46a0:b0:8b2:7165:544f with SMTP id af79cd13be357-8b33d1fd878mr5597172185a.25.1764636593314;
        Mon, 01 Dec 2025 16:49:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4oZgyZRhmeTnP3vmTwJRBk/kVfVWE3XYsCu0GJw3VaDJiQSuofxgQATVmj34YIaERGeb8HA==
X-Received: by 2002:a05:620a:46a0:b0:8b2:7165:544f with SMTP id af79cd13be357-8b33d1fd878mr5597168385a.25.1764636592738;
        Mon, 01 Dec 2025 16:49:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48d67sm4058173e87.74.2025.12.01.16.49.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 16:49:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] mesa: fix drivers sorting order
Date: Tue,  2 Dec 2025 02:49:48 +0200
Message-ID: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BbYN3GXZ74cZQpAypfeTm0r1xmzoEYWF
X-Authority-Analysis: v=2.4 cv=VfH6/Vp9 c=1 sm=1 tr=0 ts=692e37b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Y1Gw0ai7vHqnVpeTwoQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAwMyBTYWx0ZWRfXym2m7xNsv05A
 I3S0xRTYngIS4XCAXuYEILRT3miLUWhVB71oRcJW/+Ecj5dPmrKu85YHvG+YaVcQqYXrRTeFx3S
 AExqSbohpPcK4rEuNPoGGkT0PJ2mZbp0leiJ77rJX6Y+VGymiLZhiK4DZastQXedfASvogjG7CG
 iQIrw1kp3OCnaQ8zBH/qAWA+CvjgjOBJkC/BFjW3iZgv97bZRTgv5ny+lRuPBWb9z+CYi5As6gS
 VfidowQVHCGxhzGSHy5T1SZROosXbMHpZIxix1Zr3whOKBfuozlU06o1mc+pIuTDC/Asf7zAx9b
 6DO4gE/lHGi6Aa862Ghea9dWhHEAyeUY/G4AXE1+F2jVx++PLUSSXqbqw7k8CJQVl89PYps8E0d
 XFvBNE/sXaW7rAGjDfnY5rCkdrvsng==
X-Proofpoint-GUID: BbYN3GXZ74cZQpAypfeTm0r1xmzoEYWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 00:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227141

Fix few issues that were left unnoticed or breaking sorting order.

Fixes: 64108679ada8 ("mesa: sort out driver lists")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3124db09864c..0cb7b504f485 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -129,8 +129,8 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom'
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
-VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
@@ -180,9 +180,9 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r
 GALLIUMDRIVERS .= "${GALLIUMDRIVERS_SOFTPIPE}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',svga', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
-- 
2.47.3


