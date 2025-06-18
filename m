Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3983FC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:05:47 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.8262.1750255536972746292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eC48fnDv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAHnw4016711
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xu1tSNh/BGY
	c0Diby0IJpTJtdla+PCUnH8xGzI7nHJ4=; b=eC48fnDv2pciDVD83EQU434Yn0E
	gS4vIrMnLKczD6fCpqUBnMv11AwYytc//P+kbyvCq2nV58tX8L5ICJ9FtrBsN+Pm
	S16X2gEg5wZnr2FDWe6rN1MLE+Jc7CvS4J7bnu5uypTELTOnc+GhTplRh5AdjBVd
	SZ2mpgIcW0hJ1MpV/XJ/Lr7T6MYsKTn513pi30ec/DfaCvo6nwj8UTFIF4ar3Rg6
	kZ9U0n+QmOOIqc8zL/v5GrvbopNdxoTv8l1miVRCNxx0khXiRP7ZemEnxxgEJeee
	Sh8XllWEZTIR2ZNyYCwMlFJCNHFrnkjrtp57R/arrHhJmxxWS0Fa3E05vYA==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crv5wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:35 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd045bb28so54919215ab.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255535; x=1750860335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xu1tSNh/BGYc0Diby0IJpTJtdla+PCUnH8xGzI7nHJ4=;
        b=d/dzst8xkRxPnbZHvSj+CJxuVYizh3lynFRD+ZErzlqLcqxpE/CZAl3+a1UHCkyc4z
         osPacLysm3r+dykgiw7Gs95ziVvPO6g0xgiGqUz8R4qUKvl9Z8cnjTYDOisMg+uLi5p4
         uLzoxYFKD6ZiMNAggvsNtvt9fnTyU6Q5YIsoy+Mzulp58mQ7rcZFGX908Vko+3PwJSOL
         w8tSPWNcZxQC4hYoL8E4E+HydNo+9zARqw0RPf8THju8U/ou1nKSiB3NloMyStuDp6N0
         5BYADUApY2sok+orZsnHxOikhJqGkIPmz+/oRHfgu169HzlhK2ytgRlRp9aZBoGEphpl
         IWAQ==
X-Gm-Message-State: AOJu0Yxj1a5oy9qE3PNeIEXIYWTwtmtKaJcKR1vhLsTeIlPuHNOYHtO5
	UNR75Ly4V22VqPhTfZ012sWJYDMtk5lPPk5nnnrhzm3CTpTxKkCjtqQ5XFvf11lnWiBhOBFaKiv
	0Yp3XjyosOPrD2Dlio9oYi1QgpYJCLMhypgjBloE9UIVvi6fT4K7SwInIlzr7S56zukvkSEZ8bA
	6sfAxn7bZN0KRakgRBWv+x
X-Gm-Gg: ASbGncumoCyclcySne1f+VwsLShF6qp3BFqbtEtj9hBli4500Zr4Aa0vvDXFGT2BCY4
	cO+9NTSBAeIaYE2Crn9GDvsN9WWUIrvQJ7imu58OMr1GGoB811CP86bEhN5wT1lImdO6e8CHp0L
	4RsPowWEnc2menG1Y6aHkKqpwQrts3n0lGTx2wotN7j0IpuaQIs0gns2+c0wP7+k0jTVFaw+Ge2
	+vN4FEnrVTMG0JsEw1yQIBmsz8OqNC+XooEc3afrc7Pg1RLPHFForXv3Av66HpniM+aORtMX/yw
	nroFDlinEGoF/S7rKy6pZyE8+AqUizVu6/gcNHIFGPJXeRA1YNcy5y1hJZ4RVPz8ka4nD6OtGEE
	/YrZoaUQZNWXEfu9ojZ1bt3szuMJjc3EAxMA=
X-Received: by 2002:a05:6e02:1a0a:b0:3dd:e7d7:3e1b with SMTP id e9e14a558f8ab-3de07cd1766mr210600755ab.18.1750255534692;
        Wed, 18 Jun 2025 07:05:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgkxJ3sR+XJP+kstJhG6ir3zyUU6Svm2ThB5fWsAmRQwFJ0k+UE7RGm9fHSZFwkXtKebDYsw==
X-Received: by 2002:a05:6e02:1a0a:b0:3dd:e7d7:3e1b with SMTP id e9e14a558f8ab-3de07cd1766mr210599565ab.18.1750255533719;
        Wed, 18 Jun 2025 07:05:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3b769f9esm20164281fa.30.2025.06.18.07.05.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:05:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 7/8] mesa: enable glvnd if it is enabled in DISTRO_FEATURES
Date: Wed, 18 Jun 2025 17:05:25 +0300
Message-Id: <20250618140526.1431757-7-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fo_neRmCOAQ6qPIPXbop9nD-YgDBT6nI
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=6852c7af cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=-I7fbvGdFZ1fcUDrCcYA:9 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-GUID: fo_neRmCOAQ6qPIPXbop9nD-YgDBT6nI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNyBTYWx0ZWRfX9dS+BKioEbiv
 MQV1Vy2ixSzlfiUfdWra0guGSVcETkdl4BzpFg2rp8ot6gBDbwjMn3njpauUsj3OmlhVpD4I6PJ
 c+GQe4rYp+jIyeOu7eeBv4F6nq+ucJ9R6hfvv/1lOgJAxJh2S1zP5v29GA8p4VDSlpmnfFfAhL3
 JS++3UqvcCqIqFhkCvY2yBLlVRN2VoR2lzMz7RHR1ZrxLUFBTZlsSV/YyE2NJyt6WNP6qDuiMqA
 6rSGURgFnAG2PjSEKWbWYQWgwvjNl7i/RNelVh2tAfctJ51TdEsAxzJwRK7BhIc8VxYSqw6ndjz
 yYSdiZmDYPlRLA0hNxIqVC0ABoafEdNSKARPiaznn3ooBfBMFmI2cGhIS0bQK+cCE4SUK8BDqEa
 veT2oyzo08RQ78Mqpgrvti0/fjcVfhNPx6mJmoFrSONj8TGGk4d3FAt/CpEvi1nRVAlh2Xwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219020

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


