Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFE6C47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 10:11:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9702.1711102276717537575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 03:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oLqr2M27;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3811bd4ac9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42M2q3kp008241
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 10:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=wkHRfKrPcwoGokT32Yoq6qmkld4qEEjMfV1UJDZlyp0=; b=
	oLqr2M27ItKURibV3uAu9gnQcSkOTYTbIe7Opyxkduu81G93nh0OKjSjRzipR4bj
	e3sMqIkdcsfGm6fJdnQUE3ndbOzjW/ESMuQOseE9l9fuCWtfvkRoOCq97z69NZsq
	VNT2hzmEKodmxvEkU/0m5bfs4faRNf3Y20R65aaWa2xwddmQbQPw4cQHF5HO1lQl
	QJrVxyaaNrPLfZfugLK8MdH2K7aoKEfJmK57QB6xX65XESbOeLgDvJFqvI98XhNE
	k6u21ftjSe4W9leHwcWV5eH0Gkrpj/TF7KCXKQt4fdXDP/G7R78lrPFB2IbDfX2d
	m1hw+KK5zEd4Agf0IgaLpA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x10gf0ccd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 10:11:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHozHUiUG2RB8Cwr6gKUxFoKPuxNJViOK7YTlK2V0RkSpIJHU6bOFh4B7KbUyb4KvRYku0shssMb4BBgEqVtFVoLl45nLqBTq9T/dLhMY64y2JNMWkBEGeUwtipixOeOsNyLzRHlphEF4EJ66Rq/0+58GzWe0ax9RCCtQA03LLx+wwu8uXn+9DAPuuxhkoBRmOqAXu0g3SXivAFNPT9kxVQwoCkUbVibIpdM0ktQBNuoNv2Rb7agRppoUPTEmbiVWEPdzPQAK0U+wm17/jJUI57gBL2/qM3jHbGH0Cl/NmHRUgP6oiU0sMdkg77yNf7i3carEHv1kk1Dbuo3Lx8Hpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkHRfKrPcwoGokT32Yoq6qmkld4qEEjMfV1UJDZlyp0=;
 b=HMOy2s1r2TM1QHlNG8HB4TcLEIdueJiJMj1RaX/GyjNCKn1Za5JqBxi3A51G4YKGV/6/85/Q1ysKiKPVqw4WWkY+oyuYWeBVeyslekY0hGqzwMyd1nk0ZlB052Bf5LOZG/0bfXhCEcliVMZ+rxuUqBIPwDnmTfHMwDdMe9xKBiKeOcuuZDXK4OXFF2AqebqH/a2mV23xlLnv6/WZpcL9aubr6k1n+t59D1vTVQ96QPesnEZNxPkyESEqZWxv1GgUUH2gCo6zqo1h6aQhxcDCZLC4AlLWKpyKm85AtKrnS0NSeOK3is8f1aNPOOLf4Usqhz2EyxxBV6r6312OWDO/pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 10:11:14 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 10:11:14 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH 2/3] autoconf: Add missing perl modules to RDEPENDS
