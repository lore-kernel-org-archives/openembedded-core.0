Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93077C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 21:44:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.776.1750801457536650499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 14:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DlM/heqx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OGFPIE015686
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 21:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=i0qYI+teBKClBNdiqpukAi6H+lwa9ltU7w0
	ebTIjo1E=; b=DlM/heqxR7AMXlGE3gbdbWY7ZGjr0aAQdM6q6halrKx4cAElpQC
	S7BRazgGHNkf2nJiLsWc6DYO01t3Q4Cndy0yzJA3KCDnL1byTnHhs7JXyCmpLUtH
	D0eb9CYKxOHvC0VhmGVpZEwhJ4ZUq6oe5dTb6OBuGRAR6iwkr2BW01lw6+g7V/H1
	7/sD6ENDBZWWHbUIDvJYbbbGhtXJOmmxxcBl+5WB7mKmL9XyTtAtMdxawBis1KlH
	y7ms8Z3eVVzNJ+lvbQgURJkKpEcvWZr5nesBKD8fBvQrb/BL8SR5vIFQhN5vBx2G
	p4M4UNu+r66QHrBU5v9+hbXZ9m+MJ8vBZKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpwy0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 21:44:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceb5b5140eso139063685a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 14:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750801455; x=1751406255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i0qYI+teBKClBNdiqpukAi6H+lwa9ltU7w0ebTIjo1E=;
        b=sy0aPyXkS5aC4eNdAMmT6eEq9ON4s5wmur8OHBABcGON57qo7GNvdGhSjHC2jiMCLs
         Gj0pKrLf6O8DdkLUGscatPcggNk4o2bxD1K9T5gqrEyG7IsBPbUw5AC1uMSFfWdzYRcx
         kQ3uAgNgTTqHjxuEAUku1exrhzgVGHv228kYjweJOZaF12O3QWrXOIBOF1SbCLsksmyI
         idWpK0z/zQcQI5s0yC8M/DMUYJqXcjJb2/WT9hX72VZ4PeQu6/vDW4N9jWRLbDwzkQmF
         Nu7AVWSYfhd//0k73txUGksF24yTQhTPt/2rYWY0u91w91zklKsFcaEdzNW5CXMudtrE
         kw9g==
X-Gm-Message-State: AOJu0Yxdcpd+WxknV9MSNZvW/FBfXIb2AqIArYrMNGtkiUXvzrpKzkrf
	unSTZJZhU+2/2vggX2qTU2qGGUKP7iBbHzemxF/JXyPQcoCcSGmQDJsIOoJWLkWgepdCcXifAqu
	qGfv8A1G0cyYrB9/bCUit9Lqs5PO1w5OfvB6sseU/wRJIbI8xHDOuG5jj2u6huthNPMAT1rKkY9
	Xybu9NSDIN83nJFEJcoA==
X-Gm-Gg: ASbGncsLoSE6h+uEJzlsPc76/69sOvsFz/iFzH47e/WTKDtwdINGDZZtYSy0bzaZaLd
	psnG6ePfPp7Q5Ysf8NzdMv6w3gBZltPO7QsYX0gPijkmP4KDzNwKqpMFHnVpw/ahU5TBRnE3rCz
	kLpHorWb0ePOykflDIIoYQxo7ZTqbw5bsBrFrTFK+kC7a267SE3HOFuXZbgrNPFXHrX13v2B4Tn
	G/nbzyywVfDYVa/5PrjLFrwodhvxZ4MEFEbBSHmGCmW1cs7YGAuulRBIhYOCbOm7NpE11CTE5IL
	TkH055AOhzQZH/UxBISdT7MG3KYvCc1iomsjy82lGpk6gETyd9WrBMVpi4sq1PSpNCvZSdIza5u
	zMshEOU2tWIy9MKgAl//qkREFgaoPImr+27c=
X-Received: by 2002:a05:620a:43a1:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d4295ea098mr95433185a.0.1750801455412;
        Tue, 24 Jun 2025 14:44:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEngsBVk1cRrSQN+LKdfd+ORC3S2xRp8xrmQ3iAh6f3iSfJUt4SMbIJOE2Ng3Y3JavgNF1iiw==
X-Received: by 2002:a05:620a:43a1:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d4295ea098mr95430485a.0.1750801454954;
        Tue, 24 Jun 2025 14:44:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbd9dsm1964152e87.105.2025.06.24.14.44.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 14:44:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libglvnd: drop S assignment
Date: Wed, 25 Jun 2025 00:44:13 +0300
Message-Id: <20250624214413.2666044-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685b1c30 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=jjYzainrjl67WPU3hPgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE3MiBTYWx0ZWRfX/E2gA8vBURRg
 4a9F1hSKF8sLg2AKsjzSNJUbFzOtHeWEGsKNWS9NE8pOf8YJCsh9+p83IlvbfhNRJ9Qy4MlkilQ
 vM8o6iKZRdZqTsQaEGMB61arCioPFLDDTP/iCPRnBOoYcOYMK97wz6EIa13AxufDpYnJsKiVbK7
 LUbPynzGnSQNRZDNxlr0KsId1U8vvOtw0TTGKEDoHDHFuBTi/+TkoRB/HOuooK2cx2DEVkV2aXb
 +zrncf3etcKJ6+rDa3YnlxuxNlcgGrjELB3ZdtguyrfdqseW6cDA8AYJ0dyxHHrnIdnbA70Eu0m
 WAWara1RYwzVnhCxeKHfdsHQkFDxnvruSuOp1Wwyd5mRo9Dk1y6LNZ/VFZce1iRmEAHwwKdVNyG
 cLjNthHq0hFCh0/iMK7wFWXIScqkmM5lGVrUP3I6nr+8pL+BazyY+dvvgj0cJgb1gIOCu1fY
X-Proofpoint-ORIG-GUID: -poJIvrSUmlLu9gCWnQngMQv15TnFm3r
X-Proofpoint-GUID: -poJIvrSUmlLu9gCWnQngMQv15TnFm3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=865 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 21:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219284

libglvnd recipe was sent before the OE-Core changes reworking S /
UNPACKDIR rework. Drop S assignment which is now being rejected by OE /
bitbake.

Fixes: 621e9be9663e ("libglvnd: migrate from meta-oe")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
index d2a4b2dc51d9..1e4c5b860c35 100644
--- a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
+++ b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -13,8 +13,6 @@ REQUIRED_DISTRO_FEATURES = "opengl glvnd"
 
 inherit meson pkgconfig features_check
 
-S = "${WORKDIR}/git"
-
 PACKAGECONFIG ?= "\
   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl gles1 gles2', '', d)} \
-- 
2.39.5


