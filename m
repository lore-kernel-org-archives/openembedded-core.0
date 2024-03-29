Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4083FC6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 14:55:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.418.1711724134456653226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 07:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=srPpTKml;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48184ae47e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42T8bZ9Q025003
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 07:55:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=IO1BAldhlg2Kt4zTQOirIhlP0UQkt491rSwdF/7fTOU=; b=
	srPpTKmlr63XMhJA7TrrOexsYHbNedleA3cJDJW0LKoSGQcLmIojMIvs1RMvcEC3
	DjYjH8EGopuwIKga2D25SU2axLloCcI3BhdR9TpQoAWJW+CU8mZN0KXqGJDt21P2
	I/yoB5ArVaXVi0BKrdtu6RrH/FQVFJ71MdBOHKpZWlT8+u5YF5VYSqnysdVXwxb8
	Yz/mRpSuiVQnSUu7+Xl3ra4Bh7vVAgJ0SQvsdz+0TMkAZ4i0aaKOksYV2UtbgIO/
	3ARNDhfPsI7OncLscw++Wv/sz2NrM6MMBGXpwruhhOfU8YpVHHCNx4RrvroTmyHQ
	VF3F9bUNjywjoFT1eNs/Ng==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1xkgyxj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 07:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaW1s+z4eZ+AzRosCH/DleaI+qDZSoqQxNCLcI57w66JGLtYZIdfL8oNJIv9taSkzBT9doZC9qcIdl1EjEYNPpCHvl0A/X3wN0QiyLvkeLnh3LlpcKK/iYa0SppKeHp0Do8Ahmh7vGQOOu1N+Xs4Cn1JeIPb9v5Ct4je/FxgCb857PvwS1EsBPgR5+tXA7ZTJfDrjxAefWZ0+8QvhqJeaeKI5k4qJrGhKg+CuhfWAUR+V+VbBeWCe+QzE7SW0DKhIDbXbjx+YHhrYO9KdoCz/agnzWz781ZrH63r+XWsTrzNCsU+EAJx4B69mhYUQXvRFljJ2/sRqDzubydh/GnYOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO1BAldhlg2Kt4zTQOirIhlP0UQkt491rSwdF/7fTOU=;
 b=EilK7vPZGGDW/L7ozOx/tUzu/voOvxvKNixoyV85BT0m2zgNjL7fjGgbmqP0d5G+FIgFmfo6F+/U48l5MT4/icZqrRq8SOzusA7/RQdaWUUohzaO9kv495kBsU018U1gqLfW1CoryCWcSowZlVQJD47+a8lLnapFJv48wGJi6m1eEaAiCFCHaT330qgkFuBaImWl1dOMn7t/y92qKAilipkoD7+4AXqurqe3+y8QRsbfyZa1dJa6USoX/JnAS8+09CtMJpp+zI3r99PNBeu0HspLymlBL8dWvSBgdICVbOP8+kr5wB5zPrjeFoeN7UxyEWIABdC7b45bgvfPsuObnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL3PR11MB6385.namprd11.prod.outlook.com (2603:10b6:208:3b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 14:55:32 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7409.039; Fri, 29 Mar 2024
 14:55:32 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 3/3] binutils: gprofng - change use of bignum to use of bignint
