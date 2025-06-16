Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07742C761AE
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:10:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.1055.1750090244001793770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 09:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dbZDQ5/z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8bqwo021721
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cIZv4YdZ1Z5
	jKoXMhFBKhfcImuFCT7nb2fFwptD4H4E=; b=dbZDQ5/zrWtuOcH02Co56chtz8t
	wWQU8hvT22NKwx266XAIqMRSAGNdEbRdvl0OzAEAWtN5zjpd798FEkwgxpLYBj9W
	QLd/I2XzhOBMAlIVvYIG+IJpXWQsvVd1TWnoWQWw+KHjvwr8J8RDAHmgU8HBNzpe
	z7a9ZdFDes/qhb2RFkIjKcBw7NGji4Qs4YBItnwaLkkd3oY1+y4iC+PYNADyYEQX
	X3NQppmnhbfJ+Cgo081bFDbhF6cmJAfKCLfpnx2GFz30Uyx0aP5V3VYBoqkeit9/
	yJ1AVrWSFK9YQpayA6pM6f9ZGn+Jn/3xD1EcXQm3reSoZRTVKqQ38xewyCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9w5uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3901ff832so1000250185a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090241; x=1750695041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIZv4YdZ1Z5jKoXMhFBKhfcImuFCT7nb2fFwptD4H4E=;
        b=BTgZxUm/Q6RIDxm/jxR6Z+0MuPxq2DnzEmTvXLZ0Ldlv0PCpuZDEKAJrhadLIpwUHt
         pTcwZLD8bM2BEPt1Lm2SBiZnnLVs9MQ6wYXHkzvV0RmgvIW4V/QuuXttPedDX+leGO3i
         f7D9s9ghRpEo5iRe6jWAPYR1LaBgpOpc4kk7lTX0CsLL5Xnl8vY9B9mhw3usRu1LZzRT
         2y5pvKSRpyoFr2/GnVamtKPRHPmddIpSdazZZh3gLNY5eE9fcBHEzE9FHeyvnu1riZaf
         9tlZzaHChlx8fxIj6ahVdeagxzIRDTl/rn9agc9qk80K2lqV3YpWu1MYxvS7GfB6of9h
         K+YA==
X-Gm-Message-State: AOJu0Yz7Bhc7q/BwqsIsAtn3gKerDn6wj9Krl7m1xuZQ2X5aPYBSB/ur
	/jje4OBBBr73DCHEIICkuPvoVb8RG5PyXkb2mI6BuN7N15hvMgvqNg8Y+6l21vFN2yySfV5bpde
	ywPM0TZtkDDWN3IXB5xqR2t0Cn2B3WGUHOEd7j1KOiJVuxzgzAEJG6GNtdK0ma90MqJXkXGol21
	yUXskzvu8YKSsp/XuHtQ==
X-Gm-Gg: ASbGnctKbH7+6oSBdE55UQxYec/eoBrvGxVN4T3Ysx5qKOD+/7dbfrpbTVxY+p/2bpC
	fPoqI+vtaZVcGtyGCkOq4MG8Jxqhv5S20l4B3izm+I864TSgKWnbVhiznQlq4NbikAms72KIqSH
	U6/8r2hz4Ju5WOUQrw4DfYLU6PukK5gu4i3Wl7vRkLUPkRVLHuyxl4hxXsRa1YSvMign1vM3l/S
	YJ6djkldgW+vRTEKLJy+PNOV2P6gHwTyPeC3dRwX8DyaQkrVgzTL6HB35Vx8U/N7tRqrKpeV2Cl
	sKWUZ1fq79R9JRcx751DebLuSbJgIE0iQVdG0d9gY7AGADNeg23brLgrVOithEHNLAMsGbH74lQ
	0l52LboBB8R5PwZZf8FIDJwX1qlniL2Ya/ig=
X-Received: by 2002:a05:620a:2684:b0:7d0:98a1:7aba with SMTP id af79cd13be357-7d3c6c19403mr1310380485a.17.1750090241538;
        Mon, 16 Jun 2025 09:10:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQFxJrfoRxhEw2QIaAmNMuHhAVDxglXlbr+0JpLgoJGHDVd1K7zgZ2bQXASRho5GExklsNQQ==
X-Received: by 2002:a05:620a:2684:b0:7d0:98a1:7aba with SMTP id af79cd13be357-7d3c6c19403mr1310374085a.17.1750090240903;
        Mon, 16 Jun 2025 09:10:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f8151sm1590255e87.243.2025.06.16.09.10.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:10:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/8] qemux86: drop duplicates with qemu.inc
Date: Mon, 16 Jun 2025 19:10:32 +0300
Message-Id: <20250616161037.1518306-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 48vFOz7xmV_MlOitEvlwqb5pq8WlZhzX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNSBTYWx0ZWRfXzigUVR/vexVs
 NC1MDEVNgxSgbbO4RLeO96r8StKzUcElAmP+ohRgYLnU6uFqr0dNadqnBZf//gcSmwEtAkd/if/
 iX+fudUSTv3NtTHUsF0guIYt+p4pLPu9vA17jWDq09A5deipUEzFwCjDmAleFxM4uqKA1FzyJk2
 4NXPynbogbACmm0yFAOQ2931JwIwYZ24VDyOz7yCusGmSnjdysHb589B/k7kAHdtMnpVNg3vEW+
 4sGip0CzyXP3ha+G7ThJCfZKnynu641Cd/1iwTxzpiURYWwhCJhcNVHQixw9tooA16xXuU8LRUY
 fy8D9LzMPbYtfkFoR3YVrbXHmAaOvu/Hx4pi1PWcEhQgEm49S0V76CFHuUxfvKR/btvt7ssayP6
 AG0d+x1sgdRTiv6OCBWf51MYL9ebSkDN+4WE5mkLBZh02s7GyGHk/vn6u1q3J+9SczCphImq
X-Proofpoint-ORIG-GUID: 48vFOz7xmV_MlOitEvlwqb5pq8WlZhzX
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=68504203 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=4rgMR7NU83kZk9lchzUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218837

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


