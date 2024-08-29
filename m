Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20059C8300F
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 08:34:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7961.1724920467856604836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 01:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9971dbebdd=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T5oghg027191
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 08:34:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 419pw1hs52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 08:34:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7UGS388sf1D4FjXsLzexOzkSL+y4aErrMcgQz/DSTIXUgeaAWlQEJbl7l8pNXTZcA/s4NSLUBvL9N+sYylCKfOxi9A9w58UEkqPCikwhfFTf13KXWrZsDGiaJ1hT/D8DQps2C2hLjrMipzpBVHTv0q3PYJG7AtDgO38TgBis7C+mj0nSUm+uomfOUEGKWSPedaL1d8cxkyHtR//2m5wWWZjgxh67HeHjOIuvGBQJdHSjAOQXAUgEWZl7OBTnLb6mI0ym5GvnXuLd+wnNHZe9D5JdjTE2zT6L74fAsdOxtHSeNf6XRbFmHxzuay71xYZQ1j9mjJqoJ4z/af8+T7SPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lywQCnwtN5i0GrZsjsC9JzNPVmqNFvhvCOfqC+CAi2E=;
 b=bpksW0eh5kXnXHDhV+LVKyYX8UHgerdcpOJxXHQmjrCXTSoYPRP8sXJofMQxWJwbJ3C2sQgJghOBqIki5PH5RW8xxNyWYACcaxvmiiQVhfX7y4ob59GXlzgKiWISKvXVPzRtSKjJsfn2mw34maXXJqT9IJgXGMnGaTGmK3VpHqxFZJiUvNLx8W4IudlUxiJsJ6JQ1rVTXh4CzvDN7ImGh2u96E1tu5leuJImQP8O99wKCV0liVsR1NUgentWFaWzmVRdmF2Bhz/GiH7hZRY92tFXXsnnti7r1KjYIQMiERT+wMzN9M52H9pQ+jYjAz2WKLBokXh/N6F0skP//Gdzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CY5PR11MB6488.namprd11.prod.outlook.com (2603:10b6:930:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 08:34:24 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.7918.019; Thu, 29 Aug 2024
 08:34:24 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH v2 3/3] zlib: Enable PIE for native builds
