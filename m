Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD872CD4F5B
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 00:22:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1715.1779236533518018711
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 17:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gGk6ASVD;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dQPvBM3/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JN5cg01636909
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 00:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NfdhxPy+CJw
	MqZfWW9wGfRBVNLuV9s+7nlmxexlHUm8=; b=gGk6ASVDdpkG6m18p9lc4UnCqxE
	aPTMVIopc0QqG8dpyyKpy6BNi42F283dGBtk9Sgkc0mRjlUuTTKDqRRvkbVv171b
	RjKemQKje7K5vhP4DkRiqQNo9/bVNmhSEWN2jDnROz0e7gtQP+rgSSb6AK4j0YhW
	30P8HyOFZ4KS/b7VQ++Q+L/kJ5bIHIbgMYBsBAePpWGpzMOjyvJamd1R+plLp0Lf
	FKb0R/J8qWGj/7WAK+Ep5PK86qcgRmJFX9RZ5jqJ3uFn1RF/MM2y7QGHwhhIJdIl
	dO3i4CNyFr10k2hcKjD5HbbbxbgHwDJ6PpiVpZNtWsXcD3spKDpE1adMzQw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sa2vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 00:22:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8bc5ab12bb5so151241876d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 17:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779236532; x=1779841332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfdhxPy+CJwMqZfWW9wGfRBVNLuV9s+7nlmxexlHUm8=;
        b=dQPvBM3/0ny4qhAtbb9Ip+wkKrjIJXlEyud/z5CnGIFkU3+C9SVcLAxGz4TppRGY8v
         YUT69xSmIVDb/WJ/o4UxwG6IfEjzqiVhSOSVzbb9T6XSxm6R0WFwAZTw4IRpveBPgOyz
         NCxFg/khKfxnc3FTL0ReH9kkcWoAbI3zMisd6hYBreVF4oGd4XZ5huUGF2wzgWP2QQV6
         /tEftKB4HaFdg7RMMvumk8/60J44Wwwb5IiI6uv2Jm1zfXPZk0JF+4ikXH0nPulTGR8F
         6HYjTIWNuB89UPq50VfqIOmcAmh8hBkWB98TJFH/9zYpov6zSnj+Alm7AxdNPpmLzeJS
         uLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779236532; x=1779841332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NfdhxPy+CJwMqZfWW9wGfRBVNLuV9s+7nlmxexlHUm8=;
        b=RCuQ2xAw4zxNkfr0/2RgcjUra2R4LAwKMbVGjU6fkAmCdSNwciYAfq0dOkPaQckNG8
         y/totDQ4nEyYaXfBF8oRPR2lSotGoz1lwqAx5gLxPmJFhYdQbb5jzFBNI0runpnX+1Do
         jl2PKQQatlAuEeuIwMOgaBpT5zjqhqWowqfOsMGge5vGqow/IWkubk6KvHU5Lpfj+jV3
         vJp5TGleOx+N9zbQtr3okEI7sDh37AmLM3pxLriG98buG6x6VvUisp5DtsPpMg9v3sYd
         VCL3EaJeLIJ1COw1GAOIx/8dfEP21yKk/lsyr7asJD+Prr5HEoN5oMO4059cyeLTvu9G
         3AoQ==
X-Gm-Message-State: AOJu0Yz9i7061dsVn8zniqptUc7+MHFXq7cBHjROLm/fWuOQOhLxoB7Y
	FpYbVbZc4jPY30dS7Wxt4E1rf0OT0sv1mbGGVidUCqyo9DkTvaL56aMljrAcL8hUXKg6H6xdZhz
	q7NXXYt+GLsw93sO22CcFy7qIVa8pcGo7m0eCzwQNx72l554cCIjESMujvQdim/7ml+nur1gFXd
	cmyEi2ra2RYAM4BJY=
X-Gm-Gg: Acq92OEE4545jfDySkUvIAiWJbDU7cvDYp/xzgCeZpf6Bwl6PX+3L3Cs+qO9GNM6SI3
	NwD4nOjPCRVxlpZ5OaDugN+zTCTreX9k6ccFYk12XYjtCuf24unVkbL10imevsUP6hm6Xyuf0g2
	Hr1H7+dtJRHAwPS+7+nK+m1LOzMPfgBUxq0eAaUlXv+GB7oETUypbadjHBKkVa2Hl8KG9ZC6Vnm
	tlnltb1lACaDzXNc51WelfUN7MpmKUl3QEcS6APYM4gN3iW8+U6OtTeSk0unvXxbU1KUMBKRUd2
	wq1sX1R9+jpMUeINXSFNNFRGjIl/CMA/kI2gbGMi6Q4yNnRbcIfWeKEc8kejxXPHHPU0AW1heoQ
	PwqepxN/GtpUZS7N0f15RKb/qJJ70tg==
