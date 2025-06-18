Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41C7C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:46:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.3420.1750239959912399499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EMzsaelQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I4BUEn003033
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7zcmQdRI1bw
	wjjZTgFrx4QAMtqGOrMceEEhSysRxJRg=; b=EMzsaelQnvxHrb8avQbOfhRRo4x
	pkbyDhs0dgATbFqaXeCaqdeVeTxvvmDw6VoQ1UDFaZfFTVScmRzyMYSvkKV//cb1
	6VypUQjH1Bt8NBhcTudIVtVNmTWYiF3NtTXHltX88PSIkbjKrw7yuQgIks/XKp5n
	NKseL/q6Bv6IVAVd2SEB8YnJfZuB6xbVerwA4FIfmaOYPExmTyja/MPYmC5wHPXo
	asjz4Jx61S5vGWq6J/2sQTOj+NCg9l0P6nA5Jox1OzcewsOON5v/ORDoYDMpoSti
	eHKoWddKW4cfUz+VzGyOOXYrQdR9CFBicawE8TJ/HYMQ5Vy0MS8FnAjRpXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791cruea2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:45:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3cbf784acso1209807885a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239958; x=1750844758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zcmQdRI1bwwjjZTgFrx4QAMtqGOrMceEEhSysRxJRg=;
        b=tITHme9Bx1u4kdVndyFGkE9VyW4nCZbB/dAkVUCEdsmJE140w4QZ0ejCR26q6WfXC4
         ejvbSfgCpg1xlJJ9wK5q6BaVOxu9BMWI8ycW+/SHSHfKq/agrwALScwrx7C/Vbg9ry16
         0jhc1WfDhHvTjsmuP0My/edT+Du1wsCdkjo/RvecaWOAl64eZ3hY42Bh2Hb8ABlyyhnv
         /q2PoqIjJDFn3G9V3BS+kyQTYKvSIRMXwYC6rkfMvtoQ2QfVNtE7kqqgDENiJB6K/Mqx
         K4l6POaMeZ5dmfnyJqOfpr0TSJoTKH1VwlVHBrY/gDqmnDl4NrKyxSZpRxPXsl2U7NLJ
         Chww==
X-Gm-Message-State: AOJu0YxkPhgRgddnf6XLUefubjWOZL23N4BgcLn6AvlyQvtJ84Z1kBQq
	RmkWil/Zy1maGUV2AQYJZTFeI61uwK1jqU4wNwbmr1RBrzXrLMoTQ/5K8BrwyaiAr45XfwDMThd
	mkCkgHhGLKTSbNx8vz0z96KP6+uSq1sMgjn9fUOEIIZYdRFZfsWslHfAGjkFovKkTTfySa3hbDW
	Duj1qceGw7Y6b1Y4P7rWC8
X-Gm-Gg: ASbGncvYWqtyFWomXqKY/X+6tvmqeCOzYwcPb8vem+bujY1R671KWCpt+DtxvAjuIi0
	2Xg0fVYA6QrXhQnB/Ek0dKOf4ZQsCIzoX+J4h2S2FxGdspjK0Xm6WqcblQVEZFScRqaOZ0+P5E7
	MyVEXNJh+OyccTYgpTJY+rEhw5FUuWom9mz37QIsIIL0q5pvifYAAiLYqyuLswztT57XnucFL/v
	sliu5Z4NerDq80rv0l/0Mac6cEYNExfDjb69kUkFHY+xLZn8ZByRplT5F4Zt7aZTGGupKrdR/1f
	vYoabTMZ2qEO8hxpcaM+U/m1AdNngkcQ+pssJs47j/+Ostw8wW4FPd63dQ+P/pZQAmlpsoaSaaU
	+DQtjTixJ6b0sMOMGHtVSCnrOZr9Ie4htNww=
X-Received: by 2002:a05:620a:2688:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7d3c6cfbbcdmr2744373585a.58.1750239957838;
        Wed, 18 Jun 2025 02:45:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZes7+jtSsAMfQ3w/HHT47XoJCqzrOfaGStOXVyFDubLbo6HD1QKlIVdqScKNLGEj5O1pTzw==
X-Received: by 2002:a05:620a:2688:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7d3c6cfbbcdmr2744371385a.58.1750239957452;
        Wed, 18 Jun 2025 02:45:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1e0cb9sm2207750e87.201.2025.06.18.02.45.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:45:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 5/8] qemu.inc: drop duplicates with default-providers.inc
Date: Wed, 18 Jun 2025 12:45:47 +0300
Message-Id: <20250618094550.1335521-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DdHxax5217mliXwvZlOuGqcXxcUWzJmH
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=68528ad6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=gzXrmaAKBCNsOZIF0V0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DdHxax5217mliXwvZlOuGqcXxcUWzJmH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA4NCBTYWx0ZWRfX928ey6Hx866I
 E/fWyqQnLSjjuTKcDG86aNmwc/jjYipRDEEBGZcxL14kNux0WhyrCz5nNKb5X/vEP14r/NqpaYv
 foxeKX3xmJI+zqGOmPP8p1Y5kQasps8QQ64GR/341Pk1f5UPMswDQrIkj+sEO1DPuGM0FuSAxgv
 i2AVJusutkTWAkuOyI+WtCtmzTZfets2U6mJ6mcdfiq6Xqi+VtPYd3EhaGpE8i++2RcnzkQvqUJ
 9aaAfQO115DErvKzV/aAPAdeUw/EoQrB6zeqqurpYyiK/otiDKYO2HwuisCZSKfO5WyeqtbnG8n
 X08gk4folCjLZ/mYT6/o6OHFNlluA3n7B1SRCiyaw1/QYTjWdT6nDaf0NSFbn47kC3vvtlmqftv
 /sKy1HOm1w7fdiK9U2dqxRTM3parY0K9HYAQG7s0oQEuYKmY5nQevtfylG5ZSNXC/g1ii88f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218993

default-providers.inc already includes PREFERRED_PROVIDER values for
xserver and GL libraries. Drop the same values being set in the machine
config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/machine/include/qemu.inc | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index d7392d476238..c143e37f710e 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,10 +1,3 @@
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/egl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
-
 XSERVER ?= "xserver-xorg \
             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
             xf86-video-fbdev \
-- 
2.39.5


