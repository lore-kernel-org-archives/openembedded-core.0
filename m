Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F28FCAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 22:44:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.20908.1759704275933340464
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 15:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gE4Y61Q9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595MKqXu019851
	for <openembedded-core@lists.openembedded.org>; Sun, 5 Oct 2025 22:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HgsCNhKDBGo9UwReneTBYfVGukYwWhY5m5L
	8nVAx+e0=; b=gE4Y61Q9T4Vy7evb4oJMMbSZfkWKGpD5w4oHf+6EPc29BYuGLYB
	WQE2A1BX3IUYiLjyHFLS2gQD13rbCp0bo3sgVtWoTHJ9Vx+WltUmUfPhZ1BIOmTv
	xmdMavXRHs47WnEjSmIln1pmXJbz4lemZD5p1qaMjo8dOfl+SaGFi5Doagd9JP08
	pt+5ljI2uhJIX2XtzeD9VGJ/MoW74bKpzMLoPAGX/xYXHVkl7Ujbk4fnfj7Tav7v
	zHXAVCQiX7qEBT8ieAAAa2NH9RPhP5Ts780XpCOsf+PNZXZZeZwIgGavKAa2vHLN
	y3Gfek4amYZlpOu+3Cs1sf7WePccMM/EqmQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgjnc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:44:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e57359997aso44507981cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 15:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759704274; x=1760309074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgsCNhKDBGo9UwReneTBYfVGukYwWhY5m5L8nVAx+e0=;
        b=aOWCvFzpEEo4mLSsQh8qas1je22pOn2+ddxBLaOi3/MIoRl/2NWPu0wdP58YC9UKW5
         +7bBN/x0Na+oxqMMHEfJt7FUw9vh8SQanUXy+rYwAI2UWD7OypWQKOdGrhInZbbFKKnu
         tu1z7AREDn4SCsNpHo1bCg80JxsMKDPFRl0c0JjDf1qbgvAlNPAOaiaj/3MZrtyRLv4d
         JjUcfl17utEigccVq/TJpuUD/w4YKM+FjjMnqHNNGnFdkDe5W0gwwFq5/VPF5HeHGK0V
         8P4aqgaW6k5SYaWWkivYrbWOYlKvwdA654499lLoU4BjeZrs+SO3Q+Vm9ZJkPVXw/GN2
         262w==
X-Gm-Message-State: AOJu0Yxt1EPe3OSYC9A8zKfMcszetQmOXKuOqOuxGLytbmKQSfNlO5JF
	DRtnOYikzyeUWA5lSOjiug9baWYocbRSv5S/wwRgOuUWUB7ydR5Bs8K8HmkiPoZ52j07xNXi2LF
	JElFs4AsrbWOJeFxPlXRPuFk9J7uzz/0LzeWQt0HTP6+3Zp1rykrru1uVjkfKwrjxK1peJfqGsD
	T8ZKSRdvfDNm779pY=
X-Gm-Gg: ASbGnctYguBPnF53gxpjuog0/21sXzhKf7ecY5xWOSp5iQKSDV1Ea5EsKvSzuxdAxWn
	9EsShUk4u0zb1BX0yovA+VUxzZqnZ0zcFZdfFx7z7jVDw8xPIyKMoQJEAS+QdxU9gkZz+MCwBiK
	farNN03rY7nTaeSaFbGPmWAN7QyBT52WK2wzTuM1hLpkGGpDSQcG9U4WFNyjdBAKscNpj2u3c8J
	vSDvflHIk54Jt3VO7xqwshu6Pa/t087LcfGBJwVCmRWsDyJiOkYrGCSoJotf2JU5KLozy0JOHet
	9N0OxfydmL6kXM+40ZafKJuY2XL7Fkod2CUtZGbYuqtf8+uwEc293YWCcI+mzkHrOCw3LcXvnmr
	RshoVewLVc9O5UgOWzKU+mDDdzJbK3/FqKQmHhfxESqoAXEmnLKNSj0Jb8Q==
X-Received: by 2002:a05:622a:550f:b0:4d8:9577:6fd7 with SMTP id d75a77b69052e-4e576a4439dmr145533621cf.8.1759704273716;
        Sun, 05 Oct 2025 15:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECaau7hQSMj0FTthnJRt3psax+1dVfTq9jQEiD0fDSqUEuLHBfUeS0DMhwCgTajYxzEzmr9Q==
X-Received: by 2002:a05:622a:550f:b0:4d8:9577:6fd7 with SMTP id d75a77b69052e-4e576a4439dmr145533431cf.8.1759704273213;
        Sun, 05 Oct 2025 15:44:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01141752sm4390479e87.58.2025.10.05.15.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:44:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ryan Eatmon <reatmon@ti.com>
Subject: [PATCH] piglit: enable OpenCL support if distro has enabled it
Date: Mon,  6 Oct 2025 01:44:30 +0300
Message-ID: <20251005224430.82999-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX7kJDsZzTh6Ln
 FUB6l9gz18wRqrsRrb3JCVhgJ66qW8l4w8U1B9y8rLJLqmP5Ely2l4YSxtceaLsEii1ld71u+2U
 coFQNFbiKGQqpdWR2HuRk+fkR2DqECaIBr8u3IX0uUpM/Iy/ZyRc4DW0wdJER3ErEO6cW2ZUkmD
 PszJ5+8/sRa0cyiM8bmLh1Ht5h4NYdiEstXxj3w35bEI/32FLWRpgRM02PCC3XcsFTmBZSayRe8
 svPoVsacLcee6o0vqnGZ+iftKZMLJnA2eyMHfoqz/qVIulWVkvce4/LIMKM3A50nDbFw9RkNYWR
 KQPPrZi49q/Bq5n84lOtK09EgQh6ZAOcuR3ylsfcVMYzVs3BXIFoeQIaXi9fMeaPiSt2Nqi3Qz6
 jyqZzUAGzzS2cyFYGysHIAL1CZ/W6Q==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e2f4d2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8 a=kbudkyUGUx3IG2ls07wA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Yr1a8RNB-vin1q4l_plByBuDoS_f-rxh
X-Proofpoint-ORIG-GUID: Yr1a8RNB-vin1q4l_plByBuDoS_f-rxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224456

Enable 'opencl' PACKAGECONFIG if it is also set in DISTRO_FEATURES.

Cc: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 63c0cf1ac0bb..060e287f267e 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -38,7 +38,7 @@ do_compile[dirs] =+ "${B}/temp/"
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glx', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'opencl wayland', d)} \
 "
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 PACKAGECONFIG[glx] = "-DPIGLIT_BUILD_GLX_TESTS=ON,-DPIGLIT_BUILD_GLX_TESTS=OFF"
-- 
2.47.3


