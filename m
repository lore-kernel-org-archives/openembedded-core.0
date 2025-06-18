Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EC5C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:05:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.8257.1750255531550309640
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lKDleQKc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9FP8v014148
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SF/2SxdgCVJ
	hFVdyXueN66J/zGhkwBQ48ktSk4pZ5jo=; b=lKDleQKcCu84XEZBda0VtcgCoCa
	ccUlrwZAg2EwAO4L9atZmZhfik0d0odak7J9Wkq96/TcwsmqkADTRdzPxPfUGpl+
	7BLC4ArTE9TEKzI5xHmkYRQDkIGC0BwKh25neKTEtc2S6Dnp+FQcin+oHsGeJ1nV
	SCBUFekmM7W8Wp1oonbsGlHYKXrGjxwlBdC8AyPUn1oQdbBOY+n3n0jft1o8AoFB
	IdTXEei3OoQFVmRLUzkNw+panZyXAopQAQvbLJqwoU/9Ol9rfoPKkV0EBlUOry4i
	6FMJn48DGDgbrByIqWAWuFXKUtRUP24i/+OcY/KLIykR189b/cJVaV6vz7w==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47b9akutrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:30 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddc0a6d4bdso85360615ab.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255529; x=1750860329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SF/2SxdgCVJhFVdyXueN66J/zGhkwBQ48ktSk4pZ5jo=;
        b=aRVVS+WAwecfgyBIoTedTpQW6/LddNbO1v1xIXqbSPoy+gWJTWNEsjMZvxWHezt6A2
         utQWaX12I6D+/Ks4q0udh3X/HpAeFGK8Nnhc2ZAdPEXS43ejjnCTjGCu4cFFazEMt1z4
         C+5Rc1ZLLl6VBVGJZUuTe1z0RH0sy3JB7RenGmtmW9f1BPf5wSVE/MTSzYjRMjkvxcVS
         IIgkI8q9jvIXNwKoi7ZCZH5fPMnHGti+vA+G5kIHEEo25JLmu5pzNtmKdSre3FvUy0jb
         l3BnxMmKZgxcjeddjI81dwUqcgJ5W9IjkHwetDpsp947oYea4XpzArOS78fr11TLko5q
         cNuw==
X-Gm-Message-State: AOJu0Ywt+X981JTgnapIycneRr5B8BC7AlGMqXTzQEzAdphcD8isNSZc
	tXUiGF5/1Lp6oWFfpu6xw0VlbHux2HyS3eD8qaT53jnHI1myYbKMhKAjsYMsw0936DfS9+6uznO
	xt4q71CK0ckAOCyA41H/wHA7eIkTpgzPwQJ9qJ95FnVFMOK+pylQrzmRJcMOVGxjMTMJbJglK5a
	i3AFO9HDZ6D3orfVtiLqKN
X-Gm-Gg: ASbGncteSbvGXkHokI7vd8yQL6vJRyt0vubS7u3onMM3FxRbd6QXhrWQmE1Uh0bHHi8
	1fhPfzXVblGEBjyrY1HkS2Ijd1PfEQvZtwmQ0gbRkepieJguULIPwGpa+lf8rqItVszyhaZJ4Qg
	LdNCaIjByy+cvxnCtBLXbmkGuvyjKII9h8v+yxvheql63qiH/kQKvYx+v0Wr1Qovpe5FF54Totf
	Or9mbmp67IffvAKvUMZP8zesL3XQAj7AUl4EUNg1aE68OV1GpoH3MQR8qbLShKn/O+JWBoSvPj/
	1NJztHMp4+AC21uC9eINpWpmPiL3fsfSGs/qMNf9pbZxbRDimIakF3UBa+yAh8aDY/Mq7sEfzxH
	pyVdFXV3eaTsyW7iFJrbdwELe1V7g6OXlqpg=
X-Received: by 2002:a05:6e02:2189:b0:3dd:dd39:324c with SMTP id e9e14a558f8ab-3de07cff90dmr199159805ab.9.1750255528984;
        Wed, 18 Jun 2025 07:05:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBmn0XOqF8osN5OcVtidpvK7Oi7cmY+sPpG7/ttnDpXURxljlJ0U8x5ugSXjIf3d0Q9APEOQ==
X-Received: by 2002:a05:6e02:2189:b0:3dd:dd39:324c with SMTP id e9e14a558f8ab-3de07cff90dmr199159375ab.9.1750255528515;
        Wed, 18 Jun 2025 07:05:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3b769f9esm20164281fa.30.2025.06.18.07.05.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:05:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 2/8] default-providers: fix GLVND providers to be selected at runtime
Date: Wed, 18 Jun 2025 17:05:20 +0300
Message-Id: <20250618140526.1431757-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7TrT0X9rvXeDiej-aJKqwlXxe4vDLdVs
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=6852c7aa cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=FpLzd-OWU6oQ4w_CiacA:9 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNyBTYWx0ZWRfX5fx/ELMCeg3J
 C4kR44uJaTz95/+ep0Lvecx/q67Q5FZWJ/b0fGaGiFM/sIZOH5ZARuI4U4J+Kzdkr2h42e0Zn+j
 PYahx7PJ3gz7ktlCAhMjMyaEePUAB7LeuXJQjmcMsSpGpwCwsAakDHsoqC2Ai2P5ROqw1De/aXQ
 hZNAx9qKwDMHKp0gaBY/Vp5Lf9OOHmTMcKAo6ilqOq9YJ4Da7JUoIBY9+RjzJU12URNSepySPkk
 hk1yQcCOpHFuVq4fWHJH0+dxEp+usGaDfph9gCx8rB4jU2v3mqKh7NFnuIVlKztBvfWlblncuXT
 cLVYUG6b0hmypYuGj5TbzSLxW4h+NhQixylLQrUfmWKFCuUV4zwWEdCQhSbTWgsCNxlG2/yCRTI
 sZMmazHKO/Xhl2m33coakKiRlgvYWh6hZQ1GM0azCY3xXcxN3BfOcGI5w0DKawlTVDe3dDW8
X-Proofpoint-GUID: 7TrT0X9rvXeDiej-aJKqwlXxe4vDLdVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=934 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219015

The virtual-{libegl,libglx}-icd names are RPROVIDES, not PROVIDES,
because they are a runtime dependency of libglvnd. Make
default-providers follow that and specify PREFERRED_RPROVIDER instead of
PREFERRED_PROVIDER for those names.

Fixes: 9d3b4c9bc403 ("mesa: sort out PROVIDES for the glvnd case")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/default-providers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 4f094163546c..274ad0c4f630 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -7,9 +7,7 @@ PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libsdl2 ?= "libsdl2"
 PREFERRED_PROVIDER_virtual/libsdl2-native ?= "libsdl2-native"
 PREFERRED_PROVIDER_virtual/egl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libegl-icd ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libglx-icd ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
 PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
@@ -68,4 +66,6 @@ PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
 PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?= "nativesdk-libsdl2"
 
+PREFERRED_RPROVIDER_virtual-libegl-icd ?= "mesa"
+PREFERRED_RPROVIDER_virtual-libglx-icd ?= "mesa"
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?= "rxvt-unicode"
-- 
2.39.5


