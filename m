Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6266C47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 07:00:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6890.1711090824936837070
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 00:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mXmACwWU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3811bd4ac9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42M51PhF014019
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 00:00:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Vc6iEYuWg+czt2AJwj
	j7ham/ehI+zM6EuOuCerQ4380=; b=mXmACwWUlo54wT7IbruHYcbAm62Zu/xmrE
	kqFC+Ku+oIo7j8d5d2EOHj3HPFAu/22HPSx8JOgQpshN0A6q4tplQ4GfvWHVKbR6
	YUo0jYB5DpAjMn3pDoeHazyGhhsuPwSBq4oRNHDuSMAUVHyxV240DW9Rf1sE6BlA
	3Awb1pRiN7CoIwlMirgUnq6h5GvyWMyQclxpvmUiRBNQ8M7r/4Cx+CwGU3sl3AZm
	kfcNxB49+7BO68zK+YXTus0uFkDNcESJMvFsJUSe96axJcdR5WOqZvFUf/cfnidz
	NeAFdOheZ6cgi7Be1Qot3laTLYPWc4dMtZBgXu0QKb1FUM3W6AxA==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x0yuj08ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 00:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuZl8C6iLjmmNWywbLqrl9zSQIoGkGUeveqXSz1GHj51LzZuwX1UYCdq1kadH6NSrhz9pdAUvVnKgrHjN51orf2zW5/UktqDGCTujeecK5QQ5hV6kIqmEVqHZdrK0fSyZiMLsJhM8TTzRWHORjzEj/JwPbukCSHjcZndfReweZ+z+g2vzl6CA0IuX0O0PQq4jwcq61Pmcy8ha6EXT7ntOhG/wUZsChOnfCNjeMlILUGK8tJyvR4TEjFbUmnUIyE5YBXVMauGiKmBJfEaoGyipp7u6UNItHrrUPsI5rSBBf9hdipi78KadAz3p5Qba0dU9+WZOwN7fcGX1LG3mqAxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vc6iEYuWg+czt2AJwjj7ham/ehI+zM6EuOuCerQ4380=;
 b=cthFieyV8zVjP686LUzqOoSYwemTsHL/7jdIGv9Pkbo53cMyM7xmfjjPm+skowsmGwnuVnJEeAbW7c7JcQuDVIUysTdwR7+5ccH62L/fYUHWsSfDvLRcJlEvRsKsMz43mXzEcy6mzgcYailJLT1e0tINu5ihisJsQSeYyjZBzEDGoKa49FUadbJs4S1frnc6yDE1RVk7OfClOB7daIkMXpd6sF3p/IGtgrrbKrhreFajCSEKKs7/SZnGeef02oS5PbflQJQa0jN/7CPy0XvUU5yKAB8FlgFw9NL8YI5s4oId4/X2FaaqGlQ4TLXSNPZlGrv2fBsTIg1DFdnihOl6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM6PR11MB4722.namprd11.prod.outlook.com (2603:10b6:5:2a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.23; Fri, 22 Mar
 2024 07:00:21 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 07:00:21 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2] gcc: Oe-selftest failure analysis - fix for vect-simd test failures
