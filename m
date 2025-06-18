Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9708CC7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:46:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.3419.1750239958571909765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cH3mGXsA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I2G2CB023298
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n0EMHo4O9np
	04bVgB5pf6e3Am+2hN/tEuthyweGf7aY=; b=cH3mGXsA0uEN+ChMls75cL0u9mY
	WMYns9KzbRiSWn6tpzrcBo6uMFwCasjFOdFJd1DAznQiG33y8RQKzc4m5+AnKt4S
	tY2Rk+TrM4A3GE5b5Jg7ygFs1qt7tSQ523mAPK7jzduRQeYsaF7t5QUrQ/p8+bI2
	9EVikbV9hl99LjBgvZtiYFDQBEIecmP/zkY/TeaN1dh3q5UXoORF9AhPPCtEXJbi
	QP+k7nmDh7EWI06OP2Q+XxNqD1ZewnguyW16+Y3JGqf3lTWtlYIyYh0iXHiGLupl
	UYVv9A1GQ4nF86PGz05QpFxRUIjG+k/n5CDg+QpKAVy+YRrvjDpz1FojvQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9bj5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:45:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d2107d6b30so1065276285a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239956; x=1750844756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0EMHo4O9np04bVgB5pf6e3Am+2hN/tEuthyweGf7aY=;
        b=al2t6M/XsdL1KCNNRXV08Qrtv7n0QiYsFHLdLfqAuxRH9rdUPPetZm776JynKjLaCD
         GpO1O2BpF8+4jBM0ruw5ZY/43rsU0u6RN2YjiApgJZFhfmTnzntGkmdghuqON9cpA75h
         5k3kdpDd6Ajk4gsBY6YgfzSmMRKI7z4dVqJRS75zRM0KGjVNbOvhzE/Kox6lk7VoKELu
         dBotbldyinN3ineKweagb8qZQ3fPzlfjJA2DcUYli8iBXqw2j+WzDJZn+nmeZw/RqVFb
         Wu7bcciy82CDDGeAjkhWvioTDy4gRjBLJBe3/gIfZtu3NAr7b0P6yFDj7sT8IqNY6RUP
         vlFQ==
X-Gm-Message-State: AOJu0YyMqFHZigZIPRQaSygghn84ZDCAJCVtjCTF5g+TORoF4vNZ/38C
	I//R3qvM4R8z8YzBWuMgsVblamLiqUUdngaWXsKN4CIr0tv6DYnvzCrleIXWq4AswR100H8zDAn
	iG6GwTlsH5VSlG1B+8eJ7+FDZv6U3YkS43EJt2WQVZC63SJr9t+CdrxROKL53grU+WNiEYnNMvb
	wZY+Aw07Jlhchc+b4V9Ci7
X-Gm-Gg: ASbGncs/vqJJbWBQMU+iRBoFEUBnUW/qxcyoggro/pF5INQH2pWOZdzWKUjl68mu22t
	aVesXT9QcXnEUX4SAew+N5RlyZf14s+g5GjGVOtYA61TVBc+aEMeH1sajih9L/8h0lbFMm8CFw6
	9/4kxGZgsGkZQqyOGj0LM24wJb0qCIXe56K2vVBbRmHEel5SFCAox6/rk703yNxTXJ8TSJVcWsz
	ppnhwj5552AF9jUwvwnDRcN57ieMp/21Yds3bMdiR7k83ZMezbh5A3vF3HmpAgPsL6AbAG8P66e
	Ru3Ip73npvOAVLirEWQp1VxFgB+mubr7FWmFUgxXBr8berfHk8rx4i0aPlAZJYw3o4kqGv52TK2
	pjMTkO1Rpvm6ny1kUzP/LKxMCizFtxaYc7xs=
X-Received: by 2002:a05:620a:17a9:b0:7d3:aad4:6f87 with SMTP id af79cd13be357-7d3c6c094f2mr2958672385a.7.1750239956436;
        Wed, 18 Jun 2025 02:45:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/9LxZHDl73hnoSUBXR/pKpVwhMxQFJNQSoWrbJxwJz10TxmBj6E2pqT3I3DIBw2FzxEKSyQ==
X-Received: by 2002:a05:620a:17a9:b0:7d3:aad4:6f87 with SMTP id af79cd13be357-7d3c6c094f2mr2958671085a.7.1750239956007;
        Wed, 18 Jun 2025 02:45:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1e0cb9sm2207750e87.201.2025.06.18.02.45.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:45:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 4/8] qemux86-64: drop duplicates with qemu.inc
Date: Wed, 18 Jun 2025 12:45:46 +0300
Message-Id: <20250618094550.1335521-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P2Baa8z-eSMT9AaSItxFg0sK5UVnJu4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA4NCBTYWx0ZWRfXxyX7BW4JF8Kd
 72eTa/lKk3qezoGrNUAZQs9wHH7sLLlCyN48z89f6LzFCvVDzwSDV/PLdc6Ce6Gd8wHFfvCPF3o
 9BNgMQ+irUcuV34V/2TiR1Quh0DynT4kl7LdlohT8jfSO++nv+bhX6NdXLXL70F7z8OYuGdeJAL
 I2vycr9lVUdsY069jOirwEQXUwEoXQj7Q2p52CIUdvUQAor0NvQspeqhvsCe2a+J9QGrILAtA7L
 ww7IKvWkVIqbtPY3GRL2B+erw5uzoUPcslSPQk9ruVJs4wFCaGq0DLLjJjLahtWsZux0dVfvLhN
 YpAorHEbilzBMKCCD5UQsoJl/K7jAoaMGWYBtyJraJ4nsuiN9VDUyBv7ZiHCaqpTAhdt0BddVv5
 BASAW4MxojtT/4x5D4Uit0/T3rMKH+IRM01Lm/poRiCr9KNtX8Lmj2Oi33y1vL0/qojEQvrB
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68528ad5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=4rgMR7NU83kZk9lchzUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: P2Baa8z-eSMT9AaSItxFg0sK5UVnJu4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218992

qemu.inc already includes PREFERRED_PROVIDER values for xserver and GL
libraries. Drop the same values being set in the machine config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/machine/qemux86-64.conf | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 4a9c6d364bea..62108b703b69 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -2,12 +2,6 @@
 #@NAME: QEMU x86-64 machine
 #@DESCRIPTION: Machine configuration for running an x86-64 system on QEMU
 
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
-
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?= "core2-64"
 require conf/machine/include/x86/tune-x86-64-v3.inc
-- 
2.39.5


