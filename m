Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42E9C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:10:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.1082.1750090242962453221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 09:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HYHyttmT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8kfFg002991
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SF/2SxdgCVJ
	hFVdyXueN66J/zGhkwBQ48ktSk4pZ5jo=; b=HYHyttmT5bWdfXpygiF6zAp/wJh
	j6+c31Aq+dILy3Gp0WYaZGKYWeQ0CxjJzbhE4ThHYZWTLs3MsD8vkJ9ahvWu5HDs
	4+Q8nK2l9MtbhFDiqqu/Fb5jPBbfwpAQ2nPNEPo41+E1eipjRowxXSuEuIYg8bXo
	2WZMjE3FJyhuUyO2389wZb0MmddhNslgp6KUggq8vYkt+7gRwF7K57+9zXd6Cxg3
	04br4Cyahp/S7BaXJZtMI4g6XsuBm/3ogrL3N7BPWn9sJp2hXKKaNuCzpbOujAew
	UNyzIU0LSp7OyMSGRPw1Vcb4V+4G1C5eKRhOqvyTWizyyQvuzXdMMAs2bDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag231ajd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d38f565974so994172185a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090240; x=1750695040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SF/2SxdgCVJhFVdyXueN66J/zGhkwBQ48ktSk4pZ5jo=;
        b=q3eE1+x7nG7lpB9JXkbvopfoLwxfVy1pgU90uc020yhe6wJGAcFwOQLbWdYp3jgFIK
         jvm2p2KaowX6HKam9ArtSsp2/Cjh8ZygHVjWDa7cQSMiq4qa7hRKBUBll40myISd7h8E
         sisTiw5CoHx4/83teGIHTaJDpxoOu+mYlXyMuPjsZUR0VdYJgMt+ufbtJ4ddZR2wam4l
         IZ06u3w2xvKMp6zbC8XsGaiTOT9fPqPiCUy8Kt7vH7p3PVWS7wY11zzUggiJSW4PGah0
         VC8BNaPX2z8C3s13n+sWfEGWnS91xNbQAUgCbX/mkMWUm9DBK+7msYV/kV1tyclwy9MP
         pXQw==
X-Gm-Message-State: AOJu0YxUs4L6D+R0SZhafmR6ZGBnHKY6XWLAr9RGSNJuEE1U2el6sAsn
	BIFB+XVZvq4roopZjaYyAsgxbg0BrsEfXawVI9mFdIBeVLlS9fufIp3fUrimWfZFfn2rQzEQcSw
	EOvMvfvmHruQESwbluoJtTx+0w/O1DjIxWh+FpnLJAlS7UngbopLS0hPrqbSO5uDvX8jbpx/ROJ
	570sxw8KiMAOfAo2Uo9A==
X-Gm-Gg: ASbGncvsxKDJtpMu1DZGjJ6HgHw3BwTctnyYoxOekDz/OPJmdllg1VH5e7zOuyeuJGc
	Wlh5Ruwyt02IP/SdJpJzj8prkG+uVpeJWUCXgitWHUdVb59Gyz4c9kOXW/xv8UIfPovzctb6Odn
	hfq+HgcWnxnj3mOcpXkqKlIsf5Qv8WPg7t+zno2lgyn4vpBmNF/wa6Oa5nq+llG5AcgM17sO0/W
	9lJa+odf9XJp0S1MoGgaQB2fmRTMNLorN4uw/tvOmMpd0GgpSmn+H9mL1wmkJa9Re/JHYA9KV7N
	WqHqaDtGr+Pt08Ec5tu6GpzKtb3D0KN1G6QFf3yaFkv0jQgp6hARBOk06EjZKdYmbTvI9AE8cB0
	6vyOEQgKMWUGGgCDNdDMKSP4wjGqAy7gjvY4=
X-Received: by 2002:a05:620a:244d:b0:7ce:eb71:f500 with SMTP id af79cd13be357-7d3c524794emr1657296585a.28.1750090240180;
        Mon, 16 Jun 2025 09:10:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELdzUNEgfTpNeCFzjE7gBqHIcne629CzkHbFp+Zz/UfRG3GOANRX+OdB/UUxjVhys7gtr8kw==
X-Received: by 2002:a05:620a:244d:b0:7ce:eb71:f500 with SMTP id af79cd13be357-7d3c524794emr1657290585a.28.1750090239628;
        Mon, 16 Jun 2025 09:10:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f8151sm1590255e87.243.2025.06.16.09.10.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:10:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/8] default-providers: fix GLVND providers to be selected at runtime
Date: Mon, 16 Jun 2025 19:10:31 +0300
Message-Id: <20250616161037.1518306-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: i-zXnWWRoS1K4ombnuah1xagNT2cVKqf
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=68504201 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=FpLzd-OWU6oQ4w_CiacA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNSBTYWx0ZWRfXzbP1I843rifC
 njnmdvSLUKYH4VHS3qxVl6js5sl5N4tnPKCRqomlDogLrKYw6Ybzc0chHlZfyQwpVqb9qvtw61y
 zNNEecMksFBveXbcbfjIUgP11jE32WOaQe3kqthk4QR2P27K/5YxEzFyVlaIESGMP/QomzwEMIx
 ffB/QMb8aUoboovlO9OrSXvSiroe1MsctgcTkbhxwAgHxHNVUphOZUlQ+iOd1OEQWvanh10TuB8
 yrYK9VAgYOl+zYvTUDXQW/9fsgrXAfuAUSLXCVezBqvGAuMr47eOPSeFQgMCpkRIwGQibqUe14P
 azn0t/r+jNSrFwYR7EsQRS8wVkcSy88FOXCfkWIpxB12bCSdbb+CNfgyb4KHmZKCzFw03zpRa6H
 UWYqAn6ioUJHGGFw3XCgcsVL5AA0ZaFhu8YP+6S8+cCnuvTl6c68BFDx0wC57h1PGY+exw/G
X-Proofpoint-GUID: i-zXnWWRoS1K4ombnuah1xagNT2cVKqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=934 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218836

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


