Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3D8D1CDB2
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 00:49:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31725.1764809377232398252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 16:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HO0FxaCT;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=igAkEOQb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3FqhcT3147865
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 00:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dIrbl0kzroo
	lTrjn+9DTPvWD4tj5fuPmv89f94T3z7A=; b=HO0FxaCTi5AZ+JNfWPqPuksNBq0
	8AGTQys+8/8IlyPy9Y1I6lM15Oqsdn/4SQhwBoyZedOhMrDYlheSiUI8xGN7Qdum
	hN/cFWFl9FcE6os/NsAmq6+npCzKF4sq0ptqOHcwU6ySHwirZ66FML6rzpkqsGni
	s+mILcUzwWRXyUtP0qRdj75QS3gYSz9DQUPa4sFFTrXjG64j7Eqa9UcqjNFq8qxi
	57tI7cRJG5oGEI/vJGNjs/tQLy837+mDTROmnLwgY0PVMtVC2qrthBRv76RKcuif
	bOXGYURF6zFvUFRojyG22TjjrWGXY6z60b7+CqBgNpvBXHMFpjqsmMJUAAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atr7yhf1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 00:49:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b245c49d0cso71749585a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 16:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764809375; x=1765414175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIrbl0kzroolTrjn+9DTPvWD4tj5fuPmv89f94T3z7A=;
        b=igAkEOQbvJG62by0ogmhV7KKXeSwnmIRYLKaRKldvaUzIdiGzsSIHEiY8vvk0+kSVX
         WSB2I5o+8YW43kkP4Z3r8kOig1K9+IN/915YC3A2B8ArogNBGFVQcFQQYTIKPj31S0i3
         ShrYSgfj7loNaxUU9xuz9f2sjLRpBxovfBEq1TgjLNkJCHt81/wASi16Qn3hxkhXnByM
         eETmmDHxFwTFvqnm47RidSbxOAaqNDrVOCuNGnZi5BIx3vdkmh3otLLh93PKC3Q57fBZ
         p8bHlq0K7bfmUkVrPjyQBSQvERw872xz98BeXojNJcJ9pZxsvmfmI6yQ9rEkrq7bcnro
         1Bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764809375; x=1765414175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dIrbl0kzroolTrjn+9DTPvWD4tj5fuPmv89f94T3z7A=;
        b=HeWvlu1KInvqoaWHga4/E/T1HBLH81wuI7vg6G15JqSHgwmL1z5ucHCh7DoFRHw05h
         xpt3aT21CS6GHoqMd9cuc/dMDpwHeKSJ0nzLchCNpHny+14oXMtph9ffIu+or2H8gVFN
         aggGUU5mL1zRNnz4NHOkLJU4etYPTWAqju92GNsPd8S/XE8w1MGfgCZGCbibbRrSJVrW
         5SjmIOXPMcjvudAdIjnkXR0oXfSyBgRkajRiIBinkqvwaDP+x78AMtcHNaOBUOcgC8m2
         0mVByA+V43lDgf0U7nmIgaP/iAU7xFEtYMqmh5BVvyHrz7piEbQfAnUktb8VNL8JVyWE
         NJiA==
X-Gm-Message-State: AOJu0YzIR9tEw5Ml2llCzqpcg83sxSLIgUgS5/dawQ5742LAAo1ITLEO
	9SJ0UKwQzA1+CnDxAs4tj9Yitc8jALe3tnqh6TnpIVdvdJ0v2Z3Q3BtIbJq9QvG8lBzLrz8zKEM
	wg/tvkSbczK8uzxnQX0HqVlL1sLjlmpo1ewYBV90VSfmPPNpu3y3mQprd8YOZV+VszW9dvTwwEW
	BHq+qr8qrRt7bmvNg=