Date: Thu, 29 Aug 2024 01:33:56 -0700
Message-ID: <20240829083358.1277849-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829083358.1277849-1-Yash.Shinde@windriver.com>
References: <20240829083358.1277849-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CY5PR11MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: ed4620e0-06c3-44c5-59db-08dcc805632d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gkydsl8/RHjj15ayI0GrLpOmi/s4KZbAfWxBvfqieW+tlRKiRY6EBtNtR7eQ?=
 =?us-ascii?Q?OXSffvCNXzlywBp1p7FZZnaGDtS0LA6gAI20DL+bq3IokxHVIk9AP/w7YvIS?=
 =?us-ascii?Q?vLr31z0Gd2KYK1/nmVExNf4nMNhXpnrYBxiPbgzCih0B3Hj2OlSXs0IIYggH?=
 =?us-ascii?Q?JTjKC3StpQBDqi6g1oQG4+a22z3jE0fY+Juh3UlOY/B6NKiwsbWn8PyjZF2v?=
 =?us-ascii?Q?7EK6Sv+PiCuCRGBR4fyl6EfjaPcZ62Ie+ajAs+xCPJ+YoCAEktIk1BsV2gvN?=
 =?us-ascii?Q?BkncaCeDs8sx9x1c05nfwLwLZnnJ1i7t+0bxYSfCI+3asR+gcQFaF65muKTX?=
 =?us-ascii?Q?T52xP2ECHEOEszOtfE8juWf57lQjh3dFLIjXDJ5SiYwMOmJ72odU7jElFHXL?=
 =?us-ascii?Q?sK0zZ4znN42YfH0YmgCRNKySF7vAAk7MzRVZuxxAuxJ9iUHpA5AjlAPzU/Z1?=
 =?us-ascii?Q?yga0KUTe56rPK7WJuqd1OBCdpnfuZ4EY2suILp1CHO4M2TTIk/lF0QepJMnH?=
 =?us-ascii?Q?UhXGvttPqBP/W1XktBpKc6wQ16/33F6OtGHqUyLRbFXjl0H2GZ/NVL+eR0bF?=
 =?us-ascii?Q?9NaszXmRtrjNJR2cEffhv4etSCxkm5GQV4P2GlzthFiuMYHmtWMvGnPPA3F5?=
 =?us-ascii?Q?xy+XwXY5fnlxZ7bbv/vOHrl4xOKtyyPyVlKn7KY+Fq+UIbj93SB2hxJaHHDP?=
 =?us-ascii?Q?+Xnn5maqJBXCVZWm17cSmoX6wBWqaPj5TD733qFCtQ/ha+hjD0iQMW67yaPx?=
 =?us-ascii?Q?ZsmaO/Xn3PxQJlFsa02yOW3A+AKBwl1u8KLCOkIw3tM14aLVHVitF+HscgiX?=
 =?us-ascii?Q?cTXrW6ItTgW5fi6202oDZKqNkQjS4aD9CyJ0xgta9HQRPArcx1gX4n66xfFC?=
 =?us-ascii?Q?YbCB0QgfdKrIKX9yOS0GHevKcEm3xW2cy2X5eIXoywhXsSkHb3giBWGeOu3J?=
 =?us-ascii?Q?HH3H20J72wul1Qh0RALCLJL+lfmDSmh69IkBYTgi37o7zKsKix5Vvwt1kDeC?=
 =?us-ascii?Q?T7zIFMYVNJ5iAK2ObpnUC9zPC2Hpz4XT6K5wwHV0XkfAZeZhCS1LjFt+rQmr?=
 =?us-ascii?Q?VF7K1hBtgmGPkIPEUm86r4vrFxMmKkAsDNRcEDxk8H6Skr9EQmLuYxTaOW3t?=
 =?us-ascii?Q?/72NBgkGES0auwsbITLp9xqzhabqnJVeUpm4fo7d9du0d6+m3a0IKsCCmTEx?=
 =?us-ascii?Q?HUJWk6KJtaCFB2pY/cXgFKDDpxR/BjdMwn/k8DmpnYjzyGk+we7HApEVFGAw?=
 =?us-ascii?Q?fTsoaV1qtSWxSIFprUrIewCJSNMqgOPP4GXgkM2//z0Q0FAE3huSR/3dFGVX?=
 =?us-ascii?Q?lD1BlWpS8UZhP+gWN5B83f42ipRKhbXphPJouDwGVT6bqzf+8AuDHxeWSdUr?=
 =?us-ascii?Q?QZtVuQQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K0LIu9Jh/2Y2Cp1ns3Er2CJsjruU5Pkp9AeRjPolI0n4eZn37UJ0LLMnleUX?=
 =?us-ascii?Q?Aqkc/ooiZaWWlmgLsU0R9V4hKGXd+oHwLIwiluU3XAtro7J1Y3JzkOtFJvrz?=
 =?us-ascii?Q?LbFgsfJtkCo7FK+ExesAxmLBAELqQLj6whvPBXFI4VwpTxixvOsAKlmS2eSW?=
 =?us-ascii?Q?D/egT23WWcWapdtIbi7DpjJze8eLaqXbQiDOexj41Rtey2dka6oqtFPdn1sd?=
 =?us-ascii?Q?92wPixtbeyPtWGQieQyl7MP5LeebwG+JY5DYIoRCwdOPWiQm9nTsVg0iPCvJ?=
 =?us-ascii?Q?X9scLHEogizuGAtDvGE2RL0sZJrNcunMom2Govsh39lxkv/XR/bnFvv+nKEB?=
 =?us-ascii?Q?xdSy93wYtPz04O9kws5TtaTllbG5gdAO9mqC4AvuSWAh+fiAFwOIbvlJFbDR?=
 =?us-ascii?Q?a9ix+IoOxA8Hjo8P64hEtRkfthW3qqP06oSDEkdh41MSIsncBetlVVnVNTVR?=
 =?us-ascii?Q?t5kEI+xohFqce8XcLtOae7TpRSnzEHfTkLT1lyGMwnT6m/SDwhkErw3dHAVA?=
 =?us-ascii?Q?LDPWhJclJr2DSA+m+99icM8VCvQcNGus873RkJPGHiXtlbVKozeauGgj/Kh/?=
 =?us-ascii?Q?pfUN/sQlA1Eidf+QrMIXiye9PZL1WpN9GKyl3bDQ+6xP0nCbEuq7q4FMSzpq?=
 =?us-ascii?Q?7INJq15RL2B2wlPTi/jyW84YKMtpEjRNrgxxvIUVvkxjeXTAontishRbmB+P?=
 =?us-ascii?Q?sWvm1rueP7VzJSuonr3FMY4t2zXnGSTpekwMOse3fPjFxwym/Nt5O1X11gAy?=
 =?us-ascii?Q?b24How/MXzSZGUwmq5IQekpmVQ/+TNd0Xq3WdX9O6NswxFrbwURjT6daefsj?=
 =?us-ascii?Q?k9cnqFEEWjLqsX6AWn/KvRyberMD4Oab7rR2GC8iv7lo5lVos5Os/NsZcgGj?=
 =?us-ascii?Q?eGX1NAZA9nKHB7XtMPWGMkWxKVvY7iKlxuHxveq2bFG94yPzM2xmdkpU3cBH?=
 =?us-ascii?Q?s/pYCKNoXmYZKO3Jhb/nuBykk7/yPOJ+WNVh5cGqFvV8XIBqf1GVAA9mW8di?=
 =?us-ascii?Q?eCj8PwfXvaqNAY6DixBMwOerHKa3OWxKakdI2lgfn8033BLrJxq8IbAj1Lqo?=
 =?us-ascii?Q?n51BlF81ZMuX++zlo3zCAsjh9gMabjt0u4MuDoWUTmYLnRhw3k+uYW/UeVTk?=
 =?us-ascii?Q?SnrCaq71GJVoBNpb9yMwxkxZb8agD7gMfTrpMMYjoIq+rBOf6FrWALwg3evv?=
 =?us-ascii?Q?9y7NK8JEOWaOugTwAQhGGE4zHE/5PodIIfi0DGLxM75gREea0JrBz76DtWR4?=
 =?us-ascii?Q?zrKYYHyy6po0f+9UXyulAHADt5UUEwj/NY58Z+F01MYL7CJcYftzKJPtrpL/?=
 =?us-ascii?Q?6uKv+bcWIVkplV7MbCfnJbvYHuKrsLsDtsTFuu27ojVYgW2jW4xsYyczumob?=
 =?us-ascii?Q?tXKgz2nSw0u6lWPGwKyckgNhqPKV5If5BS6sIryF4mVAPRgL+8xLgtVI0Dqg?=
 =?us-ascii?Q?UBjP8H+EkQrrE0b7MVxM3/tvENtd4QSDm7JnaxG9u3VQQR6RL1bw2gsqVJbY?=
 =?us-ascii?Q?LPls2zFSLeVV1bAUhvBwcWMI8t63tOB0u79+Vww/7Qceoe5WiKOsj9CM5RE1?=
 =?us-ascii?Q?2wOLuPj+PZS5fFEcwik6jAIWAxwY0RsJ0/eOvqTdoRlI5SJ2SII3M0JyT7Hm?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4620e0-06c3-44c5-59db-08dcc805632d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 08:34:24.5612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3A7zdgVMd0BCzYdDNPdAsXqRO3QkYJ2BeNRsc6m0/QfI3YZKg5x2wuOXzsciDEFszchaNaZdC5AJbNMEwT/6tqm6JzxtHbGm+Brhg8wJBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6488
