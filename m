Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32B4C77B73
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:46:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.3418.1750239957215309734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nnUgUQrT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8Q7H6007205
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cIZv4YdZ1Z5
	jKoXMhFBKhfcImuFCT7nb2fFwptD4H4E=; b=nnUgUQrT8jvp8IVl+ar0WvHtzH9
	q+ADRBBgqpQ7jLT+87JQH2x02qGtnoAwtPdd+JnrtBLCLdEuPLrXxVU7yt33zDtG
	Sg+f1mTyMwsYTh0AYGcR6yXjeem+mFBwwaRiPq+FLghvMxwZC9Hy1NIOabZQC8w0
	9ic7lsonv/vKV6EKwMvcrQ8AVtuvPEUXmo8E/CK3Q+SDag8RguGHYAeQbYUHbOIb
	XgEt78ugPLq5A8cIEIy1GBsrqJLQSIHfUdV0yA13p0b7ACZ9DKhM7BwUA9IqqEY7
	RspIhY+c5paa+A59fDGPVcmkAEaoP3+275PVZRD+il9CXDayx/3VU9+iGEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enkhrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:45:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3dcac892bso106710985a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239955; x=1750844755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIZv4YdZ1Z5jKoXMhFBKhfcImuFCT7nb2fFwptD4H4E=;
        b=ZP+OQxomLH0XtORpdfQacYwnnwuM0sbiA4Phxt0chz3EhxE5UgrNukFXW577U9x1Rj
         SxB1DLYw+LO3Y5KhwqaqiL8WfkzsH5MTSFj8MQGCSDxHQ9puZS/2vqGbah6vGR9qAO1O
         MenW0JEojDxRecveW3rPRfUnA6oq0R/HVNoEAeoyYFMPfENRMQQkfnjJ/J4BaNc/zAyV
         RYbbh4US8GdkvzxP3blSiSgW2ro5bjJarOUt6Y9azC2+q6W68ouwtOB41hKTjRok9mmT
         tlW122N0NEV2ILtnQSDTmwhDqAEEBgAnzhCBEBbMl8sOECxOFP7elGlIqtbwfCwws9pz
         zQyw==
X-Gm-Message-State: AOJu0YwbipMUyzjP2qHMO08WOVrw8851f2AU5ZLNIprfQxZr98+/4fhz
	HAVs/T8h1askeCJ0QI0sMO0QoIe1/jYN1vaVF0FFyNSab5tC+V0bEy2ouVnxJuv3ij70JXHxLUG
	Gz+bMv2rtK1VoZdNBw8IMW9eOEndHGjSrQLAPFUvLzamAWI2ldOYHX9HDK8DLfIqwRw6QpDnKnG
	MtdhYkuhtJNkoLrJGZ55hS
X-Gm-Gg: ASbGncvoFr4ETn6mXDgrxFzsI6Fltg3jzo9pNM3glRzUisVvfDNoakPfh177zfEjteD
	r/gmXCmOt8srOK33pqyybmJpulD1KdiZ8cNklwYBgpE3H4p2TCL+wSW1haJ2Z392Zx/xks1sa7d
	ppKwsqpU75gTTlv90DURLhvpg9zor8K+H5JlxWQBGWhAlDAt641jo1kLdsvIO64oWaX7MfGu3YO
	kWraJ0GSTtRsU6dAsNzxwRiFmEqiCvLDUmVSJqjc8lqKZhK1NNAPgnD/muicZQixuw/cUw2N77x
	P3Bo0KBANmDQXBsfI0cmRjHqh7yyB+PEbykq+2IWTlO73qutoSWIinyPTBiciTRur7PZ3XEYcx9
	l0dXSHGlhW9tbmiPBA5aLWXCGkfooB4wr8zk=
X-Received: by 2002:a05:620a:4307:b0:7d3:904a:30c5 with SMTP id af79cd13be357-7d3e93ab545mr253853685a.4.1750239955212;
        Wed, 18 Jun 2025 02:45:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb+E1bhxzB03No5Ht+VPhzRsFvH+pBTKau28/YqIEoi+6QlRLaV7wHQV018FkEKB3Dzr06ig==
X-Received: by 2002:a05:620a:4307:b0:7d3:904a:30c5 with SMTP id af79cd13be357-7d3e93ab545mr253851285a.4.1750239954677;
        Wed, 18 Jun 2025 02:45:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1e0cb9sm2207750e87.201.2025.06.18.02.45.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:45:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 3/8] qemux86: drop duplicates with qemu.inc
Date: Wed, 18 Jun 2025 12:45:45 +0300
Message-Id: <20250618094550.1335521-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: D0S-9k0E9Ibiy8cFrtfjH4KYy3OVS-04
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=68528ad4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=4rgMR7NU83kZk9lchzUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: D0S-9k0E9Ibiy8cFrtfjH4KYy3OVS-04
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA4NCBTYWx0ZWRfX95AsleFdA+eE
 gQIMrfGHVyzXFnRvt41Dbv4AhJ0S2KAxod/14AUw7EMIGVzKiPs+s72dkE+iMh4BjopB0+i4vLc
 NS0yFEHNPuQ/uc2xrgNX/Iy7KAbTkFnKRHqpFn4YRybBWpbNFV8f3LgGcFJ0Xd1W8TDBQXwPX9Z
 bBw5YylYnzIA00sH6eNyQ/RHZ9lt0WNv9eF40DHo6UsNJamt2nQVtXz0NcWMKzoua4v5WDA/rBD
 mZEsHG24EQx+QDVN8OssUxAYDgt8KQ4S03LKZ2LsxqI/VNNdGQFPqPZrFEr5om0vd2dSCswaaio
 0S/Ed69h2wwfk8qEeRFE6CnlS7JyFYre+FVCWXBV3LnherMh4mkBsbBGbtMtRj1WEcVvl67NHBW
 c4yPms7q7EHWpdFMmmM4AlnlW/564y/LMqKCTrWH6U3sT3sv1sxMEVyYJET0l1s7Fn1H3ZoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218991

qemu.inc already includes PREFERRED_PROVIDER values for xserver and GL
libraries. Drop the same values being set in the machine config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/machine/qemux86.conf | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 1e072e1ae285..51f080bd2a51 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -2,12 +2,6 @@
 #@NAME: QEMU x86 machine
 #@DESCRIPTION: Machine configuration for running an x86 system on QEMU
 
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
-
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?= "core2-32"
 require conf/machine/include/x86/tune-corei7.inc
-- 
2.39.5


