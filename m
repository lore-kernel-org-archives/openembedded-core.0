Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652FCC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 15:18:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.11409.1743607117539057501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 08:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=U6bcBnvI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532D0IQ8023769
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 15:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7J47L+zwOpRLo4MreuwV4e/sb85z4jvSQbX1G4Lbzb0=; b=U6bcBnvIllSe1KY0
	zzUMWUAMC8Cb3tFbBBKwKLKBGKKufTqMKhtBVqLiXiitaQANMNY/KXcQVWPEKhBh
	sLBUZSA441eZX3SExj79PmuA9enBdTG3HfH70z3x7t0JMeDWO07plOcu5AvuXbxm
	vCAKmgV7YFGGSmKnGpoqQDpAuvEGxmoVWUvR5QkEsz2+Va5837WaK4Y+mTeDD0s7
	QYaiaqSEqdNt3aXtiBFaSMls1mzKtVoracptD7ysOBnbSXKje+vx5K7jIjG0IdJ5
	8CbgvQBPIOt5e0nY5iJwPm/8QTvNFCAwRGv8nepWv2pFLc89a+QpOpvB37vOBHaE
	pnidBg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxapssk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so351842585a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607116; x=1744211916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7J47L+zwOpRLo4MreuwV4e/sb85z4jvSQbX1G4Lbzb0=;
        b=Y++7vAT3eP46mwqqMjIF5oNJFMQ2uYvQfoHbi1c2dwuS75iT8KNBeCmZ7jk7rZzsBE
         nqZsBQUHGckQg1M+2yoifn4Kym4YvW4jYg+HNOw/So/9xgYM3M6rrMSrZzKvPfQG90w0
         5weYDKD+1Jn+snjmD1VlERcFEuQV35S0KDSD23ou00Xxok1gUr232amnVBRQ2Dpz5EIX
         x/4q2vqWiA8WrVhrsNDrtDvfSbxGoV2NkvzSTlqyl1cSnid5l0F3W10snuJXTyfV4cCD
         55tPDlngE/zZ2pk/+p/ch2CIqDFwnD2NBquoTp87fNILpNxWw4hIBycyRT1UvMt/3HOK
         qxgQ==
X-Gm-Message-State: AOJu0YwlIWIzT7cE4gjUAGHEhCeIk9aD2ctq3pH6rjUTa0pNFfK+Hbfv
	ZnEs/ftUwthW5as8A1LfAYyJ1JpcP3JchA7pdDCHdyeAAM5MebZkOcxuO5otJ5dGn/xV7Zis/TR
	GBaJ0IuI5JvXr4ZSmbB2kzeE/r0ldXrqAQ+y/qAuKbFr5+mz0wHTWE02VS1PPceZ+HD8vjpTfBx
	BSUN8=
X-Gm-Gg: ASbGncvbrGv5dIvQi/XF/Q5j9iHeHKHcFgeCmr0Ur6hl+hhd/T4YP8VxuVJ9IUjqMdG
	cv8320+A/tnSl5t4q0I2M9pkZI8D2gCsWleMnnV0+xFGXi0QVIJfNMLyaFlylLc6KuzstGCtQyz
	CaWI5Cq2R7/M5gLf4c/Xz0Lf9WPoLO3pzwhl/L6H8a6qROwgLBrf18xrKfEgmKsPdUy4g+C/1Wg
	AWnulUNNt/P6PjAvA2MMHw7hZU2TbXWZGaj4PXLSKhVFMh5GfE8werUSni/hAOY12HGX+EQFkna
	eWZUF7PagUrjiae9sCCIqZnPwPIhqvZgdlMb58Su1OlnXMLDeP4NPeMZwn7pSgo20n6IIh1Vglh
	S/QKHgn+6ZbAjPPX+hQp3n7WQhxGl
X-Received: by 2002:a05:620a:f11:b0:7c5:5670:bd6a with SMTP id af79cd13be357-7c69072dd4fmr2263112085a.24.1743607115870;
        Wed, 02 Apr 2025 08:18:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3xV8+cQ1QkdhtRKsZqJpiWJkpf0QNYy5xqtQ0s2g42h51lNTYhLJ6A0nmJ9fKtC1CzQMTCg==
X-Received: by 2002:a05:620a:f11:b0:7c5:5670:bd6a with SMTP id af79cd13be357-7c69072dd4fmr2263108485a.24.1743607115550;
        Wed, 02 Apr 2025 08:18:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd35925d7sm19946371fa.91.2025.04.02.08.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:18:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 18:18:27 +0300
Subject: [PATCH v5 05/11] llvm: also use llvm-config wrapper for nativesdk
 recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-mesa-25-v5-5-ab35f021a83b@oss.qualcomm.com>
References: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
In-Reply-To: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lvHFxfWojx4YFoCxuoF2UZUlSlA3hAMgbD6jpGhXbeI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn7VVA2Rb8nuxWpItQkty/0EMp/nUzoGZ9LuwPj
 APZzsfTRr6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+1VQAAKCRCLPIo+Aiko
 1fvKB/92oNznJI5umcpJ2RdaNi3n8sDGPG/cgTUTFmOZcNRz8rBq5/AAlT36yTwghBj1i5hMB84
 X7gYY54vz8jxkCIv0rFFF1aWBGNetcss98/BVdEU2Y+Ptf3/eoukSljpVZ8DpArYY376YSF8/4u
 U6cCG+ZJ4jBg12DonZJ6NO3EGMn4Imfzuc7THdsi1Q+9erJYA8sN7rHlYu0gJgg7RMQOghrrRiF
 vhw4W2/a4ostb/4gWgbeAyHDAtYBebubyznK/ie6NsjNIiWFtOHaaFOegDODrKSo7uXa+/Nz61m
 drfS9al6Tb8yA+fXuE1k/NZZOj+X0wjl+h/hw/E/F6qx8cJe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67ed554d cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=oZP-O3FlLgu2oLpOfcYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ryVbKc1WXcKqgJ5UebJ1ZtxbX-GAzM67
X-Proofpoint-GUID: ryVbKc1WXcKqgJ5UebJ1ZtxbX-GAzM67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=683
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214273

The recipes targeting the SDK (e.g. nativesdk-mesa) should also use the
llvm-config wrapper, otherwise they get get a lot of incorrect flags,
the most offensive being the rpath, as it results in TMPDIR being a part
of the resulting binary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 7470d2b4d8a55868fe5d2e88f5843a2ec3faf7c0..c1c4138e8cc16b8b4ddfa3355a6141b5fede569d 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -138,6 +138,7 @@ do_install:append:class-native() {
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
 
 llvm_sysroot_preprocess() {
 	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/

-- 
2.39.5


