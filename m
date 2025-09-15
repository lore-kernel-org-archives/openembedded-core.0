Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3231DCAC59C
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.30963.1757937343359499163
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RRg+tne6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F9GKkt005160
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Bik27j+nxijKPQVmSRo6gsI4RvcJXEjwuzd
	hg31qnWk=; b=RRg+tne6qIYm6rVohJ9HE0NnKvABaEvRr9tRHCTleRl/AC+QY5y
	UIAPuCPtJiFF49bPLDstS48CAi5gpddk+U+NJocNcYDdKyZ4c3v8UebUghDUzrZH
	s2rSRohAHKgnAJjrkeA+as6oQkDeljh0tCt98joxalUBekbSmI1vvs1WN6GhNB03
	61giyma2FdfHAymZK1DFt+S+aSy6A2yc4B3/jaTlyzXOjhIssIzXHZ0c+0WKhohm
	HmqdPvQ9rK5GzJhn6Twyehu+1dEpnZ6Z+pGU9JqyqnSPlFIpcjtfgmMS0XywW6Ur
	q1/CxEIs36Y1Nyi9kycU1cZA2r7+ocvtVrQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g12gf8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f6eeb20eso160834971cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 04:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757937341; x=1758542141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bik27j+nxijKPQVmSRo6gsI4RvcJXEjwuzdhg31qnWk=;
        b=wRnpkIHz4xtE7yEvajTun7LtYhrfeOD4EdToMzYGaMMY+hKEjL4/EITOD+otjT6x9e
         569s3y3oZ6y4XES/UKhmQS7PKBDVh92vXSM114sJjwap9gme52pxRxC0oLhYhgRTKDUK
         L7x1YxkZPTBI+cW5ZjyF7EKxH+m4L9LyqQGbOZOrw5uG+vDmwPU8/2kLXut2mpKSRkFZ
         Ajm/4p+g56vI1Km8bZMxkoTcnbEgGqJ+B5d6hj7wUwrv3ijPEU2BceEIHByvGVzrPfrw
         YKbKTTEusWgE6lDux6ywGR1lgwGETDetOilu3sqA4cdvpG9M8zU3OoNM4iDW9D5HrKDj
         DuqQ==
X-Gm-Message-State: AOJu0YymQDdVjmLp/qH+Kgq1pXJXhnqSomHyiwuC9D30S1fjtMN3V0lZ
	hmoM07mOh5fPxliabtVpeZolBSLfU6dSY+XSTX585sB//yal4613BcWe62XC/FgBA8LhdNfOaU5
	XF3rbOdSaH6fghK2GWN3nVzbQHF6K8886wTFaQsJxQwoL9Vrmm4rEJZD2D21NcjqrdEsSc5gW2p
	cL80opz7EURP+CK9Y=
X-Gm-Gg: ASbGnctyrJNdvib/f02umBcE6NybS5VsIZEqIGZaBwKjUN9sY0cUVuyQKLNF3sgb/5s
	2IosikNmV0N1Y9L3CkMxbC8Jk9axr0uspa50LqtvFPcP//pD/fsC0GqfBjCbMvfEWQv/YqQjKn0
	vG4HB+hoEjRKefHzH/rXlxPIMONDW1i9eDSYq6hrLz9qmHN847nA5ot76j0onCze8cQ78ymdLwn
	oJXRAlEduT9S/h2Puum7blsq7WmaiB0YZr1fe80Vz3U9iCBTGu4ihj8+ROes6xWQBSvwFxBYDef
	8X6cROlnjF3C1Qm3wW4U4WuYoIYOzf+tRD2ysymjCZ2a/SN70L204o74ywsUzOk+sdiNDXGEIzW
	1phg2pF967V8W0gZvcK1i7Nrc3r2TA1a0XsoQ2E7tmrnhqkWJfcVp
X-Received: by 2002:a05:622a:1788:b0:4b0:77a3:2b12 with SMTP id d75a77b69052e-4b77cfc1fa3mr118139071cf.28.1757937341206;
        Mon, 15 Sep 2025 04:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7TppSy9WnFeynMmDL4EtCR9CqObyzBPEtGunwP3jZ+lUbSlE0nxDDP+LxHuX8Joktfom/pg==
X-Received: by 2002:a05:622a:1788:b0:4b0:77a3:2b12 with SMTP id d75a77b69052e-4b77cfc1fa3mr118138881cf.28.1757937340761;
        Mon, 15 Sep 2025 04:55:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b491f4esm27893991fa.49.2025.09.15.04.55.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:55:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] mesa: add PROVIDES for Vulkan and OpenCL ICDs
Date: Mon, 15 Sep 2025 14:55:38 +0300
Message-ID: <20250915115539.2685622-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: C5tu8bZW0Un-H7xC5r5d3u-advoeBQKA
X-Proofpoint-GUID: C5tu8bZW0Un-H7xC5r5d3u-advoeBQKA
X-Authority-Analysis: v=2.4 cv=E5PNpbdl c=1 sm=1 tr=0 ts=68c7febe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=dDemT4ZAlSKyr2vjyC8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfXwbrZguZZuVYN
 sYJuEHnqM6FWBWtH1FIwibAaJDHacsZN36PkZIhoxIk8x8Glv4zm0u3uyNe4sgIn3wPh8jtxNm2
 aFAl0aOT5zLUbu+CBMbscaosfcLX9bpHjg8m0FFGW40/l64CxdbRw1SuMqJfkCDmH4ey0hZ68bF
 3QBnjR5IUuZparwUf8IeqcTkwgtDtEEcgt8auYN2W9Ms2attyRMIEXNmVf8er4d+5+3wgKXGu5p
 LvlQdgAoa5QFTCYr5YP2J8TBbJr5xY4TvD+J6N6Fvl8lUgVYoEOtV7OD4EMl+DPW5ssTzMwpKc1
 1uTtuC6108oBOpzTx8KPq8Hbbt9h280yrg5X2rrouyenUMJDTxF88noZ8NQHkRu39TBANjwu82r
 TlCAIa+p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223486

In order to let BSPs easily select OpenCL and Vulkan Installable Client
Drivers, add two virtual package names: virtual-opencl-icd and
virtual-vulkan-icd.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5dee19fae9ea..3f09cfd4df21 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -219,6 +219,10 @@ CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 DEV_PKG_DEPENDENCY = ""
 
+# Provide virtual names to allow selecting preferred rproviders
+RPROVIDES:mesa-vulkan-drivers += "virtual-vulkan-icd"
+RPROVIDES:libopencl-mesa += "virtual-opencl-icd"
+
 # GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
 # Add a dependency so the GLES3 dev package is associated with its implementation.
 RPROVIDES:libgles2-mesa += "libgles3-mesa"
-- 
2.47.3


