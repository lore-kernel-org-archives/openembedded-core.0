Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427A8C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:45:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.27411.1747763133632501500
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 10:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=e3is2pfB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGjtSc019327
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MakHxBw5yqAxwv0ZZf03UqzpZ8oa6YUEETQ
	THYx1fVI=; b=e3is2pfB/HGFT0LVWzl3v49wbUntPC3xI0O1Qe1xSm36698o6Vd
	sRyhPHDrz1/EGF8O2/yxS8PtYeoeaw4lPWdM+SplOXO0/DE52TEGd9EUaZVAvIu5
	15S3DyTnOP/H3wCR01+wuw0ubOvYVuR5royFRybpaUCVpL4gt8O5BdPov47Nr31Q
	vHIukYa5+d8zZNtFHfuWsSm1Kz6tHsLkZ5JjNxFU4qqUNgB73Zpjn6MfOxkJ82n7
	mNDXYGQ5ZBZZJ7lsu2/MaqGuxpbZOxmM/nXnR7IRgu58tYBeYKW1KeTEZ7HI8iaQ
	mHKTPm0b4uZAXT7djuGiOn2+kZazrvcQ1iw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6g66y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8bdbd9174so143913446d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 10:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763131; x=1748367931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MakHxBw5yqAxwv0ZZf03UqzpZ8oa6YUEETQTHYx1fVI=;
        b=gVDoamq1wQc4RQ3ISbyNUyDI1RKB0+7lzA12RP4r8QiLqUgFsBfDRSDmLgX8wSvVjJ
         v2dQIpaEDaigM+LTB4iAqxgMbjAcQRKBZgoegFpdPUxf/OTYKnl4p7pfMqZHx4BjD1M3
         dpTiBbi63Rl0wYul5mYbLtd4Xoim/9HOt4YJWl+arCgQ4TPVZ/PA4BT84EOwMEPO0wus
         HYwTBriW8CUVOMD89hP7xtywimt7J1JnNw3hDyPFBAJ4Bqj4BIgYkkqIWgwvgqF/ECEY
         nMTxXrIFmNlvUvhoSQqdr/rVHG6CKY8Kcpnnn1poOamSYL4ZL3TjToeT20larWkhhW4n
         mTLg==
X-Gm-Message-State: AOJu0Yw0NnMZv0fUH7XgG2Kf+vqhm2TT/yh+sSzVWpxYxbwCzOWEPu+q
	IWTCKZUvT8jI2DCIg0fQo3d4b3g37Lrx06PeUXQaOmcLgXmhDO37pjYGrOLXBeG012sB3KD1DNT
	8CZ5L+dtut0n6c46Y/v/79S5zfj5ftfQ+B1A4D5pnHqvvioBGSByqsSsd6q4PuM6szyCkgfFVCG
	vtJJyyzt/zgG32GxSRlQ==
X-Gm-Gg: ASbGnct+hVb9Io/mUiCR8T1D2+nJleCvbI1n6Qo3P8D6rPfhCMW6rEJ8bqcLnLn6GHK
	COpID/djnKtuWbW3pcshnzfrZC1exPzuuvGiLyhzJp+7yqQ2y4aTMITK6zjJr8vFMdfhA4pVp+2
	quEA9D3Qd4Md52tuQXJqKY7e6Dd/KPyVuwJiKqYwJ0B6w0RCEGjV1T47AMDhPxxrs39VzzyzRtp
	zd6JICbUZsFrZbZWWJIZBVsGV+gIK40bJsJdV4krfNY6ok86jMQRRIwLoLjlOhmkSwR5pceQajL
	xs3wHOoBf8iAiuDiqmfce/M155jrGKDqVX44116sJk+v7VdzbyVAIDOJlumhQ49Z4cV+MY57TvR
	ecrJyEorrsQ+62FyAlvaRgsuq
X-Received: by 2002:a05:6214:2a8e:b0:6f8:aebb:71af with SMTP id 6a1803df08f44-6f8b2c31e4emr296798406d6.9.1747763131215;
        Tue, 20 May 2025 10:45:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdf8QlXrsQhwX4duHGh16Foe9fR1nvyMMVAOZQzbafeFWT8PcAYkuBJ0N7Pu9BAwWwRyYR0A==
X-Received: by 2002:a05:6214:2a8e:b0:6f8:aebb:71af with SMTP id 6a1803df08f44-6f8b2c31e4emr296797996d6.9.1747763130759;
        Tue, 20 May 2025 10:45:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fcb3sm2437225e87.86.2025.05.20.10.45.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] mesa: don't build empty libgles3-mesa in GLVND case
Date: Tue, 20 May 2025 20:45:25 +0300
Message-Id: <20250520174529.1173460-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VL/dn8PX c=1 sm=1 tr=0 ts=682cbfbc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=YgZi_eNTi6ztWEiN674A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: wONW8indTVIM900tVMLCz43xrZL63euF
X-Proofpoint-ORIG-GUID: wONW8indTVIM900tVMLCz43xrZL63euF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE0OCBTYWx0ZWRfX5/ufTfwVffAG
 bLxF/DGJf1QMI4xqlbEkH9ssUonbfabPh9ZPS5qc07/JanoQ/MKbUSd+MLUTanHzL9Wz8p2XE1f
 567nb3XnfdZLb3/eUHEfS2vwzKUKoH7cn23QzqR+IQYkFs4BfEtSnd8ShuKU1Qn17K6kd1R7Re6
 H73XDrC8t+fUwSPkrePjm/OaXKuLSxibqBppgTVqTQQQYDz7E5A3jlwBCl7NazVcgOE+YZG6nxf
 BkThCK+QLC+elHH1DZgcuZ6cxsQVhfRexkIGXYYavFeXRUw7nSBeS3IE6Dqh74OBRy5/Fp8k4VN
 Yye7DBT92I47dJkWp7kIMYi28k27+3vKK1S8MiXUz1SsUV3UIL2b7e6fdTfD4CW+z8lqR9xLRGi
 fhfnBKsMDLBAGesZbYeEnJxPECc+jSzGslPMvHGU8HXcVS2JKHCM6X+D8AcK5nMYFSUAqrg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_08,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=803 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216926

If GLVND is enabled, there is no libgles2-mesa package to depend on
libgles3-mesa. Stop building unused empty package in this case.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 288027bbb996..89ae71595991 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -247,7 +247,7 @@ RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 # GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
 # Add a dependency so the GLES3 dev package is associated with its implementation.
 RDEPENDS:libgles2-mesa += "libgles3-mesa"
-ALLOW_EMPTY:libgles3-mesa = "1"
+ALLOW_EMPTY:libgles3-mesa = "${@bb.utils.contains('PACKAGECONFIG', 'glvnd', '', '1', d)}"
 
 RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
 
-- 
2.39.5


