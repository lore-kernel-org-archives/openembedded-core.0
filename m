Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216FFF513F0
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 14:04:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38977.1772978656616333052
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 07:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JBF1HmEw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628DUo9c482562
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 07:04:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fnjQBPlLS2pgRienvnXCWVvmttkhE8a8A/t7oa9hXgo=; b=
	JBF1HmEwUxBhpWAcqVFiza8r+jbIjQv24SYd1fIsPeqRx7Z85vRLIioijlUMrZNM
	OGfraTy5DykbL0PSghHQmVJpL5HDjQ9/BaC7A4MrAitu8ZlTmUx3LfODU4df9tZC
	PyFrSi2AGHqfu3xC2PdV6oczig5D4wXPUw+0KbiD21YcRxYIR1cwp9kUoE+Uwm68
	jdkIupceRyWdqTUKh2J7GQpq9oHosyIlbpk1eb8XuQ12XzkgahPU6ChBiLyO3QIB
	sqlJJKKE67cX+5v/XD1tgiGfDAi0kOYNrt74KHXs9mns2f6dc+HNXia1rrxIVb/x
	hG4W7+gLLoHh5QERbwdsig==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62gu91-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 07:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ma6KGI3PunTTARoMW1cco/4/q5DKNb9q5OQt6mmxP34Ftg8tMDb5mh7+WbFHyYbqu+zvpya0J8/p8th59W1fqKTIS5USa71p8aLSm/dNS8s17327c+dTsTcdVyHX87zJIEiiwdWkH94nRWMdtoNczwvTlhgF4TFRb9Le944AFAGM+YOR0apUdD3CPJV3uk/zRYa2h2lUEe1W7oyRwvFnYo/C9HQd8TK6nGH6sItxPwFDmtywBl3V0s15k4jE1YEg9blgTf4gnLt4a1+98r+GMrzduVGGSywXyXU5b5iqCEbwGUehRxRuMin/p2LOt0DL1YdcNvLF5hUJrOieuwhF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnjQBPlLS2pgRienvnXCWVvmttkhE8a8A/t7oa9hXgo=;
 b=HB9HgAgvIHFiHX4i3WhnONUuCqkh2JdIWKKwP+RpQ86TYdLWXgBePFXDVvYTq5tgdlidza9dJ36z1dLkes19Qt0qjnqZYMdRjLBTyZBiLfw9Uc5Jzb22at+IIzkLrzeZSPLFl2cJrziM8Mgrz60aARkzk1uH83KxqHY0/TSwURuVhwxrjdjnDJbBa2DugAgXTsqHwkTk08PRTKNbRuNd7M9F5UTAegqBV0aXNauVMbjLyDwi7g1/qo8L+otyR6bfE2odEhhrb38F03030arFkKfYLBkb/ltF6fWfRo6j+KpdEWdwCj2Wx96h3QgyTLjHidF6BKU2IKB72ElhaGs/Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Sun, 8 Mar
 2026 14:04:13 +0000
Received: from SA0PR11MB4574.namprd11.prod.outlook.com
 ([fe80::215f:e93f:c560:8486]) by SA0PR11MB4574.namprd11.prod.outlook.com
 ([fe80::215f:e93f:c560:8486%6]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 14:04:13 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH 2/7] gettext: Upgrade 0.26 -> 1.0
