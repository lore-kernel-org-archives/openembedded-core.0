Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D167ACAC5BB
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 01:50:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.2727.1759369842489652224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 18:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TQOtv4xJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbwBo031236
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Oct 2025 01:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YeXJaWyVrbuLA3SGrZw1oYnISoYjb7OZHP5
	hJ+mGDQU=; b=TQOtv4xJM4QCLNf92J9ixrf+scpVKkKl5KwTPvy8baO4Y8VjHzn
	NcsjG/WddHbmtLv/3Lp5ijVfi6E5BJByhw+4tZbPqWR0IxS1rvNOFSvBke+jGSya
	vmVjmLyAnviIpk8CvDfXWnaU9FYbrN0ULFUSO0U0cqdoF9wB5OQ/fIhX2jfCpc9R
	KUC+PWzGw9qWi9DzXA2qsvnaFk+ZQW2b/OzNK4AL1WbOvuFC/Bxs5YjWVgU4EUGR
	usmPdVsxIhkYLKLnj5WEdKlA4Xemd2NpY+4LabrAOGvw/5b3FUOFZ9c7FubVwVaw
	w/o7NZj2UDCLjG5YWU3KCX2a2UnatfKf+hQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr6dp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 01:50:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-828bd08624aso106942485a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 18:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759369840; x=1759974640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YeXJaWyVrbuLA3SGrZw1oYnISoYjb7OZHP5hJ+mGDQU=;
        b=axnnLp7oMcv3vmm5Xx9dWGo7PHFFB0ID8o051kbki6fIdJvBNEOn6fNKEVeBoBBdMD
         hh51SimLbfMtc/v611+jP7WadHHnX0Zo0SyPoweoUTAyfbT/iFkz3ZigSc1PtryivbWX
         pNNCiLMTp6C1Zmki2CRN6rH9pd60iQQzaaN112xYtsldzPJXUmtNK6JC93zEqZlm3wVo
         HJrbCWtcwgErqbBZGix6fXz0KBKEYkpnY95bFEqAhuqOMqHWZXyZXQe4syRqsXN4ytW0
         6fpiQnX1/CDCg3ERMswivNDZq/C2WoB4/MQbhV8WU1Y7BbcvUwIrOVNiKrnhT1QULgIC
         /C8Q==
X-Gm-Message-State: AOJu0YxC9ryqxwitL+PP6fXYWpvjiZq7CfRHLa1FaO6AEnus0520b7MA
	eJ8DqRMqB97QkzL/GCtDmvsO9tJMihP+iV47cfecnoMQrPjYCfs8cQ5p80zsAlegbCaR68NqahZ
	g2kt9HwzUhl25MnKENfw/wxORKCerqyzgy7ji1UG8pQELWQnr8nbYOWy+Nce/hVFSNaAXx6glSQ
	Fep9hc1XBR7CCzMdn+sg==
X-Gm-Gg: ASbGnctoXma3AncsSQ4ElIeI20n5TisNECDE/aWK1CYd7r244NQ3JodOOeKSJ1gjrYL
	q3Dj3zqMk9FoBcs2h28K/hYfTEngbisJ/fpYKmCKV0FLpAOZ4ttGz/j/11WvG9oC8o5qUsuEaYi
	EvC9hwu4Z3AgodY2P0WoLriNLVUHGOO3KUri+qWwgsfujtF3ONu2BtJu6/GuTRPecihKBsgEW++
	ywb9oJhHaJtjsRGGKQ9uXwTlxwKB7t+sLrGtItEwrEK5JEfs4VXpfqGSzqlIkha+FMbi0u+lSn+
	X+uHIf8FXSljKfKdzjkItqu6VPeCknui/5JaZBPFmfpNwvNZVWls6w0ZbNZqb9gsbFBu12wzXDj
	vkPQ09ddsmKFOlNnuraF/QqLGfln7u77Kk2ALBQzLh39OZR5M3EYXakLrEg==
X-Received: by 2002:a05:622a:559a:b0:4b5:e8f4:3f51 with SMTP id d75a77b69052e-4e41eb148cemr80511241cf.70.1759369840379;
        Wed, 01 Oct 2025 18:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZnz23Nl+UPNH72lgilYIsIRPfREYk1pLjUJirqPtRaOyFFcUlB2arMu4Sa3ZlYFzfWYOTCA==
X-Received: by 2002:a05:622a:559a:b0:4b5:e8f4:3f51 with SMTP id d75a77b69052e-4e41eb148cemr80511111cf.70.1759369839800;
        Wed, 01 Oct 2025 18:50:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011b120bsm363842e87.129.2025.10.01.18.50.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 18:50:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa-demos: split info tools to a separate package
Date: Thu,  2 Oct 2025 04:50:30 +0300
Message-ID: <20251002015030.2464972-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nui-URZUjgGCcoKm7VSWg91xdHMcYEx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX9/TL9evAwfgH
 vtlUdtwB9fcGcYklKcBQp/+WcqwdYRc8z1DV8bHzj849jT/QNbDCc0d1iZVa+g4n6pAKX3JPidV
 6ZIiZgL+Y9Sb+ll3P8DNeD8bNVUFDIIzNW9bneH2sSUN8e1wu2zrmszIXGjU+HW4X8qsGPtfVK0
 bFBmOjrSL3ZowvjEzM7PUC+5+YM7Ou6l79vJi2rugdFJ+SrnLnqtHIUsZHYeogYJVhOjYHWRacR
 HnFgW1LKeOT9iJ3I8c7wkwThEtQ+nmGvAGSRt6/7j0XoxfHzWvi/PY97ImUVOiN0Ph5+8vm11kS
 VgK5xnxg3+Rc0NalDkHbieHKEmXJdPc5wrFFSbVbVLmNNZD66GmR+a0WqogunNq/NtxHjRjDyRS
 wZ9xDnRcHNmvFg9VQkh2OqD/LHLyTQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68ddda72 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=EUspDBNiAAAA:8 a=f7a6eG5gFZbr4CpXDKwA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: nui-URZUjgGCcoKm7VSWg91xdHMcYEx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 01:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224341

While the rest of programs inside mesa-demos are really "demos", several
*info utilities have separate value as they allow gathering information
about the running system in a manner similar to clinfo or vulkaninfo.
Split them into a separate package in order to allow picking them info
the images without picking up the rest of "demos".

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
index a9e84039d2c9..0bc8519e90e2 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -20,6 +20,10 @@ REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 EXTRA_OEMESON = "-Dwith-system-data-files=true"
 
+PACKAGE_BEFORE_PN = "${PN}-info"
+RDEPENDS:${PN} += " ${PN}-info"
+FILES:${PN}-info = "${bindir}/*info"
+
 # Note: wayland is not included as the feature requires libdecor recipe,
 # which is not currently in core
 PACKAGECONFIG ?= "drm egl gles1 gles2 \
-- 
2.47.3


