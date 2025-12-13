Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79908D59F67
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 03:12:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2007.1765595527747446937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 19:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CcFXvg48;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=J7tFc00c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BCDO2kJ753324
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2tME15Ysik7zi9PeYJEBhrD10IxOCNGUypX
	wOdt03Og=; b=CcFXvg48qO8t3fUel//ZKB6qOhtyORVasSikDD0XE2f4zMCeHUT
	6pvEZ8sTpJQAorsDZ4wYeuETn5ryFOLIyyq7m8HLMHVKFfS7MrxDu/JihVxcJHyj
	78Pw1LhxPeyB4rBPAwSbMWmgZaZkr6077GbpSkPBk02a499KGuPRgUmrXiKuPljz
	xkeMnbWCV4byLiGZJDi41hro8VFQAHYdTp2LBYcgewKoL1v0G1mcWUrXv93MDfuM
	mbbdZVWOaBnUf/2wk0fJZujsR87cr5U2Clc8NEl5yzVVtx5MLiu9KRjoZeF75cCv
	K85rzkauuib8+Wfe9ZMjh1S+z9mYggZmFDQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0kw7sarj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:12:06 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9411b2335f4so1799540241.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 19:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765595525; x=1766200325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tME15Ysik7zi9PeYJEBhrD10IxOCNGUypXwOdt03Og=;
        b=J7tFc00c+PbjjzHb3ULn7dJoamiwBlynI1ET5y1hDGaUfk4eiC0BiRlErT9jW5t5fW
         2P4BG+dpiEIelKjRZ6qi5+yPjyyH+aQruOQU5Jhztlc62El/jyqYyiIJ8k3j2ZEAfTWr
         fpPNyULjHjMrR0QX/B4jBdgR1oNyowJLZyleD8lOFx2bPiqr24VNK2nzCdJRJ0/uKsO4
         HePsWipEo4aowsQKPUFcO1BDCjI/FvYpEOEkvJ1zUU0oClIwPJx6g46/Ib8PlyZNdsZR
         bKYRFAdwUrnZhk/Mz5YgIDhEF+JtdVj0YETY4CKpjky8GTqFvw7dFslqRqRvEGhYSfBi
         77iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765595525; x=1766200325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tME15Ysik7zi9PeYJEBhrD10IxOCNGUypXwOdt03Og=;
        b=GgIQDAsaxVFuQaQuWMhz/uAtPcqY40nCnmsfHs4hYDxoqrRKFaYP0ynY7A5+fX9Okh
         LA6qQrsZzZfKvSWTFwcnnuvIhEE007HubQM8z8xMYXIJSTvdlUTyA5C+zzvBm2XZEI23
         0CmFwGBSv/u7enznkq1uu3g15DTvXRrZsFzSlUip9FboHQT7o+9RlgjvCy0YETMVFyGx
         P6vR3hH7qaTNhFHLYhrISrXFK36vgMJVgI1jpBbQw3d7e08YVvKQ5dTSkD0BhG5rFjMy
         UVFVTh66i2EyLV3XTxAInpt2y4RldG4bO8tqy0VNtNJdA9m/2lSGhCSigWwnxoGLKMII
         mNPA==
X-Gm-Message-State: AOJu0Yxq2eNw+ZIaIGDT+t8UoOj7r9mdavy8hA4qq3UhbMHU26qbwWqo
	XZojsMU16EijwT3e3X1eL12nZLmOgem2cGlVoMEM93m9PnkUd0NhYEi4OhlqWIGVN3frFpTFo/S
	RpLkKsjm+Gx9RlvPak1IXAdpjpGUuJgp866NVHakMGsLYEXqZ8DCSnVBVfhsQ3xG/YTEvnynykS
	0zd7zX2jIAIkvV9rw=
X-Gm-Gg: AY/fxX6SPgxJOEaZifS+duBncnAmJdOLtVZV8B8hL+hOTbnoIhdnrWIygGy88j47mfe
	NtEwFAyab6xH/Tnyfo6dHsTB65ahH/rLHtlGUwmZuKRhFls2s22DV75JOegJNDFuBcX6Hhuh6nA
	kmeWGKrxzTPdNDRSJDJhagDElrqZH7jJxsjbxURnVXP/k3KjG4eXnhzu3d5cFwRAtWka85F02O3
	qO8vSPC5WLiA6H0AdcVDPrFskcYHmb15w6MdhGDbeEG5TonkNoUllSw6r/2xgLLKVJ1ptjXfY3B
	qB0bVyezBxHjzbhHmCdylPEnpp16ktqtdmpdVAeKYTmt/toxVeApWviRbME/4AfIuPu0em4ElVq
	0sb6pcH/NWvQvc1eg7A9cngjU6n7e/iI+GftgXJs7/oAjl9U3uOncaO+ilnvmYRf3iSkAZFQTdj
	ca6rQuQvWpg5O8NLMu71WtXDE=
X-Received: by 2002:a05:6122:310a:b0:559:ef6b:1efb with SMTP id 71dfb90a1353d-55fed62bfabmr1611041e0c.11.1765595525164;
        Fri, 12 Dec 2025 19:12:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5NBgHBS71DOgiLOT+P9yFuC/2govx2HWTL91d40O0K+WBFrhe+1woJwPfTYOpQiZ8ZTuJSA==
X-Received: by 2002:a05:6122:310a:b0:559:ef6b:1efb with SMTP id 71dfb90a1353d-55fed62bfabmr1611033e0c.11.1765595524623;
        Fri, 12 Dec 2025 19:12:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdebe5401sm2814921fa.4.2025.12.12.19.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 19:12:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v4 1/4] mesa: fix drivers sorting order
Date: Sat, 13 Dec 2025 05:11:56 +0200
Message-ID: <20251213031200.2619204-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JY2xbEKV c=1 sm=1 tr=0 ts=693cd986 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=CSqd8LzyNWODBqvqKkwA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyNSBTYWx0ZWRfX3T0nhHZo0CxR
 m0BliLj1KLwUxLsdeLLcd9F3G2+F8KCRw7E8iAw/US13mzDvFMKh69xxGsQ/SoqnDOYuc2gJBhX
 VI4wIQ8BzTOsZdMNJ1sU7Tv3CFjSxv4+V7QSwGeemn/uF8g83st/SLbq3WVAxe6RAo5yrjmNqe6
 ADRUYWVKCMKirmc8F3/KXRqJwx0qYsvO+dKVwXJC9ZYjMJ6u41OnW7JMr/fiIjLOlpmYNgjnE37
 CBS3bG/gWnCYCnqD0jDYY5ODrVaX4K+cG3QiC/iogVHRo7sSn3wBXui8n4ohcrIgMWN3IZtrya0
 0HhpteIlsekqTRlk9DkRa82sSBFYUIws3926l2JiO9quL+3sKgSlGflFTYHopsvgbcITbqwjhbX
 pfJ2lhWp1oOe0bnRcuvDHQPTF/gWtg==
X-Proofpoint-GUID: t7yFTpMYf5eb2V3elIUPh5Qtkcj7tCer
X-Proofpoint-ORIG-GUID: t7yFTpMYf5eb2V3elIUPh5Qtkcj7tCer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512130025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227611

Fix few issues that were left unnoticed or breaking sorting order.

Fixes: 64108679ada8 ("mesa: sort out driver lists")
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 27483f69514d..9b25bc0301f0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -129,8 +129,8 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom'
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
-VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
@@ -176,9 +176,9 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r
 GALLIUMDRIVERS .= "${GALLIUMDRIVERS_SOFTPIPE}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',svga', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
-- 
2.47.3


