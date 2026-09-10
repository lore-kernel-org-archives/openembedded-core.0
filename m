Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52C0C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 22:47:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27330.1789080425196401304
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 15:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LBGrbghR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3713bde6ae=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALShNA339083
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 15:47:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Fitjp4SMT
	uKHR76VJZ8HU2q305IJFOLL8JfbnLeNQVg=; b=LBGrbghRm4K+ZAebODUWXgkZ1
	7JbsxITVKQZwgp0nRxCx8UTha9OHQIxOsLwHfuhr7UN4dZJ6XRQQlQyE0mXeuCyG
	a3ZCAjAh2be9SgqF48YGLXOJmDK6NKmqIb58XG6378ooaWMm5k96fF9o8JB2ITEe
	EyQnIsIYFJJ1yTFJyfBB9pezUcRVEUakHOA/aHuDK9utcvw442MTz42d28s2gRtc
	oihsfSnd8z/HO5aOmCFYJJg3ockgnaz06Q6Gzcrx/i5IwdhNBL5KLcvLrD0B9+hn
	MlkpghYD159kZ2sd4HgiAPBmD27+Zxbdy1SIxvgDfHYbzLN2M5aA705afEHuA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021138.outbound.protection.outlook.com [52.101.52.138])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gkcyq2c1p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 15:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfP934X41uc2NllqNhsejpqRQTcp2rU2dmnOhwnzO9EEklseVHc0S2x3kQGE3xB3WkyYfjfexzxnbSq0twbxZF5xf3l+gMOY0I2M+VAFrBphAH0Pwqwkyozq4Ub4S/JrXe3ePGumpLiMMQWc69S8VEKvIv9EoHCN2f2d7oA7IRAMJJj5J2sLUw81DLeqpzBtU4lFUFzrYbZQy37uSX1PIYXa4u5xd7eZVf7G9CzlxhUei8ZLsF/uSf8dkbgiDyQ4JP7UA6+nBBx0LlMs72Y1Gg6TdvPKDqhYziIoriwI/n7iVO6VRM6c6uTuMCiZPRyEvxYNFpFEeAbmt2GgKqQZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fitjp4SMTuKHR76VJZ8HU2q305IJFOLL8JfbnLeNQVg=;
 b=Aoa0OIJuiG2xVP+DVvOKQJGNwn00XccBHcu8WXzn0H/b+GyCbTHHFZwQSfdAPKFvn7f0HIXPOE81Qt1ZWaI3KKyxYWgdCiioOHNa9E8ImrWK3g2EIRV78He6X9LiCmkBfwPpQ4DbuiehGhD75LBhCT4fYGk1dUXO1xVxpzLqVn4YSqZdU4Lu73ce1Jx055FbdeMGSxKH3iDjm6fWbCBSx7wkfVuC7xPX22k6T0NU3kYI5PL9oYLAdHQcrjUKRkCu6XetqDCEev99ioU8LmhqoJj6EnFptdnW6PG2AjNylMHLWNGudKT5BNjMQmXaFRPMug71N6VDS625G6YFrB/VeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 CY5PR11MB6114.namprd11.prod.outlook.com (2603:10b6:930:2d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Thu, 10 Sep 2026 22:47:01 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%3]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 22:46:58 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [PATCH] maintainers.inc: update ownership for libcap-ng-python
