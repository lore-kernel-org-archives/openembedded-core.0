Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC9DC7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:05:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.8214.1750255532715751850
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lTHQ2OeL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAMP0U002743
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7zcmQdRI1bw
	wjjZTgFrx4QAMtqGOrMceEEhSysRxJRg=; b=lTHQ2OeLI2y2QbLFfU0PLyg2OOX
	ZaHe/HVJ/sfJHsunkoHinzceCLYEmP3aGZ6HD1GqzqdrkWovPfRG8QsAuFZAjxqc
	TiozvsMLjDahju/JM0+MT0oSAxa5SnpTsC0KrInJGCAflO4bU1kx7tFuA/CjWSQk
	dEtvP6ko6Z79KtvhN9ouPRx/X8n1OMRbJJP2rN6HYfm41VrEarG8xPCBfTrspo9E
	Zf00OnHFqV93HwkA/VoGH2tzmsw/xFKdnkr1npUi+TIMRSMSNQwAtAUBhMi/zCSu
	OS1emWxdW+8XKkIFH/a9kvVrcWsEPBdSrXLTOQexOrA+ufCz3cLSxn/KxdQ==
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag238cj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:31 +0000 (GMT)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-8730ca8143eso74182239f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255530; x=1750860330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zcmQdRI1bwwjjZTgFrx4QAMtqGOrMceEEhSysRxJRg=;
        b=FjHO1MV/OL6vrOrpzL5QL+tPOSQxPdXs5rD1KXwL6VmYPtOkQ53LIGi++0gu96j1uY
         ewUFMcJvu/xjbE31ffvY1Fe0v9SJ0T58dww0UhiO2X5J/cd0IQLmmCbGsMLASn88kbTi
         RhpVlieJap8m8gLRPkbY4mU32joHgfDYbKx8+wNWhiyryaf7UReAodCLgc3mqWDnpGoB
         kId8tavxDz80gdpjjDS/eP+rpbBVAy0cYMrWB8pB5BRkque02Hgs3M0ExFvSQuFj3FY8
         WQFz7NZ80lSqX8qoYFGoaQWV9QQlUxcZlhTCSbTlP4pVL5soIHK+Vcdy4/Gv5lRgdF8d
         YDxw==
X-Gm-Message-State: AOJu0YxJ3uRyCtTAAyQTZFJw8EBAitNic5iS1fhPOaFS+HX67RccHKs8
	ub9WxympHe4vwMAj7AL7yrsQAHgjKQKTJezLSSrPyTuLwHhTya82jJmGRmrQfStKHxvw2jGqd7z
	UayrflGG1aMWukInOiS4dx2CEaqBCnLALgUzkUZrdam9lsq1PSb4MXPcGnVsW1wAVLk+MArHqWh
	Pe/7Pmu5YoHD/qs1SHYjl5
X-Gm-Gg: ASbGncv7iRbIQYY4mDKbRQcDvi+IQM24lki6LGr6zLVe7BiXfTx6Kkg3U+Y0HcfTwAd
	zAo5mPVkxagn/60m+/6YAfdRBXTE79E7f+8tpd9UMETdifp/H5ND1OK0gtV7dw2yOh21gUd7IpM
	WTvPJKmu05T1gFKQS3TN6T1m1q/7iW4eQOK90txi2qwgfBxixoCEeqA7e6bFqmvwfOqCa66yRP6
	tPmvq9ZvhPDbcITu3gYF0vBYRzIgjiuzROhPSJfXjC8UdvVqYI9ENriPzyxNm4BiEPyuZ0WE0dw
	2UJmhLKOIqjFi0ZbkwSsbflX/QUVLNgY9QAWh40JVu4c5DIstXqWfITDXedKxYOGVhnVIjprwpb
	qgPdCItTHyznaY9YslJ2dan1hmbIalsySbqE=
X-Received: by 2002:a05:6e02:470e:b0:3dd:bf91:23f7 with SMTP id e9e14a558f8ab-3de2b407e4fmr29863545ab.7.1750255530004;
        Wed, 18 Jun 2025 07:05:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcKzunJ8WliDhHpyf2FSZY+R3TVLZs5OxBZQCi7DlSjUxkmHvCtHYlPxMgJ5qrWSa03Wt20w==
X-Received: by 2002:a05:6e02:470e:b0:3dd:bf91:23f7 with SMTP id e9e14a558f8ab-3de2b407e4fmr29863025ab.7.1750255529565;
        Wed, 18 Jun 2025 07:05:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3b769f9esm20164281fa.30.2025.06.18.07.05.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:05:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 3/8] qemu.inc: drop duplicates with default-providers.inc
Date: Wed, 18 Jun 2025 17:05:21 +0300
Message-Id: <20250618140526.1431757-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 865GExIUQjm8RWsMfWEgaKvki2QMMG8U
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=6852c7ab cx=c_pps
 a=WjJghted8nQMc6PJgwfwjA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=gzXrmaAKBCNsOZIF0V0A:9 a=CtjknkDrmJZAHT7xvMyn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNyBTYWx0ZWRfX2cN/PsfjA4Mx
 dsiRJSpMWsuRteqEHw6GPxF9yo+WjMVraPCgGkcf4IcOWGTgSzdPnECevXgLFvePU08NU4+/Aop
 J+elH9lSn71RNRB0u3RWSu/q+lP3S2MQ7YDMmrEPjjujy684L1BdRtPD+bIuRtBiP14TKiUaNSS
 usNlfNoXGPvNYQJ0nC4sRsjYnUAj7/Sly6TbyGeJj7GhRq+WQUjehGjyflezDwlqqB7DXYF8/eP
 S5+TpdK6zNf3WBgFa6yiyPpYTGPmZe+SeMeyRITVO4KzuQ5527dg+twv5n4C2H1Z/L+Pkwh0I6G
 s9f4b/bPHSYqqjPD1bxTP/mUkQOfPOMDG9GyeyS6EEp7psLwy3vVMa8T+45XRoDMxOmIUTGWqFI
 ZKFbOvjpLFOV7O+R5wiK8Gm9e6e0Cs6QHz7MYHoCksA1/DI43ATYUjPQh00L+qTxSMBqUAx0
X-Proofpoint-GUID: 865GExIUQjm8RWsMfWEgaKvki2QMMG8U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219016

default-providers.inc already includes PREFERRED_PROVIDER values for
xserver and GL libraries. Drop the same values being set in the machine
config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/machine/include/qemu.inc | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index d7392d476238..c143e37f710e 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,10 +1,3 @@
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/egl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
-
 XSERVER ?= "xserver-xorg \
             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
             xf86-video-fbdev \
-- 
2.39.5


