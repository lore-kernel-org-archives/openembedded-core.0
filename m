Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D55C7115A
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:10:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.1084.1750090249928196749
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 09:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Bu/CBKF3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8X9GU007155
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KSF7lGwo+O1
	aB3ZWX18e2dA7zWGL0FBGdbMRtMXlTi8=; b=Bu/CBKF379FOSv11yHFRihntHgI
	cTlSTtnNJcJHDEeRpPtnI/KLKaRRbu+zhxuU7avcftFiKbBVr6pmrI19yjAx2ELJ
	9rMtOxhKqXzBrdo8FeeR9/fUedbIg8Lr8Ccg2kupGuX0Wlcd6Al8IDXGNWdzXEAS
	EH2YK4yfUbweWMqP36J5JCUEGEyYepR+/h3bvOAHPJVPQwoEwXwRo3B05MMwqd6i
	AQIYooIQpopSTquoCADVN4ycs6wQq5UufSfA/FafnkHVy9Oatr8Sj18QBdzkqfvu
	nqRHKXTt7P03uU5iGErC/IX6HZX02vH/stjMx9iSKa9y1SfR3OhCPH9jK2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfd7xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c791987cf6so1039487985a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090248; x=1750695048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSF7lGwo+O1aB3ZWX18e2dA7zWGL0FBGdbMRtMXlTi8=;
        b=o7cA0n6NEVWZomu/mPITxk0FgHaHfxgl6JQEwNFSso0UTfwDEoMjhqFp8UfJTVfQCT
         UsdZFKX4itS4M4MXNqUtCyWsYWNCv7CLUcZPE5uYnhhl2Oa0WZHDBI56d9Y67mhOWeSJ
         WKqq4KMpUFreeVQMFNamLXty78twXhAfIh9N6cU41yoX6VLYqdYVpbLIm4kDyeKkGgx2
         CkdgjV/N+t2fewV5XaabbgOIxeZXpzqTmzU8r4pSbQCeX+YJBAlO/dihS9ZFkoOi8gyA
         EYdTupqVIt8wVZHDLehN+sD9sxm5B6ViOwlOR4ZphcQb2IN7wE8KL5CSna+4DWHUOCFO
         FWIg==
X-Gm-Message-State: AOJu0Yzwm51xpba/tHUk1p8dqPJ15WZGoldul5gBzJRu42B8FtsmJdPD
	mt/7I0fEVice5X7NiI2hCYnPZe3gTF+uSUVAJ5kwYmETfnxpoXhCNUaigwY5dS1oZEPrlidFpS7
	JP+EeMjIdVqNgaPIQNgfsSaUO74deOWxe3RIzUp1FvIJwqQL9DuVSd17LSBa+4Fqk1BjnDx7yA5
	ggAB7T6an3JGTngou3qA==
X-Gm-Gg: ASbGnctVTl3Ie2LKxYeuzfuKQoA+7GJBCleUjJ80FW7NiVoYMDpJ5TIOnmdSg5pt83k
	AjnHjlrtM+hzkAlPsKDgcITWRfd2GJ/5ujSvaaFAi7KcD3ZTUYLhoUmCbpi+YLTBc7VsAmHXMYJ
	b7nLxXSqgso+RHK55YvqMH6/B0qWebrn9IUFkIYwJTqiZVlnLuLafo22z+9rweaap7PPTCmmYwj
	cAC1BMt7gRN5RzG7BJs/z8SJKMd8YeTzPkBxbBECR8urVVNUOMYeIiRmrykclf96/TMFQ7/gBOe
	jcehiFIgE9tJE382ktPRhEYyU2Q92ZsLEkGCjOhJ1nIdDDg7tt4IF4ba7B9s2QXuj8Sn74g0mOM
	Fo8m9EPUYbR5nsXWuVRnpRJbNp+V0gBpYdDw=
X-Received: by 2002:a05:620a:3953:b0:7d0:294a:523b with SMTP id af79cd13be357-7d3c6c0b30fmr1515730385a.3.1750090247923;
        Mon, 16 Jun 2025 09:10:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxL0hL7VMVFZqig+mUODav4lPhY90mB4bzsSb7ArZpWXJTwEusW7wBwsQNWZoErJKDwyc+vw==
X-Received: by 2002:a05:620a:3953:b0:7d0:294a:523b with SMTP id af79cd13be357-7d3c6c0b30fmr1515726585a.3.1750090247337;
        Mon, 16 Jun 2025 09:10:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f8151sm1590255e87.243.2025.06.16.09.10.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:10:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 8/8] qemu.inc: handle GLVND-related providers
Date: Mon, 16 Jun 2025 19:10:37 +0300
Message-Id: <20250616161037.1518306-8-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNSBTYWx0ZWRfX8LKlo16nWjxH
 ck3vRidYtnAc+jnKzuLlw5Po4YRC9spR3QEcyaFU8Pv7raVPJBPRaqD7/B/XtttMr9uOTQQrFTW
 X0OYUSXb83vOrXc7jmKqG5ycZrOZZULKuIfmiLZT0j5ZGsQPwjtf1cXFp1G/PeFeanP92eskfHD
 wj2nSK08IwNqIW79Nxf3oSFjLIvn65mxEpYq2TQoDMzlmdj/kKFcU034DFGaKCF7br2cOBHsYxZ
 lJBcIVLRc20MdAUotu7wfCbdqzGFSGQJ1v3BAi9WPqpCWpv7RjysHCt5aV6KOzD1WePa2V9TZl8
 2a5DhA73iAtNRs/bA7bMYNbMlw7dyxQgimxAi4i/swIR39Hf56DdREI4+wGT83xJKk/6H4tbjqx
 0y5GUaUTqp6Gg045fKXz8xvjSe5dcFVcy1jU88a8FC/jRM188LubRsmorCV0Q9/XVK6+UX+M
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68504209 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=W9iCNbZZEcnRtfTvM1gA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8T4Tff3EJhXiZIoajYL7ALxW-6eNyz9c
X-Proofpoint-ORIG-GUID: 8T4Tff3EJhXiZIoajYL7ALxW-6eNyz9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218842

If GLVND is enabled, then libglvnd is providing all OpenGL / ES
libraries. Tune qemu.inc to select a correct package in
this case.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/machine/include/qemu.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index d7392d476238..4fa18812dbc3 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,9 +1,9 @@
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/egl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
+PREFERRED_PROVIDER_virtual/egl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
+PREFERRED_PROVIDER_virtual/libgles3 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
 
 XSERVER ?= "xserver-xorg \
             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
-- 
2.39.5


