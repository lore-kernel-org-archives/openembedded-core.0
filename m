Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13F7C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 10:09:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15266.1750154956404718191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 03:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8263d137de=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6o294031179
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 03:09:16 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3tsu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 03:09:15 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55HA8jga004673
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 03:09:15 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3tsu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 03:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsVn3Q6rwUoODqXrs6ASszhvksADthbNTYNKftVJ90IGeFWoUJrOi/wWzF33pXPe9IYbsgE2Qdf/WrP8ODICoCFU1Q988dfeSkoKOJQwf6ESs41IBHXQBhrFeqSSE5RHE1XXnYeK9USycD7PNWrGlmWSmyIPQdhAceU77xCs5HaiE/5ljdDEKhAeSBDUN+dnLqlYCmvYyuMAuCJVmbXKm/1sRqfrjz5w/aN2mSRCmuU0xKL9+iIdUJCQYBkrrrg54cWVn5Gwp4MmR2gYmJY6i43wLL38m4ZpxnwP9YkLoYjC7y4zKe56jFev7I/XZUHeVh85XiiOyikduIeG8xUwJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Q7SDtfcktd3z6GMSIhVHoDAudme2bzzxcRVXfAP1Uo=;
 b=XgWSSiqhlukQ1j/ZubsZXmQYRvSExY0shwwQLW4xFBfutWTYDAG7jwD5jpWT4wInf+naLCQu02k3QEF77q+fP8sbQZB7T04SButNi+1okPwTIxLhNhkCZkywWYUZlZmgy+y+Y+afVcyDQ3yOXU4RD36PXfevjJlYy8vYNWg7KvIsfS5zL7Ibv6DDiTMHP+fKhGlYV+Gw1YiEZsaUioLdC6jvh2No1MKeUswk1uguxdS4S1zRglrHSKGTROIqR1pp/HPbn+h1XUxYFHBZHmrWNeiXT/hUqSBmzLFR2EZ6XrFoHclVcbRBuMaNOpyLhpvBbjFPhHcFVR9rhrzcGEjwFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ0PR11MB4880.namprd11.prod.outlook.com (2603:10b6:a03:2af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 10:09:12 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 10:09:11 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        skandigraun@gmail.com, steve@sakoman.com
Subject: [kirkstone][PATCH V3 0/8] glibc: Fix lost wakeup in pthread_cond_wait (PR25847)
Date: Tue, 17 Jun 2025 03:08:47 -0700
Message-ID: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ0PR11MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a768ef0-0f36-42ca-7aa6-08ddad8701ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LP9AWrwc4oqVWrjHuD7HHBBl8PlRsaw8JNmC+kRPjR24SoWeoLMFdXZyD32+?=
 =?us-ascii?Q?D/HbR24LXTAhkXDcUzR+Whwv7ZIEniq10IrAbwqheXKZ2ZEwBeb7n7aQgcOt?=
 =?us-ascii?Q?AFAzs5NmeUQTfUan1HI2D8aT/RssPo3f0QqR1FG75f4zumJem6ZyhWVGAHhC?=
 =?us-ascii?Q?5+nWynPNKvQZfj9o9CSyuWMhWGKYLb71KxCniEcaMUoGNQNj7uMhATnooqgS?=
 =?us-ascii?Q?Eq/5cEKMpFgxmM48xpoYpHcV0fjKKzMnIBB3yOLjl72eqC2yvJzFhUEqIip+?=
 =?us-ascii?Q?bNKcu1bbz9LC0ZBLQQNYUUdSpPQYHZngoSPuxsq1T+6U+iTIU5lhrcgPwZ5/?=
 =?us-ascii?Q?B6hs6Wzxwdr1gMpDxCWlhxW+H41Gn2Jg4tMKRwf4XsCnyjfHdTAPyXi851pN?=
 =?us-ascii?Q?q9skSgureojF9g4Whq1rhX0sdSPT2qPFYzt8xGf1Cimvtd93QLrGNKEoKUOA?=
 =?us-ascii?Q?8kG1liV7lUgGNzYP6/NSrD+QViRLZTI3BtZO86biqh38G4H5PSTWcWPTujm7?=
 =?us-ascii?Q?7V1jgvMn91l03WCSOCR3eB9PBIVM+RJuGB58QZ7Fdv9riX9VPr7KtNJ5deUj?=
 =?us-ascii?Q?E5ud05ybqRAjtKOnR99hTe/HLwJMvSmWQOE6gxZnjDf0L1paUKX3wDmgmx9S?=
 =?us-ascii?Q?PDqc4HD9wIzSvDfejpD6vA6iaA7v1UQ+SMD8D4MXqf4NJGltMZpsUrvo78qp?=
 =?us-ascii?Q?Xy8LFuhiv8wpBKaSJNYvy0xg0ics8j0sUsDbcruBknuDc6tVRxcGqPjIsc28?=
 =?us-ascii?Q?O2K9MEV3iNZnv2gq8uiJFxvytDc4Su3LQTYS2hv/UJ1KgMzz1mJOjyh73ypY?=
 =?us-ascii?Q?JdmIQZds29+C9riddp9pZc7KUHYAZVG9FiCtogdme7GoTzOiWcA7m328Hio+?=
 =?us-ascii?Q?xYAY5iZeHYZbnhHXwo6EoP3U4f5Y6SThA8VdyoSyTHeo8RlwbspO71qfoiti?=
 =?us-ascii?Q?sS2jggAbLrtn5zeBHeEpFA2FrFHV3bFruQPFKj/x2XOrIWH2k02UCO4NRz7e?=
 =?us-ascii?Q?Z3RJx3UKk6u4ddAsgRZ4llSGH9OH68vWLrx1sH97F8J8qNjL5GusRufuiaqx?=
 =?us-ascii?Q?zaMkRlDg8EgmBHxQCdSLllgjJUo8IYFCI6mlKeE5c2PIz3RetCldFJW8UttS?=
 =?us-ascii?Q?BNvCSLapmUArKkYSEJjmuW/aLWOEVrqDbtEoNdQwzgxQMVbieraNvyVlQ/DS?=
 =?us-ascii?Q?tseR1NEFaoN4phw1DqdmCqg4h/Zv0tUhUCTVV/ZNidRA+t3fhqQdf++FEy7W?=
 =?us-ascii?Q?8gnXIDs9aHmlilcCw/APTE6MEk6QpQRkWD6SuUk9duURc5MrjF+Rrm0rYvj2?=
 =?us-ascii?Q?PVdjEBOH9CdgWsgvZWVrqUqKespmYr/KwaS+v1AK/X73zoq5nvrD8Gs0zJWx?=
 =?us-ascii?Q?afaf05S6XxV9Yq3tmGzrELhaRcjXUHAHY7JEDC31O+foqF6yO6lgOXngyU/H?=
 =?us-ascii?Q?4UnrmJv7RLW2+oRrw1PilXi4Be91iF4w?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IFIPCf2fyH6mvMWqkCegGFvXKSeUpAk1EUyJf36uu5Y2NG+gB9EEL/3Rjh6e?=
 =?us-ascii?Q?QlsA9P0JFlBX3CKPFMd3EAHnW3lkdgQ12NYhkiX/a5nf9ehP/0hWlK9XvK/y?=
 =?us-ascii?Q?radq5jRJ8e3E3vYI1PxdLJKfYNj75+L1H2c827BRXIpzSPPIxKAdZDX7Uzcn?=
 =?us-ascii?Q?HJTJPZ6tRIoWYpueZLThSXdWSMWGDbB43zsk51hNBc4HPkHXsgnML5kGeYq/?=
 =?us-ascii?Q?ClfZ7FcIfaVJvz4inR3RaI9fE6V8qCHEvFylHvbV5tLFdr0E2bdOOnLEgapw?=
 =?us-ascii?Q?uuei/E8IrmQyROhiswyU84qFNkFTpTiyepHf4W316t2moUQ3wr05qT+hBFJU?=
 =?us-ascii?Q?gQy6jH+ONeIspoEojQ754a1+aesZLV3hlJtdvVszfVz4Iu2H2Yb3teLMbwFn?=
 =?us-ascii?Q?HA7D2ICpOPWDX/+6s2O0tyuHOIWaZtHWaRT257wERafx8mz4Znz/AEmwyuWu?=
 =?us-ascii?Q?ptdD6rZbkhtCD14Mw1oaThb9xrzrNroLMi3UCH9swEUPmPxU/KEylFmFakRx?=
 =?us-ascii?Q?129mOPEIrghyOlgP/ZpPGWQU0l7z6Zg9EcGcu9/b83MUzwy1Cpcv1PnaJddk?=
 =?us-ascii?Q?ISLVIqY4KCc80k03fjNNDfmKj9kLgh1drFWmAL0XojkM+cEPKQshC1jktLQm?=
 =?us-ascii?Q?uA+mTnKQzI6b8YjpLx3lGsZsvPKd1M4eQyqHcOE/8xACcFfAKZphll9Thc/a?=
 =?us-ascii?Q?k3ia0wXUgYiWtl7Us+Uqlwur9AIa9m243feJkVq8uTOxxH8qhjr8YAYl/04x?=
 =?us-ascii?Q?MxmLOAgBqhsXOQHRtaVB1w1OmEwZeYO6Pt9Hvi1S0FWJJWs5S0aWB0tJ8LvX?=
 =?us-ascii?Q?ni0sPmN/1gYkZu2yDQYNvEiHip7L78tOZ9KzTN9B1i0+tXHafMEFgTZxpEDQ?=
 =?us-ascii?Q?dBYIFyYw4giD7ACzAC+etjQF1pFmkODFTQLaWxLilRcWsy/grFT+x1+o27Z6?=
 =?us-ascii?Q?7k9UFVD96TKsg37iSSsy+vsONyouWk7EBeF55CVGhIHdrqVOuTN4y7e03M9v?=
 =?us-ascii?Q?gSgkvJA8xRuufLWMmAREbxhWniMc329VM/0ATd/KqmiztAYyNX25slz4ctBT?=
 =?us-ascii?Q?LRvxhVrxJNt9gHJkIOT++QT+tbkzRX3/Rs/6g3Y7Hd1Bz41ox6wpaMMMNoXx?=
 =?us-ascii?Q?IgLcXC6ene71X7KO+iGZ/Tp/K7r4cTiz3GvN35r+U5C+MwwuaHXUAudV/D/Y?=
 =?us-ascii?Q?wKQEpWjM8OLP8Sp6PHGYBBKYseCy7olIS/3MQcJoZMMzIwMa9Hq/ZrPdGTH3?=
 =?us-ascii?Q?t7VK8AV0CfCG1yEYuhQrtiDIEgnF7byprEKDd/Pdy1EnwpV662Tl8Gk2gcea?=
 =?us-ascii?Q?fGWJc9eW7ZE7wcWxXHSgEfi0j0L6Ql53OBnjdn66qUBeL/2Bxw1vdKNx+Qqc?=
 =?us-ascii?Q?YQRRVmRRY8I5Nf9EBlX/bVHF7UpO/mrh1TVm/3oKQXAg0y3gIuM5ZvgLMtZF?=
 =?us-ascii?Q?TuX/NwtFVsPbe2lyHgXJzDbUYuKfILY0tx6zZjXjNquJMydUA+SFg+kjiMRe?=
 =?us-ascii?Q?8Dbni3NKAt2Xn4yheLLNs+PNPge69cG938ngiU9f0C4J0j/ykgYiBB8iuK8P?=
 =?us-ascii?Q?BO5MkccBB93fZAxLqjuCKedtCHYhXzjmJJ9xhKUt9syMqYdAiKLxS0nj2VSY?=
 =?us-ascii?Q?TyyYbfBIDm1MoXeRzdjLOuc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a768ef0-0f36-42ca-7aa6-08ddad8701ab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:09:11.8062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szjo84n82ZU4GK+k1vJY4W/hCfJixTfcbbnnU5Yo/Bx19ONxJ41BVISfDGKhMsZtjbKS8NW+4DIW6UNWZ3cbdW3D/4f4BJ+EBFen+MfCyDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4880
X-Proofpoint-ORIG-GUID: j-LNvqO32QuYKX-ntKh2asjc_LhkizOp
X-Authority-Analysis: v=2.4 cv=b9Gy4sGx c=1 sm=1 tr=0 ts=68513ecb cx=c_pps a=3ezGG+GkFOPSbF321pmECA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=1jwiQazYJRaXmt-w61sA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4uoRV6Kh05cZCDXHYCUxV2b9bKX2-rok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4MiBTYWx0ZWRfX5/9/Mt6VFw5d NSvVlX/mHn1vReOac6BpvzOt6X/iZ02atluBLg7cMQxubjFNqBlfIlSQZO+f7QT/t1kRvJUNM9w wpv80p/646VzNAflqI2Td1QOCpkj61PMTSQVgtbV/vzcJy/T9CfDjchnhzgfp4FUsBGj2nsWKAb
 d+vvdichQHSyT0MpU3F8ZsiXzfIz6ikVTljUSRDXrynvp5qO5RjhSyo0MvOLnxUUh90JvLnTpn4 55en7MQUixfm7k/LEvZFuXwNhRHoXaBiJpZzB1lSs5P0XgcwgcCUFujy2b8AEX6Y2my0HmXPv5K 2IJoZut7Xm4ggiFFi4JbQ1o97GO+cNkzTSU9bF7z59Aem1i6r1XtjZ5vSqrWejQJnBBd8cFJCri
 mSmxEWokDNEJVnWPAl5GA+Xrxt9wWkba6ehg450FAP+JqSGC3Itqk0KaSteU70mrd1ZBNfcy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506170082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218869

From: Sunil Dora <sunilkumar.dora@windriver.com>

V3 Changes:
  - Split the previous single large patch into 9 individual patches, 
    each corresponding to an upstream commit, for easier review as requested.
  - Added the recipe name (glibc) at the beginning of each commit message for clarity.
  - In the Upstream-Status field, replaced the upstream commit ID with a direct link to the
    corresponding commit on the Sourceware repository for better traceability.

PR: https://sourceware.org/bugzilla/show_bug.cgi?id=25847

A race condition in pthread_cond_wait that could cause lost wake-ups
under high thread contention. The issue particularly affects
applications with many threads waiting on condition variables.

[Root Cause Analysis]
 The lost wakeup occurs when all of these happen simultaneously:
 1. A waiter thread gets preempted between signal decrement and group check
 2. Multiple group rotations occur during preemption
 3. Signal accounting becomes corrupted
 4. Final signals are delivered to empty groups

[Impact]
 Applications using pthread condition variables could experience hangs due to lost wake-ups.
 This particularly affects high-contention scenarios with many threads.

[Fix Details]
 The fix prevents signal stealing by:
     Broadening scope of g_refs to cover entire wait operation
     Removing the complex signal stealing handling code
     Properly maintaining signal accounting invariants

Upstream Status: Fixed in glibc 2.41 and master:
 [https://sourceware.org/bugzilla/show_bug.cgi?id=25847#c72]

According to https://sourceware.org/bugzilla/show_bug.cgi?id=25847#c74, 
commit c36fc50781995e6758cae2b6927839d0157f213c is unsuitable for backporting to older branches 
and has therefore been excluded.

[Testing]
 Verified on x86_64 with:
 - Custom reproduction test case
 - Stress testing with high thread counts

Reproduction Steps:
 1. Build glibc(2.35) with injected delay (usleep(10)) in __pthread_cond_wait_common
     Just before : uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
     File: { nptl/pthread_cond_wait.c }
     (Note: The injected delay is for testing purposes only to reliably reproduce the race condition)
 2. Compile test program with custom glibc:
     [https://sourceware.org/bugzilla/attachment.cgi?id=14360]
     gcc -g -o pthread_cond_bug pthread_cond_bug.c \
     -Wl,-dynamic-linker=<CUSTOM_GLIBC>/lib/ld-linux-x86-64.so.2 \
     -Wl,-rpath=<CUSTOM_GLIBC>/lib -L<CUSTOM_GLIBC>/lib \
     -I<CUSTOM_GLIBC>/include -lpthread
 3. Run with CPU pinning: taskset -c 0 ./pthread_cond_bug

[Behavior]
 Without the fix:
 - Process hangs for 300 seconds
 - Eventually crashes with core dump
 - Verifiable via gdb

With the fix:
 - Process runs smoothly even with forced delay.
  

Sunil Dora (8):
  glibc: pthreads NPTL lost wakeup fix 2
  glibc: nptl Update comments and indentation for new condvar
    implementation
  glibc: nptl Remove unnecessary catch-all-wake in condvar group switch
  glibc: nptl Remove unnecessary quadruple check in pthread_cond_wait
  glibc: nptl Use a single loop in pthread_cond_wait instaed of a nested
    loop
  glibc: nptl Fix indentation
  glibc: nptl rename __condvar_quiesce_and_switch_g1
  glibc: nptl Use all of g1_start and g_signals

 .../glibc/glibc/0026-PR25847-1.patch          | 455 ++++++++++++++++++
 .../glibc/glibc/0026-PR25847-2.patch          | 144 ++++++
 .../glibc/glibc/0026-PR25847-3.patch          |  77 +++
 .../glibc/glibc/0026-PR25847-4.patch          | 117 +++++
 .../glibc/glibc/0026-PR25847-5.patch          | 105 ++++
 .../glibc/glibc/0026-PR25847-6.patch          | 169 +++++++
 .../glibc/glibc/0026-PR25847-7.patch          | 160 ++++++
 .../glibc/glibc/0026-PR25847-8.patch          | 192 ++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   8 +
 9 files changed, 1427 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-8.patch

-- 
2.49.0


