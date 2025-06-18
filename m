Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FE4C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:46:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.3415.1750239955837502336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hGmIi+HJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I5lrfm002282
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SF/2SxdgCVJ
	hFVdyXueN66J/zGhkwBQ48ktSk4pZ5jo=; b=hGmIi+HJOQYxV/DK6qB9R9EHzcO
	oNdt3DrHr5GL82j9UumpB6hT8a8CJxt7201Hs8aDBwiPcqvrA0ZhZw5srLg13h7a
	QuOKXvNEPo73B4LvMpnNt/y6zg5bfXjyEK6HcUlSqTtsgqc4IyoqzD7WMtxy6nEo
	FxmKw10lErLZfqic/eabcptnbNdqVc7Mz/Hr964SZ9P82SmUesxEjfH+Q19K/rjM
	kjcaSVPfutqwc8f1Mbc6G7pPrGI3MgW8UBwdcaFBGSwDP7g6XzSqC6dptSw6ofat
	e2ReEGbNAa+MhXBN5C7gKJvUmHysxM4CX83ScfRDat4sQvogDe/O57gJ9ew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47akuwf2fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:45:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so1020322685a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239954; x=1750844754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SF/2SxdgCVJhFVdyXueN66J/zGhkwBQ48ktSk4pZ5jo=;
        b=R3K67yZasC9tL+zd6kKyvkVZg4tnSq68WaPfoNTtNIgSuRdjXdmeuWdhYnH2HOJmNX
         H8PFPEAtdVuVkcng1NtXx4nw9wLNRSXLrlNEykclyQJcQNxholDxy4YHwUv/usGMJNxp
         3JkbhE3K7wyX4Hw1jAivHKzE3U96DGf+7nFKgRL07UVjjYLm1zU6Z0NCSs26z6J0LAk6
         vdI+K4Qk/21ZRjiBA69XYmE+h/90E55zzRCectCJeWcaTG5FHCr+sHaFn/4FeX7jw3uj
         iE/YBKdUDTLDoyffp2Mm3c64gLOChyzShIBvmZTnptMaVOToEMjoYUgYUJviBq23DbaO
         8qoA==
X-Gm-Message-State: AOJu0YwwSWyd9QRoJWbopdnGUUJds2bIKhA4pjCBPxX3wNzvceHYNRvF
	C+Q2WpngybYYdWGidrSah7sZmnrEiO9l5IGXRTypFSIVAA8PAihaYD0SyvGDEz+OVrsObssAqPa
	0W+yMrbVm2k3wcowvGCvTIAji08v63NeXppu/+TFKoalZpqdR3PnGjc1CEahJY6GA/eMrQnNKFB
	aFGZX8o+wA2fQZm1P5naUW
X-Gm-Gg: ASbGnctkoyv2I9hbNbAC4BdenfGyDgxnB3aNkPQwFV7femezwHA1HnFYVD9JXmdmPZh
	1lFuTixjrT8jaombWBXoeEb1GHnt6rs1pjJsLMkTfY1QLB8S6ZMqmfjTXeL1XWlzsz3QwzvYYI5
	MGmJqOAnHS42rNjYV3sJGx1NUR64HrCskwl4BP4dTUcCw6yj8CkwpAEzN2UyTqcwaiT8HCuEuxI
	QUeDsL13NQJfw+HB0dEWLtXImtiq+XDPjtuWjthFwGp/hl0xan+CDJDmgpXec1KUx/wW9JjJmh4
	5DKRtBysSC8M+T4PPXJA5TTiAMKR10KbedyhBOcfWlt9/3KKB0EVz/6c5W7+JOOul2SHDloQ1N1
	hCqEqDfM863Ib7sII14Wncgk8KoKgrl9ra2E=
X-Received: by 2002:a05:620a:2954:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7d3c6c1ab9fmr2431458185a.21.1750239953834;
        Wed, 18 Jun 2025 02:45:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCR13YF2Qh3CAgqKgyellIBt3mJjt6T2Hq8fg+2kY7yHMYkFE+YyNwZ5kcpOvnGJDYQeo20g==
X-Received: by 2002:a05:620a:2954:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7d3c6c1ab9fmr2431455585a.21.1750239953391;
        Wed, 18 Jun 2025 02:45:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1e0cb9sm2207750e87.201.2025.06.18.02.45.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:45:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 2/8] default-providers: fix GLVND providers to be selected at runtime
Date: Wed, 18 Jun 2025 12:45:44 +0300
Message-Id: <20250618094550.1335521-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PdHOS3LTokDeJBcfXBRGmXtcwhPCjmXu
X-Authority-Analysis: v=2.4 cv=He0UTjE8 c=1 sm=1 tr=0 ts=68528ad3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=FpLzd-OWU6oQ4w_CiacA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: PdHOS3LTokDeJBcfXBRGmXtcwhPCjmXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA4NCBTYWx0ZWRfXyTdGgZTgL7kE
 jmJYJeQ8AyP3eGh2fH9RocvXJqNHztOPi3XmOtWmG9HuiIiku2w5kjcTmSWQeOjZ8Owoq/3MI6l
 dE3jANVnjshga4v0bfsxR0jBjQi0maRrW0BS8HejLnN3XETNYw7qJ9iGMYyJTQBROpMMgU8V1PZ
 m2jZ/BjlwRQUKu35f/K7AUzbqDFe5ytPqKKKa8aFybIktNWC40bSIo3dvkDlQlcR5/RyQlgw+uK
 3OOCDLMfjd+T9jPWEvuwj5k1Z6A2j8r01MgYCtchOz/bTzA44iC1JqcAbg+erzsPA5LQpx3h0JV
 nCWtM7TuLiFWyZEwQXBRHEOdrSlHmBRNcmTkTWptkUOkqu24MKQFT5ct8ViIRwOkAA/LueMk78G
 n8Rz0wCqGLu5g8yjOzyYONjPSGHBTZe+kc2eLtR7WCk9dSPxN5x99QWc6sboLbR84XHHQQjv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=934 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218990

The virtual-{libegl,libglx}-icd names are RPROVIDES, not PROVIDES,
because they are a runtime dependency of libglvnd. Make
default-providers follow that and specify PREFERRED_RPROVIDER instead of
PREFERRED_PROVIDER for those names.

Fixes: 9d3b4c9bc403 ("mesa: sort out PROVIDES for the glvnd case")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/default-providers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 4f094163546c..274ad0c4f630 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -7,9 +7,7 @@ PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libsdl2 ?= "libsdl2"
 PREFERRED_PROVIDER_virtual/libsdl2-native ?= "libsdl2-native"
 PREFERRED_PROVIDER_virtual/egl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libegl-icd ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libglx-icd ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
 PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
@@ -68,4 +66,6 @@ PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
 PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?= "nativesdk-libsdl2"
 
+PREFERRED_RPROVIDER_virtual-libegl-icd ?= "mesa"
+PREFERRED_RPROVIDER_virtual-libglx-icd ?= "mesa"
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?= "rxvt-unicode"
-- 
2.39.5


