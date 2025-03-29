Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B6EC36014
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 20:07:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.17852.1743278844812327074
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 13:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MltELmga;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52TJrplt026666
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIhSfy/SDR/jkHbaHlF49+XBVFaur1v4uEyKSY8Df5A=; b=MltELmgaZCUlBkMd
	Xhb3IRk76b3J19ZvbehfKjhEVrjVV4i9OqVoYcWtP4wbvVwEkMxYxKtc397IyIE5
	usOsYhLE0SV3ouhHkOEW820HxTxrpMfI38iuzbT8nBhi6kdATe58QI7CZ8jj9y7q
	Xw8CJFaDgRT0AZA2BZDdNlnFCoz0/vn1WYpjpNvwXehmDFygk4IZz2k5T68Cbhf5
	ooUjIAzPocSblIGSRuBZV6d0NCm79557y2rG45+ww7FnTX9Ads9wquWU4/J2cWvR
	SC2Cwv/Ef2LiMNfCq9gdkvrxD6m46Sqsyph+U+foozW9Vc6oR37+YPmo4xQPypzx
	NOSvLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7v89bnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ac559cbaso537047685a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 13:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743278843; x=1743883643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIhSfy/SDR/jkHbaHlF49+XBVFaur1v4uEyKSY8Df5A=;
        b=a6IOSriETsqmpmwuiJvgfyGpFk+tOYLnq7XdgcOKOWs5K42RpHKjcFfCnlyr56x+7c
         JaHro7m3hQwpTQBD/5dnYJuXX5/QoO1P1Wr6+Gm39gSVjMRHnYeQkZdB+axK8EQvmALW
         tVwJ7OQkcXmCsLzAQT0fdb8TmMYWJeECHuwufs4qhsA8NLUZSIv7Q7vzRY3K9qJkjYhE
         rgOqMt5gt0n1vN/C3t3XQnGxKMg/+F/4c/hmDxu5H4t0NoodPyK6UMwCNJldjBXaHIBQ
         nm+c5/D3xovXVLoRS/32Ny9gKrV0j/1xz3krF2ZGG8do6BWptHS0pXw53ukpXyoAvGNL
         p1Ug==
X-Gm-Message-State: AOJu0Yxb78SsGaLfJLLF0IznFqk8EmkjKENqKuk2b4IwiWEiL+Oci6pB
	X3lGjTgingb1CPzimbZKKcgY+FJJkejHM6WAJjLFI0o59I7+p2iDLOq+eJyEAj4WNYlKfRU//Mz
	5bpNntKEK6crj+Dljt4pwS5WuintnXsoGOhBHObPS+rponXD0Ausu9Wjkb6TZ8t4tR4NkBPPRkG
	yoKMg=
X-Gm-Gg: ASbGncsCEz/D4of3YXAH6Q/5c4/Fbme/FDKnzxYoH2bvdbOvvA2ikKywWiLz9TElGNK
	rRVTu7dtNxxY03m4xpOwRVGt0AGpaGbPhDmUT6YdUFUQPJR4ox8B3cLRzAZyxL/Ssu2xKMx3njh
	oLMc7xLutsx2HCAB2r82nrwkw69UHHTWabhV6qcTvYMLK6YI8Y4oYy6loTwNbrCxxiJnOtwK1OM
	k58y63k7GjwAeIFHyDAMEaShmyxM+8xXTogxOb63FCsT6ftxcCkpP4BIe5mlhY5Jz43AR3rmJc/
	wdwYV29iNYsbP7GRPbcpXAE3WffkqU0Hd+OcL6bCJWClFuiv4riIbVTpIHimtdRXlNpXsesq6pv
	eV1pVZ+oN6UhLGu/izAhIaVuLJ1W+
X-Received: by 2002:a05:620a:40d1:b0:7c5:3b52:517d with SMTP id af79cd13be357-7c690893bc0mr574665885a.54.1743278843132;
        Sat, 29 Mar 2025 13:07:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVAWc0o8omBrWpyhUx8P9EapbP3JKHU/GDgQuwtDPAV+Fc2kNn2awy3dQjZNtKLhJmGnEfaQ==
X-Received: by 2002:a05:620a:40d1:b0:7c5:3b52:517d with SMTP id af79cd13be357-7c690893bc0mr574663285a.54.1743278842772;
        Sat, 29 Mar 2025 13:07:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb365sm685848e87.29.2025.03.29.13.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 13:07:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 29 Mar 2025 22:07:12 +0200
Subject: [PATCH v3 1/9] llvm: move libLLVM.so.N.M to llvm-libllvm package
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-mesa-25-v3-1-f4d0328eb867@oss.qualcomm.com>
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
In-Reply-To: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eGTibRIRqDUKSL6bHzN2H6rb0V+z74KRWUYbtuHsbiI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6FL0Rz8ZvyVa05M3widAv2y5tnHXOpjU3Jjah
 VWBK2C3ghCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+hS9AAKCRCLPIo+Aiko
 1V7cB/9XtRWfOlmVJm7y9W8aFoOvmCfUlMaZ/AszoXU0h4x5LqxcbWvIlEiOWTt4xBbTCFuJItk
 aQvbb39MNaJ+I8FBRlmHyGdf+TE44oTaaQr6epWqUaYaurXHLFSzaFDP2fiD2+iIfXjBDVf1E9l
 1YX8UGLu36WwsclZrAsP581I/jQQElH5POPctge7KmIucqU+ZRFEavJ/YozEAAQH2L1JSBVJvfa
 JLZCUJLggCPHdhaRl+4cODmzUKxQ1P5c/6Tlq1NGzjyfnRDCRjcSwLipngP22KrdxgVznyiLyql
 e5TYKEKUnZZwmkf8I0PQhgVSldlLOy9EesUnndkblQMmhyab
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: uyra_PAjpT9dcUgEIxewQku5WKIXlKET
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=67e852fb cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=sEhaxK_mCjGFFgskTosA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uyra_PAjpT9dcUgEIxewQku5WKIXlKET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=778 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503290146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213895

Neither MAJOR_VER nor MINOR_VER are defined, so libLLVM.so.N.M ends up
in the main libllvm package rather than the llvm-libllvm package, as
expected. Fix this by properly using two-component version.

Fixes: db3bf550a372 ("llvm: Update to 18.1.0 RC4")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 7ffc6ec1cb8a041f3ce1c3ac75fad30f1d793916..296a164cdd7ffb45f056c879cc5fc4fbc459caba 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
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