Date: Fri, 29 Mar 2024 07:55:07 -0700
Message-ID: <20240329145507.415122-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329145507.415122-1-Harish.Sadineni@windriver.com>
References: <20240329145507.415122-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::25) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL3PR11MB6385:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5rtCJ2gK/DuoTVxfizXNUtG0wbo6dp1Ecxk6SA8MTgRSHBmoSHT7JswKdBlZGTB3x6RRCOMA2na+TgnhQ2lb2P2bIAXKpXtjJgEr3OCHsthDdLf5xDHNOLBHM9buNMWCi4cQ4JH3lDcoKHrEWAwiyEEZJJWBaCXSyQpL6/2knCnIYtr/JT5h5uIr6CM2tf9N3C2/E59mmZMdhXb7+evRmOIwhXkjHHWhQ1PbT8Ofr9eWNPCDfiFwacarsjCVz2BCH1mC/9Fk8UKc6hj1amu8ucwF3glOpjwAziVNs6reltPf53JcR5BUL5/rzJcWTFPRlbZDORWhJ0l6MgKv2rwX8yJWOmsxA9kpWPBNcyhm5zLEbMWc5lhGXcYv6dGwHtLE6O/GZqfPmo/PsKbRAL7q5Do4XkaALyQbAtmvB0qhHkHEfNpyuPSUKq0jl9ic4MwLBt0fSscLtSGwWIdk3t4qVaUaQlssweallmCwm1OGs+EbhCvwCGEHqmmUs6TCvMWdPQMwT7v/j64eYB//v9MtQ9DrnMn//7xCj74JPhFGDpMbcNExq89YknKYrfX6eCGmFpV7Kv7iNg5dU6aFcRaSoQipgnlYqADKpJqsKlBdzR36Hx2r1WhHWlArH9BGkId0YKJJb50soIQuBxqxTLR1pQyog0gTgxdjDFopO3H/r24=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2trLcbrgXt0M094SNtGQwSyJJYzgXUS4a4DUpopLYyUxqjtdGQv4YuchXhzu?=
 =?us-ascii?Q?daWxcZGoDachsEeU6ytvTKBMN4MU2pfKD7fEr5DJBOiijzXA9exOlNrvzAhT?=
 =?us-ascii?Q?Nt8GcBDYDfUYVlJDE6j8OuXy7s8yRfS6QH+77GtLvDZlAvKAFxM2tcrgZyqv?=
 =?us-ascii?Q?RegKmWy634s+ORd80amSK55X32sbX9RWZlwiu0hJTnn9t0cBao7wAoHIpIg0?=
 =?us-ascii?Q?mYO5yPtW7URICPterqZkkJwKbVrPvU9nylc4j2YNFglT5iYKqNfXfLKIP4f9?=
 =?us-ascii?Q?hZ3DRM8PtvY2p8NJE/rFX0pJ/1zOWDrOhhE6nuHa32q9AUaCBWAIQnsWhpeS?=
 =?us-ascii?Q?E6xw30efFBBlGT3ruwHEeqGvRPmYK8QZMevha/OuNw3hwiI2yltgpC4OgTXU?=
 =?us-ascii?Q?W7cvTrhqQQlbBicwUOrXNV44o+CRbS/ut1lmGgk47XMEE6Oge5AWB4xiNRgh?=
 =?us-ascii?Q?5yWiSioWABbDM1nSzZMvDpoenAugBs/MwLmiCAROGJBrDkVO22fvf7IRfiVH?=
 =?us-ascii?Q?GCKjeq6FuRiSmV1/QEVADlEZH2F0oMszFd9MD28IbBKDTFiaaO0cD/UoLdXV?=
 =?us-ascii?Q?e+Jph1drXDs9BL+p0dU5O6T45dzC0x7CdPID6915/aK5rn81TKjLWJKcTHsP?=
 =?us-ascii?Q?vRgQb9XLSJ8B6ga8F9MZI+Bb3ki6m48rnGTSD0QkwIUFeTnigWG9hbGJLcvv?=
 =?us-ascii?Q?F023kSBYBU9uDfUTjq6RSWHshBByi2nCUJI+YAnIz3S3GtAJQrS5aQ5F62pK?=
 =?us-ascii?Q?JvkmIFUEqYUxARkuEFoLKE1W3t96444520jVTC4KUFDbNaHP/hkqMVFqOQuN?=
 =?us-ascii?Q?ledIIXHm5fadYJHYQOPo6sZivAopdcDZ06j3i2Nq91Su9TsL43K3lqNcO8k1?=
 =?us-ascii?Q?16XS342VmdDQD40VpaLeBOQCr08s8XgmW9L1FW7C4nt4EQzvCmJdHPVI0qE8?=
 =?us-ascii?Q?GhrpLnaff4GM+Ny5uf/202vNsI8xE7bohhYt+IJFBZQzjXILzS2ZfmQvL4tj?=
 =?us-ascii?Q?XkOvmRyN9XkiQ7P1xtDCj2riSl//tMnrTsOP2TSZTK4K1FL+MFPTEPXcT8mp?=
 =?us-ascii?Q?NCqzZpG2PbpTZfFEFD6TKZfzkzgmwz+Co0R4+jS3K9fGtXp9Isf662VDQhpC?=
 =?us-ascii?Q?gp4Y7adLr8EFEKnfong86aTDDIgSyR54iG7C7Xhor+VPp6p8xvVcqTGEfA6h?=
 =?us-ascii?Q?c51APGD600bzqPtesNY76SLjyRF1zg9C9Y+hm4GFpIDZCmrzZMUezT0Ba7hC?=
 =?us-ascii?Q?aYWIUT9O3ajGJJpShWINaNmPEG1axPr0D5n2FjgB4jPShwKXbkAz71CFPNzh?=
 =?us-ascii?Q?eAJ02kZM+Dcn4T3VY2W7XqC/AQ+bqSp1dok913VFgCqgM6Hi+MQjHjfhJb90?=
 =?us-ascii?Q?EjqbMvo7JFKOUmmoZVlfFFvNYt8sSSPblT3pMra2MKxE0T8K336nzYU6X5Kl?=
 =?us-ascii?Q?bwXjRv3obpgX8EvrrR/ZrWwdbrQvbq2Soz9LlbNGK7JtEM2lxbdKWIOA5RzQ?=
 =?us-ascii?Q?awbrIw1HQ8OL20RemoZMhoI1JZX8wqu/X9TLBKcVa54iZKeYMz8zvbCA7svh?=
 =?us-ascii?Q?Tjpa4LRotHuSy2EdaVz3SueIyORs9+Trqx4qym4Z+gT3eevQWjuuFXaG/sKE?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f0afc9-1ca5-48a1-8a5d-08dc500047f7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 14:55:31.8793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7wmIjnOYZ3XIOOjd7kYqut1oC14us4ccSohxn1bk0TLjRU8z5cAjKCTY/zWfVPd5BfGG+bQe1g7WhIeLcJmJN52JzbeHTsKJIN7d+SXaaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6385
