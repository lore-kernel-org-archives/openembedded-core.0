Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1BCC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 17:13:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.29575.1747934019786334691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 10:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MKTF5V5A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M9jsgt021071
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=elJqMBc9h1G
	bsz8olAfOeI01UNJlANvzu3hWGIEsjc4=; b=MKTF5V5ALGtK1Zk/IMD+xPN542y
	cPP4T7WoxnbkGweoRsngnFiYnv5sljHK9y0ZRGAd2QBGRfEn2pRchuNH0OJGct4t
	K6yYxRybEDnAZ63OFdLFsQuSM7MjXWh4mma62ARDs0hiMN9xFMnLmWzWVeROaHEx
	Qr40iV4RSZiWA7t80fNRpM/ghYaoLwgB+Xp53sjz/wgynLQA5OARfjMFwA9ZxGFV
	CdE9NPMcV7GAEzB4rp7K6YRVRm6y+wCSB+Q5moBIRQTqbb3/DueD1fnzExt9dZyC
	i5fwNnafvTdFv7i8MehIPbwPoU13AeZwzP9zkXOVBn7V7Ereh04ErnebHNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9y4cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c9abdbd3so837099585a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934017; x=1748538817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elJqMBc9h1Gbsz8olAfOeI01UNJlANvzu3hWGIEsjc4=;
        b=qnfKwlZLaZvnihGsdEC4QtOlu2CzjHyagz8e3h/9IJ34lOHhyuwEw2RLhuMAcFT3qg
         3XJXjEUqbxShPBdCi/Thx/jHiW8TIln1ZObzJZiP0VcvvZCt6Ho2GCb7A7sQKkVgUumU
         RcEvzj7Al7kmTuNU1EnlcYwPkHKuX135LL1rOB1y1mBIZWjyZVDZjnDrTDOGEeCw0mcr
         +T0O7isTzKRX5v638nEBCMgB9pZZkcJyXyJm3Z+TS9yqRALlDxBtMthNxWioEmVqfTrn
         eN+bkl0LHwid6oapoOdZocYzkZmPcyrygCFaGFtLLw/NxXxCd9dtk7z98g8fE/wY10iJ
         9y2g==
X-Gm-Message-State: AOJu0Yzky5brtTAJS4Kva2yRIh+f9sIYEwNH/V5HFBrln4am6prZiK47
	p96dNqMAAInKhzhTMzOuKzV4jraH3nu2hVDfHTBfFiS8oqRGnd5Y3Pnl3T785yMHnFZ/bVGlC/V
	ECugVhua6utidfCu4ku0v7CICVg0ifo0pDRCOfBuULQNwpU89FawnJEipGGleMDLVy0sWcn5LMJ
	xOQJmOwkOB3+kyZF0=
X-Gm-Gg: ASbGncvbRbSsrJ5+EMXPzuKstVRuErbvhuJURqWjRXcyY+mF9he/i00ECFqMkqp0nvp
	kMs4CkBBcjd3JtdTz6Jq8EnToHwKUmXytOk5Hlp5qBO8SlpEYvNZWRCXEp5vY9TEX+9ZJ8XT+il
	YRccj+JJEuzIOihvwuDYINStODUJIeOk/j5SDIoQPw4RCAmzrP9BclryU7tedmOoxc33yq6iv1A
	AHrNVj2S9oqTc5ZY/RmKNyQgvUhDMEQ25UY9sh33B/YcIsKcCTTZoLkso2ijJVtW+8niA8TnHwJ
	W1+SMfNlq2vnwy605h0voYwy8FCWD9Vi5+oMVuIyz6Z8abVYy6Y9+oZjzm2FV0dGEeuh5P9htzp
	siy0vm2HO0OvFkjDenjBaXqQy
X-Received: by 2002:a05:620a:400f:b0:7c5:9c12:fc8 with SMTP id af79cd13be357-7cd4677d606mr3500487485a.38.1747934017372;
        Thu, 22 May 2025 10:13:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDBpH0DA171fyZl4XwKK5qczuujewwc1rRJXUOcMptmD8R1cTpeiDAVkckJqTOHw4y/BilQA==
X-Received: by 2002:a05:620a:400f:b0:7c5:9c12:fc8 with SMTP id af79cd13be357-7cd4677d606mr3500484885a.38.1747934017014;
        Thu, 22 May 2025 10:13:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm3501438e87.32.2025.05.22.10.13.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:13:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 02/11] mesa: drop useless -Dshared-glapi flag
Date: Thu, 22 May 2025 20:13:25 +0300
Message-Id: <20250522171334.3040820-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f5b42 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=OQp4uNaVuwmCJKMus2EA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: KJQHviWyuBcu0cW_kp4i6ONOrv5UR9Kn
X-Proofpoint-GUID: KJQHviWyuBcu0cW_kp4i6ONOrv5UR9Kn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE3NCBTYWx0ZWRfXx9LCsBbzD4sl
 ef4NLZpue+AAME6MXlBiPWAG4qAQHNACnufGAbnoc2NgnymjzEE3Xbj/+JFP1RkqKSUT8GnPgnJ
 k1h1CQ6yrXY9Lss2xDsRsshLwfXmUJBrH6sYgGSDzxIrvN67v3aivzmf5X8kzvLZDjQxzuJTKWH
 B2TpYd5AKQkSWoANLBTY4N+Xtj/GqNAxaRAaaJPGI2IlLEg7j+8nA81hLPVb/t5PTK9mk02dNxx
 D6UhHzxSprQ0Ti2iwIbU+m1kiB2WY2tpMrGI+R7wmN6PHMxYZilSkhBE+e1g377HeES7YJeYOXy
 aIMNVDeC3CeKQuhG9DIbhgnhALJcE89allHGXMEoyZJm5ldAzo04Ef/6+3bDoHg/kBCGKbeOXro
 CStOV4aZGKrwwP8ubN6jQV3vnJRPyLKaEqAkmbUFsjaTlWcQU29seRRGGmBsdxXdPURpa6zx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=836 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217134

Mesa 25.1 dropped support for static glapi, making this switch
deprecated (and useless). Drop it from the build options.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 2ff69c3ace2c..7fc306156dad 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -68,7 +68,6 @@ def check_buildtype(d):
 MESON_BUILDTYPE = "${@check_buildtype(d)}"
 
 EXTRA_OEMESON = " \
-    -Dshared-glapi=enabled \
     -Dglx-read-only-text=true \
     -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
 "
-- 
2.39.5


