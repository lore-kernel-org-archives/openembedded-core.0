Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B586FC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:45:55 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.3435.1750239954761385624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=POEGaWcM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I3EdhZ020800
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bmleG52VCq3hTBm8s8IhmNjA30ZuoyW18cB
	pHEMUK8c=; b=POEGaWcMrTJlFJBi2bbQngUMegydvtJfCON0iGd8o3IQLjmveur
	oyEF04piK1QeBqO5mtbOv5ITUq01bWlcl1FaaNup2p74bzO8/kJfyjLgkcuskpq1
	iZDtnk2xtZOhkBYIOtvtkMY4jjNd8hNoHM8A3ldmuD2oZDwqDzNVqDYSZoHVwUnf
	CP3oaY19Ifuwv3yWGCKKwJMzju6UTAXFNoZKuDotB6Q/vBBPPsuEpILzQcux75gS
	ajlzEDzNTRY16RVVyFCExxKOLtuK+knfP1YX2Zdg1eGdpZ8lvaYneS+lCYuBn9jt
	A909SnrcDWFEP73Hb8uxJH7FV7hDVInHNfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca3qs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:45:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53e316734so131345085a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239952; x=1750844752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmleG52VCq3hTBm8s8IhmNjA30ZuoyW18cBpHEMUK8c=;
        b=DHQ0YF/3+szwSb5s34dMasAbNjp+rLBZsgLDkxkY5Aor7Me417uVzg+b/9pn+0LHJm
         jmW/2e9ZUIdm20l3t6cZK0UjMCjOQlD56yThZV7xAPf0E2Et1c2eiy+xVM/0bJZ9ES+/
         OJwOnA1KTOfjYZLizah2arkNT9uwrpY6+rtNms7P7zSJulJSFUqOVv69tkcij2IsCs9f
         G8sQlJldIQRPt9Gi6MaMM2gpgb71T33q+dfNWbxy6T05hcFIeAu+d2NSxigIjUkqY3sK
         0CGnSiAU6+27RsXX7etyurdowusef+wgJ0CRdYfYbNG1IAMif3/PE9rC2WyTYQKyrtTi
         a02A==
X-Gm-Message-State: AOJu0YyA2WDdmcYAMYAanp8lXiwDm/S7fjJN+bRMSuPWshCna5BzOvAa
	vNMQjWzBBzQCTfcckqznAQOHTfEghQMDQBVWZoxDkzgw2udupqzXkcHtVmtWmwld+9xHD8ML+Wn
	xKUf6qnEDqIzWnev+8qbqrHhAMOv9l1jLDSsUk2jG0QRWc1p339o7WFWfJi/nLwnydvEd1WcKOF
	UPKMAFgQJWW7MbxGmx0uVG
X-Gm-Gg: ASbGncuXkVIwYoibhv1W32vrila8hVvPuCrGo+fqSut24i/GpmJwoFIXGSN9bjUAlJP
	LXTOUtasXlzg3RN2s/jL1DgIXwXiNycWjKJSWou1TUZKYCTYE9Whsq/u2HMJhvGJp9XHArxAKJR
	gAp8grd0cygvgrs89Mra0RLj7iLaqMSdTjMcUPqLS0j17FeZ80JdiqmX18nGKFYN13e7FzfkwYX
	XuLEuI4cOVbtLMFmEkRXCnLvjRh+7LgCM4l0ogSJQ2I21cic6RqrdqUkbWBr6JNsTk4qzvdIrl3
	LsEnWqU3GCi/hDjZqAsz/JWWhQUedA+DzX/Hrq6oJK4uGa87AdTeOCXnhdNSQA4AT9KjnvzP+Fq
	Grz3DsvVcwM/BcKrzSrm5sqizYvwml5UOQ5g=
X-Received: by 2002:a05:620a:2496:b0:7c7:a614:7214 with SMTP id af79cd13be357-7d3c6c09639mr2757681085a.5.1750239952647;
        Wed, 18 Jun 2025 02:45:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrkqHV0ijBAGV/g+Mqvg58ENjSdcHW8NCMoa4WGQDpj8hGXXTS8Y3h9qsqD2mIAudNyK9G/w==
X-Received: by 2002:a05:620a:2496:b0:7c7:a614:7214 with SMTP id af79cd13be357-7d3c6c09639mr2757678985a.5.1750239952183;
        Wed, 18 Jun 2025 02:45:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1e0cb9sm2207750e87.201.2025.06.18.02.45.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:45:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 1/8] mesa: fix RPROVIDEd package names
Date: Wed, 18 Jun 2025 12:45:43 +0300
Message-Id: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hlcTyjT7nhaP8k7qNh6LU3UbWaPE_XKW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA4NCBTYWx0ZWRfX2jC1BbyNiyKK
 UKUrgXeLSbk/yXVGortg3eGCB02NuAG/pZtwLZi8GpDn7KxKzfVM7FhA0QkX0Eq0oqLlZUa/XR5
 aP0Qjdq9rX75p91qULhEQJMUovj80H/sCqavD90z38AwALQW9b8Eq88kOadV1ta/ot8pJcDlNqt
 yhdgMP/WRgVWGhf4d/haglNvA6baXhra73R+BQnV396GBQFVhYT+94wecHScpusQDqTk3m78bWO
 zWm2DCgt/EvC/JbPjbrZ+o2ZelW/jxAaEWYaP86qFrPXc1DloKwjnd2ScvWrlBHgpO7EWovmpzE
 KmZ8sYpL6UBj1YpCvfwuGHjT3GqUbv90EvD4ivjwd5PrvzmEci2Dg7Ujr8HzuB3zmudWL6/HUwU
 07v2CzAcBuu2Abf2MCkLn7mpO8S1pTkOtH+lPleL8jpQuMecdSE8xYDroOsyGTYHxJBQebms
X-Proofpoint-ORIG-GUID: hlcTyjT7nhaP8k7qNh6LU3UbWaPE_XKW
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=68528ad2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=9Lscu--00yPY4GOp4jwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=989
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218989

The BCP for virtual runtime package names is virtual-foo. Make mesa
follow the established convention and change the names of the provied
packages to virtual-foo-icd.

Fixes: 9d3b4c9bc403 ("mesa: sort out PROVIDES for the glvnd case")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 56ac18ea534b..a583edc57f6f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -287,7 +287,7 @@ python __anonymous() {
     if 'glvnd' in pkgconfig:
         for p in ("libegl", "libglx"):
             fullp = mlprefix + p + "-mesa" + suffix
-            d.appendVar("RPROVIDES:" + fullp, '%s-icd' % p)
+            d.appendVar("RPROVIDES:" + fullp, ' virtual-%s-icd' % p)
     else:
         for p in (("egl", "libegl", "libegl1"),
                   ("opengl", "libgl", "libgl1"),
-- 
2.39.5


