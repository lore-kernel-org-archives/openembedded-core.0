Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EE7C47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 06:23:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6715.1711088589572855538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 23:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KjqoqAl2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3811bd4ac9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42M5MneO013601
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 06:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Z50AuQpgE3k9C0ZSZb
	MCwa1s9CjHCOmJxEVWv74aWX0=; b=KjqoqAl2xjV73oj/VtbuXZbuDdKhHl23Oc
	Emag8G7rNPsPVh5UDK7gHmGT1VibzvYCnqyxYMPRewO3C5gni/kzu434FFA5O+Uw
	bDWMbldsadKaMcnOq+ByzrJbueL81w76GweLnZdHB+M607NL4ydJO9hqBXVw+zyN
	sMlVrT/UKPC0YTU3cem0UeJ+TJy5Plbxdileh9mlKPi/NhzVJjHaxmCskrs+B5fb
	O86nFSeJoILAAlKuqgM0UEVn+6PznHtFLe7FiBhfGGSKZO71EintLgDCyhxsx3ag
	7MVby3dcRwRpwl2U+yWwmgcmjJqi+DBpRa0fwKN/tL0HXnoqgeUA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x10gf06rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 06:23:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9LTyoQevXK7MVflmM0+SBG/cDOV/8dfT9Ejw6Kh4tCLQmmVC1FzGPFIiZvzxxs/D60Lir845E98t1MuXlbZ0DovSIqOWxGZFVSwgb02UEQffNvPEf7wEoZVPnBgQjyeduzVHL4mds8+mGVSBkt0nYCtHXS7cACXbx8Jt3kQibrdTZntxVakIRAdHnAgDCcJ9TXA139PEedqTd5sVJpIIuGPaX5uPF4wbMEiTiRU/fHBhedB82t3UzU+DzpndKn0rUFUOtHzVDfgzYF9ZpHgm5iEv4WhhmhoYqQ+3nCdvcG9R5h6ly3amI7qSijbcm8U96flcinXx3FuvZZ4ZY5ABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z50AuQpgE3k9C0ZSZbMCwa1s9CjHCOmJxEVWv74aWX0=;
 b=Gsuda5mgDN0ynvVmk+X0y4QdMkGQ7WO+v+jDkiXA2MeHetfcIhRmkNEGVKdKjGJi+bGl0ekq0umFKpC9YfpE4jeiL74a0MMaks/v+g1xuAwHnkq1rjF37a3m2A5+B8YIlNO4wZFUM80Zq3pO5yBMCKrQfGmG0IHcTKXpVR5Dru1JaWtaywlcmAunvNOjLjqDEm4b5GFFi6QdgQA2u9hHHDTqQrYVzyL7AyZskyfiF9vhpHMqq8cWdIHTxjUAKlJCEndpAKhu9M8sc2XQeZgpFzw+422HLn3F3GGVrhPhVZNMOiNImpMeYWZBO8LKZOCxW7G95+YELLfm2uvSSS/k9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 06:23:06 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 06:23:06 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH] gcc: Oe-selftest failure analysis - fix for vect-simd test failures
