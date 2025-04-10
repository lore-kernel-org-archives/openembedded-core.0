Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DF4C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:55:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.25475.1744253697297989787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fiLKW1lM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HDr61027515
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mxVIQywhiZ9YOuUBkpl3wuYcNsg05g4TxVdzCoz5Ol0=; b=fiLKW1lMO7DIoAxp
	a2gwp/31foaqNCY2XYUQheXM5jRr+lX1TOJ29FKQ+0Eq1JXus8UV5/KYUWBgsajb
	xonqlvkRWK8cyqcmeZsG+NG6j6RaQc0r2k5Vve74dyZsAdOJ0kQsaZrJoFOH7AS4
	OVHziOq0LqfvFkacAKhySYUxA4kHtRK4PSsBG3/nssbRL+Upo1JuxYtyAg670bU5
	zqdFDoejZqBUcZ1seh1hCwJI6lWhGbbGij0mcvoZdmjP3fMHiYZGX0kAMsCJ8f1R
	+x+7wY3U/Psq9+BdUl3DE9wYKnPt62aI2bNNgnCiFdkwljIfKKHMqRK3efi/l6/1
	KFlsSg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrnh57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:54:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff55so91638385a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 19:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744253695; x=1744858495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxVIQywhiZ9YOuUBkpl3wuYcNsg05g4TxVdzCoz5Ol0=;
        b=YTs9192M0XNG/Glcuj5Qqu0DIbchaYrusTRgo/hPYQoZsetIeHuUhzaTHrT+Ip/gRs
         OH/Srj6imQ2KKJhAEsZQiIOjAa0Egz8e2PLDY/48TWurM63wHwlnPIH2abHDPTymItKF
         12V9yVbUHwpSdBq7O68TczfGqSytJh9AcNJhsWpXWzx1tLtoG073YDblNRB6YiKmkrGB
         iNiHHXVDmlQBiC3RArLQxa9OADUnVZYEgkz0jbCPrHuVlc4cu0KtWxjGPPacr8wzNgfn
         yRPo8v3Pv07+c5kEZ4GSTKexljLVNsFKrJBkvfIzw5w5yEv5wbH6wXjAHUxTrI40IDOK
         Mgug==
X-Gm-Message-State: AOJu0YzFvR44yRRzcyi/Oa2LnDd2FS41oAfkRSNzjLK5v1dZMe4ExnPZ
	d1rrAV0VOTkGNLfCbUBXAtDF/wEaVYgxhPYJpBeDAk6jQXcHIfWMoGczz3Bg5kpLn30gjLMz/EI
	RTfh7wHl6CCzFvbwHgICWRymcQEEdJoBhlSrio9KgOqzgYh9i9Z2dHimB3g4DX/bIQzmSbckmYg
	LEPDcHe13v+bk=
X-Gm-Gg: ASbGncuBt+qZitzvqe/8+D55sOpx3s5lMWvwRRcY9MHUD9LNYUoaHsrWg4ZZSMrpLqi
	AOy4EL41Dl4q7wd5N4TZCrargtuBKVHUormVo27J14gUQucG/G9xSWbDggEIULdAlOpGbuo0Ho6
	lvL0O1S1mru3FY4TTj6A0bZbsH/Kc2t2teRTXRXRRsKGUBpAWr6BijKLM0dM+5S374BadCcJ7Hj
	6L9FT2z37SzTOKe73pei4DOM8xqrWQknLwkH/abV10uFuCE47EAKA2AljBA2BSDLsQEpNeMtT2d
	fH+No+6jwwkBw6pMoBaaVqoJaGX36SI9WQgvRQwVwlYv1ZDpok+P63q0mKmi2XdOz25AnFxQiAe
	hWzYFcNmaQatacxiibP8MiL10
X-Received: by 2002:a05:620a:2410:b0:7c5:9a4e:7b8a with SMTP id af79cd13be357-7c7a76d1542mr204776685a.54.1744253695565;
        Wed, 09 Apr 2025 19:54:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLusf4L55k5cyoOJaPteudzBR0tdZKI/Skpz9qPuT5CrXBwrRfkV0BFvNRIVfTXQNev0pJNg==
X-Received: by 2002:a05:620a:2410:b0:7c5:9a4e:7b8a with SMTP id af79cd13be357-7c7a76d1542mr204775485a.54.1744253695241;
        Wed, 09 Apr 2025 19:54:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123197sm24032e87.44.2025.04.09.19.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 19:54:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 05:54:42 +0300
Subject: [PATCH v7 03/12] llvm: use OECMAKE_SOURCEPATH to specify cmake dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-mesa-25-v7-3-59d715c66e19@oss.qualcomm.com>
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
In-Reply-To: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=msY/GiaQPn1I+mVA/wJknsgTpKRthaqaRkWh46fJtgQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9zLxpzlnccepjMW+ayKYJl2JCmyw2eq36G+mw
 4FF7d9L0dCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/cy8QAKCRCLPIo+Aiko
 1bKbCACjSjdHdFdW5CMkFupIv6ZRLpXY/3QPJtwTzmTAPBIMLUq3s3YRvzaEFAYz6ILYHH97WZY
 P4FktvPoQUnfgpcDPnQf/WvES/fvpPWqoutNaLBPbH34406QjvSabgXHXw4b9I56KV2JagyU17G
 mB4QH31efTZHhedk70BxmBj4449prBulm6Z+1avy/TcjlAzv1JcvFm5RmjjK5/X9BMfQJtvP5ws
 vrziRGf0zpKe2WKYKXOautpD6Pf1W1esNIYCghlIfdpXFaq1LARTiGA8tlTWpR8UVXBQmK8SQ5u
 /DLXhwzDfsQiVjhdsOae9W7eIKy1/UHOJf/yZA5uzFOgKhsT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: enocBTlm1vMjUbONHjd-n2gNBroQvDqs
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f73300 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=DXol61RQ6zBorhFbQVEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: enocBTlm1vMjUbONHjd-n2gNBroQvDqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=855 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214605

Instead of pushing an `llvm` sourcedir into S, specify it through the
OECMAKE_SOURCEPATH so that all the patches are applied to the topdir and
debug paths also use top path to map.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.1.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 194660fdad1f8837eedce3293d56e7251e5030b7..8719faebe38b96d161b557a469c92490fe44f370 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -24,15 +24,17 @@ MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 LLVM_RELEASE = "${PV}"
 
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
-           file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://0007-llvm-allow-env-override-of-exe-path.patch \
+           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "4d5ebbd40ce1e984a650818a4bb5ae86fc70644dec2e6d54e78b4176db3332e0"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/llvm-project-${PV}.src/llvm"
+S = "${WORKDIR}/llvm-project-${PV}.src"
+
+OECMAKE_SOURCEPATH = "${S}/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 

-- 
2.39.5


