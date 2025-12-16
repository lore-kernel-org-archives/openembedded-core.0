Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773ECD5B161
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:01:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17376.1765872101029344059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MMIaYxsA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=444573d0be=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG7XfPP3612823
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 00:01:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=hKzxY1VoF
	Uqq6qdcUWwz5YPEAtcx2KM1+HlkMqLeM8w=; b=MMIaYxsAp1uspESVsUrTkdT/K
	13ya2wFLpggCuVuccazS9vSknqz/pQYHH5xHCoEJ70NsAhpyNW5gJpW+ZlxwufRg
	BxKZle3TpDKLbKapVYnW59jz8rgoCcTdxEmMgDaHf5KvL7tKBo8UsUv+Fb+5Lio/
	X5Q6JlLqOd2QW46BhRHqzOEKtDimCFqCQeEfhHUT4+Q3BQgnAGc6Y9dYH7I/hlnU
	/F5EIxliNqDvUNhv1GPKXUmxhVaaINlZ74V+jcmFAy0bCpDLd9vrew3w3txLePKd
	qNVWG2D9sAaNAJqulZe9ie8EkGW81+vodznkaiBNGMWm9WLe9dOsDP1gI9Rlg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012035.outbound.protection.outlook.com [52.101.48.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b14a5jms4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 00:01:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mil5gLUGQpSL33qlz03VLz1C9i1FD67nnIYrvG6zLzEh8a7hszKECrCIKU2agdY+NJ9YBJDbTDEtuB8k1MHILGlLOs/N7G8kNZ2zjZCk8BK2orIYBc2Fc15SNE45vYsf8vyh4SeclQu5SGLrYPlr7IHwD9368LjIVxToSU/YWVtE5vLfoCTlcpjNI3vLyYfYTWi75bDXHuAP5IGjOqPI9gChLeSTsaQv2Y0waArrhsSpw4Hr4ScirCVsnqMLhoEK+E8ze/P8hytcWhtXXrxPzEjD+G9pvmzihg9Tpqnt4OndjVTWTjTaYJ+ZqncyuJMRd+HvATBmPxPpeZboE1ggqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKzxY1VoFUqq6qdcUWwz5YPEAtcx2KM1+HlkMqLeM8w=;
 b=il1n1ZfXlMVnxJDcraQvCFSRlzAlgZUVRqIu+xqKrKdFPDAdIcw/4I7iYYnXsBMGn2s8fAoC/ruyVcmTuncMcNK2GMMCy5aNv23xYjvOZzwPbc+P3s5adqg6BK7r3V8byyJRDxR80WNTBwRZwSzMPFx6/Bx+igGpwwtOOLG5fpSNNevkZbAwfICLTwN0AX6qz9i+hjNHpKtVwAfIpdDH/l1LnHm+XM/RqH93tmNqMjlTO7rw3c+9pdmZ+Elc31nJT+utQBesW1aUUVW1GyhoxybDFyNJrFw5dFl0nOL+EzhxzJBBmczOuhRVyXMHH4r/F3JAMHX+OA0QxeHmZ34yMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH7PR11MB6608.namprd11.prod.outlook.com (2603:10b6:510:1b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 08:01:37 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 08:01:37 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sunilkumar.Dora@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [whinlatter][PATCH v2] binutils: Fix CVE-2025-11494
Date: Tue, 16 Dec 2025 00:01:14 -0800
Message-ID: <20251216080114.1436744-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH7PR11MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf3aec6-cb15-4fb0-d26f-08de3c79564e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eJiCx3lw/IAStgjvlSay61WwrCgxjUGSpWLO5VGgbM/dZlRr+mKMqPTsD0Hm?=
 =?us-ascii?Q?WbtNgFsfhfYQuB5BHLIlQshK53ig+E7ADlPG+97Gm00YaciUCwCo4kPw87rK?=
 =?us-ascii?Q?/h33oGHcCj1kjp8CPMDyyjASdNhF8XNGSqu/FzgCnYcDCzqHAsjYiw2eqxSr?=
 =?us-ascii?Q?YKmUp7204l1hhsh5W+8Kp71FdC95oYPR1rHYC0WupYEzWQ8eR8+kfC0a67zA?=
 =?us-ascii?Q?ylebLm6up41UbEaw0PdjtKdj8G9qw9ryNuuNaufUJvCaACErERpNiOd16XBW?=
 =?us-ascii?Q?IJLUU803Cp0kJOErUr8xVth68nsNkkP+9JHVM6s5q6epl6uM7srAN769p1H3?=
 =?us-ascii?Q?vgmwVxYso9gmoSKhbUy2Peh3gFvXK2+PyzgG7QaumnfAoDet9iWwW5vdhflw?=
 =?us-ascii?Q?0KiEx0Kdo8+UpDIh1fkUM0sFH8t3RA2gvI3MtT02FtLXmoTspf1l7XEQtmvP?=
 =?us-ascii?Q?2dATwHWUmNzW5CvzwRYb35UrI6QDPuKZfyo08Mlw/p5/uTP4ODiIlZkUcZ7W?=
 =?us-ascii?Q?hdGEgCKNEp+hwf+xpzBQxFOft3tBDFZxxNA+hFN8A7lIl6rXzsdJnU01BJ9C?=
 =?us-ascii?Q?tf+cH2xtyCHzgXe17RHTtIpIC+FfYzlWpqcn7/4iQCUohME2mF8FN//lK5EA?=
 =?us-ascii?Q?RHK8qDOiAFf8Ai52X+NwjKg8o0v30eQheoaBJc7fVVxSA4DmjZgS5pojlsE6?=
 =?us-ascii?Q?Yi9aaENt5el/982XrNRXCLFuOIucCGkqyd/ffDvPYADCvb0aVEEiJELRbmBP?=
 =?us-ascii?Q?juH7C17+3CGFhczX0pibOyzZEKoZfwPn+A+B9tpsy1+p0rfuLQWyDSoLKhBP?=
 =?us-ascii?Q?m9FFhvRZvI5CUQ7Prvg+JT5p/RcVQG69q07ynBiOmnk2L0Use4ehw0DW2ESP?=
 =?us-ascii?Q?VM2h+1C/dpq57knrD0IIAPv48YeEIe+9xBFbWwOfSQCe0w56eG1NtsE3QBEq?=
 =?us-ascii?Q?PYDuXVRclau2KvIC3jZBctl63xTnA/WysDHn7LdRSR66XLZvvYyawj4iL9br?=
 =?us-ascii?Q?XIqRGnZ3gVWOULTtCGFJL6J+fl1t9EaYMmrVnF+bDo44WZkvb+NDOPulJmGr?=
 =?us-ascii?Q?2E8wUhECJiHIEtSFPbnZHMGqfFGVObnZKyMj11hqemz701fkGhH/H4twsZEK?=
 =?us-ascii?Q?szFBHT0H6R1PL6jB845sqY73B5+wO0zeXyFOYTULHw8HwTi7Qc3L74qI11Ol?=
 =?us-ascii?Q?6f8lpJpUlgXTuzxuK64msW8Ju0PVjYk/495feTYRj6i7NpNAybnAkpo8GRti?=
 =?us-ascii?Q?OuETOKD9iS4gszVkdcVRqnsTkQUICvXuNMdOi4pKAWCMpWpfE0BSjB6Ih4fR?=
 =?us-ascii?Q?Hg+1w6eDboLUq1ut3QtlDzxuNhdPlWrQDzHU+o2t0SNgUMQ3SZWlHVPdWQls?=
 =?us-ascii?Q?tC5yXoxeB3pcAkgkuDuB2THiEjpDxjTj8tSnR0xU0RfjzW3dKQf2lTTuBUNX?=
 =?us-ascii?Q?FA2gTzXzCTpA2sZeyEQ6IZ7VQDpxiBWgqUhAfHjNhTvyQPGwuUHY+A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CS0rzyOMvEMlP9Qb77rdu2hwsf6BZiyX8Bo/2oqva7hUWXaQda+xW3pXGonl?=
 =?us-ascii?Q?6XGWsdBOhcNeh6j1rQvGpBtwwKZFcnTWe9SmIw0sUnJor/fjXXRlxvSOm7TB?=
 =?us-ascii?Q?ExWKHJN+cEedqeoSb840PTgUJ1yVuTHFKWmmimv5+7XunKsotP+O58VrPadJ?=
 =?us-ascii?Q?tgJsJZKH3/e3986kE319QnFllyvnOcWXABU/JRdCBvfAt94WkxyWk4f212VX?=
 =?us-ascii?Q?T7NHOTC3U0j/lCPWvEd3RrSlkgHVrtgLTgBZJxB7OTOf3SyrDsK9YULLBpHU?=
 =?us-ascii?Q?rGgHKDv8LnRdWScCk9u/G51KrPuNNnL32Br2ZFeqUDjxS2CZKr3R+kM8M9z5?=
 =?us-ascii?Q?TMDbwDdlDcVtWbFbp/rGNcS5rYToKF/ESPhyGnkzdkT4b83lckWZkdzbPg5s?=
 =?us-ascii?Q?S+3OTFgLfD4lmnBkP+iUOZZCb9jHXNnU+88BGZOoFRgPey58fh8ZfSOssmWC?=
 =?us-ascii?Q?LW/xkhDWuGaT+J+ZpjP93AbxmiRvvwKRwHZSJ3vuJ8yXgDqvcYotaeICN4Pu?=
 =?us-ascii?Q?Fn9gUQtt0/dCRyfhro6OGny1HE23UAWj0JzoOQSYJN8nw6k1tsRnwWLek7Jo?=
 =?us-ascii?Q?AA1sD3ycf1GfE1u9BpM2Rn+jeeK2cONIqmK8VPFAMlR6XAMO+Iavu2AkxQk/?=
 =?us-ascii?Q?LBQqLGvevrodc0aTauiZuakh9a/h1YdnNFIeh6AdbJoXg31QZnhQX1SZivhX?=
 =?us-ascii?Q?OI2eBdKzHmFZVrtqmfLqr2BIXs0wiVtYvIs+QOaKZkGxxrMePb7+kff01mYm?=
 =?us-ascii?Q?nhwyXi8/0d2+vzUQmgtyBkjg2ROxb2XsY/suXcqrifi1U8zz7TlEWuwVkbI5?=
 =?us-ascii?Q?VqHCMcOJ5RZeG85O3EDM1Qyc4BSaxlJjCnHTDGHV5a46IPxUb9BGT/qGR3X4?=
 =?us-ascii?Q?hpn/iYkjLo/j3qIMJQVis3i2Xa7EY3MHxMwPtdtlJjNrVu7b61y3m5anhKFX?=
 =?us-ascii?Q?aUnlR+TaKuceQ5f0N6y6EbodXLKRI/c5+C49eDjEZW0hBdwI8Dm7G0k6sNo9?=
 =?us-ascii?Q?RRFo0+PfS8H7O/xudr0uEBLbglkowSB57tg2qzp4GnK+zlnP4cwU75tu9nZD?=
 =?us-ascii?Q?UlCTpIh5ewuKohYH8QqImPT6afb9XSMU4/q/WwfK/9P0RivJlC+QBIFCN9fy?=
 =?us-ascii?Q?VxkpyoD5HDc2QvYU82PMWyStt/1A8E+7pHh5dHV4ey+FmWQsX5w9aUzVCqD+?=
 =?us-ascii?Q?QHq/tjcs2TaE4RqpiqLlFaX81udgbmjx0SXoR7UORRoKrlTVw5um/qRU+49X?=
 =?us-ascii?Q?Gr7CRHj3NgeQJPEWVn4kSj00s9lmaqXz+CYBNIQEOaHVFxK3scDgNbx1a76Y?=
 =?us-ascii?Q?Kf5QhPtEgCNUmKYfeVW2PxM263ayBWCfPN1+iLSUbTYgjS+0aqT2luPs2QUg?=
 =?us-ascii?Q?KjCTWKm9/5qJNpFZG8ynVZvaJtrAO7HQEZrwOUOLlSZGnXOc+Oce7iRXIGlF?=
 =?us-ascii?Q?ygNLcLrrf7FEVh89KFQTPLLHARGHxkelglOzVhYmtSgqJeTBsY0/+FgeLjXN?=
 =?us-ascii?Q?PfGPfsfmv4OUKzmYry3xtSNjtxbOMdv0oTiuFbyRgyhMNE3ntTmVdrl0BXTp?=
 =?us-ascii?Q?ymsds/o57Z/e2NG1Q+PEyJD+eANbEBlwmdd7Nx+SFTssjBoRrC2kPt0s9RfP?=
 =?us-ascii?Q?RVb4Atjj6TU+b2WX+P9XZd0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf3aec6-cb15-4fb0-d26f-08de3c79564e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 08:01:37.1523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOZT1jf5CEYm9hox18tktIkdP+0oegWDtMme1UBKzL2/uG2n+oT3E3O+UU9PyJNCi+o0SS9eZ76pZy8r5uhT4P7VPVqUOkZtQMMhuR8xuALUlx4LWJKWLNO0ckNDoivs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6608
X-Proofpoint-ORIG-GUID: ltG2jM3RTqyG_34t9jpZan7K55Rc1D57
X-Authority-Analysis: v=2.4 cv=bs5BxUai c=1 sm=1 tr=0 ts=694111e4 cx=c_pps
 a=SJ7/6Usf5opWGcqe47ja0w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=d8HPVgtQaXFDFom2_1MA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA2NiBTYWx0ZWRfX5sMorviInm6s
 psSBE+G2/OvDbXfVpcUljxBfgKj+Y/tvqdH0y3/l9piQhqu8OM+Gu66GjfQxH2B10+06AZoRyDQ
 gQL0D4cnpe4pvasLKd/W3HVI+Q4oro+MvrxKHSaOMQXi2GAi7c2LPUYda1xxvRCm/OFw4fNU6ir
 LXt7NMqCqS6Iqj4VnF/tJ6KeJOkQB1Q76kT1DapBC5KTKPshoPBu3zNuwrlcDYurDIvBsKGfD3y
 LCZgPFsVNX4/Y2ww73tFDY2GlfgL9Ej+cK+z6OMe8qd0VqGF+N+gZ4bKXbIHpGNee/0ALEKyLK2
 01pLs+zmWqPghRTNRDfPpAvDSAhj5BmFzUTBGSFLbJK7ONm+WXZhYAMBawRoMarHoKJ/mJ4EfWJ
 8PoTiSrMh5bjwCgGNd4IiRNqF2bnbQ==
X-Proofpoint-GUID: ltG2jM3RTqyG_34t9jpZan7K55Rc1D57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227761

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
.eh_frame section is non-empty.

Backport a patch from upstream to fix CVE-2025-11494
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/0018-CVE-2025-11494.patch        | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 288475ac39..58964a6cfb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -43,4 +43,5 @@ SRC_URI = "\
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
      file://CVE-2025-11495.patch \
+     file://0018-CVE-2025-11494.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch
new file mode 100644
index 0000000000..dc4b413658
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch
@@ -0,0 +1,43 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 30 Sep 2025 08:13:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]
+CVE: CVE-2025-11494
+
+Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
+_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
+.eh_frame section is non-empty.
+
+	PR ld/33499
+	* elfxx-x86.c (_bfd_x86_elf_late_size_sections): Keep
+	_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the
+	output .eh_frame section is non-empty.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index c054f7cd..ddc15945 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2447,6 +2447,8 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 
+   if (htab->elf.sgotplt)
+     {
++      asection *eh_frame;
++
+       /* Don't allocate .got.plt section if there are no GOT nor PLT
+ 	 entries and there is no reference to _GLOBAL_OFFSET_TABLE_.  */
+       if ((htab->elf.hgot == NULL
+@@ -2459,7 +2461,11 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 	  && (htab->elf.iplt == NULL
+ 	      || htab->elf.iplt->size == 0)
+ 	  && (htab->elf.igotplt == NULL
+-	      || htab->elf.igotplt->size == 0))
++             || htab->elf.igotplt->size == 0)
++         && (!htab->elf.dynamic_sections_created
++             || (eh_frame = bfd_get_section_by_name (output_bfd,
++                                                     ".eh_frame")) == NULL
++             || eh_frame->rawsize == 0))
+ 	{
+ 	  htab->elf.sgotplt->size = 0;
+ 	  /* Solaris requires to keep _GLOBAL_OFFSET_TABLE_ even if it
-- 
2.49.0


