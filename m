Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 193C4CD37AA
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 20:40:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5668.1778186433311135860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 13:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=etj4FUWU;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Ju3EEK03;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647E7D881424474
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 20:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fKqKdWFtZb0x+/G276zYXGJ9p/xljSpOUbF
	w9QVlVeE=; b=etj4FUWUzg5sH9Askv5/vpNguxc8XQbFgKRzQX6O5xsOkuaAqAZ
	CZObijD80DThTrwjH3mBzWkcev2KypPLatP1GPdsqLZNxOs4BygkbtjFZDdcXi8v
	GM/xa3BmfXc2r9OxcWNg8Y7MHqOOd6ASfss1NvUvm+NKVOqsOJ0uSFV9lWtoPhBC
	g0Rzaa33sLW6NGAo5tf1EjMqiZPgeWhqUXzhldXVE8s+6fLvENjlBYUTr/fE/iAx
	M4g5soMSHjR0Lv8T6MCzWKAx487DRZTets3mD/yjf485BdGoHomjxiyn8EVacUy/
	scjoWHeLp6i51Pe0J2Sqhlcr/FswWS9BUUg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfu0ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 20:40:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f2d983d109so1838348eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 13:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778186431; x=1778791231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fKqKdWFtZb0x+/G276zYXGJ9p/xljSpOUbFw9QVlVeE=;
        b=Ju3EEK039xx2O4MzEEbkm4k7rrRGDycnAfO/K5maRzUeJ6RUimFRdhyCxQxLAfU57o
         Ak1FsbcxfKQbiq/Ttos/iCwp1wrcQnLQqRwADpVjvWp+jjh1xCzIjj5H2o8AAgJXg0h3
         rN0Q0vNoBe9/S713CGWl1CpgJqoOc52nge6fMlWV2ltSfhliAPFnG5Wao9zxFtDqqyPx
         x0YYNiK1/hEhnSlVEQngyDgHO115dsqUx2ViLxQtSrmhgMbclTDLnpcS+1bAdSlwvbd7
         3HX9nXh2ujBebM2tsqEoMzrX5FbizqBShFn52h765d0zKc+CKgGih9rKZh+/U1vQ7Vc8
         oSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778186431; x=1778791231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKqKdWFtZb0x+/G276zYXGJ9p/xljSpOUbFw9QVlVeE=;
        b=Gl+mA4B10ceYAPUF56csrJiqGUNF0C880IEeQMjv9utNfTQnEBW3NAdrXOQ25Z9A+t
         OMJ/hLgYIvNgvmmtHNb/k403R7c+Js/LIoVug4x1RNVaircr1nvYM7A9eGIIROZ4EVlb
         k0tIpUC7uJNNKb7tFTYWELKxLHj1yyLRcqneEss2i2NhwvmZu5YnilKU700Cs8Rcq6ub
         ZjqYnQs43nGXDvLMEWKe+Erx06FYoFW3qIDDmkKXl8YBklndP3RgjTK3vSMdLTS9AU1b
         5QdaYvBNEfpH9PhFquUhgaXjf7tl3TcLEpVedFnTCkyr6ecBm3evBwCGUtQaSCqx/6ii
         FsSw==
X-Gm-Message-State: AOJu0Yyj22xhG/ZL+eFlg3Vj4C2Nc4n7b6q8YnLGQaAWQQKXzfYgLcQW
	6UvxnHd4KkIi6eq58yxVngs+JY1kSyc+Z00kF5b3vrl0RiBM6TyJz0wdX7f8R6VFtNHbBiHfxcS
	En7Zei71uESVzr3yQPWtUfZ1U3TxAkBY+KKo+PLIfyQ1e5rOIqy2aba3D76lltrhqlAGHDvfKAr
	I+pJ45KRSsh+5qv4o=
X-Gm-Gg: Acq92OHZr7VNdEeNUQH8w9q/lNmiIfRmocgef2zgA9klyYB3np5Mg/xqnOrgr3TQ9W4
	gYtJcYEDsjvvvY0Fn2GJt64nVXPNrOTChNFQibQ9/yTCP3kEOEurvTZxasY/2cIKVBVAaQZ5Cc6
	sKAdL442YT0nxe6JCmE9VNlOT5CQMw/pYnltSR/fqVH1BZinjAGKUgELTwA1HHuKugGFaY5BF65
	itBcEHuT2LOl432qZu72ih5z5Asug9cajgGNbv0WD7souekGVKr1OkCVNk/WD6THpZ37bNOrsXF
	xAIhUKQRVEcaDnt4xybcKNn9QlLu9AqT/p0oufy3L4N2ImKotjTsVF4uXgAOjHpe/IDXlSSOjq/
	kI9ySpNcBHCtLqCFb7l4zub1kUVsTph/48jpkahvr
