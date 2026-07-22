Return-Path: <enoch.ng@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC7BC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 13:53:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.198.1784728408566390836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 06:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SYvkzAE7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1663b36c34=enoch.ng@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDiYm41084555
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 06:53:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=qNLRxn01xg4oodL9B5P1
	11BYRNkxi0+YEqqqqRuaqxU=; b=SYvkzAE7ovaLKoWQJGVAPOQ8cVFQxl5DOqvX
	02LhSWHjXhtpR0B2oaqKIdgNLR1qbPLW4yLXNafTVmOwgwu40CpZHm4OOb2Ks0zn
	G6KgvOaW3msBgaS2quSk8Ug8JRTQYASswAl9KFcZsISas+cG8yHiOBNHEinU3Kz7
	B72YPRlI628GEOXwG8QXj/hE5YBqcepAvcBtD1tmIkIup0cMMhsgSgLKkrbZYji0
	QFN6xCZk+/iURHVV3hVzBifcNbvs0VmeZCwYdDCcJHloQ1h83YUvsPvJaQ2bH8WX
	2plYAW2Q3XeDY42c9gPgR2x4H22vq58GJ4NFz2jznKQXsS0QeQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011038.outbound.protection.outlook.com [52.101.52.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg4ryr9t5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 06:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOK+Uiuovg4+S1QsUm5tpGoSuddQg3iVcZVI2zrHRTVH1mlO9Fw6qimgE6FBUFvhrhCAtfWzgsBFEWc8q347cAZqZ+hqX4IyTKiUCPV1y7xxL+ar7Ks3dUPXor1SZ6nMZVnf6aCojTqHWKmzAMk8rRySt79nK0uKIzD8j6Jf/Ot9/u5ziGdscOqhWeSDC1vcUbKIGpM7dours8R8EvIVdOWRsa7AWIE46DrpSTe7LPg1hdPanGlRCOp9ZN2vupFcRPz2V1zEdyOXLgxQhIHlHQK6t0aoF3Rtueyj9Wgv74dmNwrD4Luqc1xC7NEGJhI5aVUI4B4yXg6nI9CcdmWodA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNLRxn01xg4oodL9B5P111BYRNkxi0+YEqqqqRuaqxU=;
 b=V92QYdjg1OT7wtNr7/+Zi6jnqrmJRGI9150rYHzepO85ifeTqnjxDHXpS16efBxzG7oybI+a+JSpm8EmCCzhptP3r9gkfXWSWkmDetUpj1Uv6noezmAiBrRvP41EF9jGyDI4bYXeDPKcc8MGYnpXYAzgl1J0jxJhZQ2foi/pZhx3WBY8nllpKij08NGqxnPErUWeqHucSDtL7t85ff0cyVf7lsmBhlfPcVRVB1G871mhwQb2/zDt7EdcwSJzGqBUMjejssQ24QNBVaLc/ydjhbQ0h2V0wzFYhA4/k1ca0eJHugNDirJdSR8dCv8CGOkU79jmaKtfrOT/ubCyvcmC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a)
 by SA1PR11MB9634.namprd11.prod.outlook.com (2603:10b6:806:4dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 13:53:25 +0000
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::3dc1:8afd:aab9:763e]) by DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::3dc1:8afd:aab9:763e%3]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 13:53:25 +0000
From: Enoch Ng <enoch.ng@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2] libxpm: fix CVE-2026-4367
Date: Wed, 22 Jul 2026 08:53:28 -0500
Message-ID: <20260722135401.2013448-1-enoch.ng@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::18) To DS4PPF10012BF96.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF10012BF96:EE_|SA1PR11MB9634:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cdb3590-cee1-45f5-06aa-08dee7f899a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|52116014|23010399003|11063799006|56012099006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FmncJUMtPp+QzynEkWrVWYs31sKxEs3zTckgIHeerNmoE2F/HIqzWWc/iLZXGuPQVC/usaUON5bqhvySFSCKTXad3AxyXpsFgBA76eMtyTmOBTDannuvqpsKbACARA4PvsGtmXjhr8Pp+HSSqYcoH82eOn0UiJ3CAyLLfPr7qNLAks3/XJwhJ+4HQsdrhg++QTguCuTBK+IlMu7W4sVIs60noUh/3W/dYCNLneRSjN/5XFrF9bw9sjNsIzTxAA1p0MC/FQt/u3hH54c9aIapt07Dwn/AaVz0G5SvGEFO5BmovQ9x0qzfHPA27cS7/cikFQNL5gltchLvkLZAoZsV5lJUz9hevlxz8iYFjel7Gz0DC1Rr3WDfneZK/8mRJBlKSU2eGnFCzhPMxq5e7+G0L4lblUCIbEKrgHmA5ArFEeTctTGnNb9q0vUgFShFR4JNXJMDcs3G4q2P2va403rrPDk6wb2gcwLJ4sXSY1A/b4gKUVtfYoYIovrVY/zYnk5261z/gal3YsbyQbqAeTjnPZ1c2ISM4W4ROmJ4n4rNekgCEAYtQHQ+arXwsReme3qTB+e2FXSyUiT9MHFwEzVHmsvXWEhsIZYM0BwEjFc0TpH2fSCsng1F5SfIkCApg2y6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF10012BF96.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(52116014)(23010399003)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ae8cz5KavyFlkBA7DqCyTBMOAUMWwvsayEvQrBhTqga9e9ajx1p8UuqyU6ye?=
 =?us-ascii?Q?XrPCB/LEsn1qqDb0kxFvrmoKJAhLQ14rsJFblCdqK3uhQXbSRsHogqdj+Coe?=
 =?us-ascii?Q?3lFwEBF3t0C2m7GxhbZ5p/V2ECDEMXmGvpIK/6WAtlBllZlMsHxjBCfPK3Fr?=
 =?us-ascii?Q?apt0X+T+/lBrMFC0YSApGr7PSRYaLo/2G4K1IIUHrQG8SGotAkOuGHtRgKlE?=
 =?us-ascii?Q?svKfE/fp3e/TkaH+D1B9pwW1Ch6GB0UcO+H0f4cWQqzR0seKASOTX/E6Dh4g?=
 =?us-ascii?Q?eQdiqcmIjuSh57tBGrFi3q8X7jLUc5bwNv7HnfTJplFpRQnBkbSsQ3vFFsCC?=
 =?us-ascii?Q?DCxcCLO+GWym9k/J2EDtPxUqLn3vQbvzj2ZJGGJpxOKIuBJu+aWYba5fB8dJ?=
 =?us-ascii?Q?GayGJPogFEG6y1ceR7EoFlX8m02ogxaRJr9dshzP0iCi/bptNX5VTfM7GPDB?=
 =?us-ascii?Q?64XskyJnpRwVhzl4JFdMjPTNgG4El7s0zGTShZ/coq2vqzerP/anuN6SnBkY?=
 =?us-ascii?Q?h8iw8xlK+YEMEw0xFf7OMdWMR8AP82hq73McRQYBz9IQOXvV9srZCxW+9uMY?=
 =?us-ascii?Q?INqB5ntyCS40CWRk9QZpsbM6alLaTxoOQliMK8B/rAy1av340X518m3DZsve?=
 =?us-ascii?Q?jqkCArkGm9ujB5G2ubZizcat4azDaHRUftPgtF7XUfZ4kSr2+RyJ07wvnnEe?=
 =?us-ascii?Q?8Q/vkujCbgAnPpUU0TRhUdw73acOBfsb/lCRc78zwr/7f0lagkDjWJoCjQGw?=
 =?us-ascii?Q?y2vRF6fCwhe2EDnzpVLCLM5zBQ+K8XbLJk6oaa7J169aBuXJcg7AZJ0xdn6D?=
 =?us-ascii?Q?Avoq9znc1eVhUoQI94Dsz/I2J7NNQgfk1xdBFkXj6jcKfZi5jn/vrhAchjrU?=
 =?us-ascii?Q?SezO4pXACb7uREgG0GPjZIUYg6qhzStmwTJF/gX96oIEjJL38+gQgT8UD+XK?=
 =?us-ascii?Q?w6gcpZUqPDy5yOiEXgSJdCfwb9xja5vPxQY+8/4Qs/BQA6bcYkwaRo8sqD6I?=
 =?us-ascii?Q?AwX/G9iq+smnrRSTF1jVYL8xrCCvOR0ZJ1FqO0CjFw8NtVo+tYfhAgX5pHJw?=
 =?us-ascii?Q?ly3kMb9NFMGCl81gG0cylPWfybmHDwPkH0iqdCfpPfF0YjqS2DtKzpFvXSVg?=
 =?us-ascii?Q?SHhJMCa2yKIdhYva6ayBOpudAvuRu6J59ZMDDMKpu9MziNUBnIqxBpniNlJ0?=
 =?us-ascii?Q?oyt1/oS0tGKvROOcInmHhfsjzVeweB3Si4hlb9BfwBodfdhe5YGSpBeL8dgc?=
 =?us-ascii?Q?FuR0DPE/uofeBciSh+R5/nIpFoXIn7AuOmGUsbw9R4zZa35NUxLORdiEsRtr?=
 =?us-ascii?Q?oQqMEas2NxMXDkDy8CvKk087wmlvQzDoqKOC45Lbn9msnLCIgjPJ5r7UpIUr?=
 =?us-ascii?Q?B8P4SQbdNA4tsqmv1sXDezVikMewfIn/+G8HfKSla+YhSmPcvsxmlMFkoj6V?=
 =?us-ascii?Q?gLtumSt2bKc8M3pM0LoMhNwQYpOKKL+qylcbewqh25eOGAv9sJJ82JywCLn0?=
 =?us-ascii?Q?exCM/bXrHaVRj+aFEJdFyWBybYtcQyrNEkqmx52K0Kr5pnAok3DFpCg9g+dP?=
 =?us-ascii?Q?jeSIR09BTrvB/zuvP9kHa1KhDERM2qX4Is2/wxmHSE6cgg/xVTC29yGdSwxh?=
 =?us-ascii?Q?oC+Ksr7MKpdDEmG5wdjiJcdQGcvCxWIvqgSemFQLGHbuNFZSJDOAx1XYC6bF?=
 =?us-ascii?Q?xr/UQD3lOArkYkeAHYLEKGQYT3KHYBp5+diYIxztDxBptxDr0WRHO2LJSweZ?=
 =?us-ascii?Q?FZKvfTGl3UpKb7AB0ztOYwx16liDeKZeVWMa2QJN7SjYrBfmpj6IucWANOWZ?=
