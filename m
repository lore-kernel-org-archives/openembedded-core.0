Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB876C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 15:23:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.44007.1738855406183530682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 07:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eA8g9Vw4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516AGVxc015694
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 15:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dZcO8nT8U4zfLRA0lOqLx1y9Rdjqwbw/9fd
	7KjXv2+E=; b=eA8g9Vw40zTiqWsZcg83Xt1oOxfBuYqrTltjO1oM0ZqvEnBk/YL
	5hCOtw73ui+5xx/oeDAthMetTZDxiH3h7XnvipoB/RonH5iMd156twfms+eckMiz
	AC3DTyhZzjKRJifdvOjbNggW0n+BoZ815pVcLIe7fcJyOfhYD2Uoufje/It6XqwA
	3kQckFFq9s2KVIeD8ut4Vc4V7SXmFx5rhrI4wxBIoIWoMgfjSTz5F3Yt2a+8F1ts
	UBVSYeHfINvd4BYF7/Q2mFS4HMLTzBdUOZ9ybvgwkIgpjUg2FqagwLp56YyURxel
	tpE2ShvHEG73UfovXySHxEZzGbUUC7Ijq2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mu6f0qq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 15:23:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e42d5ff298so12182596d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 07:23:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738855404; x=1739460204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZcO8nT8U4zfLRA0lOqLx1y9Rdjqwbw/9fd7KjXv2+E=;
        b=qmxPwxpOutVIqOpf5EUY9TWY7fw+KTQRwIEjuCSUuvlRMDvX894fPtv0DMFF5wIESs
         8Gu3oX4thei7cixSziysOUnYBaeu044gdrDP48d84bzcmmsIqyEmQpfytBdozIuGND9R
         P35mMwNfvlced+8BOdC1nbS+4SGclHvOVzuLlhMTUtWZjv24CQ63XeqoOftzdMq5zFxB
         H+d1KNoPiOS2Bs+lmopZys8dWJpMQSOtVSAFKn++3yQ2sYuWTdaixnaSDgq1VgzZn+q9
         4WAoXW768Y28haB10IrVkhZ4aKauk6vGXZCUc/UKZUQKGDQ32rIqKzNykzQwt9Sadv2j
         gJxw==
X-Gm-Message-State: AOJu0Yx46CicLL3hkahR8d4uHYOqRC/XZjgsZWLamgVEHUad+8sZvAxK
	fJ2/Z+OK5vVkLyjO3+1bHTgbAwCcIMDUYB3h1o0VQGsDnVdWF65fsAbevZdn4zBg7d1TIWMhDsp
	ufKa3fYPEEAjbjjDbsYeip/obGL7KlKT7ZvCkSUY54tbNTET5TTcV52nYS+kQN+cgu7qT0EtBfm
	WYLTcKeDWhb5korw==
X-Gm-Gg: ASbGnctDLrfJrOeMqDQOaK+G8xhGbW49gxhydSH1QTRiCPlnW+PH6ghZOmQOx1csmwF
	wTNPBVX9T2JYRHOCdkbe8GX8a5sxCAKupCKAcED7JYDi8+ZaZ+ajgkw9zK5c3q1Va3ghOcAyWHg
	UCcURHMTjW6VFRHN5+AtTVbbNKtr8lVjgLr2tD+B1B6KUF5d3P9h5QNMm5JaRsGJaai8TJYGeGY
	4ViqBThEozBXU6L3COIAbWSysNZu3FprOtGQ2EbhwyA1QHLoMeTGY8U7Wae2/obsjuCBxiJ5utS
	SE1FYOGYigLKCBRPFjvFiNiCEVDt
X-Received: by 2002:a05:6214:dac:b0:6e2:43d1:5fd0 with SMTP id 6a1803df08f44-6e42fc6e39bmr104938916d6.31.1738855404192;
        Thu, 06 Feb 2025 07:23:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIQioYt68VpmnPmuqdE6BxBSoY4+95LmswH+D2WHdVkkQk/I+Zds/+UnYGtJ2o/wn6puG80g==
X-Received: by 2002:a05:6214:dac:b0:6e2:43d1:5fd0 with SMTP id 6a1803df08f44-6e42fc6e39bmr104938516d6.31.1738855403775;
        Thu, 06 Feb 2025 07:23:23 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773331db7sm113440066b.127.2025.02.06.07.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 07:23:22 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH] uki.bbclass: remove duplicate d.getVar('DEPLOY_DIR_IMAGE')
Date: Thu,  6 Feb 2025 16:22:49 +0100
Message-Id: <20250206152249.4066457-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9-MxsBiXBV6FfoJSiiYM-gbGsCis61xh
X-Proofpoint-ORIG-GUID: 9-MxsBiXBV6FfoJSiiYM-gbGsCis61xh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=966 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 15:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210945

This class calls d.getVar('DEPLOY_DIR_IMAGE') twice within the same
method, but DEPLOY_DIR_IMAGE variable won't change during the run of
this class, so only retrieve it once.

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 meta/classes-recipe/uki.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index 92f690526d..c71cf41182 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -130,8 +130,6 @@ python do_uki() {
     initramfs_image = "%s" % (d.getVar('INITRD_ARCHIVE'))
     ukify_cmd += " --initrd=%s" % (os.path.join(deploy_dir_image, initramfs_image))
 
-    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
-
     # kernel
     kernel_filename = d.getVar('UKI_KERNEL_FILENAME') or None
     if kernel_filename:
-- 
2.34.1