Date: Fri, 22 Mar 2024 03:10:52 -0700
Message-ID: <20240322101053.1397030-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322101053.1397030-1-Harish.Sadineni@windriver.com>
References: <20240322101053.1397030-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b936f6-a093-4bf3-a008-08dc4a586801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PTIAjHBRdt8yQTaekEGim/B1UBsf6YojisoJnow3KlLDXIa2E79vVU3L29v9zhnLD2+hkx3mYQm4itXNmBQPzDTGCxMXgGiH4aSkLcX0HZ5Szl76XAx9XWajjld5jhi2lOu2xj7FiVCe2MK4uwgCIp035TsPB5PW3xYcogfffUfv0As/EcpTpqJFBSjaYH/Zj+ZY56sjOXjlYZAwF6/Teq5lqhtXOqzbiAxCScFgNFldoWyqEvcuU+W4VnzaqDcV27RUsqjP2eNHf39YtZhQR+TLSGkJSH7s4FDZmidMGWnFmZiBZWfrGCq2YK0qM5nejkrCeBn+U6ZLKyfl+x+Q5ysKmg+VP7VD5eeBu61sNcniyYM4EdssUlisnD8q9Y++V9RiJ6M5JNrFXCyDjVxBdus5qewJA0Hhe6ZeEdKVHH3wOtdp0TauULPl6QAIqwvKCBFefMNhTBMycAm/EumLHmIGooXOArcOuytIjgABEDzxZnwDzR6xzUkhsLHUrfEuMdPxi8vlioITgZkGEIVchL9UENCSDp4rX69EPiIrnSurVxbPgvdhHYUpcMgt2RgdU+gYbzNiPXqU43zwF/LRPRSQRjxon+kO1XaqsOxp2yLXFACu0bjBP7XS6YmhvCowRw547EwE2OlHBhlmzEnkBfyHR+0HR9YwBG/l3uJ9bNt5uuEmG3km+F7wvb2un5kj3qVfYMhbkm2R8JWf4mEIYT1xRo5333snJwZnSpdfiO0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2xZVj5/ZBxA62YIBWaBEPIY6Ks0SIJtGeZEbIJHBGVB1+t3apMnlr7gtsOst?=
 =?us-ascii?Q?o9Sv2HDitlXe1Yaxj2KmNQ4ocI/XspSk5u2z/Kfh6wyK4GhUDTTVwBOuG/yt?=
 =?us-ascii?Q?pUNbGbhxfszd9/OvA1KMyJgiUU7LKJsGkwhvW5dM7U4FtWrdwxlM4xTOn60K?=
 =?us-ascii?Q?ZRsi8i3E9OTg3/jvd2n1mTds6xOkAyswvEtN19SnzX55Fiv2mGo65mG+aBu5?=
 =?us-ascii?Q?1fPEZoz9m7QJaYqBsI9d3LG9s/vam3OguGHxVM+D4sioFf0kOlmjTY7sGL+F?=
 =?us-ascii?Q?XlK/ODcMYgWLxWfT1o0En1dln022sCjveCA5BuKhnSlnq0iWnA8yGHgL7OfG?=
 =?us-ascii?Q?o+PTjPNdK/LQAOsDAdIRYV3cVce0C+s0rOaxCsO7RaRM4ehU16bnUj36woWS?=
 =?us-ascii?Q?VqLeQ5NdK735DQnoEjqW/dYFqwELsR8jscKZmZQ5qSGZT4cQSeTFiVyk8vT4?=
 =?us-ascii?Q?3PP9jZffpBp29cV91Er9ojXdnXYn2WtuJ4o8w8pRtgY1PxZmdCiKZXTJLcd/?=
 =?us-ascii?Q?ZjcfphSrprjhd3qhiHA49JcU8qi6n4duoT011q4t/ScayEXZpvFv0XT8ouHd?=
 =?us-ascii?Q?GtUEfo545S9oTpR1UO346ACK53HsXCvTHTyUXdsRj4zldE93YsEn5Idv5t6p?=
 =?us-ascii?Q?doEs8tWUZB6T2jKXZffJlQmQnADZiF2jRDUm61bqJklsO7xHVflqhawvdIcJ?=
 =?us-ascii?Q?hkm6H05fqYy3EtPT1oofV4uaUjRH35VYh0VGd/Z/wg7I/mtt+UfEW2yagoaz?=
 =?us-ascii?Q?MXx/Ncei4pWrNiNimWZIeC9PvtBsw3yCNsnaluRAcJYKtIx4giazogHQkoRo?=
 =?us-ascii?Q?Zpryo6GV/DXGSWFZwzjJlRE6spazXxnITpa+m5AXbH7S95EIqB3ld/SEUtgH?=
 =?us-ascii?Q?qm+E7f/JJ6/Iq0Bgkjk1JOOPEMcWpOAIpi6IS0Iu4f8Ua1opkMH7i1pJHguS?=
 =?us-ascii?Q?c8hKtzyAhg/qb9cygdRNrBdb/cffZbHD23q3RiCst3qgKPc1TjJSg5LEdeSK?=
 =?us-ascii?Q?OmrZ6+2e0lpTtB+cddjvlDLeJ+JiVzpSk0l01cN2Q5bdLhXW2+u3e6fNlJg2?=
 =?us-ascii?Q?QeV2bn0o64ly+UNoR31XiWQf+48CF8BCes2itWGIz50TcbHfEnWQz1m+/DlD?=
 =?us-ascii?Q?tRfdSc2wsvo7Dr3Ab+rRZxuSgFanYWLymMlFx4iXvHyqLZOiY0YmmxSNao+P?=
 =?us-ascii?Q?jRAvVw8Sevbfp/WQVvg3kqFEQpEecrZJwqBcrxXPAs86l6SGGwh9R15ALMPv?=
 =?us-ascii?Q?xHfujW3B40eVVWi0Fsz3UIpuJsGAuJoNqWd3Dklsvs6xCoir91VZZgTvvdXi?=
 =?us-ascii?Q?qo8Hfprkgm8MhBcgcQoJrmmtnzA6WL7Ed2DGlzQnDXyhu5jtAzIy/W0GNsuV?=
 =?us-ascii?Q?0UFFCgCSBeziOeqH9Gokc/fb5sCuw0CrXwjO7pgoYY+jnT7BbuzVb0ufOnFs?=
 =?us-ascii?Q?WpNjKnLntyhKCzxlGRT3imbmjv3pfte8jITlU/R1EgQXx677XTkCCZsarWDO?=
 =?us-ascii?Q?+HnKstbd8i+XIjpPyR1JpOu3TiUPNsKxq1L25hDdU+W7IvF5nHD46Eqi8rP4?=
 =?us-ascii?Q?KcAdnMEF509ega6OSoXu4GRbY5VdkbY3S2TqdXVcTm4n8NsfuzwJvkdmq8Ye?=
 =?us-ascii?Q?TrFqcFGA6WdWVwuOmjF71sg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b936f6-a093-4bf3-a008-08dc4a586801
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 10:11:14.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGgtrGgak1RNG6NEIZ8lheSmLbvBoNDO7JXLaxcY6L1GNOrDtLWK1Z+WG5xCM04fOkxKr46TDjUndmsW0KihCP1Y4KaB2esxIeRU2WJZdsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
X-Proofpoint-GUID: JVvoHE7-y1SSDHl3NDP3fYs08Ihqvnf3
X-Proofpoint-ORIG-GUID: JVvoHE7-y1SSDHl3NDP3fYs08Ihqvnf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_06,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 mlxlogscore=889 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 10:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197440

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, missing perl modules causes 'x86_64-wrlinuxsdk-linux-gp-display-html --help' to abort with below errors..
 - Can't locate bignum.pm in @INC (you may need to install the feature module).
 - Can't locate Math/BigInt.pm in @INC (you may need to install the Math::BigInt module)

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/autoconf/autoconf_2.72e.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72e.bb b/meta/recipes-devtools/autoconf/autoconf_2.72e.bb
index db374373cf..2a459b7cb6 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72e.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72e.bb
@@ -52,6 +52,9 @@ RDEPENDS:${PN} = "m4 gnu-config \
 		  perl-module-thread-queue \
 		  perl-module-threads \
 		  perl-module-feature \
+                  perl-module-bignum \
+                  perl-module-bigint \
+                  perl-module-math-bigint \
 		 "
 RDEPENDS:${PN}:class-native = "m4-native gnu-config-native hostperl-runtime-native"
 
-- 
2.43.0


