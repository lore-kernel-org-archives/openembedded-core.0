Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D0DC54F32
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:46:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.25574.1747925172757665494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fhxlOQVC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8J2dN011346
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tq1rNWl0d6H
	7kdK9oMfNdTVx5iWEh9Lz2+tSVLcy7Ys=; b=fhxlOQVCMvLpAtI/JbAQiCJkr98
	9VvZpzoR5HXqUwOvNGyi0L9F05IfykNwMA1WZkfuNfOsAUVVha8JDfQvN3eecUzQ
	Pz8a/jRBpQGip8OZ9daOnI7rUJlRT38vLepZIRslTdwfS0w8fKM1t+8cuyk9foGp
	QAJNmlPM0eH73ESm/g/BPV88XYEQxnuZc1rAi8WmxSQ1B2SrU57sTPFOaEkmHHNN
	9oP1YRG/BFaXhISMvl+juNkLJ3yuFfUN1K3pFv7VtHpKFtLGvqVW73tAe0bCZqqA
	kFNuNTbqe5tcymajlQOxs9qfP9CbUI5Hjfd28Vx8osP0g6fR3h3NZogfBVA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb6jjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c8a36d8eso109510266d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925170; x=1748529970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tq1rNWl0d6H7kdK9oMfNdTVx5iWEh9Lz2+tSVLcy7Ys=;
        b=bClfrEVFuLZgrfl+6kLAFO5ehyXlrTG4a9gTmCru75z9twODSGz6mzv9U1Uvpaq972
         YitHsEb+vNwM6Be6I3gM3YuW1jm8kOJLrJirO6PvMlljRr4FDxFcJ5Bxm+31pVBXzuKR
         uF+GQHnCV4OseMj5E/to/BJsYJTofK6Wt0Nahr7RAx62mz5k16y/DGmTFfCDbyTBtO+u
         5ioAQspg3D8IycA8421PwdgkscTnQRieAi0A7fBCyBFzf5PfIB0QifME4Wsa2Pg74wIW
         y/NbjQZUkp3hIBsAOPEQB0KbavBq+Qz4W2QZE3Acmz/4MCxq1gcWpJqixIlZpFz4tfXJ
         jxKw==
X-Gm-Message-State: AOJu0YzyTz5IWMcnhuRspMQ9m32AmALsCBQRB/Wn+AyO2DqGqfYZL2oP
	HNa2/fOtdpVlbmAqlyZQA1cZFS7qm+DpCmY5WDNVpi7GrElCufsWP6Db5OIH7Qw32uQOQPKiEsY
	0Y/B7jmLY7OXzyOhIIOuW7jAecM9SQ83SpnYqXAOUIlGr3iFTQ37k++gVyeQpEnzdfqn/Jw0DXi
	ZuMFIO4IgqLgsdQM4=
X-Gm-Gg: ASbGncuSAooXY9dgJJ8VZoXQ16pK0b0HNIW/AgDzYhM2qo5vS4n6ljpI/gux5zelBzu
	xwG4A+o+ks4Lnl/CBXi9emf6j6a+A/hUJq0md3QmTUxObHxk0JNL8TKNrUAA3Q0y9b2mQ13Ymyh
	XVs25lAGcrEv4z52Es/YY60bNSEk83rWuNDxge2sOzKV1EO5UEo0OHSrsZ0n1tU/OS0LBrwzhQ4
	qLGWMoNvgVnqLg0PaLQ6VOwMIB0tQ4HJWPlT5J9N/HSrhireu8OWjni/OcF3equq9su8A2GsSJZ
	yd6KQKmnfqSHUjlpuVtrNYefYZJP/vZRfAjMNafUJsvp6V0O2NL7H7jXlQsMtZz4TJ2nlr5x7TV
	IOyMO1R9q40Uuqa5414Mj6EXw
X-Received: by 2002:ad4:5f8e:0:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f8b0866722mr426583006d6.15.1747925170418;
        Thu, 22 May 2025 07:46:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtAmfgIbaKmNlj9LOxj2WhzwH3vtPqmWKqc/inBMW+V5I4bQqWLKISPckYXzUiaY/RXxNneg==
X-Received: by 2002:ad4:5f8e:0:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f8b0866722mr426582686d6.15.1747925170043;
        Thu, 22 May 2025 07:46:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm33031551fa.44.2025.05.22.07.46.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:46:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 03/12] mesa: drop -Dgallium-opencl flag
Date: Thu, 22 May 2025 17:45:56 +0300
Message-Id: <20250522144605.2876771-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AaMFtr18EIJ87PtsJMPOiu6Ikxaz7RZc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MCBTYWx0ZWRfX68Lvq7aqcYbM
 V1ASTdTp6tAh1n+97mEnJDl+6iNRmqgPOYqnUo/w1vXmfzQcW3VqccZ+oHCna6Z8URuxXTtfeRp
 b7HNjfgwJXg8sQmps9+IKJaoRCoiIeHlzZlP6NqqAbsMF2safk20lofh9qY1FjwOJGIZdVmiFry
 y7A0oc+vvlES/LlG3Rs2seDlUvYNUuooml+7uDk3uJTtw+dgzDzzrEbfq2n3dBM6ck6c+oItGUR
 +xvWuU5EiukMR/tdGDEtl1K5aehXG4Qer7tGQwsLLh2PtErRIfJPR0m2HTipy7yCuggrcVODru3
 EDXsZfA0ROMdzIoKwXpWpMh/yZyol9hYIWN+SHfMau+vcukCuNk1yoR9Pcexn26ovHhAwmZX5tg
 pfvGcirniLRUzRGMBNREoPTr4Et03QZgfR43YzFYTE30NohjQLQMRtYAGqDCMsoSRCDmIhe/
X-Proofpoint-GUID: AaMFtr18EIJ87PtsJMPOiu6Ikxaz7RZc
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f38b3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=ljLuNc_75jdkrf6jWyIA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=949 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217114

The Clover support has been deprecated upstream and got explicitly
disabled by the 0001-dont-build-clover-frontend.patch patch. Drop it
from the build flags.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7fc306156dad..89fa19a5668f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -145,11 +145,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] = " \
-    -Dgallium-opencl=icd -Dgallium-rusticl=true, \
-    -Dgallium-opencl=disabled -Dgallium-rusticl=false, \
-    bindgen-cli-native \
-"
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
-- 
2.39.5


