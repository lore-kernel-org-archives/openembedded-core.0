Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322D0CAC592
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.30932.1757937344526161860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YFpBEMoh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FhA9014105
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P6IFepq59Bm
	r12G3fxc3bZQym1tM/JizzG//SN+sRuA=; b=YFpBEMoh9OqZGqulXxRI5J1myft
	pTI4c1ySlBlsqjXeclTb2KVpsuXVWSGiYMarNtoT8rVrsWxhY79Tjp+rmhTS0y3z
	BFY0UHlWpOjP6BFLuvdYfd7mVJGocDoq9hz/TojaqDTCeziPOiqCuhxV/2vqrJ4A
	PzCusV3SWnmDywt7ykCOTocj66gUCnZLJ0XXWwSy4J2lamT+/rJyUf0b8ENpunDB
	xjz/CtVCDXysroozIc/wu9xQU5j9eZ24ojvpHsrhbU2pplNq+w360TwvqNqf98nZ
	12QPrhOM3mWCMM3yz6RK5or+Xx15BMQDCOGEYfn+gFc1N6U/gTmeA7Qhw8A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr50g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-77d39d8f55aso19231106d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 04:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757937342; x=1758542142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6IFepq59Bmr12G3fxc3bZQym1tM/JizzG//SN+sRuA=;
        b=otAAgsgmZvvGYarST4KOLYaIIakMxqbb/kR1/41iwkMLE83s+dSeuSb+whRKd+4Wu8
         CyyWLP9yGno44m0eXxt9MKh99Pht0AfZSQg9tdcejQljBzdTz0fc4bF2Yu2ZKBpRqMHu
         iOAIzgdTG7BkOyN0rjK1Q4PsbShnEN6h3MofLdLRcPIyTuj0fJv//Kjw846LLqHZfyhC
         hGKaSJp6iv3cgbc9YrdQb1MXz9sN9DSuEQpMt4/YfmxRoVnCcN5UOGOSLQBuTDuhrWXg
         h/dmCgpjNq7VTJLEfraJT+pUOuYEaLocKqg9VrdSoM9qMaq7cMJFP+eTYujrivb/lJt8
         MX2w==
X-Gm-Message-State: AOJu0YyWQayq1xpV63vTBYkQzepCwnk5lI2VtOEIUT8+pykLRhAQojdX
	c4OTp6PSZzvDUGI5iiB58EUHIY5lsTAZPm4UfUsguhRoScvFQ2t+n9l3jyV5Ssz4T42cfhQB1dF
	YrYyVzqkjwsZfJj8N4mDhNwu2+Am6h/yf+xiMY0ue9s2r3rftaIGX/dOSo/56LE931sSxpQrOqS
	dBLcYFFCvXlFsOePY=
X-Gm-Gg: ASbGncsNlH8S41ywwCPEfxUsHDFUbkip8bmOf1a2dLu767vmvO6V+wcEq2CE5bOAFgb
	nvuFo1DRArpcJiBV82z+Z3y8QqMDbJ66gXcKiDXYLKgegXfv/x+mfTlizE3/b3Qja3xNKVUvtPs
	OvLcrziKmTF4ge2Vu+xEBNvaLIMYuHiGinVtwvMBf+SQMSMGkPa3dcPpfAMi5cBp99fRZLrEhBU
	2dhbDkL7IlTS7zan4L6yQXGLTt3I9Q/58HRBbdAJRuxJurMIdK6JyMD0uMJXQqxqQLVwASVWUsB
	tWoZgiv01k4XlNk71nFaFZqYK+lJhROT69WJsZgfwoVe33+Y1nTCix818wy3LpYLpAOGUTdQknl
	ZwnwDi1c7ANAixO4RoiFS5kEXG+mI9qkBMMyydjx0wa5LtWUjknFx
X-Received: by 2002:a05:6214:1c0e:b0:72a:2e5b:af2f with SMTP id 6a1803df08f44-762279e50cdmr197221756d6.30.1757937342433;
        Mon, 15 Sep 2025 04:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj6wdLPh5fYOFCwHJcrIK+KgqEKYFyIzU5JxAtFIzC0mzz53Eokfs4VTBFlOA1paOiEoiZLA==
X-Received: by 2002:a05:6214:1c0e:b0:72a:2e5b:af2f with SMTP id 6a1803df08f44-762279e50cdmr197221406d6.30.1757937341854;
        Mon, 15 Sep 2025 04:55:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b491f4esm27893991fa.49.2025.09.15.04.55.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:55:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] vulkan-loader: switch RRECOMMENDS to use virtual package name
Date: Mon, 15 Sep 2025 14:55:39 +0300
Message-ID: <20250915115539.2685622-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250915115539.2685622-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250915115539.2685622-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lSyJN-uW6x6QSzSDVjjB1hU38NqRFSM5
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c7febf cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=kl_ScBXZD0_wtlcJHykA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX5m4VeHJXL04u
 6B/uBC2rsZZEcVudo4M3OaSEBmeWOD16zjaDp2zt4H776mizK8PI+JJvMhAMjTelfy5vYN06dUl
 sq+Ylvw33maCU6CCeo9kcA0f+78YrTZx5usgi/W3g2zV6ZYDdFF113kHvacNrTW6r9gXC+0Sr1L
 4HqMW8M5D33sqBp9dRbITcFLL5BuG/qPV5taLxYHV1yNeoITUTzAanmIiDw95vZ3Ef1k57WSxJD
 FQQcFwEtR7gxh+BSsHcKFkg/txsrGpmpvmU4qsHV2XH5qiW10kCEo4P38DhXEmeEKwQ91uIBkIy
 qIYEBkpUVJGUDLIWIWaceNlzcmbDR9DM34AAWsQ3FD2w3sCjJ3RgD5XG1B75yMyXjJKn98KGyBk
 6Yt24pzi
X-Proofpoint-GUID: lSyJN-uW6x6QSzSDVjjB1hU38NqRFSM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223487

Instead of always pulling Mesa Vulkan drivers via RRECOMMENDS, make use
of the new virtual-vulkan-icd package name, letting BSP layers specify a
different preferred Vulkan driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
index 772705dff756..8ad088fa7edd 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
 PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
 
-RRECOMMENDS:${PN} = "mesa-vulkan-drivers"
+RRECOMMENDS:${PN} = "virtual-vulkan-icd"
 
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools,
-- 
2.47.3