Date: Thu, 10 Sep 2026 17:46:44 -0500
Message-ID: <20260910224644.1623681-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:a03:338::27) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|CY5PR11MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 4679965a-1fb2-4b92-267e-08df0f8d6b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|10067099003|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	gc858JkzylCsTmZ50FecMU245dEcDR+MOCOBW45CRs678sogoHlmcAS+tiZkem8keed4b7Bw+6G58ozyI9qWB7dYEhNc591Ii3NUUg92zJIxnTWLYlvEWNhGYKrvKz1wdrXTLOfG7jCp2Md53bOeKfNELjLHXIqzcDgcePQKOprh1zZwCXveo25mAHGeMbR24cGbYaGw8OSxi4BbXbd7EHBCgblxJjL7LdGiAmZLUHTlwURmAduo5wbdaWCgzMEhyG5lNLNGrrSGMTgjCC5Fe6hasYWJVIOA8A6Sk1pykoNW2TeVWwhFh3zzfNdpwqPpST+BiUGaQGoVWjPp1HKw+XsKY6tHoADyjzAiw3a/zQ2BKl9W3uQFRuUa8VY1PiD2urau37xyRlWpAFW+qYDetXQ0GtOaBD6vZDk6J8mSnBFIY9dqBk1WJuTgIZX/EdDGYmWQ+nmzJT6h34V5gc7bJTRChrqpZNYjqNaLZ5NpCgq6RAX8AXv/6JEeBGmLTC23C+lE0dIF+F4vH4c37b4eU2FI/N6sQ5eXSGn4czXQvXoTRTuNn/E4dv9Z7iD+da4u6k+opPQ5eeOVdT64pj+/vvI3tiBUbYPKTi7hM9QRQp0I0FYMUiDvtn8JxG5FnY6P4Guyn2LMu3LzVHqskXnQMD3FO57JQ5bQkubmr/7LyXiCekh19jjsUvS3Vpt1X06W1Wv+UBb1DxJ4/6rJ5yEV7uz+0F+BrGW0IkG26d3HtFM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZxH5KV1Qa1hvIyhsCB1RP6ODO/3HlCP/p9CMvWsuVfjsZ6um0w+3DcFKVOOG?=
 =?us-ascii?Q?x7yaBPZ0OLILLMUX9b+UtonJMFg8iVUaibRc/pXN3bfUcmZEfTJqnpsIjSaV?=
 =?us-ascii?Q?QYmrSWysMsZZrpiUP2OgAUexK33ubd82GSxTNUyShhW1s5P0JNYCQ5+moj3a?=
 =?us-ascii?Q?A4NETBAP3BXwVf+BvbVZlXt3GiMkDnVJd81vu2CgHfhrjZ+ljKeqc5ECPdz1?=
 =?us-ascii?Q?Bfj0JD5VXCMLZbk6r93tPvzSlwjU41kcYtppVJOEsHKySGKmY68MgHS3YwtH?=
 =?us-ascii?Q?ryC7jJIpmfnKAb6EwR8pisZKW5iiN1MMTDUUyL2hjqKTFaNWTMVxEI+BMyfu?=
 =?us-ascii?Q?S3YCTyrZxOvRM+m9uWW+H71TjlW5S8OlzePQ4chwEwT4prQ6qKKUH3qMC/Ib?=
 =?us-ascii?Q?a7WOL5ozfqT+7/a51eH/OuMZW3p3HXOU5kyLvuW3VcbuEzMXr8TcauPcKxMC?=
 =?us-ascii?Q?ZyZd4XFPg1B8M50JJUr9jVOgqLTBX14G3gNGW6KNjvfM3O1ew4EHaVHu/C7P?=
 =?us-ascii?Q?k04lEcslFapWJmuXcxN/eApM0cbVyooiK9f3/hE9d/4/EeEH8IKLeYc08Go1?=
 =?us-ascii?Q?bazzPlwFzTLZg6lJ76MuG/eBze6dvwlx9WcRT8kGTJ2xJb3pScEgCt++QbWy?=
 =?us-ascii?Q?tswb7UuHhy1m45bANNYCPd5Mwui2NfWu5EKKyB+DsW5IYTkPoNunDci+LONa?=
 =?us-ascii?Q?CBoxQkX1oyLstwdCQ9s8UxJt+uJ7ZAqc3I2v9/z/IWemJ9biKHiTjImFrHKQ?=
 =?us-ascii?Q?w+LrWiUHxSqiv61cxFupdJ0T5nJZVvYsFNRzgDb8ZNdjy7d3l4NlE5NINCP5?=
 =?us-ascii?Q?x0+zq2MWPmNadSa+1MuUpPKqH+pNmdkPGKVUlTalsBFsmsjV3c8qVQazIQ10?=
 =?us-ascii?Q?nQjD0JB809YKcAaG+QYikdjwR71YjywmVUdE1kG7mQ0OWYCSG8uhnH2QROqr?=
 =?us-ascii?Q?+dINFphi+RjBmR/Dd9e6m7Kdf4KZS4Gn6EUzCE5ahpsYrNd4RqA+yizEfpke?=
 =?us-ascii?Q?lJuo/4xmBaj1UXd4KVyIogj2MkkUPvvht0JksyelIiGezf/LnfCUWTJG9kxV?=
 =?us-ascii?Q?55ZzJSWUvVbJcptfQUUCoWv7CF+oMLZDwx0PcIqfqjgziEiqk+JfpMqevDxW?=
 =?us-ascii?Q?K+SBAwKUs9trKXBlq21qq2N5VzSU7F4/AQsrVhI2e8hwOA834pD6DkDpLljk?=
 =?us-ascii?Q?b8eX6VN4mBK98X6TM/jpw06lpyzmga9pjz2vohcdTcJ0Sc5GQNIhkr9B/+3i?=
 =?us-ascii?Q?nyue8NU6aOral4dDwk0VKh3uXVlpqrzFvoibwGO7uYKS+fxdU2HEuotYLjKb?=
 =?us-ascii?Q?23XkA7WpGdK6qODU6qot3nJh7gIQdoq9+Kui1E/4lIIzvjIF21hshy7jluJR?=
 =?us-ascii?Q?QimEw+hzuUbtbrxeTk+so9azvLOUvwc8MdO+fV445bWmEkXVFkWH94BQW73r?=
 =?us-ascii?Q?SRj6tFprRrUZdk4S81VwKsm/LSIDR1AmtPbtVOGpUw8JUEWpfLCBCI5vTqyg?=
 =?us-ascii?Q?lae0xvnbwqdvUPopofLnTqxVPcqxyfbxyaayevl6FjV778MwEBxqqCtBdWT6?=
 =?us-ascii?Q?cqx6/iWjb0FfPQP/t155QkrFu5CyAcRg386MrGKnA3mVHotZmfkzXRIF8q+k?=
 =?us-ascii?Q?NQknRKa3xhkGYqOmSR86C7qy+1po+GKaESApJQ31n/SNxmU7EgLM6W6Z5xee?=
 =?us-ascii?Q?4N3ZHwTuCcCofrcN5x7hg4cw9ZHkWPB6A5zkOjUq7LKIMMxRdNsTirtchKb6?=
 =?us-ascii?Q?ymCv7Z3YEg5m1HBOcGW0R+o9lNUFQUY=3D?=
