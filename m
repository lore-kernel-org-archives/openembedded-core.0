Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52381C77B7F
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 19:15:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.4513.1750446931421086670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 12:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Aumvxk7M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGVArd029047
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4e2BxkPexIz
	s8xpwI/AgOueGif/RjaBce9DCdNz9mn0=; b=Aumvxk7M1qlcyDwmEmV44OjrjMo
	Ylvz5OZZrll6SVndk9tgs7zLrepe95KjhqgMx/PP4uSLXrtTAeGiRLAjm7wleRmn
	2ajzbB6ps6k/xtsyBZm5Z3ROF5akNaWN7Nsx3Si8RiUuZDsUM+nuUUwWtE60HilG
	VUTQev1gdxQHxp6KwIKE9CgaLJdBN9jEFu/CJhQvi+bhJ3Zpq1+vqY9V2gBJPnyW
	GmrqQzt7gzYI9yCEwOlktDIUMg9aaJmUiku83Ztd1UCrUNqpl0tzsBiaGJ/gYnfL
	E0KvMz7qQHyFbJpyIZ069+Feepkj9lDwZeKoM3/9+wt7h58+vxSDAGphVjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47db82gcfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so429511885a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 12:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446905; x=1751051705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4e2BxkPexIzs8xpwI/AgOueGif/RjaBce9DCdNz9mn0=;
        b=D24Y45Ml7BKs++Uc3GOAZ+GSnf85x7pTCIkAI00/ikKQQI6MPeiDGo2eoEXqDDWDA9
         FPL20/5Xu/CBrAq89QzgswgbGiDEtPrFXCd1BU95+MH4yb1XRToq+c74HQGwSQZRrriM
         N9vGWqIE9UK61JqeTEhASPxyKoxAeKbktTkxCqkeTz/WXsAXRiMxSJe+e9HSIN6/TTba
         d+wb3UE4dNKY/MBj4PA7XCTJD/SqvKJWQtuitV9XtFUOsJX8Wac35ETitFVawOGt8oXU
         9fzDCyddZx3LCqysm5twM54fZNeeNvE1nYHNL/jiBtOpXelUWg2+ap9Z187c9htVWPSJ
         U9EQ==
X-Gm-Message-State: AOJu0YwCbBi40bMYn94UWuQ2cF572PD5cym3tPCahlly7OPse30FhqgC
	Uu87Tbsl78Fs96ymdSqvzJYFa7CI1zpd3Kr6BiqQpzogvBGwg5d8WG6LGrs1pd6KrTQxQRvYQZL
	0Szs/drnvYRVHEY0gIhTLiQV1iaa4zaQosi+0leHGC0apr2tlLtqX4XWYADkXH1wH3VMi5jGV6b
	CNe8CMMzJXFxXg+fb7WA==
X-Gm-Gg: ASbGnctMo12HrVC8YtWwwgmVkDxI2R62XFm8PT3k2dvlwcaH7pk2O3GLOi5T6TanXX3
	mb3JZ90tBuZmRQ3DpWe0JJ+gvi69NWU89obgrZQSwzogDis8UhdSwGtkcqDShYcdXCbkBUnxSts
	EoIsX9n54FVS/KoRDCup44+HXmXs4ViV1ob6W1QfCkqZnoIu5Ar24PamvoJR9Q7OD2YSvNAju/y
	WAq0zZ+KSm3fVBBHECRpCefsiMYQB+mgTky0JP1ws7oCm4OlZIacwLKLnEeZ7pxhAvGbhK5KMhp
	NDQNFvkC1s6idOuz8XS/5lDyqjhNJM5UyV5PLHl63+yhwgFIPN6anOviAmuR9iy6+W3jxJqeTqE
	k9XYCsSKBbZ+VsabHalea9VYpjCnWEBo257g=
X-Received: by 2002:a05:620a:2912:b0:7d3:b8eb:b32f with SMTP id af79cd13be357-7d3f9932a32mr620658185a.37.1750446904934;
        Fri, 20 Jun 2025 12:15:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoKjJ/We2ApCkmZkGWKqujDODHTl4A3aZieq6K8yGI/Z2sIuF7mAN5PKb1LuM9cpz8T3BaZg==
X-Received: by 2002:a05:620a:2912:b0:7d3:b8eb:b32f with SMTP id af79cd13be357-7d3f9932a32mr620654485a.37.1750446904456;
        Fri, 20 Jun 2025 12:15:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc124sm381614e87.215.2025.06.20.12.15.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:15:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 4/8] qemux86: drop duplicates with default-providers.inc
Date: Fri, 20 Jun 2025 22:14:53 +0300
Message-Id: <20250620191457.2018861-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6UoRcH0Y1kpeUoU1hcgSp_WanNuOW378
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzNCBTYWx0ZWRfX/+J0VcxODxGG
 ocm3nAolFAslB+vqXp7kSXzMFmM8NmZ2wgz0jyOnensE+I/4DFI6QL36KudBk9nvPgXtzbhlGbp
 qsLAFTF/evXBJt7SFTP5+Z4t+uoQIO2k84WzcExFZAmq6OoNC3FB6dj3IQXSPh6c3GMXO9nkBxP
 FPqfn6vVrJ670MTiPEvLnSp3fdV4ax20a+SQKNSNFkmortiBu6gQMnE9Pdc0EnaTn4qD3U0Kju1
 4AfKsBeCJxOgEAAKzsDwF7a57jRXTwXUP76oMoR4F1KY7IuoGDtWdgXpZ6GHjEwtmqG60tdoTxX
 PDCATzCu0aAQt/b9l9Yyaj0GQCD2j3NZA0BLtxG6dvL/s109NpKgdCHWKROcMNiTLf9Qkdo+wE4
 eygaoHPPKkCPG9iSqomUqbcdGed+j8MW/f04B14kmKRM2S/EoofPgK2npSLeR3NSoulGrA7s
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=6855b352 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=_kTybgIiMiGBH06O6-8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 6UoRcH0Y1kpeUoU1hcgSp_WanNuOW378
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219149

default-providers.inc already includes PREFERRED_PROVIDER values for
xserver and GL libraries. Drop the same values being set in the machine
config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/machine/qemux86.conf | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 1e072e1ae285..51f080bd2a51 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -2,12 +2,6 @@
 #@NAME: QEMU x86 machine
 #@DESCRIPTION: Machine configuration for running an x86 system on QEMU
 
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
-
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?= "core2-32"
 require conf/machine/include/x86/tune-corei7.inc
-- 
2.39.5