X-Received: by 2002:a05:7300:6d03:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2f54b98e7edmr5029305eec.28.1778186430665;
        Thu, 07 May 2026 13:40:30 -0700 (PDT)
X-Received: by 2002:a05:7300:6d03:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2f54b98e7edmr5029281eec.28.1778186429890;
        Thu, 07 May 2026 13:40:29 -0700 (PDT)
Received: from evatuf ([187.65.214.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f84cf3a939sm174907eec.9.2026.05.07.13.40.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:40:29 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] u-boot: move DT validation yaml removal patch to common SRC_URI
Date: Thu,  7 May 2026 17:40:18 -0300
Message-ID: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fcf8c0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=5XGjxTY8yYkUmB1D1iF5Cg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=C02x5z-yhk0Clf8Jg6oA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIwOCBTYWx0ZWRfX4LTB2CDyAa6C
 DaIkr855pk9GbtOqEklw8HE10W6+rR+NEPgr9q4yCfAby98uWIdlxgH6SLcioD05Peg70DfEfLs
 WAQHsqomssQEAIDhSWczWNnYaVEZBvmK0sdxDjb3Jcezy1wHc9LpB1AofIrB4lMu8/90taHF09p
 qNFgrkBH+sUeGxCkroUPq1KYaNv2DS2KbuYkn6bIk3VQqCbm8vMNYVdoWvRzgaLHnE1tK/9VOUm
 D9JiBkoLXjlp4jOs4JZZB42jkZulH8RyzWLLeTDmPWz/GUxlr5Y3FgWJCreRsAeY/ycRViv3SBq
 +AJoL8h/x/rTQ25Da54LjzWAyb7ZZIBdUy8uzDA5raRuAyLIl12VghKJIQQUjCessyYlvJm2ouD
 YqeqXnzLUFfl1BjbVfwmthXpQeAHnqNFBUOxlN7uJuTzm/fUPWcVFZ37sKVaSYDptNU8IU1Lj9o
 0XqKVbb3UBklRAJcW/Q==
X-Proofpoint-GUID: _RQmRJa_x5jCivgRq_MfuSIL9i_4Kn3W
X-Proofpoint-ORIG-GUID: _RQmRJa_x5jCivgRq_MfuSIL9i_4Kn3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 20:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236619

Commit 5e97f3c1e2cf ("u-boot-tools: drop yaml in DT validation") added the
backport through SRC_URI_RISCV, so only RISC-V u-boot builds picked it up.

This issue is because the v1 of the patch was merged instead the v2 (which
is also not fully correct as it is not patching u-boot-tools). Drop the
patch from SRC_URI_RISCV and move it to u-boot-common.inc so it is applied
consistently to both u-boot and u-boot-tools.

Fixes: 5e97f3c1e2cf ("u-boot-tools: drop yaml in DT validation")
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 5 ++++-
 meta/recipes-bsp/u-boot/u-boot_2026.04.bb | 1 -
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 574768b9f8..15e94a4e37 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,10 @@ PE = "1"
 # repo during parse
 SRCREV = "88dc2788777babfd6322fa655df549a019aa1e69"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "\
+    git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV} \
+    file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch \
+"
 
 B = "${WORKDIR}/build"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.04.bb b/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
index 9f09d91daa..5259fd5832 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
@@ -14,7 +14,6 @@ SRC_URI_RISCV = "\
     ${@bb.utils.contains    ("TUNE_FEATURES", "d",      "file://u-boot-riscv-isa_d.cfg", "", d)} \
     ${@bb.utils.contains_any("TUNE_FEATURES", "b zbb",  "file://u-boot-riscv-isa_zbb.cfg", "", d)} \
     ${@bb.utils.contains    ("TUNE_FEATURES", "zicbom", "file://u-boot-riscv-isa_zicbom.cfg", "", d)} \
-    file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch \
     "
 
 SRC_URI:append:riscv32 = "${SRC_URI_RISCV}"
-- 
2.53.0


