Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634E1C7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 19:15:12 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.4541.1750446904737996613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 12:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GkBvwBb1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGVD1u029357
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SF/2SxdgCVJ
	hFVdyXueN66J/zGhkwBQ48ktSk4pZ5jo=; b=GkBvwBb1L5NhvhexhYnZp/6nEqa
	sKIR8Sk4Z8xfJ1/SqIJ0kJV5KuDw/5kWIKhxFQ2cWT9kEIuxYKCg4AkcVO7dDk/Y
	AN/Nd8ujDzwvhXEAwSyPc7/TaKsyS7zhfZKM2aqmSsNsfeg/VpVkxMip4NBnAxiC
	Lh7wYyhH9PS+A4A0+5wjMA5dYguop8AANP2HelTFjTE94zgLhVqcRuyGpTv/wpYp
	GZZJW0La0GPFNaVmz/nEkOrF48qxNjse5edtfALQkMMyxZxRr053YkSct51BZfNd
	EZLdKryl3MPqKJKqIHrUPexbHw+7Egoh0NwgJY4+TjD10kocE9ggVkWO8rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47db82gcfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2872e57so309386385a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 12:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446903; x=1751051703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SF/2SxdgCVJhFVdyXueN66J/zGhkwBQ48ktSk4pZ5jo=;
        b=QPWEyv++pZtxPrLIpwIhE6DoKh0ZS6nugfEUKFmWpUoH9xopi0QoKlQvrvJVYIo+Dr
         a5SI8TT6agaN4s3N1vgCPmYId3VibgRyMR+BTiq56rmbNgCYWmSb3u5M6bbrHgFQSIxp
         4evN57bb7wtCYnlfiZs93iVjXSKwjc5+Zc0NSeX8Df+E5D22RklqqXHVV/s4hkid5WKp
         CeNmJp5emIULLhhdZrsvfB09r0Pta/lC0iEchZU7E7YeJmxRAxOqTv3LuClRcCwUWNxl
         sedGekYoQIa5DhNTQaGtSlwH85Aa9u+y2ETNgnAWKo148CqTSqppgrA2EnwbTdvZ+KMJ
         j0rg==
X-Gm-Message-State: AOJu0YyL4V8eLU9BFAYvj8802f/hwyG/5hcvvGcMCqjC+yvY/7VyclIk
	M2ev0UvfqOim2qu8OGeYxUHNN7vbNviZQpl/JjxPuXzt1uKpzha/+YD/M1hDw+IEsDtlTF2z/Yr
	kgztA/nYcEJEIqz8AcFQAlzH9mm5uP8mhivD7n35zK6lqopqCeCjvjAAcu9akrimmnL6qi4HK1v
	OcgReIDos2UBtBmwFKAg==
X-Gm-Gg: ASbGncsABseVtOP6qsZSdYanwjLeLUA8ya2ffI0ua2Bs4hUw+5dbYY0lBGSM6p3RJ5x
	WJL8CywfEOWQBKnLo2HSDoD5JQTj/T5Eqc4Moaej57CZGEuxhLD+cp7Mk/FiI6zSFNNj6B5Axsg
	3W//ADpU4makLxatPmwadC4ij65BZvIzzK2JHy6XGDtNmpSO2+GQREFVw9/2MlFp99QkfgOMI7z
	D/+zQkDp+qWP8ROb0Ql7g18QRery+QFExiwO9yQaeUmXVpC8tP6vIJkBYjS0ViTbFhFfYE4xErb
	x7ISMJ5PHIQ4Kle39cgpjfDiDrR5KK1DuQsAtPD1eTt/argKrH1AFYxUayP16EmWFj8EPQVpEg/
	GGa0dlYTgwgqKCIikMijJIVYB7Jqk9e68VfA=
X-Received: by 2002:a05:620a:394c:b0:7d3:b293:4373 with SMTP id af79cd13be357-7d3f996661amr554533585a.53.1750446902554;
        Fri, 20 Jun 2025 12:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM6VcMCeUTU7kMN5PkMLnXa0r2WR/R8bNis8R3a5hlB6yurEFhUCAmG0cMRn91w1LNEMFLVA==
X-Received: by 2002:a05:620a:394c:b0:7d3:b293:4373 with SMTP id af79cd13be357-7d3f996661amr554528885a.53.1750446901928;
        Fri, 20 Jun 2025 12:15:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc124sm381614e87.215.2025.06.20.12.15.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:15:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 2/8] default-providers: fix GLVND providers to be selected at runtime
Date: Fri, 20 Jun 2025 22:14:51 +0300
Message-Id: <20250620191457.2018861-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9uy1_DXktgytFW9B-izbke61wXbClA2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzMyBTYWx0ZWRfXzBzpqLS5dk2/
 G0HF0V2RKUBdP0Xt19+k0vLphtHpwbhpsg5W/eu4YueOJSDTPL79K5PhC5/wdjUWW14beHAKrCn
 sDBE7PKK/fSuHY9FAyxfpA5qSJoLV8Zf/R4l4Eh/QGMj8IMOz+F3fWVxj6A1JwtQ1IUIehNt5o1
 X/hY3KCIOgui5pRNuJ8rUMVPa/RzdZylX0KQ/ZW6DA0fAsYTALKeLtAlNlnktQ9ntonW7N585g6
 RtysVa9ce//rBA8dB+jYvoQH7gi8+zyjEm1vR5LLSZltCSQfXPJ01tP539Lyq780mf+ZqoQy1kj
 UfZm5wDm8UPowyc1Ng1dyhIlZ7BRc+pr+4+xC0WiAMzdHGZODdvQo96QbDOyhu0EhQE4JnE31Yn
 UOUx40RV7RMvIXCCrMDi3u9xNqXOkdJH5npfbTXNgrd/qfT4TAurMC8XeJf8VL41G7+BbadG
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=6855b337 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=FpLzd-OWU6oQ4w_CiacA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9uy1_DXktgytFW9B-izbke61wXbClA2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=934 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219144

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


