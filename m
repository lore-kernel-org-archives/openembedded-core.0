Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39053C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 05:14:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6833.1685510067204676037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 22:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55150d77cf=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34V52WuT018583
	for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 05:14:26 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qu8u8kaxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 05:14:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6P48gl+mxOwyGkq4AZeVOWeI5TrVF33ZZagyqirJtfaJWQRNvDtDBk86xVubqw6uC4wtUR0FYvm0TqtMqHMn2Mz79rYRLUVixLo1FWb9aHGHHOaxNeRJ9HvlOg0pxJ7GNk8nM7pynLm5g1/nEotU39RG34YcxDXR8HzjGReiB6k96mFYdc5m+mhDYWYXMZTv65jqWEIpkHAF+kjJersTlSKalrYAHic9JeOS8uQTqaA7Y+XMg2Pl8OMgboLhSU5zBCWIK9jOzTQHZvm6OjKDgtoy878d8cVCrwZUkj7CHzOrDVkvhMKwSp8DxAQxd9250fPLEKh5CMuxjjnkLVFmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky7Z/zN7x6xM7kwNRhsZ3UmgGYBPismm1hlrca9+OHs=;
 b=PIyEm8HfV5XghyP2ByUBj58bcqO0nWCx1Jnx6D2S/BkzVtqd8vlStZqwuW80bOUL/zR7uXcVSmdBGEcyxqxjERQIQg9A1wLZnSYWT8U1kbXSVlt7mo1e1fyYG1rvLO6xuQdRTVFBRAxO7XaSkHXXBavfXHyvK2wBL0wklnXICCNO3IsLqoFy/LF6Q59iQLhMPKBOs/IEpdNg+ScSN7cievEfWxs7DdkrWMmlJoyRiia8wTikORbVI2HR23waVQ3zxz2Sk05S5PjtOZ8aE8mUWKUDCc66A/jZfn6QzDkS2HWy+1ET93qjgbUWYoudNrO8QxDKQklhvHY5w4Ps68q7Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by CH3PR11MB7913.namprd11.prod.outlook.com (2603:10b6:610:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 05:14:22 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%7]) with mapi id 15.20.6411.027; Wed, 31 May 2023
 05:14:22 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] perf: fix argument list too long during compile
