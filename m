Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B220DC761AE
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:46:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.3422.1750239962627505021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Nnn8CB6X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9Ij14015318
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xu1tSNh/BGY
	c0Diby0IJpTJtdla+PCUnH8xGzI7nHJ4=; b=Nnn8CB6XC9bI+4YG+bOYgytrZcQ
	fxI3qtjgFZJ82x+eq7I+Oziqp6uVcbCTCIlwL8uyfLtHmiHXNemOCQ/wGkf8NUKL
	HqIy1WYK/OQHmjelkRRgfEiK6HjBzG7Bmxl3gLJyBvjy2+PYWn1YH15y2wXiLYF2
	LNl9mcLPKOJhHDqOSpYP2/eMZGk2lB1WNCkhcsnX4Dxbg8SIUSIhv48NKFZD/3OI
	BRxiyMP6eXqXA7cMGhHtIIEiKQ0P6cYhAHppZizs8E8VjfzWWg2x/RJzhubgFixB
	Jlg/RHjdQ3DH5LalboUBGTlOBseEJIvyxpUaTZUrehYyML48+kBeLXSY1cA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47b9aku2td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d15c975968so1176430585a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239960; x=1750844760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xu1tSNh/BGYc0Diby0IJpTJtdla+PCUnH8xGzI7nHJ4=;
        b=CXyFj9KpXdEvErLKI2un2nclyT6xNuuY6bL8ZIMzW8slp8aBPeZZFh7bhQzC/D2rQg
         +iCi7nZXDOsmd9TfaWvDazrHEBRkqLAmtpey+qHk4Bug1FchI3Z0J/7muiqrUTB5yP71
         oZvz2u/IbgVzD9NSNC7Yl+/u7oi6MYf3riI+Lkdcah+x5NCoIcwLx4KBVhDud/3D6Zpp
         8wLYqb8DJwZLxXdz3iOJJrDm1cnySiE40vuMaNXRKHWRfpIUQTPH0QeHOh+smgiI9o7s
         lJ5KAAyAdwsRVJmJKdVSGN/GfS26xT0E1m+T+LxXRKiZYxshs6sAJ8F59kkRp3TnLiY1
         H/Dg==
X-Gm-Message-State: AOJu0YxAdKzaO+3BaYXfTN6I2M+KmsbvWQeBkA9cGLWUyDrcxbLoneRl
	0glCRbEcdOi6EPJDAlxerJMOYZy3iBlXOKaja3uieRxyxkuDwPajrwsj0LDhB1193W5P+BYFk76
	teIRph4QpcYIlmrbugtAL2p8+n7cyQotGqF5vMhn8ZsRu0LS7ACY0XFTVN4TcfLbrsIzEYeurLa
	P622pFfohkr1Q3cI1nBg5q
X-Gm-Gg: ASbGncstuRd+qjypp7FYwgEQiv4amrBxzsANXTzhRFosTGM7qovw/8ErZYcuw3FBnD5
	WYnBptJeAnJ/53RnVc5KS9Nd2+Q0OPyVTXo2c10evBoYnAazx5DELdwAJRgMuyuTua0yh8dvtZI
	Eoiz/pi+kRh+uCIT+nQJKyGrdk7oxobRgSb47Atv1vGlDCEZctV4cU8hcoflni5v4KIWzf+W+CM
	YA3LBNTJghZIdStLR6FnPCgXKxHjEt1oSOz8rahDJlCCs6EOP2SPMsgNV/ejGiEZZ/PGMGQEDBO
	tQ5jB7xxc082kAMpq/BvoJCrsKreToaR32Mk2oiea4oPB/N7F1CjVMKFZFEc6MdlKKJJ2XNbqpz
	k0mqNhG8Dc4LOMEKxMm7setfhlRX9ZBWISZ4=
X-Received: by 2002:a05:620a:28c7:b0:7d3:8d2e:1f69 with SMTP id af79cd13be357-7d3c6c209c6mr2328038285a.17.1750239960623;
        Wed, 18 Jun 2025 02:46:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+VrapmNOgchN/uQ0/Af9DoMVXw8CMCGF2RiLQwmHGbgmbNtcIp3f8/x0x8Tlq02O+VvBaUw==
X-Received: by 2002:a05:620a:28c7:b0:7d3:8d2e:1f69 with SMTP id af79cd13be357-7d3c6c209c6mr2328036585a.17.1750239960172;
        Wed, 18 Jun 2025 02:46:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1e0cb9sm2207750e87.201.2025.06.18.02.45.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:45:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 7/8] mesa: enable glvnd if it is enabled in DISTRO_FEATURES
Date: Wed, 18 Jun 2025 12:45:49 +0300
Message-Id: <20250618094550.1335521-7-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LjoeRFwltHYubLkqdlbkaPodtZer6FT5
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=68528ad9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=-I7fbvGdFZ1fcUDrCcYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA4NCBTYWx0ZWRfX64maqrAqLtHI
 wjGHE/8SHw8mkDsDoE5lvHEGB01g+O5nrRjU6RagtZ/bIBoDpm1sfl2QsURJNuOct8mNKNrvknd
 MpQrJOhZOmiIhmQTlTtnfy8hnSV9NTfY+3YrgS/tSwKVOauCoVWCBaai+VFW3mpcBi72pzN5r6/
 X5wkssHQqkCkE0X1OnWoB0EkI0BgI8dNhn1aJYkeBhUcMk/MqbtScgH2xK7qxdji+sQl2Akm83M
 RST402ZEfqPU9uddxCXLtK+GlKpb7tMoA9tN35oyYjj5XuCVDdHY6R0bIfjk6FpzadBSQ1jJpg0
 tsae9yCTnpHnq5zX5opo4GLwgebetCCUsKWtpy3xYjT3oqrOYAsE+7hX1VRJx+pR3SV32lvY4lR
 I9jqT/to3yQs2G001GtvDIOndoblEioEnIn/DFEKcAUlJ84Nr9pgpuRvb4nJBqMdwNUC1sZH
X-Proofpoint-GUID: LjoeRFwltHYubLkqdlbkaPodtZer6FT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218995

Let the distro to be a central authority regarding GLVND feature.
Make mesa.inc enable glvnd PACKAGECONFIG if it is enabled in
DISTRO_FEATURES.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a583edc57f6f..99047c798607 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -85,7 +85,7 @@ def strip_comma(s):
 PACKAGECONFIG = " \
 	gallium \
 	video-codecs \
-	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
+	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 "
-- 
2.39.5


