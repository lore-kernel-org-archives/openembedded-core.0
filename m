Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D964C7115D
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 21:21:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.7316.1750281667619535082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 14:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=P6wvqMNq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IIjioX024471
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4e2BxkPexIz
	s8xpwI/AgOueGif/RjaBce9DCdNz9mn0=; b=P6wvqMNqeFKjwBvMMPWgRw9PZSa
	dZ0bpD90OjJYTvNPYxReHkjE7uAozgRF1DzNzHgeuAhRnMSz8MkhrAMGxHRXSD6+
	NGPcljzzf3bBGZmTWiZyhPGy5WiHJ0Dvu+RGjdPKNETQVjGqDwrpgYdGXAXAW2+s
	Gfo4Lj5Eab6/mNnuAEjBsz78OLfAszxXJeq2j1LCRloHPJcbXCMbNpKJ9pVwluHp
	MiC6rePlVhRTLNWRUEiLVVBeD7flMjBb1u1M7pkR1rdAf5i4HnZHNFXHHqZ6Do6D
	SSWHgJN8vuHQc4U8v8q0S93y3goM+IbHrEedg0Ut7xxhndh5aNjNcdzX5ZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca5s0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so16614085a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281666; x=1750886466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4e2BxkPexIzs8xpwI/AgOueGif/RjaBce9DCdNz9mn0=;
        b=cF2T3Iub+/SDWMh3ziM91rIDRUcR5QVMGAYNfKvTOfD8pFLuJDBP+ROuXx81Pd0QBu
         9f4jxRh8WDlIHv6SMCAoEVPzTe86iM/HBx0Fjxv8mzghSZjDaEjTG7olHq1dmQs7979v
         K+sPE5r6CnMRt6xVI4FmcBdcz8E09gwwnuQEbphRIc8Bo8t7bzgrxN6b7TL6YDSY+G53
         u+uqklBoB2NbQeLhOGvD3Mi16ZMrhxL1s69dijMfuYk1hKA3A+FiheiRtJ7MYdbs9u3g
         g62js9oM5rmFd9bw7nIl66EUoHBUwU16TwoYq8FK3UlvypjlrvMC8RrzcdBto3ik9bP1
         D2LA==
X-Gm-Message-State: AOJu0YxRgUcUKRkSwdp3IWPogMNrwheW+Il/J/plCdvFb48FhKYmhI82
	QTorOIe6go7k6LeYL+fVexM/VvODAE+3TpIA+rP5+3lBlyV4EAjM2mIJYuo43/DB7UQ2vDhQPY9
	xeRdOUYcjrU7Go87BkbhAZGqOr58HodkV7iic8ryz78MALcLomMJfAvXx+mwM7qyvSRQdgEg0yy
	37h+qIe3rcrFVTF0jX4a7E
X-Gm-Gg: ASbGnctxvmE33TvlxHh9/rfedYLLznnUkaMfszoNhNq2gP62pSzOCof6pU7Rv1gw2mA
	PWgLzW1cCDXTblVZl2dTpCqPfAxhJ0LGr9bNtENvOl0q2RR3XDJbkSvoRoY1I8Crb4L8gH2RhSZ
	TktGXq8Bo7M8n/DlNHYs1x0Kw8io+MZ1ThjithfMFOZQMd6dFips44tFH2Tr3GhfDyYyyVOzTNg
	avRhnJcLd3VcSgXvlrzyQEZOFfLMn8bErEiDceV7PmtaiwsyJHyCQkW09CjVjrjjjFtu7uqnLAK
	Gghl+Qlp3AszU6LLybQwXpjZuilQBbewx6Z/49EoJHHtND/+d/7Q6D+tH3cSD73/puUWv39Omdi
	lpJVSKaBrXb9vsTUmzg/1agmhqC22V0Ui7qA=
X-Received: by 2002:a05:620a:4398:b0:7cb:de0d:ba59 with SMTP id af79cd13be357-7d3f16f2ef0mr184128785a.17.1750281665687;
        Wed, 18 Jun 2025 14:21:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSuM7YIaWp9TC/hy4v9UTuvl9nFoQZr8yO6TGmUdM2TMgHk8njpg24ogdL02H1cvv4lEVZgA==
X-Received: by 2002:a05:620a:4398:b0:7cb:de0d:ba59 with SMTP id af79cd13be357-7d3f16f2ef0mr184125385a.17.1750281665250;
        Wed, 18 Jun 2025 14:21:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c12e2sm2368806e87.153.2025.06.18.14.21.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:21:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 3/8] qemux86: drop duplicates with default-providers.inc
Date: Thu, 19 Jun 2025 00:20:50 +0300
Message-Id: <20250618212055.1529969-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 48DRUOy7ksC93mY44-ixh4REsMpRSSe8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE4MyBTYWx0ZWRfX4tULvHVEsiFN
 w8sk/MPEnmZzj2j2i2zPoVigl/gNdgRsCOS6YNXkrqASPWqoWupuNFu4qctZZZGyFPwZbB1elEx
 mr06/XRtpMtONhwozKTI4VjvQnwMBAb2Js2VEnxLx3r5i1kLWJ/ZSIjCOatVll5XGsu4y3i2xtw
 96S2+mZVaMBpuJds0z9b6+18nRMY6mu3cDuclAJ0aDYj1A34uiMPhNkESUIp4oxw0mpOMQRaUCM
 ME1eszatWFROac9qX/0vdsqg/89feIlFK7xscDXRC1w4vREIWl1ES//LgKQq3GB3mFPgAMB+/DD
 h/s6mO8GKoLmAvizyJ3b6MUdlaACHSIO8em0A3zrZ8V+GMA7ifFHFqUJ2cDr/T5KnLBFtulYgcx
 whdwGtDakK672lQ6j8FKBQapfMHVmDeFP9oi/k8+6NbfC2hS7cdpIzI5CPd0mo0sCMNRmZJM
X-Proofpoint-ORIG-GUID: 48DRUOy7ksC93mY44-ixh4REsMpRSSe8
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=68532dc3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=_kTybgIiMiGBH06O6-8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219039

default-providers.inc already includes PREFERRED_PROVIDER values for
xserver and GL libraries. Drop the same values being set in the machine
config.

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


