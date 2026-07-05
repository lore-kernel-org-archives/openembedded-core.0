Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380ECC43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 15:20:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.132980.1783264839851049804
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 08:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rZ4vCLhZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=164680be50=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665F6ADW1008833
	for <openembedded-core@lists.openembedded.org>; Sun, 5 Jul 2026 08:20:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=+EoFCL3I6
	YUjzldetK44iIQKqSwoyaV7eTJ7KH2W2aY=; b=rZ4vCLhZy1eg+YzEd5sWM1c6d
	+dOExmExVTzQlfmokRKvb7HlcCoxb+KliZ1OsDtpth+P4hNpqJBbzsu6Wvg0c6np
	bE33U95Hkdle3lPjdp5Wsda5EVGTh1T4bTD9fLUC3TYBfUHGEQ7omaynE7PO1YZN
	ePQiQ0kt4kdzDWsBogV2lDrzfSL0tEqpHYnjrY8UtNfmOO1xfheqx34SaSSPwK97
	udUhSrYyRQGWIE3lSxX1AZuCFQdc6bsavj+Hkzs/fM91P4kKKZjq1caH6A8X/i4V
	nLshPp+WAljzIkWYezSkhaBX+Px/udPROezAxTF+qpEsEJciMhxSZ1gsLcomw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6wf18x0u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 08:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7fl4kKnaJzuHi21TwuaMlOaXM2u4SOslI2+GCHBSRH/r2TKhY1rFEWFtC2SnIcuvvyacFri19RJg9SQmr//L5H6vPUx4NctTy1H8UEYW64dJdOEnkedCfj1J2jye+nfmq9rOinAyXYQHSnUMCvtWgjf4/WJJ1RVdp+SE+3LsznO2YspJl8Z5sgCfOAUz+sbEg0ai8nz+LN6LH5PeIWlm9NiJRXo9XJep07VRKIQqc1f/P0RoCHlJyjzcJqRLuu5kl4c3v9XYQ+Z9oVm7mxf2VJKYyzoQBo+TFqOz1fW2ukL3vdX5zzjEibcgnwDv6tS8GPOK8l8F1kFhcZ1XO9DpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EoFCL3I6YUjzldetK44iIQKqSwoyaV7eTJ7KH2W2aY=;
 b=x6LiUvVADusocuebFk0dcrK3JktK7m92dcmHoifvw+aVAojtiarnA/ziQ800y9gdwEQiOp0y6Gg7OSVul3FIury9o36hn0vVyLdVh6K2kAsOXxObHbf+pSfU5M3tJPHMkhq4pBM+qFRnL59wMTi8KgsqXaWKopOckT84BuITgi3mx0vXL8LnVCCuydxox04fUiATLU/6ZL1RSKnw+lIU3whiMgw1gkK1UXp9tnC7nxg0bjLkz6FmvFBqoGwpc7C/2suLG8XPLNUMsW879g8zmg+P3rj3SrndrHMbIHlHvbxM0Tf8923fJcSSrXbFcC4eRbhhX0pbHF6G7KSXG1KbYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Sun, 5 Jul 2026
 15:20:36 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%6]) with mapi id 15.21.0181.008; Sun, 5 Jul 2026
 15:20:36 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [PATCH] rust: Upgrade 1.96.0 -> 1.96.1
