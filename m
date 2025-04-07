Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5584C3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:48:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.43386.1744019301035921265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=l9V1YaEJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dxqW017537
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 09:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zt7selowXioo6Gi5XyyneJokuRQ5jdUvxtb+yM5J/aw=; b=l9V1YaEJ87LHUaVT
	4YvD1U8cxPjhFaSqh2xQHHkaJc1fvSOFA6w7+H0p7067C5CjnjB7o2jjj+91iq3d
	SZEH5GTJZScpT4a5i/40uYKcFEuAsQxPeLekepCQS9uXAv/ZWO+9XELUMtjIwGPN
	mKWrsED5AMCOyQAyMPW/JKiIwpBFFG4SCzECT9vCI7lCSm2u/eMZzL5jeQ1Xnv57
	YFNQHv2cJoVq0gXxu+Mx93VQ+MSqSgB+/gWdNqBf9YYi0kRdenD2p/9TPkYbR8Mf
	eBLh50/J8fVD46Ie1jzkeJlEZGutiv6nE45VzvwaoxNVvc5hb1oCjyI+InyblqTY
	qwdzDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3brr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff78so1251104685a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019299; x=1744624099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zt7selowXioo6Gi5XyyneJokuRQ5jdUvxtb+yM5J/aw=;
        b=i32HvGA0HJMFnE0aBVjn6pNa2ouhbEfj1vJcn+nopccmqONNAkgyvSas7hPHwbr9wZ
         rNcu57U62GGLefuk3alT4OEhhgLaBGtvrG5PzHeRn22l91UzHIeUMlFTZ9M5nuaz4sJx
         jgPlk3+2fBaEmOaOFj4yxXdqV1q+nhgK4rw9gyNbm8mKl7ksf6lXAo+RKFfCIK8QwWzB
         r9d/y2vuN13r1yyvKw9bbzysEHBkv2J55h9KHgI1Ky6D1+pMrfzWWRrwaJqiMmGTEph5
         uUtRyw4aywS5IF88zN8YU4O0FA0c+uUbfN0E+cMHu3DH1dPhlSzGP8dHZ0KOiY+iyngd
         pN+g==
X-Gm-Message-State: AOJu0YzRvJ1ytPAsv433qZEWqv9czypckMnT7kQnLyIFHSsCvxvPeqqU
	GjUVhsgJDDh9xQtOFKZJ+gNObmCNB8eHWJunU5T8p19StZBlJDCt5EPogGrmUeclwGPWjPO+Cy1
	/wdcuxweq1aHn0B3GY2QazBGI6YtLLbCX3hswvtEHpWNLrh4PSSOA/cFrUZKpK9HzmgrnYi6PHP
	B6Rt86v93aggc=
X-Gm-Gg: ASbGncvS88nnUuKkwLyPZg6sN4PHmpT3wh1QFHkwaCXNEpcG2WzYX33JkbtVIRpbx4N
	Qq+PJPsOIAfDmPhgGZSTkMvDglqdZaA52aSxdW5bRBhKs59OsbC+xw/knC0InkipGoQCVyUoyI8
	HwS0pBbptRYdj/8ahY+nhcHMUulUVvRkgNU4yTXtlAzG4ZyjiuXqvqAmDfHP2o5kWLvmJHceCSU
	w/LCYTl3f5svpzc3bIOhX7RpJPzMdw2k6p/dlp1Gt8WHxFWQ4xMRyHeJaIK/HmCkyVLnZSsWLW7
	jvvNp/gQb50KoupuA0C8tiSBDZzarxqW6gOfelEv+PQXe1CFf6awYnz4Fn3TfbbNCpNMUw/Jyai
	gkzbTzBp6bU3rWH/DhW1bsaAK7Qnk
X-Received: by 2002:a05:620a:43a2:b0:7c3:cde7:a685 with SMTP id af79cd13be357-7c774d2c989mr2067400285a.13.1744019298967;
        Mon, 07 Apr 2025 02:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXXr933x9L677vWmY61G9uYs3iC2qrk+9ECHivtxq2pULJpshsDEarLbirj1nP544/2RRSMQ==
X-Received: by 2002:a05:620a:43a2:b0:7c3:cde7:a685 with SMTP id af79cd13be357-7c774d2c989mr2067398885a.13.1744019298696;
        Mon, 07 Apr 2025 02:48:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab53fsm1216985e87.52.2025.04.07.02.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:48:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:48:10 +0300
Subject: [PATCH v6 05/13] llvm: also use llvm-config wrapper for nativesdk
 recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-mesa-25-v6-5-29bf4cae8d28@oss.qualcomm.com>
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4cayM6tuJjZmEh9NCkIWzIAK74OirFasFDapnDJu3oQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn859XrJt+H7fuX+KYyYbLtkHl102Hz5GlQM58K
 oKfchDtPeuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/OfVwAKCRCLPIo+Aiko
 1aL0B/9HfXKuRO2SNXFTQ3/qku3d8RJPWRBRnlkeMVnGjPutdM+2g22Es2S0ZiiNZfijlHNxyX9
 vd3a85V8A57/DYvqU8Acu4lNL7k0ptTw5Kju2gBvEXLuCGeee85kJ8khHsLM3enaUtY0QUXmWEC
 OJJBjUS4TUuL3zIvxqN1DgQnHfUTdCt/Gdgjr/FL7Z4EAzJqUl4DIGcJLhglcELHKJpDr718hmf
 cGU43BrXGOtKLlBXAtuG5y74qSUCZRQehZ+T26ZQYzEn/H3ZKxORxJKrKf3wNlJ1S8QDrI+lrCT
 RHX+ZDVqUVe/amwHPpwO3jS150gbuQC5NeK0BcP7XEOypYWh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: p1-DSuu57Hn0OuTeeqLxev6vfdaPoftx
X-Proofpoint-ORIG-GUID: p1-DSuu57Hn0OuTeeqLxev6vfdaPoftx
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f39f64 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gB5LcxD2NF1HxfupLLgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=684 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214434

The recipes targeting the SDK (e.g. nativesdk-mesa) should also use the
llvm-config wrapper, otherwise they get get a lot of incorrect flags,
the most offensive being the rpath, as it results in TMPDIR being a part
of the resulting binary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 8719faebe38b96d161b557a469c92490fe44f370..1ea94327161a8002453ac1aa79d7661d4da72499 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -138,6 +138,7 @@ do_install:append:class-native() {
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
 
 llvm_sysroot_preprocess() {
 	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/

-- 
2.39.5


