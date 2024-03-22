Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2C3C54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 10:11:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9411.1711102278470730372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 03:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FDTR3oQt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3811bd4ac9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42M8maSW023338
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 10:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=xe2V8pSCUnL1zKP2pB1jIv6C6uZ052W6VZ56rPZ0Lpo=; b=
	FDTR3oQtPwNugeYI0z/5Dm5MspnqpMZADB0/t0iyUo7E4HwrUriNqMnOrh6xVrm/
	O8DoYhp2wF5I654FUfV/MWBii+x4QWYEBBKeny303HFPU95AlDlSuUGyqTkkBFM+
	zW1+psGbtCnplTC3yR1mHV1Udonyh06HpVsrLYg+afCn1oW6IrhmkvJsEJc+UD3N
	pked/GaUHI7uHnVQFf1bK0CnY0uxzDhmnJ6J9xkH/5JhxpbPUFCNS/q949TnXWXQ
	Huuq0GURcWxr54XE+oTDTLuMmv0s4/Fh/SjROMr9fFuNGx9GoZG/loa53/Najrgv
	IFtqbaXRBI2ernqxUcIzjQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x100xrddp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 10:11:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5WQePyQyThROeaqjo85/L/xv9rLZwAW9M4PxgwqMLR9AKzolPwb/K57lYGtTTH/PrDeL36buA1PKWYp6BAlOQmQeX6JEF3jLZS+NltJiOpskRV3M3O9jZuDmYc2yYfnH4wNi/P6z5fXHtaMoXg/GtkxHgyGoBFedk6859Mto+FMRWn/+WpJX+8G/NmiVwwKlqWfDYGtDa1s14LJg/gZS/aPAE1Pix3nYDNa/azjkse+fjTacib2lVPW3YF9PhpBTrbFE/9l4a63DW0W08ir1RFfXS/L9Dk0CkUPJyVY9hjLNnxnc4P3trRSeM1/peIFL0r6rDbN1agewSWv+kcECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xe2V8pSCUnL1zKP2pB1jIv6C6uZ052W6VZ56rPZ0Lpo=;
 b=SDfKQe+Fh3fZEZ38WUxXyOucB4I7SqIkRslpNVHg1nypi8nAzwIKASEBdaKBybXxSiiaA1l4objmkvo10xCP3ajNF7r8PNc6dBt9N/VuudTgFUdIxXsjP49WDt5RIylFxXsq6kQR34eFZ5qiXXFn7ioq/JyPHbHgAecB7srYvoqnt9PGuYnjUPjb/XFhH2/jYJS+7Z7GhG0GGeBcs1F7GFrhTdOdmgEF5D6tjmp1Q0c6mjLvodtmK2tCYpXcnKz7RA2kC5V2wukkAqxNBbuJyEwsnU/jDaOUb4Ez6mu62EqtPYm+/thXrqp85U0uVpThKz5kynckBaiLqy+1RL9VJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 10:11:16 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 10:11:16 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH 3/3] binutils: gprofng - change use of bignum to use of bignint
