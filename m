Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C714ECD4F58
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6067.1779102232840375391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kdMoexjg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAvnx71174249
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=3pR5Vp+zos9yeemHFilIf7O5MYdQRMKW48Y4ShxM2f8=; b=
	kdMoexjg0U6I4vGajpTi5Nry7PGnaXGFMujv7/fWJdT0H+piMTCjGFiWb5K8i2XJ
	nZzQ/ZnfzZ1vUSigqebjfF7jBpCFcMnJIWIgqUXD8l3MYsUA+GmGwAyfsogQBNxt
	G2KzNVjG8eMiH1YhdXd5nqB/vmZrel1vtlz3BGyxD+K+0YAgKDujSu8Uy58EVyM3
	u48oSZfALJO6pqFuQe0iqR5ZxR5t+V2raMOEuIWjf4iyuwgYn2r6vT7YaSyq+t5P
	amkStUd3pU0b9TyN0gWAPjS84LF5CbCqSujtBHn4Go57KcGAvWSlVYYdcfzs4Yxd
	edgWlHs3uXjsT2qsvzopUg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1tp9-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnwPUElmSAXSDTJKr2evuDDdfztgh1JF3UnQgkfb3sJmNunmjT0MkNNwPWviI3n5iuDE+6Gut18mZ9gd4mtUsjcz2zqRcEUeEPdnmdr/Dvud+XT5oDMKWl6l8oxpufn/gRvknnQLflBrGrmBwdv2h/itYZ36HXM+EMUzniR9N/iY2mbXZ643jcuGsv8RQkJGpMPHlJjTnUOET4V9Ssm7pAZ1NWNSQjB1t72BXEPvaHJf6DlXrI2Pu5VMNcN3Riygvyf4HR8rI/pI8BB3fP9BMRHTLFAK/bKlY4DhwluFdb4HNgfeYshofbcSfD0nVHxeIb5CykWj4UOApHyV81Aang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pR5Vp+zos9yeemHFilIf7O5MYdQRMKW48Y4ShxM2f8=;
 b=hlv02U9sNjzJTavjICh6fX9pPmNs/2TJIHRX0sBpEXv9P7xozwwyd7OahJS0f6IXnuRqO7q2W+KEpdR3SCH4KETPKyjAAqiwlNzacPkoTbLnyOzX9Rvsg+HHK/JsXmu0mbsFRRJtSXktm9XLKHI79CbIO0X0WUbWQHhCOI8URcnlVf1Yy6HlbjiD9uo+Hbta+eKUHsmGpgyzXRgiLP3Lz2GQLixrITWgh0NdpzCdqB54tlANNmUd54w72uGKiMTVgUyrcq/sx2AsbdSQoyM7sw7FmawGkA/0pkRsqSCe1z8efroV1fZpbPPpR7jy5qX8aC04ULtFZGx5HwvbK/Hkzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 11:03:49 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 11:03:49 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v2 09/12] gn: fix build with GCC 16 on musl
