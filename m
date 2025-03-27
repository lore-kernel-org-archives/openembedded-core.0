Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D950C36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:20:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.48935.1743079034172957227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 05:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jX9OfnZu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jVSQ006036
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lrnxHIQhpnz
	Qk8LjlG6rp9IzYwU1+oVEHFQn83Bqpwk=; b=jX9OfnZu1wca738GayaAZoQ+sHK
	9Qq8dmhPrALmMQhEtnPCnHgll21z3tY+RCrhlsff9xzOu/6NrkZSVUGVq9PGX0VZ
	Ntz9cthMCrRqoZUDEcm/Aq0xV9bHRFBPnNWSnyV6A0DYVVDPnAG4spGQUrtsQmuj
	5JcZikzUj/oufsUvR+WDtcp3R4Vaw5dAbsYYNszjxtG0nUSzGAp9an+Yug40J8Su
	LEX5ET8GVVjOFR7DzLGSXfEwcL9eyT5dkLVe17leORWLTOeQ6ci9RJR1fdhFShTs
	cp6wQ2s3Rqhs905RroQx1gB3LO+7KGciJmSPRGtaWy5sBe5qzPX8za/7x5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktenfbcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so273372385a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 05:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079032; x=1743683832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrnxHIQhpnzQk8LjlG6rp9IzYwU1+oVEHFQn83Bqpwk=;
        b=W7EfkeCJyCy5IaMg0kxPthydL7BnMsZJT6peou7ZaX3Hzbi/n3+BiOicAtfOd/+KhE
         91Jpza4GQBfSp6/4KbfSdGdMTaPHWjCG6LTUjADjyQ5gIyoqPB7WPFZ2i0NO1Qnsj3aI
         aTVsBU8I1sXsrjgMXDpOefQAJXa60OGfLutjRalGDuw7ZS9Y3f8NPent4Re7pIwik/nP
         E9c96PgxaStLSs35cDytcTUBEzBxiLUC8sKoiQ8HY/rZQGX76NCEX6M6FiD7E/xkh2xx
         ziHL5u1wsgFBH3katjj60v68Qu9bFcKRTuEpGuG0+EJU3rI2yg1eB8BOwXCEQ1oNglEs
         pGNg==
X-Gm-Message-State: AOJu0Yy5duHPVw2c05D4/gLnXczwshqfPGzzqrdkoZ8d9p82V1/Ka1GK
	ubp+63torWH+Dy76u6bm6A6zDD9M47JY+EL8VjZUnhGzdcvHZHq7nq234ieI24VGBS9FI3rPdxb
	PPK+6uz8kO/5zxPqhsPFKe1Gu8+F1fNTdbIhucaVElaxwa+EGCKJr9eXKysExTS8Sb7fI2fjslF
	9S8XnEN4YtV2w=
X-Gm-Gg: ASbGncv9asca/3fmXTfcS9PbB31hYbMgCMvq4OSmUgnC9xLPM1kFiDpI0Gfv1ZDbSlV
	796sAdl6lXfiF1ddygtmb4xLe0fvD8jnKNw71Af/gfihzn2llM2WW2Cu/axmGd7EzG2m2nwz4J0
	bTvQuHEKvpMVPqHy6BF/SdkX3AjrPTuNzxZXDfEpbICpnV+23fn+w0S3YkMfOeCRy7Oc9aVqsjZ
	5htTSZmf/j9xyqr02HlOI+3cy34HdGer1ziZA+yPp8CrBQuJTyGwA9hihD1K26p4vNA1URaKc2K
	MAxwOZVqFCGOK+cxYTljuDNUZ+VjjJtXWbff9G71imhEhohuBWhbbgEGBINMQrAY6vL6BFXFd40
	rjzrJIcDVnGPz5VWmBu99I32aDep0
X-Received: by 2002:a37:f502:0:b0:7c5:5a97:f784 with SMTP id af79cd13be357-7c5eda0e46fmr377570785a.33.1743079032004;
        Thu, 27 Mar 2025 05:37:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM5Aq7nK79oPcC4PMmq/6Sq5nbJ7GnW/IHZHj3/57hpozR2ZiQSdtZkJOqynUZHETqclOAFg==
X-Received: by 2002:a37:f502:0:b0:7c5:5a97:f784 with SMTP id af79cd13be357-7c5eda0e46fmr377568085a.33.1743079031530;
        Thu, 27 Mar 2025 05:37:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65121e2sm2053600e87.235.2025.03.27.05.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:37:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/8] llvm: use OECMAKE_SOURCEPATH to specify cmake dir
Date: Thu, 27 Mar 2025 14:36:55 +0200
Message-Id: <20250327123701.3906604-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e54679 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=D0RIUQgIwEgepnv7z8kA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: GsGkaK-ID1ibUNALITSYwnVg3T7Knr5X
X-Proofpoint-ORIG-GUID: GsGkaK-ID1ibUNALITSYwnVg3T7Knr5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=968
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270087
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213742

Instead of pushing an `llvm` sourcedir into S, specify it through the
OECMAKE_SOURCEPATH so that all the patches are applied to the topdir and
debug paths also use top path to map.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 296a164cdd7f..7470d2b4d8a5 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -24,15 +24,17 @@ MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 LLVM_RELEASE = "${PV}"
 
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
-           file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://0007-llvm-allow-env-override-of-exe-path.patch \
+           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f62aad9a"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/llvm-project-${PV}.src/llvm"
+S = "${WORKDIR}/llvm-project-${PV}.src"
+
+OECMAKE_SOURCEPATH = "${S}/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 
-- 
2.39.5


