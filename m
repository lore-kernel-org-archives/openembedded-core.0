Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B61C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 12:22:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.50463.1743423722518461993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 05:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ebZ3iahM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kcJk017360
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7J47L+zwOpRLo4MreuwV4e/sb85z4jvSQbX1G4Lbzb0=; b=ebZ3iahM4PmerBMf
	Zfzgr6sfTLoQmbmAXlqjk/gCaqF98/4TWKdyBXJ8IULnvJCksdPt791vGi7eiGcU
	yzDXB/BhRyuXvmbzN01lgAy7m2K5P1gKIOmLPunIMgh4defCyG9z3/wxNTdW2W6R
	h6fj0HyIWSN4mWv4aC78AzA4rZXWNgJktRjrmsXDzf7j4VU0healreF4iwrcamZh
	/Vj48BGj9YSq8MFoM4yklxS8f+2IF21BNQTEAWICKSBOeAu0a8CxzxYmPp2aotT4
	CxmcrNGXFKTwpRw/ZYUTD5ozsdAcARIYDN5QbZokHCCkHKxp5rn0uh+c3EPE8sZ+
	OxuuYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjmcc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e7922a1so1024738285a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423720; x=1744028520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7J47L+zwOpRLo4MreuwV4e/sb85z4jvSQbX1G4Lbzb0=;
        b=bYVOOtcz3E1LO6o6U+Ml7iMGk9T5C6j3uatTwpJ55X8zf4oTxu3EbDIYxJuNnysKYY
         PMi5CyuGDG2+COsGhZy2DbTVsJW5iknvgTHtOTxgOGK4br0LmWTw611Oood1SXF45dVR
         P8AgrAz95Er92YxH9JUzfmfGN3CQp43AS3oTKTl/mrP8aEJa4NrHTD/whctCMgmaEdkQ
         VVK9WD/7sKWaepqbbolg8iJwKug+mwW/FlCIIcCYpsuS+qHe1zoxEIXM4scwmbwMfOWS
         t/MQIbBfx+XUikHCV83bPpMIQNPwb89vZDQIE4I0epqlHL8RtJnj2d+dguHrQJ8o1rGG
         JPyQ==
X-Gm-Message-State: AOJu0YwO7DisKs+gkk5hpw4/+1liB9BHGqLvlT3AQeRyI1P4WRYMmRvd
	Nuc06p1J0NjN38BJUYge1TOFiYGWwrw4lD8WeGoRKp8GSNikIcgGMR12ujz1FAwR+eVI8NZnH9S
	Wbl3iHPQgqgeOhOdG4b6UHFrbXE0WULP9qs5ko3g2u6qiJPOgZUktARbUoHWa+KV9me0wqbLyqJ
	8qwmTB1p/JdNhQGpke
X-Gm-Gg: ASbGnctNeV592b6ax9eypa3Jm7eF9IADWONViO88Q1CPVZV5I/pYaWIySAU1KtJ82QE
	jRqn6jwYlGP4s3RCJWab+JEEo3DBXR87FTkjrQSth2uvH8yP8LruOSq6iTLZHW81nPKFNn9yKid
	8iCISXgEwmun8ZjPj2FBEOdYBSFpWVqMbJy38crtVtbYyMRNJtcD2LyV1Cp6hXibIKvDiz5fOZq
	FOOUNVARv/kMepy5jWYPWuxtDNkQXANUCdkoeEHWuzyHeLURs/5oR1S6nqb9XNKqq7M5Bqg2n+N
	Ra+CG7iih75GTvwUZbdemrf379sNufBjvSjAGZCtm+PPQYlSanew5DLxXD8TPpROO5uUCLgEluS
	LFjB1Chyvh9HW1q1arPogFO8OKoL+
X-Received: by 2002:a05:620a:2941:b0:7c5:9a09:cb73 with SMTP id af79cd13be357-7c6865eaf10mr1077236385a.23.1743423720388;
        Mon, 31 Mar 2025 05:22:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB2C0mUIk936S8Dfw8nFuQTASAuvqOdzbcBqUJP2HBMJWleAn4wznWLNopdnhY0MJ6gKCtQQ==
X-Received: by 2002:a05:620a:2941:b0:7c5:9a09:cb73 with SMTP id af79cd13be357-7c6865eaf10mr1077233385a.23.1743423720019;
        Mon, 31 Mar 2025 05:22:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c198bsm1107200e87.88.2025.03.31.05.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 05:21:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 15:21:37 +0300
Subject: [PATCH v4 4/9] llvm: also use llvm-config wrapper for nativesdk
 recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-mesa-25-v4-4-e62fc54a6efc@oss.qualcomm.com>
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
In-Reply-To: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lvHFxfWojx4YFoCxuoF2UZUlSlA3hAMgbD6jpGhXbeI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6ojXwC+4n8IAdWncUfs/R7PV3wWFdk1EfhPs+
 RkyfQm2572JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+qI1wAKCRCLPIo+Aiko
 1esXCACF4dJgi8sxM0WO2MEgm+ncy+BNxsEK9L7zgqp4jqVfXQNWMYjghC9ZR9fzVY9G/Dtbpfx
 tW2MFTEg2z5MJxwQSuQqQeO1kLuTJoHFWgbMXH1t7TKMFuL6JXQPjO9nV7E4DNLi5RL1Idju3wc
 iGsd910KY2+YkmQFlkWThcMc9SsejoPBtOAWuhzRDyzy9IhSO0GZYHZHC8p7cnHbEAJBOb96IPP
 ru1C/chUw66rjtIPXRHUDzrdFtUZGBPE9LqAu1qjvXIx710e/I5Om6AHMqmnaH3o8AIWr8IM9Yi
 w9D49q2I+MvG9uWeTdqyF2oZcipVcD/vBsyjibJLjjb54DcO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67ea88ea cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=oZP-O3FlLgu2oLpOfcYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: aNMleKyiusDN5b3nfsqtLwB8QBmA8c3V
X-Proofpoint-GUID: aNMleKyiusDN5b3nfsqtLwB8QBmA8c3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=704 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213973

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