X-MS-Exchange-AntiSpam-MessageData-1: NE+envwvX846KA==
X-Exchange-RoutingPolicyChecked: 
	LcTVz7Z3c+4hkrSypMnjZamDqcnHMQbs7+pmhb0UNOgH7hCNePh5JK7sAUY9stmApbUWQV9iS4qaF4vWVUaAuhvPjrYNsN0pW8dZg+1CCBMbxREGFie4BD9xrta+MPKXpi+OIis88EZsrt2kabo8DCdfGmvET4wKlX6rSQ4lgUNakWzjmgep51hK44iJM5LPKnC6aCeixshujSMzFWkDtRWQLVNda22zb0z+6BvXumxy4UpmgRxUZ/6/hgw0TvmYb2+pe8CoJSwK++teanqhhylifMegTHTmMK4Q24R9h2JS47+XzaAoGrt1E93bc1MJXrMvc0gt+zZIEF0eADQBRA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdb3590-cee1-45f5-06aa-08dee7f899a5
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF10012BF96.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 13:53:25.0760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnxNrUrM3rGtybjncWWIinhA2IRSInuGxJCyfNaocaXBg62Yx5Nw5513Cy3dRWpPad70I93lmNLiokHhScGrEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9634
X-Proofpoint-GUID: bXHZJtY4HylgJts5ApZbAsivhkVuRiWd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNiBTYWx0ZWRfXwF17osEgDV6O
 y+ENujqPVaw9TZskrflfSryJ7uhEjNznk3GEwr8K4obFreqlSJUYqSiPlhmfRi/CyQLTYM9vgRH
 MHkXdCa2lQX9Jx+31GqBPlJtqwXhIKzpnY+xnhtM0tLtg4eFy8Pb
