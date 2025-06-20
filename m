Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462DDC7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 19:15:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.4549.1750446921990079252
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 12:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Cyjx1rdU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KC1CBu032725
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vygAld4ZBQs
	dQKRuo92zHi5eIEoQ3G0RQAYlYSWVipk=; b=Cyjx1rdU9xZez2uPEnNbKm922aK
	MEnVvco64vZe0z4jLIBqQgKR5rjDJimukxcisHvxZ2kW+faitHoyqk/6RcBz4YCN
	6emraOJnY6xLRrGN2XOnz6SCEGQBzhrEzXFoCZNJrpI4QKHahgVrqBR0DdG9XwSQ
	TqXxNL17R+Wk5ggjdqhManzsNfJqVPweXqDM0Q/WK5uV1QxmKPidnLvCcZas7zQU
	yt1Kg6rR648FOG5+rh/DfLMLlxh5G7Rd1ZazhPv+VDjTMSVMDUGHct6wb2CMcMHi
	oQ/P93Pl89FQ0Kg8Tntbg4QzQ3ZElp1dr1Z8xgfdjC4FjRo4CNBjHOwlW1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792cachny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38f565974so351851085a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 12:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446907; x=1751051707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vygAld4ZBQsdQKRuo92zHi5eIEoQ3G0RQAYlYSWVipk=;
        b=J6sl5hgiGQp57gziF9D3VqBqi+EPPJln4GZeLEjoTqfFgyZOzq3p4iCpISSh3jJ2Cu
         JT9RGQ0SRXiQfZkmhYYXtM5Xl/gs3VM7GPnsMbMhaSds9zmMaAzrVk5gETMju8xe9AfH
         q6/XIxw4G7mb2B3dCjz/tWGxj8cW46+eLbsWcUDbse7e95LN+rq7szcSGPwsSVHDuMIZ
         ywz56EquhLKmY8H4kdtyC0JZJVoZpSJpKcd5MC0PTTV9vkGP/FV0VjeXeEeqq/RT5L2J
         8MSmN608NS0/GrAwtzD55zDHm9IBQPgomct1u7HdHpJE0zoP0cXlfo57sn9d0JGrdNNM
         ewoQ==
X-Gm-Message-State: AOJu0YyWrngBg6Skn1NV98J8FWRSkYAs1Dbv3akhKF+d2usaWl9mOzAH
	k52wmX0plwzTiUu5YaahI4Q3XkXnLqHOFKLHwksUjOi1xZT9md+xWGhKtSSUClCzYwvPB+rbCFw
	uZWnqHopWqG3lx5kdJ/OR39S7LjqdNN9Z085aYzuBfGpma+HD4vPrw82stR5lvv3z4EG/OMRagt
	T4i9K5cn3SNwXKjLwa9w==
X-Gm-Gg: ASbGncvE3OQSAv4d1FnPO4ZjABJdOul3TsiHbQSKNqoQ33SZ9FM5Z7jJNZxv2c+1BEo
	6pEM/HDM0VO15fr7Ff9I/jQWpX70OlUvMZDrOQTfKpy+dg5KVrZCmFmBzLz1Z0tZLbtczlvmr/2
	ACKwtajk6uhyyEksJyN5gbdzfcDJ7NUpAzLxWDqHF1bwy8edTkgWMz3g+XSXi7xe7izi2VY6nSM
	IsydG6QEMEsd/abmHyfmsuiUdBWdsmkEbnQIVHe+2B+tswHCUWHkRGsuF68JHUMORECZRS0v69N
	UFMLxJWLKRT4RYzCCbVj7hOFka1dQFJ3dAuYD6pE/i405w1Oz2V5FFFrjEOKjnbM0uSrZDbm392
	HQ5W9h8ABhv9yuFZlzQuz98KSksbQwV90ntY=
X-Received: by 2002:a05:620a:31a1:b0:7d3:d028:e765 with SMTP id af79cd13be357-7d3fbf762afmr488156485a.2.1750446906641;
        Fri, 20 Jun 2025 12:15:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxOlIJjFQoekxWwzgsGSXVYyEAaKOINldidmDvbSLSz8pRAth5dNkR0JW/tG707zhs0gy/aQ==
X-Received: by 2002:a05:620a:31a1:b0:7d3:d028:e765 with SMTP id af79cd13be357-7d3fbf762afmr488151385a.2.1750446905920;
        Fri, 20 Jun 2025 12:15:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc124sm381614e87.215.2025.06.20.12.15.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:15:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 5/8] qemux86-64: drop duplicates with default-providers.inc
Date: Fri, 20 Jun 2025 22:14:54 +0300
Message-Id: <20250620191457.2018861-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CDraeR79rOzpq430NYq9HlzzKZkOjXGC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzNCBTYWx0ZWRfX9vz2lKv/uYgo
 GX4Povy/DWGdVXDKfykYH5QmWUSmgsL6WfHekDo30LauJX8FNp7eJJUcl6iP+Fy9qyGWuOMmIfS
 M2dKpJ+QuP5ZkF1rkUkcShfGJs6xFWeOWcSQsdgluGS6vdWYerj8BLSS3WULonAdPgcZHgju8vm
 urqPknZ6evAyj0XMuXonzcne7nqtChOEtb3sXukZoTj9IdRcLtA6rNiL8e0ucKE4wIc+jZdNA2b
 RqSG1Xgq4eKfMxfTFnWL/MidWnT+CrsIkitwkOYKCSizZAMSP6kyPPlSAQ36hVfdvgTbo84cOwc
 vNA+C57uT+CLNbXPUVDr7Reni6ce44CYOicmXkqoS4UECn8jA+CRD1vL24Ij0cQbf35Mb42ZCRd
 jH9+bvhCh8b4GjTE/jZ+XxNX66WwrgD/n5GYWi2hUYItsJ2MQY5acsCGinfdBvEVai6AU9Nb
X-Proofpoint-ORIG-GUID: CDraeR79rOzpq430NYq9HlzzKZkOjXGC
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6855b349 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=_kTybgIiMiGBH06O6-8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219146

default-providers.inc already includes PREFERRED_PROVIDER values for
xserver and GL libraries. Drop the same values being set in the machine
config.

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


