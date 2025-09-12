Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19983CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 13:44:36 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.17150.1757684673184891361
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 06:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aHgjdHgD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fOpM012845
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 13:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Bik27j+nxijKPQVmSRo6gsI4RvcJXEjwuzd
	hg31qnWk=; b=aHgjdHgDro3X+xhLD/6E9F4ZZexAdWeSBEO6tDQuGfk23e/oxUU
	m/cVtlstjZMiXCwIzVGKDko5KSpNYMWfoenEkYjmIghTG1IEWiXJRSR3aOqjeqq+
	2dqxSinOFn3AKflljgqazExDzGy4LrVvaYM2wYtE4kfbl0fFV3wwAlXG1HuyVB0/
	8i8sS9ZUmiQv/IZWA1SVHuiyLytnpTv8y3dtX0e4VtHHn8r9LwnFlupcfMxUBVdD
	tKN/VlimQSB2eIw0PkaeHkERntZiTjGVJWChHSlH6KUp8b3V3wwpNoeW3gXQTP8Y
	mN+O+41ZCp9ElQxHCYZBcI35bPwtmRaW+sA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqgbh2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 13:44:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-81ea2bb8602so580672785a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 06:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757684671; x=1758289471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bik27j+nxijKPQVmSRo6gsI4RvcJXEjwuzdhg31qnWk=;
        b=RTvQ7eTq/WHdiwaf6NnQ09z7detyPY4ypO5W2uwb1kO3mCfAoOTHZAy1JxYA8Oyuys
         uIbH6f9e4kgtr1aJWFliCBhjgDBettWHnMvETdCqPGo73vx+78rDxawY6ytQw6LfxDiW
         1MssEd0S/FqXRWaWXwUolnoLEvUnIr6vfuCC2gJFz/Uzw+VBF1DFL7vVFwjN10aiK2Zm
         SZgw6JYwuSxiNS2lCXphrIMp7IOAThl1Ddbiky/Lh+hSjKt80as7E7ox/LLUPCzXDKGm
         nG9YRP1qTJVa37D/DdQnUhEci4m4sWjp/MB+SbsB2npbEa2AwjDE+UKacChkhG54Hf6d
         MndA==
X-Gm-Message-State: AOJu0YyzMdX8gfQeDQ5bWaqvSM+DFX5K/ZiqE+O9yMRAudCwjCjRllgE
	r5U9YEd8cGTlxIQ5LBCgjMcjTHpX5E2qhA5CihZVeQJbVmVNl+QwkgkjFzbr8dwSlw3DK0WX3jH
	bpc/h1qS/OeI4OqtAZ0t/fk1GrxgMWFn12RLRiW1vstsnAfplxQeA7E/0IcchgiiNviZ/YuZkc4
	rb4go473AI7VqiGxI=
X-Gm-Gg: ASbGncv8HiUgVsLPEMAhZHEa+8OWYGefJt91Axt8N/qpCsQatN9ofQlvO+g5PbsdPgH
	x0nVuYtDCq7rtgXUcjTg4Hu6blxTjA/PTDd05bEbHYLDbrQlKBh0CLPeh8lB4bjKzzwWp+aVkRC
	PlyZTdU1hBWfYMnZcXyxwp4pLXLPzh8EmQb8LMMnX/sQCuGWt+XPhLqIxuENpvgjBAwmyLuVN+g
	iAJGz2MOAw36dcvIZj1jF10x8AtW40gVceCV01CmjRAEPtMeUZwSU68SOKKFBMLHOrUJ6EPBR3/
	FJjZprP8gAfh8K5P49JgS2c/BkO2gHO14yUCW81Qq1xwdg2BXdk3IGwSup7MRHgbdNNz2dU0cbt
	6TgO0C+DSTxu7WsKW7r7BpLiNpehoSE+yxUZ301ykmlQkt2ffH0SA
X-Received: by 2002:a05:6214:f67:b0:70b:af39:8596 with SMTP id 6a1803df08f44-767bd944886mr44224096d6.28.1757684671142;
        Fri, 12 Sep 2025 06:44:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcl7HH+SPHvnojAQ0x6WtBM9zzGXXazoOTZTJR62ipSfny+RGrx0hW0JrDLriaUyWFkMbbEg==
X-Received: by 2002:a05:6214:f67:b0:70b:af39:8596 with SMTP id 6a1803df08f44-767bd944886mr44222316d6.28.1757684669131;
        Fri, 12 Sep 2025 06:44:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571a547ad9asm198049e87.65.2025.09.12.06.44.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 06:44:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] mesa: add PROVIDES for Vulkan and OpenCL ICDs
Date: Fri, 12 Sep 2025 16:44:26 +0300
Message-ID: <20250912134427.1763047-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XGYQ8otzA8NMq71egsNDN9Rw_2qjWsXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXwx7/1+PGutXT
 NEfBMNXzji7J2kXeq9qf3rfPuevb/MEa7s2B7RqmSor1t/BEAqPBBuhoEt6lnY1/v4EiNVChs8x
 RtI4Od3dF7DjpEJy0yKLROegrd99Dhzzr1qkNH9T1j1bMKIKYH7hPiJCjSvsIHT6aTsnFbaNDTY
 qgAeQz1MbWNkJlZXsftgJfrZKgQphheBa95I8giAj910vOUzzXSBj6SoCmsBLF4I8T5q+no5bbL
 HfB3Pf6ZRcMSiocrnQVzghyn9AtQqtf31wV3B9GUmCv/tkcKAGgsAdmIUHgAT1ET/Kp1UXux5G5
 2NSukPI/d9LNSjqhc7WDDmuACMuW+tY8OPfKgtZ8Qz+xbzQkaap/mpwGejK/C1Ribqa/cfeVbka
 QV4o/BrH
X-Proofpoint-GUID: XGYQ8otzA8NMq71egsNDN9Rw_2qjWsXm
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c423c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=dDemT4ZAlSKyr2vjyC8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 13:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223311

In order to let BSPs easily select OpenCL and Vulkan Installable Client
Drivers, add two virtual package names: virtual-opencl-icd and
virtual-vulkan-icd.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5dee19fae9ea..3f09cfd4df21 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -219,6 +219,10 @@ CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 DEV_PKG_DEPENDENCY = ""
 
+# Provide virtual names to allow selecting preferred rproviders
+RPROVIDES:mesa-vulkan-drivers += "virtual-vulkan-icd"
+RPROVIDES:libopencl-mesa += "virtual-opencl-icd"
+
 # GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
 # Add a dependency so the GLES3 dev package is associated with its implementation.
 RPROVIDES:libgles2-mesa += "libgles3-mesa"
-- 
2.47.3