Date: Thu, 21 Mar 2024 23:22:47 -0700
Message-ID: <20240322062247.2598146-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ2PR11MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fee714d-4492-4537-0559-08dc4a388959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BoN7JMuH4PvSF7lRyi2Lal+tuxnsBWSiLjCkP0rZI5JmXv8HZ5BCwM7KrPk47PYIB4VcVWHTjHKZ9EXDhk9xYLfLV6fT7ICXLITHdOkHdPicq91eZ63Po5YyPE9wI/m66lzixgP5xEjNxyQPl+MMaNxMgdLim2d+4HtdzahZ+AKMUX32zh0zZMF6PXuxbQ4iC1+fvDU3ayQD4rw3oyNaKHZRoT8oF0Xt9f1QU3/XQEaCN802BZSIr4i1/e7DFbHewbPq7LCu164gEnLUE3H1cXfgAF1EPpNgEN699WSJrRjnW+tDnaIds8J4TOXi13C4/T6Ujz/NThxM+Nj/Oac7JfGD8jlcDGSrKIcufgaE9lAtIetaWkp4mTPdnB7njUbzkbz+19jxY5LxX4iWh/AoUZUn3FXKPR3xRfYBS+ZLQt/WbJs8KdOly3O+Fg9zAtxxWZYARiIOo5XkSVWDNTFH+epE2fmhsmysBUjWJ6ByCbdHQ+sUDi7CmVzbD2sqvnO8AgDl07ETL/c7fuZv5JiqE4t7J2r4WYK45+T7W0HDci6i0Qv1UdiXnEZC5Qo/vwCZ9/d85J/6JPHXHALtp98UdluH1xBXCw6JJRvA9nvCLJ38thggyxJK2jLBHf0D7Eq0KntLoZCuSeQ062h9ezc2xnzjvtcfnxsWex4/g8BEG5M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GXkzUyAhQnY5dVtN8oQD5ucGm31wtJxu4Hl/ta/ceYAibBAHXHBb/4EWdBDr?=
 =?us-ascii?Q?vM5pkmxBpSqld8rgR9vr1kufzERo2T9JB1KfgMljjwxq1BtyCwzS4U0r78vX?=
 =?us-ascii?Q?XeslESksqzypYiN1HtejEp1kQsYvJS4J3MOnMvJwDjsomCqXq0xrJ6EB0Jlh?=
 =?us-ascii?Q?1V4nltqcPKIIGOObQyizQwXhCBpBMWz6UgqL/wk+Jxc+/z+gXt/koQZF8ugy?=
 =?us-ascii?Q?XLoa7xpp0UOAwQZMkwri7V0WRV4KPYAUUsvZjtQx2WUI69FmGUADmJV9jCh2?=
 =?us-ascii?Q?SU/gA5e0fHznuW82WJG0K1shjblR4m8qsCZWa1iYafUpkF7gsLJZeuUBTTbf?=
 =?us-ascii?Q?mGwkeRJ+zulTpjeAKoE9eujxPUZcQqYdlbrJVmfnV/gbq3MKhq5sTVjcIJYq?=
 =?us-ascii?Q?kSxsTjnj909QMCspS8P7Tx9TURJFjhHU7Na2ka+Wcd9mtTtHzt+r37G7KzXg?=
 =?us-ascii?Q?YDbTefpOsXZSjczDEUdTzFgY4BifAKi7jzp/0AZFJO2yBvdZwjQTjfr54Lf7?=
 =?us-ascii?Q?d63iYD7qtrkZfZ9Oi6FGPnzknJQaMZPWfnmRiLHGMgs70x/T8Bu4d2STuog0?=
 =?us-ascii?Q?LyL0QjskAlCjzzBCAY7S9VkAjsD8egAuLaWZVmYYolvp50eQGtTNr7hIktdA?=
 =?us-ascii?Q?4rIaMPocfLYLLQp+G3DqJTa6VcqQAFUYB6IrhH2afdVLvM+lkSoFNqknbehB?=
 =?us-ascii?Q?4zSgiq3EfsPrK1deK7dfjoMAw/i1MkNYnuYCmDZRBEpfzUdpa47hKKAHxo2T?=
 =?us-ascii?Q?Zsf7VeXTMldmYwXMjT7XMcGAvgZSWfAXkI9+T840y1zgT8YfvM9egIoDHFgk?=
 =?us-ascii?Q?ekbwww4dxF3avvCMGJrsnpodQzeWtv9CUUwGQgMMt9jekSxtADK09lx6UgHh?=
 =?us-ascii?Q?Ef9tDZQIar8k/DtOz90hP5RtM2r2NI42DbC8eABG2k1UQHTFm+kLUA2VCLjW?=
 =?us-ascii?Q?p7gFSKlB3+Z6Jjv9wdbsQjIRthpOcRXrWJstqBQyhULYlK2JtgSBz76iEVnU?=
 =?us-ascii?Q?ora7SA6sgtW+VLUoxDpTddtJSKOupha/gdDrZVo1p59uQgtb2RpuEPGOF2QC?=
 =?us-ascii?Q?NEYsYe5srB5/JW4Sj4FHeh6LcDK6Irmn5+nuMJNd91C5JvYOyB6ZhAHcNf87?=
 =?us-ascii?Q?fwbyIqfM0ME9PwhWYgSnaDeXVdxtHvkMzvI29c7cv4Yb9M9n+GLLIFSYne3r?=
 =?us-ascii?Q?sZyFgZmjHgj4X44DWhg28PFiZ2X7dj6bpX983AL/OBwZhhRVpANDf6ndxyAM?=
 =?us-ascii?Q?kpAv3B+b7c4rTEvBlvLP6rKI/5uHlGo7+dRpQYnHAIgo+12OYsb2VX3WCur5?=
 =?us-ascii?Q?FbuKErW2Tmmq76m+YIBzqNKpAWB/D4FpccAfkmZ59WfoVxLpg2ZZejADr3zi?=
 =?us-ascii?Q?lsJ8axoSkCVckstRMA/ePCKutWKgzX7k1GT2hYxO31SlR2ZUgbS15ozPk1f+?=
 =?us-ascii?Q?ZIPXaIz8krnp88jfUAIt4W0L6sE7OKTqsPXHDTrl83A7ZQj3CzoJzgWZAApU?=
 =?us-ascii?Q?Cj+xYVZQRloJsMyvaPJj/z+grAwqeW4jcRSi+juEKJz7TZIUfLwOrI3L6eW9?=
 =?us-ascii?Q?lJMGJIbSEs6VMq4DhFuCPRySlGWJd8zKl89rr+zZseYrYgfxzCv/P4wXTv+s?=
 =?us-ascii?Q?AVf8c8es6zFKESyXHiH0S6c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fee714d-4492-4537-0559-08dc4a388959
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 06:23:06.3511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3JCXGR20QhirxytinY9DOUTItMhk5uohGgUL5cEsI16xwQBPu7hfQsV/pqpD4ELDSN/1DOrEsetjAgKyz1Ec1uf2WfscJMj8letHMIJJ24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
X-Proofpoint-GUID: eonLid52unWXi9HgVF8M3fJTFUEwFw9d
X-Proofpoint-ORIG-GUID: eonLid52unWXi9HgVF8M3fJTFUEwFw9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_01,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 mlxlogscore=893 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 06:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197435

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In gcc vect module, the vect-simd-clone-10.c & vect-simd-clone-12.c tests are failed with below error, due to a bug in testcase:
xgcc: fatal error: cannot specify '-o' with '-c', '-S' or '-E' with multiple files compilation terminated'

Detailed bug info & upstream fix is here:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113899

Upstream Status: Backport [https://gcc.gnu.org/g:948dbc5ee45f9ffd5f41fd6782704081cc7c8c27]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-13.2.inc        |  1 +
 .../0027-Fix-gcc-vect-module-testcases.patch  | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+)
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
index 0000000000..d81ba40a8d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-Fix-gcc-vect-module-testcases.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=948dbc5ee45f9ffd5f41fd6782704081cc7c8c27]
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


