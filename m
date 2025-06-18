Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFCCC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:05:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.8260.1750255534433480967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=W6ryJS/J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8qiNJ014067
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vygAld4ZBQs
	dQKRuo92zHi5eIEoQ3G0RQAYlYSWVipk=; b=W6ryJS/JhgXyzABIfVOZb+UJW3d
	RaKGRsbLbftvFhIjRMHE69z+T+OgN8ffLC12aHRlcCwnr9FpQvt0iJJUAXZ6+f+Z
	fdTINEO5Do/d0att115hCO9lX7oWpyU64Fw+7TJHM2G0re4jerVd/PR8UX/EQ4rO
	MktExTPcUMnJ/0d3Tt3aUAUvmmdjIDK5cJ5BctZNMTeYbcCDWKXQJ8lyJBwU9h5y
	74P5ZgGtPZS6BzzTa/zaXYgbyAjCc92gRX5la+enysZ2kJw9VJn1M8rAer/Zk8de
	tPbroe8Gv/w9Bdllnvpfxg1ZicsTqSphlA59yJkO7tFpmz3FpkNY/Xv2WyA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47b9akutrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso1152976285a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255532; x=1750860332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vygAld4ZBQsdQKRuo92zHi5eIEoQ3G0RQAYlYSWVipk=;
        b=wXYFmcBBhHDbU6+swd/cSxz5zToHlxBbJd7QeBShK7KDDnUCAA7+psMiW0j14LCcJZ
         NrnO9CjebOylrjhvhlnj0IESfE0Ae1Y8gF6ydUuW/wic8HTS5CTuFYzw75Puorle21hS
         BM5oqn4Sa+uTJxJ0mxD2d77q0aSfm9L7Yy0MM/bjapqvpVDlRanCM88wT1/9Uf7Q5wTi
         eJ0Vgl4ir4JfUnxRaxWUPO3X1C9Ruj8dUuRpseQb9Jqh7KAvT4IfHSCPpHD088QMKeMk
         d5oo5BXAN9GWbrlmvI8vFYRTlqgeFkmKZI8orUGnTME/ZvGmiD8FQKM2ZfGXOXwXQzQm
         j3Uw==
X-Gm-Message-State: AOJu0YypwIyX5cPw29bYLMtSOtrxY+kFc8RLR31guRppyTai2V2S6yeN
	R6ij8i5zomXVMRRwNlbgDcaVxJpBw7vU2BfLaRhuOcP/wCU90qmTYRyDsOJpImzOr7R7aAMaZlt
	Y4zLIupyDPe/B4Nhmt1rv1SjDzJd8jNdIRismrpYwaOjYGxiJlYw0A4JsBRFh97w7MLrWPQmvsO
	mDLUQOHPS8OOTkDHEd0ROu
X-Gm-Gg: ASbGnctFrvnEvyAyQptk0/kyP82Z6lEuA72ZC+KaNLcZb3YYsWs07/iIoD5MWfqmkcN
	zlxZCJZO0Zdim7pSwhurlUfFYxLiUOLE249gNHQOqGImmUYyU9dYux/4mcg2GxCnFy9DfcIqwdi
	KD+eVqD0FpG7CEL07+4lEkArJioy6QQtPGrlnMVR9lu7foRtJ0rY61LL3sPBw1Oi+s7WGkT/shh
	RDF2Zsx53XscCVRPv5jq2as0c4o52KfEatB83trtw8mnEX0rAh8hoBN5aTDAFQofK8jq8ZGEJJw
	xCmJKaQ56nKs/sFzesdsliQ45EKKrFMvECq4EpilHD2V9CtL+hJM0X7v2i917Fuv2X3M1Cf0QUr
	TVByL3TTnq0gvcgBaRRdp25EdaXL6An8HVRE=
X-Received: by 2002:a05:620a:1aa6:b0:7d3:8a6b:d24d with SMTP id af79cd13be357-7d3c6c1b54emr2501375785a.24.1750255532290;
        Wed, 18 Jun 2025 07:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUVSjrp93IyH/CGqzKld/bB8E+kF5urM76yh+V7+YUajgHrzzipVL6RrAIUf9ZyWzjA0v58Q==
X-Received: by 2002:a05:620a:1aa6:b0:7d3:8a6b:d24d with SMTP id af79cd13be357-7d3c6c1b54emr2501369485a.24.1750255531607;
        Wed, 18 Jun 2025 07:05:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3b769f9esm20164281fa.30.2025.06.18.07.05.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:05:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 5/8] qemux86-64: drop duplicates with default-providers.inc
Date: Wed, 18 Jun 2025 17:05:23 +0300
Message-Id: <20250618140526.1431757-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: I7xzNAYnJ_FRJJupO6BII6qo1VLkiaYn
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=6852c7ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=_kTybgIiMiGBH06O6-8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNyBTYWx0ZWRfX7LYZTaP4B5/9
 xHE0oP0hkVxtlJZt3XQahxQxGkRbZLLqP0es17X2vuYySafU8jt54AHnu+fchmcIxnD3oDzjTFW
 eZPNtEMElY6UBUaels8RM3VdiSVvSyxd0cnEa0bNu/ndnCpuegr+Q/5/v832dCVCuBNGsRuw7Rh
 ARGFDzQZj+Lis0nnrpfytQbEat88nC/x13775LgjVKePFwjrrnSThMUmG2kjrHtjBeSKuILffkJ
 CGDyeG6juyG0peqa4JYuMwIBAhvUfOGl3KLYdWwA2z2CfqsNu38YLh18v6W3Zjn1Nsa5R0kBHe2
 TwX6m1/WhLGL3+eC3CxOPcrowk1lVq4VFHwmpb6TBuD74JckHiWexsG+V4qchHVpV38vs+rQqhs
 Dm/38J5DRfCpjvqOrLag1MF4kleaNoHAKRXK9UFMYZ4dLuB/aLTwBPT6Or8iiBhyndbU2uSB
X-Proofpoint-GUID: I7xzNAYnJ_FRJJupO6BII6qo1VLkiaYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219018

default-providers.inc already includes PREFERRED_PROVIDER values for
xserver and GL libraries. Drop the same values being set in the machine
config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/machine/qemux86-64.conf | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 4a9c6d364bea..62108b703b69 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -2,12 +2,6 @@
 #@NAME: QEMU x86-64 machine
 #@DESCRIPTION: Machine configuration for running an x86-64 system on QEMU
 
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
-
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?= "core2-64"
 require conf/machine/include/x86/tune-x86-64-v3.inc
-- 
2.39.5


