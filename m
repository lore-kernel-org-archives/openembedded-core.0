Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F538CD6E5D
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 03:20:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12309.1780456842598055271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 20:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ULIYDVOS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0614d64c3e=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6530KSit2962206
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jun 2026 20:20:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=CqMaWXyHtZz1dHYxkTFs
	0nhhj8pPjDEi7RFu1XqX/J8=; b=ULIYDVOS+iUav2pP50Vp8Vcs0Tz74krYeZhQ
	RMOsWAQHPhn8Wb7cQfbrxZpxEX3TDszQxaj4h0PfJyW1CcPKfxBj/2Y4gDA52K1V
	CDxG/10f4Xn2QZFwk0JiZM7kCYwvj8F4/LeSgr4b9Zt2RGjijaD231ucYVbLyrNm
	uYztFnAHLsuzD9rJahSL2lM3DpB1HAPCzNbxL9iKmwFJOwctmgo2ctjm8AYk5fHh
	P8+2ldyKtpw31t/NxroghkIC09KAG/0pZm9iuZY752NzB3wtInNLtwsem/9WHsQp
	YZJGDfkRInb/w4x3iiEyr9zvRpzZKbO7IZPOeguIVA5cQ6EnMw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efydedmw8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 20:20:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdQszl2hQkrWoT6jL/WbuREKnyIY68RrcoGZIbxyLe424FCGetVA38WTiZD2uklWWgGD9+imoYWBQabS04QDoO9bCHxacIdHWkXkBh2SSPrINvVf49XTY2b4uPqW38fsnRa7rHN7Ug6dBYozBghjfek9B2SgD6GtfogVwVb8sG3r9TEDDSIblJKoZEQ0dcqy9jMR7XDB+kkJq0uiEIzrFizSgmp9+/jixgRkhXKrj4X7mts+7c4JDGwJLcT9zF+g6/xUb9st5Kt1UcTSdWeQaOg6ca5GYkDtXXZCfuFPv7IaE6N4kvE9kQau9V1kAgs4ZEO6ZlqxQ8gNgHxNxpaBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqMaWXyHtZz1dHYxkTFs0nhhj8pPjDEi7RFu1XqX/J8=;
 b=hoTAix8XY3+mvskivm+3+cc85ZlLPwasW60mSyGbwNo5neQ5F7XI9jfK5SaMz/khxnF/PkOB7fHjtFu0e6sGaJA0USKB8OCS1sBXLMdqk4blEP712ek6d4m0cMLkAOIv5YbSryTGST+0EzeSuggwPvRgb2ZOMsCJkGcuPv6ewXpEVAZUc+UzLS1CHPwsMeneaTqkVWh4eWhRvpLzPZUxoM5x0YKxLrSJzs91NEMkf+ELrITmR58ZrSQ/lsKSscfp+F+zpHDZ0HApUvPez6NA9WYQidilh66kMWYAFe9M7TfMf/VN7TCFie7BS0erc+ftMC6EI/vthbVk/b3OpfkuhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH3PR11MB8589.namprd11.prod.outlook.com (2603:10b6:610:1ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 03:20:39 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 03:20:39 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] libxi: upgrade 1.8.2 -> 1.8.3