Date: Mon, 18 May 2026 04:03:24 -0700
Message-ID: <20260518110327.2347543-10-Hemanth.KumarMD@windriver.com>
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
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: e298f763-431b-4514-f913-08deb4cd23e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|3023799003|13003099007|38350700014|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	OGwdI+Ox8X6jLXPktuaQuLbgb+ibewyRpb89In6yRX2s2qGf9nIyQcAzBEt0NudE3R8CQFfl8oGnUQmLmTEBnG2zLF9/Ic9ORqit01uEIQaTSOU5vcy1kHnP+2tr0pBeQTterNrw2sUknl2nqgjILaEpJgWf9HNqJDqogCdrj7JmP7JWcPbSpDbuwfGGL0Iil8vfv9O3OMRbSALA65/T/CQ9yppCCqW4XcAuu7o5JqM1/mj19xuayrjhxSZSvLYsue+eK1cqyooSSsdkZMhRFpFTraS1J4/iulxj9g0RaCR0TLp5bQOjkXzEpgSPcdR5KOO1UVU07vs+HPz2JFbKz5fcARcAA+7h7G3y6L66qQUeh9fJTCYuDzvPUprhpLSYjg6MVzgk8hOAsxOSWoroh3zdsQiwlKFZPvpH4c8GqLB0dF86sS8Q8deriIVIIz5wOZBGtstw0voVbgw05H7LyZlWbzImsCOXOURcnSmtgGDA4DD6a/Y/wUFATZj5zqw4KYTS2xNkxGyWMP10ALL+v5bAwcX//Wi0gMOhkbvX5xVBHf8FGs4jf7XvNnXTNwbnkv9jKkR9NY5XMb43u2fLtf75xU40rE0b1xslXn6AjXQff5epvDdne2axEm/jgm/9bN7AFnVoPg0KNdYwnFNFwEshWUnr+P4+XL+APd1XsuNThhefrBBY4V4mjHqrLJcc1EWttZ/UoS5Kl28G54rWj9vOLck/1grNIFZWtfz5RRTwse9E13zVbgV+BFYzk3OK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(3023799003)(13003099007)(38350700014)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fnu9KWT5J0HbGNGa7+0g9013wI0S8Dv/y20K3D4ILE9PadSbu1JW/Sj0UKfr?=
 =?us-ascii?Q?RYvZNbr9RxHT97WbSk1Fe68/SFZm4StxYkN6SPcLQs0U9eGZR+UEpU4p8YaF?=
 =?us-ascii?Q?gnE5OleTHA/qTzjk9rwz37aBdqpixiGfLR1wPUD3iSMZ6m/BEHUYHdAc1FA9?=
 =?us-ascii?Q?rrXfomJ12Zbdz9N+xHLwoKCOFIlUAquQN9PkOgUjdQNW0G4eRppfF5GEX2pQ?=
 =?us-ascii?Q?cIyNfSqw3yvbVuTylDjzrcFWltsICc9BgWdDy2MqlL9NVvhoqOPx5bdYd83C?=
 =?us-ascii?Q?k/6kKes6qLoPwujcYRhQnfK7dstpv1WWt4Sd9RRko8Mq+Z7YzWU05eFubGC9?=
 =?us-ascii?Q?r0ZiZfKpVqaXw5s9dAXKn+sqv9MzYh2BUexX6xHuGt2MzWiDyLAcEBW+ZiA0?=
 =?us-ascii?Q?60+AhABiQIaBR1N9/IfDlBynpLy/8TrWT3rXqjwkYACdqrBectZW0lLl9ZBq?=
 =?us-ascii?Q?j8oZzoqUpWRjhDLcxC32MFJE9H5apXZrMWIOYL1mugW9MH2cpyXy4yBm8VRf?=
 =?us-ascii?Q?kclcgC5IibzCYXINm1PqXWd+sc+6x9+//zMwQPUiDRv8h7aEYHvjEeVy84TQ?=
 =?us-ascii?Q?b83Y+IQHKGGG6XA5/MiktgqEwZ75LYPnolGObQMERdN1toEYP7AUDl/jM27/?=
 =?us-ascii?Q?77gutjAYZ83P1uuWnTtpo6gWF8M0K0JkR8B5+CFB4W0y07/9bYNGwmll8eKp?=
 =?us-ascii?Q?pddmjQJ9pkXnMQ1MZfYnv5YnMM41fxI7wNp3O65kljmsqF6JQslRF5qEoMwJ?=
 =?us-ascii?Q?YakprbFiwblcEgYLuQKRXCsZA2rlQBBt1uubqJYpUGbjHsqMtzbuC6RNSYXv?=
 =?us-ascii?Q?1P9dqi7cnuhlgrKfaPkRlI7nH5kvh4pBtOrAwbKWfKh0ZnWdpOIupcbgiiAa?=
 =?us-ascii?Q?eSrQPgl8JL/cj+8GJsWw5qvHWv3sPJx3+JtyVtrdlgtWVJWwMiv+Orwb/NtW?=
 =?us-ascii?Q?qBTxOboCh7DoSF4QtlVI+dG/Q3vfLPhAKAYno2xJFqa3gfo6UT+rqmVZ7UC0?=
 =?us-ascii?Q?lYANvcpdnN9Ny2e+tv3boJaHI6JwY5MSQaP/5+nfI3mL4X9vD6tL3tlOLVZI?=
 =?us-ascii?Q?mmPivi/G/ECEji4BYhaVSCN5V0Ue0Yh3oAzFdk9AYRfTVUDTtmwXQ3zvuJFg?=
 =?us-ascii?Q?WsgzBX+kCQEik6G9bg9t0unZqkbPD7XdjDQklYR4NX7edGm4Gs4SLpK79ZHg?=
 =?us-ascii?Q?fipFTBFqO4o93j5avHJ/ul0GWoEHa+BuHgp56GV9Ov4NNTqT29IORMI8tGb/?=
 =?us-ascii?Q?LLK7jfH/acXB1nTub0Uk8VpbtgzDGIrVJ/yrn8CkivLyo//yExKyEI6PdVe+?=
 =?us-ascii?Q?5X8nyWj3ayt8J2EK5ZGSV1d4D6a+jGD/rwYEbyg7ySMbsRMEN4e9UPGEgHg9?=
 =?us-ascii?Q?oSMk6OR0jl0rJkoGEY0OISoEKWIFgcC3Hwa3cceSdioVeYLx9dRrXk/rqYDm?=
 =?us-ascii?Q?m82ki5wzKGQygGvMIVp0M/JU0A2jhddH6kQ4GjSN2l7A14eyppDuA03zK+rm?=
 =?us-ascii?Q?5V0K/iIB/PQt8D/b6jWaF1XyzwU2WEE3JdM0e3gZ6qOzTeGyTVz4vhsMpliO?=
 =?us-ascii?Q?ntl702FkEwLug3w4YqkNU96zkKvTWN33Z/PysEZuKx2faYKAa+X87dP3u5Wx?=
 =?us-ascii?Q?pp9VSKTqMEQFV59nYEmW8cjIRgQ5UzjxNo4EU6GzAgfk56JiMMzli77ISKwm?=
 =?us-ascii?Q?6Wf3lfn9oxBBnzOelIwSHC24lxydeLk7XREo4g+3PgWxdGt48QrAoASz5Xml?=
 =?us-ascii?Q?5chnx+OJ7ysyRmjdKyu/XCmSPAvoKAc=3D?=
