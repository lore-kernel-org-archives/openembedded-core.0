Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2C1D59F6A
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 03:12:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1954.1765595535273616533
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 19:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fYd+ngCN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=MZln5INZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD2hY902121426
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gUcCcgua+/f
	i1mBRg8hxKfkoDB7ewqNY4VT2BqDjqvY=; b=fYd+ngCNbtOHdUSYXA9cZjUTcOl
	B/403ftgjrX8F6s/EZfhcGaV4ze2prSr1YlDiA5FLUvyF+KcPaKcdvYIMcyfV5lV
	oK0KshsX0tlPg376lW9NhS3sADGq0G4WRIqqM9vGZovPo4x57OqnwIcOt8VoXtHv
	c0ISpzAyz1agbUTLB2w553LSY9B8LxLFh8BL0spwlHyH3OjHtnV4nDJabwqdm6lq
	wvXT3MbiKGS+R3XDjC2q6N+BRlKo72hJY4giOM03i2at0pgE8xDakbpZcitlfEcr
	DICFVPnk0EcGaU8NvIL53Rb8CSN8cgQVCdUcncjijsNEMKrObS6Pik2R1Mg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0yff01fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:12:14 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f39594413so1143048241.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 19:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765595533; x=1766200333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUcCcgua+/fi1mBRg8hxKfkoDB7ewqNY4VT2BqDjqvY=;
        b=MZln5INZpxA+NL9NNBFg6HN11Cm1xK/+EvIZfuOmkeuV2RmO9sqyqyZm+dXvCXOU8e
         0MNr6OHa+lNIkBW65/0kbWbkBpnZ/8yty8IBjd4JezFaIsCvktT9YzHAk9j9o1Y2oTgT
         rslrUMgBNEr8ixOu+gAYNgZ1X12pVxEtgrKO87wmQwCXSqBQ+9wwTuA1nag8vuDtxdJa
         tSsWfeV+k37tdl9r6K0TVCk9GQHvg4iGF2d+GSieMCgC2nZRG/xV+R1NdgmGUeUI5NWX
         qajFL+zfuHVzTElhjVF79eC//kMGhXacMV8M0iP5QXIvUX7OztudyCZsXLXaqkCU9AJA
         nyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765595533; x=1766200333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gUcCcgua+/fi1mBRg8hxKfkoDB7ewqNY4VT2BqDjqvY=;
        b=Go/z2ecuUzy0Ziav/XXgVaNXEakoIv/OKrv5dTT0PlJD//Ke/y3f9SVir7jEnzk3z1
         Qwl0KXG2UylgC+VC7534Q+lmTm828VdkDJ9wUpXQImbVODyd+P4WZ9QjVberi7JSADfA
         yLSKLQH36coAsGmKKuP4RaOJCFNln5q7zOKMQLCkdS8IybzpPV1MxVkzg87DjVUdUTMb
         2G87vjCzHjV+pD2gKQSZpZItSMr+k3GwQbxOeEILdq3UTQ/arkJzIJJ7Jk5veHTdZ4Ur
         /W9SwBhcm/vv6S2XSsb5zXL6GE1l78bEJ8Dgbm0D8ozEUpdpE5wgrhMxhqreYWggwwY4
         SOug==
X-Gm-Message-State: AOJu0YyJKtEa8oQ8ndq09Okng/Czh5dI16DXpflP3D1l/I0J+18CHrdX
	SlGkE9CS31w2zkbvWk136cLADAKJ2XFTcFblE59zaYBzavd5rnxsGHzaEZs1PJhW0BAl8kZCWCq
	92oV6/ZmpMeFA5QuRXKDv9+AJ8yt4QWnR96gSrW9dNEgseUQlsGBv+XoMUtxZh87Y3FkBmdG2lM
	iu2vs+6kUDyd3YYsY=
