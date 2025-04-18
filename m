Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A47EC369CB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 00:57:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.2817.1744937837062062609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 17:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UThMaWr/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClKr4028984
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 00:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LhiIS6pNfTNcpgU0UPFpXk
	uNFWGSyQY3s1AAODdqjmY=; b=UThMaWr/SZ978RqBnPwt5AAHehvOS2n5CQAQZg
	2vpCUXEdph65XvS0lR5RCXJGXWEX39sB6Hgh7aFJ5Kgbpxp3MVlMF982NPp+UToV
	/C8s7cT0TZkfwYJ/UJySDUeiAnOqZZEqCzS92IMxOC8nMZOplxO/dhkZaEfRd4An
	VvjzgjVOBHj9g8UCzLr5eyJCq9kLP2Z4wUykPLMaXU/4NFqIfPsWEohNSooOocK3
	6fbN16ramE+cU10GN3eiWN6v/y2EIxdCfogeuAYvSOUfFdcRMFXiTLuxkKWV1JmO
	frtWuCUmMO9fvoqVg6scABKbGjatahlSB5kv8K0PLuHMkcPw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9gjwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 00:57:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso33689326d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 17:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744937835; x=1745542635;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhiIS6pNfTNcpgU0UPFpXkuNFWGSyQY3s1AAODdqjmY=;
        b=UrQvAtkp/Nh6mALExcoPttvDMI1d0WNCG2eL2OM6oVzyWztpSD7lnCA4jbCwGwqROl
         fZnOsXkV3PWM2LpaUdHAZ/5zNtAGG9msN1+CBBfMZKYwaH7KmJA6uBWRWBWQIlvVVWF9
         ZolDXKEeM9p9JJgxrC6XaBVHm9FCnWpm/sjtZLqL08F/C7Il6rFobFZlo8zdcFWilJVb
         CRR0wjhdtIu6u+/jZEY6Jw3a7qJvxjFEWL8jY8F3R1NjsgvWlrjkd5jr4LYuTzDNcJve
         YpP6fk2mTk6yQlnqNK51+uUcgdIhH0Fk2w0YnFRCmbRrg1PU+AIfrbRjhheyZ4tMMSRD
         Yh2A==
X-Gm-Message-State: AOJu0YwERKEMw7y7YujTXWnZlPPV+1MbS6dHrpj8xAaS77wKMDZPaKjH
	BvG5iZyLCU8hPe596P38Y2LZRxYCud/86lt5dpUS0J1JcYfuktAlNvLWhJTEomOwrJPi/xRL48e
	ZnjaI2hENIdGkUCePReDtVo6QpUgZNItcG1yIhzAMaQ+BdNqYSTlbzZ8HIeNfSdtsCxILmRdkvC
	n2ircXOcziAgA=
X-Gm-Gg: ASbGncsaVL+Apvwei+uD+8eNEwD2ocd49qafEmcINOd/XB+2Z5Bp0KLBO3Fttlm4JiC
	YtrWQMLEYr+0bo7nwa4c/b5QOXGcXsxb/KooOEJBa1B2VYdsw8i5MSbyRpS2Rp+NnTZZNCfxVDb
	g6VTUGocwpZeUo1w/v6hW5H1MWz4CI98+OthBYc8N3T9Xxag7AjuEh5znr0UlYIV/dzGz3ViVS+
	6/IfnjrC9s5rrKz+aqL0ES2M4I+MmE0Th15dYxscBu8gc92HUlyMAxXWTt+bwa7x7cH8Xrxbcso
	B19se+5IZGmuiaMP9MENb9J4SdpJxx5MtTYRYv+rW4tKenxPkoEsdB67crwDOqO/qTLowt89cN8
	baH9Vyq1mzi1O7BMYpiNry703
X-Received: by 2002:ad4:5cad:0:b0:6eb:1eef:c2ed with SMTP id 6a1803df08f44-6f2c44e967dmr20234016d6.9.1744937834912;
        Thu, 17 Apr 2025 17:57:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEybnDuxeRXSAiwCofOxGaSDxkIGxHxbLo0xzlLlJ/GamSIli5hhUpXGrNJKuDO5KJO8V34yw==
X-Received: by 2002:ad4:5cad:0:b0:6eb:1eef:c2ed with SMTP id 6a1803df08f44-6f2c44e967dmr20233796d6.9.1744937834510;
        Thu, 17 Apr 2025 17:57:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a77c1sm718951fa.57.2025.04.17.17.57.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 17:57:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] mesa: small improvements after 25.0 merge
Date: Fri, 18 Apr 2025 03:57:11 +0300
Message-Id: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGejAWgC/12MwQ6CMBBEf4Xs2SXdQgN48j8MhwYWaWKpdrXRE
 P7dSuLFyyRvJvNWEI6OBY7FCpGTExeWDPpQwDDb5cLoxsyglTaqJkLPYlEbnNyLBY2t2omNGcd
 qgPy5Rd6HfDn3mWcnjxDfuz7Rt/2Z9J8pESpsOmprVXWkGzoFkfL+tNcheF/mgH7btg86GY3+s
 QAAAA==
X-Change-ID: 20250411-mesa-25-fixes-5a38fe55dd3c
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=l/udDri2+uRybDRcCNdN4y4+wNT1pEnJauFqCnMsmTg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAaNomZ6yjXLGfIurV/H3MA8pUdc5RsKFGsg59
 twG+FIGFXaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAGjaAAKCRCLPIo+Aiko
 1SE5B/0XZNZIsCd65Moq6Yhn6fPNawU+8XDRbnab/lErqcuwphfntvheon9OGTfpPW9vmBxPzRt
 rhnbGFASgvF68FFfNYuOBe0iDD3E8dmcmRYO7sslcR0io5FYo/JHrHFqk7PQ5FSIEVGt63AYo0q
 H8SQbGrLijlITbaYC/nMEZQmgX8hCT/18MAH4yAWLcbr5RwrWyDhqcD+75IjNz969bvr6cfhAqj
 WIMastx91pAXjxL2usTZuRt8uQGqvGCeuOfP45923mFS/RM2lUVkQ2t7wJywJB6YPaV8ke9DGWq
 m1KNBHvs5pt2OpstRu5U5ZmbAGtacRMcZSyC1E3tTkFRGO42
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: KLbAxZYPJ32QzDESiKyazoHSg1FiPvf6
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=6801a36c cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e0cqh4SiTRht4KY6oBYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: KLbAxZYPJ32QzDESiKyazoHSg1FiPvf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=1
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=1
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=800
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 00:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215115

Several bugfixes after Mesa 25.0 recipe was merged:
- Replace the bindgen patches with meson-based fix (Dylan Baker)
- Bundle OpenCL C headers

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Dropped applied patches
- Add the bundle-opencl-headers patch
- Link to v1: https://lore.kernel.org/r/20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      meson: pass -target and -I to bindgen calls
      mesa: drop the bindgen patch
      mesa: bundle Clang OpenCL headers into meta-clc

 meta/classes-recipe/meson.bbclass                  |  1 +
 ...d-an-option-to-force-inclusion-of-OpenCL-.patch | 57 ++++++++++++++++++
 ...vide-cross-compilation-arguments-to-LLVM-.patch | 67 ----------------------
 meta/recipes-graphics/mesa/mesa.inc                |  9 +--
 4 files changed, 61 insertions(+), 73 deletions(-)
---
base-commit: 53c772c941d5ce69ab89f35cd04724b740daf269
change-id: 20250411-mesa-25-fixes-5a38fe55dd3c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


