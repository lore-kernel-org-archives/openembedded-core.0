Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67202C369A4
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:54:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.25474.1744253696167716695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ff4Vknf6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539IKL91029024
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1d0cE5Am2Y6/pwqtB7RLaFoA0POG5JwuJqFgpJvFuQs=; b=Ff4Vknf679sy9qlU
	8PyFQYEFzU8MykSc0TBG96QqpKv+XBQyUclMgqrwI1G4lwCOcoeR2ScBKbE8pwsT
	H8e8K0mxYg79v+aHZNvU0Zg143n7esC+urpec+oMe/j48w72YiJanhm4SZX1gVAf
	rEvI31HgpaFQp1r2B4vr0eM4c0opxBCNR9eD2atzbjycSxG6gi1UqzksEiK78xQS
	iIg1um+2gku2xtWjlNLpy6rHDR29Og/luockmGCvZThDPy/s8m9TYHV/YeroYSnW
	fBCgAOK+hNLSWvSUI1DwhEGYvTKWn1fHmgFG0l1hdtNk45ASj+VF1Hr0YoUTqH8/
	7tWBWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmdbds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:54:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e9f6e00so220741085a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 19:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744253694; x=1744858494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1d0cE5Am2Y6/pwqtB7RLaFoA0POG5JwuJqFgpJvFuQs=;
        b=Ko+tIoQr23TDxNGTMv1GLC6xqfaOsClsY5nIhOFB27KYtcDPuNmENnPSGmoyMH9Um6
         JZnNYpHsB+XLYscF7EpAoqHUgtnMVnpgihrV+plHixEM6uSwLiIuY9IdnStgwjoebR/a
         efr2Nmb6TxpjwnouEcMVfXgVmq5tV48I4g05MMDFtFgCFF6LVBpRusWHzdPW5oB/NpkG
         to9AWDI6UcVbmCmDEJnAHrrGLVdDteZ/08wZlrVN5iDJQURpO72E7bItshFlIv/OHF42
         DvLhwtr85ekmZYoEGjdi0x49WXL2QHyd3L3pbcOCH52fokIMdT4GpuCjWqUBreClwTXH
         HhJg==
X-Gm-Message-State: AOJu0YxfAnXq2QN6Aj6R+kEN1KdoF+KO1Opao+frfYdUqRAwwtLM1dAu
	ASi6Vh9pbjjMumJnyT0+GWVPQGjJUXG9R0AwST63ICjDORdWMNkodj4MVJ2bemTSUpJSADwg+j7
	1rVWLz21eR3fVgvDfFc6+jfj79z6e3WVy0AvseYI1dBx/VdHape+Q4zYYeXjIPJtkEqj8QaM9Qf
	e710rZCz2yG+8=
X-Gm-Gg: ASbGncv805lZ5Y8IhhMK/oN09n9FBcs9VFH05/Fd764zrS2PDe5mxIxBmqdncX+BtCu
	2uKwPmU9SO1j9b1lrkdh+6TTv7KEFjHJwVlU+9yl4Uqn+HKGaEoJdQe//I1gv7FnDhXIO+gvaXq
	+vgRJ5jMLKRvuNh4zVmI3Fm/g1M8Yu6LhCWa3EfBeZRVc+aZJziRBg54gu+wAVuK8lz988DBzlI
	4WXyT7Jnrsh32IZISJ4k5eq1YwNX0+hNIHhaRsTXxMGw4UnqGgaYvWLkqCJ6LsJ4wIn5zKP2SlY
	bcSi2Cr2HxAc78fjiuZ8IM5Ijd4J1SEVnJZwM3kdg8V3X0kW597sMMGyyoV1ZEYYz6GZb3ksweN
	On7eyYYEtg9rz+F5xVdwxWXRa
X-Received: by 2002:a05:620a:319a:b0:7c0:5b5d:c82b with SMTP id af79cd13be357-7c7a76c74femr165575785a.28.1744253694142;
        Wed, 09 Apr 2025 19:54:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqbr/tM1QrN4Xbdfz1dUPlw5Ipks7aaqt8bV5bhphh9yJ1ct9lrKVBgJY0K2nb4aptlKPtbQ==
X-Received: by 2002:a05:620a:319a:b0:7c0:5b5d:c82b with SMTP id af79cd13be357-7c7a76c74femr165574385a.28.1744253693797;
        Wed, 09 Apr 2025 19:54:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123197sm24032e87.44.2025.04.09.19.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 19:54:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 05:54:41 +0300
Subject: [PATCH v7 02/12] llvm: move libLLVM.so.N.M to llvm-libllvm package
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-mesa-25-v7-2-59d715c66e19@oss.qualcomm.com>
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
In-Reply-To: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cw48dZ0EB/mqrjyTkxQ6kJ8lX3vxhmwkpNaF3KTcj8U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9zLwP7HyixH1ambvxw3S+wBeDxXGwsy/muVmv
 14a2MyBLBSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/cy8AAKCRCLPIo+Aiko
 1RZuCACU3fGoYdak6PRfZkujcgG/XJptXlP9k97f7Lfag+EWLz3gfI6hZRzX2SeqJFxCf6HT52Y
 qXr2Y8DtLxPuIAQKNkpkpZp5r3yG2SdJPlCyG0H9FLWBYxBuRUvAeCoydcgsp2i+EoaZ29pnDrA
 sZm4McwI8yaG6JGENKPLUVJ6AYFCqFobb1PaR++iqLRy/6uPP2CMP1NCmGvT2Xn5mQ9Btgp2Ue4
 qtM6O/iTlRdJzZ3PMUzbAanuejKxbqUBmfnG5sIX08MznG5MsTBtrte5/7qSJYqCjUect+xkXmj
 jjXhoSzZPSX6JfgE9eC8jT/j7r+hwcEEbzI8vokj8e7Kexv4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: SJjpAMNogcJm3OvcnPRxXbw7kVreSMny
X-Proofpoint-ORIG-GUID: SJjpAMNogcJm3OvcnPRxXbw7kVreSMny
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f732ff cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=UXYEonSiWARR60OBTlUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=812 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214604

Neither MAJOR_VER nor MINOR_VER are defined, so libLLVM.so.N.M ends up
in the main libllvm package rather than the llvm-libllvm package, as
expected. Fix this by properly using two-component version.

Fixes: db3bf550a372 ("llvm: Update to 18.1.0 RC4")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 5c6c5a2ffd19fbd8ee5e139179c23c447253919e..194660fdad1f8837eedce3293d56e7251e5030b7 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -19,6 +19,7 @@ VER_SUFFIX = ""
 PV .= "${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
+MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 
 LLVM_RELEASE = "${PV}"
 
@@ -152,7 +153,7 @@ FILES:${PN}-bugpointpasses = "\
 
 FILES:${PN}-libllvm = "\
     ${libdir}/libLLVM-${MAJOR_VERSION}.so \
-    ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
+    ${libdir}/libLLVM.so.${MAJ_MIN_VERSION} \
 "
 
 FILES:${PN}-liblto += "\

-- 
2.39.5