Date: Sun,  8 Mar 2026 07:03:09 -0700
Message-ID: <20260308140337.2503858-2-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308140337.2503858-1-Hemanth.KumarMD@windriver.com>
References: <20260308140337.2503858-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To SA0PR11MB4574.namprd11.prod.outlook.com
 (2603:10b6:806:71::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a34560-1550-47ad-cccc-08de7d1b9386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	bZSwEoZHy52X7fTVutzX+ggM9AFGKbezfWWVApXI+ZdkJ2X3GZJo+u1fvKCPhA0Br8NMktb725i6U+b1dWWqFM2cN8zM5JUTfMwLmw0OBkTjMlZWW9fr3iPYxsJ7SfHkA7QLpA/RbBpTTJ8F/EGX1w7AquWLKC4n+A2IDp8CR6d/niiXksG3XXrDlv4LbRk4K8W067nFPw7NFgTr+cb1MiEWxW5lEIzC672rExXk/PNBcyxYdYkt1ltgL/aAK+ZadSvgt1q5nGUclxDFoVX4MtS5DdFnpf1thZMb3wnxQU0wHWt14qlwToxgQ/FchkYyXNg9VVujnb4TRVf8m1JpDzJSNqs8m5HE6jU9w44BDAFkJIMPhgdNXgUbBePHFQoD+RhhejmfQyq8+4Pa2aoHwBysBG2Zmv/SIh3/THaI9cj0rA0atnYmusYulBrW4GUva8eaU0Oz4IcwqlTt7EZOAWmnuScbP0g2zjUL5QDW1Xw+lcpPkRYFeAqEMbNdupKueBhCHqO1f+MWagbzOUxjNNkH87PQG4wmoLvOk7oam9zz4pEnDz6DfYGV/I8olPSuqN1dvUoJH5NCDAk/h0SaAKSkh818TlDmznW+LOG9FYDsqkwisQ9xqc2ipFC0Kah+9KIMahC1CrGYQ3oE85AjqG1VBVYKg3YkiiIJVajS+oFZCTJOq4wnsqxU7Kmrm50yrBsxre8m9NMb97XNVps9TEzsq38g32wGLJQzlEv4WKJSLH19fKILiQ3DRai9Xhzaa+jaDHXgWBN8MiKdXQkRNiwdyAUzZRCpRcA7y2hRA0Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4574.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3ZQYJnjmQ9CMYNuphz21bIH3+9E8O4oVVLy0LMAfNurr5DlYHAVvH4cb98z8?=
 =?us-ascii?Q?s93qpwLNuCRyu++pntdl4Vs4XmlAfRzezYB4n4cTvEzkdjkIPtItKce0Toct?=
 =?us-ascii?Q?buL9dk0/lL0CBAUWnKpDmFv4sZGqmw6p1wYfXCvJl02etUU/eCoQquYIQet/?=
 =?us-ascii?Q?KaxseaQST7imYbda64oezJWQed3OKeKrNhesd43q1jZ9Y684FO4VU48RpgeA?=
 =?us-ascii?Q?Y1ia/BBO6uza+qkSMbmv/yE5GFgc6KayOPez0/+/lNqTDoxMf251DJDnfgC2?=
 =?us-ascii?Q?faEPkZzRj3atMzNPIwTrs6vkQE2Xr6sY8fePfRcceUoXIrA8z+UzJe1Zroee?=
 =?us-ascii?Q?cKGx/kZUv40zVB7DJe+0BzWtbjj6bMCRm+E6oHqOjUhxTkAeBGORxs+CRJ28?=
 =?us-ascii?Q?LR7WOA4fSC9ZHqh6HC2WcZ792k1EM9e6T7h6B5O0YGDaZQsCdfoHNvfzgV22?=
 =?us-ascii?Q?URVpmd+mFmhkLH5/xt5/RCy00balxFlf6v+tyc4q6tgzjwzesKlHDqW8iFrf?=
 =?us-ascii?Q?Sv/r7pgB9x7IYE4GNPgFAnCQ33dM/vPLkn3OtfxgRpIqOWmovbPN3TlH91pQ?=
 =?us-ascii?Q?rsFdwDVk4MlJ2CFRnZIaSybchdg4pyUcvq3HF/Zon2+jSFd3pJ5GXqkWHYQp?=
 =?us-ascii?Q?FQkmxOcxNgcqYGZ0KyOCmpI4MOhyGIgnEeuK9AvBuOapTScnBCgUGkU5Kiu6?=
 =?us-ascii?Q?S4hEFylFXnFM/HqHcku8D2Gtr8Cnd+Xndo7D41af8kSOO9YZM2jCvi9trguj?=
 =?us-ascii?Q?/ybO+Rm7y4vdNWSafzi+mrsnIR6Pnz8pJbk0U7YJ7xyy4efcslRU5hsdBifZ?=
 =?us-ascii?Q?hFCHUJn7rN8GgQ9Ph9VqSWm978O2DZKc6a3q5c5c8mNYKJL1+JTqYvOxc5wT?=
 =?us-ascii?Q?DMzDgGH0Wfn6YXUvUFNVyKUb1iEsDV+6kIdPk5ih4Bdejsz+oojBczbbzNWZ?=
 =?us-ascii?Q?tlrVB43H6aZAVO2RuxU595BdvuPwdA0cRw49B4vbWN1zukT2aHZikE5urc8o?=
 =?us-ascii?Q?X3eAozSH2aSe8gELJMWfETbgU/+pP3vCRiN/8HzWcbThNaP0vkilg3sN7ffY?=
 =?us-ascii?Q?p5av26utZJmrhJvgm+YFRJPH/uiE4FnQ0FX+lzOVGn+0MhnlxOEMZog1ym+l?=
 =?us-ascii?Q?s5rBu6Pr3U2oy2LQSTIK5kbelsiybFzrRNU/5yRloluk1N16OTIwCJA+SOBQ?=
 =?us-ascii?Q?O+m6DHxSlayCLsTACYu11Wkd6JTBzdCNCFU1QTY/rbDnKPgnh6o9VtIv+bIx?=
 =?us-ascii?Q?gbdrwmF1+6xPQ8OldNrSwZybAX8N431eyJk3XYj+atXx1/6fDx7wNZtVb1fw?=
 =?us-ascii?Q?AnxkrBaV4WZHFoncLkXfVFOu7wRXfSMz6Nbq1XiWxuUmHQtkXP8esk7aECUu?=
 =?us-ascii?Q?4zBddMgdzLxMstNwa7V76O87KAnXDiuePYFQRPDiu7WC22FGS+En0UfuFcAY?=
 =?us-ascii?Q?eWqcHtVHavOdneSFY+W9h6p2KQyUyqCptgDxhSsweLT7WKUb4/DCGY9R/C8c?=
 =?us-ascii?Q?YESpRrgHAuDt1DXY2Veqy/ngkZ/1gVlypGivCbj0g9S+S5mbWDYJxguGTvXV?=
 =?us-ascii?Q?W3dmSKebQNjS8jkbrN1hPng36fZsr5adBFekDw+r8PUVSb83zybUr6NwfvBS?=
 =?us-ascii?Q?p3mxbTqCdEYrBEu+G57Qy7k1o8TjFBka7YSVY6bNGbOSHvtxXEiKs+M73ZE7?=
 =?us-ascii?Q?GmrsmdCuxYRiqGT0B3q3YRl068CF5z5RYwvwINsMfcTnWA/oqYrFSxbh8Msu?=
 =?us-ascii?Q?PfIaFCsiqoJOM/o16YUS2iZ7iKDfWYM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a34560-1550-47ad-cccc-08de7d1b9386
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 14:04:12.8269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amMM5ZRin4BLkb/jGO4W0VKOZANwSJto3VdkgzxfB3KpJWgWArYOiSCI0PV1195tCfFuq0BI2Nv7ML+Fij8f3JYYSP/VRJgWjgnfItO7qFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69ad81e0 cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=SUx4uDOeosYRpSGunnoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEyOSBTYWx0ZWRfX7H6esXZB1rTD
 xby5P9GQ+LAVS6scWVWAHlUgh8JXCDgkIbnrYRNWMZbpqIrB9AlpgJmy3e1ObyrDLqiinZzXu5v
 F4b7tX7+GVeBqZaUJklFQdsAZ2z1ht9f5Zhw5TkB2phSJIaGIVvutAEXHXJqTiCeHz/qpVYVbIF
 aNUbAA3+vSsE61UFGzmuNDkLUL6IYEx5AxnGk7UZgPcCZF/Z82BDobxRsKQnAmlQMWA622mpBzN
 fl/PO2wkVgYrr4Na2WeecwuYwRN0PDcBFFaR0U1tibAUMKtTveJhqlwqBRAC5kRm2LKPeoNjzdX
 OAFhhTwqcNNyDYkNrCvCaLi/hcvIFvQ9peUY2IZ8y4Lrw6DZCpYiHEkkulEC4MIj1By7yjtXkWT
 OBXckhlQla7F5BW7SGWES3MTPAjclS4vLI8Lw9UUNbny2zQ3C/XsrGTaYLu/ycpZoVYAmMu+41T
 yfTLOs0tY0ZHk1z38CA==
X-Proofpoint-ORIG-GUID: d2Js59F3s2WsOudrY1cb1jz3N2cwiSeP
X-Proofpoint-GUID: d2Js59F3s2WsOudrY1cb1jz3N2cwiSeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 14:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232644

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ..._0.26.bb => gettext-minimal-native_1.0.bb} |  3 ++-
 meta/recipes-core/gettext/gettext-sources.inc |  2 +-
 .../gettext/gettext/use-pkgconfig.patch       | 25 +++++++++++--------
 .../{gettext_0.26.bb => gettext_1.0.bb}       |  0
 4 files changed, 18 insertions(+), 12 deletions(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.26.bb => gettext-minimal-native_1.0.bb} (88%)
 rename meta/recipes-core/gettext/{gettext_0.26.bb => gettext_1.0.bb} (100%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
similarity index 88%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
index b5c32d0786..28392a26b5 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
@@ -44,5 +44,6 @@ do_install () {
 	cp ${S}/gettext-runtime/po/Makefile.in.in ${D}${datadir}/gettext/po/
 	cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/po/
 	# The gettext recipe also installs the same Makevars.template at the same place, rename it
-	cp ${S}/gettext-tools/po/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal
+	# cp ${S}/gettext-tools/po/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal
+	cp ${S}/gettext-tools/wizard/po-templates/traditional/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal 
 }
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index 2ddf47334d..02ad72fc9f 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,3 +1,3 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz"
-SRC_URI[sha256sum] = "39acf4b0371e9b110b60005562aace5b3631fed9b1bb9ecccfc7f56e58bb1d7f"
+SRC_URI[sha256sum] = "85d99b79c981a404874c02e0342176cf75c7698e2b51fe41031cf6526d974f1a"
diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
index 2b9fef1e94..031a44d4dd 100644
--- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
@@ -27,7 +27,7 @@ diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.
 index c7160d7..8e46cc7 100644
 --- a/gettext-tools/gnulib-m4/libxml.m4
 +++ b/gettext-tools/gnulib-m4/libxml.m4
-@@ -14,6 +14,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
+@@ -15,6 +15,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
  dnl   forces the use of the included or an external libxml.
  AC_DEFUN([gl_LIBXML],
  [
@@ -35,7 +35,7 @@ index c7160d7..8e46cc7 100644
    AC_REQUIRE([AM_ICONV_LINK])
  
    ifelse([$1], , [
-@@ -31,106 +32,10 @@ AC_DEFUN([gl_LIBXML],
+@@ -33,106 +34,10 @@ AC_DEFUN([gl_LIBXML],
    INCXML=
    ifelse([$1], [yes], , [
      if test "$gl_cv_libxml_use_included" != yes; then
@@ -399,7 +399,7 @@ diff --git a/gettext-tools/gnulib-m4/selinux-selinux-h.m4 b/gettext-tools/gnulib
 index e2613fa..2a733a7 100644
 --- a/gettext-tools/gnulib-m4/selinux-selinux-h.m4
 +++ b/gettext-tools/gnulib-m4/selinux-selinux-h.m4
-@@ -71,6 +71,7 @@ AC_DEFUN([gl_LIBSELINUX],
+@@ -71,6 +71,7 @@
  [
    AC_REQUIRE([AC_CANONICAL_HOST])
    AC_REQUIRE([AC_CANONICAL_BUILD])
@@ -407,24 +407,29 @@ index e2613fa..2a733a7 100644
  
    AC_ARG_WITH([selinux],
      AS_HELP_STRING([[--without-selinux]], [do not use SELinux, even on systems with SELinux]),
-@@ -79,19 +80,8 @@ AC_DEFUN([gl_LIBSELINUX],
+@@ -79,24 +80,8 @@
    LIB_SELINUX=
    if test "$with_selinux" != no; then
      gl_saved_LIBS=$LIBS
--    AC_SEARCH_LIBS([setfilecon], [selinux],
--                   [test "$ac_cv_search_setfilecon" = "none required" ||
--                    LIB_SELINUX=$ac_cv_search_setfilecon])
+-    dnl On Android, in Termux, prefer libandroid-selinux.so, because it
+-    dnl defines many more API functions than /system/lib/libselinux.so.
+-    AC_SEARCH_LIBS([getfilecon_raw], [android-selinux selinux],
+-                   [test "$ac_cv_search_getfilecon_raw" = "none required" ||
+-                    LIB_SELINUX=$ac_cv_search_getfilecon_raw])
 +    PKG_CHECK_MODULES([SELINUX], [libselinux], [LIB_SELINUX=$SELINUX_LIBS])
      LIBS=$gl_saved_LIBS
    fi
    AC_SUBST([LIB_SELINUX])
 -
 -  # Warn if SELinux is found but libselinux is absent;
--  if test "$ac_cv_search_setfilecon" = no; then
--    if test "$host" = "$build" && test -d /selinux; then
+-  if test "$ac_cv_search_getfilecon_raw" = no; then
+-    if test "$host" = "$build" \
+-       && { test -d /sys/fs/selinux || test -d /selinux; }; then
 -      AC_MSG_WARN([This system supports SELinux but libselinux is missing.])
 -      AC_MSG_WARN([AC_PACKAGE_NAME will be compiled without SELinux support.])
 -    fi
--    with_selinux=no
+-    if test "$with_selinux" = maybe; then
+-      with_selinux=no
+-    fi
 -  fi
  ])
diff --git a/meta/recipes-core/gettext/gettext_0.26.bb b/meta/recipes-core/gettext/gettext_1.0.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext_0.26.bb
rename to meta/recipes-core/gettext/gettext_1.0.bb
-- 
2.49.0