Date: Wed,  3 Jun 2026 11:20:24 +0800
Message-Id: <20260603032024.165431-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1P15301CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH3PR11MB8589:EE_
X-MS-Office365-Filtering-Correlation-Id: f22f4059-d0a9-412d-9723-08dec11f1626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	GfzPcGylkaVPBcD5xYG3tcXHkkf53VyCcZYUOlanrliAKkiLmga/qajY1bSxj1NXCrq4U1pQEeAjAaXxFXoBd8ey6+porQeddv687J2yGfLZWYaamsLB/dRCfkVcbzETNGQEbT6lvhlwHHzCem0BeJpNt7MjZShruSHtcjdkKrmSm15E8LzErNfFEridpQqotVwPY+5zIoxca9euU/sJmMsCMTVXPp2lBgyt7IbtO2/+daZPW5GNf60ctnrRpO6DCPtiI3HbmxV7q4SRnRSrrFVuH/rppXjRiOm3iUhmVbRpaQ1R4Z4jLSlWQkRqThI5m4fWp9GWvbnRBlO5o4oo9tIE/H9m1NhCaM2H6VKqf1AoMTNujhTLF7ragxrO1r1m1cKyChbc35yT62LkhaUxN5Z0WUGvYmh0EYyT24XOudOBb95T9fdUcGf3JhiR0mogoc9OwMwzQva/f+kGyIAIONMo7ct0goXl24XLeb3DPsmzKc4dq48b4MP332jAdstgdAYpb14YRtbvp/bcB/Rrz5zmcuR+kY0P+wTqcczLHPFqsatUx6ujS80C/FGGSnA0N4h7/Gn2c+q3HBO/Pa5ZxkYsQioundhZ0DpzBerDRXUDODHerjnVv9XXUuDH3DH9RC0jZD+5G7QS5ZM35KfhzG/mF2TEAAwAQ1OgrjfTb9LVegD4fNBNwBcMRCQJy2mK0xBFnxzOZmBAH8ABfgdJ6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F9ni/np4/zs/Bs0bd9l+zYa0phAPYCUF50E95vnSPwWwEjPrSe6xvMI0B0xc?=
 =?us-ascii?Q?+oX/8xQIH9XGQnA3cQdQvKFmNHzf7mxorRr4X7B3Ka2Wgq2QMh1TXgxE+abD?=
 =?us-ascii?Q?YpBXIxgiSK8uKa97AxpzFl34hAl/Dy5IiVSEivHHpllz0ABhHUDVs/l4P1Ep?=
 =?us-ascii?Q?W0+MYAd0i4riCFdQKyWCbUxG6iVUVe02yhfoNAoHusirmlflvvGKz/vaw6ul?=
 =?us-ascii?Q?gNVJSzgOJneqcisITX3nCp/21yX3RRZKwMajFitiIax/DvFAzkSgnZ8CNb4f?=
 =?us-ascii?Q?iF3zcxjWsmzY6TaCMUWEdMWkNdclEqPtGB+18itcsY/MU1aQlVBR7rdE7q+Y?=
 =?us-ascii?Q?k2DGDWYbtde0lVMzHLo4s2zjNVNBWH5X51hznYN3yYU0HgzTBZ0N1kX8bO/V?=
 =?us-ascii?Q?egVFowRvssrOz53uEPqg22UvqdxCk3CDCUtwCV0LeXKzmRIvq/9uxRj45ilm?=
 =?us-ascii?Q?398GOu1ZonbRlXOG1MOz8jMfJbVATt6Itpykf9fzw+XqjMGdq2rAxbw5oY4b?=
 =?us-ascii?Q?w6YlFu1QWtqF7nDjCIU/Qx+rmpB/LGUUhR2vQ6WrrWNhSpBr7UmPx1AQ1Sk4?=
 =?us-ascii?Q?CwO4B+ASA0v8cLhs2eMcq7BnyFXob4BrM3Y7UoNS0rlkbDyGN4oG3F4a4MFc?=
 =?us-ascii?Q?DJzym92AzM7X7J5J55+2ryhQZFQaJsjNRenx3vjK1xlMPWSOMlOn10IhzNlm?=
 =?us-ascii?Q?dnngxX4a6u4hGYwGcjcMZ17P7HnnYlI5Vo6OhCxogwvBRn3Iw6nbQ81N28WF?=
 =?us-ascii?Q?TFv3kZWiOpn8iuL45z4fo61vl/0+dbVsGBTxQAEngIpFnrtcKtzOCwFE5DN4?=
 =?us-ascii?Q?lQHF+b6vzxyezz1KvfZzJwXTEVAV5uPqGMBzUK2skftOABbGe1aSYKSpQbV0?=
 =?us-ascii?Q?RLDisHeHiDp7rkKa2vajP+QFzuEIliUx1rHayMV7WMo+2apnGxumq6FIljBq?=
 =?us-ascii?Q?OA3a5miSRf4BzaPOq8+XMJu/nSZwy1gbUcqc5oB3JWiLg9rheN0Fis2mgXet?=
 =?us-ascii?Q?j3axWp2v5HGINzpjYFhuylrCdHXK04LiAdHJGylhxE++RjNbWsnlBJH9e9I7?=
 =?us-ascii?Q?9nPXC2P59J2R37tRxOJRLdm5kbWvN6/kZdNs/dRn1dGZ/uOrZfs7yYvW+Fav?=
 =?us-ascii?Q?f/q+kZ2caBIXAboEE96C1ZH3eofkI/ixBdEiYoeLWZL5vmcIFCt8cedSVjVj?=
 =?us-ascii?Q?SEZ7zjsuTo4FtIdWPP4ozQ06CRA9QIkXlgRBFxogR2uyBoptQJim5lYsbIw4?=
 =?us-ascii?Q?jzbzik5bhvJNeleNaLc8p+qFWC/9G2gAOPpuoOd2W59ybV969mQ1twQCKK2o?=
 =?us-ascii?Q?jWdALpwh3tGERMvib8SzlXkLZalTiMED8RZ3Wt5qhK6GhFJiJRN1qPm36b0I?=
 =?us-ascii?Q?6AgI92Ha45CVftYmQAJnTjm/pRz1fOnDS37po8a1TOQ9daEy36DS5oDuJlvE?=
 =?us-ascii?Q?XG05L68z7iyB4Ghv+8jJ8R7Wa+LL9DvYtmkWxCaer1wYbPWfXib2q/mL5qn6?=
 =?us-ascii?Q?wVmMDE5Bdy5Dk1tWsuuId2R2XrNj635rv8YiDMxDr7cp21y7MeRCs7USKPpl?=
 =?us-ascii?Q?4bqSGzJG2vwpjBvlK6FCdr2n9WLH+xWL3r967lYjhlJD3YtkZvb67Ed0gM3j?=
 =?us-ascii?Q?cBo/cl+eT5momNZBrXoOyUqzuUHURzpiNTFe62N9dzdGYFlxIwcd8uoXuqMZ?=
 =?us-ascii?Q?KsAe+JS7jWCsqk+oDq90za6gBIQHPfZjJgPCZETtGJmjrYlk9uzrYfD8Skpn?=
 =?us-ascii?Q?nSjPikKgImNFeTmqFVz6M4U8kwiXtYM=3D?=