Date: Fri, 22 Mar 2024 00:00:04 -0700
Message-ID: <20240322070004.2634405-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM6PR11MB4722:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e69f33-6c2a-48a6-1f30-08dc4a3dbdc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	joEYT3TqFWd8xNHiYSu8aoLlRKfn81UJepW6S0rSQQyV3j/nEM5y0RNbvABmhm7ZY8ioTGu6jEPTtqE+Vn7jAoBXIc43v7/DaqSjj+MMw9l7X3XcP0Uf2uFVBmqKcVPaZGW/Mye1dCQE7jFAVhZXEUZR8sYkS8A17dkyetDitykn26jDwzPaMmGYksElCWdoC/hzepZjkUBVdqhIQj4NuEtZd1t/jlpq5OyZg87YRQFQbDUbdBPx4wkTyNkyJinwGpm43FQSBrxp8bkS3k98c5Z/SJnC0yM7c7lXWACUL+L5rK8RfwXuW72moo23XWVq0LlyhMzrrJc7wMRBuwL6x5G5MRUf3JPUZX+AMmmc4B/HfnZnfodIdzEzO5PZ0dwBJyp9cTzP6Z40vPMj3oUhlk1JJinIWO3tsADRBhHNG9o+wMkX35ruBUfqWFMbt8ee93YKmvMX0TJYW6KFnCwz57eEfyZXl2EQZiwWzU8gFoOh10vRgkMFW9um5ROrHsSRAyCcB4sJrrnCn43Yvade7y/2J85qaSVu7bCBRTXEbpS0FCYPW+WhJbihCENp73BrbV56H03p9UwvRYZPPHWUBIWIoUCQ4mKKJV76pUWkMN68oaS8BBTJ42oO0yZQlhGlTEAUTvjpDfwPiGstfJCB4xvmUVjMx4qMnVDDqOK9sv4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(366007)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FjjRO2y4ddR0zUegGsMBsQAigseN4tAxTU28dv5tgqfF8R7Lb365FB3IYVRP?=
 =?us-ascii?Q?ryqd7QRNqHDEK8loxx8W1Lr5T3jL6QbrdYrcJvS9UnKBgoAKawVcLETzjQ5+?=
 =?us-ascii?Q?3a4KA1Q1FJAi128+AkB/c6vC0YTCxtsAnuaJ5Vh7k1W2bktkcchG8MTsDARM?=
 =?us-ascii?Q?3mlAjNkfaVLPAoGSUfN6IaPED/T6Hm8y6BAvQdnBhEme9ZUd5r7A0Tnu5uNG?=
 =?us-ascii?Q?SOBRz0TkfHdJ1FKAt622iuIOwcRym6OowgRNZWZumAM93VRkv+grRqrcB6mM?=
 =?us-ascii?Q?xhyCuMzgVCzF3t+bmsCt6vzhgv5tWfOmv7K96GHCNpjQFBX83+l4VBzWfbN+?=
 =?us-ascii?Q?0c13kc73co99TxqDxfsKjS84WjV8gKUd0zOqIwZGgL1WvxqQMC13QiXDPIJy?=
 =?us-ascii?Q?BmpnqsYcQSf74YDves9u2X2j9+8yp6R0q/GPg9AT8smM4F0X0WdgYRabDX34?=
 =?us-ascii?Q?MxMOaLS96T9gguToMKXJhuGEfbVsxJoOnGmRquwgobb87YIErFdwToy9PBG7?=
 =?us-ascii?Q?3B9o+dDP4LEAc+ygNkuGpPYEU7C1W5eHcpqSboySxQAnySsqT9VgbW/NjESj?=
 =?us-ascii?Q?SEFy5dhpCAbKqXlC5gXn4Jl6wDTp71NpfbnKjFvd89oE/UPr/ZZL+X4CHcHp?=
 =?us-ascii?Q?gaeRWk+HDoVA7T6cwXZ3nhtBAq4JLpX9JVxtlDhWsxGcaU9wS2x2MU2F/Kng?=
 =?us-ascii?Q?0RC0cPpeYxlOQrg5kImlQkR4usqfZ/pLDy+xZv8yxZycKUA7EjZ6kBXGRdFr?=
 =?us-ascii?Q?jR8aMrHbGFDedsB+UZ2DFatuwMqzqs+HkK4knSrVvNR7WjNmOEYJSyqCYcg6?=
 =?us-ascii?Q?0hTuJZyV9U5maHM2bABZsomZE0N98IKnZAA88Iypeb6KfBPWT1qU/V6xNA6u?=
 =?us-ascii?Q?R7GBeAUkktPIBh1HubGm5ozw8Yd4c0bO7AE1j6r8/L1Q+ryi/MYOghmCUmpZ?=
 =?us-ascii?Q?yycRCGu963rjD3/D7CMpsl7W+azHdc4ZrfP0igyyEvPRKX1t2ZwhMVM6YG8v?=
 =?us-ascii?Q?NmdenO4kWhB0Vi0rMhtDTXEl74cHOrzS2D5WjWJWFHDMgVMYqgeCWvEU1z4T?=
 =?us-ascii?Q?l4cL/zMlnI0IkCU7kz/GHwDKEyA3fArqCmhOWrLxvxpvqHeIMPSwQ3Hj57dD?=
 =?us-ascii?Q?TQYreth/HQqiFISsibvL1iHCWO9jpn/EzJfG3wFhWVvN0KSc2jLJT7q3217c?=
 =?us-ascii?Q?z1v1D/hVqmyISo8kHCbhMy2YrLHbC1Cq6nLquB2P80olhE7jsDqRo7Dx1nie?=
 =?us-ascii?Q?mwFs/KwFC1AR3KeXmtHwHfJlJc7hteVbAKA9j1QKWZrBlfUIh2mB8nIE5uPt?=
 =?us-ascii?Q?Rep4RkRYFhrD5loeKcnE+Nb7ca/OoiCH4an8k69lePu8sDHQ7+QiOuEYq1z0?=
 =?us-ascii?Q?DkWgqhYKCI1U6z4SrcalrpSnWbdMsjMcQ05ZiR7fZV/ydpcUEiD4mir8D4u+?=
 =?us-ascii?Q?b27t0b5UkFE48C6D57VOLGqwsi+Xcz8Fa+5aoiPox9Y6pS7LtkHTQJjnlA7L?=
 =?us-ascii?Q?cghgWJgR/nlJG4Tx+iujberM+WlEWUgG7T9Q1GIZ+zzgbJEB+2CBdcAFsbL2?=
 =?us-ascii?Q?j7aSiM3WF1/je0smstGnB8oxg4Gl0gew4ERP/2jmSJZ/2AjSoLTuDD2ec+Ha?=
 =?us-ascii?Q?K+050tQLm82K+JUpKgqB1BU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e69f33-6c2a-48a6-1f30-08dc4a3dbdc2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 07:00:21.7639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAVRQxs/YvKG1VGseSyN/2YicELhTqH2q7AXLlbP4mkmyIb/FY9eT9Q0MjBHG9RR1HbZCgmsEeIvWNanVz+EmZTe8ptGqrxCLfqfo5j2+Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4722
