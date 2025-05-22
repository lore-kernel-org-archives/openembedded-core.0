Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B055C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 17:14:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.29580.1747934031228550130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 10:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Lab5kd/Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGGv59006639
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WJFcwzSUvCl
	X9dPqzVSjet4JyBrB8MpumgPoqmRm42k=; b=Lab5kd/QY+noYpxZE2KjKm1joVK
	WSXU6lkr3cS3LSIoVyN4Xm1p0AoaxKJfqR4F6hDE9WR8hG7s1uxHUWNYlV5nJJ6J
	h0XzQWVvPKRIONxVUyor8C+vVqlMgWPgnUMAK5DVFmQsaKKffcNlz74vOdH1QnKe
	BUTZEw/REjy9qnM1GYFb7kjCuHS+X+9Ey/XhyV6wkmhWKxfrMq5a8eI7gpE78qX9
	HJk29e7SeNVmUFHiFc9EPhszTbwe+3cm1Kn+jo8UGjC9YctfVeveiHMPzYVAgibb
	WRwWmEpD2CwtV0eCZHUPdtmzd8Yk1M/6DdMNs1Ie3ipqfRcyvQ/WP4I3cqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0q8tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee990722so57787785a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934029; x=1748538829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJFcwzSUvClX9dPqzVSjet4JyBrB8MpumgPoqmRm42k=;
        b=KzdeGijKlmB/clDzCVWdCo3aub/ZRiND4RILg9Pe2wPetFUOcDs3gIaA7qChcoxbHR
         7IVzm2cHVduJyD4lQbJYUd3apNzFQK6dTSQ86CR9+ZtS3bZ5nQssaP1BhJS1AJjvyurq
         b/mVauHmRAoze8E4qrNMEmFm9XFfY0z4RE5Hg2K4J4/NrmoGvE4jxDDzq0popFG7lq4r
         SLmcCEDYxzGSdJ+B2UK4jLSiV0R7fQeBqsngXm/zHc2YIMcfYE9WAHFbWNHcLLWIAMQv
         qVUztVxwWpa8k0WP1PuH9UzjxTtuHIXSQqZD4f0E1M35BBl8Lw2DXSO5XsqM5E0xcgvU
         QYjg==
X-Gm-Message-State: AOJu0YyVEw0n+AtNJizRhDm7gdyX+nJb7cpFSIkqA4ZsASigK6TjrTiv
	Ptzsa0WM1MDXpzHc8mz9EG6yJGyQ3RxJCm5/XaQC8J5anBTiHZT0S3jzUZxkUsit/K2KGjylwis
	hD21aFGvOzmQR1sZWVkcouAjqJ7rVYactue10VEyYM05imFWKzs9JoqaPgaupvr+F7llU42x3b9
	Mu+QLEgFOKntD52oo=
X-Gm-Gg: ASbGncvLXRbvtimhFwbSzsp/dsmfP66X1VCdznPJDs6feAEUSOlPLpULUYMg3uRO6eW
	A6qHq6D81yoH4iPUMP39cO+f361EcE1mDG1VzsDmoedFFb8pF2NgSf0SuOKIHLNW6UcZvuZ4tpI
	gvtH8Ou8Tn/Uy0k0nNDlLsdJQbB1ZsZyyz740ZvDBhh2jhEqmOPbFbd9vDiJ5IzXm9b05HNhysB
	ICpMUhMmwSq9L0LEgN73nWFPZIfu1isf+D+WM4hukjtC2XAO74rB8af0A4tE2avwgjkYhSgq6Yu
	mUm3fB332mVJBuWvSKdleJzGXuJWtsrRiHiE/XflHRjKO92PpZ3xL5Lla8IQva8SpdyxcdQuoxu
	2G9JOtUMlpIS0/86vCKKApzcw
X-Received: by 2002:a05:620a:2454:b0:7c7:c77a:81c with SMTP id af79cd13be357-7cd47fede86mr3549949585a.51.1747934029278;
        Thu, 22 May 2025 10:13:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2a+MkrTsQvE3xyvUeVLL/kSEZH6AmZGBt8/AUOb88TNbCjMM+bdQ1hC3AozM8sRQVbCww+Q==
X-Received: by 2002:a05:620a:2454:b0:7c7:c77a:81c with SMTP id af79cd13be357-7cd47fede86mr3549946585a.51.1747934028839;
        Thu, 22 May 2025 10:13:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm3501438e87.32.2025.05.22.10.13.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:13:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 11/11] mesa: move dri_internal header to mesa-dev
Date: Thu, 22 May 2025 20:13:34 +0300
Message-Id: <20250522171334.3040820-11-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Xu3gmdcvSf_foIH3ferN3c_kN6YCKd5a
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f5b4e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=xIXOYJDBqi0fscj7eiwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Xu3gmdcvSf_foIH3ferN3c_kN6YCKd5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE3NCBTYWx0ZWRfX2G+deu+XAaw/
 /uKSGEoPb5+L/YZ38xTtAVTyDG66Ud6t8dyLVebFrQ6lUxTY0cBTFkwgrpjgziyHgXRoZKdsDfh
 QFayUdJ+RhkclD2BZp4Qb9tKvk22geBKA+3kWUDVBAPIlDIi+yQU3TYgp4/slXKbB0wU+cb9QpI
 mIMVv2X+VNcmZjtiVm0B2RbRz9AlvAdAm6vHXYvYsI1ScP0AXnSATiBn/BmipPIWZPMQdYxELt+
 Fb799HmBwnXdfEC7Ni8YK1i3N3jsZrxkBR1ihP1xhL1KmAMmewwElvesnauB9SBRaP/22xSW8mR
 To6uE3K4PfbE66zjaiwp5ICA9BFv8hAsr1kmaboUrQ0yrPqvVtEXFWOOxOsa6Oo7JNWQIbPMOOz
 UMPanRi14zMJLarDY5K4xGkrO/lFnmyDj0JhqXkVH7KADGiZMUV8z6YU05fw87KxFzef0zLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=972 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217140

The GL/internal/dri_internal.h header is not a part of the OpenGL API.
Instead it defines Mesa interface with DRI drivers. Move it to mesa-dev
package to reside next to dri.pc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 210c7295c05c..2166809bb747 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -348,10 +348,10 @@ FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${sysconfdir}/OpenCL/vendors/*.
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
-FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
+FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan ${libdir}/vdpau/*.so"
 FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
-FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
+FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL/*.h ${libdir}/pkgconfig/gl.pc"
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
-- 
2.39.5