X-Exchange-RoutingPolicyChecked: 
	V855PODT9crfiokYLjHBBz7tOnth09L0WRW+cJDhxxK4Pl+uuF0FJPBdtKdWO+9jaQhMu5UYgSzr4NghNVxEu+BCr5KZ8Hv2HQMDNTAxx83YOI1Bf5eVVtQcC6GZdY7fEuYT04iZ/9YTxpUWW9NqXAO0PsvgQyQ7W7Vjf6mETXo3hJ2j8V0M95tWcHaeznHmE+6+U7l2KNEc3ShbtjEGNKDYMOLmBKspdiXM4L/epM3trL4iYMogpst4/DgwUZVLHsI9KFXElxfqw7UkUMnPRZHoxg4rfLY7A7b6s9VvU7AZHn03RMjYqkM6iu+IvsrmMQPMGshtG0ztO2NybNbXTg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22f4059-d0a9-412d-9723-08dec11f1626
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 03:20:39.6423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35FCfObw/W3eMrrD0a5dSyTdxaR0nik4j0+BYX04/AGXSDXaq684y4FxIV/q/iWijqIn+bQOxf1ysqDIK4uOS2RGdHZLHWS0sier7nOxJ8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8589
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAyOSBTYWx0ZWRfXzR6J7HdtChvR
 fFJaAvUNoh/wHxIL25NPI5xyOFsgl1/BTTfVs5H7AFO7QBlKWZXI934PNzPoXcG/EI/b8tjG64c
 6GmGcAu0nsw8HB4ohe6KG2UpArqupkniMCTlqmdzKhAVGDZrqFWfMTVP7CIcypJcp1xOlwQqhVX
 +lBwpEgs8opfnEZ6iAvGxy4AYj8S7F4kbxmJxOP9Pi4u0pl+dF4lR4B0RIvW56e0Oa5/XhPI2Q2
 dLSSStLzs1qWd159LEndsP5AiJi0thsxrpBQwc7wsP6WseTNAoEiQfMazayeuoY6O+1frbSzY5n
 L7OuucQsAa9wWcH3mODAbj4d7eSa9zVuIPt/ZWHnYEVhBWkaCZnCGCa96RYe3YjeAq1As1oVjH3
 BQAmMvKGif8Mqgr6Sa8OmpkXn6Bw2K5MXXlB7TbMu5EVjlCVnFS5IjilvjXkPQBKnn9AD5nU+I8
 YNyuRIaTWGXHrcMLLpA==
X-Proofpoint-GUID: BcGtJdQS22xZMyPP_jNOl0GTar-F_epN
X-Authority-Analysis: v=2.4 cv=Iq0utr/g c=1 sm=1 tr=0 ts=6a1f9d89 cx=c_pps
 a=ixsBY7txtd2I+GiPRIsFOw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=e5mUnYsNAAAA:8
 a=t7CeM3EgAAAA:8 a=qfmRXU2aEKk_7j70DG4A:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BcGtJdQS22xZMyPP_jNOl0GTar-F_epN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 03:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238078

Refer:
https://gitlab.freedesktop.org/xorg/lib/libxi/-/tags

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../xorg-lib/{libxi_1.8.2.bb => libxi_1.8.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.8.2.bb => libxi_1.8.3.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
index 2a86f5fcf0..d7e778610e 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
@@ -18,6 +18,6 @@ PE = "1"
 XORG_PN = "libXi"
 XORG_EXT = "tar.xz"
 
-SRC_URI[sha256sum] = "d0e0555e53d6e2114eabfa44226ba162d2708501a25e18d99cfb35c094c6c104"
+SRC_URI[sha256sum] = "7ad60056f01af4f786cfe93b3a7707447711626fc8da2637bec71a90409babe5"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