X-Exchange-RoutingPolicyChecked: 
	SLklOB9avskJL1JsveB1Kx9PqqWUDAXsQRCD25YP4q8h1Li28BJ/zEIPks4aI0nFpJKAksE9+BBctXz1M1rub9isGnjU012RE6eWBTG9ngRA1s33/gaCWx9N4BO1+BknDND2kpwqujw5tUwsNfAMSiq1wKDuFOp9f02QxSeO2yzt2BZ1EBezk4aJI1t0S+URSMseMt6lGzMeHuLOvtBqlqhAQVt24tL8YayMYJkT1FR8lKERHS1zsKxkWEZYFgZA/U9d9nA8c/YXrr+4MLQdu/nhDqinVx+e4Sbf2+KWYJoJK+sBrsxTwuwbUVGGblTSktzdSpo/9OPnrhsicakNZA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4679965a-1fb2-4b92-267e-08df0f8d6b98
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 22:46:58.1768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fU6NBKNqAEwDxyRF3Gwd+tZke9/vygExWqa6KUlPXcR0scApT8eOc/BhXWP+QDSV3V74JLTLoS4e8Wz2zMoQYev5/MeYFLD/sv9FF8hOkxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6114
X-Proofpoint-ORIG-GUID: 5P4Yi6V5FIHQBfBbUf0UCglepaRQUVzQ
X-Proofpoint-GUID: 5P4Yi6V5FIHQBfBbUf0UCglepaRQUVzQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI4NiBTYWx0ZWRfXzVEor2kmWudJ
 X4dD5m1Z/JLKIZVmBNZ1UbYdXwajRfsy3F1oyllD2sveK7iGl7sK6gbh2TVwAMT2UsrMDVXmRnE
 qURE73KWCWw2sXlswnWW48F0AplbQ7tAy4KH119V4BOWgtEBTqGD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI4NiBTYWx0ZWRfXzLiAVId0QTym
 lujitkUXcy56HPZHiFyPFmQghUc14/ep49EgJcAZc55MjZDSzkzW9joHTgoomhelh4iUwz0ZKS/
 cuCcAjG8gud4UK/NC7DvUpiREEc/GdbnUWpkrMllHlBaO0W9gj8/MeA7Od0VlU3V2zo+o2zSDRD
 wgDctzsb7YyOXWB5PpzN0avyuUt2Q6rZ9+eQan9eyWc7i5QlpSsnfawSjS2B1e8TXlt0/NTe74f
 U4Eg+i3qMrM9xhyljlqbenQyxRz+9vWsUY1B+2QZ4NWCFAQCHvTiCczhmodFw7zd7MWCR0ekd8o
 LsyIrue9LthC1H5wOtZTQMFT0CLU96zV7E+He+fdVvm3KbzfTAWH+s2fYlefugkkOPHSsUghmId
 QNz/U5ba1A3JFnNxXtVAP/dNqBvfFIGe1EzkEOnCvDXSOzJ7vlQdhDfq+g0yiea/F888QAtUFmL
 X0alHrPv8aiCsmPm+MQ==
X-Authority-Analysis: v=2.4 cv=UaDE26SN c=1 sm=1 tr=0 ts=6aa33368 cx=c_pps
 a=BXVARlpsiHJk1WAJxp9ToA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=iGHA9ds3AAAA:8 a=aJFo8fyrRDmjJCgxrrgA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100286
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 22:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245605

I offer to maintain libcap-ng-python

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 40d62042bd..95fa36e613 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -324,7 +324,7 @@ RECIPE_MAINTAINER:pn-libbsd = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libc-test = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcap = "Karthik <karthik.gopal@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng = "Kris Gavvala <kris.gavvala@windriver.com>"
-RECIPE_MAINTAINER:pn-libcap-ng-python = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-libcap-ng-python = "Kris Gavvala <kris.gavvala@windriver.com>"
 RECIPE_MAINTAINER:pn-libcgroup = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcomps = "Unassigned <unassigned@yoctoproject.org>"
-- 
2.43.0


