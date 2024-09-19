Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657E1CDD56B
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 12:49:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18741.1726750166931168829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 05:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9992e69025=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J9PI5g018251
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 05:49:26 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41na0mn6bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 05:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQe2HWPSRDi/4II6NqTR0YtqvCEEAG2MGH7GCGGYyJ3ExsN5GdRIdPUQwiVreHIvNy8M2N8cHdG8IfFOquVbZY1n5ZUlC2QYgJ8R86Tl7EzoKtjsX2tVgj4zw3xyP93Vp3qj2C/W42LVuEnK5+WAPS2A5/6mvCN8eBmn+2kaxlMEUmgLl+m+ZeY7FOHHcchDeZpq+INBq9+jfB+GlBb+08JriRnkWv/Cpw16R1vF3uE9tqFCiAQNq9ewzegF/vJrsX9A30OCXfd1dlSsrYm62S+PQzgOWVIeLkvJe5TJU4Zup9qL8D94PLXMvVT8SNKGnFC2SshdS+pba6RYkbw1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmuAHUtEook0el8wQLgAf3olcMxEnU88ZCzuBaSm5r8=;
 b=kckZDv8rX8A4XBx/w3twq3FyfrFgLSin9djl5bTwuM+kj3pSZCie5ci4QfqS2CfAbMaC58RZ515OX358g2URNW3vOwRcW9WGKLcfbYwZnc4t87OR1sj2nnGYB5s6SZF2n17fbgbb/J38EhbV2SLC8KwGdxySE96Kt1pt1no7GwK2qZXa7a4ruXv3Va+WsK4Fxcr3pcjeAG/s6Gd2jiSiDWWfqlOtogrPh+P9SMkTHApOHPWnTv26LxHbkTghJ3NIa+yAf2yJeZs3d3tNQd3Qg4RHomgtr5eih2LtzU85Cu4TBqD+KhY4wvb1ZdeX4OBLo0no1rnz9Kn6YsAfcQ+COA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 12:49:07 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 12:49:05 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v5 2/2] nativesdk-packagegroup-sdk-host: Add missing perl modules to RDEPENDS