X-Exchange-RoutingPolicyChecked: 
	DvRsN0tdTwkAdt13gEVf6fQ6CGopQD7dH0A1UMeKejb37axZ99FRpUF0RtTkTx7yvm0AxIxnyUYGQbc+hhOV+RWeqj6p3SfhJAiVJxmkGMdPJ6RoIVlZ2cdEHmCj5Gbys3dADwDqi+ufNpJ8j6dKfFGrq/CKWfwjco7uKExbkv6HkGWbADo1km9Z6pvrjb/1OTlEyuDNFGaF68U/8l7JMeSB2gN6IlSsbWIjsn8rcPnC130aHRHqMOczQg0IIgTXszwoY6jdM/agC+dhJ9Q8W+V5irE7NxRzev44DTi1gROTh8kgqZadhQUxpUjYaEvOJGoPmYtAE87XHHhGh/3JRA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e298f763-431b-4514-f913-08deb4cd23e0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:49.7115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCC/3W2tUOHdnb/yv9AQbfCgtONdh0UiFVTlgicPOrqOUo8zx0cAdfonHuqTH82TEqfkD44jxJsJ3OH6oONjsK/Cwuk9Mu3FTjLt2y0iusU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: fd5M-3HLYeBOqWqOvrl03rD-c7qJQ_b-
X-Proofpoint-ORIG-GUID: RsJvPYBK3jywpvdpli5vrZJFcCu-IBqh
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0af218 cx=c_pps
 a=foOfPl9YvWvIvXDtd8Rkbw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Oh2cFVv5AAAA:8
 a=t7CeM3EgAAAA:8 a=OyRh3rS2erfsevdoCagA:9 a=7KeoIwV6GZqOttXkcoxL:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfX543Gj8Mz/gbW
 9EIkc10o3yOMXRX8aQEcp8A5wJTdHYB2XNHpnsrjjzTdz/ZUQfFMKBwMaV1lrajcpF4F2fLDUr4
 +PNIaqX5Jupr2OYlbMYvKqAFTlMZmIl7S1mzIEdMxE0fpcuKWtsgcfPAsThDS97lNjB2ol19qBb
 afSuUDMjx3ZvIcUmnUIrGK20Iz91FBPKK27u6Aw6PQys6vwQqmOlIkSBfhKoyW2EL+lBuKbxNAn
 jC72buvzZONfK9rMtU9ahqn/xQKNcRUMXUo+gI4P3YqZUPVfQKBFNUIRzrzZ7h6OBOo6glUhgKC
 fehyba6l7t7SGdf1al2CTjEN2OuDU/zWwWqpa8LTBatIFD1CSxs7zHfLF6xALRN/C+tjJx+ZjRd
 SGh1sr3aTJnFRGqyZM1WR0WEqi1WtU4skcZrWLqZF4hEfNhhMh2Ur059rP4tMQI8z/BEAGoSLvu
 YQzEYnUPMdABcUX6amg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237229

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Add missing <cstdint> include in src/gn/pool.h for int64_t.

Fixes:
| ../sources/gn-0+git/src/gn/pool.h:26:3: error: 'int64_t' does not name a type

Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/22740]

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ...001-gn-fix-build-with-gcc-16-on-musl.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/gn/gn_git.bb            |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch

diff --git a/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch b/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
new file mode 100644
index 0000000000..04598134e2
--- /dev/null
+++ b/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
@@ -0,0 +1,31 @@
+From 6d22f5c9e96811f1abcedd8fb1849fe72747b5c4 Mon Sep 17 00:00:00 2001
+From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+Date: Mon, 11 May 2026 02:43:10 -0700
+Subject: [PATCH] gn: fix build with GCC 16 on musl
+
+Add missing <cstdint> include in src/gn/pool.h for int64_t.
+
+Fixes:
+| ../sources/gn-0+git/src/gn/pool.h:26:3: error: 'int64_t' does not name a type
+
+Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/22740]
+
+---
+ src/gn/pool.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gn/pool.h b/src/gn/pool.h
+index e03113608..247cb6425 100644
+--- a/src/gn/pool.h
++++ b/src/gn/pool.h
+@@ -6,6 +6,7 @@
+ #define TOOLS_GN_POOL_H_
+ 
+ #include <string>
++#include <cstdint>
+ 
+ #include "gn/item.h"
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index d2f61c2098..6047ab5e2b 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
+SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
+           file://0001-gn-fix-build-with-gcc-16-on-musl.patch \
+"
 SRCREV = "eab8a9f92dca9b8548a89d9e5eb6aeb8ac6bba77"
 PV = "0+git"
 
-- 
2.49.0


