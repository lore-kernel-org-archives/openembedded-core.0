Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED98CD4F5F
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6062.1779102230038858836
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oBoiscvF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7oQuR851963
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Ry7d7sFPetiIAeT/fbBz+52BhBojJRyXL91p/N+RlHY=; b=
	oBoiscvFpKMFBiStqC6dM7Y/cYjPMv0h+CxFkcRot+j1s8fOj8Bqj6qQ0MmYIuQT
	UOQVIQxFfkLAGI+ZLhONb+FkbyPdLUhJN1O3wxPTQ3qlNsH4Rz3SjYtP3ndj7UvS
	fwXm3hFrR+FLwD0762HWc5JqEDzJ+BcBIfSLR6btEeVqKRO8BpMAp5eaCcgxYE33
	mYBt79OyB7Ykye8ISJ8dQVY231zNDqr7F7slYwQcgQcy2kszb1wUM5WWQMbkp/EU
	9VDY6/yNwPvcfGbTKoaddy+0NZD+gZ4o/BvVRxPQM49AcqfSqyjiDDqfA687+OgH
	3TgMTAAa2xFwQYKV0mpf5Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3g9pgk-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFPb5+amz6l6HzKz/fQVii7r2sjBfLCFb6yBmVbJb0Br9UM/ztkr9lEZdEFFxWdhpgFHWGityCEyMDMul1IMwLTU8+JvMUbcBY0BBFIqSOH/k6M/SDUjMqFccu26PSQz4jQ9TzCALVrHiQ+kXD+Xlbszw1GFW9rMenjsuS9ohnWzBR3rsiD+k9VGIvqcQXuh+j4xETLBlt/nMQ39HIX9UYBZuxvD6IsE+SRIAabLaKnv+bOxtF262ZWHTiMw1wR9A1SiUjYTHZnb1cCYqSkCwHnKLj7fdG32PmrXVkfCtYZ3Ig8h6H7rmw7cCq78PGP2cEwKoLmxlqo6NekZaMKH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ry7d7sFPetiIAeT/fbBz+52BhBojJRyXL91p/N+RlHY=;
 b=gMXtogBxDBEjyO6BrlJCJA08/Vw6mu2J9tITbsFN+zVRIb/8kBVLfSgjzn4mBPfkGm4j1RKOIV/LIYWt9/EhcmUJmUbOkJ/bYEIt5HtguMiN5BR9ShlSSVxHo8g6jhhh0mzB16GNrb4MmgZYV2SEak/jFi51YF1r0W2UKFUZvRwTMZxpT1ppGIN6INk3c8/VTksrga5rtC4RoaBUysLaTDNgAovD7OF8pk9ul2ualpCo4/AfmrJXa/ytdLIrzHfHNaPUbccVlaM3wH4Cznthe4gSHykJNPNtn1LwZ7sce9IabV+MpxS3q4u0FYN/2qa/5EfRZpILwoCGhBmRATKeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 11:03:46 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 11:03:46 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v2 03/12] glibc: disable automatic libatomic linking