Date: Sun,  5 Jul 2026 08:20:12 -0700
Message-ID: <20260705152012.3160479-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:217::17) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: d1187064-56e2-4ba1-dbdd-08dedaa8f6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|52116014|1800799024|366016|18002099003|56012099006|11063799006|6133799003|38350700014|12006099003;
X-Microsoft-Antispam-Message-Info: 
	u9TfeFTNuGSkHGYz/+OO71xUunUQBfYC5upIagW/XKkJ8KoSJjZm4hlxsoAh9aOlanxuXS9R4us/iqpZfWlGmnJ7W/y3Fh9phBWgwECzK6nbvKqxB8KkH/fAOS0cnrAGAivoE3xImw2vDnOZzrsOAwinAUVlSgyQC0Mn4sSZsphCFy7uzpNBy7HNvYqjtfJ86RNW6vTSo4OwOavnQoCCIkHsciPoIIUeCqgoWtIi+BBQDkxrEw+h1G5uTCbwR5fmlHJ2Wpt2ReebZsCBULH0rU//FJeE4tIKRm0a2q/hrujlM++r2uEaeVSR5I0k8vaKkgTY4vVhwVUuRXFGlQMaTAiTfUGhjwyGlS7Y4EQ7wK4SAFzAgNF7DDJ6XUk6UzFL6bb7hU5rszucgJ0jF4UdOO14ijkfwxZjFmqRsFsn6zK3GjGJu4vJvjeK7st0ycnUPp3wRex7yutByjqR1s38pCdCzQJWF+hH3lDURRECI9OW/CG8rHmKHeFkjBIaiQjxiGiwMPOSprqf0b9IPzO90mPZQy3ot4+RZbdAQXu3eXYm0farmm2yt63Nl22WUSsnIPAJHQa9zeAQHwT+86RFYkQOJDE1qG7nLSfJZhSmlMdRWeqLboz0K+AJhgyVxEBpcbWT80r1eTsyLJS8u744D8gKdftvSJVtaHax5UU2EMA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(1800799024)(366016)(18002099003)(56012099006)(11063799006)(6133799003)(38350700014)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?me6kAJc0UXLhakkBNUHgw6djithF0eDvPLZldH4Uum9MTvwRzOQctJ0Rf4/h?=
 =?us-ascii?Q?kkx3CK4BhUAGO65vT44f4GjpNjYYICQcL2uTcjI1f9jkdFkzgFZV96y26oXC?=
 =?us-ascii?Q?Fuw2AeNWqwiEseraEkbOnGAA038VjQnxjp+4fG6JDWjO1ltkuve5j3oK2n9i?=
 =?us-ascii?Q?XB7OUxLudpXzliR5ogu2Qs3nkzVedzRyeD0I4X5jD4jXq0QVbqtN5H3Ky9u2?=
 =?us-ascii?Q?CccOq1ylT00kD7e0MJ/pN/uTSTaNkxyFYt+N8FhcCQ9EcWQ38vLIc0bPD3b8?=
 =?us-ascii?Q?ezhbSlJ8RxRh76lIwBsVjoNSUxKFMBtAaz5FXVlGSUpFi+Du/KPeNMDyim2K?=
 =?us-ascii?Q?Yer9sdaWnXfa5MsaVitTc6e49mfpGodIXdS20Qkb0pqDKLLbNs+qfwhmBOrJ?=
 =?us-ascii?Q?pbylEbBMOACKoM/jZgsy/wUuaGpRxk70moqYyKHtRyr7s2CT+uasNBhh4Srs?=
 =?us-ascii?Q?NO556/1s6twqOqVJCkCWlGFSXoIUn7XvxJB+AkbXAyTBfubU/2JAhduLOZMv?=
 =?us-ascii?Q?odCDwzZES0xSKDjcWhP2BeLdNsWE1rEVTy0B2SFglKtGZW9Fenu6XRK+MimZ?=
 =?us-ascii?Q?HyCqEwpwWMBl3HKaJmVja0LveB7PiowhFzKfKbXyIFV3jsfNiDaHWQFVjlss?=
 =?us-ascii?Q?rfGO2oGZjji0h/owCYpBCQ5kt7bdTifluxioMNuHmKqPjBDXgLvdqTe4ctbv?=
 =?us-ascii?Q?4HK01OV5Qe5FjXYkpSRGbZm9utDEr1NljlVUNCHki3y8Yj8Ya8h4hgcF9FMH?=
 =?us-ascii?Q?nLVatY81rTOan+vBaC8igZivmPYQqceJNl1ETDz4M4GphA3wI5WbOKhTjhfc?=
 =?us-ascii?Q?zOzhZYtE0ooZxN7O5L8gu9wFoyuoT5k6Bs3dl/CwE7hJBZFnVV4PHSbRCQO4?=
 =?us-ascii?Q?Y1r3BP48PoFBxFv6c+MTPpQTYkNKud3ZgRchH/Un6OWYhoJKSHLKWtk5350A?=
 =?us-ascii?Q?WD02nRwzUw3KgbWa+WiFXE9hEsRYxNRWV6QEIQy/+EknB4TLKAivWAgkconw?=
 =?us-ascii?Q?eeIkN0DxLPIQpqajcl6yRtJMjBYqBPs1r2DHaMbnhEFGwyTIq4gfDdgJfDCt?=
 =?us-ascii?Q?b1jSdSMhXYbgVjPdoAOCp4VbZFpcPogv5lU0Rw/dY5XQxgfwfRfcIFRcJ7pF?=
 =?us-ascii?Q?1XApi9d+mBzh2YiYQqOJh6XvEeTMskdV/au6stut+yQ8gtso3nHOoh2M1RIS?=
 =?us-ascii?Q?tdxCsmWYf+4v3P9Bz9sUijgETTrM7XWqagsJugsuWX4yRHwVF+gMPTfLycpv?=
 =?us-ascii?Q?tpVjVfd9kkAAcavPh2qgT09KZB2njNpwmgNAv4pFSfmZo5gr8N+OxDdrwFC9?=
 =?us-ascii?Q?Rs6R81U/uXUPo4ACuQrVcWONoly8Jdu3H5FO6rmuydA/Ih35e45C4XylfvrD?=
 =?us-ascii?Q?6gTkja1Yu0jZAcq/3gFSojUQu70bCUz2VfKJMMGoWOaqbH2deaNRhPxP4oSS?=
 =?us-ascii?Q?dw1jkQYxHZ226gUnpH5zCzcgnmxsEie+vhxZntiKeNEDfjqy7TfM1p+OAhRb?=
 =?us-ascii?Q?PuHMEQ/3FbvnBDLWIfbeDpFYA8cvmxzvYxKyfgnYwsLwr6TGdjZFb9R+x2Sh?=
 =?us-ascii?Q?F/FW3rQjCYMiZNxWbQ6ncVSs1CR2HyY7eJHKjVMGrSjvg65QIOB4HpKKikAj?=
 =?us-ascii?Q?GMdLyC+gAePY5INzHienTduSSWlVe8NVM7Iq83sV97JcSGxCsI98H9dLyXjk?=
 =?us-ascii?Q?Ml6F2Fzauzpcc7lEyz3C5TKGaQyv8CHaMCWfXnApkkMpy4LIsHAPBEwxUjsY?=
 =?us-ascii?Q?uDe8CoX0ZDkcahTOBolW0y6ZHle9q5k=3D?=
