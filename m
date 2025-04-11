Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BC0C369AE
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 22:09:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.38516.1744409367934779761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 15:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eYPP3ueo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BGKfD3032650
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76MdRSb+07Be4Vcy++jOlCWUNeA3y5UInl4V3IrBcgQ=; b=eYPP3ueoL4oz8v3t
	6KFGFFXJ01yg2uI6cHnCJZsFt+bAGEf1eo3VnW/GGcSbAWX/JnlzuxSKfGbeg7+s
	zQCAGSiHRBqS28FE6/GhbaaRDxUWlK0RfQ+QwPgHHtnmu7QwTGSBFJSxenuxSD0B
	HtwYTcoLD5uTNTfSBiFyy2jLzn22QHvDwxTzD8I7wmP8Bpbjgq+E1UFTrFd1Pchx
	/fS9SQ6cQs07UZxThJLzduGxTBzWeiOjCaNQQYOPjzkMspI0w215vNkYLsO6Na5u
	V6wGoad4HzZXxS6Ayyzi8KCoqJ0oLwZeWZkV4/QqCuRtn94eR3vsHXCaUWXwoecE
	LtsuWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkuhke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c572339444so336169285a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 15:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744409366; x=1745014166;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76MdRSb+07Be4Vcy++jOlCWUNeA3y5UInl4V3IrBcgQ=;
        b=sciP4J/rX8dBbm1sGsKe5r1uVhvu9hOcNz+S7wPzSgNDu5YJIsPFksmJj5FUpaMP3C
         CL0rrGa2L65naJEGPueKQHiB9D0ZAhlhthNhWnmtY2HYVboO0DxScepXCfNcg1oZpyvL
         2KR2JWGhsS2HoRE0PdGNdm5W7aWu2cLdcB6iAvw/NRVjZv6QEARqqJ4zs1PVq0YfrhiD
         +aAsMA9ZwNGFiqvifNscqx/27ZFJM9DLUCkc2Mh0n+PPftQfXgkXZE/3jgfGGt+0DPco
         99phPvP+nM5pfgucsnnTBosxuW7zwCL/YIPmRr4V9bW9lVUyYH2VhYvSGQL0fpL4q5Da
         MabA==
X-Gm-Message-State: AOJu0YyY/16KfGc0G/XX3/LscU7jdCWCf0xH3jD9qwoqr2a7p0lXfDtz
	xbDrlb0FMRNDR0WS02zibCesta3lWmzVF2ipuauyXJEg1Pfqx99S5DwcGL7UiTKqp9f1aMMtSLh
	2ySB3hAUypguRqnQeFJIPfZvzgLv3SvxIfR1uflSHxja/TdcigWqjXJxyIHjDvIS1bKjqBzMX1A
	g0B8f1UWYpMyo=
X-Gm-Gg: ASbGncvaa7hnqLulis4EQk7odhS7Huxcg/Dz1oLb5awsjnkqZUmwy0PEcafCQwag7Ej
	53xg9NIFA2vwMCHPsld1QbDW894/1uSQ1t//RAMYwmKDoU9ntXiLFy5I/VwqTjY2G7OF+L+Kopb
	v6mkPrBG5wk/IwHXDFe6fmALtjprA0YUvXmAEqUkTbAXVc1HHQoiIQ0Ik3gdCafFEcgjtDs3k8k
	b/WKacwaYOWPWZCxu/zRSuJ7fyhgIBYwKM4LycU5jwFcZ58v5+EzcYnQCSEcAqt6vaY8fc1hx2f
	GkLsKnzrv9Fv/rdYZo/3/lJb5jvVr7MQmOVBHfc2xUINO+lebpsXgmdiEtE3vXANGP123mf0GE5
	my551Sp0JAku/adwx0KQFHlCx
X-Received: by 2002:a05:620a:1a91:b0:7c7:a5e6:d287 with SMTP id af79cd13be357-7c7af12a31bmr623993485a.52.1744409365720;
        Fri, 11 Apr 2025 15:09:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWMmy5Xyjmt3dEqOC6bTJYq0F7iyMvRV6o5/bkrnNBQTZ6Nv9nVlK6hr7VId2CQOffsd9g9w==
X-Received: by 2002:a05:620a:1a91:b0:7c7:a5e6:d287 with SMTP id af79cd13be357-7c7af12a31bmr623990685a.52.1744409365338;
        Fri, 11 Apr 2025 15:09:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510076sm518432e87.175.2025.04.11.15.09.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:09:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 01:09:13 +0300
Subject: [PATCH 4/7] mesa: update patch status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-mesa-25-fixes-v1-4-791840391271@oss.qualcomm.com>
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
In-Reply-To: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GT8JDPv1xRVOMEObZ0wdppBBiUD0zMqQCDsgTGcw35k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn+ZMHnl2qHAaGW5hkt/jqngYxQzfHw2rCjo5+n
 m+vvKmnTg6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/mTBwAKCRCLPIo+Aiko
 1fDzCACUguhtB6M+qRDluH5fwFJOWS8bmDjguFgCYakrgyKJigAW6XMXMQC3UrdzgKEkWvQtJES
 yYFXjHr9NEJ0pvcCsSri3yoHrCPl7JyEtI9fvFgCiTdn5rsPn3qr/HEWO5UphdBN8/0XFut9u1u
 QLp9NMcoqhnQL75XS13FPKh89L4GS9PsSnTFFRh6ywmEsAL2+O9C2Oo1T26Tmf6Prd5NNnrWPvT
 eAyVc4yZ5NvKITlrwy+tYfoSs/e1HPmIawnlIzMzCoVFkRHG4BoIl+KyQi9nyuIA6UBMzTizWbP
 F77qdIVtTUzkcI0+IEa6vSZ4Gt2PLvSR4JK0NqPTPn9F61fN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4bmU4bwMlnGhUkPtTLdYww8JMDk6e9oI
X-Proofpoint-ORIG-GUID: 4bmU4bwMlnGhUkPtTLdYww8JMDk6e9oI
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f99317 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=hjY-yhfJD7uvjjkrABIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=972 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214766

Update status of mesa build fix as the patch have been submitted to the
project.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../files/0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch b/meta/recipes-graphics/mesa/files/0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch
index bebe30037abffab676bdd371116c1b9cbd9f9cef..f8af2bafb43333a2746b3bd25c794beec8db066e 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch
@@ -8,7 +8,7 @@ blake3_hash_many_sse41(), most likely because of the different pointer
 size. Disable SIMD blake implementation if x32 is detected.
 
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Pending [will be submitted upstream after internal clearance]
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/b9c6afd3a7c7ac302b47e70b5c745b84cb35f188]
 ---
  src/util/blake3/meson.build | 2 ++
  1 file changed, 2 insertions(+)

-- 
2.39.5