Date: Wed, 31 May 2023 13:14:08 +0800
Message-Id: <20230531051408.2518859-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|CH3PR11MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3573b6-d62b-4d74-2400-08db6195e4a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Iyk2EFvSchPoxa2SSdafT2ZVlx8lNc860MvFZSNpmVdTvumBmXUnnBFbrieNk+SvYKnnVyITC5si7s2+PWOP0m7qYL7is3BbIvxVK9ZJPSRIFgDZjYMhztS65aetw8tFPuE0XIEUROo/wHXN7FpVmQfnVZi/1cLV2o6byoAOF/f5A5JhqyD7vuSINuLb/sFeULJKsCBltX9z7JLVDuq9PIBgXsNLxQdQBlmMhjH/o6KaLWDq0rGC8c42OamEY/myRfqknqX5D258Jlj9v5KcIlZ/ONiBN9I3GDs+e89tRf0Olj+tRMtRu1Nxn5xXXLKaZ9CylO3G8OZCExoHWyCwHRcAIuHUWBsP+dldfOXCtFjiQf8VUhAtJ36wp2UEHhklY3cnrEqhHtV7LzRRKC9iMCMtEd04wycFL0sTKtWS97Sf5Wx11BcZi0vHDPrx4XgDuUbmSVrf0fPtCrmbdNOxnyJHN0QXSYndcetMtEZ+3YSt0TQ/5ga0WeAylfWXhharZNAvhBoKLJljB4g8NjyU1pnn5ARHSlaWchKbG1+KvgySYbWFwGzipngKWrndZ2jEWNvjnpnJIx0TfNK2uetIPcEMCO405Sz1YX7dGGKjvREDxv8ouozSjQg6kHOCQc4g
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39850400004)(366004)(451199021)(6486002)(186003)(52116002)(6666004)(5660300002)(41300700001)(8936002)(38100700002)(8676002)(6512007)(6916009)(1076003)(26005)(6506007)(38350700002)(83380400001)(2906002)(4744005)(66476007)(66946007)(66556008)(478600001)(83170400001)(44832011)(2616005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KNO6Zx+wOWJkXKsbSomudAeEvjlaasgAAVBYqotxX4A/qXEvLZRe7L1A0+G+?=
 =?us-ascii?Q?twZw5sgEoYOJNP/FbGOy1QwjTK7lwKJkQ1+FuYXddJKiDTE1YFwbxTQ1a9qR?=
 =?us-ascii?Q?gGRFUkudZp9szu9illQ39vPWXXiqxrF1gtoDMgjavEabQd9N5BoMVLo+GY9u?=
 =?us-ascii?Q?0sls7qm33FXQz4dFvvjUd4/1vjdMQzpiRcc2JE0KKX4AV42bPYeQaPX8qNw8?=
 =?us-ascii?Q?i31Hiem++MZPiuBdswSl3hNFZaQmX/Ll8ahb8q9/d9Sh1iOHcZAtyoR3CobX?=
 =?us-ascii?Q?FDtaqKiRr5Llc16kV+FoOsBxsFsw6NRHOBoIu27YTJZvC0gXekj2/cRvmqaW?=
 =?us-ascii?Q?JhxA7Qk2OmgHryaGBpKPGWWQR97mhE0ljwf17Jg9Ln9udLmiGIILIUaK+/ru?=
 =?us-ascii?Q?7HdDkBFQjHyQTW5BwXSmdTz2TAkzE5YTH/ciVpLuo9eUJ+ZSS/Xsvu41b30X?=
 =?us-ascii?Q?OTGAqZQjjm248rT/KrS/56t6BNPAX6ETQBz9YVRg7GWgWHE72XwS4ZBEE4sE?=
 =?us-ascii?Q?RcQwljZ3oZC8HbrRCX+8RoJm1yvTDLf40XjcRWbu0yY6Ju5r3dbZb/CV6VEL?=
 =?us-ascii?Q?fR8FcazfQZhpmZI+REo46LiAt/Oi1wu0tOFJSyaS05hPy9vD0OR+jMIMcsMQ?=
 =?us-ascii?Q?009ipuYpo6nVdKskcrwW2ndGyBOuz2eBZ3Oxn+fn7s6QgjpWkmRJ+P6qivOF?=
 =?us-ascii?Q?Mhe1PrBxNjhT3peLG3MnKeBVbgIS7n5waFVi9pW+HmV8nCtT7j1Xt0/4h0zF?=
 =?us-ascii?Q?drfrMvk0B6wgsI17ei5YQ0R1ejPQLfLQ1V4fYz5lhS7jYTgsNBfBGGvkE9Iw?=
 =?us-ascii?Q?OGA2pzxET0x/Wy9eEhzaIN8MKgWfaOqGTn9qW9yrnCRLTJG5tVU6aZ+F821g?=
 =?us-ascii?Q?aKJKl5RX81A2RJMqrBgpwTbyp5Wa/Wwate3JWxwL4c3c4jpCII0diIRO/cT9?=
 =?us-ascii?Q?1JMAcymp6ofDsUKOiNTFWEpb3cFcwaMewHm3LC4IexqfigLn2UMC+03LqL3M?=
 =?us-ascii?Q?RCYb/Mofmvnymc/X3rFar4L+4H5bO/AIsb7g5qyLjLeJkMZPfW8zQ4Km9UZV?=
 =?us-ascii?Q?8n6N0ErXZXqhkx5TZnCglWytGqictDT+Y5sI+A3AOh+PEGiF707mexgyMb3w?=
 =?us-ascii?Q?toxUzj69ItH4u48vAJq6iz7gVSrfQxucp/vPw1s9nwQ+xebDHxot05ZLDpIA?=
 =?us-ascii?Q?Hoi68CEnV8Wu1lAKwKt9y7Phl1jt2bel5KtKl7FKpMK/yYmZBzqjKXzsPiMU?=
 =?us-ascii?Q?Xw0BSeNloVNrSW+RBlixdfogTjOQKQjTaHUJUV/FnWN+uY63wMHDhPwEJ+aN?=
 =?us-ascii?Q?6ixpX5Ylx82eGXu+NF6SupvHotCYbBuDAjU4Ks/Bdud1IlXKsec9o6SALA38?=
 =?us-ascii?Q?ViYyQW+H0zN7E6fw4cQN+jFX/JitmgO0Pleo/PWHqZ9C5YGUGyESP+BSpl/k?=
 =?us-ascii?Q?MmKoF8So6cpH6wqEZqNUSO9tme5/6PMUdkift98WHuX/3zmGn65ymzbEuZwz?=
 =?us-ascii?Q?u313VSCucMLAiCnMi56ePuwhwXoeW1NbQ4kxNRR20MHkMwAiNd0C39RgMHQE?=
 =?us-ascii?Q?sNmqjp0RMIgn7eKby3gQJDhptFKSyIseHyGUhZvkqXSGZSU1zTagJ6GO/Hky?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3573b6-d62b-4d74-2400-08db6195e4a9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 05:14:22.1180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9yYnEMQWHjaBaoYaS97bNs8y9nwt/W/iEF/w9JcEnwuJBTJGikyjhIqwyXQaX3quYTrA8HqCGAALIWEHL1Mjm6A8Q+/rcTLpxpE+5IaO2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7913
X-Proofpoint-ORIG-GUID: 4xtL9qiIoBbdssa2mVEzi0hdxMFeyeJo
X-Proofpoint-GUID: 4xtL9qiIoBbdssa2mVEzi0hdxMFeyeJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_01,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=725 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 05:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181989

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The perf would fail to build when BUILDDIR is longer than 190, The "O = ${B}"
makes it use absolute path which makes the argument list too long, remove
"O = ${B}" will make it use relative path to build will fix the problem.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index a4ce3169d3..e213c3632e 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -72,7 +72,6 @@ LDFLAGS="-ldl -lutil"
 EXTRA_OEMAKE = '\
     V=1 \
     -C ${S}/tools/perf \
-    O=${B} \
     CROSS_COMPILE=${TARGET_PREFIX} \
     ARCH=${ARCH} \
     CC="${CC}" \
-- 
2.34.1