X-Proofpoint-ORIG-GUID: bXHZJtY4HylgJts5ApZbAsivhkVuRiWd
X-Authority-Analysis: v=2.4 cv=CfQ4Irrl c=1 sm=1 tr=0 ts=6a60cb57 cx=c_pps
 a=Lazl6XkH4A3N9SONPos2PQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=QYPZNIIk9UGFkgUltgkA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNiBTYWx0ZWRfXxS1a3xFS83Am
 y3IiDX6YKilCdfKfbQkZYy0c1kdNusaSQM3NzpGZBtYqjG5FTFR5dGocBZ4UasZDUwJEyaxAcPv
 eOav/VzfWeZqgjzPFt5G7dRnUj6b7747AunIwxt02eExCDOGh8eKMv8L1RC56uT7SqVK3lPmEOG
 9jhrzF1noGubz/mFTBcGBJ1fKJySeDKAgDYmfnxaueo8ornBnHo9MQ/c9GZckNQ2RyVrzmgqxwT
 3iMAUaC72ppzbCONlPVPqre49CDge71nbRvZXS94eDZjGtHmbmK6BKLWOx4D+1C0mOK5piBokuP
 dfBWO1AopsJ4sBsfMCzIXZ9lyFlYTmbFpsnmqMPvCz7N8RCJxH4+A/iZhs5QcO5KvGIrc0hwCkp
 DQpbvr9+oF5jPY78sDeL1p+UXzp8UkPNtjognwKqEv9/pOrlVV+W0oosH6VEbHD8tkn1tirQiNu
 qYShsVyIJD3dZ3sq9mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:53:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241695

