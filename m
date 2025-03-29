Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D149C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 20:07:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.18126.1743278853591289598
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 13:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=AcDjGBmv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52TJgLoB006996
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7J47L+zwOpRLo4MreuwV4e/sb85z4jvSQbX1G4Lbzb0=; b=AcDjGBmvgUjKl4zo
	xDmkomDr2QNH/PI4TtsGCaNIh4rHbsRCg/zB5cm0xZQIJnTpiqNkJEIzDpC28aRc
	zPPUayK/Rynl5TQSCymQSGDlevYHxyBUTEeGNpo5CZHTQ9tPE6qIpVhxCMIB/Qr7
	SFd0cUmnR3f2jGSJ/C8tvCVAJwPOEZRWO9LNilZuP480kgGOncoo3CG8FXKm+EiX
	EwrrXBTArhMOvuIwDANBRnMEreYuOacU/yjx3aGnSJj6tWY6BG2ai9LF9XEbxmYn
	vv7IONUv/fimxLLBoI61pIQL5mUQOi01ZkYk02zB3kvrUflL4H3PXaK4uX94yybR
	ZrDiEw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7v89bnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so522549585a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 13:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743278851; x=1743883651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7J47L+zwOpRLo4MreuwV4e/sb85z4jvSQbX1G4Lbzb0=;
        b=cM0Bstm7ByLWHVaBAZP6p/q+1SlxqX4+S44FzHC6V2gx6QYv7abyz1Yvrz+cU1fVzK
         3U54eIOw4xyhN07iSDgnj3OZ9EfHwJnsetQTHi/osFdXEJW1Q1pm1/hpOD/hqsQ+o65y
         lWbyxkqYPUj4tBKBEv/u/U3tQRfEcSqy6mgJiWmH8QLw6FAbOHLMxWiG3b0T9hbZieNs
         DlWQnYE6fzd9gsqeXBxDG7LOYHuwvJOCAJr+GeYqXvzmthV8HYvtazeuSndnq5Guj/Wi
         8TeVHW+LJ56LfGmsCSm7hW7+kqbqYE7iRXj+sV6Y+ikL99tHeWsog2FRUhgabZ4UorlR
         CsKw==
X-Gm-Message-State: AOJu0Yyi5PrBsNos1TlpBoULsVqbwGS1j+FI3zgELtFFZRPNl00gxjt4
	iqGmx4YcB8NE16J9vt414IyQZHdTxVJF1ys4X9C646aHqTzXk+R0rmrooH2U0C/TLSXUfjKU9Ts
	mMADWuN3ucln1UkfXr7CYVbvjvS7HJJxG4mkn2gNeaPrVelGbhIdTZO2yt1Wem0Wp47w2IPNDBI
	keEz9TKg1uwU4=
X-Gm-Gg: ASbGncsbwgswm+LiCR6c23qyavlr/7aLuabOjSD8BwmwN6PiR5humu7yDIheC8Tvybt
	DlEuXFkpB+lHrEVXcwAdXgYaXsA26fyWWHAy7NFd05IbzIIBZgOl5edNEt0xUPemmHuNax4rWmh
	Px3d1BTLE9IvZxHIC3WI0y/6zSpM0uKcM47o3Zz5y4F3UVEnf9aXt0DlVmyIggrb6SRr+bbVsap
	hssmoCqmOTnngz8FOd/dN+E0j5oRCTpkORLCE7CR9/IZhRT+1hF9m4iG0MuMCrOhH7kzhrNqvAP
	ROYCLbuKwqK/TNAA8xeLam3CA1Td6vot+e5YExg2OqqU297dldNKH4e+wZbuip9CXV9cZXcMwLx
	9SjMDuplR6U/5LFeyF1KYGdPZzBQb
X-Received: by 2002:a05:620a:c50:b0:7c5:aeb9:b156 with SMTP id af79cd13be357-7c6862ea59cmr417953885a.2.1743278851545;
        Sat, 29 Mar 2025 13:07:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpsqJVRyWFi6bLa3XY2NeYJMCUZZbjh4Xf/YEk3XVjNkkA3fULXlSSQZV+T9oGTHRXrhKfYg==
X-Received: by 2002:a05:620a:c50:b0:7c5:aeb9:b156 with SMTP id af79cd13be357-7c6862ea59cmr417951985a.2.1743278851202;
        Sat, 29 Mar 2025 13:07:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb365sm685848e87.29.2025.03.29.13.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 13:07:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 29 Mar 2025 22:07:15 +0200
Subject: [PATCH v3 4/9] llvm: also use llvm-config wrapper for nativesdk
 recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-mesa-25-v3-4-f4d0328eb867@oss.qualcomm.com>
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
In-Reply-To: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lvHFxfWojx4YFoCxuoF2UZUlSlA3hAMgbD6jpGhXbeI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6FL0AUurnRrRj5h5A+X6tg3U+KZKjt8vywrWA
 hEanEk/sLGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+hS9AAKCRCLPIo+Aiko
 1T1yCACGf98BG4p7BWHZ3kv9O9uqciYFZaFbtkKuKLnq99Nr6x2Ok5bIJBjXFO2U1bK2+RbBHya
 Hx+Al9WUazOMMjdlxHsDZMC85nhgi01ZqrhjcD0FTvPoPvP50BkFmsaaGzo95eZgfeOuVw1AfvU
 XDlSKtdqsnb5fbZ0grbhvaYmKLyLtxLwLEZ3U1skYV45XU4//vMqTMFmPIZs5zIy11b3aTnZmk1
 owQGkQ77s8NOdvNzHtfKS02krcaQBb00trKnaSgqZRnVcKag0Zfd/HbNE8uOLQsaubwytputm03
 uH4/MUdAZ0dOTptKzsnCh/tVbRPhXv5hFJk3U8xIlwu0H45s
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: macr0ED7QY2u_fnhMEkWPZHcWzhqoe0u
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=67e85304 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=oZP-O3FlLgu2oLpOfcYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: macr0ED7QY2u_fnhMEkWPZHcWzhqoe0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=704 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503290146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213898

The recipes targeting the SDK (e.g. nativesdk-mesa) should also use the
llvm-config wrapper, otherwise they get get a lot of incorrect flags,
the most offensive being the rpath, as it results in TMPDIR being a part
of the resulting binary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 7470d2b4d8a55868fe5d2e88f5843a2ec3faf7c0..c1c4138e8cc16b8b4ddfa3355a6141b5fede569d 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -138,6 +138,7 @@ do_install:append:class-native() {
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
 
 llvm_sysroot_preprocess() {
 	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/

-- 
2.39.5