X-Proofpoint-ORIG-GUID: 4y9xfIEg7MYK5Nx9g7Ibk8f5xUBJrv1i
X-Proofpoint-GUID: 4y9xfIEg7MYK5Nx9g7Ibk8f5xUBJrv1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 14:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197634

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, The "x86_64-pokysdk-linux-gp-display-html" fails with below error while genearting profiling html reports from test experiment file (eg., test.1.er)
Error: Undefined subroutine &bigint::hex called at .../sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-pokysdk-linux-gp-display-html line 4059, <MAP_XML> line 1.

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=3243d790ee32aa8eda69226d81b1e79dbd1dcd87]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 ...rofng-change-use-of-bignum-to-bigint.patch | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
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
index 0000000000..c23d697537
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-gprofng-change-use-of-bignum-to-bigint.patch
@@ -0,0 +1,27 @@
+From: Ruud van der Pas <ruud.vanderpas@oracle.com>
+Date: Tue, 27 Feb 2024 18:29:55 +0000 (+0000)
+Subject: gprofng: change use of bignum to use of bigint
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=3243d790ee32aa8eda69226d81b1e79dbd1dcd87
+
+gprofng: change use of bignum to use of bigint
+
+Change the statement "use bignum" to "use bigint".  This is sufficient
+for gp-display-html to work and removes the dependency on bignum.
+
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