Date: Thu, 19 Sep 2024 05:48:48 -0700
Message-ID: <20240919124848.653457-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240919124848.653457-1-Harish.Sadineni@windriver.com>
References: <20240919124848.653457-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0384.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::29) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH0PR11MB4792:EE_
X-MS-Office365-Filtering-Correlation-Id: cb71919f-d8ff-4c74-de6d-08dcd8a97207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K2J1+leQGHgIPJ5OHJtYcjsey3QKRqHsdixOPimTLmzlTMWUxRPShsjGVf7B?=
 =?us-ascii?Q?lR9luKGoyiJpGCRUB8sOCLetZzCR7nTFtoqhAVkY3fJol9yjZleo3YmAew3Q?=
 =?us-ascii?Q?vcAHR4DtWszWGpDIgiGdw0FBuKC4mNpM0cBZRrzWW3Qws/V5X70IynrjQVFK?=
 =?us-ascii?Q?4cuwABCA3mhNSYMKnJDndEu03n6TK+PlxQz+QvwZwbhjRPL7qCnJB+rzh7QM?=
 =?us-ascii?Q?dobt3ySAy9q5bElRjHXU0RE39fBSKBUYJCinOoE4VilOaIZbiNvZLWD3YVuG?=
 =?us-ascii?Q?ToSrPC6VY6Y1tPDVbMjX/h1UC3rXFZpElQSkI6ge/6aCVNEGSpAOERLYljso?=
 =?us-ascii?Q?WkSRgsJemaPsrqiu3mOUnmBogPo/ZQtxokHrvb8mIN/M2znEfU1L1yTPtkTa?=
 =?us-ascii?Q?VnWomWCk52Qygj8I/JPd6xD3wRdzPMT23eJ1XUDvU8rFFItS2CRrKVhZUyWW?=
 =?us-ascii?Q?bHLge745mdH77pXqwLcojiqOzBGG30LjucX8BChrRqSVF0udsAEhJSNOvNV7?=
 =?us-ascii?Q?Sgn2K3ndBhLnuUkARL5is0Hi0ybyY8czhfUYQeIdOQn22cwdNS5WjXn6pR74?=
 =?us-ascii?Q?H1BQGzsWIQxFliENOZPSOgg9t5+Kl9KsQqhMAu9XAh7ICRRtv01f0LgthDFQ?=
 =?us-ascii?Q?s3wzwjCuMKIPbL6317unV8gynYrwYjHpBqlfV0YNIPZ4UwEQbzM4lKowAFik?=
 =?us-ascii?Q?tf98M5VBlCpDisCXEz7hqu+XWodYGjy8kEDgmKk7ai/a23ApB+Cjl/ikzby+?=
 =?us-ascii?Q?Bfr6JxUBAWVBwYpAiihrcCXRguL6V73gIHdB8btLtmlzckwF5MV07jvHZ2b2?=
 =?us-ascii?Q?8RDE86ZkMWX0pTH2cJ85s9Jh6A1ss6HKe99rmK5s7tKYZ7DFiFuw9YQn1Zow?=
 =?us-ascii?Q?m9iiGt9N9JD0gyDN/PfnhGpfej5KLiIOGgX//JhfLwewc55zvsO/QsjBD9Ft?=
 =?us-ascii?Q?s76nbIUFBATwtHNGq0nOSOgXoY6NSFHYIc5InXZiUXr8tQ3bxnelPdvEyoOx?=
 =?us-ascii?Q?TVXHTAtRC5+1xjhDDPGpwLfYK7wzhtlF9lkuu84ajNR9Msz5jFcBOyRZzJZ9?=
 =?us-ascii?Q?47mVlzEaFDPLIUzDn4kEQmUmIFpkzhVkbbTGo/zWww/k3n/R71/ILU8pfjRP?=
 =?us-ascii?Q?7vqC8Ad1kOpHKzZTer6t/UDcCbhlpVccb0uYYQG6yQ4b9u+THnn1StYZIwDy?=
 =?us-ascii?Q?n69tZXBHwlYw7BsYupU49Rb1EeUHdbT4jMyOIKmykleCt3nh1ew+ZhC1axDP?=
 =?us-ascii?Q?CeyCyb/DNhJ1hqx9QHk28HP6kXIJjEhjZQXNFghr6dVzRQbeAfg4ibvvKm1e?=
 =?us-ascii?Q?0BaC2RM3Qv8bA2F7yBsz5zpj4RtqFMCLonpyvAZpSMR6enXHmkReAKtINNZS?=
 =?us-ascii?Q?mQL0Lg/i8/TD4dN4kWLiCU1N7xk5edDTSz42T6xzDXEdGMTwPw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zlqwyEknew5yLQ6ocJGWN0Bw4ZkoSbxkZzyo8+q84RABrqJIxto9ykFrkhqU?=
 =?us-ascii?Q?etdLjgqKGXYsPM/lfV2FYUT7aA9kA9JAvGNmsyxtigEUeZnYwA6QjirRKcWy?=
 =?us-ascii?Q?HlDh/eLfy4j3ExIMoGjdW21Q13zLlGXng79nlQFI5fcVvlA+DvOjkFRg4i7i?=
 =?us-ascii?Q?3I7K/r61EK+un33ejAvwoNUOJ2YBp1NS2CDW9T75vEHqcGuHCuH9duvtOFHn?=
 =?us-ascii?Q?umFHa84ku3z4Ne4r6yxxq3aoSFsQDysgenD6A2BRcVXbiTRQijiZt5ztR3As?=
 =?us-ascii?Q?QmBKj9i/QfQvclbKCMKYY/oT+GA7TjE/hGJrWxcWr9K4o2e++p6n1QcTQqs6?=
 =?us-ascii?Q?PbsNHHRkDjbfHdoE8xRxW4Ig8Z1aRCQZmq+wO3WLSsZjKgm6c3bW6Vj8Yttp?=
 =?us-ascii?Q?LzAz9eVacOYSqLmWY2KTJL9EgAD5unmekUQMdvFW0WC/vwSxoruqkbt/V+ko?=
 =?us-ascii?Q?oRdz0E6X2AmXOVGLE51hV1HJmymB46c78x1NQVZmYFFGp8bb4OFH+i5a6BUI?=
 =?us-ascii?Q?lFESPfDl78grs+QwYyjETbH/iKYrjf5qjV2/aeLTu4+nm5xq7G+QxnwhYnN2?=
 =?us-ascii?Q?hVlyR0c2qtLN36YvuItcEI2TqnlQdO6nnmiQwYrch0G0+UkHqYbSpuQs2KPw?=
 =?us-ascii?Q?a3/Su68a/P9KR2ds6eFkwQmpll5eQmr091DymEKoEkz0+L0z07y4g/xbQO4V?=
 =?us-ascii?Q?AXoHOyYJSOS/lFoLgF8KlkFWFPJKCf73V1N5YbZbZXJEigRFkJU7hPWDhGbI?=
 =?us-ascii?Q?9ALHrvkKftLzX+jnk9rEf3AH2cBYsiDs1pHZdlc72//8z44uC0Uk1NjeK9Te?=
 =?us-ascii?Q?3c+GqSZrqludxcYhwqzemKzV3qr04moutMN3Au88ptEYorAyXAx13KPLBhLA?=
 =?us-ascii?Q?5ZdZuv8PsRoQ5Zscyy5cmUrDkCqp8wz2DGUUdDN0qzPnXP98Ol/VW5HV+BAC?=
 =?us-ascii?Q?a3txbyGWPL+qQQcbkdGuTCEQy8DACg53M2gJPQsnFSGscA0jnb2Mcc8GcWPk?=
 =?us-ascii?Q?/LW1QPsB8+cwHrd27JtArII4FrzQR6YsBUnGgOAHnkcXGyH7h3f/mXnDD6vM?=
 =?us-ascii?Q?wtQchmTtmB6qfUMz3YfOeZrs8YWnatg/jFXqVwIWP6D5LLvJVx6lV9FUwxdJ?=
 =?us-ascii?Q?tppJaYzLg67HiWqoEm03lQE71TzfhoOtclq77wN33lf5rCQ1MySxzJWeyfJF?=
 =?us-ascii?Q?sxZqj6CymxdnAMW+llI7JELKe3BavgevwnB1b2WB8YAP6Pk8IPL45N51cmxd?=
 =?us-ascii?Q?RmeEmx7fJ90Vu1AH47CKwtg3gUwE/vtc8mMRvZXb0GLt/xYtfxwniQ//qOk5?=
 =?us-ascii?Q?FrQODMe2NkomwbAcgzOCh8M7m6Go4palWXW0afxF5EaC/ajSMaxp57iErWNd?=
 =?us-ascii?Q?QKKIWQ+OpmrV+X73Rh0tSy2YXeGy/zNCFK529YD+MxGF6P9h+0U+4dT6ftRD?=
 =?us-ascii?Q?z4aOv9vp9+TDxccbI/Nf3peOpdQIyyWQnCRdQx0S1ii+u61j15LFDK48HW5t?=
 =?us-ascii?Q?3sTMunm6EOt+FJ4AlnzgU/vdM+MdRV4mMOCfymuyLUlv0uiAiLmQM+Tve0tl?=
 =?us-ascii?Q?qdh6V1w7a8LcBVa4HsDwFr67rQGfSmUIADkuVcgLl+FM9Ub9HqoZw5gPUqC7?=
 =?us-ascii?Q?+w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb71919f-d8ff-4c74-de6d-08dcd8a97207
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 12:49:05.4835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrHo/wBtR2atEr7AS+NpUDeqssxn4ghPmyy/fgRxaEMJXSJg3+ST082eoX/GbXVnzVC2f3Ss+gcR9HklzyKlFQxZwmKDo7J3qllEz+Uk6Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
X-Proofpoint-ORIG-GUID: rjeTtr9Q-Z5ZObKFhwXDqAA7GVtvO_--
X-Authority-Analysis: v=2.4 cv=d6+nygjE c=1 sm=1 tr=0 ts=66ec1dd6 cx=c_pps a=yfraj20uO1EtZH+TM7jpHA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=9kI4mcyhrz4WstpeQEkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rjeTtr9Q-Z5ZObKFhwXDqAA7GVtvO_--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_09,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=796 spamscore=0 mlxscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2408220000
 definitions=main-2409190084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 12:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204681

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, missing perl modules causes 'x86_64-pokysdk-linux-gp-display-html --help' to abort with below errors..
  - Can't locate bignum.pm in @INC (you may need to install the feature module).
  - Can't locate Math/BigInt.pm in @INC (you may need to install the Math::BigInt module)

By adding the following perl modules to RDEPENDS fixes the above errors:
  nativesdk-perl-module-bignum
  nativesdk-perl-module-bigint
  nativesdk-perl-module-math-bigint

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils_2.43.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.43.1.bb b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
index eb7c16cbc4..44cd17bc78 100644
--- a/meta/recipes-devtools/binutils/binutils_2.43.1.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
@@ -73,5 +73,9 @@ SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-al
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
 FILES:${PN}:append:class-nativesdk = " ${bindir}"
 FILES:${PN}:append:class-nativesdk = " ${libdir}/bfd-plugins"
+RDEPENDS:gprofng:class-nativesdk = " nativesdk-perl-module-bignum \
+                                     nativesdk-perl-module-bigint \
+                                     nativesdk-perl-module-math-bigint \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


