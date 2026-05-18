Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804C2CD5BA0
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6063.1779102230060055004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BRwPKE0N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7oGMo851806
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=xwHh/Dz0SqsAsRdxkk7lSqpMx9ZGEyNO5Z7SPcAOKf0=; b=
	BRwPKE0Nc3udF/lS4V+1PM0u5sByZV7O+5fnXGrh1Qb9N138tSKV8vnyF5S9rwdU
	Gm0fsjEJSK/mkwJrb7LD2vVgYS/6W8kpz3nNUjE6LiIEXUQeK1XWEIjhESckkXuc
	aQ3jihOvOEJQW/xWyWnIh4v++HbUz4btrrMwQD1r3114/xn3QPfmdPYTO2b7HhwE
	Zxxsls/jPQSgRQysVjkkW0pxO1e5Ac9isrC5WZ+VLw9FRZubXF4MXq5EFQrbZzCZ
	czDhuJAx+HRp3aZXJH6j0YceJJMJtIZicjaXcPu1Ojpy9R6RgtI6vthQBF6krzCA
	LQWqO9m9by2fnW5ttYgZXw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3g9pgk-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWvzqch6rjRp+/x7UbT0xg6N0CJqHTFc78/Dc0Khzu1slmq7A41HB4YVN7QbAl0lTHFTjzwWJuF7gmQEam7l53WywEOvS5Wsw83Uw5sp6soIClMv+2w3fGoe7x+S+GCHxituVYzPii9WOygBbQPifuFUdAcItjvilw8xugfFhiyuzFERIsKorTf9pCHTs44IxMp/AxZOH2BZpDdXf2OFU+rEuSVsKbM61OfA4Ixa6DlQUnUEPVN4vB3rbdGY5cQBkh2JW8Ccga29Po0CFg28Es6iGhqoLQXEURFXuBYkkAYsCxSqfh6gLiyuTEs9LluwkSaYqBx5BkIImWIxVxA7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwHh/Dz0SqsAsRdxkk7lSqpMx9ZGEyNO5Z7SPcAOKf0=;
 b=n44+vraXFWajGulevoVvAQJs/ZW5GwfEcI4fCASkoKLjOGFRAvDOI25oZb9ayxmM1xeEt/SuTsalhL4QidWHybbd9DTqb1VjrLgGc8y9L3otDwU1ku2MZ+ESnp3CB96UanJLqdIVMDnoXc7hQBH4VIdik8I2hwgTb4y8vFjE9ydUfu1UU1ihiHQ0rxEE6Ivdz4R2uYE9660j9PzRrQOnkBx+JPTOorBDlagjgXjYEhjtEzNB/AOKgmQ+zhi+PZ/brLyNZttb/ebYk14M7/Cu1LLXMD2fiIS3gy6Va0EUZh/UggMnwMmmjVqfhu/IG9gRrKNidQtb3OetT0Xeb5cXKw==
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
Subject: [PATCH v2 02/12] rxvt-unicode: backport a fix for building with gcc-16
Date: Mon, 18 May 2026 04:03:17 -0700
Message-ID: <20260518110327.2347543-3-Hemanth.KumarMD@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 880e1489-0803-4e23-7e60-08deb4cd21bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|13003099007|11063799003|18002099003|56012099003|22082099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	Ax3YT629JCLHjtUZYq6ETBIMX8hbjrYyoFCCp12LvhovDNLbIfNqxlw9vHg8s80oqUTa1wSfPg27jsFhadrHpiLT6iCHaq3p+uudS9eJiqABx7Wp1axcX1kkzPwHahm1VJyOuu0IiMl2HEdTA7qwVkbcuq4A05GTgqUMMHxkSlJTpwN/i99lVVg/V3TLxDYRl7U8GL8wrbmlJR9Gtnvn8lKKFJ0131BWpMzgvD2Los1QWlIwDjN6/UGsHJP1/ekTvYprB5I2D+Ej2yTKeEZwHtQw7d/AJ0Hg+875LceRDLGI0vV8y3swqb0SUZ2WUu7kirb98jCgtfHL0DFEkSi/42G+c2AhiMPo4DZWBBj0wOGoDRX0+iUfud/YP7QqGJXWFfgGONN/iYwxsbrnYjezns8ntzIjDURRqN/PTv85WtipwL40nhg48R/YlCOMwYcMhPhSFNO4QCQE4OKjq9tDv+Fo/iXzWUQY86/Il228hiYVcFX0d4oqp9Rxw3/PCFah5mYasqB5igG+Rt4f37SSV/CClEZwR5g7qSSkSPjD09dWQzmpCCXwpIGkpC/qPiwi/S8FyiNaPG0KNsIV75A0W2sJJOG746NwUMcDJn3szTStLwuvuCbonO1qWTBcWEgPAR0iOJYozho6zzY7mt+n0VIX4cAeb/NicKe3FsF1q8I6yvrfr32IcAgS60Mak1IDVXc37ov7lUwyRXXLGZ2qag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(13003099007)(11063799003)(18002099003)(56012099003)(22082099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U7hPoAEjsxUb4fWEqREngGY5gKc1ik5aKng4Idy+TkkHdEDze36hL+jHpSd/?=
 =?us-ascii?Q?HRz3w7Z6AQ6wZ7vQUWav1C7Txqkxg+vFfpiiShe8Cy3fiHUiH441KFiN6G9b?=
 =?us-ascii?Q?bzOjVzeAoefklck8/7kmhmEUw6FiC2p2kzYD6gGvfThXlBnOJC7kHG6FXUrG?=
 =?us-ascii?Q?DlYg4rJPeORW+XaV/h5H63ozz8ySoCx3uvaJyD8HHYoHcwoe1XvqckyMitLT?=
 =?us-ascii?Q?lmZ+mxv/oRxTJMEMzrzNhj77X/z2pEZHNvc0Xn9OZS3jNVdxUXHBOlImmTq3?=
 =?us-ascii?Q?aVZQ2iZp0D74spSwv1LChEOU3GdxciAcwv/x6R6Dr/fVj/Zz9EkF2NLB0+zC?=
 =?us-ascii?Q?21vbsDyUPtpL7Ne/LGuw2ra8/XLNgfh1eDC2wD9lvl5d+JNXmYJeIELuYVK8?=
 =?us-ascii?Q?TE1L9KT6QsQzvLgCCAr3oZiQtqBUzVW6lKvHftV/oqhnS42QD1J0hpRBjZxL?=
 =?us-ascii?Q?PLK3gg3ihG0rSM0iH47123g6lYsPXSjRZ1dctv/JNnQT78jSAckJiOyw136L?=
 =?us-ascii?Q?Wr04QH8fSijuoeQjP6O69WlEfh9F7bVuEldcpRdNEgJjptRW8eYK/IcIqv9K?=
 =?us-ascii?Q?DYZRsTY9r6fqn7gf0+rTkZ9OSLHwNJIzf+GZ+kwkdHIK8utwW6KcS5dLsg7a?=
 =?us-ascii?Q?OXZLuDoiq5z71hv+8kn5A0MDkdj8t6vzrVjsb5kt9MUUb9/coSYHY64FO7ni?=
 =?us-ascii?Q?fcuVr9zPeMsW4yYiCJjpzT4CMhQTc5TS/rUA119xsDoBBT7+yqaTcmw5juhQ?=
 =?us-ascii?Q?+ZmGONZBCODFKLdDH2//BhcMBvKntpQKfqa5KKNybjoR49merCi9LqCvnkRU?=
 =?us-ascii?Q?HMzAj47FL+JJks8LSzxQrhkD7nPOWpoGvgKOzQEqSTi2TdinGQTzRlRpsTh9?=
 =?us-ascii?Q?AjYucIVtlCCLObe/yuAyR8cj9tfkMeYEkQh9EgnQaa62JzpmJxdmGfz/EbbE?=
 =?us-ascii?Q?0PtRjOLh71KZye88IEQxPX4MJwNHATlzx3KKttppe3nXlEBFc0FGuoLP+SCK?=
 =?us-ascii?Q?5jrflliiBX8bRhv6S248gJRXsLaVmrKZ83XrsvVbA6xjW3W7jr0F1+1ffJWC?=
 =?us-ascii?Q?MF2a+e3cakz2DtuI3lOU2Ljz49NCKZAOfAtlnvmF7k3YsUjgIYhI1KjbDI6u?=
 =?us-ascii?Q?iVs/Dv3od24uH0NKD/U8vW0fmbrQ90RRPnE6lU3ZZPlCv0WZEtYN4dxQbHY2?=
 =?us-ascii?Q?rfJfj5CTZ0Lc4ZTUZSx7pGTa4j68kWeBHSN0GqoU8w6zc5EJLv9A0husPXiz?=
 =?us-ascii?Q?XNkSgDFpFZMzksIuDMSIgx8g4y8XiMmAh/58qk/OrmNU6hxfWtzNHxpaB+3m?=
 =?us-ascii?Q?P/UKcRJfr4hOHByFoYEk4/U+1/hXHKbKXcYrMNEanzEWypaz+3G5AuwgSzjT?=
 =?us-ascii?Q?AiWlEItQiHPVZJAncT5vrA41h+XGBmTUgx3TLcXg4uogPQWTvr3G3/F5+a3f?=
 =?us-ascii?Q?DfaDwbcIiQLJ5MKx2Zf9+lXLgjb2cPCo18YFk8gr7GSuwXao4/4LD2tvYwMz?=
 =?us-ascii?Q?UmikEuT0ACWTrG8A1P+Hh+JJcLp8YH5aGGcMppf3koAPX1H9j8v7V0LZzZuh?=
 =?us-ascii?Q?06dCmLbVkrrWuE0AhHZF0p0InWrBbeZ7eADrkjnRLcHXee1dxW8h+vQ0OyP8?=
 =?us-ascii?Q?QjPJpEYX1zlB9J2yu5kOjZBIWlvZHNPkWI/9ZtVmrgXYR2L+ayco/UYXt4DU?=
 =?us-ascii?Q?liDI3VlAHbRZrtdaQpZtxu8Md8OPGj04gCxuERHXKa53PaB81fFuFVjn/Bx7?=
 =?us-ascii?Q?nwBJ/dtlQgLqzFRRZcaYKN9DNjflGy0=3D?=
X-Exchange-RoutingPolicyChecked: 
	VJ3a+ixCzzc1aRVI4MqOYB4yHRbz/KjDOmYj6dl+cGg9tohrFPNBOjdGVRrCIZqde+pJMsYLSPs+CxXgCW16DKyeFgnuESUzvX9w5CxKmSco5XtHhHdGd6nEOxnLNu4/R8KJd4P8D8oxtCGT1xoSy0dCNzeHqjp3yAA8bmVk5gtDRSzA6MtZ7QIQ+wM/DfV1SvWvMaY2dsKvkE5jVqhRk/UsM2xMtCUHVJcJr7Knxry6D+xIV+tTRhQ39k5CuEh53gV/pppLAukwfPrEtbpXqbukc9WMHnMOABpO03KrbM7nkOPP2W94Q6jBl18DsoccHm/A6HKLiZOBcZCkhsLacQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880e1489-0803-4e23-7e60-08deb4cd21bf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:46.2121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+33g7/NuQQ+6cQD+B1g5RilOzAUhu1QUhbl/6oJ84jZUeAfNC3gR7QMb/xzyxYZo5uI+nNMsYj7NItSMqPPRCrekK34zOFR/YcfiRYhiT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: J1C3mA4dq_2BXVYYsui8W_BdoUIZXA1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfXw0KKxwLGi66k
 Z1hfuBC9qIt71LF/NtimsXh0MAMDT2azSZbehixLg1wxYZsD1KMJ+oToIfB14jHkMgOscaFuOqf
 JCVSRvFJbePA2w/y/zeNvLB7vmf1/FXxS/Vqa8vsDl1pFrQ+aMkFAf2NCCFJNIpzWyyebd8gG2s
 KwLJ+2Dh3COZLIPy6vYBC3sAEB/MzxS0+9N/Zbxh083yz6pcvPKIFeV0103IGvJ9cTEhwZqlq0S
 7RLkYk1PlSONtQJl+/PsvWXKNtj89o6k7Mjmow1TrhAnG3PsyVAzTHa1n1um690pjohf4tQAKye
 8SvMjnZ5N/vE20Vhzl7Ocaiyw308P4j+zVEeuP9c/lHFS4702bvsG0aWpGmdEwVq1qSmRae7SKs
 uD9/VkMiiVnyq0atpHgTel8ZgDrBSRCZa46AfKk357OUnir0+KuDM84/5nsDLooaKkr/CDJqNXz
 xI78y3ugqsjGk+DwTKQ==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0af215 cx=c_pps
 a=WWBLjRe7FI6dQUFhva+Khw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=561Vo0wAAAAA:8
 a=t7CeM3EgAAAA:8 a=7mOBRU54AAAA:8 a=j0KEWJ7GEyusYeRizL4A:9
 a=pGV5B61SGPbAHu_EfFT_:22 a=FdTzh2GWekK77mhwV6Dw:22 a=wa9RWnbW_A1YIeRBVszw:22
X-Proofpoint-ORIG-GUID: MD6F77icj748ccXETKDSR52W-KEI7p5P
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237223

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

rename lerp to avoid conflict with the non-identical function std::lerp

Upstream-Status: Submitted [https://lists.schmorp.de/pipermail/rxvt-unicode/2026q2/002707.html]

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 .../rxvt-unicode/rxvt-unicode.inc             |  3 +-
 .../0001-rxvt-unicode-fix-gcc16-c-20.patch    | 61 +++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index f8c0d8ab83..80791ca511 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -11,7 +11,8 @@ DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty ncurses-nativ
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
 	   file://rxvt.desktop \
-	   file://rxvt.png"
+	   file://rxvt.png \
+           file://0001-rxvt-unicode-fix-gcc16-c-20.patch"
 
 inherit autotools features_check pkgconfig update-alternatives
 
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch
new file mode 100644
index 0000000000..facb574a2b
--- /dev/null
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch
@@ -0,0 +1,61 @@
+From 4ff364c3df99b02e658ac2b3d2eec7139c494612 Mon Sep 17 00:00:00 2001
+From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+Date: Tue, 28 Apr 2026 03:22:40 -0700
+Subject: [PATCH] rxvt-unicode: fix gcc16/c++20
+
+rename lerp to avoid conflict with the non-identical function std::lerp
+
+Upstream-Status: Submitted [https://lists.schmorp.de/pipermail/rxvt-unicode/2026q2/002707.html]
+
+Signed-off-by: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+Signed-off-by: Sam James <sam@gentoo.org>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ src/rxvttoolkit.C | 10 +++++-----
+ src/rxvtutil.h    |  2 +-
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/rxvttoolkit.C b/src/rxvttoolkit.C
+index d92c5b9..343a901 100644
+--- a/src/rxvttoolkit.C
++++ b/src/rxvttoolkit.C
+@@ -834,7 +834,7 @@ rxvt_color::set (rxvt_screen *screen, const char *name)
+   // parse the nonstandard "[alphapercent]" prefix
+   if (1 <= sscanf (name, "[%hd]%n", &c.a, &skip))
+     {
+-      c.a = lerp<int, int, int> (0, rgba::MAX_CC, c.a);
++      c.a = rxlerp<int, int, int> (0, rgba::MAX_CC, c.a);
+       name += skip;
+     }
+ 
+@@ -981,10 +981,10 @@ rxvt_color::fade (rxvt_screen *screen, int percent, rxvt_color &result, const rg
+   result.set (
+     screen,
+     rgba (
+-      lerp (c.r, to.r, percent),
+-      lerp (c.g, to.g, percent),
+-      lerp (c.b, to.b, percent),
+-      lerp (c.a, to.a, percent)
++      rxlerp (c.r, to.r, percent),
++      rxlerp (c.g, to.g, percent),
++      rxlerp (c.b, to.b, percent),
++      rxlerp (c.a, to.a, percent)
+     )
+   );
+ }
+diff --git a/src/rxvtutil.h b/src/rxvtutil.h
+index d08b1bb..ec69cc1 100644
+--- a/src/rxvtutil.h
++++ b/src/rxvtutil.h
+@@ -21,7 +21,7 @@ template<typename T, typename U, typename V> static inline void clamp_it (T &v,
+ // linear interpolation
+ template<typename T, typename U, typename P>
+ static inline T
+-lerp (T a, U b, P p)
++rxlerp (T a, U b, P p)
+ {
+   return (long(a) * long(100 - p) + long(b) * long(p) + 50) / 100;
+ }
+-- 
+2.49.0
+
-- 
2.49.0