X-Gm-Gg: ASbGncv9syykJpy7Qst8RoDsSUiMgm6IGo62dv9bv/r3bEOtITYURCoICWzkFduQ4R0
	nrHnhuwwBGf0rOerTdRowMRsAvtA9JZZRnvSgM28kG9l9fAaoBK1bQDcuNiCAlJjdv9606mKLjz
	nPNH745qdMSWV14S1nKUne9qFaVuEFH21jaicHHAtYTI0Jrll3jBt7yeC3CAziJCPLeE5q5sMJI
	ldvOy8YOpEHmiox3+aqHa9c8vQ5pmaqhwbk9VbPaaLz2SL+gcANR26sJ3wwyhoUAvVmQCDrokQn
	/qmJpTR20+GicseCLDler1MJ4bEciCuuKJe9LrX6ccTy7GVTgwnMbLsHvotoyNBxnDapFgOT+Eg
	KY+8s3sHkOkWC6J7pGc91ZPiPEpoK4PylV7htT/8ny9f6qEMHNUuW/gIMPdEqHsOTiq7E2ojspv
	5M2Y7QWB0EryK+rFCwEst3Hd8=
X-Received: by 2002:a05:620a:28c9:b0:8b2:2800:d646 with SMTP id af79cd13be357-8b5e7734a69mr688964385a.88.1764809375049;
        Wed, 03 Dec 2025 16:49:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEF68XEq8BTu4ce3eUCm2ywNB/kouELtPVBnh6vVHBW4plYMORoZDz7atWKB+dQbJ/4TT9vdA==
X-Received: by 2002:a05:620a:28c9:b0:8b2:2800:d646 with SMTP id af79cd13be357-8b5e7734a69mr688961185a.88.1764809374531;
        Wed, 03 Dec 2025 16:49:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70674a60sm392761fa.49.2025.12.03.16.49.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 16:49:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 2/2] mesa: drop freedreno-fdperf PACKAGECONFIG
Date: Thu,  4 Dec 2025 02:49:29 +0200
Message-ID: <20251204004929.2617318-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204004929.2617318-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251204004929.2617318-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YARNSnGmnhRuz0ZcRrFWSAyB7GB-szz6
X-Proofpoint-GUID: YARNSnGmnhRuz0ZcRrFWSAyB7GB-szz6
X-Authority-Analysis: v=2.4 cv=ZMTaWH7b c=1 sm=1 tr=0 ts=6930daa0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=D0dn3NXFWvdGU4tz9VIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAwMyBTYWx0ZWRfX/pbrv+a2q8PX
 7Bk9tCmHzqY0mX4z7tgGTlinIDqLLSdEmnmiXMbEZ0E7t4dVFcGmsgEaMb9ECLRNABZZP7exXFo
 xvfzZG7bYbib/H66FId+WlOSZ4m+3dxCcepLOBXD0TJtipyIgwkGSSTssR15SMBp3CaZE9pWGPw
 PtKrLG9ffvX6zivSl1zcv+5wTEwYXz1kM0dyffJmYnFmmhod9tlfRLiVYr1mNOxRUJySN/5Sj2n
 1mo7w5mZm4Osx9ii/SyTx447ih7Yl6RybEfqX8A1wRalp7VRIX6Q0NTDW2sQYHq6yTRxaVVskh8
 O2qabnEEjj6T0oUpuTuRuM5cj7sqtZfEyX3iAAFqQqk3DXd+KMWF4tNb74jBYG9XXEGSdjliQnT
 LnxiTOGmKiMCEzcPQxJOFg/cLSzh0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 00:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227245

With libconfig being a part of OE-Core, we can now drop separate
freedreno-fdperf config option and merge the dependency into other
freedreno tools dependencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3124db09864c..9624ce12cbb9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -147,11 +147,7 @@ TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 
 # dependencies for tools.
-TOOLS_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
-
-# the fdperf tool requires libconfig (a part of meta-oe) so it needs special
-# treatment in addition to the usual 'freedreno tools'.
-PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
+TOOLS_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libconfig libxml2 ', '', d)}"
 
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
 PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled, expat"
-- 
2.47.3


