Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B11C369AE
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 22:09:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.38809.1744409360519932470
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 15:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Df6UcRIi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BEgq59008198
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYIZzZqqAhFTg8VPozFMl62snavhCT0kdbzDx0Q2nIU=; b=Df6UcRIidCdFxDEa
	GdOKYYjDrkhQ4IYjv7hnMV6vZ2VFOiSGnLH5ZI22QiaTCIX/ypxkTZXUdszkxD2a
	dwtSgZqWvtfk50A0rY5hpnHnwFQmgLbEdtwruxHzGWhHj77EKv2Fg4t8bZFGxwqP
	UPEWOdpXv+xABrcZ0TfZ3YGlAQcv7dtlcVCtLwib1tHiMFLROBesLavmNPF1Yuzv
	Y9XzYtawBebKmrD/y9liNcYgDg7Bbxw6iGf5O9RFwU9/hvk+Ngod7Vc+nga6l15B
	s1j8zCBCBra/3bIL8uAVIDa67j2qYDUNgklxfxhudNyJYjbyeoT6Bmy8ZvMbhhTN
	tAz91w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd0buu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c53e316734so424249385a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 15:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744409358; x=1745014158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYIZzZqqAhFTg8VPozFMl62snavhCT0kdbzDx0Q2nIU=;
        b=TL0qFb793tF0u5TTGrhsKX+6u6YKJiOoOvvPXqfVEQb+59mtmR0j/DtxuyWjOMYuKr
         syJwl5FL2qErFotA0KnPuBQzwLPC1IxBgr1xc3cwgfiNNJn19c+nHp2A4AKkR1x0C4v9
         /rkSRWuewMJH/2rbTF2uDO4myMksD/7XVjgmfBkXzGkPgs1lDnB62dJ9r8aldbxl1ObG
         2CtEsVBNAAHgmlHIPv1z32Vd5HgG3Resj2yY9hsOVZJ52qn7rqAwaMfGGDBLArsDYqhC
         T9ocmi5BYLL16LRfoGMzqPxdup7n8fsv+LtXPbIcvS4ZG1KSYSWemjLCPgon+7wYtuww
         5PvA==
X-Gm-Message-State: AOJu0Yx0+XZnFiHDFPdCJcdO0Nze/UupRtV8l0gWa/hXm11fq9wR0NAE
	e5pIGFmC60TXQcNmJ41rgcFyWVNWxUoMqEWuqqYpNtERzhSRBiqJodPnyXAierYjBTX+EMr7l2g
	M889Lk32O75nwtLjPn/Lh8dXUE5fLSsOFxYJE8++JmapaiffKv0x4BB1YDSJG3d8HdosjILTqm2
	JDlA9/dwaHa1s=
X-Gm-Gg: ASbGnctmdubx0izdqNw8/a//CPhs1+LiKgyOtQv+lgjnbNB+fVmezTgByTYP+iQrV7M
	q2/i2fiGRUUCsSX1Xvk9uZ6wYUajpMVpzrORY0Za8SWjarBm9ALcRgtlG2eLSfMh7YXtUIx+U0o
	fqip3PCo3UXZEtGPvLvi9TdUzivXFi5o2fL/D7x6GITT2Z2TEU93mjs0A28uCzpBKmPbiYGij7d
	1ye6pdFpr5g7lUwiHCTfkkt4F4LRCc16FYOS4zRX38yJMd5gpvCAjtGwiBFBwWnp+U1k491oSUj
	n3/3vxRMUg9gaJGwQrHxZRBEmJtiLwRlN75Fi4bO76XEDmk8QsZBVI7l7raUjVEkEV6/11ApSp/
	xavREygg0m69v2BVlKwIZC4UZ
X-Received: by 2002:a05:620a:4550:b0:7c5:5394:7e9c with SMTP id af79cd13be357-7c7af11ba43mr757572985a.32.1744409358230;
        Fri, 11 Apr 2025 15:09:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq+8Bf1hQ0eaNfVcAUSVzCbF202s2iJBOTph7aDNKKEiKIy0y5G3xcTfKfodlpJWbQIHIdrg==
X-Received: by 2002:a05:620a:4550:b0:7c5:5394:7e9c with SMTP id af79cd13be357-7c7af11ba43mr757569785a.32.1744409357896;
        Fri, 11 Apr 2025 15:09:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510076sm518432e87.175.2025.04.11.15.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:09:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 01:09:10 +0300
Subject: [PATCH 1/7] mesa: drop kmsro PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-mesa-25-fixes-v1-1-791840391271@oss.qualcomm.com>
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
In-Reply-To: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uTAHgVqHm23O3BUZbnofWu9NcwEFwCSsx9pfQUkRloM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn+ZMGrnetS/LnKslTiz7gRXeFuD0RERvJm6f6l
 iVojWvumTKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/mTBgAKCRCLPIo+Aiko
 1b7ZCACqT4KuoqTOeM5L08T/pJhpF8LZbYb94pucWTpn6koejRyrQpKBQKeTV7MjLgqxbkdyGrn
 C7AKO+y/vj38Russ3hOH0z8357K/1/Z8Zw/fRRqyhkMo+EaHKc6tknHJGQJLRavRNPUqRVm3LH9
 kel+FC5A4F3meEQU3BMpVak2R6H2PFFs9H/2Hg9FkoP3hWptf0B5S41rcP9pnDRUE6p2fC7JMAh
 MQOMFSHHc2tOqSbG8PxYWTwkzJzPTE39nZXl091qbdX4UxyA2/TIodIfG+uG6Re/R3duiz6NkMn
 TxwadFiym6QgM75iqyHdRfvfbE3y0yqEhTLE9ff0FsV651kL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: vIcmbyG_JuG49341A7U4bO3FtVyTWIsK
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f9930f cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=stO6C21a5PeFhlPs9Q0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: vIcmbyG_JuG49341A7U4bO3FtVyTWIsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=770 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214763

Mesa has dropped support for separate kmsro option to gallium-drivers.
Drop it from the recipe and drop the now-unused PACKAGECONFIG too.

Reported-by: Martin Jansa <martin.jansa@gmail.com>
Closes: https://lore.kernel.org/r/CA+chaQeWA01kB3q6=o4xcZwA1TMggHxYTZ0AZETY7he_yU3E1A@mail.gmail.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index aca34983e97ca684d662987d3a1d0b61ba44029a..a88cc8660e26bae43c713b2bfdbf396e804f6c09 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -162,7 +162,6 @@ PACKAGECONFIG[opencl] = " \
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
 PACKAGECONFIG[freedreno] = ""
-PACKAGECONFIG[kmsro] = ""
 PACKAGECONFIG[vc4] = ""
 PACKAGECONFIG[v3d] = ""
 PACKAGECONFIG[zink] = ""
@@ -177,7 +176,6 @@ GALLIUMDRIVERS:append:i686 = ",i915,crocus"
 
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"

-- 
2.39.5


