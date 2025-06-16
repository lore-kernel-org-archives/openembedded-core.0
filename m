Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25DDC71155
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:10:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.1056.1750090244947475670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 09:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nQXiU9Mn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GFt6qI001439
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n0EMHo4O9np
	04bVgB5pf6e3Am+2hN/tEuthyweGf7aY=; b=nQXiU9MnxajVshn60SZtggSJRs1
	rcOQrFM94D/z5R7ophX5kfvqBCHW0dZijK1qyJ9agqOZ0Of5v6uMrsKw0DEhAtfZ
	g02d86vnrPUvug1x2BQh6+0WZJheQrrVksDMPz0b6Ird9Ca0K16OAD2EQ0WIApTL
	lfP1UnAG7Fyu7FEtUyeO2Dvr76pS5jOylmjDef6/28JCENYsZ9Uo2dOYSxuDbohG
	wK3T9/nfMSpiUOAM/9H8j2xvl7p8bbrQ7fWmYOK/KsQ/0Qvx1e8mc6ZOv03bCeqC
	BBDcrLI9DIKmNy+JhaJiIAnmrWkkGncrLcRRQHbyk7Sta1yeFNDP1G8RW1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5krx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so820136185a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090243; x=1750695043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0EMHo4O9np04bVgB5pf6e3Am+2hN/tEuthyweGf7aY=;
        b=YNrnRDscmcY1ttMm/akCEbinaqRbQxcB08pNwi8qdoOuyeoWs28YwoVdSW+PcGrgKH
         fracwfsEJC1ZyqapEu+egtbk6LwDYaSuzVK293SnBR1Ta3nUav1VePhqTPy/TQ4zIF5q
         k1cZp5wEWFm87JnUHppwlALmsaL7/dWYS9vwD1FsgGshwWZ1CNneOqJ1ZEBv4wFcFWwR
         sJa59aadL1uNbaaJGUcJDA6LxFvWDhGJY2kQU/mwqVSAQgOuMAZlhY091TA0NwRBn6d2
         0/QabIsxv/uU/2O0HlfIp70g72SL8Rs/IKDE4ug+KetN9HuzeQ/k5of7efNGGzVMqVnH
         SwUw==
X-Gm-Message-State: AOJu0YwKE79EAmO0IvVWmNTpRJq5BYdqO17gAsyoIv4c8pW5x/xV80Xs
	i5KPV3PKBuh3wB35T5F5z/tfhf/9H0BQxeb52Q+aE+CH18CEa94asPnaGr8GPah3UbzQqAqWEBu
	lZn/CpGg0qZIy0UjuPQkvkYWIazZp5C2znvfDn8oN4tsp5Muhku8SmpWAK+wmhCFokVrrb0tPH/
	5J+KJTZ9qs5Zb/7apx/g==
X-Gm-Gg: ASbGncusG36FnYagmByjM0P3R08Z7WM+Nn9nYfK5xsy3I0tjcEB4UYs/GEnVmzAShVK
	KP4j/CIEUFF1OmZKAN/8+bH4fjc6ZIsr5h5V+Rd+xS2OC+vXFPh13c0dLZyz8Hu8Es5RR9vGgod
	gFeVORYdcG4/Lzvl2rScueTtNI0Sn+IrORjlIWEbHlbjIB5p+Ttblldm9/x9R56G9tvbjZLiaBL
	8exSEAPSaqBfFjwQbIg6nLy7s8tHH3lqauhM/BKGdLsp5RCxf+YdtKAZUVB045LJDNnWkLhzlMA
	we5lj/n7XoliEKADAPOJ+zEbVWLwYJGpSMUDF6ozAu500/PmDzzHABNLYqCiS5YVYThp8qNzjQr
	Nwdi+eM642T43hUMU4pIaKE7aR3LNrMbI14w=
X-Received: by 2002:a05:620a:2456:b0:7d0:96e8:4791 with SMTP id af79cd13be357-7d3c6ce1498mr1173987685a.28.1750090242673;
        Mon, 16 Jun 2025 09:10:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFKylBDeqTfzKqWjPoDpOh70zEHcXvovo/n4wRonR+Op219OYGGrGfZjYJY0qElOeYt8humg==
X-Received: by 2002:a05:620a:2456:b0:7d0:96e8:4791 with SMTP id af79cd13be357-7d3c6ce1498mr1173983785a.28.1750090242130;
        Mon, 16 Jun 2025 09:10:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f8151sm1590255e87.243.2025.06.16.09.10.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:10:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 4/8] qemux86-64: drop duplicates with qemu.inc
Date: Mon, 16 Jun 2025 19:10:33 +0300
Message-Id: <20250616161037.1518306-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ho-r1s1o2Y0b7I6hah4XZ_OdB7pFr7cZ
X-Proofpoint-ORIG-GUID: Ho-r1s1o2Y0b7I6hah4XZ_OdB7pFr7cZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNSBTYWx0ZWRfX+eI0rNYZz1za
 UuMophtyk8+gGPaqFcxT4wMxTpVDTLhrV/rrFwFKjAfqJ3kS55JyAFMbvUE6lG5iKSIaNELU3md
 Hl7MQEV/WLnSPYz861+tlUecmjYvMxE8sw/LzQRUDbLsFIKoA+iigfHtfcJNlBQMn0bRmSVjuaY
 t5962za+n7Ox+RewL6C0aQ/L2ediIptF2Sjj4PoCpDv/iLPw+Oa+QbsIgnkjOegTRK4fOYVtegy
 a3ip8Gh8BoXnOe4AupYycYaWqIcQs162YUK+T3ifmabHBY2Vcp1wAH/FNF6Yx3ghgAAC613ULPu
 Od3spEcCPHmGJY2WZsqSqkpFAcFcQavXrBKFI+jE2bVHnbTo6JoPYKuHrxPjysu8yeIb13Courv
 wdBRUZTYB0W6ZTp5vyoQ39iebHdVpoPjwGcRkhWoebQO6v/3x/EYmMOKJeH+56lcFAzou8o+
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=68504204 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=4rgMR7NU83kZk9lchzUA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218838

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


