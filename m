Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EE4C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 09:03:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2911.1749114235940211968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 02:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=825103f517=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5554jVkv009509
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 02:03:55 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rus9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 02:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsp9rnaiRLV9x25/lP71djlxZjPFmTYi52S5JIfeAIq8RJtFvtQt2+1PeEhcddFPqbitJNj0lu6IG6bBMjEg7GROgriwt2Al7GDA0xwDOMcn0bNz1CFe/PlrKWiX7IMzzFZInT6UQY4f6vtnt+T18pQ0E05SnH/NdgvcO3G3b8G0+38B+lXeb4IEvm4Pc8f+OlBvXcUJLSMh+J7aglImcTDiZYphao5kUZK9kQ0noBW3O4cTHR4bMJmUaEPbwmFT60+6HZTIqYLS5r+KY3voQPw9DCSnDBQ+yYcYKG6BOZfpbjT8cpCkWrDlktB1jq4uW/LVkdrZvk6xDuT1CrVW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUKkgtGR050SQmmFxIQPvLUlyzgfhNNpjsz+jNFm0kY=;
 b=sUmJvhFa5cvYuI5FPUKuJHbYB8AsG8NjD+av8cuz/Ryfl2IgpFinqY4j5lQRfsDocTnmVHgUpYYTxud5LTmh/DsSnKmLynqAwHn8FAv6VUrCaOH5X38BnotJ+RKea1ADvjN2aY7/WRQxOVHSOf1tudVx46jxXMuMCosHlbLQ0HdIAsKYxpAHwyXiTcYpBCUvfoQLDkUNeErmYXt4Crh5Wr3DcfFGkDCE6AX9gR+tTIJpgNgORCQQHhCdzjxvTUpbqCwfaJnKsaevZ42M+n8Yusxb2Udo2mEC+9ThiesZA8mi4t+Hh3pZJKXZgD/Vjb7dQjmEB6pS3cFQU13Emuvxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Thu, 5 Jun
 2025 09:03:52 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8813.021; Thu, 5 Jun 2025
 09:03:52 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] binutils: add CVE-2025-1182 patch file to SRC_URI