Date: Fri, 22 Mar 2024 03:10:53 -0700
Message-ID: <20240322101053.1397030-3-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 55f4c4bb-497a-4bcf-f697-08dc4a586912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m+yPepD1buaJ+/FfncKpulG36DtncdCOzXxNvDjmc8WFq2ekmMUF0qXAABz7kmpF32T8koYc43ULVtJlLd/P9h1f+BpG4igea/B0VyE1+KbTAr106ug6d9NAn607TdxDRkL7WYB9OxaivPCNFxmTPWS31t4Wj+HD6P/erkPajrU8ptCrRXdBDL5em0tSvyJgUnA+boMY7O2GWy/wtL9FLrFNlz7quNAT7PFqQmAOK+kZMd+Z4jjjhp5ooSRQXn/EraDtyLFRYYJuCp5VzW8L4oZDlqvXyIvKBRHi5DNLkO0iOP0eeHuePqWYWPCuqUtsO4xKvyMUVs8O4DwojN64ngdc3vEO3csQDhupZe3R0UbtyZl/ICQJY9fcPDvfFBwOBFD+usjxPnlEm6rs8amDhluuqvRZATL97T5x7wPa6nXdCs8XOJhsQhP1oWNluV6ryWkl2mPsqvk813QH+kcIrj9BKdqEI5/edT+O1DEqbbYVlG84ba1h2ZPqNMdNdMkeB0rJDFF0eHL0we4xq11b7lgjtZ2sLqV/bOAqhGXliaHWbW1O/wvs3Q2poumKj7R6vAWs2d9Ob6Dx80QuFZhuEKM6LTdf3rSiwM4e+1yBjKv9nRcCWZSuk7RiV3CibDbO+NEatApf7X4s9JJeJxOjNLolGQ7n3Pq4NrtkNIF6Gks=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?624woVsLfqQfolzFfYzCl848fpPpxJmOzZGyn27DcdkGDn6ETwYXkIJZzxIJ?=
 =?us-ascii?Q?H97X6JRf11eBsH/cqFsie+od7qxlIgdO5gw26xGDWCk9El6uC44tLtjOuxGv?=
 =?us-ascii?Q?A27MWZxzpIzNYTmdVPyXZzgn9BljliIESwvf8VCXYksAqai/AqNT0K+O1yfb?=
 =?us-ascii?Q?xgwQ1OtE6yEPGjyM4E5L28DAUT0bPzAuLSBiGvw2WxMm50o4tFgA/2IPc0kl?=
 =?us-ascii?Q?eFHliFRgpgGihR07K1OZVsvmP+o+oN2NNqpgY79Bt1+T88oaOFqKGSVUn6ye?=
 =?us-ascii?Q?vVJnp8wKsgkyr2VKm0FvnwH+gS/58rpeho5Gl+qvbWkeTV9TSYbRphchARWS?=
 =?us-ascii?Q?kh2/Fzly4jHDTppBc7Bf4IIT7nnNoElZwtKskkCZzLLwHLXZDrMYHw3Jq8av?=
 =?us-ascii?Q?Ue2aSPzxzwYpFPc5kbyBGaA9ZxUdegNh3B1LizVM/DGA76Vf1/8MD3fZNpOm?=
 =?us-ascii?Q?5A+3gtSujvbdS3YHs96Cc9UuQeGgY9jYSkhdCFWQc0ZR3T2gudHy9EzE/xex?=
 =?us-ascii?Q?67zSYDcqgKPRc7kVaHdP0S5hQLvRuUj8fgftYBGyPfojHLejg0CLLDA+VQCQ?=
 =?us-ascii?Q?0xiRsNOb2ZmC0dBcqSPmuPw0mbCVztJIKENT8SHWNHYctSQexKeZIqzyC+pd?=
 =?us-ascii?Q?kMHcJEFrLiJiWgR5ZEhPQw5NxYUdkUc6fjeb7x3ZhUbJA1wlFCgRnARAS7tU?=
 =?us-ascii?Q?34BWix3Vf1kAfdja4Ye32yAGPOaYwPmSrlRwFkhcs365RHJOTwvEBrP1nwpw?=
 =?us-ascii?Q?pYCGDNhKrjwHJ9U5ZA5MVdjRAOiPNgiQVKZkL0C9/wLYDoFrCGcpYjXgJUDB?=
 =?us-ascii?Q?0f0V25O1XeFge7qffFSikyjPY5CoxEBYZBSmghgyE2txTXSrV//3YezRtPXO?=
 =?us-ascii?Q?+MLaE6rVwdKimG0pycrJrkLXTxpyBWVYEm36C5GkyQxfHwSDGQ5FCqHFPvk5?=
 =?us-ascii?Q?67ZXMHDOofUgqJjxkqtYWGLz8eaLtUXF3NYmDuVSwscGcLx4/Fo2eM6ZIkBW?=
 =?us-ascii?Q?kg8UA4zOCjXwORNVIZhB4oqfJVVW8hrV08W2hlLWR7wyQosloIr96WLUZ5CB?=
 =?us-ascii?Q?rMM3oz2L92nrvQaj+NgjJQVtSjYgCrvsM8Ol0nnkGbfFoljbTeA3m5Pk3Or5?=
 =?us-ascii?Q?CAy89lM7lKFzNTzscSdQ2gDDkPwCST5cF1XzRvOS51woLDzxfdYfTCwj81uJ?=
 =?us-ascii?Q?2meIpZZ3T82a0JBZv5QIAr5LU7pOlCAp+SRyCe6ylFRLv/BCUgl3AaB2P01x?=
 =?us-ascii?Q?6HcVQ9rJdRa61jdDqClbhXhA6D8Wydk6WVqO0rAf41bBJXNciwU/DAGN9cfE?=
 =?us-ascii?Q?cOkjhrY8p3JT9PSxHGTMZyCPzFEfSzzxiS4XJpsvIcaenIPijo3lzorW7wP/?=
 =?us-ascii?Q?P7xS2xEcMYFQihLmlrbPHXNxKDT1nvrm/9XvFzGVT41vKIKRRgmMaQ25atGG?=
 =?us-ascii?Q?cnqKHsJWmWMsnndKfoC8cKJbc80vuD0hIpQbkjCU5XV9Xcqa+plvtsOQbocV?=
 =?us-ascii?Q?EJpK6OvQpFkoSMqzS+r/7/wMZPNWIj0DqYYYnsF99IGMcITpoutFXInn/7Se?=
 =?us-ascii?Q?dB3BGyz6rvTBUpOeB2XyddS0d9RpqtnwbXwTYLoBxQTIv8ZZRsdhlDM3HjX4?=
 =?us-ascii?Q?1vXw02eC0Ea+ll/EZ+pwAp0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f4c4bb-497a-4bcf-f697-08dc4a586912
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 10:11:16.0997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuel9dgTFPoDKwcnta1oyzQJVSJHmtVm65jSLER5GVjcxrO/qbB0jCbNBeWpxVT8pfcH7RJKetMDhClySgoEwtiLar3+l2i25gOgQbkjMEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
X-Proofpoint-ORIG-GUID: KSLlJd-fdwOgB1e1oDw0vEOdPqq9FWuk
X-Proofpoint-GUID: KSLlJd-fdwOgB1e1oDw0vEOdPqq9FWuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_06,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 mlxscore=0 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 10:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197441

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