X-Gm-Gg: AY/fxX6Q/6OJ0yX9W8nggnaKZDbuvgFtKha3rg4Ra/IHG3AHNXqtuQlX/ZDKnhxH2Q8
	hZB0lnNhF0i5xnTjcNO3O8YaNYbl4w3ZN180GZrh5ofMef3AfreJOovKTFJlL3BgsxoM+67gGP3
	Nr9H1XdRGY/5KMkcD1IFhfcTAYB8gTCm3HKwOHjU0ZxGovTfJT0UmJPGlWt9TF9+41YEEQCAPnK
	EtWKnGdFujYJdTZacWnF5hcMou8DtLZld93VCm1RuyL6wfA7w9z7KMxyRS5cIP2UZkZQZVlZhCf
	vU+dPr1/2HcmTz/0P0DBQgzkw6GCMr4acL8MAtjkkZDBw+Es7L3Hr8RflxOgB3BqgI8KjQ1GBQX
	rU0Azxez+kR/vlyrdE3L0jecQVK+WxzFCkXm/IBi8K8bW4vmXiGv/hYCToTSjC+aGdBZA4zrqZK
	ugKevJyK6ClJByTWNmu/YoKXc=
X-Received: by 2002:a05:6102:8011:b0:5de:93bb:c531 with SMTP id ada2fe7eead31-5e8277e2ea2mr1754036137.34.1765595533283;
        Fri, 12 Dec 2025 19:12:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcLwBs7URR/ueyc77Qy4hk8UO4Z/GUr0bcRUxLu41OrSxZfyzJgp6nPzKQMK7YIjc+8UfEgQ==
X-Received: by 2002:a05:6102:8011:b0:5de:93bb:c531 with SMTP id ada2fe7eead31-5e8277e2ea2mr1754031137.34.1765595532749;
        Fri, 12 Dec 2025 19:12:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdebe5401sm2814921fa.4.2025.12.12.19.12.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 19:12:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 3/4] mesa: enable hasvk Intel Vulkan driver
Date: Sat, 13 Dec 2025 05:11:58 +0200
Message-ID: <20251213031200.2619204-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213031200.2619204-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251213031200.2619204-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyNSBTYWx0ZWRfX/Fq4nfgXdPng
 W3wfEsbv5xnHw1U6qQaNb8EElTLMG604GEii7a5YGC0MiT0tp/aHhQ9cZMkO6nGmyNW1VVDVAaO
 vTD01T+sb8urVKaDOMZfFPftE9Y7h1akH9ucz3DuwnNVrI4aD73zT2q7quBaE2VGx23Pt9b1pKy
 9nBcokqeQkKODKi7oWBdsIjcPTvDT2YZQuEG3U/qt0ZEew912F3zEoD9V57wX1VX2KCm4j9VIBO
 3fDpTcsf76AU3kK1wQQqVQb07yt450DwaG3L5QiC9a6l9PC2Tj2Aji4qB/V1owPHHlavVib9WHn
 c3TfmujPDesYn5M5U2dkWgOojs9HQKjtSTRqd7lsetyOtKtADBlKTNzGtin1PTZR8t5JGt7hkj4
 kPvzaQpUiFOeZHMH10maYyaVU14f3w==
X-Authority-Analysis: v=2.4 cv=e8ELiKp/ c=1 sm=1 tr=0 ts=693cd98e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=-xNO0lgTA5BIskMkYwIA:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: QbfOoFlV0M-ysnsRLUQ0Hecy17dycGDr
X-Proofpoint-ORIG-GUID: QbfOoFlV0M-ysnsRLUQ0Hecy17dycGDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512130025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227613

Enable the iris_hasvk, Ivy Bridge, Haswell and Broadwell Vulkan driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ac6038873a72..6edbcb7da5ce 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -136,6 +136,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedren
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',intel_hasvk', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', '${VULKAN_DRIVERS_VIRTIO}', '', d)}"
-- 
2.47.3