X-Exchange-RoutingPolicyChecked: 
	eITKvEq0f0yLM6Ill4QVDPQt5mBWXyRZYO/UVMqptvTo409VCYM5XVdVrV42aHHujvh7argzsCjarvdVJXl80FG+kbuMF4d+u2ut6sEfKW4EK9zfxECvtF5rcfIjPZmh+xyAntivMLIauX3bGvqALAJlRKZRGSSedV95cY86Q0Tt3d3tm8NVm5RYTO4aKcixIt+6sKlS0vaykctusl6SYt3YVA2/+Ynx4P9J9OHeRa57LAOWrJDIlBRDnbWxuMf3KjvznJcJccXK9Ig0OeX4K8OolpK1TqRqTuTxlfM01H4j0bBwRmA+VWG/vIOe/vEpEqiGmfn/ENUR5culY33KGA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1187064-56e2-4ba1-dbdd-08dedaa8f6f0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2026 15:20:36.6748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ys11eu4Dm8nvpBZomN8ie/JEeu86z3p2iAfvdyGBLZuPLx+tjIof3iTV+yiIYbvlly9JB6Vv03Bp7DN56AeMklsBI4PCxV/i5DLEw1+z6EY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE2NCBTYWx0ZWRfXzXv/SrPhNY/L
 qFjRIVAQC45bZuZqRU6FN820dF9+eouioenfbFfGZzVnhNHms9siX2SIeqwrYBqSn6X5B4z+ZA6
 GHCpNWbLBb54HPViovnsNVS3ABCipuhZl2hHBUbDdhoSOLdeCepbn29Hz24uyLSUi3igBKhdV8G
 BtBLNvI7qWOGblR7gvpcgeENV3VUtCGUtvBXI/l8+lPgnxwnkXcRnjUZYgQH3pAcoW13FFzou+8
 CbZ0ZtetMygrIRHuw2CuqnEkLmJni6u6+czFbZqxLs67H1YP6I+E5WNxhWI+RWKrwzREAv1wHB5
 IRxyNlfw/1XQuQcaK9AvthNhiZk5L4biCBiNC0BRnxVr5TeY1HTTy+o4/gGQpVv/0UeBW5Ne25T
 NDcG6WCQQYI6Fv4SpQ4Hw5Xpt2tCg56B3sNznWMIHug/p7GPnnsaWgUfQlBZx+SrV5FdIzaMPwp
 jtsXhj6JbkwKI2sax2A==
