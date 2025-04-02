Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9BAC3601F
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 15:18:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.11436.1743607112671316149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 08:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BPIqI+LK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532DuBdw024541
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 15:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIhSfy/SDR/jkHbaHlF49+XBVFaur1v4uEyKSY8Df5A=; b=BPIqI+LKp36cZJ83
	lB1UmrY4ISPq73AxrumRInGM2/RzE4ZB3iq+RCNmFRLmJj4K8IsOsdx8rzXwikWb
	axXsBLh6EzVdBMexHPXLwmFV/NaB7BEweb3jHMyX/xKWsfFDeNVd2xiXchn84zu1
	pow8Btef7+x39jeuhJI8M/BeL+gGg8AqfpZ0wlgy2PBmknlCpwwNkaKX3tt2Nr4B
	JkxptJPPvRzaBnfJe7TezF4KUmHP6ycO0Jls12m3PLrjzOzp4KS4Nyuy78uaxjqH
	yAAT09P31VAtI6LDGUHFG1k/hg3rDwpNMUs2m/6+gcI9pYPSRjeBRofgqfUXzFgN
	43+Iag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyvx8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c09f73873fso1044349185a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607111; x=1744211911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIhSfy/SDR/jkHbaHlF49+XBVFaur1v4uEyKSY8Df5A=;
        b=DK7+LDAeWe9BQk1wKLSpBeSgrdsGbeUZqbY538BOmWFOUmx2YX5y++YuVg7Nj3Qsbv
         ot9keTsgufq5V+hrWVRDnr5/wKmUnAlnkD6zduhz96sjAF0enCYncbGgK8ndyLXvAcZ5
         CLtYthFHgSVWNTZnuG+vtogYBBP/Qyzj9VgIefY0fZlx4lpmhXaAEJClMJ8SRXyQZ5VF
         jui0Kfsg5SKf/wJ5/ZcbhjD1VGAjwL68YkVqyDMvwZFayFhiiRfcmE+KYyWkO97c+79q
         Jn4yas5xOU4jsHISBxkUsK1Ox8B8FhfOlu5afBpB1vPIwp91/mB4RTQbF3MgZVYfTbLC
         Jhpg==
X-Gm-Message-State: AOJu0Yz1pau/WMCqHma1LbXP6IZBtmh9jU2HJ1nPB7hL9WX65mKeXOuF
	aUrmg4wCwb8uI9+d8pehwGqglwhl2cWpBaFid5yUgWh5dLBO2YrKIGx256zEImrTsh1zfTwIlH6
	lJDEsDwuLRBz/mnMKsOXjPj11MP/PKiSxPJpLcXpYZfFZdH0nep1SUB8dEgof90JRO3TEfkNEXE
	twIyk=
X-Gm-Gg: ASbGnctbcd6OZ26WQCZctXsaeJs7dk4qSoGgW3H7drP8HrvFIRqqWtFBD2o/AZbl+kK
	4zH2mhFLLsACbeyy0awGJal3yqSWNo+DEp7xLp2LtyOD1O4SF0b/4wWbY6Vi0IAQ3S6+OKsUED5
	XvVSGjaIUH6xqyxOr490+TIcLypg2TdEF8MprAZ3Pw4i/90mcyRlo+bOy+4BjPYq03c0XDzrwC3
	c+BNng0Y7eQRxx7w3O/6wFA+BRxnBV3K0MSJNzBfb/1tVHovR4zn/mV0erEez4on7ftadkFSyXy
	K/caIY9tvkBE7TOwd4j0YZvkFOmAHwcWZybiFbZyW8W0qTMv4DN1Z3CXsR4GOIg5NeVBRxvduAe
	URAPeQv9Mkk4+KL2zqb9k/kwaE/wN
X-Received: by 2002:a05:620a:f0e:b0:7c5:4463:29a4 with SMTP id af79cd13be357-7c75bbb258dmr986075185a.14.1743607110802;
        Wed, 02 Apr 2025 08:18:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfiuIImR62ouswsYsnTaLCyb9jLBTgPmUwLNe2qGz5Mlu5dH1lfTOcW3cZZFDftdQh9nvJrw==
X-Received: by 2002:a05:620a:f0e:b0:7c5:4463:29a4 with SMTP id af79cd13be357-7c75bbb258dmr986071485a.14.1743607110420;
        Wed, 02 Apr 2025 08:18:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd35925d7sm19946371fa.91.2025.04.02.08.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:18:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 18:18:24 +0300
Subject: [PATCH v5 02/11] llvm: move libLLVM.so.N.M to llvm-libllvm package
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-mesa-25-v5-2-ab35f021a83b@oss.qualcomm.com>
References: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
In-Reply-To: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eGTibRIRqDUKSL6bHzN2H6rb0V+z74KRWUYbtuHsbiI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn7VVAA0twm3jdnS/GfwY5VZnAxINld02u37thY
 f+eUAFPWhiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+1VQAAKCRCLPIo+Aiko
 1ZcJCACTLF6wlA2twLp0FHz6MZJfRxAt11/trLteJ4RZjx3N5dNSwjegqvchauM5CsXcHsvJKbc
 B+ouHZpTGOLUyjXWMbVh46VC47v3pVshE+kfC9Ujwx+eWPWSTLJ5IdiVpaZuuOifh1l+Vj6B0/3
 F9ymQp6DCayUIS3b9FOFh6GczGR7Nq9U/lJEZ1xkwnlR3amf6AyO/ix/nT8CPhsVUvXfnMBQX9C
 4RE9FpEKGeO3O5sEt/TUYvFdWHCqnTwUD7HPiogDE7W8I2dAalmOaaxaDGKRj3XuMP66o+qlF6p
 E3wtBBHs19FoNybbZYv+P++PHerhzWnbgG/e1Qo0f+O3QJDn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: RuzVyUlZH2DGapxb1EpQOpZdTNgGO651
X-Proofpoint-ORIG-GUID: RuzVyUlZH2DGapxb1EpQOpZdTNgGO651
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ed5548 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=sEhaxK_mCjGFFgskTosA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=753
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214270

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