X-Authority-Analysis: v=2.4 cv=LP40Q4W9 c=1 sm=1 tr=0 ts=66d03292 cx=c_pps a=O5U4z+bWMBJw47+h9fOlNw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8 a=fXms6y0vAAAA:8
 a=VLjez1e5HMl46yPGfmAA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=c6Zb8eaUoX5VaqycxFvw:22
X-Proofpoint-ORIG-GUID: vumda1XZVD3lpGCosFuG9hmW5q-zJRa_
X-Proofpoint-GUID: vumda1XZVD3lpGCosFuG9hmW5q-zJRa_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 mlxlogscore=795 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408290063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 08:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203903

From: Yash Shinde <Yash.Shinde@windriver.com>

The zlib crate in rust uses libz.a which comes from the zlib-native build.
Some distros like alma9, fedora etc. do not have PIE enabled by default for system compiler.

This leads to target-rust-ccld linking error for cargo-native as (line no 22936):
error: linking with `/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-native/1.79.0/wrapper/target-rust-ccld` failed: exit status: 1

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/9385/steps/13/logs/stdio

Hence, enable PIE option to CFLAGS for native builds.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-core/zlib/zlib_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index 486431dfff..e62c50c5df 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b
 # to PREMIRRORS so it is also searched automatically.
 PREMIRRORS:append = " https://zlib.net/ https://zlib.net/fossils/"
 
-CFLAGS += "-D_REENTRANT"
+CFLAGS += "-D_REENTRANT -fPIE"
 
 RDEPENDS:${PN}-ptest += "make"
 
-- 
2.43.0


