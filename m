Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF47FC3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:48:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.42849.1744019296032210647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=P5INITb7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dqGl001341
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 09:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1d0cE5Am2Y6/pwqtB7RLaFoA0POG5JwuJqFgpJvFuQs=; b=P5INITb7LoeLL9ke
	5u0YBE4rAEZOrXwPqUPVeE22Qi7jASY5HtPkmMUhBK+yLRQgQyLy823f6iv340qm
	7KymyZEw8igCLYAVz1SKx0VJix+aETdt0gzPg9Ggq6zkQ0nE366PMdKZn5H8rdpf
	OSn23p1ARsr9wBPo2bzJi8aQZvAqcmyCa09I8N3mEM8U+cKEBQmTMhf88UZvs3R/
	/GIw88Q/aqP43aVIbbTIoogBvzHTv33IzPVrUfRCXG4B0bSxVFO4rFH0/fpSTc9T
	vBNerPwXoT7lcl4Cj76VK6gpVPMHtZzSWF8dVmL7TK9Kc9qrmxt18bwvEUeU9fod
	mg1B6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkbrdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3c5e92d41so690073785a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019294; x=1744624094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1d0cE5Am2Y6/pwqtB7RLaFoA0POG5JwuJqFgpJvFuQs=;
        b=JPoKYris+6sxTb5Wp/cZVw7+ejnzQPCFQghydzJsfhyAtNKKuAeiwf32kQLPNAxCrA
         yFrZfagb52TvhTOX56O6chJsM11BRdHqZgOUZyMqwR9CvI2/7VXOc5YB0b2iseddecKB
         1Hs5vf7qqNW/7P6sJXYLbEf5coTqvek/Di+pXQ7yXR6oaDTy/UwMOlWd8tNLWuE2Wuk1
         rO/p3EPksVZINpc2R6ehnP7d0TVTxIM1cabrazlbf3ISAkNq2ReN8fl+GFOCHwNElaLU
         DNkAThB/QOZhQw9Jp3XGoX4w6XX/8Uh5z0RKoFG/pFT3WpavgPMQRFNlgCiB9484VK5t
         OuCw==
X-Gm-Message-State: AOJu0YxgFiJ3pwOjrVvRM8+sYcg8fd4aW0KkDnGljsb6o0A0iqb5cAVA
	YyARhB2Lh9wr1Tjba9bpSNwhszBATvV3WHv4gVTnTzUfk8q17UAsH/TjAALzmXH4+vAyJ5rOJQV
	TZBiakKCNfL7DIs53cpB9JBo7vR15cT0Ez3rO5Vm3sUhHqYHovt5XBRuKdeSUk0ynJ21GxBmC0Q
	qFOrYHHXVPnqY=
X-Gm-Gg: ASbGnct92bYR9R2g866cuS10jeHklRAk2vlYhrZKagASHE2otI20KMqqBSOHHw5ext1
	cj3oba0Q9WYvRChguse8g8bC5rkY8fWWUiFWXTmLPm+VWchraR1Ox3qk+4HJunnLXzeFPrgoU4V
	/6npqMxTiwSLAaQY9p2QBd98MT2WNbU7eeQfhneboYgIl+8W2kcdsO+NkJjMImnIjPjOG9+FxGs
	0WTW9z9XkHhl0t8z4+Tlw7l2I/4GbiwgS2Ek93mD867IMXHVrMmUjbJwlxDb64NOmQlwpkj/z6g
	SbFozqh8ZwEDihMDwMepJwnb3YbeU+58tlIwT6iDb///LFL3lPGMPLgrzB4K10tvL8uVamAVu9T
	0FA/s4s4FtPsDqoaVFb4EU5H5zor6
X-Received: by 2002:a05:620a:40d0:b0:7c5:57d6:ce3c with SMTP id af79cd13be357-7c77dd61f0bmr1138451985a.22.1744019293799;
        Mon, 07 Apr 2025 02:48:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0VytXbWM+C11J5DuBtRYyengLWHmBq5iJy1rh/oIOAma54KF0yCHOObZNOT7bzC/Q8MX+dA==
X-Received: by 2002:a05:620a:40d0:b0:7c5:57d6:ce3c with SMTP id af79cd13be357-7c77dd61f0bmr1138450785a.22.1744019293488;
        Mon, 07 Apr 2025 02:48:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab53fsm1216985e87.52.2025.04.07.02.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:48:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:48:07 +0300
Subject: [PATCH v6 02/13] llvm: move libLLVM.so.N.M to llvm-libllvm package
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-mesa-25-v6-2-29bf4cae8d28@oss.qualcomm.com>
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cw48dZ0EB/mqrjyTkxQ6kJ8lX3vxhmwkpNaF3KTcj8U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn859Wk0UT/ICe/1Y6N3fguigTTjDDM9u+6IVTA
 ZtD6VpDcqiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/OfVgAKCRCLPIo+Aiko
 1REVCACcl6Fx1EzsHjNMIrbv8pzsxiqI15VO+3GzF4xxHdjO8g/FNjnPa5D4pi0TGjydz3Zvysp
 Wj5hUNwj3S5ppyn66IXKk+CIqAqvKX9hXvanEdPmA8X+48zLj7ZZBb7CgPCWdIBzfJJhaqenHgV
 9P+w2aevd3XyLpAbNdSoYUU3S4DfPcBlRBifonhhfTG/mqPcB3/gHLOASnwfrlqytH6xdbv2kDl
 MnRU+Cf1kzJfzXJxCLV3AzJ7SC6o1I+DSRD4PV4r3dCXdHQjFjcCW1ecw9Yat27p+NG6rDDMEPA
 00xC/9WvE1hOxBDl0LpozmKPtH1dZ0mBxIlaTpTnMloLCYGH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: THX6w5eunRZRAPI0IZB-KI3hjpLqmnSw
X-Proofpoint-ORIG-GUID: THX6w5eunRZRAPI0IZB-KI3hjpLqmnSw
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f39f5f cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=UXYEonSiWARR60OBTlUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=753 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214431

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


