Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478B4C7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 19:15:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.4543.1750446912526752483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 12:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MylZObS5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KD8gXh029581
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3Bj1BoYLtk5
	0jtXLRqgUdL1Ae/sDvquD7Pa/T4Zae98=; b=MylZObS5yMq4Lg2P5GCNNLqqHSy
	5Clr4btR8WbPA8p8c2Bw2mJi+lMxNifNQG+Yeat5wkvgfny7OGS9GY3Cd64iCaS3
	zbHKqmvF3aDU8c+lqts15BJ7i3MsFtDvKbJSQLQT3jPW78tiCe/4DC/1NHuE9MtF
	i4vqjxMcSYOStkWirwc7U6qe4dQI3uUoWLD84TDOj/QEwSRKimW+Bou9MQwHBZ5P
	f9E6uQAF6n/Oa7DIlXfiN++LhGugUeamzvoB6tNgg5ildm0/o390oqGtc2ebxYJh
	31HrJiseySvXItf/0EbCq3CEAiiz/OZYCu2ogoiRjU2w5vomvUw16wYTHdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9m8ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3e90c3a81so184685885a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 12:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446910; x=1751051710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Bj1BoYLtk50jtXLRqgUdL1Ae/sDvquD7Pa/T4Zae98=;
        b=opDl1z7ir246LrtVr7AKi2LdgoYcdfaDAiResCm+LILzyH9WF+1T+66dmLGxHW+b4f
         EPs+8lztbIn7K8ytpwRYOeEYzW7xgdR+oIN9ZCD7GXF6m7HK78OIVuydPgEeUEVPikvX
         lbqhTyQ3WcucquOXC6oUrVhOIzLdnk75+Nb/lQGRmf/q0XssxQQxOrVbqrR6g0+IWJYa
         d0aCDCACHw2Z6nOqX/x+gSReWycwmdyRW3YjC39xlfuNbwwTOEXmKoOd7dVYj0Esgzdn
         dr9450omXsMLPS3yMxJZ+8hPYFMUU4VObc+3u//0R+X4Xbe0OZuCjv18bGLhwxnmdOKc
         hosA==
X-Gm-Message-State: AOJu0YwTlYjSQ97kOxZPIPaJ12ntzoVkKKbjXccTcTVpHX4aeY9jOrV7
	QQ/E0Tvt9xgvoSPJeQnSS2Qw4W+JjXKcAiCACqu1KB3yJymWqgClHKiLazPuz5amjv+J1hZNUkA
	vGQaA+5+JpIBerunUpQSRqWjl4/Lg99DvqwhuBQk0htklc6JX5h6B+15jn+fqNbjv99uN4NVaio
	tbEAQjG29D6oPJJVrlIQ==
X-Gm-Gg: ASbGnct9XdDkxkXqeqygGMR+f3cPIFxlBsVLvjQhe57eD1Ew4zlbjmV4fa8hQljAaKJ
	mHrEJjtUPDchs4053J5oJXApyCx+c3HUATkzlSciqm0x09vPnhQQMhB9ocCCqOYkj4Djo0xDQEI
	Z8Cg0MbFeq56Ifdcn/xNTaSfKHbmuun/qhfWF+ZOlQGZo3DPt+n7nLJnvTda8ewR14/QXpxXaVd
	JQ/41TTOIZeuvmGVIqxqDYf7IICErxldbh5pSKIBVF7RkmiLn04ysqnodQhQ+WWmP491no1Ucxg
	i1RLEiHeUYuFxjcXlrcddwwkbzFEk+RKVLTpPHVdIglTXrBs8XlMebkPhvR2KkCOv1mOBswsGN3
	cimaCzaeT4LiZtQXqjpFk1TOmd1rWlR9ul9s=
X-Received: by 2002:a05:620a:1915:b0:7c5:65ab:5001 with SMTP id af79cd13be357-7d3f993289emr487363785a.39.1750446910359;
        Fri, 20 Jun 2025 12:15:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNZDSviJf1QBKF/f3SYpB4/OnR7+ucm7nbkhj8HvGFAOId7Y1kXDKxL6ra9P120RKdd1E2YA==
X-Received: by 2002:a05:620a:1915:b0:7c5:65ab:5001 with SMTP id af79cd13be357-7d3f993289emr487357685a.39.1750446909659;
        Fri, 20 Jun 2025 12:15:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc124sm381614e87.215.2025.06.20.12.15.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:15:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 7/8] mesa: enable glvnd if it is enabled in DISTRO_FEATURES
Date: Fri, 20 Jun 2025 22:14:56 +0300
Message-Id: <20250620191457.2018861-7-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: W2cdOPkpMfiEFfWuQOMaBdGxd-YUDKpu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzMyBTYWx0ZWRfXylpr3yBudV7q
 w26BAK/Dvo3ejLgmdQjJTtiBqOZjJQQx72Nz69W+DXa/b5sJ0EEpopo3wSmCiTrbxoMri6Gfq0U
 79nUPaLLi1MFM/MpGxT4KVnhvyFb50MQK78uulhyFf3Liul7/ohiDN4n4d/MclxIWL/TtfrJYII
 H5ytQp4Ob/n+mhM0TS+oPxatICrDW7ZRphCLt+wp/OoMmUmhPPRZBtKd0oFqyADefLShK6t1sTL
 MKtBYabaXGDhfZJ0AcJ58cFtiVAP4Kbt34Keylecuny1dL3733Sgu0WDiDIW/u90HNglTPB9MFx
 WTh+6UelvsaFMRvNvvUPqlZ82UC/DXkr1O4SfPRquRhkrHw476As+cKVPGZOdgWZddR04AIfvse
 AJv9S3VcsKcz5XtWjkwMgsYZCnik8HDr9JYCQApOU+Bz/2EVrufPY2v1K7yPPImBMRl8QEAS
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6855b33f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=-I7fbvGdFZ1fcUDrCcYA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: W2cdOPkpMfiEFfWuQOMaBdGxd-YUDKpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219145

Let the distro to be a central authority regarding GLVND feature.
Make mesa.inc enable glvnd PACKAGECONFIG if it is enabled in
DISTRO_FEATURES.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b3b369d0eefb..6b42a238cc42 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -84,7 +84,7 @@ def strip_comma(s):
 PACKAGECONFIG = " \
 	gallium \
 	video-codecs \
-	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
+	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 "
-- 
2.39.5