X-Proofpoint-ORIG-GUID: gzqwyMkLs9msOUbUhRwiiuz21-MxIo9V
X-Proofpoint-GUID: gzqwyMkLs9msOUbUhRwiiuz21-MxIo9V
X-Authority-Analysis: v=2.4 cv=cuarVV4i c=1 sm=1 tr=0 ts=6a4a7647 cx=c_pps
 a=jDwMdcx0fGNsu9pFyB9b3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=ei4SEBeUAAAA:8
 a=t7CeM3EgAAAA:8 a=FtwLL3T0EHzPDxDRYJAA:9 a=t0EB5k7lhMAKNYPM:21
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE2NCBTYWx0ZWRfX0WT1mVuKGKdS
 XT3PiXrpg8T1YdwxUBvQzHQqjgfEtz5uqLRZ26aErNIMI8q8zWielVS+O839mHl0/smNrcWU+UQ
 x44Sbj3gKnEckvMZvWSLSQH/Q+dgOfsRYhQQuWCkh7VRyzs0yNST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240150

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

https://blog.rust-lang.org/2026/06/30/Rust-1.96.1/

Rust 1.96.1 fixes:
- Missing retries / timeouts in Cargo's HTTP client
- Miscompilation in a MIR optimization
- Cargo CVEs:: CVE-2025-15661, CVE-2026-55199, CVE-2026-55200

Test results:
No changes

Assisted-by: Kiro
Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                     | 2 +-
 meta/recipes-devtools/rust/{cargo_1.96.0.bb => cargo_1.96.1.bb} | 0
 .../rust/{libstd-rs_1.96.0.bb => libstd-rs_1.96.1.bb}           | 0
 ...t-cross-canadian_1.96.0.bb => rust-cross-canadian_1.96.1.bb} | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.96.0.bb => rust_1.96.1.bb}   | 0
 6 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.96.0.bb => cargo_1.96.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.96.0.bb => libstd-rs_1.96.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.96.0.bb => rust-cross-canadian_1.96.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.96.0.bb => rust_1.96.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c0d9f8fafe..d378e301f2 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "16.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.43%"
-RUSTVERSION ?= "1.96.0%"
+RUSTVERSION ?= "1.96.1%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.96.0.bb b/meta/recipes-devtools/rust/cargo_1.96.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.96.0.bb
rename to meta/recipes-devtools/rust/cargo_1.96.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.96.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.96.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.96.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.96.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.96.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.96.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 094baba526..a8d8de7165 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,7 +10,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0003-explicit-tail-calls-disable-two-tests.patch;patchdir=${RUSTSRC} \
             file://0004-explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "b99ce16cdf0ecfc761b585ac84d131b46733465a02f8ecd0ff2de9713c62ee09"
+SRC_URI[rust.sha256sum] = "77a6ff3003a4ad0cb00697b043c879e3e1a15d945b1a1f63818903bfc3fa8b98"
 
 RUSTSRC = "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.96.0.bb b/meta/recipes-devtools/rust/rust_1.96.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.96.0.bb
rename to meta/recipes-devtools/rust/rust_1.96.1.bb
-- 
2.49.0


