Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B0CC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 21:21:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.7227.1750281674959929511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 14:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=JawKAQDW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IK1hQA015228
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xu1tSNh/BGY
	c0Diby0IJpTJtdla+PCUnH8xGzI7nHJ4=; b=JawKAQDWaAKw33+bGOnmP0hmI41
	aTQo3f1SUHjIDdTYrDAIisw0rNVXPm8f5Sj3K5yMxI7lDybt+/dQbAQv5HFXDwfE
	C+Vj66gYezmfEHIypHC6hTOf2aZOWukncz0mcVvnityaYyj58Yt8bkXUy9I68OWn
	One1VZYzjnDgLHPgy7Pr0+voCp8A3Fv+SiNpX2nG+yC4iU4OVTdOvutcY7KhdNnC
	9f43tcZBSSsrHMDJQHe97iT9PIjgtalagT0xCaGYyRVjRvCpXjCtFHpIvJpalCyO
	Oumj4eZoGu4xu+wp2th7sO/KrED7qtWH5MgNaGppDXgfy8LxWgdIgrdHmgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crwesg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d22790afd2so16284485a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281673; x=1750886473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xu1tSNh/BGYc0Diby0IJpTJtdla+PCUnH8xGzI7nHJ4=;
        b=kbD13XlsQApElzx03rmJWW8NHMPLWsz355qzzw9KUoNNlvlM2B7wLsN3bd32kZp+bW
         F1NvEGzYclkcylyq7y1pfsS4m76gdUouwOxyoEZSBtfzo9yZtPuTSBzjhpwT/IGSIE5M
         Mf6e6+EM/a9oWVbEcU0Fn0IzC4Z5izhb/+C6DfBQ9lxAxmEtnQhF0cQ3RjYeslrBMJG9
         ZiLVZLN/jv5VFd/FskSX0kucytGP3KNbaJiSeA/qArEFMbhdaC5tn+Hlvsu6hD1GL7r8
         n//hDdeOFSV08p4JS5H+nBNmHMaW4azHwPyd1O8yi3jPBm/cJYpq7HyCp63OAcMFkJI+
         24bA==
X-Gm-Message-State: AOJu0Yynx7CzzCvLBB9cqSjKIhg0vYfyMHNqb7iI+Ypw0NKXzWhMSidA
	znl16q5GFfldA214wWR2/8tZFWX5bmgD7kp++wTfcRehiMb08wJcUMVvlnKIQPKv5YNUdKKLhKS
	vXf9NsCRiqxrDQdi3QQpZdCA5zIcJME4Osg2o0xd6uyGOQpFfFz/pKhk/1zj4W3K0v07lotPiOl
	V6S5ycl3FWItf5mVRSfsJs
X-Gm-Gg: ASbGncs02My7aWx1x0qGBmie8fJ/HpX9PrLMCb6k+KYonqOLZCbJlF07gM9zIe4g0wc
	N6g1u3p41BH4gJ1rYUPUGdK1J6nHFU3BbQUMHR+nioXuNUfRy5itccV5TuAADEwVs4g7Qr1uzki
	Y5IXlwV9Y9KbXuZF67OInNiHGpKH5BF4w6Yt8KOtiR9x3NlM/Zlu6OgxuVChBMvzN+E+crTfbZF
	cMh9/KIyChXL+ob2aA6d1fTS5kmUbcfQlwWeQCmcf4oI1fb3rD+Dp4umSDjHBW52i1IofIF9qLk
	7QDtA+6VCohLVrEs7pN9uX8JCSVbinApBOPYqghFJ0LDYKlRmDomeuN2r9NaWVLPK7pODwqTr1A
	EdKxMXPFoTE48rZISJrl/IwAhZ9V5iODheWs=
X-Received: by 2002:a05:620a:3725:b0:7d0:a1c9:65a7 with SMTP id af79cd13be357-7d3c6c0d336mr2990111385a.6.1750281672909;
        Wed, 18 Jun 2025 14:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHql5lL41brisprobsz6Z0r4OnqhY9WmtkgnQOfBqUJVM0dn+67Cc1CdvZb0mOmzsL2Qowrlg==
X-Received: by 2002:a05:620a:3725:b0:7d0:a1c9:65a7 with SMTP id af79cd13be357-7d3c6c0d336mr2990108385a.6.1750281672497;
        Wed, 18 Jun 2025 14:21:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c12e2sm2368806e87.153.2025.06.18.14.21.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:21:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 6/8] mesa: enable glvnd if it is enabled in DISTRO_FEATURES
Date: Thu, 19 Jun 2025 00:20:53 +0300
Message-Id: <20250618212055.1529969-6-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MjK4poT4hAQj_-6yEg0xS86aHHmo18WS
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=68532dc9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=-I7fbvGdFZ1fcUDrCcYA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: MjK4poT4hAQj_-6yEg0xS86aHHmo18WS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE4MyBTYWx0ZWRfXxEbuEE/Y7Z61
 eY9ZLLmx6FbiO024iL3tTn1iWhtsNNmWhgV2q0bJuNeiKOQ2KdRCfHafkj8D1Fo0d2PA9pEvTKe
 iiZ4blI5oKueE/Fsw467q8FM02dgKRGBdpXjaNfUnUmL2BdXBlRuRYimF5fVfapXNt4yu1+jURe
 GQKtlYzXqT65KIJv3olhAtqD1Ol4I9AkIvACGOK71zqNeBe39ovppR5+zOvFHL7eKHr9QjuJlQj
 MD4q8OkRL+a/hTOr9bqYXfLyTYDwLSw9aual1aF27jlqbn0hUzVT9C7xrWPrn8nzpfF33dBCx13
 PsDhiB7idRD0X/fWtgIZQ7VhBkKPebm7yi67O1YMNamcpuxzrm2R1OPK2orBaCo7WPbfsAeiFL1
 ITpvDUEXYuy1jz1DCJ1lqyw4f4vgBxaH+euem+I6NHNqLSyaRAN61jPlDVHsB6WD9YzF9qhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219042

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


