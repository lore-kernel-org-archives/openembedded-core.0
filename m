Return-Path: <OmkarAbaji.Patil@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C9CCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 12:42:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153497.1781613753982264348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 05:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K0AgSpTc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06277dc429=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GArdRF2752994
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=si14pJHr4nD6lk+QotBw
	2N1w6x0uZ57CvJIMpssrhiY=; b=K0AgSpTc+tXnXqyi+ri3vxqkzx6/klTuoqvg
	+ZLcMvMmqpiOfnse68CsGp5pNb2q9WojycGi3kX0VQ27z5ZGfkeBfjDYrxaCnOem
	8zZ6uI0lm63QQ80qmc6MTfPRbRS153cldsBMnginwLfW7rafKaVegvVmuvcsQyY7
	3m6aSZS6MSOPSqkYUPmJIWVkxvXCicr9/CGpWby21cNO3bPygXZr3IgIUt+6asQ1
	e42o28fZXfJ7B+xoQB6R3omZpZYbTjuftZz4twwtRlN4vGdzczEiqnQLpa5HCsm7
	W/TvxShVAUqy0hINsAXdG44rLRp7/6RgsPBcYAflAZBWSyx7HA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4erx63vquu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:42:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQqX4zydEOWfCu0RR5Q32zjprCFhIBypwclUGnygdpiXyAi/ZN+2rzkKhWfrHSpVo82sUwYo+vJKOVjB7FKhkvdG74qAioi0NnMRqFWSeWY7D+7Z7fcb+kH6fdA6dAqrwl2abkIFPNtU5sO6nDQiD+I81AfaaZKQT0rE9MomKyTpQeCu2mJrqLDPxmYMk80EVBxwroVulC9rSw7L7WaihvuNsN/MY4kUs2ndCV8N65wVVUraj/Bour1/TrO+N5uefna9lwsbWAFTnqNvU+q259/QuExUSyYJkRBuQW7GZl9lcbtVc33BbA4vyryhobc4QlqdL8IpHWf92b4djK55cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=si14pJHr4nD6lk+QotBw2N1w6x0uZ57CvJIMpssrhiY=;
 b=dl9okaM9gJ1FHEctUAoV1xx3+ZUynzhmtlPTe/cUgfkQEt24qnxuTwKUEBTf5hpw/6YOaso2INGHuFhY5RJgQ8PsYufHIRUxgJ3kvwNlNEAOiYR3y8pINQbrOLiFSW3U0+uUuVyDhv9E+NuPmhAv4l+z+bzClfey+EYUncs/jjVdKKyYBJzUHorYJhJiAotO+9zLT+r+vu//iSjA6qlTRHAPt5aUcbYQfj/WnIpdplAsB38rUmlFYaAzOykuRfmz+aH1i8bLmM/KjTOfNQmMeYWZgjVa3rXuUSlJmPny9iGx/ZvLzBRFslZsiRNWLktf5XslfiSRMfc4/Fz0zoq78Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) by SA3PR11MB9461.namprd11.prod.outlook.com
 (2603:10b6:806:47f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 12:42:30 +0000
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::af7a:fb70:1f7e:534f]) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::af7a:fb70:1f7e:534f%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 12:42:29 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libinput: fix CVE-2026-50292
Date: Tue, 16 Jun 2026 18:11:49 +0530
Message-Id: <20260616124149.124197-1-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::19) To PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF3ECB6A513:EE_|SA3PR11MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 875ba978-d050-442f-4339-08decba4ba6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|3023799007|18002099003|56012099006|11063799006|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	5v6mMMHlT6O7V0VeN+7B00ArpXej/Py84DHDslSVv2dHiT7JBYt+OcRrR+zjHo5PsFQxhFqaCZQai4wLxis+LD+5LjU2yaz6kjnVMClIcVSVsSNEbmTauqulQfLePMZluits5L/IFj+Yyq21n5k86mC0nnuAgGKPAJ4DHgofB/dZB4k0pzqLZB7KUoTzrkwf9h7Y02lE3rvyIK/LY7GmNRd9Ox7x30W/6NEGz75uvhmECWRmMIRuEu8QsL/FF2lbmGBUBx5ddGTbFKwKKGKFllruoB1KKa13l4FEvXSpD3PiqU9uFyMoDBIpjOcRYMVN+D16JhweivuDd0kzfmZiF1MuZh7C5Bgxf1kEx07pALn4yVevfEzfQiRN8fL989kHvLw3Fsi6RE2iF+GhdcpURGsZoqFA3CvBJRW4z0jq1GqotLvnB4zH91LFrmKLz/ZtLa8lENdPSlTEm/tGw8jSj/uuz39Ax1dojzzpukwiBcedvKyjhYdl3BQqYyJ/J/E10shza+AB4JH1EjM5urwNVsOZBQp9WbVFaHRuyBFR3B+lHkPp/QwVsJ6p8GSZF51mvRWEQpkTKUZtAEyxH4Kb9KmzwreNM/kLUqrKiDlomqBaEnz1RA+jy52vJ7BwyjCcQNNA8GUZ37igdMmB5ivhIfe0sVbDjEuH3cOx0hMcwxQX9+rhhahCB0a3SSzoR/V0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF3ECB6A513.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(3023799007)(18002099003)(56012099006)(11063799006)(6133799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BeRmO5qCMO4JieN6xewb2jpOFunISFb+zI4Y+8bZR4Fw94LRQAL9yAfzj+VG?=
 =?us-ascii?Q?xC6kQ1R9MRYWnPZDSLhtHEg/i5Ivw5I0eiPW2YPo/ZF3XKlCh9i79zNiLghm?=
 =?us-ascii?Q?Fix7WIBltxCjfmQgJtUtKhVY2HBS5ofXiGCHvlwgnPjpHB5PwHgAvSfSZnrp?=
 =?us-ascii?Q?CdEvEhrJ7f+caWljJQ7RBv6fMa3IVchsaUiD60TZ4x2MYoG+G2AssFsgNbey?=
 =?us-ascii?Q?vfHswJbEzdvEe746X9Pp2kUbgMMlQ6P7Ub37nSvxv0Z6P9sOtsiHgB118m1r?=
 =?us-ascii?Q?ZgEz3EsStPgKO39M0ebirmdq3tGg025l8MVuIX1l4bjeRkhR+sEJha1CGw4P?=
 =?us-ascii?Q?rDcXXYFF1b6RAVv1lr89VCK5RqW1lJ0XpTNcwSc2yEUQJjbWjOWNQr7KiaaY?=
 =?us-ascii?Q?GNgxZwyY5HTIm5DMeogEOMk6bThBBt8phqEvHwLN7apF0v+JzfbDEk+Wgl8F?=
 =?us-ascii?Q?HG54VDUemb8E6VsTt7MNnmGY3LwgptM9HMZKbqlacCKtSN+TVDEH8cA6+orA?=
 =?us-ascii?Q?xINILQatn3ysTRN5Yr4pLDVPxxcvMLetb5wGhZjdPkqTgrcIPsP+CO2OM5WF?=
 =?us-ascii?Q?5uKy422HtR5uevWmQy2cMp5p9nvrOJ58KBJQIR55HzveGDJEjbz8RpSBAa0S?=
 =?us-ascii?Q?Yrgd4JcfZ8X/HSUt+ra7ym/LKlNiySuRlIdLWxec+s6uBplEs53SCWBp0opU?=
 =?us-ascii?Q?U1UwwYvEkAjDKF2irl+tletkZsRbkwLEbPP2jazD7fVeBdm/EhRXp6ABvWH9?=
 =?us-ascii?Q?C1sKXs1HRKPJAZaII0huTZksRY6qpSUTOnZqkZ3UdJLcCqajxTyKgIHNSnWR?=
 =?us-ascii?Q?e+dffCKEpv2ixFDLjjXAYuE43Fdi4DoVKVaf0Yi5jvDLlfjZARLCSPjkSFv7?=
 =?us-ascii?Q?0t8WzPwAFl86/XeSyp/78Q/Ib4R1j6vSiWpBbasdYT76dexR/Ku9bd4ak0qO?=
 =?us-ascii?Q?vq7nIy9cBVb7ldtUcGp3WOsB23GeTgpOvb+na7uVIneLK2AIRAPnjRySeIyz?=
 =?us-ascii?Q?VvoqwO0x7QRS0vt1KYJ8XGC6DdBWQyCI7MSGteMT6UJ7mXp/Q5PrQ/0sXUJZ?=
 =?us-ascii?Q?7xZBywBr69Olrl49gmJPmWgCjiOO4o/7A63JIvs0Jc9G+DEXSnBTaKV5CXpq?=
 =?us-ascii?Q?LPnmgln2MrrKRXDz/sib6VysvIcBOX+ZK7dIwp6rGP67aq8WXJ4bONdYmUCf?=
 =?us-ascii?Q?GzC3SJDVcwDCSkrVhwQjOXadbkTidkWKGaE+dEqFJRG4wkeEzMq5kNhmNcAA?=
 =?us-ascii?Q?Ve61lOMSS5po4Gu2vbor8d9FDuCMfz0mxKXWIE7/zOYT9ehSa5X2iZTMYGh9?=
 =?us-ascii?Q?2vjkITpD/Ij3PicX7A61mASF5/VsmAf46Xo963xpmNW+iFhS1UxCxQ5qEiJJ?=
 =?us-ascii?Q?Z8dbuy3zARs5Uhz+gc968xT9wmTuwdDV9rHfiNHdNbABIl7hD70F0x6AiyyV?=
 =?us-ascii?Q?rLWs6K1E5wUxj16I48s3m4wfdYuCGfV3tHKZYRHZpb+ZYG1UXnybzAGKcyMc?=
 =?us-ascii?Q?u9xqiSp3R/HdT5CIxb2hEqnivd9W/wq317q6tCPNksQtcbRf0mtWIJm1preP?=
 =?us-ascii?Q?dNLIpuFzuL/ft3k0s/9zIHC3ni7yxGv2Lz9/2e6jsFVbsndWhINbY1edrQOB?=
 =?us-ascii?Q?95sCI0WGBotORLOz/QNT4LyTvCeSNW/hxiHK3Zyxj6IZLr5H+xlWzHGPIFHK?=
 =?us-ascii?Q?4qXxT+QZtrT2lgnbpBZ+bcLL5bLKwqWddT4Vw/+GVAdwRGKAyUV+kQBdAVHU?=
 =?us-ascii?Q?Uwhw6Vc9xW/FMZzv8OVl93hcLmsn5C8=3D?=
X-Exchange-RoutingPolicyChecked: 
	nPzoY6e+uyU2No+bi1dcM1P9kOTL2x4CZtldNtZA5KIq5zASOql6SIcUxZ9eO5PkizHsBZHl9yklRExq8MfKpdgdYOHIdaTYf0t9ntTOfls531akb01Vw33GAbbhT3zdnaOh6tcwK80qpTGnkqxgsba7FTl+yBwfdKkD6aeuiwgrOyXMhxQTGt5wXDh+0e8cE+l8rSDe3ucNUC3uy6neZTsdi0IbMv62oAu20uhBHL0/eyG0kMbpevAA6xLIY3Vs0P3/mFbW4epzrCwNC9djbfUTAAYr8mIpt36Qk/KiVGA9/Dl+PGyga/52NEt7J9xX8vL6bfmiZJN8X8OhliR+yw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 875ba978-d050-442f-4339-08decba4ba6f
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF3ECB6A513.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 12:42:29.8370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZb1UuZQ1ati97op0w54mAmCrt/yql62ySZJtoPou5h7txpShKdHq2FYR4nmTjzu39WedcM3wr/9F6jYkTn3gTN3AvzngbQte1qQes1ijW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9461
X-Authority-Analysis: v=2.4 cv=SvmgLvO0 c=1 sm=1 tr=0 ts=6a3144b8 cx=c_pps
 a=8o+REoaIO3XrXU6fRoneHA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=D31QgfloAAAA:8 a=ie8juzvCKAufGvMqJVEA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=I6paTPn9_Px6ARgSWtWf:22
X-Proofpoint-GUID: LNnkh_QE1XpLumR65kJNydjm76ze_T4e
X-Proofpoint-ORIG-GUID: LNnkh_QE1XpLumR65kJNydjm76ze_T4e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyOSBTYWx0ZWRfXyv1cHHWW00vc
 ihM6TvYy4taF/t/QYBilL3t2f+56XXQ1hNTeC1KA07etZ/jIvP65SOQ7NK67W1O6fBEBZJVjfQ/
 A7kD9fHj9XznkWsJxfkWa+RVkGzFR8xOY93g5ksb4N2s15gPdcfA9v9JiFvD+e9QbV5j7GLk2Vk
 lIX155kflqhuFfI0NS0OYlDAG33aIHRp2T2C7W04/JOh/T6KNN7+uv4C/MP/CpwiK2eUfoy8Nbw
 Yqk3XZb6S/aTHtWDcvYnZzuRbJCaOCgt32KfbCPA9WHrlJOzL3DTc/+V/bv+ow3QRF0yeerwzbM
 XCibv4CEDpnGX40bmDu+gxmZpO0Wb+kswFJOg9qC4+5l6PLsOxNJ0AKTY3vlfx6JShyd1oHPZUx
 1JNZJq4vTF43hW/kIFQNaWkqA/0gPAgIEigzq8ynZMJ0Yna5QKe9nUId06NNURetfLoWb0KvmUl
 ndwcW28nX3kzHb5Xfkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyOSBTYWx0ZWRfX/HaTjjup7fzx
 h2Rq5fJQtaqAMSgmrBjE1hUtaeWLJcMd4sUYjitObtfDIqicI6BGE3vyXuxwoY2KHStAUPTiK2Y
 sGK9CNX9nqsgEVQvhxcyAAR+OabRVbLo+nsGvCucKZZIeRKi1fcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238896

In libinput before 1.30.4 and 1.31.x before 1.31.3,
libinput-device-group unescaped phys output can inject
udev properties leading to arbitrary root code execution

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2026-50292]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../wayland/libinput/CVE-2026-50292.patch     | 79 +++++++++++++++++++
 .../wayland/libinput_1.30.2.bb                |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-50292.patch

diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-50292.patch b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292.patch
new file mode 100644
index 0000000000..d2421aab10
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292.patch
@@ -0,0 +1,79 @@
+From 76f0d8a7f57e2868882864b4611281f12f704b55 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 1 Jun 2026 10:48:24 +1000
+Subject: [PATCH] libinput-device-group: sanitize phys before printing it
+
+A malicious uinput device could set the phys value (via UI_SET_PHYS)
+to contain a '\n'. When the value is printed as part of the device group
+the udev rules will interpret it as separate property.
+
+Depending on the property this can cause local privilege escalation.
+
+Closes #1296
+
+Found-by: Csome
+Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1487>
+
+CVE: CVE-2026-50292
+Upstream-Status: Backport [https://gitlab.freedesktop.org/libinput/libinput/-/commit/76f0d8a7f57e2868882864b4611281f12f704b55]
+
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ udev/libinput-device-group.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/udev/libinput-device-group.c b/udev/libinput-device-group.c
+index cdb38c0b..f9188406 100644
+--- a/udev/libinput-device-group.c
++++ b/udev/libinput-device-group.c
+@@ -107,7 +107,8 @@ wacom_handle_ekr(struct udev_device *device,
+ 
+ 	udev_list_entry_foreach(entry, udev_enumerate_get_list_entry(e)) {
+ 		struct udev_device *d;
+-		const char *path, *phys;
++		_autofree_ char *phys = NULL;
++		const char *path;
+ 		const char *pidstr, *vidstr;
+ 		int pid, vid, dist;
+ 
+@@ -122,7 +123,7 @@ wacom_handle_ekr(struct udev_device *device,
+ 
+ 		vidstr = udev_device_get_property_value(d, "ID_VENDOR_ID");
+ 		pidstr = udev_device_get_property_value(d, "ID_MODEL_ID");
+-		phys = udev_device_get_sysattr_value(d, "phys");
++		phys = str_sanitize(udev_device_get_sysattr_value(d, "phys"));
+ 
+ 		if (vidstr && pidstr && phys && safe_atoi_base(vidstr, &vid, 16) &&
+ 		    safe_atoi_base(pidstr, &pid, 16) && vid == VENDOR_ID_WACOM &&
+@@ -134,7 +135,7 @@ wacom_handle_ekr(struct udev_device *device,
+ 				best_dist = dist;
+ 
+ 				free(*phys_attr);
+-				*phys_attr = safe_strdup(phys);
++				*phys_attr = steal(&phys);
+ 			}
+ 		}
+ 
+@@ -151,7 +152,8 @@ main(int argc, char **argv)
+ 	int rc = 1;
+ 	struct udev *udev = NULL;
+ 	struct udev_device *device = NULL;
+-	const char *syspath, *phys = NULL;
++	_autofree_ char *phys = NULL;
++	const char *syspath = NULL;
+ 	const char *product;
+ 	int bustype, vendor_id, product_id, version;
+ 	char group[1024];
+@@ -175,8 +177,7 @@ main(int argc, char **argv)
+ 	 * bit and use the remainder as device group identifier */
+ 	while (device != NULL) {
+ 		struct udev_device *parent;
+-
+-		phys = udev_device_get_sysattr_value(device, "phys");
++		phys = str_sanitize(udev_device_get_sysattr_value(device, "phys"));
+ 		if (phys)
+ 			break;
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/wayland/libinput_1.30.2.bb b/meta/recipes-graphics/wayland/libinput_1.30.2.bb
index efd51809d8..96531e8c54 100644
--- a/meta/recipes-graphics/wayland/libinput_1.30.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.30.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;bra
            file://CVE-2026-35093.patch \
            file://CVE-2026-35094.patch \
            file://run-ptest \
+           file://CVE-2026-50292.patch \
            "
 SRCREV = "042c5e6fd9cc910307027a1522453794b29f2c72"
 
-- 
2.40.0