Date: Mon, 18 May 2026 04:03:18 -0700
Message-ID: <20260518110327.2347543-4-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
References: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:74::35) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH7PR11MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ccd1b65-08d7-4902-e184-08deb4cd2214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|11063799003|18002099003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	HxVcJFcRgJeo2udAjR1mwaVa/an/2F21EefwvS2uRjUcauO4MaUyull5xdknL8/DKkGPj/Oyx+4QNEzJrctuxdjgCCI5L0n3R2DtGKpcWJzwMq/A5GYAlRE0yihlfFH+JGiU1Mz/TPuNdSLYUAnNkgPlfDz8Ih3gidR/PgtwxHXkbI5tyiKQDEtROaJM7+yd3Aha7lpETiLpCmoj2yf2bGKhXY2zSnaobQKhg6zCQnXAEobmW8BlKLIlEBzLWu5PS8wjdiPFVyc8cOvaG7jECgoRfKlCmWxWS9xw7zjX9S5eJ0sjt593kNlpYHGl1UIDELOTRSrTF0wzAQR7IccKYbsASMrw60X/hCWc+/0bug7xcGzM0ADxMrrMwqGAvgmgWLg2UcxNrE/2LGirL+pV8PTp/LEoNpwmJ9jPd2gJyhHlJvI2jYl3D+8REp4hEd5TiFXHDO+nRYPWf0IDmV61XmpRtZpyQ9d0sz+LGcT4TUOq6elFg07iymCOd9XUbWKkR5vBHSR4AHcesvtrKNWMW8Szc/QLcubAowvbA/7iG5AN9KvxbdQ4iOnHQib/nKcH+Kct7mDgflk7THvSTyQ4fIJtHWbPANXuKnRhqk8eZgc0bSImqV6jExbQlbKaeOWw1VkJma6JDBw9IpbZb4cLZKZeARf1UPIif3qPNneB4gruyLZChvRNC22eeSmfDXfiI6XHbaum+PUAv3Nw4itHKKguENwitEqG19jbSWzhkysNnrtbbUpnQDpXmWliXniW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(11063799003)(18002099003)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZXL1ObyvQrbHcMxUqxVVFZRqn7Ta0RifCJLgtBgP9wO1qoTVbnq8nZTVwVY9?=
 =?us-ascii?Q?nE69HMBI0VaeqCZehl7xjqjoBXoHtm5uYhsbQrST2GfzZcdooCguHUVpp0OE?=
 =?us-ascii?Q?D4zBmcBo/uoLqH3yRF1M0U6RQPOCJH/NW7c9UrzZ9V22jI9IjS2aGa9Aah+L?=
 =?us-ascii?Q?jnkbjj9Bzb6Ibu9RjGCtJeO5d9iw5p5KdKFGllGfMjhYT+mF7++1euyg3e+u?=
 =?us-ascii?Q?waJg/KGpbiAdnb5OaI6DIS3iNLDMKeuJLqu9CoAN+TaSI/85kvJyiaKevM0I?=
 =?us-ascii?Q?O2pPqqE3+xQboJyFXcHWQQMiW0G/jhrHRzczLICkbN/aGhnmndffNepGANox?=
 =?us-ascii?Q?kwvCSUdJMVXLEoIKyetFHWr2yA/rwDzVLNH5M/QTz11EJCaXWNzsX/Y7S0S9?=
 =?us-ascii?Q?c9J8nVZtyMD88kNOjvE49Ns9aiu8oyNWaTqubP1z1eRgSEPyrYxHbe4HDqVh?=
 =?us-ascii?Q?6H/MAzn0xrc7LH4bgoTIa061COvGSopNteikx8ax9DBb/ewiPKoTYtBxezUI?=
 =?us-ascii?Q?/Ni/5VOfI9LVpOKChQzsnuk+zbAP0Pifd26nx96MV0MFpPYrPiUD0Wgw07cv?=
 =?us-ascii?Q?ey0WZpU3x0M4RInvAVWXZKMxTIEJGZ6RzpmzBV4rVJVpIYEC7DIC0JHoUwCT?=
 =?us-ascii?Q?rTy2M+qoJ6hQIQC4RFge0dqQ2F5GgRiSoja5NHg82mFtL+okjtCLwgG1Rz6G?=
 =?us-ascii?Q?K2m6HDFa39UcBUqkr39m+6zgf9z0kgIgRtFznsV9pt10BU/KkhKjZrHtvCPk?=
 =?us-ascii?Q?/HHluhy3uPAWuTLsPwk0GCrFZJbbofcgE4fIFKh42hSBo7soyhgV023EgyDj?=
 =?us-ascii?Q?OqgVLT5BpXlTwcmLEfcrhqTuJDHWurIfO4SZ9wnruYC5BeXz0qXNHRanJM4m?=
 =?us-ascii?Q?b/hK3WNtQ5hOUDaCiX/UFUhtq+kji7QPz/V2wRvnWqvmJgMN9Rtq75Jo2V+W?=
 =?us-ascii?Q?xo6WGye9R8CGsrJUBwZDhzhl8YklUdpr8qJMtii22v2R/LZjx8y7FkN7h+Xd?=
 =?us-ascii?Q?f5KGKUeC7op+l1HjdoR0KoLAI8dPgCiEfwIQZw8Ten7KrRxiHjOqA0jxefVJ?=
 =?us-ascii?Q?VQEjNBDzq/ACVQo/Ac75sfFEKwpETgIy+X9YOE3YQEMMrTtYMZzFrK02ycUI?=
 =?us-ascii?Q?oJ3Ge1R8i3iIELtKCwj+APvcuuawfE9UNf4OmzIjJzk09rq/SOeu+hGbtuBo?=
 =?us-ascii?Q?o6S/H5JRo/bbmWYaTvWNx6YJQ6rbwxvCKejCxJ/h2F3ZCRWWx2dR6drHq4RV?=
 =?us-ascii?Q?o6aM2Jf8BjZoLGiGNxjVQiGiBRMj2gMOVnjARoga8yoT4gGgBpNxG5/bIMam?=
 =?us-ascii?Q?GjfJiGy1fMMosQ7x4yu0+WNQwJZgJo7Iq1S4JTXPQAJdplncSn544b5vHmu4?=
 =?us-ascii?Q?RD8+rhS1CmoqaOOFvOiD7nlXVCdTHYdKJ0JRjgIlioSPO84ntSVYVjTo0ABo?=
 =?us-ascii?Q?QCTKAw0fWxEpGGTCMLeqCoVpvcTGbZx5eDid0O8GtmHvk6Y8KNGsRFvfeVQ+?=
 =?us-ascii?Q?qzTPnB2/QCy+HOKjEuYnutbV64clQl8+0XgbKi4L0ykQrx8eKmUAxnHq7RGO?=
 =?us-ascii?Q?p8i1xQ3xyNXZgKwJ1n98VcrBKX0Clxua/hZ5seyzR5Xh65JmNER5QlmV6i76?=
 =?us-ascii?Q?HOifwHKVVbaU6a2BlyR0rFvSfmTl7Oh+Cli4aWeYoEr9q7uubyWnsZ9Qb65T?=
 =?us-ascii?Q?EZIoTh71v/4TudAdl03WW/99U/CmFO1hkBSUgPQK/08PGi81H2z75KR4VhyD?=
 =?us-ascii?Q?B/U5AdP5cA5KIv2uGOYn9iZPxJpgu1c=3D?=