Backport the upstream fix for CVE-2026-4367, in which the
`xpmNextWord()` function could attempt to read beyond the file's
end due to improper validation of file boundaries.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-4367

Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
---
v2: Add formatted CVE tag

 ...67-Out-of-bounds-read-in-xpmNextWord.patch | 140 ++++++++++++++++++
 .../xorg-lib/libxpm_3.5.17.bb                 |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch b/meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch
new file mode 100644
index 0000000000..e9989a5012
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch
@@ -0,0 +1,140 @@
+From 5448e1bd7252780b16db869c2253d24e0fe0ae18 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Tue, 17 Feb 2026 11:59:56 +0100
+Subject: [PATCH libXpm] Fix CVE-2026-4367: Out-of-bounds read in xpmNextWord()
+
+xpmNextWord() checks for the terminator character to detect the end of
+the file, but a very small malformed XPM file may cause the function to
+read past the end of the buffer, causing out-of-bound reads:
+
+  == Invalid read of size 1
+  ==    at 0x48AD3A4: xpmParseColors (parse.c:239)
+  ==    by 0x48AF9D8: xpmParseData (parse.c:783)
+  ==    by 0x48B1C18: XpmCreateXpmImageFromBuffer (CrIFrBuf.c:101)
+  ==    by 0x4005A6: main ()
+  ==  Address 0x4c413bf is 0 bytes after a block of size 15 alloc'd
+  ==    at 0x4841B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x48B2809: XpmReadFileToBuffer (RdFToBuf.c:96)
+  ==    by 0x400554: main ()
+  ==
+  == Invalid read of size 1
+  ==    at 0x48AC8D5: xpmNextWord.constprop.0 (data.c:262)
+  ==    by 0x48AD492: xpmParseColors (parse.c:266)
+  ==    by 0x48AF9D8: xpmParseData (parse.c:783)
+  ==    by 0x48B1C18: XpmCreateXpmImageFromBuffer (CrIFrBuf.c:101)
+  ==    by 0x4005A6: main ()
+  ==  Address 0x4c413c0 is 1 bytes after a block of size 15 alloc'd
+  ==    at 0x4841B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x48B2809: XpmReadFileToBuffer (RdFToBuf.c:96)
+  ==    by 0x400554: main ()
+  ==
+  == Invalid read of size 1
+  ==    at 0x48AC965: xpmNextWord.constprop.0 (data.c:265)
+  ==    by 0x48AD492: xpmParseColors (parse.c:266)
+  ==    by 0x48AF9D8: xpmParseData (parse.c:783)
+  ==    by 0x48B1C18: XpmCreateXpmImageFromBuffer (CrIFrBuf.c:101)
+  ==    by 0x4005A6: main ()
+  ==  Address 0x4c413c0 is 1 bytes after a block of size 15 alloc'd
+  ==    at 0x4841B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x48B2809: XpmReadFileToBuffer (RdFToBuf.c:96)
+  ==    by 0x400554: main ()
+
+The problem actually comes from xpmNextString() and xpmParseColors():
+
+1) xpmNextString() checks for the NULL terminator when looking for the
+   end of the string (Eos) but not when looking for the beginning of the
+   next string (Bos).
+
+2) xpmParseColors() does not check the return value from xpmNextString()
+   and continues even when xpmNextString() raised an invalid XPM file.
+
+To avoid the issue, fix xpmNextString() to check for the NULL string
+terminator when looking for the beginning of the next string and fix
+xpmParseColors() to stop when xpmNextString() reported an invalid XPM
+error.
+
+CVE-2026-4367
+
+This vulnerability was discovered by:
+Naoki Wakamatsu
+
+v2: Fix the XPM 1 code path the same.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxpm/-/merge_requests/31>
+
+CVE: CVE-2026-4367
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libxpm/-/commit/5448e1bd7252780b16db869c2253d24e0fe0ae18]
+Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
+
+---
+
+ src/data.c  |  3 +++
+ src/parse.c | 19 ++++++++++++++-----
+ 2 files changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/src/data.c b/src/data.c
+index 6e87455..a2b4acc 100644
+--- a/src/data.c
++++ b/src/data.c
+@@ -210,6 +210,9 @@ xpmNextString(xpmData *data)
+ 	    while ((c = *data->cptr++) && c != data->Bos && c != '\0')
+ 		if (data->Bcmt && c == data->Bcmt[0])
+ 		    ParseComment(data);
++
++	    if (c == '\0')
++		return XpmFileInvalid;
+ 	} else if (data->Bcmt) {	/* XPM2 natural */
+ 	    while (((c = *data->cptr++) == data->Bcmt[0]) && c != '\0')
+ 		ParseComment(data);
+diff --git a/src/parse.c b/src/parse.c
+index cd923f9..268954d 100644
+--- a/src/parse.c
++++ b/src/parse.c
+@@ -216,7 +216,9 @@ xpmParseColors(
+ 
+     if (!data->format) {		/* XPM 2 or 3 */
+ 	for (a = 0, color = colorTable; a < ncolors; a++, color++) {
+-	    xpmNextString(data);	/* skip the line */
++	    ErrorStatus = xpmNextString(data);         /* skip the line */
++	    if (ErrorStatus != XpmSuccess)
++		goto error;
+ 
+ 	    /*
+ 	     * read pixel value
+@@ -314,7 +316,9 @@ xpmParseColors(
+ 	/* get to the beginning of the first string */
+ 	data->Bos = '"';
+ 	data->Eos = '\0';
+-	xpmNextString(data);
++	ErrorStatus = xpmNextString(data);
++	if (ErrorStatus != XpmSuccess)
++	    goto error;
+ 	data->Eos = '"';
+ 	for (a = 0, color = colorTable; a < ncolors; a++, color++) {
+ 
+@@ -354,7 +358,9 @@ xpmParseColors(
+ 	    /*
+ 	     * read color values
+ 	     */
+-	    xpmNextString(data);	/* get to the next string */
++	    ErrorStatus = xpmNextString(data);	/* get to the next string */
++	    if (ErrorStatus != XpmSuccess)
++		goto error;
+ 	    *curbuf = '\0';		/* init curbuf */
+ 	    while ((l = xpmNextWord(data, buf, BUFSIZ))) {
+ 		if (*curbuf != '\0') {
+@@ -378,8 +384,11 @@ xpmParseColors(
+ 	    memcpy(s, curbuf, len);
+ 	    color->c_color = s;
+ 	    *curbuf = '\0';		/* reset curbuf */
+-	    if (a < ncolors - 1)	/* can we trust ncolors -> leave data's bounds */
+-		xpmNextString(data);	/* get to the next string */
++	    if (a < ncolors - 1) {	/* can we trust ncolors -> leave data's bounds */
++		ErrorStatus = xpmNextString(data);	/* get to the next string */
++		if (ErrorStatus != XpmSuccess)
++		    goto error;
++	    }
+ 	}
+     }
+     *colorTablePtr = colorTable;
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
index 8e15ecc0d4..9d1dd47742 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
@@ -22,6 +22,7 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
+SRC_URI += " file://0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch"
 SRC_URI[sha256sum] = "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43"
 
 BBCLASSEXTEND = "native"

