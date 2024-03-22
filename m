Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C64BC47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 10:09:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9373.1711102152077230081
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 03:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T12CGA0O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3811bd4ac9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42M7EaNj005746
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 03:09:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=xe2V8pSCUnL1zKP2pB
	1jIv6C6uZ052W6VZ56rPZ0Lpo=; b=T12CGA0OX2HACFY1YCvVhmNr6IfsCJjie+
	N8bcoNYGHAHuo8RGTc3eShjtFn8MpfS92scWOK15cLcWcmVOqDSqiWn34ZCno7j2
	4KP8VeR/T1GJdXo82vJXmvoXCJqmGpdmSUJFuv9T74OghiONhvYtTr/G/4pzKjC0
	9PlcW+XjxXfRBw3lX+73Wph2+gd8sCao1UUvDCqRCPQlIandZSIlbC6ZCN4Fkq7x
	zk+OzvPq13EgUDuk0E5SHgsim3SdFoNuFnmRswIjIIWsTVwt+qTTWk7+O6kOdLC9
	exJ2tdXFnZQ4wiT1GX+/2zy5L+MYM/oWjl391gFkivB0kzADvDHQ==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x105urcq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 03:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/J6JtKDELQ9Ydk4I7h7BkUC47czK833iAJwJw3YkY02KAXYSQzAE1zHlfaEePa9Ubu4cNT7rE707HkE3kb+VQcMpqKJnF1VTTwmmQ4qUeSgTWYO3Sblll+rbmx2uRGZaVNNeOeII7py4byVIScpZ3xSbqGRsum8kmNVXx6LJAEjgvxLwFCoeINP0GtWZunxwiAtKMY8zyzLNEz6RNM9blJF4neRJIult3rvqn2AUQwWkgGm5NiwL1uilisBGFqjA7XttnJjewCZSbYr5hurOhmDLQToNVZwyn/hXbrYyS9D4+tOiHoIsN7Ihi4gS30URhgvz2o34G0P01SRlm5dBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xe2V8pSCUnL1zKP2pB1jIv6C6uZ052W6VZ56rPZ0Lpo=;
 b=lkb30CeHFT70LjBiLCZG1HbJdwwb4B1Mwn2crvJG+4JT7oYC2vnhCE2l7A318FsmojNFBAwdFOEVFYVTl7v6qc5JxVYM6SxKH6tbcwnQmhUIQjjD/obVBD0wcOcP5zERal59jOfEsFju9eggf1DNb4jtu6DmChnrxqZhSxzuoPDuITlwXr2+bbdjiyzQF9HAEayU5ma37tfmp7fEWNi+KhxCHG1ZMzeIVlkJ78n8J0MrDIPsarSxiTXo/AA/vvAGYY5Alhf25RdnRwLPcY3RI2NKC4mF3UisBNhSazVENwliPQ3aB/7CPjwWuPlmPw+CtFKZMgFQcotNRkKoauriaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 10:09:08 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 10:09:08 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH] binutils: gprofng - change use of bignum to use of bignint
