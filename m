Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D19EC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 18:48:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41788.1782499731896473138
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 11:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NFkf6u9b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0637d125c9=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QFkZEx4078884
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 11:48:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=hdT+w0sWQ
	/i4eFg2m7Pbh2KD0gA7QxU0JUoKQKDH1f0=; b=NFkf6u9bxPt0fgJ6k2JtIKuiS
	FClRdxEben+b/0mtnywAXGoX73TuSZvUOmEgf5QzVEn0Ulnu7VXxFwmMfV0LQ4HF
	fG0n6HVnCZZgjD0Q2jUK+UtoLgmdlbbsWJ9z5JXLx3GsN2U5d7dszIhXubwSjxn3
	/rrk//3UAuIKC8IU3The67MAZHBlMf/gUjvIlVmaNR7gQKufxLTcoypCQv5NW4FI
	KDJ+WhW5eYWh6QI59YCEVKxko3kzH/AQX0HgywuTYXG0/k4zcP81MwvT05wY6qaL
	p77Kn3sl/4w1Uu7AMmhVEt+sT0FcOAKvfWEWRWTh/rUnoFkkSGVATwLfhAh6Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013018.outbound.protection.outlook.com [40.93.201.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f1ewph7cd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 11:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjza2MTDKXQ5RdSNUFevj7brrVg9doNAufGCk+agMSqhB1EO6L0ag2zCIq1YqobTEQ481MsJpc1mF7Rfnwn7pXnhQIN7k7pMj/Ssa3+BAAKthL5ydnBltQBrwn3P2ChFeHGi/VKOq4AoeDoBVt/7AGOEHmdOzLpd9z5whAPmTfK1isjCrhr0vFj0uJoKnOsx3xM8rO6JxeE8WW250Q8XShorccMNrcoyVbxSNlDCGIZL48qFqCNLe7v2/6t9pM3r0z3EXkt6SS8BpUHY2z9a1OvPqYo3MwFotKOjE+7LHfk4czFEWMg7P7d+zR0r7CJXsxsZdpQekamPtYrSpZQTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdT+w0sWQ/i4eFg2m7Pbh2KD0gA7QxU0JUoKQKDH1f0=;
 b=RLeARxqvErqWVsf3bO8m7jeabHNmHFX/wTivIAaYib9o9F8weG75QiGCyqBb4ZgEXh2Db8dlcUuxY3jOqofvZc4DOKu0aa3cFkjpGakP8JMTy12CY+PfTPUNSoCBdmJPNitNcM/Ryn00MyvFneVbq3BB381W7lUYYPlyU5MG5fI9B+uUomcMdKcrH5RAkqOHDA2VSZ738XZxikUducjFCoMCWXMgIMa0NBHEyJWF0M/OWptH8g80/vk9nBwkQHSMXKilXgrpz9mbi6ercxVPYT1UhmpjeW4F84chDmgk+hvdnYaHf3g61bc2b79sKpP1XZiwaNnR6FPwV9GAgjLFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 SN7PR11MB6776.namprd11.prod.outlook.com (2603:10b6:806:263::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Fri, 26 Jun
 2026 18:48:43 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 18:48:43 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [OE-core][PATCH v2] python3: skiptest tracemalloc_track_race
Date: Fri, 26 Jun 2026 11:48:32 -0700
Message-ID: <20260626184832.60192-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|SN7PR11MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb763c6-58df-4ab7-8510-08ded3b38bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|11063799006|6133799003|56012099006|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YojCdZ3MqKqtYPDUFdcSdu046a3KpTaMo2Ll+0/6/BnpkDCCs2TQpPE+OQAkJWFQBvJci+2lzBxV3kAbaIBGbv3gps6AzgVK81fwS3t3BqNVFC3nc9G+Vjx111nMdLRJDBrQYs1szQNTRbvFNrdvY6NZCMXjyBkEVpTSvju5S7WbkRR7Ujh/szOmq4H5ZB/Ir0st9FGELQFyaGYPDcJAZpuMVtFiUZCZX15muHXqq8jvJpALBgZNzIru36tEDy0r2IqH2gA4zq8gjdW3Uu3tpAik+hdvMkHCEbUykLaNvyNndDEgkP/WSxNNQflANW1ONf0GO88O1iB4cLaQVpHfp2/rKGsZFYJutdm8FK/J9sQzoyrpdnepsj/bnSeZ+YyHBF6RBq3bIKgXF4+jArcYlR7JHH05qNcUQtCE21ZGVaJIInTHsyyM9vwiH73dQdX4j0N1TWOVr4r0p0N4tZ7T4/v5SMaHKjtBCMuHoagp+U+pLjaANPbwdZdJEKm+TiBmEYmRCtJ/FV2u/VYj2nTWOYbQIR6nQbX0hCiPRWeTFSJXcSzQoDD0w83I/qzq96KeUDDVijW/8m0HfhP8YcoJmqeeoH5BlwUScRua/z/9nFPI2z+/NFdpYLterndewGVXtBbxN1eYuBLvz0JRYvN7zLpkDGKaBITLSBRcfXDqa/viO4XdKNrmUVICqgF3X4iOujBGG2Af2PexN+NHgjNJvHguGjG8D0j6tiSWTxeupog=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(6133799003)(56012099006)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4Mp2WyhXT1pjvfQJNkMCXkh3gHsSC1G2C3Hxj8BhsOc5n1Jg2WmOoYn8PqjA?=
 =?us-ascii?Q?mOFyd8k7hpVoKRQojvZwNziqj/Z/xrFPVE3v+AjZn7EJ2fCdHpWZe6TuZcc+?=
 =?us-ascii?Q?xNyc9Ofb6gp/k1c5BnYx0VrxJZZUKA6swAM9K690Iu3QwdMeBapZ7hJRm25F?=
 =?us-ascii?Q?n7DcVw5US4euADraX88pcofVKjNaP8C2uRVAgp9qX9m681WWmHmPQ3zUvkyE?=
 =?us-ascii?Q?wXnHwC+D2CC9z2llapL7rwtaGQjUi8siofUiIPoaaRmA06JyMLYtj4cN5S1y?=
 =?us-ascii?Q?ef2RMDxBRjRMgfg4zXoIjAz7brGDbmtPvnnMH513EEXYxtamWhQiF5DdyidT?=
 =?us-ascii?Q?ePGo2PS9D5cZ4vIvv9l14GdFKYIhULYdv/4xArx5sXGlIK+sMYOWVPcJfdHZ?=
 =?us-ascii?Q?LzwEnrYrmt2lRakAxKhWjAkt7jNn9YvD1oNGlBI3TbImkyG3yIo0nza60rhb?=
 =?us-ascii?Q?5QTuSBUMaMR0jfq9IcYRCIYzeB3k/6vQqmYN4Jpyy4d3KXgzmRA8SbMhsXxk?=
 =?us-ascii?Q?9T3+eriBgE78FIIHtjfluKMtJJAL+6pieTN0yf2cE1avtYsi6bK5/sqrCEva?=
 =?us-ascii?Q?QYkvmhMwpqOxBRVJJJ0wmvoQ5sNSN8LH28QirPiNAcLnnKwu4JXdYS1sKzX5?=
 =?us-ascii?Q?p5bbjO72bAdtRSQ/NiohVMuMeK4yuVfIAdBqzO1zVFm8GdY6WQpHu5mb4VwR?=
 =?us-ascii?Q?zfmbIrwFeJfYZI08kbleUN9xJzFXHzV9zbdMCt/7wnfnaJB2MywiN3qdAJOc?=
 =?us-ascii?Q?RfDv5SBf7ltcLHl0Fg2WQ8gyDr9s6FDqPXFnpMAHHLjD+a/cnbq6g8tgOAAa?=
 =?us-ascii?Q?Fj3GUPHjF5efrQJTl5fhHPjIkgHfrl9wXqKHHCeF0e39zTz/Z2ZcHpI7vD7n?=
 =?us-ascii?Q?0dOTh+4kcUSLU6kmZvT1NWMdkskM9R8stxBVxaXfxnqbwM4fQ4yKpvawZ/c6?=
 =?us-ascii?Q?vkzRwzOnB8o2+boT6A15Q+UMC05KpfoReMOmR0MtsU7o27+6gsYMbv/6BOBW?=
 =?us-ascii?Q?cJ6l0pY27Om88T1q3e9x5DOKNDFKNUP7lOyGLQ1/fLrUInWZGZfwSiR3euuS?=
 =?us-ascii?Q?cPNgzN2W+igbb9ubTMDNwZp41qODda23wVlJu2x0gcUiRv9P7E7tk5QA6nR3?=
 =?us-ascii?Q?+xAODlMEIDF/vF/lYT+YgtQVj2mloSslyiGccG8+Ty29U00GIwNsJ7YLrNs3?=
 =?us-ascii?Q?Qy68tL5s1etQC628RFzCl7rlmlL6Xe+gAdr1MiEZsvcqba48NXx9FlaVOqvH?=
 =?us-ascii?Q?omlLcKod81UY2LOnKu6XLrDvlFyv81hcYoB06tqQZ7JNdsaDR7wMsFYm9MvL?=
 =?us-ascii?Q?K6RfuZd5BF7O3tK7vzJsLUyjW4ES+kuKY7l87iLx9RMydX3zgEDf0R9CYBkp?=
 =?us-ascii?Q?pK1h8XKwDa5pNgENZ9YM51rq0yyshmXb8s2Hr/49TLtTKjBEC0ynE+l5AysX?=
 =?us-ascii?Q?0/MSNpFItiddNl38kMUBcjPDt5M+uN3NHWktxYzotnmFJ1P6GGzOH7p8ZKtm?=
 =?us-ascii?Q?91Kj8sa5MHtvumGtkcfmRrdqojLv3+NYvRaLmsN9sQ3VHQC81ScHNY6qww+3?=
 =?us-ascii?Q?smb1N0a2uJKgy5S/fjwA2EOgzTAKnawVoqb71lHB98Cu6HE9hme4ZcTHNXo5?=
 =?us-ascii?Q?j04m+OZp/2LE+DRW4zrzDdDTYxLC1jgB9HGPnRblHDdIFaQ+C95e1Z2tNkG9?=
 =?us-ascii?Q?hWIEA5Q70iP3x49eeUsHHHD9xtn2YUdCyEHL3cTpcvwR4Rs2Q2IHkdKNZlgm?=
 =?us-ascii?Q?bekO9QI6VBOZQyBVQlWZLQOpHhrDPog=3D?=
X-Exchange-RoutingPolicyChecked: 
	iVPur71OfQWsQN3OtZL/m1J2lMqvHh4kq18Pt6euvUt8z86Ko8S94hD0gcf2Pc7ZAF1fX4+lDgsM2c1KTk220NDvvY64li7XabohfCkxdmNuoRBsJGpYGT6D90JghvmGnofBK3/4uBdmt2YsOXAqBLQ8c1rjX4d+8Fb/o4pTGDbzWM8wbfE1qdXw/ZbGeRWggl1z0DffynUMHJF9st4jKpjWxPZPGUM4QC7R80oMQKzbz1dcS01+0rsEyBUsmHpSFxTL8rmNj+4ignX+VaG+PEt5GVfXiOL+72Y+yzniy8NZrWvyWc/6MZJulMM8navbwnxCbBytIyes77oQTnl0Mw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb763c6-58df-4ab7-8510-08ded3b38bfb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 18:48:43.6652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXDmnl/qoosPtZXiz0ijb4xFAAA+DP2jkUMnzYQvySy5AbeV315TBVCG+f4QvgnTKNuZ36jgeAhFt6JmdK8Qypa3NVmfMXT4Q9YvgmkcHls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6776
X-Proofpoint-ORIG-GUID: AIB5nEVqHq2O6p2Qven7YKpaVuTHEXFJ
X-Proofpoint-GUID: AIB5nEVqHq2O6p2Qven7YKpaVuTHEXFJ
X-Authority-Analysis: v=2.4 cv=AdSB2XXG c=1 sm=1 tr=0 ts=6a3ec993 cx=c_pps
 a=bOzAxYZ/tHfqF28wl7V57Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=mGL4Y73q8xmQy1jqaxIA:9 a=zZCYzV9kfG8A:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE1NSBTYWx0ZWRfXzHNTHDOmxuG7
 bDQo177IKjxnBWph5QrNmuNevy+xDQW9FGY5R0AwNtgAHqAKOOXV+j/1Y3kdMQc0ljub7NeqmPm
 GyTLKQV+MpphOjLGuLgWEVtfylbDo7ghYJLYLlwwMpMJqicZ0pawXyQESoOdLzTddMUIFagHVzY
 9kl0hBOg+8ScTja19RN/OPiVQ1vtWppTtE+tpRuLEv4utLM/vQsuWtXR7QTeZmsYVo5IkW8qOc4
 TCKLgZlFYb2mShWAcM7ISpzd4YRdb/a8fL/JD/9nr52twWDbwhwJr5cZ+uYgIkOiah83ia4Ud4d
 zoBEGe4BeI5usOWMjn4vEkGS46cEtLa4+e5XeWSIu5I/odgmZHfSgEj63g9mxC3PnI8SQbIWVde
 GmXffjZ1ecJ2UofoAVj9PF40L31vBVuq5If72SQ0kmFLn1p855bR/BbbUr55cTeFwM4oIyf8F35
 AkeMcLnYThfhfcxoFEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE1NSBTYWx0ZWRfX6+7OJ9PWfcdx
 nGS8/egCDfS0hx30W8FjLP/Dt8Of++9nkK0+6NO2rjU3WIFCFCN4ttbQcdJj3n5yz7UbcHUBoN6
 KI4OvKkzJvvfEp42jIznwmRwCCiQbmiPuD0KkGi9AgucpXLFtatC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 18:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239658

In python3 ptests, tracemalloc_track_race fails with a segfault.
To avoid ptest failures for now, skip the test.

Fixes [YOCTO #16182]
Upstream Issue: https://github.com/python/cpython/issues/143143

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 meta/recipes-devtools/python/python3_3.14.6.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipes-devtools/python/python3_3.14.6.bb
index 291bde70f6..6dfd22fc0f 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -309,6 +309,12 @@ SKIPPED_TESTS += " \
     --ignore test_sysconfigdata_json \
 "
 
+# Fails with segfault
+# Bugzilla YP 16182 (test_tracemalloc_track_race)
+SKIPPED_TESTS += " \
+    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
+"
+
 SKIPPED_TESTS:append:libc-musl = " \
     -x test__locale \
     -x test_c_locale_coercion \
-- 
2.49.0


