Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4532FC7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 19:15:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.4553.1750446931435429634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 12:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=N+cSUC2m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGVD3t029412
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PSiHvpORtK5
	4MleIl50UTzsfquyGBx/8lZqOz+FElG4=; b=N+cSUC2me1MzNUdgPFDQG2L8UaV
	NcsxesKqvtURhijZUm9W8QEBo/mGpbA1s8iKLMeYxdL2z3Dl1HUR5ia98V0wBTS7
	74juT4PKpWEbddMhvaIrYCzYha3Mf+dFLIe9IPase/BYqv2PHYT4YIzPw9TsXzz0
	HKhsVvtBX6l0HNhsVtjpbJlisUWyRMyWTubsgJdSwF6i8dxY3kNVVp6oU+WUhTdV
	KP5XKzlkDlJUaOdeQ7we3udfRTqTjmJl4vxupmiWPOyFsEdrlctE1WxrhjquJe0c
	Dvx0JrQwAijRxVZt1HFw4L1Aq6OaBm3U7zEGCeqbV6G1fpyP9iFVVwuJXTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47db82gcg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0981315c8so191093885a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 12:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446911; x=1751051711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSiHvpORtK54MleIl50UTzsfquyGBx/8lZqOz+FElG4=;
        b=C/iusoxY6SspaaHCFuXG080qzoW3QgNhFFN92ScmP4ALyx68uUYNywHxJz+T4Kbfp7
         AC/dhsqenYmJ/Sj9ONSmlknOCnzW8ydz/wC+dHlCBsGCi/rGB8oUW4CSxeZj/jYBannq
         Wg+aZnvDeQwaK05mPixDPt8//a1MayPVZm7DNltO1P5jWPZd/3U9/7tB4nvSzKQvWv2J
         H8mbOzVW1Nh7wI8rFn5Ol5njDDhgCoMfwDa4Yelkx/Obfkxvn6DWDDstkq2YdVaKvwQB
         gWSDVOmSUtfDyqBcY+pVGcDtmklRWUixqV/crvADF4yL6ukxk28huLGj3yxShVpfFCH7
         vALg==
X-Gm-Message-State: AOJu0Yznwh41zDMflb/3he5B7WN7ZyKEII1C6voCMTMnInPImDadBot3
	Ylbt6087Ynh1HJ3mRcCX42wdSO27c4khSs1jawDHCj3LPNa3GrloHtJRjz0GLxbkOhoXjZikEwv
	dS04/U7nQg7EoNI74nqdsF434WBBfOrv+TpfJUYCd0A/FwRewx1el4svZ1lhIga4qSbxaydkmZb
	NXvh8ZYEtIYeI9Rx+ccg==
X-Gm-Gg: ASbGnctXHrSUjABS5jHucPzySWlkliog6k650OLXgQjOOR/3eJxZTAE92yi0hn9nPZZ
	4ovRDoiBcbDghuCQ8HjUUO6mqWmXva+5qMcpii7ah0woZ46vZF7KnXJ989XUeMy0sANwzIDwc5q
	syWTh+ilaUfRRzkkYUtkc9ODqgl/oaGvtTeYd70lGm4crtyLFNfropt12TGdmuJiEhzm9OxjP0n
	jqU9w50g5eSabMAZCvyeDkuxM4WRx3uOr9AFw2MlUONNPCU+oB2dyks/swm8p+tsA/ph4M85riw
	iTWli7/MiKpVUpesbm2EunRmCS0Y/5JKxjC4mcJ8F9lLy+j0hDraa29F+uAGW4Mr50L1HrVRhF2
	SW8DYMiW4lwYxbY/1k8lfK6NsGqGLqkDrjxQ=
X-Received: by 2002:a05:620a:1b89:b0:7d2:1199:d850 with SMTP id af79cd13be357-7d3f98e75a9mr502388885a.24.1750446911376;
        Fri, 20 Jun 2025 12:15:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaOQ5Zw1Gh0175E30O17k3sD+4fsvsiN7mJwEj6OU+V5TMuJhTre+emO5TMaXwx5D594ZfAw==
X-Received: by 2002:a05:620a:1b89:b0:7d2:1199:d850 with SMTP id af79cd13be357-7d3f98e75a9mr502384685a.24.1750446910936;
        Fri, 20 Jun 2025 12:15:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc124sm381614e87.215.2025.06.20.12.15.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:15:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 8/8] default-providers: handle GLVND-related providers
Date: Fri, 20 Jun 2025 22:14:57 +0300
Message-Id: <20250620191457.2018861-8-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Y7c5dHRTnxWjVRDFfNg1c1AA48al4P1s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzNCBTYWx0ZWRfX2f0H3/LKbglr
 1Uc5nT8ogS7/Wc0o6snKKfDk1WG1ndb4gi5oAOmJWYmBaXkXYTM0kxeEXEHWXpvm8xJ83HxZuh2
 KJcNg61XX4K+RIzjKehGOHc2JL7LFBpe/0zbTMYc7rCg/vvl2WSK0h1Ap4F40/jyJilFahoTdOi
 sbGEo61ze13NMqvm9uKqv+7+5JMDBANhGBI/X3AODzhFe/vHvSjoODYqs8F3DOL4/nf7eoLcae4
 xwwBKtVaBHLgSEe418pO1jrBpP25LRrMiyKQaJBL8wzO4iuVrxuxfa1ifMt47e6oBDmmIlk+Jum
 TxOw/hY6P3URHk0VwdkWRnsuCGrhYWoeN7D4rRrg2qwZYbrAQnz2OyaPH4sJAwdDTIhAAOjgC0N
 Y2xgO/zeJGMiwhADgz/JzzAjyTeAMIg14k/DgctyvVqggEIN7+pFvP+lsdU0kui/u9PzeyCK
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=6855b352 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=K_Wat8gt5nRy7bLjIfAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Y7c5dHRTnxWjVRDFfNg1c1AA48al4P1s
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219150

If GLVND is enabled, then libglvnd is providing all OpenGL / ES
libraries. Tune default-providers.inc to select a correct package in
this case.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/default-providers.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 274ad0c4f630..3f113543cd9c 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -6,13 +6,13 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libsdl2 ?= "libsdl2"
 PREFERRED_PROVIDER_virtual/libsdl2-native ?= "libsdl2-native"
-PREFERRED_PROVIDER_virtual/egl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
-PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
+PREFERRED_PROVIDER_virtual/egl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgl ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgl-native ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd-native', 'mesa-native',d)}"
+PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'nativesdk-libglvnd', 'nativesdk-mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles3 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
 PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-utils"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-utils-native"
-- 
2.39.5