X-Proofpoint-ORIG-GUID: jpuz6wM8QXExVDoTH0YqGxcaBIiJEZbI
X-Proofpoint-GUID: jpuz6wM8QXExVDoTH0YqGxcaBIiJEZbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_03,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxlogscore=893 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 07:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197437

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In gcc vect module, the vect-simd-clone-10.c & vect-simd-clone-12.c tests are failed with below error, due to a bug in testcase:
xgcc: fatal error: cannot specify '-o' with '-c', '-S' or '-E' with multiple files compilation terminated'

Detailed bug info & upstream fix is here:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113899

Upstream Status: Backport [https://gcc.gnu.org/g:948dbc5ee45f9ffd5f41fd6782704081cc7c8c27]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-13.2.inc        |  1 +
 .../0027-Fix-gcc-vect-module-testcases.patch  | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0027-Fix-gcc-vect-module-testcases.patch

diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtools/gcc/gcc-13.2.inc
index 32fddd11c2..603377a49a 100644
--- a/meta/recipes-devtools/gcc/gcc-13.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
@@ -67,6 +67,7 @@ SRC_URI = "${BASEURI} \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://CVE-2023-4039.patch \
            file://0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch \
+           file://0027-Fix-gcc-vect-module-testcases.patch \
 "
 SRC_URI[sha256sum] = "e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0027-Fix-gcc-vect-module-testcases.patch b/meta/recipes-devtools/gcc/gcc/0027-Fix-gcc-vect-module-testcases.patch
new file mode 100644
index 0000000000..4b89036814
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-Fix-gcc-vect-module-testcases.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=948dbc5ee45f9ffd5f41fd6782704081cc7c8c27]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+
+diff --git a/gcc/testsuite/gcc.dg/vect/vect-simd-clone-10.c b/gcc/testsuite/gcc.dg/vect/vect-simd-clone-10.c
+index ed63ff59cc0..009c849b7e7 100644
+--- a/gcc/testsuite/gcc.dg/vect/vect-simd-clone-10.c
++++ b/gcc/testsuite/gcc.dg/vect/vect-simd-clone-10.c
+@@ -1,3 +1,5 @@
++/* Since this uses dg-additional-sources, need to specify `dg-do run` instead of the default. */
++/* { dg-do run } */
+ /* { dg-require-effective-target vect_simd_clones } */
+ /* { dg-additional-options "-fopenmp-simd" } */
+ /* { dg-additional-options "-mavx" { target avx_runtime } } */
+diff --git a/gcc/testsuite/gcc.dg/vect/vect-simd-clone-12.c b/gcc/testsuite/gcc.dg/vect/vect-simd-clone-12.c
+index c44471e35bc..4699a3f3c80 100644
+--- a/gcc/testsuite/gcc.dg/vect/vect-simd-clone-12.c
++++ b/gcc/testsuite/gcc.dg/vect/vect-simd-clone-12.c
+@@ -1,3 +1,5 @@
++/* Since this uses dg-additional-sources, need to specify `dg-do run` instead of the default. */
++/* { dg-do run } */
+ /* { dg-require-effective-target vect_simd_clones } */
+ /* { dg-additional-options "-fopenmp-simd" } */
+ /* { dg-additional-options "-mavx" { target avx_runtime } } */
+--
+2.43.0
-- 
2.43.0