Date: Thu,  5 Jun 2025 02:03:14 -0700
Message-ID: <20250605090314.1115267-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0182.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::7) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d96d475-bc0f-47c8-5ea6-08dda40fe479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1aCdrMV3T8Rx5dORpznA20PRhK7RJ8gok0B6ibQb+0Cx3LLClirhPd/YfFga?=
 =?us-ascii?Q?NlnKMdUOE7D4C/4iA1TuAq/GGi4XZ6UNetVAgAkuoBY3SlhTkjc9KmT0ZGau?=
 =?us-ascii?Q?RoY6Ykvh/2V7K/xsHIXTrbJ9Ggys4vLMGMlxtJo1vMiVmV4r4lYZFrw2WyNQ?=
 =?us-ascii?Q?FeWA+0BVyjH4SiUA+BkUb8JSijJbXc6+XnUB78FDZWo606yqjLOnBnTp8I0E?=
 =?us-ascii?Q?HEQPVP4lRwQlCDHpf3SV3rpLD7e7ncRMFGML+FN/gyoX4Jslogj/sPjbkUIy?=
 =?us-ascii?Q?fX2e9NjfI2EDWsGT9/CD/Dkyl6508GMVR60E+wgVyEVVv+njxGSBY3obRr3Q?=
 =?us-ascii?Q?X99WSaI7eP7FdGMqpFeyTOqks34X1ywx0pNklZPwhhnNFYub9JdJhYN6V3B3?=
 =?us-ascii?Q?CBAfrxhMVIe0H7aaSqeBTmZvf2ikf2o02x8sPGrLYq/eKvRMhh9Eo2pP4Y/G?=
 =?us-ascii?Q?sacdxg7eMQlf3fa5s7lVffNiJ2Br4gvGF7NjY9uOMs3/IxDJOo+KsVzTCpb0?=
 =?us-ascii?Q?lSGAnrbUFvV6y9oGdMO1VKVH34/O59+XAyyuHFE1CCniNqOeIB1PZEVf0+Fn?=
 =?us-ascii?Q?UNX8H79pNGfn/2hj8LTHqnc36Jt28eei2GERvjn3CxD2AcsucB51cMReOKx2?=
 =?us-ascii?Q?Fow+EsygShzG4Og3iz/uGipjGEIjA0tQESeNEDWZN7E/G5qSsvP67iaRZ+D/?=
 =?us-ascii?Q?qC0qljImK5XQzOhkJsCjL26gozrzm2Ba8v4RTibYGK8aBXphz9Di8gZe5lP5?=
 =?us-ascii?Q?C74NWyUtuI+/RFpVA9bnwZQa3xZ+DFEScRZ+jPIOFBZWL1lchp4NYz5zz+T4?=
 =?us-ascii?Q?TnRAD+vi1lxXhUlyEZGZ37erUWfTRunCRC9D8EWbWULOGaWzg/bpzEFm87qY?=
 =?us-ascii?Q?zxY1dSfFiwGZ8nvYrJRZxt144cPzsJXWLp+rIzmJlx+6Fn01Gu+jJQ3xroJY?=
 =?us-ascii?Q?CDi4aE2rcuqmFFsIkyxEzZrlf6wIPX2gwLjoCEEhzsxfX3uVF98E8yANyfUa?=
 =?us-ascii?Q?tUb+KovRlpvBq0R42tmdo7DmSxaVyTPLvdY9Xnn7Xvo7N1+77MjhORxwB5+E?=
 =?us-ascii?Q?bekmR1NYM1KAcWR989GBK0ErdGgX5epu9oZYMArjH/XivE0hd/Bk7w0JblpR?=
 =?us-ascii?Q?9LBKncDV0NrrIHMRrmf57pxVr6yuANI/Mr0L9z7D2nSitnuxZ0AwZce7Hcpq?=
 =?us-ascii?Q?X5orV6mHMqbPlH51av5v1EZbYtFAktdzDmE0YxaJb8G+XbxESpMYuQTJvbOO?=
 =?us-ascii?Q?rFzsIn8pm01VnxUGcHX9nMvbtn3FmJgoPA+wg11GhRgJ9TnF6G7URuLHqYNi?=
 =?us-ascii?Q?vCl5AzEIY72X2HDzdGcfzrPs0KQfqd0I7sMDzALttY19lf22G+pS3iWK//3t?=
 =?us-ascii?Q?qBD7NNDAavW1OwstGis8grUe82hMQzbkQa/KAhOSp61R3u2/wH7045UOyGxX?=
 =?us-ascii?Q?yTG9vWGWciQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R0gRHZWGMMCp4XsFVKis4DD5acu8nEYaOSulf1a8qaqN3SfTelL2FnBDjXd3?=
 =?us-ascii?Q?wSbaFrfLhJaXXSHEuQzU2zPwbwh2CLJWKzOcs9CRi08MVAspg6xigBysVBkj?=
 =?us-ascii?Q?e4l+kH7PqP6mXZ86tVU5sKF0jtCZ541NhTKKQJJKuwPk1VFFxQRYzGSFuvJd?=
 =?us-ascii?Q?mglqaTZU2LAqXvHzZEVpuAmUUvgJ88zycK+0Mt52is0DbJs5O0p7BxfkPopu?=
 =?us-ascii?Q?rJTU7o3JLiCuqWli8ZjAaxKXb+TDZ+61XqnQpXYhV6daStRgLFMm4B9K/d1l?=
 =?us-ascii?Q?U02VPLX33/0SzjW+MW+jWsN2an0Eua27J7ad2fRXVbJezzm8QRLIbp+TuRbn?=
 =?us-ascii?Q?zOsXvu1bpyaIokc3T2NRvsvLdDn1gP9glsTbUKB14tTFn1uZ+R5NZCDSuQr1?=
 =?us-ascii?Q?U8jhOaqFPCz21aWxnVGFjKeytz4XZVjZdKlz/5f8uj9pztPKpL4ELCmH5O5R?=
 =?us-ascii?Q?StKghdlsy7gf8h83qxNikqkM9opLYfdZ62qvN0Vhg+tTHZVGD6bQORa2PaS7?=
 =?us-ascii?Q?J4s3grtYGd0Uv/2WCB73ecRR+fEJ91RonlQNb5Gq3DDipU9NU63BHJCK24K2?=
 =?us-ascii?Q?IvR6rLxb2H+vPmrzYGq4tfFWylVg/Fa3w4kJOSDSnl0qgsKWIdljJowC9zx8?=
 =?us-ascii?Q?h+F92aWCLz/BqMaA2F5cVk+bWESR7LQCvnSorycciEl4TfGnMQ7vhzFlU+98?=
 =?us-ascii?Q?+pEgKK4QdTOq8wF5lZ6cKlXRhbCKUCLLSdLHZTKDokY7zIK2Xf94fOQoPoLW?=
 =?us-ascii?Q?tg+lp9xA6mT2F7pGVN19/BZjzNliox1trtt0vyuMR9kzTMtT4I9KaG+RWIbb?=
 =?us-ascii?Q?h6wLFUKVVPFAgOZnaTu+uDyVj62far/1BK58l6+l6dZl8P7D8/KFy4cm3UsV?=
 =?us-ascii?Q?1CRnP+KAXaEjtmPyr8/zkjS6xabsOLFzEyc3eWxDP4Y1rOoujgT2WO7M4pAq?=
 =?us-ascii?Q?JCen5RG88bcL394UfRKnb4I3yfwCAnwzxncSwEjt0fLaWZipNS+tEdFJV6ol?=
 =?us-ascii?Q?4SnvPw84XErJgQGhtvRoQ4/ue77HT1fotBC5PNorpdNBfilwyp4VWi4ip6KA?=
 =?us-ascii?Q?pQCtzjyoYSHbfnfLa0u/HnkdDmh5SdJGhwSyEXpk45DeE29sVBCDQ/3EmJun?=
 =?us-ascii?Q?fR3IQW2KxbA6vVV1KEGQFnmp3O181Ux36lrDcV8plnJWlx/CsGWn/hulN6HL?=
 =?us-ascii?Q?ET6pk5mUuGAgn6Ci9ZmyKMqqvhCYPrbe+w9pD5EN832IOazhRJai0BsysfOg?=
 =?us-ascii?Q?j+Ecwz9XR+1Ms5XRSyQy7SukEsnJv/050bKu/rPBFyPSaEuiUBLTTbB9sJXN?=
 =?us-ascii?Q?kOCAq4pTn64cdyJPZbxW/rqi/I/AgPfEvNDvWFDUn1wQZihSa/zciCbyusYQ?=
 =?us-ascii?Q?g3n+LpXT4lgMyzrheNpGt9cVNYWbewhx7AbMLTPoXcYj6W5p42LGLcAGs54d?=
 =?us-ascii?Q?eWGQ91zvifhzOSJRx37rP3RKpjb42OXn8kYs98nqPjmGtAzqGF0cJpH18xTA?=
 =?us-ascii?Q?6G+rh96s8Xs/Q4DDySPGaCKpFcCgHzq68CQaKNF1Oi/b3IUV7zcfL1T7DIp4?=
 =?us-ascii?Q?BzMFdVqsmAxc+IV11ENrQSm87dsEQKw+eReb0+Ney1NhSHAidVpSDekGWZVi?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d96d475-bc0f-47c8-5ea6-08dda40fe479
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 09:03:52.2030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LB4mgtolOnC687A97lMgOnS9VgBNVBaFndrKCcmvIWVs9T3Uy/LiwsDcRn1OC2boI5U4/0SeWi+D/WaD8C9YQ7kFDJ7+l2E4qVa3kHFlzS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA3OCBTYWx0ZWRfXyZB0TD+xHTuD DG4U0Ehdg9X7xJc/4nDBU5TVQTCykZFZJF48LSpqy4qPE/0qFJUUpQ96/NyB1ROwW9q7/HdAQzS 6AdHyFVw4tQdiq+3Ky306E+lZn6twhWTVUMIKxwC/jG+POErinoX1RxVn0o79OIcnLd4nh9qCsZ
 Cw1ebzkMYsdV9GdQkcmY62svFSYgkSsYjR2y2qo/21YhMhMM5QkOkP9fPnPy8HWQKkKQvRQrU4X XMtA9zHJaYTuVwoGaCiiwvxiEx4cI09ph+WwaOEIVjxdeKIA8vRnSYw5nnXjEELWZXF8L5P+A/y ZEQ7oUqUFKaN2e6A2gGcRumhWq1VyFIZIFGSkuR9zCITGLqLLkwJ/hnUFuXwQs5qa0G3DHz9wXT
 38+Y5DWvzd89Nnf2ZXEj5gm/zdHwk1ukEk+GnndA1CDuGysPg+MdzUGdmd1opgiGaGgSoKnU
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=68415d7b cx=c_pps a=uYorgdaDNNJ2ET2hsYDthg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=FfjBhqf9wCbh77boKTYA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: VSlguc--bzbKmVEXMapSvHLUu5Q1kh5U
X-Proofpoint-ORIG-GUID: VSlguc--bzbKmVEXMapSvHLUu5Q1kh5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=653 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 09:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217994

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Forgot to add CVE-2025-1182 patch file to SRC_URI in the following commit
https://lists.openembedded.org/g/openembedded-core/message/217350