Date: Fri, 22 Mar 2024 03:08:45 -0700
Message-ID: <20240322100845.1394931-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: 7921e478-385c-4813-aa6d-08dc4a581ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jsocBB3003Txv92PFmiaAizczhWZ7Q9h7Dzo5RhdcX8S6fh/Jdwu/OlXx5s36Ka5kKBe2FUANGJ7YMZ60uukxA4G3PmQslAiQFAil2Z69/7gH+mEKvUy7vrfcgTQwdf1RA9vQ98yNqaXgDNFy7ySYscNzB9FgVbc/59DgoGFPK4pO+xqTL6XCA4P3PMjAap2fTFD2TDu6Muc59CZQtbzYME20rSToS1waABK9gURntesrN4QgjzllSQTux6RX5P25kMf0PNHb2S/qV9VIQvTlJ9rPzG1r7YO3YfjutFL7cN/kpIIQdV2jOZnarnwC5V1rgN4vYbj9seP0sMLNIKwXRTFZiaoEJu5a6MH1QUjB17FSQcXb8ypyV026l7l2KLcVlDbhsQ8El7HtTFPiUyPO/6MGKvEHKzORnylFuvkcPA/JnpkWwXqNha5Qi/N2NeOUOHcecwmdrv9FEGtMcqJz4UI9j2V5K+ZSxF0CMUV+S0riMQACDOOYbDBQB3iWSQ9QKArzsxZR2Lu5+iHmC0dxrXl7fSJ0Kz+acMyQ9SN4CVs8kULnIW5q3z0m9BG/xMHuHez+JFpTu5QJgR2/5h9O9u+AXrPoft3KLrUzEd39yK5fXiDwFRrEHE79j1q62XMtLttjABYO28vudLEXQyTyqYHMXfnW1CCEaWMjvMvALQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2E92MhqG2DSMVnSDEs26vmSwWh/B4vcbEJ7qTXPeMRPNURcxS18KGDJ2J03n?=
 =?us-ascii?Q?QLf1bsqBDTijK4RO/p1+B/QicYL5KJryGQy5Kaoivj+Ay9SlizR5pAefSak2?=
 =?us-ascii?Q?eBnrcjAhaqeJFv02IcQPbMp9hF0FrmQJe55Q3GaoRcr/9H4dN9pccjnAcdX1?=
 =?us-ascii?Q?tGwMjpXjbbtLQeF2Pbfscdm1uxqyCDtKy4DxyZnDqD7kpp9X3w3Dh5/9TMue?=
 =?us-ascii?Q?1SSbz096XvR1FIzfoGxDyOKudZbpIGld1CeRDiJFHHhc0tcUX0eUf1gpIvbf?=
 =?us-ascii?Q?Z+LGUJbCL7Ydxifwi6GlefNtLt4JcRfX3aW0AY0bISvDjB8/HT3AqJDcPfhg?=
 =?us-ascii?Q?UPj/q5OlYFR5knp58RZlkhRP6B7BsQ8tUaTX8ZxloKZf7npgVkli4FADNeZn?=
 =?us-ascii?Q?TEKpyfNSp4z2GubSi2cReGJQrxEYQnwkBAbN3z848fS/Alm6yPoJzOt/HZ2A?=
 =?us-ascii?Q?sr9jKuA2JOZZ9xcmOSNdYZJW8ttlqGXYLv5FNp1sEGMQbObzo5unInBmd6nz?=
 =?us-ascii?Q?/PMUgcONUPdvovdp1v8d7agzQvLUibkzhYOcKbJYvzn2ptZB/9vTgZtzb15o?=
 =?us-ascii?Q?h1NjSmEvt4C4rQWwza0CYNLT9Z8dUMH86kIuVKYReo8KtGpGP40Slj2RR/7/?=
 =?us-ascii?Q?TO8KB40ewO9TsNwpZEaY9haDe/x9NRM3yJaeesjBnxWoolbSpp+TpQL8JVI9?=
 =?us-ascii?Q?UnZJXKjiI4AHCme0B7Nvf7UpXD4YSeoDLtxkx6z3SC4TUWmFbjaE3QvcUhY1?=
 =?us-ascii?Q?6HaOP5XA3S7ZC833/5eBHEBgb8JZ6HXu79OnD0/NJNxvU5VM5Nd7x2zX30tP?=
 =?us-ascii?Q?ll18RaVyt2mPW3Quhi8oE7UENH7ITCvqboVNInvuWc8TjML/w/Qwf3GQUg8s?=
 =?us-ascii?Q?Hrm2ackKQ8WzsiQ9cyYCShScuRd1vl0xQB+eF1OeGBC2Dc3OJVF4X86728EZ?=
 =?us-ascii?Q?lcdXVKxdDePRzvq/uF0KppXfRZN09108QjMhaYy7uXvj0JfULAbIEawJK/Du?=
 =?us-ascii?Q?c5G6jxoZ0lAX04q2I0uRlFNeiDuzeExF6kFMf6Cp+hDoXB1MRqdOepFENKBZ?=
 =?us-ascii?Q?jtTL9SsdwUTQjOJr6YINWaz7GYDosLM2p3QptyFiqFWKxjdRgNO/1XZkrUMu?=
 =?us-ascii?Q?k1G0xNip5MBd6mkq0EBEqpc4a8rjtio0b97yLIk5EHNNZTnN5kIZe4KO9vwz?=
 =?us-ascii?Q?c6IOM1Y+WaXGEUwKhmIWvyi7coXuqnO5gwoxrmzmlTKZB2zfQBy3qOWuU4Uk?=
 =?us-ascii?Q?X3IVUX5ZB6UpvNZML4bGNRQPnp9BPq1Wr5TQFNC9sqsyJB6TkPu6f/DANr+d?=
 =?us-ascii?Q?I8A+KwLh5HYyRGx7bBVjKoamokS9whfTp/+EbtVOQbuXNt6kQQu10XcvHIoD?=
 =?us-ascii?Q?+82tw7c116mdVtBJotIvu7TGdzr4c5YoTkorcyhrND3oA5NZ9xO2rWph7VUA?=
 =?us-ascii?Q?Hg3sHggziwOqx3T/nnO3vfO+xCkLI/Nv5mCnKrQHjOZ3It2/b6byNq/LXW5e?=
 =?us-ascii?Q?nLyalEqLLiDqjrE01NYcPVhE3Jgx3KEGdiIFzX3M7P6OoMHBs2TtEbZnywuR?=
 =?us-ascii?Q?X9ZYs320IeO/XDZk1PmNeMa/7cLbUY/eQgATtnO14shubvEyk4K0p5bablo2?=
 =?us-ascii?Q?6O+2RQskhP3610B/d3UzSG8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7921e478-385c-4813-aa6d-08dc4a581ce2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 10:09:08.3489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hPs4rfTLDv3sx8MuL5QF7zrnzS8QmfZd0UGHet9ROWyHD4grJg3F2jKzUCXHSQvrWJv5Z4EPoCkbi2iv1xqECrIsPMS77e5P0LqmIH2luM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
