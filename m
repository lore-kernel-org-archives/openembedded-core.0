Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5667AC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 15:49:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.51953.1745855346206969306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 08:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QbhMJwtY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACUYR023768
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 15:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eXq3tWX1wXx5ktUrSnFVszDptrg+hdP1ByT
	75NW+pkA=; b=QbhMJwtYzh44XjjPAIsa0gLOJYgkVri6W/YdZYjLjKeslcCO+yO
	iYlI2Q8JCQOZ5UOLJ5YsgFz3LpSyC5pLNdpXT3OT6+Ufru3uba2NsuD1jwgvVpgJ
	iSIiV98MH8tY54OVAr26sEeuOw9CuqFwutbOfOQaQuNn743Ezf22eJDCudFKSu3v
	mzZLuEFz6LYUpKUefj53t8fnj3Siw5Urj1N1ZBDvEN3H3sl0Iwy/zUjrOiHrvAw3
	qdzVpSUADYRcqgsl17k5Yc2KUJ/s6IjhXeD/kjSIRk/k9Jy505i9KRkqZp0SFeII
	bgus1djK8mIoEKlMFrT2cIPdvfQUquFdbTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmhnbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 15:49:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7cabd21579eso55006085a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 08:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855344; x=1746460144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXq3tWX1wXx5ktUrSnFVszDptrg+hdP1ByT75NW+pkA=;
        b=OZq+S1w1E8VFLoUn9gWesRgY1b94bbXOlAB6hkGhrmTBSkzAebyAQm1uzLcYTnaEsR
         PFrbtZq72Asb1QZRXvwpikg+71Dn+lN92WW2+d7cuO5DeR+Bx1+TjDLUrYXurbNa0MK6
         TiEtBPnTGlybumy709unQlTzoRDzl1O72owSOg5rX4VBb3tZjfRPOCNGPsT+X+vhN3iz
         9nNUfpXra0uXAVQPSNW3KmYaBqBOjjMRQqnOzSjfK9h22UD7CncysdWgF4CJpVDSc/sd
         JpwZQWATtAMYrWY1Ya1itOr9e+NQCJDaHk1G375xokxHTxg1cJ1ohoPplr0DCugK651l
         4ZrQ==
X-Gm-Message-State: AOJu0YxIwBEfJl0uARlAPzpv590j6efxsUeIKAow2GSzPsk6uKK6io+N
	CU7O3fkm4WO230uJZbm/Aua3uUgoka2R3iiDHJo15jIj2k1+sie9kWpBw7R/w1mqKkcc/uCrKIk
	Bt40Rkt5ZgHHZlRTu6sKgSFPvE8iM0QLMJObs8FZv2UMatEvGOPC2D1WvztaU7vsePrBCA7+RKn
	GVAvTrINGLKUE=
X-Gm-Gg: ASbGncsTLfiF9bTBo/3/SxOKXi6VG7z0CFyV5lEc+HlXndGNSz+zhAvGz8iX8Xtnf99
	ssmNkMr7qyDf5e0HqqLEzNdid85MPYR/KIjkUZxB7fPgMd232GWspi9b6OuiU5kqqTE1ocT7lcU
	owMSGCw1kTX9qm6/ZsV0DfvklHY6dn3nJo8BghKmEfT8TEndUGv0/+7/kW7J1LO5indpsxAiave
	dFiwaoj2fKqi4Wek43gANPztO6g3kUPSjz4gOVmCXXupVU6Nu3BqXbaZqv5xg4LAzCs7Lvvhjv6
	Y36MXPKDDl6H+rGT6KRTufZolWASPVAjiQqrFMM9ijCFcenqWUb2iUcEN98dJknHpiufafQYWw6
	geLDPezILetegOjct9sAS9W9a
X-Received: by 2002:a05:620a:4305:b0:7c7:a538:490 with SMTP id af79cd13be357-7c9606ac6cdmr1618707285a.2.1745855344075;
        Mon, 28 Apr 2025 08:49:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0n3QR8t/gomxo2ZA0iNkG3ynI3mGJbStHAZcUqSVRX0ggIeBqL6boOJ973BklU4pFECll5A==
X-Received: by 2002:a05:620a:4305:b0:7c7:a538:490 with SMTP id af79cd13be357-7c9606ac6cdmr1618702185a.2.1745855343270;
        Mon, 28 Apr 2025 08:49:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e9b40e0e7sm165318e87.248.2025.04.28.08.49.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:49:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libxt: fix build error
Date: Mon, 28 Apr 2025 18:49:02 +0300
Message-Id: <20250428154902.3084542-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Umej6G1uslNBunaJi414qP66d1QJ26gf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyOSBTYWx0ZWRfXzzxvcH3hvPyM cWmVembz+2pBCiJ2HpCSpjFhvFX7PUBKnWtanVmA+KIbNm0zyRXce32gLkTVvnL9fJl/WHs9J5u 24LiFWdxdvqs0yBxSvGiT2HOSR4LvJuYuOaM9kLecbvCfBBst9ft0z172gIxtyITjQuoIhn6KNY
 1KbIOVCh9AYUNzJPFIbEp3IRyCH55lbTaovUDRcwm4BRHSPVsyWUsECUaGgcgCyK8m5ih53wjFg PYFrhfed5elOuC7uktBJt/2reW2adFoPIsKRgbvUPkuMURTAfK1w1t+0zPdrdki1kDrtsWrdMzO PJo14RVmG4M76jl+rEHx+2R6ZVJ/CUMTWrVZNOizi5F7m2Dbx88/hj0WL1VopjSPLse97T/fFlu
 sA3iRcDJpeRWp4om871B8L0kQQE0YriXV2ew+4/2BTueOerj888q8eKEnN+TY3zQH9hmikuK
X-Proofpoint-GUID: Umej6G1uslNBunaJi414qP66d1QJ26gf
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=680fa371 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=DwjoYKYXAu5zUbMapuUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=704 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 15:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215619

Building of libXt fails with:

../../libXt-1.3.1/src/ResConfig.c: In function '_get_part':
../../libXt-1.3.1/src/ResConfig.c:421:23: error: the comparison will always evaluate as 'true' for the address of 'buffer' will never be NULL [-Werror=address]
../../libXt-1.3.1/src/ResConfig.c:404:10: note: 'buffer' declared here

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb b/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb
index 97323ad282ce..28915d1a2a20 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb
@@ -29,4 +29,4 @@ SRC_URI[sha256sum] = "e0a774b33324f4d4c05b199ea45050f87206586d81655f8bef4dba434d
 
 BBCLASSEXTEND = "native nativesdk"
 
-EXTRA_OECONF += "--disable-xkb"
+EXTRA_OECONF += "--disable-xkb --disable-selective-werror"
-- 
2.39.5