X-Exchange-RoutingPolicyChecked: 
	UvseTy+7iJcQZp0OCo410el7IIk6FW3lucdsgrDYtUp04aj0WxXf8m6SYkngZKptu3j37bXGYLLw/1YdhMNzbjgbBhLlcuJVvYSmgb2tY8tkk02luqRPOKl6hcdTP68qLmB6bQ6esGI3p4FLGmpfyocXqr53iBxhYdkxQxC1QJpP9WgD/FfuJUVjALKfKwKR12X3eD40L0jjw6DtAToxH9rO0AeITeFkhuTDn9xdLkE47hIdTd+0eencISjQK/GAisoYkO2WXzXJshZD6bM90aqmTXl58CN66DKcOsjxekZGQd2awve+6P0R9nHzNJpnUIjfLh8hdoSAT8buQ2b5Gg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ccd1b65-08d7-4902-e184-08deb4cd2214
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:46.7776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWTjTlcGaHOFX/mfQ7gtSvrkKRp6CAfNBW6YfjD5K18o+7YS5SLL565kPxDkcCitgaD0bfx1XypaLIDsIGkKhXVYlwAJbusyy7/FEtJS++o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: DLumhOWrDemBNdo_61u3oL1Bb7HDG6o7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfXwrv+/z4MQr6G
 hSeVlh+DL+Vg4I9lYto79CgAVYBz4g8KSfsex+TXH0PX5md1b2JIoPaFEH+7xTdRv5RoGR9vhlH
 PqZIc6r8mDxKrnhwiR3DqSiM4Xjv2rkicx8o86M4Fjkn6UVecga5rSksx6Xuod2b1d63c1x+UH7
 3g/+IObuJHuiPyTiCWEuk2v21LxeMH7jXkbll5udePNEZBFEae9MSd7Scit5kMUYmbzZy1YuBrh
 Ca8x65cVzfshq701R3OxV1df6xy5JdRCONJxP8h+rEV9H4Z9Rx0/X+duAZgIPgFwsIuQ7lajGZd
 Ex7wxZQdxK6Csa/h01IPWK2sXU+9axPbVWO/fNOAgO5kOO1CP+PraPI3cYPrYLunlN5shRV7mcY
 dmKV3zd0iu1C3cEMjZsMEiA9rh/JFdr5v4dUW4G2DedfbJUX0q4ODyyzydi0fAiriV/DLFhufU8
 GOhJnFNXqf/gi3zLgIQ==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0af215 cx=c_pps
 a=WWBLjRe7FI6dQUFhva+Khw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=_ZnwpK3xq_8UVYgt9nAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wCY5fa1U0MTqifIquHN3bV8uiJQPMhlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237222

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 introduced -flink-libatomic which automatically injects
-latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC.
When glibc is built with a GCC 16 cross-compiler, the compiler
would attempt to link against libatomic which does not exist yet
at this stage.(libatomic is built later as part of gcc-runtime)

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index dae087d53f..751cc0c572 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -46,6 +46,9 @@ EXTRA_OEMAKE += "SHELL=/bin/bash"
 # bash but it can be configured by setting KSHELL Makefile variable
 EXTRA_OEMAKE += "KSHELL=/bin/sh"
 
+TARGET_CC_ARCH += "-fno-link-libatomic"
+SDK_CC_ARCH += "-fno-link-libatomic"
+
 do_configure:prepend() {
 	sed -e "s#/bin/bash#/bin/sh#" -i ${S}/elf/ldd.bash.in
 }
-- 
2.49.0