X-Received: by 2002:a05:6214:2f8e:b0:8ae:62aa:665a with SMTP id 6a1803df08f44-8ca0f6f4d04mr356479656d6.28.1779236531721;
        Tue, 19 May 2026 17:22:11 -0700 (PDT)
X-Received: by 2002:a05:6214:2f8e:b0:8ae:62aa:665a with SMTP id 6a1803df08f44-8ca0f6f4d04mr356479206d6.28.1779236531208;
        Tue, 19 May 2026 17:22:11 -0700 (PDT)
Received: from evatuf ([187.65.214.56])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca361bcb15sm114103686d6.47.2026.05.19.17.22.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 17:22:10 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] u-boot: move DT validation yaml removal patch to SRC_URI
Date: Tue, 19 May 2026 21:21:52 -0300
Message-ID: <20260520002152.1262987-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAwMiBTYWx0ZWRfX6f0wryHBNo1J
 BcBardo0ZVT7TFHyJqDJHuxf9Yod5t2VpXyjm4qdCo7ZFnUnpyd8PwXBjjjlo85j9+WaTdRPnnu
 3kAhutcFyY/YF38lCwW/QymbSfcrBX7nsPc9M/Ec6auP48sd5vw8fcBC2JKPhAikJ4vZIsNlIl8
 Q1ORpfhLVd3P8/Ep0OsYx7g0iE9KIobEC6Wfo6XEW5eGq3QGlwqECURAPGXgb5WZLo0a8yrsGLw
 a+qyBpJPlrrPD3eruf6JBsPSN/2DoN/BHJN5BIuR4RN5p6MSU9LVsim1aD9/oQQPZ+QqT20/ffj
 J4jxFLZZJPrJoCrpb2B3reIKrQVznq45/dkXYNADJFx8gNFlxaBZHf8ZCW0sslgxOT51UUGYf/X
 y5PiZLmLOm9haMvWaaV3p16FXMJIdK0yaCKunhG9E3yLJ8xYXypjgETvPjbBJ40YXg0f4uH4swW
 lR8zCKUwzU0vAlO9itA==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0cfeb4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=5XGjxTY8yYkUmB1D1iF5Cg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=RpjGLFKxrAaNBhxWzbMA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: cDQKujvj1hJQYPeJC5Kp7y-0-cA4ssPj
X-Proofpoint-ORIG-GUID: cDQKujvj1hJQYPeJC5Kp7y-0-cA4ssPj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 00:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237376

Commit 5e97f3c1e2cf ("u-boot-tools: drop yaml in DT validation") added the
backport through SRC_URI_RISCV, so only RISC-V u-boot builds picked it up.

This issue is because the v1 of the patch was merged instead the v2 (which
is also not fully correct as it is not patching u-boot-tools). Drop the
patch from SRC_URI_RISCV and add it directly to both u-boot_2026.04.bb and
u-boot-tools_2026.04.bb, so it is applied to both recipes without
affecting external recipes including u-boot-common.inc.

Fixes: 5e97f3c1e2cf ("u-boot-tools: drop yaml in DT validation")
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
v2:
- Add patch to both u-boot_2026.04.bb and u-boot-tools_2026.04.bb to avoid
  breaking recipes including u-boot-common.inc.

 meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb | 2 ++
 meta/recipes-bsp/u-boot/u-boot_2026.04.bb       | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
index 7eaf721ca8..6c3ef7efd1 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
@@ -1,2 +1,4 @@
 require u-boot-common.inc
 require u-boot-tools.inc
+
+SRC_URI += "file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.04.bb b/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
index 9f09d91daa..92ced8079d 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
@@ -3,6 +3,8 @@ require u-boot.inc
 
 DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
 
+SRC_URI += "file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch"
+
 # workarounds for aarch64 kvm qemu boot regressions
 SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
 SRC_URI:append:genericarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
@@ -14,7 +16,6 @@ SRC_URI_RISCV = "\
     ${@bb.utils.contains    ("TUNE_FEATURES", "d",      "file://u-boot-riscv-isa_d.cfg", "", d)} \
     ${@bb.utils.contains_any("TUNE_FEATURES", "b zbb",  "file://u-boot-riscv-isa_zbb.cfg", "", d)} \
     ${@bb.utils.contains    ("TUNE_FEATURES", "zicbom", "file://u-boot-riscv-isa_zicbom.cfg", "", d)} \
-    file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch \
     "
 
 SRC_URI:append:riscv32 = "${SRC_URI_RISCV}"
-- 
2.53.0