After rebasing the CVE-2025-1180.patch, we encountered hunk errors while applying the
CVE-2025-1182.patch, so I have modified the patch accordingly.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.38.inc                 |  1 +
 .../binutils/binutils/0040-CVE-2025-1182.patch | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 01fd03d2f4..085ca2301e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -75,5 +75,6 @@ SRC_URI = "\
      file://0038-CVE-2025-0840.patch \
      file://0039-CVE-2025-1178.patch \
      file://0040-CVE-2025-1180.patch \
+     file://0040-CVE-2025-1182.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch b/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch
index 682f633927..03604bfdd4 100644
--- a/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch
+++ b/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch
@@ -18,14 +18,14 @@ Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
 diff --git a/bfd/elflink.c b/bfd/elflink.c
 --- a/bfd/elflink.c
 +++ b/bfd/elflink.c
-@@ -14711,6 +14711,10 @@
-        }
+@@ -14712,6 +14712,10 @@
+ 	}
        else
-        {
-+         if (r_symndx >= rcookie->locsymcount)
-+           /* This can happen with corrupt input.  */
-+           return false;
+ 	{
++	  if (r_symndx >= rcookie->locsymcount)
++	    /* This can happen with corrupt input.  */
++	    return false;
 +
-          /* It's not a relocation against a global symbol,
-             but it could be a relocation against a local
-             symbol for a discarded section.  */
+ 	  /* It's not a relocation against a global symbol,
+ 	     but it could be a relocation against a local
+ 	     symbol for a discarded section.  */
-- 
2.49.0