X-Proofpoint-ORIG-GUID: pou00YzHNtyzRtU2iSfNzwXxXgaaIvgE
X-Proofpoint-GUID: pou00YzHNtyzRtU2iSfNzwXxXgaaIvgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_06,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 10:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197438

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, The "x86_64-pokysdk-linux-gp-display-html" fails with below error while genearting profiling html reports from test experiment file (eg., test.1.er)
Error: Undefined subroutine &bigint::hex called at .../sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-pokysdk-linux-gp-display-html line 4059, <MAP_XML> line 1.

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=3243d790ee32aa8eda69226d81b1e79dbd1dcd87]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../recipes-devtools/binutils/binutils-2.42.inc |  1 +
 ...gprofng-change-use-of-bignum-to-bigint.patch | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-gprofng-change-use-of-bignum-to-bigint.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 5fcb4292b3..3b6f47d4ce 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://0015-gprofng-change-use-of-bignum-to-bigint.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0015-gprofng-change-use-of-bignum-to-bigint.patch b/meta/recipes-devtools/binutils/binutils/0015-gprofng-change-use-of-bignum-to-bigint.patch
new file mode 100644
index 0000000000..0d3d289eba
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-gprofng-change-use-of-bignum-to-bigint.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=3243d790ee32aa8eda69226d81b1e79dbd1dcd87]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+
+diff --git a/gprofng/gp-display-html/gp-display-html.in b/gprofng/gp-display-html/gp-display-html.in
+index 6f37ca282e7..306c99a0ec3 100644
+--- a/gprofng/gp-display-html/gp-display-html.in
++++ b/gprofng/gp-display-html/gp-display-html.in
+@@ -25,7 +25,7 @@ use warnings;
+ # Disable before release
+ # use Perl::Critic;
+ 
+-use bignum;
++use bigint;
+ use List::Util qw (max);
+ use Cwd qw (abs_path cwd);
+ use File::Basename;
-- 
2.43.0


